@interface WFNetworkScanRecord
- (BOOL)_isEqualToHotspotDevice:(id)a3;
- (BOOL)_isEqualToNetwork:(id)a3;
- (BOOL)canBeDisplayedAsCurrent;
- (BOOL)cellularSlicingIsEnabled;
- (BOOL)iOSHotspot;
- (BOOL)instantHotspot;
- (BOOL)isAdhoc;
- (BOOL)isAirPortBaseStation;
- (BOOL)isAmbiguousSSID;
- (BOOL)isCarPlay;
- (BOOL)isCloudSyncable;
- (BOOL)isEnterprise;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentRecord:(id)a3;
- (BOOL)isHidden;
- (BOOL)isHotspot20;
- (BOOL)isHotspot20Provisioned;
- (BOOL)isInstantHotspot;
- (BOOL)isKnown;
- (BOOL)isNetworkSecurityModeMatch:(int64_t)a3;
- (BOOL)isPopular;
- (BOOL)isPrivateMACDisabledByProfile;
- (BOOL)isRandomMACAddressEnabled;
- (BOOL)isSecure;
- (BOOL)isSupervised;
- (BOOL)isUnconfiguredAccessory;
- (BOOL)isUnconfiguredAccessorySTAOnly;
- (BOOL)prominentDisplay;
- (BOOL)requiresPassword;
- (BOOL)requiresUsername;
- (BOOL)shouldShowInKnownNetworkList;
- (BOOL)shouldShowInMyNetworkList;
- (BOOL)supportsJoinFailureDiagnostics;
- (BOOL)supportsWiFiHealth;
- (CWFNetworkProfile)matchingKnownNetworkProfile;
- (CWFScanResult)scanResult;
- (NSDictionary)attributes;
- (NSDictionary)eapProfile;
- (NSNumber)channel;
- (NSNumber)channelWidth;
- (NSString)bssid;
- (NSString)crowdsourceDescription;
- (NSString)description;
- (NSString)hotspot20Name;
- (NSString)hotspotPluginLabel;
- (NSString)randomMACAddress;
- (NSString)ssid;
- (NSString)unconfiguredDeviceID;
- (NSString)unconfiguredDeviceName;
- (WFNetworkScanRecord)init;
- (WFNetworkScanRecord)initWithCoreWiFiProfile:(id)a3;
- (WFNetworkScanRecord)initWithNetworkRef:(__WiFiNetwork *)a3;
- (WFNetworkScanRecord)initWithScanResults:(id)a3;
- (WFPrivateAddressConfig)privateAddressConfig;
- (float)scaledRSSI;
- (id)configurationIssues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hotspotBatteryLife;
- (id)hotspotCellularProtocol;
- (id)hotspotSignalStrength;
- (id)lastJoinedDate;
- (id)securityIssue;
- (id)subtitle;
- (id)title;
- (int64_t)carPlayType;
- (int64_t)compare:(id)a3;
- (int64_t)rssi;
- (int64_t)securityMode;
- (int64_t)securityModeExt;
- (int64_t)type;
- (int64_t)unconfiguredAccessoryType;
- (unint64_t)hash;
- (unint64_t)obsoleteNetworkCipherType;
- (unint64_t)privateAddressMode;
- (unint64_t)signalBars;
- (unsigned)phyMode;
- (void)populatePrivateAddressConfig:(id)a3;
- (void)setAdhoc:(BOOL)a3;
- (void)setAirPortBaseStation:(BOOL)a3;
- (void)setAmbiguousSSID:(BOOL)a3;
- (void)setAttributes:(id)a3;
- (void)setBssid:(id)a3;
- (void)setCarPlay:(BOOL)a3;
- (void)setCarPlayType:(int64_t)a3;
- (void)setChannel:(id)a3;
- (void)setCrowdsourceDescription:(id)a3;
- (void)setEapProfile:(id)a3;
- (void)setEnterprise:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHotspot20:(BOOL)a3;
- (void)setHotspot20Name:(id)a3;
- (void)setHotspot20Provisioned:(BOOL)a3;
- (void)setHotspotPluginLabel:(id)a3;
- (void)setIOSHotspot:(BOOL)a3;
- (void)setInstantHotspot:(BOOL)a3;
- (void)setKnown:(BOOL)a3;
- (void)setMatchingKnownNetworkProfile:(id)a3;
- (void)setPhyMode:(unsigned int)a3;
- (void)setPopular:(BOOL)a3;
- (void)setPrivateAddressConfig:(id)a3;
- (void)setPrivateAddressMode:(unint64_t)a3;
- (void)setProminentDisplay:(BOOL)a3;
- (void)setRandomMACAddress:(id)a3;
- (void)setRandomMACAddressEnabled:(BOOL)a3;
- (void)setRequiresPassword:(BOOL)a3;
- (void)setRequiresUsername:(BOOL)a3;
- (void)setRssi:(int64_t)a3;
- (void)setScaledRSSI:(float)a3;
- (void)setScanResult:(id)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSecurityMode:(int64_t)a3;
- (void)setSecurityModeExt:(int64_t)a3;
- (void)setSsid:(id)a3;
- (void)setUnconfiguredAccessory:(BOOL)a3;
- (void)setUnconfiguredAccessorySTAOnly:(BOOL)a3;
- (void)setUnconfiguredAccessoryType:(int64_t)a3;
- (void)setUnconfiguredDeviceID:(id)a3;
- (void)setUnconfiguredDeviceName:(id)a3;
@end

@implementation WFNetworkScanRecord

