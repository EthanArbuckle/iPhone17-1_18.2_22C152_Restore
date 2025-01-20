@interface ICQInternetPrivacyViewModel
- (BOOL)isEnabled;
- (BOOL)isPaused;
- (BOOL)serviceIsLimited;
- (ICQInternetPrivacyViewModel)init;
- (NSArray)bannerModels;
- (NSData)imageData;
- (NSNumber)issueOrSuggestionCount;
- (NSString)IPAddressLocationDisabledMessage;
- (NSString)IPAddressLocationDisabledTitle;
- (NSString)IPAddressLocationEnabledMessage;
- (NSString)IPAddressLocationEnabledTitle;
- (NSString)IPAddressLocationMacTitle;
- (NSString)IPAddressLocationSettingsTitle;
- (NSString)IPAddressLocationTitle;
- (NSString)bannerMessageOnMac;
- (NSString)cellularName;
- (NSString)doneButtonTitle;
- (NSString)explanationButtonTitle;
- (NSString)explanationMessage;
- (NSString)explanationPrefPaneMessage;
- (NSString)explanationTitle;
- (NSString)incompatibleSitesMessage;
- (NSString)internetPrivacyLearnMoreMessage;
- (NSString)learnMoreButtonTitle;
- (NSString)learnMoreLinkTitle;
- (NSString)learnMoreTitle;
- (NSString)navTitle;
- (NSString)notSupportedTitle;
- (NSString)offTitle;
- (NSString)onTitle;
- (NSString)porcupineOffTitle;
- (NSString)porcupineOnTitle;
- (NSString)porcupinePausedTitle;
- (NSString)porcupineUnavailableTitle;
- (NSString)privateRelayPausedMessage;
- (NSString)privateRelayPausedTitle;
- (NSString)privateRelayStatusText;
- (NSString)proxyAccountTypeDescription;
- (NSString)proxyUserTierDescription;
- (NSString)statusDescription;
- (NSString)statusStringForPrefPane;
- (NSString)switchOffAlertLearnMore;
- (NSString)switchOffAlertMessage;
- (NSString)switchOffAlertPause;
- (NSString)switchOffAlertPrefPaneTitle;
- (NSString)switchOffAlertTitle;
- (NSString)switchOffAlertTurnOff;
- (NSString)switchTitle;
- (NSString)turnOffButtonTitle;
- (NSString)turnOnDNSAlertMessage;
- (NSString)turnOnDNSAlertTitle;
- (NSString)turnOnPorcupineButtonTitle;
- (NSString)turnOnSafariAlertMessage;
- (NSString)turnOnSafariAlertTitle;
- (NSString)unavailableTitle;
- (NSString)unsupportedCellularSwitchOffAlertMessage;
- (NSString)unsupportedSwitchOffAlertTitle;
- (NSString)unsupportedSwitchOffCancel;
- (NSString)unsupportedSwitchOffCompletely;
- (NSString)unsupportedSwitchOffNetworkOnly;
- (NSString)unsupportedSwitchOffProviderOnly;
- (NSString)unsupportedTurnOffAlertOk;
- (NSString)unsupportedTurnOffAlertTitle;
- (NSString)unsupportedTurnOffCellularAlertMessage;
- (NSString)unsupportedTurnOffWifiAlertMessage;
- (NSString)unsupportedWifiSwitchOffAlertMessage;
- (NSString)upgradeTitle;
- (NSString)waitingTitle;
- (NSString)wiFiName;
- (PrivacyProxyServiceStatus)proxyServiceStatus;
- (id)country;
- (id)issueTitle:(id)a3;
- (id)pausedPrivateRelayFooter;
- (id)suggestionTitle:(id)a3;
- (id)unsupportedTurnOffAlertTitleFor:(id)a3;
- (id)unsupportedTurnOffCellularAlertTitle;
- (unint64_t)_statusForSubscriber;
- (unint64_t)proxyAccountType;
- (unint64_t)proxyUserTier;
- (unint64_t)status;
- (void)_addNetworkOutageBannerTo:(id)a3 withCompletion:(id)a4;
- (void)_fetchAccountTypeWithCompletion:(id)a3;
- (void)_fetchBannerModelsForPaidTier:(id)a3;
- (void)_fetchUserTierWithCompletion:(id)a3;
- (void)_refreshOverallStatusWithCompletion:(id)a3;
- (void)_refreshServiceStatusWithCompletion:(id)a3;
- (void)enableCellular:(BOOL)a3 onNetworkName:(id)a4 completion:(id)a5;
- (void)enableDNS:(id)a3;
- (void)enableLocationSharing:(BOOL)a3 completion:(id)a4;
- (void)enableSafari:(id)a3;
- (void)enableWifi:(BOOL)a3 onNetworkName:(id)a4 completion:(id)a5;
- (void)fetchBannerModels:(id)a3;
- (void)isLocationSharingEnabled:(id)a3;
- (void)pausePrivateRelayUntilTomorrow:(id)a3;
- (void)setCellularName:(id)a3;
- (void)setEnabled:(BOOL)a3 completion:(id)a4;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIssueOrSuggestionCount:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setProxyAccountType:(unint64_t)a3;
- (void)setProxyServiceStatus:(id)a3;
- (void)setProxyUserTier:(unint64_t)a3;
- (void)setServiceIsLimited:(BOOL)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setStatusStringForPrefPane:(id)a3;
- (void)setWiFiName:(id)a3;
- (void)updateStatusStringForBannerModels:(id)a3;
@end

@implementation ICQInternetPrivacyViewModel

- (ICQInternetPrivacyViewModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICQInternetPrivacyViewModel;
  result = [(ICQInternetPrivacyViewModel *)&v3 init];
  if (result)
  {
    result->_status = 7;
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (NSString)proxyUserTierDescription
{
  unint64_t v2 = [(ICQInternetPrivacyViewModel *)self proxyUserTier];
  if (v2 == 1)
  {
    objc_super v3 = @"Free";
  }
  else if (v2 == 2)
  {
    objc_super v3 = @"Subscriber";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%lu)", v2);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)proxyAccountTypeDescription
{
  unint64_t v2 = [(ICQInternetPrivacyViewModel *)self proxyAccountType];
  if (v2 == 1)
  {
    objc_super v3 = @"Free";
  }
  else if (v2 == 2)
  {
    objc_super v3 = @"Subscriber";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%lu)", v2);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)statusDescription
{
  unint64_t v2 = [(ICQInternetPrivacyViewModel *)self status];
  if (v2 - 1 > 7) {
    return (NSString *)@"None";
  }
  else {
    return &off_264923838[v2 - 1]->isa;
  }
}

- (unint64_t)_statusForSubscriber
{
  if (self->_paused) {
    return 8;
  }
  if ([(ICQInternetPrivacyViewModel *)self isEnabled]) {
    return 1;
  }
  return 2;
}

- (void)setEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F58270];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__ICQInternetPrivacyViewModel_setEnabled_completion___block_invoke;
  v10[3] = &unk_264923660;
  BOOL v12 = v4;
  if (v4) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 setUserTier:v8 queue:MEMORY[0x263EF83A0] completionHandler:v10];
}

void __53__ICQInternetPrivacyViewModel_setEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"YES";
    if (!*(unsigned char *)(a1 + 48)) {
      v5 = @"NO";
    }
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Set internet privacy enabled status: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }

  if (!v3)
  {
    [*(id *)(a1 + 32) setIsEnabled:*(unsigned __int8 *)(a1 + 48)];
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    [*(id *)(a1 + 32) setStatus:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enableSafari:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x263F58270];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__ICQInternetPrivacyViewModel_enableSafari___block_invoke;
  v6[3] = &unk_264923688;
  id v7 = v3;
  id v5 = v3;
  [v4 setTrafficState:12 proxyTraffic:12 queue:MEMORY[0x263EF83A0] completionHandler:v6];
}

void __44__ICQInternetPrivacyViewModel_enableSafari___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Turned on Safari for Porcupine with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pausePrivateRelayUntilTomorrow:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x263F58270];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__ICQInternetPrivacyViewModel_pausePrivateRelayUntilTomorrow___block_invoke;
  v6[3] = &unk_264923688;
  id v7 = v3;
  id v5 = v3;
  [v4 setFreeUserTierUntilTomorrow:MEMORY[0x263EF83A0] completionHandler:v6];
}

void __62__ICQInternetPrivacyViewModel_pausePrivateRelayUntilTomorrow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Set free user tier until tomorrow. error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableDNS:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x263F58270];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__ICQInternetPrivacyViewModel_enableDNS___block_invoke;
  v6[3] = &unk_264923688;
  id v7 = v3;
  id v5 = v3;
  [v4 setTrafficState:128 proxyTraffic:128 queue:MEMORY[0x263EF83A0] completionHandler:v6];
}

void __41__ICQInternetPrivacyViewModel_enableDNS___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Turned on DNS for Porcupine with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableWifi:(BOOL)a3 onNetworkName:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = (void *)MEMORY[0x263F58270];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__ICQInternetPrivacyViewModel_enableWifi_onNetworkName_completion___block_invoke;
  v12[3] = &unk_264923660;
  BOOL v15 = v6;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 reportWiFiNetworkStatus:v6 networkName:v11 queue:MEMORY[0x263EF83A0] completionHandler:v12];
}

void __67__ICQInternetPrivacyViewModel_enableWifi_onNetworkName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 48)) {
      BOOL v6 = @"YES";
    }
    else {
      BOOL v6 = @"NO";
    }
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Porcupine on WiFi named %@ is enabled: %@ error: %@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enableCellular:(BOOL)a3 onNetworkName:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    __int16 v9 = (void *)MEMORY[0x263F58270];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__ICQInternetPrivacyViewModel_enableCellular_onNetworkName_completion___block_invoke;
    v13[3] = &unk_264923660;
    id v14 = v7;
    BOOL v16 = v6;
    id v15 = v8;
    [v9 reportCellularNetworkStatus:v6 networkName:v14 queue:MEMORY[0x263EF83A0] completionHandler:v13];

    id v10 = v14;
  }
  else
  {
    id v10 = ICQCreateErrorWithMessage();
    __int16 v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v10 description];
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = 0;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "Porcupine on cellular named %@ error: %@", buf, 0x16u);
    }
    (*((void (**)(id, void *))v8 + 2))(v8, v10);
  }
}

void __71__ICQInternetPrivacyViewModel_enableCellular_onNetworkName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 48)) {
      BOOL v6 = @"YES";
    }
    else {
      BOOL v6 = @"NO";
    }
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Porcupine on cellular named %@ is enabled: %@ error: %@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchBannerModels:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__ICQInternetPrivacyViewModel_fetchBannerModels___block_invoke;
  v6[3] = &unk_2649236D8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICQInternetPrivacyViewModel *)self _refreshOverallStatusWithCompletion:v6];
}

