@interface PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata
+ (BOOL)supportsSecureCoding;
- (PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata)initWithCoder:(id)a3;
- (PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata)initWithDictionary:(id)a3;
- (PKSubcredentialEncryptedContainer)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata;
  v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v9 initWithDictionary:v4];
  if (v5)
  {
    v6 = [[PKSubcredentialEncryptedContainer alloc] initWithDictionary:v4];
    container = v5->_container;
    v5->_container = v6;

    if (!v5->_container)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)[PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata alloc] _init];
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)self _copyInto:v4];
  uint64_t v5 = [(PKSubcredentialEncryptedContainer *)self->_container copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata;
  uint64_t v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"container"];
    container = v5->_container;
    v5->_container = (PKSubcredentialEncryptedContainer *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata;
  id v4 = a3;
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_container, @"container", v5.receiver, v5.super_class);
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@"; container: '%@'", self->_container];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (PKSubcredentialEncryptedContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
}

@end