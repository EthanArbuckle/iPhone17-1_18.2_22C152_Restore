@interface PKContact
+ (BOOL)supportsSecureCoding;
+ (int64_t)version;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContact:(id)a3;
- (CNPhoneNumber)phoneNumber;
- (CNPostalAddress)postalAddress;
- (NSPersonNameComponents)name;
- (NSString)contactHandle;
- (NSString)emailAddress;
- (NSString)supplementarySubLocality;
- (PKContact)initWithCNContact:(id)a3;
- (PKContact)initWithCoder:(id)a3;
- (PKContact)initWithDictionary:(id)a3 error:(id *)a4;
- (id)cnMutableContact;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)sanitizePostalAddressCountry;
- (void)sanitizePostalAddressCountryWithLocale:(id)a3;
- (void)setEmailAddress:(NSString *)emailAddress;
- (void)setName:(NSPersonNameComponents *)name;
- (void)setPhoneNumber:(CNPhoneNumber *)phoneNumber;
- (void)setPostalAddress:(CNPostalAddress *)postalAddress;
- (void)setSupplementarySubLocality:(NSString *)supplementarySubLocality;
@end

@implementation PKContact

+ (int64_t)version
{
  return 4;
}

- (PKContact)initWithCNContact:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKContact;
  v5 = [(PKContact *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 nameComponents];
    name = v5->_name;
    v5->_name = (NSPersonNameComponents *)v6;

    if ([v4 isKeyAvailable:*MEMORY[0x1E4F1AF10]])
    {
      v8 = [v4 postalAddresses];
      v9 = [v8 firstObject];
      uint64_t v10 = [v9 value];
      postalAddress = v5->_postalAddress;
      v5->_postalAddress = (CNPostalAddress *)v10;

      uint64_t v12 = [(CNPostalAddress *)v5->_postalAddress subLocality];
      supplementarySubLocality = v5->_supplementarySubLocality;
      v5->_supplementarySubLocality = (NSString *)v12;
    }
    if ([v4 isKeyAvailable:*MEMORY[0x1E4F1ADC8]])
    {
      v14 = [v4 emailAddresses];
      v15 = [v14 firstObject];
      uint64_t v16 = [v15 value];
      emailAddress = v5->_emailAddress;
      v5->_emailAddress = (NSString *)v16;
    }
    if ([v4 isKeyAvailable:*MEMORY[0x1E4F1AEE0]])
    {
      v18 = [v4 phoneNumbers];
      v19 = [v18 firstObject];
      uint64_t v20 = [v19 value];
      phoneNumber = v5->_phoneNumber;
      v5->_phoneNumber = (CNPhoneNumber *)v20;
    }
  }

  return v5;
}

