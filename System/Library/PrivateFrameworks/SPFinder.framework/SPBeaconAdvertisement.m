@interface SPBeaconAdvertisement
+ (BOOL)supportsSecureCoding;
- (NSData)address;
- (NSData)batteryState;
- (NSData)deviceType;
- (NSData)publicKey;
- (NSDate)scanDate;
- (NSUUID)recordIdentifier;
- (SPBeaconAdvertisement)initWithAddress:(id)a3 publicKey:(id)a4 deviceType:(id)a5 batteryState:(id)a6 rawStatus:(unsigned __int8)a7 rssi:(int64_t)a8 scanDate:(id)a9 recordIdentifier:(id)a10;
- (SPBeaconAdvertisement)initWithCoder:(id)a3;
- (SPEstimatedLocation)location;
- (int64_t)rssi;
- (unsigned)rawStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setBatteryState:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setRawStatus:(unsigned __int8)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setRssi:(int64_t)a3;
- (void)setScanDate:(id)a3;
@end

@implementation SPBeaconAdvertisement

- (SPBeaconAdvertisement)initWithAddress:(id)a3 publicKey:(id)a4 deviceType:(id)a5 batteryState:(id)a6 rawStatus:(unsigned __int8)a7 rssi:(int64_t)a8 scanDate:(id)a9 recordIdentifier:(id)a10
{
  uint64_t v11 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  v25.receiver = self;
  v25.super_class = (Class)SPBeaconAdvertisement;
  v22 = [(SPBeaconAdvertisement *)&v25 init];
  v23 = v22;
  if (v22)
  {
    [(SPBeaconAdvertisement *)v22 setAddress:v16];
    [(SPBeaconAdvertisement *)v23 setPublicKey:v17];
    [(SPBeaconAdvertisement *)v23 setDeviceType:v18];
    [(SPBeaconAdvertisement *)v23 setBatteryState:v19];
    [(SPBeaconAdvertisement *)v23 setRawStatus:v11];
    [(SPBeaconAdvertisement *)v23 setRssi:a8];
    [(SPBeaconAdvertisement *)v23 setScanDate:v20];
    [(SPBeaconAdvertisement *)v23 setRecordIdentifier:v21];
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconAdvertisement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
  [(SPBeaconAdvertisement *)self setAddress:v5];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
  [(SPBeaconAdvertisement *)self setPublicKey:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceType"];
  [(SPBeaconAdvertisement *)self setDeviceType:v7];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryState"];
  [(SPBeaconAdvertisement *)self setBatteryState:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawStatus"];
  -[SPBeaconAdvertisement setRawStatus:](self, "setRawStatus:", [v9 unsignedIntegerValue]);

  -[SPBeaconAdvertisement setRssi:](self, "setRssi:", [v4 decodeIntegerForKey:@"rssi"]);
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scanDate"];
  [(SPBeaconAdvertisement *)self setScanDate:v10];

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordIdentifier"];
  [(SPBeaconAdvertisement *)self setRecordIdentifier:v11];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];

  [(SPBeaconAdvertisement *)self setLocation:v12];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPBeaconAdvertisement *)self address];
  [v4 encodeObject:v5 forKey:@"address"];

  v6 = [(SPBeaconAdvertisement *)self publicKey];
  [v4 encodeObject:v6 forKey:@"publicKey"];

  v7 = [(SPBeaconAdvertisement *)self deviceType];
  [v4 encodeObject:v7 forKey:@"deviceType"];

  v8 = [(SPBeaconAdvertisement *)self batteryState];
  [v4 encodeObject:v8 forKey:@"batteryState"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[SPBeaconAdvertisement rawStatus](self, "rawStatus"));
  [v4 encodeObject:v9 forKey:@"rawStatus"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPBeaconAdvertisement rssi](self, "rssi"), @"rssi");
  v10 = [(SPBeaconAdvertisement *)self scanDate];
  [v4 encodeObject:v10 forKey:@"scanDate"];

  uint64_t v11 = [(SPBeaconAdvertisement *)self recordIdentifier];
  [v4 encodeObject:v11 forKey:@"recordIdentifier"];

  id v12 = [(SPBeaconAdvertisement *)self location];
  [v4 encodeObject:v12 forKey:@"location"];
}

- (NSData)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (NSData)batteryState
{
  return self->_batteryState;
}

- (void)setBatteryState:(id)a3
{
}

- (unsigned)rawStatus
{
  return self->_rawStatus;
}

- (void)setRawStatus:(unsigned __int8)a3
{
  self->_rawStatus = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (void)setScanDate:(id)a3
{
}

- (SPEstimatedLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSUUID)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_scanDate, 0);
  objc_storeStrong((id *)&self->_batteryState, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end