@interface WPCharacteristic
+ (BOOL)supportsSecureCoding;
- (NSData)data;
- (NSUUID)uuid;
- (WPCharacteristic)initWithCoder:(id)a3;
- (id)description;
- (int64_t)writeType;
- (unint64_t)permissions;
- (unint64_t)properties;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setPermissions:(unint64_t)a3;
- (void)setProperties:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)setWriteType:(int64_t)a3;
@end

@implementation WPCharacteristic

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v4 = [(WPCharacteristic *)self uuid];
  v5 = [(WPCharacteristic *)self data];
  v6 = [v3 stringWithFormat:@"characteristic with uuid %@ and data %@", v4, v5];

  return v6;
}

- (WPCharacteristic)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WPCharacteristic;
  v5 = [(WPCharacteristic *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_properties = [v4 decodeIntegerForKey:@"kCharacteristicProperties"];
    v5->_permissions = [v4 decodeIntegerForKey:@"kAttributePermissions"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kData"];
    data = v5->_data;
    v5->_data = (NSData *)v8;

    v5->_writeType = [v4 decodeIntegerForKey:@"kWriteType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(WPCharacteristic *)self uuid];
  [v6 encodeObject:v4 forKey:@"kUUID"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[WPCharacteristic properties](self, "properties"), @"kCharacteristicProperties");
  objc_msgSend(v6, "encodeInteger:forKey:", -[WPCharacteristic permissions](self, "permissions"), @"kAttributePermissions");
  v5 = [(WPCharacteristic *)self data];
  [v6 encodeObject:v5 forKey:@"kData"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[WPCharacteristic writeType](self, "writeType"), @"kWriteType");
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (unint64_t)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(unint64_t)a3
{
  self->_permissions = a3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
}

- (int64_t)writeType
{
  return self->_writeType;
}

- (void)setWriteType:(int64_t)a3
{
  self->_writeType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end