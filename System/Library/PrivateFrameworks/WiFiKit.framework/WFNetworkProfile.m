@interface WFNetworkProfile
+ (BOOL)networkProfileRepresentSameNetwork:(id)a3 toNetworkProfile:(id)a4;
- (BOOL)TLSProfileCanJoin;
- (BOOL)canAttemptJoin;
- (BOOL)canExposeIMSI;
- (BOOL)fetchedPassword;
- (BOOL)isAdhoc;
- (BOOL)isAutoJoinEnabled;
- (BOOL)isAutoLoginEnabled;
- (BOOL)isCaptive;
- (BOOL)isCarPlay;
- (BOOL)isCarrierBased;
- (BOOL)isDNSHeuristicsFiltered;
- (BOOL)isEnterprise;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNetwork:(id)a3;
- (BOOL)isHS20Network;
- (BOOL)isHS20NetworkProvisioned;
- (BOOL)isHidden;
- (BOOL)isInSaveDataMode;
- (BOOL)isInstantHotspotJoin;
- (BOOL)isManaged;
- (BOOL)isPersonalHotspot;
- (BOOL)isPrivacyProxyEnabled;
- (BOOL)isProfileBased;
- (BOOL)isRandomMACAddressEnabled;
- (BOOL)profileContainsCarrierEAPType:(id)a3;
- (BOOL)profileContainsEAPAKA:(id)a3;
- (BOOL)profileContainsEAPSIM:(id)a3;
- (BOOL)requiresPassword;
- (BOOL)requiresTLSIdentityOnly;
- (BOOL)requiresUsernameAndPassword;
- (BOOL)shouldBeRemovedIfApplicationIsNoLongerInstalled;
- (BOOL)userProvidedPassword;
- (BOOL)wasAddedFromWiFiPasswordSharing;
- (NSArray)certificateChain;
- (NSDate)addedDate;
- (NSDate)lastAutoJoinDate;
- (NSDate)networkQualityDate;
- (NSDictionary)enterpriseProfile;
- (NSDictionary)scanAttributes;
- (NSString)HS20AccountName;
- (NSString)HS20Badge;
- (NSString)HS20OperatorName;
- (NSString)bssid;
- (NSString)carPlayUUID;
- (NSString)hotspotDeviceIdentifier;
- (NSString)originatorBundleIdentifier;
- (NSString)originatorName;
- (NSString)password;
- (NSString)policyUUID;
- (NSString)previousPassword;
- (NSString)randomMACAddress;
- (NSString)ssid;
- (NSString)username;
- (WFNetworkProfile)initWithCoreWiFiProfile:(id)a3;
- (WFNetworkProfile)initWithNetwork:(id)a3;
- (WFNetworkProfile)initWithNetworkRef:(__WiFiNetwork *)a3;
- (__SecIdentity)TLSIdentity;
- (double)networkQualityResponsiveness;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)networkAttributes;
- (int64_t)carPlayType;
- (int64_t)securityMode;
- (int64_t)securityModeExt;
- (unint64_t)hash;
- (unint64_t)originator;
- (void)dealloc;
- (void)setAddedFromWiFiPasswordSharing:(BOOL)a3;
- (void)setAdhoc:(BOOL)a3;
- (void)setAutoJoinEnabled:(BOOL)a3;
- (void)setBssid:(id)a3;
- (void)setCanExposeIMSI:(BOOL)a3;
- (void)setCaptive:(BOOL)a3;
- (void)setCarPlay:(BOOL)a3;
- (void)setCarPlayType:(int64_t)a3;
- (void)setCarPlayUUID:(id)a3;
- (void)setCarrierBased:(BOOL)a3;
- (void)setDNSHeuristicsFiltered:(BOOL)a3;
- (void)setEnterpriseProfile:(id)a3;
- (void)setFetchedPassword:(BOOL)a3;
- (void)setHS20AccountName:(id)a3;
- (void)setHS20Badge:(id)a3;
- (void)setHS20Network:(BOOL)a3;
- (void)setHS20NetworkProvisioned:(BOOL)a3;
- (void)setHS20OperatorName:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHotspotDeviceIdentifier:(id)a3;
- (void)setInstantHotspotJoin:(BOOL)a3;
- (void)setOriginatorBundleIdentifier:(id)a3;
- (void)setOriginatorName:(id)a3;
- (void)setPersonalHotspot:(BOOL)a3;
- (void)setPolicyUUID:(id)a3;
- (void)setProfileBased:(BOOL)a3;
- (void)setRandomMACAddress:(id)a3;
- (void)setRandomMACAddressEnabled:(BOOL)a3;
- (void)setRequiresPassword:(BOOL)a3;
- (void)setScanAttributes:(id)a3;
- (void)setSecurityMode:(int64_t)a3;
- (void)setSecurityModeExt:(int64_t)a3;
- (void)setSsid:(id)a3;
- (void)setTLSIdentity:(__SecIdentity *)a3;
@end

@implementation WFNetworkProfile

- (id)networkAttributes
{
  v2 = self;
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  v4 = [(WFNetworkProfile *)v2 scanAttributes];
  v5 = (void *)[v3 initWithDictionary:v4];

  v6 = [(WFNetworkProfile *)v2 enterpriseProfile];

  if (v6)
  {
    v7 = [(WFNetworkProfile *)v2 enterpriseProfile];
    [v5 setObject:v7 forKey:*MEMORY[0x263F55EA0]];
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[WFNetworkProfile isHidden](v2, "isHidden"));
  [v5 setObject:v8 forKey:@"HIDDEN_NETWORK"];

  BOOL v9 = [(WFNetworkProfile *)v2 isCaptive];
  uint64_t v10 = MEMORY[0x263EFFA88];
  uint64_t v11 = MEMORY[0x263EFFA80];
  if (v9)
  {
    if ([(WFNetworkProfile *)v2 isAutoLoginEnabled]) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v10;
    }
    [v5 setObject:v12 forKey:*MEMORY[0x263F30820]];
  }
  if ([(WFNetworkProfile *)v2 isInSaveDataMode]) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  v14 = [NSNumber numberWithInt:v13];
  [v5 setObject:v14 forKey:*MEMORY[0x263F55ED8]];

  if ([(WFNetworkProfile *)v2 isPrivacyProxyEnabled]) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = v11;
  }
  [v5 setObject:v15 forKey:*MEMORY[0x263F55ED0]];
  v16 = [(WFNetworkProfile *)v2 networkQualityDate];

  if (v16)
  {
    v17 = [(WFNetworkProfile *)v2 networkQualityDate];
    [v5 setObject:v17 forKey:*MEMORY[0x263F55EB0]];

    v18 = NSNumber;
    [(WFNetworkProfile *)v2 networkQualityResponsiveness];
    v19 = objc_msgSend(v18, "numberWithDouble:");
    [v5 setObject:v19 forKey:*MEMORY[0x263F55EB8]];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [(WFNetworkProfile *)v2 lastAssociationDate];
    if (v20) {
      [v5 setObject:v20 forKey:@"lastJoined"];
    }
  }
  v21 = [(WFNetworkProfile *)v2 originatorBundleIdentifier];

  if (v21)
  {
    v22 = [(WFNetworkProfile *)v2 originatorBundleIdentifier];
    [v5 setObject:v22 forKey:*MEMORY[0x263F55E90]];
  }
  v23 = [(WFNetworkProfile *)v2 hotspotDeviceIdentifier];

  if (v23)
  {
    v24 = [(WFNetworkProfile *)v2 hotspotDeviceIdentifier];
    [v5 setObject:v24 forKey:@"HotspotDeviceIdentifier"];
  }
  [v5 removeObjectForKey:@"enabled"];
  [v5 removeObjectForKey:*MEMORY[0x263F55E98]];
  v25 = objc_opt_new();
  id v26 = [(WFNetworkProfile *)v2 randomMACAddress];
  v27 = (const char *)[v26 UTF8String];

  if (v27)
  {
    v28 = ether_aton(v27);
    CFDataRef v29 = CFDataCreate(0, v28->octet, 6);
    [v25 setObject:v29 forKey:@"PRIVATE_MAC_ADDRESS_VALUE"];
  }
  if ([(WFNetworkProfile *)v2 isRandomMACAddressEnabled]) {
    uint64_t v30 = 2;
  }
  else {
    uint64_t v30 = 1;
  }
  v31 = [NSNumber numberWithInt:v30];
  [v25 setObject:v31 forKey:@"PRIVATE_MAC_ADDRESS_TYPE"];

  [v5 setObject:v25 forKey:@"PRIVATE_MAC_ADDRESS"];
  return v5;
}

