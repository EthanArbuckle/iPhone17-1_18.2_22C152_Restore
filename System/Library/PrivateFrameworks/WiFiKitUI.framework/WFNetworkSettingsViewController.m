@interface WFNetworkSettingsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAutoJoinConfigurable;
- (BOOL)_isChinaDevice;
- (BOOL)_isIPv4ConfigAuto;
- (BOOL)_shouldShowIPv6ForConfig:(id)a3;
- (BOOL)_shouldShowRandomConfigSwith;
- (BOOL)_showDemoModeFeatureDisabledAlert;
- (BOOL)_showRecommendationSupportLink;
- (BOOL)allowViewPassword;
- (BOOL)credentailCellTapped;
- (BOOL)detailViewControllerVisible;
- (BOOL)isAccessory;
- (BOOL)isDemoModeAlertShowing;
- (BOOL)isDeviceInDemoMode;
- (BOOL)isRandomMACManageFeatureEnabled;
- (BOOL)isRotatingTurnedOnForMigratedNetwork;
- (BOOL)isUsingRandomMac;
- (BOOL)networkQualitySpinning;
- (BOOL)randomFeatureEnabled;
- (BOOL)showManagedNetworkHeader;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (NSArray)autoJoinSectionRows;
- (NSArray)sections;
- (NSAttributedString)recommendationLinkAttributedString;
- (NSDate)networkQualityFooterDate;
- (NSString)hardwareMACAddress;
- (NSString)randomMACAddress;
- (UIAlertController)alert;
- (UIColor)backgroundColor;
- (UISwitch)autoJoinSwitch;
- (UISwitch)autoLoginSwitch;
- (UISwitch)privacyProxyEnabledSwitch;
- (UISwitch)randomMACSwitch;
- (UISwitch)saveDataModeSwitch;
- (UITableViewCell)networkQualityCell;
- (UIViewController)accessoryInfoController;
- (WFAppearanceProxy)appearanceProxy;
- (WFDetailsProviderContext)context;
- (WFHyperlinkFooterView)linkFooterView;
- (WFHyperlinkFooterView)networkQualityFooterView;
- (WFNetworkSettingsCellFactory)cellFactory;
- (WFNetworkSettingsConfig)config;
- (WFNetworkSettingsViewController)initWithConfig:(id)a3;
- (WFNetworkSettingsViewController)initWithConfig:(id)a3 detailsContext:(id)a4 hardwareMACAddress:(id)a5;
- (WFNetworkSettingsViewController)initWithConfig:(id)a3 detailsContext:(id)a4 hardwareMACAddress:(id)a5 appearanceProxy:(id)a6;
- (WFNetworkSettingsViewControllerDataCoordinator)dataCoordinator;
- (WFNetworkSettingsViewControllerDelegate)delegate;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (id)_WiFiModeFooterView;
- (id)_autoJoinRowsFromContext:(id)a3;
- (id)_detailFooterForMode:(unint64_t)a3;
- (id)_displayStringForDisableMode:(int64_t)a3;
- (id)_lowDataModeFooterView;
- (id)_macAddressToDisplay;
- (id)_outrankedFooterView;
- (id)_passcodePromptForViewingPasswords;
- (id)_portalURL;
- (id)_privacyProxyEnabledFooterView;
- (id)_randomAddressToDisplay;
- (id)_randomMACFooterTextToDisplay;
- (id)_randomMACFooterView;
- (id)_sectionsFromConfig:(id)a3 context:(id)a4;
- (id)_selectedPrivateModeForOption:(unint64_t)a3;
- (id)_stringForSettingsSection:(int64_t)a3;
- (id)_touchIDPromptForViewingPasswords;
- (id)_wifiPasswordContextOptions;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)_disableModeFromKey:(id)a3;
- (int64_t)_sectionTypeAtSection:(int64_t)a3;
- (int64_t)deviceCapability;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_selectedPrivateModeForString:(id)a3;
- (unint64_t)privateAddressMode;
- (unint64_t)scrollToCellType;
- (void)_applicationWillResignActive:(id)a3;
- (void)_autoJoinSwitchChanged:(id)a3;
- (void)_autoLoginSwitchChanged:(id)a3;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_didDismissDetailViewController;
- (void)_didStartPresentingDetailViewController;
- (void)_fillNetworkQualityCell:(id)a3;
- (void)_httpProxyAuthChanged:(id)a3;
- (void)_httpProxyConfigChanged:(int64_t)a3;
- (void)_logSections:(id)a3;
- (void)_networkQualityOpenURL;
- (void)_openNetworkQualityDetails:(id)a3;
- (void)_openRecommendationsLink:(id)a3;
- (void)_presentDetailViewController:(id)a3;
- (void)_presentRenewLeaseAlertWithSourceRect:(CGRect)a3;
- (void)_privacyProxyEnabledChanged:(BOOL)a3;
- (void)_privacyProxyEnabledSwitchChanged:(id)a3;
- (void)_promptForgetNetwork;
- (void)_promptOverrideWiFiOutrankedDev;
- (void)_promptOverrideWiFiOutrankedForPrivateCellular:(BOOL)a3;
- (void)_pushPrivateModeSelectionViewController;
- (void)_reloadNetworkQuality;
- (void)_runNetworkQuality;
- (void)_saveAutoJoinEnabledChanged:(BOOL)a3;
- (void)_saveAutoLoginEnabledChanged:(BOOL)a3;
- (void)_saveConfig:(id)a3;
- (void)_saveDataModeSwitchChanged:(id)a3;
- (void)_saveSaveDataModeChanged:(BOOL)a3;
- (void)_setupAccessoryHeader;
- (void)_updateManagedNetworkHeader;
- (void)_updatePrivateAddressMode:(unint64_t)a3;
- (void)_updateWiFiEMode:(int64_t)a3;
- (void)dealloc;
- (void)donePressed;
- (void)refreshConfig:(id)a3;
- (void)scrollToCell:(unint64_t)a3;
- (void)setAccessory:(BOOL)a3;
- (void)setAccessoryInfoController:(id)a3;
- (void)setAlert:(id)a3;
- (void)setAllowViewPassword:(BOOL)a3;
- (void)setAppearanceProxy:(id)a3;
- (void)setAutoJoinSectionRows:(id)a3;
- (void)setAutoJoinSwitch:(id)a3;
- (void)setAutoLoginSwitch:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCellFactory:(id)a3;
- (void)setConfig:(id)a3;
- (void)setContext:(id)a3;
- (void)setCredentailCellTapped:(BOOL)a3;
- (void)setDataCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailViewControllerVisible:(BOOL)a3;
- (void)setDeviceCapability:(int64_t)a3;
- (void)setHardwareMACAddress:(id)a3;
- (void)setIsDemoModeAlertShowing:(BOOL)a3;
- (void)setIsDeviceInDemoMode:(BOOL)a3;
- (void)setIsRandomMACManageFeatureEnabled:(BOOL)a3;
- (void)setIsRotatingTurnedOnForMigratedNetwork:(BOOL)a3;
- (void)setIsUsingRandomMac:(BOOL)a3;
- (void)setLinkFooterView:(id)a3;
- (void)setNetworkQualityCell:(id)a3;
- (void)setNetworkQualityFooterDate:(id)a3;
- (void)setNetworkQualityFooterView:(id)a3;
- (void)setNetworkQualitySpinning:(BOOL)a3;
- (void)setPrivacyProxyEnabledSwitch:(id)a3;
- (void)setPrivateAddressMode:(unint64_t)a3;
- (void)setRandomFeatureEnabled:(BOOL)a3;
- (void)setRandomMACAddress:(id)a3;
- (void)setRandomMACSwitch:(id)a3;
- (void)setRecommendationLinkAttributedString:(id)a3;
- (void)setSaveDataModeSwitch:(id)a3;
- (void)setScrollToCellType:(unint64_t)a3;
- (void)setSections:(id)a3;
- (void)setShowManagedNetworkHeader:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WFNetworkSettingsViewController

- (WFNetworkSettingsViewController)initWithConfig:(id)a3
{
  return [(WFNetworkSettingsViewController *)self initWithConfig:a3 detailsContext:0 hardwareMACAddress:0];
}

- (WFNetworkSettingsViewController)initWithConfig:(id)a3 detailsContext:(id)a4 hardwareMACAddress:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[WFAppearanceProxy defaultAppearanceProxy];
  v12 = [(WFNetworkSettingsViewController *)self initWithConfig:v10 detailsContext:v9 hardwareMACAddress:v8 appearanceProxy:v11];

  return v12;
}

- (WFNetworkSettingsViewController)initWithConfig:(id)a3 detailsContext:(id)a4 hardwareMACAddress:(id)a5 appearanceProxy:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v14
    && (v33.receiver = self,
        v33.super_class = (Class)WFNetworkSettingsViewController,
        v15 = -[WFNetworkSettingsViewController initWithStyle:](&v33, sel_initWithStyle_, [v13 tableViewStyle]), self = v15, v10)&& v15)
  {
    v16 = (WFNetworkSettingsConfig *)[v10 copy];
    config = self->_config;
    self->_config = v16;

    p_context = &self->_context;
    objc_storeStrong((id *)&self->_context, a4);
    objc_storeStrong((id *)&self->_hardwareMACAddress, a5);
    if (objc_opt_respondsToSelector()) {
      unint64_t v19 = [v11 privateAddressMode];
    }
    else {
      unint64_t v19 = 0;
    }
    self->_privateAddressMode = v19;
    v20 = [(WFDetailsProviderContext *)*p_context randomMACAddress];
    randomMACAddress = self->_randomMACAddress;
    self->_randomMACAddress = v20;

    self->_randomFeatureEnabled = ([v11 requestedFields] & 0x400) != 0;
    objc_storeStrong((id *)&self->_appearanceProxy, a6);
    self->_BOOL isDeviceInDemoMode = 0;
    self->_isRandomMACManageFeatureEnabled = _os_feature_enabled_impl();
    self->_isRotatingTurnedOnForMigratedNetwork = 0;
    if (objc_opt_respondsToSelector())
    {
      unint64_t v22 = [(WFDetailsProviderContext *)*p_context scrollToCellType];
      self->_scrollToCellType = v22;
      [(WFNetworkSettingsViewController *)self scrollToCell:v22];
    }
    if (objc_opt_class())
    {
      v23 = [MEMORY[0x263F55C30] sharedInstance];
      id v32 = 0;
      char v24 = [v23 isStoreDemoModeEnabled:&v32];
      v25 = v32;
      self->_BOOL isDeviceInDemoMode = v24;

      v26 = WFLogForCategory(0);
      os_log_type_t v27 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v26 && os_log_type_enabled(v26, v27))
      {
        BOOL isDeviceInDemoMode = self->_isDeviceInDemoMode;
        *(_DWORD *)buf = 136315394;
        v35 = "-[WFNetworkSettingsViewController initWithConfig:detailsContext:hardwareMACAddress:appearanceProxy:]";
        __int16 v36 = 1024;
        BOOL v37 = isDeviceInDemoMode;
        _os_log_impl(&dword_2257EC000, v26, v27, "%s INIT : Device in demo mode ? [%hhu]", buf, 0x12u);
      }
    }
    else
    {
      v25 = WFLogForCategory(0);
      os_log_type_t v31 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v31))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[WFNetworkSettingsViewController initWithConfig:detailsContext:hardwareMACAddress:appearanceProxy:]";
        _os_log_impl(&dword_2257EC000, v25, v31, "%s: INIT : runtime check failed for MSDKDemoState ", buf, 0xCu);
      }
    }

    if (objc_opt_respondsToSelector()) {
      self->_allowViewPassword = [v11 isCredentialsVisible];
    }
    if (objc_opt_respondsToSelector())
    {
      v29 = [v11 daDevice];
      self->_accessory = v29 != 0;
    }
    self->_credentailCellTapped = 0;
    self->_detailViewControllerVisible = 0;
  }
  else
  {

    self = 0;
  }

  return self;
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)WFNetworkSettingsViewController;
  [(WFNetworkSettingsViewController *)&v26 viewDidLoad];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x263F83428] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__applicationWillResignActive_ name:*MEMORY[0x263F833C0] object:0];

  v5 = [(WFNetworkSettingsViewController *)self backgroundColor];

  if (v5)
  {
    v6 = [(WFNetworkSettingsViewController *)self backgroundColor];
    v7 = [(WFNetworkSettingsViewController *)self tableView];
    [v7 setBackgroundColor:v6];
  }
  id v8 = [(WFNetworkSettingsViewController *)self context];
  id v9 = [(WFNetworkSettingsViewController *)self _autoJoinRowsFromContext:v8];
  [(WFNetworkSettingsViewController *)self setAutoJoinSectionRows:v9];

  id v10 = [(WFNetworkSettingsViewController *)self config];
  id v11 = [(WFNetworkSettingsViewController *)self context];
  id v12 = [(WFNetworkSettingsViewController *)self _sectionsFromConfig:v10 context:v11];
  [(WFNetworkSettingsViewController *)self setSections:v12];

  id v13 = [(WFNetworkSettingsViewController *)self sections];
  [(WFNetworkSettingsViewController *)self _logSections:v13];

  v14 = [WFNetworkSettingsCellFactory alloc];
  v15 = [(WFNetworkSettingsViewController *)self tableView];
  v16 = [(WFNetworkSettingsCellFactory *)v14 initWithTableView:v15];
  [(WFNetworkSettingsViewController *)self setCellFactory:v16];

  v17 = [(WFNetworkSettingsViewController *)self config];
  v18 = [v17 displayFriendlyName];
  [(WFNetworkSettingsViewController *)self setTitle:v18];

  if ([MEMORY[0x263F82670] currentIsIPad])
  {
    unint64_t v19 = [(WFNetworkSettingsViewController *)self tableView];
    objc_msgSend(v19, "_setSectionContentInset:", 0.0, 20.0, 0.0, 20.0);
  }
  double v20 = *MEMORY[0x263F839B8];
  v21 = [(WFNetworkSettingsViewController *)self tableView];
  [v21 setRowHeight:v20];

  unint64_t v22 = [(WFNetworkSettingsViewController *)self tableView];
  [v22 setEstimatedRowHeight:v20];

  v23 = [(WFNetworkSettingsViewController *)self tableView];
  [v23 setSectionFooterHeight:v20];

  char v24 = [(WFNetworkSettingsViewController *)self tableView];
  [v24 setEstimatedSectionHeaderHeight:0.0];

  v25 = [(WFNetworkSettingsViewController *)self tableView];
  [v25 setEstimatedSectionFooterHeight:v20];

  [(WFNetworkSettingsViewController *)self _updateManagedNetworkHeader];
  if (_os_feature_enabled_impl()) {
    [(WFNetworkSettingsViewController *)self _setupAccessoryHeader];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WFNetworkSettingsViewController;
  [(WFNetworkSettingsViewController *)&v4 dealloc];
}

- (void)refreshConfig:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(WFNetworkSettingsConfig *)self->_config isEqual:v4];
  if (!v4 || v5)
  {
    v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v14 && os_log_type_enabled(v14, v15))
    {
      int v16 = 136315138;
      v17 = "-[WFNetworkSettingsViewController refreshConfig:]";
      _os_log_impl(&dword_2257EC000, v14, v15, "%s- config was unchanged.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v6 = (void *)[v4 copy];
    [(WFNetworkSettingsViewController *)self setConfig:v6];

    v7 = [(WFNetworkSettingsViewController *)self config];
    id v8 = [(WFNetworkSettingsViewController *)self context];
    id v9 = [(WFNetworkSettingsViewController *)self _sectionsFromConfig:v7 context:v8];
    [(WFNetworkSettingsViewController *)self setSections:v9];

    id v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, v11))
    {
      config = self->_config;
      int v16 = 138412290;
      v17 = (const char *)config;
      _os_log_impl(&dword_2257EC000, v10, v11, "Refreshed settings config %@", (uint8_t *)&v16, 0xCu);
    }

    id v13 = [(WFNetworkSettingsViewController *)self sections];
    [(WFNetworkSettingsViewController *)self _logSections:v13];

    v14 = [(WFNetworkSettingsViewController *)self tableView];
    [v14 reloadData];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(WFNetworkSettingsViewController *)self alert];

  if (v5)
  {
    v6 = [(WFNetworkSettingsViewController *)self alert];
    [v6 dismissViewControllerAnimated:0 completion:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)WFNetworkSettingsViewController;
  [(WFNetworkSettingsViewController *)&v8 viewWillDisappear:v3];
  if ([(WFNetworkSettingsViewController *)self networkQualitySpinning])
  {
    [(WFNetworkSettingsViewController *)self setNetworkQualitySpinning:0];
    v7 = [(WFNetworkSettingsViewController *)self context];
    [v7 cancelNetworkQualityRun];
  }
}

- (id)_autoJoinRowsFromContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263EFF980] array];
  v6 = [(WFNetworkSettingsViewController *)self config];
  int v7 = [v6 autoJoinConfigurable];

  if (v7) {
    [v5 addObject:&unk_26D911E90];
  }
  objc_super v8 = [(WFNetworkSettingsViewController *)self config];
  int v9 = [v8 autoLoginConfigurable];

  if (v9) {
    [v5 addObject:&unk_26D911EA8];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![(WFNetworkSettingsViewController *)self isAccessory])
  {
    id v10 = [v4 username];
    uint64_t v11 = [v10 length];

    if (v11) {
      [v5 addObject:&unk_26D911EC0];
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![(WFNetworkSettingsViewController *)self isAccessory])
  {
    id v12 = [v4 password];
    uint64_t v13 = [v12 length];

    if (v13) {
      [v5 addObject:&unk_26D911ED8];
    }
  }

  return v5;
}

