@interface WFUserSuppliedNetwork
- (BOOL)canBeDisplayedAsCurrent;
- (BOOL)iOSHotspot;
- (BOOL)isAdhoc;
- (BOOL)isEnterprise;
- (BOOL)isInstantHotspot;
- (BOOL)isSecure;
- (BOOL)isUnconfiguredAccessory;
- (NSString)password;
- (NSString)ssid;
- (NSString)username;
- (__SecIdentity)TLSIdentity;
- (float)scaledRSSI;
- (id)hotspotBatteryLife;
- (id)hotspotCellularProtocol;
- (id)hotspotSignalStrength;
- (id)subtitle;
- (int64_t)rssi;
- (int64_t)security;
- (unint64_t)signalBars;
- (void)setPassword:(id)a3;
- (void)setSecurity:(int64_t)a3;
- (void)setSsid:(id)a3;
- (void)setTLSIdentity:(__SecIdentity *)a3;
- (void)setUsername:(id)a3;
@end

@implementation WFUserSuppliedNetwork

- (BOOL)canBeDisplayedAsCurrent
{
  return 1;
}

- (id)hotspotBatteryLife
{
  return &unk_26D9E1E58;
}

- (id)hotspotCellularProtocol
{
  return 0;
}

- (id)hotspotSignalStrength
{
  return 0;
}

- (BOOL)iOSHotspot
{
  return 0;
}

- (BOOL)isAdhoc
{
  return 0;
}

- (BOOL)isEnterprise
{
  return 0;
}

- (BOOL)isInstantHotspot
{
  return 0;
}

- (BOOL)isSecure
{
  return 0;
}

- (BOOL)isUnconfiguredAccessory
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

- (unint64_t)signalBars
{
  return 3;
}

- (id)subtitle
{
  return 0;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (int64_t)security
{
  return self->_security;
}

- (void)setSecurity:(int64_t)a3
{
  self->_security = a3;
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

- (__SecIdentity)TLSIdentity
{
  return self->_TLSIdentity;
}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  self->_TLSIdentity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end