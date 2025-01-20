@interface PKPayLaterAccountUserInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUserInfo;
- (BOOL)isEqual:(id)a3;
- (PKPayLaterAccountUserInfo)initWithCoder:(id)a3;
- (PKPayLaterAccountUserInfo)initWithDictionary:(id)a3;
- (PKPayLaterAccountUserInfoValue)city;
- (PKPayLaterAccountUserInfoValue)dateOfBirth;
- (PKPayLaterAccountUserInfoValue)emailAddress;
- (PKPayLaterAccountUserInfoValue)firstName;
- (PKPayLaterAccountUserInfoValue)lastName;
- (PKPayLaterAccountUserInfoValue)phoneNumber;
- (PKPayLaterAccountUserInfoValue)postalCode;
- (PKPayLaterAccountUserInfoValue)ssn;
- (PKPayLaterAccountUserInfoValue)state;
- (PKPayLaterAccountUserInfoValue)street1;
- (PKPayLaterAccountUserInfoValue)street2;
- (PKPayLaterAccountUserInfoValue)yearlyIncome;
- (id)contact;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCity:(id)a3;
- (void)setDateOfBirth:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setSsn:(id)a3;
- (void)setState:(id)a3;
- (void)setStreet1:(id)a3;
- (void)setStreet2:(id)a3;
- (void)setYearlyIncome:(id)a3;
@end

@implementation PKPayLaterAccountUserInfo

- (PKPayLaterAccountUserInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKPayLaterAccountUserInfo;
  v5 = [(PKPayLaterAccountUserInfo *)&v43 init];
  if (v5)
  {
    v6 = [v4 PKDictionaryForKey:@"emailAddress"];
    if ([v6 count])
    {
      v7 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v6];
      emailAddress = v5->_emailAddress;
      v5->_emailAddress = v7;
    }
    v9 = [v4 PKDictionaryForKey:@"firstName"];

    if ([v9 count])
    {
      v10 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v9];
      firstName = v5->_firstName;
      v5->_firstName = v10;
    }
    v12 = [v4 PKDictionaryForKey:@"lastName"];

    if ([v12 count])
    {
      v13 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v12];
      lastName = v5->_lastName;
      v5->_lastName = v13;
    }
    v15 = [v4 PKDictionaryForKey:@"dateOfBirth"];

    if ([v15 count])
    {
      v16 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v15];
      dateOfBirth = v5->_dateOfBirth;
      v5->_dateOfBirth = v16;
    }
    v18 = [v4 PKDictionaryForKey:@"phoneNumber"];

    if ([v18 count])
    {
      v19 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v18];
      phoneNumber = v5->_phoneNumber;
      v5->_phoneNumber = v19;
    }
    v21 = [v4 PKDictionaryForKey:@"street1"];

    if ([v21 count])
    {
      v22 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v21];
      street1 = v5->_street1;
      v5->_street1 = v22;
    }
    v24 = [v4 PKDictionaryForKey:@"street2"];

    if ([v24 count])
    {
      v25 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v24];
      street2 = v5->_street2;
      v5->_street2 = v25;
    }
    v27 = [v4 PKDictionaryForKey:@"city"];

    if ([v27 count])
    {
      v28 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v27];
      city = v5->_city;
      v5->_city = v28;
    }
    v30 = [v4 PKDictionaryForKey:@"state"];

    if ([v30 count])
    {
      v31 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v30];
      state = v5->_state;
      v5->_state = v31;
    }
    v33 = [v4 PKDictionaryForKey:@"postalCode"];

    if ([v33 count])
    {
      v34 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v33];
      postalCode = v5->_postalCode;
      v5->_postalCode = v34;
    }
    v36 = [v4 PKDictionaryForKey:@"ssn"];

    if ([v36 count])
    {
      v37 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v36];
      ssn = v5->_ssn;
      v5->_ssn = v37;
    }
    v39 = [v4 PKDictionaryForKey:@"yearlyIncome"];

    if ([v39 count])
    {
      v40 = [[PKPayLaterAccountUserInfoValue alloc] initWithDictionary:v39];
      yearlyIncome = v5->_yearlyIncome;
      v5->_yearlyIncome = v40;
    }
  }

  return v5;
}