void __49__ICQInternetPrivacyViewModel_fetchBannerModels___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) proxyAccountType] == 2)
  {
    unint64_t v2 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __49__ICQInternetPrivacyViewModel_fetchBannerModels___block_invoke_2;
    v4[3] = &unk_2649236B0;
    v4[4] = v2;
    id v5 = *(id *)(a1 + 40);
    [v2 _fetchBannerModelsForPaidTier:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

void __49__ICQInternetPrivacyViewModel_fetchBannerModels___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 updateStatusStringForBannerModels:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchBannerModelsForPaidTier:(id)a3
{
  uint64_t v156 = *MEMORY[0x263EF8340];
  v125 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v127 = [MEMORY[0x263EFF980] array];
  uint64_t v145 = 0;
  v146 = &v145;
  uint64_t v147 = 0x3032000000;
  v148 = __Block_byref_object_copy__9;
  v149 = __Block_byref_object_dispose__9;
  id v150 = 0;
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_serviceIsLimited) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v152 = (uint64_t)v4;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "_serviceIsLimited %@", buf, 0xCu);
  }

  if ([(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus] == 6)
  {
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Porcupine not available due to unsupported region", buf, 2u);
    }

    id v6 = [(ICQInternetPrivacyViewModel *)self country];
    id v7 = NSString;
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v9 = [v8 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_REGION_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
    objc_msgSend(v7, "stringWithFormat:", v9, v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    __int16 v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

    uint64_t v13 = [ICQInternetPrivacyBannerModel alloc];
    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_REGION_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v16 = [(ICQInternetPrivacyBannerModel *)v13 initWithTitle:v15 message:v10 buttonTitle:v12 status:64 networkName:0];
    v17 = (void *)v146[5];
    v146[5] = v16;

    self->_status = 6;
    [v127 addObject:v146[5]];
    uint64_t v18 = (void *)[v127 copy];
    v125[2](v125, v18);
LABEL_10:

    goto LABEL_27;
  }
  __int16 v19 = self;
  if (self->_serviceIsLimited)
  {
    uint64_t v20 = [(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus];
    __int16 v19 = self;
    if (v20)
    {
      uint64_t v21 = _ICQGetLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v21, OS_LOG_TYPE_DEFAULT, "Porcupine is enabled in current region but not supported in user's account locale.", buf, 2u);
      }

      v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v12 = [v22 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

      v23 = [ICQInternetPrivacyBannerModel alloc];
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = [v24 localizedStringForKey:@"INTERNET_PRIVACY_SUPPORTED_REGION_LIMITED_ACCOUNT_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
      v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v27 = [v26 localizedStringForKey:@"INTERNET_PRIVACY_SUPPORTED_REGION_LIMITED_ACCOUNT_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
      uint64_t v28 = [(ICQInternetPrivacyBannerModel *)v23 initWithTitle:v25 message:v27 buttonTitle:v12 status:4096 networkName:0];
      v29 = (void *)v146[5];
      v146[5] = v28;

      self->_status = 1;
      [v127 addObject:v146[5]];
      id v6 = (id)[v127 copy];
      v125[2](v125, v6);
      goto LABEL_27;
    }
  }
  if ([(PrivacyProxyServiceStatus *)v19->_proxyServiceStatus serviceStatus] == 5)
  {
    v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v30 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

    v31 = [ICQInternetPrivacyBannerModel alloc];
    v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v33 = [v32 localizedStringForKey:@"INTERNET_PRIVACY_SYSTEM_INCOMPATIBLE_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v35 = [v34 localizedStringForKey:@"INTERNET_PRIVACY_SYSTEM_INCOMPATIBLE_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v36 = [(ICQInternetPrivacyBannerModel *)v31 initWithTitle:v33 message:v35 buttonTitle:v12 status:512 networkName:0];
    v37 = (void *)v146[5];
    v146[5] = v36;

    self->_status = 5;
    [v127 addObject:v146[5]];
    id v6 = (id)[v127 copy];
    v125[2](v125, v6);
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  if ([(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus] == 3)
  {
    v38 = [MEMORY[0x263F82670] currentDevice];
    BOOL v39 = [v38 userInterfaceIdiom] == 1;

    v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v39) {
      [v40 localizedStringForKey:@"INTERNET_PRIVACY_FRAUD_IPAD_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
    }
    else {
    id v12 = [v40 localizedStringForKey:@"INTERNET_PRIVACY_FRAUD_IPHONE_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
    }

    v49 = [ICQInternetPrivacyBannerModel alloc];
    v50 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v51 = [v50 localizedStringForKey:@"INTERNET_PRIVACY_FRAUD_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v52 = [(ICQInternetPrivacyBannerModel *)v49 initWithTitle:v51 message:v12 buttonTitle:0 status:1024 networkName:0];
    v53 = (void *)v146[5];
    v146[5] = v52;

    self->_status = 5;
    [v127 addObject:v146[5]];
    id v6 = (id)[v127 copy];
    v125[2](v125, v6);
    goto LABEL_27;
  }
  if ([(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus] == 2)
  {
    v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v41 localizedStringForKey:@"INTERNET_PRIVACY_OPEN_SYSTEM_STATUS_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

    v42 = [ICQInternetPrivacyBannerModel alloc];
    v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v44 = [v43 localizedStringForKey:@"INTERNET_PRIVACY_OUTAGE_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v46 = [v45 localizedStringForKey:@"INTERNET_PRIVACY_OUTAGE_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v47 = [(ICQInternetPrivacyBannerModel *)v42 initWithTitle:v44 message:v46 buttonTitle:v12 status:2048 networkName:0];
    v48 = (void *)v146[5];
    v146[5] = v47;

    self->_status = 5;
    [v127 addObject:v146[5]];
    id v6 = (id)[v127 copy];
    v125[2](v125, v6);
    goto LABEL_27;
  }
  if ([(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus] != 7)
  {
    if ([(ICQInternetPrivacyViewModel *)self proxyUserTier] == 1)
    {
      v54 = _ICQGetLogSystem();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v54, OS_LOG_TYPE_DEFAULT, "Free tier detected: skipping network statuses", buf, 2u);
      }

      id v12 = [v127 copy];
      v125[2](v125, v12);
      goto LABEL_28;
    }
    v124 = [MEMORY[0x263EFF980] array];
    uint64_t v55 = [MEMORY[0x263EFF980] array];
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    v56 = [(PrivacyProxyServiceStatus *)self->_proxyServiceStatus networkStatuses];
    uint64_t v57 = [v56 countByEnumeratingWithState:&v141 objects:v155 count:16];
    v123 = (void *)v55;
    if (!v57) {
      goto LABEL_85;
    }
    uint64_t v128 = *(void *)v142;
    id obj = v56;
LABEL_36:
    uint64_t v129 = v57;
    uint64_t v58 = 0;
    while (1)
    {
      if (*(void *)v142 != v128) {
        objc_enumerationMutation(obj);
      }
      v59 = *(void **)(*((void *)&v141 + 1) + 8 * v58);
      v60 = _ICQGetLogSystem();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v61 = [(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus];
        uint64_t v62 = [v59 networkStatus];
        *(_DWORD *)buf = 134218240;
        uint64_t v152 = v61;
        __int16 v153 = 2048;
        uint64_t v154 = v62;
        _os_log_impl(&dword_22C821000, v60, OS_LOG_TYPE_DEFAULT, "Overall service status: %lu, network status: %lu", buf, 0x16u);
      }

      if ([v59 networkType] != 2) {
        break;
      }
      v63 = _ICQGetLogSystem();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = [v59 networkName];
        *(_DWORD *)buf = 138412290;
        uint64_t v152 = (uint64_t)v64;
        _os_log_impl(&dword_22C821000, v63, OS_LOG_TYPE_DEFAULT, "Found cellular network name: %@", buf, 0xCu);
      }
      v65 = [v59 networkName];
      [(ICQInternetPrivacyViewModel *)self setCellularName:v65];

      if ([v59 networkStatus] == 2
        && [(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus] == 1)
      {
        v66 = _ICQGetLogSystem();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C821000, v66, OS_LOG_TYPE_DEFAULT, "Current cellular network does not support Porcupine", buf, 2u);
        }

        v67 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v68 = [v67 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_CELLULAR_ON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

        v69 = [ICQInternetPrivacyBannerModel alloc];
        v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v71 = [v70 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_CELLULAR_ON_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
        v72 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v73 = [v72 localizedStringForKey:@"INTERNET_PRIVACY_USE_WITHOUT_PRIVATE_RELAY_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
        v74 = [v59 networkName];
        uint64_t v75 = [(ICQInternetPrivacyBannerModel *)v69 initWithTitle:v68 message:v71 buttonTitle:v73 status:4 networkName:v74];
        v76 = (void *)v146[5];
        v146[5] = v75;

        [v124 addObject:v146[5]];
LABEL_57:
        v93 = 0;
        goto LABEL_63;
      }
      if ([v59 networkStatus]
        || [(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus] != 1)
      {
        if ([v59 networkStatus] == 1
          && ![(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus])
        {
          v104 = _ICQGetLogSystem();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
LABEL_81:
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C821000, v104, OS_LOG_TYPE_DEFAULT, "Network status is active, service status is disabled. Don't display banners/buttons.", buf, 2u);
          }
LABEL_82:
          v93 = 0;
          v103 = 0;
          v68 = 0;
LABEL_83:

          goto LABEL_78;
        }
LABEL_77:
        v93 = 0;
        v103 = 0;
        v68 = 0;
        goto LABEL_78;
      }
      v94 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v93 = [v94 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

      v95 = _ICQGetLogSystem();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v95, OS_LOG_TYPE_DEFAULT, "Current cellular network is turned off for Porcupine", buf, 2u);
      }

      v96 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v68 = [v96 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_CELLULAR_OFF_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

      v97 = [ICQInternetPrivacyBannerModel alloc];
      v98 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v99 = [v98 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_CELLULAR_OFF_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
      v100 = [v59 networkName];
      uint64_t v101 = [(ICQInternetPrivacyBannerModel *)v97 initWithTitle:v68 message:v99 buttonTitle:v93 status:8 networkName:v100];
      v102 = (void *)v146[5];
      v146[5] = v101;

      [v124 addObject:v146[5]];
LABEL_63:
      v103 = 0;
LABEL_78:

      if (v129 == ++v58)
      {
        v56 = obj;
        uint64_t v57 = [obj countByEnumeratingWithState:&v141 objects:v155 count:16];
        if (!v57)
        {
LABEL_85:

          v119 = dispatch_group_create();
          dispatch_group_enter(v119);
          v120 = (void *)MEMORY[0x263F58270];
          v137[0] = MEMORY[0x263EF8330];
          v137[1] = 3221225472;
          v137[2] = __61__ICQInternetPrivacyViewModel__fetchBannerModelsForPaidTier___block_invoke;
          v137[3] = &unk_264923700;
          v140 = &v145;
          id v121 = v123;
          id v138 = v121;
          id v12 = v119;
          v139 = v12;
          [v120 getTrafficState:MEMORY[0x263EF83A0] completionandler:v137];

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __61__ICQInternetPrivacyViewModel__fetchBannerModelsForPaidTier___block_invoke_181;
          block[3] = &unk_264923728;
          id v132 = v124;
          id v133 = v121;
          v134 = self;
          id v135 = v127;
          v136 = v125;
          id v10 = v121;
          id v6 = v124;
          v122 = (void *)MEMORY[0x263EF83A0];
          dispatch_group_notify(v12, MEMORY[0x263EF83A0], block);

          uint64_t v18 = v138;
          goto LABEL_10;
        }
        goto LABEL_36;
      }
    }
    if ([v59 networkType] != 1) {
      goto LABEL_77;
    }
    v77 = _ICQGetLogSystem();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = [v59 networkName];
      *(_DWORD *)buf = 138412290;
      uint64_t v152 = (uint64_t)v78;
      _os_log_impl(&dword_22C821000, v77, OS_LOG_TYPE_DEFAULT, "Found WiFi network name: %@", buf, 0xCu);
    }
    v79 = [v59 networkName];
    [(ICQInternetPrivacyViewModel *)self setWiFiName:v79];

    if ([v59 networkStatus] != 2
      || [(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus] != 1)
    {
      if (![v59 networkStatus]
        && [(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus] == 1)
      {
        v105 = _ICQGetLogSystem();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C821000, v105, OS_LOG_TYPE_DEFAULT, "Current Wi-Fi network is turned off for Porcupine", buf, 2u);
        }

        int v106 = MGGetBoolAnswer();
        v107 = @"WIFI";
        if (v106) {
          v107 = @"WLAN";
        }
        v104 = v107;
        v108 = [NSString stringWithFormat:@"INTERNET_PRIVACY_UNSUPPORTED_%@_OFF_MESSAGE", v104];
        v109 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v103 = [v109 localizedStringForKey:v108 value:&stru_26DFF2C90 table:@"Localizable"];

        v110 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v93 = [v110 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

        v111 = NSString;
        v112 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v113 = [v112 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_NETWORK_OFF_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
        v114 = [v59 networkName];
        v68 = objc_msgSend(v111, "stringWithFormat:", v113, v114);

        v115 = [ICQInternetPrivacyBannerModel alloc];
        v116 = [v59 networkName];
        uint64_t v117 = [(ICQInternetPrivacyBannerModel *)v115 initWithTitle:v68 message:v103 buttonTitle:v93 status:2 networkName:v116];
        v118 = (void *)v146[5];
        v146[5] = v117;

        [v124 addObject:v146[5]];
        goto LABEL_83;
      }
      if ([v59 networkStatus] == 1
        && ![(PrivacyProxyServiceStatus *)self->_proxyServiceStatus serviceStatus])
      {
        v104 = _ICQGetLogSystem();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_81;
        }
        goto LABEL_82;
      }
      goto LABEL_77;
    }
    v80 = _ICQGetLogSystem();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v80, OS_LOG_TYPE_DEFAULT, "Current Wi-Fi network does not support Porcupine", buf, 2u);
    }

    v81 = NSString;
    v82 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v83 = [v82 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_NETWORK_ON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    v84 = [v59 networkName];
    v68 = objc_msgSend(v81, "stringWithFormat:", v83, v84, v123);

    v85 = [ICQInternetPrivacyBannerModel alloc];
    v86 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v87 = [v86 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_WIFI_ON_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
    v88 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v89 = [v88 localizedStringForKey:@"INTERNET_PRIVACY_USE_WITHOUT_PRIVATE_RELAY_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    v90 = [v59 networkName];
    uint64_t v91 = [(ICQInternetPrivacyBannerModel *)v85 initWithTitle:v68 message:v87 buttonTitle:v89 status:1 networkName:v90];
    v92 = (void *)v146[5];
    v146[5] = v91;

    [v124 addObject:v146[5]];
    goto LABEL_57;
  }
  [(ICQInternetPrivacyViewModel *)self _addNetworkOutageBannerTo:v127 withCompletion:v125];
LABEL_29:
  _Block_object_dispose(&v145, 8);
}

void __61__ICQInternetPrivacyViewModel__fetchBannerModelsForPaidTier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 0x80) == 0)
  {
    id v28 = v5;
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Porcupine DNS is unavailable", buf, 2u);
    }

    v27 = [ICQInternetPrivacyBannerModel alloc];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v9 = [v8 localizedStringForKey:@"INTERNET_PRIVACY_DNS_OFF_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v11 = [v10 localizedStringForKey:@"INTERNET_PRIVACY_DNS_OFF_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
    id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"INTERNET_PRIVACY_TURN_ON_DNS_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v14 = [(ICQInternetPrivacyBannerModel *)v27 initWithTitle:v9 message:v11 buttonTitle:v13 status:32 networkName:0];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    id v6 = v28;
  }
  if ((a2 & 8) == 0)
  {
    v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "Porcupine Safari is unavailable", v30, 2u);
    }

    v29 = [ICQInternetPrivacyBannerModel alloc];
    uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v19 = [v18 localizedStringForKey:@"INTERNET_PRIVACY_SAFARI_OFF_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 localizedStringForKey:@"INTERNET_PRIVACY_SAFARI_OFF_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"INTERNET_PRIVACY_TURN_ON_SAFARI_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v24 = [(ICQInternetPrivacyBannerModel *)v29 initWithTitle:v19 message:v21 buttonTitle:v23 status:16 networkName:0];
    uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
    v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__ICQInternetPrivacyViewModel__fetchBannerModelsForPaidTier___block_invoke_181(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v2 = (id *)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 32) count];
  if (v3 >= [*(id *)(a1 + 40) count] && objc_msgSend(*v2, "count"))
  {
    uint64_t v4 = 3;
  }
  else
  {
    unint64_t v5 = [*v2 count];
    if (v5 >= [*(id *)(a1 + 40) count]) {
      goto LABEL_7;
    }
    uint64_t v4 = 4;
    unint64_t v2 = (id *)(a1 + 40);
  }
  [*(id *)(a1 + 48) setStatus:v4];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*v2, "count"));
  [*(id *)(a1 + 48) setIssueOrSuggestionCount:v6];

LABEL_7:
  uint64_t v7 = [*(id *)(a1 + 32) count];
  if (v7 == 2) {
    uint64_t v8 = 32;
  }
  else {
    uint64_t v8 = 40;
  }
  if (v7 == 2) {
    uint64_t v9 = 40;
  }
  else {
    uint64_t v9 = 32;
  }
  [*(id *)(a1 + 56) addObjectsFromArray:*(void *)(a1 + v8)];
  [*(id *)(a1 + 56) addObjectsFromArray:*(void *)(a1 + v9)];
  id v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = (void *)[*(id *)(a1 + 56) copy];
    int v14 = 138412290;
    uint64_t v15 = v11;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Banners returned: %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = (void *)[*(id *)(a1 + 56) copy];
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
}

- (void)updateStatusStringForBannerModels:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "status", (void)v14) == 1)
        {
          __int16 v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v12 = v11;
          uint64_t v13 = @"INTERNET_PRIVACY_STATUS_MAC_UNSUPPORTED_WIFI";
          goto LABEL_26;
        }
        if ([v9 status] == 128)
        {
          __int16 v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v12 = v11;
          uint64_t v13 = @"INTERNET_PRIVACY_STATUS_MAC_WIFI_OFF";
          goto LABEL_26;
        }
        if ([v9 status] == 32)
        {
          __int16 v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v12 = v11;
          uint64_t v13 = @"INTERNET_PRIVACY_STATUS_MAC_DNS_OFF";
          goto LABEL_26;
        }
        if ([v9 status] == 16)
        {
          __int16 v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v12 = v11;
          uint64_t v13 = @"INTERNET_PRIVACY_STATUS_MAC_SAFARI_OFF";
          goto LABEL_26;
        }
        if ([v9 status] == 64)
        {
          __int16 v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v12 = v11;
          uint64_t v13 = @"INTERNET_PRIVACY_STATUS_MAC_UNAVAILABLE_REGION";
          goto LABEL_26;
        }
        if ([v9 status] == 512)
        {
          __int16 v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v12 = v11;
          uint64_t v13 = @"INTERNET_PRIVACY_STATUS_MAC_UNAVAILABLE_SYSTEM";
          goto LABEL_26;
        }
        if ([v9 status] == 1024
          || [v9 status] == 2048
          || [v9 status] == 0x2000)
        {
          __int16 v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v12 = v11;
          uint64_t v13 = @"INTERNET_PRIVACY_STATUS_MAC_UNAVAILABLE_FRAUD";
LABEL_26:
          id v10 = [v11 localizedStringForKey:v13 value:&stru_26DFF2C90 table:@"Localizable"];

          goto LABEL_27;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v10 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }
LABEL_27:

  [(ICQInternetPrivacyViewModel *)self setStatusStringForPrefPane:v10];
}

- (NSString)statusStringForPrefPane
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_statusStringForPrefPane;
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Returning status string %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)setStatusStringForPrefPane:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v5 = (unint64_t)a3;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v6 = self->_statusStringForPrefPane;
  objc_storeStrong((id *)&self->_statusStringForPrefPane, a3);
  os_unfair_lock_unlock(&self->_lock);
  if (([(id)v6 isEqualToString:v5] & 1) == 0 && v5 | v6)
  {
    uint64_t v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      unint64_t v10 = v6;
      __int16 v11 = 2112;
      unint64_t v12 = v5;
      _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Private Relay status string has changed! old status: %@, new status: %@", (uint8_t *)&v9, 0x16u);
    }

    int v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"PorcupineStatusDidChange" object:0];
  }
  else
  {
    int v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ICQInternetPrivacyViewModel setStatusStringForPrefPane:](v7);
    }
  }
}

