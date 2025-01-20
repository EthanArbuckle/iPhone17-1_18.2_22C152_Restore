@interface W5WiFiStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWiFiStatus:(id)a3;
- (BOOL)isSnifferSupported;
- (BOOL)powerOn;
- (BOOL)smartCCADesenseSupported;
- (BOOL)smartCCADesenseUSBPresence;
- (NSArray)cachedScanResults;
- (NSArray)capabilities;
- (NSArray)dnsAddresses;
- (NSArray)ipv4Addresses;
- (NSArray)ipv6Addresses;
- (NSArray)linkQualityUpdates;
- (NSArray)supportedChannels;
- (NSData)btcConfig;
- (NSData)btcProfiles2GHz;
- (NSData)btcProfiles5GHz;
- (NSData)chainAck;
- (NSData)desense;
- (NSData)desenseLevel;
- (NSData)power;
- (NSData)ssid;
- (NSData)txChainPower;
- (NSString)bssid;
- (NSString)countryCode;
- (NSString)hardwareMACAddress;
- (NSString)interfaceName;
- (NSString)ipv4RouterAddress;
- (NSString)ipv6RouterAddress;
- (NSString)macAddress;
- (NSString)networkServiceID;
- (NSString)ssidString;
- (W5WiFiChannel)channel;
- (W5WiFiPreferredNetwork)lastJoinedPreferredNetwork;
- (W5WiFiScanResult)lastJoinedScanResult;
- (W5WiFiStatus)initWithCoder:(id)a3;
- (double)txRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)btcMode;
- (int)opMode;
- (int)phyMode;
- (int64_t)ipv4ConfigMethod;
- (int64_t)ipv6ConfigMethod;
- (int64_t)noise;
- (int64_t)rssi;
- (int64_t)security;
- (unint64_t)cca;
- (unint64_t)guardInterval;
- (unint64_t)hash;
- (unint64_t)mcsIndex;
- (unint64_t)numberOfSpacialStreams;
- (unsigned)eapolControlMode;
- (unsigned)eapolSupplicantState;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBssid:(id)a3;
- (void)setBtcConfig:(id)a3;
- (void)setBtcMode:(int)a3;
- (void)setBtcProfiles2GHz:(id)a3;
- (void)setBtcProfiles5GHz:(id)a3;
- (void)setCachedScanResults:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setCca:(unint64_t)a3;
- (void)setChainAck:(id)a3;
- (void)setChannel:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDesense:(id)a3;
- (void)setDesenseLevel:(id)a3;
- (void)setDnsAddresses:(id)a3;
- (void)setEapolControlMode:(unsigned int)a3;
- (void)setEapolSupplicantState:(unsigned int)a3;
- (void)setGuardInterval:(unint64_t)a3;
- (void)setHardwareMACAddress:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setIpv4Addresses:(id)a3;
- (void)setIpv4ConfigMethod:(int64_t)a3;
- (void)setIpv4RouterAddress:(id)a3;
- (void)setIpv6Addresses:(id)a3;
- (void)setIpv6ConfigMethod:(int64_t)a3;
- (void)setIpv6RouterAddress:(id)a3;
- (void)setIsSnifferSupported:(BOOL)a3;
- (void)setLastJoinedPreferredNetwork:(id)a3;
- (void)setLastJoinedScanResult:(id)a3;
- (void)setLinkQualityUpdates:(id)a3;
- (void)setMacAddress:(id)a3;
- (void)setMcsIndex:(unint64_t)a3;
- (void)setNetworkServiceID:(id)a3;
- (void)setNoise:(int64_t)a3;
- (void)setNumberOfSpacialStreams:(unint64_t)a3;
- (void)setOpMode:(int)a3;
- (void)setPhyMode:(int)a3;
- (void)setPower:(id)a3;
- (void)setPowerOn:(BOOL)a3;
- (void)setRssi:(int64_t)a3;
- (void)setSecurity:(int64_t)a3;
- (void)setSmartCCADesenseSupported:(BOOL)a3;
- (void)setSmartCCADesenseUSBPresence:(BOOL)a3;
- (void)setSsid:(id)a3;
- (void)setSsidString:(id)a3;
- (void)setSupportedChannels:(id)a3;
- (void)setTxChainPower:(id)a3;
- (void)setTxRate:(double)a3;
@end

@implementation W5WiFiStatus

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5WiFiStatus;
  [(W5WiFiStatus *)&v3 dealloc];
}

