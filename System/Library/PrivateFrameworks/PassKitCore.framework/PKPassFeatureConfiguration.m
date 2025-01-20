@interface PKPassFeatureConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassFeatureConfiguration:(id)a3;
- (PKOSVersionRequirementRange)versionRange;
- (PKPassFeatureConfiguration)init;
- (PKPassFeatureConfiguration)initWithCoder:(id)a3;
- (PKPassFeatureConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassFeatureConfiguration

- (PKPassFeatureConfiguration)init
{
  return 0;
}

- (PKPassFeatureConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassFeatureConfiguration;
  v5 = [(PKPassFeatureConfiguration *)&v10 init];
  if (v5)
  {
    v5->_enabled = [v4 PKBoolForKey:@"enabled"];
    v6 = [v4 PKDictionaryForKey:@"versionRange"];
    if (v6)
    {
      v7 = [[PKOSVersionRequirementRange alloc] initWithDictionary:v6];
      versionRange = v5->_versionRange;
      v5->_versionRange = v7;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassFeatureConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassFeatureConfiguration;
  v5 = [(PKPassFeatureConfiguration *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enabled"];
    v5->_enabled = [v6 BOOLValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"versionRange"];
    versionRange = v5->_versionRange;
    v5->_versionRange = (PKOSVersionRequirementRange *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  BOOL enabled = self->_enabled;
  id v7 = a3;
  v6 = [v4 numberWithBool:enabled];
  [v7 encodeObject:v6 forKey:@"enabled"];

  [v7 encodeObject:self->_versionRange forKey:@"versionRange"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: ", v5];

  id v7 = [NSNumber numberWithBool:self->_enabled];
  [v6 appendFormat:@"enabled: '%@'; ", v7];

  [v6 appendFormat:@"versionRange: '%@'; ", self->_versionRange];
  [v6 appendFormat:@">"];
  v8 = [NSString stringWithString:v6];

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_versionRange];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_enabled - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPassFeatureConfiguration *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassFeatureConfiguration *)self isEqualToPassFeatureConfiguration:v5];

  return v6;
}

- (BOOL)isEqualToPassFeatureConfiguration:(id)a3
{
  uint64_t v4 = a3;
  unint64_t v5 = v4;
  if (v4 && self->_enabled == *((unsigned __int8 *)v4 + 8))
  {
    versionRange = self->_versionRange;
    id v7 = (PKOSVersionRequirementRange *)v5[2];
    if (versionRange && v7) {
      BOOL v8 = -[PKOSVersionRequirementRange isEqual:](versionRange, "isEqual:");
    }
    else {
      BOOL v8 = versionRange == v7;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (PKOSVersionRequirementRange)versionRange
{
  return self->_versionRange;
}

- (void).cxx_destruct
{
}

@end