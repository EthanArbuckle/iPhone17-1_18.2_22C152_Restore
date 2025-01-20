@interface FMDBLEBeacon
+ (BOOL)supportsSecureCoding;
- (BOOL)active;
- (BOOL)isEqual:(id)a3;
- (BOOL)primary;
- (BOOL)utpConnected;
- (FMDAccessoryStyleDescriptor)styleDescriptor;
- (FMDBLEBeacon)init;
- (FMDBLEBeacon)initWithCoder:(id)a3;
- (FMDBLEBeacon)initWithConfiguration:(id)a3;
- (FMDBLEBeacon)initWithDictionary:(id)a3;
- (FMDBLEBeaconIdentifier)identifier;
- (NSDate)updateDate;
- (NSDictionary)dictionaryValue;
- (NSNumber)colorCode;
- (NSNumber)rssi;
- (NSString)name;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setColorCode:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setRssi:(id)a3;
- (void)setStyleDescriptor:(id)a3;
- (void)setUpdateDate:(id)a3;
- (void)setUtpConnected:(BOOL)a3;
@end

@implementation FMDBLEBeacon

- (FMDBLEBeacon)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMDBLEBeacon;
  v5 = [(FMDBLEBeacon *)&v13 init];
  if (v5)
  {
    v6 = +[NSDate date];
    [(FMDBLEBeacon *)v5 setUpdateDate:v6];

    v7 = [v4 name];
    [(FMDBLEBeacon *)v5 setName:v7];

    v8 = [v4 rssi];
    [(FMDBLEBeacon *)v5 setRssi:v8];

    v9 = [v4 beaconIdentifier];
    [(FMDBLEBeacon *)v5 setIdentifier:v9];

    v10 = [v4 colorCode];
    [(FMDBLEBeacon *)v5 setColorCode:v10];

    -[FMDBLEBeacon setPrimary:](v5, "setPrimary:", [v4 primary]);
    -[FMDBLEBeacon setUtpConnected:](v5, "setUtpConnected:", [v4 utpConnected]);
    v11 = [v4 styleDescriptor];
    [(FMDBLEBeacon *)v5 setStyleDescriptor:v11];
  }
  return v5;
}

- (FMDBLEBeacon)initWithDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMDBLEBeacon;
  return [(FMDBLEBeacon *)&v4 init];
}

- (FMDBLEBeacon)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FMDBLEBeacon;
  v5 = [(FMDBLEBeacon *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("rssi");
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDBLEBeacon *)v5 setRssi:v8];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector("updateDate");
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(FMDBLEBeacon *)v5 setUpdateDate:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconIdentifier"];
    [(FMDBLEBeacon *)v5 setIdentifier:v12];

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector("name");
    v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    [(FMDBLEBeacon *)v5 setName:v15];

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector("colorCode");
    v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    [(FMDBLEBeacon *)v5 setColorCode:v18];

    uint64_t v19 = objc_opt_class();
    v20 = NSStringFromSelector("primary");
    v21 = [v4 decodeObjectOfClass:v19 forKey:v20];
    -[FMDBLEBeacon setPrimary:](v5, "setPrimary:", [v21 BOOLValue]);

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"styleDescriptor"];
    [(FMDBLEBeacon *)v5 setStyleDescriptor:v22];
  }
  return v5;
}

- (FMDBLEBeacon)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDBLEBeacon;
  v2 = [(FMDBLEBeacon *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(FMDBLEBeacon *)v2 setPrimary:0];
    [(FMDBLEBeacon *)v3 setUtpConnected:0];
  }
  return v3;
}

- (NSDictionary)dictionaryValue
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDBLEBeacon *)self rssi];
  [v3 fm_safeSetObject:v4 forKey:@"rssi"];

  objc_super v5 = [(FMDBLEBeacon *)self name];
  [v3 fm_safeSetObject:v5 forKey:@"name"];

  uint64_t v6 = [(FMDBLEBeacon *)self updateDate];
  if (v6)
  {
    v7 = [(FMDBLEBeacon *)self updateDate];
    v8 = [NSNumber numberWithLongLong:[v7 fm_epoch]];
    [v3 fm_safeSetObject:v8 forKey:@"updateTimestamp"];
  }
  else
  {
    [v3 fm_safeSetObject:&off_1002F2068 forKey:@"updateTimestamp"];
  }

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(FMDBLEBeacon *)self rssi];
  uint64_t v6 = NSStringFromSelector("rssi");
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(FMDBLEBeacon *)self updateDate];
  v8 = NSStringFromSelector("updateDate");
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(FMDBLEBeacon *)self identifier];
  [v4 encodeObject:v9 forKey:@"beaconIdentifier"];

  v10 = [(FMDBLEBeacon *)self name];
  v11 = NSStringFromSelector("name");
  [v4 encodeObject:v10 forKey:v11];

  v12 = [(FMDBLEBeacon *)self colorCode];
  uint64_t v13 = NSStringFromSelector("colorCode");
  [v4 encodeObject:v12 forKey:v13];

  v14 = +[NSNumber numberWithBool:[(FMDBLEBeacon *)self primary]];
  v15 = NSStringFromSelector("primary");
  [v4 encodeObject:v14 forKey:v15];

  id v17 = [(FMDBLEBeacon *)self styleDescriptor];
  uint64_t v16 = NSStringFromSelector("styleDescriptor");
  [v4 encodeObject:v17 forKey:v16];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FMDBLEBeacon *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(FMDBLEBeacon *)v4 hash];
      BOOL v6 = v5 == (id)[(FMDBLEBeacon *)self hash];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(FMDBLEBeacon *)self identifier];
  v3 = [v2 stringValue];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (BOOL)active
{
  return self->_active;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
}

- (NSDate)updateDate
{
  return self->_updateDate;
}

- (void)setUpdateDate:(id)a3
{
}

- (FMDBLEBeaconIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(id)a3
{
}

- (BOOL)primary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (BOOL)utpConnected
{
  return self->_utpConnected;
}

- (void)setUtpConnected:(BOOL)a3
{
  self->_utpConnected = a3;
}

- (FMDAccessoryStyleDescriptor)styleDescriptor
{
  return self->_styleDescriptor;
}

- (void)setStyleDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleDescriptor, 0);
  objc_storeStrong((id *)&self->_colorCode, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);

  objc_storeStrong((id *)&self->_rssi, 0);
}

@end