@interface WFMutableNetworkProfile
+ (id)mutableProfileForNetwork:(id)a3;
- (BOOL)isAdhoc;
- (BOOL)isAutoJoinEnabled;
- (BOOL)isAutoLoginEnabled;
- (BOOL)isCaptive;
- (BOOL)isCarrierBased;
- (BOOL)isHS20Network;
- (BOOL)isHS20NetworkProvisioned;
- (BOOL)isHidden;
- (BOOL)isInSaveDataMode;
- (BOOL)isInstantHotspotJoin;
- (BOOL)isManaged;
- (BOOL)isPersonalHotspot;
- (BOOL)isPrivacyProxyEnabled;
- (BOOL)isRandomMACAddressEnabled;
- (BOOL)userProvidedPassword;
- (BOOL)wasAddedFromWiFiPasswordSharing;
- (NSArray)certificateChain;
- (NSDate)lastAssociationDate;
- (NSDate)networkQualityDate;
- (NSDictionary)enterpriseProfile;
- (NSDictionary)scanAttributes;
- (NSString)bssid;
- (NSString)hotspotDeviceIdentifier;
- (NSString)originatorBundleIdentifier;
- (NSString)originatorName;
- (NSString)password;
- (NSString)previousPassword;
- (NSString)randomMACAddress;
- (NSString)ssid;
- (NSString)username;
- (WFMutableNetworkProfile)initWithNetwork:(id)a3;
- (__SecIdentity)TLSIdentity;
- (double)networkQualityResponsiveness;
- (id)HS20AccountName;
- (id)HS20Badge;
- (int64_t)securityMode;
- (int64_t)securityModeExt;
- (void)dealloc;
- (void)removePassword;
- (void)setAddedFromWiFiPasswordSharing:(BOOL)a3;
- (void)setAutoJoinEnabled:(BOOL)a3;
- (void)setAutoLoginEnabled:(BOOL)a3;
- (void)setBssid:(id)a3;
- (void)setCaptive:(BOOL)a3;
- (void)setCertificateChain:(id)a3;
- (void)setEnterpriseProfile:(id)a3;
- (void)setHS20Network:(BOOL)a3;
- (void)setHS20NetworkProvisioned:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHotspotDeviceIdentifier:(id)a3;
- (void)setInstantHotspotJoin:(BOOL)a3;
- (void)setIsInSaveDataMode:(BOOL)a3;
- (void)setIsPrivacyProxyEnabled:(BOOL)a3;
- (void)setLastAssociationDate:(id)a3;
- (void)setManaged:(BOOL)a3;
- (void)setNetworkQualityDate:(id)a3;
- (void)setNetworkQualityResponsiveness:(double)a3;
- (void)setOriginatorBundleIdentifier:(id)a3;
- (void)setOriginatorName:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPreviousPassword:(id)a3;
- (void)setRandomMACAddress:(id)a3;
- (void)setRandomMACAddressEnabled:(BOOL)a3;
- (void)setScanAttributes:(id)a3;
- (void)setSecurityMode:(int64_t)a3;
- (void)setSecurityModeExt:(int64_t)a3;
- (void)setSsid:(id)a3;
- (void)setTLSIdentity:(__SecIdentity *)a3;
- (void)setUserProvidedPassword:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation WFMutableNetworkProfile

+ (id)mutableProfileForNetwork:(id)a3
{
  id v3 = a3;
  v4 = [[WFMutableNetworkProfile alloc] initWithNetwork:v3];

  return v4;
}

- (WFMutableNetworkProfile)initWithNetwork:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFMutableNetworkProfile;
  v5 = [(WFNetworkProfile *)&v18 initWithNetwork:v4];
  if (v5)
  {
    v6 = [v4 ssid];

    if (v6)
    {
      uint64_t v7 = [v4 ssid];
      ssid = v5->_ssid;
      v5->_ssid = (NSString *)v7;

      v5->_securityMode = [v4 securityMode];
      v5->_securityModeExt = [v4 securityModeExt];
      uint64_t v9 = [v4 bssid];
      bssid = v5->_bssid;
      v5->_bssid = (NSString *)v9;

      uint64_t v11 = [v4 attributes];
      scanAttributes = v5->_scanAttributes;
      v5->_scanAttributes = (NSDictionary *)v11;

      uint64_t v13 = [(NSDictionary *)v5->_scanAttributes objectForKey:*MEMORY[0x263F55EA0]];
      enterpriseProfile = v5->_enterpriseProfile;
      v5->_enterpriseProfile = (NSDictionary *)v13;

      uint64_t v15 = WFUserNameFromEnterpriseProfile(v5->_enterpriseProfile);
      username = v5->_username;
      v5->_username = (NSString *)v15;
    }
  }

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
  v4.super_class = (Class)WFMutableNetworkProfile;
  [(WFNetworkProfile *)&v4 dealloc];
}