- (id)_sectionsFromConfig:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [MEMORY[0x263EFF980] array];
  if (![(WFNetworkSettingsViewController *)self isAccessory])
  {
    int v9 = [v6 healthRecommendations];
    uint64_t v10 = [v9 count];

    if (v10) {
      [v8 addObject:&unk_26D911E90];
    }
    uint64_t v11 = [(WFNetworkSettingsViewController *)self _portalURL];

    if (v11) {
      [v8 addObject:&unk_26D911EA8];
    }
  }
  if ([v6 diagnosable]) {
    [v8 addObject:&unk_26D911EF0];
  }
  if (([v7 requestedFields] & 0x1000) != 0 || (objc_msgSend(v7, "requestedFields") & 0x4000) != 0) {
    [v8 addObject:&unk_26D911F08];
  }
  if ([v6 joinable]) {
    [v8 addObject:&unk_26D911EC0];
  }
  if ([v6 forgetable]) {
    [v8 addObject:&unk_26D911F20];
  }
  if (![(WFNetworkSettingsViewController *)self isAccessory])
  {
    id v12 = [(WFNetworkSettingsViewController *)self autoJoinSectionRows];
    uint64_t v13 = [v12 count];

    if (v13) {
      [v8 addObject:&unk_26D911ED8];
    }
    if ([v6 saveDataModeConfigurable]) {
      [v8 addObject:&unk_26D911F38];
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v7 isWifiModeConfigurable]) {
      [v8 addObject:&unk_26D911F50];
    }
    if (self->_randomFeatureEnabled) {
      [v8 addObject:&unk_26D911F68];
    }
    if ([v6 privacyProxyTierStatus]) {
      [v8 addObject:&unk_26D911F80];
    }
    if ([v6 networkQualityVisible])
    {
      if (![(WFNetworkSettingsViewController *)self _isChinaDevice])
      {
        [v6 networkQualityResponsiveness];
        if (v14 != 0.0
          || ([(WFNetworkSettingsViewController *)self context],
              os_log_type_t v15 = objc_claimAutoreleasedReturnValue(),
              int v16 = [v15 isCurrent],
              v15,
              v16))
        {
          [v8 addObject:&unk_26D911F98];
        }
      }
    }
  }
  [v8 addObject:&unk_26D911FB0];
  if ([(WFNetworkSettingsViewController *)self _shouldShowIPv6ForConfig:v6]) {
    [v8 addObject:&unk_26D911FC8];
  }
  [v8 addObject:&unk_26D911FE0];
  if ([v6 httpProxyConfigurable]) {
    [v8 addObject:&unk_26D911FF8];
  }
  if ([v6 manageable]) {
    [v8 addObject:&unk_26D912010];
  }

  return v8;
}

- (void)_httpProxyConfigChanged:(int64_t)a3
{
  v60[1] = *MEMORY[0x263EF8340];
  BOOL v5 = [(WFNetworkSettingsViewController *)self config];
  uint64_t v6 = [v5 httpProxyConfig];

  if (v6 != a3)
  {
    id v7 = [(WFNetworkSettingsViewController *)self config];
    uint64_t v8 = [v7 httpProxyConfig];

    int v9 = [(WFNetworkSettingsViewController *)self config];
    int v10 = [v9 httpProxyAuthenticationRequired];

    uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
    [v11 setHttpProxyConfig:a3];

    if (a3 != 1 && v10)
    {
      id v12 = [(WFNetworkSettingsViewController *)self config];
      [v12 setHttpProxyAuthenticationRequired:0];
    }
    uint64_t v13 = [(WFNetworkSettingsViewController *)self sections];
    uint64_t v14 = [v13 indexOfObject:&unk_26D911FF8];

    if (a3 == 2)
    {
      if (v8 == 1)
      {
        v41 = [(WFNetworkSettingsViewController *)self tableView];
        [v41 beginUpdates];

        v42 = [(WFNetworkSettingsViewController *)self tableView];
        v43 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:v14];
        v56[0] = v43;
        v44 = [MEMORY[0x263F088C8] indexPathForRow:3 inSection:v14];
        v56[1] = v44;
        v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
        [v42 deleteRowsAtIndexPaths:v45 withRowAnimation:0];

        if (v10)
        {
          v46 = [(WFNetworkSettingsViewController *)self tableView];
          v47 = [MEMORY[0x263F088C8] indexPathForRow:4 inSection:v14];
          v55[0] = v47;
          v48 = [MEMORY[0x263F088C8] indexPathForRow:5 inSection:v14];
          v55[1] = v48;
          v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
          [v46 deleteRowsAtIndexPaths:v49 withRowAnimation:0];
        }
        v50 = [(WFNetworkSettingsViewController *)self tableView];
        [v50 endUpdates];

        os_log_type_t v15 = [(WFNetworkSettingsViewController *)self tableView];
        int v16 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:v14];
        v54 = v16;
        v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
        [v15 reloadRowsAtIndexPaths:v17 withRowAnimation:0];
        goto LABEL_24;
      }
      if (v8)
      {
LABEL_26:
        v51 = [(WFNetworkSettingsViewController *)self config];
        [v51 setHttpProxyConfig:a3];

        v52 = [(WFNetworkSettingsViewController *)self tableView];
        v53 = [MEMORY[0x263F088D0] indexSetWithIndex:v14];
        [v52 reloadSections:v53 withRowAnimation:5];

        return;
      }
      uint64_t v18 = [(WFNetworkSettingsViewController *)self tableView];
      unint64_t v19 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:v14];
      v57 = v19;
      double v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
      [v18 insertRowsAtIndexPaths:v20 withRowAnimation:0];

      os_log_type_t v15 = [(WFNetworkSettingsViewController *)self tableView];
      v21 = (void *)MEMORY[0x263F088C8];
      uint64_t v22 = 1;
    }
    else
    {
      if (a3 != 1)
      {
        if (!a3)
        {
          if (v8 == 1)
          {
            objc_super v33 = (void *)MEMORY[0x263EFF980];
            v34 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:v14];
            v35 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:v14];
            __int16 v36 = [MEMORY[0x263F088C8] indexPathForRow:3 inSection:v14];
            BOOL v37 = objc_msgSend(v33, "arrayWithObjects:", v34, v35, v36, 0);

            if (v10)
            {
              uint64_t v38 = [MEMORY[0x263F088C8] indexPathForRow:4 inSection:v14];
              [v37 addObject:v38];

              v39 = [MEMORY[0x263F088C8] indexPathForRow:5 inSection:v14];
              [v37 addObject:v39];
            }
            v40 = [(WFNetworkSettingsViewController *)self tableView];
            [v40 deleteRowsAtIndexPaths:v37 withRowAnimation:0];

            goto LABEL_26;
          }
          if (v8 == 2)
          {
            os_log_type_t v15 = [(WFNetworkSettingsViewController *)self tableView];
            int v16 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:v14];
            v60[0] = v16;
            v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:1];
            [v15 deleteRowsAtIndexPaths:v17 withRowAnimation:0];
LABEL_24:

            goto LABEL_25;
          }
        }
        goto LABEL_26;
      }
      v23 = [(WFNetworkSettingsViewController *)self tableView];
      [v23 beginUpdates];

      if (v8 == 2)
      {
        char v24 = [(WFNetworkSettingsViewController *)self tableView];
        v25 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:v14];
        v59 = v25;
        objc_super v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
        [v24 deleteRowsAtIndexPaths:v26 withRowAnimation:0];
      }
      os_log_type_t v27 = [(WFNetworkSettingsViewController *)self tableView];
      v28 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:v14];
      v58[0] = v28;
      v29 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:v14];
      v58[1] = v29;
      v30 = [MEMORY[0x263F088C8] indexPathForRow:3 inSection:v14];
      v58[2] = v30;
      os_log_type_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:3];
      [v27 insertRowsAtIndexPaths:v31 withRowAnimation:0];

      id v32 = [(WFNetworkSettingsViewController *)self tableView];
      [v32 endUpdates];

      os_log_type_t v15 = [(WFNetworkSettingsViewController *)self tableView];
      v21 = (void *)MEMORY[0x263F088C8];
      uint64_t v22 = 3;
    }
    int v16 = [v21 indexPathForRow:v22 inSection:v14];
    [v15 scrollToRowAtIndexPath:v16 atScrollPosition:3 animated:1];
LABEL_25:

    goto LABEL_26;
  }
}

- (void)_httpProxyAuthChanged:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 isOn];
  uint64_t v6 = [(WFNetworkSettingsViewController *)self config];
  [v6 setHttpProxyAuthenticationRequired:v5];

  id v7 = [(WFNetworkSettingsViewController *)self sections];
  uint64_t v8 = [v7 indexOfObject:&unk_26D911FF8];

  int v9 = [v4 isOn];
  int v10 = [(WFNetworkSettingsViewController *)self tableView];
  uint64_t v11 = [MEMORY[0x263F088C8] indexPathForRow:4 inSection:v8];
  id v12 = (void *)v11;
  if (v9)
  {
    v18[0] = v11;
    uint64_t v13 = [MEMORY[0x263F088C8] indexPathForRow:5 inSection:v8];
    v18[1] = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    [v10 insertRowsAtIndexPaths:v14 withRowAnimation:0];

    int v10 = [(WFNetworkSettingsViewController *)self tableView];
    id v12 = [MEMORY[0x263F088C8] indexPathForRow:5 inSection:v8];
    [v10 scrollToRowAtIndexPath:v12 atScrollPosition:3 animated:1];
  }
  else
  {
    v17[0] = v11;
    os_log_type_t v15 = [MEMORY[0x263F088C8] indexPathForRow:5 inSection:v8];
    v17[1] = v15;
    int v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    [v10 deleteRowsAtIndexPaths:v16 withRowAnimation:0];
  }
}

- (void)_promptForgetNetwork
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if ([(WFNetworkSettingsViewController *)self isAccessory])
  {
    v35 = @"kWFLocSettingForgetDeviceTitle";
  }
  else
  {
    BOOL v3 = [(WFNetworkSettingsViewController *)self _isChinaDevice];
    id v4 = @"kWFLocForgetNetworkTitle";
    if (v3) {
      id v4 = @"kWFLocForgetNetworkTitleCH";
    }
    v35 = v4;
  }
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v34 = [v5 localizedStringForKey:v35 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  uint64_t v6 = NSString;
  id v7 = [(WFNetworkSettingsViewController *)self config];
  uint64_t v8 = [v7 displayFriendlyName];
  int v9 = objc_msgSend(v6, "stringWithFormat:", v34, v8);

  if ([(WFNetworkSettingsViewController *)self isAccessory])
  {
    int v10 = @"kWFLocForgetDeviceMessage";
  }
  else
  {
    uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
    int v12 = [v11 cloudSyncable];
    uint64_t v13 = @"kWFLocForgetNetworkMessage";
    if (v12) {
      uint64_t v13 = @"kWFLocForgetNetworkSyncedMessage";
    }
    int v10 = v13;

    if ([(WFNetworkSettingsViewController *)self _isChinaDevice])
    {
      uint64_t v14 = [(__CFString *)v10 stringByAppendingString:@"_CH"];

      int v10 = (__CFString *)v14;
    }
  }
  os_log_type_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v16 = [v15 localizedStringForKey:v10 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  if ([(WFNetworkSettingsViewController *)self isAccessory])
  {
    v17 = [MEMORY[0x263EFAC08] forgetDeviceAlertTitle];

    uint64_t v18 = [MEMORY[0x263EFAC08] forgetDeviceAlertBody];

    unint64_t v19 = WFLogForCategory(0);
    os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v19 && os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v17;
      __int16 v42 = 2112;
      v43 = v18;
      _os_log_impl(&dword_2257EC000, v19, v20, "Replacing alert title with: %@, replacing alert message text with: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v18 = v16;
    v17 = v9;
  }
  v21 = [MEMORY[0x263F82418] alertControllerWithTitle:v17 message:v18 preferredStyle:1];
  uint64_t v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"kWFLocForgetNetworkForgetButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  char v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"kWFLocForgetNetworkCancelButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  if ([(WFNetworkSettingsViewController *)self isAccessory])
  {
    objc_super v26 = [MEMORY[0x263EFAC08] forgetDeviceAlertConfirm];

    os_log_type_t v27 = [MEMORY[0x263EFAC08] forgetDeviceAlertCancel];

    v28 = WFLogForCategory(0);
    os_log_type_t v29 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v28 && os_log_type_enabled(v28, v29))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v26;
      __int16 v42 = 2112;
      v43 = v27;
      _os_log_impl(&dword_2257EC000, v28, v29, "Replacing confirm title with: %@, replacing cancel text with: %@", buf, 0x16u);
    }
  }
  else
  {
    objc_super v26 = v23;
    os_log_type_t v27 = v25;
  }
  objc_initWeak((id *)buf, self);
  v30 = (void *)MEMORY[0x263F82400];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __55__WFNetworkSettingsViewController__promptForgetNetwork__block_invoke;
  v38[3] = &unk_264756A90;
  objc_copyWeak(&v39, (id *)buf);
  v38[4] = self;
  os_log_type_t v31 = [v30 actionWithTitle:v26 style:2 handler:v38];
  [v21 addAction:v31];

  id v32 = (void *)MEMORY[0x263F82400];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __55__WFNetworkSettingsViewController__promptForgetNetwork__block_invoke_2;
  v36[3] = &unk_2647564B0;
  objc_copyWeak(&v37, (id *)buf);
  objc_super v33 = [v32 actionWithTitle:v27 style:1 handler:v36];
  [v21 addAction:v33];

  [(WFNetworkSettingsViewController *)self setAlert:v21];
  [(WFNetworkSettingsViewController *)self presentViewController:v21 animated:1 completion:0];
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);
}

void __55__WFNetworkSettingsViewController__promptForgetNetwork__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained context];

  if (v2)
  {
    BOOL v3 = [WeakRetained context];
    [v3 forget];
  }
  else
  {
    BOOL v3 = [WeakRetained delegate];
    [v3 networkSettingsViewControllerDidForgetNetwork:*(void *)(a1 + 32)];
  }

  [WeakRetained setAlert:0];
}

void __55__WFNetworkSettingsViewController__promptForgetNetwork__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlert:0];
}

- (BOOL)_showDemoModeFeatureDisabledAlert
{
  if (!self->_isDemoModeAlertShowing)
  {
    self->_isDemoModeAlertShowing = 1;
    BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"kWFLocRandomMACDeviceInDemoAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"kWFLocRandomMACDeviceInDemoAlertBody" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v7 = [MEMORY[0x263F82418] alertControllerWithTitle:v4 message:v6 preferredStyle:1];
    objc_initWeak(&location, self);
    uint64_t v8 = (void *)MEMORY[0x263F82400];
    int v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v10 = [v9 localizedStringForKey:@"kWFLocRandomMACDeviceInDemoAlertButtonOk" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__WFNetworkSettingsViewController__showDemoModeFeatureDisabledAlert__block_invoke;
    v13[3] = &unk_264756A90;
    objc_copyWeak(&v14, &location);
    v13[4] = self;
    uint64_t v11 = [v8 actionWithTitle:v10 style:0 handler:v13];
    [v7 addAction:v11];

    [(WFNetworkSettingsViewController *)self setAlert:v7];
    [(WFNetworkSettingsViewController *)self presentViewController:v7 animated:1 completion:0];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return 1;
}

void __68__WFNetworkSettingsViewController__showDemoModeFeatureDisabledAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 1088) = 0;
  [WeakRetained setAlert:0];
}

- (void)_promptOverrideWiFiOutrankedForPrivateCellular:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __82__WFNetworkSettingsViewController__promptOverrideWiFiOutrankedForPrivateCellular___block_invoke;
  id v14 = &unk_264756AB8;
  objc_copyWeak(&v15, &location);
  uint64_t v5 = _Block_copy(&v11);
  uint64_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[WFNetworkSettingsViewController _promptOverrideWiFiOutrankedForPrivateCellular:]";
    _os_log_impl(&dword_2257EC000, v6, v7, "%s: showing cellular outrank prompt", buf, 0xCu);
  }

  uint64_t v8 = [(WFNetworkSettingsViewController *)self config];
  int v9 = [v8 displayFriendlyName];
  int v10 = +[WFCellularOutrankAlertController cellularOutrankAlertControllerWithNetworkName:v9 chinaDevice:[(WFNetworkSettingsViewController *)self _isChinaDevice] privateCellular:v3 completionHandler:v5];

  [(WFNetworkSettingsViewController *)self setAlert:v10];
  [(WFNetworkSettingsViewController *)self presentViewController:v10 animated:1 completion:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __82__WFNetworkSettingsViewController__promptOverrideWiFiOutrankedForPrivateCellular___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  BOOL v7 = (unint64_t)WFCurrentLogLevel() > 2 && v4 != 0;
  if (a2)
  {
    if (v7 && os_log_type_enabled(v4, v5))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2257EC000, v4, v5, "User accepted celluar outrank prompt", buf, 2u);
    }

    uint64_t v8 = [WeakRetained context];
    [v8 overrideWiFiOutrank];

    int v9 = [WeakRetained config];
    int v10 = [WeakRetained context];
    uint64_t v11 = [WeakRetained _sectionsFromConfig:v9 context:v10];
    [WeakRetained setSections:v11];

    uint64_t v12 = [WeakRetained sections];
    [WeakRetained _logSections:v12];

    id v4 = [WeakRetained tableView];
    [v4 reloadData];
  }
  else if (v7 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_2257EC000, v4, v5, "User declined celluar outrank prompt", v13, 2u);
  }

  [WeakRetained setAlert:0];
}

