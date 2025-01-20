@interface W5BluetoothStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isConnectable;
- (BOOL)isDiscoverable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBluetoothStatus:(id)a3;
- (BOOL)isScanning;
- (BOOL)powerOn;
- (NSArray)devices;
- (NSString)address;
- (W5BluetoothStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setDevices:(id)a3;
- (void)setIsConnectable:(BOOL)a3;
- (void)setIsDiscoverable:(BOOL)a3;
- (void)setIsScanning:(BOOL)a3;
- (void)setPowerOn:(BOOL)a3;
@end

@implementation W5BluetoothStatus

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5BluetoothStatus;
  [(W5BluetoothStatus *)&v3 dealloc];
}

- (void)setDevices:(id)a3
{
  devices = self->_devices;
  if (devices != a3)
  {

    self->_devices = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_devices = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  v4 = v3;
  if (self->_powerOn) {
    v5 = "On";
  }
  else {
    v5 = "Off";
  }
  objc_msgSend(v3, "appendFormat:", @"Power: %s\n", v5);
  [v4 appendFormat:@"Address: %@\n", self->_address];
  uint64_t v6 = "Yes";
  uint64_t v7 = "No";
  if (self->_isDiscoverable) {
    v8 = "Yes";
  }
  else {
    v8 = "No";
  }
  objc_msgSend(v4, "appendFormat:", @"Discoverable: %s\n", v8);
  if (self->_isConnectable) {
    v9 = "Yes";
  }
  else {
    v9 = "No";
  }
  objc_msgSend(v4, "appendFormat:", @"Connectable: %s\n", v9);
  if (self->_isScanning) {
    uint64_t v10 = "Yes";
  }
  else {
    uint64_t v10 = "No";
  }
  objc_msgSend(v4, "appendFormat:", @"Scanning: %s\n", v10);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v43 = self;
  obuint64_t j = self->_devices;
  uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v13 += [v18 isPaired];
        v14 += [v18 isCloudPaired];
        v15 += [v18 isConnected];
      }
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  objc_msgSend(v4, "appendFormat:", @"Device Count: %lu (paired=%lu cloud=%lu connected=%lu)\n\n", -[NSArray count](v43->_devices, "count"), v13, v14, v15);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obja = v43->_devices;
  uint64_t v19 = [(NSArray *)obja countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    v21 = @"    %s\n";
    v22 = @"    Address          : %s\n";
    uint64_t v23 = *(void *)v48;
    v24 = @"    Paired           : %s\n";
    v44 = v4;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(obja);
        }
        v26 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        objc_msgSend(v4, "appendFormat:", v21, objc_msgSend((id)objc_msgSend(v26, "name"), "UTF8String"));
        objc_msgSend(v4, "appendFormat:", v22, objc_msgSend((id)objc_msgSend(v26, "address"), "UTF8String"));
        if ([v26 isPaired]) {
          v27 = v6;
        }
        else {
          v27 = v7;
        }
        objc_msgSend(v4, "appendFormat:", v24, v27);
        if ([v26 isCloudPaired]) {
          v28 = v6;
        }
        else {
          v28 = v7;
        }
        objc_msgSend(v4, "appendFormat:", @"    CloudPaired      : %s\n", v28);
        if ([v26 isConnected]) {
          v29 = v6;
        }
        else {
          v29 = v7;
        }
        objc_msgSend(v4, "appendFormat:", @"    Connected        : %s\n", v29);
        if ([v26 isConnected])
        {
          uint64_t v30 = v20;
          v31 = v7;
          v32 = v6;
          uint64_t v33 = v23;
          v34 = v24;
          v35 = v22;
          v36 = v21;
          uint64_t v37 = [v26 majorClass];
          unint64_t v38 = [v26 minorClass];
          uint64_t v39 = v37;
          v21 = v36;
          v22 = v35;
          v24 = v34;
          uint64_t v23 = v33;
          uint64_t v6 = v32;
          uint64_t v7 = v31;
          uint64_t v20 = v30;
          v4 = v44;
          objc_msgSend(v44, "appendFormat:", @"    Type             : %s\n", objc_msgSend((id)W5DescriptionForBluetoothDeviceType(v39, v38), "UTF8String"));
          if ([v26 isLowEnergy]) {
            v40 = v6;
          }
          else {
            v40 = v7;
          }
          objc_msgSend(v44, "appendFormat:", @"    LE               : %s\n", v40);
          if ([v26 isAppleDevice]) {
            v41 = v6;
          }
          else {
            v41 = v7;
          }
          objc_msgSend(v44, "appendFormat:", @"    Apple            : %s\n", v41);
        }
        [v4 appendFormat:@"\n"];
      }
      uint64_t v20 = [(NSArray *)obja countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v20);
  }
  return (id)[v4 copy];
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5BluetoothStatus;
  if (-[W5BluetoothStatus conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToBluetoothStatus:(id)a3
{
  address = self->_address;
  if (!address)
  {
    if (![a3 address]) {
      goto LABEL_5;
    }
    address = self->_address;
  }
  int v6 = -[NSString isEqual:](address, "isEqual:", [a3 address]);
  if (!v6) {
    return v6;
  }
LABEL_5:
  int powerOn = self->_powerOn;
  if (powerOn != [a3 powerOn]
    || (int isDiscoverable = self->_isDiscoverable, isDiscoverable != [a3 isDiscoverable])
    || (int isConnectable = self->_isConnectable, isConnectable != [a3 isConnectable])
    || (int isScanning = self->_isScanning, isScanning != [a3 isScanning]))
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  devices = self->_devices;
  if (!devices)
  {
    if (![a3 devices])
    {
      LOBYTE(v6) = 1;
      return v6;
    }
    devices = self->_devices;
  }
  uint64_t v12 = [a3 devices];
  LOBYTE(v6) = [(NSArray *)devices isEqual:v12];
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
  return [(W5BluetoothStatus *)self isEqualToBluetoothStatus:a3];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_address hash] ^ self->_powerOn ^ (unint64_t)self->_isDiscoverable;
  unint64_t v4 = self->_isConnectable ^ (unint64_t)self->_isScanning;
  return v3 ^ v4 ^ [(NSArray *)self->_devices hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [+[W5BluetoothStatus allocWithZone:a3] init];
  [(W5BluetoothStatus *)v4 setPowerOn:self->_powerOn];
  [(W5BluetoothStatus *)v4 setAddress:self->_address];
  [(W5BluetoothStatus *)v4 setIsDiscoverable:self->_isDiscoverable];
  [(W5BluetoothStatus *)v4 setIsConnectable:self->_isConnectable];
  [(W5BluetoothStatus *)v4 setIsScanning:self->_isScanning];
  [(W5BluetoothStatus *)v4 setDevices:self->_devices];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_address forKey:@"_address"];
  [a3 encodeBool:self->_powerOn forKey:@"_powerOn"];
  [a3 encodeBool:self->_isDiscoverable forKey:@"_isDiscoverable"];
  [a3 encodeBool:self->_isConnectable forKey:@"_isConnectable"];
  [a3 encodeBool:self->_isScanning forKey:@"_isScanning"];
  devices = self->_devices;
  [a3 encodeObject:devices forKey:@"_devices"];
}

- (W5BluetoothStatus)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)W5BluetoothStatus;
  unint64_t v4 = [(W5BluetoothStatus *)&v8 init];
  if (v4)
  {
    v4->_address = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_address"), "copy");
    v4->_int powerOn = [a3 decodeBoolForKey:@"_powerOn"];
    v4->_int isDiscoverable = [a3 decodeBoolForKey:@"_isDiscoverable"];
    v4->_int isConnectable = [a3 decodeBoolForKey:@"_isConnectable"];
    v4->_int isScanning = [a3 decodeBoolForKey:@"_isScanning"];
    objc_super v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->_devices = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"_devices"), "copy");
  }
  return v4;
}

- (BOOL)powerOn
{
  return self->_powerOn;
}

- (void)setPowerOn:(BOOL)a3
{
  self->_int powerOn = a3;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (BOOL)isDiscoverable
{
  return self->_isDiscoverable;
}

- (void)setIsDiscoverable:(BOOL)a3
{
  self->_int isDiscoverable = a3;
}

- (BOOL)isConnectable
{
  return self->_isConnectable;
}

- (void)setIsConnectable:(BOOL)a3
{
  self->_int isConnectable = a3;
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_int isScanning = a3;
}

- (NSArray)devices
{
  return self->_devices;
}

@end