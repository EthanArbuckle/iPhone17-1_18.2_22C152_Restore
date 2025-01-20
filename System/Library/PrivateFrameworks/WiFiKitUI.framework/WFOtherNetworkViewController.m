@interface WFOtherNetworkViewController
- (BOOL)WAPIEnabled;
- (BOOL)WPA2EnterpriseEnabledMFPCapable;
- (BOOL)WPA3EnterpriseEnabled;
- (BOOL)WPA3PersonalEnabled;
- (BOOL)_canShowModes;
- (BOOL)_canShowWhileLocked;
- (BOOL)isUsingRandomAddress;
- (BOOL)joinable;
- (BOOL)joining;
- (BOOL)overrideDefaultSecurity;
- (BOOL)passwordRequired;
- (BOOL)shouldCancelContextWhenViewDisappear;
- (BOOL)supportsWiFiPasswordSharing;
- (BOOL)wantsModalPresentation;
- (NSArray)TLSIdentities;
- (NSArray)WAPIIdentities;
- (NSArray)WAPIRootCertificates;
- (NSOrderedSet)sections;
- (NSOrderedSet)securityRows;
- (NSString)activityString;
- (NSString)defaultActivityString;
- (NSString)details;
- (NSString)hardwareMACAddress;
- (NSString)networkName;
- (NSString)password;
- (NSString)randomMACAddress;
- (NSString)username;
- (UIColor)backgroundColor;
- (WFAppearanceProxy)appearanceProxy;
- (WFCredentialsProviderContext)context;
- (WFOtherNetworkViewController)initWithCredentialsProviderContext:(id)a3 deviceCapability:(int64_t)a4 appearanceProxy:(id)a5;
- (WFOtherNetworkViewController)initWithOtherNetworkProviderContext:(id)a3 deviceCapability:(int64_t)a4 appearanceProxy:(id)a5;
- (WFOtherNetworkViewController)initWithOtherNetworkStyle:(int64_t)a3;
- (WFOtherNetworkViewController)initWithOtherNetworkStyle:(int64_t)a3 withTableStyle:(int64_t)a4;
- (WFOtherNetworkViewControllerDelegate)delegate;
- (WFTextFieldCell)mostRecentFirstResponder;
- (WFTextFieldCell)nameCell;
- (WFTextFieldCell)passwordCell;
- (WFTextFieldCell)usernameCell;
- (WFValueListViewController)privateAddressModeTitlesValueVC;
- (WFValueListViewController)profileModeTitlesValueVC;
- (WFValueListViewController)securityTitlesValueVC;
- (__SecIdentity)TLSIdentity;
- (id)WAPIIdentity;
- (id)WAPIRootCertificate;
- (id)_TLSIdentityDescription;
- (id)_WAPIIdentityDescription;
- (id)_WAPIRootCertificateDescription;
- (id)_availableProfileModeTitles;
- (id)_availableProfileModes;
- (id)_availableSecurityModes;
- (id)_availableSecurityTitles;
- (id)_profileModeStringFromType:(int64_t)a3;
- (id)_sectionsForStyle:(int64_t)a3;
- (id)_securityRowsForStyle:(int64_t)a3;
- (id)_securityStringFromType:(int64_t)a3;
- (id)_selectedPrivateModeForOption:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_profileModeFromTitle:(id)a3;
- (int64_t)_returnKeyType;
- (int64_t)_securityModeFromTitle:(id)a3;
- (int64_t)deviceCapability;
- (int64_t)firstResponderCell;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)profileMode;
- (int64_t)securityMode;
- (int64_t)style;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_selectedPrivateModeForString:(id)a3;
- (unint64_t)privateAddressMode;
- (void)_dismiss:(id)a3;
- (void)_join:(id)a3;
- (void)_scrollToCellAndBecomeFirstResponder:(id)a3;
- (void)_setFirstResponderAfterCell:(id)a3;
- (void)_setTLSIdentity:(id)a3 specifier:(id)a4;
- (void)_setWAPIIdentity:(id)a3 specifier:(id)a4;
- (void)_setWAPIRootCertificate:(id)a3 specifier:(id)a4;
- (void)_updateJoinable;
- (void)_updateSections;
- (void)dealloc;
- (void)orientationChanged:(id)a3;
- (void)receiveSharedPassword:(id)a3;
- (void)resetFirstResponder;
- (void)setActivityString:(id)a3;
- (void)setAppearanceProxy:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefaultActivityString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDeviceCapability:(int64_t)a3;
- (void)setFirstResponderCell:(int64_t)a3;
- (void)setHardwareMACAddress:(id)a3;
- (void)setIsUsingRandomAddress:(BOOL)a3;
- (void)setJoinable:(BOOL)a3;
- (void)setJoining:(BOOL)a3;
- (void)setMostRecentFirstResponder:(id)a3;
- (void)setNameCell:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setOverrideDefaultSecurity:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordCell:(id)a3;
- (void)setPasswordRequired:(BOOL)a3;
- (void)setPrivateAddressMode:(unint64_t)a3;
- (void)setPrivateAddressModeTitlesValueVC:(id)a3;
- (void)setProfileMode:(int64_t)a3;
- (void)setProfileModeTitlesValueVC:(id)a3;
- (void)setRandomMACAddress:(id)a3;
- (void)setSections:(id)a3;
- (void)setSecurityMode:(int64_t)a3;
- (void)setSecurityRows:(id)a3;
- (void)setSecurityTitlesValueVC:(id)a3;
- (void)setShouldCancelContextWhenViewDisappear:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSupportsWiFiPasswordSharing:(BOOL)a3;
- (void)setTLSIdentities:(id)a3;
- (void)setTLSIdentity:(__SecIdentity *)a3;
- (void)setUsername:(id)a3;
- (void)setUsernameCell:(id)a3;
- (void)setWAPIEnabled:(BOOL)a3;
- (void)setWAPIIdentities:(id)a3;
- (void)setWAPIIdentity:(id)a3;
- (void)setWAPIRootCertificate:(id)a3;
- (void)setWAPIRootCertificates:(id)a3;
- (void)setWPA2EnterpriseEnabledMFPCapable:(BOOL)a3;
- (void)setWPA3EnterpriseEnabled:(BOOL)a3;
- (void)setWPA3PersonalEnabled:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WFOtherNetworkViewController

- (WFOtherNetworkViewController)initWithOtherNetworkStyle:(int64_t)a3 withTableStyle:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)WFOtherNetworkViewController;
  v5 = [(WFOtherNetworkViewController *)&v12 initWithStyle:a4];
  v6 = v5;
  if (v5)
  {
    v5->_style = a3;
    v5->_passwordRequired = 1;
    v5->_firstResponderCell = -1;
    v5->_profileMode = -1;
    v5->_WAPIEnabled = 0;
    v5->_wantsModalPresentation = 1;
    v5->_overrideDefaultSecurity = 1;
    uint64_t v7 = [(WFOtherNetworkViewController *)v5 _sectionsForStyle:a3];
    sections = v6->_sections;
    v6->_sections = (NSOrderedSet *)v7;

    uint64_t v9 = [(WFOtherNetworkViewController *)v6 _securityRowsForStyle:a3];
    securityRows = v6->_securityRows;
    v6->_securityRows = (NSOrderedSet *)v9;

    v6->_shouldCancelContextWhenViewDisappear = 1;
  }
  return v6;
}

- (WFOtherNetworkViewController)initWithOtherNetworkStyle:(int64_t)a3
{
  return [(WFOtherNetworkViewController *)self initWithOtherNetworkStyle:a3 withTableStyle:1];
}

- (WFOtherNetworkViewController)initWithOtherNetworkProviderContext:(id)a3 deviceCapability:(int64_t)a4 appearanceProxy:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(WFOtherNetworkViewController *)self initWithOtherNetworkStyle:3];
  if (v11)
  {
    v23.receiver = v11;
    v23.super_class = (Class)WFOtherNetworkViewController;
    v11 = -[WFOtherNetworkViewController initWithStyle:](&v23, sel_initWithStyle_, [v10 tableViewStyle]);
    v11->_deviceCapability = a4;
    objc_storeStrong((id *)&v11->_context, a3);
    v11->_isUsingRandomAddress = [v9 isUsingRandomMACAddress];
    uint64_t v12 = [v9 randomMACAddress];
    randomMACAddress = v11->_randomMACAddress;
    v11->_randomMACAddress = (NSString *)v12;

    uint64_t v14 = [v9 hardwareMACAddress];
    hardwareMACAddress = v11->_hardwareMACAddress;
    v11->_hardwareMACAddress = (NSString *)v14;

    v11->_WAPIEnabled = [v9 availableAuthTraits] & 1;
    v11->_WPA3PersonalEnabled = ([v9 availableAuthTraits] & 2) != 0;
    v11->_WPA3EnterpriseEnabled = ([v9 availableAuthTraits] & 4) != 0;
    v11->_WPA2EnterpriseEnabledMFPCapable = ([v9 availableAuthTraits] & 8) != 0;
    uint64_t v16 = [v9 availableTLSIdentities];
    TLSIdentities = v11->_TLSIdentities;
    v11->_TLSIdentities = (NSArray *)v16;

    uint64_t v18 = [v9 WAPIRootCertificates];
    WAPIRootCertificates = v11->_WAPIRootCertificates;
    v11->_WAPIRootCertificates = (NSArray *)v18;

    uint64_t v20 = [v9 WAPIIdentities];
    WAPIIdentities = v11->_WAPIIdentities;
    v11->_WAPIIdentities = (NSArray *)v20;

    v11->_overrideDefaultSecurity = 1;
    v11->_profileMode = 0;
    objc_storeStrong((id *)&v11->_appearanceProxy, a5);
  }

  return v11;
}