- (id)country
{
  unint64_t v3 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = [(PrivacyProxyServiceStatus *)self->_proxyServiceStatus details];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v6 = [(PrivacyProxyServiceStatus *)self->_proxyServiceStatus details];
    int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F58278]];
    uint64_t v8 = [v7 componentsSeparatedByString:@"-"];
    uint64_t v9 = *MEMORY[0x263EFF4D0];
    unint64_t v10 = [v8 objectAtIndexedSubscript:0];
    __int16 v11 = [v3 displayNameForKey:v9 value:v10];
  }
  else
  {
    uint64_t v12 = *MEMORY[0x263EFF4D0];
    unint64_t v6 = [v3 objectForKey:*MEMORY[0x263EFF4D0]];
    __int16 v11 = [v3 displayNameForKey:v12 value:v6];
  }

  return v11;
}

- (void)isLocationSharingEnabled:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F58270];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__ICQInternetPrivacyViewModel_isLocationSharingEnabled___block_invoke;
  v6[3] = &unk_264923750;
  id v7 = v3;
  id v5 = v3;
  [v4 getGeohashSharingPreference:MEMORY[0x263EF83A0] completionHandler:v6];
}

void __56__ICQInternetPrivacyViewModel_isLocationSharingEnabled___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Porcupine location sharing is enabled: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableLocationSharing:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  unint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v4) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    long long v14 = v7;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Porcupine should location sharing %@", buf, 0xCu);
  }

  int v8 = (void *)MEMORY[0x263F58270];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__ICQInternetPrivacyViewModel_enableLocationSharing_completion___block_invoke;
  v10[3] = &unk_264923778;
  BOOL v12 = v4;
  id v11 = v5;
  id v9 = v5;
  [v8 setGeohashSharingPreference:v4 queue:MEMORY[0x263EF83A0] completionHandler:v10];
}

