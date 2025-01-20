@interface PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata
+ (BOOL)supportsSecureCoding;
- (NSData)readerIdentifier;
- (NSData)readerPublicKey;
- (NSUUID)homeIdentifier;
- (PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata)initWithCoder:(id)a3;
- (PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata)initWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 homeIdentifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata)initWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 homeIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata;
  v12 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v15 _init];
  v13 = (PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong((id *)&v13->_readerPublicKey, a4);
    objc_storeStrong((id *)&v13->_homeIdentifier, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)[PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata alloc] _init];
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)self _copyInto:v4];
  uint64_t v5 = [(NSData *)self->_readerIdentifier copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSData *)self->_readerPublicKey copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSUUID *)self->_homeIdentifier copy];
  id v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata;
  uint64_t v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerIdentifier"];
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerPublicKey"];
    readerPublicKey = v5->_readerPublicKey;
    v5->_readerPublicKey = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeIdentifier"];
    homeIdentifier = v5->_homeIdentifier;
    v5->_homeIdentifier = (NSUUID *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata;
  id v4 = a3;
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_readerIdentifier, @"readerIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_readerPublicKey forKey:@"readerPublicKey"];
  [v4 encodeObject:self->_homeIdentifier forKey:@"homeIdentifier"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  uint64_t v7 = [(NSData *)self->_readerIdentifier hexEncoding];
  [v6 appendFormat:@"; readerIdentifier: '%@'", v7];

  uint64_t v8 = [(NSData *)self->_readerPublicKey hexEncoding];
  [v6 appendFormat:@"; readerPublicKey: '%@'", v8];

  uint64_t v9 = [(NSUUID *)self->_homeIdentifier UUIDString];
  [v6 appendFormat:@"; homeIdentifier: '%@'", v9];

  [v6 appendFormat:@">"];
  uint64_t v10 = [NSString stringWithString:v6];

  return v10;
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSData)readerPublicKey
{
  return self->_readerPublicKey;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_readerPublicKey, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
}

@end