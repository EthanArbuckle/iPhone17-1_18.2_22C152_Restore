@interface PKSavingsAccountUserInfo
+ (BOOL)supportsSecureCoding;
- (CNContact)primaryUser;
- (PKAccountBeneficiaryInfo)beneficiaryInfo;
- (PKSavingsAccountUserInfo)initWithCoder:(id)a3;
- (PKSavingsAccountUserInfo)initWithDictionary:(id)a3;
- (id)_pkRequiredStringFromDictionary:(id)a3 forKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBeneficiaryInfo:(id)a3;
- (void)setPrimaryUser:(id)a3;
@end

@implementation PKSavingsAccountUserInfo

- (PKSavingsAccountUserInfo)initWithDictionary:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PKSavingsAccountUserInfo;
  v5 = [(PKSavingsAccountUserInfo *)&v44 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    uint64_t v7 = [v4 PKDictionaryForKey:@"name"];
    uint64_t v8 = [(PKSavingsAccountUserInfo *)v5 _pkRequiredStringFromDictionary:v7 forKey:@"firstName"];
    v43 = (void *)v7;
    uint64_t v9 = [(PKSavingsAccountUserInfo *)v5 _pkRequiredStringFromDictionary:v7 forKey:@"lastName"];
    v42 = (void *)v8;
    [v6 setGivenName:v8];
    v41 = (void *)v9;
    [v6 setFamilyName:v9];
    uint64_t v10 = [(PKSavingsAccountUserInfo *)v5 _pkRequiredStringFromDictionary:v4 forKey:@"email"];
    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1BA20]);
      v12 = (void *)[v11 initWithLabel:*MEMORY[0x1E4F1B6F0] value:v10];
      v46[0] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
      [v6 setEmailAddresses:v13];
    }
    v39 = v4;
    v14 = [v4 PKDictionaryForKey:@"billingAddress"];
    v15 = [(PKSavingsAccountUserInfo *)v5 _pkRequiredStringFromDictionary:v14 forKey:@"addressLine1"];
    v16 = [v14 PKStringForKey:@"addressLine2"];
    uint64_t v17 = [(PKSavingsAccountUserInfo *)v5 _pkRequiredStringFromDictionary:v14 forKey:@"city"];
    v18 = [(PKSavingsAccountUserInfo *)v5 _pkRequiredStringFromDictionary:v14 forKey:@"state"];
    uint64_t v19 = [(PKSavingsAccountUserInfo *)v5 _pkRequiredStringFromDictionary:v14 forKey:@"postalCode"];
    v20 = [(PKSavingsAccountUserInfo *)v5 _pkRequiredStringFromDictionary:v14 forKey:@"countryCode"];
    v40 = (void *)v10;
    v38 = v16;
    if ([v16 length])
    {
      uint64_t v21 = [v15 stringByAppendingFormat:@"\n%@", v16];

      v15 = (void *)v21;
    }
    v37 = v15;
    id v22 = objc_alloc_init(MEMORY[0x1E4F1BA58]);
    [v22 setStreet:v15];
    [v22 setCity:v17];
    [v22 setState:v18];
    v23 = (void *)v19;
    [v22 setPostalCode:v19];
    [v22 setISOCountryCode:v20];
    v24 = [MEMORY[0x1E4F1CA20] currentLocale];
    PKLocalizedStringForCountryCode(v24, v20);
    v25 = v36 = (void *)v17;
    [v22 setCountry:v25];

    id v26 = objc_alloc(MEMORY[0x1E4F1BA20]);
    v27 = (void *)[v26 initWithLabel:*MEMORY[0x1E4F1B6F8] value:v22];
    v45 = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    [v6 setPostalAddresses:v28];

    uint64_t v29 = [v6 copy];
    primaryUser = v5->_primaryUser;
    v5->_primaryUser = (CNContact *)v29;

    v31 = [PKAccountBeneficiaryInfo alloc];
    id v4 = v39;
    v32 = [v39 PKDictionaryForKey:@"beneficiaryInfo"];
    uint64_t v33 = [(PKAccountBeneficiaryInfo *)v31 initWithDictionary:v32];
    beneficiaryInfo = v5->_beneficiaryInfo;
    v5->_beneficiaryInfo = (PKAccountBeneficiaryInfo *)v33;
  }
  return v5;
}

- (id)_pkRequiredStringFromDictionary:(id)a3 forKey:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 PKStringForKey:v5];
  if (![v6 length])
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Account user info '%@' field is missing", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  primaryUser = self->_primaryUser;
  id v5 = a3;
  [v5 encodeObject:primaryUser forKey:@"primaryUser"];
  [v5 encodeObject:self->_beneficiaryInfo forKey:@"beneficiaryInfo"];
}

- (PKSavingsAccountUserInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSavingsAccountUserInfo;
  id v5 = [(PKSavingsAccountUserInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryUser"];
    primaryUser = v5->_primaryUser;
    v5->_primaryUser = (CNContact *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beneficiaryInfo"];
    beneficiaryInfo = v5->_beneficiaryInfo;
    v5->_beneficiaryInfo = (PKAccountBeneficiaryInfo *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(CNContact *)self->_primaryUser copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PKAccountBeneficiaryInfo *)self->_beneficiaryInfo copyWithZone:a3];
  int v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"primaryUser", self->_primaryUser];
  [v3 appendFormat:@"%@: '%@'; ", @"beneficiaryInfo", self->_beneficiaryInfo];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (CNContact)primaryUser
{
  return self->_primaryUser;
}

- (void)setPrimaryUser:(id)a3
{
}

- (PKAccountBeneficiaryInfo)beneficiaryInfo
{
  return self->_beneficiaryInfo;
}

- (void)setBeneficiaryInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beneficiaryInfo, 0);
  objc_storeStrong((id *)&self->_primaryUser, 0);
}

@end