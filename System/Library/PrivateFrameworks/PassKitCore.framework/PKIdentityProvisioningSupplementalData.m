@interface PKIdentityProvisioningSupplementalData
+ (BOOL)supportsSecureCoding;
+ (id)createWithData:(id)a3;
- (NSString)accountKeyIdentifier;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (PKIdentityProvisioningSupplementalData)init;
- (PKIdentityProvisioningSupplementalData)initWithCoder:(id)a3;
- (id)dataRepresentation;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountKeyIdentifier:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
@end

@implementation PKIdentityProvisioningSupplementalData

- (PKIdentityProvisioningSupplementalData)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKIdentityProvisioningSupplementalData;
  return [(PKIdentityProvisioningSupplementalData *)&v3 init];
}

+ (id)createWithData:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];

  return v5;
}

- (id)dataRepresentation
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  passTypeIdentifier = self->_passTypeIdentifier;
  id v5 = a3;
  [v5 encodeObject:passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v5 encodeObject:self->_passSerialNumber forKey:@"passSerialNumber"];
  [v5 encodeObject:self->_accountKeyIdentifier forKey:@"accountKeyIdentifier"];
}

- (PKIdentityProvisioningSupplementalData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKIdentityProvisioningSupplementalData;
  id v5 = [(PKIdentityProvisioningSupplementalData *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passSerialNumber"];
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountKeyIdentifier"];
    accountKeyIdentifier = v5->_accountKeyIdentifier;
    v5->_accountKeyIdentifier = (NSString *)v10;
  }
  return v5;
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"passTypeIdentifier: '%@'; ", self->_passTypeIdentifier];
  [v6 appendFormat:@"passSerialNumber: '%@'; ", self->_passSerialNumber];
  [v6 appendFormat:@"accountKeyIdentifier: '%@'; ", self->_accountKeyIdentifier];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (void)setAccountKeyIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end