- (WFNetworkProfile)initWithNetworkRef:(__WiFiNetwork *)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  v84.receiver = self;
  v84.super_class = (Class)WFNetworkProfile;
  v4 = [(WFNetworkProfile *)&v84 init];
  if (!v4)
  {
    v7 = 0;
    goto LABEL_77;
  }
  if (!a3)
  {
    v81 = WFLogForCategory(0);
    uint64_t v82 = OSLogForWFLogLevel(1uLL);
    v7 = 0;
    if (WFCurrentLogLevel() && v81)
    {
      if (os_log_type_enabled(v81, (os_log_type_t)v82))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v81, (os_log_type_t)v82, "nil networkRef for network profile", buf, 2u);
      }
      v7 = 0;
    }
LABEL_76:

    goto LABEL_77;
  }
  v5 = NSDictionary;
  v6 = (void *)WiFiNetworkCopyRecord();
  v7 = [v5 dictionaryWithDictionary:v6];

  if (!v7)
  {
LABEL_77:
    v8 = 0;
    goto LABEL_78;
  }
  v8 = [v7 objectForKey:@"SSID_STR"];
  uint64_t v9 = [v7 objectForKey:@"HotspotDeviceIdentifier"];
  hotspotDeviceIdentifier = v4->_hotspotDeviceIdentifier;
  v4->_hotspotDeviceIdentifier = (NSString *)v9;

  if (!v8 || ![v8 length])
  {
    uint64_t v11 = [v7 objectForKey:@"SSID"];
    if (!v11)
    {
LABEL_78:

      v19 = 0;
      v34 = 0;
      v67 = 0;
      v4 = 0;
      goto LABEL_62;
    }
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [[NSString alloc] initWithData:v11 encoding:4];

    v8 = (void *)v13;
    if (v13) {
      goto LABEL_8;
    }
    v81 = WFLogForCategory(0);
    os_log_type_t v83 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v81 && os_log_type_enabled(v81, v83))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v81, v83, "Missing ssid for network profile", buf, 2u);
    }
    goto LABEL_76;
  }
