@interface SUDownloadMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)enforceWifiOnlyOverride;
- (BOOL)isAutoDownload;
- (BOOL)isDownloadOnly;
- (BOOL)isEnabledFor2G;
- (BOOL)isEnabledFor3G;
- (BOOL)isEnabledFor4G;
- (BOOL)isEnabledForCellularRoaming;
- (BOOL)isEnabledForNetworkType:(int)a3;
- (BOOL)isEnabledForWifi;
- (BOOL)isEnabledOnBatteryPower;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesDownloadPolicy:(id)a3;
- (SUDownloadMetadata)init;
- (SUDownloadMetadata)initWithCoder:(id)a3;
- (id)_stringForBool:(BOOL)a3;
- (id)activeDownloadPolicy:(id)a3;
- (id)availableDownloadPolicyIfDifferentFromActive:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)activeDownloadPolicyType;
- (int)downloadFeeAgreementStatus;
- (int)termsAndConditionsAgreementStatus;
- (unint64_t)hash;
- (void)applyDownloadPolicy:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveDownloadPolicyType:(int)a3;
- (void)setAutoDownload:(BOOL)a3;
- (void)setDownloadFeeAgreementStatus:(int)a3;
- (void)setDownloadOnly:(BOOL)a3;
- (void)setEnabledFor2G:(BOOL)a3;
- (void)setEnabledFor3G:(BOOL)a3;
- (void)setEnabledFor4G:(BOOL)a3;
- (void)setEnabledForCellularRoaming:(BOOL)a3;
- (void)setEnabledForWifi:(BOOL)a3;
- (void)setEnabledOnBatteryPower:(BOOL)a3;
- (void)setEnforceWifiOnlyOverride:(BOOL)a3;
- (void)setTermsAndConditionsAgreementStatus:(int)a3;
@end

@implementation SUDownloadMetadata

