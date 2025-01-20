@interface WFHotspotDevice
- (BOOL)_isEqualToHotspotDevice:(id)a3;
- (BOOL)_isEqualToNetwork:(id)a3;
- (BOOL)canBeDisplayedAsCurrent;
- (BOOL)cellularSlicingIsEnabled;
- (BOOL)iOSHotspot;
- (BOOL)isAdhoc;
- (BOOL)isEnterprise;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentRecord:(id)a3;
- (BOOL)isHotspot20;
- (BOOL)isInstantHotspot;
- (BOOL)isKnown;
- (BOOL)isPopular;
- (BOOL)isSecure;
- (BOOL)isUnconfiguredAccessory;
- (BOOL)prominentDisplay;
- (BOOL)shouldShowInKnownNetworkList;
- (BOOL)shouldShowInMyNetworkList;
- (NSString)description;
- (NSString)ssid;
- (SFRemoteHotspotDevice)hotspotDevice;
- (WFHotspotDevice)init;
- (WFHotspotDevice)initWithHotspotDevice:(id)a3;
- (float)scaledRSSI;
- (id)hotspotBatteryLife;
- (id)hotspotCellularProtocol;
- (id)hotspotSignalStrength;
- (id)lastJoinedDate;
- (id)subtitle;
- (id)title;
- (int64_t)rssi;
- (int64_t)securityMode;
- (unint64_t)hash;
- (unint64_t)signalBars;
- (void)setHotspotDevice:(id)a3;
- (void)setSsid:(id)a3;
@end

@implementation WFHotspotDevice

- (WFHotspotDevice)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-[WFHotspotDevice init] unavailable" userInfo:0];
  objc_exception_throw(v2);
}

- (WFHotspotDevice)initWithHotspotDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFHotspotDevice;
  v6 = [(WFHotspotDevice *)&v13 init];
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_hotspotDevice, a3);
    v8 = [(SFRemoteHotspotDevice *)v7->_hotspotDevice deviceName];
    if ((unint64_t)[v8 length] >= 0x21)
    {
      uint64_t v9 = objc_msgSend(v8, "substringWithRange:", 0, 32);

      v8 = (void *)v9;
    }
    uint64_t v10 = [v8 copy];
    ssid = (WFHotspotDevice *)v7->_ssid;
    v7->_ssid = (NSString *)v10;
  }
  else
  {
    ssid = v6;
    v7 = 0;
  }

  return v7;
}

- (int64_t)securityMode
{
  return 8;
}

- (NSString)description
{
  id v2 = [(WFHotspotDevice *)self hotspotDevice];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(WFHotspotDevice *)self _isEqualToHotspotDevice:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    BOOL v5 = [(WFHotspotDevice *)self _isEqualToNetwork:v4];
  }
  BOOL v6 = v5;
LABEL_7:

  return v6;
}

- (BOOL)_isEqualToHotspotDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFHotspotDevice *)self ssid];
  BOOL v6 = [v4 ssid];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(WFHotspotDevice *)self hotspotDevice];
    v8 = [v7 deviceIdentifier];
    uint64_t v9 = [v4 hotspotDevice];
    uint64_t v10 = [v9 deviceIdentifier];
    if ([v8 isEqualToString:v10])
    {
      v20 = [(WFHotspotDevice *)self hotspotDevice];
      v19 = [v20 signalStrength];
      uint64_t v11 = [v19 integerValue];
      v18 = [v4 hotspotDevice];
      v12 = [v18 signalStrength];
      if (v11 == [v12 integerValue])
      {
        v17 = [(WFHotspotDevice *)self hotspotDevice];
        int v13 = [v17 networkType];
        v14 = [v4 hotspotDevice];
        BOOL v15 = v13 == [v14 networkType];
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_isEqualToNetwork:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFHotspotDevice *)self ssid];
  BOOL v6 = [v4 ssid];
  if (![v5 isEqualToString:v6])
  {

    goto LABEL_7;
  }
  int64_t v7 = [(WFHotspotDevice *)self securityMode];
  if (v7 != [v4 securityMode])
  {
    char v8 = [v4 iOSHotspot];

    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }

LABEL_6:
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (unint64_t)hash
{
  v3 = [(WFHotspotDevice *)self hotspotDevice];
  id v4 = [v3 deviceIdentifier];
  uint64_t v5 = [v4 hash];
  int64_t v6 = [(WFHotspotDevice *)self securityMode] ^ v5;
  int64_t v7 = [(WFHotspotDevice *)self hotspotDevice];
  char v8 = [v7 signalStrength];
  uint64_t v9 = v6 ^ [v8 integerValue];
  uint64_t v10 = [(WFHotspotDevice *)self hotspotDevice];
  unint64_t v11 = v9 ^ [v10 networkType];

  return v11;
}

- (SFRemoteHotspotDevice)hotspotDevice
{
  return self->_hotspotDevice;
}

- (void)setHotspotDevice:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_hotspotDevice, 0);
}

- (BOOL)isHotspot20
{
  return 0;
}

- (id)title
{
  id v2 = [(WFHotspotDevice *)self hotspotDevice];
  v3 = [v2 deviceName];

  return v3;
}

- (BOOL)isAdhoc
{
  return 0;
}

- (int64_t)rssi
{
  return 0;
}

- (float)scaledRSSI
{
  return 1.0;
}

- (BOOL)isSecure
{
  return 1;
}

- (BOOL)iOSHotspot
{
  return 1;
}

- (BOOL)isInstantHotspot
{
  return 1;
}

- (BOOL)isUnconfiguredAccessory
{
  return 0;
}

- (id)hotspotBatteryLife
{
  id v2 = [(WFHotspotDevice *)self hotspotDevice];
  v3 = [v2 batteryLife];

  return v3;
}

- (id)hotspotSignalStrength
{
  id v2 = [(WFHotspotDevice *)self hotspotDevice];
  v3 = [v2 signalStrength];

  return v3;
}

- (id)hotspotCellularProtocol
{
  id v2 = [(WFHotspotDevice *)self hotspotDevice];
  v3 = [v2 cellularProtocolString];

  return v3;
}

- (id)subtitle
{
  return 0;
}

- (BOOL)canBeDisplayedAsCurrent
{
  return 1;
}

- (BOOL)isEnterprise
{
  return 0;
}

- (unint64_t)signalBars
{
  [(WFHotspotDevice *)self scaledRSSI];
  return WFSignalBarsFromScaledRSSI();
}

- (BOOL)prominentDisplay
{
  return 1;
}

- (BOOL)isPopular
{
  return 0;
}

- (BOOL)isKnown
{
  return 0;
}

- (BOOL)isEquivalentRecord:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(WFHotspotDevice *)self ssid];
    int64_t v7 = [v5 ssid];
    if ([v6 isEqualToString:v7])
    {
      unint64_t v8 = [(WFHotspotDevice *)self uniqueIdentifier];
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

- (id)lastJoinedDate
{
  return 0;
}

- (BOOL)shouldShowInMyNetworkList
{
  return 1;
}

- (BOOL)shouldShowInKnownNetworkList
{
  return 0;
}

- (BOOL)cellularSlicingIsEnabled
{
  return 0;
}

@end