@interface MCCSecretAgentContext
+ (BOOL)supportsSecureCoding;
- (MCCSecretAgentContext)initWithCoder:(id)a3;
- (NSDictionary)csrAltName;
- (NSString)certType;
- (NSString)commonName;
- (NSString)country;
- (NSString)keyType;
- (NSString)organization;
- (NSString)organizationUnit;
- (NSString)state;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)keyValue;
- (void)encodeWithCoder:(id)a3;
- (void)setCertType:(id)a3;
- (void)setCommonName:(id)a3;
- (void)setCountry:(id)a3;
- (void)setCsrAltName:(id)a3;
- (void)setKeyType:(id)a3;
- (void)setKeyValue:(int64_t)a3;
- (void)setOrganization:(id)a3;
- (void)setOrganizationUnit:(id)a3;
- (void)setState:(id)a3;
@end

@implementation MCCSecretAgentContext

- (MCCSecretAgentContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MCCSecretAgentContext *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_commonName"];
    commonName = v5->_commonName;
    v5->_commonName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_country"];
    country = v5->_country;
    v5->_country = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_state"];
    state = v5->_state;
    v5->_state = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_organization"];
    organization = v5->_organization;
    v5->_organization = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_organizationUnit"];
    organizationUnit = v5->_organizationUnit;
    v5->_organizationUnit = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClasses:v8 forKey:@"_csrAltName"];
    csrAltName = v5->_csrAltName;
    v5->_csrAltName = (NSDictionary *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_keyType"];
    keyType = v5->_keyType;
    v5->_keyType = (NSString *)v21;

    v5->_keyValue = [v4 decodeIntegerForKey:@"_keyValue"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_certType"];
    certType = v5->_certType;
    v5->_certType = (NSString *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  commonName = self->_commonName;
  id v5 = a3;
  [v5 encodeObject:commonName forKey:@"_commonName"];
  [v5 encodeObject:self->_country forKey:@"_country"];
  [v5 encodeObject:self->_state forKey:@"_state"];
  [v5 encodeObject:self->_organization forKey:@"_organization"];
  [v5 encodeObject:self->_organizationUnit forKey:@"_organizationUnit"];
  [v5 encodeObject:self->_csrAltName forKey:@"_csrAltName"];
  [v5 encodeObject:self->_keyType forKey:@"_keyType"];
  [v5 encodeInteger:self->_keyValue forKey:@"_keyValue"];
  [v5 encodeObject:self->_certType forKey:@"_certType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_commonName copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_country copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_state copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(NSString *)self->_organization copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSString *)self->_organizationUnit copy];
  v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [(NSDictionary *)self->_csrAltName copy];
  v16 = (void *)v4[6];
  v4[6] = v15;

  uint64_t v17 = [(NSString *)self->_keyType copy];
  v18 = (void *)v4[7];
  v4[7] = v17;

  v4[8] = self->_keyValue;
  uint64_t v19 = [(NSString *)self->_certType copy];
  v20 = (void *)v4[9];
  v4[9] = v19;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)commonName
{
  return self->_commonName;
}

- (void)setCommonName:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
}

- (NSString)organizationUnit
{
  return self->_organizationUnit;
}

- (void)setOrganizationUnit:(id)a3
{
}

- (NSDictionary)csrAltName
{
  return self->_csrAltName;
}

- (void)setCsrAltName:(id)a3
{
}

- (NSString)keyType
{
  return self->_keyType;
}

- (void)setKeyType:(id)a3
{
}

- (int64_t)keyValue
{
  return self->_keyValue;
}

- (void)setKeyValue:(int64_t)a3
{
  self->_keyValue = a3;
}

- (NSString)certType
{
  return self->_certType;
}

- (void)setCertType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certType, 0);
  objc_storeStrong((id *)&self->_keyType, 0);
  objc_storeStrong((id *)&self->_csrAltName, 0);
  objc_storeStrong((id *)&self->_organizationUnit, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_commonName, 0);
}

@end