- (void)setIpv4Addresses:(id)a3
{
  ipv4Addresses = self->_ipv4Addresses;
  if (ipv4Addresses != a3)
  {

    self->_ipv4Addresses = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_ipv4Addresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setIpv6Addresses:(id)a3
{
  ipv6Addresses = self->_ipv6Addresses;
  if (ipv6Addresses != a3)
  {

    self->_ipv6Addresses = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_ipv6Addresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setDnsAddresses:(id)a3
{
  dnsAddresses = self->_dnsAddresses;
  if (dnsAddresses != a3)
  {

    self->_dnsAddresses = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_dnsAddresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setCachedScanResults:(id)a3
{
  cachedScanResults = self->_cachedScanResults;
  if (cachedScanResults != a3)
  {

    self->_cachedScanResults = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_cachedScanResults = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setSupportedChannels:(id)a3
{
  supportedChannels = self->_supportedChannels;
  if (supportedChannels != a3)
  {

    self->_supportedChannels = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_supportedChannels = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setLinkQualityUpdates:(id)a3
{
  linkQualityUpdates = self->_linkQualityUpdates;
  if (linkQualityUpdates != a3)
  {

    self->_linkQualityUpdates = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_linkQualityUpdates = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"MAC Address: %@ (hw=%@)\n", self->_macAddress, self->_hardwareMACAddress];
  [v3 appendFormat:@"Interface Name: %@\n", self->_interfaceName];
  if (self->_powerOn) {
    v4 = "On";
  }
  else {
    v4 = "Off";
  }
  NSUInteger v5 = [(NSData *)self->_power length];
  uint64_t v6 = 0;
  if (v5 == 24) {
    uint64_t v6 = [(NSData *)self->_power bytes];
  }
  [v3 appendFormat:@"Power: %s [%@]\n", v4, W5DescriptionForPower((uint64_t)v6)];
  [v3 appendFormat:@"Mode: %@\n", W5DescriptionForOpMode(self->_opMode)];
  [v3 appendFormat:@"SSID: %@ (%@)\n", self->_ssidString, self->_ssid];
  [v3 appendFormat:@"BSSID: %@\n", self->_bssid];
  objc_msgSend(v3, "appendFormat:", @"RSSI: %ld\n", self->_rssi);
  objc_msgSend(v3, "appendFormat:", @"CCA: %ld\n", self->_cca);
  objc_msgSend(v3, "appendFormat:", @"Noise: %ld\n", self->_noise);
  objc_msgSend(v3, "appendFormat:", @"Tx Rate: %.1f\n", *(void *)&self->_txRate);
  [v3 appendFormat:@"Security: %@\n", W5DescriptionForSecurity(self->_security)];
  [v3 appendFormat:@"EAPOL Mode: %@\n", W5DescriptionForEAPOLControlMode(self->_eapolControlMode)];
  [v3 appendFormat:@"EAPOL Supplicant: %@\n", W5DescriptionForEAPOLSupplicantState(self->_eapolSupplicantState)];
  [v3 appendFormat:@"PHY Mode: %@\n", W5DescriptionForPHYMode(self->_phyMode)];
  objc_msgSend(v3, "appendFormat:", @"MCS Index: %ld\n", self->_mcsIndex);
  objc_msgSend(v3, "appendFormat:", @"Guard Interval: %ld\n", self->_guardInterval);
  objc_msgSend(v3, "appendFormat:", @"NSS: %ld\n", self->_numberOfSpacialStreams);
  [v3 appendFormat:@"Channel: %@\n", -[W5WiFiChannel description](self->_channel, "description")];
  [v3 appendFormat:@"Country Code: %@\n", self->_countryCode];
  [v3 appendFormat:@"Supported Channels: %@\n", -[NSArray componentsJoinedByString:](self->_supportedChannels, "componentsJoinedByString:", @","];
  BOOL v7 = [(NSArray *)self->_capabilities containsObject:&unk_26C509F98];
  v8 = "No";
  if (v7) {
    v8 = "Yes";
  }
  objc_msgSend(v3, "appendFormat:", @"Supports 6e: %s\n", v8);
  objc_msgSend(v3, "appendFormat:", @"Scan Cache Count: %lu\n", -[NSArray count](self->_cachedScanResults, "count"));
  objc_msgSend(v3, "appendFormat:", @"Link Quality Updates: %lu\n", -[NSArray count](self->_linkQualityUpdates, "count"));
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  linkQualityUpdates = self->_linkQualityUpdates;
  uint64_t v10 = [(NSArray *)linkQualityUpdates countByEnumeratingWithState:&v81 objects:v88 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v82 != v12) {
          objc_enumerationMutation(linkQualityUpdates);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v81 + 1) + 8 * i)];
      }
      uint64_t v11 = [(NSArray *)linkQualityUpdates countByEnumeratingWithState:&v81 objects:v88 count:16];
    }
    while (v11);
  }
  [v3 appendFormat:@"NetworkServiceID: %@\n", self->_networkServiceID];
  [v3 appendFormat:@"IPv4ConfigMethod: %@\n", W5DescriptionForIPv4ConfigMethod(self->_ipv4ConfigMethod)];
  objc_msgSend(v3, "appendFormat:", @"IPv4 Addresses: %lu\n", -[NSArray count](self->_ipv4Addresses, "count"));
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  ipv4Addresses = self->_ipv4Addresses;
  uint64_t v15 = [(NSArray *)ipv4Addresses countByEnumeratingWithState:&v77 objects:v87 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v78;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v78 != v17) {
          objc_enumerationMutation(ipv4Addresses);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v77 + 1) + 8 * j)];
      }
      uint64_t v16 = [(NSArray *)ipv4Addresses countByEnumeratingWithState:&v77 objects:v87 count:16];
    }
    while (v16);
  }
  [v3 appendFormat:@"IPv4 Router: %@\n", self->_ipv4RouterAddress];
  [v3 appendFormat:@"IPv6ConfigMethod: %@\n", W5DescriptionForIPv6ConfigMethod(self->_ipv6ConfigMethod)];
  objc_msgSend(v3, "appendFormat:", @"IPv6 Addresses: %lu\n", -[NSArray count](self->_ipv6Addresses, "count"));
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  ipv6Addresses = self->_ipv6Addresses;
  uint64_t v20 = [(NSArray *)ipv6Addresses countByEnumeratingWithState:&v73 objects:v86 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v74;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v74 != v22) {
          objc_enumerationMutation(ipv6Addresses);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v73 + 1) + 8 * k)];
      }
      uint64_t v21 = [(NSArray *)ipv6Addresses countByEnumeratingWithState:&v73 objects:v86 count:16];
    }
    while (v21);
  }
  [v3 appendFormat:@"IPv6 Router: %@\n", self->_ipv6RouterAddress];
  objc_msgSend(v3, "appendFormat:", @"DNS Addresses: %lu\n", -[NSArray count](self->_dnsAddresses, "count"));
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  dnsAddresses = self->_dnsAddresses;
  uint64_t v25 = [(NSArray *)dnsAddresses countByEnumeratingWithState:&v69 objects:v85 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v70;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v70 != v27) {
          objc_enumerationMutation(dnsAddresses);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v69 + 1) + 8 * m)];
      }
      uint64_t v26 = [(NSArray *)dnsAddresses countByEnumeratingWithState:&v69 objects:v85 count:16];
    }
    while (v26);
  }
  [v3 appendFormat:@"BTC Mode: %@\n", W5DescriptionForBTCMode(self->_btcMode)];
  btcConfig = self->_btcConfig;
  if (btcConfig)
  {
    if (self->_btcProfiles2GHz)
    {
      [(NSData *)btcConfig length];
      v30 = *(_DWORD *)([(NSData *)self->_btcConfig bytes] + 4) ? "Enabled" : "Disabled";
      objc_msgSend(v3, "appendFormat:", @"BTC Profile 2.4 GHz: %s\n", v30);
      [(NSData *)self->_btcConfig length];
      if (*(_DWORD *)([(NSData *)self->_btcConfig bytes] + 4))
      {
        [(NSData *)self->_btcProfiles2GHz length];
        if (*(_DWORD *)([(NSData *)self->_btcProfiles2GHz bytes] + 8))
        {
          if ([(NSData *)self->_btcProfiles2GHz length] == 572) {
            v31 = [(NSData *)self->_btcProfiles2GHz bytes];
          }
          else {
            v31 = 0;
          }
          [(NSData *)self->_btcConfig length];
          v32 = &v31[140 * *(unsigned int *)([(NSData *)self->_btcConfig bytes] + 8)];
          long long v61 = *(_OWORD *)(v32 + 12);
          long long v33 = *(_OWORD *)(v32 + 28);
          long long v34 = *(_OWORD *)(v32 + 44);
          long long v35 = *(_OWORD *)(v32 + 76);
          long long v64 = *(_OWORD *)(v32 + 60);
          long long v65 = v35;
          long long v62 = v33;
          long long v63 = v34;
          long long v36 = *(_OWORD *)(v32 + 92);
          long long v37 = *(_OWORD *)(v32 + 108);
          long long v38 = *(_OWORD *)(v32 + 124);
          *(_OWORD *)&v68[12] = *(_OWORD *)(v32 + 136);
          long long v67 = v37;
          *(_OWORD *)v68 = v38;
          long long v66 = v36;
          [v3 appendString:W5DescriptionForBTCProfile((unsigned int *)&v61, @"\t")];
        }
      }
    }
    v39 = self->_btcConfig;
    if (v39 && self->_btcProfiles5GHz)
    {
      [(NSData *)v39 length];
      v40 = *(_DWORD *)([(NSData *)self->_btcConfig bytes] + 12) ? "Enabled" : "Disabled";
      objc_msgSend(v3, "appendFormat:", @"BTC Profile 5 GHz: %s\n", v40);
      [(NSData *)self->_btcConfig length];
      if (*(_DWORD *)([(NSData *)self->_btcConfig bytes] + 12))
      {
        [(NSData *)self->_btcProfiles5GHz length];
        if (*(_DWORD *)([(NSData *)self->_btcProfiles5GHz bytes] + 8))
        {
          if ([(NSData *)self->_btcProfiles5GHz length] == 572) {
            v41 = [(NSData *)self->_btcProfiles5GHz bytes];
          }
          else {
            v41 = 0;
          }
          [(NSData *)self->_btcConfig length];
          v42 = &v41[140 * *(unsigned int *)([(NSData *)self->_btcConfig bytes] + 16)];
          long long v61 = *(_OWORD *)(v42 + 12);
          long long v43 = *(_OWORD *)(v42 + 28);
          long long v44 = *(_OWORD *)(v42 + 44);
          long long v45 = *(_OWORD *)(v42 + 76);
          long long v64 = *(_OWORD *)(v42 + 60);
          long long v65 = v45;
          long long v62 = v43;
          long long v63 = v44;
          long long v46 = *(_OWORD *)(v42 + 92);
          long long v47 = *(_OWORD *)(v42 + 108);
          long long v48 = *(_OWORD *)(v42 + 124);
          *(_OWORD *)&v68[12] = *(_OWORD *)(v42 + 136);
          long long v67 = v47;
          *(_OWORD *)v68 = v48;
          long long v66 = v46;
          [v3 appendString:W5DescriptionForBTCProfile((unsigned int *)&v61, @"\t")];
        }
      }
    }
  }
  if ([(NSData *)self->_chainAck length] == 24) {
    v49 = [(NSData *)self->_chainAck bytes];
  }
  else {
    v49 = 0;
  }
  [v3 appendFormat:@"Chain Ack: [%@]\n", W5DescriptionForChainAck((uint64_t)v49)];
  txChainPower = self->_txChainPower;
  if (txChainPower)
  {
    [(NSData *)txChainPower length];
    if (*(_DWORD *)([(NSData *)self->_txChainPower bytes] + 4))
    {
      [(NSData *)self->_txChainPower length];
      if (*(int *)([(NSData *)self->_txChainPower bytes] + 4) >= 1)
      {
        uint64_t v51 = 0;
        uint64_t v52 = 8;
        do
        {
          [(NSData *)self->_txChainPower length];
          [v3 appendFormat:@"Tx Chain Power[%i]: %@\n", v51, W5DescriptionForChainPowerState(*(unsigned int *)(-[NSData bytes](self->_txChainPower, "bytes") + v52))];
          [(NSData *)self->_txChainPower length];
          if (*(_DWORD *)([(NSData *)self->_txChainPower bytes] + v52) == 2)
          {
            if ([(NSData *)self->_txChainPower length] == 88) {
              v53 = [(NSData *)self->_txChainPower bytes];
            }
            else {
              v53 = 0;
            }
            long long v54 = *(_OWORD *)&v53[v52];
            LODWORD(v62) = *(_DWORD *)&v53[v52 + 16];
            long long v61 = v54;
            [v3 appendString:W5DescriptionForTxChainPower((unsigned int *)&v61, @"\t")];
          }
          ++v51;
          [(NSData *)self->_txChainPower length];
          v52 += 20;
        }
        while (v51 < *(int *)([(NSData *)self->_txChainPower bytes] + 4));
      }
    }
  }
  desense = self->_desense;
  if (desense && self->_desenseLevel)
  {
    if ([(NSData *)desense length] == 16) {
      v56 = [(NSData *)self->_desense bytes];
    }
    else {
      v56 = 0;
    }
    if ([(NSData *)self->_desenseLevel length] == 8) {
      v57 = [(NSData *)self->_desenseLevel bytes];
    }
    else {
      v57 = 0;
    }
    [v3 appendFormat:@"Desense: %@\n", W5DescriptionForDesense((uint64_t)v56, (uint64_t)v57)];
  }
  if (self->_smartCCADesenseSupported) {
    v58 = "Supported";
  }
  else {
    v58 = "Not Supported";
  }
  objc_msgSend(v3, "appendFormat:", @"SmartCCA/Desense: %s (USB=%d)\n", v58, self->_smartCCADesenseUSBPresence);
  if (self->_isSnifferSupported) {
    v59 = "Supported";
  }
  else {
    v59 = "Not Supported";
  }
  objc_msgSend(v3, "appendFormat:", @"Sniffer: %s\n", v59);
  return (id)[v3 copy];
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5WiFiStatus;
  if (-[W5WiFiStatus conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToWiFiStatus:(id)a3
{
  macAddress = self->_macAddress;
  if (!macAddress)
  {
    if (![a3 macAddress]) {
      goto LABEL_5;
    }
    macAddress = self->_macAddress;
  }
  int v6 = -[NSString isEqual:](macAddress, "isEqual:", [a3 macAddress]);
  if (!v6) {
    return v6;
  }
LABEL_5:
  hardwareMACAddress = self->_hardwareMACAddress;
  if (!hardwareMACAddress)
  {
    if (![a3 hardwareMACAddress]) {
      goto LABEL_9;
    }
    hardwareMACAddress = self->_hardwareMACAddress;
  }
  int v6 = -[NSString isEqual:](hardwareMACAddress, "isEqual:", [a3 hardwareMACAddress]);
  if (!v6) {
    return v6;
  }
LABEL_9:
  interfaceName = self->_interfaceName;
  if (!interfaceName)
  {
    if (![a3 interfaceName]) {
      goto LABEL_13;
    }
    interfaceName = self->_interfaceName;
  }
  int v6 = -[NSString isEqual:](interfaceName, "isEqual:", [a3 interfaceName]);
  if (!v6) {
    return v6;
  }
LABEL_13:
  capabilities = self->_capabilities;
  if (!capabilities)
  {
    if (![a3 capabilities]) {
      goto LABEL_17;
    }
    capabilities = self->_capabilities;
  }
  int v6 = -[NSArray isEqual:](capabilities, "isEqual:", [a3 capabilities]);
  if (!v6) {
    return v6;
  }
LABEL_17:
  int powerOn = self->_powerOn;
  if (powerOn != [a3 powerOn]) {
    goto LABEL_129;
  }
  int v6 = -[NSData isEqualToData:](self->_power, "isEqualToData:", [a3 power]);
  if (!v6) {
    return v6;
  }
  int opMode = self->_opMode;
  if (opMode != [a3 opMode]) {
    goto LABEL_129;
  }
  ssidString = self->_ssidString;
  if (!ssidString)
  {
    if (![a3 ssidString]) {
      goto LABEL_24;
    }
    ssidString = self->_ssidString;
  }
  int v6 = -[NSString isEqual:](ssidString, "isEqual:", [a3 ssidString]);
  if (!v6) {
    return v6;
  }
LABEL_24:
  ssid = self->_ssid;
  if (!ssid)
  {
    if (![a3 ssid]) {
      goto LABEL_28;
    }
    ssid = self->_ssid;
  }
  int v6 = -[NSData isEqual:](ssid, "isEqual:", [a3 ssid]);
  if (!v6) {
    return v6;
  }
LABEL_28:
  bssid = self->_bssid;
  if (!bssid)
  {
    if (![a3 bssid]) {
      goto LABEL_32;
    }
    bssid = self->_bssid;
  }
  int v6 = -[NSString isEqual:](bssid, "isEqual:", [a3 bssid]);
  if (!v6) {
    return v6;
  }
LABEL_32:
  rssuint64_t i = self->_rssi;
  if (rssi != [a3 rssi]) {
    goto LABEL_129;
  }
  unint64_t cca = self->_cca;
  if (cca != [a3 cca]) {
    goto LABEL_129;
  }
  int64_t noise = self->_noise;
  if (noise != [a3 noise]) {
    goto LABEL_129;
  }
  unint64_t txRate = (unint64_t)self->_txRate;
  [a3 txRate];
  if (txRate != (unint64_t)v19) {
    goto LABEL_129;
  }
  int64_t security = self->_security;
  if (security != [a3 security]) {
    goto LABEL_129;
  }
  unsigned int eapolControlMode = self->_eapolControlMode;
  if (eapolControlMode != [a3 eapolControlMode]) {
    goto LABEL_129;
  }
  unsigned int eapolSupplicantState = self->_eapolSupplicantState;
  if (eapolSupplicantState != [a3 eapolSupplicantState]) {
    goto LABEL_129;
  }
  int phyMode = self->_phyMode;
  if (phyMode != [a3 phyMode]) {
    goto LABEL_129;
  }
  unint64_t mcsIndex = self->_mcsIndex;
  if (mcsIndex != [a3 mcsIndex]) {
    goto LABEL_129;
  }
  unint64_t guardInterval = self->_guardInterval;
  if (guardInterval != [a3 guardInterval]) {
    goto LABEL_129;
  }
  unint64_t numberOfSpacialStreams = self->_numberOfSpacialStreams;
  if (numberOfSpacialStreams != [a3 numberOfSpacialStreams]) {
    goto LABEL_129;
  }
  channel = self->_channel;
  if (!channel)
  {
    if (![a3 channel]) {
      goto LABEL_47;
    }
    channel = self->_channel;
  }
  int v6 = -[W5WiFiChannel isEqual:](channel, "isEqual:", [a3 channel]);
  if (!v6) {
    return v6;
  }
LABEL_47:
  supportedChannels = self->_supportedChannels;
  if (!supportedChannels)
  {
    if (![a3 supportedChannels]) {
      goto LABEL_51;
    }
    supportedChannels = self->_supportedChannels;
  }
  int v6 = -[NSArray isEqual:](supportedChannels, "isEqual:", [a3 supportedChannels]);
  if (!v6) {
    return v6;
  }
LABEL_51:
  countryCode = self->_countryCode;
  if (!countryCode)
  {
    if (![a3 countryCode]) {
      goto LABEL_55;
    }
    countryCode = self->_countryCode;
  }
  int v6 = -[NSString isEqual:](countryCode, "isEqual:", [a3 countryCode]);
  if (!v6) {
    return v6;
  }
LABEL_55:
  networkServiceID = self->_networkServiceID;
  if (!networkServiceID)
  {
    if (![a3 networkServiceID]) {
      goto LABEL_59;
    }
    networkServiceID = self->_networkServiceID;
  }
  int v6 = -[NSString isEqual:](networkServiceID, "isEqual:", [a3 networkServiceID]);
  if (!v6) {
    return v6;
  }
LABEL_59:
  int64_t ipv4ConfigMethod = self->_ipv4ConfigMethod;
  if (ipv4ConfigMethod != [a3 ipv4ConfigMethod]) {
    goto LABEL_129;
  }
  int64_t ipv6ConfigMethod = self->_ipv6ConfigMethod;
  if (ipv6ConfigMethod != [a3 ipv6ConfigMethod]) {
    goto LABEL_129;
  }
  ipv4Addresses = self->_ipv4Addresses;
  if (!ipv4Addresses)
  {
    if (![a3 ipv4Addresses]) {
      goto LABEL_65;
    }
    ipv4Addresses = self->_ipv4Addresses;
  }
  int v6 = -[NSArray isEqual:](ipv4Addresses, "isEqual:", [a3 ipv4Addresses]);
  if (!v6) {
    return v6;
  }
LABEL_65:
  ipv6Addresses = self->_ipv6Addresses;
  if (!ipv6Addresses)
  {
    if (![a3 ipv6Addresses]) {
      goto LABEL_69;
    }
    ipv6Addresses = self->_ipv6Addresses;
  }
  int v6 = -[NSArray isEqual:](ipv6Addresses, "isEqual:", [a3 ipv6Addresses]);
  if (!v6) {
    return v6;
  }
LABEL_69:
  ipv4RouterAddress = self->_ipv4RouterAddress;
  if (!ipv4RouterAddress)
  {
    if (![a3 ipv4RouterAddress]) {
      goto LABEL_73;
    }
    ipv4RouterAddress = self->_ipv4RouterAddress;
  }
  int v6 = -[NSString isEqual:](ipv4RouterAddress, "isEqual:", [a3 ipv4RouterAddress]);
  if (!v6) {
    return v6;
  }
LABEL_73:
  ipv6RouterAddress = self->_ipv6RouterAddress;
  if (!ipv6RouterAddress)
  {
    if (![a3 ipv6RouterAddress]) {
      goto LABEL_77;
    }
    ipv6RouterAddress = self->_ipv6RouterAddress;
  }
  int v6 = -[NSString isEqual:](ipv6RouterAddress, "isEqual:", [a3 ipv6RouterAddress]);
  if (!v6) {
    return v6;
  }
LABEL_77:
  dnsAddresses = self->_dnsAddresses;
  if (!dnsAddresses)
  {
    if (![a3 dnsAddresses]) {
      goto LABEL_81;
    }
    dnsAddresses = self->_dnsAddresses;
  }
  int v6 = -[NSArray isEqual:](dnsAddresses, "isEqual:", [a3 dnsAddresses]);
  if (!v6) {
    return v6;
  }
LABEL_81:
  chainAcuint64_t k = self->_chainAck;
  if (!chainAck)
  {
    if (![a3 chainAck]) {
      goto LABEL_85;
    }
    chainAcuint64_t k = self->_chainAck;
  }
  int v6 = -[NSData isEqualToData:](chainAck, "isEqualToData:", [a3 chainAck]);
  if (!v6) {
    return v6;
  }
LABEL_85:
  txChainPower = self->_txChainPower;
  if (!txChainPower)
  {
    if (![a3 txChainPower]) {
      goto LABEL_89;
    }
    txChainPower = self->_txChainPower;
  }
  int v6 = -[NSData isEqualToData:](txChainPower, "isEqualToData:", [a3 txChainPower]);
  if (!v6) {
    return v6;
  }
LABEL_89:
  desense = self->_desense;
  if (!desense)
  {
    if (![a3 desense]) {
      goto LABEL_93;
    }
    desense = self->_desense;
  }
  int v6 = -[NSData isEqualToData:](desense, "isEqualToData:", [a3 desense]);
  if (!v6) {
    return v6;
  }
LABEL_93:
  desenseLevel = self->_desenseLevel;
  if (!desenseLevel)
  {
    if (![a3 desenseLevel]) {
      goto LABEL_97;
    }
    desenseLevel = self->_desenseLevel;
  }
  int v6 = -[NSData isEqualToData:](desenseLevel, "isEqualToData:", [a3 desenseLevel]);
  if (!v6) {
    return v6;
  }
LABEL_97:
  btcConfig = self->_btcConfig;
  if (!btcConfig)
  {
    if (![a3 btcConfig]) {
      goto LABEL_101;
    }
    btcConfig = self->_btcConfig;
  }
  int v6 = -[NSData isEqualToData:](btcConfig, "isEqualToData:", [a3 btcConfig]);
  if (!v6) {
    return v6;
  }
LABEL_101:
  btcProfiles2GHz = self->_btcProfiles2GHz;
  if (!btcProfiles2GHz)
  {
    if (![a3 btcProfiles2GHz]) {
      goto LABEL_105;
    }
    btcProfiles2GHz = self->_btcProfiles2GHz;
  }
  int v6 = -[NSData isEqualToData:](btcProfiles2GHz, "isEqualToData:", [a3 btcProfiles2GHz]);
  if (!v6) {
    return v6;
  }
LABEL_105:
  btcProfiles5GHz = self->_btcProfiles5GHz;
  if (!btcProfiles5GHz)
  {
    if (![a3 btcProfiles5GHz]) {
      goto LABEL_109;
    }
    btcProfiles5GHz = self->_btcProfiles5GHz;
  }
  int v6 = -[NSData isEqualToData:](btcProfiles5GHz, "isEqualToData:", [a3 btcProfiles5GHz]);
  if (!v6) {
    return v6;
  }
LABEL_109:
  int btcMode = self->_btcMode;
  if (btcMode != [a3 btcMode]) {
    goto LABEL_129;
  }
  linkQualityUpdates = self->_linkQualityUpdates;
  if (!linkQualityUpdates)
  {
    if (![a3 linkQualityUpdates]) {
      goto LABEL_114;
    }
    linkQualityUpdates = self->_linkQualityUpdates;
  }
  int v6 = -[NSArray isEqual:](linkQualityUpdates, "isEqual:", [a3 linkQualityUpdates]);
  if (!v6) {
    return v6;
  }
LABEL_114:
  lastJoinedScanResult = self->_lastJoinedScanResult;
  if (!lastJoinedScanResult)
  {
    if (![a3 lastJoinedScanResult]) {
      goto LABEL_118;
    }
    lastJoinedScanResult = self->_lastJoinedScanResult;
  }
  int v6 = -[W5WiFiScanResult isEqual:](lastJoinedScanResult, "isEqual:", [a3 lastJoinedScanResult]);
  if (!v6) {
    return v6;
  }
LABEL_118:
  lastJoinedPreferredNetworuint64_t k = self->_lastJoinedPreferredNetwork;
  if (lastJoinedPreferredNetwork) {
    goto LABEL_121;
  }
  if ([a3 lastJoinedPreferredNetwork])
  {
    lastJoinedPreferredNetworuint64_t k = self->_lastJoinedPreferredNetwork;
LABEL_121:
    int v6 = -[W5WiFiPreferredNetwork isEqual:](lastJoinedPreferredNetwork, "isEqual:", [a3 lastJoinedPreferredNetwork]);
    if (!v6) {
      return v6;
    }
  }
  cachedScanResults = self->_cachedScanResults;
  if (!cachedScanResults)
  {
    if (![a3 cachedScanResults])
    {
LABEL_126:
      int smartCCADesenseSupported = self->_smartCCADesenseSupported;
      if (smartCCADesenseSupported == [a3 smartCCADesenseSupported])
      {
        int smartCCADesenseUSBPresence = self->_smartCCADesenseUSBPresence;
        if (smartCCADesenseUSBPresence == [a3 smartCCADesenseUSBPresence])
        {
          int isSnifferSupported = self->_isSnifferSupported;
          LOBYTE(v6) = isSnifferSupported == [a3 isSnifferSupported];
          return v6;
        }
      }
LABEL_129:
      LOBYTE(v6) = 0;
      return v6;
    }
    cachedScanResults = self->_cachedScanResults;
  }
  int v6 = -[NSArray isEqual:](cachedScanResults, "isEqual:", [a3 cachedScanResults]);
  if (v6) {
    goto LABEL_126;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5WiFiStatus *)self isEqualToWiFiStatus:a3];
}

- (unint64_t)hash
{
  NSUInteger v46 = [(NSString *)self->_macAddress hash];
  NSUInteger v45 = [(NSString *)self->_hardwareMACAddress hash];
  NSUInteger v44 = [(NSString *)self->_interfaceName hash];
  uint64_t v43 = [(NSArray *)self->_capabilities hash];
  BOOL powerOn = self->_powerOn;
  uint64_t v42 = [(NSData *)self->_power hash];
  uint64_t opMode = self->_opMode;
  NSUInteger v41 = [(NSString *)self->_ssidString hash];
  uint64_t v39 = [(NSData *)self->_ssid hash];
  NSUInteger v38 = [(NSString *)self->_bssid hash];
  uint64_t v36 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", self->_rssi), "hash");
  uint64_t v35 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_cca), "hash");
  uint64_t v34 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", self->_noise), "hash");
  uint64_t v33 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_txRate), "hash");
  unsigned int eapolSupplicantState = self->_eapolSupplicantState;
  unsigned int eapolControlMode = self->_eapolControlMode;
  int phyMode = self->_phyMode;
  int8x16_t v30 = *(int8x16_t *)&self->_guardInterval;
  int8x16_t v28 = *(int8x16_t *)&self->_security;
  unint64_t v32 = [(W5WiFiChannel *)self->_channel hash];
  uint64_t v31 = [(NSArray *)self->_supportedChannels hash];
  NSUInteger v29 = [(NSString *)self->_countryCode hash];
  NSUInteger v24 = [(NSString *)self->_networkServiceID hash];
  int64_t ipv4ConfigMethod = self->_ipv4ConfigMethod;
  int64_t ipv6ConfigMethod = self->_ipv6ConfigMethod;
  uint64_t v23 = [(NSArray *)self->_ipv4Addresses hash];
  uint64_t v21 = [(NSArray *)self->_ipv6Addresses hash];
  NSUInteger v19 = [(NSString *)self->_ipv4RouterAddress hash];
  NSUInteger v18 = [(NSString *)self->_ipv6RouterAddress hash];
  uint64_t v17 = [(NSArray *)self->_dnsAddresses hash];
  uint64_t v16 = [(NSData *)self->_chainAck hash];
  uint64_t v15 = [(NSData *)self->_txChainPower hash];
  uint64_t v3 = [(NSData *)self->_desense hash];
  uint64_t v4 = [(NSData *)self->_desenseLevel hash];
  uint64_t v5 = [(NSData *)self->_btcConfig hash];
  int btcMode = self->_btcMode;
  uint64_t v7 = [(NSData *)self->_btcProfiles2GHz hash];
  uint64_t v8 = [(NSData *)self->_btcProfiles5GHz hash];
  uint64_t v9 = [(NSArray *)self->_linkQualityUpdates hash];
  unint64_t v10 = [(W5WiFiScanResult *)self->_lastJoinedScanResult hash];
  unint64_t v11 = [(W5WiFiPreferredNetwork *)self->_lastJoinedPreferredNetwork hash];
  uint64_t v12 = [(NSArray *)self->_cachedScanResults hash];
  int8x16_t v13 = veorq_s8(v28, v30);
  return *(void *)&veor_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)) ^ ipv4ConfigMethod ^ ipv6ConfigMethod ^ opMode ^ eapolControlMode ^ eapolSupplicantState ^ phyMode ^ btcMode ^ v12 ^ v11 ^ v10 ^ v9 ^ powerOn ^ self->_smartCCADesenseSupported ^ self->_smartCCADesenseUSBPresence ^ self->_isSnifferSupported ^ v8 ^ v7 ^ v5 ^ v4 ^ v3 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v21 ^ v23 ^ v24 ^ v29 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v38 ^ v39 ^ v41 ^ v42 ^ v43 ^ v44 ^ v45 ^ v46;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[W5WiFiStatus allocWithZone:a3] init];
  [(W5WiFiStatus *)v4 setMacAddress:self->_macAddress];
  [(W5WiFiStatus *)v4 setHardwareMACAddress:self->_hardwareMACAddress];
  [(W5WiFiStatus *)v4 setInterfaceName:self->_interfaceName];
  [(W5WiFiStatus *)v4 setCapabilities:self->_capabilities];
  [(W5WiFiStatus *)v4 setPower:self->_power];
  [(W5WiFiStatus *)v4 setPowerOn:self->_powerOn];
  [(W5WiFiStatus *)v4 setOpMode:self->_opMode];
  [(W5WiFiStatus *)v4 setSsidString:self->_ssidString];
  [(W5WiFiStatus *)v4 setSsid:self->_ssid];
  [(W5WiFiStatus *)v4 setBssid:self->_bssid];
  [(W5WiFiStatus *)v4 setRssi:self->_rssi];
  [(W5WiFiStatus *)v4 setCca:self->_cca];
  [(W5WiFiStatus *)v4 setNoise:self->_noise];
  [(W5WiFiStatus *)v4 setTxRate:self->_txRate];
  [(W5WiFiStatus *)v4 setPhyMode:self->_phyMode];
  [(W5WiFiStatus *)v4 setMcsIndex:self->_mcsIndex];
  [(W5WiFiStatus *)v4 setGuardInterval:self->_guardInterval];
  [(W5WiFiStatus *)v4 setNumberOfSpacialStreams:self->_numberOfSpacialStreams];
  [(W5WiFiStatus *)v4 setSecurity:self->_security];
  [(W5WiFiStatus *)v4 setEapolControlMode:self->_eapolControlMode];
  [(W5WiFiStatus *)v4 setEapolSupplicantState:self->_eapolSupplicantState];
  [(W5WiFiStatus *)v4 setChannel:self->_channel];
  [(W5WiFiStatus *)v4 setSupportedChannels:self->_supportedChannels];
  [(W5WiFiStatus *)v4 setCountryCode:self->_countryCode];
  [(W5WiFiStatus *)v4 setNetworkServiceID:self->_networkServiceID];
  [(W5WiFiStatus *)v4 setIpv4ConfigMethod:self->_ipv4ConfigMethod];
  [(W5WiFiStatus *)v4 setIpv6ConfigMethod:self->_ipv6ConfigMethod];
  [(W5WiFiStatus *)v4 setIpv4Addresses:self->_ipv4Addresses];
  [(W5WiFiStatus *)v4 setIpv6Addresses:self->_ipv6Addresses];
  [(W5WiFiStatus *)v4 setIpv4RouterAddress:self->_ipv4RouterAddress];
  [(W5WiFiStatus *)v4 setIpv6RouterAddress:self->_ipv6RouterAddress];
  [(W5WiFiStatus *)v4 setDnsAddresses:self->_dnsAddresses];
  [(W5WiFiStatus *)v4 setChainAck:self->_chainAck];
  [(W5WiFiStatus *)v4 setTxChainPower:self->_txChainPower];
  [(W5WiFiStatus *)v4 setDesense:self->_desense];
  [(W5WiFiStatus *)v4 setDesenseLevel:self->_desenseLevel];
  [(W5WiFiStatus *)v4 setBtcConfig:self->_btcConfig];
  [(W5WiFiStatus *)v4 setBtcMode:self->_btcMode];
  [(W5WiFiStatus *)v4 setBtcProfiles2GHz:self->_btcProfiles2GHz];
  [(W5WiFiStatus *)v4 setBtcProfiles5GHz:self->_btcProfiles5GHz];
  [(W5WiFiStatus *)v4 setLinkQualityUpdates:self->_linkQualityUpdates];
  [(W5WiFiStatus *)v4 setLastJoinedScanResult:self->_lastJoinedScanResult];
  [(W5WiFiStatus *)v4 setLastJoinedPreferredNetwork:self->_lastJoinedPreferredNetwork];
  [(W5WiFiStatus *)v4 setCachedScanResults:self->_cachedScanResults];
  [(W5WiFiStatus *)v4 setSmartCCADesenseSupported:self->_smartCCADesenseSupported];
  [(W5WiFiStatus *)v4 setSmartCCADesenseUSBPresence:self->_smartCCADesenseUSBPresence];
  [(W5WiFiStatus *)v4 setIsSnifferSupported:self->_isSnifferSupported];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_macAddress forKey:@"_macAddress"];
  [a3 encodeObject:self->_hardwareMACAddress forKey:@"_hardwareMACAddress"];
  [a3 encodeObject:self->_interfaceName forKey:@"_interfaceName"];
  [a3 encodeObject:self->_capabilities forKey:@"_capabilities"];
  [a3 encodeBool:self->_powerOn forKey:@"_powerOn"];
  [a3 encodeObject:self->_power forKey:@"_power"];
  [a3 encodeInt:self->_opMode forKey:@"_opMode"];
  [a3 encodeObject:self->_ssidString forKey:@"_ssidString"];
  [a3 encodeObject:self->_ssid forKey:@"_ssid"];
  [a3 encodeObject:self->_bssid forKey:@"_bssid"];
  [a3 encodeInteger:self->_rssi forKey:@"_rssi"];
  [a3 encodeInteger:self->_cca forKey:@"_cca"];
  [a3 encodeInteger:self->_noise forKey:@"_noise"];
  [a3 encodeDouble:@"_txRate" forKey:self->_txRate];
  [a3 encodeInteger:self->_security forKey:@"_security"];
  [a3 encodeInt:self->_eapolControlMode forKey:@"_eapolControlMode"];
  [a3 encodeInt:self->_eapolSupplicantState forKey:@"_eapolSupplicantState"];
  [a3 encodeInt:self->_phyMode forKey:@"_phyMode"];
  [a3 encodeInteger:self->_mcsIndex forKey:@"_mcsIndex"];
  [a3 encodeInteger:self->_guardInterval forKey:@"_guardInterval"];
  [a3 encodeInteger:self->_numberOfSpacialStreams forKey:@"_numberOfSpacialStreams"];
  [a3 encodeObject:self->_channel forKey:@"_channel"];
  [a3 encodeObject:self->_supportedChannels forKey:@"_supportedChannels"];
  [a3 encodeObject:self->_countryCode forKey:@"_countryCode"];
  [a3 encodeObject:self->_networkServiceID forKey:@"_networkServiceID"];
  [a3 encodeInteger:self->_ipv4ConfigMethod forKey:@"_ipv4ConfigMethod"];
  [a3 encodeInteger:self->_ipv6ConfigMethod forKey:@"_ipv6ConfigMethod"];
  [a3 encodeObject:self->_ipv4Addresses forKey:@"_ipv4Addresses"];
  [a3 encodeObject:self->_ipv6Addresses forKey:@"_ipv6Addresses"];
  [a3 encodeObject:self->_ipv4RouterAddress forKey:@"_ipv4RouterAddress"];
  [a3 encodeObject:self->_ipv6RouterAddress forKey:@"_ipv6RouterAddress"];
  [a3 encodeObject:self->_dnsAddresses forKey:@"_dnsAddresses"];
  [a3 encodeObject:self->_chainAck forKey:@"_chainAck"];
  [a3 encodeObject:self->_txChainPower forKey:@"_txChainPower"];
  [a3 encodeObject:self->_desense forKey:@"_desense"];
  [a3 encodeObject:self->_desenseLevel forKey:@"_desenseLevel"];
  [a3 encodeObject:self->_btcConfig forKey:@"_btcConfig"];
  [a3 encodeObject:self->_btcProfiles2GHz forKey:@"_btcProfiles2GHz"];
  [a3 encodeObject:self->_btcProfiles5GHz forKey:@"_btcProfiles5GHz"];
  [a3 encodeInt:self->_btcMode forKey:@"_btcMode"];
  [a3 encodeObject:self->_linkQualityUpdates forKey:@"_linkQualityUpdates"];
  [a3 encodeObject:self->_lastJoinedScanResult forKey:@"_lastJoinedScanResult"];
  [a3 encodeObject:self->_lastJoinedPreferredNetwork forKey:@"_lastJoinedPreferredNetwork"];
  [a3 encodeObject:self->_cachedScanResults forKey:@"_cachedScanResults"];
  [a3 encodeBool:self->_smartCCADesenseSupported forKey:@"_smartCCADesenseSupported"];
  [a3 encodeBool:self->_smartCCADesenseUSBPresence forKey:@"_smartCCADesenseUSBPresence"];
  BOOL isSnifferSupported = self->_isSnifferSupported;
  [a3 encodeBool:isSnifferSupported forKey:@"_isSnifferSupported"];
}