- (NSDictionary)enterpriseProfile
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  enterpriseProfile = self->_enterpriseProfile;
  if (enterpriseProfile)
  {
    objc_super v4 = enterpriseProfile;
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)WFMutableNetworkProfile;
    objc_super v4 = [(WFNetworkProfile *)&v34 enterpriseProfile];
  }
  v5 = v4;
  v6 = [(NSDictionary *)v4 objectForKey:@"EAPClientConfiguration"];
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = (void *)[v6 mutableCopy];
    if (self->_TLSIdentity)
    {
      uint64_t v9 = EAPSecIdentityHandleCreate();
      if (v9)
      {
        v10 = (const void *)v9;
        [v8 setObject:v9 forKey:@"TLSIdentityHandle"];
        CFRelease(v10);
      }
      else
      {
        uint64_t v11 = WFLogForCategory(0);
        os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
        {
          *(_DWORD *)buf = 136315138;
          v36 = "-[WFMutableNetworkProfile enterpriseProfile]";
          _os_log_impl(&dword_226071000, v11, v12, "%s: failed to create SecIdentity handle for identity", buf, 0xCu);
        }
      }
      uint64_t v13 = [v8 objectForKey:@"AcceptEAPTypes"];

      if (v13)
      {
        v14 = [v8 objectForKey:@"AcceptEAPTypes"];
        char v15 = [v14 containsObject:&unk_26D9E1AF8];

        if (v15)
        {
          v16 = WFLogForCategory(0);
          os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
          {
            *(_DWORD *)buf = 136315394;
            v36 = "-[WFMutableNetworkProfile enterpriseProfile]";
            __int16 v37 = 2112;
            v38 = v8;
            _os_log_impl(&dword_226071000, v16, v17, "%s: accept EAP types already present %@", buf, 0x16u);
          }
        }
        else
        {
          objc_super v18 = [v8 objectForKey:@"AcceptEAPTypes"];
          v19 = (void *)[v18 mutableCopy];

          [v19 addObject:&unk_26D9E1AF8];
          [v8 setObject:v19 forKey:@"AcceptEAPTypes"];
        }
      }
      else
      {
        [v8 setObject:&unk_26D9E2140 forKey:@"AcceptEAPTypes"];
      }
    }
  }
  else
  {
    v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v20 = [(WFMutableNetworkProfile *)self certificateChain];

  if (v5) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21)
  {
    v22 = [(WFMutableNetworkProfile *)self certificateChain];
    [v8 setObject:v22 forKey:@"TLSUserTrustProceedCertificateChain"];

    [v8 setObject:MEMORY[0x263EFFA88] forKey:@"TLSSaveTrustExceptions"];
  }
  v23 = [(WFMutableNetworkProfile *)self username];
  if ([v23 length])
  {
  }
  else
  {
    v24 = [(WFMutableNetworkProfile *)self password];
    uint64_t v25 = [v24 length];

    if (!v25) {
      goto LABEL_35;
    }
  }
  v26 = [(WFMutableNetworkProfile *)self username];
  uint64_t v27 = [v26 length];

  if (v27)
  {
    v28 = [(WFMutableNetworkProfile *)self username];
    [v8 setObject:v28 forKey:@"UserName"];
  }
  v29 = [(WFMutableNetworkProfile *)self password];
  uint64_t v30 = [v29 length];

  if (v30)
  {
    v31 = [(WFMutableNetworkProfile *)self password];
    [v8 setObject:v31 forKey:@"UserPassword"];
  }
LABEL_35:
  if ([v8 count])
  {
    v32 = (NSDictionary *)[(NSDictionary *)v5 mutableCopy];
    [(NSDictionary *)v32 setObject:v8 forKey:@"EAPClientConfiguration"];

    v5 = v32;
  }

  return v5;
}

