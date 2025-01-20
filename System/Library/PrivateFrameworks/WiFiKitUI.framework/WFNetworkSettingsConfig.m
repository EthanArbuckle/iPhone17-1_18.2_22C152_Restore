@interface WFNetworkSettingsConfig
- (BOOL)autoJoinConfigurable;
- (BOOL)autoJoinEnabled;
- (BOOL)autoLoginConfigurable;
- (BOOL)autoLoginEnabled;
- (BOOL)canRenewLease;
- (BOOL)cloudSyncable;
- (BOOL)current;
- (BOOL)diagnosable;
- (BOOL)forgetable;
- (BOOL)httpProxyAuthenticationRequired;
- (BOOL)httpProxyConfigurable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNetworkSettingsConfig:(id)a3;
- (BOOL)isInSaveDataMode;
- (BOOL)joinable;
- (BOOL)manageable;
- (BOOL)networkQualityVisible;
- (BOOL)privacyProxyConfigurable;
- (BOOL)privacyProxyEnabled;
- (BOOL)saveDataModeConfigurable;
- (BOOL)validIPv4Configuration;
- (BOOL)validIPv6Configuration;
- (BOOL)validProxyConfiguration;
- (BOOL)wifiOutrankEnabled;
- (NSArray)dnsSearchDomains;
- (NSArray)dnsServerAddresses;
- (NSArray)healthRecommendations;
- (NSArray)ipv6Addresses;
- (NSArray)ipv6PrefixLengths;
- (NSDate)dhcpLeaseExpirationDate;
- (NSDate)networkQualityDate;
- (NSString)dhcpClientID;
- (NSString)displayFriendlyName;
- (NSString)httpProxyConfigPAC;
- (NSString)httpProxyPassword;
- (NSString)httpProxyServerAddress;
- (NSString)httpProxyServerPort;
- (NSString)httpProxyUsername;
- (NSString)ipv4Address;
- (NSString)ipv4AddressManual;
- (NSString)ipv4RouterAddress;
- (NSString)ipv4RouterAddressManual;
- (NSString)ipv4SubnetMask;
- (NSString)ipv4SubnetMaskManual;
- (NSString)ipv6AddressManual;
- (NSString)ipv6PrefixLengthManual;
- (NSString)ipv6RouterAddress;
- (NSString)ipv6RouterAddressManual;
- (NSString)ssid;
- (WFNetworkSettingsConfig)init;
- (double)networkQualityResponsiveness;
- (id)changesBetweenConfig:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)dnsConfig;
- (int64_t)httpProxyConfig;
- (int64_t)ipv4Config;
- (int64_t)ipv6Config;
- (int64_t)privacyProxyTierStatus;
- (void)setAutoJoinConfigurable:(BOOL)a3;
- (void)setAutoJoinEnabled:(BOOL)a3;
- (void)setAutoLoginConfigurable:(BOOL)a3;
- (void)setAutoLoginEnabled:(BOOL)a3;
- (void)setCanRenewLease:(BOOL)a3;
- (void)setCloudSyncable:(BOOL)a3;
- (void)setCurrent:(BOOL)a3;
- (void)setDhcpClientID:(id)a3;
- (void)setDhcpLeaseExpirationDate:(id)a3;
- (void)setDiagnosable:(BOOL)a3;
- (void)setDisplayFriendlyName:(id)a3;
- (void)setDnsConfig:(int64_t)a3;
- (void)setDnsSearchDomains:(id)a3;
- (void)setDnsServerAddresses:(id)a3;
- (void)setForgetable:(BOOL)a3;
- (void)setHealthRecommendations:(id)a3;
- (void)setHttpProxyAuthenticationRequired:(BOOL)a3;
- (void)setHttpProxyConfig:(int64_t)a3;
- (void)setHttpProxyConfigPAC:(id)a3;
- (void)setHttpProxyConfigurable:(BOOL)a3;
- (void)setHttpProxyPassword:(id)a3;
- (void)setHttpProxyServerAddress:(id)a3;
- (void)setHttpProxyServerPort:(id)a3;
- (void)setHttpProxyUsername:(id)a3;
- (void)setIpv4Address:(id)a3;
- (void)setIpv4AddressManual:(id)a3;
- (void)setIpv4Config:(int64_t)a3;
- (void)setIpv4RouterAddress:(id)a3;
- (void)setIpv4RouterAddressManual:(id)a3;
- (void)setIpv4SubnetMask:(id)a3;
- (void)setIpv4SubnetMaskManual:(id)a3;
- (void)setIpv6AddressManual:(id)a3;
- (void)setIpv6Addresses:(id)a3;
- (void)setIpv6Config:(int64_t)a3;
- (void)setIpv6PrefixLengthManual:(id)a3;
- (void)setIpv6PrefixLengths:(id)a3;
- (void)setIpv6RouterAddress:(id)a3;
- (void)setIpv6RouterAddressManual:(id)a3;
- (void)setIsInSaveDataMode:(BOOL)a3;
- (void)setJoinable:(BOOL)a3;
- (void)setManageable:(BOOL)a3;
- (void)setNetworkQualityDate:(id)a3;
- (void)setNetworkQualityResponsiveness:(double)a3;
- (void)setNetworkQualityVisible:(BOOL)a3;
- (void)setPrivacyProxyConfigurable:(BOOL)a3;
- (void)setPrivacyProxyEnabled:(BOOL)a3;
- (void)setPrivacyProxyTierStatus:(int64_t)a3;
- (void)setSaveDataModeConfigurable:(BOOL)a3;
- (void)setSsid:(id)a3;
- (void)setWifiOutrankEnabled:(BOOL)a3;
@end

@implementation WFNetworkSettingsConfig