- (void)_promptOverrideWiFiOutrankedDev
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v8 = 136315138;
    int v9 = "-[WFNetworkSettingsViewController _promptOverrideWiFiOutrankedDev]";
    _os_log_impl(&dword_2257EC000, v3, v4, "%s: showing developer outrank prompt", (uint8_t *)&v8, 0xCu);
  }

  os_log_type_t v5 = [(WFNetworkSettingsViewController *)self config];
  uint64_t v6 = [v5 displayFriendlyName];
  BOOL v7 = +[WFDeveloperOutrankAlertController developerOutrankAlertControllerWithNetworkName:v6 chinaDevice:[(WFNetworkSettingsViewController *)self _isChinaDevice] completionHandler:&__block_literal_global_5];

  [(WFNetworkSettingsViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __66__WFNetworkSettingsViewController__promptOverrideWiFiOutrankedDev__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v5 = [MEMORY[0x263F5FCE8] sharedManager];
    v2 = [NSURL URLWithString:@"prefs:root=DEVELOPER_SETTINGS&path=NCO"];
    [v5 processURL:v2 animated:1 fromSearch:0 withCompletion:&__block_literal_global_125];
  }
  else
  {
    BOOL v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2257EC000, v3, v4, "User bypassed option to go to developer settings", buf, 2u);
    }
  }
}

void __66__WFNetworkSettingsViewController__promptOverrideWiFiOutrankedDev__block_invoke_2()
{
  v0 = WFLogForCategory(0);
  os_log_type_t v1 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v0 && os_log_type_enabled(v0, v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2257EC000, v0, v1, "User taken to developer settings", v2, 2u);
  }
}

- (BOOL)_isIPv4ConfigAuto
{
  BOOL v3 = [(WFNetworkSettingsViewController *)self config];
  if ([v3 ipv4Config])
  {
    os_log_type_t v4 = [(WFNetworkSettingsViewController *)self config];
    BOOL v5 = [v4 ipv4Config] == 1;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v3 = [(WFNetworkSettingsViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = 1;
  switch([(WFNetworkSettingsViewController *)self _sectionTypeAtSection:a4])
  {
    case 0:
      BOOL v7 = [(WFNetworkSettingsViewController *)self config];
      int v8 = [v7 healthRecommendations];
      int64_t v5 = [v8 count];

      goto LABEL_6;
    case 1:
      return 2;
    case 2:
    case 4:
    case 6:
    case 8:
    case 10:
    case 12:
    case 14:
    case 16:
    case 17:
      return 1;
    case 3:
      BOOL v7 = [(WFNetworkSettingsViewController *)self autoJoinSectionRows];
      int64_t v5 = [v7 count];
LABEL_6:

      return v5;
    case 5:
      int v9 = [(WFNetworkSettingsViewController *)self config];
      int v10 = [v9 current];

      uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
      uint64_t v12 = [v11 ipv4Config];
      if (v10)
      {
        if (v12)
        {
LABEL_9:

          return 4;
        }
        v21 = [(WFNetworkSettingsViewController *)self config];
        uint64_t v22 = [v21 dhcpClientID];
        if (!v22)
        {

          goto LABEL_9;
        }
        v23 = (void *)v22;
        char v24 = [(WFNetworkSettingsViewController *)self config];
        v25 = [v24 dhcpClientID];
        uint64_t v26 = [v25 length];

        if (v26) {
          return 5;
        }
        else {
          return 4;
        }
      }
      else
      {
        if (v12 == 2) {
          int64_t v5 = 4;
        }
        else {
          int64_t v5 = 1;
        }
      }
      return v5;
    case 7:
      uint64_t v13 = [(WFNetworkSettingsViewController *)self config];
      BOOL v14 = [(WFNetworkSettingsViewController *)self _shouldShowIPv6ForConfig:v13];

      if (v14) {
        return 2;
      }
      else {
        return 0;
      }
    case 9:
      return v5;
    case 11:
      id v15 = [(WFNetworkSettingsViewController *)self config];
      LODWORD(v5) = [v15 saveDataModeConfigurable];

      return v5;
    case 13:
      int v16 = [(WFNetworkSettingsViewController *)self config];
      if ([v16 networkQualityVisible]
        && ![(WFNetworkSettingsViewController *)self _isChinaDevice])
      {
        uint64_t v19 = [(WFNetworkSettingsViewController *)self config];
        [v19 networkQualityResponsiveness];
        if (v20 == 0.0)
        {
          os_log_type_t v27 = [(WFNetworkSettingsViewController *)self context];
          char v28 = [v27 isCurrent];

          if ((v28 & 1) == 0) {
            goto LABEL_17;
          }
        }
        else
        {
        }
        return 1;
      }

LABEL_17:
      v17 = WFLogForCategory(0);
      os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
      {
        *(_WORD *)os_log_type_t v29 = 0;
        _os_log_impl(&dword_2257EC000, v17, v18, "NetQuality: WFNetworkSettingsNetworkQuality set but it shouldn't", v29, 2u);
      }

      return 0;
    case 15:
      if (!self->_randomFeatureEnabled) {
        return 0;
      }
      return 2;
    default:
      return 0;
  }
}

- (void)_reloadNetworkQuality
{
  BOOL v3 = [(WFNetworkSettingsViewController *)self sections];
  uint64_t v4 = [v3 indexOfObject:&unk_26D911F98];

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(WFNetworkSettingsViewController *)self tableView];
    int64_t v5 = [MEMORY[0x263F088D0] indexSetWithIndex:v4];
    [v6 reloadSections:v5 withRowAnimation:5];
  }
}

- (void)_runNetworkQuality
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v17 = [(WFNetworkSettingsViewController *)self config];
  if ([v17 current])
  {
    BOOL v3 = [(WFNetworkSettingsViewController *)self networkQualitySpinning];

    if (!v3)
    {
      uint64_t v4 = WFLogForCategory(0);
      os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
      {
        *(_DWORD *)buf = 136315138;
        double v20 = "-[WFNetworkSettingsViewController _runNetworkQuality]";
        _os_log_impl(&dword_2257EC000, v4, v5, "NetQuality: %s: User scheduled a run", buf, 0xCu);
      }

      id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v7 = [v6 localizedStringForKey:@"kWFLocSettingNetworkQualityAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v9 = [v8 localizedStringForKey:@"kWFLocSettingNetworkQualityAlertText" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      int v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v10 localizedStringForKey:@"kWFLocSettingNetworkQualityAlertContinue" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"kWFLocSettingNetworkQualityAlertCancel" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      BOOL v14 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v9 preferredStyle:1];
      id v15 = [MEMORY[0x263F82400] actionWithTitle:v13 style:1 handler:&__block_literal_global_140];
      [v14 addAction:v15];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_141;
      void v18[3] = &unk_264756658;
      v18[4] = self;
      int v16 = [MEMORY[0x263F82400] actionWithTitle:v11 style:0 handler:v18];
      [v14 addAction:v16];
      [v14 setPreferredAction:v16];
      [(WFNetworkSettingsViewController *)self presentViewController:v14 animated:1 completion:0];
    }
  }
  else
  {
  }
}

void __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = WFLogForCategory(0);
  os_log_type_t v1 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v0 && os_log_type_enabled(v0, v1))
  {
    int v2 = 136315138;
    BOOL v3 = "-[WFNetworkSettingsViewController _runNetworkQuality]_block_invoke";
    _os_log_impl(&dword_2257EC000, v0, v1, "NetQuality: %s: User canceled test-run", (uint8_t *)&v2, 0xCu);
  }
}

void __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_141(uint64_t a1)
{
  [*(id *)(a1 + 32) setNetworkQualitySpinning:1];
  [*(id *)(a1 + 32) _reloadNetworkQuality];
  int v2 = [*(id *)(a1 + 32) context];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_2;
  v3[3] = &unk_264756630;
  v3[4] = *(void *)(a1 + 32);
  [v2 runNetworkQualityWithCompletionHandler:v3];
}