- (PKContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKContact;
  v5 = [(PKContact *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSPersonNameComponents *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emailAddress"];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (CNPhoneNumber *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"postalAddress"];
    postalAddress = v5->_postalAddress;
    v5->_postalAddress = (CNPostalAddress *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supplementarySublocality"];
    supplementarySubLocality = v5->_supplementarySubLocality;
    v5->_supplementarySubLocality = (NSString *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_emailAddress forKey:@"emailAddress"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_postalAddress forKey:@"postalAddress"];
  [v5 encodeObject:self->_supplementarySubLocality forKey:@"supplementarySublocality"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKContact *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKContact *)self isEqualToContact:v5];

  return v6;
}

- (BOOL)isEqualToContact:(id)a3
{
  id v4 = a3;
  name = self->_name;
  BOOL v6 = (NSPersonNameComponents *)v4[1];
  if (name) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (name != v6) {
      goto LABEL_26;
    }
  }
  else
  {
    char v8 = -[NSPersonNameComponents isEqual:](name, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_26;
    }
  }
  postalAddress = self->_postalAddress;
  uint64_t v10 = (CNPostalAddress *)v4[2];
  if (postalAddress && v10)
  {
    if ((-[CNPostalAddress isEqual:](postalAddress, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (postalAddress != v10)
  {
    goto LABEL_26;
  }
  v11 = (void *)v4[4];
  uint64_t v12 = self->_emailAddress;
  uint64_t v13 = v11;
  if (v12 == v13)
  {
  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_26;
    }
    BOOL v15 = [(NSString *)v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_26;
    }
  }
  phoneNumber = self->_phoneNumber;
  uint64_t v17 = (CNPhoneNumber *)v4[3];
  if (phoneNumber && v17)
  {
    if (-[CNPhoneNumber isEqual:](phoneNumber, "isEqual:")) {
      goto LABEL_28;
    }
LABEL_26:
    char v18 = 0;
    goto LABEL_27;
  }
  if (phoneNumber != v17) {
    goto LABEL_26;
  }
LABEL_28:
  supplementarySubLocality = self->_supplementarySubLocality;
  v21 = (NSString *)v4[5];
  if (supplementarySubLocality && v21) {
    char v18 = -[NSString isEqual:](supplementarySubLocality, "isEqual:");
  }
  else {
    char v18 = supplementarySubLocality == v21;
  }
LABEL_27:

  return v18;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_emailAddress];
  [v3 safelyAddObject:self->_phoneNumber];
  [v3 safelyAddObject:self->_postalAddress];
  [v3 safelyAddObject:self->_supplementarySubLocality];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKContact allocWithZone:](PKContact, "allocWithZone:") init];
  uint64_t v6 = [(NSPersonNameComponents *)self->_name copyWithZone:a3];
  name = v5->_name;
  v5->_name = (NSPersonNameComponents *)v6;

  uint64_t v8 = [(NSString *)self->_emailAddress copyWithZone:a3];
  emailAddress = v5->_emailAddress;
  v5->_emailAddress = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_supplementarySubLocality copyWithZone:a3];
  supplementarySubLocality = v5->_supplementarySubLocality;
  v5->_supplementarySubLocality = (NSString *)v10;

  char v12 = objc_opt_respondsToSelector();
  phoneNumber = self->_phoneNumber;
  if (v12) {
    v14 = (CNPhoneNumber *)[(CNPhoneNumber *)phoneNumber copyWithZone:a3];
  }
  else {
    v14 = phoneNumber;
  }
  BOOL v15 = v5->_phoneNumber;
  v5->_phoneNumber = v14;

  char v16 = objc_opt_respondsToSelector();
  postalAddress = self->_postalAddress;
  if (v16) {
    char v18 = (CNPostalAddress *)[(CNPostalAddress *)postalAddress copyWithZone:a3];
  }
  else {
    char v18 = postalAddress;
  }
  v19 = v5->_postalAddress;
  v5->_postalAddress = v18;

  return v5;
}

- (id)cnMutableContact
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  unint64_t v4 = (void *)MEMORY[0x1E4F1B6F8];
  if (self->_postalAddress)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:*MEMORY[0x1E4F1B6F8] value:self->_postalAddress];
    v22[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v3 setPostalAddresses:v6];
  }
  if (self->_emailAddress)
  {
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:*v4 value:self->_emailAddress];
    v21 = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v3 setEmailAddresses:v8];
  }
  if (self->_phoneNumber)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:*v4 value:self->_phoneNumber];
    objc_super v20 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v3 setPhoneNumbers:v10];
  }
  name = self->_name;
  if (name)
  {
    char v12 = [(NSPersonNameComponents *)name givenName];
    [v3 setGivenName:v12];

    uint64_t v13 = [(NSPersonNameComponents *)self->_name familyName];
    [v3 setFamilyName:v13];

    v14 = [(NSPersonNameComponents *)self->_name phoneticRepresentation];

    if (v14)
    {
      BOOL v15 = [(NSPersonNameComponents *)self->_name phoneticRepresentation];
      char v16 = [v15 givenName];
      [v3 setPhoneticGivenName:v16];

      uint64_t v17 = [(NSPersonNameComponents *)self->_name phoneticRepresentation];
      char v18 = [v17 familyName];
      [v3 setPhoneticFamilyName:v18];
    }
  }
  return v3;
}

- (NSString)contactHandle
{
  emailAddress = self->_emailAddress;
  if (emailAddress)
  {
    id v3 = emailAddress;
  }
  else
  {
    id v3 = [(CNPhoneNumber *)self->_phoneNumber stringValue];
  }
  return v3;
}

- (void)sanitizePostalAddressCountry
{
  id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  [(PKContact *)self sanitizePostalAddressCountryWithLocale:v3];
}

