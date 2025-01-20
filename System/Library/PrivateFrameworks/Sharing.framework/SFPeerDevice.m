@interface SFPeerDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefaultPairedDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)validKey;
- (NSString)deviceColor;
- (NSString)enclosureColor;
- (NSString)modelIdentifier;
- (NSString)name;
- (NSString)productBuildVersion;
- (NSString)productName;
- (NSString)productVersion;
- (NSString)uniqueID;
- (SFPeerDevice)initWithCoder:(id)a3;
- (id)description;
- (int64_t)keyCounter;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultPairedDevice:(BOOL)a3;
- (void)setDeviceColor:(id)a3;
- (void)setEnclosureColor:(id)a3;
- (void)setKeyCounter:(int64_t)a3;
- (void)setModelIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setValidKey:(BOOL)a3;
@end

@implementation SFPeerDevice

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p, uniqueID:%@, modelIdentifier:%@, name:%@>", v5, self, self->_uniqueID, self->_modelIdentifier, self->_name];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uniqueID = self->_uniqueID;
    v7 = [v5 uniqueID];
    if ([(NSString *)uniqueID isEqual:v7])
    {
      modelIdentifier = self->_modelIdentifier;
      v9 = [v5 modelIdentifier];
      char v10 = [(NSString *)modelIdentifier isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueID hash];
  return [(NSString *)self->_modelIdentifier hash] ^ v3;
}

- (SFPeerDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SFPeerDevice;
  id v5 = [(SFPeerDevice *)&v31 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    uint64_t v7 = [v6 copy];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelIdentifier"];
    uint64_t v10 = [v9 copy];
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productName"];
    uint64_t v13 = [v12 copy];
    productName = v5->_productName;
    v5->_productName = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productVersion"];
    uint64_t v16 = [v15 copy];
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productBuildVersion"];
    uint64_t v19 = [v18 copy];
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    uint64_t v22 = [v21 copy];
    name = v5->_name;
    v5->_name = (NSString *)v22;

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceColor"];
    uint64_t v25 = [v24 copy];
    deviceColor = v5->_deviceColor;
    v5->_deviceColor = (NSString *)v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enclosureColor"];
    uint64_t v28 = [v27 copy];
    enclosureColor = v5->_enclosureColor;
    v5->_enclosureColor = (NSString *)v28;

    v5->_defaultPairedDevice = [v4 decodeBoolForKey:@"defaultPairedDevice"];
    v5->_validKey = [v4 decodeBoolForKey:@"keyValid"];
    v5->_keyCounter = [v4 decodeIntegerForKey:@"keyCounter"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueID = self->_uniqueID;
  id v5 = a3;
  [v5 encodeObject:uniqueID forKey:@"uniqueID"];
  [v5 encodeObject:self->_modelIdentifier forKey:@"modelIdentifier"];
  [v5 encodeObject:self->_productName forKey:@"productName"];
  [v5 encodeObject:self->_productVersion forKey:@"productVersion"];
  [v5 encodeObject:self->_productBuildVersion forKey:@"productBuildVersion"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_deviceColor forKey:@"deviceColor"];
  [v5 encodeObject:self->_enclosureColor forKey:@"enclosureColor"];
  [v5 encodeBool:self->_defaultPairedDevice forKey:@"defaultPairedDevice"];
  [v5 encodeBool:self->_validKey forKey:@"keyValid"];
  [v5 encodeInteger:self->_keyCounter forKey:@"keyCounter"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)uniqueID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUniqueID:(id)a3
{
}

- (NSString)modelIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModelIdentifier:(id)a3
{
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProductName:(id)a3
{
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)deviceColor
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDeviceColor:(id)a3
{
}

- (NSString)enclosureColor
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEnclosureColor:(id)a3
{
}

- (BOOL)isDefaultPairedDevice
{
  return self->_defaultPairedDevice;
}

- (void)setDefaultPairedDevice:(BOOL)a3
{
  self->_defaultPairedDevice = a3;
}

- (BOOL)validKey
{
  return self->_validKey;
}

- (void)setValidKey:(BOOL)a3
{
  self->_validKey = a3;
}

- (int64_t)keyCounter
{
  return self->_keyCounter;
}

- (void)setKeyCounter:(int64_t)a3
{
  self->_keyCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end