LABEL_8:
  objc_storeStrong((id *)&v4->_ssid, v8);
  uint64_t v14 = WiFiNetworkGetProperty();
  bssid = v4->_bssid;
  v4->_bssid = (NSString *)v14;

  v4->_securityMode = WFSecurityModeFromScanDictionary(v7, &v4->_securityModeExt);
  uint64_t v16 = WiFiNetworkGetProperty();
  enterpriseProfile = v4->_enterpriseProfile;
  v4->_enterpriseProfile = (NSDictionary *)v16;

  v18 = [(NSDictionary *)v4->_enterpriseProfile objectForKey:@"EAPClientConfiguration"];
  v19 = v18;
  if (v18)
  {
    v20 = [v18 objectForKey:@"TLSUserTrustProceedCertificateChain"];

    if (v20)
    {
      uint64_t v21 = [v19 objectForKey:@"TLSUserTrustProceedCertificateChain"];
      certificateChain = v4->_certificateChain;
      v4->_certificateChain = (NSArray *)v21;
    }
  }
  v4->_hidden = WiFiNetworkGetDirectedState() != 0;
  objc_storeStrong((id *)&v4->_scanAttributes, v7);
  uint64_t v23 = WFUserNameFromEnterpriseProfile(v4->_enterpriseProfile);
  username = v4->_username;
  v4->_username = (NSString *)v23;

  if (WiFiNetworkGetProperty()) {
    v4->_managed = 1;
  }
  CFBooleanRef Property = (const __CFBoolean *)WiFiNetworkGetProperty();
  if (Property)
  {
    CFBooleanRef v26 = Property;
    CFTypeID v27 = CFGetTypeID(Property);
    if (v27 == CFBooleanGetTypeID()) {
      v4->_captive = CFBooleanGetValue(v26) != 0;
    }
  }
  v4->_adhoc = WiFiNetworkIsAdHoc() != 0;
  int IsHotspot20 = WiFiNetworkIsHotspot20();
  if (IsHotspot20)
  {
    v4->_HS20NetworkProvisioned = WiFiNetworkIsProvisionedHS20Network() != 0;
    CFDataRef v29 = WiFiNetworkGetProperty();
    uint64_t v30 = v29;
    if (v29)
    {
      uint64_t v31 = [v29 copy];
      HS20OperatorName = v4->_HS20OperatorName;
      v4->_HS20OperatorName = (NSString *)v31;
    }
  }
  v4->_HS20Network = IsHotspot20 != 0;
  v4->_autoJoinEnabled = WiFiNetworkIsEnabled() != 0;
  uint64_t v33 = WiFiNetworkGetProperty();
  v34 = (void *)v33;
  if (!v4->_autoJoinEnabled && v33)
  {
    v35 = WFLogForCategory(0);
    os_log_type_t v36 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v35 && os_log_type_enabled(v35, v36))
    {
      ssid = v4->_ssid;
      *(_DWORD *)buf = 136315650;
      v86 = (__WiFiNetwork *)"-[WFNetworkProfile initWithNetworkRef:]";
      __int16 v87 = 2112;
      v88 = ssid;
      __int16 v89 = 2112;
      v90 = v34;
      _os_log_impl(&dword_226071000, v35, v36, "%s: %@ autojoin temporarily disabled until %@, overriding UI switch to show enabled", buf, 0x20u);
    }

    v4->_autoJoinEnabled = 1;
  }
  int IsCarPlay = WiFiNetworkIsCarPlay();
  v4->_carPlay = IsCarPlay != 0;
  if (IsCarPlay)
  {
    int Type = WiFiNetworkGetType();
    uint64_t v40 = 1;
    if (Type != 1) {
      uint64_t v40 = 2;
    }
    v4->_carPlayint Type = v40;
  }
  uint64_t v41 = WiFiNetworkGetProperty();
  carPlayUUID = v4->_carPlayUUID;
  v4->_carPlayUUID = (NSString *)v41;

  uint64_t v43 = WiFiNetworkGetProperty();
  policyUUID = v4->_policyUUID;
  v4->_policyUUID = (NSString *)v43;

  CFBooleanRef v45 = (const __CFBoolean *)WiFiNetworkGetProperty();
  if (v45 && (CFBooleanRef v46 = v45, v47 = CFGetTypeID(v45), v47 == CFBooleanGetTypeID()))
  {
    int Value = CFBooleanGetValue(v46);
    v4->_autoLoginEnabled = Value == 0;
    if (Value)
    {
      v49 = WFLogForCategory(0);
      os_log_type_t v50 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v49 && os_log_type_enabled(v49, v50))
      {
        *(_DWORD *)buf = 138412290;
        v86 = a3;
        _os_log_impl(&dword_226071000, v49, v50, "Autologin disabled due to captive bypass for network %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v4->_autoLoginEnabled = 1;
  }
  v4->_isInSaveDataMode = WiFiNetworkIsInSaveDataMode() != 0;
  v4->_isPrivacyProxyEnabled = WiFiNetworkGetPrivacyProxyEnabled() != 0;
  WiFiNetworkGetNetworkQualityResponsiveness();
  v4->_networkQualityResponsiveness = v51;
  uint64_t v52 = WiFiNetworkGetNetworkQualityDate();
  networkQualityDate = v4->_networkQualityDate;
  v4->_networkQualityDate = (NSDate *)v52;

  v4->_carrierBased = WiFiNetworkIsCarrierBundleBased() != 0;
  v4->_lastAutoJoinDate = (NSDate *)WiFiNetworkGetAssociationDate();
  v4->_addedDate = (NSDate *)WiFiNetworkGetAssociationDate();
  uint64_t v54 = WiFiNetworkGetBundleIdentifier();
  originatorBundleIdentifier = v4->_originatorBundleIdentifier;
  v4->_originatorBundleIdentifier = (NSString *)v54;

  uint64_t v56 = WiFiNetworkGetProperty();
  originatorName = v4->_originatorName;
  v4->_originatorName = (NSString *)v56;

  uint64_t v58 = WiFiNetworkGetProperty();
  HS20AccountName = v4->_HS20AccountName;
  v4->_HS20AccountName = (NSString *)v58;

  uint64_t v60 = WiFiNetworkGetHS2NetworkBadge();
  HS20Badge = v4->_HS20Badge;
  v4->_HS20Badge = (NSString *)v60;

  v4->_canExposeIMSI = WiFiNetworkCanExposeIMSI() != 0;
  v4->_requiresPassword = WiFiNetworkRequiresPassword() != 0;
  v4->_personalHotspot = WiFiNetworkIsApplePersonalHotspot() != 0;
  int v62 = [(id)WiFiNetworkGetProperty() intValue];
  if (v62 == 17)
  {
    uint64_t v63 = 21;
  }
  else
  {
    if (v62 != 11) {
      goto LABEL_45;
    }
    uint64_t v63 = 22;
  }
  *((unsigned char *)&v4->super.isa + v63) = 1;
LABEL_45:
  int Originator = WiFiNetworkGetOriginator();
  if (v4->_carrierBased)
  {
    uint64_t v65 = 2;
  }
  else if (v4->_managed)
  {
    uint64_t v65 = 3;
  }
  else
  {
    if (Originator)
    {
      v4->_originator = 0;
      goto LABEL_50;
    }
    uint64_t v65 = 1;
  }
  v4->_originator = v65;
LABEL_50:
  v66 = [v7 objectForKey:@"PRIVATE_MAC_ADDRESS"];
  v67 = v66;
  if (v66)
  {
    CFDataRef v68 = (const __CFData *)[v66 objectForKey:@"PRIVATE_MAC_ADDRESS_VALUE"];
    if (v68)
    {
      uint64_t v69 = WFConvertEthernetNetworkAddressToString(v68);
      randomMACAddress = v4->_randomMACAddress;
      v4->_randomMACAddress = (NSString *)v69;
    }
    v71 = [v67 objectForKey:@"PRIVATE_MAC_ADDRESS_TYPE"];
    v4->_BOOL randomMACAddressEnabled = ([v71 intValue] & 0xFFFFFFFE) == 2;
    v72 = WFLogForCategory(0);
    os_log_type_t v73 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v72 && os_log_type_enabled(v72, v73))
    {
      v74 = v4->_ssid;
      BOOL randomMACAddressEnabled = v4->_randomMACAddressEnabled;
      *(_DWORD *)buf = 136315650;
      v86 = (__WiFiNetwork *)"-[WFNetworkProfile initWithNetworkRef:]";
      __int16 v87 = 2112;
      v88 = v74;
      __int16 v89 = 1024;
      LODWORD(v90) = randomMACAddressEnabled;
      _os_log_impl(&dword_226071000, v72, v73, "%s: %@ _randomMACAddressEnabled: %d", buf, 0x1Cu);
    }
  }
  else
  {
    v4->_BOOL randomMACAddressEnabled = 1;
  }
  CFBooleanRef v76 = (const __CFBoolean *)WiFiNetworkGetProperty();
  if (v76)
  {
    CFBooleanRef v77 = v76;
    CFTypeID v78 = CFGetTypeID(v76);
    if (v78 == CFBooleanGetTypeID()) {
      v4->_DNSHeuristicsFiltered = CFBooleanGetValue(v77) != 0;
    }
  }
LABEL_62:
  v79 = v4;

  return v79;
}

- (WFNetworkProfile)initWithNetwork:(id)a3
{
  id v4 = a3;
  v5 = [v4 attributes];

  if (!v5) {
    goto LABEL_5;
  }
  [v4 attributes];
  v6 = (const void *)WiFiNetworkCreate();
  self = [(WFNetworkProfile *)self initWithNetworkRef:v6];
  if (v6) {
    CFRelease(v6);
  }
  if (!self)
  {
LABEL_5:

    self = 0;
  }

  return self;
}

