@interface CWFNetworkProfile(WiFiKit)
- (BOOL)forgetable;
- (BOOL)isManaged;
- (BOOL)saveDataModeConfigurable;
- (double)networkQualityResponsiveness;
- (id)accessoryIdentifier;
- (id)displayFriendlyName;
- (id)networkQualityDate;
- (id)randomMACAddress;
- (uint64_t)autoJoinConfigurable;
- (uint64_t)autoLoginConfigurable;
- (uint64_t)carPlayNetworkType;
- (uint64_t)hasDisabledUntilDate;
- (uint64_t)hasJoined6GHz;
- (uint64_t)networkQualityVisible;
- (uint64_t)randomMACAddressConfigurable;
- (uint64_t)shouldShowInKnownNetworkList;
- (uint64_t)shouldShowInMyNetworkList;
- (uint64_t)wifiModeConfigurable;
@end

@implementation CWFNetworkProfile(WiFiKit)

- (uint64_t)carPlayNetworkType
{
  if (![a1 isCarPlay]) {
    return 0;
  }
  v2 = [a1 lastJoinedByUserAt];
  if (v2)
  {

    return 2;
  }
  v4 = [a1 payloadUUID];

  if (v4) {
    return 2;
  }
  return 1;
}

- (id)displayFriendlyName
{
  v1 = [a1 OSSpecificAttributes];
  v2 = [v1 objectForKeyedSubscript:@"DisplayFriendlyName"];

  return v2;
}

- (uint64_t)wifiModeConfigurable
{
  uint64_t v2 = [a1 disable6EMode];
  if (_os_feature_enabled_impl()) {
    int v3 = _os_feature_enabled_impl() ^ 1;
  }
  else {
    int v3 = 1;
  }
  int v4 = [a1 isStandalone6G] | v3;
  if ((v4 & 1) != 0 || v2 == 2) {
    return v4 ^ 1u;
  }
  return [a1 hasJoined6GHz];
}

- (uint64_t)hasJoined6GHz
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(a1, "BSSList", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = [*(id *)(*((void *)&v8 + 1) + 8 * i) channel];
        int v6 = [v5 band];

        if (v6 == 3)
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)shouldShowInKnownNetworkList
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2)
  {
    int v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      v5 = [a1 networkName];
      int v7 = 136316162;
      long long v8 = "-[CWFNetworkProfile(WiFiKit) shouldShowInKnownNetworkList]";
      __int16 v9 = 2112;
      long long v10 = v5;
      __int16 v11 = 1024;
      int v12 = [a1 shouldShowInMyNetworkList];
      __int16 v13 = 1024;
      int v14 = [a1 isPersonalHotspot];
      __int16 v15 = 1024;
      int v16 = [a1 isAppBased];
      _os_log_impl(&dword_226071000, v4, v3, "%s: networkName='%@' shouldShowInMyNetworkList=%d isPersonalHotspot=%d isAppBased=%d", (uint8_t *)&v7, 0x28u);
    }
  }

  if ([a1 shouldShowInMyNetworkList]
    && ![a1 isPersonalHotspot])
  {
    return 1;
  }
  else
  {
    return [a1 isAppBased];
  }
}

- (uint64_t)shouldShowInMyNetworkList
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 lastJoinedAt];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v3 setDay:14];
    int v4 = [MEMORY[0x263EFF8F0] currentCalendar];
    v5 = [v4 dateByAddingComponents:v3 toDate:v2 options:0];

    int v6 = [MEMORY[0x263EFF910] date];
    uint64_t v7 = [v6 compare:v5];

    int v8 = [a1 isOpen];
    if (v7 == 1) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    long long v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v10)
    {
      int v12 = v10;
      if (os_log_type_enabled(v12, v11))
      {
        BOOL v13 = v7 == 1;
        int v14 = [a1 networkName];
        int v17 = 138412802;
        v18 = v14;
        __int16 v19 = 1024;
        BOOL v20 = v13;
        __int16 v21 = 1024;
        int v22 = [a1 isOpen];
        _os_log_impl(&dword_226071000, v12, v11, "%@ did pass last joined checkpoint: %d, is open: %d", (uint8_t *)&v17, 0x18u);
      }
    }

    uint64_t v15 = v9 ^ 1u;
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

- (BOOL)isManaged
{
  v1 = [a1 payloadUUID];
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)forgetable
{
  return ([a1 isManaged] & 1) == 0 && objc_msgSend(a1, "carPlayNetworkType") != 1;
}

- (uint64_t)autoLoginConfigurable
{
  uint64_t result = [a1 isCaptive];
  if (result) {
    return [a1 addReason] != 10;
  }
  return result;
}

- (uint64_t)autoJoinConfigurable
{
  return [a1 isPersonalHotspot] ^ 1;
}

- (BOOL)saveDataModeConfigurable
{
  return [a1 carPlayNetworkType] != 1;
}

- (uint64_t)networkQualityVisible
{
  return _os_feature_enabled_impl();
}

- (uint64_t)randomMACAddressConfigurable
{
  return 1;
}

- (id)randomMACAddress
{
  v1 = [a1 OSSpecificAttributes];
  BOOL v2 = [v1 objectForKey:@"PRIVATE_MAC_ADDRESS"];

  if (v2 && (CFDataRef v3 = (const __CFData *)[v2 objectForKey:@"PRIVATE_MAC_ADDRESS_VALUE"]) != 0)
  {
    int v4 = WFConvertEthernetNetworkAddressToString(v3);
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)networkQualityResponsiveness
{
  v1 = [a1 OSSpecificAttributes];
  BOOL v2 = [v1 objectForKey:*MEMORY[0x263F55EB8]];

  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (id)networkQualityDate
{
  v1 = [a1 OSSpecificAttributes];
  BOOL v2 = [v1 objectForKey:*MEMORY[0x263F55EB0]];

  return v2;
}

- (uint64_t)hasDisabledUntilDate
{
  id v0 = (id)WiFiNetworkCreateFromCoreWiFiNetworkProfile();
  return WiFiNetworkGetProperty();
}

- (id)accessoryIdentifier
{
  v1 = [a1 OSSpecificAttributes];
  BOOL v2 = [v1 objectForKeyedSubscript:@"AccessoryIdentifier"];

  return v2;
}

@end