- (WFOtherNetworkViewController)initWithCredentialsProviderContext:(id)a3 deviceCapability:(int64_t)a4 appearanceProxy:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  v11 = -[WFOtherNetworkViewController initWithOtherNetworkStyle:](self, "initWithOtherNetworkStyle:", [v9 isEnterprise]);
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_deviceCapability = a4;
    objc_storeStrong((id *)&v11->_context, a3);
    v13 = [v9 network];
    uint64_t v14 = [v13 ssid];
    networkName = v12->_networkName;
    v12->_networkName = (NSString *)v14;

    v43.receiver = v12;
    v43.super_class = (Class)WFOtherNetworkViewController;
    uint64_t v12 = -[WFOtherNetworkViewController initWithStyle:](&v43, sel_initWithStyle_, [v10 tableViewStyle]);
    objc_storeStrong((id *)&v12->_appearanceProxy, a5);
    if ([v9 isEnterprise])
    {
      uint64_t v16 = [v9 username];
      username = v12->_username;
      v12->_username = (NSString *)v16;

      v12->_securityMode = 5;
      v12->_overrideDefaultSecurity = 0;
      [(WFOtherNetworkViewController *)v12 _updateSections];
      uint64_t v18 = WFLogForCategory(0);
      os_log_type_t v19 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v18 && os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[WFOtherNetworkViewController initWithCredentialsProviderContext:deviceCapability:appearanceProxy:]";
        _os_log_impl(&dword_2257EC000, v18, v19, "%s: enterprise context", buf, 0xCu);
      }
    }
    v12->_WAPIEnabled = [v9 availableAuthTraits] & 1;
    v12->_WPA3PersonalEnabled = ([v9 availableAuthTraits] & 2) != 0;
    v12->_WPA3EnterpriseEnabled = ([v9 availableAuthTraits] & 4) != 0;
    v12->_WPA2EnterpriseEnabledMFPCapable = ([v9 availableAuthTraits] & 8) != 0;
    char v20 = [v9 requestedFields];
    v12->_passwordRequired = v20 & 1;
    if ((v20 & 1) == 0)
    {
      v21 = WFLogForCategory(0);
      os_log_type_t v22 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v21)
      {
        objc_super v23 = v21;
        if (os_log_type_enabled(v23, v22))
        {
          v24 = [v9 network];
          *(_DWORD *)buf = 136315394;
          v45 = "-[WFOtherNetworkViewController initWithCredentialsProviderContext:deviceCapability:appearanceProxy:]";
          __int16 v46 = 2112;
          v47 = v24;
          _os_log_impl(&dword_2257EC000, v23, v22, "%s: password not required for %@", buf, 0x16u);
        }
      }
    }
    uint64_t v25 = [v9 availableTLSIdentities];
    TLSIdentities = v12->_TLSIdentities;
    v12->_TLSIdentities = (NSArray *)v25;

    if (v12->_TLSIdentities && v12->_profileMode == -1)
    {
      v12->_profileMode = 0;
      [(WFOtherNetworkViewController *)v12 _updateSections];
      v27 = WFLogForCategory(0);
      os_log_type_t v28 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v27 && os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[WFOtherNetworkViewController initWithCredentialsProviderContext:deviceCapability:appearanceProxy:]";
        _os_log_impl(&dword_2257EC000, v27, v28, "%s: profileMode is automatic due to TLSIdentities", buf, 0xCu);
      }
    }
    v29 = WFLogForCategory(0);
    os_log_type_t v30 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v29)
    {
      v31 = v29;
      if (os_log_type_enabled(v31, v30))
      {
        int v32 = [v9 isPasswordSharingSupported];
        *(_DWORD *)buf = 136315394;
        v45 = "-[WFOtherNetworkViewController initWithCredentialsProviderContext:deviceCapability:appearanceProxy:]";
        __int16 v46 = 1024;
        LODWORD(v47) = v32;
        _os_log_impl(&dword_2257EC000, v31, v30, "%s: passwordSharingSupported %d", buf, 0x12u);
      }
    }
    if ([v9 isPasswordSharingSupported])
    {
      if (WFCapabilityIsChinaDevice(a4))
      {
        v33 = [@"kWFLocPasswordSharingDetails" stringByAppendingString:@"_CH"];
      }
      else
      {
        v33 = @"kWFLocPasswordSharingDetails";
      }
      v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v39 = [v36 localizedStringForKey:v33 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    }
    else
    {
      v34 = [v9 securityIssue];

      if (!v34)
      {
        v39 = 0;
        goto LABEL_35;
      }
      v35 = NSString;
      v33 = [v9 securityIssue];
      v36 = [(__CFString *)v33 issueDescription];
      v37 = [v9 securityIssue];
      v38 = [v37 issueRecommendation];
      v39 = [v35 stringWithFormat:@"%@\n\n%@", v36, v38];
    }
LABEL_35:
    details = v12->_details;
    v12->_details = v39;
    v41 = v39;

    [(WFAppearanceProxy *)v12->_appearanceProxy apply];
  }

  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WFOtherNetworkViewController;
  [(WFOtherNetworkViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v48.receiver = self;
  v48.super_class = (Class)WFOtherNetworkViewController;
  [(WFOtherNetworkViewController *)&v48 viewDidLoad];
  v3 = [(WFOtherNetworkViewController *)self backgroundColor];

  if (v3)
  {
    objc_super v4 = [(WFOtherNetworkViewController *)self backgroundColor];
    v5 = [(WFOtherNetworkViewController *)self tableView];
    [v5 setBackgroundColor:v4];
  }
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__updateJoinable name:*MEMORY[0x263F83808] object:0];

  if (self->_overrideDefaultSecurity)
  {
    if ([(WFOtherNetworkViewController *)self WPA3PersonalEnabled]) {
      uint64_t v7 = 9;
    }
    else {
      uint64_t v7 = 3;
    }
    [(WFOtherNetworkViewController *)self setSecurityMode:v7];
  }
  int64_t style = self->_style;
  if (style)
  {
    if (style == 3)
    {
      uint64_t v9 = 0;
    }
    else
    {
      if (style != 1) {
        goto LABEL_15;
      }
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 2;
  }
  [(WFOtherNetworkViewController *)self setFirstResponderCell:v9];
LABEL_15:
  id v10 = (void *)MEMORY[0x263F829D0];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v10 nibWithNibName:@"WFTextFieldCell" bundle:v11];

  v13 = [(WFOtherNetworkViewController *)self tableView];
  [v13 registerNib:v12 forCellReuseIdentifier:@"kWFTextFieldCellIdentifier"];

  uint64_t v14 = [(WFOtherNetworkViewController *)self tableView];
  [v14 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kWFOtherNetworkHeaderIdentifier"];

  v15 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__dismiss_];
  uint64_t v16 = [(WFOtherNetworkViewController *)self navigationItem];
  [v16 setLeftBarButtonItem:v15];

  id v17 = objc_alloc(MEMORY[0x263F824A8]);
  uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  os_log_type_t v19 = [v18 localizedStringForKey:@"kWFLocOtherNetworksJoinButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v20 = (void *)[v17 initWithTitle:v19 style:2 target:self action:sel__join_];
  v21 = [(WFOtherNetworkViewController *)self navigationItem];
  [v21 setRightBarButtonItem:v20];

  os_log_type_t v22 = [(WFOtherNetworkViewController *)self navigationItem];
  objc_super v23 = [v22 rightBarButtonItem];
  [v23 setEnabled:0];

  [(WFOtherNetworkViewController *)self setJoinable:0];
  int64_t v24 = [(WFOtherNetworkViewController *)self style];
  uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v26 = v25;
  if (v24 == 3)
  {
    v27 = [v25 localizedStringForKey:@"kWFLocOtherNetworksTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    [(WFOtherNetworkViewController *)self setTitle:v27];

    os_log_type_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"kWFLocOtherNetworksPrompt" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    [(WFOtherNetworkViewController *)self setActivityString:v29];
  }
  else
  {
    os_log_type_t v30 = [v25 localizedStringForKey:@"kWFLocOtherNetworksPasswordTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    [(WFOtherNetworkViewController *)self setTitle:v30];

    v31 = NSString;
    os_log_type_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"kWFLocPasswordAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    int v32 = [(WFOtherNetworkViewController *)self networkName];
    v33 = objc_msgSend(v31, "stringWithFormat:", v29, v32);
    [(WFOtherNetworkViewController *)self setActivityString:v33];
  }
  v34 = [(WFOtherNetworkViewController *)self activityString];
  [(WFOtherNetworkViewController *)self setDefaultActivityString:v34];

  v35 = [MEMORY[0x263F82670] currentDevice];
  [v35 beginGeneratingDeviceOrientationNotifications];

  v36 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v37 = *MEMORY[0x263F834A8];
  v38 = [MEMORY[0x263F82670] currentDevice];
  [v36 addObserver:self selector:sel_orientationChanged_ name:v37 object:v38];

  double v39 = *MEMORY[0x263F839B8];
  v40 = [(WFOtherNetworkViewController *)self tableView];
  [v40 setRowHeight:v39];

  v41 = [(WFOtherNetworkViewController *)self tableView];
  [v41 setEstimatedRowHeight:44.0];

  self->_privateAddressMode = 1;
  v42 = WFLogForCategory(0);
  os_log_type_t v43 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v42)
  {
    v44 = v42;
    if (os_log_type_enabled(v44, v43))
    {
      int v45 = [(WFOtherNetworkViewController *)self style];
      int v46 = [(WFOtherNetworkViewController *)self securityMode];
      v47 = [(WFOtherNetworkViewController *)self networkName];
      *(_DWORD *)buf = 136315906;
      v50 = "-[WFOtherNetworkViewController viewDidLoad]";
      __int16 v51 = 1024;
      int v52 = v45;
      __int16 v53 = 1024;
      int v54 = v46;
      __int16 v55 = 2112;
      v56 = v47;
      _os_log_impl(&dword_2257EC000, v44, v43, "%s: style %d security type %d network %@", buf, 0x22u);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)WFOtherNetworkViewController;
  [(WFOtherNetworkViewController *)&v29 viewDidAppear:a3];
  objc_super v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[WFOtherNetworkViewController viewDidAppear:]";
    __int16 v32 = 2112;
    v33 = self;
    _os_log_impl(&dword_2257EC000, v4, v5, "%s: %@", buf, 0x16u);
  }

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_keyboardShown_ name:*MEMORY[0x263F837A8] object:0];

  v8 = [(WFOtherNetworkViewController *)self context];
  int v9 = [v8 isPasswordSharingSupported];

  if (v9)
  {
    id v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFOtherNetworkViewController viewDidAppear:]";
      __int16 v32 = 2112;
      v33 = self;
      _os_log_impl(&dword_2257EC000, v10, v11, "%s: activating password sharing %@", buf, 0x16u);
    }

    uint64_t v12 = [(WFOtherNetworkViewController *)self context];
    [v12 activatePasswordSharing];
  }
  if ([(WFOtherNetworkViewController *)self firstResponderCell] != -1)
  {
    uint64_t v13 = [(WFOtherNetworkViewController *)self nameCell];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      int64_t v15 = [(WFOtherNetworkViewController *)self firstResponderCell];

      if (!v15)
      {
        os_log_type_t v19 = [(WFOtherNetworkViewController *)self nameCell];
        goto LABEL_21;
      }
    }
    uint64_t v16 = [(WFOtherNetworkViewController *)self usernameCell];
    if (v16)
    {
      id v17 = (void *)v16;
      int64_t v18 = [(WFOtherNetworkViewController *)self firstResponderCell];

      if (v18 == 1)
      {
        os_log_type_t v19 = [(WFOtherNetworkViewController *)self usernameCell];
LABEL_21:
        objc_super v23 = v19;
        [v19 becomeFirstResponder];

        [(WFOtherNetworkViewController *)self setFirstResponderCell:-1];
        goto LABEL_22;
      }
    }
    uint64_t v20 = [(WFOtherNetworkViewController *)self passwordCell];
    if (v20)
    {
      v21 = (void *)v20;
      int64_t v22 = [(WFOtherNetworkViewController *)self firstResponderCell];

      if (v22 == 2)
      {
        os_log_type_t v19 = [(WFOtherNetworkViewController *)self passwordCell];
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v24 = [(WFOtherNetworkViewController *)self usernameCell];
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    v26 = [(WFOtherNetworkViewController *)self passwordCell];

    if (v26)
    {
      v27 = [(WFOtherNetworkViewController *)self passwordCell];
      [v27 becomeFirstResponder];

      os_log_type_t v28 = [(WFOtherNetworkViewController *)self usernameCell];
      [v28 becomeFirstResponder];
    }
  }
  self->_shouldCancelContextWhenViewDisappear = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFOtherNetworkViewController;
  [(WFOtherNetworkViewController *)&v4 viewDidDisappear:a3];
  if (self->_shouldCancelContextWhenViewDisappear) {
    [(WFCredentialsProviderContext *)self->_context cancel];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFOtherNetworkViewController;
  [(WFOtherNetworkViewController *)&v3 viewWillAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)WFOtherNetworkViewController;
  [(WFOtherNetworkViewController *)&v14 viewWillDisappear:a3];
  objc_super v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[WFOtherNetworkViewController viewWillDisappear:]";
    __int16 v17 = 2112;
    int64_t v18 = self;
    _os_log_impl(&dword_2257EC000, v4, v5, "%s: %@", buf, 0x16u);
  }

  v6 = [(WFOtherNetworkViewController *)self context];
  int v7 = [v6 isPasswordSharingSupported];

  if (v7)
  {
    v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[WFOtherNetworkViewController viewWillDisappear:]";
      __int16 v17 = 2112;
      int64_t v18 = self;
      _os_log_impl(&dword_2257EC000, v8, v9, "%s: deactivating password sharing %@", buf, 0x16u);
    }

    id v10 = [(WFOtherNetworkViewController *)self context];
    [v10 deactivatePasswordSharingWithReactivation:0];
  }
  os_log_type_t v11 = [(WFOtherNetworkViewController *)self view];
  [v11 endEditing:1];

  [(WFOtherNetworkViewController *)self setFirstResponderCell:-1];
  uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 removeObserver:self name:*MEMORY[0x263F83808] object:0];

  uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 removeObserver:self name:*MEMORY[0x263F837A8] object:0];
}