- (WFNetworkProfile)initWithCoreWiFiProfile:(id)a3
{
  id v4 = (id)WiFiNetworkCreateFromCoreWiFiNetworkProfile();
  return [(WFNetworkProfile *)self initWithNetworkRef:v4];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(WFMutableNetworkProfile);
  v6 = [(WFNetworkProfile *)self ssid];
  v7 = (void *)[v6 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setSsid:v7];

  v8 = [(WFNetworkProfile *)self bssid];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setBssid:v9];

  uint64_t v10 = [(WFNetworkProfile *)self username];
  uint64_t v11 = (void *)[v10 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setUsername:v11];

  uint64_t v12 = [(WFNetworkProfile *)self password];
  uint64_t v13 = (void *)[v12 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setPassword:v13];

  [(WFMutableNetworkProfile *)v5 setSecurityMode:[(WFNetworkProfile *)self securityMode]];
  [(WFMutableNetworkProfile *)v5 setSecurityModeExt:[(WFNetworkProfile *)self securityModeExt]];
  uint64_t v14 = [(WFNetworkProfile *)self enterpriseProfile];
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setEnterpriseProfile:v15];

  uint64_t v16 = [(WFNetworkProfile *)self certificateChain];
  v17 = (void *)[v16 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setCertificateChain:v17];

  v18 = [(WFNetworkProfile *)self scanAttributes];
  v19 = (void *)[v18 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setScanAttributes:v19];

  v20 = [(WFNetworkProfile *)self enterpriseProfile];
  uint64_t v21 = (void *)[v20 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setEnterpriseProfile:v21];

  v22 = [(WFNetworkProfile *)self enterpriseProfile];
  uint64_t v23 = WFUserNameFromEnterpriseProfile(v22);
  [(WFMutableNetworkProfile *)v5 setUsername:v23];

  v24 = [(WFMutableNetworkProfile *)v5 username];

  if (!v24)
  {
    v25 = [(WFNetworkProfile *)self username];
    CFBooleanRef v26 = (void *)[v25 copyWithZone:a3];
    [(WFMutableNetworkProfile *)v5 setUsername:v26];
  }
  CFTypeID v27 = [(WFNetworkProfile *)self password];
  v28 = (void *)[v27 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setPassword:v28];

  [(WFMutableNetworkProfile *)v5 setManaged:[(WFNetworkProfile *)self isManaged]];
  [(WFMutableNetworkProfile *)v5 setCaptive:[(WFNetworkProfile *)self isCaptive]];
  [(WFNetworkProfile *)v5 setAdhoc:[(WFNetworkProfile *)self isAdhoc]];
  [(WFMutableNetworkProfile *)v5 setAutoJoinEnabled:[(WFNetworkProfile *)self isAutoJoinEnabled]];
  [(WFMutableNetworkProfile *)v5 setAutoLoginEnabled:[(WFNetworkProfile *)self isAutoLoginEnabled]];
  [(WFMutableNetworkProfile *)v5 setIsInSaveDataMode:[(WFNetworkProfile *)self isInSaveDataMode]];
  [(WFMutableNetworkProfile *)v5 setIsPrivacyProxyEnabled:[(WFNetworkProfile *)self isPrivacyProxyEnabled]];
  [(WFNetworkProfile *)self networkQualityResponsiveness];
  -[WFMutableNetworkProfile setNetworkQualityResponsiveness:](v5, "setNetworkQualityResponsiveness:");
  CFDataRef v29 = [(WFNetworkProfile *)self networkQualityDate];
  uint64_t v30 = (void *)[v29 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setNetworkQualityDate:v30];

  [(WFMutableNetworkProfile *)v5 setHidden:[(WFNetworkProfile *)self isHidden]];
  uint64_t v31 = [(WFNetworkProfile *)self policyUUID];
  [(WFNetworkProfile *)v5 setPolicyUUID:v31];

  v32 = [(WFNetworkProfile *)self carPlayUUID];
  [(WFNetworkProfile *)v5 setCarPlayUUID:v32];

  [(WFNetworkProfile *)v5 setCarPlay:[(WFNetworkProfile *)self isCarPlay]];
  [(WFNetworkProfile *)v5 setCarPlayType:[(WFNetworkProfile *)self carPlayType]];
  [(WFMutableNetworkProfile *)v5 setTLSIdentity:[(WFNetworkProfile *)self TLSIdentity]];
  uint64_t v33 = [(WFNetworkProfile *)self policyUUID];
  [(WFNetworkProfile *)v5 setPolicyUUID:v33];

  v34 = [(WFNetworkProfile *)self originatorBundleIdentifier];
  [(WFMutableNetworkProfile *)v5 setOriginatorBundleIdentifier:v34];

  v35 = [(WFNetworkProfile *)self originatorName];
  [(WFMutableNetworkProfile *)v5 setOriginatorName:v35];

  [(WFMutableNetworkProfile *)v5 setHS20Network:[(WFNetworkProfile *)self isHS20Network]];
  [(WFMutableNetworkProfile *)v5 setHS20NetworkProvisioned:[(WFNetworkProfile *)self isHS20NetworkProvisioned]];
  [(WFNetworkProfile *)v5 setCarrierBased:[(WFNetworkProfile *)self isCarrierBased]];
  [(WFNetworkProfile *)v5 setProfileBased:[(WFNetworkProfile *)self isProfileBased]];
  [(WFMutableNetworkProfile *)v5 setAddedFromWiFiPasswordSharing:[(WFNetworkProfile *)self wasAddedFromWiFiPasswordSharing]];
  os_log_type_t v36 = [(WFNetworkProfile *)self HS20AccountName];
  v37 = (void *)[v36 copyWithZone:a3];
  [(WFNetworkProfile *)v5 setHS20AccountName:v37];

  v38 = [(WFNetworkProfile *)self HS20Badge];
  v39 = (void *)[v38 copyWithZone:a3];
  [(WFNetworkProfile *)v5 setHS20Badge:v39];

  [(WFNetworkProfile *)v5 setCanExposeIMSI:[(WFNetworkProfile *)self canExposeIMSI]];
  [(WFNetworkProfile *)v5 setRequiresPassword:[(WFNetworkProfile *)self requiresPassword]];
  [(WFNetworkProfile *)v5 setFetchedPassword:0];
  [(WFMutableNetworkProfile *)v5 setUserProvidedPassword:[(WFNetworkProfile *)self userProvidedPassword]];
  [(WFNetworkProfile *)v5 setPersonalHotspot:[(WFNetworkProfile *)self isPersonalHotspot]];
  [(WFMutableNetworkProfile *)v5 setInstantHotspotJoin:[(WFNetworkProfile *)self isInstantHotspotJoin]];
  uint64_t v40 = [(WFNetworkProfile *)self hotspotDeviceIdentifier];
  [(WFMutableNetworkProfile *)v5 setHotspotDeviceIdentifier:v40];

  [(WFMutableNetworkProfile *)v5 setRandomMACAddressEnabled:[(WFNetworkProfile *)self isRandomMACAddressEnabled]];
  uint64_t v41 = [(WFNetworkProfile *)self randomMACAddress];
  v42 = (void *)[v41 copyWithZone:a3];
  [(WFMutableNetworkProfile *)v5 setRandomMACAddress:v42];

  [(WFNetworkProfile *)v5 setDNSHeuristicsFiltered:[(WFNetworkProfile *)self isDNSHeuristicsFiltered]];
  uint64_t v43 = [(WFNetworkProfile *)self HS20OperatorName];
  v44 = (void *)[v43 copyWithZone:a3];
  [(WFNetworkProfile *)v5 setHS20OperatorName:v44];

  return v5;
}

