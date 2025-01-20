@interface PKNameComponentFormatConfiguration
+ (BOOL)supportsSecureCoding;
- (PKContactFieldConfiguration)familyNameFieldConfiguration;
- (PKContactFieldConfiguration)givenNameFieldConfiguration;
- (PKContactFieldConfiguration)phoneticFamilyNameFieldConfiguration;
- (PKContactFieldConfiguration)phoneticGivenNameFieldConfiguration;
- (PKNameComponentFormatConfiguration)initWithCoder:(id)a3;
- (PKNameComponentFormatConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKNameComponentFormatConfiguration

- (PKNameComponentFormatConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKNameComponentFormatConfiguration;
  v5 = [(PKNameComponentFormatConfiguration *)&v19 init];
  if (v5)
  {
    v6 = [v4 PKDictionaryForKey:@"givenName"];
    uint64_t v7 = +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:v6];
    givenNameFieldConfiguration = v5->_givenNameFieldConfiguration;
    v5->_givenNameFieldConfiguration = (PKContactFieldConfiguration *)v7;

    v9 = [v4 PKDictionaryForKey:@"familyName"];
    uint64_t v10 = +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:v9];
    familyNameFieldConfiguration = v5->_familyNameFieldConfiguration;
    v5->_familyNameFieldConfiguration = (PKContactFieldConfiguration *)v10;

    v12 = [v4 PKDictionaryForKey:@"phoneticGivenName"];
    uint64_t v13 = +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:v12];
    phoneticGivenNameFieldConfiguration = v5->_phoneticGivenNameFieldConfiguration;
    v5->_phoneticGivenNameFieldConfiguration = (PKContactFieldConfiguration *)v13;

    v15 = [v4 PKDictionaryForKey:@"phoneticFamilyName"];
    uint64_t v16 = +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:v15];
    phoneticFamilyNameFieldConfiguration = v5->_phoneticFamilyNameFieldConfiguration;
    v5->_phoneticFamilyNameFieldConfiguration = (PKContactFieldConfiguration *)v16;
  }
  return v5;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"%@: '%@'; ", @"givenName", self->_givenNameFieldConfiguration];
  [v3 appendFormat:@"%@: '%@'; ", @"familyName", self->_familyNameFieldConfiguration];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"phoneticGivenName",
    self->_phoneticGivenNameFieldConfiguration);
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"phoneticFamilyName",
    self->_phoneticFamilyNameFieldConfiguration);
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  givenNameFieldConfiguration = self->_givenNameFieldConfiguration;
  id v5 = a3;
  [v5 encodeObject:givenNameFieldConfiguration forKey:@"givenName"];
  [v5 encodeObject:self->_familyNameFieldConfiguration forKey:@"familyName"];
  [v5 encodeObject:self->_phoneticFamilyNameFieldConfiguration forKey:@"phoneticGivenName"];
  [v5 encodeObject:self->_phoneticFamilyNameFieldConfiguration forKey:@"phoneticFamilyName"];
}

- (PKNameComponentFormatConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKNameComponentFormatConfiguration;
  id v5 = [(PKNameComponentFormatConfiguration *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"givenName"];
    givenNameFieldConfiguration = v5->_givenNameFieldConfiguration;
    v5->_givenNameFieldConfiguration = (PKContactFieldConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyName"];
    familyNameFieldConfiguration = v5->_familyNameFieldConfiguration;
    v5->_familyNameFieldConfiguration = (PKContactFieldConfiguration *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneticGivenName"];
    phoneticGivenNameFieldConfiguration = v5->_phoneticGivenNameFieldConfiguration;
    v5->_phoneticGivenNameFieldConfiguration = (PKContactFieldConfiguration *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneticFamilyName"];
    phoneticFamilyNameFieldConfiguration = v5->_phoneticFamilyNameFieldConfiguration;
    v5->_phoneticFamilyNameFieldConfiguration = (PKContactFieldConfiguration *)v12;
  }
  return v5;
}

- (PKContactFieldConfiguration)givenNameFieldConfiguration
{
  return self->_givenNameFieldConfiguration;
}

- (PKContactFieldConfiguration)familyNameFieldConfiguration
{
  return self->_familyNameFieldConfiguration;
}

- (PKContactFieldConfiguration)phoneticGivenNameFieldConfiguration
{
  return self->_phoneticGivenNameFieldConfiguration;
}

- (PKContactFieldConfiguration)phoneticFamilyNameFieldConfiguration
{
  return self->_phoneticFamilyNameFieldConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticFamilyNameFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_phoneticGivenNameFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_familyNameFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_givenNameFieldConfiguration, 0);
}

@end