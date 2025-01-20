@interface CWFNetworkProfile(WiFiKitUIAdditions)
- (BOOL)isEquivalentRecord:()WiFiKitUIAdditions;
- (float)scaledRSSI;
- (id)title;
- (uint64_t)canBeDisplayedAsCurrent;
- (uint64_t)cellularSlicingIsEnabled;
- (uint64_t)hotspotBatteryLife;
- (uint64_t)hotspotCellularProtocol;
- (uint64_t)hotspotSignalStrength;
- (uint64_t)isAdhoc;
- (uint64_t)isEnterprise;
- (uint64_t)isInstantHotspot;
- (uint64_t)isKnown;
- (uint64_t)isPopular;
- (uint64_t)isSecure;
- (uint64_t)isUnconfiguredAccessory;
- (uint64_t)prominentDisplay;
- (uint64_t)rssi;
- (uint64_t)signalBars;
- (uint64_t)subtitle;
@end

@implementation CWFNetworkProfile(WiFiKitUIAdditions)

- (uint64_t)canBeDisplayedAsCurrent
{
  return 0;
}

- (uint64_t)hotspotBatteryLife
{
  return 0;
}

- (uint64_t)hotspotCellularProtocol
{
  return 0;
}

- (uint64_t)hotspotSignalStrength
{
  return 0;
}

- (uint64_t)isAdhoc
{
  return 0;
}

- (uint64_t)isEnterprise
{
  if ([a1 isEAP]) {
    return 1;
  }
  return [a1 isPSK];
}

- (BOOL)isEquivalentRecord:()WiFiKitUIAdditions
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [a1 networkName];
    v7 = [v5 networkName];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [a1 uniqueIdentifier];
      BOOL v9 = v8 == [v5 uniqueIdentifier];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (uint64_t)isInstantHotspot
{
  return 0;
}

- (uint64_t)isKnown
{
  return 1;
}

- (uint64_t)isPopular
{
  return 0;
}

- (uint64_t)isSecure
{
  return [a1 isOpen] ^ 1;
}

- (uint64_t)isUnconfiguredAccessory
{
  return 0;
}

- (uint64_t)prominentDisplay
{
  return 0;
}

- (uint64_t)rssi
{
  return 0;
}

- (float)scaledRSSI
{
  return 1.0;
}

- (uint64_t)signalBars
{
  [a1 scaledRSSI];
  return WFSignalBarsFromScaledRSSI();
}

- (uint64_t)subtitle
{
  return 0;
}

- (id)title
{
  if (![a1 isPasspoint]) {
    goto LABEL_6;
  }
  v2 = [a1 displayedOperatorName];

  if (v2)
  {
    v3 = [a1 displayedOperatorName];
    goto LABEL_7;
  }
  id v4 = [a1 domainName];

  if (v4)
  {
    v3 = [a1 domainName];
  }
  else
  {
LABEL_6:
    v3 = [a1 ssid];
  }
LABEL_7:
  return v3;
}

- (uint64_t)cellularSlicingIsEnabled
{
  return 0;
}

@end