- (void)dealloc
{
  TLSIdentity = self->_TLSIdentity;
  if (TLSIdentity)
  {
    CFRelease(TLSIdentity);
    self->_TLSIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFNetworkProfile;
  [(WFNetworkProfile *)&v4 dealloc];
}

- (BOOL)requiresUsernameAndPassword
{
  BOOL v3 = [(WFNetworkProfile *)self isEnterprise];
  if (v3) {
    LOBYTE(v3) = ![(WFNetworkProfile *)self requiresTLSIdentityOnly];
  }
  return v3;
}

- (BOOL)TLSProfileCanJoin
{
  if (![(WFNetworkProfile *)self requiresTLSIdentityOnly]) {
    return 0;
  }
  if ([(WFNetworkProfile *)self TLSIdentity]) {
    return 1;
  }
  objc_super v4 = [(WFNetworkProfile *)self enterpriseProfile];
  v5 = [v4 objectForKey:@"EAPClientConfiguration"];
  v6 = [v5 objectForKey:@"TLSIdentityHandle"];
  BOOL v3 = v6 != 0;

  return v3;
}

- (__SecIdentity)TLSIdentity
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  TLSIdentity = self->_TLSIdentity;
  if (TLSIdentity)
  {
    v7 = 0;
    v5 = 0;
  }
  else
  {
    objc_super v4 = [(WFNetworkProfile *)self enterpriseProfile];
    v5 = v4;
    if (v4)
    {
      v6 = [v4 objectForKey:@"EAPClientConfiguration"];
      v7 = v6;
      if (v6 && [v6 objectForKey:@"TLSIdentityHandle"])
      {
        int SecIdentity = EAPSecIdentityHandleCreateSecIdentity();
        uint64_t v10 = WFLogForCategory(0);
        os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v13 = "-[WFNetworkProfile TLSIdentity]";
          __int16 v14 = 1024;
          int v15 = SecIdentity;
          __int16 v16 = 2112;
          v17 = self;
          _os_log_impl(&dword_226071000, v10, v11, "%s: failed to create TLS identity (err %d) %@", buf, 0x1Cu);
        }

        TLSIdentity = 0;
      }
      else
      {
        TLSIdentity = 0;
      }
    }
    else
    {
      TLSIdentity = 0;
      v7 = 0;
    }
  }

  return TLSIdentity;
}

- (BOOL)requiresTLSIdentityOnly
{
  v2 = [(WFNetworkProfile *)self enterpriseProfile];
  BOOL v3 = [v2 objectForKey:@"EAPClientConfiguration"];
  objc_super v4 = [v3 objectForKey:@"AcceptEAPTypes"];
  v5 = [NSNumber numberWithInt:13];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (NSDictionary)enterpriseProfile
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(WFNetworkProfile *)self isEnterprise]
    || [(WFNetworkProfile *)self isHS20Network])
  {
    if (self->_enterpriseProfile) {
      objc_msgSend(v3, "addEntriesFromDictionary:");
    }
    objc_super v4 = [v3 objectForKey:@"EAPClientConfiguration"];
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    char v6 = v5;
    if (v4) {
      [v5 addEntriesFromDictionary:v4];
    }
    v7 = [v6 objectForKey:@"AcceptEAPTypes"];

    if (!v7)
    {
      if (self->_TLSIdentity) {
        v8 = &unk_26D9E2200;
      }
      else {
        v8 = &unk_26D9E2218;
      }
      [v6 setObject:v8 forKey:@"AcceptEAPTypes"];
    }
    uint64_t v9 = [(WFNetworkProfile *)self username];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      os_log_type_t v11 = [(WFNetworkProfile *)self username];
      [v6 setObject:v11 forKey:@"UserName"];
    }
    uint64_t v12 = [(WFNetworkProfile *)self password];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      __int16 v14 = [(WFNetworkProfile *)self password];
      [v6 setObject:v14 forKey:@"UserPassword"];
    }
    int v15 = [(WFNetworkProfile *)self certificateChain];

    if (v15)
    {
      __int16 v16 = [(WFNetworkProfile *)self certificateChain];
      [v6 setObject:v16 forKey:@"TLSUserTrustProceedCertificateChain"];

      [v6 setObject:MEMORY[0x263EFFA88] forKey:@"TLSSaveTrustExceptions"];
    }
    [v3 setObject:v6 forKey:@"EAPClientConfiguration"];
    [v3 setObject:MEMORY[0x263EFFA80] forKey:@"EnableUserInterface"];
    id v17 = v3;
  }
  else
  {
    id v17 = 0;
  }

  return (NSDictionary *)v17;
}

- (BOOL)isEnterprise
{
  BOOL v3 = self->_enterpriseProfile;
  if ([(WFNetworkProfile *)self isHS20Network]) {
    int v4 = ![(WFNetworkProfile *)self isHS20NetworkProvisioned];
  }
  else {
    LOBYTE(v4) = 0;
  }
  if ([(WFNetworkProfile *)self isHS20Network]
    && [(WFNetworkProfile *)self isHS20NetworkProvisioned])
  {
    char v5 = 0;
  }
  else
  {
    if (v3) {
      BOOL v6 = [(WFNetworkProfile *)self profileContainsCarrierEAPType:v3];
    }
    else {
      BOOL v6 = 0;
    }
    if (WFSecurityModeIsEnterprise([(WFNetworkProfile *)self securityMode])) {
      char v5 = 1;
    }
    else {
      char v5 = v6 | v4;
    }
  }

  return v5;
}

