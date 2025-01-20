@interface WifiScannedSettings
- (BOOL)cachedScan;
- (BOOL)targettedSsid;
- (WifiScannedSettings)init;
- (WifiScannedSettings)initWithSettings:(id)a3 cached:(BOOL)a4 at:(duration<long)long initiatedAt:()std:(1000000000>>)a5 :(duration<long)long ratio<1;
- (WifiScannerSettings)settings;
- (duration<long)initiatedTimestamp;
- (duration<long)timestamp;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)wifiError;
- (optional<BOOL>)merged;
- (optional<int>)scanRssiThreshold;
- (void)setMerged:(optional<BOOL>)a3;
- (void)setScanRssiThreshold:(optional<int>)a3;
- (void)setTargettedSsid:(BOOL)a3;
- (void)setWifiError:(int)a3;
@end

@implementation WifiScannedSettings

- (WifiScannedSettings)init
{
  return 0;
}

- (WifiScannedSettings)initWithSettings:(id)a3 cached:(BOOL)a4 at:(duration<long)long initiatedAt:()std:(1000000000>>)a5 :(duration<long)long ratio<1
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WifiScannedSettings;
  v12 = [(WifiScannedSettings *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_settings, a3);
    v13->_cachedScan = a4;
    v13->_initiatedTimestamp = a6;
    v13->_timestamp = a5;
    v13->_wifiError = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[WifiScannedSettings allocWithZone:a3];
  v5 = [(WifiScannedSettings *)self settings];
  v6 = [(WifiScannedSettings *)v4 initWithSettings:v5 cached:[(WifiScannedSettings *)self cachedScan] at:[(WifiScannedSettings *)self timestamp] initiatedAt:[(WifiScannedSettings *)self initiatedTimestamp]];

  return v6;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self->_cachedScan) {
    v4 = "true";
  }
  else {
    v4 = "false";
  }
  id v5 = [v3 initWithFormat:@"cached:%s,settings:%@,timestamp:%lld", v4, self->_settings, self->_timestamp.__rep_];

  return v5;
}

- (duration<long)initiatedTimestamp
{
  return self->_initiatedTimestamp;
}

- (duration<long)timestamp
{
  return self->_timestamp;
}

- (WifiScannerSettings)settings
{
  return self->_settings;
}

- (BOOL)cachedScan
{
  return self->_cachedScan;
}

- (optional<BOOL>)merged
{
  return self->_merged;
}

- (void)setMerged:(optional<BOOL>)a3
{
  self->_merged = a3;
}

- (optional<int>)scanRssiThreshold
{
  return self->_scanRssiThreshold;
}

- (void)setScanRssiThreshold:(optional<int>)a3
{
  self->_scanRssiThreshold = a3;
}

- (BOOL)targettedSsid
{
  return self->_targettedSsid;
}

- (void)setTargettedSsid:(BOOL)a3
{
  self->_targettedSsid = a3;
}

- (int)wifiError
{
  return self->_wifiError;
}

- (void)setWifiError:(int)a3
{
  self->_wifiError = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 10) = 0;
  *((unsigned char *)self + 40) = 0;
  return self;
}

@end