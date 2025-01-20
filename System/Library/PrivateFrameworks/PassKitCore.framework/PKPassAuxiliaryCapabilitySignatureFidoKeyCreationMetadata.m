@interface PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata
+ (BOOL)supportsSecureCoding;
- (NSData)fidoChallenge;
- (PKFidoProfile)fidoProfile;
- (PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata)initWithCoder:(id)a3;
- (PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata;
  v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v14 initWithDictionary:v4];
  if (v5)
  {
    v6 = [PKFidoProfile alloc];
    v7 = [v4 PKDictionaryForKey:@"fidoProfile"];
    uint64_t v8 = [(PKFidoProfile *)v6 initWithDictionary:v7];
    fidoProfile = v5->_fidoProfile;
    v5->_fidoProfile = (PKFidoProfile *)v8;

    v10 = [v4 PKStringForKey:@"fidoChallenge"];
    if (v10)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
      fidoChallenge = v5->_fidoChallenge;
      v5->_fidoChallenge = (NSData *)v11;
    }
    if (!v5->_fidoProfile || !v5->_fidoChallenge)
    {

      v5 = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)[PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata alloc] _init];
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)self _copyInto:v4];
  uint64_t v5 = [(NSData *)self->_fidoChallenge copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata;
  uint64_t v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fidoProfile"];
    fidoProfile = v5->_fidoProfile;
    v5->_fidoProfile = (PKFidoProfile *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fidoChallenge"];
    fidoChallenge = v5->_fidoChallenge;
    v5->_fidoChallenge = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata;
  id v4 = a3;
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_fidoProfile, @"fidoProfile", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_fidoChallenge forKey:@"fidoChallenge"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@"; fidoProfile: '%@'", self->_fidoProfile];
  v7 = [(NSData *)self->_fidoChallenge hexEncoding];
  [v6 appendFormat:@"; fidoChallenge: '%@'", v7];

  [v6 appendFormat:@">"];
  uint64_t v8 = [NSString stringWithString:v6];

  return v8;
}

- (PKFidoProfile)fidoProfile
{
  return self->_fidoProfile;
}

- (NSData)fidoChallenge
{
  return self->_fidoChallenge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fidoChallenge, 0);
  objc_storeStrong((id *)&self->_fidoProfile, 0);
}

@end