- (BOOL)profileContainsEAPSIM:(id)a3
{
  BOOL v3 = [a3 objectForKey:@"EAPClientConfiguration"];
  int v4 = v3;
  if (v3)
  {
    char v5 = [v3 objectForKey:@"AcceptEAPTypes"];
    BOOL v6 = [NSNumber numberWithInt:18];
    char v7 = [v5 containsObject:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)profileContainsEAPAKA:(id)a3
{
  BOOL v3 = [a3 objectForKey:@"EAPClientConfiguration"];
  int v4 = v3;
  if (v3)
  {
    char v5 = [v3 objectForKey:@"AcceptEAPTypes"];
    BOOL v6 = [NSNumber numberWithInt:23];
    char v7 = [v5 containsObject:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)profileContainsCarrierEAPType:(id)a3
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [(WFNetworkProfile *)self profileContainsEAPSIM:v4]
  }
      || [(WFNetworkProfile *)self profileContainsEAPAKA:v4];
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canAttemptJoin
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int64_t v3 = [(WFNetworkProfile *)self securityMode];
  id v4 = [(WFNetworkProfile *)self enterpriseProfile];
  BOOL v5 = [(WFNetworkProfile *)self password];
  int v6 = WFValidPasswordForSecurityMode(v3, v5);

  int v7 = WFSecurityModeRequiresPasswordOnly(v3);
  BOOL v8 = [(WFNetworkProfile *)self requiresUsernameAndPassword];
  if ([(WFNetworkProfile *)self requiresTLSIdentityOnly])
  {
    if ([(WFNetworkProfile *)self TLSIdentity])
    {
      BOOL v9 = 1;
    }
    else
    {
      uint64_t v10 = [v4 objectForKey:@"EAPClientConfiguration"];
      os_log_type_t v11 = [v10 objectForKey:@"TLSIdentityHandle"];
      BOOL v9 = v11 != 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  BOOL v12 = [(WFNetworkProfile *)self profileContainsCarrierEAPType:v4];
  if ([(WFNetworkProfile *)self isHS20Network]) {
    BOOL v13 = [(WFNetworkProfile *)self isHS20NetworkProvisioned];
  }
  else {
    BOOL v13 = 0;
  }
  int v14 = v7 & v6;
  int v15 = v8 & v6;
  __int16 v16 = WFLogForCategory(0);
  os_log_type_t v17 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v16 && os_log_type_enabled(v16, v17))
  {
    int v20 = 136316418;
    uint64_t v21 = "-[WFNetworkProfile canAttemptJoin]";
    __int16 v22 = 1024;
    BOOL v23 = v9;
    __int16 v24 = 1024;
    int v25 = v15;
    __int16 v26 = 1024;
    int v27 = v14;
    __int16 v28 = 1024;
    BOOL v29 = v12;
    __int16 v30 = 1024;
    BOOL v31 = v13;
    _os_log_impl(&dword_226071000, v16, v17, "%s: tlsProfileCanJoin %d, automaticProfileCanJoin %d, passwordOnlyCanJoin %d, isEAPSimOrAKA %d, isHS20Provisioned %d", (uint8_t *)&v20, 0x2Au);
  }
  if (v3) {
    char v18 = v14;
  }
  else {
    char v18 = 1;
  }

  return v18 | v15 | v9 | (v12 || v13);
}

- (BOOL)userProvidedPassword
{
  return 0;
}

- (NSString)password
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (self->_fetchedPassword) {
    goto LABEL_25;
  }
  if (!self->_requiresPassword)
  {
LABEL_24:
    self->_fetchedPassword = 1;
LABEL_25:
    p_password = &self->_password;
    goto LABEL_26;
  }
  if (![(WFNetworkProfile *)self userProvidedPassword]
    || (p_password = &self->_password, !self->_password))
  {
    int v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
    {
      BOOL v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        BOOL v9 = [(WFNetworkProfile *)self ssid];
        int v19 = 136315394;
        int v20 = "-[WFNetworkProfile password]";
        __int16 v21 = 2112;
        __int16 v22 = v9;
        _os_log_impl(&dword_226071000, v8, v7, "%s: fetching password from keychain for %@", (uint8_t *)&v19, 0x16u);
      }
    }

    [(WFNetworkProfile *)self scanAttributes];
    uint64_t v10 = (const void *)WiFiNetworkCreate();
    os_log_type_t v11 = (NSString *)WiFiNetworkCopyPassword();
    password = self->_password;
    self->_password = v11;

    if (!self->_password)
    {
      BOOL v13 = WFLogForCategory(0);
      os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13)
      {
        int v15 = v13;
        if (os_log_type_enabled(v15, v14))
        {
          __int16 v16 = [(WFNetworkProfile *)self ssid];
          int v19 = 136315394;
          int v20 = "-[WFNetworkProfile password]";
          __int16 v21 = 2114;
          __int16 v22 = v16;
          _os_log_impl(&dword_226071000, v15, v14, "%s: password is nil for %{public}@", (uint8_t *)&v19, 0x16u);
        }
      }
    }
    if (v10) {
      CFRelease(v10);
    }
    goto LABEL_24;
  }
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v19 = 136315138;
    int v20 = "-[WFNetworkProfile password]";
    _os_log_impl(&dword_226071000, v4, v5, "%s: user provided password marking password as fetched", (uint8_t *)&v19, 0xCu);
  }

  self->_fetchedPassword = 1;
LABEL_26:
  os_log_type_t v17 = *p_password;
  return v17;
}

- (id)description
{
  int64_t v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  os_log_type_t v5 = NSStringFromClass(v4);
  int v6 = [(WFNetworkProfile *)self ssid];
  os_log_type_t v7 = [(WFNetworkProfile *)self bssid];
  BOOL v8 = WFStringFromWFSecurityMode([(WFNetworkProfile *)self securityMode]);
  BOOL v9 = WFStringFromWFSecurityModeExt([(WFNetworkProfile *)self securityModeExt]);
  uint64_t v10 = [v3 stringWithFormat:@"<%@ : %p SSID:%@ BSSID:%@ security:%@ securityExt %@", v5, self, v6, v7, v8, v9];

  if ([(WFNetworkProfile *)self requiresPassword])
  {
    os_log_type_t v11 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @" pwd:(");
    objc_msgSend(v11, "appendFormat:", @"fetched=%d", -[WFNetworkProfile fetchedPassword](self, "fetchedPassword"));
    if ([(WFNetworkProfile *)self fetchedPassword])
    {
      BOOL v12 = [(WFNetworkProfile *)self password];
      objc_msgSend(v11, "appendFormat:", @",valid=%d", v12 != 0);
    }
    if ([(WFNetworkProfile *)self userProvidedPassword]) {
      [v11 appendFormat:@",userProvided=1"];
    }
    [v11 appendString:@""]);
    [v10 appendString:v11];
  }
  [v10 appendFormat:@" auto-join=%d, auto-login=%d, data-saver=%d, privacy-proxy=%d", -[WFNetworkProfile isAutoJoinEnabled](self, "isAutoJoinEnabled"), -[WFNetworkProfile isAutoLoginEnabled](self, "isAutoLoginEnabled"), -[WFNetworkProfile isInSaveDataMode](self, "isInSaveDataMode"), -[WFNetworkProfile isPrivacyProxyEnabled](self, "isPrivacyProxyEnabled")];
  [(WFNetworkProfile *)self networkQualityResponsiveness];
  uint64_t v14 = v13;
  int v15 = [(WFNetworkProfile *)self networkQualityDate];
  [v10 appendFormat:@" responsiveness=%.3f (%@)", v14, v15];

  if ([(WFNetworkProfile *)self isHidden]) {
    [v10 appendString:@", hidden"];
  }
  if ([(WFNetworkProfile *)self isManaged]) {
    [v10 appendString:@", managed"];
  }
  if ([(WFNetworkProfile *)self isCaptive]) {
    [v10 appendString:@", isCaptive"];
  }
  if ([(WFNetworkProfile *)self isAdhoc]) {
    [v10 appendString:@", adhoc"];
  }
  if ([(WFNetworkProfile *)self isHS20Network]) {
    [v10 appendFormat:@", hs20(provisioned=%d)", -[WFNetworkProfile isHS20NetworkProvisioned](self, "isHS20NetworkProvisioned")];
  }
  if ([(WFNetworkProfile *)self isCarPlay])
  {
    int64_t v16 = [(WFNetworkProfile *)self carPlayType];
    os_log_type_t v17 = @",CarPlayUserConfigured";
    if (v16 == 1) {
      os_log_type_t v17 = @",CarPlayOnly";
    }
    [v10 appendFormat:@", %@", v17];
  }
  char v18 = [(WFNetworkProfile *)self originatorBundleIdentifier];

  if (v18)
  {
    int v19 = [(WFNetworkProfile *)self originatorBundleIdentifier];
    [v10 appendFormat:@", originatorBundle:%@", v19];
  }
  int v20 = [(WFNetworkProfile *)self originatorName];

  if (v20)
  {
    __int16 v21 = [(WFNetworkProfile *)self originatorName];
    [v10 appendFormat:@", originatorName:%@", v21];
  }
  if ([(WFNetworkProfile *)self isDNSHeuristicsFiltered]) {
    [v10 appendString:@", dnsFiltered"];
  }
  if ([(WFNetworkProfile *)self isRandomMACAddressEnabled]) {
    __int16 v22 = @" RandomMAC enabled!";
  }
  else {
    __int16 v22 = @" RandomMAC disabled!";
  }
  [v10 appendString:v22];
  uint64_t v23 = [(WFNetworkProfile *)self randomMACAddress];

  if (v23)
  {
    __int16 v24 = NSString;
    int v25 = [(WFNetworkProfile *)self randomMACAddress];
    __int16 v26 = [v24 stringWithFormat:@" Random MAC: %@", v25];
    [v10 appendString:v26];
  }
  [v10 appendString:@">"];
  return v10;
}