- (SUDownloadMetadata)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUDownloadMetadata;
  v2 = [(SUDownloadMetadata *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SUDownloadMetadata *)v2 setActiveDownloadPolicyType:3];
    v3->_enforceWifiOnlyOverride = 0;
    v3->_enabledForCellularRoaming = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUDownloadMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SUDownloadMetadata *)self init];
  if (v5)
  {
    -[SUDownloadMetadata setAutoDownload:](v5, "setAutoDownload:", [v4 decodeBoolForKey:@"isAutoDownload"]);
    -[SUDownloadMetadata setDownloadOnly:](v5, "setDownloadOnly:", [v4 decodeBoolForKey:@"isDownloadOnly"]);
    -[SUDownloadMetadata setActiveDownloadPolicyType:](v5, "setActiveDownloadPolicyType:", [v4 decodeIntForKey:@"activeDownloadPolicy"]);
    -[SUDownloadMetadata setEnabledFor2G:](v5, "setEnabledFor2G:", [v4 decodeBoolForKey:@"enabledFor2G"]);
    -[SUDownloadMetadata setEnabledFor3G:](v5, "setEnabledFor3G:", [v4 decodeBoolForKey:@"enabledFor3G"]);
    -[SUDownloadMetadata setEnabledFor4G:](v5, "setEnabledFor4G:", [v4 decodeBoolForKey:@"enabledFor4G"]);
    -[SUDownloadMetadata setEnabledForWifi:](v5, "setEnabledForWifi:", [v4 decodeBoolForKey:@"enabledForWifi"]);
    -[SUDownloadMetadata setEnabledOnBatteryPower:](v5, "setEnabledOnBatteryPower:", [v4 decodeBoolForKey:@"enabledOnBatteryPower"]);
    -[SUDownloadMetadata setEnforceWifiOnlyOverride:](v5, "setEnforceWifiOnlyOverride:", [v4 decodeBoolForKey:@"enforceWifiOnlyOverride"]);
    -[SUDownloadMetadata setDownloadFeeAgreementStatus:](v5, "setDownloadFeeAgreementStatus:", [v4 decodeIntForKey:@"downloadFeeAgreementStatus"]);
    -[SUDownloadMetadata setTermsAndConditionsAgreementStatus:](v5, "setTermsAndConditionsAgreementStatus:", [v4 decodeIntForKey:@"termsAndConditionsAgreementStatus"]);
    -[SUDownloadMetadata setEnabledForCellularRoaming:](v5, "setEnabledForCellularRoaming:", [v4 decodeBoolForKey:@"enabledForCellularRoaming"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL autoDownload = self->_autoDownload;
  id v5 = a3;
  [v5 encodeBool:autoDownload forKey:@"isAutoDownload"];
  [v5 encodeBool:self->_downloadOnly forKey:@"isDownloadOnly"];
  [v5 encodeInt:self->_activeDownloadPolicyType forKey:@"activeDownloadPolicy"];
  [v5 encodeBool:self->_enabledFor2G forKey:@"enabledFor2G"];
  [v5 encodeBool:self->_enabledFor3G forKey:@"enabledFor3G"];
  [v5 encodeBool:self->_enabledFor4G forKey:@"enabledFor4G"];
  [v5 encodeBool:self->_enabledForWifi forKey:@"enabledForWifi"];
  [v5 encodeBool:self->_enabledOnBatteryPower forKey:@"enabledOnBatteryPower"];
  [v5 encodeBool:self->_enforceWifiOnlyOverride forKey:@"enforceWifiOnlyOverride"];
  [v5 encodeInt:self->_downloadFeeAgreementStatus forKey:@"downloadFeeAgreementStatus"];
  [v5 encodeInt:self->_termsAndConditionsAgreementStatus forKey:@"termsAndConditionsAgreementStatus"];
  [v5 encodeBool:self->_enabledForCellularRoaming forKey:@"enabledForCellularRoaming"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setAutoDownload:self->_autoDownload];
  [v4 setDownloadOnly:self->_downloadOnly];
  [v4 setActiveDownloadPolicyType:self->_activeDownloadPolicyType];
  [v4 setEnabledFor2G:self->_enabledFor2G];
  [v4 setEnabledFor3G:self->_enabledFor3G];
  [v4 setEnabledFor4G:self->_enabledFor4G];
  [v4 setEnabledForWifi:self->_enabledForWifi];
  [v4 setEnabledOnBatteryPower:self->_enabledOnBatteryPower];
  [v4 setEnforceWifiOnlyOverride:self->_enforceWifiOnlyOverride];
  [v4 setDownloadFeeAgreementStatus:self->_downloadFeeAgreementStatus];
  [v4 setTermsAndConditionsAgreementStatus:self->_termsAndConditionsAgreementStatus];
  [v4 setEnabledForCellularRoaming:self->_enabledForCellularRoaming];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setAutoDownload:self->_autoDownload];
  [v4 setDownloadOnly:self->_downloadOnly];
  [v4 setActiveDownloadPolicyType:self->_activeDownloadPolicyType];
  [v4 setEnabledFor2G:self->_enabledFor2G];
  [v4 setEnabledFor3G:self->_enabledFor3G];
  [v4 setEnabledFor4G:self->_enabledFor4G];
  [v4 setEnabledForWifi:self->_enabledForWifi];
  [v4 setEnabledOnBatteryPower:self->_enabledOnBatteryPower];
  [v4 setEnforceWifiOnlyOverride:self->_enforceWifiOnlyOverride];
  [v4 setDownloadFeeAgreementStatus:self->_downloadFeeAgreementStatus];
  [v4 setTermsAndConditionsAgreementStatus:self->_termsAndConditionsAgreementStatus];
  [v4 setEnabledForCellularRoaming:self->_enabledForCellularRoaming];
  return v4;
}

- (void)applyDownloadPolicy:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = ([v4 isDownloadFreeForCellular] & 1) != 0
      || [(SUDownloadMetadata *)self downloadFeeAgreementStatus] == 1;
    BOOL v6 = [(SUDownloadMetadata *)self enforceWifiOnlyOverride];
    [(SUDownloadMetadata *)self setActiveDownloadPolicyType:+[SUDownloadPolicyFactory downloadPolicyTypeForClass:v9]];
    -[SUDownloadMetadata setEnabledOnBatteryPower:](self, "setEnabledOnBatteryPower:", [v9 isPowerRequired] ^ 1);
    if (v6 || !v5)
    {
      [(SUDownloadMetadata *)self setEnabledFor2G:0];
      [(SUDownloadMetadata *)self setEnabledFor3G:0];
      uint64_t v7 = 0;
    }
    else
    {
      -[SUDownloadMetadata setEnabledFor2G:](self, "setEnabledFor2G:", [v9 isDownloadAllowableForCellular2G]);
      -[SUDownloadMetadata setEnabledFor3G:](self, "setEnabledFor3G:", [v9 isDownloadAllowableForCellular]);
      uint64_t v7 = [v9 isDownloadAllowableForCellular];
    }
    [(SUDownloadMetadata *)self setEnabledFor4G:v7];
    if ([(SUDownloadMetadata *)self isEnabledFor2G]
      || [(SUDownloadMetadata *)self isEnabledFor3G]
      || [(SUDownloadMetadata *)self isEnabledFor4G])
    {
      uint64_t v8 = [v9 isDownloadAllowableForCellularRoaming];
    }
    else
    {
      uint64_t v8 = 0;
    }
    [(SUDownloadMetadata *)self setEnabledForCellularRoaming:v8];
    -[SUDownloadMetadata setEnabledForWifi:](self, "setEnabledForWifi:", [v9 isDownloadAllowableForWiFi]);
    id v4 = v9;
  }
}

