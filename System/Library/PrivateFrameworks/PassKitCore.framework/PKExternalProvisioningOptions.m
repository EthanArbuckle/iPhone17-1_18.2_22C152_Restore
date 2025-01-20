@interface PKExternalProvisioningOptions
+ (BOOL)supportsSecureCoding;
+ (id)mockOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToExternalProvisioningOptions:(id)a3;
- (NSArray)devices;
- (PKExternalProvisioningOptions)init;
- (PKExternalProvisioningOptions)initWithCoder:(id)a3;
- (PKExternalProvisioningOptions)initWithDictionary:(id)a3;
- (PKExternalProvisioningPolicy)policy;
- (id)description;
- (unint64_t)authorizationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizationType:(unint64_t)a3;
- (void)setDevices:(id)a3;
- (void)setPolicy:(id)a3;
@end

@implementation PKExternalProvisioningOptions

- (PKExternalProvisioningOptions)init
{
  return 0;
}

- (PKExternalProvisioningOptions)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKExternalProvisioningOptions;
    v5 = [(PKExternalProvisioningOptions *)&v18 init];
    if (v5)
    {
      v6 = [PKExternalProvisioningPolicy alloc];
      v7 = [v4 PKDictionaryForKey:@"provisioningPolicy"];
      uint64_t v8 = [(PKExternalProvisioningPolicy *)v6 initWithDictionary:v7];
      policy = v5->_policy;
      v5->_policy = (PKExternalProvisioningPolicy *)v8;

      v10 = [v4 objectForKeyedSubscript:@"authorizationType"];

      if (v10)
      {
        v11 = [v4 PKStringForKey:@"authorizationType"];
        v5->_authorizationType = PKExternalProvisioningAuthorizationTypeFromString(v11);
      }
      else
      {
        v5->_authorizationType = 1;
      }
      v13 = [v4 PKArrayContaining:objc_opt_class() forKey:@"devices"];
      uint64_t v14 = objc_msgSend(v13, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_215);
      devices = v5->_devices;
      v5->_devices = (NSArray *)v14;

      v16 = v5->_devices;
      if (!v16 || ![(NSArray *)v16 count])
      {

        v5 = 0;
      }
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

PKExternalDestinationDevice *__52__PKExternalProvisioningOptions_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKExternalDestinationDevice alloc] initWithDictionary:v2];

  return v3;
}

+ (id)mockOptions
{
  id v2 = [[PKExternalProvisioningOptions alloc] initWithDictionary:&unk_1EE22E5B8];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExternalProvisioningOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKExternalProvisioningOptions;
  v5 = [(PKExternalProvisioningOptions *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"policy"];
    policy = v5->_policy;
    v5->_policy = (PKExternalProvisioningPolicy *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationType"];
    v5->_authorizationType = PKExternalProvisioningAuthorizationTypeFromString(v8);

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"devices"];
    devices = v5->_devices;
    v5->_devices = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  policy = self->_policy;
  id v8 = a3;
  [v8 encodeObject:policy forKey:@"policy"];
  unint64_t authorizationType = self->_authorizationType;
  uint64_t v6 = @"none";
  if (authorizationType != 1) {
    uint64_t v6 = 0;
  }
  if (authorizationType == 2) {
    v7 = @"dpan";
  }
  else {
    v7 = v6;
  }
  [v8 encodeObject:v7 forKey:@"authorizationType"];
  [v8 encodeObject:self->_devices forKey:@"devices"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"policy: '%@'; ", self->_policy];
  [v6 appendFormat:@"devices: '%@'; ", self->_devices];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_policy];
  [v3 safelyAddObject:self->_devices];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_authorizationType - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKExternalProvisioningOptions *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKExternalProvisioningOptions *)self isEqualToExternalProvisioningOptions:v5];

  return v6;
}

- (BOOL)isEqualToExternalProvisioningOptions:(id)a3
{
  uint64_t v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  policy = self->_policy;
  BOOL v6 = (PKExternalProvisioningPolicy *)v4[1];
  if (policy) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[PKExternalProvisioningPolicy isEqual:](policy, "isEqual:")) {
      goto LABEL_10;
    }
LABEL_14:
    char v10 = 0;
    goto LABEL_15;
  }
  if (policy != v6) {
    goto LABEL_14;
  }
LABEL_10:
  if (self->_authorizationType != v4[2]) {
    goto LABEL_14;
  }
  devices = self->_devices;
  v9 = (NSArray *)v4[3];
  if (devices && v9) {
    char v10 = -[NSArray isEqual:](devices, "isEqual:");
  }
  else {
    char v10 = devices == v9;
  }
LABEL_15:

  return v10;
}

- (PKExternalProvisioningPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (unint64_t)authorizationType
{
  return self->_authorizationType;
}

- (void)setAuthorizationType:(unint64_t)a3
{
  self->_unint64_t authorizationType = a3;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_policy, 0);
}

@end