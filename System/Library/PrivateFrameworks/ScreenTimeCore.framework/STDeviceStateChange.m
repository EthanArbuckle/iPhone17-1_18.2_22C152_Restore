@interface STDeviceStateChange
+ (BOOL)supportsSecureCoding;
+ (int64_t)encodingVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceStateChange:(id)a3;
- (NSSet)installedApps;
- (NSSet)removedApps;
- (NSString)deviceName;
- (STDeviceID)deviceID;
- (STDeviceStateChange)initWithCoder:(id)a3;
- (STDeviceStateChange)initWithDeviceID:(id)a3 deviceName:(id)a4 devicePlatform:(int64_t)a5 installedApps:(id)a6 removedApps:(id)a7 associatedUser:(id)a8;
- (STUserID)associatedUser;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)platform;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STDeviceStateChange

- (STDeviceStateChange)initWithDeviceID:(id)a3 deviceName:(id)a4 devicePlatform:(int64_t)a5 installedApps:(id)a6 removedApps:(id)a7 associatedUser:(id)a8
{
  v30.receiver = self;
  v30.super_class = (Class)STDeviceStateChange;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  v18 = [(STDeviceStateChange *)&v30 init];
  v19 = (STDeviceID *)objc_msgSend(v17, "copy", v30.receiver, v30.super_class);

  deviceID = v18->_deviceID;
  v18->_deviceID = v19;

  v21 = (NSString *)[v16 copy];
  deviceName = v18->_deviceName;
  v18->_deviceName = v21;

  v18->_platform = a5;
  v23 = (NSSet *)[v15 copy];

  installedApps = v18->_installedApps;
  v18->_installedApps = v23;

  v25 = (NSSet *)[v14 copy];
  removedApps = v18->_removedApps;
  v18->_removedApps = v25;

  v27 = (STUserID *)[v13 copy];
  associatedUser = v18->_associatedUser;
  v18->_associatedUser = v27;

  return v18;
}

+ (int64_t)encodingVersion
{
  return 1;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STDeviceStateChange *)self deviceID];
  v5 = [(STDeviceStateChange *)self deviceName];
  unint64_t v6 = (unint64_t)[(STDeviceStateChange *)self platform] - 1;
  if (v6 > 4) {
    CFStringRef v7 = @"Unknown";
  }
  else {
    CFStringRef v7 = off_1002FC378[v6];
  }
  v8 = [(STDeviceStateChange *)self installedApps];
  id v9 = [v8 count];
  v10 = [(STDeviceStateChange *)self removedApps];
  id v11 = [v10 count];
  v12 = [(STDeviceStateChange *)self associatedUser];
  id v13 = +[NSString stringWithFormat:@"<%@ { DeviceID: %@, DeviceName: %@, Platform: %@, InstalledApp(Count): %lu, RemovedApp(Count): %lu, Associated User: %@ }>", v3, v4, v5, v7, v9, v11, v12];

  return v13;
}

- (STDeviceStateChange)initWithCoder:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 decodeIntegerForKey:@"encodingVersion"] < 1)
  {
    id v14 = 0;
  }
  else
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    id v7 = [v4 decodeIntegerForKey:@"platform"];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"installedApps"];
    v12 = [v4 decodeObjectOfClasses:v10 forKey:@"removedApps"];
    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedUser"];
    self = [(STDeviceStateChange *)self initWithDeviceID:v5 deviceName:v6 devicePlatform:v7 installedApps:v11 removedApps:v12 associatedUser:v13];

    id v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", +[STDeviceStateChange encodingVersion](STDeviceStateChange, "encodingVersion"), @"encodingVersion");
  v5 = [(STDeviceStateChange *)self deviceID];
  [v4 encodeObject:v5 forKey:@"deviceID"];

  unint64_t v6 = [(STDeviceStateChange *)self deviceName];
  [v4 encodeObject:v6 forKey:@"deviceName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[STDeviceStateChange platform](self, "platform"), @"platform");
  id v7 = [(STDeviceStateChange *)self installedApps];
  [v4 encodeObject:v7 forKey:@"installedApps"];

  uint64_t v8 = [(STDeviceStateChange *)self removedApps];
  [v4 encodeObject:v8 forKey:@"removedApps"];

  id v9 = [(STDeviceStateChange *)self associatedUser];
  [v4 encodeObject:v9 forKey:@"associatedUser"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  deviceID = self->_deviceID;
  deviceName = self->_deviceName;
  int64_t platform = self->_platform;
  installedApps = self->_installedApps;
  removedApps = self->_removedApps;
  associatedUser = self->_associatedUser;
  return [v4 initWithDeviceID:deviceID deviceName:deviceName devicePlatform:platform installedApps:installedApps removedApps:removedApps associatedUser:associatedUser];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STDeviceStateChange *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STDeviceStateChange *)self isEqualToDeviceStateChange:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToDeviceStateChange:(id)a3
{
  id v4 = (STDeviceStateChange *)a3;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }
  else
  {
    BOOL v5 = [(STDeviceStateChange *)self deviceID];
    unint64_t v6 = [(STDeviceStateChange *)v4 deviceID];
    if ([v5 isEqualToDeviceID:v6])
    {
      id v7 = [(STDeviceStateChange *)self deviceName];
      uint64_t v8 = [(STDeviceStateChange *)v4 deviceName];
      if ([v7 isEqualToString:v8]
        && (id v9 = [(STDeviceStateChange *)self platform],
            v9 == (void *)[(STDeviceStateChange *)v4 platform]))
      {
        v10 = [(STDeviceStateChange *)self installedApps];
        id v11 = [(STDeviceStateChange *)v4 installedApps];
        if ([v10 isEqualToSet:v11])
        {
          v12 = [(STDeviceStateChange *)self removedApps];
          id v13 = [(STDeviceStateChange *)v4 removedApps];
          if ([v12 isEqualToSet:v13])
          {
            id v17 = [(STDeviceStateChange *)self associatedUser];
            [(STDeviceStateChange *)v4 associatedUser];
            id v14 = v18 = v12;
            unsigned __int8 v15 = [v17 isEqualToUserID:v14];

            v12 = v18;
          }
          else
          {
            unsigned __int8 v15 = 0;
          }
        }
        else
        {
          unsigned __int8 v15 = 0;
        }
      }
      else
      {
        unsigned __int8 v15 = 0;
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STDeviceStateChange *)self deviceID];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(STDeviceStateChange *)self deviceName];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  uint64_t v7 = [(STDeviceStateChange *)self platform];
  uint64_t v8 = [(STDeviceStateChange *)self installedApps];
  unint64_t v9 = v6 ^ v7 ^ (unint64_t)[v8 hash];
  v10 = [(STDeviceStateChange *)self removedApps];
  unint64_t v11 = (unint64_t)[v10 hash];
  v12 = [(STDeviceStateChange *)self associatedUser];
  unint64_t v13 = v9 ^ v11 ^ (unint64_t)[v12 hash];

  return v13;
}

- (STDeviceID)deviceID
{
  return (STDeviceID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)platform
{
  return self->_platform;
}

- (NSSet)installedApps
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)removedApps
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (STUserID)associatedUser
{
  return (STUserID *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedUser, 0);
  objc_storeStrong((id *)&self->_removedApps, 0);
  objc_storeStrong((id *)&self->_installedApps, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end