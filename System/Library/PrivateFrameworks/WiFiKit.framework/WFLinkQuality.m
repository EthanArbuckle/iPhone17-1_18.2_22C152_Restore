@interface WFLinkQuality
- (BOOL)isEqual:(id)a3;
- (NSString)ssid;
- (WFLinkQuality)init;
- (WFLinkQuality)initWithSSID:(id)a3 rssi:(int64_t)a4 scaledRSSI:(float)a5;
- (float)scaledRssi;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)rssi;
- (void)setRssi:(int64_t)a3;
- (void)setScaledRssi:(float)a3;
- (void)setSsid:(id)a3;
@end

@implementation WFLinkQuality

- (void).cxx_destruct
{
}

- (WFLinkQuality)initWithSSID:(id)a3 rssi:(int64_t)a4 scaledRSSI:(float)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFLinkQuality;
  v10 = [(WFLinkQuality *)&v13 init];
  v11 = v10;
  if (v10 && (objc_storeStrong((id *)&v10->_ssid, a3), v11->_ssid))
  {
    v11->_rssi = a4;
    v11->_scaledRssi = a5;
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(WFLinkQuality *)self ssid];
  v6 = (void *)[v5 copyWithZone:a3];

  id v7 = objc_alloc((Class)objc_opt_class());
  int64_t v8 = [(WFLinkQuality *)self rssi];
  [(WFLinkQuality *)self scaledRssi];
  id v9 = objc_msgSend(v7, "initWithSSID:rssi:scaledRSSI:", v6, v8);

  return v9;
}

- (float)scaledRssi
{
  return self->_scaledRssi;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (WFLinkQuality)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-[WFLinkQuality init] unavailable" userInfo:0];
  objc_exception_throw(v2);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFLinkQuality *)self ssid];
  int64_t v7 = [(WFLinkQuality *)self rssi];
  [(WFLinkQuality *)self scaledRssi];
  id v9 = [v3 stringWithFormat:@"<%@: %p SSID: %@ RSSI: %d ScaledRSSI: %f>", v5, self, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  v5 = [(WFLinkQuality *)self ssid];
  v6 = [v4 ssid];
  if (![v5 isEqualToString:v6]
    || (int64_t v7 = -[WFLinkQuality rssi](self, "rssi"), v7 != [v4 rssi]))
  {

    goto LABEL_7;
  }
  [(WFLinkQuality *)self scaledRssi];
  float v9 = v8;
  [v4 scaledRssi];
  float v11 = v10;

  if (v9 != v11)
  {
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_8;
  }
  BOOL v12 = 1;
LABEL_8:

  return v12;
}

- (void)setSsid:(id)a3
{
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (void)setScaledRssi:(float)a3
{
  self->_scaledRssi = a3;
}

@end