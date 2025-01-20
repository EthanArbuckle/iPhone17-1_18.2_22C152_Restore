@interface PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata
+ (BOOL)supportsSecureCoding;
- (NSData)readerIdentifier;
- (NSDictionary)serverParameters;
- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata)initWithCoder:(id)a3;
- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata;
  v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v12 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"readerGroupIdentifier"];
    uint64_t v7 = objc_msgSend(v6, "pk_decodeHexadecimal");
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v7;

    uint64_t v9 = [v4 PKDictionaryForKey:@"serverParameters"];
    serverParameters = v5->_serverParameters;
    v5->_serverParameters = (NSDictionary *)v9;

    if (!v5->_readerIdentifier || !v5->_serverParameters)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)[PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata alloc] _init];
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)self _copyInto:v4];
  uint64_t v5 = [(NSData *)self->_readerIdentifier copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSDictionary *)self->_serverParameters copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata;
  uint64_t v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerIdentifier"];
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    objc_super v12 = objc_msgSend(v8, "initWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"serverParameters"];
    serverParameters = v5->_serverParameters;
    v5->_serverParameters = (NSDictionary *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata;
  id v4 = a3;
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_readerIdentifier, @"readerIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_serverParameters forKey:@"serverParameters"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  uint64_t v7 = [(NSData *)self->_readerIdentifier hexEncoding];
  [v6 appendFormat:@"; readerIdentifier: '%@'", v7];

  [v6 appendFormat:@"; serverParameters: '%@'", self->_serverParameters];
  [v6 appendFormat:@">"];
  id v8 = [NSString stringWithString:v6];

  return v8;
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSDictionary)serverParameters
{
  return self->_serverParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverParameters, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
}

@end