- (BOOL)isEqualToNetwork:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_log_type_t v5 = [(WFNetworkProfile *)self ssid];
    int v6 = [v4 ssid];
    if ([v5 isEqualToString:v6])
    {
      int64_t v7 = [(WFNetworkProfile *)self securityMode];
      BOOL v8 = v7 == [v4 securityMode];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  int v6 = [(WFNetworkProfile *)self randomMACAddress];
  if (!v6)
  {
    int64_t v3 = [v5 randomMACAddress];
    if (!v3)
    {
      char v9 = 1;
LABEL_7:

      goto LABEL_8;
    }
  }
  int64_t v7 = [(WFNetworkProfile *)self randomMACAddress];
  BOOL v8 = [v5 randomMACAddress];
  char v9 = [v7 isEqualToString:v8];

  if (!v6) {
    goto LABEL_7;
  }
LABEL_8:

  uint64_t v10 = [(WFNetworkProfile *)self ssid];
  os_log_type_t v11 = [v5 ssid];
  if (![v10 isEqualToString:v11]) {
    goto LABEL_20;
  }
  int64_t v12 = [(WFNetworkProfile *)self securityMode];
  if (v12 != [v5 securityMode]) {
    goto LABEL_20;
  }
  int v13 = [(WFNetworkProfile *)self isAutoJoinEnabled];
  if (v13 != [v5 isAutoJoinEnabled]) {
    goto LABEL_20;
  }
  int v14 = [(WFNetworkProfile *)self isAutoLoginEnabled];
  if (v14 != [v5 isAutoLoginEnabled]) {
    goto LABEL_20;
  }
  int v15 = [(WFNetworkProfile *)self isInSaveDataMode];
  if (v15 != [v5 isInSaveDataMode]) {
    goto LABEL_20;
  }
  int v16 = [(WFNetworkProfile *)self isPrivacyProxyEnabled];
  if (v16 == [v5 isPrivacyProxyEnabled]
    && (int v17 = -[WFNetworkProfile isHidden](self, "isHidden"), v17 == [v5 isHidden])
    && (int64_t v18 = -[WFNetworkProfile carPlayType](self, "carPlayType"), v18 == [v5 carPlayType])
    && (int v19 = -[WFNetworkProfile isManaged](self, "isManaged"), v19 == [v5 isManaged])
    && (int v20 = [(WFNetworkProfile *)self isHS20Network],
        v20 == [v5 isHS20Network])
    && (int v21 = -[WFNetworkProfile isCaptive](self, "isCaptive"), v21 == [v5 isCaptive])
    && (int v22 = [(WFNetworkProfile *)self isRandomMACAddressEnabled],
        v22 == [v5 isRandomMACAddressEnabled]))
  {

    if (v9)
    {
      BOOL v23 = 1;
      goto LABEL_22;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v23 = 0;
LABEL_22:

  return v23;
}

- (unint64_t)hash
{
  int64_t v3 = [(WFNetworkProfile *)self ssid];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(WFNetworkProfile *)self securityMode] ^ v4;
  int64_t v6 = v5 ^ [(WFNetworkProfile *)self isAutoJoinEnabled];
  uint64_t v7 = [(WFNetworkProfile *)self isAutoLoginEnabled];
  int64_t v8 = v6 ^ v7 ^ [(WFNetworkProfile *)self isInSaveDataMode];
  uint64_t v9 = [(WFNetworkProfile *)self isPrivacyProxyEnabled];
  uint64_t v10 = v9 ^ [(WFNetworkProfile *)self isHidden];
  int64_t v11 = v8 ^ v10 ^ [(WFNetworkProfile *)self carPlayType];
  uint64_t v12 = [(WFNetworkProfile *)self isManaged];
  uint64_t v13 = v12 ^ [(WFNetworkProfile *)self isHS20Network];
  uint64_t v14 = v13 ^ [(WFNetworkProfile *)self isCaptive];
  int64_t v15 = v11 ^ v14 ^ [(WFNetworkProfile *)self isRandomMACAddressEnabled];
  int v16 = [(WFNetworkProfile *)self randomMACAddress];
  unint64_t v17 = v15 ^ [v16 hash];

  return v17;
}

+ (BOOL)networkProfileRepresentSameNetwork:(id)a3 toNetworkProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 ssid];
  int64_t v8 = [v6 ssid];
  if ([v7 isEqualToString:v8])
  {
    if (WFIsSecurityModeMatch([v5 securityModeExt], objc_msgSend(v6, "securityModeExt"))) {
      char IsEquivalentWPA = 1;
    }
    else {
      char IsEquivalentWPA = WFSecurityModeIsEquivalentWPA([v5 securityMode], objc_msgSend(v6, "securityMode"));
    }
  }
  else
  {
    char IsEquivalentWPA = 0;
  }

  return IsEquivalentWPA;
}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  self->_TLSIdentity = a3;
}

- (NSDictionary)scanAttributes
{
  return self->_scanAttributes;
}