void __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_2(uint64_t a1, int a2, void *a3, double a4)
{
  char v4 = a2;
  if (a2)
  {
    BOOL v7 = *(void **)(a1 + 32);
    id v8 = a3;
    int v9 = [v7 config];
    [v9 setNetworkQualityResponsiveness:a4];

    int v10 = [*(id *)(a1 + 32) config];
    [v10 setNetworkQualityDate:v8];
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_3;
  v11[3] = &unk_264756608;
  char v12 = v4;
  v11[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

uint64_t __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40) && [*(id *)(a1 + 32) networkQualitySpinning])
  {
    int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v3 = [v2 localizedStringForKey:@"kWFLocSettingNetworkQualityFailureTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    char v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    os_log_type_t v5 = [v4 localizedStringForKey:@"kWFLocSettingNetworkQualityFailureText" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v7 = [v6 localizedStringForKey:@"kWFLocSettingNetworkQualityFailureOK" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v8 = [MEMORY[0x263F82418] alertControllerWithTitle:v3 message:v5 preferredStyle:1];
    int v9 = [MEMORY[0x263F82400] actionWithTitle:v7 style:0 handler:0];
    [v8 addAction:v9];
    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
  }
  [*(id *)(a1 + 32) setNetworkQualitySpinning:0];
  int v10 = *(void **)(a1 + 32);
  return [v10 _reloadNetworkQuality];
}

- (void)_fillNetworkQualityCell:(id)a3
{
  id v4 = a3;
  if ([(WFNetworkSettingsViewController *)self networkQualitySpinning])
  {
    id v26 = (id)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v4 setAccessoryView:v26];

    [v26 startAnimating];
    goto LABEL_15;
  }
  os_log_type_t v5 = [(WFNetworkSettingsViewController *)self config];
  [v5 networkQualityResponsiveness];
  double v7 = v6;

  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v9 = v8;
  if (v7 != 0.0)
  {
    int v10 = [v8 localizedStringForKey:@"kWFLocSettingNetworkQualityRPM" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    uint64_t v11 = (void *)MEMORY[0x263F8C648];
    char v12 = [(WFNetworkSettingsViewController *)self config];
    [v12 networkQualityResponsiveness];
    uint64_t v14 = [v11 ratingForResponsivenessScore:(uint64_t)v13];

    if (v14 == 2)
    {
      id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v16 = v15;
      id v17 = @"kWFLocSettingNetworkQualityHigh";
    }
    else if (v14 == 1)
    {
      id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v16 = v15;
      id v17 = @"kWFLocSettingNetworkQualityMedium";
    }
    else
    {
      if (v14)
      {
        os_log_type_t v18 = 0;
        goto LABEL_13;
      }
      id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v16 = v15;
      id v17 = @"kWFLocSettingNetworkQualityLow";
    }
    os_log_type_t v18 = [v15 localizedStringForKey:v17 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

LABEL_13:
    uint64_t v19 = NSString;
    double v20 = [(WFNetworkSettingsViewController *)self config];
    [v20 networkQualityResponsiveness];
    id v26 = [v19 stringWithFormat:@"%@ (%u %@)", v18, v21, v10];

    goto LABEL_14;
  }
  id v26 = [v8 localizedStringForKey:@"kWFLocSettingNetworkQualityNoData" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  int v10 = v9;
LABEL_14:

  uint64_t v22 = [MEMORY[0x263F824E8] buttonWithType:1];
  [v22 setTitle:v26 forState:0];
  [v4 setAccessoryView:v22];
  v23 = [v4 textLabel];

  char v24 = [v23 font];
  v25 = [v22 titleLabel];
  [v25 setFont:v24];

  [v22 sizeToFit];
  [v22 addTarget:self action:sel__runNetworkQuality forControlEvents:64];

LABEL_15:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v160 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 row];
  switch(-[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", [v5 section]))
  {
    case 0:
      double v7 = [(WFNetworkSettingsViewController *)self cellFactory];
      id v8 = [v7 recommendationCellAtIndexPath:v5];

      int v9 = [(WFNetworkSettingsViewController *)self config];
      int v10 = [v9 healthRecommendations];
      uint64_t v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v5, "row"));

      char v12 = [v11 issueTitle];
      double v13 = [v8 titleLabel];
      [v13 setText:v12];

      uint64_t v14 = [v8 titleLabel];
      id v15 = [MEMORY[0x263F825C8] defaultTextColor];
      [v14 setTextColor:v15];

      int v16 = [v11 issueDetailText];
      id v17 = [v8 descriptionLabel];
      [v17 setText:v16];

      os_log_type_t v18 = [v8 descriptionLabel];
      uint64_t v19 = [MEMORY[0x263F825C8] altTextColor];
      [v18 setTextColor:v19];
      goto LABEL_115;
    case 1:
      if (v6 == 1)
      {
        v97 = [(WFNetworkSettingsViewController *)self cellFactory];
        id v8 = objc_msgSend(v97, "forgetCellAtIndexPath:accessory:", v5, -[WFNetworkSettingsViewController isAccessory](self, "isAccessory"));

        uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        os_log_type_t v18 = [v11 localizedStringForKey:@"kWFLocSettingNetworkPortalButtonTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v98 = [v8 textLabel];
        goto LABEL_114;
      }
      if (v6) {
        goto LABEL_34;
      }
      double v20 = [(WFNetworkSettingsViewController *)self cellFactory];
      id v8 = [v20 recommendationCellAtIndexPath:v5];

      double v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v22 = [v21 localizedStringForKey:@"kWFLocSettingNetworkPortalTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v23 = [v8 titleLabel];
      [v23 setText:v22];

      char v24 = [v8 titleLabel];
      v25 = [MEMORY[0x263F825C8] defaultTextColor];
      [v24 setTextColor:v25];

      uint64_t v11 = [(WFNetworkSettingsViewController *)self _portalURL];
      os_log_type_t v18 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:v11];
      id v26 = NSString;
      os_log_type_t v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v28 = [v27 localizedStringForKey:@"kWFLocSettingNetworkPortalDescriptionFormat" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      os_log_type_t v29 = [v18 host];
      v30 = objc_msgSend(v26, "stringWithFormat:", v28, v29);
      os_log_type_t v31 = [v8 descriptionLabel];
      [v31 setText:v30];

      uint64_t v19 = [v8 descriptionLabel];
      id v32 = [MEMORY[0x263F825C8] altTextColor];
      [v19 setTextColor:v32];
      goto LABEL_21;
    case 2:
      uint64_t v11 = [(WFNetworkSettingsViewController *)self cellFactory];
      uint64_t v33 = [v11 joinCellAtIndexPath:v5];
      goto LABEL_56;
    case 3:
      v34 = [(WFNetworkSettingsViewController *)self autoJoinSectionRows];
      v35 = objc_msgSend(v34, "objectAtIndex:", objc_msgSend(v5, "row"));
      uint64_t v36 = [v35 integerValue];

      switch(v36)
      {
        case 0:
          id v37 = [(WFNetworkSettingsViewController *)self cellFactory];
          id v8 = [v37 autoJoinCellAtIndexPath:v5];

          uint64_t v38 = [(WFNetworkSettingsViewController *)self autoJoinSwitch];
          [v8 setAccessoryView:v38];

          if ([(WFNetworkSettingsViewController *)self _isAutoJoinConfigurable])
          {
            id v39 = [(WFNetworkSettingsViewController *)self config];
            uint64_t v40 = [v39 autoJoinEnabled];
            v41 = [(WFNetworkSettingsViewController *)self autoJoinSwitch];
            [v41 setOn:v40];

            __int16 v42 = [(WFNetworkSettingsViewController *)self autoJoinSwitch];
            uint64_t v11 = v42;
            uint64_t v43 = 1;
          }
          else
          {
            v127 = [(WFNetworkSettingsViewController *)self autoJoinSwitch];
            [v127 setOn:0];

            __int16 v42 = [(WFNetworkSettingsViewController *)self autoJoinSwitch];
            uint64_t v11 = v42;
            uint64_t v43 = 0;
          }
          [v42 setEnabled:v43];
          goto LABEL_117;
        case 1:
          v103 = [(WFNetworkSettingsViewController *)self cellFactory];
          id v8 = [v103 autoLoginCellAtIndexPath:v5];

          v104 = [(WFNetworkSettingsViewController *)self autoLoginSwitch];
          [v8 setAccessoryView:v104];

          uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
          uint64_t v71 = [v11 autoLoginEnabled];
          v72 = [(WFNetworkSettingsViewController *)self autoLoginSwitch];
          goto LABEL_36;
        case 2:
          v105 = [(WFNetworkSettingsViewController *)self context];
          char v106 = objc_opt_respondsToSelector();

          if (v106)
          {
            v107 = [(WFNetworkSettingsViewController *)self context];
            uint64_t v11 = [v107 username];
          }
          else
          {
            uint64_t v11 = 0;
          }
          os_log_type_t v18 = [(WFNetworkSettingsViewController *)self cellFactory];
          if ([(WFNetworkSettingsViewController *)self allowViewPassword]) {
            uint64_t v128 = [(WFNetworkSettingsViewController *)self credentailCellTapped] ^ 1;
          }
          else {
            uint64_t v128 = 1;
          }
          v129 = v18;
          id v130 = v5;
          v131 = v11;
          uint64_t v132 = 0;
          break;
        case 3:
          v108 = [(WFNetworkSettingsViewController *)self context];
          char v109 = objc_opt_respondsToSelector();

          if (v109)
          {
            v110 = [(WFNetworkSettingsViewController *)self context];
            uint64_t v11 = [v110 password];
          }
          else
          {
            uint64_t v11 = 0;
          }
          os_log_type_t v18 = [(WFNetworkSettingsViewController *)self cellFactory];
          if ([(WFNetworkSettingsViewController *)self allowViewPassword]) {
            uint64_t v128 = [(WFNetworkSettingsViewController *)self credentailCellTapped] ^ 1;
          }
          else {
            uint64_t v128 = 1;
          }
          v129 = v18;
          id v130 = v5;
          v131 = v11;
          uint64_t v132 = 1;
          break;
        default:
          goto LABEL_34;
      }
      id v8 = [v129 credentialsViewerCellAtIndexPath:v130 credentails:v131 hideCredentials:v128 isPassword:v132];
      goto LABEL_116;
    case 4:
      uint64_t v11 = [(WFNetworkSettingsViewController *)self cellFactory];
      uint64_t v33 = objc_msgSend(v11, "forgetCellAtIndexPath:accessory:", v5, -[WFNetworkSettingsViewController isAccessory](self, "isAccessory"));
      goto LABEL_56;
    case 5:
      switch(v6)
      {
        case 0:
          uint64_t v44 = [(WFNetworkSettingsViewController *)self cellFactory];
          id v8 = [v44 ipv4AddressConfigCellAtIndexPath:v5];

          v45 = [(WFNetworkSettingsViewController *)self config];
          uint64_t v46 = [v45 ipv4Config];

          if (!v46)
          {
            v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = v49;
            v50 = @"kWFLocSettingsIPV4ConfigureAutomatic";
            goto LABEL_112;
          }
          v47 = [(WFNetworkSettingsViewController *)self config];
          uint64_t v48 = [v47 ipv4Config];

          if (v48 == 2)
          {
            v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = v49;
            v50 = @"kWFLocSettingsIPV4ConfigureManual";
            goto LABEL_112;
          }
          v144 = [(WFNetworkSettingsViewController *)self config];
          uint64_t v145 = [v144 ipv4Config];

          if (v145 != 1) {
            goto LABEL_118;
          }
          v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v11 = v49;
          v50 = @"kWFLocSettingsIPV4ConfigureBootP";
          break;
        case 1:
          v111 = [(WFNetworkSettingsViewController *)self cellFactory];
          id v8 = [v111 ipv4AddressCellAtIndexPath:v5];

          BOOL v112 = [(WFNetworkSettingsViewController *)self _isIPv4ConfigAuto];
          v113 = [(WFNetworkSettingsViewController *)self config];
          uint64_t v11 = v113;
          if (v112) {
            [v113 ipv4Address];
          }
          else {
            [v113 ipv4AddressManual];
          }
          goto LABEL_78;
        case 2:
          v114 = [(WFNetworkSettingsViewController *)self cellFactory];
          id v8 = [v114 ipv4SubnetMaskCellAtIndexPath:v5];

          BOOL v115 = [(WFNetworkSettingsViewController *)self _isIPv4ConfigAuto];
          v116 = [(WFNetworkSettingsViewController *)self config];
          uint64_t v11 = v116;
          if (v115) {
            [v116 ipv4SubnetMask];
          }
          else {
            [v116 ipv4SubnetMaskManual];
          }
          goto LABEL_78;
        case 3:
          v117 = [(WFNetworkSettingsViewController *)self cellFactory];
          id v8 = [v117 ipv4RouterCellAtIndexPath:v5];

          BOOL v118 = [(WFNetworkSettingsViewController *)self _isIPv4ConfigAuto];
          v119 = [(WFNetworkSettingsViewController *)self config];
          uint64_t v11 = v119;
          if (v118) {
            [v119 ipv4RouterAddress];
          }
          else {
            [v119 ipv4RouterAddressManual];
          }
          uint64_t v100 = LABEL_78:;
          goto LABEL_113;
        case 4:
          v120 = [(WFNetworkSettingsViewController *)self cellFactory];
          id v8 = [v120 dhcpClientIDCellAtIndexPath:v5];

          uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
          uint64_t v100 = [v11 dhcpClientID];
          goto LABEL_113;
        default:
          goto LABEL_34;
      }
      goto LABEL_112;
    case 6:
      uint64_t v11 = [(WFNetworkSettingsViewController *)self cellFactory];
      uint64_t v33 = [v11 renewLeaseCellAtIndexPath:v5];
      goto LABEL_56;
    case 7:
      if (v6 == 1)
      {
        v99 = [(WFNetworkSettingsViewController *)self cellFactory];
        id v8 = [v99 ipv6RouterCellAtIndexPath:v5];

        uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
        uint64_t v100 = [v11 ipv6RouterAddress];
        goto LABEL_113;
      }
      if (v6)
      {
LABEL_34:
        id v8 = 0;
        goto LABEL_118;
      }
      v51 = [(WFNetworkSettingsViewController *)self cellFactory];
      id v8 = [v51 ipv6AddressCellAtIndexPath:v5];

      v52 = [(WFNetworkSettingsViewController *)self config];
      v53 = [v52 ipv6Addresses];
      uint64_t v54 = [v53 count];

      if (!v54) {
        goto LABEL_118;
      }
      [v8 setAccessoryType:0];
      if (v54 != 1)
      {
        v123 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v124 = [v123 localizedStringForKey:@"kWFLocSettingsAddressesTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

        v125 = [NSString stringWithFormat:@"%lu %@", v54, v124];
        v126 = [v8 detailTextLabel];
        [v126 setText:v125];

        [v8 setAccessoryType:1];
        [v8 setSelectionStyle:1];

        goto LABEL_118;
      }
      uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
      os_log_type_t v18 = [v11 ipv6Addresses];
      uint64_t v19 = [v18 firstObject];
      id v32 = [v8 detailTextLabel];
      [v32 setText:v19];
LABEL_21:

      goto LABEL_115;
    case 8:
      if (v6) {
        goto LABEL_34;
      }
      v55 = [(WFNetworkSettingsViewController *)self cellFactory];
      id v8 = [v55 dnsConfigureCellAtIndexPath:v5];

      uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
      uint64_t v56 = [v11 dnsConfig];
      v57 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v58 = v57;
      if (v56) {
        v59 = @"kWFLocSettingsDNSConfigureManual";
      }
      else {
        v59 = @"kWFLocSettingsDNSConfigureAutomatic";
      }
      v60 = [v57 localizedStringForKey:v59 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v61 = [v8 detailTextLabel];
      [v61 setText:v60];

      goto LABEL_37;
    case 9:
      if (v6) {
        goto LABEL_34;
      }
      v62 = [(WFNetworkSettingsViewController *)self cellFactory];
      id v8 = [v62 httpProxyConfigCellAtIndexPath:v5];

      v63 = [(WFNetworkSettingsViewController *)self config];
      uint64_t v64 = [v63 httpProxyConfig];

      if (v64)
      {
        v65 = [(WFNetworkSettingsViewController *)self config];
        uint64_t v66 = [v65 httpProxyConfig];

        if (v66 == 2)
        {
          v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v11 = v49;
          v50 = @"kWFLocSettingsProxyConfigAutomaticTitle";
        }
        else
        {
          v121 = [(WFNetworkSettingsViewController *)self config];
          uint64_t v122 = [v121 httpProxyConfig];

          if (v122 != 1) {
            goto LABEL_118;
          }
          v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v11 = v49;
          v50 = @"kWFLocSettingsProxyConfigManualTitle";
        }
      }
      else
      {
        v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v11 = v49;
        v50 = @"kWFLocSettingsProxyConfigOffTitle";
      }
LABEL_112:
      uint64_t v100 = [v49 localizedStringForKey:v50 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
LABEL_113:
      os_log_type_t v18 = (void *)v100;
      v98 = [v8 detailTextLabel];
LABEL_114:
      uint64_t v19 = v98;
      [v98 setText:v18];
LABEL_115:

      goto LABEL_116;
    case 10:
      uint64_t v11 = [(WFNetworkSettingsViewController *)self cellFactory];
      uint64_t v33 = [v11 manageCellAtIndexPath:v5];
      goto LABEL_56;
    case 11:
      v67 = [(WFNetworkSettingsViewController *)self config];
      int v68 = [v67 saveDataModeConfigurable];

      if (!v68) {
        goto LABEL_34;
      }
      v69 = [(WFNetworkSettingsViewController *)self cellFactory];
      id v8 = [v69 saveDataModeCellAtIndexPath:v5];

      v70 = [(WFNetworkSettingsViewController *)self saveDataModeSwitch];
      [v8 setAccessoryView:v70];

      uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
      uint64_t v71 = [v11 isInSaveDataMode];
      v72 = [(WFNetworkSettingsViewController *)self saveDataModeSwitch];
LABEL_36:
      v58 = v72;
      [v72 setOn:v71];
LABEL_37:

      goto LABEL_117;
    case 12:
      v73 = [(WFNetworkSettingsViewController *)self cellFactory];
      id v8 = [v73 privacyProxyEnabledCellAtIndexPath:v5];

      v74 = [(WFNetworkSettingsViewController *)self privacyProxyEnabledSwitch];
      [v8 setAccessoryView:v74];

      uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
      uint64_t v71 = [v11 privacyProxyEnabled];
      v72 = [(WFNetworkSettingsViewController *)self privacyProxyEnabledSwitch];
      goto LABEL_36;
    case 13:
      v75 = [(WFNetworkSettingsViewController *)self config];
      if (![v75 networkQualityVisible]
        || [(WFNetworkSettingsViewController *)self _isChinaDevice])
      {

        goto LABEL_41;
      }
      v101 = [(WFNetworkSettingsViewController *)self config];
      [v101 networkQualityResponsiveness];
      if (v102 == 0.0)
      {
        v133 = [(WFNetworkSettingsViewController *)self context];
        int v134 = [v133 isCurrent];

        if (!v134)
        {
LABEL_41:
          v76 = WFLogForCategory(0);
          os_log_type_t v77 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v76 && os_log_type_enabled(v76, v77))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2257EC000, v76, v77, "NetQuality: WFNetworkSettingsNetworkQuality set but it shouldn't", buf, 2u);
          }

          id v8 = 0;
          goto LABEL_119;
        }
      }
      else
      {
      }
      v135 = [(WFNetworkSettingsViewController *)self cellFactory];
      id v8 = [v135 networkQualityCellAtIndexPath:v5];

      v136 = WFLogForCategory(0);
      os_log_type_t v137 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v136)
      {
        v138 = v136;
        if (os_log_type_enabled(v138, v137))
        {
          v139 = [(WFNetworkSettingsViewController *)self config];
          [v139 networkQualityResponsiveness];
          uint64_t v141 = v140;
          BOOL v142 = [(WFNetworkSettingsViewController *)self networkQualitySpinning];
          v143 = "NO";
          v155 = "-[WFNetworkSettingsViewController tableView:cellForRowAtIndexPath:]";
          *(_DWORD *)buf = 136315650;
          if (v142) {
            v143 = "YES";
          }
          __int16 v156 = 2048;
          uint64_t v157 = v141;
          __int16 v158 = 2080;
          v159 = v143;
          _os_log_impl(&dword_2257EC000, v138, v137, "NetQuality: %s: Responsiveness is %.1f, execution running? %s", buf, 0x20u);
        }
      }

      [(WFNetworkSettingsViewController *)self _fillNetworkQualityCell:v8];
LABEL_119:
      v148 = [(WFNetworkSettingsViewController *)self appearanceProxy];
      v149 = [v148 cellTextLabelFont];

      if (v149)
      {
        v150 = [(WFNetworkSettingsViewController *)self appearanceProxy];
        v151 = [v150 cellTextLabelFont];
        v152 = [v8 textLabel];
        [v152 setFont:v151];
      }
      return v8;
    case 14:
      id v8 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
      v78 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v79 = [v78 localizedStringForKey:@"kWFLocSettingsDiagnosticsTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v80 = [v8 textLabel];
      [v80 setText:v79];

      v81 = [MEMORY[0x263F825C8] defaultButtonColor];
      v82 = [v8 detailTextLabel];
      [v82 setTextColor:v81];

      [v8 setAccessoryType:1];
      [v8 setSelectionStyle:1];
      goto LABEL_118;
    case 15:
      v83 = [(WFNetworkSettingsViewController *)self _macAddressToDisplay];

      if (!v83)
      {
        v84 = WFLogForCategory(0);
        os_log_type_t v85 = OSLogForWFLogLevel(2uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 2 && v84 && os_log_type_enabled(v84, v85))
        {
          *(_DWORD *)buf = 136315138;
          v155 = "-[WFNetworkSettingsViewController tableView:cellForRowAtIndexPath:]";
          _os_log_impl(&dword_2257EC000, v84, v85, "%s - MAC address to display is empty", buf, 0xCu);
        }
      }
      v86 = [(WFNetworkSettingsViewController *)self cellFactory];
      id v8 = objc_msgSend(v86, "randomMACCellAtIndexPath:chinaDevice:", v5, -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"));

      if ([v5 row] == 1)
      {
        uint64_t v87 = [(WFNetworkSettingsViewController *)self _macAddressToDisplay];
      }
      else
      {
        if ([v5 row]) {
          goto LABEL_118;
        }
        uint64_t v87 = [(WFNetworkSettingsViewController *)self _selectedPrivateModeForOption:self->_privateAddressMode];
      }
      uint64_t v11 = (void *)v87;
      os_log_type_t v18 = [v8 detailTextLabel];
      [v18 setText:v11];
LABEL_116:

LABEL_117:
LABEL_118:
      v146 = [MEMORY[0x263F825C8] altTextColor];
      v147 = [v8 detailTextLabel];
      [v147 setTextColor:v146];

      goto LABEL_119;
    case 16:
      uint64_t v11 = [(WFNetworkSettingsViewController *)self cellFactory];
      uint64_t v33 = objc_msgSend(v11, "outrankedCellAtIndexPath:chinaDevice:", v5, -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"));
LABEL_56:
      id v8 = (void *)v33;
      goto LABEL_117;
    case 17:
      v88 = [(WFNetworkSettingsViewController *)self cellFactory];
      id v8 = [v88 wifiModeCellAtIndexPath:v5];

      uint64_t v11 = [v8 contentConfiguration];
      BOOL v89 = [(WFNetworkSettingsViewController *)self _isChinaDevice];
      v90 = @"kWFLocSettingsWiFiModeTitle";
      if (v89) {
        v90 = @"kWFLocSettingsWiFiModeTitle_CH";
      }
      v91 = (void *)MEMORY[0x263F086E0];
      v92 = v90;
      v93 = [v91 bundleForClass:objc_opt_class()];
      v94 = [v93 localizedStringForKey:v92 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings-WIFI_6E"];

      [v11 setText:v94];
      v95 = [(WFNetworkSettingsViewController *)self context];
      v96 = -[WFNetworkSettingsViewController _displayStringForDisableMode:](self, "_displayStringForDisableMode:", [v95 wifiMode]);
      [v11 setSecondaryText:v96];

      [v8 setContentConfiguration:v11];
      [v8 setAccessoryType:1];
      goto LABEL_117;
    default:
      goto LABEL_34;
  }
}

- (int64_t)_sectionTypeAtSection:(int64_t)a3
{
  id v4 = [(WFNetworkSettingsViewController *)self sections];
  id v5 = [v4 objectAtIndex:a3];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (void)_saveConfig:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFNetworkSettingsViewController *)self config];
  int64_t v6 = [v5 changesBetweenConfig:v4];

  double v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v7 && os_log_type_enabled(v7, v8))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_2257EC000, v7, v8, "save handler new config %@", (uint8_t *)&v12, 0xCu);
  }

  int v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v9 && os_log_type_enabled(v9, v10))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_2257EC000, v9, v10, "changes: %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v11 = [(WFNetworkSettingsViewController *)self dataCoordinator];
  [v11 networkSettingsViewController:self saveConfig:v4 errorHandler:&__block_literal_global_233];
}

void __47__WFNetworkSettingsViewController__saveConfig___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(2uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 2 && v3)
  {
    id v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      uint64_t v6 = [v2 code];
      double v7 = [v2 userInfo];
      int v8 = 134218242;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_2257EC000, v5, v4, "Failed to save settings config (errCode %lu) - userInfo %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)_shouldShowIPv6ForConfig:(id)a3
{
  id v3 = a3;
  os_log_type_t v4 = [v3 ipv6Addresses];
  if ([v4 count])
  {
    char v5 = [v3 current];
  }
  else
  {
    uint64_t v6 = [v3 ipv6RouterAddress];
    if (v6) {
      char v5 = [v3 current];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = -[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", [v5 section]);
  BOOL v7 = v6 == 15 || v6 == 5;
  BOOL v8 = v7 && [v5 row];

  return v8;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return sel_copy_ == a4;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v25 = a3;
  id v9 = a5;
  int64_t v10 = -[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", [v9 section]);
  if (sel_copy_ == a4)
  {
    int64_t v11 = v10;
    uint64_t v12 = [v25 cellForRowAtIndexPath:v9];
    id v13 = v12;
    if (v11 == 3)
    {
      uint64_t v14 = [(WFNetworkSettingsViewController *)self autoJoinSectionRows];
      id v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v9, "row"));
      uint64_t v16 = [v15 integerValue];

      if ((v16 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        id v17 = [v13 contentConfiguration];
        os_log_type_t v18 = [v17 secondaryText];
        if (![v18 length])
        {
LABEL_9:

          goto LABEL_10;
        }
        uint64_t v19 = [MEMORY[0x263F82A18] generalPasteboard];
        double v20 = v19;
        double v21 = v18;
LABEL_8:
        [v19 setString:v21];

        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v22 = [v12 detailTextLabel];
      v23 = [v22 text];
      uint64_t v24 = [v23 length];

      if (v24)
      {
        id v17 = [MEMORY[0x263F82A18] generalPasteboard];
        os_log_type_t v18 = [v13 detailTextLabel];
        double v20 = [v18 text];
        uint64_t v19 = v17;
        double v21 = v20;
        goto LABEL_8;
      }
    }
LABEL_10:
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v105 = a3;
  id v6 = a4;
  int64_t v7 = -[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", [v6 section]);
  v104 = [(WFNetworkSettingsViewController *)self delegate];
  BOOL v8 = WFLogForCategory(0);
  os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
  {
    int64_t v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v11 = [v6 row];
      uint64_t v12 = [v6 section];
      id v13 = [(WFNetworkSettingsViewController *)self _stringForSettingsSection:v7];
      *(_DWORD *)buf = 134218498;
      uint64_t v118 = v11;
      __int16 v119 = 2048;
      uint64_t v120 = v12;
      __int16 v121 = 2112;
      uint64_t v122 = v13;
      _os_log_impl(&dword_2257EC000, v10, v9, "User did select network settings row=%ld in section=%ld (%@)", buf, 0x20u);
    }
  }

  switch(v7)
  {
    case 1:
      if ([v6 row] == 1)
      {
        uint64_t v14 = [(WFNetworkSettingsViewController *)self _portalURL];
        id v15 = [(WFNetworkSettingsViewController *)self context];
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          id v17 = [(WFNetworkSettingsViewController *)self context];
          [v17 openPortalURL];
        }
        goto LABEL_10;
      }
      break;
    case 2:
      os_log_type_t v18 = [(WFNetworkSettingsViewController *)self context];

      if (v18)
      {
        uint64_t v19 = [(WFNetworkSettingsViewController *)self context];
        [v19 join];
      }
      else
      {
        uint64_t v19 = [(WFNetworkSettingsViewController *)self delegate];
        [v19 networkSettingsViewControllerDidJoinNetwork:self];
      }

      break;
    case 3:
      double v20 = [(WFNetworkSettingsViewController *)self autoJoinSectionRows];
      double v21 = objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v6, "row"));
      uint64_t v22 = [v21 integerValue];

      if ((v22 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        self->_credentailCellTapped = 1;
        v23 = [(WFNetworkSettingsViewController *)self tableView];
        [v23 reloadData];

        uint64_t v24 = [(WFNetworkSettingsViewController *)self context];
        if (v24)
        {
          id v25 = [(WFNetworkSettingsViewController *)self context];
          char v26 = objc_opt_respondsToSelector();

          if (v26)
          {
            os_log_type_t v27 = [(WFNetworkSettingsViewController *)self context];
            char v28 = [v27 credentialsTappedHandler];

            if (v28)
            {
              BOOL v29 = v22 == 3;
              v30 = [(WFNetworkSettingsViewController *)self context];
              uint64_t v31 = [v30 credentialsTappedHandler];
              id v32 = (void *)v31;
              if (v29) {
                uint64_t v33 = 2;
              }
              else {
                uint64_t v33 = 1;
              }
              (*(void (**)(uint64_t, uint64_t))(v31 + 16))(v31, v33);
            }
          }
        }
        if (self->_allowViewPassword)
        {
          v34 = WFLogForCategory(0);
          os_log_type_t v35 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v34 && os_log_type_enabled(v34, v35))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2257EC000, v34, v35, "Already allow viewing password. Show copy menu.", buf, 2u);
          }

          uint64_t v36 = [v105 cellForRowAtIndexPath:v6];
          if (([v36 canBecomeFirstResponder] & 1) == 0)
          {
            id v37 = WFLogForCategory(0);
            os_log_type_t v38 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v37 && os_log_type_enabled(v37, v38))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2257EC000, v37, v38, "Unable to present context menu as the credentail cell cannot become first responder!", buf, 2u);
            }
          }
          [v36 becomeFirstResponder];
          id v39 = [MEMORY[0x263F82950] sharedMenuController];
          [v39 update];
          uint64_t v40 = [MEMORY[0x263F82950] sharedMenuController];
          [v36 bounds];
          objc_msgSend(v40, "showMenuFromView:rect:", v36);
        }
        else
        {
          id v101 = objc_alloc_init(MEMORY[0x263F10470]);
          double v102 = self;
          v103 = [(WFNetworkSettingsViewController *)v102 _wifiPasswordContextOptions];
          v114[0] = MEMORY[0x263EF8330];
          v114[1] = 3221225472;
          v114[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
          v114[3] = &unk_264756B28;
          v114[4] = v102;
          id v115 = v105;
          id v116 = v6;
          [v101 evaluatePolicy:2 options:v103 reply:v114];
        }
      }
      break;
    case 4:
      [(WFNetworkSettingsViewController *)self _promptForgetNetwork];
      break;
    case 5:
      if ([v6 row])
      {
        if ([v6 row] == 6)
        {
          v41 = [(WFNetworkSettingsViewController *)self config];
          BOOL v42 = [v41 ipv4Config] == 0;

          if (v42) {
            goto LABEL_38;
          }
        }
      }
      else
      {
        v94 = [WFIPConfigViewController alloc];
        v95 = [(WFNetworkSettingsViewController *)self config];
        v96 = [(WFNetworkSettingsViewController *)self appearanceProxy];
        v97 = [(WFIPConfigViewController *)v94 initWithConfig:v95 ipType:0 appearanceProxy:v96];

        objc_initWeak((id *)buf, self);
        v110[0] = MEMORY[0x263EF8330];
        v110[1] = 3221225472;
        v110[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_248;
        v110[3] = &unk_264756B78;
        objc_copyWeak(&v111, (id *)buf);
        [(WFIPConfigViewController *)v97 setSaveHandler:v110];
        [(WFNetworkSettingsViewController *)self _presentDetailViewController:v97];
        objc_destroyWeak(&v111);
        objc_destroyWeak((id *)buf);
      }
      break;
    case 6:
LABEL_38:
      uint64_t v43 = [(WFNetworkSettingsViewController *)self view];
      [v105 rectForRowAtIndexPath:v6];
      objc_msgSend(v43, "convertRect:fromView:", v105);
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;

      -[WFNetworkSettingsViewController _presentRenewLeaseAlertWithSourceRect:](self, "_presentRenewLeaseAlertWithSourceRect:", v45, v47, v49, v51);
      break;
    case 7:
      if (![v6 row])
      {
        v52 = [(WFNetworkSettingsViewController *)self config];
        v53 = [v52 ipv6Addresses];
        BOOL v54 = [v53 count] == 0;

        if (!v54)
        {
          v55 = [WFIPViewController alloc];
          uint64_t v56 = [(WFNetworkSettingsViewController *)self config];
          v57 = [v56 ipv6Addresses];
          v58 = [(WFNetworkSettingsViewController *)self appearanceProxy];
          v59 = [(WFIPViewController *)v55 initWithAddresses:v57 prefixLengths:0 appearanceProxy:v58];

          [(WFNetworkSettingsViewController *)self _presentDetailViewController:v59];
        }
      }
      break;
    case 8:
      v60 = [WFDNSConfigViewController alloc];
      v61 = [(WFNetworkSettingsViewController *)self config];
      v62 = [(WFNetworkSettingsViewController *)self appearanceProxy];
      v63 = [(WFDNSConfigViewController *)v60 initWithConfig:v61 appearanceProxy:v62];

      objc_initWeak((id *)buf, self);
      v112[0] = MEMORY[0x263EF8330];
      v112[1] = 3221225472;
      v112[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_245;
      v112[3] = &unk_264756B50;
      objc_copyWeak(&v113, (id *)buf);
      [(WFDNSConfigViewController *)v63 setSaveHandler:v112];
      [(WFNetworkSettingsViewController *)self _presentDetailViewController:v63];
      objc_destroyWeak(&v113);
      objc_destroyWeak((id *)buf);

      break;
    case 9:
      uint64_t v64 = [WFProxyConfigViewController alloc];
      v65 = [(WFNetworkSettingsViewController *)self config];
      uint64_t v66 = [(WFNetworkSettingsViewController *)self appearanceProxy];
      v67 = [(WFProxyConfigViewController *)v64 initWithConfig:v65 appearanceProxy:v66];

      objc_initWeak((id *)buf, self);
      v108[0] = MEMORY[0x263EF8330];
      v108[1] = 3221225472;
      v108[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
      v108[3] = &unk_264756B78;
      objc_copyWeak(&v109, (id *)buf);
      [(WFProxyConfigViewController *)v67 setSaveHandler:v108];
      [(WFNetworkSettingsViewController *)self _presentDetailViewController:v67];
      objc_destroyWeak(&v109);
      objc_destroyWeak((id *)buf);

      break;
    case 10:
      int v68 = [(WFNetworkSettingsViewController *)self context];

      if (v68)
      {
        v69 = [(WFNetworkSettingsViewController *)self context];
        [v69 manage];
      }
      else
      {
        [v104 networkSettingsViewControllerDidManageNetwork:self];
      }
      break;
    case 14:
      v70 = [(WFNetworkSettingsViewController *)self context];
      uint64_t v71 = [v70 diagnosticsContext];

      v72 = [WFDiagnosticsTableViewController alloc];
      v73 = [(WFNetworkSettingsViewController *)self context];
      v74 = [(WFNetworkSettingsViewController *)self appearanceProxy];
      v75 = [(WFDiagnosticsTableViewController *)v72 initWithDiagnosticsContext:v71 detailsProviderContext:v73 appearanceProxy:v74];

      [(WFNetworkSettingsViewController *)self _presentDetailViewController:v75];
      break;
    case 15:
      if (![v6 row])
      {
        if ([(WFDetailsProviderContext *)self->_context isRandomMACAddressConfigurable])
        {
          [(WFNetworkSettingsViewController *)self _pushPrivateModeSelectionViewController];
        }
        else
        {
          uint64_t v14 = WFLogForCategory(0);
          os_log_type_t v98 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v14)
          {
            v99 = v14;
            if (os_log_type_enabled(v99, v98))
            {
              uint64_t v100 = [(WFNetworkSettingsConfig *)self->_config ssid];
              *(_DWORD *)buf = 138412290;
              uint64_t v118 = (uint64_t)v100;
              _os_log_impl(&dword_2257EC000, v99, v98, "Private Address mode for %@ is not configurable!", buf, 0xCu);
            }
          }
LABEL_10:
        }
      }
      break;
    case 16:
      v76 = [(WFNetworkSettingsViewController *)self context];
      BOOL v77 = ([v76 requestedFields] & 0x2000) == 0;

      if (v77)
      {
        v78 = [(WFNetworkSettingsViewController *)self context];
        -[WFNetworkSettingsViewController _promptOverrideWiFiOutrankedForPrivateCellular:](self, "_promptOverrideWiFiOutrankedForPrivateCellular:", ((unint64_t)[v78 requestedFields] >> 14) & 1);
      }
      else
      {
        [(WFNetworkSettingsViewController *)self _promptOverrideWiFiOutrankedDev];
      }
      break;
    case 17:
      v79 = (void *)MEMORY[0x263EFF8C0];
      v80 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v81 = [v80 localizedStringForKey:@"kWFLocSettingsWiFiModeAuto" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v82 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v83 = [v82 localizedStringForKey:@"kWFLocSettingsWiFiModeOff" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v84 = objc_msgSend(v79, "arrayWithObjects:", v81, v83, 0);

      os_log_type_t v85 = [[WFValueListViewController alloc] initWithTitles:v84 switchTitle:0];
      BOOL v86 = [(WFNetworkSettingsViewController *)self _isChinaDevice];
      uint64_t v87 = @"kWFLocSettingsWiFiModeTitle";
      if (v86) {
        uint64_t v87 = @"kWFLocSettingsWiFiModeTitle_CH";
      }
      v88 = v87;
      BOOL v89 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v90 = [v89 localizedStringForKey:v88 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings-WIFI_6E"];
      v91 = [(WFValueListViewController *)v85 navigationItem];
      [v91 setTitle:v90];

      v92 = [(WFNetworkSettingsViewController *)self _displayStringForDisableMode:[(WFDetailsProviderContext *)self->_context wifiMode]];
      [(WFValueListViewController *)v85 setSelectedTitle:v92];

      objc_initWeak((id *)buf, self);
      v106[0] = MEMORY[0x263EF8330];
      v106[1] = 3221225472;
      v106[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
      v106[3] = &unk_2647568F8;
      objc_copyWeak(&v107, (id *)buf);
      v106[4] = self;
      [(WFValueListViewController *)v85 setCompletionHandler:v106];
      v93 = [(WFNetworkSettingsViewController *)self navigationController];
      [v93 pushViewController:v85 animated:1];

      [(WFNetworkSettingsViewController *)self _didStartPresentingDetailViewController];
      objc_destroyWeak(&v107);
      objc_destroyWeak((id *)buf);

      break;
    default:
      break;
  }
  [v105 deselectRowAtIndexPath:v6 animated:1];
}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v8[3] = &unk_264756B00;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = WFLogForCategory(0);
    os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v4;
      _os_log_impl(&dword_2257EC000, v2, v3, "Authentication Error: %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v5 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [v5 code];
  if (v6 == -5)
  {
    id v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_2257EC000, v7, v8, "User turned off passcode", (uint8_t *)&v15, 2u);
    }
  }
  if (v5) {
    BOOL v9 = v6 == -5;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = v9;
  [*(id *)(a1 + 40) setAllowViewPassword:v10];
  id v11 = [*(id *)(a1 + 40) tableView];
  [v11 reloadData];

  if ([*(id *)(a1 + 40) allowViewPassword])
  {
    id v12 = [*(id *)(a1 + 48) cellForRowAtIndexPath:*(void *)(a1 + 56)];
    [v12 becomeFirstResponder];
    id v13 = [MEMORY[0x263F82950] sharedMenuController];
    [v13 update];
    uint64_t v14 = [MEMORY[0x263F82950] sharedMenuController];
    [v12 bounds];
    objc_msgSend(v14, "showMenuFromView:rect:", v12);
  }
}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_245(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v19 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v9 = [WeakRetained config];
  uint64_t v10 = (void *)[v9 copy];

  uint64_t v11 = [v10 dnsConfig];
  BOOL v12 = v11 != a2;
  if (v11 != a2) {
    [v10 setDnsConfig:a2];
  }
  id v13 = [WeakRetained config];
  uint64_t v14 = [v13 dnsServerAddresses];
  char v15 = [v14 isEqualToArray:v19];

  if ((v15 & 1) == 0)
  {
    [v10 setDnsServerAddresses:v19];
    BOOL v12 = 1;
  }
  uint64_t v16 = [WeakRetained config];
  uint64_t v17 = [v16 dnsSearchDomains];
  char v18 = [v17 isEqualToArray:v7];

  if ((v18 & 1) == 0)
  {
    [v10 setDnsSearchDomains:v7];
    goto LABEL_9;
  }
  if (v12) {
LABEL_9:
  }
    [WeakRetained _saveConfig:v10];
  [WeakRetained _didDismissDetailViewController];
}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_248(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _saveConfig:v3];

  [WeakRetained _didDismissDetailViewController];
}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _saveConfig:v3];

  [WeakRetained _didDismissDetailViewController];
}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"kWFLocSettingsWiFiModeAuto" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  if ([v10 isEqualToString:v5])
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1240) wifiMode];

    if (v6 > 1)
    {
LABEL_7:
      objc_msgSend(WeakRetained, "_updateWiFiEMode:", objc_msgSend(*(id *)(a1 + 32), "_disableModeFromKey:", v10));
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  os_log_type_t v8 = [v7 localizedStringForKey:@"kWFLocSettingsWiFiModeOff" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  if ([v10 isEqualToString:v8])
  {
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1240) wifiMode];

    if (v9 >= 2) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

LABEL_9:
  [WeakRetained _didDismissDetailViewController];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4 = 0;
  switch([(WFNetworkSettingsViewController *)self _sectionTypeAtSection:a4])
  {
    case 5:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      id v7 = @"kWFLocSettingsIPSectionTitle";
      goto LABEL_6;
    case 7:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      id v7 = @"kWFLocSettingsIPV6SectionTitle";
      goto LABEL_6;
    case 8:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      id v7 = @"kWFLocSettingsDNSSectionTitle";
      goto LABEL_6;
    case 9:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      id v7 = @"kWFLocSettingsProxySectionTitle";
LABEL_6:
      uint64_t v4 = [v5 localizedStringForKey:v7 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      break;
    default:
      break;
  }
  return v4;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5 = 0;
  switch([(WFNetworkSettingsViewController *)self _sectionTypeAtSection:a4])
  {
    case 0:
      if (![(WFNetworkSettingsViewController *)self _showRecommendationSupportLink]) {
        goto LABEL_15;
      }
      uint64_t v6 = [(WFNetworkSettingsViewController *)self linkFooterView];
      goto LABEL_14;
    case 6:
      id v7 = [(WFNetworkSettingsViewController *)self config];
      os_log_type_t v8 = [v7 dhcpLeaseExpirationDate];

      if (v8)
      {
        uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v10 = [v9 localizedStringForKey:@"kWFLocSettingsDHCPLeaseExpiresTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

        uint64_t v11 = [(WFNetworkSettingsViewController *)self config];
        BOOL v12 = [v11 dhcpLeaseExpirationDate];
        id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v14 = [v13 localizedStringForKey:@"kWFLocSettingsDHCPLeaseExpiresDateFormat" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        char v15 = [v12 stringFromDHCPLeaseExpirationDateWithFormatString:v14];

        uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", 15.0, 0.0, 0.0, 0.0);
        uint64_t v17 = [NSString stringWithFormat:@"%@: %@", v10, v15];
        [v16 setText:v17];

        char v18 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8] compatibleWithTraitCollection:0];
        [v16 setFont:v18];

        id v19 = [MEMORY[0x263F825C8] altTextColor];
        [v16 setTextColor:v19];

        [v16 sizeToFit];
        id v20 = objc_alloc(MEMORY[0x263F82E00]);
        id v5 = (id)objc_msgSend(v20, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        [v5 addSubview:v16];

LABEL_12:
      }
      else
      {
LABEL_15:
        id v5 = 0;
      }
LABEL_16:
      return v5;
    case 11:
      double v21 = [(WFNetworkSettingsViewController *)self _lowDataModeFooterView];
      goto LABEL_11;
    case 12:
      double v21 = [(WFNetworkSettingsViewController *)self _privacyProxyEnabledFooterView];
      goto LABEL_11;
    case 13:
      uint64_t v6 = [(WFNetworkSettingsViewController *)self networkQualityFooterView];
LABEL_14:
      id v5 = (id)v6;
      goto LABEL_16;
    case 15:
      double v21 = [(WFNetworkSettingsViewController *)self _randomMACFooterView];
      goto LABEL_11;
    case 16:
      double v21 = [(WFNetworkSettingsViewController *)self _outrankedFooterView];
      goto LABEL_11;
    case 17:
      double v21 = [(WFNetworkSettingsViewController *)self _WiFiModeFooterView];
LABEL_11:
      id v5 = v21;
      uint64_t v22 = [v5 textLabel];
      [v22 setNumberOfLines:0];

      id v10 = [v5 textLabel];

      [v10 sizeToFit];
      goto LABEL_12;
    default:
      goto LABEL_16;
  }
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  v33[2] = *MEMORY[0x263EF8340];
  int64_t v5 = [(WFNetworkSettingsViewController *)self _sectionTypeAtSection:a4];
  double v6 = 0.0;
  switch(v5)
  {
    case 11:
      id v7 = [(WFNetworkSettingsViewController *)self _lowDataModeFooterView];
      goto LABEL_11;
    case 12:
      id v7 = [(WFNetworkSettingsViewController *)self _privacyProxyEnabledFooterView];
      goto LABEL_11;
    case 13:
      uint64_t v16 = [(WFNetworkSettingsViewController *)self networkQualityFooterView];
      [v16 frame];
      if (v17 != 0.0) {
        goto LABEL_14;
      }
      v30[0] = *MEMORY[0x263F81500];
      char v18 = [MEMORY[0x263F825C8] systemBlueColor];
      v31[0] = v18;
      v30[1] = *MEMORY[0x263F814F0];
      id v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
      v31[1] = v19;
      id v20 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

      double v21 = [v16 text];
      [v21 sizeWithAttributes:v20];
      double v23 = v22;
      goto LABEL_13;
    case 14:
      return v6;
    case 15:
      id v7 = [(WFNetworkSettingsViewController *)self _randomMACFooterView];
      goto LABEL_11;
    case 16:
      id v7 = [(WFNetworkSettingsViewController *)self _outrankedFooterView];
      goto LABEL_11;
    case 17:
      id v7 = [(WFNetworkSettingsViewController *)self _WiFiModeFooterView];
LABEL_11:
      uint64_t v16 = v7;
      [v7 frame];
      if (v17 == 0.0)
      {
        uint64_t v24 = [v16 textLabel];
        id v25 = [v24 attributedText];
        id v20 = [v25 attributesAtIndex:0 effectiveRange:0];

        double v21 = [v16 textLabel];
        char v26 = [v21 text];
        [v26 sizeWithAttributes:0];
        double v23 = v27;

LABEL_13:
        [@"A" sizeWithAttributes:v20];
        double v6 = ceil(v23 + v28 * 2.0);
      }
      else
      {
LABEL_14:
        double v6 = v17;
      }

      return v6;
    default:
      if (!v5)
      {
        v32[0] = *MEMORY[0x263F81500];
        os_log_type_t v8 = [MEMORY[0x263F825C8] systemBlueColor];
        v33[0] = v8;
        v32[1] = *MEMORY[0x263F814F0];
        uint64_t v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
        v33[1] = v9;
        id v10 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

        uint64_t v11 = [(WFNetworkSettingsViewController *)self recommendationLinkAttributedString];
        BOOL v12 = [v11 string];
        [v12 sizeWithAttributes:v10];
        double v14 = v13;

        [@"A" sizeWithAttributes:v10];
        double v6 = ceil(v14 + v15 * 2.0);
      }
      return v6;
  }
}

- (void)_autoJoinSwitchChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isOn];
  double v6 = [(WFNetworkSettingsViewController *)self config];
  [v6 setAutoJoinEnabled:v5];

  uint64_t v7 = [v4 isOn];
  [(WFNetworkSettingsViewController *)self _saveAutoJoinEnabledChanged:v7];
}