- (BOOL)_isEqualToNetwork:(id)a3
{
  id v4 = a3;
  v5 = [(WFNetworkScanRecord *)self ssid];
  v6 = [v4 ssid];
  if (![v5 isEqualToString:v6]
    || !-[WFNetworkScanRecord isNetworkSecurityModeMatch:](self, "isNetworkSecurityModeMatch:", [v4 securityModeExt]))
  {

    goto LABEL_9;
  }
  int v7 = [v4 isCarPlay];
  int v8 = [(WFNetworkScanRecord *)self isCarPlay];

  if (v7 != v8)
  {
LABEL_9:
    BOOL v13 = 0;
    goto LABEL_10;
  }
  v9 = [(WFNetworkScanRecord *)self randomMACAddress];
  if (v9 || ([v4 randomMACAddress], (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = [(WFNetworkScanRecord *)self randomMACAddress];
    v11 = [v4 randomMACAddress];
    char v12 = [v10 isEqualToString:v11];

    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
    char v12 = 1;
  }

LABEL_13:
  unint64_t v15 = [(WFNetworkScanRecord *)self privateAddressMode];
  if (v15 == [v4 privateAddressMode]) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }
LABEL_10:

  return v13;
}

- (BOOL)isCarPlay
{
  return self->_carPlay;
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (unint64_t)privateAddressMode
{
  return self->_privateAddressMode;
}

- (WFNetworkScanRecord)initWithScanResults:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)WFNetworkScanRecord;
  v5 = [(WFNetworkScanRecord *)&v70 init];
  if (!v5)
  {
    v20 = 0;
    v30 = 0;
    v28 = 0;
    v59 = 0;
    goto LABEL_45;
  }
  if (!v4)
  {
    v66 = WFLogForCategory(0);
    os_log_type_t v67 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v66 && os_log_type_enabled(v66, v67))
    {
      *(_DWORD *)buf = 136315138;
      v72 = "-[WFNetworkScanRecord initWithScanResults:]";
      _os_log_impl(&dword_226071000, v66, v67, "%s: nil scan result", buf, 0xCu);
    }

    WFErrorLogCurrentCallStackThread(0, 3);
    goto LABEL_60;
  }
  uint64_t v6 = [v4 copy];
  scanResult = v5->_scanResult;
  v5->_scanResult = (CWFScanResult *)v6;

  uint64_t v8 = [v4 networkName];
  ssid = v5->_ssid;
  v5->_ssid = (NSString *)v8;

  if (!v5->_ssid)
  {
    v68 = WFLogForCategory(0);
    os_log_type_t v69 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v68 && os_log_type_enabled(v68, v69))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[WFNetworkScanRecord initWithScanResults:]";
      __int16 v73 = 2112;
      id v74 = v4;
      _os_log_impl(&dword_226071000, v68, v69, "%s: nil SSID for %@", buf, 0x16u);
    }

LABEL_60:
    v20 = 0;
    v30 = 0;
    v28 = 0;
    v59 = v5;
    v5 = 0;
    goto LABEL_45;
  }
  v5->_hidden = [v4 isHidden];
  uint64_t v10 = [v4 BSSID];
  bssid = v5->_bssid;
  v5->_bssid = (NSString *)v10;

  v5->_requiresPassword = [v4 requiresPassword];
  v5->_requiresUsername = [v4 requiresUsername];
  v5->_iOSHotspot = [v4 isPersonalHotspot];
  v5->_carPlay = [v4 isCarPlay];
  v5->_adhoc = [v4 isIBSS];
  v5->_enterprise = [v4 isEAP];
  v5->_phyMode = [v4 phyMode];
  v5->_ambiguousSSID = [v4 isSSIDAmbiguous];
  char v12 = NSNumber;
  BOOL v13 = [v4 channel];
  uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "channel"));
  channel = v5->_channel;
  v5->_channel = (NSNumber *)v14;

  v16 = NSNumber;
  v17 = [v4 channel];
  uint64_t v18 = objc_msgSend(v16, "numberWithUnsignedInt:", objc_msgSend(v17, "width"));
  channelWidth = v5->_channelWidth;
  v5->_channelWidth = (NSNumber *)v18;

  v5->_hotspot20 = [v4 isPasspoint];
  v20 = [v4 scanRecord];
  int v21 = [MEMORY[0x263F24AF0] isUnconfiguredDevice:v20];
  v5->_unconfiguredAccessory = v21;
  if (v21)
  {
    uint64_t v22 = [MEMORY[0x263F24AF0] unconfiguredDeviceName:v20];
    p_unconfiguredDeviceName = (void **)&v5->_unconfiguredDeviceName;
    unconfiguredDeviceName = v5->_unconfiguredDeviceName;
    v5->_unconfiguredDeviceName = (NSString *)v22;

    if ([MEMORY[0x263F24AF0] isHomeKitSecureWACDevice:v20])
    {
      v5->_unconfiguredAccessoryType = 4;
      objc_storeStrong((id *)&v5->_unconfiguredDeviceName, v5->_ssid);
    }
    else
    {
      if ([MEMORY[0x263F24AF0] isAirPlayDevice:v20])
      {
        uint64_t v25 = 2;
      }
      else
      {
        if (![MEMORY[0x263F24AF0] isGenericMFiAccessory:v20])
        {
          v5->_unconfiguredAccessoryType = 1;
          if (v5->_unconfiguredDeviceName && v5->_bssid)
          {
            uint64_t v64 = objc_msgSend(MEMORY[0x263F24AF0], "uniqueBaseStationName:withBssid:");
            v65 = *p_unconfiguredDeviceName;
            *p_unconfiguredDeviceName = (void *)v64;
          }
          goto LABEL_13;
        }
        uint64_t v25 = 3;
      }
      v5->_unconfiguredAccessoryType = v25;
    }
LABEL_13:
    v5->_unconfiguredAccessorySTAOnly = [MEMORY[0x263F24AF0] isSTAOnlyDevice:v20];
    uint64_t v26 = [MEMORY[0x263F24AF0] unconfiguredDeviceID:v20];
    unconfiguredDeviceID = v5->_unconfiguredDeviceID;
    v5->_unconfiguredDeviceID = (NSString *)v26;

    goto LABEL_14;
  }
  v5->_unconfiguredAccessoryType = 0;
