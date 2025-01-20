@interface PKPassAuxiliaryRegistrationRequirements
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassAuxiliaryRegistrationRequirements:(id)a3;
- (NSArray)allRequirements;
- (NSArray)deviceDecryptionRequirements;
- (NSArray)deviceSignatureRequirements;
- (PKPassAuxiliaryRegistrationRequirements)initWithCoder:(id)a3;
- (PKPassAuxiliaryRegistrationRequirements)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassAuxiliaryRegistrationRequirements

- (PKPassAuxiliaryRegistrationRequirements)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)PKPassAuxiliaryRegistrationRequirements;
    v5 = [(PKPassAuxiliaryRegistrationRequirements *)&v12 init];
    if (v5)
    {
      self = [v4 PKArrayContaining:objc_opt_class() forKey:@"deviceSignatures"];
      uint64_t v6 = [(PKPassAuxiliaryRegistrationRequirements *)self pk_arrayBySafelyApplyingBlock:&__block_literal_global_33];
      deviceSignatureRequirements = v5->_deviceSignatureRequirements;
      v5->_deviceSignatureRequirements = (NSArray *)v6;

      v8 = [v4 PKArrayContaining:objc_opt_class() forKey:@"deviceDecryptions"];
      uint64_t v9 = objc_msgSend(v8, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_312);
      deviceDecryptionRequirements = v5->_deviceDecryptionRequirements;
      v5->_deviceDecryptionRequirements = (NSArray *)v9;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDecryptionRequirements, 0);
  objc_storeStrong((id *)&self->_deviceSignatureRequirements, 0);
}

PKPassAuxiliaryRegistrationSignatureRequirement *__62__PKPassAuxiliaryRegistrationRequirements_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPassAuxiliaryRegistrationSignatureRequirement alloc] initWithDictionary:v2];

  return v3;
}

PKPassAuxiliaryRegistrationDecryptionRequirement *__62__PKPassAuxiliaryRegistrationRequirements_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPassAuxiliaryRegistrationDecryptionRequirement alloc] initWithDictionary:v2];

  return v3;
}

- (NSArray)allRequirements
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = v3;
  if (self->_deviceSignatureRequirements) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  if (self->_deviceDecryptionRequirements) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  if ([v4 count]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  uint64_t v6 = v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryRegistrationRequirements)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassAuxiliaryRegistrationRequirements;
  v5 = [(PKPassAuxiliaryRegistrationRequirements *)&v17 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"deviceSignatureRequirements"];
    deviceSignatureRequirements = v5->_deviceSignatureRequirements;
    v5->_deviceSignatureRequirements = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"deviceDecryptionRequirements"];
    deviceDecryptionRequirements = v5->_deviceDecryptionRequirements;
    v5->_deviceDecryptionRequirements = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceSignatureRequirements = self->_deviceSignatureRequirements;
  id v5 = a3;
  [v5 encodeObject:deviceSignatureRequirements forKey:@"deviceSignatureRequirements"];
  [v5 encodeObject:self->_deviceDecryptionRequirements forKey:@"deviceDecryptionRequirements"];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"deviceSignatureRequirements: '%@'; ", self->_deviceSignatureRequirements];
  [v6 appendFormat:@"deviceDecryptionRequirements: '%@'; ", self->_deviceDecryptionRequirements];
  [v6 appendFormat:@">"];
  uint64_t v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_deviceSignatureRequirements) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_deviceDecryptionRequirements) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassAuxiliaryRegistrationRequirements *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassAuxiliaryRegistrationRequirements *)self isEqualToPassAuxiliaryRegistrationRequirements:v5];

  return v6;
}

- (BOOL)isEqualToPassAuxiliaryRegistrationRequirements:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  deviceSignatureRequirements = self->_deviceSignatureRequirements;
  BOOL v6 = (NSArray *)v4[1];
  if (deviceSignatureRequirements) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSArray isEqual:](deviceSignatureRequirements, "isEqual:")) {
      goto LABEL_11;
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  if (deviceSignatureRequirements != v6) {
    goto LABEL_8;
  }
LABEL_11:
  deviceDecryptionRequirements = self->_deviceDecryptionRequirements;
  v11 = (NSArray *)v4[2];
  if (deviceDecryptionRequirements && v11) {
    char v8 = -[NSArray isEqual:](deviceDecryptionRequirements, "isEqual:");
  }
  else {
    char v8 = deviceDecryptionRequirements == v11;
  }
LABEL_9:

  return v8;
}

- (NSArray)deviceSignatureRequirements
{
  return self->_deviceSignatureRequirements;
}

- (NSArray)deviceDecryptionRequirements
{
  return self->_deviceDecryptionRequirements;
}

@end