- (void)_autoLoginSwitchChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isOn];
  double v6 = [(WFNetworkSettingsViewController *)self config];
  [v6 setAutoLoginEnabled:v5];

  uint64_t v7 = [v4 isOn];
  [(WFNetworkSettingsViewController *)self _saveAutoLoginEnabledChanged:v7];
}

- (void)_saveDataModeSwitchChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isOn];
  double v6 = [(WFNetworkSettingsViewController *)self config];
  [v6 setIsInSaveDataMode:v5];

  uint64_t v7 = [v4 isOn];
  [(WFNetworkSettingsViewController *)self _saveSaveDataModeChanged:v7];
}

- (void)_privacyProxyEnabledSwitchChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isOn];
  double v6 = [(WFNetworkSettingsViewController *)self config];
  [v6 setPrivacyProxyEnabled:v5];

  uint64_t v7 = [v4 isOn];
  [(WFNetworkSettingsViewController *)self _privacyProxyEnabledChanged:v7];
}

- (void)_updateWiFiEMode:(int64_t)a3
{
  uint64_t v5 = [(WFNetworkSettingsViewController *)self context];
  [v5 setWifiMode:a3];

  id v6 = [(WFNetworkSettingsViewController *)self tableView];
  [v6 reloadData];
}

- (int64_t)_disableModeFromKey:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"kWFLocSettingsWiFiModeAuto" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    int64_t v7 = 1;
  }
  else
  {
    os_log_type_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"kWFLocSettingsWiFiModeOff" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    int v10 = [v3 isEqualToString:v9];

    if (v10) {
      int64_t v7 = 2;
    }
    else {
      int64_t v7 = 0;
    }
  }

  return v7;
}

