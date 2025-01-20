@interface SADevicesWithSafeLocationsEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSDictionary)devices;
- (NSDictionary)safeLocations;
- (NSString)description;
- (SADevicesWithSafeLocationsEvent)initWithCoder:(id)a3;
- (SADevicesWithSafeLocationsEvent)initWithDevices:(id)a3 safeLocationUUIDs:(id)a4 date:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation SADevicesWithSafeLocationsEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SADevicesWithSafeLocationsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"kSADevicesWithSafeLocationsEventKeyDevices"];
  v6 = [v4 decodeObjectForKey:@"kSADevicesWithSafeLocationsEventKeySafeLocationIDs"];
  v7 = [v4 decodeObjectForKey:@"kSADevicesWithSafeLocationsEventKeyDate"];

  v8 = [(SADevicesWithSafeLocationsEvent *)self initWithDevices:v5 safeLocationUUIDs:v6 date:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SADevicesWithSafeLocationsEvent *)self devices];
  [v4 encodeObject:v5 forKey:@"kSADevicesWithSafeLocationsEventKeyDevices"];

  v6 = [(SADevicesWithSafeLocationsEvent *)self safeLocations];
  [v4 encodeObject:v6 forKey:@"kSADevicesWithSafeLocationsEventKeySafeLocationIDs"];

  id v7 = [(SADevicesWithSafeLocationsEvent *)self date];
  [v4 encodeObject:v7 forKey:@"kSADevicesWithSafeLocationsEventKeyDate"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  v6 = (void *)MEMORY[0x1D25F7C90]();
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SADevicesWithSafeLocationsEvent allocWithZone:a3];
  v5 = [(SADevicesWithSafeLocationsEvent *)self devices];
  v6 = [(SADevicesWithSafeLocationsEvent *)self safeLocations];
  id v7 = [(SADevicesWithSafeLocationsEvent *)self date];
  id v8 = [(SADevicesWithSafeLocationsEvent *)v4 initWithDevices:v5 safeLocationUUIDs:v6 date:v7];

  return v8;
}

- (SADevicesWithSafeLocationsEvent)initWithDevices:(id)a3 safeLocationUUIDs:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SADevicesWithSafeLocationsEvent;
  v11 = [(SADevicesWithSafeLocationsEvent *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    devices = v11->_devices;
    v11->_devices = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    safeLocations = v11->_safeLocations;
    v11->_safeLocations = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    date = v11->_date;
    v11->_date = (NSDate *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (SADevicesWithSafeLocationsEvent *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v8 = [(SADevicesWithSafeLocationsEvent *)self devices];
      id v9 = [(SADevicesWithSafeLocationsEvent *)v7 devices];
      if (v8 != v9)
      {
        v3 = [(SADevicesWithSafeLocationsEvent *)self devices];
        id v4 = [(SADevicesWithSafeLocationsEvent *)v7 devices];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(SADevicesWithSafeLocationsEvent *)self safeLocations];
      uint64_t v12 = [(SADevicesWithSafeLocationsEvent *)v7 safeLocations];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(SADevicesWithSafeLocationsEvent *)self safeLocations];
        v26 = [(SADevicesWithSafeLocationsEvent *)v7 safeLocations];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      uint64_t v14 = [(SADevicesWithSafeLocationsEvent *)self date];
      uint64_t v15 = [(SADevicesWithSafeLocationsEvent *)v7 date];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        uint64_t v16 = (void *)v15;
        [(SADevicesWithSafeLocationsEvent *)self date];
        v17 = v23 = v3;
        [(SADevicesWithSafeLocationsEvent *)v7 date];
        v22 = v4;
        v18 = v9;
        v20 = objc_super v19 = v8;
        char v10 = [v17 isEqual:v20];

        id v8 = v19;
        id v9 = v18;
        id v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v10 = 0;
  }
LABEL_21:

  return v10;
}

- (id)descriptionDictionary
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"EventType";
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v16[0] = v6;
  v15[1] = @"kSADevicesWithSafeLocationsEventKeyDevices";
  id v7 = [(SADevicesWithSafeLocationsEvent *)self devices];
  if (v7)
  {
    v2 = [(SADevicesWithSafeLocationsEvent *)self devices];
    id v8 = [v2 description];
  }
  else
  {
    id v8 = &stru_1F27F45F0;
  }
  v16[1] = v8;
  v15[2] = @"kSADevicesWithSafeLocationsEventKeySafeLocationIDs";
  id v9 = [(SADevicesWithSafeLocationsEvent *)self safeLocations];
  if (v9)
  {
    v3 = [(SADevicesWithSafeLocationsEvent *)self safeLocations];
    char v10 = [v3 description];
  }
  else
  {
    char v10 = &stru_1F27F45F0;
  }
  v16[2] = v10;
  v15[3] = @"kSADevicesWithSafeLocationsEventKeyDate";
  v11 = [(SADevicesWithSafeLocationsEvent *)self date];
  uint64_t v12 = [v11 getDateString];
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  if (v9)
  {
  }
  if (v7)
  {
  }
  return v13;
}

- (NSString)description
{
  v2 = [(SADevicesWithSafeLocationsEvent *)self descriptionDictionary];
  id v9 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v9];
  id v4 = v9;
  if (v4)
  {
    v5 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      -[SASafeLocationUpdateEvent description](v5);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (id)getDate
{
  return self->_date;
}

- (NSDictionary)devices
{
  return self->_devices;
}

- (NSDictionary)safeLocations
{
  return self->_safeLocations;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end