- (W5WiFiStatus)initWithCoder:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)W5WiFiStatus;
  uint64_t v4 = [(W5WiFiStatus *)&v21 init];
  if (v4)
  {
    v4->_macAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_macAddress"), "copy");
    v4->_hardwareMACAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_hardwareMACAddress"), "copy");
    v4->_interfaceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_interfaceName"), "copy");
    uint64_t v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->_capabilities = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"_capabilities"), "copy");
    v4->_BOOL powerOn = [a3 decodeBoolForKey:@"_powerOn"];
    v4->_power = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_power"), "copy");
    v4->_uint64_t opMode = [a3 decodeIntForKey:@"_opMode"];
    v4->_ssidString = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_ssidString"), "copy");
    v4->_ssid = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_ssid"), "copy");
    v4->_bssid = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_bssid"), "copy");
    v4->_rssuint64_t i = [a3 decodeIntegerForKey:@"_rssi"];
    v4->_unint64_t cca = [a3 decodeIntegerForKey:@"_cca"];
    v4->_int64_t noise = [a3 decodeIntegerForKey:@"_noise"];
    [a3 decodeDoubleForKey:@"_txRate"];
    v4->_unint64_t txRate = v7;
    v4->_int64_t security = [a3 decodeIntegerForKey:@"_security"];
    v4->_unsigned int eapolControlMode = [a3 decodeIntForKey:@"_eapolControlMode"];
    v4->_unsigned int eapolSupplicantState = [a3 decodeIntForKey:@"_eapolSupplicantState"];
    v4->_int phyMode = [a3 decodeIntForKey:@"_phyMode"];
    v4->_unint64_t mcsIndex = [a3 decodeIntegerForKey:@"_mcsIndex"];
    v4->_unint64_t guardInterval = [a3 decodeIntegerForKey:@"_guardInterval"];
    v4->_unint64_t numberOfSpacialStreams = [a3 decodeIntegerForKey:@"_numberOfSpacialStreams"];
    v4->_channel = (W5WiFiChannel *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_channel"), "copy");
    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v4->_supportedChannels = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0), @"_supportedChannels"), "copy");
    v4->_countryCode = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_countryCode"), "copy");
    v4->_networkServiceID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_networkServiceID"), "copy");
    v4->_int64_t ipv4ConfigMethod = [a3 decodeIntegerForKey:@"_ipv4ConfigMethod"];
    v4->_int64_t ipv6ConfigMethod = [a3 decodeIntegerForKey:@"_ipv6ConfigMethod"];
    unint64_t v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v4->_ipv4Addresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), @"_ipv4Addresses"), "copy");
    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v4->_ipv6Addresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0), @"_ipv6Addresses"), "copy");
    v4->_ipv4RouterAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_ipv4RouterAddress"), "copy");
    v4->_ipv6RouterAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_ipv6RouterAddress"), "copy");
    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    v4->_dnsAddresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0), @"_dnsAddresses"), "copy");
    v4->_chainAcuint64_t k = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_chainAck"), "copy");
    v4->_txChainPower = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_txChainPower"), "copy");
    v4->_desense = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_desense"), "copy");
    v4->_desenseLevel = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_desenseLevel"), "copy");
    v4->_btcConfig = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_btcConfig"), "copy");
    v4->_btcProfiles2GHz = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_btcProfiles2GHz"), "copy");
    v4->_btcProfiles5GHz = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_btcProfiles5GHz"), "copy");
    v4->_int btcMode = [a3 decodeIntForKey:@"_btcMode"];
    uint64_t v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    v4->_linkQualityUpdates = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0), @"_linkQualityUpdates"), "copy");
    v4->_lastJoinedScanResult = (W5WiFiScanResult *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_lastJoinedScanResult"), "copy");
    v4->_lastJoinedPreferredNetworuint64_t k = (W5WiFiPreferredNetwork *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_lastJoinedPreferredNetwork"), "copy");
    NSUInteger v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    v4->_cachedScanResults = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0), @"_cachedScanResults"), "copy");
    v4->_int smartCCADesenseSupported = [a3 decodeBoolForKey:@"_smartCCADesenseSupported"];
    v4->_int smartCCADesenseUSBPresence = [a3 decodeBoolForKey:@"_smartCCADesenseUSBPresence"];
    v4->_BOOL isSnifferSupported = [a3 decodeBoolForKey:@"_isSnifferSupported"];
  }
  return v4;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BOOL)powerOn
{
  return self->_powerOn;
}