LABEL_14:
  v28 = [v4 privateAddressConfigDictionary];
  v29 = [v4 privateAddressInfoDictionary];
  v30 = v29;
  if (v29)
  {
    v31 = [v29 objectForKey:*MEMORY[0x263F55EF8]];
    v5->_supervised = [v31 BOOLValue];

    v32 = [v30 objectForKey:*MEMORY[0x263F55F20]];
    v5->_privateMACDisabledByProfile = [v32 BOOLValue];
  }
  if (v28)
  {
    CFDataRef v33 = (const __CFData *)[v28 objectForKey:@"PRIVATE_MAC_ADDRESS_VALUE"];
    if (v33)
    {
      uint64_t v34 = WFConvertEthernetNetworkAddressToString(v33);
      randomMACAddress = v5->_randomMACAddress;
      v5->_randomMACAddress = (NSString *)v34;
    }
    int v36 = objc_msgSend((id)objc_msgSend(v28, "objectForKey:", @"PRIVATE_MAC_ADDRESS_TYPE"), "intValue");
    v5->_privateAddressMode = v36;
    v5->_randomMACAddressEnabled = v36 == 2;
  }
  else
  {
    v5->_randomMACAddressEnabled = 0;
  }
  v5->_rssi = [v4 RSSI];
  v37 = [v20 objectForKey:@"ScaledRSSI"];

  if (v37)
  {
    v38 = [v20 objectForKey:@"ScaledRSSI"];
    [v38 floatValue];
    v5->_scaledRSSI = v39;
  }
  else
  {
    v5->_scaledRSSI = WFScaleRSSI(v5->_rssi);
  }
  uint64_t v40 = WFSecurityModeFromScanDictionary(v20, &v5->_securityModeExt);
  v5->_securityMode = v40;
  BOOL v41 = (v40 | 0x800) != 0x800 || [v4 WAPISubtype] == 2 || objc_msgSend(v4, "WAPISubtype") == 1;
  if (v5->_iOSHotspot) {
    BOOL v41 = 1;
  }
  v5->_secure = v41;
  v5->_obsoleteNetworkCipherType = WFDetermineNetworkCipherTypeObsolete(v20);
  v5->_airPortBaseStation = [v4 airPortBaseStationModel] != 0;
  v5->_prominentDisplay = 1;
  objc_storeStrong((id *)&v5->_attributes, v20);
  v42 = [v4 OSSpecificAttributes];
  v43 = [v42 objectForKey:*MEMORY[0x263F55E88]];
  int v44 = [v43 intValue];

  if (v44)
  {
    v45 = (void *)v44;
    v46 = WFLogForCategory(0);
    os_log_type_t v47 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v46)
    {
      v48 = v46;
      if (os_log_type_enabled(v48, v47))
      {
        v49 = [v4 networkName];
        *(_DWORD *)buf = 138412546;
        v72 = v49;
        __int16 v73 = 2048;
        id v74 = v45;
        _os_log_impl(&dword_226071000, v48, v47, "Popularity for network: %@ is %lu", buf, 0x16u);
      }
    }

    uint64_t v50 = objc_msgSend(NSString, "stringWithFormat:", @"Score %lu", v45);
    crowdsourceDescription = v5->_crowdsourceDescription;
    v5->_crowdsourceDescription = (NSString *)v50;
  }
  else
  {
    crowdsourceDescription = v5->_crowdsourceDescription;
    v5->_crowdsourceDescription = (NSString *)&stru_26D9BFD58;
  }

  v52 = [v4 OSSpecificAttributes];
  v53 = [v52 objectForKey:*MEMORY[0x263F55E78]];
  if ([v53 BOOLValue])
  {
    v5->_known = 1;
  }
  else
  {
    v54 = [v4 matchingKnownNetworkProfile];
    v5->_known = v54 != 0;
  }
  v55 = [v4 OSSpecificAttributes];
  v56 = [v55 objectForKey:*MEMORY[0x263F55E80]];
  v5->_popular = [v56 BOOLValue];

  if (v5->_popular && v5->_enterprise) {
    v5->_popular = 0;
  }
  v57 = [[WFPrivateAddressConfig alloc] initWithPrivateAddressConfigDictionary:v30 ssid:v5->_ssid];
  privateAddressConfig = v5->_privateAddressConfig;
  v5->_privateAddressConfig = v57;

  v59 = [v4 matchingKnownNetworkProfile];
  uint64_t v60 = [v59 copy];
  matchingKnownNetworkProfile = v5->_matchingKnownNetworkProfile;
  v5->_matchingKnownNetworkProfile = (CWFNetworkProfile *)v60;

LABEL_45:
  v62 = v5;

  return v62;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNetworkRef:0];
  if (v5)
  {
    objc_msgSend(v5, "setHidden:", -[WFNetworkScanRecord isHidden](self, "isHidden"));
    objc_msgSend(v5, "setSecure:", -[WFNetworkScanRecord isSecure](self, "isSecure"));
    objc_msgSend(v5, "setCarPlay:", -[WFNetworkScanRecord isCarPlay](self, "isCarPlay"));
    objc_msgSend(v5, "setIOSHotspot:", -[WFNetworkScanRecord iOSHotspot](self, "iOSHotspot"));
    objc_msgSend(v5, "setRequiresPassword:", -[WFNetworkScanRecord requiresPassword](self, "requiresPassword"));
    objc_msgSend(v5, "setRequiresUsername:", -[WFNetworkScanRecord requiresUsername](self, "requiresUsername"));
    objc_msgSend(v5, "setAdhoc:", -[WFNetworkScanRecord isAdhoc](self, "isAdhoc"));
    objc_msgSend(v5, "setEnterprise:", -[WFNetworkScanRecord isEnterprise](self, "isEnterprise"));
    objc_msgSend(v5, "setUnconfiguredAccessory:", -[WFNetworkScanRecord isUnconfiguredAccessory](self, "isUnconfiguredAccessory"));
    objc_msgSend(v5, "setHotspot20:", -[WFNetworkScanRecord isHotspot20](self, "isHotspot20"));
    objc_msgSend(v5, "setAmbiguousSSID:", -[WFNetworkScanRecord isAmbiguousSSID](self, "isAmbiguousSSID"));
    objc_msgSend(v5, "setAirPortBaseStation:", -[WFNetworkScanRecord isAirPortBaseStation](self, "isAirPortBaseStation"));
    objc_msgSend(v5, "setCarPlayType:", -[WFNetworkScanRecord carPlayType](self, "carPlayType"));
    objc_msgSend(v5, "setUnconfiguredAccessoryType:", -[WFNetworkScanRecord unconfiguredAccessoryType](self, "unconfiguredAccessoryType"));
    objc_msgSend(v5, "setUnconfiguredAccessorySTAOnly:", -[WFNetworkScanRecord isUnconfiguredAccessorySTAOnly](self, "isUnconfiguredAccessorySTAOnly"));
    objc_msgSend(v5, "setRssi:", -[WFNetworkScanRecord rssi](self, "rssi"));
    objc_msgSend(v5, "setSecurityMode:", -[WFNetworkScanRecord securityMode](self, "securityMode"));
    [(WFNetworkScanRecord *)self scaledRSSI];
    objc_msgSend(v5, "setScaledRSSI:");
    objc_msgSend(v5, "setPhyMode:", -[WFNetworkScanRecord phyMode](self, "phyMode"));
    uint64_t v6 = [(WFNetworkScanRecord *)self ssid];
    int v7 = (void *)[v6 copyWithZone:a3];
    [v5 setSsid:v7];

    uint64_t v8 = [(WFNetworkScanRecord *)self bssid];
    v9 = (void *)[v8 copyWithZone:a3];
    [v5 setBssid:v9];

    uint64_t v10 = [(WFNetworkScanRecord *)self channel];
    v11 = (void *)[v10 copyWithZone:a3];
    [v5 setChannel:v11];

    char v12 = [(WFNetworkScanRecord *)self eapProfile];
    BOOL v13 = (void *)[v12 copyWithZone:a3];
    [v5 setEapProfile:v13];

    uint64_t v14 = [(WFNetworkScanRecord *)self attributes];
    unint64_t v15 = (void *)[v14 copyWithZone:a3];
    [v5 setAttributes:v15];

    v16 = [(WFNetworkScanRecord *)self unconfiguredDeviceName];
    v17 = (void *)[v16 copyWithZone:a3];
    [v5 setUnconfiguredDeviceName:v17];

    uint64_t v18 = [(WFNetworkScanRecord *)self unconfiguredDeviceID];
    v19 = (void *)[v18 copyWithZone:a3];
    [v5 setUnconfiguredDeviceID:v19];

    v20 = [(WFNetworkScanRecord *)self hotspotPluginLabel];
    int v21 = (void *)[v20 copyWithZone:a3];
    [v5 setHotspotPluginLabel:v21];

    uint64_t v22 = [(WFNetworkScanRecord *)self hotspot20Name];
    v23 = (void *)[v22 copyWithZone:a3];
    [v5 setHotspot20Name:v23];

    objc_msgSend(v5, "setSecurityModeExt:", -[WFNetworkScanRecord securityModeExt](self, "securityModeExt"));
    v24 = [(WFNetworkScanRecord *)self randomMACAddress];
    uint64_t v25 = (void *)[v24 copyWithZone:a3];
    [v5 setRandomMACAddress:v25];

    objc_msgSend(v5, "setPrivateAddressMode:", -[WFNetworkScanRecord privateAddressMode](self, "privateAddressMode"));
    objc_msgSend(v5, "setRandomMACAddressEnabled:", -[WFNetworkScanRecord isRandomMACAddressEnabled](self, "isRandomMACAddressEnabled"));
    uint64_t v26 = [(WFNetworkScanRecord *)self privateAddressConfig];
    v27 = (void *)[v26 copyWithZone:a3];
    [v5 setPrivateAddressConfig:v27];

    v28 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
    v29 = (void *)[v28 copyWithZone:a3];
    [v5 setMatchingKnownNetworkProfile:v29];
  }
  return v5;
}

