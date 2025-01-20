@interface PKPassAuxiliaryRegistrationRequirement
+ (BOOL)supportsSecureCoding;
- (BOOL)canLocallyInvalidateRegistrationState;
- (BOOL)canLocallyValidateRegistrationState;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassAuxiliaryRegistrationRequirement:(id)a3;
- (NSArray)supportedVersions;
- (NSString)identifier;
- (PKPassAuxiliaryCapabilityKeyCreationMetadata)keyCreationMetadata;
- (PKPassAuxiliaryRegistrationRequirement)initWithCoder:(id)a3;
- (PKPassAuxiliaryRegistrationRequirement)initWithDictionary:(id)a3;
- (id)_initWithIdentifier:(id)a3 numberOfKeys:(id)a4 canLocallyInvalidateRegistrationState:(id)a5 canLocallyValidateRegistrationState:(id)a6;
- (id)_mutableDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)numberOfKeys;
- (int64_t)registrationBackoffCounter;
- (unint64_t)hash;
- (unint64_t)role;
- (void)_copyInto:(id)a3;
- (void)_decorateDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyCreationMetadata:(id)a3;
- (void)setRegistrationBackoffCounter:(int64_t)a3;
@end

@implementation PKPassAuxiliaryRegistrationRequirement

- (PKPassAuxiliaryRegistrationRequirement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"identifier"];
  v6 = [v4 PKNumberForKey:@"numberOfKeys"];
  v7 = [v4 PKNumberForKey:@"canLocallyInvalidRegistrationState"];
  v8 = [v4 PKNumberForKey:@"canLocallyValidateRegistrationState"];
  if (v4)
  {
    id v9 = [(PKPassAuxiliaryRegistrationRequirement *)self _initWithIdentifier:v5 numberOfKeys:v6 canLocallyInvalidateRegistrationState:v7 canLocallyValidateRegistrationState:v8];
    if (v9)
    {
      uint64_t v10 = [v4 PKArrayContaining:objc_opt_class() forKey:@"supportedVersions"];
      self = (PKPassAuxiliaryRegistrationRequirement *)*((void *)v9 + 4);
      *((void *)v9 + 4) = v10;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return (PKPassAuxiliaryRegistrationRequirement *)v9;
}

- (id)_initWithIdentifier:(id)a3 numberOfKeys:(id)a4 canLocallyInvalidateRegistrationState:(id)a5 canLocallyValidateRegistrationState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKPassAuxiliaryRegistrationRequirement;
  v15 = [(PKPassAuxiliaryRegistrationRequirement *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    if (v12) {
      v17 = v12;
    }
    else {
      v17 = &unk_1EE22B948;
    }
    v16->_numberOfKeys = [v17 integerValue];
    if (v13) {
      v18 = v13;
    }
    else {
      v18 = (void *)MEMORY[0x1E4F1CC38];
    }
    v16->_canLocallyInvalidateRegistrationState = [v18 BOOLValue];
    if (v14) {
      v19 = v14;
    }
    else {
      v19 = (void *)MEMORY[0x1E4F1CC28];
    }
    v16->_canLocallyValidateRegistrationState = [v19 BOOLValue];
  }

  return v16;
}

- (id)dictionaryRepresentation
{
  v2 = [(PKPassAuxiliaryRegistrationRequirement *)self _mutableDictionaryRepresentation];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)_mutableDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  id v4 = [NSNumber numberWithInteger:self->_numberOfKeys];
  [v3 setObject:v4 forKeyedSubscript:@"numberOfKeys"];

  v5 = [NSNumber numberWithBool:self->_canLocallyInvalidateRegistrationState];
  [v3 setObject:v5 forKeyedSubscript:@"canLocallyInvalidRegistrationState"];

  v6 = [NSNumber numberWithBool:self->_canLocallyValidateRegistrationState];
  [v3 setObject:v6 forKeyedSubscript:@"canLocallyValidateRegistrationState"];

  [v3 setObject:self->_supportedVersions forKeyedSubscript:@"supportedVersions"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryRegistrationRequirement)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPassAuxiliaryRegistrationRequirement;
  v5 = [(PKPassAuxiliaryRegistrationRequirement *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_registrationBackoffCounter = [v4 decodeIntegerForKey:@"registrationBackoffCounter"];
    v5->_numberOfKeys = [v4 decodeIntegerForKey:@"numberOfKeys"];
    v5->_canLocallyInvalidateRegistrationState = [v4 decodeBoolForKey:@"canLocallyInvalidateRegistrationState"];
    v5->_canLocallyValidateRegistrationState = [v4 decodeBoolForKey:@"canLocallyValidateRegistrationState"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"supportedVersions"];
    supportedVersions = v5->_supportedVersions;
    v5->_supportedVersions = (NSArray *)v11;

    id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    objc_super v21 = objc_msgSend(v25, "initWithObjects:", v13, v14, v15, v16, v17, v18, v19, v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"keyCreationMetadata"];
    keyCreationMetadata = v5->_keyCreationMetadata;
    v5->_keyCreationMetadata = (PKPassAuxiliaryCapabilityKeyCreationMetadata *)v22;
  }
  return v5;
}

- (unint64_t)role
{
  return 2;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_registrationBackoffCounter forKey:@"registrationBackoffCounter"];
  [v5 encodeInteger:self->_numberOfKeys forKey:@"numberOfKeys"];
  [v5 encodeBool:self->_canLocallyInvalidateRegistrationState forKey:@"canLocallyInvalidateRegistrationState"];
  [v5 encodeBool:self->_canLocallyValidateRegistrationState forKey:@"canLocallyValidateRegistrationState"];
  [v5 encodeObject:self->_supportedVersions forKey:@"supportedVersions"];
  [v5 encodeObject:self->_keyCreationMetadata forKey:@"keyCreationMetadata"];
}