- (void)_scrollToCellAndBecomeFirstResponder:(id)a3
{
  objc_super v4 = (WFTextFieldCell *)a3;
  os_log_type_t v5 = [(WFOtherNetworkViewController *)self tableView];
  [(WFTextFieldCell *)v4 frame];
  double v7 = v6;
  [(WFTextFieldCell *)v4 frame];
  double v9 = v8 + 20.0;
  [(WFTextFieldCell *)v4 frame];
  double v11 = v10;
  [(WFTextFieldCell *)v4 frame];
  objc_msgSend(v5, "scrollRectToVisible:animated:", 0, v7, v9, v11);

  uint64_t v12 = [(WFTextFieldCell *)v4 textField];
  [v12 performSelectorOnMainThread:sel_becomeFirstResponder withObject:0 waitUntilDone:1];

  uint64_t v13 = [(WFTextFieldCell *)v4 textField];
  [v13 performSelector:sel_becomeFirstResponder withObject:0 afterDelay:0.1];

  self->_mostRecentFirstResponder = v4;
}

- (void)orientationChanged:(id)a3
{
  id v4 = [a3 object];
  if ((unint64_t)([v4 orientation] - 3) <= 1) {
    [(WFOtherNetworkViewController *)self _scrollToCellAndBecomeFirstResponder:self->_mostRecentFirstResponder];
  }
}

- (void)_dismiss:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = [(WFOtherNetworkViewController *)self view];
  os_log_type_t v5 = [v4 firstResponder];

  if (v5) {
    [v5 resignFirstResponder];
  }
  double v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[WFOtherNetworkViewController _dismiss:]";
    _os_log_impl(&dword_2257EC000, v6, v7, "%s: user tapped cancel", (uint8_t *)&v12, 0xCu);
  }

  double v8 = [(WFOtherNetworkViewController *)self context];
  [v8 cancel];

  double v9 = [(WFOtherNetworkViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(WFOtherNetworkViewController *)self delegate];
    [v11 otherNetworkViewControllerUserDidTapCancel:self];
  }
}

- (void)_join:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = (WFOtherNetworkViewController *)a3;
  self->_shouldCancelContextWhenViewDisappear = 0;
  os_log_type_t v5 = [MEMORY[0x263F828A0] activeKeyboard];
  double v6 = v5;
  if (v5) {
    [v5 deactivate];
  }
  os_log_type_t v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315394;
    os_log_type_t v30 = "-[WFOtherNetworkViewController _join:]";
    __int16 v31 = 2112;
    __int16 v32 = v4;
    _os_log_impl(&dword_2257EC000, v7, v8, "%s: join with sender %@", buf, 0x16u);
  }

  double v9 = [(WFOtherNetworkViewController *)self view];
  char v10 = [v9 firstResponder];

  if (v10) {
    [v10 resignFirstResponder];
  }
  double v11 = WFLogForCategory(0);
  os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 136315138;
    os_log_type_t v30 = "-[WFOtherNetworkViewController _join:]";
    _os_log_impl(&dword_2257EC000, v11, v12, "%s: user tapped join", buf, 0xCu);
  }

  uint64_t v13 = [(WFOtherNetworkViewController *)self context];
  int v14 = [v13 conformsToProtocol:&unk_26D94B668];

  if (v14)
  {
    int64_t v15 = [(WFOtherNetworkViewController *)self context];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v15, "savePrivateAddressMode:", -[WFOtherNetworkViewController privateAddressMode](self, "privateAddressMode"));
    }
  }
  [(WFOtherNetworkViewController *)self setJoining:1];
  objc_initWeak(&location, self);
  uint64_t v16 = [(WFOtherNetworkViewController *)self context];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __38__WFOtherNetworkViewController__join___block_invoke;
  v26 = &unk_2647568D0;
  objc_copyWeak(&v27, &location);
  [v16 gatherCredentials:&v23];

  __int16 v17 = [(WFOtherNetworkViewController *)self delegate];
  LODWORD(v16) = v17 == 0;

  if (v16)
  {
    int64_t v18 = WFLogForCategory(0);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 136315394;
      os_log_type_t v30 = "-[WFOtherNetworkViewController _join:]";
      __int16 v31 = 2112;
      __int16 v32 = self;
      _os_log_impl(&dword_2257EC000, v18, v19, "%s: %@ delegate is nil", buf, 0x16u);
    }
  }
  uint64_t v20 = [(WFOtherNetworkViewController *)self delegate];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    int64_t v22 = [(WFOtherNetworkViewController *)self delegate];
    [v22 otherNetworkViewControllerUserDidTapJoin:self];
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __38__WFOtherNetworkViewController__join___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setJoining:0];
}

- (void)_updateJoinable
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  objc_super v3 = [(WFOtherNetworkViewController *)self sections];
  int v4 = [v3 containsObject:&unk_26D911D88];

  unint64_t v5 = [(WFOtherNetworkViewController *)self securityMode];
  BOOL v6 = v5 <= 0xA && ((1 << v5) & 0x430) != 0 || [(WFOtherNetworkViewController *)self style] == 1;
  BOOL v7 = ([(WFOtherNetworkViewController *)self securityMode]
     || [(WFOtherNetworkViewController *)self style] == 1
     || ![(WFOtherNetworkViewController *)self style])
    && [(WFOtherNetworkViewController *)self passwordRequired];
  if ([(WFOtherNetworkViewController *)self profileMode] == 1) {
    BOOL v8 = [(WFOtherNetworkViewController *)self securityMode] == 5
  }
      || [(WFOtherNetworkViewController *)self securityMode] == 4
      || [(WFOtherNetworkViewController *)self securityMode] == 10;
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = [(WFOtherNetworkViewController *)self securityMode] == 7
    || [(WFOtherNetworkViewController *)self style] == 2;
  char v10 = WFLogForCategory(0);
  os_log_type_t v11 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v10 && os_log_type_enabled(v10, v11))
  {
    int v29 = 136316418;
    os_log_type_t v30 = "-[WFOtherNetworkViewController _updateJoinable]";
    __int16 v31 = 1024;
    *(_DWORD *)__int16 v32 = v4;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v6;
    *(_WORD *)uint64_t v33 = 1024;
    *(_DWORD *)&v33[2] = v7;
    __int16 v34 = 1024;
    BOOL v35 = v8;
    __int16 v36 = 1024;
    BOOL v37 = v9;
    _os_log_impl(&dword_2257EC000, v10, v11, "%s: requiresNetworkName %d requiresUserName %d requiresPassword %d requiresIdentity %d requiresWAPIIdentities %d", (uint8_t *)&v29, 0x2Au);
  }

  if (v8 && v6)
  {
    if ([(WFOtherNetworkViewController *)self TLSIdentity])
    {
      os_log_type_t v12 = WFLogForCategory(0);
      os_log_type_t v13 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v12 && os_log_type_enabled(v12, v13))
      {
        int v29 = 136315138;
        os_log_type_t v30 = "-[WFOtherNetworkViewController _updateJoinable]";
        _os_log_impl(&dword_2257EC000, v12, v13, "%s: username not required with TLSIdentity", (uint8_t *)&v29, 0xCu);
      }

      BOOL v6 = 0;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  int v14 = [MEMORY[0x263F828A0] activeKeyboard];
  if ([(WFOtherNetworkViewController *)self _returnKeyType] == 4) {
    [v14 setReturnKeyEnabled:1];
  }
  if (v4 && ![(NSString *)self->_networkName length] || v6 && ![(NSString *)self->_username length]) {
    goto LABEL_51;
  }
  int v15 = v7 & ~(v8 || v9);
  uint64_t v16 = WFLogForCategory(0);
  os_log_type_t v17 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v16)
  {
    int64_t v18 = v16;
    if (os_log_type_enabled(v18, v17))
    {
      os_log_type_t v19 = [(WFOtherNetworkViewController *)self context];
      uint64_t v20 = [(WFOtherNetworkViewController *)self context];
      int v21 = [v20 validateCredentials];
      int v29 = 136315650;
      os_log_type_t v30 = "-[WFOtherNetworkViewController _updateJoinable]";
      __int16 v31 = 2112;
      *(void *)__int16 v32 = v19;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)uint64_t v33 = v21;
      _os_log_impl(&dword_2257EC000, v18, v17, "%s: self.context %@ [self.context validateCredentials] %d", (uint8_t *)&v29, 0x1Cu);
    }
  }

  if (v15)
  {
    if (![(NSString *)self->_password length]) {
      goto LABEL_51;
    }
    int64_t v22 = [(WFOtherNetworkViewController *)self context];
    char v23 = [v22 validateCredentials];

    if ((v23 & 1) == 0) {
      goto LABEL_51;
    }
  }
  if ((!v8 || [(WFOtherNetworkViewController *)self TLSIdentity])
    && (!v9
     || ([(WFOtherNetworkViewController *)self WAPIIdentity],
         (uint64_t v24 = objc_claimAutoreleasedReturnValue()) != 0)
     && (uint64_t v25 = (void *)v24,
         [(WFOtherNetworkViewController *)self WAPIRootCertificate],
         v26 = objc_claimAutoreleasedReturnValue(),
         v26,
         v25,
         v26)))
  {
    id v27 = self;
    uint64_t v28 = 1;
  }
  else
  {
LABEL_51:
    id v27 = self;
    uint64_t v28 = 0;
  }
  [(WFOtherNetworkViewController *)v27 setJoinable:v28];
}

- (void)setBackgroundColor:(id)a3
{
  p_backgroundColor = &self->_backgroundColor;
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  id v6 = a3;
  BOOL v7 = *p_backgroundColor;
  id v8 = [(WFOtherNetworkViewController *)self tableView];
  [v8 setBackgroundColor:v7];
}

