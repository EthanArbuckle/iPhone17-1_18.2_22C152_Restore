@interface AUDAccessory
+ (BOOL)supportsSecureCoding;
- (AUDAccessory)initWithCoder:(id)a3;
- (AUDAccessory)initWithUID:(id)a3;
- (NSString)fwVersion;
- (NSString)uid;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFwVersion:(id)a3;
@end

@implementation AUDAccessory

- (AUDAccessory)initWithUID:(id)a3
{
  v3 = self;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)AUDAccessory;
    v3 = [(AUDAccessory *)&v6 init];
    if (v3)
    {
      v3->_uid = (NSString *)[a3 copy];
      v3->_fwVersion = 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  uid = self->_uid;
  if (uid) {

  }
  fwVersion = self->_fwVersion;
  if (fwVersion) {

  }
  v5.receiver = self;
  v5.super_class = (Class)AUDAccessory;
  [(AUDAccessory *)&v5 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AUDAccessory)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AUDAccessory;
  v4 = [(AUDAccessory *)&v6 init];
  if (v4)
  {
    v4->_uid = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"AUDAccessory_UID"];
    v4->_fwVersion = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"AUDAccessory_FWVersion"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_uid forKey:@"AUDAccessory_UID"];
  fwVersion = self->_fwVersion;
  [a3 encodeObject:fwVersion forKey:@"AUDAccessory_FWVersion"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUID:", (id)-[NSString copyWithZone:](-[AUDAccessory uid](self, "uid"), "copyWithZone:", a3));
  if (v5) {
    objc_msgSend(v5, "setFwVersion:", (id)-[NSString copyWithZone:](-[AUDAccessory fwVersion](self, "fwVersion"), "copyWithZone:", a3));
  }
  return v5;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)fwVersion
{
  return self->_fwVersion;
}

- (void)setFwVersion:(id)a3
{
}

@end