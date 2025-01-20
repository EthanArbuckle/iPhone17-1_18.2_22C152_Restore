@interface PKExternalProvisioningPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToExternalProvisioningPolicy:(id)a3;
- (NSDictionary)deviceLimits;
- (NSString)type;
- (PKExternalProvisioningPolicy)init;
- (PKExternalProvisioningPolicy)initWithCoder:(id)a3;
- (PKExternalProvisioningPolicy)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceLimits:(id)a3;
- (void)setType:(id)a3;
@end

@implementation PKExternalProvisioningPolicy

- (PKExternalProvisioningPolicy)init
{
  return 0;
}

- (PKExternalProvisioningPolicy)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)PKExternalProvisioningPolicy;
    v5 = [(PKExternalProvisioningPolicy *)&v13 init];
    if (v5)
    {
      uint64_t v6 = [v4 PKStringForKey:@"type"];
      type = v5->_type;
      v5->_type = (NSString *)v6;

      uint64_t v8 = objc_opt_class();
      uint64_t v9 = [v4 PKDictionaryOfKeyClass:v8 valueClass:objc_opt_class() ForKey:@"deviceLimits"];
      deviceLimits = v5->_deviceLimits;
      v5->_deviceLimits = (NSDictionary *)v9;
    }
    self = v5;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExternalProvisioningPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKExternalProvisioningPolicy;
  v5 = [(PKExternalProvisioningPolicy *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"deviceLimits"];
    deviceLimits = v5->_deviceLimits;
    v5->_deviceLimits = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  type = self->_type;
  id v5 = a3;
  [v5 encodeObject:type forKey:@"type"];
  [v5 encodeObject:self->_deviceLimits forKey:@"deviceLimits"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"type: '%@'; ", self->_type];
  [v6 appendFormat:@"deviceLimits: '%@'; ", self->_deviceLimits];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_type];
  [v3 safelyAddObject:self->_deviceLimits];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKExternalProvisioningPolicy *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKExternalProvisioningPolicy *)self isEqualToExternalProvisioningPolicy:v5];

  return v6;
}

- (BOOL)isEqualToExternalProvisioningPolicy:(id)a3
{
  unint64_t v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  type = self->_type;
  BOOL v6 = (NSString *)v4[1];
  if (type) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSString isEqual:](type, "isEqual:")) {
      goto LABEL_11;
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  if (type != v6) {
    goto LABEL_8;
  }
LABEL_11:
  deviceLimits = self->_deviceLimits;
  uint64_t v11 = (NSDictionary *)v4[2];
  if (deviceLimits && v11) {
    char v8 = -[NSDictionary isEqual:](deviceLimits, "isEqual:");
  }
  else {
    char v8 = deviceLimits == v11;
  }
LABEL_9:

  return v8;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSDictionary)deviceLimits
{
  return self->_deviceLimits;
}

- (void)setDeviceLimits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLimits, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end