- (void)setJoinable:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WFOtherNetworkViewController *)self _returnKeyType] == 3)
  {
    unint64_t v5 = [MEMORY[0x263F828A0] activeKeyboard];
    [v5 setReturnKeyEnabled:v3];
  }
  if (self->_joinable != v3)
  {
    self->_joinable = v3;
    id v7 = [(WFOtherNetworkViewController *)self navigationItem];
    id v6 = [v7 rightBarButtonItem];
    [v6 setEnabled:v3];
  }
}

- (void)setJoining:(BOOL)a3
{
  self->_joining = a3;
  BOOL v4 = !a3;
  unint64_t v5 = [(WFOtherNetworkViewController *)self navigationItem];
  id v6 = [v5 leftBarButtonItem];
  [v6 setEnabled:v4];

  BOOL v7 = !self->_joining;
  id v8 = [(WFOtherNetworkViewController *)self navigationItem];
  BOOL v9 = [v8 rightBarButtonItem];
  [v9 setEnabled:v7];

  BOOL v10 = !self->_joining;
  os_log_type_t v11 = [(WFOtherNetworkViewController *)self nameCell];
  os_log_type_t v12 = [v11 textField];
  [v12 setUserInteractionEnabled:v10];

  BOOL v13 = !self->_joining;
  int v14 = [(WFOtherNetworkViewController *)self passwordCell];
  int v15 = [v14 textField];
  [v15 setUserInteractionEnabled:v13];

  BOOL v16 = !self->_joining;
  os_log_type_t v17 = [(WFOtherNetworkViewController *)self usernameCell];
  int64_t v18 = [v17 textField];
  [v18 setUserInteractionEnabled:v16];

  if (!self->_joining)
  {
    [(WFOtherNetworkViewController *)self _updateJoinable];
  }
}

- (void)setTLSIdentities:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_TLSIdentities, a3);
  if ([v6 count] && self->_profileMode == -1) {
    self->_profileMode = 0;
  }
  [(WFOtherNetworkViewController *)self _updateSections];
  unint64_t v5 = [(WFOtherNetworkViewController *)self tableView];
  [v5 reloadData];
}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  if (self->_TLSIdentity != a3)
  {
    self->_TLSIdentity = a3;
    [(WFOtherNetworkViewController *)self _updateJoinable];
  }
}

- (void)setWAPIIdentity:(id)a3
{
  if (self->_WAPIIdentity != a3)
  {
    self->_WAPIIdentity = a3;
    [(WFOtherNetworkViewController *)self _updateJoinable];
    [(WFOtherNetworkViewController *)self _updateSections];
    id v4 = [(WFOtherNetworkViewController *)self tableView];
    [v4 reloadData];
  }
}

- (void)setWAPIRootCertificate:(id)a3
{
  if (self->_WAPIRootCertificate != a3)
  {
    self->_WAPIRootCertificate = a3;
    [(WFOtherNetworkViewController *)self _updateJoinable];
    [(WFOtherNetworkViewController *)self _updateSections];
    id v4 = [(WFOtherNetworkViewController *)self tableView];
    [v4 reloadData];
  }
}

- (void)setSecurityMode:(int64_t)a3
{
  self->_overrideDefaultSecurity = 0;
  if (self->_securityMode != a3)
  {
    self->_securityMode = a3;
    [(WFOtherNetworkViewController *)self _updateSections];
    id v4 = [(WFOtherNetworkViewController *)self tableView];
    [v4 reloadData];
  }
}

- (void)setProfileMode:(int64_t)a3
{
  if (self->_profileMode != a3)
  {
    self->_profileMode = a3;
    [(WFOtherNetworkViewController *)self _updateSections];
    id v4 = [(WFOtherNetworkViewController *)self tableView];
    [v4 reloadData];
  }
}

- (void)setNetworkName:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_networkName] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_networkName, a3);
    [(WFOtherNetworkViewController *)self _updateJoinable];
  }
}

- (void)setUsername:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_username] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_username, a3);
    [(WFOtherNetworkViewController *)self _updateJoinable];
  }
}

- (void)receiveSharedPassword:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    int v14 = "-[WFOtherNetworkViewController receiveSharedPassword:]";
    __int16 v15 = 2048;
    uint64_t v16 = 0x3FD999999999999ALL;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: entering password with delay %f", buf, 0x16u);
  }

  if (![(WFOtherNetworkViewController *)self style])
  {
    [(WFOtherNetworkViewController *)self setPassword:v4];
    BOOL v7 = [NSString stringWithFormat:@"%@", @"********"];
    id v8 = [(WFOtherNetworkViewController *)self passwordCell];
    BOOL v9 = [v8 textField];
    [v9 setText:v7];

    [(WFOtherNetworkViewController *)self setJoinable:1];
    objc_initWeak((id *)buf, self);
    dispatch_time_t v10 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__WFOtherNetworkViewController_receiveSharedPassword___block_invoke;
    block[3] = &unk_2647565E0;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_after(v10, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __54__WFOtherNetworkViewController_receiveSharedPassword___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _join:WeakRetained];
}

- (id)_sectionsForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v5 = (void *)MEMORY[0x263EFF9D8];
      goto LABEL_11;
    case 1:
      BOOL v9 = [(WFOtherNetworkViewController *)self _canShowModes];
      id v5 = (void *)MEMORY[0x263EFF9D8];
      if (v9)
      {
        os_log_type_t v6 = &unk_26D911DB8;
LABEL_10:
        dispatch_time_t v10 = v6;
        uint64_t v11 = 0;
      }
      else
      {
LABEL_11:
        dispatch_time_t v10 = 0;
      }
      objc_msgSend(v5, "orderedSetWithObjects:", &unk_26D911DA0, v10, v11, v3);
      BOOL v7 = LABEL_13:;
      return v7;
    case 2:
      id v5 = (void *)MEMORY[0x263EFF9D8];
      os_log_type_t v6 = &unk_26D911DD0;
      goto LABEL_10;
    case 3:
      objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", &unk_26D911D88, &unk_26D911DA0, 0, v3);
      goto LABEL_13;
    default:
      BOOL v7 = 0;
      return v7;
  }
}

- (id)_securityRowsForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", &unk_26D911DB8, 0, v9);
      goto LABEL_13;
    case 1:
      if ([(WFOtherNetworkViewController *)self profileMode] == 1
        || ![(WFOtherNetworkViewController *)self passwordRequired])
      {
        BOOL v7 = (void *)MEMORY[0x263EFF9D8];
        id v8 = &unk_26D911DD0;
      }
      else
      {
        BOOL v7 = (void *)MEMORY[0x263EFF9D8];
        id v8 = &unk_26D911DB8;
      }
      objc_msgSend(v7, "orderedSetWithObjects:", &unk_26D911DA0, v8, 0);
      goto LABEL_13;
    case 2:
      objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", &unk_26D911DE8, 0, v9);
      goto LABEL_13;
    case 3:
      objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", &unk_26D911D88, 0, v9);
      uint64_t v4 = LABEL_13:;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  return v4;
}

- (void)_updateSections
{
  uint64_t v3 = [(WFOtherNetworkViewController *)self _sectionsForStyle:[(WFOtherNetworkViewController *)self style]];
  id v13 = (id)[v3 mutableCopy];

  if ([(WFOtherNetworkViewController *)self style] != 3)
  {
    if ([(WFOtherNetworkViewController *)self style] != 1) {
      goto LABEL_11;
    }
    uint64_t v6 = [(WFOtherNetworkViewController *)self _securityRowsForStyle:[(WFOtherNetworkViewController *)self style]];
    goto LABEL_10;
  }
  unint64_t securityMode = self->_securityMode;
  if (securityMode <= 9 && ((1 << securityMode) & 0x34E) != 0)
  {
    objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", &unk_26D911D88, &unk_26D911DB8, 0, v12);
    uint64_t v6 = LABEL_7:;
LABEL_10:
    BOOL v7 = (void *)v6;
    [(WFOtherNetworkViewController *)self setSecurityRows:v6];

    goto LABEL_11;
  }
  if ((securityMode & 0xFFFFFFFFFFFFFFFELL) != 4
    && [(WFOtherNetworkViewController *)self securityMode] != 10)
  {
    id v8 = (void *)MEMORY[0x263EFF9D8];
    if (securityMode != 7)
    {
      objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", &unk_26D911D88, 0, v11, v12);
      goto LABEL_7;
    }
    uint64_t v9 = &unk_26D911E00;
    dispatch_time_t v10 = &unk_26D911DE8;
    goto LABEL_23;
  }
  if (![(WFOtherNetworkViewController *)self _canShowModes])
  {
    id v8 = (void *)MEMORY[0x263EFF9D8];
    uint64_t v9 = &unk_26D911DB8;
    goto LABEL_22;
  }
  if (([v13 containsObject:&unk_26D911DB8] & 1) == 0) {
    [v13 addObject:&unk_26D911DB8];
  }
  if ([(WFOtherNetworkViewController *)self profileMode] == 1)
  {
    id v8 = (void *)MEMORY[0x263EFF9D8];
    uint64_t v9 = &unk_26D911DD0;
LABEL_22:
    dispatch_time_t v10 = &unk_26D911DA0;
LABEL_23:
    objc_msgSend(v8, "orderedSetWithObjects:", &unk_26D911D88, v10, v9, 0);
    goto LABEL_7;
  }
  if (![(WFOtherNetworkViewController *)self profileMode])
  {
    objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", &unk_26D911D88, &unk_26D911DA0, &unk_26D911DB8, 0);
    goto LABEL_7;
  }
LABEL_11:
  [(WFOtherNetworkViewController *)self setSections:v13];
}