- (CWFNetworkProfile)matchingKnownNetworkProfile
{
  return self->_matchingKnownNetworkProfile;
}

- (void)setMatchingKnownNetworkProfile:(id)a3
{
}

- (NSString)unconfiguredDeviceName
{
  return self->_unconfiguredDeviceName;
}

- (NSString)unconfiguredDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (int64_t)unconfiguredAccessoryType
{
  return self->_unconfiguredAccessoryType;
}

- (void)setUnconfiguredDeviceName:(id)a3
{
}

- (void)setUnconfiguredDeviceID:(id)a3
{
}

- (void)setUnconfiguredAccessoryType:(int64_t)a3
{
  self->_unconfiguredAccessoryType = a3;
}

- (void)setUnconfiguredAccessorySTAOnly:(BOOL)a3
{
  self->_unconfiguredAccessorySTAOnly = a3;
}

- (void)setUnconfiguredAccessory:(BOOL)a3
{
  self->_unconfiguredAccessory = a3;
}

- (void)setSsid:(id)a3
{
}

- (void)setSecurityModeExt:(int64_t)a3
{
  self->_securityModeExt = a3;
}

- (void)setSecurityMode:(int64_t)a3
{
  self->_securityMode = a3;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (void)setScaledRSSI:(float)a3
{
  self->_scaledRSSI = a3;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (void)setRequiresUsername:(BOOL)a3
{
  self->_requiresUsername = a3;
}

- (void)setRequiresPassword:(BOOL)a3
{
  self->_requiresPassword = a3;
}

- (void)setRandomMACAddressEnabled:(BOOL)a3
{
  self->_randomMACAddressEnabled = a3;
}

- (void)setRandomMACAddress:(id)a3
{
}

- (void)setPrivateAddressMode:(unint64_t)a3
{
  self->_privateAddressMode = a3;
}

- (void)setPrivateAddressConfig:(id)a3
{
}

- (void)setPhyMode:(unsigned int)a3
{
  self->_phyMode = a3;
}

- (void)setIOSHotspot:(BOOL)a3
{
  self->_iOSHotspot = a3;
}

- (void)setHotspotPluginLabel:(id)a3
{
}

- (void)setHotspot20Name:(id)a3
{
}

- (void)setHotspot20:(BOOL)a3
{
  self->_hotspot20 = a3;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void)setEnterprise:(BOOL)a3
{
  self->_enterprise = a3;
}

- (void)setEapProfile:(id)a3
{
}

- (void)setChannel:(id)a3
{
}

- (void)setCarPlayType:(int64_t)a3
{
  self->_carPlayType = a3;
}

- (void)setCarPlay:(BOOL)a3
{
  self->_carPlay = a3;
}

- (void)setBssid:(id)a3
{
}

- (void)setAttributes:(id)a3
{
}

- (void)setAmbiguousSSID:(BOOL)a3
{
  self->_ambiguousSSID = a3;
}

- (void)setAirPortBaseStation:(BOOL)a3
{
  self->_airPortBaseStation = a3;
}

- (void)setAdhoc:(BOOL)a3
{
  self->_adhoc = a3;
}

- (int64_t)securityMode
{
  return self->_securityMode;
}

- (float)scaledRSSI
{
  return self->_scaledRSSI;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (BOOL)requiresUsername
{
  return self->_requiresUsername;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (WFPrivateAddressConfig)privateAddressConfig
{
  return self->_privateAddressConfig;
}

- (unsigned)phyMode
{
  return self->_phyMode;
}

- (BOOL)isUnconfiguredAccessory
{
  return self->_unconfiguredAccessory;
}

- (BOOL)isUnconfiguredAccessorySTAOnly
{
  return self->_unconfiguredAccessorySTAOnly;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (BOOL)isRandomMACAddressEnabled
{
  return self->_randomMACAddressEnabled;
}

- (BOOL)isHotspot20
{
  return self->_hotspot20;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isEnterprise
{
  return self->_enterprise;
}

- (BOOL)isAmbiguousSSID
{
  return self->_ambiguousSSID;
}

- (BOOL)isAirPortBaseStation
{
  return self->_airPortBaseStation;
}

- (BOOL)isAdhoc
{
  return self->_adhoc;
}

- (WFNetworkScanRecord)initWithNetworkRef:(__WiFiNetwork *)a3
{
  v52.receiver = self;
  v52.super_class = (Class)WFNetworkScanRecord;
  id v4 = [(WFNetworkScanRecord *)&v52 init];
  v5 = v4;
  uint64_t v6 = 0;
  int v7 = 0;
  uint64_t v8 = 0;
  v9 = 0;
  if (!a3 || !v4) {
    goto LABEL_41;
  }
  v4->_hidden = WiFiNetworkGetDirectedState() != 0;
  uint64_t v10 = WiFiNetworkGetSSID();
  ssid = v5->_ssid;
  v5->_ssid = (NSString *)v10;

  uint64_t v12 = WiFiNetworkGetProperty();
  bssid = v5->_bssid;
  v5->_bssid = (NSString *)v12;

  v5->_requiresPassword = WiFiNetworkRequiresPassword() != 0;
  v5->_requiresUsername = WiFiNetworkRequiresUsername() != 0;
  v5->_iOSHotspot = WiFiNetworkIsApplePersonalHotspot() != 0;
  v5->_carPlay = WiFiNetworkIsCarPlay() != 0;
  int Type = WiFiNetworkGetType();
  if (v5->_carPlay && (Type - 1) <= 1)
  {
    uint64_t v15 = 1;
    if (Type == 2) {
      uint64_t v15 = 2;
    }
    v5->_carPlayint Type = v15;
  }
  v9 = WiFiNetworkGetProperty();
  if (v9) {
    objc_storeStrong((id *)&v5->_eapProfile, v9);
  }
  v5->_adhoc = WiFiNetworkIsAdHoc() != 0;
  v5->_enterprise = WFWiFiNetworkRefIsEnterprise();
  v5->_phyMode = WiFiNetworkGetPhyMode();
  v5->_ambiguousSSID = WiFiNetworkIsSSIDAmbiguous() != 0;
  uint64_t v16 = WiFiNetworkGetChannel();
  channel = v5->_channel;
  v5->_channel = (NSNumber *)v16;

  uint64_t v18 = [NSNumber numberWithUnsignedShort:WiFiNetworkGetChannelWidthInMHz()];
  channelWidth = v5->_channelWidth;
  v5->_channelWidth = (NSNumber *)v18;

  v5->_hotspot20 = WiFiNetworkIsHotspot20() != 0;
  uint64_t v6 = (void *)WiFiNetworkCopyRecord();
  int v20 = [MEMORY[0x263F24AF0] isUnconfiguredDevice:v6];
  v5->_unconfiguredAccessory = v20;
  if (v20)
  {
    uint64_t v21 = [MEMORY[0x263F24AF0] unconfiguredDeviceName:v6];
    p_unconfiguredDeviceName = (void **)&v5->_unconfiguredDeviceName;
    unconfiguredDeviceName = v5->_unconfiguredDeviceName;
    v5->_unconfiguredDeviceName = (NSString *)v21;

    if ([MEMORY[0x263F24AF0] isHomeKitSecureWACDevice:v6])
    {
      v5->_unconfiguredAccessoryint Type = 4;
      objc_storeStrong((id *)&v5->_unconfiguredDeviceName, v5->_ssid);
    }
    else
    {
      if ([MEMORY[0x263F24AF0] isAirPlayDevice:v6])
      {
        uint64_t v24 = 2;
      }
      else
      {
        if (![MEMORY[0x263F24AF0] isGenericMFiAccessory:v6])
        {
          v5->_unconfiguredAccessoryint Type = 1;
          if (v5->_bssid)
          {
            uint64_t v48 = WiFiNetworkGetProperty();
            v49 = (void *)v48;
            if (*p_unconfiguredDeviceName && v48)
            {
              uint64_t v50 = objc_msgSend(MEMORY[0x263F24AF0], "uniqueBaseStationName:withBssid:");
              v51 = *p_unconfiguredDeviceName;
              *p_unconfiguredDeviceName = (void *)v50;
            }
          }
          goto LABEL_19;
        }
        uint64_t v24 = 3;
      }
      v5->_unconfiguredAccessoryint Type = v24;
    }
LABEL_19:
    v5->_unconfiguredAccessorySTAOnly = [MEMORY[0x263F24AF0] isSTAOnlyDevice:v6];
    uint64_t v25 = [MEMORY[0x263F24AF0] unconfiguredDeviceID:v6];
    unconfiguredDeviceID = v5->_unconfiguredDeviceID;
    v5->_unconfiguredDeviceID = (NSString *)v25;

    goto LABEL_20;
  }
  v5->_unconfiguredAccessoryint Type = 0;
LABEL_20:
  int v7 = WiFiNetworkGetProperty();
  v27 = [v7 objectForKey:*MEMORY[0x263F55EF8]];
  v5->_supervised = [v27 BOOLValue];

  v28 = [v7 objectForKey:*MEMORY[0x263F55F20]];
  v5->_privateMACDisabledByProfile = [v28 BOOLValue];

  v29 = [v6 objectForKey:@"PRIVATE_MAC_ADDRESS"];
  uint64_t v8 = v29;
  if (v29)
  {
    CFDataRef v30 = (const __CFData *)[v29 objectForKey:@"PRIVATE_MAC_ADDRESS_VALUE"];
    if (v30)
    {
      uint64_t v31 = WFConvertEthernetNetworkAddressToString(v30);
      randomMACAddress = v5->_randomMACAddress;
      v5->_randomMACAddress = (NSString *)v31;
    }
    int v33 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"PRIVATE_MAC_ADDRESS_TYPE"), "intValue");
    v5->_privateAddressMode = v33;
    v5->_randomMACAddressEnabled = v33 == 2;
  }
  else
  {
    v5->_randomMACAddressEnabled = 0;
  }
  uint64_t v34 = [v6 objectForKey:@"RSSI"];
  v5->_rssi = [v34 integerValue];

  v35 = [v6 objectForKey:@"ScaledRSSI"];

  if (v35)
  {
    int v36 = [v6 objectForKey:@"ScaledRSSI"];
    [v36 floatValue];
    v5->_scaledRSSI = v37;
  }
  else
  {
    v5->_scaledRSSI = WFScaleRSSI(v5->_rssi);
  }
  uint64_t v38 = WFSecurityModeFromScanDictionary(v6, &v5->_securityModeExt);
  v5->_securityMode = v38;
  BOOL v39 = (v38 | 0x800) != 0x800 || WiFiNetworkIsWAPICERT() || WiFiNetworkIsWAPIPSK() != 0;
  v5->_secure = v39;
  v5->_obsoleteNetworkCipherint Type = WFDetermineNetworkCipherTypeObsolete(v6);
  uint64_t v40 = [v6 objectForKey:@"APPLE_IE"];

  if (v40) {
    v5->_airPortBaseStation = 1;
  }
  v5->_prominentDisplay = 1;
  objc_storeStrong((id *)&v5->_attributes, v6);
  v5->_known = WiFiNetworkGetProperty() != 0;
  if (WiFiNetworkGetProperty())
  {
    uint64_t v41 = objc_msgSend(NSString, "stringWithFormat:", @"Score %lu", WiFiNetworkGetIntProperty());
    crowdsourceDescription = v5->_crowdsourceDescription;
    v5->_crowdsourceDescription = (NSString *)v41;
  }
  BOOL v43 = WiFiNetworkGetProperty() == *MEMORY[0x263EFFB40];
  v5->_popular = v43;
  if (v43 && v5->_enterprise) {
    v5->_popular = 0;
  }
  int v44 = [[WFPrivateAddressConfig alloc] initWithPrivateAddressConfigDictionary:v7 ssid:v5->_ssid];
  privateAddressConfig = v5->_privateAddressConfig;
  v5->_privateAddressConfig = v44;

LABEL_41:
  v46 = v5;

  return v46;
}

- (BOOL)iOSHotspot
{
  v3 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
  id v4 = [v3 NANServiceID];

  return v4 || self->_iOSHotspot;
}

- (NSString)hotspotPluginLabel
{
  return self->_hotspotPluginLabel;
}

- (NSString)hotspot20Name
{
  return self->_hotspot20Name;
}

- (NSDictionary)eapProfile
{
  return self->_eapProfile;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (int64_t)carPlayType
{
  if (![(WFNetworkScanRecord *)self isCarPlay]) {
    return 0;
  }
  v3 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
  id v4 = [v3 lastJoinedByUserAt];
  if (v4)
  {

    return 2;
  }
  uint64_t v6 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
  int v7 = [v6 payloadUUID];

  if (v7) {
    return 2;
  }
  return 1;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crowdsourceDescription, 0);
  objc_storeStrong((id *)&self->_unconfiguredDeviceID, 0);
  objc_storeStrong((id *)&self->_hotspotPluginLabel, 0);
  objc_storeStrong((id *)&self->_hotspot20Name, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
  objc_storeStrong((id *)&self->_matchingKnownNetworkProfile, 0);
  objc_storeStrong((id *)&self->_privateAddressConfig, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_eapProfile, 0);
  objc_storeStrong((id *)&self->_unconfiguredDeviceName, 0);
  objc_storeStrong((id *)&self->_channelWidth, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (BOOL)isNetworkSecurityModeMatch:(int64_t)a3
{
  if (a3 == 512) {
    return [(WFNetworkScanRecord *)self securityModeExt] == a3;
  }
  if (a3)
  {
    if ([(WFNetworkScanRecord *)self securityModeExt] != 512) {
      return ([(WFNetworkScanRecord *)self securityModeExt] & a3) != 0;
    }
    return [(WFNetworkScanRecord *)self securityModeExt] == a3;
  }
  if (![(WFNetworkScanRecord *)self securityModeExt]) {
    return 1;
  }
  return [(WFNetworkScanRecord *)self securityModeExt] == 2048;
}

- (int64_t)securityModeExt
{
  return self->_securityModeExt;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(WFNetworkScanRecord *)self _isEqualToHotspotDevice:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    BOOL v5 = [(WFNetworkScanRecord *)self _isEqualToNetwork:v4];
  }
  BOOL v6 = v5;
LABEL_7:

  return v6;
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (WFNetworkScanRecord)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-[WFNetworkScanRecord init] unavailable" userInfo:0];
  objc_exception_throw(v2);
}

- (WFNetworkScanRecord)initWithCoreWiFiProfile:(id)a3
{
  id v4 = (id)WiFiNetworkCreateFromCoreWiFiNetworkProfile();
  return [(WFNetworkScanRecord *)self initWithNetworkRef:v4];
}

- (int64_t)type
{
  if (self->_iOSHotspot) {
    return 2;
  }
  if (self->_adhoc) {
    return 0;
  }
  if (self->_unconfiguredAccessory) {
    return 3;
  }
  return 1;
}

- (BOOL)_isEqualToHotspotDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFNetworkScanRecord *)self ssid];
  BOOL v6 = [v4 ssid];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v3 = [(WFNetworkScanRecord *)self ssid];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(WFNetworkScanRecord *)self securityMode] ^ v4;

  return v5;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [(WFNetworkScanRecord *)self ssid];
  int v7 = [(WFNetworkScanRecord *)self bssid];
  int64_t v8 = [(WFNetworkScanRecord *)self rssi];
  BOOL v9 = [(WFNetworkScanRecord *)self isSecure];
  BOOL v10 = [(WFNetworkScanRecord *)self isEnterprise];
  v11 = WFStringFromWFSecurityMode([(WFNetworkScanRecord *)self securityMode]);
  uint64_t v12 = WFStringFromWFSecurityModeExt([(WFNetworkScanRecord *)self securityModeExt]);
  BOOL v13 = [v3 stringWithFormat:@"<%@ : %p ssid='%@' bssid='%@' rssi='%ld' secured=%d eap=%d mode='%@' modeExt=[%@]", v5, self, v6, v7, v8, v9, v10, v11, v12];

  if ([(WFNetworkScanRecord *)self obsoleteNetworkCipherType]) {
    objc_msgSend(v13, "appendFormat:", @" cipher=%d", -[WFNetworkScanRecord obsoleteNetworkCipherType](self, "obsoleteNetworkCipherType"));
  }
  objc_msgSend(v13, "appendFormat:", @" hidden=%d", -[WFNetworkScanRecord isHidden](self, "isHidden"));
  objc_msgSend(v13, "appendFormat:", @" HS20=%d", -[WFNetworkScanRecord isHotspot20](self, "isHotspot20"));
  if ([(WFNetworkScanRecord *)self isCarPlay])
  {
    int64_t v14 = [(WFNetworkScanRecord *)self carPlayType];
    uint64_t v15 = @"CarPlayUserConfigured";
    if (v14 == 1) {
      uint64_t v15 = @"CarPlayOnly";
    }
    [v13 appendFormat:@" carPlay='%@'", v15];
  }
  if ([(WFNetworkScanRecord *)self isUnconfiguredAccessory])
  {
    int64_t v16 = [(WFNetworkScanRecord *)self unconfiguredAccessoryType];
    v17 = [(WFNetworkScanRecord *)self unconfiguredDeviceName];
    [v13 appendFormat:@" MFIType=%d MFIName='%@'", v16, v17];
  }
  if ([(WFNetworkScanRecord *)self iOSHotspot]) {
    objc_msgSend(v13, "appendFormat:", @" iOSHotspot=%d", -[WFNetworkScanRecord iOSHotspot](self, "iOSHotspot"));
  }
  objc_msgSend(v13, "appendFormat:", @" popular=%d", -[WFNetworkScanRecord isPopular](self, "isPopular"));
  objc_msgSend(v13, "appendFormat:", @" known=%d", -[WFNetworkScanRecord isKnown](self, "isKnown"));
  objc_msgSend(v13, "appendFormat:", @" privateAddressState=%d", -[WFNetworkScanRecord isRandomMACAddressEnabled](self, "isRandomMACAddressEnabled"));
  uint64_t v18 = [(WFNetworkScanRecord *)self randomMACAddress];

  if (v18)
  {
    v19 = NSString;
    int v20 = [(WFNetworkScanRecord *)self randomMACAddress];
    uint64_t v21 = [v19 stringWithFormat:@" privateAddress='%@'", v20];
    [v13 appendString:v21];
  }
  uint64_t v22 = [(WFNetworkScanRecord *)self privateAddressConfig];

  if (v22)
  {
    v23 = NSString;
    uint64_t v24 = [(WFNetworkScanRecord *)self privateAddressConfig];
    uint64_t v25 = WFPrivateAddressConfigDisableReasonToString([v24 disabledReason]);
    uint64_t v26 = [v23 stringWithFormat:@" privateAddressDisabled='%@'", v25];
    [v13 appendString:v26];
  }
  v27 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];

  if (v27)
  {
    v28 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
    [v13 appendFormat:@" matchedProfile=[%@]", v28];
  }
  [v13 appendString:@">"];
  return (NSString *)v13;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_25;
  }
  if (!_os_feature_enabled_impl())
  {
LABEL_17:
    if ([v4 isPopular] && !-[WFNetworkScanRecord isPopular](self, "isPopular")) {
      goto LABEL_22;
    }
    if (([v4 isPopular] & 1) != 0 || !-[WFNetworkScanRecord isPopular](self, "isPopular"))
    {
      uint64_t v27 = [v4 rssi];
      if (v27 > [(WFNetworkScanRecord *)self rssi]) {
        goto LABEL_22;
      }
      uint64_t v29 = [v4 rssi];
      if (v29 > [(WFNetworkScanRecord *)self rssi])
      {
        int64_t v28 = [v4 isEqual:self] ^ 1;
        goto LABEL_26;
      }
    }
LABEL_25:
    int64_t v28 = 1;
    goto LABEL_26;
  }
  unint64_t v5 = [v4 scanResult];
  BOOL v6 = [v5 channel];
  if ([v6 is6GHz])
  {

    goto LABEL_6;
  }
  int v7 = [(WFNetworkScanRecord *)self scanResult];
  int64_t v8 = [v7 channel];
  char v9 = [v8 is6GHz];

  if ((v9 & 1) == 0)
  {
LABEL_6:
    BOOL v10 = [v4 scanResult];
    uint64_t v11 = [v10 BSSID];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      BOOL v13 = [(WFNetworkScanRecord *)self scanResult];
      uint64_t v14 = [v13 BSSID];
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        int64_t v16 = [v4 scanResult];
        v17 = [v16 BSSID];
        uint64_t v18 = [(WFNetworkScanRecord *)self scanResult];
        v19 = [v18 BSSID];
        if ([v17 isEqual:v19])
        {
          uint64_t v48 = v17;
          int v20 = v16;
          v51 = [v4 scanResult];
          uint64_t v21 = [v51 SSID];
          uint64_t v50 = [(WFNetworkScanRecord *)self scanResult];
          objc_super v52 = [v50 SSID];
          v53 = (void *)v21;
          v49 = v20;
          if ((void *)v21 == v52) {
            goto LABEL_27;
          }
          v46 = [v4 scanResult];
          uint64_t v22 = [v46 SSID];
          if (!v22)
          {
            LOBYTE(v47) = 0;
            uint64_t v26 = v48;
LABEL_41:

            goto LABEL_42;
          }
          v45 = (void *)v22;
          int v44 = [(WFNetworkScanRecord *)self scanResult];
          uint64_t v23 = [v44 SSID];
          if (!v23)
          {
            LOBYTE(v47) = 0;
            uint64_t v26 = v48;
LABEL_40:

            goto LABEL_41;
          }
          BOOL v43 = (void *)v23;
          uint64_t v24 = [v4 scanResult];
          uint64_t v25 = [v24 SSID];
          uint64_t v40 = [(WFNetworkScanRecord *)self scanResult];
          [v40 SSID];
          BOOL v39 = v41 = v25;
          v42 = v24;
          if (objc_msgSend(v25, "isEqual:"))
          {
LABEL_27:
            uint64_t v31 = [v4 scanResult];
            v32 = [v31 channel];
            if ([v32 is6GHz])
            {
              float v37 = v32;
              uint64_t v38 = v31;
              int v33 = [(WFNetworkScanRecord *)self scanResult];
              uint64_t v34 = [v33 channel];
              if ([v34 is6GHz])
              {
                int v36 = [v4 scanResult];
                if ([v36 hasNon6GHzRNRChannel])
                {
                  v35 = [(WFNetworkScanRecord *)self scanResult];
                  int v47 = [v35 hasNon6GHzRNRChannel] ^ 1;
                }
                else
                {
                  LOBYTE(v47) = 0;
                }
              }
              else
              {
                LOBYTE(v47) = 0;
              }
            }
            else
            {

              LOBYTE(v47) = 0;
            }
            uint64_t v26 = v48;
            if (v53 == v52)
            {
LABEL_42:

              if (v47) {
                goto LABEL_22;
              }
              goto LABEL_17;
            }
          }
          else
          {
            LOBYTE(v47) = 0;
            uint64_t v26 = v48;
          }

          goto LABEL_40;
        }
      }
    }

    goto LABEL_17;
  }
