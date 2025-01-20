@interface PRBeaconDescriptor
+ (BOOL)supportsSecureCoding;
- (NSNumber)major;
- (NSNumber)minor;
- (NSUUID)UUID;
- (PRBeaconDescriptor)init;
- (PRBeaconDescriptor)initWithCoder:(id)a3;
- (PRBeaconDescriptor)initWithUUID:(id)a3;
- (PRBeaconDescriptor)initWithUUID:(id)a3 major:(unsigned __int16)a4;
- (PRBeaconDescriptor)initWithUUID:(id)a3 major:(unsigned __int16)a4 minor:(unsigned __int16)a5;
- (id)_initWithUUID:(id)a3 major:(id)a4 minor:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)macAddress;
- (void)encodeWithCoder:(id)a3;
- (void)setMacAddress:(unint64_t)a3;
@end

@implementation PRBeaconDescriptor

- (PRBeaconDescriptor)init
{
  return 0;
}

- (id)_initWithUUID:(id)a3 major:(id)a4 minor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PRBeaconDescriptor;
  v12 = [(PRBeaconDescriptor *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_UUID, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  UUID = self->_UUID;
  major = self->_major;
  minor = self->_minor;
  return (id)[v4 _initWithUUID:UUID major:major minor:minor];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_major forKey:@"major"];
  [v5 encodeObject:self->_minor forKey:@"minor"];
}

- (PRBeaconDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"major"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minor"];

  v8 = [(PRBeaconDescriptor *)self _initWithUUID:v5 major:v6 minor:v7];
  return v8;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)major
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)minor
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(unint64_t)a3
{
  self->_macAddress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minor, 0);
  objc_storeStrong((id *)&self->_major, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (PRBeaconDescriptor)initWithUUID:(id)a3
{
  return (PRBeaconDescriptor *)[(PRBeaconDescriptor *)self _initWithUUID:a3 major:0 minor:0];
}

- (PRBeaconDescriptor)initWithUUID:(id)a3 major:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithUnsignedShort:v4];
  id v9 = [(PRBeaconDescriptor *)self _initWithUUID:v7 major:v8 minor:0];

  return v9;
}

- (PRBeaconDescriptor)initWithUUID:(id)a3 major:(unsigned __int16)a4 minor:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  v8 = NSNumber;
  id v9 = a3;
  id v10 = [v8 numberWithUnsignedShort:v6];
  id v11 = [NSNumber numberWithUnsignedShort:v5];
  v12 = [(PRBeaconDescriptor *)self _initWithUUID:v9 major:v10 minor:v11];

  return v12;
}

@end