@interface PRRemoteDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)compareField:(id)a3 to:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)btAdvAddress;
- (NSData)roseMACAddress;
- (NSUUID)UUID;
- (PRRemoteDevice)initWithBTAdvAddress:(id)a3;
- (PRRemoteDevice)initWithBeaconUUID:(id)a3;
- (PRRemoteDevice)initWithCoder:(id)a3;
- (PRRemoteDevice)initWithCompanionUUID:(id)a3;
- (PRRemoteDevice)initWithRoseMACAddress:(id)a3;
- (PRRemoteDevice)initWithTestCompanionBtAdvAddress:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setBtAdvAddress:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setRoseMACAddress:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation PRRemoteDevice

- (PRRemoteDevice)initWithBTAdvAddress:(id)a3
{
  id v6 = a3;
  if ([v6 length] != 6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PRRemoteDevice.mm" lineNumber:22 description:@"btAdvAddress must be kBtAdvAddressByteLength bytes long."];
  }
  v11.receiver = self;
  v11.super_class = (Class)PRRemoteDevice;
  v7 = [(PRRemoteDevice *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_btAdvAddress, a3);
    v8->_deviceType = 4;
  }

  return v8;
}

- (PRRemoteDevice)initWithTestCompanionBtAdvAddress:(id)a3
{
  id v6 = a3;
  if ([v6 length] != 6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PRRemoteDevice.mm" lineNumber:34 description:@"btAdvAddress must be kBtAdvAddressByteLength bytes long."];
  }
  v11.receiver = self;
  v11.super_class = (Class)PRRemoteDevice;
  v7 = [(PRRemoteDevice *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_btAdvAddress, a3);
    v8->_deviceType = 2;
  }

  return v8;
}

- (PRRemoteDevice)initWithCompanionUUID:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PRRemoteDevice.mm", 46, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PRRemoteDevice;
  v7 = [(PRRemoteDevice *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_UUID, a3);
    v8->_deviceType = 3;
  }

  return v8;
}

- (PRRemoteDevice)initWithBeaconUUID:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PRRemoteDevice.mm", 58, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PRRemoteDevice;
  v7 = [(PRRemoteDevice *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_UUID, a3);
    v8->_deviceType = 5;
  }

  return v8;
}

- (PRRemoteDevice)initWithRoseMACAddress:(id)a3
{
  id v6 = a3;
  if ([v6 length] != 8)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PRRemoteDevice.mm" lineNumber:70 description:@"roseMACAddress must be kRoseMacAddressLen bytes long."];
  }
  v11.receiver = self;
  v11.super_class = (Class)PRRemoteDevice;
  v7 = [(PRRemoteDevice *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_roseMACAddress, a3);
    v8->_deviceType = 1;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRRemoteDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRRemoteDevice;
  v5 = [(PRRemoteDevice *)&v13 init];
  if (v5)
  {
    v5->_deviceType = [v4 decodeIntegerForKey:@"deviceTypeKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"btAdvAddressKey"];
    btAdvAddress = v5->_btAdvAddress;
    v5->_btAdvAddress = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roseMACAddressKey"];
    roseMACAddress = v5->_roseMACAddress;
    v5->_roseMACAddress = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUIDKey"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_deviceType forKey:@"deviceTypeKey"];
  [v4 encodeObject:self->_btAdvAddress forKey:@"btAdvAddressKey"];
  [v4 encodeObject:self->_roseMACAddress forKey:@"roseMACAddressKey"];
  [v4 encodeObject:self->_UUID forKey:@"UUIDKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PRRemoteDevice allocWithZone:a3];
  [(PRRemoteDevice *)v4 setDeviceType:self->_deviceType];
  [(PRRemoteDevice *)v4 setBtAdvAddress:self->_btAdvAddress];
  [(PRRemoteDevice *)v4 setRoseMACAddress:self->_roseMACAddress];
  [(PRRemoteDevice *)v4 setUUID:self->_UUID];
  return v4;
}

- (id)description
{
  unint64_t deviceType = self->_deviceType;
  if (deviceType > 5) {
    v3 = 0;
  }
  else {
    v3 = off_1E5999E68[deviceType];
  }
  id v4 = [NSString stringWithFormat:@"RemoteDevice. Type: %@, BT Adv Address: %@, Rose MAC Address: %@, Companion UUID: %@", v3, self->_btAdvAddress, self->_roseMACAddress, self->_UUID];
  return v4;
}

- (BOOL)compareField:(id)a3 to:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 && v6) {
    char v8 = [(id)v6 isEqual:v5];
  }
  else {
    char v8 = (v5 | v6) == 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 deviceType];
    int64_t v7 = [(PRRemoteDevice *)self deviceType];
    char v8 = [v5 btAdvAddress];
    v9 = [(PRRemoteDevice *)self btAdvAddress];
    BOOL v10 = [(PRRemoteDevice *)self compareField:v8 to:v9];

    objc_super v11 = [v5 roseMACAddress];
    v12 = [(PRRemoteDevice *)self roseMACAddress];
    BOOL v13 = [(PRRemoteDevice *)self compareField:v11 to:v12];

    v14 = [v5 UUID];
    v15 = [(PRRemoteDevice *)self UUID];
    BOOL v16 = [(PRRemoteDevice *)self compareField:v14 to:v15];

    BOOL v17 = v6 == v7 && v10;
    BOOL v18 = v17 && v13 && v16;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_unint64_t deviceType = a3;
}

- (NSData)btAdvAddress
{
  return self->_btAdvAddress;
}

- (void)setBtAdvAddress:(id)a3
{
}

- (NSData)roseMACAddress
{
  return self->_roseMACAddress;
}

- (void)setRoseMACAddress:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_roseMACAddress, 0);
  objc_storeStrong((id *)&self->_btAdvAddress, 0);
}

@end