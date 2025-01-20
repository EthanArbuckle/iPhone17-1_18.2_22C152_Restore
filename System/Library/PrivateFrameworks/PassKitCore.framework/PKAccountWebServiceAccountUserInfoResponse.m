@interface PKAccountWebServiceAccountUserInfoResponse
+ (BOOL)jsonDataOptional;
- (CNContact)primaryUser;
- (PKAccountWebServiceAccountUserInfoResponse)initWithData:(id)a3;
- (id)_stringValueFromDictionary:(id)a3 key:(id)a4 isOptional:(BOOL)a5;
@end

@implementation PKAccountWebServiceAccountUserInfoResponse

- (PKAccountWebServiceAccountUserInfoResponse)initWithData:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)PKAccountWebServiceAccountUserInfoResponse;
  v3 = [(PKWebServiceResponse *)&v41 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = v5;
      v6 = v5;
      id v7 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
      v8 = [v6 PKDictionaryForKey:@"billingAddress"];
      uint64_t v9 = [v6 PKDictionaryForKey:@"name"];
      v38 = [(PKAccountWebServiceAccountUserInfoResponse *)v4 _stringValueFromDictionary:v9 key:@"firstName" isOptional:0];
      objc_msgSend(v7, "setGivenName:");
      v39 = (void *)v9;
      v37 = [(PKAccountWebServiceAccountUserInfoResponse *)v4 _stringValueFromDictionary:v9 key:@"lastName" isOptional:0];
      objc_msgSend(v7, "setFamilyName:");
      uint64_t v10 = [(PKAccountWebServiceAccountUserInfoResponse *)v4 _stringValueFromDictionary:v6 key:@"email" isOptional:0];
      if (v10)
      {
        id v11 = objc_alloc(MEMORY[0x1E4F1BA20]);
        v12 = (void *)[v11 initWithLabel:*MEMORY[0x1E4F1B6F0] value:v10];
        v47[0] = v12;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
        [v7 setEmailAddresses:v13];
      }
      v36 = (void *)v10;
      id v14 = objc_alloc_init(MEMORY[0x1E4F1BA58]);
      v15 = [(PKAccountWebServiceAccountUserInfoResponse *)v4 _stringValueFromDictionary:v8 key:@"addressLine1" isOptional:0];
      v16 = [(PKAccountWebServiceAccountUserInfoResponse *)v4 _stringValueFromDictionary:v8 key:@"addressLine2" isOptional:1];
      v34 = v16;
      v35 = v7;
      if ([v16 length])
      {
        uint64_t v17 = [v15 stringByAppendingFormat:@"\n%@", v16];

        v15 = (void *)v17;
      }
      [v14 setStreet:v15];
      v33 = [(PKAccountWebServiceAccountUserInfoResponse *)v4 _stringValueFromDictionary:v8 key:@"city" isOptional:0];
      [v14 setCity:v33];
      v18 = [(PKAccountWebServiceAccountUserInfoResponse *)v4 _stringValueFromDictionary:v8 key:@"state" isOptional:0];
      [v14 setState:v18];
      v19 = [(PKAccountWebServiceAccountUserInfoResponse *)v4 _stringValueFromDictionary:v8 key:@"postalCode" isOptional:0];
      [v14 setPostalCode:v19];
      v20 = [(PKAccountWebServiceAccountUserInfoResponse *)v4 _stringValueFromDictionary:v8 key:@"countryCode" isOptional:0];
      [v14 setISOCountryCode:v20];
      v21 = [MEMORY[0x1E4F1CA20] currentLocale];
      v22 = PKLocalizedStringForCountryCode(v21, v20);
      [v14 setCountry:v22];

      id v23 = objc_alloc(MEMORY[0x1E4F1BA20]);
      v24 = (void *)[v23 initWithLabel:*MEMORY[0x1E4F1B6F8] value:v14];
      v46 = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      [v35 setPostalAddresses:v25];

      uint64_t v26 = [v35 copy];
      primaryUser = v4->_primaryUser;
      v4->_primaryUser = (CNContact *)v26;

      v5 = v40;
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138543618;
        v43 = v29;
        __int16 v44 = 2114;
        v45 = v31;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (id)_stringValueFromDictionary:(id)a3 key:(id)a4 isOptional:(BOOL)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [a3 objectForKey:v7];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v8 length])
  {
    id v9 = v8;
  }
  else
  {
    if (!a5)
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Invalid %@ in user info response", (uint8_t *)&v12, 0xCu);
      }
    }
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

- (CNContact)primaryUser
{
  return self->_primaryUser;
}

- (void).cxx_destruct
{
}

@end