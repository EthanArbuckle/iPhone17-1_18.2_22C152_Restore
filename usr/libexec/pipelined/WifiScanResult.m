@interface WifiScanResult
- (BOOL)adHoc;
- (BOOL)captive;
- (BOOL)personalHotspot;
- (BOOL)requestsAnonymity;
- (NSString)bssid;
- (NSString)ssid;
- (WifiScanResult)init;
- (WifiScanResult)initWithAge:(duration<long)long bssid:()std:(1000000000>>)a3 :(id)a4 ratio<1 ssid:(id)a5 channel:(int)a6 rssi:(int)a7 flags:(unsigned int)a8 adHoc:(BOOL)a9 personalHotspot:(BOOL)a10 captive:(BOOL)a11 mode:(int)a12;
- (double)ageTimeInterval;
- (duration<long)age;
- (id)description;
- (int)channel;
- (int)mode;
- (int)rssi;
- (unsigned)channelFlags;
@end

@implementation WifiScanResult

- (WifiScanResult)init
{
  return 0;
}

- (WifiScanResult)initWithAge:(duration<long)long bssid:()std:(1000000000>>)a3 :(id)a4 ratio<1 ssid:(id)a5 channel:(int)a6 rssi:(int)a7 flags:(unsigned int)a8 adHoc:(BOOL)a9 personalHotspot:(BOOL)a10 captive:(BOOL)a11 mode:(int)a12
{
  id v19 = a4;
  id v20 = a5;
  v25.receiver = self;
  v25.super_class = (Class)WifiScanResult;
  v21 = [(WifiScanResult *)&v25 init];
  v22 = v21;
  if (v21)
  {
    v21->_age = a3;
    objc_storeStrong((id *)&v21->_bssid, a4);
    objc_storeStrong((id *)&v22->_ssid, a5);
    v22->_rssi = a7;
    v22->_channelFlags = a8;
    v22->_adHoc = a9;
    v22->_personalHotspot = a10;
    v22->_captive = a11;
    v22->_channel = a6;
    v22->_mode = a12;
    v23 = v22;
  }

  return v22;
}

- (double)ageTimeInterval
{
  return (double)self->_age.__rep_ / 1000000000.0;
}

- (id)description
{
  return +[NSString stringWithFormat:@"channel: %d, bssid: %@, ssid: %@, rssi: %d, age: %lld", self->_channel, self->_bssid, self->_ssid, self->_rssi, self->_age.__rep_ / 1000000];
}

- (BOOL)requestsAnonymity
{
  return [(NSString *)self->_ssid hasSuffix:@"_nomap"];
}

- (BOOL)adHoc
{
  return self->_adHoc;
}

- (duration<long)age
{
  return self->_age;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (BOOL)captive
{
  return self->_captive;
}

- (int)channel
{
  return self->_channel;
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)personalHotspot
{
  return self->_personalHotspot;
}

- (int)rssi
{
  return self->_rssi;
}

- (unsigned)channelFlags
{
  return self->_channelFlags;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);

  objc_storeStrong((id *)&self->_bssid, 0);
}

@end