- (id)activeDownloadPolicy:(id)a3
{
  if (a3)
  {
    id v4 = +[SUDownloadPolicyFactory downloadPolicyForType:self->_activeDownloadPolicyType forDescriptor:a3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)availableDownloadPolicyIfDifferentFromActive:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUDownloadMetadata *)self activeDownloadPolicy:v4];
  BOOL v6 = +[SUDownloadPolicyFactory userDownloadPolicyForDescriptor:v4 existingPolicy:v5];

  if (v6 && ([v5 isSamePolicy:v6] & 1) == 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)matchesDownloadPolicy:(id)a3
{
  id v4 = a3;
  if (self->_activeDownloadPolicyType == +[SUDownloadPolicyFactory downloadPolicyTypeForClass:](SUDownloadPolicyFactory, "downloadPolicyTypeForClass:", v4)&& (int v5 = [v4 isPowerRequired], v5 != -[SUDownloadMetadata isEnabledOnBatteryPower](self, "isEnabledOnBatteryPower"))&& (v6 = objc_msgSend(v4, "isDownloadAllowableForWiFi"), v6 == -[SUDownloadMetadata isEnabledForWifi](self, "isEnabledForWifi"))&& (v7 = objc_msgSend(v4, "isDownloadAllowableForCellular2G"), v7 == -[SUDownloadMetadata isEnabledFor2G](self, "isEnabledFor2G"))&& (v8 = objc_msgSend(v4, "isDownloadAllowableForCellular"), v8 == -[SUDownloadMetadata isEnabledFor3G](self, "isEnabledFor3G"))&& (v9 = objc_msgSend(v4, "isDownloadAllowableForCellular"), v9 == -[SUDownloadMetadata isEnabledFor4G](self, "isEnabledFor4G")))
  {
    int v12 = [v4 isDownloadAllowableForCellularRoaming];
    int v10 = v12 ^ [(SUDownloadMetadata *)self isEnabledForCellularRoaming] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)isEnabledForNetworkType:(int)a3
{
  switch(a3)
  {
    case 0:
      BOOL result = 0;
      break;
    case 1:
      BOOL result = [(SUDownloadMetadata *)self isEnabledForWifi];
      break;
    case 2:
      BOOL result = [(SUDownloadMetadata *)self isEnabledFor2G];
      break;
    case 3:
      BOOL result = [(SUDownloadMetadata *)self isEnabledFor3G];
      break;
    default:
      BOOL result = [(SUDownloadMetadata *)self isEnabledFor4G];
      break;
  }
  return result;
}

- (id)_stringForBool:(BOOL)a3
{
  if (a3) {
    return @"Yes";
  }
  else {
    return @"No";
  }
}

- (id)description
{
  v14 = NSString;
  v13 = [(SUDownloadMetadata *)self _stringForBool:[(SUDownloadMetadata *)self isAutoDownload]];
  int v12 = [(SUDownloadMetadata *)self _stringForBool:[(SUDownloadMetadata *)self isDownloadOnly]];
  uint64_t v3 = SUStringFromDownloadPolicyType(self->_activeDownloadPolicyType);
  id v4 = [(SUDownloadMetadata *)self _stringForBool:[(SUDownloadMetadata *)self isEnabledFor2G]];
  int v5 = [(SUDownloadMetadata *)self _stringForBool:[(SUDownloadMetadata *)self isEnabledFor3G]];
  int v6 = [(SUDownloadMetadata *)self _stringForBool:[(SUDownloadMetadata *)self isEnabledFor4G]];
  int v7 = [(SUDownloadMetadata *)self _stringForBool:[(SUDownloadMetadata *)self isEnabledForCellularRoaming]];
  int v8 = [(SUDownloadMetadata *)self _stringForBool:[(SUDownloadMetadata *)self isEnabledForWifi]];
  int v9 = [(SUDownloadMetadata *)self _stringForBool:[(SUDownloadMetadata *)self isEnabledOnBatteryPower]];
  int v10 = [(SUDownloadMetadata *)self _stringForBool:[(SUDownloadMetadata *)self enforceWifiOnlyOverride]];
  v15 = [v14 stringWithFormat:@"\n            \tisAutoDownload: %@\n            \tisDownloadOnly: %@\n            \tactiveDownloadPolicyType: %@\n            \tisEnabledFor2G: %@\n            \tisEnabledFor3G: %@\n            \tisEnabledFor4G: %@\n            \tisEnabledForCellularRoaming: %@\n            \tisEnabledForWifi: %@\n            \tisEnabledOnBatteryPower: %@\n            \tenforceWifiOnlyOverride: %@\n            \tDownloadFeeAgreementStatus: %d\n            \tTermsAndConditionsAgreementStatus: %d", v13, v12, v3, v4, v5, v6, v7, v8, v9, v10, -[SUDownloadMetadata downloadFeeAgreementStatus](self, "downloadFeeAgreementStatus"), -[SUDownloadMetadata termsAndConditionsAgreementStatus](self, "termsAndConditionsAgreementStatus")];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUDownloadMetadata *)a3;
  int v5 = v4;
  if (!v4) {
    goto LABEL_16;
  }
  if (self == v4)
  {
    BOOL v19 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = v5;
    BOOL autoDownload = self->_autoDownload;
    if (autoDownload != [(SUDownloadMetadata *)v6 isAutoDownload]) {
      goto LABEL_18;
    }
    BOOL downloadOnly = self->_downloadOnly;
    if (downloadOnly != [(SUDownloadMetadata *)v6 isDownloadOnly]) {
      goto LABEL_18;
    }
    int activeDownloadPolicyType = self->_activeDownloadPolicyType;
    if (activeDownloadPolicyType != [(SUDownloadMetadata *)v6 activeDownloadPolicyType]) {
      goto LABEL_18;
    }
    BOOL enabledFor2G = self->_enabledFor2G;
    if (enabledFor2G != [(SUDownloadMetadata *)v6 isEnabledFor2G]) {
      goto LABEL_18;
    }
    BOOL enabledFor3G = self->_enabledFor3G;
    if (enabledFor3G == [(SUDownloadMetadata *)v6 isEnabledFor3G]
      && (BOOL enabledFor4G = self->_enabledFor4G, enabledFor4G == [(SUDownloadMetadata *)v6 isEnabledFor4G])
      && (BOOL enabledForWifi = self->_enabledForWifi,
          enabledForWifi == [(SUDownloadMetadata *)v6 isEnabledForWifi])
      && (BOOL enabledOnBatteryPower = self->_enabledOnBatteryPower,
          enabledOnBatteryPower == [(SUDownloadMetadata *)v6 isEnabledOnBatteryPower])
      && (BOOL enforceWifiOnlyOverride = self->_enforceWifiOnlyOverride,
          enforceWifiOnlyOverride == [(SUDownloadMetadata *)v6 enforceWifiOnlyOverride])
      && (int downloadFeeAgreementStatus = self->_downloadFeeAgreementStatus,
          downloadFeeAgreementStatus == [(SUDownloadMetadata *)v6 downloadFeeAgreementStatus])&& (int termsAndConditionsAgreementStatus = self->_termsAndConditionsAgreementStatus, termsAndConditionsAgreementStatus == [(SUDownloadMetadata *)v6 termsAndConditionsAgreementStatus]))
    {
      BOOL enabledForCellularRoaming = self->_enabledForCellularRoaming;
      BOOL v19 = enabledForCellularRoaming == [(SUDownloadMetadata *)v6 isEnabledForCellularRoaming];
    }
    else
    {
LABEL_18:
      BOOL v19 = 0;
    }
  }
  else
  {
LABEL_16:
    BOOL v19 = 0;
  }
LABEL_20:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v2 = 3;
  if (!self->_autoDownload) {
    uint64_t v2 = 1;
  }
  if (self->_enabledFor2G) {
    v2 |= 4uLL;
  }
  if (self->_enabledFor3G) {
    v2 |= 8uLL;
  }
  if (self->_enabledForWifi) {
    v2 |= 0x10uLL;
  }
  if (self->_enabledOnBatteryPower) {
    v2 |= 0x20uLL;
  }
  if (self->_enforceWifiOnlyOverride) {
    v2 |= 0x40uLL;
  }
  if (self->_enabledForCellularRoaming) {
    v2 |= 0x80uLL;
  }
  if (self->_enabledFor4G) {
    v2 |= 0x100uLL;
  }
  if (self->_downloadOnly) {
    v2 |= 0x200uLL;
  }
  return self->_termsAndConditionsAgreementStatus
       + 8
       * (self->_downloadFeeAgreementStatus + 8 * (self->_activeDownloadPolicyType + 8 * v2));
}