- (void)setPowerOn:(BOOL)a3
{
  self->_BOOL powerOn = a3;
}

- (NSData)power
{
  return self->_power;
}

- (void)setPower:(id)a3
{
}

- (int)opMode
{
  return self->_opMode;
}

- (void)setOpMode:(int)a3
{
  self->_uint64_t opMode = a3;
}

- (NSString)ssidString
{
  return self->_ssidString;
}

- (void)setSsidString:(id)a3
{
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssuint64_t i = a3;
}

- (unint64_t)cca
{
  return self->_cca;
}

- (void)setCca:(unint64_t)a3
{
  self->_unint64_t cca = a3;
}

- (int64_t)noise
{
  return self->_noise;
}

- (void)setNoise:(int64_t)a3
{
  self->_int64_t noise = a3;
}

- (double)txRate
{
  return self->_txRate;
}

- (void)setTxRate:(double)a3
{
  self->_unint64_t txRate = a3;
}

- (int64_t)security
{
  return self->_security;
}

- (void)setSecurity:(int64_t)a3
{
  self->_int64_t security = a3;
}

- (unsigned)eapolControlMode
{
  return self->_eapolControlMode;
}

- (void)setEapolControlMode:(unsigned int)a3
{
  self->_unsigned int eapolControlMode = a3;
}