void __64__ICQInternetPrivacyViewModel_enableLocationSharing_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"YES";
    if (!*(unsigned char *)(a1 + 40)) {
      id v5 = @"NO";
    }
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Set Porcupine location sharing enabled status: %@ error: %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchUserTierWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F58270];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__ICQInternetPrivacyViewModel__fetchUserTierWithCompletion___block_invoke;
  v7[3] = &unk_2649237A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getUserTierExtended:MEMORY[0x263EF83A0] completionHandler:v7];
}

void __60__ICQInternetPrivacyViewModel__fetchUserTierWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 == 1)
    {
      id v9 = @"Free";
    }
    else if (a2 == 2)
    {
      id v9 = @"Subscriber";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%lu)", a2);
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = @"NO";
    *(_DWORD *)buf = 136315906;
    BOOL v12 = "-[ICQInternetPrivacyViewModel _fetchUserTierWithCompletion:]_block_invoke";
    if (a3) {
      uint64_t v10 = @"YES";
    }
    __int16 v13 = 2112;
    long long v14 = v9;
    __int16 v15 = 2112;
    long long v16 = v10;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "%s: Got NSP user tier: %@ isPaused: %@, error: %@", buf, 0x2Au);
  }
  if (!v7)
  {
    [*(id *)(a1 + 32) setPaused:a3];
    [*(id *)(a1 + 32) setProxyUserTier:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchAccountTypeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F32BA0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__ICQInternetPrivacyViewModel__fetchAccountTypeWithCompletion___block_invoke;
  v7[3] = &unk_2649237C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 requestFeatureWithId:@"networking.privacy.subscriber" completion:v7];
}