- (id)contact
{
  v45[1] = *MEMORY[0x1E4F143B8];
  contact = self->_contact;
  if (contact)
  {
    v3 = contact;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    v6 = [(PKPayLaterAccountUserInfoValue *)self->_firstName text];
    [v5 setGivenName:v6];

    v7 = [(PKPayLaterAccountUserInfoValue *)self->_lastName text];
    [v5 setFamilyName:v7];

    uint64_t v8 = [(PKPayLaterAccountUserInfoValue *)self->_emailAddress text];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1BA20]);
      v10 = (void *)[v9 initWithLabel:*MEMORY[0x1E4F1B6F0] value:v8];
      v45[0] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
      [v5 setEmailAddresses:v11];
    }
    v42 = (void *)v8;
    v12 = [(PKPayLaterAccountUserInfoValue *)self->_street1 text];
    v13 = [(PKPayLaterAccountUserInfoValue *)self->_street2 text];
    v14 = [(PKPayLaterAccountUserInfoValue *)self->_city text];
    v15 = [(PKPayLaterAccountUserInfoValue *)self->_state text];
    uint64_t v16 = [(PKPayLaterAccountUserInfoValue *)self->_postalCode text];
    v17 = (void *)v16;
    if (v12 || v13 || v14 || v15 || v16)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1BA58]);
      if ([v13 length])
      {
        [v12 stringByAppendingFormat:@"\n%@", v13];
        uint64_t v20 = v19 = v17;

        v12 = (void *)v20;
        v17 = v19;
      }
      if (v12) {
        [v18 setStreet:v12];
      }
      [v18 setCity:v14];
      [v18 setState:v15];
      [v18 setPostalCode:v17];
      if (v18)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F1BA20]);
        v22 = v13;
        v23 = v15;
        v24 = v17;
        v25 = (void *)[v21 initWithLabel:*MEMORY[0x1E4F1B6F8] value:v18];
        v44 = v25;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
        [v5 setPostalAddresses:v26];

        v17 = v24;
        v15 = v23;
        v13 = v22;
      }
    }
    v27 = [(PKPayLaterAccountUserInfoValue *)self->_dateOfBirth date];
    if (v27)
    {
      v28 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      v29 = [v28 components:254 fromDate:v27];

      if (v29) {
        [v5 setBirthday:v29];
      }
    }
    v30 = [(PKPayLaterAccountUserInfoValue *)self->_phoneNumber text];
    if (v30)
    {
      v41 = v13;
      v31 = v15;
      v32 = v17;
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v30];
      if (v33)
      {
        id v34 = objc_alloc(MEMORY[0x1E4F1BA20]);
        v35 = (void *)[v34 initWithLabel:*MEMORY[0x1E4F1B6F8] value:v33];
        objc_super v43 = v35;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        v37 = v36 = v14;
        [v5 setPhoneNumbers:v37];

        v14 = v36;
      }

      v17 = v32;
      v15 = v31;
      v13 = v41;
    }
    v38 = (CNContact *)[v5 copy];
    v39 = self->_contact;
    self->_contact = v38;

    v3 = self->_contact;
  }
  return v3;
}