- (void)sanitizePostalAddressCountryWithLocale:(id)a3
{
  id v4 = a3;
  postalAddress = self->_postalAddress;
  if (postalAddress)
  {
    uint64_t v6 = [(CNPostalAddress *)postalAddress ISOCountryCode];
    BOOL v7 = [v6 uppercaseString];

    uint64_t v8 = objc_msgSend(v7, "pk_stringIfNotEmpty");

    if (!v8) {
      goto LABEL_6;
    }
    v9 = [MEMORY[0x1E4F1BA88] supportedCountries];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __52__PKContact_sanitizePostalAddressCountryWithLocale___block_invoke;
    v28[3] = &unk_1E56F3BC8;
    id v10 = v7;
    id v29 = v10;
    v11 = objc_msgSend(v9, "pk_firstObjectPassingTest:", v28);

    if (v11)
    {
      char v12 = [(CNPostalAddress *)self->_postalAddress country];
      uint64_t v13 = objc_msgSend(v12, "pk_stringIfNotEmpty");

      if (v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      v14 = (void *)[(CNPostalAddress *)self->_postalAddress mutableCopy];
      BOOL v15 = (void *)MEMORY[0x1E4F1BA88];
      char v16 = [v10 lowercaseString];
      uint64_t v17 = [v15 localizedCountryNameForISOCountryCode:v16];
      [v14 setCountry:v17];

      char v18 = (CNPostalAddress *)[v14 copy];
      v19 = (__CFString *)self->_postalAddress;
      self->_postalAddress = v18;
    }
    else
    {
LABEL_6:
      v14 = (void *)[(CNPostalAddress *)self->_postalAddress mutableCopy];
      objc_super v20 = [v4 regionCode];
      v19 = [v20 uppercaseString];

      if (v19) {
        v21 = v19;
      }
      else {
        v21 = @"US";
      }
      [v14 setISOCountryCode:v21];
      v22 = (void *)MEMORY[0x1E4F1BA88];
      objc_super v23 = [v14 ISOCountryCode];
      v24 = [v23 lowercaseString];
      v25 = [v22 localizedCountryNameForISOCountryCode:v24];
      [v14 setCountry:v25];

      v26 = (CNPostalAddress *)[v14 copy];
      v27 = self->_postalAddress;
      self->_postalAddress = v26;

      v11 = 0;
    }

    goto LABEL_11;
  }
LABEL_12:
}

uint64_t __52__PKContact_sanitizePostalAddressCountryWithLocale___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 isoCountryCode];
  id v4 = [v3 uppercaseString];

  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  return v5;
}