void __63__ICQInternetPrivacyViewModel__fetchAccountTypeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if ([v5 canUse]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    [*(id *)(a1 + 32) setProxyAccountType:v7];
  }
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 32) proxyAccountType];
    if (v9 == 1)
    {
      uint64_t v10 = @"Free";
    }
    else if (v9 == 2)
    {
      uint64_t v10 = @"Subscriber";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%lu)", v9);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 136315650;
    BOOL v12 = "-[ICQInternetPrivacyViewModel _fetchAccountTypeWithCompletion:]_block_invoke";
    __int16 v13 = 2112;
    long long v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "%s: Got account type: %@, error: %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_refreshServiceStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F58270];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__ICQInternetPrivacyViewModel__refreshServiceStatusWithCompletion___block_invoke;
  v7[3] = &unk_2649237F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getServiceStatus:MEMORY[0x263EF83A0] completionHandler:v7];
}

void __67__ICQInternetPrivacyViewModel__refreshServiceStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    uint64_t v11 = [v5 serviceStatus];
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "PrivacyProxy serviceStatus: %lu error: %@", (uint8_t *)&v10, 0x16u);
  }

  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 networkStatuses];
    int v10 = 138412546;
    uint64_t v11 = (uint64_t)v9;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "PrivacyProxy networkStatuses: %@ error: %@", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 32) setProxyServiceStatus:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_refreshOverallStatusWithCompletion:(id)a3
{
  id v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__9;
  v22[4] = __Block_byref_object_dispose__9;
  id v23 = 0;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke;
  v19[3] = &unk_264923818;
  uint64_t v21 = v22;
  id v6 = v5;
  uint64_t v20 = v6;
  [(ICQInternetPrivacyViewModel *)self _fetchUserTierWithCompletion:v19];
  dispatch_group_enter(v6);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_2;
  v16[3] = &unk_264923818;
  id v18 = v22;
  uint64_t v7 = v6;
  uint64_t v17 = v7;
  [(ICQInternetPrivacyViewModel *)self _fetchAccountTypeWithCompletion:v16];
  dispatch_group_enter(v7);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_3;
  v13[3] = &unk_264923818;
  __int16 v15 = v22;
  id v8 = v7;
  uint64_t v14 = v8;
  [(ICQInternetPrivacyViewModel *)self _refreshServiceStatusWithCompletion:v13];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_4;
  block[3] = &unk_2649221F0;
  id v11 = v4;
  __int16 v12 = v22;
  void block[4] = self;
  id v9 = v4;
  dispatch_group_notify(v8, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v22, 8);
}

void __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) proxyAccountType];
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "proxyUserTier") == 2);
    uint64_t v4 = [*(id *)(a1 + 32) _statusForSubscriber];
    id v3 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    [*(id *)(a1 + 32) setIsEnabled:0];
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = 0;
LABEL_5:
    [v3 setStatus:v4];
    goto LABEL_7;
  }
  [*(id *)(a1 + 32) setStatus:7];
  [*(id *)(a1 + 32) setIsEnabled:0];
LABEL_7:
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [*(id *)(a1 + 32) status] - 1;
    if (v6 > 7) {
      uint64_t v7 = @"None";
    }
    else {
      uint64_t v7 = off_264923838[v6];
    }
    int v8 = [*(id *)(a1 + 32) isEnabled];
    uint64_t v9 = [*(id *)(a1 + 32) proxyAccountType];
    if (v9 == 1)
    {
      int v10 = @"Free";
    }
    else if (v9 == 2)
    {
      int v10 = @"Subscriber";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%lu)", v9);
      int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    __int16 v15 = v7;
    __int16 v16 = 1024;
    int v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Refreshed overall status, got status: %@, enabled: %d, account type: %@, error: %@", buf, 0x26u);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  id v13 = _ICQGetLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "Fetched user tier and service information upon ICQInternetPrivacyViewModel initiation.", buf, 2u);
  }
}

