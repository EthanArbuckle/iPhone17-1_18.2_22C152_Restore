@interface PKRegionalContactFormatConfiguration
+ (BOOL)supportsSecureCoding;
- (PKAddressFormatConfiguration)addressFormatConfiguration;
- (PKNameComponentFormatConfiguration)nameComponentFormatConfiguration;
- (PKRegionalContactFormatConfiguration)initWithCoder:(id)a3;
- (PKRegionalContactFormatConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKRegionalContactFormatConfiguration

- (PKRegionalContactFormatConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKRegionalContactFormatConfiguration;
  v5 = [(PKRegionalContactFormatConfiguration *)&v15 init];
  if (v5)
  {
    v6 = [PKNameComponentFormatConfiguration alloc];
    v7 = [v4 PKDictionaryForKey:@"nameComponentsFormat"];
    uint64_t v8 = [(PKNameComponentFormatConfiguration *)v6 initWithDictionary:v7];
    nameComponentFormatConfiguration = v5->_nameComponentFormatConfiguration;
    v5->_nameComponentFormatConfiguration = (PKNameComponentFormatConfiguration *)v8;

    v10 = [PKAddressFormatConfiguration alloc];
    v11 = [v4 PKDictionaryForKey:@"addressFormat"];
    uint64_t v12 = [(PKAddressFormatConfiguration *)v10 initWithDictionary:v11];
    addressFormatConfiguration = v5->_addressFormatConfiguration;
    v5->_addressFormatConfiguration = (PKAddressFormatConfiguration *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"nameComponentsFormat",
    self->_nameComponentFormatConfiguration);
  [v3 appendFormat:@"%@: '%@'; ", @"addressFormat", self->_addressFormatConfiguration];
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
  nameComponentFormatConfiguration = self->_nameComponentFormatConfiguration;
  id v5 = a3;
  [v5 encodeObject:nameComponentFormatConfiguration forKey:@"nameComponentsFormat"];
  [v5 encodeObject:self->_addressFormatConfiguration forKey:@"addressFormat"];
}

- (PKRegionalContactFormatConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKRegionalContactFormatConfiguration;
  id v5 = [(PKRegionalContactFormatConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nameComponentsFormat"];
    nameComponentFormatConfiguration = v5->_nameComponentFormatConfiguration;
    v5->_nameComponentFormatConfiguration = (PKNameComponentFormatConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"addressFormat"];
    addressFormatConfiguration = v5->_addressFormatConfiguration;
    v5->_addressFormatConfiguration = (PKAddressFormatConfiguration *)v8;
  }
  return v5;
}

- (PKNameComponentFormatConfiguration)nameComponentFormatConfiguration
{
  return self->_nameComponentFormatConfiguration;
}

- (PKAddressFormatConfiguration)addressFormatConfiguration
{
  return self->_addressFormatConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressFormatConfiguration, 0);
  objc_storeStrong((id *)&self->_nameComponentFormatConfiguration, 0);
}

@end