- (void)_setFirstResponderAfterCell:(id)a3
{
  id v19 = a3;
  if ([(WFOtherNetworkViewController *)self _returnKeyType] == 3) {
    goto LABEL_2;
  }
  id v5 = [(WFOtherNetworkViewController *)self nameCell];

  if (v5 == v19)
  {
    uint64_t v11 = [(WFOtherNetworkViewController *)self securityRows];
    if ([v11 containsObject:&unk_26D911DA0])
    {
      uint64_t v12 = [(WFOtherNetworkViewController *)self usernameCell];

      if (v12)
      {
LABEL_12:
        uint64_t v13 = [(WFOtherNetworkViewController *)self usernameCell];
LABEL_22:
        uint64_t v16 = (void *)v13;
        [(WFOtherNetworkViewController *)self _scrollToCellAndBecomeFirstResponder:v13];
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v16 = [(WFOtherNetworkViewController *)self securityRows];
    if (([v16 containsObject:&unk_26D911DB8] & 1) == 0)
    {
LABEL_23:

      goto LABEL_24;
    }
    uint64_t v17 = [(WFOtherNetworkViewController *)self passwordCell];

    id v8 = v19;
    if (!v17) {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  id v6 = [(WFOtherNetworkViewController *)self usernameCell];

  if (v6 == v19)
  {
    int v14 = [(WFOtherNetworkViewController *)self securityRows];
    if (([v14 containsObject:&unk_26D911DB8] & 1) == 0)
    {

      goto LABEL_21;
    }
    __int16 v15 = [(WFOtherNetworkViewController *)self passwordCell];

    if (!v15) {
      goto LABEL_21;
    }
LABEL_19:
    uint64_t v13 = [(WFOtherNetworkViewController *)self passwordCell];
    goto LABEL_22;
  }
  id v7 = [(WFOtherNetworkViewController *)self passwordCell];

  id v8 = v19;
  if (v7 != v19) {
    goto LABEL_25;
  }
  if ([(WFOtherNetworkViewController *)self style])
  {
    uint64_t v9 = [(WFOtherNetworkViewController *)self sections];
    if (([v9 containsObject:&unk_26D911D88] & 1) == 0)
    {

LABEL_31:
      uint64_t v16 = [(WFOtherNetworkViewController *)self securityRows];
      if (([v16 containsObject:&unk_26D911DA0] & 1) == 0) {
        goto LABEL_23;
      }
      int64_t v18 = [(WFOtherNetworkViewController *)self usernameCell];

      id v8 = v19;
      if (!v18) {
        goto LABEL_25;
      }
      goto LABEL_12;
    }
    dispatch_time_t v10 = [(WFOtherNetworkViewController *)self nameCell];

    if (!v10) {
      goto LABEL_31;
    }
LABEL_21:
    uint64_t v13 = [(WFOtherNetworkViewController *)self nameCell];
    goto LABEL_22;
  }
  uint64_t v4 = [(WFOtherNetworkViewController *)self joinable];
  id v8 = v19;
  if (v4)
  {
LABEL_2:
    uint64_t v4 = [(WFOtherNetworkViewController *)self _join:self];
LABEL_24:
    id v8 = v19;
  }
LABEL_25:
  MEMORY[0x270F9A758](v4, v8);
}

- (void)_setTLSIdentity:(id)a3 specifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  -[WFOtherNetworkViewController setTLSIdentity:](self, "setTLSIdentity:", a3, a4);
  id v5 = [(WFOtherNetworkViewController *)self sections];
  uint64_t v6 = [v5 indexOfObject:&unk_26D911DA0];

  id v7 = [(WFOtherNetworkViewController *)self securityRows];
  uint64_t v8 = [v7 indexOfObject:&unk_26D911DD0];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v12))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[WFOtherNetworkViewController _setTLSIdentity:specifier:]";
      __int16 v16 = 2050;
      uint64_t v17 = v6;
      __int16 v18 = 2050;
      uint64_t v19 = v8;
      _os_log_impl(&dword_2257EC000, v9, v12, "%s- Unable to find section and row for Identity cell (section %{public}lu, row %{public}lu)", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v9 = [(WFOtherNetworkViewController *)self tableView];
    dispatch_time_t v10 = [MEMORY[0x263F088C8] indexPathForRow:v8 inSection:v6];
    uint64_t v13 = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    [v9 reloadRowsAtIndexPaths:v11 withRowAnimation:5];
  }
}

- (void)_setWAPIRootCertificate:(id)a3 specifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  -[WFOtherNetworkViewController setWAPIRootCertificate:](self, "setWAPIRootCertificate:", a3, a4);
  id v5 = [(WFOtherNetworkViewController *)self sections];
  uint64_t v6 = [v5 indexOfObject:&unk_26D911DA0];

  id v7 = [(WFOtherNetworkViewController *)self securityRows];
  uint64_t v8 = [v7 indexOfObject:&unk_26D911DE8];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v12))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[WFOtherNetworkViewController _setWAPIRootCertificate:specifier:]";
      __int16 v16 = 2050;
      uint64_t v17 = v6;
      __int16 v18 = 2050;
      uint64_t v19 = v8;
      _os_log_impl(&dword_2257EC000, v9, v12, "%s- Unable to find section and row for Identity cell (section %{public}lu, row %{public}lu)", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v9 = [(WFOtherNetworkViewController *)self tableView];
    dispatch_time_t v10 = [MEMORY[0x263F088C8] indexPathForRow:v8 inSection:v6];
    uint64_t v13 = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    [v9 reloadRowsAtIndexPaths:v11 withRowAnimation:5];
  }
}

- (void)_setWAPIIdentity:(id)a3 specifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  -[WFOtherNetworkViewController setWAPIIdentity:](self, "setWAPIIdentity:", a3, a4);
  id v5 = [(WFOtherNetworkViewController *)self sections];
  uint64_t v6 = [v5 indexOfObject:&unk_26D911DA0];

  id v7 = [(WFOtherNetworkViewController *)self securityRows];
  uint64_t v8 = [v7 indexOfObject:&unk_26D911E00];

  if ([(WFOtherNetworkViewController *)self style] == 2)
  {
    uint64_t v9 = [(WFOtherNetworkViewController *)self sections];
    uint64_t v6 = [v9 indexOfObject:&unk_26D911DD0];

    uint64_t v8 = 0;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    dispatch_time_t v10 = WFLogForCategory(0);
    os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v13))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v16 = "-[WFOtherNetworkViewController _setWAPIIdentity:specifier:]";
      __int16 v17 = 2050;
      uint64_t v18 = v6;
      __int16 v19 = 2050;
      uint64_t v20 = v8;
      _os_log_impl(&dword_2257EC000, v10, v13, "%s- Unable to find section and row for Identity cell (section %{public}lu, row %{public}lu)", buf, 0x20u);
    }
  }
  else
  {
    dispatch_time_t v10 = [(WFOtherNetworkViewController *)self tableView];
    uint64_t v11 = [MEMORY[0x263F088C8] indexPathForRow:v8 inSection:v6];
    int v14 = v11;
    os_log_type_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    [v10 reloadRowsAtIndexPaths:v12 withRowAnimation:5];
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(WFOtherNetworkViewController *)self nameCell];
  id v5 = [v4 textField];

  if (v5 == v11)
  {
    dispatch_time_t v10 = (WFTextFieldCell *)[(WFOtherNetworkViewController *)self nameCell];
  }
  else
  {
    uint64_t v6 = [(WFOtherNetworkViewController *)self usernameCell];
    id v7 = [v6 textField];

    if (v7 == v11)
    {
      dispatch_time_t v10 = (WFTextFieldCell *)[(WFOtherNetworkViewController *)self usernameCell];
    }
    else
    {
      uint64_t v8 = [(WFOtherNetworkViewController *)self passwordCell];
      id v9 = [v8 textField];

      if (v9 != v11) {
        goto LABEL_8;
      }
      dispatch_time_t v10 = (WFTextFieldCell *)[(WFOtherNetworkViewController *)self passwordCell];
    }
  }
  self->_mostRecentFirstResponder = v10;
LABEL_8:
  objc_msgSend(v11, "setReturnKeyType:", -[WFOtherNetworkViewController _returnKeyType](self, "_returnKeyType"));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(WFOtherNetworkViewController *)self joining])
  {
    id v11 = [(WFOtherNetworkViewController *)self sections];
    os_log_type_t v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "section"));
    uint64_t v13 = [v12 integerValue];

    if (v13 == 3)
    {
LABEL_8:
      uint64_t v18 = (WFValueListViewController *)objc_alloc_init(WFManagedConfigurationUIClassFromString(@"MCCertificatePickerController"));
      __int16 v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v20 = [v19 localizedStringForKey:@"kWFLocOtherNetworkIdentityWAPITitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      uint64_t v21 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v20 target:self set:sel__setWAPIIdentity_specifier_ get:sel__getWAPIIdentity_ detail:0 cell:-1 edit:0];
      uint64_t v22 = [(WFOtherNetworkViewController *)self WAPIIdentities];
LABEL_9:
      char v23 = (void *)v22;
      [v21 setValues:v22];

      [(WFValueListViewController *)v18 setSpecifier:v21];
      uint64_t v24 = [(WFOtherNetworkViewController *)self navigationItem];
      uint64_t v25 = [v24 prompt];
      v26 = [(WFValueListViewController *)v18 navigationItem];
      [v26 setPrompt:v25];

      self->_shouldCancelContextWhenViewDisappear = 0;
      id v27 = [(WFOtherNetworkViewController *)self navigationController];
      [v27 pushViewController:v18 animated:1];
    }
    else
    {
      if (v13 != 2)
      {
        if (v13 == 1)
        {
          int v14 = [(WFOtherNetworkViewController *)self securityRows];
          __int16 v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v7, "row"));
          uint64_t v16 = [v15 integerValue];

          switch(v16)
          {
            case 0:
              uint64_t v38 = [(WFOtherNetworkViewController *)self securityTitlesValueVC];

              if (v38)
              {
                double v39 = [(WFOtherNetworkViewController *)self securityTitlesValueVC];
              }
              else
              {
                BOOL IsChinaDevice = WFCapabilityIsChinaDevice([(WFOtherNetworkViewController *)self deviceCapability]);
                os_log_type_t v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                v44 = v43;
                BOOL v78 = IsChinaDevice;
                if (IsChinaDevice) {
                  int v45 = @"KWFLocSettingRandomMACSwitchChinaTitle";
                }
                else {
                  int v45 = @"KWFLocSettingRandomMACSwitchTitle";
                }
                v79 = [v43 localizedStringForKey:v45 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

                v80 = (void *)MEMORY[0x263EFF8C0];
                int v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                v47 = [v46 localizedStringForKey:@"kWFLocRandomMACOffOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                objc_super v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                v49 = [v48 localizedStringForKey:@"kWFLocRandomMACStaticOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                v50 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                __int16 v51 = [v50 localizedStringForKey:@"kWFLocRandomMACRotatingOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                v81 = objc_msgSend(v80, "arrayWithObjects:", v47, v49, v51, 0);

                unint64_t v52 = 0x264755000;
                if (!self->_privateAddressModeTitlesValueVC)
                {
                  v76 = (void *)MEMORY[0x263EFF8C0];
                  v77 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  v75 = [v77 localizedStringForKey:@"kWFLocRandomMACOffOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                  __int16 v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  int v54 = [v53 localizedStringForKey:@"kWFLocRandomMACStaticOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                  __int16 v55 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  v56 = [v55 localizedStringForKey:@"kWFLocRandomMACRotatingOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                  uint64_t v57 = objc_msgSend(v76, "arrayWithObjects:", v75, v54, v56, 0);

                  unint64_t v52 = 0x264755000uLL;
                  v58 = [[WFValueListViewController alloc] initWithTitles:v57 switchTitle:0];
                  privateAddressModeTitlesValueVC = self->_privateAddressModeTitlesValueVC;
                  self->_privateAddressModeTitlesValueVC = v58;

                  v60 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  v61 = v60;
                  if (v78) {
                    v62 = @"KWFLocSettingRandomMACSwitchChinaTitle";
                  }
                  else {
                    v62 = @"KWFLocSettingRandomMACSwitchTitle";
                  }
                  v63 = [v60 localizedStringForKey:v62 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                  v64 = [(WFValueListViewController *)self->_privateAddressModeTitlesValueVC navigationItem];
                  [v64 setTitle:v63];
                }
                v65 = [(WFOtherNetworkViewController *)self _selectedPrivateModeForOption:self->_privateAddressMode];
                [(WFValueListViewController *)self->_privateAddressModeTitlesValueVC setSelectedTitle:v65];

                id v66 = objc_alloc(*(Class *)(v52 + 3504));
                v67 = [(WFOtherNetworkViewController *)self _availableSecurityTitles];
                double v39 = (void *)[v66 initWithTitles:v67 switchTitle:0 sublist:self->_privateAddressModeTitlesValueVC];

                v68 = [(WFOtherNetworkViewController *)self _securityStringFromType:self->_securityMode];
                [v39 setSelectedTitle:v68];

                v69 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                v70 = [v69 localizedStringForKey:@"kWFLocOtherNetworkSecurityTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                [v39 setTitle:v70];

                objc_initWeak(location, self);
                v84[0] = MEMORY[0x263EF8330];
                v84[1] = 3221225472;
                v84[2] = __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke;
                v84[3] = &unk_2647568F8;
                objc_copyWeak(&v85, location);
                v84[4] = self;
                [v39 setCompletionHandler:v84];
                v71 = [(WFOtherNetworkViewController *)self navigationItem];
                v72 = [v71 prompt];
                v73 = [v39 navigationItem];
                [v73 setPrompt:v72];

                [(WFOtherNetworkViewController *)self setSecurityTitlesValueVC:v39];
                objc_destroyWeak(&v85);
                objc_destroyWeak(location);
              }
              self->_shouldCancelContextWhenViewDisappear = 0;
              v74 = [(WFOtherNetworkViewController *)self navigationController];
              [v74 pushViewController:v39 animated:1];

              break;
            case 1:
            case 2:
              __int16 v17 = [v6 cellForRowAtIndexPath:v7];
              [v17 becomeFirstResponder];

              break;
            case 3:
              uint64_t v18 = (WFValueListViewController *)objc_alloc_init(WFManagedConfigurationUIClassFromString(@"MCCertificatePickerController"));
              v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              uint64_t v20 = [v40 localizedStringForKey:@"kWFLocOtherNetworkIdentityTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

              uint64_t v21 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v20 target:self set:sel__setTLSIdentity_specifier_ get:sel__getTLSIdentity_ detail:0 cell:-1 edit:0];
              uint64_t v22 = [(WFOtherNetworkViewController *)self TLSIdentities];
              goto LABEL_9;
            case 4:
              uint64_t v18 = (WFValueListViewController *)objc_alloc_init(WFManagedConfigurationUIClassFromString(@"MCCertificatePickerController"));
              v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              uint64_t v20 = [v41 localizedStringForKey:@"kWFLocOtherNetworkRootCertWAPITitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

              uint64_t v21 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v20 target:self set:sel__setWAPIRootCertificate_specifier_ get:sel__getWAPIRootCertificate_ detail:0 cell:-1 edit:0];
              uint64_t v22 = [(WFOtherNetworkViewController *)self WAPIRootCertificates];
              goto LABEL_9;
            case 5:
              goto LABEL_8;
            default:
              goto LABEL_15;
          }
        }
        goto LABEL_15;
      }
      uint64_t v28 = [(WFOtherNetworkViewController *)self profileModeTitlesValueVC];

      if (v28)
      {
        uint64_t v18 = [(WFOtherNetworkViewController *)self profileModeTitlesValueVC];
      }
      else
      {
        int v29 = [WFValueListViewController alloc];
        os_log_type_t v30 = [(WFOtherNetworkViewController *)self _availableProfileModeTitles];
        uint64_t v18 = [(WFValueListViewController *)v29 initWithTitles:v30 switchTitle:0];

        __int16 v31 = [(WFOtherNetworkViewController *)self _profileModeStringFromType:self->_profileMode];
        [(WFValueListViewController *)v18 setSelectedTitle:v31];

        __int16 v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v33 = [v32 localizedStringForKey:@"kWFLocOtherNetworkSecurityTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        [(WFValueListViewController *)v18 setTitle:v33];

        objc_initWeak(location, self);
        v82[0] = MEMORY[0x263EF8330];
        v82[1] = 3221225472;
        v82[2] = __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
        v82[3] = &unk_264756920;
        v82[4] = self;
        objc_copyWeak(&v83, location);
        [(WFValueListViewController *)v18 setCompletionHandler:v82];
        __int16 v34 = [(WFOtherNetworkViewController *)self navigationItem];
        BOOL v35 = [v34 prompt];
        __int16 v36 = [(WFValueListViewController *)v18 navigationItem];
        [v36 setPrompt:v35];

        [(WFOtherNetworkViewController *)self setProfileModeTitlesValueVC:v18];
        objc_destroyWeak(&v83);
        objc_destroyWeak(location);
      }
      self->_shouldCancelContextWhenViewDisappear = 0;
      BOOL v37 = [(WFOtherNetworkViewController *)self navigationController];
      [v37 pushViewController:v18 animated:1];
    }
LABEL_15:
    uint64_t v8 = v6;
    id v9 = v7;
    uint64_t v10 = 1;
    goto LABEL_16;
  }
  uint64_t v8 = v6;
  id v9 = v7;
  uint64_t v10 = 0;
LABEL_16:
  [v8 deselectRowAtIndexPath:v9 animated:v10];
}

void __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  block[3] = &unk_264756438;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained _securityModeFromTitle:*(void *)(a1 + 32)];
  uint64_t v4 = v3;
  uint64_t v5 = 2;
  if (v3 == 10) {
    uint64_t v5 = 1;
  }
  if (!v3) {
    uint64_t v5 = 0;
  }
  if ((unint64_t)(v3 - 4) >= 2) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 1;
  }
  [WeakRetained setFirstResponderCell:v6];
  [WeakRetained setSecurityMode:v4];
  [WeakRetained _updateJoinable];
  id v7 = objc_loadWeakRetained(v2);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 1288) selectedTitle];
  uint64_t v9 = [v7 _selectedPrivateModeForString:v8];

  id v10 = objc_loadWeakRetained(v2);
  [v10 setPrivateAddressMode:v9];
}

