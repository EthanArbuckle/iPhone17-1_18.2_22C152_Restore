@interface PKAddressFormatConfiguration
+ (BOOL)supportsSecureCoding;
- (PKAddressFormatConfiguration)initWithCoder:(id)a3;
- (PKAddressFormatConfiguration)initWithDictionary:(id)a3;
- (PKContactFieldConfiguration)cityFieldConfiguration;
- (PKContactFieldConfiguration)postalCodeFieldConfiguration;
- (PKContactFieldConfiguration)stateFieldConfiguration;
- (PKContactFieldConfiguration)streetFieldConfiguration;
- (PKContactFieldConfiguration)subAdministrativeAreaFieldConfiguration;
- (PKContactFieldConfiguration)subLocalityFieldConfiguration;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAddressFormatConfiguration

- (PKAddressFormatConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKAddressFormatConfiguration;
  v5 = [(PKAddressFormatConfiguration *)&v25 init];
  if (v5)
  {
    v6 = [v4 PKDictionaryForKey:@"street"];
    uint64_t v7 = +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:v6];
    streetFieldConfiguration = v5->_streetFieldConfiguration;
    v5->_streetFieldConfiguration = (PKContactFieldConfiguration *)v7;

    v9 = [v4 PKDictionaryForKey:@"subLocality"];
    uint64_t v10 = +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:v9];
    subLocalityFieldConfiguration = v5->_subLocalityFieldConfiguration;
    v5->_subLocalityFieldConfiguration = (PKContactFieldConfiguration *)v10;

    v12 = [v4 PKDictionaryForKey:@"city"];
    uint64_t v13 = +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:v12];
    cityFieldConfiguration = v5->_cityFieldConfiguration;
    v5->_cityFieldConfiguration = (PKContactFieldConfiguration *)v13;

    v15 = [v4 PKDictionaryForKey:@"subAdministrativeArea"];
    uint64_t v16 = +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:v15];
    subAdministrativeAreaFieldConfiguration = v5->_subAdministrativeAreaFieldConfiguration;
    v5->_subAdministrativeAreaFieldConfiguration = (PKContactFieldConfiguration *)v16;

    v18 = [v4 PKDictionaryForKey:@"state"];
    uint64_t v19 = +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:v18];
    stateFieldConfiguration = v5->_stateFieldConfiguration;
    v5->_stateFieldConfiguration = (PKContactFieldConfiguration *)v19;

    v21 = [v4 PKDictionaryForKey:@"postalCode"];
    uint64_t v22 = +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:v21];
    postalCodeFieldConfiguration = v5->_postalCodeFieldConfiguration;
    v5->_postalCodeFieldConfiguration = (PKContactFieldConfiguration *)v22;
  }
  return v5;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"%@: '%@'; ", @"street", self->_streetFieldConfiguration];
  [v3 appendFormat:@"%@: '%@'; ", @"subLocality", self->_subLocalityFieldConfiguration];
  [v3 appendFormat:@"%@: '%@'; ", @"city", self->_cityFieldConfiguration];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"subAdministrativeArea",
    self->_subAdministrativeAreaFieldConfiguration);
  [v3 appendFormat:@"%@: '%@'; ", @"state", self->_stateFieldConfiguration];
  [v3 appendFormat:@"%@: '%@'; ", @"postalCode", self->_postalCodeFieldConfiguration];
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
  streetFieldConfiguration = self->_streetFieldConfiguration;
  id v5 = a3;
  [v5 encodeObject:streetFieldConfiguration forKey:@"street"];
  [v5 encodeObject:self->_subLocalityFieldConfiguration forKey:@"subLocality"];
  [v5 encodeObject:self->_cityFieldConfiguration forKey:@"city"];
  [v5 encodeObject:self->_subAdministrativeAreaFieldConfiguration forKey:@"subAdministrativeArea"];
  [v5 encodeObject:self->_stateFieldConfiguration forKey:@"state"];
  [v5 encodeObject:self->_postalCodeFieldConfiguration forKey:@"postalCode"];
}

- (PKAddressFormatConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAddressFormatConfiguration;
  id v5 = [(PKAddressFormatConfiguration *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"street"];
    streetFieldConfiguration = v5->_streetFieldConfiguration;
    v5->_streetFieldConfiguration = (PKContactFieldConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subLocality"];
    subLocalityFieldConfiguration = v5->_subLocalityFieldConfiguration;
    v5->_subLocalityFieldConfiguration = (PKContactFieldConfiguration *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"city"];
    cityFieldConfiguration = v5->_cityFieldConfiguration;
    v5->_cityFieldConfiguration = (PKContactFieldConfiguration *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subAdministrativeArea"];
    subAdministrativeAreaFieldConfiguration = v5->_subAdministrativeAreaFieldConfiguration;
    v5->_subAdministrativeAreaFieldConfiguration = (PKContactFieldConfiguration *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    stateFieldConfiguration = v5->_stateFieldConfiguration;
    v5->_stateFieldConfiguration = (PKContactFieldConfiguration *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postalCode"];
    postalCodeFieldConfiguration = v5->_postalCodeFieldConfiguration;
    v5->_postalCodeFieldConfiguration = (PKContactFieldConfiguration *)v16;
  }
  return v5;
}

- (PKContactFieldConfiguration)streetFieldConfiguration
{
  return self->_streetFieldConfiguration;
}

- (PKContactFieldConfiguration)subLocalityFieldConfiguration
{
  return self->_subLocalityFieldConfiguration;
}

- (PKContactFieldConfiguration)cityFieldConfiguration
{
  return self->_cityFieldConfiguration;
}

- (PKContactFieldConfiguration)subAdministrativeAreaFieldConfiguration
{
  return self->_subAdministrativeAreaFieldConfiguration;
}

- (PKContactFieldConfiguration)stateFieldConfiguration
{
  return self->_stateFieldConfiguration;
}

- (PKContactFieldConfiguration)postalCodeFieldConfiguration
{
  return self->_postalCodeFieldConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalCodeFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_stateFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_subAdministrativeAreaFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_cityFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_subLocalityFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_streetFieldConfiguration, 0);
}

@end