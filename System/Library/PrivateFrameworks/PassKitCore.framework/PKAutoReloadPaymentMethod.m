@interface PKAutoReloadPaymentMethod
+ (BOOL)supportsSecureCoding;
- (NSString)fpanIdentifier;
- (NSString)imageName;
- (NSString)merchantTokenIdentifier;
- (NSString)name;
- (NSString)suffix;
- (NSURL)managementURL;
- (PKAutoReloadPaymentMethod)initWithCoder:(id)a3;
- (PKAutoReloadPaymentMethod)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setFpanIdentifier:(id)a3;
- (void)setImageName:(id)a3;
- (void)setManagementURL:(id)a3;
- (void)setMerchantTokenIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSuffix:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAutoReloadPaymentMethod

- (PKAutoReloadPaymentMethod)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKAutoReloadPaymentMethod;
  v5 = [(PKAutoReloadPaymentMethod *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"suffix"];
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"fpanIdentifier"];
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"merchantTokenIdentifier"];
    merchantTokenIdentifier = v5->_merchantTokenIdentifier;
    v5->_merchantTokenIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"imageName"];
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v14;

    uint64_t v16 = [v4 PKURLForKey:@"managementURL"];
    managementURL = v5->_managementURL;
    v5->_managementURL = (NSURL *)v16;

    v18 = [v4 PKStringForKey:@"type"];
    if ([v18 isEqualToString:@"pre_paid"]) {
      v5->_type = 0;
    }
  }
  return v5;
}

- (PKAutoReloadPaymentMethod)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKAutoReloadPaymentMethod;
  v5 = [(PKAutoReloadPaymentMethod *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suffix"];
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpanIdentifier"];
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantTokenIdentifier"];
    merchantTokenIdentifier = v5->_merchantTokenIdentifier;
    v5->_merchantTokenIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managementURL"];
    managementURL = v5->_managementURL;
    v5->_managementURL = (NSURL *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v18 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_suffix forKey:@"suffix"];
  [v5 encodeObject:self->_fpanIdentifier forKey:@"fpanIdentifier"];
  [v5 encodeObject:self->_merchantTokenIdentifier forKey:@"merchantTokenIdentifier"];
  [v5 encodeObject:self->_imageName forKey:@"imageName"];
  [v5 encodeObject:self->_managementURL forKey:@"managementURL"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v5 encodeObject:v6 forKey:@"type"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"name: %@; ", self->_name];
  [v3 appendFormat:@"suffix: %@; ", self->_suffix];
  [v3 appendFormat:@"fpanIdentifier: %@; ", self->_fpanIdentifier];
  [v3 appendFormat:@"merchantTokenIdentifier: %@; ", self->_merchantTokenIdentifier];
  [v3 appendFormat:@"imageName: %@; ", self->_imageName];
  [v3 appendFormat:@"managementURL: %@; ", self->_managementURL];
  objc_msgSend(v3, "appendFormat:", @"type: %lu; ", self->_type);
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
}

- (NSString)merchantTokenIdentifier
{
  return self->_merchantTokenIdentifier;
}

- (void)setMerchantTokenIdentifier:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSURL)managementURL
{
  return self->_managementURL;
}

- (void)setManagementURL:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_merchantTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end