- (WFNetworkSettingsConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)WFNetworkSettingsConfig;
  result = [(WFNetworkSettingsConfig *)&v3 init];
  if (result)
  {
    result->_ipv4Config = -1;
    result->_ipv6Config = -1;
    result->_current = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(WFNetworkSettingsConfig);
  if (v5)
  {
    v6 = [(WFNetworkSettingsConfig *)self healthRecommendations];
    [(WFNetworkSettingsConfig *)v5 setHealthRecommendations:v6];

    v7 = [(WFNetworkSettingsConfig *)self ssid];
    [(WFNetworkSettingsConfig *)v5 setSsid:v7];

    v8 = [(WFNetworkSettingsConfig *)self displayFriendlyName];
    v9 = (void *)[v8 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setDisplayFriendlyName:v9];

    [(WFNetworkSettingsConfig *)v5 setCurrent:[(WFNetworkSettingsConfig *)self current]];
    [(WFNetworkSettingsConfig *)v5 setForgetable:[(WFNetworkSettingsConfig *)self forgetable]];
    [(WFNetworkSettingsConfig *)v5 setJoinable:[(WFNetworkSettingsConfig *)self joinable]];
    [(WFNetworkSettingsConfig *)v5 setManageable:[(WFNetworkSettingsConfig *)self manageable]];
    [(WFNetworkSettingsConfig *)v5 setCloudSyncable:[(WFNetworkSettingsConfig *)self cloudSyncable]];
    [(WFNetworkSettingsConfig *)v5 setCanRenewLease:[(WFNetworkSettingsConfig *)self canRenewLease]];
    [(WFNetworkSettingsConfig *)v5 setDiagnosable:[(WFNetworkSettingsConfig *)self diagnosable]];
    [(WFNetworkSettingsConfig *)v5 setAutoJoinConfigurable:[(WFNetworkSettingsConfig *)self autoJoinConfigurable]];
    [(WFNetworkSettingsConfig *)v5 setAutoJoinEnabled:[(WFNetworkSettingsConfig *)self autoJoinEnabled]];
    [(WFNetworkSettingsConfig *)v5 setAutoLoginConfigurable:[(WFNetworkSettingsConfig *)self autoLoginConfigurable]];
    [(WFNetworkSettingsConfig *)v5 setAutoLoginEnabled:[(WFNetworkSettingsConfig *)self autoLoginEnabled]];
    [(WFNetworkSettingsConfig *)v5 setSaveDataModeConfigurable:[(WFNetworkSettingsConfig *)self saveDataModeConfigurable]];
    [(WFNetworkSettingsConfig *)v5 setPrivacyProxyTierStatus:[(WFNetworkSettingsConfig *)self privacyProxyTierStatus]];
    [(WFNetworkSettingsConfig *)v5 setIsInSaveDataMode:[(WFNetworkSettingsConfig *)self isInSaveDataMode]];
    [(WFNetworkSettingsConfig *)v5 setPrivacyProxyEnabled:[(WFNetworkSettingsConfig *)self privacyProxyEnabled]];
    [(WFNetworkSettingsConfig *)v5 setWifiOutrankEnabled:[(WFNetworkSettingsConfig *)self wifiOutrankEnabled]];
    [(WFNetworkSettingsConfig *)v5 setNetworkQualityVisible:[(WFNetworkSettingsConfig *)self networkQualityVisible]];
    [(WFNetworkSettingsConfig *)self networkQualityResponsiveness];
    -[WFNetworkSettingsConfig setNetworkQualityResponsiveness:](v5, "setNetworkQualityResponsiveness:");
    v10 = [(WFNetworkSettingsConfig *)self networkQualityDate];
    v11 = (void *)[v10 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setNetworkQualityDate:v11];

    [(WFNetworkSettingsConfig *)v5 setIpv4Config:[(WFNetworkSettingsConfig *)self ipv4Config]];
    v12 = [(WFNetworkSettingsConfig *)self ipv4Address];
    v13 = (void *)[v12 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv4Address:v13];

    v14 = [(WFNetworkSettingsConfig *)self ipv4AddressManual];
    v15 = (void *)[v14 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv4AddressManual:v15];

    v16 = [(WFNetworkSettingsConfig *)self ipv4SubnetMask];
    v17 = (void *)[v16 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv4SubnetMask:v17];

    v18 = [(WFNetworkSettingsConfig *)self ipv4SubnetMaskManual];
    v19 = (void *)[v18 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv4SubnetMaskManual:v19];

    v20 = [(WFNetworkSettingsConfig *)self ipv4RouterAddress];
    v21 = (void *)[v20 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv4RouterAddress:v21];

    v22 = [(WFNetworkSettingsConfig *)self ipv4RouterAddressManual];
    v23 = (void *)[v22 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv4RouterAddressManual:v23];

    v24 = [(WFNetworkSettingsConfig *)self dhcpClientID];
    v25 = (void *)[v24 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setDhcpClientID:v25];

    v26 = [(WFNetworkSettingsConfig *)self dhcpLeaseExpirationDate];
    v27 = (void *)[v26 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setDhcpLeaseExpirationDate:v27];

    [(WFNetworkSettingsConfig *)v5 setIpv6Config:[(WFNetworkSettingsConfig *)self ipv6Config]];
    v28 = [(WFNetworkSettingsConfig *)self ipv6Addresses];
    v29 = (void *)[v28 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv6Addresses:v29];

    v30 = [(WFNetworkSettingsConfig *)self ipv6PrefixLengths];
    v31 = (void *)[v30 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv6PrefixLengths:v31];

    v32 = [(WFNetworkSettingsConfig *)self ipv6AddressManual];
    v33 = (void *)[v32 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv6AddressManual:v33];

    v34 = [(WFNetworkSettingsConfig *)self ipv6RouterAddress];
    v35 = (void *)[v34 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv6RouterAddress:v35];

    v36 = [(WFNetworkSettingsConfig *)self ipv6RouterAddressManual];
    v37 = (void *)[v36 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv6RouterAddressManual:v37];

    v38 = [(WFNetworkSettingsConfig *)self ipv6PrefixLengthManual];
    v39 = (void *)[v38 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setIpv6PrefixLengthManual:v39];

    [(WFNetworkSettingsConfig *)v5 setDnsConfig:[(WFNetworkSettingsConfig *)self dnsConfig]];
    v40 = [(WFNetworkSettingsConfig *)self dnsServerAddresses];
    v41 = (void *)[v40 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setDnsServerAddresses:v41];

    v42 = [(WFNetworkSettingsConfig *)self dnsSearchDomains];
    v43 = (void *)[v42 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setDnsSearchDomains:v43];

    [(WFNetworkSettingsConfig *)v5 setHttpProxyConfigurable:[(WFNetworkSettingsConfig *)self httpProxyConfigurable]];
    [(WFNetworkSettingsConfig *)v5 setHttpProxyConfig:[(WFNetworkSettingsConfig *)self httpProxyConfig]];
    v44 = [(WFNetworkSettingsConfig *)self httpProxyServerAddress];
    v45 = (void *)[v44 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setHttpProxyServerAddress:v45];

    v46 = [(WFNetworkSettingsConfig *)self httpProxyServerPort];
    v47 = (void *)[v46 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setHttpProxyServerPort:v47];

    [(WFNetworkSettingsConfig *)v5 setHttpProxyAuthenticationRequired:[(WFNetworkSettingsConfig *)self httpProxyAuthenticationRequired]];
    v48 = [(WFNetworkSettingsConfig *)self httpProxyUsername];
    v49 = (void *)[v48 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setHttpProxyUsername:v49];

    v50 = [(WFNetworkSettingsConfig *)self httpProxyPassword];
    v51 = (void *)[v50 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setHttpProxyPassword:v51];

    v52 = [(WFNetworkSettingsConfig *)self httpProxyConfigPAC];
    v53 = (void *)[v52 copyWithZone:a3];
    [(WFNetworkSettingsConfig *)v5 setHttpProxyConfigPAC:v53];
  }
  return v5;
}