- (void)_decorateDescription:(id)a3
{
  id v7 = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPassAuxiliaryRegistrationRequirement role](self, "role"));
  [v7 appendFormat:@"role: '%@'; ", v4];

  [v7 appendFormat:@"identifier: '%@'; ", self->_identifier];
  objc_msgSend(v7, "appendFormat:", @"backoff: '%lu'; ", self->_registrationBackoffCounter);
  objc_msgSend(v7, "appendFormat:", @"numberOfKeys: '%ld'; ", self->_numberOfKeys);
  if (self->_canLocallyInvalidateRegistrationState) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v7 appendFormat:@"canLocallyInvalidate: '%@'; ", v5];
  if (self->_canLocallyValidateRegistrationState) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v7 appendFormat:@"canLocallyValidate: '%@'; ", v6];
  [v7 appendFormat:@"supportedVersions: '%@'; ", self->_supportedVersions];
  if (self->_keyCreationMetadata) {
    [v7 appendFormat:@"metadata: '%@'; ", self->_keyCreationMetadata];
  }
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [(PKPassAuxiliaryRegistrationRequirement *)self _decorateDescription:v6];
  [v6 appendString:@">"];
  id v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_supportedVersions];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = [(PKPassAuxiliaryRegistrationRequirement *)self role];
  int64_t v6 = self->_registrationBackoffCounter - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  int64_t v7 = self->_numberOfKeys - v6 + 32 * v6;
  uint64_t v8 = self->_canLocallyInvalidateRegistrationState - v7 + 32 * v7;
  unint64_t v9 = self->_canLocallyValidateRegistrationState - v8 + 32 * v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPassAuxiliaryRegistrationRequirement *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassAuxiliaryRegistrationRequirement *)self isEqualToPassAuxiliaryRegistrationRequirement:v5];

  return v6;
}

- (BOOL)isEqualToPassAuxiliaryRegistrationRequirement:(id)a3
{
  uint64_t v4 = (NSArray **)a3;
  if (!v4) {
    goto LABEL_17;
  }
  unint64_t v5 = [(PKPassAuxiliaryRegistrationRequirement *)self role];
  if (v5 != [v4 role] || (NSArray *)self->_registrationBackoffCounter != v4[5]) {
    goto LABEL_17;
  }
  BOOL v6 = v4[2];
  int64_t v7 = self->_identifier;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    unint64_t v9 = v8;
    if (!v7 || !v8)
    {

LABEL_17:
      char v13 = 0;
      goto LABEL_18;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_17;
    }
  }
  if ((NSArray *)self->_numberOfKeys != v4[3]
    || self->_canLocallyInvalidateRegistrationState != *((unsigned __int8 *)v4 + 8)
    || self->_canLocallyValidateRegistrationState != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_17;
  }
  supportedVersions = self->_supportedVersions;
  id v12 = v4[4];
  if (supportedVersions && v12) {
    char v13 = -[NSArray isEqual:](supportedVersions, "isEqual:");
  }
  else {
    char v13 = supportedVersions == v12;
  }
LABEL_18:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(PKPassAuxiliaryRegistrationRequirement);
  [(PKPassAuxiliaryRegistrationRequirement *)self _copyInto:v4];
  return v4;
}

- (void)_copyInto:(id)a3
{
  identifier = self->_identifier;
  unint64_t v5 = a3;
  uint64_t v6 = [(NSString *)identifier copy];
  int64_t v7 = (void *)v5[2];
  v5[2] = v6;

  v5[5] = self->_registrationBackoffCounter;
  v5[3] = self->_numberOfKeys;
  *((unsigned char *)v5 + 8) = self->_canLocallyInvalidateRegistrationState;
  *((unsigned char *)v5 + 9) = self->_canLocallyValidateRegistrationState;
  uint64_t v8 = [(NSArray *)self->_supportedVersions copy];
  unint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)self->_keyCreationMetadata copy];
  id v11 = (id)v5[6];
  v5[6] = v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)numberOfKeys
{
  return self->_numberOfKeys;
}

- (NSArray)supportedVersions
{
  return self->_supportedVersions;
}

- (BOOL)canLocallyInvalidateRegistrationState
{
  return self->_canLocallyInvalidateRegistrationState;
}

- (BOOL)canLocallyValidateRegistrationState
{
  return self->_canLocallyValidateRegistrationState;
}

- (int64_t)registrationBackoffCounter
{
  return self->_registrationBackoffCounter;
}

- (void)setRegistrationBackoffCounter:(int64_t)a3
{
  self->_registrationBackoffCounter = a3;
}

- (PKPassAuxiliaryCapabilityKeyCreationMetadata)keyCreationMetadata
{
  return self->_keyCreationMetadata;
}

- (void)setKeyCreationMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCreationMetadata, 0);
  objc_storeStrong((id *)&self->_supportedVersions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end