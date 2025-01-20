@interface SKUIDeveloperInfo
- (NSArray)addressLines;
- (NSString)ECommerceRegistrationIdentifier;
- (NSString)ISOCountryCode;
- (NSString)administrativeArea;
- (NSString)businessRegistrationIdentifier;
- (NSString)country;
- (NSString)emailAddress;
- (NSString)locality;
- (NSString)phoneNumber;
- (NSString)postalCode;
- (NSString)tradeName;
- (NSString)tradeRepresentativeName;
- (SKUIDeveloperInfo)initWithDeveloperDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedAddressString;
- (void)setAddressLines:(id)a3;
- (void)setAdministrativeArea:(id)a3;
- (void)setBusinessRegistrationIdentifier:(id)a3;
- (void)setCountry:(id)a3;
- (void)setECommerceRegistrationIdentifier:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setISOCountryCode:(id)a3;
- (void)setLocality:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setTradeName:(id)a3;
- (void)setTradeRepresentativeName:(id)a3;
@end

@implementation SKUIDeveloperInfo

- (SKUIDeveloperInfo)initWithDeveloperDictionary:(id)a3
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDeveloperInfo initWithDeveloperDictionary:]();
  }
  v49.receiver = self;
  v49.super_class = (Class)SKUIDeveloperInfo;
  v5 = [(SKUIDeveloperInfo *)&v49 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"businessRegistrationId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      businessRegistrationIdentifier = v5->_businessRegistrationIdentifier;
      v5->_businessRegistrationIdentifier = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"eCommerceRegistrationId"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      ecommerceRegistrationIdentifier = v5->_ecommerceRegistrationIdentifier;
      v5->_ecommerceRegistrationIdentifier = (NSString *)v10;
    }
    v12 = [v4 objectForKey:@"person"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_28;
    }
    v13 = [v12 objectForKey:@"emailAddress"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v13 copy];
      emailAddress = v5->_emailAddress;
      v5->_emailAddress = (NSString *)v14;
    }
    v9 = [v12 objectForKey:@"phoneNumber"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v9 copy];
      phoneNumber = v5->_phoneNumber;
      v5->_phoneNumber = (NSString *)v16;
    }
    v18 = [v12 objectForKey:@"tradeRep"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v18 copy];
      tradeRepresentativeName = v5->_tradeRepresentativeName;
      v5->_tradeRepresentativeName = (NSString *)v19;
LABEL_27:

LABEL_28:
      v27 = [v4 objectForKey:@"address"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [v27 objectForKey:@"state"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v29 = [v28 copy];
          administrativeArea = v5->_administrativeArea;
          v5->_administrativeArea = (NSString *)v29;
        }
        v31 = [v27 objectForKey:@"country"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v32 = [v31 copy];
          country = v5->_country;
          v5->_country = (NSString *)v32;
        }
        v34 = [v27 objectForKey:@"countryCode"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v35 = [v34 copy];
          isoCountryCode = v5->_isoCountryCode;
          v5->_isoCountryCode = (NSString *)v35;
        }
        v37 = [v27 objectForKey:@"city"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v38 = [v37 copy];
          locality = v5->_locality;
          v5->_locality = (NSString *)v38;
        }
        v40 = [v27 objectForKey:@"zipCode"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v41 = [v40 copy];
          postalCode = v5->_postalCode;
          v5->_postalCode = (NSString *)v41;
        }
        id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v44 = [v27 objectForKey:@"addressLine1"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v43 addObject:v44];
        }
        v45 = [v4 objectForKey:@"addressLine2"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v43 addObject:v45];
        }
        v9 = [v4 objectForKey:@"addressLine3"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v43 addObject:v9];
        }
        uint64_t v46 = [v43 copy];
        addressLines = v5->_addressLines;
        v5->_addressLines = (NSArray *)v46;
      }
      goto LABEL_47;
    }
    tradeRepresentativeName = [v12 objectForKey:@"firstName"];
    v21 = [v12 objectForKey:@"lastName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v50[0] = tradeRepresentativeName;
      v50[1] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
      uint64_t v23 = [v22 componentsJoinedByString:@" "];
      v24 = v5->_tradeRepresentativeName;
      v5->_tradeRepresentativeName = (NSString *)v23;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = tradeRepresentativeName;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_26:

          goto LABEL_27;
        }
        v25 = v21;
      }
      uint64_t v26 = [v25 copy];
      v22 = v5->_tradeRepresentativeName;
      v5->_tradeRepresentativeName = (NSString *)v26;
    }

    goto LABEL_26;
  }
LABEL_47:

  return v5;
}

- (id)formattedAddressString
{
  uint64_t v3 = SKUIContactsFramework();
  id v4 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Cnmutableposta.isa, v3));
  v5 = v4;
  if (self->_administrativeArea) {
    objc_msgSend(v4, "setState:");
  }
  if (self->_country) {
    objc_msgSend(v5, "setCountry:");
  }
  if (self->_isoCountryCode) {
    objc_msgSend(v5, "setISOCountryCode:");
  }
  if (self->_locality) {
    objc_msgSend(v5, "setCity:");
  }
  if (self->_postalCode) {
    objc_msgSend(v5, "setPostalCode:");
  }
  v6 = [(NSArray *)self->_addressLines componentsJoinedByString:@"\n"];
  if ([v6 length]) {
    [v5 setStreet:v6];
  }
  uint64_t v7 = SKUIContactsFramework();
  v8 = objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Cnpostaladdres.isa, v7), "singleLineStringFromPostalAddress:addCountryName:", v5, 1);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setAddressLines:self->_addressLines];
  [v4 setAdministrativeArea:self->_administrativeArea];
  [v4 setBusinessRegistrationIdentifier:self->_businessRegistrationIdentifier];
  [v4 setCountry:self->_country];
  [v4 setECommerceRegistrationIdentifier:self->_ecommerceRegistrationIdentifier];
  [v4 setEmailAddress:self->_emailAddress];
  [v4 setISOCountryCode:self->_isoCountryCode];
  [v4 setLocality:self->_locality];
  [v4 setPhoneNumber:self->_phoneNumber];
  [v4 setPostalCode:self->_postalCode];
  [v4 setTradeName:self->_tradeName];
  [v4 setTradeRepresentativeName:self->_tradeRepresentativeName];
  return v4;
}

- (NSArray)addressLines
{
  return self->_addressLines;
}

- (void)setAddressLines:(id)a3
{
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSString)businessRegistrationIdentifier
{
  return self->_businessRegistrationIdentifier;
}

- (void)setBusinessRegistrationIdentifier:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSString)ECommerceRegistrationIdentifier
{
  return self->_ecommerceRegistrationIdentifier;
}

- (void)setECommerceRegistrationIdentifier:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)ISOCountryCode
{
  return self->_isoCountryCode;
}

- (void)setISOCountryCode:(id)a3
{
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)tradeName
{
  return self->_tradeName;
}

- (void)setTradeName:(id)a3
{
}

- (NSString)tradeRepresentativeName
{
  return self->_tradeRepresentativeName;
}

- (void)setTradeRepresentativeName:(id)a3
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_tradeRepresentativeName, 0);
  objc_storeStrong((id *)&self->_tradeName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_ecommerceRegistrationIdentifier, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_businessRegistrationIdentifier, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);

  objc_storeStrong((id *)&self->_addressLines, 0);
}

- (void)initWithDeveloperDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDeveloperInfo initWithDeveloperDictionary:]";
}

@end