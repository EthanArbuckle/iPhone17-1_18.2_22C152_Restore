@interface W5BluetoothDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isAppleDevice;
- (BOOL)isCloudPaired;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBluetoothDevice:(id)a3;
- (BOOL)isLowEnergy;
- (BOOL)isPaired;
- (NSString)address;
- (NSString)afhMap;
- (NSString)name;
- (W5BluetoothDevice)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)connectionMode;
- (int64_t)manufacturer;
- (int64_t)role;
- (int64_t)rssi;
- (unint64_t)connectionModeInterval;
- (unint64_t)hash;
- (unint64_t)lmpSubversion;
- (unint64_t)lmpVersion;
- (unint64_t)majorClass;
- (unint64_t)minorClass;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAfhMap:(id)a3;
- (void)setConnectionMode:(int64_t)a3;
- (void)setConnectionModeInterval:(unint64_t)a3;
- (void)setIsAppleDevice:(BOOL)a3;
- (void)setIsCloudPaired:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsLowEnergy:(BOOL)a3;
- (void)setIsPaired:(BOOL)a3;
- (void)setLmpSubversion:(unint64_t)a3;
- (void)setLmpVersion:(unint64_t)a3;
- (void)setMajorClass:(unint64_t)a3;
- (void)setManufacturer:(int64_t)a3;
- (void)setMinorClass:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setRole:(int64_t)a3;
- (void)setRssi:(int64_t)a3;
@end