- (BOOL)isAutoDownload
{
  return self->_autoDownload;
}

- (void)setAutoDownload:(BOOL)a3
{
  self->_BOOL autoDownload = a3;
}

- (BOOL)isDownloadOnly
{
  return self->_downloadOnly;
}

- (void)setDownloadOnly:(BOOL)a3
{
  self->_BOOL downloadOnly = a3;
}

- (int)downloadFeeAgreementStatus
{
  return self->_downloadFeeAgreementStatus;
}

- (void)setDownloadFeeAgreementStatus:(int)a3
{
  self->_int downloadFeeAgreementStatus = a3;
}

- (int)termsAndConditionsAgreementStatus
{
  return self->_termsAndConditionsAgreementStatus;
}

- (void)setTermsAndConditionsAgreementStatus:(int)a3
{
  self->_int termsAndConditionsAgreementStatus = a3;
}

- (int)activeDownloadPolicyType
{
  return self->_activeDownloadPolicyType;
}

- (void)setActiveDownloadPolicyType:(int)a3
{
  self->_int activeDownloadPolicyType = a3;
}

- (BOOL)isEnabledFor2G
{
  return self->_enabledFor2G;
}

- (void)setEnabledFor2G:(BOOL)a3
{
  self->_BOOL enabledFor2G = a3;
}

