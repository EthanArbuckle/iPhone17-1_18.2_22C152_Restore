@interface MBDeviceLockInfo
+ (BOOL)supportsSecureCoding;
- (MBDeviceLockInfo)initWithCoder:(id)a3;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSString)deviceName;
- (NSString)deviceUUID;
- (NSString)ownerDeviceName;
- (NSString)ownerDeviceUUID;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceUUID:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setOwnerDeviceName:(id)a3;
- (void)setOwnerDeviceUUID:(id)a3;
@end

@implementation MBDeviceLockInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  v4 = (void *)MEMORY[0x1E01C2AA0]();
  v5 = [(MBDeviceLockInfo *)self deviceUUID];
  [v11 encodeObject:v5 forKey:@"deviceUUID"];

  v6 = [(MBDeviceLockInfo *)self deviceName];
  [v11 encodeObject:v6 forKey:@"deviceName"];

  v7 = [(MBDeviceLockInfo *)self ownerDeviceUUID];
  [v11 encodeObject:v7 forKey:@"ownerDeviceUUID"];

  v8 = [(MBDeviceLockInfo *)self ownerDeviceName];
  [v11 encodeObject:v8 forKey:@"ownerDeviceName"];

  v9 = [(MBDeviceLockInfo *)self creationDate];
  [v11 encodeObject:v9 forKey:@"creationDate"];

  v10 = [(MBDeviceLockInfo *)self expirationDate];
  [v11 encodeObject:v10 forKey:@"expirationDate"];
}

- (MBDeviceLockInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E01C2AA0]();
  v15.receiver = self;
  v15.super_class = (Class)MBDeviceLockInfo;
  v6 = [(MBDeviceLockInfo *)&v15 init];
  if (v6)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceUUID"];
    [(MBDeviceLockInfo *)v6 setDeviceUUID:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    [(MBDeviceLockInfo *)v6 setDeviceName:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerDeviceUUID"];
    [(MBDeviceLockInfo *)v6 setOwnerDeviceUUID:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerDeviceName"];
    [(MBDeviceLockInfo *)v6 setOwnerDeviceName:v10];

    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    [(MBDeviceLockInfo *)v6 setCreationDate:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    [(MBDeviceLockInfo *)v6 setExpirationDate:v12];
  }
  v13 = v6;

  return v13;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)ownerDeviceUUID
{
  return self->_ownerDeviceUUID;
}

- (void)setOwnerDeviceUUID:(id)a3
{
}

- (NSString)ownerDeviceName
{
  return self->_ownerDeviceName;
}

- (void)setOwnerDeviceName:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_ownerDeviceName, 0);
  objc_storeStrong((id *)&self->_ownerDeviceUUID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
}

@end