- (BOOL)hasUserInfo
{
  v2 = [(PKPayLaterAccountUserInfo *)self contact];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountUserInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKPayLaterAccountUserInfo;
  id v5 = [(PKPayLaterAccountUserInfo *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emailAddress"];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (PKPayLaterAccountUserInfoValue *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (PKPayLaterAccountUserInfoValue *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (PKPayLaterAccountUserInfoValue *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateOfBirth"];
    dateOfBirth = v5->_dateOfBirth;
    v5->_dateOfBirth = (PKPayLaterAccountUserInfoValue *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (PKPayLaterAccountUserInfoValue *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"street1"];
    street1 = v5->_street1;
    v5->_street1 = (PKPayLaterAccountUserInfoValue *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"street2"];
    street2 = v5->_street2;
    v5->_street2 = (PKPayLaterAccountUserInfoValue *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"city"];
    city = v5->_city;
    v5->_city = (PKPayLaterAccountUserInfoValue *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (PKPayLaterAccountUserInfoValue *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postalCode"];
    postalCode = v5->_postalCode;
    v5->_postalCode = (PKPayLaterAccountUserInfoValue *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ssn"];
    ssn = v5->_ssn;
    v5->_ssn = (PKPayLaterAccountUserInfoValue *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"yearlyIncome"];
    yearlyIncome = v5->_yearlyIncome;
    v5->_yearlyIncome = (PKPayLaterAccountUserInfoValue *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  emailAddress = self->_emailAddress;
  id v5 = a3;
  [v5 encodeObject:emailAddress forKey:@"emailAddress"];
  [v5 encodeObject:self->_firstName forKey:@"firstName"];
  [v5 encodeObject:self->_lastName forKey:@"lastName"];
  [v5 encodeObject:self->_dateOfBirth forKey:@"dateOfBirth"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_street1 forKey:@"street1"];
  [v5 encodeObject:self->_street2 forKey:@"street2"];
  [v5 encodeObject:self->_city forKey:@"city"];
  [v5 encodeObject:self->_state forKey:@"state"];
  [v5 encodeObject:self->_postalCode forKey:@"postalCode"];
  [v5 encodeObject:self->_ssn forKey:@"ssn"];
  [v5 encodeObject:self->_yearlyIncome forKey:@"yearlyIncome"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_59;
  }
  emailAddress = self->_emailAddress;
  uint64_t v6 = (PKPayLaterAccountUserInfoValue *)v4[2];
  if (emailAddress && v6)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](emailAddress, "isEqual:")) {
      goto LABEL_59;
    }
  }
  else if (emailAddress != v6)
  {
    goto LABEL_59;
  }
  firstName = self->_firstName;
  uint64_t v8 = (PKPayLaterAccountUserInfoValue *)v4[3];
  if (firstName && v8)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](firstName, "isEqual:")) {
      goto LABEL_59;
    }
  }
  else if (firstName != v8)
  {
    goto LABEL_59;
  }
  lastName = self->_lastName;
  uint64_t v10 = (PKPayLaterAccountUserInfoValue *)v4[4];
  if (lastName && v10)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](lastName, "isEqual:")) {
      goto LABEL_59;
    }
  }
  else if (lastName != v10)
  {
    goto LABEL_59;
  }
  dateOfBirth = self->_dateOfBirth;
  uint64_t v12 = (PKPayLaterAccountUserInfoValue *)v4[5];
  if (dateOfBirth && v12)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](dateOfBirth, "isEqual:")) {
      goto LABEL_59;
    }
  }
  else if (dateOfBirth != v12)
  {
    goto LABEL_59;
  }
  phoneNumber = self->_phoneNumber;
  uint64_t v14 = (PKPayLaterAccountUserInfoValue *)v4[6];
  if (phoneNumber && v14)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](phoneNumber, "isEqual:")) {
      goto LABEL_59;
    }
  }
  else if (phoneNumber != v14)
  {
    goto LABEL_59;
  }
  street1 = self->_street1;
  uint64_t v16 = (PKPayLaterAccountUserInfoValue *)v4[7];
  if (street1 && v16)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](street1, "isEqual:")) {
      goto LABEL_59;
    }
  }
  else if (street1 != v16)
  {
    goto LABEL_59;
  }
  street2 = self->_street2;
  uint64_t v18 = (PKPayLaterAccountUserInfoValue *)v4[8];
  if (street2 && v18)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](street2, "isEqual:")) {
      goto LABEL_59;
    }
  }
  else if (street2 != v18)
  {
    goto LABEL_59;
  }
  city = self->_city;
  uint64_t v20 = (PKPayLaterAccountUserInfoValue *)v4[9];
  if (city && v20)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](city, "isEqual:")) {
      goto LABEL_59;
    }
  }
  else if (city != v20)
  {
    goto LABEL_59;
  }
  state = self->_state;
  uint64_t v22 = (PKPayLaterAccountUserInfoValue *)v4[10];
  if (state && v22)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](state, "isEqual:")) {
      goto LABEL_59;
    }
  }
  else if (state != v22)
  {
    goto LABEL_59;
  }
  postalCode = self->_postalCode;
  uint64_t v24 = (PKPayLaterAccountUserInfoValue *)v4[11];
  if (postalCode && v24)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](postalCode, "isEqual:")) {
      goto LABEL_59;
    }
  }
  else if (postalCode != v24)
  {
    goto LABEL_59;
  }
  ssn = self->_ssn;
  uint64_t v26 = (PKPayLaterAccountUserInfoValue *)v4[12];
  if (!ssn || !v26)
  {
    if (ssn == v26) {
      goto LABEL_55;
    }
LABEL_59:
    BOOL v29 = 0;
    goto LABEL_60;
  }
  if (!-[PKPayLaterAccountUserInfoValue isEqual:](ssn, "isEqual:")) {
    goto LABEL_59;
  }
LABEL_55:
  yearlyIncome = self->_yearlyIncome;
  uint64_t v28 = (PKPayLaterAccountUserInfoValue *)v4[13];
  if (yearlyIncome && v28) {
    BOOL v29 = -[PKPayLaterAccountUserInfoValue isEqual:](yearlyIncome, "isEqual:");
  }
  else {
    BOOL v29 = yearlyIncome == v28;
  }
LABEL_60:

  return v29;
}

