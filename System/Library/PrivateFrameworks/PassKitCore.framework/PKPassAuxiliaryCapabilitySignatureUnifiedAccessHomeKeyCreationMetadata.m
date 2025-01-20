@interface PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata
+ (BOOL)supportsSecureCoding;
- (NSData)readerIdentifier;
- (NSData)readerPublicKey;
- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata)initWithCoder:(id)a3;
- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata)initWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata)initWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata;
  v9 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v12 _init];
  v10 = (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_readerPublicKey, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)[PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata alloc] _init];
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)self _copyInto:v4];
  uint64_t v5 = [(NSData *)self->_readerIdentifier copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSData *)self->_readerPublicKey copy];
  id v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata;
  uint64_t v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerIdentifier"];
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerPublicKey"];
    readerPublicKey = v5->_readerPublicKey;
    v5->_readerPublicKey = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata;
  id v4 = a3;
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_readerIdentifier, @"readerIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_readerPublicKey forKey:@"readerPublicKey"];
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

  [v6 appendFormat:@">"];
  v9 = [NSString stringWithString:v6];

  return v9;
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSData)readerPublicKey
{
  return self->_readerPublicKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerPublicKey, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
}

@end