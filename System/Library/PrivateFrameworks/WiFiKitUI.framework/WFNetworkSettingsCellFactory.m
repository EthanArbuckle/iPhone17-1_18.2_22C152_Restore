@interface WFNetworkSettingsCellFactory
- (UITableView)tableView;
- (WFNetworkSettingsCellFactory)initWithTableView:(id)a3;
- (id)autoJoinCellAtIndexPath:(id)a3;
- (id)autoLoginCellAtIndexPath:(id)a3;
- (id)credentialsViewerCellAtIndexPath:(id)a3 credentails:(id)a4 hideCredentials:(BOOL)a5 isPassword:(BOOL)a6;
- (id)dhcpClientIDCellAtIndexPath:(id)a3;
- (id)dhcpClientIDTextCellAtIndexPath:(id)a3;
- (id)dnsConfigureCellAtIndexPath:(id)a3;
- (id)dnsSearchDomainsCellAtIndexPath:(id)a3;
- (id)dnsServerAddressesCellAtIndexPath:(id)a3;
- (id)forgetCellAtIndexPath:(id)a3 accessory:(BOOL)a4;
- (id)httpProxyConfigCellAtIndexPath:(id)a3;
- (id)httpProxyPasswordTextCellAtIndexPath:(id)a3;
- (id)httpProxyPortTextCellAtIndexPath:(id)a3;
- (id)httpProxyServerTextCellAtIndexPath:(id)a3;
- (id)httpProxyURLTextCellAtIndexPath:(id)a3;
- (id)httpProxyUserTextCellAtIndexPath:(id)a3;
- (id)ipv4AddressCellAtIndexPath:(id)a3;
- (id)ipv4AddressConfigCellAtIndexPath:(id)a3;
- (id)ipv4AddressTextCellAtIndexPath:(id)a3;
- (id)ipv4RouterCellAtIndexPath:(id)a3;
- (id)ipv4RouterTextCellAtIndexPath:(id)a3;
- (id)ipv4SubnetMaskCellAtIndexPath:(id)a3;
- (id)ipv4SubnetMaskTextCellAtIndexPath:(id)a3;
- (id)ipv6AddressCellAtIndexPath:(id)a3;
- (id)ipv6AddressConfigCellAtIndexPath:(id)a3;
- (id)ipv6RouterCellAtIndexPath:(id)a3;
- (id)joinCellAtIndexPath:(id)a3;
- (id)manageCellAtIndexPath:(id)a3;
- (id)networkQualityCellAtIndexPath:(id)a3;
- (id)outrankedCellAtIndexPath:(id)a3 chinaDevice:(BOOL)a4;
- (id)priorityCellAtIndexPath:(id)a3;
- (id)privacyProxyEnabledCellAtIndexPath:(id)a3;
- (id)randomMACCellAtIndexPath:(id)a3 chinaDevice:(BOOL)a4;
- (id)recommendationCellAtIndexPath:(id)a3;
- (id)renewLeaseCellAtIndexPath:(id)a3;
- (id)saveDataModeCellAtIndexPath:(id)a3;
- (id)segmentedCellAtIndexPath:(id)a3;
- (id)wifiModeCellAtIndexPath:(id)a3;
- (void)_registerCells;
- (void)setTableView:(id)a3;
@end

@implementation WFNetworkSettingsCellFactory

- (WFNetworkSettingsCellFactory)initWithTableView:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_tableView, a3);
    [(WFNetworkSettingsCellFactory *)self _registerCells];
  }
  else
  {

    self = 0;
  }

  return self;
}

- (void)_registerCells
{
  v3 = (void *)MEMORY[0x263F829D0];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v3 nibWithNibName:@"WFTextFieldCell" bundle:v4];

  [(UITableView *)self->_tableView registerNib:v11 forCellReuseIdentifier:@"kWFTextFieldCellIdentifier"];
  id v5 = (void *)MEMORY[0x263F829D0];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v5 nibWithNibName:@"WFRecommendationCell" bundle:v6];

  [(UITableView *)self->_tableView registerNib:v7 forCellReuseIdentifier:@"WFRecommendationCell"];
  v8 = (void *)MEMORY[0x263F829D0];
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v8 nibWithNibName:@"WFSegmentedCell" bundle:v9];

  [(UITableView *)self->_tableView registerNib:v10 forCellReuseIdentifier:@"WFSegmentedCell"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"WFJoinCell"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"WFForgetCell"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"WFManageCell"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFDNSCellIdentifier"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"WFPriorityCell"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFAutoJoinCellIdentifier"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFAutoLoginCellIdentifier"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kWiFiSaveDataModeCellIdentifier"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFPrivacyProxyEnabledCellIdentifier"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFPrivateAddressModeCellIdentifier"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFRandomMACInfoCellIdentifier"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"WFOutrankCell"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFCredentialsCellIdentifier"];
}

