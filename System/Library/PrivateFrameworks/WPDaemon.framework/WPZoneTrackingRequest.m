@interface WPZoneTrackingRequest
+ (BOOL)supportsSecureCoding;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)scanningRates;
- (BOOL)scanWhenScreenOff;
- (NSMutableSet)zones;
- (WPZoneTrackingRequest)init;
- (WPZoneTrackingRequest)initWithCoder:(id)a3;
- (id)description;
- (unsigned)clientType;
- (void)encodeWithCoder:(id)a3;
- (void)setClientType:(unsigned __int8)a3;
- (void)setScanWhenScreenOff:(BOOL)a3;
- (void)setScanningRates:(id *)a3;
- (void)setZones:(id)a3;
@end

@implementation WPZoneTrackingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WPZoneTrackingRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)WPZoneTrackingRequest;
  result = [(WPZoneTrackingRequest *)&v4 init];
  if (result)
  {
    *(void *)&long long v3 = 0xFFFFLL;
    *((void *)&v3 + 1) = 0xFFFFLL;
    *(_OWORD *)&result->_scanningRates.screenOnInterval = v3;
    result->_scanningRates.window = 0xFFFFLL;
    *(_WORD *)&result->_clientType = 27;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Zone tracking request with type %ld", -[WPZoneTrackingRequest clientType](self, "clientType"));
}

- (WPZoneTrackingRequest)initWithCoder:(id)a3
{
  v13[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WPZoneTrackingRequest;
  v5 = [(WPZoneTrackingRequest *)&v12 init];
  if (v5)
  {
    v5->_clientType = [v4 decodeIntegerForKey:@"kClientType"];
    v5->_scanningRates.screenOffInterval = [v4 decodeIntegerForKey:@"kScanningRatesScreenOff"];
    v5->_scanningRates.screenOnInterval = [v4 decodeIntegerForKey:@"kScanningRatesScreenOn"];
    v5->_scanningRates.window = [v4 decodeIntegerForKey:@"kScanningRatesWindow"];
    v5->_scanWhenScreenOff = [v4 decodeBoolForKey:@"kScanWhenScreenOff"];
    v6 = (void *)MEMORY[0x263EFFA08];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kZonesValue"];
    zones = v5->_zones;
    v5->_zones = (NSMutableSet *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPZoneTrackingRequest clientType](self, "clientType"), @"kClientType");
  [(WPZoneTrackingRequest *)self scanningRates];
  [v4 encodeInteger:v8 forKey:@"kScanningRatesScreenOn"];
  [(WPZoneTrackingRequest *)self scanningRates];
  [v4 encodeInteger:v7 forKey:@"kScanningRatesScreenOff"];
  [(WPZoneTrackingRequest *)self scanningRates];
  [v4 encodeInteger:v6 forKey:@"kScanningRatesWindow"];
  objc_msgSend(v4, "encodeBool:forKey:", -[WPZoneTrackingRequest scanWhenScreenOff](self, "scanWhenScreenOff"), @"kScanWhenScreenOff");
  v5 = [(WPZoneTrackingRequest *)self zones];
  [v4 encodeObject:v5 forKey:@"kZonesValue"];
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unsigned __int8)a3
{
  self->_clientType = a3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)scanningRates
{
  objc_copyStruct(retstr, &self->_scanningRates, 24, 1, 0);
  return result;
}

- (void)setScanningRates:(id *)a3
{
}

- (BOOL)scanWhenScreenOff
{
  return self->_scanWhenScreenOff;
}

- (void)setScanWhenScreenOff:(BOOL)a3
{
  self->_scanWhenScreenOff = a3;
}

- (NSMutableSet)zones
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setZones:(id)a3
{
}

- (void).cxx_destruct
{
}

@end