@interface TAVehicleStateNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (TAVehicleStateNotification)initWithCoder:(id)a3;
- (TAVehicleStateNotification)initWithVehicularState:(unint64_t)a3 andVehicularHints:(unint64_t)a4 andOperatorState:(unint64_t)a5 date:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)hash;
- (unint64_t)operatorState;
- (unint64_t)vehicularHints;
- (unint64_t)vehicularState;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TAVehicleStateNotification

- (id)getDate
{
  return self->_date;
}

- (TAVehicleStateNotification)initWithVehicularState:(unint64_t)a3 andVehicularHints:(unint64_t)a4 andOperatorState:(unint64_t)a5 date:(id)a6
{
  id v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TAVehicleStateNotification;
  v11 = [(TAVehicleStateNotification *)&v17 init];
  v12 = v11;
  if (v11)
  {
    if (!v10)
    {
      v15 = 0;
      goto LABEL_6;
    }
    v11->_vehicularHints = a4;
    v11->_operatorState = a5;
    v11->_vehicularState = a3;
    uint64_t v13 = [v10 copy];
    date = v12->_date;
    v12->_date = (NSDate *)v13;
  }
  v15 = v12;
LABEL_6:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TAVehicleStateNotification *)self vehicularState];
  unint64_t v4 = [(TAVehicleStateNotification *)self vehicularHints] ^ v3;
  unint64_t v5 = v4 ^ [(TAVehicleStateNotification *)self operatorState];
  v6 = [(TAVehicleStateNotification *)self date];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (TAVehicleStateNotification *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unint64_t v6 = [(TAVehicleStateNotification *)self vehicularState];
      if (v6 == [(TAVehicleStateNotification *)v5 vehicularState]
        && (unint64_t v7 = [(TAVehicleStateNotification *)self vehicularHints],
            v7 == [(TAVehicleStateNotification *)v5 vehicularHints])
        && (unint64_t v8 = [(TAVehicleStateNotification *)self operatorState],
            v8 == [(TAVehicleStateNotification *)v5 operatorState]))
      {
        v9 = [(TAVehicleStateNotification *)self date];
        id v10 = [(TAVehicleStateNotification *)v5 date];
        if (v9 == v10)
        {
          char v13 = 1;
        }
        else
        {
          v11 = [(TAVehicleStateNotification *)self date];
          v12 = [(TAVehicleStateNotification *)v5 date];
          char v13 = [v11 isEqual:v12];
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (id)descriptionDictionary
{
  v20[10] = *MEMORY[0x263EF8340];
  unint64_t v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  v20[0] = v4;
  unint64_t v5 = [(TAVehicleStateNotification *)self vehicularState];
  if (v5 > 2) {
    unint64_t v6 = @"Invalid";
  }
  else {
    unint64_t v6 = off_2646AAD50[v5];
  }
  v20[1] = v6;
  v19[2] = @"VehicularHints";
  unint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAVehicleStateNotification vehicularHints](self, "vehicularHints"));
  v20[2] = v7;
  v19[3] = @"MotionHint";
  unint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[TAVehicleStateNotification vehicularHints](self, "vehicularHints") & 1);
  v20[3] = v8;
  v19[4] = @"GPSHint";
  v9 = objc_msgSend(NSNumber, "numberWithInt:", (-[TAVehicleStateNotification vehicularHints](self, "vehicularHints") >> 1) & 1);
  v20[4] = v9;
  v19[5] = @"BasebandHint";
  id v10 = objc_msgSend(NSNumber, "numberWithInt:", (-[TAVehicleStateNotification vehicularHints](self, "vehicularHints") >> 2) & 1);
  v20[5] = v10;
  v19[6] = @"WifiHint";
  v11 = objc_msgSend(NSNumber, "numberWithInt:", (-[TAVehicleStateNotification vehicularHints](self, "vehicularHints") >> 3) & 1);
  v20[6] = v11;
  v19[7] = @"BTHint";
  v12 = objc_msgSend(NSNumber, "numberWithInt:", (-[TAVehicleStateNotification vehicularHints](self, "vehicularHints") >> 4) & 1);
  v20[7] = v12;
  v19[8] = @"OperatorState";
  unint64_t v13 = [(TAVehicleStateNotification *)self operatorState];
  if (v13 > 2) {
    v14 = @"Invalid";
  }
  else {
    v14 = off_2646AAD68[v13];
  }
  v20[8] = v14;
  v19[9] = @"Date";
  v15 = [(TAVehicleStateNotification *)self date];
  v16 = [v15 getDateString];
  v20[9] = v16;
  objc_super v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:10];

  return v17;
}

- (NSString)description
{
  unint64_t v3 = [(TAVehicleStateNotification *)self descriptionDictionary];
  id v10 = 0;
  unint64_t v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    unint64_t v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  unint64_t v8 = v7;

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAVehicleStateNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"VehicularState"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"VehicularHints"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"OperatorState"];
  unint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];

  v9 = [(TAVehicleStateNotification *)self initWithVehicularState:v5 andVehicularHints:v6 andOperatorState:v7 date:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t vehicularState = self->_vehicularState;
  id v5 = a3;
  [v5 encodeInteger:vehicularState forKey:@"VehicularState"];
  [v5 encodeInteger:self->_vehicularHints forKey:@"VehicularHints"];
  [v5 encodeInteger:self->_operatorState forKey:@"OperatorState"];
  [v5 encodeObject:self->_date forKey:@"Date"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v6 = (void *)MEMORY[0x223CB66C0]();
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [TAVehicleStateNotification alloc];
  unint64_t vehicularHints = self->_vehicularHints;
  unint64_t operatorState = self->_operatorState;
  date = self->_date;
  unint64_t vehicularState = self->_vehicularState;
  return [(TAVehicleStateNotification *)v4 initWithVehicularState:vehicularState andVehicularHints:vehicularHints andOperatorState:operatorState date:date];
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)vehicularState
{
  return self->_vehicularState;
}

- (unint64_t)vehicularHints
{
  return self->_vehicularHints;
}

- (unint64_t)operatorState
{
  return self->_operatorState;
}

- (void).cxx_destruct
{
}

@end