- (id)segmentedCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  v6 = [v5 dequeueReusableCellWithIdentifier:@"WFSegmentedCell" forIndexPath:v4];

  return v6;
}

- (id)recommendationCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  v6 = [v5 dequeueReusableCellWithIdentifier:@"WFRecommendationCell" forIndexPath:v4];

  return v6;
}

- (id)joinCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  v6 = [v5 dequeueReusableCellWithIdentifier:@"WFJoinCell" forIndexPath:v4];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingJoinNetworkTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 textLabel];
  [v9 setText:v8];

  v10 = [MEMORY[0x263F825C8] defaultButtonColor];
  id v11 = [v6 textLabel];
  [v11 setTextColor:v10];

  return v6;
}

- (id)forgetCellAtIndexPath:(id)a3 accessory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(WFNetworkSettingsCellFactory *)self tableView];
  v8 = [v7 dequeueReusableCellWithIdentifier:@"WFForgetCell" forIndexPath:v6];

  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = v9;
  id v11 = @"kWFLocSettingForgetNetworkTitle";
  if (v4) {
    v12 = @"kWFLocSettingForgetDeviceTitle";
  }
  else {
    v12 = @"kWFLocSettingForgetNetworkTitle";
  }
  v13 = [v9 localizedStringForKey:v12 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v14 = [v8 textLabel];
  [v14 setText:v13];

  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v4)
  {
    id v11 = [MEMORY[0x263EFAC08] forgetDeviceButtonTitle];
  }
  v16 = [v15 localizedStringForKey:v11 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v17 = [v8 textLabel];
  [v17 setText:v16];

  if (v4) {
  v18 = [MEMORY[0x263F825C8] defaultButtonColor];
  }
  v19 = [v8 textLabel];
  [v19 setTextColor:v18];

  return v8;
}

- (id)outrankedCellAtIndexPath:(id)a3 chinaDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(WFNetworkSettingsCellFactory *)self tableView];
  v8 = [v7 dequeueReusableCellWithIdentifier:@"WFOutrankCell" forIndexPath:v6];

  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = v9;
  if (v4) {
    id v11 = @"kWFLocSettingOutrankTitle_CH";
  }
  else {
    id v11 = @"kWFLocSettingOutrankTitle";
  }
  v12 = [v9 localizedStringForKey:v11 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v13 = [v8 textLabel];
  [v13 setText:v12];

  v14 = [MEMORY[0x263F825C8] defaultButtonColor];
  v15 = [v8 textLabel];
  [v15 setTextColor:v14];

  return v8;
}

- (id)manageCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  id v6 = [v5 dequeueReusableCellWithIdentifier:@"WFManageCell" forIndexPath:v4];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingManageNetworkTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 textLabel];
  [v9 setText:v8];

  v10 = [MEMORY[0x263F825C8] defaultButtonColor];
  id v11 = [v6 textLabel];
  [v11 setTextColor:v10];

  return v6;
}

- (id)priorityCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"WFPriorityCell"];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingAutoJoinPriorityNetworkTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  id v6 = [v3 textLabel];
  [v6 setText:v5];

  [v3 setAccessoryType:1];
  return v3;
}

- (id)autoJoinCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  id v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFAutoJoinCellIdentifier" forIndexPath:v4];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingAutoJoinNetworkTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 textLabel];
  [v9 setText:v8];

  [v6 setSelectionStyle:0];
  return v6;
}

- (id)autoLoginCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  id v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFAutoLoginCellIdentifier" forIndexPath:v4];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingAutoLoginNetworkTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 textLabel];
  [v9 setText:v8];

  [v6 setSelectionStyle:0];
  return v6;
}

