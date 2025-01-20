@interface SMDeviceStatus
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSUUID)identifier;
- (SMDeviceStatus)init;
- (SMDeviceStatus)initWithCoder:(id)a3;
- (SMDeviceStatus)initWithDictionary:(id)a3;
- (SMDeviceStatus)initWithIdentifier:(id)a3 batteryRemaining:(int64_t)a4 cellularStrength:(unint64_t)a5 date:(id)a6 wifiStrength:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)outputToDictionary;
- (int64_t)batteryRemaining;
- (unint64_t)cellularStrength;
- (unint64_t)wifiStrength;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryRemaining:(int64_t)a3;
- (void)setCellularStrength:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setWifiStrength:(unint64_t)a3;
@end

@implementation SMDeviceStatus

- (SMDeviceStatus)init
{
  v3 = objc_opt_new();
  v4 = [MEMORY[0x263EFF910] distantPast];
  v5 = [(SMDeviceStatus *)self initWithIdentifier:v3 batteryRemaining:0 cellularStrength:0 date:v4 wifiStrength:0];

  return v5;
}

- (SMDeviceStatus)initWithIdentifier:(id)a3 batteryRemaining:(int64_t)a4 cellularStrength:(unint64_t)a5 date:(id)a6 wifiStrength:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a6;
  if (v13)
  {
    v20.receiver = self;
    v20.super_class = (Class)SMDeviceStatus;
    v15 = [(SMDeviceStatus *)&v20 init];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_identifier, a3);
      v16->_batteryRemaining = a4;
      v16->_cellularStrength = a5;
      objc_storeStrong((id *)&v16->_date, a6);
      v16->_wifiStrength = a7;
    }
    self = v16;
    v17 = self;
  }
  else
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v17 = 0;
  }

  return v17;
}

- (SMDeviceStatus)initWithDictionary:(id)a3
{
  v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  v6 = [v4 UUID];
  v7 = [v5 valueForKey:@"identifier"];
  v8 = (void *)[v6 initWithUUIDString:v7];

  v9 = [v5 valueForKey:@"batteryRemaining"];
  uint64_t v10 = [v9 integerValue];

  v11 = [v5 valueForKey:@"cellularStrength"];
  uint64_t v12 = [v11 integerValue];

  id v13 = [v5 valueForKey:@"timeOfCollection"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v15];
  v17 = [v5 valueForKey:@"wifiStrength"];

  uint64_t v18 = [v17 integerValue];
  v19 = [(SMDeviceStatus *)self initWithIdentifier:v8 batteryRemaining:v10 cellularStrength:v12 date:v16 wifiStrength:v18];

  return v19;
}

- (id)outputToDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(SMDeviceStatus *)self identifier];
  id v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"identifier"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMDeviceStatus batteryRemaining](self, "batteryRemaining"));
  [v3 setObject:v6 forKey:@"batteryRemaining"];

  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[SMDeviceStatus cellularStrength](self, "cellularStrength"));
  [v3 setObject:v7 forKey:@"cellularStrength"];

  v8 = NSNumber;
  v9 = [(SMDeviceStatus *)self date];
  [v9 timeIntervalSince1970];
  uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v10 forKey:@"timeOfCollection"];

  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[SMDeviceStatus wifiStrength](self, "wifiStrength"));
  [v3 setObject:v11 forKey:@"wifiStrength"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMDeviceStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"batteryRemaining"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"cellularStrength"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeOfCollection"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"wifiStrength"];

  uint64_t v10 = [(SMDeviceStatus *)self initWithIdentifier:v5 batteryRemaining:v6 cellularStrength:v7 date:v8 wifiStrength:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(SMDeviceStatus *)self identifier];
  [v6 encodeObject:v4 forKey:@"identifier"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[SMDeviceStatus batteryRemaining](self, "batteryRemaining"), @"batteryRemaining");
  objc_msgSend(v6, "encodeInteger:forKey:", (int)-[SMDeviceStatus cellularStrength](self, "cellularStrength"), @"cellularStrength");
  id v5 = [(SMDeviceStatus *)self date];
  [v6 encodeObject:v5 forKey:@"timeOfCollection"];

  objc_msgSend(v6, "encodeInteger:forKey:", (int)-[SMDeviceStatus wifiStrength](self, "wifiStrength"), @"wifiStrength");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  int64_t batteryRemaining = self->_batteryRemaining;
  unint64_t cellularStrength = self->_cellularStrength;
  date = self->_date;
  unint64_t wifiStrength = self->_wifiStrength;
  return (id)[v4 initWithIdentifier:identifier batteryRemaining:batteryRemaining cellularStrength:cellularStrength date:date wifiStrength:wifiStrength];
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(SMDeviceStatus *)self identifier];
  int64_t v5 = [(SMDeviceStatus *)self batteryRemaining];
  unint64_t v6 = [(SMDeviceStatus *)self cellularStrength];
  uint64_t v7 = [(SMDeviceStatus *)self date];
  v8 = [v3 stringWithFormat:@"identifier, %@, batteryRemaining, %d, cellularStrength, %d, date, %@, wifiStrength, %d", v4, v5, v6, v7, -[SMDeviceStatus wifiStrength](self, "wifiStrength")];

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)batteryRemaining
{
  return self->_batteryRemaining;
}

- (void)setBatteryRemaining:(int64_t)a3
{
  self->_int64_t batteryRemaining = a3;
}

- (unint64_t)cellularStrength
{
  return self->_cellularStrength;
}

- (void)setCellularStrength:(unint64_t)a3
{
  self->_unint64_t cellularStrength = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)wifiStrength
{
  return self->_wifiStrength;
}

- (void)setWifiStrength:(unint64_t)a3
{
  self->_unint64_t wifiStrength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end