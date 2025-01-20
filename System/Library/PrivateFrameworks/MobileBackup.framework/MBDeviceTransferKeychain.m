@interface MBDeviceTransferKeychain
+ (BOOL)supportsSecureCoding;
- (MBDeviceTransferKeychain)init;
- (MBDeviceTransferKeychain)initWithCoder:(id)a3;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation MBDeviceTransferKeychain

- (MBDeviceTransferKeychain)init
{
  v6.receiver = self;
  v6.super_class = (Class)MBDeviceTransferKeychain;
  v2 = [(MBDeviceTransferKeychain *)&v6 init];
  if (v2)
  {
    uint64_t v3 = MBRandomUUID();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBDeviceTransferKeychain)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MBDeviceTransferKeychain;
  v5 = [(MBDeviceTransferKeychain *)&v8 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    [(MBDeviceTransferKeychain *)v5 setUuid:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MBDeviceTransferKeychain *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(MBDeviceTransferKeychain *)self uuid];
  objc_super v6 = (void *)[v5 copy];
  [v4 setUuid:v6];

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  objc_super v6 = [(MBDeviceTransferKeychain *)self uuid];
  v7 = [v3 stringWithFormat:@"<%s: %p uuid=%@>", Name, self, v6];;

  return v7;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end