- (PKContact)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 1;
  v57.receiver = self;
  v57.super_class = (Class)PKContact;
  BOOL v7 = [(PKContact *)&v57 init];
  if (!v7) {
    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __38__PKContact_initWithDictionary_error___block_invoke;
    v56[3] = &unk_1E56F3C60;
    v56[4] = &v58;
    [v6 enumerateKeysAndObjectsUsingBlock:v56];
    if (*((unsigned char *)v59 + 24))
    {
      uint64_t v8 = [v6 objectForKeyedSubscript:@"familyName"];
      if (v8)
      {
      }
      else
      {
        v9 = [v6 objectForKeyedSubscript:@"givenName"];

        if (!v9)
        {
LABEL_15:
          uint64_t v19 = [v6 objectForKeyedSubscript:@"emailAddress"];
          emailAddress = v7->_emailAddress;
          v7->_emailAddress = (NSString *)v19;

          v21 = [v6 objectForKeyedSubscript:@"phoneNumber"];

          if (v21)
          {
            id v22 = objc_alloc(MEMORY[0x1E4F1BA70]);
            objc_super v23 = [v6 objectForKeyedSubscript:@"phoneNumber"];
            uint64_t v24 = [v22 initWithStringValue:v23];
            phoneNumber = v7->_phoneNumber;
            v7->_phoneNumber = (CNPhoneNumber *)v24;
          }
          v26 = [v6 objectForKeyedSubscript:@"addressLines"];
          uint64_t v27 = [v26 count];

          if (v27)
          {
            v28 = [v6 objectForKeyedSubscript:@"addressLines"];
            id v29 = (CNPostalAddress *)objc_alloc_init(MEMORY[0x1E4F1BA58]);
            id v30 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            uint64_t v51 = MEMORY[0x1E4F143A8];
            uint64_t v52 = 3221225472;
            v53 = __38__PKContact_initWithDictionary_error___block_invoke_3;
            v54 = &unk_1E56DF948;
            id v31 = v30;
            id v55 = v31;
            [v28 enumerateObjectsUsingBlock:&v51];
            -[CNPostalAddress setStreet:](v29, "setStreet:", v31, v51, v52, v53, v54);
            v32 = [v6 objectForKeyedSubscript:@"locality"];

            if (v32)
            {
              v33 = [v6 objectForKeyedSubscript:@"locality"];
              [(CNPostalAddress *)v29 setCity:v33];
            }
            v34 = [v6 objectForKeyedSubscript:@"postalCode"];

            if (v34)
            {
              v35 = [v6 objectForKeyedSubscript:@"postalCode"];
              [(CNPostalAddress *)v29 setPostalCode:v35];
            }
            v36 = [v6 objectForKeyedSubscript:@"administrativeArea"];

            if (v36)
            {
              v37 = [v6 objectForKeyedSubscript:@"administrativeArea"];
              [(CNPostalAddress *)v29 setState:v37];
            }
            v38 = [v6 objectForKeyedSubscript:@"subAdministrativeArea"];

            if (v38)
            {
              v39 = [v6 objectForKeyedSubscript:@"subAdministrativeArea"];
              [(CNPostalAddress *)v29 setSubAdministrativeArea:v39];
            }
            v40 = [v6 objectForKeyedSubscript:@"country"];

            if (v40)
            {
              v41 = [v6 objectForKeyedSubscript:@"country"];
              [(CNPostalAddress *)v29 setCountry:v41];
            }
            v42 = [v6 objectForKeyedSubscript:@"countryCode"];

            if (v42)
            {
              v43 = [v6 objectForKeyedSubscript:@"countryCode"];
              [(CNPostalAddress *)v29 setISOCountryCode:v43];
            }
            v44 = [v6 objectForKeyedSubscript:@"subLocality"];

            if (v44)
            {
              v45 = [v6 objectForKeyedSubscript:@"subLocality"];
              [(CNPostalAddress *)v29 setSubLocality:v45];
            }
            postalAddress = v7->_postalAddress;
            v7->_postalAddress = v29;
            v47 = v29;
          }
          goto LABEL_33;
        }
      }
      id v10 = (NSPersonNameComponents *)objc_alloc_init(MEMORY[0x1E4F28F30]);
      v11 = [v6 objectForKeyedSubscript:@"familyName"];
      [(NSPersonNameComponents *)v10 setFamilyName:v11];

      char v12 = [v6 objectForKeyedSubscript:@"givenName"];
      [(NSPersonNameComponents *)v10 setGivenName:v12];

      uint64_t v13 = [v6 objectForKeyedSubscript:@"phoneticGivenName"];
      if (v13)
      {
      }
      else
      {
        v14 = [v6 objectForKeyedSubscript:@"phoneticFamilyName"];

        if (!v14)
        {
LABEL_14:
          name = v7->_name;
          v7->_name = v10;

          goto LABEL_15;
        }
      }
      id v15 = objc_alloc_init(MEMORY[0x1E4F28F30]);
      char v16 = [v6 objectForKeyedSubscript:@"phoneticFamilyName"];
      [v15 setFamilyName:v16];

      uint64_t v17 = [v6 objectForKeyedSubscript:@"phoneticGivenName"];
      [v15 setGivenName:v17];

      [(NSPersonNameComponents *)v7->_name setPhoneticRepresentation:v15];
      goto LABEL_14;
    }
  }
  else
  {
    *((unsigned char *)v59 + 24) = 0;
  }
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
  }
LABEL_33:
  if (*((unsigned char *)v59 + 24)) {
    v48 = v7;
  }
  else {
    v48 = 0;
  }
  v49 = v48;
  _Block_object_dispose(&v58, 8);

  return v49;
}