- (BOOL)validProxyConfiguration
{
  if ([(WFNetworkSettingsConfig *)self httpProxyConfig] != 1) {
    goto LABEL_10;
  }
  uint64_t v3 = [(WFNetworkSettingsConfig *)self httpProxyServerAddress];
  if (!v3) {
    goto LABEL_6;
  }
  v4 = (void *)v3;
  v5 = [(WFNetworkSettingsConfig *)self httpProxyServerAddress];
  char v6 = [v5 isEmpty];

  if (v6) {
    goto LABEL_6;
  }
  uint64_t v7 = [(WFNetworkSettingsConfig *)self httpProxyServerPort];
  if (!v7
    || (v8 = (void *)v7,
        [(WFNetworkSettingsConfig *)self httpProxyServerPort],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEmpty],
        v9,
        v8,
        (v10 & 1) != 0))
  {
LABEL_6:
    LOBYTE(v11) = 0;
    return v11;
  }
  if (![(WFNetworkSettingsConfig *)self httpProxyAuthenticationRequired])
  {
LABEL_10:
    LOBYTE(v11) = 1;
    return v11;
  }
  v12 = [(WFNetworkSettingsConfig *)self httpProxyUsername];
  if (v12)
  {
    v13 = [(WFNetworkSettingsConfig *)self httpProxyUsername];
    int v11 = [v13 isEmpty] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)validIPv4Configuration
{
  if ([(WFNetworkSettingsConfig *)self ipv4Config] != 2)
  {
LABEL_12:
    LOBYTE(v3) = 1;
    return v3;
  }
  uint64_t v3 = [(WFNetworkSettingsConfig *)self ipv4AddressManual];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(WFNetworkSettingsConfig *)self ipv4AddressManual];
    if ([v5 isEmpty])
    {
LABEL_4:

LABEL_13:
      LOBYTE(v3) = 0;
      return v3;
    }
    char v6 = [(WFNetworkSettingsConfig *)self ipv4AddressManual];
    int v7 = [v6 isValidIPv4Address];

    if (!v7) {
      goto LABEL_13;
    }
    uint64_t v3 = [(WFNetworkSettingsConfig *)self ipv4SubnetMaskManual];
    if (v3)
    {
      v4 = (void *)v3;
      v5 = [(WFNetworkSettingsConfig *)self ipv4SubnetMaskManual];
      if ([v5 isEmpty]) {
        goto LABEL_4;
      }
      v8 = [(WFNetworkSettingsConfig *)self ipv4SubnetMaskManual];
      int v9 = [v8 isValidSubnetMask];

      if (!v9) {
        goto LABEL_13;
      }
      uint64_t v10 = [(WFNetworkSettingsConfig *)self ipv4RouterAddressManual];
      if (v10)
      {
        v4 = (void *)v10;
        v5 = [(WFNetworkSettingsConfig *)self ipv4RouterAddressManual];
        if ([v5 isEmpty]) {
          goto LABEL_4;
        }
        int v11 = [(WFNetworkSettingsConfig *)self ipv4RouterAddressManual];
        int v12 = [v11 isValidIPv4Address];

        if (!v12) {
          goto LABEL_13;
        }
      }
      goto LABEL_12;
    }
  }
  return v3;
}

- (BOOL)validIPv6Configuration
{
  if ([(WFNetworkSettingsConfig *)self ipv6Config] != 1) {
    goto LABEL_5;
  }
  uint64_t v3 = [(WFNetworkSettingsConfig *)self ipv6AddressManual];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(WFNetworkSettingsConfig *)self ipv6AddressManual];
    char v6 = [v5 isEmpty];

    if (v6)
    {
      LOBYTE(v3) = 0;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(WFNetworkSettingsConfig *)self isEqualToNetworkSettingsConfig:v4];

  return v5;
}

