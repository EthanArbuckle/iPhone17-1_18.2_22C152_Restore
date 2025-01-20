@interface PKPassAuxiliaryCapabilityDecryptionISO18013KeyCreationMetadata
+ (BOOL)supportsSecureCoding;
- (PKPassAuxiliaryCapabilityDecryptionISO18013KeyCreationMetadata)initWithCoder:(id)a3;
- (PKPassAuxiliaryCapabilityDecryptionISO18013KeyCreationMetadata)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cardType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassAuxiliaryCapabilityDecryptionISO18013KeyCreationMetadata

- (PKPassAuxiliaryCapabilityDecryptionISO18013KeyCreationMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassAuxiliaryCapabilityDecryptionISO18013KeyCreationMetadata;
  v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v8 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"cardType"];
    v5->_cardType = PKPaymentCardTypeFromString(v6);

    if (!v5->_cardType)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)[PKPassAuxiliaryCapabilityDecryptionISO18013KeyCreationMetadata alloc] _init];
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)self _copyInto:v4];
  v4[1] = self->_cardType;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilityDecryptionISO18013KeyCreationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassAuxiliaryCapabilityDecryptionISO18013KeyCreationMetadata;
  v5 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardType"];
    v5->_cardType = PKPaymentCardTypeFromString(v6);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassAuxiliaryCapabilityDecryptionISO18013KeyCreationMetadata;
  id v4 = a3;
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v6 encodeWithCoder:v4];
  v5 = PKPaymentCardTypeToString(self->_cardType);
  objc_msgSend(v4, "encodeObject:forKey:", v5, @"cardType", v6.receiver, v6.super_class);
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  objc_msgSend(v6, "appendFormat:", @"; cardType: %lu", self->_cardType);
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (int64_t)cardType
{
  return self->_cardType;
}

@end