LABEL_22:
  int64_t v28 = -1;
LABEL_26:

  return v28;
}

- (void)populatePrivateAddressConfig:(id)a3
{
  id v15 = a3;
  id v4 = [v15 objectForKey:*MEMORY[0x263F55EF8]];
  self->_supervised = [v4 BOOLValue];

  unint64_t v5 = [v15 objectForKey:*MEMORY[0x263F55F20]];
  self->_privateMACDisabledByProfile = [v5 BOOLValue];

  BOOL v6 = [v15 objectForKey:@"PRIVATE_MAC_ADDRESS"];
  int v7 = v6;
  if (v6)
  {
    CFDataRef v8 = (const __CFData *)[v6 objectForKey:@"PRIVATE_MAC_ADDRESS_VALUE"];
    if (v8)
    {
      WFConvertEthernetNetworkAddressToString(v8);
      char v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      randomMACAddress = self->_randomMACAddress;
      self->_randomMACAddress = v9;
    }
    uint64_t v11 = [v7 objectForKey:@"PRIVATE_MAC_ADDRESS_TYPE"];
    int v12 = [v11 intValue];
    self->_privateAddressMode = v12;
    self->_randomMACAddressEnabled = (v12 & 0xFFFFFFFE) == 2;
  }
  else
  {
    self->_randomMACAddressEnabled = 0;
  }
  BOOL v13 = [[WFPrivateAddressConfig alloc] initWithPrivateAddressConfigDictionary:v15 ssid:self->_ssid];
  privateAddressConfig = self->_privateAddressConfig;
  self->_privateAddressConfig = v13;
}