@implementation W5BluetoothDevice

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5BluetoothDevice;
  [(W5BluetoothDevice *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"Name: %@\n", self->_name];
  [v3 appendFormat:@"Address %@\n", self->_address];
  if (self->_isPaired) {
    v4 = @"Yes";
  }
  else {
    v4 = @"No";
  }
  [v3 appendFormat:@"isPaired %@\n", v4];
  if (self->_isConnected) {
    v5 = @"Yes";
  }
  else {
    v5 = @"No";
  }
  [v3 appendFormat:@"isConnected %@\n", v5];
  if (self->_isCloudPaired) {
    v6 = @"Yes";
  }
  else {
    v6 = @"No";
  }
  [v3 appendFormat:@"isCloudPaired %@\n", v6];
  if (self->_isConnected)
  {
    [v3 appendFormat:@"Type %@\n", W5DescriptionForBluetoothDeviceType(self->_majorClass, self->_minorClass)];
    objc_msgSend(v3, "appendFormat:", @"RSSI: %ld dBm\n", self->_rssi);
    [v3 appendFormat:@"Manufacturer: %@ (0x%lx, 0x%02lx)\n", W5DescriptionForBluetoothDeviceManufacturer(self->_manufacturer), self->_lmpVersion, self->_lmpSubversion];
    [v3 appendFormat:@"Role: %@\n", W5DescriptionForBluetoothDeviceRole(self->_role)];
    [v3 appendFormat:@"Conn Mode: %@\n", W5DescriptionForBluetoothDeviceConnectionMode(self->_connectionMode)];
    objc_msgSend(v3, "appendFormat:", @"Conn Interval: %ld\n", self->_connectionModeInterval);
    [v3 appendFormat:@"AFH Map: %@\n", self->_afhMap];
    if (self->_isLowEnergy) {
      v7 = "Yes";
    }
    else {
      v7 = "No";
    }
    objc_msgSend(v3, "appendFormat:", @"LE: %s\n", v7);
    if (self->_isAppleDevice) {
      v8 = "Yes";
    }
    else {
      v8 = "No";
    }
    objc_msgSend(v3, "appendFormat:", @"Apple: %s\n\n", v8);
  }
  v9 = (void *)[v3 copy];
  return v9;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5BluetoothDevice;
  if (-[W5BluetoothDevice conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToBluetoothDevice:(id)a3
{
  name = self->_name;
  if (!name)
  {
    if (![a3 name]) {
      goto LABEL_5;
    }
    name = self->_name;
  }
  int v6 = -[NSString isEqual:](name, "isEqual:", [a3 name]);
  if (!v6) {
    return v6;
  }
LABEL_5:
  address = self->_address;
  if (address) {
    goto LABEL_8;
  }
  if ([a3 address])
  {
    address = self->_address;
LABEL_8:
    int v6 = -[NSString isEqual:](address, "isEqual:", [a3 address]);
    if (!v6) {
      return v6;
    }
  }
  int isPaired = self->_isPaired;
  if (isPaired != [a3 isPaired]) {
    goto LABEL_27;
  }
  int isConnected = self->_isConnected;
  if (isConnected != [a3 isConnected]) {
    goto LABEL_27;
  }
  int isCloudPaired = self->_isCloudPaired;
  if (isCloudPaired != [a3 isCloudPaired]) {
    goto LABEL_27;
  }
  unint64_t majorClass = self->_majorClass;
  if (majorClass != [a3 majorClass]) {
    goto LABEL_27;
  }
  unint64_t minorClass = self->_minorClass;
  if (minorClass != [a3 minorClass]) {
    goto LABEL_27;
  }
  int64_t rssi = self->_rssi;
  if (rssi != [a3 rssi]) {
    goto LABEL_27;
  }
  afhMap = self->_afhMap;
  if (!afhMap)
  {
    if (![a3 afhMap])
    {
LABEL_19:
      int64_t connectionMode = self->_connectionMode;
      if (connectionMode == [a3 connectionMode])
      {
        unint64_t connectionModeInterval = self->_connectionModeInterval;
        if (connectionModeInterval == [a3 connectionModeInterval])
        {
          int64_t manufacturer = self->_manufacturer;
          if (manufacturer == [a3 manufacturer])
          {
            unint64_t lmpVersion = self->_lmpVersion;
            if (lmpVersion == [a3 lmpVersion])
            {
              unint64_t lmpSubversion = self->_lmpSubversion;
              if (lmpSubversion == [a3 lmpSubversion])
              {
                int64_t role = self->_role;
                if (role == [a3 role])
                {
                  int isLowEnergy = self->_isLowEnergy;
                  if (isLowEnergy == [a3 isLowEnergy])
                  {
                    int isAppleDevice = self->_isAppleDevice;
                    LOBYTE(v6) = isAppleDevice == [a3 isAppleDevice];
                    return v6;
                  }
                }
              }
            }
          }
        }
      }
LABEL_27:
      LOBYTE(v6) = 0;
      return v6;
    }
    afhMap = self->_afhMap;
  }
  int v6 = -[NSString isEqual:](afhMap, "isEqual:", [a3 afhMap]);
  if (v6) {
    goto LABEL_19;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5BluetoothDevice *)self isEqualToBluetoothDevice:a3];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_address hash];
  BOOL isPaired = self->_isPaired;
  BOOL isConnected = self->_isConnected;
  BOOL isCloudPaired = self->_isCloudPaired;
  int8x16_t v12 = *(int8x16_t *)&self->_majorClass;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", self->_rssi), "hash");
  NSUInteger v9 = [(NSString *)self->_afhMap hash];
  int8x16_t v10 = veorq_s8(v12, veorq_s8(*(int8x16_t *)&self->_manufacturer, veorq_s8(*(int8x16_t *)&self->_connectionMode, *(int8x16_t *)&self->_lmpSubversion)));
  return *(void *)&veor_s8(*(int8x8_t *)v10.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL)) ^ isPaired ^ isConnected ^ isCloudPaired ^ v9 ^ self->_isLowEnergy ^ self->_isAppleDevice ^ v8 ^ v4 ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [+[W5BluetoothDevice allocWithZone:a3] init];
  [(W5BluetoothDevice *)v4 setName:self->_name];
  [(W5BluetoothDevice *)v4 setAddress:self->_address];
  [(W5BluetoothDevice *)v4 setIsPaired:self->_isPaired];
  [(W5BluetoothDevice *)v4 setIsConnected:self->_isConnected];
  [(W5BluetoothDevice *)v4 setIsCloudPaired:self->_isCloudPaired];
  [(W5BluetoothDevice *)v4 setMajorClass:self->_majorClass];
  [(W5BluetoothDevice *)v4 setMinorClass:self->_minorClass];
  [(W5BluetoothDevice *)v4 setRssi:self->_rssi];
  [(W5BluetoothDevice *)v4 setAfhMap:self->_afhMap];
  [(W5BluetoothDevice *)v4 setConnectionMode:self->_connectionMode];
  [(W5BluetoothDevice *)v4 setConnectionModeInterval:self->_connectionModeInterval];
  [(W5BluetoothDevice *)v4 setManufacturer:self->_manufacturer];
  [(W5BluetoothDevice *)v4 setLmpVersion:self->_lmpVersion];
  [(W5BluetoothDevice *)v4 setLmpSubversion:self->_lmpSubversion];
  [(W5BluetoothDevice *)v4 setRole:self->_role];
  [(W5BluetoothDevice *)v4 setIsLowEnergy:self->_isLowEnergy];
  [(W5BluetoothDevice *)v4 setIsAppleDevice:self->_isAppleDevice];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_name forKey:@"_name"];
  [a3 encodeObject:self->_address forKey:@"_address"];
  [a3 encodeBool:self->_isPaired forKey:@"_isPaired"];
  [a3 encodeBool:self->_isConnected forKey:@"_isConnected"];
  [a3 encodeBool:self->_isCloudPaired forKey:@"_isCloudPaired"];
  [a3 encodeInteger:self->_majorClass forKey:@"_majorClass"];
  [a3 encodeInteger:self->_minorClass forKey:@"_minorClass"];
  [a3 encodeInteger:self->_rssi forKey:@"_rssi"];
  [a3 encodeObject:self->_afhMap forKey:@"_afhMap"];
  [a3 encodeInteger:self->_connectionMode forKey:@"_connectionMode"];
  [a3 encodeInteger:self->_connectionModeInterval forKey:@"_connectionModeInterval"];
  [a3 encodeInteger:self->_manufacturer forKey:@"_manufacturer"];
  [a3 encodeInteger:self->_lmpVersion forKey:@"_lmpVersion"];
  [a3 encodeInteger:self->_lmpSubversion forKey:@"_lmpSubversion"];
  [a3 encodeInteger:self->_role forKey:@"_role"];
  [a3 encodeBool:self->_isLowEnergy forKey:@"_isLowEnergy"];
  BOOL isAppleDevice = self->_isAppleDevice;
  [a3 encodeBool:isAppleDevice forKey:@"_isAppleDevice"];
}