- (unsigned)eapolSupplicantState
{
  return self->_eapolSupplicantState;
}

- (void)setEapolSupplicantState:(unsigned int)a3
{
  self->_unsigned int eapolSupplicantState = a3;
}

- (int)phyMode
{
  return self->_phyMode;
}

- (void)setPhyMode:(int)a3
{
  self->_int phyMode = a3;
}

- (unint64_t)mcsIndex
{
  return self->_mcsIndex;
}

- (void)setMcsIndex:(unint64_t)a3
{
  self->_unint64_t mcsIndex = a3;
}

- (unint64_t)guardInterval
{
  return self->_guardInterval;
}

- (void)setGuardInterval:(unint64_t)a3
{
  self->_unint64_t guardInterval = a3;
}

- (unint64_t)numberOfSpacialStreams
{
  return self->_numberOfSpacialStreams;
}

- (void)setNumberOfSpacialStreams:(unint64_t)a3
{
  self->_unint64_t numberOfSpacialStreams = a3;
}

- (W5WiFiChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSArray)linkQualityUpdates
{
  return self->_linkQualityUpdates;
}

- (NSArray)supportedChannels
{
  return self->_supportedChannels;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)networkServiceID
{
  return self->_networkServiceID;
}

- (void)setNetworkServiceID:(id)a3
{
}