- (void)_pushPrivateModeSelectionViewController
{
  double v22 = [(WFNetworkSettingsViewController *)self _selectedPrivateModeForOption:self->_privateAddressMode];
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"kWFLocRandomMACOffOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int64_t v7 = [v6 localizedStringForKey:@"kWFLocRandomMACStaticOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  os_log_type_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"kWFLocRandomMACRotatingOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  int v10 = objc_msgSend(v3, "arrayWithObjects:", v5, v7, v9, 0);

  uint64_t v11 = [WFPrivateAddressModeOptionsViewController alloc];
  uint64_t v12 = [(WFDetailsProviderContext *)self->_context isCurrent];
  double v13 = [(WFNetworkSettingsConfig *)self->_config ssid];
  double v14 = [(WFPrivateAddressModeOptionsViewController *)v11 initWithTitles:v10 originalSelection:v22 isCurrentNetwork:v12 currentNetworkName:v13 isChinaDevice:[(WFNetworkSettingsViewController *)self _isChinaDevice]];

  LODWORD(v11) = [(WFNetworkSettingsViewController *)self _isChinaDevice];
  double v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v16 = v15;
  if (v11) {
    double v17 = @"KWFLocSettingRandomMACSwitchChinaTitle";
  }
  else {
    double v17 = @"KWFLocSettingRandomMACSwitchTitle";
  }
  char v18 = [v15 localizedStringForKey:v17 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  id v19 = [(WFPrivateAddressModeOptionsViewController *)v14 navigationItem];
  [v19 setTitle:v18];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __74__WFNetworkSettingsViewController__pushPrivateModeSelectionViewController__block_invoke;
  v23[3] = &unk_264756BA0;
  id v24 = v22;
  id v25 = self;
  id v20 = v22;
  [(WFValueListViewController *)v14 setCompletionHandler:v23];
  double v21 = [(WFNetworkSettingsViewController *)self navigationController];
  [v21 pushViewController:v14 animated:1];
}

void __74__WFNetworkSettingsViewController__pushPrivateModeSelectionViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:*(void *)(a1 + 32)] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 40), "_updatePrivateAddressMode:", objc_msgSend(*(id *)(a1 + 40), "_selectedPrivateModeForString:", v3));
  }
}

- (void)_updatePrivateAddressMode:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    int64_t v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      os_log_type_t v8 = [(WFNetworkSettingsConfig *)self->_config ssid];
      int v15 = 138412546;
      uint64_t v16 = v8;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      _os_log_impl(&dword_2257EC000, v7, v6, "Private address mode for %@ has been updated to %ld", (uint8_t *)&v15, 0x16u);
    }
  }

  [(WFNetworkSettingsViewController *)self setPrivateAddressMode:a3];
  uint64_t v9 = [(WFNetworkSettingsViewController *)self sections];
  uint64_t v10 = [v9 indexOfObject:&unk_26D911F68];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [(WFNetworkSettingsViewController *)self tableView];
    uint64_t v12 = [MEMORY[0x263F088D0] indexSetWithIndex:v10];
    [v11 reloadSections:v12 withRowAnimation:5];

    double v13 = [(WFNetworkSettingsViewController *)self tableView];
    double v14 = [MEMORY[0x263F088D0] indexSetWithIndex:v10];
    [v13 _reloadSectionHeaderFooters:v14 withRowAnimation:100];
  }
  if (objc_opt_respondsToSelector()) {
    [(WFDetailsProviderContext *)self->_context updatePrivateAddressMode:a3];
  }
}

- (id)_selectedPrivateModeForOption:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"kWFLocRandomMACStaticOption";
      goto LABEL_7;
    case 2uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"kWFLocRandomMACRotatingOption";
      goto LABEL_7;
    case 1uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"kWFLocRandomMACOffOption";
LABEL_7:
      os_log_type_t v6 = [v3 localizedStringForKey:v5 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      goto LABEL_9;
  }
  os_log_type_t v6 = 0;
LABEL_9:
  return v6;
}

- (unint64_t)_selectedPrivateModeForString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"kWFLocRandomMACOffOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    unint64_t v7 = 1;
  }
  else
  {
    os_log_type_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"kWFLocRandomMACStaticOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    char v10 = [v3 isEqualToString:v9];

    if (v10)
    {
      unint64_t v7 = 3;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v12 = [v11 localizedStringForKey:@"kWFLocRandomMACRotatingOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      int v13 = [v3 isEqualToString:v12];

      if (v13) {
        unint64_t v7 = 2;
      }
      else {
        unint64_t v7 = 1;
      }
    }
  }

  return v7;
}

- (void)_saveAutoJoinEnabledChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFNetworkSettingsViewController *)self context];
  [v4 setAutoJoinEnabled:v3];
}

- (void)_saveAutoLoginEnabledChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFNetworkSettingsViewController *)self context];
  [v4 setAutoLoginEnabled:v3];
}

- (void)_saveSaveDataModeChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFNetworkSettingsViewController *)self context];
  [v4 setIsInSaveDataMode:v3];
}

- (void)_privacyProxyEnabledChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFNetworkSettingsViewController *)self context];
  [v4 setIsPrivacyProxyEnabled:v3];
}

- (BOOL)_shouldShowRandomConfigSwith
{
  id v2 = [(WFNetworkSettingsViewController *)self context];
  char v3 = [v2 isRandomMACFeatureEnabled];

  return v3;
}

- (UISwitch)autoJoinSwitch
{
  autoJoinSwitch = self->_autoJoinSwitch;
  if (!autoJoinSwitch)
  {
    id v4 = objc_alloc(MEMORY[0x263F82C40]);
    uint64_t v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    char v6 = self->_autoJoinSwitch;
    self->_autoJoinSwitch = v5;

    [(UISwitch *)self->_autoJoinSwitch addTarget:self action:sel__autoJoinSwitchChanged_ forControlEvents:4096];
    autoJoinSwitch = self->_autoJoinSwitch;
  }
  return autoJoinSwitch;
}

- (UISwitch)autoLoginSwitch
{
  autoLoginSwitch = self->_autoLoginSwitch;
  if (!autoLoginSwitch)
  {
    id v4 = objc_alloc(MEMORY[0x263F82C40]);
    uint64_t v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    char v6 = self->_autoLoginSwitch;
    self->_autoLoginSwitch = v5;

    [(UISwitch *)self->_autoLoginSwitch addTarget:self action:sel__autoLoginSwitchChanged_ forControlEvents:4096];
    autoLoginSwitch = self->_autoLoginSwitch;
  }
  return autoLoginSwitch;
}

- (UISwitch)saveDataModeSwitch
{
  saveDataModeSwitch = self->_saveDataModeSwitch;
  if (!saveDataModeSwitch)
  {
    id v4 = objc_alloc(MEMORY[0x263F82C40]);
    uint64_t v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    char v6 = self->_saveDataModeSwitch;
    self->_saveDataModeSwitch = v5;

    [(UISwitch *)self->_saveDataModeSwitch addTarget:self action:sel__saveDataModeSwitchChanged_ forControlEvents:4096];
    saveDataModeSwitch = self->_saveDataModeSwitch;
  }
  return saveDataModeSwitch;
}

- (UISwitch)privacyProxyEnabledSwitch
{
  privacyProxyEnabledSwitch = self->_privacyProxyEnabledSwitch;
  if (!privacyProxyEnabledSwitch)
  {
    id v4 = objc_alloc(MEMORY[0x263F82C40]);
    uint64_t v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    char v6 = self->_privacyProxyEnabledSwitch;
    self->_privacyProxyEnabledSwitch = v5;

    [(UISwitch *)self->_privacyProxyEnabledSwitch addTarget:self action:sel__privacyProxyEnabledSwitchChanged_ forControlEvents:4096];
    privacyProxyEnabledSwitch = self->_privacyProxyEnabledSwitch;
  }
  return privacyProxyEnabledSwitch;
}

- (UITableViewCell)networkQualityCell
{
  networkQualityCell = self->_networkQualityCell;
  if (!networkQualityCell)
  {
    id v4 = (UITableViewCell *)objc_alloc_init(MEMORY[0x263F82C80]);
    uint64_t v5 = self->_networkQualityCell;
    self->_networkQualityCell = v4;

    networkQualityCell = self->_networkQualityCell;
  }
  return networkQualityCell;
}

- (UISwitch)randomMACSwitch
{
  randomMACSwitch = self->_randomMACSwitch;
  if (!randomMACSwitch)
  {
    id v4 = objc_alloc(MEMORY[0x263F82C40]);
    uint64_t v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    char v6 = self->_randomMACSwitch;
    self->_randomMACSwitch = v5;

    [(UISwitch *)self->_randomMACSwitch addTarget:self action:sel__usingRandomMACSwitchChanged_ forEvents:4096];
    randomMACSwitch = self->_randomMACSwitch;
  }
  return randomMACSwitch;
}

- (WFHyperlinkFooterView)linkFooterView
{
  linkFooterView = self->_linkFooterView;
  if (!linkFooterView)
  {
    id v4 = objc_alloc_init(WFHyperlinkFooterView);
    uint64_t v5 = self->_linkFooterView;
    self->_linkFooterView = v4;

    BOOL v6 = [(WFNetworkSettingsViewController *)self _isChinaDevice];
    unint64_t v7 = @"kWFLocSettingsRecommendationLinkTitle";
    if (v6) {
      unint64_t v7 = @"kWFLocSettingsRecommendationLinkTitleCH";
    }
    os_log_type_t v8 = (void *)MEMORY[0x263F086E0];
    uint64_t v9 = v7;
    char v10 = [v8 bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:v9 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    [(WFHyperlinkFooterView *)self->_linkFooterView setText:v11];
    -[WFHyperlinkFooterView setLinkRange:](self->_linkFooterView, "setLinkRange:", 0, [v11 length]);
    [(WFHyperlinkFooterView *)self->_linkFooterView setTarget:self];
    [(WFHyperlinkFooterView *)self->_linkFooterView setAction:sel__openRecommendationsLink_];

    linkFooterView = self->_linkFooterView;
  }
  return linkFooterView;
}

- (void)_openRecommendationsLink:(id)a3
{
  id v4 = [(WFNetworkSettingsViewController *)self context];

  if (v4)
  {
    id v5 = [(WFNetworkSettingsViewController *)self context];
    [v5 openRecommendationLink];
  }
  else
  {
    id v5 = [(WFNetworkSettingsViewController *)self delegate];
    [v5 networkSettingsViewControllerDidTapRecommendationLink:self];
  }
}

- (BOOL)_showRecommendationSupportLink
{
  char v3 = [(WFNetworkSettingsViewController *)self config];
  id v4 = [v3 healthRecommendations];
  if ([v4 count] == 1)
  {
    id v5 = [(WFNetworkSettingsViewController *)self config];
    BOOL v6 = [v5 healthRecommendations];
    unint64_t v7 = [v6 firstObject];
    os_log_type_t v8 = +[WFHealthIssue issueWithType:1];
    int v9 = [v7 isEqual:v8] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)_presentDetailViewController:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v8 = 136315394;
    int v9 = "-[WFNetworkSettingsViewController _presentDetailViewController:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: pushing view controller='%@'", (uint8_t *)&v8, 0x16u);
  }

  self->_detailViewControllerVisible = 1;
  unint64_t v7 = [(WFNetworkSettingsViewController *)self navigationController];
  [v7 pushViewController:v4 animated:1];
}

- (BOOL)_isChinaDevice
{
  uint64_t v2 = [(WFNetworkSettingsViewController *)self deviceCapability];
  return WFCapabilityIsChinaDevice(v2);
}

- (void)_logSections:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F089D8] string];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = -[WFNetworkSettingsViewController _stringForSettingsSection:](self, "_stringForSettingsSection:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "integerValue", (void)v15));
        [v5 appendString:v12];

        if (v9 + 1 + v11 < (unint64_t)[v6 count]) {
          [v5 appendString:@", "];
        }
        ++v11;
      }
      while (v8 != v11);
      v9 += v8;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }

  int v13 = WFLogForCategory(0);
  os_log_type_t v14 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v13 && os_log_type_enabled(v13, v14))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl(&dword_2257EC000, v13, v14, "Settings Sections: %@", buf, 0xCu);
  }
}

