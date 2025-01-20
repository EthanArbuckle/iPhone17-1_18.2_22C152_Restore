@interface TADeviceInformation
+ (BOOL)supportsSecureCoding;
+ (id)deviceTypeToString:(unint64_t)a3;
+ (id)notificationStateToString:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (TADeviceInformation)initWithCoder:(id)a3;
- (TADeviceInformation)initWithTASPAdvertisement:(id)a3 deviceType:(unint64_t)a4 notificationState:(unint64_t)a5 date:(id)a6;
- (TASPAdvertisement)advertisement;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)deviceType;
- (unint64_t)hash;
- (unint64_t)notificationState;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TADeviceInformation

- (TADeviceInformation)initWithTASPAdvertisement:(id)a3 deviceType:(unint64_t)a4 notificationState:(unint64_t)a5 date:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TADeviceInformation;
  v12 = [(TADeviceInformation *)&v19 init];
  if (!v12) {
    goto LABEL_5;
  }
  v13 = 0;
  if (v10 && v11)
  {
    uint64_t v14 = [v10 copy];
    advertisement = v12->_advertisement;
    v12->_advertisement = (TASPAdvertisement *)v14;

    v12->_deviceType = a4;
    v12->_notificationState = a5;
    uint64_t v16 = [v11 copy];
    date = v12->_date;
    v12->_date = (NSDate *)v16;

LABEL_5:
    v13 = v12;
  }

  return v13;
}

+ (id)deviceTypeToString:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Invalid";
  }
  else {
    return off_2646AAD80[a3];
  }
}

+ (id)notificationStateToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Invalid";
  }
  else {
    return off_2646AADA8[a3];
  }
}

- (unint64_t)hash
{
  v3 = [(TADeviceInformation *)self advertisement];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(TADeviceInformation *)self deviceType];
  unint64_t v6 = v5 ^ [(TADeviceInformation *)self notificationState] ^ v4;
  v7 = [(TADeviceInformation *)self date];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (TADeviceInformation *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      unint64_t v8 = [(TADeviceInformation *)self advertisement];
      v9 = [(TADeviceInformation *)v7 advertisement];
      if (v8 == v9
        || ([(TADeviceInformation *)self advertisement],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(TADeviceInformation *)v7 advertisement],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        unint64_t v11 = [(TADeviceInformation *)self deviceType];
        if (v11 == [(TADeviceInformation *)v7 deviceType]
          && (unint64_t v12 = [(TADeviceInformation *)self notificationState],
              v12 == [(TADeviceInformation *)v7 notificationState]))
        {
          v13 = [(TADeviceInformation *)self date];
          uint64_t v14 = [(TADeviceInformation *)v7 date];
          if (v13 == (void *)v14)
          {

            char v10 = 1;
          }
          else
          {
            v15 = (void *)v14;
            v18 = [(TADeviceInformation *)self date];
            uint64_t v16 = [(TADeviceInformation *)v7 date];
            char v10 = [v18 isEqual:v16];
          }
        }
        else
        {
          char v10 = 0;
        }
        if (v8 == v9) {
          goto LABEL_15;
        }
      }
      else
      {
        char v10 = 0;
      }

LABEL_15:
      goto LABEL_16;
    }
    char v10 = 0;
  }
LABEL_16:

  return v10;
}

- (id)descriptionDictionary
{
  v14[5] = *MEMORY[0x263EF8340];
  v13[0] = @"EventType";
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v14[0] = v4;
  v13[1] = @"Advertisement";
  unint64_t v5 = [(TADeviceInformation *)self advertisement];
  unint64_t v6 = [v5 descriptionDictionary];
  v14[1] = v6;
  v13[2] = @"DeviceType";
  v7 = +[TADeviceInformation deviceTypeToString:self->_deviceType];
  v14[2] = v7;
  v13[3] = @"NotificationState";
  unint64_t v8 = +[TADeviceInformation notificationStateToString:self->_notificationState];
  v14[3] = v8;
  v13[4] = @"Date";
  v9 = [(TADeviceInformation *)self date];
  char v10 = [v9 getDateString];
  v14[4] = v10;
  unint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

- (NSString)description
{
  v3 = [(TADeviceInformation *)self descriptionDictionary];
  id v10 = 0;
  uint64_t v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [TADeviceInformation alloc];
  advertisement = self->_advertisement;
  unint64_t deviceType = self->_deviceType;
  unint64_t notificationState = self->_notificationState;
  date = self->_date;
  return [(TADeviceInformation *)v4 initWithTASPAdvertisement:advertisement deviceType:deviceType notificationState:notificationState date:date];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TADeviceInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Advertisement"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"DeviceType"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"NotificationState"];
  unint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];

  v9 = [(TADeviceInformation *)self initWithTASPAdvertisement:v5 deviceType:v6 notificationState:v7 date:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  advertisement = self->_advertisement;
  id v5 = a3;
  [v5 encodeObject:advertisement forKey:@"Advertisement"];
  [v5 encodeInteger:self->_deviceType forKey:@"DeviceType"];
  [v5 encodeInteger:self->_notificationState forKey:@"NotificationState"];
  [v5 encodeObject:self->_date forKey:@"Date"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v6 = (void *)MEMORY[0x223CB66C0]();
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)getDate
{
  return self->_date;
}

- (TASPAdvertisement)advertisement
{
  return self->_advertisement;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (unint64_t)notificationState
{
  return self->_notificationState;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
}

@end