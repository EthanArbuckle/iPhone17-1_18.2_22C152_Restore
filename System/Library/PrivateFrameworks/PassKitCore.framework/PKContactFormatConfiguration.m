@interface PKContactFormatConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)checkFormatOfEmailAddress;
- (BOOL)checkFormatOfPhoneNumber;
- (PKContactFormatConfiguration)initWithCoder:(id)a3;
- (PKContactFormatConfiguration)initWithDictionary:(id)a3;
- (id)contactFieldConfigurationForCountryCode:(id)a3;
- (id)description;
- (id)regionalAddressFormatConfigurations;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKContactFormatConfiguration

- (PKContactFormatConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKContactFormatConfiguration;
  v5 = [(PKContactFormatConfiguration *)&v19 init];
  if (v5)
  {
    v5->_checkFormatOfPhoneNumber = [v4 PKBoolForKey:@"checkFormatOfPhoneNumber"];
    v5->_checkFormatOfEmailAddress = [v4 PKBoolForKey:@"checkFormatOfEmailAddress"];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = [v4 PKDictionaryForKey:@"regionalAddressFormatConfigurations"];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __51__PKContactFormatConfiguration_initWithDictionary___block_invoke;
    v16 = &unk_1E56DD410;
    id v17 = v6;
    v8 = v5;
    v18 = v8;
    id v9 = v6;
    [v7 enumerateKeysAndObjectsUsingBlock:&v13];
    uint64_t v10 = objc_msgSend(v9, "copy", v13, v14, v15, v16);
    regionalAddressFormatConfigurations = v8->_regionalAddressFormatConfigurations;
    v8->_regionalAddressFormatConfigurations = (NSDictionary *)v10;
  }
  return v5;
}

void __51__PKContactFormatConfiguration_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [[PKRegionalContactFormatConfiguration alloc] initWithDictionary:v6];

  if (v7)
  {
    [*(id *)(a1 + 32) setObject:v7 forKey:v5];
  }
  else
  {
    v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412802;
      id v11 = (id)objc_opt_class();
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = 0;
      id v9 = v11;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@: Failed to parse regional address config for countryCode: %@ from dictionary: %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (id)contactFieldConfigurationForCountryCode:(id)a3
{
  return [(NSDictionary *)self->_regionalAddressFormatConfigurations objectForKey:a3];
}

- (id)regionalAddressFormatConfigurations
{
  return self->_regionalAddressFormatConfigurations;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  id v4 = v3;
  if (self->_checkFormatOfPhoneNumber) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"checkFormatOfPhoneNumber", v5];
  if (self->_checkFormatOfEmailAddress) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  [v4 appendFormat:@"%@: '%@'; ", @"checkFormatOfEmailAddress", v6];
  objc_msgSend(v4, "appendFormat:", @"%@: '%@'; ",
    @"regionalAddressFormatConfigurations",
    self->_regionalAddressFormatConfigurations);
  [v4 appendFormat:@">"];
  v7 = (void *)[v4 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL checkFormatOfPhoneNumber = self->_checkFormatOfPhoneNumber;
  id v5 = a3;
  [v5 encodeBool:checkFormatOfPhoneNumber forKey:@"checkFormatOfPhoneNumber"];
  [v5 encodeBool:self->_checkFormatOfEmailAddress forKey:@"checkFormatOfEmailAddress"];
  [v5 encodeObject:self->_regionalAddressFormatConfigurations forKey:@"regionalAddressFormatConfigurations"];
}

- (PKContactFormatConfiguration)initWithCoder:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKContactFormatConfiguration;
  id v5 = [(PKContactFormatConfiguration *)&v12 init];
  if (v5)
  {
    v5->_BOOL checkFormatOfPhoneNumber = [v4 decodeBoolForKey:@"checkFormatOfPhoneNumber"];
    v5->_checkFormatOfEmailAddress = [v4 decodeBoolForKey:@"checkFormatOfEmailAddress"];
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    v8 = (void *)[v6 initWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"regionalAddressFormatConfigurations"];
    regionalAddressFormatConfigurations = v5->_regionalAddressFormatConfigurations;
    v5->_regionalAddressFormatConfigurations = (NSDictionary *)v9;
  }
  return v5;
}

- (BOOL)checkFormatOfPhoneNumber
{
  return self->_checkFormatOfPhoneNumber;
}

- (BOOL)checkFormatOfEmailAddress
{
  return self->_checkFormatOfEmailAddress;
}

- (void).cxx_destruct
{
}

@end