void __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _profileModeFromTitle:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setProfileMode:v3];
  [WeakRetained _updateJoinable];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [(WFOtherNetworkViewController *)self sections];
  id v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "section"));
  uint64_t v11 = [v10 integerValue];

  switch(v11)
  {
    case 0:
      os_log_type_t v12 = [(WFOtherNetworkViewController *)self nameCell];

      if (!v12)
      {
        objc_initWeak(&location, self);
        uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v14 = [v13 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
        __int16 v15 = [v14 objectAtIndex:0];

        uint64_t v16 = [v8 localizedStringForKey:@"kWFLocOtherNetworkNameTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        __int16 v17 = [v15 label];
        [v17 setText:v16];

        uint64_t v18 = [v8 localizedStringForKey:@"kWFLocOtherNetworkNamePlaceholder" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        __int16 v19 = [v15 textField];
        [v19 setPlaceholder:v18];

        uint64_t v20 = [v15 textField];
        [v20 setDelegate:self];

        uint64_t v21 = [MEMORY[0x263F82670] currentDevice];
        uint64_t v22 = [v21 userInterfaceIdiom];

        double v23 = 15.0;
        if ((v22 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
          double v23 = 20.0;
        }
        objc_msgSend(v15, "setLayoutMargins:", 0.0, v23, 0.0, 0.0);
        v106[0] = MEMORY[0x263EF8330];
        v106[1] = 3221225472;
        v106[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke;
        v106[3] = &unk_264756948;
        objc_copyWeak(&v107, &location);
        [v15 setReturnKeyHandler:v106];
        networkName = self->_networkName;
        uint64_t v25 = [v15 textField];
        [v25 setText:networkName];

        v104[0] = MEMORY[0x263EF8330];
        v104[1] = 3221225472;
        v104[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
        v104[3] = &unk_264756118;
        objc_copyWeak(&v105, &location);
        [v15 setTextChangeHandler:v104];
        [(WFOtherNetworkViewController *)self setNameCell:v15];
        if (!self->_mostRecentFirstResponder) {
          self->_mostRecentFirstResponder = (WFTextFieldCell *)[(WFOtherNetworkViewController *)self nameCell];
        }
        objc_destroyWeak(&v105);
        objc_destroyWeak(&v107);

        objc_destroyWeak(&location);
      }
      int64_t v26 = [(WFOtherNetworkViewController *)self _returnKeyType];
      id v27 = [(WFOtherNetworkViewController *)self nameCell];
      uint64_t v28 = [v27 textField];
      [v28 setReturnKeyType:v26];

      int v29 = [(WFOtherNetworkViewController *)self nameCell];
      goto LABEL_28;
    case 1:
      os_log_type_t v30 = [(WFOtherNetworkViewController *)self securityRows];
      __int16 v31 = objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v7, "row"));
      uint64_t v32 = [v31 integerValue];

      switch(v32)
      {
        case 0:
          int v29 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"WFOtherNetworkCellGenericIdentifier"];
          [v29 setPreservesSuperviewLayoutMargins:0];
          uint64_t v33 = [MEMORY[0x263F82670] currentDevice];
          uint64_t v34 = [v33 userInterfaceIdiom];

          double v35 = 15.0;
          if ((v34 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
            double v35 = 20.0;
          }
          objc_msgSend(v29, "setLayoutMargins:", 0.0, v35, 0.0, 0.0);
          __int16 v36 = [v8 localizedStringForKey:@"kWFLocOtherNetworkSecurityTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
          BOOL v37 = [v29 textLabel];
          [v37 setText:v36];

          uint64_t v38 = [(WFOtherNetworkViewController *)self _securityStringFromType:self->_securityMode];
          goto LABEL_26;
        case 1:
          __int16 v53 = [(WFOtherNetworkViewController *)self usernameCell];

          if (!v53)
          {
            objc_initWeak(&location, self);
            int v54 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            __int16 v55 = [v54 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
            v56 = [v55 objectAtIndex:0];

            uint64_t v57 = [v8 localizedStringForKey:@"kWFLocOtherNetworkUsernameTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
            v58 = [v56 label];
            [v58 setText:v57];

            int64_t v59 = [(WFOtherNetworkViewController *)self style];
            v60 = [v56 textField];
            [v60 setReturnKeyType:4 * (v59 != 0)];

            v61 = [v56 textField];
            [v61 setDelegate:self];

            v62 = [v56 textField];
            [v62 setTextContentType:*MEMORY[0x263F83AA8]];

            v63 = [MEMORY[0x263F82670] currentDevice];
            uint64_t v64 = [v63 userInterfaceIdiom];

            double v65 = 15.0;
            if ((v64 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
              double v65 = 20.0;
            }
            objc_msgSend(v56, "setLayoutMargins:", 0.0, v65, 0.0, 0.0);
            v102[0] = MEMORY[0x263EF8330];
            v102[1] = 3221225472;
            v102[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
            v102[3] = &unk_264756118;
            objc_copyWeak(&v103, &location);
            [v56 setTextChangeHandler:v102];
            v100[0] = MEMORY[0x263EF8330];
            v100[1] = 3221225472;
            v100[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_4;
            v100[3] = &unk_264756948;
            objc_copyWeak(&v101, &location);
            [v56 setReturnKeyHandler:v100];
            [(WFOtherNetworkViewController *)self setUsernameCell:v56];
            id v66 = [(WFOtherNetworkViewController *)self username];

            if (v66)
            {
              v67 = [(WFOtherNetworkViewController *)self username];
              v68 = [v56 textField];
              [v68 setText:v67];
            }
            objc_destroyWeak(&v101);
            objc_destroyWeak(&v103);

            objc_destroyWeak(&location);
          }
          int v29 = [(WFOtherNetworkViewController *)self usernameCell];
          int64_t v69 = [(WFOtherNetworkViewController *)self _returnKeyType];
          int v45 = [(WFOtherNetworkViewController *)self usernameCell];
          v70 = [v45 textField];
          [v70 setReturnKeyType:v69];

          goto LABEL_19;
        case 2:
          objc_initWeak(&location, self);
          v71 = [(WFOtherNetworkViewController *)self passwordCell];

          if (!v71)
          {
            v72 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v73 = [v72 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
            v74 = [v73 objectAtIndex:0];

            v75 = [v8 localizedStringForKey:@"kWFLocOtherNetworkPasswordTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
            v76 = [v74 label];
            [v76 setText:v75];

            v77 = [v74 textField];
            [v77 setSecureTextEntry:1];

            BOOL v78 = [v74 textField];
            [v78 setDelegate:self];

            v79 = [v74 textField];
            [v79 setTextContentType:*MEMORY[0x263F83A70]];

            v80 = [MEMORY[0x263F82670] currentDevice];
            uint64_t v81 = [v80 userInterfaceIdiom];

            double v82 = 15.0;
            if ((v81 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
              double v82 = 20.0;
            }
            objc_msgSend(v74, "setLayoutMargins:", 0.0, v82, 0.0, 0.0);
            v98[0] = MEMORY[0x263EF8330];
            v98[1] = 3221225472;
            v98[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_5;
            v98[3] = &unk_264756118;
            objc_copyWeak(&v99, &location);
            [v74 setTextChangeHandler:v98];
            v96[0] = MEMORY[0x263EF8330];
            v96[1] = 3221225472;
            v96[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_6;
            v96[3] = &unk_264756948;
            objc_copyWeak(&v97, &location);
            [v74 setReturnKeyHandler:v96];
            [(WFOtherNetworkViewController *)self setPasswordCell:v74];
            objc_destroyWeak(&v97);
            objc_destroyWeak(&v99);
          }
          int v29 = [(WFOtherNetworkViewController *)self passwordCell];
          int64_t v83 = [(WFOtherNetworkViewController *)self _returnKeyType];
          v84 = [(WFOtherNetworkViewController *)self passwordCell];
          id v85 = [v84 textField];
          [v85 setReturnKeyType:v83];

          objc_destroyWeak(&location);
          break;
        case 3:
          int v29 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"WFOtherNetworkCellGenericIdentifier"];
          [v29 setPreservesSuperviewLayoutMargins:0];
          v86 = [MEMORY[0x263F82670] currentDevice];
          uint64_t v87 = [v86 userInterfaceIdiom];

          double v88 = 15.0;
          if ((v87 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
            double v88 = 20.0;
          }
          objc_msgSend(v29, "setLayoutMargins:", 0.0, v88, 0.0, 0.0);
          v89 = [v8 localizedStringForKey:@"kWFLocOtherNetworkIdentityTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
          v90 = [v29 textLabel];
          [v90 setText:v89];

          uint64_t v44 = [(WFOtherNetworkViewController *)self _TLSIdentityDescription];
          goto LABEL_16;
        case 4:
          int v29 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"WFOtherNetworkCellGenericIdentifier"];
          [v29 setPreservesSuperviewLayoutMargins:0];
          v91 = [MEMORY[0x263F82670] currentDevice];
          uint64_t v92 = [v91 userInterfaceIdiom];

          double v93 = 15.0;
          if ((v92 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
            double v93 = 20.0;
          }
          objc_msgSend(v29, "setLayoutMargins:", 0.0, v93, 0.0, 0.0);
          v94 = [v8 localizedStringForKey:@"kWFLocOtherNetworkRootCertWAPITitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
          v95 = [v29 textLabel];
          [v95 setText:v94];

          uint64_t v44 = [(WFOtherNetworkViewController *)self _WAPIRootCertificateDescription];
          goto LABEL_16;
        case 5:
          goto LABEL_13;
        default:
          goto LABEL_20;
      }
      goto LABEL_28;
    case 2:
      int v29 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
      v47 = [v8 localizedStringForKey:@"kWFLocOtherNetworkModeTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      objc_super v48 = [v29 textLabel];
      [v48 setText:v47];

      if ([(WFOtherNetworkViewController *)self profileMode])
      {
        if ([(WFOtherNetworkViewController *)self profileMode] != 1)
        {
LABEL_27:
          [v29 setAccessoryType:1];
          goto LABEL_28;
        }
        v49 = @"kWFLocOtherNetworkModeValueEAPTLS";
      }
      else
      {
        v49 = @"kWFLocOtherNetworkModeValueAuto";
      }
      uint64_t v38 = [v8 localizedStringForKey:v49 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
LABEL_26:
      v50 = (void *)v38;
      __int16 v51 = [v29 detailTextLabel];
      [v51 setText:v50];

      goto LABEL_27;
    case 3:
LABEL_13:
      int v29 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"WFOtherNetworkCellGenericIdentifier"];
      [v29 setPreservesSuperviewLayoutMargins:0];
      double v39 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v40 = [v39 userInterfaceIdiom];

      double v41 = 15.0;
      if ((v40 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
        double v41 = 20.0;
      }
      objc_msgSend(v29, "setLayoutMargins:", 0.0, v41, 0.0, 0.0);
      v42 = [v8 localizedStringForKey:@"kWFLocOtherNetworkIdentityWAPITitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      os_log_type_t v43 = [v29 textLabel];
      [v43 setText:v42];

      uint64_t v44 = [(WFOtherNetworkViewController *)self _WAPIIdentityDescription];
LABEL_16:
      int v45 = (void *)v44;
      if (v44)
      {
        int v46 = [v29 detailTextLabel];
        [v46 setText:v45];
      }
      [v29 setAccessoryType:1];
LABEL_19:

      goto LABEL_28;
    default:
LABEL_20:
      int v29 = 0;
LABEL_28:

      return v29;
  }
}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setNetworkName:v3];
}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setUsername:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v5 _updateJoinable];
}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setPassword:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v5 _updateJoinable];
}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v15 = a4;
  if ([(WFOtherNetworkViewController *)self firstResponderCell] != -1)
  {
    id v6 = [(WFOtherNetworkViewController *)self nameCell];
    if (v6 == v15)
    {
      int64_t v7 = [(WFOtherNetworkViewController *)self firstResponderCell];

      if (!v7)
      {
        id v10 = [(WFOtherNetworkViewController *)self nameCell];
        goto LABEL_14;
      }
    }
    else
    {
    }
    id v8 = [(WFOtherNetworkViewController *)self usernameCell];
    if (v8 == v15)
    {
      int64_t v9 = [(WFOtherNetworkViewController *)self firstResponderCell];

      if (v9 == 1)
      {
        id v10 = [(WFOtherNetworkViewController *)self usernameCell];
LABEL_14:
        uint64_t v13 = v10;
        int v14 = [v10 textField];
        [v14 becomeFirstResponder];

        [(WFOtherNetworkViewController *)self setFirstResponderCell:-1];
        goto LABEL_15;
      }
    }
    else
    {
    }
    id v11 = [(WFOtherNetworkViewController *)self passwordCell];
    if (v11 != v15)
    {

      goto LABEL_15;
    }
    int64_t v12 = [(WFOtherNetworkViewController *)self firstResponderCell];

    if (v12 == 2)
    {
      id v10 = [(WFOtherNetworkViewController *)self passwordCell];
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(WFOtherNetworkViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(WFOtherNetworkViewController *)self sections];
  int64_t v7 = [v6 objectAtIndex:a4];
  uint64_t v8 = [v7 integerValue];

  switch(v8)
  {
    case 0:
    case 2:
    case 3:
      int64_t result = 1;
      break;
    case 1:
      id v10 = [(WFOtherNetworkViewController *)self securityRows];
      int64_t v11 = [v10 count];

      int64_t result = v11;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)_availableProfileModes
{
  return &unk_26D912250;
}

- (id)_availableProfileModeTitles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v4 = [(WFOtherNetworkViewController *)self _availableProfileModes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = -[WFOtherNetworkViewController _profileModeStringFromType:](self, "_profileModeStringFromType:", [*(id *)(*((void *)&v11 + 1) + 8 * i) integerValue]);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (int64_t)_profileModeFromTitle:(id)a3
{
  id v3 = a3;
  int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"kWFLocOtherNetworkModeValueAuto" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    int64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int64_t v9 = [v8 localizedStringForKey:@"kWFLocOtherNetworkModeValueEAPTLS" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    int v10 = [v3 isEqualToString:v9];

    if (v10) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }

  return v7;
}

- (id)_profileModeStringFromType:(int64_t)a3
{
  int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = v4;
  if (!a3)
  {
    char v6 = @"kWFLocOtherNetworkModeValueAuto";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    char v6 = @"kWFLocOtherNetworkModeValueEAPTLS";
LABEL_5:
    int64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    goto LABEL_7;
  }
  int64_t v7 = 0;
LABEL_7:

  return v7;
}

- (id)_availableSecurityModes
{
  BOOL v3 = [(WFOtherNetworkViewController *)self WPA3PersonalEnabled];
  int64_t v4 = (void *)[&unk_26D912268 mutableCopy];
  uint64_t v5 = v4;
  if (v3) {
    char v6 = &unk_26D912280;
  }
  else {
    char v6 = &unk_26D912298;
  }
  [v4 addObjectsFromArray:v6];
  int64_t v7 = (void *)[v5 mutableCopy];
  [v7 addObjectsFromArray:&unk_26D9122B0];
  id v8 = v7;

  if ([(WFOtherNetworkViewController *)self WPA3EnterpriseEnabled]
    || (int64_t v9 = v8, [(WFOtherNetworkViewController *)self WPA2EnterpriseEnabledMFPCapable]))
  {
    int64_t v9 = (void *)[v8 mutableCopy];
    [v9 addObjectsFromArray:&unk_26D9122C8];
  }
  if ([(WFOtherNetworkViewController *)self WAPIEnabled])
  {
    int v10 = (void *)[v9 mutableCopy];
    [v10 addObjectsFromArray:&unk_26D9122E0];

    int64_t v9 = v10;
  }

  return v9;
}

- (id)_availableSecurityTitles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v4 = [(WFOtherNetworkViewController *)self _availableSecurityModes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = -[WFOtherNetworkViewController _securityStringFromType:](self, "_securityStringFromType:", [*(id *)(*((void *)&v11 + 1) + 8 * i) integerValue]);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (int64_t)_securityModeFromTitle:(id)a3
{
  id v3 = a3;
  int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"kWFLocSecurityNoneTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    int64_t v7 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int64_t v9 = [v8 localizedStringForKey:@"kWFLocSecurityWEPTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    char v10 = [v3 isEqualToString:v9];

    if (v10)
    {
      int64_t v7 = 1;
    }
    else
    {
      long long v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v12 = [v11 localizedStringForKey:@"kWFLocSecurityWPATitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      char v13 = [v3 isEqualToString:v12];

      if (v13)
      {
        int64_t v7 = 2;
      }
      else
      {
        long long v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v15 = [v14 localizedStringForKey:@"kWFLocSecurityWPA2Title" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        char v16 = [v3 isEqualToString:v15];

        if (v16)
        {
          int64_t v7 = 3;
        }
        else
        {
          __int16 v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v18 = [v17 localizedStringForKey:@"kWFLocSecurityWPAEnterpriseTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
          char v19 = [v3 isEqualToString:v18];

          if (v19)
          {
            int64_t v7 = 4;
          }
          else
          {
            uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v21 = [v20 localizedStringForKey:@"kWFLocSecurityWPA2EnterpriseTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
            char v22 = [v3 isEqualToString:v21];

            if (v22)
            {
              int64_t v7 = 5;
            }
            else
            {
              double v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              uint64_t v24 = [v23 localizedStringForKey:@"kWFLocSecurityWAPITitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
              char v25 = [v3 isEqualToString:v24];

              if (v25)
              {
                int64_t v7 = 6;
              }
              else
              {
                int64_t v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                id v27 = [v26 localizedStringForKey:@"kWFLocSecurityWAPIEnterpriseTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                char v28 = [v3 isEqualToString:v27];

                if (v28)
                {
                  int64_t v7 = 7;
                }
                else
                {
                  int v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  os_log_type_t v30 = [v29 localizedStringForKey:@"kWFLocSecurityWPA3Title" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                  char v31 = [v3 isEqualToString:v30];

                  if (v31)
                  {
                    int64_t v7 = 8;
                  }
                  else
                  {
                    uint64_t v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    uint64_t v33 = [v32 localizedStringForKey:@"kWFLocSecurityWPA2WPA3Title" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                    char v34 = [v3 isEqualToString:v33];

                    if (v34)
                    {
                      int64_t v7 = 9;
                    }
                    else
                    {
                      double v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                      __int16 v36 = [v35 localizedStringForKey:@"kWFLocSecurityWPA3EnterpriseTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
                      int v37 = [v3 isEqualToString:v36];

                      if (v37) {
                        int64_t v7 = 10;
                      }
                      else {
                        int64_t v7 = 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

- (id)_securityStringFromType:(int64_t)a3
{
  int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = v4;
  if ((unint64_t)a3 > 0xA)
  {
    char v6 = 0;
  }
  else
  {
    char v6 = [v4 localizedStringForKey:off_264756968[a3] value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }

  return v6;
}

- (id)_selectedPrivateModeForOption:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int64_t v4 = v3;
      uint64_t v5 = @"kWFLocRandomMACStaticOption";
      goto LABEL_7;
    case 2uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int64_t v4 = v3;
      uint64_t v5 = @"kWFLocRandomMACRotatingOption";
      goto LABEL_7;
    case 1uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int64_t v4 = v3;
      uint64_t v5 = @"kWFLocRandomMACOffOption";
LABEL_7:
      char v6 = [v3 localizedStringForKey:v5 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      goto LABEL_9;
  }
  char v6 = 0;
LABEL_9:
  return v6;
}

- (unint64_t)_selectedPrivateModeForString:(id)a3
{
  id v3 = a3;
  int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"kWFLocRandomMACOffOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    unint64_t v7 = 1;
  }
  else
  {
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int64_t v9 = [v8 localizedStringForKey:@"kWFLocRandomMACStaticOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    char v10 = [v3 isEqualToString:v9];

    if (v10)
    {
      unint64_t v7 = 3;
    }
    else
    {
      long long v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v12 = [v11 localizedStringForKey:@"kWFLocRandomMACRotatingOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
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

- (BOOL)_canShowModes
{
  v2 = [(WFOtherNetworkViewController *)self TLSIdentities];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_TLSIdentityDescription
{
  v2 = [(WFOtherNetworkViewController *)self TLSIdentity];
  return WFDescriptionFromIdentity(v2);
}

- (id)_WAPIIdentityDescription
{
  v2 = [(WFOtherNetworkViewController *)self WAPIIdentity];
  BOOL v3 = WFDescriptionFromIdentity(v2);

  return v3;
}

- (id)_WAPIRootCertificateDescription
{
  v2 = [(WFOtherNetworkViewController *)self WAPIRootCertificate];
  BOOL v3 = WFDescriptionFromIdentity(v2);

  return v3;
}

- (int64_t)_returnKeyType
{
  BOOL v3 = [(WFOtherNetworkViewController *)self securityMode] != 4
    && [(WFOtherNetworkViewController *)self securityMode] != 5
    && [(WFOtherNetworkViewController *)self securityMode] != 10;
  if ([(WFOtherNetworkViewController *)self style] && [(WFOtherNetworkViewController *)self style] != 3)
  {
    int64_t v4 = 4;
    if (v3) {
      return v4;
    }
    goto LABEL_11;
  }
  if (v3) {
    int64_t v4 = 3;
  }
  else {
    int64_t v4 = 4;
  }
  if (!v3)
  {
LABEL_11:
    mostRecentFirstResponder = self->_mostRecentFirstResponder;
    char v6 = [(WFOtherNetworkViewController *)self passwordCell];
    BOOL v7 = mostRecentFirstResponder == v6;

    if (v7) {
      return 3;
    }
  }
  return v4;
}

- (void)setPasswordRequired:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_passwordRequired != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
    {
      int v7 = 136315394;
      id v8 = "-[WFOtherNetworkViewController setPasswordRequired:]";
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl(&dword_2257EC000, v5, v6, "%s: passwordRequired %d", (uint8_t *)&v7, 0x12u);
    }

    self->_passwordRequired = v3;
    [(WFOtherNetworkViewController *)self _updateSections];
    [(WFOtherNetworkViewController *)self _updateJoinable];
  }
}

- (void)setActivityString:(id)a3
{
  self->_activityString = (NSString *)a3;
  if (a3)
  {
    defaultActivityString = (NSString *)a3;
  }
  else
  {
    defaultActivityString = self->_defaultActivityString;
    id v6 = 0;
  }
  id v7 = [(WFOtherNetworkViewController *)self navigationItem];
  [v7 setPrompt:defaultActivityString];
}

- (void)resetFirstResponder
{
  BOOL v3 = [(WFOtherNetworkViewController *)self passwordCell];

  if (v3)
  {
    id v4 = [(WFOtherNetworkViewController *)self passwordCell];
    [v4 becomeFirstResponder];
  }
  else
  {
    [(WFOtherNetworkViewController *)self setFirstResponderCell:2];
  }
}

- (BOOL)wantsModalPresentation
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)activityString
{
  return self->_activityString;
}

- (BOOL)joining
{
  return self->_joining;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (void)setDeviceCapability:(int64_t)a3
{
  self->_deviceCapability = a3;
}

- (WFOtherNetworkViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFOtherNetworkViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (int64_t)securityMode
{
  return self->_securityMode;
}

- (unint64_t)privateAddressMode
{
  return self->_privateAddressMode;
}

- (void)setPrivateAddressMode:(unint64_t)a3
{
  self->_privateAddressMode = a3;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int64_t)profileMode
{
  return self->_profileMode;
}

- (BOOL)WAPIEnabled
{
  return self->_WAPIEnabled;
}

- (void)setWAPIEnabled:(BOOL)a3
{
  self->_WAPIEnabled = a3;
}

- (__SecIdentity)TLSIdentity
{
  return self->_TLSIdentity;
}

- (NSArray)TLSIdentities
{
  return self->_TLSIdentities;
}

- (NSArray)WAPIRootCertificates
{
  return self->_WAPIRootCertificates;
}

- (void)setWAPIRootCertificates:(id)a3
{
}

- (id)WAPIRootCertificate
{
  return self->_WAPIRootCertificate;
}

- (NSArray)WAPIIdentities
{
  return self->_WAPIIdentities;
}

- (void)setWAPIIdentities:(id)a3
{
}

- (id)WAPIIdentity
{
  return self->_WAPIIdentity;
}

- (BOOL)supportsWiFiPasswordSharing
{
  return self->_supportsWiFiPasswordSharing;
}

- (void)setSupportsWiFiPasswordSharing:(BOOL)a3
{
  self->_supportsWiFiPasswordSharing = a3;
}

- (NSString)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (BOOL)passwordRequired
{
  return self->_passwordRequired;
}

- (BOOL)WPA3PersonalEnabled
{
  return self->_WPA3PersonalEnabled;
}

- (void)setWPA3PersonalEnabled:(BOOL)a3
{
  self->_WPA3PersonalEnabled = a3;
}

- (BOOL)WPA3EnterpriseEnabled
{
  return self->_WPA3EnterpriseEnabled;
}

- (void)setWPA3EnterpriseEnabled:(BOOL)a3
{
  self->_WPA3EnterpriseEnabled = a3;
}

- (BOOL)WPA2EnterpriseEnabledMFPCapable
{
  return self->_WPA2EnterpriseEnabledMFPCapable;
}

- (void)setWPA2EnterpriseEnabledMFPCapable:(BOOL)a3
{
  self->_WPA2EnterpriseEnabledMFPCapable = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (BOOL)joinable
{
  return self->_joinable;
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSOrderedSet)securityRows
{
  return self->_securityRows;
}

- (void)setSecurityRows:(id)a3
{
}

- (WFTextFieldCell)nameCell
{
  return self->_nameCell;
}

- (void)setNameCell:(id)a3
{
}

- (WFTextFieldCell)usernameCell
{
  return self->_usernameCell;
}

- (void)setUsernameCell:(id)a3
{
}

- (WFTextFieldCell)passwordCell
{
  return self->_passwordCell;
}

- (void)setPasswordCell:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)firstResponderCell
{
  return self->_firstResponderCell;
}

- (void)setFirstResponderCell:(int64_t)a3
{
  self->_firstResponderCell = a3;
}

- (WFTextFieldCell)mostRecentFirstResponder
{
  return self->_mostRecentFirstResponder;
}

- (void)setMostRecentFirstResponder:(id)a3
{
  self->_mostRecentFirstResponder = (WFTextFieldCell *)a3;
}

- (NSString)defaultActivityString
{
  return self->_defaultActivityString;
}

- (void)setDefaultActivityString:(id)a3
{
}

- (BOOL)overrideDefaultSecurity
{
  return self->_overrideDefaultSecurity;
}

- (void)setOverrideDefaultSecurity:(BOOL)a3
{
  self->_overrideDefaultSecurity = a3;
}

- (WFCredentialsProviderContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
}

- (WFValueListViewController)securityTitlesValueVC
{
  return self->_securityTitlesValueVC;
}

- (void)setSecurityTitlesValueVC:(id)a3
{
}

- (WFValueListViewController)profileModeTitlesValueVC
{
  return self->_profileModeTitlesValueVC;
}

- (void)setProfileModeTitlesValueVC:(id)a3
{
}

- (WFValueListViewController)privateAddressModeTitlesValueVC
{
  return self->_privateAddressModeTitlesValueVC;
}

- (void)setPrivateAddressModeTitlesValueVC:(id)a3
{
}

- (BOOL)shouldCancelContextWhenViewDisappear
{
  return self->_shouldCancelContextWhenViewDisappear;
}

- (void)setShouldCancelContextWhenViewDisappear:(BOOL)a3
{
  self->_shouldCancelContextWhenViewDisappear = a3;
}

- (BOOL)isUsingRandomAddress
{
  return self->_isUsingRandomAddress;
}

- (void)setIsUsingRandomAddress:(BOOL)a3
{
  self->_isUsingRandomAddress = a3;
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (void)setRandomMACAddress:(id)a3
{
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_privateAddressModeTitlesValueVC, 0);
  objc_storeStrong((id *)&self->_profileModeTitlesValueVC, 0);
  objc_storeStrong((id *)&self->_securityTitlesValueVC, 0);
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultActivityString, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
  objc_storeStrong((id *)&self->_nameCell, 0);
  objc_storeStrong((id *)&self->_securityRows, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_WAPIIdentities, 0);
  objc_storeStrong((id *)&self->_WAPIRootCertificates, 0);
  objc_storeStrong((id *)&self->_TLSIdentities, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->SSID, 0);
}

@end