- (id)saveDataModeCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  id v6 = [v5 dequeueReusableCellWithIdentifier:@"kWiFiSaveDataModeCellIdentifier" forIndexPath:v4];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingSaveDataModeTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 textLabel];
  [v9 setText:v8];

  [v6 setSelectionStyle:0];
  return v6;
}

- (id)privacyProxyEnabledCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  id v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFPrivacyProxyEnabledCellIdentifier" forIndexPath:v4];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingPrivacyProxyEnabledTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 textLabel];
  [v9 setText:v8];

  v10 = [v6 textLabel];
  [v10 setNumberOfLines:0];

  [v6 setSelectionStyle:0];
  return v6;
}

- (id)networkQualityCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"kWiFiNetworkQualityCellIdentifier"];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingNetworkQualityText" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  id v6 = [v3 textLabel];
  [v6 setText:v5];

  return v3;
}

- (id)credentialsViewerCellAtIndexPath:(id)a3 credentails:(id)a4 hideCredentials:(BOOL)a5 isPassword:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(WFNetworkSettingsCellFactory *)self tableView];
  v13 = [v12 dequeueReusableCellWithIdentifier:@"kWFCredentialsCellIdentifier" forIndexPath:v11];

  v14 = [v13 contentConfiguration];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = v15;
  if (v6) {
    v17 = @"kWFLocSettingPasswordViewerTitle";
  }
  else {
    v17 = @"kWFLocSettingUsernameViewerTitle";
  }
  v18 = [v15 localizedStringForKey:v17 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v14 setText:v18];

  [v13 setContentConfiguration:v14];
  [v13 setCredentials:v10];

  [v13 setHideSecureText:v7];
  return v13;
}

- (id)wifiModeCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"kWFWiFiModeCellIdentifier"];
  id v4 = [v3 defaultContentConfiguration];
  [v3 setContentConfiguration:v4];

  return v3;
}

- (id)randomMACCellAtIndexPath:(id)a3 chinaDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 row] == 1)
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"kWFRandomMACInfoCellIdentifier"];
    BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = v7;
    if (v4) {
      v9 = @"KWFLocSettingRandomMACInfoChinaTitle";
    }
    else {
      v9 = @"KWFLocSettingRandomMACInfoTitle";
    }
    id v10 = [v7 localizedStringForKey:v9 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    id v11 = [v6 textLabel];
    [v11 setText:v10];

    [v6 setSelectionStyle:0];
    v12 = [MEMORY[0x263F825C8] altTextColor];
    v13 = [v6 detailTextLabel];
    [v13 setTextColor:v12];
  }
  else if ([v5 row])
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"kWFPrivateAddressModeCellIdentifier"];
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = v14;
    if (v4) {
      v16 = @"KWFLocSettingRandomMACSwitchChinaTitle";
    }
    else {
      v16 = @"KWFLocSettingRandomMACSwitchTitle";
    }
    v17 = [v14 localizedStringForKey:v16 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    v18 = [v6 textLabel];
    [v18 setText:v17];

    [v6 setSelectionStyle:0];
    v19 = [MEMORY[0x263F825C8] altTextColor];
    v20 = [v6 detailTextLabel];
    [v20 setTextColor:v19];

    [v6 setAccessoryType:1];
  }

  return v6;
}

- (id)ipv4AddressConfigCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingsIPConfigureTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  BOOL v6 = [v3 textLabel];
  [v6 setText:v5];

  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  v8 = [v3 detailTextLabel];
  [v8 setTextColor:v7];

  [v3 setAccessoryType:1];
  [v3 setSelectionStyle:1];
  return v3;
}

- (id)ipv4AddressCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingsIPV4AddressCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  BOOL v6 = [v3 textLabel];
  [v6 setText:v5];

  [v3 setSelectionStyle:0];
  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  v8 = [v3 detailTextLabel];
  [v8 setTextColor:v7];

  return v3;
}

- (id)ipv4SubnetMaskCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingsSubnetMaskCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  BOOL v6 = [v3 textLabel];
  [v6 setText:v5];

  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  v8 = [v3 detailTextLabel];
  [v8 setTextColor:v7];

  [v3 setSelectionStyle:0];
  return v3;
}

