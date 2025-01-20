@interface ULWiFiAssociatedState
- (BOOL)isAssociated;
- (NSDate)time;
- (NSString)BSSID;
- (ULWiFiAssociatedState)initWithChannel:(id)a3 BSSID:(id)a4 RSSI:(int64_t)a5 time:(id)a6;
- (ULWiFiScanChannel)channel;
- (id)description;
- (int64_t)RSSI;
- (void)setBSSID:(id)a3;
- (void)setChannel:(id)a3;
- (void)setIsAssociated:(BOOL)a3;
- (void)setRSSI:(int64_t)a3;
- (void)setTime:(id)a3;
@end

@implementation ULWiFiAssociatedState

- (ULWiFiAssociatedState)initWithChannel:(id)a3 BSSID:(id)a4 RSSI:(int64_t)a5 time:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ULWiFiAssociatedState;
  v13 = [(ULWiFiAssociatedState *)&v20 init];
  v14 = v13;
  if (v13)
  {
    [(ULWiFiAssociatedState *)v13 setChannel:v10];
    [(ULWiFiAssociatedState *)v14 setBSSID:v11];
    [(ULWiFiAssociatedState *)v14 setRSSI:a5];
    [(ULWiFiAssociatedState *)v14 setTime:v12];
    uint64_t v15 = [(ULWiFiAssociatedState *)v14 channel];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [(ULWiFiAssociatedState *)v14 BSSID];
      BOOL v18 = v17 != 0;
    }
    else
    {
      BOOL v18 = 0;
    }
    [(ULWiFiAssociatedState *)v14 setIsAssociated:v18];
  }

  return v14;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  v7 = [(ULWiFiAssociatedState *)self channel];
  [v6 appendFormat:@", channel: %@", v7];

  v8 = [(ULWiFiAssociatedState *)self BSSID];
  [v6 appendFormat:@", BSSID: %@", v8];

  v9 = [(ULWiFiAssociatedState *)self time];
  [v6 appendFormat:@", time: %@", v9];

  [v6 appendString:@">"];
  return v6;
}

- (ULWiFiScanChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
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

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (BOOL)isAssociated
{
  return self->_isAssociated;
}

- (void)setIsAssociated:(BOOL)a3
{
  self->_isAssociated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

@end