@interface PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata
+ (BOOL)supportsSecureCoding;
- (NSString)existingAccountKeyIdentifier;
- (NSString)subcredentialIdentifier;
- (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata)initWithCoder:(id)a3;
- (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata)initWithDictionary:(id)a3;
- (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata)initWithSubcredentialIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setExistingAccountKeyIdentifier:(id)a3;
@end

@implementation PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata;
  v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v9 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"subcredentialIdentifier"];
    subcredentialIdentifier = v5->_subcredentialIdentifier;
    v5->_subcredentialIdentifier = (NSString *)v6;

    if (!v5->_subcredentialIdentifier)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata)initWithSubcredentialIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata;
  uint64_t v6 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v9 _init];
  v7 = (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)[PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata alloc] _init];
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)self _copyInto:v4];
  uint64_t v5 = [(NSString *)self->_subcredentialIdentifier copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_existingAccountKeyIdentifier copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata;
  uint64_t v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subcredentialIdentifier"];
    subcredentialIdentifier = v5->_subcredentialIdentifier;
    v5->_subcredentialIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"existingAccountKeyIdentifier"];
    existingAccountKeyIdentifier = v5->_existingAccountKeyIdentifier;
    v5->_existingAccountKeyIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata;
  id v4 = a3;
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_subcredentialIdentifier, @"subcredentialIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_existingAccountKeyIdentifier forKey:@"existingAccountKeyIdentifier"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@"; subcredentialIdentifier: '%@'", self->_subcredentialIdentifier];
  [v6 appendFormat:@"; existingAccountKeyIdentifier: '%@'", self->_existingAccountKeyIdentifier];
  [v6 appendFormat:@">"];
  uint64_t v7 = [NSString stringWithString:v6];

  return v7;
}

- (NSString)subcredentialIdentifier
{
  return self->_subcredentialIdentifier;
}

- (NSString)existingAccountKeyIdentifier
{
  return self->_existingAccountKeyIdentifier;
}

- (void)setExistingAccountKeyIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingAccountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_subcredentialIdentifier, 0);
}

@end