- (int64_t)ipv4ConfigMethod
{
  return self->_ipv4ConfigMethod;
}

- (void)setIpv4ConfigMethod:(int64_t)a3
{
  self->_int64_t ipv4ConfigMethod = a3;
}

- (int64_t)ipv6ConfigMethod
{
  return self->_ipv6ConfigMethod;
}

- (void)setIpv6ConfigMethod:(int64_t)a3
{
  self->_int64_t ipv6ConfigMethod = a3;
}

- (NSArray)ipv4Addresses
{
  return self->_ipv4Addresses;
}

- (NSArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (NSString)ipv4RouterAddress
{
  return self->_ipv4RouterAddress;
}

- (void)setIpv4RouterAddress:(id)a3
{
}

- (NSString)ipv6RouterAddress
{
  return self->_ipv6RouterAddress;
}

- (void)setIpv6RouterAddress:(id)a3
{
}

- (NSArray)dnsAddresses
{
  return self->_dnsAddresses;
}

- (int)btcMode
{
  return self->_btcMode;
}

- (void)setBtcMode:(int)a3
{
  self->_int btcMode = a3;
}

- (NSData)chainAck
{
  return self->_chainAck;
}

- (void)setChainAck:(id)a3
{
}

- (NSData)txChainPower
{
  return self->_txChainPower;
}

- (void)setTxChainPower:(id)a3
{
}

- (NSData)desense
{
  return self->_desense;
}

- (void)setDesense:(id)a3
{
}

- (NSData)desenseLevel
{
  return self->_desenseLevel;
}

- (void)setDesenseLevel:(id)a3
{
}

- (NSData)btcConfig
{
  return self->_btcConfig;
}

- (void)setBtcConfig:(id)a3
{
}

- (NSData)btcProfiles2GHz
{
  return self->_btcProfiles2GHz;
}

- (void)setBtcProfiles2GHz:(id)a3
{
}

- (NSData)btcProfiles5GHz
{
  return self->_btcProfiles5GHz;
}

- (void)setBtcProfiles5GHz:(id)a3
{
}

- (W5WiFiScanResult)lastJoinedScanResult
{
  return self->_lastJoinedScanResult;
}

- (void)setLastJoinedScanResult:(id)a3
{
}

- (W5WiFiPreferredNetwork)lastJoinedPreferredNetwork
{
  return self->_lastJoinedPreferredNetwork;
}

- (void)setLastJoinedPreferredNetwork:(id)a3
{
}

- (NSArray)cachedScanResults
{
  return self->_cachedScanResults;
}

- (BOOL)smartCCADesenseSupported
{
  return self->_smartCCADesenseSupported;
}

- (void)setSmartCCADesenseSupported:(BOOL)a3
{
  self->_int smartCCADesenseSupported = a3;
}

- (BOOL)smartCCADesenseUSBPresence
{
  return self->_smartCCADesenseUSBPresence;
}

- (void)setSmartCCADesenseUSBPresence:(BOOL)a3
{
  self->_int smartCCADesenseUSBPresence = a3;
}

- (BOOL)isSnifferSupported
{
  return self->_isSnifferSupported;
}

- (void)setIsSnifferSupported:(BOOL)a3
{
  self->_BOOL isSnifferSupported = a3;
}

@end