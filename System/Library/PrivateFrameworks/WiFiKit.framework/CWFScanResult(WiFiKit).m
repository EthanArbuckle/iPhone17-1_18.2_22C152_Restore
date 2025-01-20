@interface CWFScanResult(WiFiKit)
- (BOOL)supportsWiFiHealth;
- (id)configurationIssues;
- (id)ieDictionary;
- (id)privateAddressConfigDictionary;
- (id)privateAddressInfoDictionary;
- (id)securityIssue;
- (id)supportedEAPTypes;
- (uint64_t)carPlayNetworkType;
- (uint64_t)isCarPlay;
- (uint64_t)isHidden;
- (uint64_t)isSAE;
- (uint64_t)isSSIDAmbiguous;
- (uint64_t)phyMode;
- (uint64_t)requiresPassword;
- (uint64_t)requiresUsername;
- (uint64_t)supportsJoinFailureDiagnostics;
@end

@implementation CWFScanResult(WiFiKit)

- (uint64_t)requiresUsername
{
  if (![a1 isEAP]) {
    return 0;
  }
  v2 = [a1 supportedEAPTypes];
  v3 = [NSNumber numberWithInteger:13];
  if ([v2 containsObject:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    v5 = [NSNumber numberWithInteger:18];
    int v6 = [v2 containsObject:v5];

    uint64_t v4 = v6 ^ 1u;
  }

  return v4;
}

- (uint64_t)requiresPassword
{
  if ([a1 isEAP])
  {
    v2 = [a1 supportedEAPTypes];
    int v3 = [v2 containsObject:&unk_26D9E1F48];

    uint64_t v4 = [a1 supportedEAPTypes];
    if ([v4 containsObject:&unk_26D9E1F60])
    {
      int v5 = 1;
    }
    else
    {
      v7 = [a1 supportedEAPTypes];
      int v5 = [v7 containsObject:&unk_26D9E1F78];
    }
    return (v3 | v5) ^ 1u;
  }
  else if ([a1 isPSK])
  {
    return 1;
  }
  else
  {
    return [a1 isSAE];
  }
}

- (id)privateAddressInfoDictionary
{
  v1 = [a1 scanRecord];
  v2 = [v1 objectForKey:@"PrivateMacInfoDictionary"];

  return v2;
}

- (id)privateAddressConfigDictionary
{
  v1 = [a1 scanRecord];
  v2 = [v1 objectForKey:@"PRIVATE_MAC_ADDRESS"];

  return v2;
}

- (uint64_t)phyMode
{
  v1 = [a1 scanRecord];
  v2 = [v1 objectForKey:@"PHY_MODE"];
  uint64_t v3 = [v2 intValue];

  return v3;
}

- (uint64_t)isSSIDAmbiguous
{
  v1 = [a1 scanRecord];
  v2 = [v1 objectForKey:@"AmbiguousSSIDs"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)isHidden
{
  v2 = [a1 scanRecord];
  uint64_t v3 = [v2 objectForKey:@"UserDirected"];
  int v4 = [v3 BOOLValue];

  int v5 = [a1 scanRecord];
  int v6 = [v5 objectForKey:@"HIDDEN_NETWORK"];
  int v7 = [v6 BOOLValue];

  v8 = [a1 scanRecord];
  v9 = [v8 objectForKey:@"scanWasDirected"];
  int v10 = [v9 BOOLValue];

  v11 = [a1 networkName];
  if (v11)
  {
    v12 = [a1 networkName];
    if ([v12 isEqualToString:&stru_26D9BFD58])
    {
      int v13 = 1;
    }
    else
    {
      v14 = [a1 networkName];
      int v13 = [v14 isEqualToString:@" "];
    }
  }
  else
  {
    int v13 = 1;
  }

  return v4 | v7 | v10 | v13;
}

- (uint64_t)isCarPlay
{
  v2 = [a1 scanRecord];
  uint64_t v3 = [v2 objectForKey:@"APPLE_DEVICE_IE"];

  if (v3) {
    [a1 supportsCarPlay];
  }
  int v4 = [a1 scanRecord];
  int v5 = [v4 objectForKey:@"CARPLAY_NETWORK"];
  uint64_t v6 = [v5 BOOLValue];

  return v6;
}

- (uint64_t)carPlayNetworkType
{
  if (![a1 isCarPlay]) {
    return 0;
  }
  v2 = [a1 matchingKnownNetworkProfile];
  uint64_t v3 = [v2 lastJoinedByUserAt];
  if (v3)
  {

    return 2;
  }
  int v5 = [a1 matchingKnownNetworkProfile];
  uint64_t v6 = [v5 payloadUUID];

  if (v6) {
    return 2;
  }
  return 1;
}

- (id)ieDictionary
{
  v1 = [a1 scanRecord];
  v2 = [v1 objectForKey:@"APPLE_DEVICE_IE"];

  return v2;
}

- (id)supportedEAPTypes
{
  v1 = [a1 scanRecord];
  v2 = [v1 objectForKey:@"AcceptEAPTypes"];

  return v2;
}

- (uint64_t)isSAE
{
  v1 = [a1 scanRecord];
  v2 = [v1 objectForKey:@"RSN_IE"];

  if (v2
    && (([v2 objectForKey:@"IE_KEY_RSN_AUTHSELS"],
         (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([v2 objectForKey:@"IE_KEY_WPA_AUTHSELS"],
         (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    if ([v3 containsObject:&unk_26D9E1F18]) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [v3 containsObject:&unk_26D9E1F30];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)supportsWiFiHealth
{
  return [a1 carPlayNetworkType] != 1;
}

- (uint64_t)supportsJoinFailureDiagnostics
{
  if ([a1 isEAP] & 1) != 0 || (objc_msgSend(a1, "isPasspoint")) {
    return 0;
  }
  else {
    return [a1 isCarPlay] ^ 1;
  }
}

- (id)securityIssue
{
  if ([a1 isOpen] & 1) != 0 || (objc_msgSend(a1, "isOWE"))
  {
    uint64_t v2 = 8;
LABEL_4:
    uint64_t v3 = [MEMORY[0x263F863A8] issueWithType:v2];
    goto LABEL_5;
  }
  if (([a1 isWEP] & 1) != 0
    || [a1 WPAMulticastCipher] == 1
    || [a1 WPAMulticastCipher] == 5)
  {
    if (([a1 isEAP] & 1) == 0)
    {
      uint64_t v2 = 2;
      goto LABEL_4;
    }
  }
  else if ((([a1 isWPA] & 1) != 0 || objc_msgSend(a1, "isWPA2")) {
         && [a1 hasTKIPCipher])
  }
  {
    uint64_t v2 = 4096;
    goto LABEL_4;
  }
  uint64_t v3 = 0;
LABEL_5:
  return v3;
}

- (id)configurationIssues
{
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  uint64_t v3 = [a1 securityIssue];

  if (v3)
  {
    uint64_t v4 = [a1 securityIssue];
    [v2 addObject:v4];
  }
  if ([a1 isSSIDAmbiguous])
  {
    int v5 = [MEMORY[0x263F863A8] issueWithType:32];
    [v2 addObject:v5];
  }
  if ([a1 phyMode] == 4)
  {
    uint64_t v6 = [MEMORY[0x263F863A8] issueWithType:16];
    [v2 addObject:v6];
  }
  return v2;
}

@end