- (BOOL)isEqualToNetworkSettingsConfig:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFNetworkSettingsConfig *)self ssid];
  char v6 = [v4 ssid];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_20;
  }
  v8 = [(WFNetworkSettingsConfig *)self displayFriendlyName];
  int v9 = [v4 displayFriendlyName];
  int v10 = [v8 isEqualToString:v9];

  if (!v10) {
    goto LABEL_20;
  }
  int v11 = [(WFNetworkSettingsConfig *)self current];
  if (v11 != [v4 current]) {
    goto LABEL_20;
  }
  int v12 = [(WFNetworkSettingsConfig *)self forgetable];
  if (v12 != [v4 forgetable]) {
    goto LABEL_20;
  }
  int v13 = [(WFNetworkSettingsConfig *)self joinable];
  if (v13 != [v4 joinable]) {
    goto LABEL_20;
  }
  int v14 = [(WFNetworkSettingsConfig *)self manageable];
  if (v14 != [v4 manageable]) {
    goto LABEL_20;
  }
  int v15 = [(WFNetworkSettingsConfig *)self cloudSyncable];
  if (v15 != [v4 cloudSyncable]) {
    goto LABEL_20;
  }
  int v16 = [(WFNetworkSettingsConfig *)self canRenewLease];
  if (v16 != [v4 canRenewLease]) {
    goto LABEL_20;
  }
  int v17 = [(WFNetworkSettingsConfig *)self autoJoinConfigurable];
  if (v17 != [v4 autoJoinConfigurable]) {
    goto LABEL_20;
  }
  int v18 = [(WFNetworkSettingsConfig *)self autoJoinEnabled];
  if (v18 != [v4 autoJoinEnabled]) {
    goto LABEL_20;
  }
  int v19 = [(WFNetworkSettingsConfig *)self autoLoginConfigurable];
  if (v19 != [v4 autoLoginConfigurable]) {
    goto LABEL_20;
  }
  int v20 = [(WFNetworkSettingsConfig *)self autoLoginEnabled];
  if (v20 != [v4 autoLoginEnabled]) {
    goto LABEL_20;
  }
  int v21 = [(WFNetworkSettingsConfig *)self saveDataModeConfigurable];
  if (v21 != [v4 saveDataModeConfigurable]) {
    goto LABEL_20;
  }
  int v22 = [(WFNetworkSettingsConfig *)self isInSaveDataMode];
  if (v22 != [v4 isInSaveDataMode]) {
    goto LABEL_20;
  }
  int64_t v23 = [(WFNetworkSettingsConfig *)self privacyProxyTierStatus];
  if (v23 != [v4 privacyProxyTierStatus]) {
    goto LABEL_20;
  }
  int v24 = [(WFNetworkSettingsConfig *)self privacyProxyEnabled];
  if (v24 != [v4 privacyProxyEnabled]) {
    goto LABEL_20;
  }
  int v25 = [(WFNetworkSettingsConfig *)self wifiOutrankEnabled];
  if (v25 != [v4 wifiOutrankEnabled]) {
    goto LABEL_20;
  }
  int v26 = [(WFNetworkSettingsConfig *)self networkQualityVisible];
  if (v26 != [v4 networkQualityVisible]) {
    goto LABEL_20;
  }
  [(WFNetworkSettingsConfig *)self networkQualityResponsiveness];
  double v28 = v27;
  [v4 networkQualityResponsiveness];
  if (v28 != v29) {
    goto LABEL_20;
  }
  v32 = [(WFNetworkSettingsConfig *)self networkQualityDate];
  if (v32 || ([v4 networkQualityDate], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v33 = [(WFNetworkSettingsConfig *)self networkQualityDate];
    v34 = [v4 networkQualityDate];
    int v35 = [v33 isEqual:v34];

    if (v32)
    {

      if (!v35) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v35 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  int64_t v36 = [(WFNetworkSettingsConfig *)self ipv4Config];
  if (v36 != [v4 ipv4Config]) {
    goto LABEL_20;
  }
  v37 = [(WFNetworkSettingsConfig *)self ipv4Address];
  if (v37 || ([v4 ipv4Address], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v38 = [(WFNetworkSettingsConfig *)self ipv4Address];
    v39 = [v4 ipv4Address];
    int v40 = [v38 isEqualToString:v39];

    if (v37)
    {

      if (!v40) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v40 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v41 = [(WFNetworkSettingsConfig *)self ipv4AddressManual];
  if (v41 || ([v4 ipv4AddressManual], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v42 = [(WFNetworkSettingsConfig *)self ipv4AddressManual];
    v43 = [v4 ipv4AddressManual];
    int v44 = [v42 isEqualToString:v43];

    if (v41)
    {

      if (!v44) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v44 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v45 = [(WFNetworkSettingsConfig *)self ipv4SubnetMask];
  if (v45 || ([v4 ipv4SubnetMask], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v46 = [(WFNetworkSettingsConfig *)self ipv4SubnetMask];
    v47 = [v4 ipv4SubnetMask];
    int v48 = [v46 isEqualToString:v47];

    if (v45)
    {

      if (!v48) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v48 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v49 = [(WFNetworkSettingsConfig *)self ipv4SubnetMaskManual];
  if (v49 || ([v4 ipv4SubnetMaskManual], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v50 = [(WFNetworkSettingsConfig *)self ipv4SubnetMaskManual];
    v51 = [v4 ipv4SubnetMaskManual];
    int v52 = [v50 isEqualToString:v51];

    if (v49)
    {

      if (!v52) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v52 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v53 = [(WFNetworkSettingsConfig *)self ipv4RouterAddress];
  if (v53 || ([v4 ipv4RouterAddress], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v54 = [(WFNetworkSettingsConfig *)self ipv4RouterAddress];
    v55 = [v4 ipv4RouterAddress];
    int v56 = [v54 isEqualToString:v55];

    if (v53)
    {

      if (!v56) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v56 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v57 = [(WFNetworkSettingsConfig *)self ipv4RouterAddressManual];
  if (v57 || ([v4 ipv4RouterAddressManual], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v58 = [(WFNetworkSettingsConfig *)self ipv4RouterAddressManual];
    v59 = [v4 ipv4RouterAddressManual];
    int v60 = [v58 isEqualToString:v59];

    if (v57)
    {

      if (!v60) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v60 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v61 = [(WFNetworkSettingsConfig *)self dhcpClientID];
  if (v61 || ([v4 dhcpClientID], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v62 = [(WFNetworkSettingsConfig *)self dhcpClientID];
    v63 = [v4 dhcpClientID];
    int v64 = [v62 isEqualToString:v63];

    if (v61)
    {

      if (!v64) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v64 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v65 = [(WFNetworkSettingsConfig *)self dhcpLeaseExpirationDate];
  if (v65 || ([v4 dhcpLeaseExpirationDate], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v66 = [(WFNetworkSettingsConfig *)self dhcpLeaseExpirationDate];
    v67 = [v4 dhcpLeaseExpirationDate];
    int v68 = [v66 isEqual:v67];

    if (v65)
    {

      if (!v68) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v68 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  int64_t v69 = [(WFNetworkSettingsConfig *)self ipv6Config];
  if (v69 != [v4 ipv6Config]) {
    goto LABEL_20;
  }
  v70 = [(WFNetworkSettingsConfig *)self ipv6Addresses];
  if (v70 || ([v4 ipv6Addresses], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v71 = [(WFNetworkSettingsConfig *)self ipv6Addresses];
    v72 = [v4 ipv6Addresses];
    int v73 = [v71 isEqualToArray:v72];

    if (v70)
    {

      if (!v73) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v73 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v74 = [(WFNetworkSettingsConfig *)self ipv6PrefixLengths];
  if (v74 || ([v4 ipv6PrefixLengths], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v75 = [(WFNetworkSettingsConfig *)self ipv6PrefixLengths];
    v76 = [v4 ipv6PrefixLengths];
    int v77 = [v75 isEqualToArray:v76];

    if (v74)
    {

      if (!v77) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v77 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v78 = [(WFNetworkSettingsConfig *)self ipv6AddressManual];
  if (v78 || ([v4 ipv6AddressManual], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v79 = [(WFNetworkSettingsConfig *)self ipv6AddressManual];
    v80 = [v4 ipv6AddressManual];
    int v81 = [v79 isEqualToString:v80];

    if (v78)
    {

      if (!v81) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v81 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v82 = [(WFNetworkSettingsConfig *)self ipv6RouterAddress];
  if (v82 || ([v4 ipv6RouterAddress], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v83 = [(WFNetworkSettingsConfig *)self ipv6RouterAddress];
    v84 = [v4 ipv6RouterAddress];
    int v85 = [v83 isEqualToString:v84];

    if (v82)
    {

      if (!v85) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v85 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v86 = [(WFNetworkSettingsConfig *)self ipv6RouterAddressManual];
  if (v86 || ([v4 ipv6RouterAddressManual], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v87 = [(WFNetworkSettingsConfig *)self ipv6RouterAddressManual];
    v88 = [v4 ipv6RouterAddressManual];
    int v89 = [v87 isEqualToString:v88];

    if (v86)
    {

      if (!v89) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v89 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v90 = [(WFNetworkSettingsConfig *)self ipv6PrefixLengthManual];
  if (v90 || ([v4 ipv6PrefixLengthManual], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v91 = [(WFNetworkSettingsConfig *)self ipv6PrefixLengthManual];
    v92 = [v4 ipv6PrefixLengthManual];
    int v93 = [v91 isEqualToString:v92];

    if (v90)
    {

      if (!v93) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v93 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  int64_t v94 = [(WFNetworkSettingsConfig *)self dnsConfig];
  if (v94 != [v4 dnsConfig]) {
    goto LABEL_20;
  }
  v95 = [(WFNetworkSettingsConfig *)self dnsServerAddresses];
  if (v95 || ([v4 dnsServerAddresses], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v96 = [(WFNetworkSettingsConfig *)self dnsServerAddresses];
    v97 = [v4 dnsServerAddresses];
    int v98 = [v96 isEqualToArray:v97];

    if (v95)
    {

      if (!v98) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v98 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v99 = [(WFNetworkSettingsConfig *)self dnsSearchDomains];
  if (v99 || ([v4 dnsSearchDomains], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v100 = [(WFNetworkSettingsConfig *)self dnsSearchDomains];
    v101 = [v4 dnsSearchDomains];
    int v102 = [v100 isEqualToArray:v101];

    if (v99)
    {

      if (!v102) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v102 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  int v103 = [(WFNetworkSettingsConfig *)self httpProxyConfigurable];
  if (v103 != [v4 httpProxyConfigurable]) {
    goto LABEL_20;
  }
  int64_t v104 = [(WFNetworkSettingsConfig *)self httpProxyConfig];
  if (v104 != [v4 httpProxyConfig]) {
    goto LABEL_20;
  }
  v105 = [(WFNetworkSettingsConfig *)self httpProxyServerAddress];
  if (v105 || ([v4 httpProxyServerAddress], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v106 = [(WFNetworkSettingsConfig *)self httpProxyServerAddress];
    v107 = [v4 httpProxyServerAddress];
    int v108 = [v106 isEqualToString:v107];

    if (v105)
    {

      if (!v108) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v108 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v109 = [(WFNetworkSettingsConfig *)self httpProxyServerPort];
  if (v109 || ([v4 httpProxyServerPort], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v110 = [(WFNetworkSettingsConfig *)self httpProxyServerPort];
    v111 = [v4 httpProxyServerPort];
    int v112 = [v110 isEqualToString:v111];

    if (v109)
    {

      if (!v112) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v112 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  int v113 = [(WFNetworkSettingsConfig *)self httpProxyAuthenticationRequired];
  if (v113 != [v4 httpProxyAuthenticationRequired]) {
    goto LABEL_20;
  }
  v114 = [(WFNetworkSettingsConfig *)self httpProxyUsername];
  if (v114 || ([v4 httpProxyUsername], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v115 = [(WFNetworkSettingsConfig *)self httpProxyUsername];
    v116 = [v4 httpProxyUsername];
    int v117 = [v115 isEqualToString:v116];

    if (v114)
    {

      if (!v117) {
        goto LABEL_20;
      }
    }
    else
    {

      if ((v117 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v118 = [(WFNetworkSettingsConfig *)self httpProxyPassword];
  if (!v118)
  {
    int v9 = [v4 httpProxyPassword];
    if (!v9)
    {
LABEL_154:
      v122 = [(WFNetworkSettingsConfig *)self httpProxyConfigPAC];
      if (v122 || ([v4 httpProxyConfigPAC], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v123 = [(WFNetworkSettingsConfig *)self httpProxyConfigPAC];
        v124 = [v4 httpProxyConfigPAC];
        int v125 = [v123 isEqualToString:v124] ^ 1;

        if (v122)
        {
LABEL_160:

          char v30 = v125 ^ 1;
          goto LABEL_21;
        }
      }
      else
      {
        LOBYTE(v125) = 0;
      }

      goto LABEL_160;
    }
  }
  v119 = [(WFNetworkSettingsConfig *)self httpProxyPassword];
  v120 = [v4 httpProxyPassword];
  int v121 = [v119 isEqualToString:v120];

  if (!v118)
  {

    if ((v121 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_154;
  }

  if (v121) {
    goto LABEL_154;
  }
LABEL_20:
  char v30 = 0;
LABEL_21:

  return v30;
}

- (id)changesBetweenConfig:(id)a3
{
  id v8 = a3;
  int v9 = [MEMORY[0x263EFF9A0] dictionary];
  int v10 = [(WFNetworkSettingsConfig *)self autoJoinEnabled];
  if (v10 != [v8 autoJoinEnabled])
  {
    int v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "autoJoinEnabled"));
    [v9 setObject:v11 forKey:@"autoJoinEnabled"];
  }
  int v12 = [(WFNetworkSettingsConfig *)self autoLoginEnabled];
  if (v12 != [v8 autoLoginEnabled])
  {
    int v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "autoLoginEnabled"));
    [v9 setObject:v13 forKey:@"autoLoginEnabled"];
  }
  int v14 = [(WFNetworkSettingsConfig *)self isInSaveDataMode];
  if (v14 != [v8 isInSaveDataMode])
  {
    int v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isInSaveDataMode"));
    [v9 setObject:v15 forKey:@"isInSaveDataMode"];
  }
  int v16 = [(WFNetworkSettingsConfig *)self privacyProxyEnabled];
  if (v16 != [v8 privacyProxyEnabled])
  {
    int v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "privacyProxyEnabled"));
    [v9 setObject:v17 forKey:@"privacyProxyEnabled"];
  }
  int v18 = [(WFNetworkSettingsConfig *)self wifiOutrankEnabled];
  if (v18 != [v8 wifiOutrankEnabled])
  {
    int v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "wifiOutrankEnabled"));
    [v9 setObject:v19 forKey:@"wifiOutrankEnabled"];
  }
  int v20 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v9);
  int64_t v21 = [(WFNetworkSettingsConfig *)self ipv4Config];
  if (v21 != [v8 ipv4Config])
  {
    int v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "ipv4Config"));
    [v20 setObject:v22 forKey:@"ipv4Config"];
  }
  v105 = v20;
  int64_t v23 = [(WFNetworkSettingsConfig *)self ipv4AddressManual];
  if (v23 || ([v8 ipv4AddressManual], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = [(WFNetworkSettingsConfig *)self ipv4AddressManual];
    uint64_t v6 = [v8 ipv4AddressManual];
    uint64_t v4 = [(id)v5 isEqualToString:v6];

    if (v23)
    {

      if (v4) {
        goto LABEL_23;
      }
    }
    else
    {

      if (v4) {
        goto LABEL_23;
      }
    }
    int v24 = [v8 ipv4AddressManual];
    if (v24)
    {
      uint64_t v3 = [v8 ipv4AddressManual];
      [v20 setObject:v3 forKey:@"ipv4AddressManual"];
    }
    else
    {
      [v20 setObject:&stru_26D8F6070 forKey:@"ipv4AddressManual"];
    }
  }
LABEL_23:
  int v25 = [(WFNetworkSettingsConfig *)self ipv4SubnetMaskManual];
  if (v25 || ([v8 ipv4SubnetMaskManual], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = [(WFNetworkSettingsConfig *)self ipv4SubnetMaskManual];
    uint64_t v6 = [v8 ipv4SubnetMaskManual];
    uint64_t v4 = [(id)v5 isEqualToString:v6];

    if (v25)
    {

      if (v4) {
        goto LABEL_33;
      }
    }
    else
    {

      if (v4) {
        goto LABEL_33;
      }
    }
    int v26 = [v8 ipv4SubnetMaskManual];
    if (v26)
    {
      uint64_t v3 = [v8 ipv4SubnetMaskManual];
      [v20 setObject:v3 forKey:@"ipv4SubnetMaskManual"];
    }
    else
    {
      [v20 setObject:&stru_26D8F6070 forKey:@"ipv4SubnetMaskManual"];
    }
  }
LABEL_33:
  double v27 = [(WFNetworkSettingsConfig *)self ipv4RouterAddressManual];
  if (v27 || ([v8 ipv4RouterAddressManual], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = [(WFNetworkSettingsConfig *)self ipv4RouterAddressManual];
    uint64_t v6 = [v8 ipv4RouterAddressManual];
    uint64_t v4 = [(id)v5 isEqualToString:v6];

    if (v27)
    {

      if (v4) {
        goto LABEL_43;
      }
    }
    else
    {

      if (v4) {
        goto LABEL_43;
      }
    }
    double v28 = [v8 ipv4RouterAddressManual];
    if (v28)
    {
      uint64_t v3 = [v8 ipv4RouterAddressManual];
      [v20 setObject:v3 forKey:@"ipv4RouterAddressManual"];
    }
    else
    {
      [v20 setObject:&stru_26D8F6070 forKey:@"ipv4RouterAddressManual"];
    }
  }
LABEL_43:
  double v29 = [(WFNetworkSettingsConfig *)self dhcpClientID];
  if (v29 || ([v8 dhcpClientID], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = [(WFNetworkSettingsConfig *)self dhcpClientID];
    uint64_t v6 = [v8 dhcpClientID];
    uint64_t v4 = [(id)v5 isEqualToString:v6];

    if (v29)
    {

      if (v4) {
        goto LABEL_53;
      }
    }
    else
    {

      if (v4) {
        goto LABEL_53;
      }
    }
    char v30 = [v8 dhcpClientID];
    if (v30)
    {
      v31 = [v8 dhcpClientID];
      [v20 setObject:v31 forKey:@"dhcpClientID"];
    }
    else
    {
      [v20 setObject:&stru_26D8F6070 forKey:@"dhcpClientID"];
    }
  }
LABEL_53:
  if ([v20 count]) {
    [v104 setObject:v20 forKey:@"WFIPv4Changes"];
  }
  v32 = [MEMORY[0x263EFF9A0] dictionary];
  int64_t v33 = [(WFNetworkSettingsConfig *)self ipv6Config];
  if (v33 != [v8 ipv6Config])
  {
    v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "ipv6Config"));
    [v32 setObject:v34 forKey:@"ipv6Config"];
  }
  int v35 = [(WFNetworkSettingsConfig *)self ipv6Addresses];
  if (v35 || ([v8 ipv6Addresses], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [(WFNetworkSettingsConfig *)self ipv6Addresses];
    int64_t v36 = [v8 ipv6Addresses];
    uint64_t v5 = [(id)v6 isEqualToArray:v36];

    if (v35)
    {

      if (v5) {
        goto LABEL_67;
      }
    }
    else
    {

      if (v5) {
        goto LABEL_67;
      }
    }
    v37 = [v8 ipv6Addresses];
    if (v37) {
      [v8 ipv6Addresses];
    }
    else {
    uint64_t v4 = [MEMORY[0x263EFF8C0] array];
    }
    [v32 setObject:v4 forKey:@"ipv6Addresses"];
  }
LABEL_67:
  v38 = [(WFNetworkSettingsConfig *)self ipv6PrefixLengths];
  if (v38 || ([v8 ipv6PrefixLengths], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [(WFNetworkSettingsConfig *)self ipv6PrefixLengths];
    v39 = [v8 ipv6PrefixLengths];
    uint64_t v5 = [(id)v6 isEqualToArray:v39];

    if (v38)
    {

      if (v5) {
        goto LABEL_77;
      }
    }
    else
    {

      if (v5) {
        goto LABEL_77;
      }
    }
    int v40 = [v8 ipv6PrefixLengths];
    if (v40) {
      [v8 ipv6PrefixLengths];
    }
    else {
    uint64_t v4 = [MEMORY[0x263EFF8C0] array];
    }
    [v32 setObject:v4 forKey:@"ipv6PrefixLengths"];
  }
LABEL_77:
  v41 = [(WFNetworkSettingsConfig *)self ipv6AddressManual];
  if (v41 || ([v8 ipv6AddressManual], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [(WFNetworkSettingsConfig *)self ipv6AddressManual];
    v42 = [v8 ipv6AddressManual];
    uint64_t v5 = [(id)v6 isEqualToString:v42];

    if (v41)
    {

      if (v5) {
        goto LABEL_87;
      }
    }
    else
    {

      if (v5) {
        goto LABEL_87;
      }
    }
    v43 = [v8 ipv6AddressManual];
    if (v43)
    {
      uint64_t v4 = [v8 ipv6AddressManual];
      [v32 setObject:v4 forKey:@"ipv6AddressManual"];
    }
    else
    {
      [v32 setObject:&stru_26D8F6070 forKey:@"ipv6AddressManual"];
    }
  }
LABEL_87:
  int v44 = [(WFNetworkSettingsConfig *)self ipv6RouterAddress];
  if (v44 || ([v8 ipv6RouterAddress], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [(WFNetworkSettingsConfig *)self ipv6RouterAddress];
    v45 = [v8 ipv6RouterAddress];
    uint64_t v5 = [(id)v6 isEqualToString:v45];

    if (v44)
    {

      if (v5) {
        goto LABEL_97;
      }
    }
    else
    {

      if (v5) {
        goto LABEL_97;
      }
    }
    v46 = [v8 ipv6RouterAddress];
    if (v46)
    {
      uint64_t v4 = [v8 ipv6RouterAddress];
      [v32 setObject:v4 forKey:@"ipv6RouterAddress"];
    }
    else
    {
      [v32 setObject:&stru_26D8F6070 forKey:@"ipv6RouterAddress"];
    }
  }
LABEL_97:
  v47 = [(WFNetworkSettingsConfig *)self ipv6RouterAddressManual];
  if (v47 || ([v8 ipv6RouterAddressManual], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [(WFNetworkSettingsConfig *)self ipv6RouterAddressManual];
    int v48 = [v8 ipv6RouterAddressManual];
    uint64_t v5 = [(id)v6 isEqualToString:v48];

    if (v47)
    {

      if (v5) {
        goto LABEL_107;
      }
    }
    else
    {

      if (v5) {
        goto LABEL_107;
      }
    }
    v49 = [v8 ipv6RouterAddressManual];
    if (v49)
    {
      uint64_t v4 = [v8 ipv6RouterAddressManual];
      [v32 setObject:v4 forKey:@"ipv6RouterAddressManual"];
    }
    else
    {
      [v32 setObject:&stru_26D8F6070 forKey:@"ipv6RouterAddressManual"];
    }
  }
LABEL_107:
  v50 = [(WFNetworkSettingsConfig *)self ipv6PrefixLengthManual];
  if (v50 || ([v8 ipv6PrefixLengthManual], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [(WFNetworkSettingsConfig *)self ipv6PrefixLengthManual];
    v51 = [v8 ipv6PrefixLengthManual];
    uint64_t v5 = [(id)v6 isEqualToString:v51];

    if (v50)
    {

      if (v5) {
        goto LABEL_117;
      }
    }
    else
    {

      if (v5) {
        goto LABEL_117;
      }
    }
    int v52 = [v8 ipv6PrefixLengthManual];
    if (v52)
    {
      v53 = [v8 ipv6PrefixLengthManual];
      [v32 setObject:v53 forKey:@"ipv6PrefixLengthManual"];
    }
    else
    {
      [v32 setObject:&stru_26D8F6070 forKey:@"ipv6PrefixLengthManual"];
    }
  }
LABEL_117:
  if ([v32 count]) {
    [v104 setObject:v32 forKey:@"WFIPv6Changes"];
  }
  v54 = [MEMORY[0x263EFF9A0] dictionary];
  int64_t v55 = [(WFNetworkSettingsConfig *)self dnsConfig];
  if (v55 != [v8 dnsConfig])
  {
    int v56 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "dnsConfig"));
    [v54 setObject:v56 forKey:@"dnsConfig"];
  }
  v57 = [(WFNetworkSettingsConfig *)self dnsServerAddresses];
  if (v57 || ([v8 dnsServerAddresses], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v58 = [(WFNetworkSettingsConfig *)self dnsServerAddresses];
    v59 = [v8 dnsServerAddresses];
    uint64_t v6 = [v58 isEqualToArray:v59];

    if (v57)
    {

      if (v6) {
        goto LABEL_131;
      }
    }
    else
    {

      if (v6) {
        goto LABEL_131;
      }
    }
    int v60 = [v8 dnsServerAddresses];
    if (v60) {
      [v8 dnsServerAddresses];
    }
    else {
    uint64_t v5 = [MEMORY[0x263EFF8C0] array];
    }
    [v54 setObject:v5 forKey:@"dnsServerAddresses"];
  }
LABEL_131:
  v61 = [(WFNetworkSettingsConfig *)self dnsSearchDomains];
  if (v61 || ([v8 dnsSearchDomains], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v62 = [(WFNetworkSettingsConfig *)self dnsSearchDomains];
    v63 = [v8 dnsSearchDomains];
    uint64_t v6 = [v62 isEqualToArray:v63];

    if (v61)
    {

      if (v6) {
        goto LABEL_141;
      }
    }
    else
    {

      if (v6) {
        goto LABEL_141;
      }
    }
    int v64 = [v8 dnsSearchDomains];
    if (v64) {
      [v8 dnsSearchDomains];
    }
    else {
    v65 = [MEMORY[0x263EFF8C0] array];
    }
    [v54 setObject:v65 forKey:@"dnsSearchDomains"];
  }
LABEL_141:
  if ([v54 count]) {
    [v104 setObject:v54 forKey:@"WFDNSChangesKey"];
  }
  v66 = [MEMORY[0x263EFF9A0] dictionary];
  int64_t v67 = [(WFNetworkSettingsConfig *)self httpProxyConfig];
  if (v67 != [v8 httpProxyConfig])
  {
    int v68 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "httpProxyConfig"));
    [v66 setObject:v68 forKey:@"httpProxyConfig"];
  }
  int64_t v69 = [(WFNetworkSettingsConfig *)self httpProxyServerAddress];
  if (v69 || ([v8 httpProxyServerAddress], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v70 = [(WFNetworkSettingsConfig *)self httpProxyServerAddress];
    v71 = [v8 httpProxyServerAddress];
    char v72 = [v70 isEqualToString:v71];

    if (v69)
    {

      if (v72) {
        goto LABEL_155;
      }
    }
    else
    {

      if (v72) {
        goto LABEL_155;
      }
    }
    int v73 = [v8 httpProxyServerAddress];
    if (v73)
    {
      v74 = [v8 httpProxyServerAddress];
      [v66 setObject:v74 forKey:@"httpProxyServerAddress"];
    }
    else
    {
      [v66 setObject:&stru_26D8F6070 forKey:@"httpProxyServerAddress"];
    }
  }
LABEL_155:
  v75 = [(WFNetworkSettingsConfig *)self httpProxyServerPort];
  if (v75 || ([v8 httpProxyServerPort], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v76 = [(WFNetworkSettingsConfig *)self httpProxyServerPort];
    int v77 = [v8 httpProxyServerPort];
    char v78 = [v76 isEqualToString:v77];

    if (v75)
    {

      if (v78) {
        goto LABEL_165;
      }
    }
    else
    {

      if (v78) {
        goto LABEL_165;
      }
    }
    v79 = [v8 httpProxyServerPort];
    if (v79)
    {
      v80 = [v8 httpProxyServerPort];
      [v66 setObject:v80 forKey:@"httpProxyServerPort"];
    }
    else
    {
      [v66 setObject:&stru_26D8F6070 forKey:@"httpProxyServerPort"];
    }
  }
LABEL_165:
  int v81 = [(WFNetworkSettingsConfig *)self httpProxyAuthenticationRequired];
  if (v81 != [v8 httpProxyAuthenticationRequired])
  {
    v82 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "httpProxyAuthenticationRequired"));
    [v66 setObject:v82 forKey:@"httpProxyAuthenticationRequired"];
  }
  v83 = [(WFNetworkSettingsConfig *)self httpProxyUsername];
  if (v83 || ([v8 httpProxyUsername], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v84 = [(WFNetworkSettingsConfig *)self httpProxyUsername];
    int v85 = [v8 httpProxyUsername];
    char v86 = [v84 isEqualToString:v85];

    if (v83)
    {

      if (v86) {
        goto LABEL_177;
      }
    }
    else
    {

      if (v86) {
        goto LABEL_177;
      }
    }
    v87 = [v8 httpProxyUsername];
    if (v87)
    {
      v88 = [v8 httpProxyUsername];
      [v66 setObject:v88 forKey:@"httpProxyUsername"];
    }
    else
    {
      [v66 setObject:&stru_26D8F6070 forKey:@"httpProxyUsername"];
    }
  }
LABEL_177:
  int v89 = [(WFNetworkSettingsConfig *)self httpProxyPassword];
  if (v89 || ([v8 httpProxyPassword], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v90 = [(WFNetworkSettingsConfig *)self httpProxyPassword];
    v91 = [v8 httpProxyPassword];
    char v92 = [v90 isEqualToString:v91];

    if (v89)
    {

      if (v92) {
        goto LABEL_187;
      }
    }
    else
    {

      if (v92) {
        goto LABEL_187;
      }
    }
    int v93 = [v8 httpProxyPassword];
    if (v93)
    {
      int64_t v94 = [v8 httpProxyPassword];
      [v66 setObject:v94 forKey:@"httpProxyPassword"];
    }
    else
    {
      [v66 setObject:&stru_26D8F6070 forKey:@"httpProxyPassword"];
    }
  }
LABEL_187:
  v95 = [(WFNetworkSettingsConfig *)self httpProxyConfigPAC];
  if (v95 || ([v8 httpProxyConfigPAC], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v96 = [(WFNetworkSettingsConfig *)self httpProxyConfigPAC];
    v97 = [v8 httpProxyConfigPAC];
    char v98 = [v96 isEqualToString:v97];

    if (v95)
    {

      if (v98) {
        goto LABEL_197;
      }
    }
    else
    {

      if (v98) {
        goto LABEL_197;
      }
    }
    v99 = [v8 httpProxyConfigPAC];
    if (v99)
    {
      v100 = [v8 httpProxyConfigPAC];
      [v66 setObject:v100 forKey:@"httpProxyConfigPAC"];
    }
    else
    {
      [v66 setObject:&stru_26D8F6070 forKey:@"httpProxyConfigPAC"];
    }
  }
LABEL_197:
  v101 = v104;
  if ([v66 count]) {
    [v104 setObject:v66 forKey:@"WFProxyChangesKey"];
  }
  if (![v104 count])
  {

    v101 = 0;
  }
  id v102 = v101;

  return v102;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (NSString)displayFriendlyName
{
  return self->_displayFriendlyName;
}

- (void)setDisplayFriendlyName:(id)a3
{
}

- (BOOL)current
{
  return self->_current;
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (BOOL)forgetable
{
  return self->_forgetable;
}

- (void)setForgetable:(BOOL)a3
{
  self->_forgetable = a3;
}

- (BOOL)joinable
{
  return self->_joinable;
}

- (void)setJoinable:(BOOL)a3
{
  self->_joinable = a3;
}

- (BOOL)manageable
{
  return self->_manageable;
}

- (void)setManageable:(BOOL)a3
{
  self->_manageable = a3;
}

- (BOOL)cloudSyncable
{
  return self->_cloudSyncable;
}

- (void)setCloudSyncable:(BOOL)a3
{
  self->_cloudSyncable = a3;
}

- (BOOL)canRenewLease
{
  return self->_canRenewLease;
}

- (void)setCanRenewLease:(BOOL)a3
{
  self->_canRenewLease = a3;
}

- (BOOL)diagnosable
{
  return self->_diagnosable;
}

- (void)setDiagnosable:(BOOL)a3
{
  self->_diagnosable = a3;
}

- (BOOL)autoJoinConfigurable
{
  return self->_autoJoinConfigurable;
}

- (void)setAutoJoinConfigurable:(BOOL)a3
{
  self->_autoJoinConfigurable = a3;
}

- (BOOL)autoJoinEnabled
{
  return self->_autoJoinEnabled;
}

- (void)setAutoJoinEnabled:(BOOL)a3
{
  self->_autoJoinEnabled = a3;
}

- (BOOL)autoLoginConfigurable
{
  return self->_autoLoginConfigurable;
}

- (void)setAutoLoginConfigurable:(BOOL)a3
{
  self->_autoLoginConfigurable = a3;
}

- (BOOL)autoLoginEnabled
{
  return self->_autoLoginEnabled;
}

- (void)setAutoLoginEnabled:(BOOL)a3
{
  self->_autoLoginEnabled = a3;
}

- (BOOL)saveDataModeConfigurable
{
  return self->_saveDataModeConfigurable;
}

- (void)setSaveDataModeConfigurable:(BOOL)a3
{
  self->_saveDataModeConfigurable = a3;
}

- (BOOL)privacyProxyConfigurable
{
  return self->_privacyProxyConfigurable;
}

- (void)setPrivacyProxyConfigurable:(BOOL)a3
{
  self->_privacyProxyConfigurable = a3;
}

- (int64_t)privacyProxyTierStatus
{
  return self->_privacyProxyTierStatus;
}

- (void)setPrivacyProxyTierStatus:(int64_t)a3
{
  self->_privacyProxyTierStatus = a3;
}

- (BOOL)isInSaveDataMode
{
  return self->_isInSaveDataMode;
}

- (void)setIsInSaveDataMode:(BOOL)a3
{
  self->_isInSaveDataMode = a3;
}

- (BOOL)privacyProxyEnabled
{
  return self->_privacyProxyEnabled;
}

- (void)setPrivacyProxyEnabled:(BOOL)a3
{
  self->_privacyProxyEnabled = a3;
}

- (BOOL)wifiOutrankEnabled
{
  return self->_wifiOutrankEnabled;
}

- (void)setWifiOutrankEnabled:(BOOL)a3
{
  self->_wifiOutrankEnabled = a3;
}

- (BOOL)networkQualityVisible
{
  return self->_networkQualityVisible;
}

- (void)setNetworkQualityVisible:(BOOL)a3
{
  self->_networkQualityVisible = a3;
}

- (double)networkQualityResponsiveness
{
  return self->_networkQualityResponsiveness;
}

- (void)setNetworkQualityResponsiveness:(double)a3
{
  self->_networkQualityResponsiveness = a3;
}

- (NSDate)networkQualityDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNetworkQualityDate:(id)a3
{
}

- (NSArray)healthRecommendations
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHealthRecommendations:(id)a3
{
}

- (int64_t)ipv4Config
{
  return self->_ipv4Config;
}

- (void)setIpv4Config:(int64_t)a3
{
  self->_ipv4Config = a3;
}

- (NSString)ipv4Address
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIpv4Address:(id)a3
{
}

- (NSString)ipv4AddressManual
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIpv4AddressManual:(id)a3
{
}

- (NSString)ipv4SubnetMask
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIpv4SubnetMask:(id)a3
{
}

- (NSString)ipv4SubnetMaskManual
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIpv4SubnetMaskManual:(id)a3
{
}

- (NSString)ipv4RouterAddress
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIpv4RouterAddress:(id)a3
{
}

- (NSString)ipv4RouterAddressManual
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIpv4RouterAddressManual:(id)a3
{
}

- (NSString)dhcpClientID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDhcpClientID:(id)a3
{
}

- (NSDate)dhcpLeaseExpirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDhcpLeaseExpirationDate:(id)a3
{
}

- (int64_t)ipv6Config
{
  return self->_ipv6Config;
}

- (void)setIpv6Config:(int64_t)a3
{
  self->_ipv6Config = a3;
}

- (NSArray)ipv6Addresses
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setIpv6Addresses:(id)a3
{
}

- (NSArray)ipv6PrefixLengths
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setIpv6PrefixLengths:(id)a3
{
}

- (NSString)ipv6AddressManual
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIpv6AddressManual:(id)a3
{
}

- (NSString)ipv6RouterAddress
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setIpv6RouterAddress:(id)a3
{
}

- (NSString)ipv6RouterAddressManual
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setIpv6RouterAddressManual:(id)a3
{
}

- (NSString)ipv6PrefixLengthManual
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setIpv6PrefixLengthManual:(id)a3
{
}

- (int64_t)dnsConfig
{
  return self->_dnsConfig;
}

- (void)setDnsConfig:(int64_t)a3
{
  self->_dnsConfig = a3;
}

- (NSArray)dnsServerAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDnsServerAddresses:(id)a3
{
}

- (NSArray)dnsSearchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setDnsSearchDomains:(id)a3
{
}

- (BOOL)httpProxyConfigurable
{
  return self->_httpProxyConfigurable;
}

- (void)setHttpProxyConfigurable:(BOOL)a3
{
  self->_httpProxyConfigurable = a3;
}

- (int64_t)httpProxyConfig
{
  return self->_httpProxyConfig;
}

- (void)setHttpProxyConfig:(int64_t)a3
{
  self->_httpProxyConfig = a3;
}

- (NSString)httpProxyServerAddress
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setHttpProxyServerAddress:(id)a3
{
}

- (NSString)httpProxyServerPort
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setHttpProxyServerPort:(id)a3
{
}

- (BOOL)httpProxyAuthenticationRequired
{
  return self->_httpProxyAuthenticationRequired;
}

- (void)setHttpProxyAuthenticationRequired:(BOOL)a3
{
  self->_httpProxyAuthenticationRequired = a3;
}

- (NSString)httpProxyUsername
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setHttpProxyUsername:(id)a3
{
}

- (NSString)httpProxyPassword
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setHttpProxyPassword:(id)a3
{
}

- (NSString)httpProxyConfigPAC
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setHttpProxyConfigPAC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpProxyConfigPAC, 0);
  objc_storeStrong((id *)&self->_httpProxyPassword, 0);
  objc_storeStrong((id *)&self->_httpProxyUsername, 0);
  objc_storeStrong((id *)&self->_httpProxyServerPort, 0);
  objc_storeStrong((id *)&self->_httpProxyServerAddress, 0);
  objc_storeStrong((id *)&self->_dnsSearchDomains, 0);
  objc_storeStrong((id *)&self->_dnsServerAddresses, 0);
  objc_storeStrong((id *)&self->_ipv6PrefixLengthManual, 0);
  objc_storeStrong((id *)&self->_ipv6RouterAddressManual, 0);
  objc_storeStrong((id *)&self->_ipv6RouterAddress, 0);
  objc_storeStrong((id *)&self->_ipv6AddressManual, 0);
  objc_storeStrong((id *)&self->_ipv6PrefixLengths, 0);
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
  objc_storeStrong((id *)&self->_dhcpLeaseExpirationDate, 0);
  objc_storeStrong((id *)&self->_dhcpClientID, 0);
  objc_storeStrong((id *)&self->_ipv4RouterAddressManual, 0);
  objc_storeStrong((id *)&self->_ipv4RouterAddress, 0);
  objc_storeStrong((id *)&self->_ipv4SubnetMaskManual, 0);
  objc_storeStrong((id *)&self->_ipv4SubnetMask, 0);
  objc_storeStrong((id *)&self->_ipv4AddressManual, 0);
  objc_storeStrong((id *)&self->_ipv4Address, 0);
  objc_storeStrong((id *)&self->_healthRecommendations, 0);
  objc_storeStrong((id *)&self->_networkQualityDate, 0);
  objc_storeStrong((id *)&self->_displayFriendlyName, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end