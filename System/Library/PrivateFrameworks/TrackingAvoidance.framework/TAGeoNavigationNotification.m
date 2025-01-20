@interface TAGeoNavigationNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (TAGeoNavigationNotification)initWithCoder:(id)a3;
- (TAGeoNavigationNotification)initWithTransportType:(unint64_t)a3 andNavigationState:(unint64_t)a4 date:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)hash;
- (unint64_t)navState;
- (unint64_t)transportType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TAGeoNavigationNotification

- (TAGeoNavigationNotification)initWithTransportType:(unint64_t)a3 andNavigationState:(unint64_t)a4 date:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TAGeoNavigationNotification;
  v9 = [(TAGeoNavigationNotification *)&v15 init];
  v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      v13 = 0;
      goto LABEL_6;
    }
    v9->_transportType = a3;
    v9->_navState = a4;
    uint64_t v11 = [v8 copy];
    date = v10->_date;
    v10->_date = (NSDate *)v11;
  }
  v13 = v10;
LABEL_6:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TAGeoNavigationNotification *)self transportType];
  unint64_t v4 = [(TAGeoNavigationNotification *)self navState] ^ v3;
  v5 = [(TAGeoNavigationNotification *)self date];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (TAGeoNavigationNotification *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(TAGeoNavigationNotification *)self transportType];
      if (v6 == [(TAGeoNavigationNotification *)v5 transportType]
        && (unint64_t v7 = [(TAGeoNavigationNotification *)self navState],
            v7 == [(TAGeoNavigationNotification *)v5 navState]))
      {
        id v8 = [(TAGeoNavigationNotification *)self date];
        v9 = [(TAGeoNavigationNotification *)v5 date];
        if (v8 == v9)
        {
          char v12 = 1;
        }
        else
        {
          v10 = [(TAGeoNavigationNotification *)self date];
          uint64_t v11 = [(TAGeoNavigationNotification *)v5 date];
          char v12 = [v10 isEqual:v11];
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)descriptionDictionary
{
  v14[4] = *MEMORY[0x263EF8340];
  v13[0] = @"EventType";
  unint64_t v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  v14[0] = v4;
  v13[1] = @"TransportType";
  unint64_t v5 = [(TAGeoNavigationNotification *)self transportType];
  if (v5 > 6) {
    unint64_t v6 = @"<invalid>";
  }
  else {
    unint64_t v6 = off_2646AADC0[v5];
  }
  v14[1] = v6;
  v13[2] = @"NavState";
  unint64_t v7 = [(TAGeoNavigationNotification *)self navState];
  if (v7 > 2) {
    id v8 = @"<invalid>";
  }
  else {
    id v8 = off_2646AADF8[v7];
  }
  v14[2] = v8;
  v13[3] = @"Date";
  v9 = [(TAGeoNavigationNotification *)self date];
  v10 = [v9 getDateString];
  v14[3] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (NSString)description
{
  unint64_t v3 = [(TAGeoNavigationNotification *)self descriptionDictionary];
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
  id v8 = v7;

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAGeoNavigationNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"TransportType"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"NavState"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];

  id v8 = [(TAGeoNavigationNotification *)self initWithTransportType:v5 andNavigationState:v6 date:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t transportType = self->_transportType;
  id v5 = a3;
  [v5 encodeInteger:transportType forKey:@"TransportType"];
  [v5 encodeInteger:self->_navState forKey:@"NavState"];
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
  id v4 = [TAGeoNavigationNotification alloc];
  unint64_t transportType = self->_transportType;
  unint64_t navState = self->_navState;
  date = self->_date;
  return [(TAGeoNavigationNotification *)v4 initWithTransportType:transportType andNavigationState:navState date:date];
}

- (id)getDate
{
  return self->_date;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (unint64_t)navState
{
  return self->_navState;
}

- (void).cxx_destruct
{
}

@end