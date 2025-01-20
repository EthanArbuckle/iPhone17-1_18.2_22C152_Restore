@interface STDevice
+ (BOOL)supportsSecureCoding;
+ (int64_t)currentPlatform;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (NSSet)apps;
- (NSString)name;
- (STDevice)deviceWithAppliedChange:(id)a3;
- (STDevice)initWithCoder:(id)a3;
- (STDevice)initWithID:(id)a3 name:(id)a4 platform:(int64_t)a5 apps:(id)a6;
- (STDeviceID)deviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)platform;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STDevice

- (STDevice)initWithID:(id)a3 name:(id)a4 platform:(int64_t)a5 apps:(id)a6
{
  v20.receiver = self;
  v20.super_class = (Class)STDevice;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [(STDevice *)&v20 init];
  v13 = (STDeviceID *)objc_msgSend(v11, "copy", v20.receiver, v20.super_class);

  deviceID = v12->_deviceID;
  v12->_deviceID = v13;

  v15 = (NSString *)[v10 copy];
  name = v12->_name;
  v12->_name = v15;

  v12->_platform = a5;
  v17 = (NSSet *)[v9 copy];

  apps = v12->_apps;
  v12->_apps = v17;

  return v12;
}

- (STDevice)deviceWithAppliedChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 deviceID];
  v6 = [(STDevice *)self deviceID];
  unsigned int v7 = [v5 isEqualToDeviceID:v6];

  if (v7 && (id v8 = [v4 platform], v8 == (id)-[STDevice platform](self, "platform")))
  {
    id v26 = v8;
    v28 = v5;
    uint64_t v9 = [v4 installedApps];
    v25 = [v4 removedApps];
    id v10 = [v25 valueForKeyPath:@"bundleIdentifier"];
    id v11 = [(STDevice *)self apps];
    id v12 = [v11 mutableCopy];

    v27 = (void *)v9;
    [v12 unionSet:v9];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = [v12 copy];
    id v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v19 = [v18 bundleIdentifier];
          unsigned int v20 = [v10 containsObject:v19];

          if (v20) {
            [v12 removeObject:v18];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v15);
    }

    v21 = [STDevice alloc];
    v22 = [v4 deviceName];
    v5 = v28;
    v23 = [(STDevice *)v21 initWithID:v28 name:v22 platform:v26 apps:v12];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (int64_t)currentPlatform
{
  return 2;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(STDevice *)self deviceID];
  v5 = [(STDevice *)self name];
  unint64_t v6 = (unint64_t)[(STDevice *)self platform] - 1;
  if (v6 > 4) {
    CFStringRef v7 = @"Unknown";
  }
  else {
    CFStringRef v7 = off_1002FC350[v6];
  }
  id v8 = [(STDevice *)self apps];
  uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ { DeviceID: %@, Name: %@, Platform: %@, App Count: %lu }>", v3, v4, v5, v7, [v8 count]);

  return v9;
}

- (STDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v7 = [v4 decodeIntegerForKey:@"platform"];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"apps"];

  id v11 = +[NSSet setWithArray:v10];

  id v12 = [(STDevice *)self initWithID:v5 name:v6 platform:v7 apps:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(STDevice *)self deviceID];
  [v4 encodeObject:v5 forKey:@"deviceID"];

  unint64_t v6 = [(STDevice *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[STDevice platform](self, "platform"), @"platform");
  id v8 = [(STDevice *)self apps];
  id v7 = [v8 allObjects];
  [v4 encodeObject:v7 forKey:@"apps"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  deviceID = self->_deviceID;
  name = self->_name;
  int64_t platform = self->_platform;
  apps = self->_apps;
  return [v4 initWithID:deviceID name:name platform:platform apps:apps];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STDevice *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STDevice *)self isEqualToDevice:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4 = (STDevice *)a3;
  if (v4 == self)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    BOOL v5 = [(STDevice *)self deviceID];
    unint64_t v6 = [(STDevice *)v4 deviceID];
    if ([v5 isEqualToDeviceID:v6])
    {
      id v7 = [(STDevice *)self name];
      id v8 = [(STDevice *)v4 name];
      if ([v7 isEqualToString:v8]
        && (uint64_t v9 = [(STDevice *)self platform], v9 == (void *)[(STDevice *)v4 platform]))
      {
        id v10 = [(STDevice *)self apps];
        id v11 = [(STDevice *)v4 apps];
        unsigned __int8 v12 = [v10 isEqualToSet:v11];
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  v2 = [(STDevice *)self deviceID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (STDeviceID)deviceID
{
  return (STDeviceID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)platform
{
  return self->_platform;
}

- (NSSet)apps
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end