- (id)_displayStringForDisableMode:(int64_t)a3
{
  if ((unint64_t)a3 < 2)
  {
    char v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = v3;
    id v5 = @"kWFLocSettingsWiFiModeAuto";
LABEL_6:
    id v6 = [v3 localizedStringForKey:v5 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    goto LABEL_12;
  }
  if (a3 == 2)
  {
    char v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = v3;
    id v5 = @"kWFLocSettingsWiFiModeOff";
    goto LABEL_6;
  }
  uint64_t v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_2257EC000, v7, v8, "Unexpected disable mode.", v10, 2u);
  }

  id v6 = 0;
LABEL_12:
  return v6;
}

- (id)_stringForSettingsSection:(int64_t)a3
{
  if ((unint64_t)a3 > 0x11) {
    return 0;
  }
  else {
    return off_264756BE8[a3];
  }
}

- (id)_randomAddressToDisplay
{
  randomMACAddress = self->_randomMACAddress;
  if (randomMACAddress)
  {
    char v3 = randomMACAddress;
  }
  else
  {
    id v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_2257EC000, v4, v5, "Random MAC Address is Empty!", v7, 2u);
    }

    char v3 = &stru_26D8F6070;
  }
  return v3;
}

- (id)_macAddressToDisplay
{
  if ([(WFNetworkSettingsViewController *)self privateAddressMode] == 1)
  {
    char v3 = self->_hardwareMACAddress;
  }
  else
  {
    char v3 = [(WFNetworkSettingsViewController *)self _randomAddressToDisplay];
  }
  return v3;
}

- (id)_randomMACFooterTextToDisplay
{
  BOOL v3 = [(WFNetworkSettingsViewController *)self _isChinaDevice];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  os_log_type_t v5 = v4;
  if (v3) {
    id v6 = @"kWFLocPrivateAddressFooterMainTitle_CH";
  }
  else {
    id v6 = @"kWFLocPrivateAddressFooterMainTitle";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  os_log_type_t v8 = NSString;
  uint64_t v9 = [(WFNetworkSettingsViewController *)self _detailFooterForMode:self->_privateAddressMode];
  uint64_t v10 = [v8 stringWithFormat:@"%@\n%@", v7, v9];

  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"kWFLocPrivateAddressNotConfigurableDescription" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  if (([(WFDetailsProviderContext *)self->_context isRandomMACAddressConfigurable] & 1) == 0)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@ %@", v10, v12];

    uint64_t v10 = (void *)v13;
  }

  return v10;
}

- (id)_detailFooterForMode:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      BOOL v6 = [(WFNetworkSettingsViewController *)self _isChinaDevice];
      id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v6) {
        os_log_type_t v5 = @"kWFLocPrivateAddressFooterStaticDetail_CH";
      }
      else {
        os_log_type_t v5 = @"kWFLocPrivateAddressFooterStaticDetail";
      }
      break;
    case 2uLL:
      BOOL v7 = [(WFNetworkSettingsViewController *)self _isChinaDevice];
      id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v7) {
        os_log_type_t v5 = @"kWFLocPrivateAddressFooterRotatingDetail_CH";
      }
      else {
        os_log_type_t v5 = @"kWFLocPrivateAddressFooterRotatingDetail";
      }
      break;
    case 1uLL:
      BOOL v3 = [(WFNetworkSettingsViewController *)self _isChinaDevice];
      id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v3) {
        os_log_type_t v5 = @"kWFLocPrivateAddressFooterOffDetail_CH";
      }
      else {
        os_log_type_t v5 = @"kWFLocPrivateAddressFooterOffDetail";
      }
      break;
    default:
      os_log_type_t v8 = 0;
      goto LABEL_15;
  }
  os_log_type_t v8 = [v4 localizedStringForKey:v5 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

LABEL_15:
  return v8;
}

- (void)scrollToCell:(unint64_t)a3
{
  switch(a3)
  {
    case 4uLL:
      os_log_type_t v5 = (void *)MEMORY[0x263F088C8];
      BOOL v6 = [(WFNetworkSettingsViewController *)self sections];
      BOOL v7 = v6;
      os_log_type_t v8 = &unk_26D911ED8;
      goto LABEL_6;
    case 5uLL:
      os_log_type_t v5 = (void *)MEMORY[0x263F088C8];
      BOOL v6 = [(WFNetworkSettingsViewController *)self sections];
      BOOL v7 = v6;
      os_log_type_t v8 = &unk_26D911F38;
      goto LABEL_6;
    case 6uLL:
      os_log_type_t v5 = (void *)MEMORY[0x263F088C8];
      BOOL v6 = [(WFNetworkSettingsViewController *)self sections];
      BOOL v7 = v6;
      os_log_type_t v8 = &unk_26D911F68;
      goto LABEL_6;
    case 7uLL:
      os_log_type_t v5 = (void *)MEMORY[0x263F088C8];
      BOOL v6 = [(WFNetworkSettingsViewController *)self sections];
      BOOL v7 = v6;
      os_log_type_t v8 = &unk_26D911F80;
LABEL_6:
      objc_msgSend(v5, "indexPathForRow:inSection:", 0, objc_msgSend(v6, "indexOfObject:", v8));
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v9 = [(WFNetworkSettingsViewController *)self tableView];
      [v9 scrollToRowAtIndexPath:v10 atScrollPosition:1 animated:1];

      break;
    default:
      return;
  }
}

- (void)_presentRenewLeaseAlertWithSourceRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  os_log_type_t v8 = WFLogForCategory(0);
  os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2257EC000, v8, v9, "User tapped renew lease", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v10 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  uint64_t v11 = (void *)MEMORY[0x263F82400];
  uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"kWFLocRenewLeaseActionSheetButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __73__WFNetworkSettingsViewController__presentRenewLeaseAlertWithSourceRect___block_invoke;
  v23[3] = &unk_264756BC8;
  objc_copyWeak(v24, buf);
  v24[1] = *(id *)&x;
  v24[2] = *(id *)&y;
  v24[3] = *(id *)&width;
  v24[4] = *(id *)&height;
  os_log_type_t v14 = [v11 actionWithTitle:v13 style:0 handler:v23];
  [v10 addAction:v14];

  long long v15 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    long long v17 = [v10 popoverPresentationController];
    long long v18 = [(WFNetworkSettingsViewController *)self view];
    [v17 setSourceView:v18];

    objc_msgSend(v17, "setSourceRect:", x, y, width, height);
  }
  uint64_t v19 = (void *)MEMORY[0x263F82400];
  id v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v21 = [v20 localizedStringForKey:@"kWFLocRenewLeaseActionSheetCancelButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  uint64_t v22 = [v19 actionWithTitle:v21 style:1 handler:&__block_literal_global_431];
  [v10 addAction:v22];

  [(WFNetworkSettingsViewController *)self presentViewController:v10 animated:1 completion:0];
  objc_destroyWeak(v24);

  objc_destroyWeak(buf);
}

void __73__WFNetworkSettingsViewController__presentRenewLeaseAlertWithSourceRect___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v18 = 136315138;
    uint64_t v19 = "-[WFNetworkSettingsViewController _presentRenewLeaseAlertWithSourceRect:]_block_invoke";
    _os_log_impl(&dword_2257EC000, v4, v5, "%s: user confirmed renew lease", (uint8_t *)&v18, 0xCu);
  }

  id v6 = objc_loadWeakRetained(v2);
  BOOL v7 = [v6 context];

  id v8 = objc_loadWeakRetained(v2);
  os_log_type_t v9 = v8;
  if (v7)
  {
    id v10 = [v8 context];
    [v10 renewLease];
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v11 = [v8 delegate];
  char v12 = objc_opt_respondsToSelector();

  os_log_type_t v9 = objc_loadWeakRetained(v2);
  uint64_t v13 = [v9 delegate];
  id v10 = v13;
  if (v12)
  {
    -[NSObject networkSettingsViewControllerDidRenewLease:sourceRect:](v13, "networkSettingsViewControllerDidRenewLease:sourceRect:", WeakRetained, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    goto LABEL_16;
  }
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    os_log_type_t v9 = objc_loadWeakRetained(v2);
    id v10 = [v9 delegate];
    [v10 networkSettingsViewControllerDidRenewLease:WeakRetained];
    goto LABEL_16;
  }
  os_log_type_t v9 = WFLogForCategory(0);
  os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9)
  {
    id v10 = v9;
    if (os_log_type_enabled(v10, v15))
    {
      id v16 = objc_loadWeakRetained(v2);
      long long v17 = [v16 delegate];
      int v18 = 136315394;
      uint64_t v19 = "-[WFNetworkSettingsViewController _presentRenewLeaseAlertWithSourceRect:]_block_invoke";
      __int16 v20 = 2112;
      double v21 = v17;
      _os_log_impl(&dword_2257EC000, v10, v15, "%s: delegate %@ doesn't respond to selector for lease renewal", (uint8_t *)&v18, 0x16u);
    }
    os_log_type_t v9 = v10;
    goto LABEL_16;
  }
LABEL_17:
}

void __73__WFNetworkSettingsViewController__presentRenewLeaseAlertWithSourceRect___block_invoke_429()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = WFLogForCategory(0);
  os_log_type_t v1 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v0 && os_log_type_enabled(v0, v1))
  {
    int v2 = 136315138;
    uint64_t v3 = "-[WFNetworkSettingsViewController _presentRenewLeaseAlertWithSourceRect:]_block_invoke";
    _os_log_impl(&dword_2257EC000, v0, v1, "%s: user cancelled renew lease", (uint8_t *)&v2, 0xCu);
  }
}

- (id)_lowDataModeFooterView
{
  if (!self->_lowDataModeFooterView)
  {
    uint64_t v3 = (UITableViewHeaderFooterView *)[objc_alloc(MEMORY[0x263F82CA0]) initWithReuseIdentifier:@"LowDataMode"];
    lowDataModeFooterView = self->_lowDataModeFooterView;
    self->_lowDataModeFooterView = v3;
  }
  if ([(WFNetworkSettingsViewController *)self _isChinaDevice])
  {
    os_log_type_t v5 = [@"kWFLocLowDataModeFooter" stringByAppendingString:@"_CH"];
  }
  else
  {
    os_log_type_t v5 = @"kWFLocLowDataModeFooter";
  }
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:v5 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  id v8 = [(UITableViewHeaderFooterView *)self->_lowDataModeFooterView textLabel];
  os_log_type_t v9 = [v8 text];
  char v10 = [v7 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(UITableViewHeaderFooterView *)self->_lowDataModeFooterView textLabel];
    [v11 setText:v7];

    char v12 = [(UITableViewHeaderFooterView *)self->_lowDataModeFooterView textLabel];
    [v12 setNumberOfLines:0];

    uint64_t v13 = [(UITableViewHeaderFooterView *)self->_lowDataModeFooterView textLabel];
    [v13 sizeToFit];
  }
  char v14 = self->_lowDataModeFooterView;

  return v14;
}