- (void)_addNetworkOutageBannerTo:(id)a3 withCompletion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v8 = [(PrivacyProxyServiceStatus *)self->_proxyServiceStatus networkStatuses];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      if ([v13 networkType] == 1)
      {
        uint64_t v14 = [v13 networkName];

        if (v14) {
          break;
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    __int16 v15 = [v13 networkName];

    if (v15) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_10:
  }
  __int16 v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v15 = [v16 localizedStringForKey:@"INTERNET_PRIVACY_UNKOWN_NETWORK_NAME" value:&stru_26DFF2C90 table:@"Localizable"];

LABEL_13:
  int v17 = NSString;
  __int16 v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v19 = [v18 localizedStringForKey:@"INTERNET_PRIVACY_NETWORK_OUTAGE_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
  __int16 v20 = objc_msgSend(v17, "stringWithFormat:", v19, v15);

  uint64_t v21 = [ICQInternetPrivacyBannerModel alloc];
  uint64_t v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v23 = [v22 localizedStringForKey:@"INTERNET_PRIVACY_NETWORK_OUTAGE_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
  uint64_t v24 = [(ICQInternetPrivacyBannerModel *)v21 initWithTitle:v23 message:v20 buttonTitle:0 status:0x2000 networkName:0];

  self->_status = 5;
  [v6 addObject:v24];
  uint64_t v25 = (void *)[v6 copy];
  v7[2](v7, v25);
}

- (NSString)navTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)switchTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)onTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_ON" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)offTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_OFF" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)unavailableTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_UNAVAILABLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)notSupportedTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_NOT_SUPPORTED_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (id)issueTitle:(id)a3
{
  id v3 = NSString;
  uint64_t v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"ISSUE_COUNT_FORMAT" value:&stru_26DFF2C90 table:@"Localizable"];
  [v5 doubleValue];
  uint64_t v9 = v8;

  uint64_t v10 = objc_msgSend(v3, "localizedStringWithFormat:", v7, v9);

  return v10;
}

- (id)suggestionTitle:(id)a3
{
  id v3 = NSString;
  uint64_t v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"SUGGESTION_COUNT_FORMAT" value:&stru_26DFF2C90 table:@"Localizable"];
  [v5 doubleValue];
  uint64_t v9 = v8;

  uint64_t v10 = objc_msgSend(v3, "localizedStringWithFormat:", v7, v9);

  return v10;
}

- (NSString)learnMoreTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)learnMoreButtonTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)learnMoreLinkTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_LINK_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)upgradeTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_UPGRADE_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)waitingTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_WAITING_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)explanationTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_EXPLANATION_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)explanationMessage
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_EXPLANATION_SUBSCRIBED_ON_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)explanationButtonTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_SET_UP_MATTERHORN_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)privateRelayPausedTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_PAUSED_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)privateRelayPausedMessage
{
  if ([(ICQInternetPrivacyViewModel *)self isPaused])
  {
    uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v3 = [v2 localizedStringForKey:@"PRIVATE_RELAY_PAUSED_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
  }
  else
  {
    id v3 = &stru_26DFF2C90;
  }
  return (NSString *)v3;
}

- (NSString)incompatibleSitesMessage
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_INCOMPATIBLE_SITES_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (id)pausedPrivateRelayFooter
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"PRIVATE_RELAY_IN_SNOOZE_MODE" value:&stru_26DFF2C90 table:@"Localizable"];

  return v3;
}

- (NSString)IPAddressLocationTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_IPADDRESS_LOCATION_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)IPAddressLocationSettingsTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_IPADDRESS_LOCATION_SETTINGS_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)IPAddressLocationEnabledTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_IPADDRESS_LOCATION_ENABLED_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)IPAddressLocationDisabledTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_IPADDRESS_LOCATION_DISABLED_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)IPAddressLocationEnabledMessage
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_IPADDRESS_LOCATION_ENABLED_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)IPAddressLocationDisabledMessage
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_IPADDRESS_LOCATION_DISABLED_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)unsupportedTurnOffAlertTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_ALERT_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (id)unsupportedTurnOffAlertTitleFor:(id)a3
{
  id v3 = NSString;
  uint64_t v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_WIFI_ALERT_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
  uint64_t v8 = objc_msgSend(v3, "stringWithFormat:", v7, v5);

  return v8;
}

- (id)unsupportedTurnOffCellularAlertTitle
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_CELLULAR_ALERT_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return v3;
}

- (NSString)unsupportedTurnOffWifiAlertMessage
{
  int v2 = MGGetBoolAnswer();
  id v3 = @"WIFI";
  if (v2) {
    id v3 = @"WLAN";
  }
  uint64_t v4 = NSString;
  id v5 = v3;
  id v6 = [v4 stringWithFormat:@"INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_ALERT_%@_MESSAGE", v5];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  uint64_t v8 = [v7 localizedStringForKey:v6 value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v8;
}

- (NSString)unsupportedTurnOffCellularAlertMessage
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_ALERT_CELLULAR_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)unsupportedTurnOffAlertOk
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_ALERT_OK" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)unsupportedSwitchOffAlertTitle
{
  int v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3 == 1) {
    id v6 = @"INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_IPAD_TITLE";
  }
  else {
    id v6 = @"INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_IPHONE_TITLE";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v7;
}

- (NSString)unsupportedWifiSwitchOffAlertMessage
{
  int v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3 == 1) {
    id v6 = @"INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_WIFI_IPAD_MESSAGE";
  }
  else {
    id v6 = @"INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_WIFI_IPHONE_MESSAGE";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v7;
}

- (NSString)unsupportedCellularSwitchOffAlertMessage
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_CELLULAR_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)unsupportedSwitchOffNetworkOnly
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_NETWORK_ONLY" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)unsupportedSwitchOffProviderOnly
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_PROVIDER_ONLY" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)unsupportedSwitchOffCompletely
{
  int v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3 == 1) {
    id v6 = @"INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_IPAD_COMPLETELY";
  }
  else {
    id v6 = @"INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_IPHONE_COMPLETELY";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v7;
}

- (NSString)unsupportedSwitchOffCancel
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_CANCEL" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)switchOffAlertTitle
{
  int v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3 == 1) {
    id v6 = @"INTERNET_PRIVACY_SWITCH_OFF_IPAD_ALERT_TITLE";
  }
  else {
    id v6 = @"INTERNET_PRIVACY_SWITCH_OFF_ALERT_TITLE";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v7;
}

