@interface PKPassAuxiliaryRegistrationDecryptionRequirement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassAuxiliaryRegistrationDecryptionRequirement:(id)a3;
- (NSString)groupIdentifier;
- (PKPassAuxiliaryRegistrationDecryptionRequirement)initWithCoder:(id)a3;
- (PKPassAuxiliaryRegistrationDecryptionRequirement)initWithDictionary:(id)a3;
- (id)_mutableDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)decryptionSchemeVersion;
- (unint64_t)hash;
- (unint64_t)role;
- (unint64_t)type;
- (unint64_t)usage;
- (void)_decorateDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassAuxiliaryRegistrationDecryptionRequirement

- (PKPassAuxiliaryRegistrationDecryptionRequirement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPassAuxiliaryRegistrationDecryptionRequirement;
  v5 = [(PKPassAuxiliaryRegistrationRequirement *)&v18 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v5->_type = PKDeviceDecryptionTypeFromString(v6);

    v7 = [v4 PKStringForKey:@"usage"];
    v5->_usage = PKDeviceDecryptionUsageFromString(v7);

    v8 = [v4 PKStringForKey:@"version"];
    v5->_decryptionSchemeVersion = PKDecryptionSchemeVersionFromString(v8);

    uint64_t v9 = [v4 PKStringForKey:@"groupingIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v9;

    v11 = [v4 PKStringForKey:@"source"];
    if (v11 == @"applePayTrust"
      || (v12 = v11) != 0
      && (int v13 = [(__CFString *)v11 isEqualToString:@"applePayTrust"],
          v12,
          v12,
          v13))
    {
      v5->_type = 4;
    }
    else if (v5->_type == 3)
    {
      v14 = [(PKPassAuxiliaryRegistrationRequirement *)v5 identifier];

      if (!v14) {
        [(PKPassAuxiliaryRegistrationRequirement *)v5 setIdentifier:@"deviceDecryption"];
      }
    }
    v15 = [v4 PKDictionaryForKey:@"metadata"];
    if (v15)
    {
      v16 = +[PKPassAuxiliaryCapabilityKeyCreationMetadata createMetadataFromDictionary:v15 forDecryptionCapabilityType:v5->_type];
      if (v16) {
        [(PKPassAuxiliaryRegistrationRequirement *)v5 setKeyCreationMetadata:v16];
      }
    }
  }

  return v5;
}

- (id)_mutableDictionaryRepresentation
{
  v13.receiver = self;
  v13.super_class = (Class)PKPassAuxiliaryRegistrationDecryptionRequirement;
  v3 = [(PKPassAuxiliaryRegistrationRequirement *)&v13 _mutableDictionaryRepresentation];
  id v4 = v3;
  unint64_t v5 = self->_type - 1;
  if (v5 > 4) {
    v6 = 0;
  }
  else {
    v6 = off_1E56DF3C0[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"type"];
  if (self->_usage == 1) {
    v7 = @"isoContainer";
  }
  else {
    v7 = 0;
  }
  [v4 setObject:v7 forKeyedSubscript:@"usage"];
  unint64_t decryptionSchemeVersion = self->_decryptionSchemeVersion;
  uint64_t v9 = @"EC_v3";
  if (decryptionSchemeVersion != 1) {
    uint64_t v9 = 0;
  }
  if (decryptionSchemeVersion == 2) {
    v10 = @"hpke";
  }
  else {
    v10 = v9;
  }
  [v4 setObject:v10 forKeyedSubscript:@"version"];
  v11 = (void *)[(NSString *)self->_groupIdentifier copy];
  [v4 setObject:v11 forKeyedSubscript:@"groupingIdentifier"];

  return v4;
}

- (unint64_t)role
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryRegistrationDecryptionRequirement)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassAuxiliaryRegistrationDecryptionRequirement;
  unint64_t v5 = [(PKPassAuxiliaryRegistrationRequirement *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usage"];
    v5->_usage = [v7 unsignedIntegerValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"decryptionSchemeVersion"];
    v5->_unint64_t decryptionSchemeVersion = [v8 unsignedIntegerValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPassAuxiliaryRegistrationDecryptionRequirement;
  id v4 = a3;
  [(PKPassAuxiliaryRegistrationRequirement *)&v8 encodeWithCoder:v4];
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_type, v8.receiver, v8.super_class);
  [v4 encodeObject:v5 forKey:@"type"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_usage];
  [v4 encodeObject:v6 forKey:@"usage"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_decryptionSchemeVersion];
  [v4 encodeObject:v7 forKey:@"decryptionSchemeVersion"];

  [v4 encodeObject:self->_groupIdentifier forKey:@"groupIdentifier"];
}

- (void)_decorateDescription:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassAuxiliaryRegistrationDecryptionRequirement;
  [(PKPassAuxiliaryRegistrationRequirement *)&v11 _decorateDescription:v4];
  unint64_t v5 = self->_type - 1;
  if (v5 > 4) {
    v6 = 0;
  }
  else {
    v6 = off_1E56DF3C0[v5];
  }
  [v4 appendFormat:@"type: '%@'; ", v6];
  if (self->_usage == 1) {
    v7 = @"isoContainer";
  }
  else {
    v7 = 0;
  }
  [v4 appendFormat:@"usage: '%@'; ", v7];
  unint64_t decryptionSchemeVersion = self->_decryptionSchemeVersion;
  if (decryptionSchemeVersion)
  {
    uint64_t v9 = @"EC_v3";
    if (decryptionSchemeVersion != 1) {
      uint64_t v9 = 0;
    }
    if (decryptionSchemeVersion == 2) {
      v10 = @"hpke";
    }
    else {
      v10 = v9;
    }
    [v4 appendFormat:@"decryptionSchemeVersion: '%@'; ", v10];
  }
  [v4 appendFormat:@"groupIdentifier: '%@'; ", self->_groupIdentifier];
  objc_msgSend(v4, "appendFormat:", @"backoff: '%lu'; ",
    [(PKPassAuxiliaryRegistrationRequirement *)self registrationBackoffCounter]);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_usage - v5 + 32 * v5;
  unint64_t v7 = self->_decryptionSchemeVersion - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPassAuxiliaryRegistrationDecryptionRequirement *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassAuxiliaryRegistrationDecryptionRequirement *)self isEqualToPassAuxiliaryRegistrationDecryptionRequirement:v5];

  return v6;
}

- (BOOL)isEqualToPassAuxiliaryRegistrationDecryptionRequirement:(id)a3
{
  uint64_t v4 = a3;
  BOOL v5 = v4
    && self->_type == v4[7]
    && self->_usage == v4[8]
    && self->_decryptionSchemeVersion == v4[9]
    && self->_groupIdentifier
    && v4[10] != 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(PKPassAuxiliaryRegistrationDecryptionRequirement);
  [(PKPassAuxiliaryRegistrationRequirement *)self _copyInto:v4];
  v4->_type = self->_type;
  v4->_usage = self->_usage;
  v4->_unint64_t decryptionSchemeVersion = self->_decryptionSchemeVersion;
  uint64_t v5 = [(NSString *)self->_groupIdentifier copy];
  groupIdentifier = v4->_groupIdentifier;
  v4->_groupIdentifier = (NSString *)v5;

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (unint64_t)decryptionSchemeVersion
{
  return self->_decryptionSchemeVersion;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
}

@end