- (BOOL)isEnabledFor3G
{
  return self->_enabledFor3G;
}

- (void)setEnabledFor3G:(BOOL)a3
{
  self->_BOOL enabledFor3G = a3;
}

- (BOOL)isEnabledFor4G
{
  return self->_enabledFor4G;
}

- (void)setEnabledFor4G:(BOOL)a3
{
  self->_BOOL enabledFor4G = a3;
}

- (BOOL)isEnabledForWifi
{
  return self->_enabledForWifi;
}

- (void)setEnabledForWifi:(BOOL)a3
{
  self->_BOOL enabledForWifi = a3;
}

- (BOOL)isEnabledForCellularRoaming
{
  return self->_enabledForCellularRoaming;
}

- (void)setEnabledForCellularRoaming:(BOOL)a3
{
  self->_BOOL enabledForCellularRoaming = a3;
}

- (BOOL)isEnabledOnBatteryPower
{
  return self->_enabledOnBatteryPower;
}

- (void)setEnabledOnBatteryPower:(BOOL)a3
{
  self->_BOOL enabledOnBatteryPower = a3;
}

- (BOOL)enforceWifiOnlyOverride
{
  return self->_enforceWifiOnlyOverride;
}

- (void)setEnforceWifiOnlyOverride:(BOOL)a3
{
  self->_BOOL enforceWifiOnlyOverride = a3;
}

@end