- (void)setScanAttributes:(id)a3
{
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (void)setEnterpriseProfile:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (BOOL)isCaptive
{
  return self->_captive;
}

- (void)setCaptive:(BOOL)a3
{
  self->_captive = a3;
}

- (BOOL)isAdhoc
{
  return self->_adhoc;
}

- (void)setAdhoc:(BOOL)a3
{
  self->_adhoc = a3;
}

- (BOOL)isHS20Network
{
  return self->_HS20Network;
}

- (void)setHS20Network:(BOOL)a3
{
  self->_HS20Network = a3;
}

- (BOOL)isHS20NetworkProvisioned
{
  return self->_HS20NetworkProvisioned;
}

- (void)setHS20NetworkProvisioned:(BOOL)a3
{
  self->_HS20NetworkProvisioned = a3;
}

- (NSString)HS20AccountName
{
  return self->_HS20AccountName;
}

- (void)setHS20AccountName:(id)a3
{
}

- (NSString)HS20Badge
{
  return self->_HS20Badge;
}

- (void)setHS20Badge:(id)a3
{
}

- (BOOL)isAutoJoinEnabled
{
  return self->_autoJoinEnabled;
}

- (void)setAutoJoinEnabled:(BOOL)a3
{
  self->_autoJoinEnabled = a3;
}

- (BOOL)isAutoLoginEnabled
{
  return self->_autoLoginEnabled;
}

- (BOOL)isCarPlay
{
  return self->_carPlay;
}

- (void)setCarPlay:(BOOL)a3
{
  self->_carPlay = a3;
}

- (BOOL)isInSaveDataMode
{
  return self->_isInSaveDataMode;
}

- (BOOL)isPrivacyProxyEnabled
{
  return self->_isPrivacyProxyEnabled;
}

- (double)networkQualityResponsiveness
{
  return self->_networkQualityResponsiveness;
}

- (NSDate)networkQualityDate
{
  return self->_networkQualityDate;
}

- (int64_t)carPlayType
{
  return self->_carPlayType;
}

- (void)setCarPlayType:(int64_t)a3
{
  self->_carPlayint Type = a3;
}

- (NSString)carPlayUUID
{
  return self->_carPlayUUID;
}

- (void)setCarPlayUUID:(id)a3
{
}

- (NSString)policyUUID
{
  return self->_policyUUID;
}

- (void)setPolicyUUID:(id)a3
{
}

- (int64_t)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(int64_t)a3
{
  self->_securityMode = a3;
}

- (int64_t)securityModeExt
{
  return self->_securityModeExt;
}

- (void)setSecurityModeExt:(int64_t)a3
{
  self->_securityModeExt = a3;
}

- (NSDate)addedDate
{
  return self->_addedDate;
}

- (NSDate)lastAutoJoinDate
{
  return self->_lastAutoJoinDate;
}

- (unint64_t)originator
{
  return self->_originator;
}

- (NSString)originatorBundleIdentifier
{
  return self->_originatorBundleIdentifier;
}

- (void)setOriginatorBundleIdentifier:(id)a3
{
}

- (NSString)originatorName
{
  return self->_originatorName;
}

- (void)setOriginatorName:(id)a3
{
}

- (BOOL)isCarrierBased
{
  return self->_carrierBased;
}

- (void)setCarrierBased:(BOOL)a3
{
  self->_carrierBased = a3;
}

- (BOOL)isPersonalHotspot
{
  return self->_personalHotspot;
}

- (void)setPersonalHotspot:(BOOL)a3
{
  self->_personalHotspot = a3;
}

- (BOOL)isProfileBased
{
  return self->_profileBased;
}

- (void)setProfileBased:(BOOL)a3
{
  self->_profileBased = a3;
}

- (BOOL)wasAddedFromWiFiPasswordSharing
{
  return self->_addedFromWiFiPasswordSharing;
}

- (void)setAddedFromWiFiPasswordSharing:(BOOL)a3
{
  self->_addedFromWiFiPasswordSharing = a3;
}

- (BOOL)canExposeIMSI
{
  return self->_canExposeIMSI;
}

- (void)setCanExposeIMSI:(BOOL)a3
{
  self->_canExposeIMSI = a3;
}

- (NSString)previousPassword
{
  return self->_previousPassword;
}

- (BOOL)isInstantHotspotJoin
{
  return self->_instantHotspotJoin;
}

- (void)setInstantHotspotJoin:(BOOL)a3
{
  self->_instantHotspotJoin = a3;
}

- (NSString)hotspotDeviceIdentifier
{
  return self->_hotspotDeviceIdentifier;
}

- (void)setHotspotDeviceIdentifier:(id)a3
{
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (void)setRandomMACAddress:(id)a3
{
}

- (BOOL)isRandomMACAddressEnabled
{
  return self->_randomMACAddressEnabled;
}

- (void)setRandomMACAddressEnabled:(BOOL)a3
{
  self->_BOOL randomMACAddressEnabled = a3;
}

- (BOOL)isDNSHeuristicsFiltered
{
  return self->_DNSHeuristicsFiltered;
}

- (void)setDNSHeuristicsFiltered:(BOOL)a3
{
  self->_DNSHeuristicsFiltered = a3;
}

- (NSString)HS20OperatorName
{
  return self->_HS20OperatorName;
}

- (void)setHS20OperatorName:(id)a3
{
}

- (BOOL)fetchedPassword
{
  return self->_fetchedPassword;
}

- (void)setFetchedPassword:(BOOL)a3
{
  self->_fetchedPassword = a3;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (void)setRequiresPassword:(BOOL)a3
{
  self->_requiresPassword = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HS20OperatorName, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_hotspotDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_originatorName, 0);
  objc_storeStrong((id *)&self->_originatorBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_policyUUID, 0);
  objc_storeStrong((id *)&self->_carPlayUUID, 0);
  objc_storeStrong((id *)&self->_networkQualityDate, 0);
  objc_storeStrong((id *)&self->_HS20Badge, 0);
  objc_storeStrong((id *)&self->_HS20AccountName, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_enterpriseProfile, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
  objc_storeStrong((id *)&self->_scanAttributes, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

- (BOOL)shouldBeRemovedIfApplicationIsNoLongerInstalled
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int64_t v3 = [(WFNetworkProfile *)self originatorBundleIdentifier];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(WFNetworkProfile *)self originatorBundleIdentifier];
  uint64_t v5 = [v4 rangeOfString:@"com.apple" options:1];

  if (!v5)
  {
    uint64_t v10 = WFLogForCategory(0);
    uint64_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, (os_log_type_t)v11))
    {
      int v14 = 136315394;
      int64_t v15 = "-[WFNetworkProfile(NEHotspotHelper) shouldBeRemovedIfApplicationIsNoLongerInstalled]";
      __int16 v16 = 2112;
      unint64_t v17 = self;
      _os_log_impl(&dword_226071000, v10, (os_log_type_t)v11, "%s: application based network (%@) is configured by first party app", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_15;
  }
  id v6 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v7 = [(WFNetworkProfile *)self originatorBundleIdentifier];
  int v8 = [v6 applicationIsInstalled:v7];

  if (v8)
  {
    uint64_t v10 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10)
    {
      uint64_t v10 = v10;
      if (os_log_type_enabled(v10, v12))
      {
        uint64_t v13 = [(WFNetworkProfile *)self originatorBundleIdentifier];
        int v14 = 136315650;
        int64_t v15 = "-[WFNetworkProfile(NEHotspotHelper) shouldBeRemovedIfApplicationIsNoLongerInstalled]";
        __int16 v16 = 2112;
        unint64_t v17 = self;
        __int16 v18 = 2112;
        int v19 = v13;
        _os_log_impl(&dword_226071000, v10, v12, "%s: application based network (%@) with identifier %@ is not installed", (uint8_t *)&v14, 0x20u);
      }
    }
LABEL_15:

    return 0;
  }
  return 1;
}

@end