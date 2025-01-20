@interface ULWiFiRawScanSingleAP
- (BOOL)isPersonalHotSpot;
- (BOOL)isRssiInvalid;
- (BOOL)isRssiOffChannel;
- (NSDate)scanTimestamp;
- (NSString)BSSID;
- (NSString)SSID;
- (ULWiFiScanChannel)channel;
- (id)description;
- (int64_t)RSSI;
- (void)setBSSID:(id)a3;
- (void)setChannel:(id)a3;
- (void)setIsPersonalHotSpot:(BOOL)a3;
- (void)setIsRssiInvalid:(BOOL)a3;
- (void)setIsRssiOffChannel:(BOOL)a3;
- (void)setRSSI:(int64_t)a3;
- (void)setSSID:(id)a3;
- (void)setScanTimestamp:(id)a3;
@end

@implementation ULWiFiRawScanSingleAP

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  v7 = [(ULWiFiRawScanSingleAP *)self SSID];
  [v6 appendFormat:@", SSID: %@", v7];

  v8 = [(ULWiFiRawScanSingleAP *)self BSSID];
  [v6 appendFormat:@", BSSID: %@", v8];

  v9 = [(ULWiFiRawScanSingleAP *)self channel];
  [v6 appendFormat:@", channel: %@", v9];

  v10 = [(ULWiFiRawScanSingleAP *)self scanTimestamp];
  [v6 appendFormat:@", scanTimestamp: %@", v10];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[ULWiFiRawScanSingleAP RSSI](self, "RSSI"));
  [v6 appendFormat:@", RSSI: %@", v11];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ULWiFiRawScanSingleAP isRssiInvalid](self, "isRssiInvalid"));
  [v6 appendFormat:@", isRssiInvalid: %@", v12];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ULWiFiRawScanSingleAP isRssiOffChannel](self, "isRssiOffChannel"));
  [v6 appendFormat:@", isRssiOffChannel: %@", v13];

  [v6 appendString:@">"];
  return v6;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
}

- (ULWiFiScanChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSDate)scanTimestamp
{
  return self->_scanTimestamp;
}

- (void)setScanTimestamp:(id)a3
{
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int64_t)a3
{
  self->_RSSI = a3;
}

- (BOOL)isRssiInvalid
{
  return self->_isRssiInvalid;
}

- (void)setIsRssiInvalid:(BOOL)a3
{
  self->_isRssiInvalid = a3;
}

- (BOOL)isRssiOffChannel
{
  return self->_isRssiOffChannel;
}

- (void)setIsRssiOffChannel:(BOOL)a3
{
  self->_isRssiOffChannel = a3;
}

- (BOOL)isPersonalHotSpot
{
  return self->_isPersonalHotSpot;
}

- (void)setIsPersonalHotSpot:(BOOL)a3
{
  self->_isPersonalHotSpot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanTimestamp, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
}

@end