- (id)ipv4RouterCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingsIPV4RouterCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  BOOL v6 = [v3 textLabel];
  [v6 setText:v5];

  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  v8 = [v3 detailTextLabel];
  [v8 setTextColor:v7];

  [v3 setSelectionStyle:0];
  return v3;
}

- (id)dhcpClientIDCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingsClientIDCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  BOOL v6 = [v3 textLabel];
  [v6 setText:v5];

  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  v8 = [v3 detailTextLabel];
  [v8 setTextColor:v7];

  [v3 setSelectionStyle:0];
  return v3;
}

- (id)renewLeaseCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"WFForgetCell" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsRenewLeaseCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 textLabel];
  [v9 setText:v8];

  id v10 = [MEMORY[0x263F825C8] defaultButtonColor];
  id v11 = [v6 textLabel];
  [v11 setTextColor:v10];

  return v6;
}

- (id)ipv6AddressConfigCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingsIPConfigureTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  BOOL v6 = [v3 textLabel];
  [v6 setText:v5];

  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  v8 = [v3 detailTextLabel];
  [v8 setTextColor:v7];

  [v3 setAccessoryType:1];
  [v3 setSelectionStyle:1];
  return v3;
}

- (id)ipv6AddressCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingsIPV6AddressCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  BOOL v6 = [v3 textLabel];
  [v6 setText:v5];

  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  v8 = [v3 detailTextLabel];
  [v8 setTextColor:v7];

  [v3 setSelectionStyle:0];
  return v3;
}

- (id)ipv6RouterCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingsIPV6RouterCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  BOOL v6 = [v3 textLabel];
  [v6 setText:v5];

  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  v8 = [v3 detailTextLabel];
  [v8 setTextColor:v7];

  [v3 setSelectionStyle:0];
  return v3;
}

- (id)dnsConfigureCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"kWFDNSCellIdentifier"];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingsDNSConfigureButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  BOOL v6 = [v3 textLabel];
  [v6 setText:v5];

  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  v8 = [v3 detailTextLabel];
  [v8 setTextColor:v7];

  [v3 setAccessoryType:1];
  [v3 setSelectionStyle:1];
  return v3;
}

- (id)httpProxyConfigCellAtIndexPath:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocSettingsProxyConfigureButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  BOOL v6 = [v3 textLabel];
  [v6 setText:v5];

  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  v8 = [v3 detailTextLabel];
  [v8 setTextColor:v7];

  [v3 setAccessoryType:1];
  [v3 setSelectionStyle:1];
  return v3;
}

- (id)dnsSearchDomainsCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsSearchDomainsCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  return v6;
}

- (id)dnsServerAddressesCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsDNSCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  return v6;
}

- (id)ipv4AddressTextCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsIPV4AddressCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  return v6;
}

- (id)ipv4SubnetMaskTextCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsSubnetMaskCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  return v6;
}

- (id)ipv4RouterTextCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsIPV4RouterCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  return v6;
}

- (id)dhcpClientIDTextCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsClientIDCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  return v6;
}

- (id)httpProxyURLTextCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsProxyURLCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  id v11 = [v6 textField];
  [v11 setKeyboardType:3];

  return v6;
}

- (id)httpProxyServerTextCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsProxyServerCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  id v11 = [v6 textField];
  [v11 setKeyboardType:3];

  return v6;
}

- (id)httpProxyPortTextCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsProxyPortCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  id v11 = [v6 textField];
  [v11 setKeyboardType:4];

  return v6;
}

- (id)httpProxyUserTextCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsProxyUsernameCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  id v11 = [v6 textField];
  [v11 setTextContentType:*MEMORY[0x263F83AA8]];

  return v6;
}

- (id)httpProxyPasswordTextCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkSettingsCellFactory *)self tableView];
  BOOL v6 = [v5 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v4];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"kWFLocSettingsProxyPasswordCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v9 = [v6 label];
  [v9 setText:v8];

  id v10 = [v6 textField];
  [v10 setTextAlignment:2];

  id v11 = [v6 textField];
  [v11 setTextContentType:*MEMORY[0x263F83A70]];

  v12 = [v6 textField];
  [v12 setSecureTextEntry:1];

  return v6;
}

- (UITableView)tableView
{
  return (UITableView *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end