- (NSNumber)channelWidth
{
  return self->_channelWidth;
}

- (BOOL)prominentDisplay
{
  return self->_prominentDisplay;
}

- (void)setProminentDisplay:(BOOL)a3
{
  self->_prominentDisplay = a3;
}

- (BOOL)isPrivateMACDisabledByProfile
{
  return self->_privateMACDisabledByProfile;
}

- (BOOL)isSupervised
{
  return self->_supervised;
}

- (unint64_t)obsoleteNetworkCipherType
{
  return self->_obsoleteNetworkCipherType;
}

- (void)setScanResult:(id)a3
{
}

- (BOOL)instantHotspot
{
  return self->_instantHotspot;
}

- (void)setInstantHotspot:(BOOL)a3
{
  self->_instantHotspot = a3;
}

- (BOOL)isHotspot20Provisioned
{
  return self->_hotspot20Provisioned;
}

- (void)setHotspot20Provisioned:(BOOL)a3
{
  self->_hotspot20Provisioned = a3;
}

- (BOOL)isKnown
{
  return self->_known;
}

- (void)setKnown:(BOOL)a3
{
  self->_known = a3;
}

- (NSString)crowdsourceDescription
{
  return self->_crowdsourceDescription;
}

- (void)setCrowdsourceDescription:(id)a3
{
}