- (unint64_t)hash
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_emailAddress];
  [v3 safelyAddObject:self->_firstName];
  [v3 safelyAddObject:self->_lastName];
  [v3 safelyAddObject:self->_dateOfBirth];
  [v3 safelyAddObject:self->_phoneNumber];
  [v3 safelyAddObject:self->_street1];
  [v3 safelyAddObject:self->_street2];
  [v3 safelyAddObject:self->_city];
  [v3 safelyAddObject:self->_state];
  [v3 safelyAddObject:self->_postalCode];
  [v3 safelyAddObject:self->_ssn];
  [v3 safelyAddObject:self->_yearlyIncome];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"emailAddress: '%@'; ", self->_emailAddress];
  [v3 appendFormat:@"firstName: '%@'; ", self->_firstName];
  [v3 appendFormat:@"lastName: '%@'; ", self->_lastName];
  [v3 appendFormat:@"dateOfBirth: '%@'; ", self->_dateOfBirth];
  [v3 appendFormat:@"phoneNumber: '%@'; ", self->_phoneNumber];
  [v3 appendFormat:@"street1: '%@'; ", self->_street1];
  [v3 appendFormat:@"street2: '%@'; ", self->_street2];
  [v3 appendFormat:@"city: '%@'; ", self->_city];
  [v3 appendFormat:@"state: '%@'; ", self->_state];
  [v3 appendFormat:@"postalCode: '%@'; ", self->_postalCode];
  [v3 appendFormat:@"ssn: '%@'; ", self->_ssn];
  [v3 appendFormat:@"yearlyIncome: '%@'; ", self->_yearlyIncome];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterAccountUserInfo allocWithZone:](PKPayLaterAccountUserInfo, "allocWithZone:") init];
  uint64_t v6 = [(PKPayLaterAccountUserInfoValue *)self->_emailAddress copyWithZone:a3];
  emailAddress = v5->_emailAddress;
  v5->_emailAddress = v6;

  uint64_t v8 = [(PKPayLaterAccountUserInfoValue *)self->_firstName copyWithZone:a3];
  firstName = v5->_firstName;
  v5->_firstName = v8;

  uint64_t v10 = [(PKPayLaterAccountUserInfoValue *)self->_lastName copyWithZone:a3];
  lastName = v5->_lastName;
  v5->_lastName = v10;

  uint64_t v12 = [(PKPayLaterAccountUserInfoValue *)self->_dateOfBirth copyWithZone:a3];
  dateOfBirth = v5->_dateOfBirth;
  v5->_dateOfBirth = v12;

  uint64_t v14 = [(PKPayLaterAccountUserInfoValue *)self->_phoneNumber copyWithZone:a3];
  phoneNumber = v5->_phoneNumber;
  v5->_phoneNumber = v14;

  uint64_t v16 = [(PKPayLaterAccountUserInfoValue *)self->_street1 copyWithZone:a3];
  street1 = v5->_street1;
  v5->_street1 = v16;

  uint64_t v18 = [(PKPayLaterAccountUserInfoValue *)self->_street2 copyWithZone:a3];
  street2 = v5->_street2;
  v5->_street2 = v18;

  uint64_t v20 = [(PKPayLaterAccountUserInfoValue *)self->_city copyWithZone:a3];
  city = v5->_city;
  v5->_city = v20;

  uint64_t v22 = [(PKPayLaterAccountUserInfoValue *)self->_state copyWithZone:a3];
  state = v5->_state;
  v5->_state = v22;

  uint64_t v24 = [(PKPayLaterAccountUserInfoValue *)self->_postalCode copyWithZone:a3];
  postalCode = v5->_postalCode;
  v5->_postalCode = v24;

  uint64_t v26 = [(PKPayLaterAccountUserInfoValue *)self->_ssn copyWithZone:a3];
  ssn = v5->_ssn;
  v5->_ssn = v26;

  uint64_t v28 = [(PKPayLaterAccountUserInfoValue *)self->_yearlyIncome copyWithZone:a3];
  yearlyIncome = v5->_yearlyIncome;
  v5->_yearlyIncome = v28;

  return v5;
}

- (PKPayLaterAccountUserInfoValue)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)dateOfBirth
{
  return self->_dateOfBirth;
}

- (void)setDateOfBirth:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)street1
{
  return self->_street1;
}

- (void)setStreet1:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)street2
{
  return self->_street2;
}

- (void)setStreet2:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)ssn
{
  return self->_ssn;
}

- (void)setSsn:(id)a3
{
}

- (PKPayLaterAccountUserInfoValue)yearlyIncome
{
  return self->_yearlyIncome;
}

- (void)setYearlyIncome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearlyIncome, 0);
  objc_storeStrong((id *)&self->_ssn, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street2, 0);
  objc_storeStrong((id *)&self->_street1, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end