- (void)removePassword
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[WFMutableNetworkProfile removePassword]";
    __int16 v14 = 2112;
    char v15 = self;
    _os_log_impl(&dword_226071000, v3, v4, "%s: removing password for %@", (uint8_t *)&v12, 0x16u);
  }

  v5 = [(WFMutableNetworkProfile *)self password];

  if (!v5)
  {
    uint64_t v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v9 || !os_log_type_enabled(v9, v10)) {
      goto LABEL_23;
    }
    int v12 = 136315394;
    uint64_t v13 = "-[WFMutableNetworkProfile removePassword]";
    __int16 v14 = 2112;
    char v15 = self;
    uint64_t v11 = "%s: no password to remove for profile %@";
    goto LABEL_22;
  }
  [(WFMutableNetworkProfile *)self setPassword:0];
  v6 = [(WFMutableNetworkProfile *)self scanAttributes];

  if (!v6)
  {
    uint64_t v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v9 || !os_log_type_enabled(v9, v10)) {
      goto LABEL_23;
    }
    int v12 = 136315394;
    uint64_t v13 = "-[WFMutableNetworkProfile removePassword]";
    __int16 v14 = 2112;
    char v15 = self;
    uint64_t v11 = "%s: missing network attributes for profile %@";
    goto LABEL_22;
  }
  uint64_t v7 = [(WFMutableNetworkProfile *)self scanAttributes];
  v8 = (const void *)WiFiNetworkCreate();

  if (!v8)
  {
    uint64_t v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v9 || !os_log_type_enabled(v9, v10)) {
      goto LABEL_23;
    }
    int v12 = 136315394;
    uint64_t v13 = "-[WFMutableNetworkProfile removePassword]";
    __int16 v14 = 2112;
    char v15 = self;
    uint64_t v11 = "%s: failed to create network for profile %@";
LABEL_22:
    _os_log_impl(&dword_226071000, v9, v10, v11, (uint8_t *)&v12, 0x16u);
LABEL_23:

    return;
  }
  WiFiNetworkRemovePassword();
  CFRelease(v8);
}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  TLSIdentity = self->_TLSIdentity;
  if (TLSIdentity) {
    CFRelease(TLSIdentity);
  }
  self->_TLSIdentity = a3;
  if (a3)
  {
    CFRetain(a3);
  }
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

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
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

- (void)setEnterpriseProfile:(id)a3
{
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (void)setCertificateChain:(id)a3
{
}

- (NSDictionary)scanAttributes
{
  return self->_scanAttributes;
}

- (void)setScanAttributes:(id)a3
{
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (BOOL)isAdhoc
{
  return self->_adhoc;
}

- (BOOL)isCaptive
{
  return self->_captive;
}

- (void)setCaptive:(BOOL)a3
{
  self->_captive = a3;
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

- (void)setAutoLoginEnabled:(BOOL)a3
{
  self->_autoLoginEnabled = a3;
}

- (BOOL)isInSaveDataMode
{
  return self->_isInSaveDataMode;
}

- (void)setIsInSaveDataMode:(BOOL)a3
{
  self->_isInSaveDataMode = a3;
}

- (BOOL)isPrivacyProxyEnabled
{
  return self->_isPrivacyProxyEnabled;
}

- (void)setIsPrivacyProxyEnabled:(BOOL)a3
{
  self->_isPrivacyProxyEnabled = a3;
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
  return self->_networkQualityDate;
}

- (void)setNetworkQualityDate:(id)a3
{
}

- (NSDate)lastAssociationDate
{
  return self->_lastAssociationDate;
}

- (void)setLastAssociationDate:(id)a3
{
}

- (__SecIdentity)TLSIdentity
{
  return self->_TLSIdentity;
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

- (id)HS20AccountName
{
  return self->_HS20AccountName;
}

- (id)HS20Badge
{
  return self->_HS20Badge;
}

- (BOOL)userProvidedPassword
{
  return self->_userProvidedPassword;
}

- (void)setUserProvidedPassword:(BOOL)a3
{
  self->_userProvidedPassword = a3;
}

- (NSString)previousPassword
{
  return self->_previousPassword;
}

- (void)setPreviousPassword:(id)a3
{
}

- (BOOL)isPersonalHotspot
{
  return self->_personalHotspot;
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
  self->_randomMACAddressEnabled = a3;
}

- (BOOL)wasAddedFromWiFiPasswordSharing
{
  return self->_addedFromWiFiPasswordSharing;
}

- (void)setAddedFromWiFiPasswordSharing:(BOOL)a3
{
  self->_addedFromWiFiPasswordSharing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_hotspotDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_previousPassword, 0);
  objc_storeStrong((id *)&self->_HS20Badge, 0);
  objc_storeStrong((id *)&self->_HS20AccountName, 0);
  objc_storeStrong((id *)&self->_originatorName, 0);
  objc_storeStrong((id *)&self->_originatorBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastAssociationDate, 0);
  objc_storeStrong((id *)&self->_networkQualityDate, 0);
  objc_storeStrong((id *)&self->_scanAttributes, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
  objc_storeStrong((id *)&self->_enterpriseProfile, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end