- (NSString)switchOffAlertPrefPaneTitle
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_SWITCH_OFF_MAC_ALERT_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)switchOffAlertMessage
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_SWITCH_OFF_ALERT_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)switchOffAlertTurnOff
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_SWITCH_OFF_ALERT_TURN_OFF" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)switchOffAlertPause
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_SWITCH_OFF_ALERT_PAUSE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)switchOffAlertLearnMore
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)turnOnSafariAlertTitle
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_TURN_ON_SAFARI_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)turnOnSafariAlertMessage
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_TURN_ON_SAFARI_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)turnOnDNSAlertTitle
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_TURN_ON_DNS_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)turnOnDNSAlertMessage
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INTERNET_PRIVACY_TURN_ON_DNS_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)internetPrivacyLearnMoreMessage
{
  int v2 = MGGetBoolAnswer();
  uint64_t v3 = @"WIFI";
  if (v2) {
    uint64_t v3 = @"WLAN";
  }
  uint64_t v4 = NSString;
  id v5 = v3;
  id v6 = [v4 stringWithFormat:@"INTERNET_PRIVACY_LEARN_MORE_%@_NETWORK_BODY", v5];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  uint64_t v8 = [v7 localizedStringForKey:v6 value:&stru_26DFF2C90 table:@"Localizable"];

  return (NSString *)v8;
}

- (NSString)privateRelayStatusText
{
  int v2 = self;
  switch(self->_status)
  {
    case 0uLL:
      uint64_t v3 = [(ICQInternetPrivacyViewModel *)self upgradeTitle];
      goto LABEL_12;
    case 1uLL:
      uint64_t v3 = [(ICQInternetPrivacyViewModel *)self onTitle];
      goto LABEL_12;
    case 2uLL:
      uint64_t v3 = [(ICQInternetPrivacyViewModel *)self offTitle];
      goto LABEL_12;
    case 3uLL:
      uint64_t v4 = [(ICQInternetPrivacyViewModel *)self issueOrSuggestionCount];
      uint64_t v5 = [(ICQInternetPrivacyViewModel *)v2 issueTitle:v4];
      goto LABEL_7;
    case 4uLL:
      uint64_t v4 = [(ICQInternetPrivacyViewModel *)self issueOrSuggestionCount];
      uint64_t v5 = [(ICQInternetPrivacyViewModel *)v2 suggestionTitle:v4];
LABEL_7:
      int v2 = (ICQInternetPrivacyViewModel *)v5;

      break;
    case 5uLL:
      uint64_t v3 = [(ICQInternetPrivacyViewModel *)self unavailableTitle];
      goto LABEL_12;
    case 6uLL:
      uint64_t v3 = [(ICQInternetPrivacyViewModel *)self notSupportedTitle];
      goto LABEL_12;
    case 7uLL:
      uint64_t v3 = [(ICQInternetPrivacyViewModel *)self waitingTitle];
      goto LABEL_12;
    case 8uLL:
      uint64_t v3 = [(ICQInternetPrivacyViewModel *)self privateRelayPausedTitle];
LABEL_12:
      int v2 = (ICQInternetPrivacyViewModel *)v3;
      break;
    default:
      break;
  }
  return (NSString *)v2;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSString)bannerMessageOnMac
{
  return self->_bannerMessageOnMac;
}

- (NSString)explanationPrefPaneMessage
{
  return self->_explanationPrefPaneMessage;
}

- (NSString)IPAddressLocationMacTitle
{
  return self->_IPAddressLocationMacTitle;
}

- (NSString)porcupineOnTitle
{
  return self->_porcupineOnTitle;
}

- (NSString)porcupineOffTitle
{
  return self->_porcupineOffTitle;
}

- (NSString)porcupineUnavailableTitle
{
  return self->_porcupineUnavailableTitle;
}

- (NSString)porcupinePausedTitle
{
  return self->_porcupinePausedTitle;
}

- (NSString)turnOnPorcupineButtonTitle
{
  return self->_turnOnPorcupineButtonTitle;
}

- (NSString)turnOffButtonTitle
{
  return self->_turnOffButtonTitle;
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (NSArray)bannerModels
{
  return self->_bannerModels;
}

- (unint64_t)proxyUserTier
{
  return self->_proxyUserTier;
}

- (void)setProxyUserTier:(unint64_t)a3
{
  self->_proxyUserTier = a3;
}

- (unint64_t)proxyAccountType
{
  return self->_proxyAccountType;
}

- (void)setProxyAccountType:(unint64_t)a3
{
  self->_proxyAccountType = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (BOOL)serviceIsLimited
{
  return self->_serviceIsLimited;
}

- (void)setServiceIsLimited:(BOOL)a3
{
  self->_serviceIsLimited = a3;
}

- (NSNumber)issueOrSuggestionCount
{
  return self->_issueOrSuggestionCount;
}

- (void)setIssueOrSuggestionCount:(id)a3
{
}

- (NSString)wiFiName
{
  return self->_wiFiName;
}

- (void)setWiFiName:(id)a3
{
}

- (NSString)cellularName
{
  return self->_cellularName;
}

- (void)setCellularName:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (PrivacyProxyServiceStatus)proxyServiceStatus
{
  return self->_proxyServiceStatus;
}

- (void)setProxyServiceStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyServiceStatus, 0);
  objc_storeStrong((id *)&self->_cellularName, 0);
  objc_storeStrong((id *)&self->_wiFiName, 0);
  objc_storeStrong((id *)&self->_issueOrSuggestionCount, 0);
  objc_storeStrong((id *)&self->_bannerModels, 0);
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);
  objc_storeStrong((id *)&self->_turnOffButtonTitle, 0);
  objc_storeStrong((id *)&self->_turnOnPorcupineButtonTitle, 0);
  objc_storeStrong((id *)&self->_porcupinePausedTitle, 0);
  objc_storeStrong((id *)&self->_porcupineUnavailableTitle, 0);
  objc_storeStrong((id *)&self->_porcupineOffTitle, 0);
  objc_storeStrong((id *)&self->_porcupineOnTitle, 0);
  objc_storeStrong((id *)&self->_IPAddressLocationMacTitle, 0);
  objc_storeStrong((id *)&self->_explanationPrefPaneMessage, 0);
  objc_storeStrong((id *)&self->_bannerMessageOnMac, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_statusStringForPrefPane, 0);
}

- (void)setStatusStringForPrefPane:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "Private Relay status string did not change", v1, 2u);
}

@end