- (BOOL)isPopular
{
  return self->_popular;
}

- (void)setPopular:(BOOL)a3
{
  self->_popular = a3;
}

- (BOOL)isCloudSyncable
{
  if ([(WFNetworkScanRecord *)self isEnterprise] || [(WFNetworkScanRecord *)self isAdhoc]) {
    return 0;
  }
  return [(WFNetworkScanRecord *)self isSecure];
}

- (id)configurationIssues
{
  v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(WFNetworkScanRecord *)self securityIssue];

  if (v4)
  {
    unint64_t v5 = [(WFNetworkScanRecord *)self securityIssue];
    [v3 addObject:v5];
  }
  if ([(WFNetworkScanRecord *)self isAmbiguousSSID])
  {
    BOOL v6 = [MEMORY[0x263F863A8] issueWithType:32];
    [v3 addObject:v6];
  }
  if ([(WFNetworkScanRecord *)self phyMode] == 4)
  {
    int v7 = [MEMORY[0x263F863A8] issueWithType:16];
    [v3 addObject:v7];
  }
  return v3;
}

- (id)securityIssue
{
  if (![(WFNetworkScanRecord *)self securityMode]
    || [(WFNetworkScanRecord *)self securityMode] == 2048)
  {
    uint64_t v3 = 8;
LABEL_7:
    id v4 = [MEMORY[0x263F863A8] issueWithType:v3];
    goto LABEL_8;
  }
  if ([(WFNetworkScanRecord *)self securityMode] == 1
    || [(WFNetworkScanRecord *)self obsoleteNetworkCipherType] == 1)
  {
    uint64_t v3 = 2;
    goto LABEL_7;
  }
  if ([(WFNetworkScanRecord *)self securityMode] == 4)
  {
    uint64_t v3 = 4;
    goto LABEL_7;
  }
  if ([(WFNetworkScanRecord *)self obsoleteNetworkCipherType] == 2)
  {
    uint64_t v3 = 4096;
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_8:
  return v4;
}

- (BOOL)supportsWiFiHealth
{
  if ([(WFNetworkScanRecord *)self carPlayType] == 1) {
    return 0;
  }
  else {
    return ![(WFNetworkScanRecord *)self iOSHotspot];
  }
}

- (BOOL)supportsJoinFailureDiagnostics
{
  if ([(WFNetworkScanRecord *)self isHotspot20]
    || [(WFNetworkScanRecord *)self isEnterprise])
  {
    return 0;
  }
  else
  {
    return ![(WFNetworkScanRecord *)self isCarPlay];
  }
}

- (id)title
{
  uint64_t v3 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
  id v4 = [v3 displayFriendlyName];

  if (v4)
  {
    unint64_t v5 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
    BOOL v6 = [v5 displayFriendlyName];
  }
  else if (![(WFNetworkScanRecord *)self isUnconfiguredAccessory] {
         || ([(WFNetworkScanRecord *)self unconfiguredDeviceName],
  }
             (BOOL v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v6 = [(WFNetworkScanRecord *)self ssid];
  }
  return v6;
}

- (BOOL)isInstantHotspot
{
  return 0;
}

- (id)hotspotBatteryLife
{
  return 0;
}

- (id)hotspotSignalStrength
{
  return 0;
}

- (id)hotspotCellularProtocol
{
  return 0;
}

- (id)subtitle
{
  uint64_t v3 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
  if (v3)
  {
    id v4 = (void *)v3;
    unint64_t v5 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
    BOOL v6 = [v5 displayedOperatorName];

    if (v6)
    {
      int v7 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
      CFDataRef v8 = [v7 displayedOperatorName];

      goto LABEL_9;
    }
  }
  char v9 = [(WFNetworkScanRecord *)self hotspot20Name];

  if (v9)
  {
    uint64_t v10 = [(WFNetworkScanRecord *)self hotspot20Name];
LABEL_8:
    CFDataRef v8 = (void *)v10;
    goto LABEL_9;
  }
  uint64_t v11 = [(WFNetworkScanRecord *)self hotspotPluginLabel];

  if (v11)
  {
    uint64_t v10 = [(WFNetworkScanRecord *)self hotspotPluginLabel];
    goto LABEL_8;
  }
  CFDataRef v8 = 0;
LABEL_9:
  return v8;
}

- (BOOL)canBeDisplayedAsCurrent
{
  return [(WFNetworkScanRecord *)self carPlayType] != 1;
}

- (unint64_t)signalBars
{
  [(WFNetworkScanRecord *)self scaledRSSI];
  return WFSignalBarsFromScaledRSSI();
}

- (BOOL)isEquivalentRecord:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(WFNetworkScanRecord *)self ssid];
    int v7 = [v5 ssid];
    if ([v6 isEqualToString:v7]) {
      BOOL v8 = -[WFNetworkScanRecord isNetworkSecurityModeMatch:](self, "isNetworkSecurityModeMatch:", [v5 securityModeExt]);
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)lastJoinedDate
{
  return 0;
}

- (BOOL)shouldShowInMyNetworkList
{
  uint64_t v3 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
  if (v3)
  {
    id v4 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
    char v5 = [v4 shouldShowInMyNetworkList];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowInKnownNetworkList
{
  uint64_t v3 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
  if (v3)
  {
    id v4 = [(WFNetworkScanRecord *)self matchingKnownNetworkProfile];
    char v5 = [v4 shouldShowInKnownNetworkList];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)cellularSlicingIsEnabled
{
  return 0;
}

@end