- (W5BluetoothDevice)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)W5BluetoothDevice;
  NSUInteger v4 = [(W5BluetoothDevice *)&v6 init];
  if (v4)
  {
    v4->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_name"), "copy");
    v4->_address = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_address"), "copy");
    v4->_BOOL isPaired = [a3 decodeBoolForKey:@"_isPaired"];
    v4->_BOOL isConnected = [a3 decodeBoolForKey:@"_isConnected"];
    v4->_BOOL isCloudPaired = [a3 decodeBoolForKey:@"_isCloudPaired"];
    v4->_unint64_t majorClass = [a3 decodeIntegerForKey:@"_majorClass"];
    v4->_unint64_t minorClass = [a3 decodeIntegerForKey:@"_minorClass"];
    v4->_int64_t rssi = [a3 decodeIntegerForKey:@"_rssi"];
    v4->_afhMap = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_afhMap"), "copy");
    v4->_int64_t connectionMode = [a3 decodeIntegerForKey:@"_connectionMode"];
    v4->_unint64_t connectionModeInterval = [a3 decodeIntegerForKey:@"_connectionModeInterval"];
    v4->_int64_t manufacturer = [a3 decodeIntegerForKey:@"_manufacturer"];
    v4->_unint64_t lmpVersion = [a3 decodeIntegerForKey:@"_lmpVersion"];
    v4->_unint64_t lmpSubversion = [a3 decodeIntegerForKey:@"_lmpSubversion"];
    v4->_int64_t role = [a3 decodeIntegerForKey:@"_role"];
    v4->_int isLowEnergy = [a3 decodeBoolForKey:@"_isLowEnergy"];
    v4->_BOOL isAppleDevice = [a3 decodeBoolForKey:@"_isAppleDevice"];
  }
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (BOOL)isPaired
{
  return self->_isPaired;
}

- (void)setIsPaired:(BOOL)a3
{
  self->_BOOL isPaired = a3;
}

- (BOOL)isCloudPaired
{
  return self->_isCloudPaired;
}

- (void)setIsCloudPaired:(BOOL)a3
{
  self->_BOOL isCloudPaired = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_BOOL isConnected = a3;
}

- (unint64_t)majorClass
{
  return self->_majorClass;
}

- (void)setMajorClass:(unint64_t)a3
{
  self->_unint64_t majorClass = a3;
}

- (unint64_t)minorClass
{
  return self->_minorClass;
}

- (void)setMinorClass:(unint64_t)a3
{
  self->_unint64_t minorClass = a3;
}

- (BOOL)isLowEnergy
{
  return self->_isLowEnergy;
}

- (void)setIsLowEnergy:(BOOL)a3
{
  self->_int isLowEnergy = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_int64_t rssi = a3;
}

- (NSString)afhMap
{
  return self->_afhMap;
}

- (void)setAfhMap:(id)a3
{
}

- (int64_t)connectionMode
{
  return self->_connectionMode;
}

- (void)setConnectionMode:(int64_t)a3
{
  self->_int64_t connectionMode = a3;
}

- (unint64_t)connectionModeInterval
{
  return self->_connectionModeInterval;
}

- (void)setConnectionModeInterval:(unint64_t)a3
{
  self->_unint64_t connectionModeInterval = a3;
}

- (int64_t)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(int64_t)a3
{
  self->_int64_t manufacturer = a3;
}

- (unint64_t)lmpVersion
{
  return self->_lmpVersion;
}

- (void)setLmpVersion:(unint64_t)a3
{
  self->_unint64_t lmpVersion = a3;
}

- (unint64_t)lmpSubversion
{
  return self->_lmpSubversion;
}

- (void)setLmpSubversion:(unint64_t)a3
{
  self->_unint64_t lmpSubversion = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_int64_t role = a3;
}

- (BOOL)isAppleDevice
{
  return self->_isAppleDevice;
}

- (void)setIsAppleDevice:(BOOL)a3
{
  self->_BOOL isAppleDevice = a3;
}

@end