- (id)_WiFiModeFooterView
{
  wifiModeFooterView = self->_wifiModeFooterView;
  if (!wifiModeFooterView)
  {
    uint64_t v4 = (UITableViewHeaderFooterView *)[objc_alloc(MEMORY[0x263F82CA0]) initWithReuseIdentifier:@"wifiMode"];
    os_log_type_t v5 = self->_wifiModeFooterView;
    self->_wifiModeFooterView = v4;

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v7 = [v6 localizedStringForKey:@"kWFLocSettingsWiFiModeFooter" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    id v8 = [(UITableViewHeaderFooterView *)self->_wifiModeFooterView textLabel];
    [v8 setText:v7];

    os_log_type_t v9 = [(UITableViewHeaderFooterView *)self->_wifiModeFooterView textLabel];
    [v9 setNumberOfLines:0];

    char v10 = [(UITableViewHeaderFooterView *)self->_wifiModeFooterView textLabel];
    [v10 sizeToFit];

    wifiModeFooterView = self->_wifiModeFooterView;
  }
  return wifiModeFooterView;
}

- (id)_privacyProxyEnabledFooterView
{
  privacyProxyEnabledFooterView = self->_privacyProxyEnabledFooterView;
  if (!privacyProxyEnabledFooterView)
  {
    uint64_t v4 = (UITableViewHeaderFooterView *)[objc_alloc(MEMORY[0x263F82CA0]) initWithReuseIdentifier:@"ProxyEnabled"];
    os_log_type_t v5 = self->_privacyProxyEnabledFooterView;
    self->_privacyProxyEnabledFooterView = v4;

    id v6 = [(WFNetworkSettingsViewController *)self config];
    uint64_t v7 = [v6 privacyProxyTierStatus];

    if (v7 == 1)
    {
      id v8 = @"kWFLocPrivacyProxyNonSubscriberFooter";
    }
    else
    {
      os_log_type_t v9 = [(WFNetworkSettingsViewController *)self config];
      uint64_t v10 = [v9 privacyProxyTierStatus];

      if (v10 == 2) {
        id v8 = @"kWFLocPrivacyProxySubscriberFooter";
      }
      else {
        id v8 = &stru_26D8F6070;
      }
    }
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v12 = [v11 localizedStringForKey:v8 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    uint64_t v13 = [(UITableViewHeaderFooterView *)self->_privacyProxyEnabledFooterView textLabel];
    [v13 setText:v12];

    char v14 = [(UITableViewHeaderFooterView *)self->_privacyProxyEnabledFooterView textLabel];
    [v14 setNumberOfLines:0];

    os_log_type_t v15 = [(UITableViewHeaderFooterView *)self->_privacyProxyEnabledFooterView textLabel];
    [v15 sizeToFit];

    privacyProxyEnabledFooterView = self->_privacyProxyEnabledFooterView;
  }
  return privacyProxyEnabledFooterView;
}

- (id)_outrankedFooterView
{
  if (!self->_outrankedFooterView)
  {
    uint64_t v3 = (UITableViewHeaderFooterView *)[objc_alloc(MEMORY[0x263F82CA0]) initWithReuseIdentifier:@"OutrankedFooterView"];
    outrankedFooterView = self->_outrankedFooterView;
    self->_outrankedFooterView = v3;
  }
  os_log_type_t v5 = [(WFNetworkSettingsViewController *)self context];
  __int16 v6 = [v5 requestedFields];

  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v8 = [(WFNetworkSettingsViewController *)self _isChinaDevice];
  os_log_type_t v9 = @"kWFLocSettingOutrankFooter";
  if (v8) {
    os_log_type_t v9 = @"kWFLocSettingOutrankFooter_CH";
  }
  uint64_t v10 = @"kWFLocSettingPrivateOutrankFooter_CH";
  if (!v8) {
    uint64_t v10 = @"kWFLocSettingPrivateOutrankFooter";
  }
  if ((v6 & 0x4000) != 0) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
  char v12 = [v7 localizedStringForKey:v11 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  uint64_t v13 = [(UITableViewHeaderFooterView *)self->_outrankedFooterView textLabel];
  char v14 = [v13 text];
  char v15 = [v14 isEqualToString:v12];

  if ((v15 & 1) == 0)
  {
    id v16 = [(UITableViewHeaderFooterView *)self->_outrankedFooterView textLabel];
    [v16 setText:v12];

    long long v17 = [(UITableViewHeaderFooterView *)self->_outrankedFooterView textLabel];
    [v17 setNumberOfLines:0];

    int v18 = [(UITableViewHeaderFooterView *)self->_outrankedFooterView textLabel];
    [v18 sizeToFit];
  }
  uint64_t v19 = self->_outrankedFooterView;

  return v19;
}

- (WFHyperlinkFooterView)networkQualityFooterView
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (self->_networkQualityFooterView)
  {
    uint64_t v3 = [(WFNetworkSettingsViewController *)self config];
    uint64_t v4 = [v3 networkQualityDate];
    if (!v4)
    {

      goto LABEL_18;
    }
    os_log_type_t v5 = v4;
    if (self->_networkQualityFooterDate)
    {
      __int16 v6 = [(WFNetworkSettingsViewController *)self config];
      uint64_t v7 = [v6 networkQualityDate];
      char v8 = [v7 isEqual:self->_networkQualityFooterDate];

      if (v8) {
        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  os_log_type_t v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v9)
  {
    uint64_t v11 = v9;
    if (os_log_type_enabled(v11, v10))
    {
      char v12 = [(WFNetworkSettingsViewController *)self config];
      uint64_t v13 = [v12 networkQualityDate];
      char v14 = [(WFNetworkSettingsViewController *)self config];
      [v14 networkQualityResponsiveness];
      networkQualityFooterView = self->_networkQualityFooterView;
      long long v17 = "YES";
      networkQualityFooterDate = self->_networkQualityFooterDate;
      uint64_t v43 = "-[WFNetworkSettingsViewController networkQualityFooterView]";
      *(_DWORD *)buf = 136316162;
      __int16 v44 = 2112;
      if (!networkQualityFooterView) {
        long long v17 = "NO";
      }
      double v45 = v13;
      __int16 v46 = 2048;
      uint64_t v47 = v15;
      __int16 v48 = 2080;
      double v49 = v17;
      __int16 v50 = 2112;
      double v51 = networkQualityFooterDate;
      _os_log_impl(&dword_2257EC000, v11, v10, "NetQuality: %s: Date is %@, responsiveness %.3f, existing view? %s existing date? %@", buf, 0x34u);
    }
  }

  uint64_t v19 = objc_alloc_init(WFHyperlinkFooterView);
  __int16 v20 = self->_networkQualityFooterView;
  self->_networkQualityFooterView = v19;

  double v21 = [(WFNetworkSettingsViewController *)self config];
  uint64_t v22 = [v21 networkQualityDate];

  if (v22)
  {
    double v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v41 = [v23 localizedStringForKey:@"kWFLocNetworkQualityFooterKnown" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v25 = [v24 localizedStringForKey:@"kWFLocNetworkQualityFooterLink" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    char v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v27 = [v26 localizedStringForKey:@"kWFLocNetworkQualityFooterLastChecked" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    double v28 = objc_opt_new();
    [v28 setDateStyle:1];
    [v28 setTimeStyle:1];
    [v28 setDoesRelativeDateFormatting:1];
    BOOL v29 = [NSString stringWithFormat:@"%@ %@", v41, v25];
    v30 = NSString;
    uint64_t v31 = [(WFNetworkSettingsViewController *)self config];
    id v32 = [v31 networkQualityDate];
    uint64_t v33 = [v28 stringFromDate:v32];
    v34 = [v30 stringWithFormat:@"%@\n%@ %@", v29, v27, v33];

    os_log_type_t v35 = [(WFNetworkSettingsViewController *)self config];
    uint64_t v36 = [v35 networkQualityDate];
    id v37 = (NSDate *)[v36 copy];
    os_log_type_t v38 = self->_networkQualityFooterDate;
    self->_networkQualityFooterDate = v37;

    [(WFHyperlinkFooterView *)self->_networkQualityFooterView setText:v34];
    -[WFHyperlinkFooterView setLinkRange:](self->_networkQualityFooterView, "setLinkRange:", [v29 length] - objc_msgSend(v25, "length"), objc_msgSend(v25, "length"));
    [(WFHyperlinkFooterView *)self->_networkQualityFooterView setTarget:self];
    [(WFHyperlinkFooterView *)self->_networkQualityFooterView setAction:sel__openNetworkQualityDetails_];
  }
  else
  {
    [(WFHyperlinkFooterView *)self->_networkQualityFooterView setText:0];
  }
LABEL_18:
  id v39 = self->_networkQualityFooterView;
  return v39;
}

- (void)_networkQualityOpenURL
{
  id v6 = [MEMORY[0x263F82438] sharedApplication];
  int v2 = NSURL;
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"kWFLocNetworkQualityKBURL" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  os_log_type_t v5 = [v2 URLWithString:v4];
  [v6 openURL:v5 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (void)_openNetworkQualityDetails:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F5B908]);
  os_log_type_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  id v28 = (id)[v4 initWithTitle:v6 detailText:0 symbolName:0 contentLayout:2];

  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v8 = [v7 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection1Title" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  os_log_type_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if ([(WFNetworkSettingsViewController *)self _isChinaDevice]) {
    os_log_type_t v10 = @"kWFLocNetworkQualityLearnMoreSection1TextCH";
  }
  else {
    os_log_type_t v10 = @"kWFLocNetworkQualityLearnMoreSection1Text";
  }
  uint64_t v11 = [v9 localizedStringForKey:v10 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v28 addSectionWithHeader:v8 content:v11];

  char v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection2Title" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection2Text" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v28 addSectionWithHeader:v13 content:v15];

  id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v17 = [v16 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection3Title" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  int v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v19 = [v18 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection3Text" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v28 addSectionWithHeader:v17 content:v19];

  __int16 v20 = [MEMORY[0x263F5B900] accessoryButton];
  double v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v22 = [v21 localizedStringForKey:@"kWFLocNetworkQualityKBURL" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v20 setTitle:v22 forState:0];

  [v20 addTarget:self action:sel__networkQualityOpenURL forControlEvents:64];
  double v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v24 = [v23 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection4Text" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v28 addSectionWithHeader:0 content:v24 accessoryButton:v20];

  id v25 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_donePressed];
  char v26 = [v28 navigationItem];
  [v26 setRightBarButtonItem:v25];

  double v27 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v28];
  [(WFNetworkSettingsViewController *)self presentViewController:v27 animated:1 completion:0];
}

- (void)donePressed
{
  id v2 = [(WFNetworkSettingsViewController *)self presentedViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (id)_randomMACFooterView
{
  if (!self->_randomMACFooterView)
  {
    uint64_t v3 = (UITableViewHeaderFooterView *)[objc_alloc(MEMORY[0x263F82CA0]) initWithReuseIdentifier:@"RandomMAC"];
    randomMACFooterView = self->_randomMACFooterView;
    self->_randomMACFooterView = v3;

    os_log_type_t v5 = [(UITableViewHeaderFooterView *)self->_randomMACFooterView textLabel];
    [v5 setNumberOfLines:0];

    id v6 = [(UITableViewHeaderFooterView *)self->_randomMACFooterView textLabel];
    [v6 sizeToFit];
  }
  uint64_t v7 = [(WFNetworkSettingsViewController *)self _randomMACFooterTextToDisplay];
  char v8 = [(UITableViewHeaderFooterView *)self->_randomMACFooterView textLabel];
  [v8 setText:v7];

  os_log_type_t v9 = self->_randomMACFooterView;
  return v9;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    uint64_t v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      char v8 = [v4 userInfo];
      int v11 = 136315394;
      char v12 = "-[WFNetworkSettingsViewController _contentSizeCategoryDidChange:]";
      __int16 v13 = 2112;
      char v14 = v8;
      _os_log_impl(&dword_2257EC000, v7, v6, "%s: size changed to %@", (uint8_t *)&v11, 0x16u);
    }
  }

  lowDataModeFooterView = self->_lowDataModeFooterView;
  self->_lowDataModeFooterView = 0;

  networkQualityFooterView = self->_networkQualityFooterView;
  self->_networkQualityFooterView = 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_portalURL
{
  uint64_t v3 = [(WFNetworkSettingsViewController *)self context];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    os_log_type_t v5 = [(WFNetworkSettingsViewController *)self context];
    os_log_type_t v6 = [v5 portalURL];
  }
  else
  {
    os_log_type_t v6 = 0;
  }
  return v6;
}

- (id)_wifiPasswordContextOptions
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = &unk_26D912028;
  uint64_t v3 = [(WFNetworkSettingsViewController *)self _passcodePromptForViewingPasswords];
  v7[1] = &unk_26D912040;
  v8[0] = v3;
  char v4 = [(WFNetworkSettingsViewController *)self _touchIDPromptForViewingPasswords];
  v8[1] = v4;
  os_log_type_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)_passcodePromptForViewingPasswords
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"kWFLocPasswordConfirmationViewPassword" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v3;
}

- (id)_touchIDPromptForViewingPasswords
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"kWFLocTouchIDConfirmationViewPassword" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v3;
}

- (BOOL)_isAutoJoinConfigurable
{
  uint64_t v3 = [(WFNetworkSettingsViewController *)self context];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  os_log_type_t v5 = [(WFNetworkSettingsViewController *)self context];
  BOOL v6 = [v5 autoJoinConfigurable] == 0;

  return v6;
}

- (void)_setupAccessoryHeader
{
  uint64_t v3 = [(WFNetworkSettingsViewController *)self context];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    os_log_type_t v5 = (void *)MEMORY[0x263EFAC08];
    BOOL v6 = [(WFNetworkSettingsViewController *)self context];
    uint64_t v7 = [v6 daDevice];
    id v20 = [v5 infoViewControllerFromDevice:v7];

    if (v20)
    {
      [(WFNetworkSettingsViewController *)self addChildViewController:v20];
      [v20 preferredContentSize];
      double v9 = v8;
      os_log_type_t v10 = [v20 view];
      [v10 setTranslatesAutoresizingMaskIntoConstraints:1];

      int v11 = [v20 view];
      [v11 setAutoresizingMask:2];

      char v12 = [(WFNetworkSettingsViewController *)self view];
      [v12 bounds];
      double v14 = v13;
      uint64_t v15 = [v20 view];
      objc_msgSend(v15, "setFrame:", 0.0, 0.0, v14, v9);

      [(WFNetworkSettingsViewController *)self setAccessoryInfoController:v20];
      id v16 = [v20 view];
      long long v17 = [(WFNetworkSettingsViewController *)self tableView];
      [v17 setTableHeaderView:v16];

      [v20 didMoveToParentViewController:self];
    }
  }
  else
  {
    int v18 = WFLogForCategory(0);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2257EC000, v18, v19, "Not setting up AccessoryHeader because current context hasn't implemented daDevice", buf, 2u);
    }
  }
}

- (void)_applicationWillResignActive:(id)a3
{
  if (self->_allowViewPassword)
  {
    objc_msgSend(MEMORY[0x263F82950], "sharedMenuController", a3);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 hideMenu];
  }
}

- (void)_updateManagedNetworkHeader
{
  if ([(WFNetworkSettingsViewController *)self showManagedNetworkHeader]
    && ([(WFNetworkSettingsViewController *)self context],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    os_log_type_t v5 = [(WFNetworkSettingsViewController *)self tableView];
    [v5 bounds];
    double v7 = v6;

    id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, v7, 0.0);
    double v8 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", 0.0, 0.0, v7, 100.0);
    double v9 = [MEMORY[0x263F825C8] colorWithRed:0.427450985 green:0.427450985 blue:0.447058827 alpha:1.0];
    [v8 setTextColor:v9];

    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setNumberOfLines:0];
    [v8 setTextAlignment:0];
    os_log_type_t v10 = [(WFNetworkSettingsViewController *)self context];
    uint64_t v11 = [v10 networkOrigin];

    char v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v13 = v12;
    if (v11 == 1) {
      double v14 = @"kWFLocManagedCarrierNetworkTitle";
    }
    else {
      double v14 = @"kWFLocManagedProfileNetworkTitle";
    }
    uint64_t v15 = [v12 localizedStringForKey:v14 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    [v8 setFont:v16];

    [v8 setText:v15];
    [v27 addSubview:v8];
    long long v17 = (void *)MEMORY[0x263F08938];
    int v18 = _NSDictionaryOfVariableBindings(&cfstr_Headerlabel.isa, v8, 0);
    os_log_type_t v19 = [v17 constraintsWithVisualFormat:@"V:|-10-[headerLabel]-10-|" options:0 metrics:0 views:v18];
    [v27 addConstraints:v19];

    id v20 = (void *)MEMORY[0x263F08938];
    double v21 = _NSDictionaryOfVariableBindings(&cfstr_Headerlabel.isa, v8, 0);
    uint64_t v22 = [v20 constraintsWithVisualFormat:@"|-40-[headerLabel]-40-|" options:0 metrics:0 views:v21];
    [v27 addConstraints:v22];

    double v23 = [MEMORY[0x263F08938] constraintWithItem:v27 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v7];
    [v27 addConstraint:v23];
    objc_msgSend(v27, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
    double v25 = v24 + 40.0;
    [v27 removeConstraint:v23];
    objc_msgSend(v27, "setFrame:", 0.0, 0.0, v7, v25);
    [v27 setTranslatesAutoresizingMaskIntoConstraints:1];
    [v8 setPreferredMaxLayoutWidth:v7];
    char v26 = [(WFNetworkSettingsViewController *)self tableView];
    [v26 setTableHeaderView:v27];
  }
  else
  {
    id v27 = [(WFNetworkSettingsViewController *)self tableView];
    [v27 setTableHeaderView:0];
  }
}

- (void)_didStartPresentingDetailViewController
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v5 = 136315394;
    double v6 = "-[WFNetworkSettingsViewController _didStartPresentingDetailViewController]";
    __int16 v7 = 2112;
    double v8 = self;
    _os_log_impl(&dword_2257EC000, v3, v4, "%s: %@", (uint8_t *)&v5, 0x16u);
  }

  self->_detailViewControllerVisible = 1;
}

- (void)_didDismissDetailViewController
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v5 = 136315394;
    double v6 = "-[WFNetworkSettingsViewController _didDismissDetailViewController]";
    __int16 v7 = 2112;
    double v8 = self;
    _os_log_impl(&dword_2257EC000, v3, v4, "%s: %@", (uint8_t *)&v5, 0x16u);
  }

  self->_detailViewControllerVisible = 0;
}

- (WFNetworkSettingsViewControllerDataCoordinator)dataCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);
  return (WFNetworkSettingsViewControllerDataCoordinator *)WeakRetained;
}

- (void)setDataCoordinator:(id)a3
{
}

- (WFNetworkSettingsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFNetworkSettingsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFNetworkSettingsConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (BOOL)detailViewControllerVisible
{
  return self->_detailViewControllerVisible;
}

- (void)setDetailViewControllerVisible:(BOOL)a3
{
  self->_detailViewControllerVisible = a3;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (void)setDeviceCapability:(int64_t)a3
{
  self->_deviceCapabilitdouble y = a3;
}

- (NSArray)sections
{
  return (NSArray *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setSections:(id)a3
{
}

- (NSArray)autoJoinSectionRows
{
  return (NSArray *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setAutoJoinSectionRows:(id)a3
{
}

- (WFNetworkSettingsCellFactory)cellFactory
{
  return self->_cellFactory;
}

- (void)setCellFactory:(id)a3
{
}

- (NSAttributedString)recommendationLinkAttributedString
{
  return self->_recommendationLinkAttributedString;
}

- (void)setRecommendationLinkAttributedString:(id)a3
{
}

- (void)setLinkFooterView:(id)a3
{
}

- (void)setNetworkQualityFooterView:(id)a3
{
}

- (void)setAutoJoinSwitch:(id)a3
{
}

- (void)setAutoLoginSwitch:(id)a3
{
}

- (void)setSaveDataModeSwitch:(id)a3
{
}

- (void)setPrivacyProxyEnabledSwitch:(id)a3
{
}

- (void)setNetworkQualityCell:(id)a3
{
}

- (NSDate)networkQualityFooterDate
{
  return self->_networkQualityFooterDate;
}

- (void)setNetworkQualityFooterDate:(id)a3
{
}

- (void)setRandomMACSwitch:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (WFDetailsProviderContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (UIAlertController)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (void)setRandomMACAddress:(id)a3
{
}

- (BOOL)isUsingRandomMac
{
  return self->_isUsingRandomMac;
}

- (void)setIsUsingRandomMac:(BOOL)a3
{
  self->_isUsingRandomMac = a3;
}

- (BOOL)randomFeatureEnabled
{
  return self->_randomFeatureEnabled;
}

- (void)setRandomFeatureEnabled:(BOOL)a3
{
  self->_randomFeatureEnabled = a3;
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
}

- (BOOL)networkQualitySpinning
{
  return self->_networkQualitySpinning;
}

- (void)setNetworkQualitySpinning:(BOOL)a3
{
  self->_networkQualitySpinning = a3;
}

- (BOOL)allowViewPassword
{
  return self->_allowViewPassword;
}

- (void)setAllowViewPassword:(BOOL)a3
{
  self->_allowViewPassword = a3;
}

- (BOOL)credentailCellTapped
{
  return self->_credentailCellTapped;
}

- (void)setCredentailCellTapped:(BOOL)a3
{
  self->_credentailCellTapped = a3;
}

- (BOOL)showManagedNetworkHeader
{
  return self->_showManagedNetworkHeader;
}

- (void)setShowManagedNetworkHeader:(BOOL)a3
{
  self->_showManagedNetworkHeader = a3;
}

- (BOOL)isDeviceInDemoMode
{
  return self->_isDeviceInDemoMode;
}

- (void)setIsDeviceInDemoMode:(BOOL)a3
{
  self->_BOOL isDeviceInDemoMode = a3;
}

- (BOOL)isDemoModeAlertShowing
{
  return self->_isDemoModeAlertShowing;
}

- (void)setIsDemoModeAlertShowing:(BOOL)a3
{
  self->_isDemoModeAlertShowing = a3;
}

- (unint64_t)scrollToCellType
{
  return self->_scrollToCellType;
}

- (void)setScrollToCellType:(unint64_t)a3
{
  self->_scrollToCellType = a3;
}

- (BOOL)isRandomMACManageFeatureEnabled
{
  return self->_isRandomMACManageFeatureEnabled;
}

- (void)setIsRandomMACManageFeatureEnabled:(BOOL)a3
{
  self->_isRandomMACManageFeatureEnabled = a3;
}

- (unint64_t)privateAddressMode
{
  return self->_privateAddressMode;
}

- (void)setPrivateAddressMode:(unint64_t)a3
{
  self->_privateAddressMode = a3;
}

- (BOOL)isRotatingTurnedOnForMigratedNetwork
{
  return self->_isRotatingTurnedOnForMigratedNetwork;
}

- (void)setIsRotatingTurnedOnForMigratedNetwork:(BOOL)a3
{
  self->_isRotatingTurnedOnForMigratedNetwork = a3;
}

- (UIViewController)accessoryInfoController
{
  return self->_accessoryInfoController;
}

- (void)setAccessoryInfoController:(id)a3
{
}

- (BOOL)isAccessory
{
  return self->_accessory;
}

- (void)setAccessory:(BOOL)a3
{
  self->_accessordouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryInfoController, 0);
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_randomMACSwitch, 0);
  objc_storeStrong((id *)&self->_networkQualityFooterDate, 0);
  objc_storeStrong((id *)&self->_networkQualityCell, 0);
  objc_storeStrong((id *)&self->_privacyProxyEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_saveDataModeSwitch, 0);
  objc_storeStrong((id *)&self->_autoLoginSwitch, 0);
  objc_storeStrong((id *)&self->_autoJoinSwitch, 0);
  objc_storeStrong((id *)&self->_networkQualityFooterView, 0);
  objc_storeStrong((id *)&self->_linkFooterView, 0);
  objc_storeStrong((id *)&self->_recommendationLinkAttributedString, 0);
  objc_storeStrong((id *)&self->_cellFactory, 0);
  objc_storeStrong((id *)&self->_autoJoinSectionRows, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong((id *)&self->_managedNetworkHeaderView, 0);
  objc_storeStrong((id *)&self->_outrankedFooterView, 0);
  objc_storeStrong((id *)&self->_randomMACFooterView, 0);
  objc_storeStrong((id *)&self->_privacyProxyEnabledFooterView, 0);
  objc_storeStrong((id *)&self->_lowDataModeFooterView, 0);
  objc_storeStrong((id *)&self->_wifiModeFooterView, 0);
}

@end