void __38__PKContact_initWithDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (![a2 isEqualToString:@"addressLines"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PKContact_initWithDictionary_error___block_invoke_2;
  v6[3] = &unk_1E56DC3E8;
  v6[4] = *(void *)(a1 + 32);
  [v5 enumerateObjectsUsingBlock:v6];
LABEL_6:
}

void __38__PKContact_initWithDictionary_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void __38__PKContact_initWithDictionary_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  [*(id *)(a1 + 32) appendString:v5];
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
  {
    id v5 = [(CNPhoneNumber *)phoneNumber stringValue];
    [v3 setObject:v5 forKeyedSubscript:@"phoneNumber"];
  }
  emailAddress = self->_emailAddress;
  if (emailAddress) {
    [v3 setObject:emailAddress forKeyedSubscript:@"emailAddress"];
  }
  BOOL v7 = [(NSPersonNameComponents *)self->_name givenName];

  if (v7)
  {
    uint64_t v8 = [(NSPersonNameComponents *)self->_name givenName];
    [v3 setObject:v8 forKeyedSubscript:@"givenName"];
  }
  v9 = [(NSPersonNameComponents *)self->_name familyName];

  if (v9)
  {
    id v10 = [(NSPersonNameComponents *)self->_name familyName];
    [v3 setObject:v10 forKeyedSubscript:@"familyName"];
  }
  v11 = [(NSPersonNameComponents *)self->_name phoneticRepresentation];
  char v12 = [v11 givenName];

  if (v12)
  {
    uint64_t v13 = [(NSPersonNameComponents *)self->_name phoneticRepresentation];
    v14 = [v13 givenName];
    [v3 setObject:v14 forKeyedSubscript:@"phoneticGivenName"];
  }
  id v15 = [(NSPersonNameComponents *)self->_name phoneticRepresentation];
  char v16 = [v15 familyName];

  if (v16)
  {
    uint64_t v17 = [(NSPersonNameComponents *)self->_name phoneticRepresentation];
    char v18 = [v17 familyName];
    [v3 setObject:v18 forKeyedSubscript:@"phoneticFamilyName"];
  }
  uint64_t v19 = self->_postalAddress;
  objc_super v20 = [(CNPostalAddress *)v19 street];

  if (v20)
  {
    v21 = [(CNPostalAddress *)v19 street];
    id v22 = [v21 componentsSeparatedByString:@"\n"];
    [v3 setObject:v22 forKeyedSubscript:@"addressLines"];
  }
  objc_super v23 = [(CNPostalAddress *)v19 city];

  if (v23)
  {
    uint64_t v24 = [(CNPostalAddress *)v19 city];
    [v3 setObject:v24 forKeyedSubscript:@"locality"];
  }
  v25 = [(CNPostalAddress *)v19 postalCode];

  if (v25)
  {
    v26 = [(CNPostalAddress *)v19 postalCode];
    [v3 setObject:v26 forKeyedSubscript:@"postalCode"];
  }
  uint64_t v27 = [(CNPostalAddress *)v19 subLocality];

  if (v27)
  {
    v28 = [(CNPostalAddress *)v19 subLocality];
    [v3 setObject:v28 forKeyedSubscript:@"subLocality"];
  }
  id v29 = [(CNPostalAddress *)v19 state];

  if (v29)
  {
    id v30 = [(CNPostalAddress *)v19 state];
    [v3 setObject:v30 forKeyedSubscript:@"administrativeArea"];
  }
  id v31 = [(CNPostalAddress *)v19 country];

  if (v31)
  {
    v32 = [(CNPostalAddress *)v19 country];
    [v3 setObject:v32 forKeyedSubscript:@"country"];
  }
  v33 = [(CNPostalAddress *)v19 ISOCountryCode];

  if (v33)
  {
    v34 = [(CNPostalAddress *)v19 ISOCountryCode];
    [v3 setObject:v34 forKeyedSubscript:@"countryCode"];
  }
  v35 = (void *)[v3 copy];

  return v35;
}

- (NSPersonNameComponents)name
{
  return self->_name;
}

- (void)setName:(NSPersonNameComponents *)name
{
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (void)setPostalAddress:(CNPostalAddress *)postalAddress
{
}

- (CNPhoneNumber)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(CNPhoneNumber *)phoneNumber
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(NSString *)emailAddress
{
}

- (NSString)supplementarySubLocality
{
  return self->_supplementarySubLocality;
}

- (void)setSupplementarySubLocality:(NSString *)supplementarySubLocality
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementarySubLocality, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end