@interface SFAppleIDContactInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContactInfo:(id)a3;
- (NSArray)validatedEmailAddresses;
- (NSArray)validatedPhoneNumbers;
- (NSString)firstName;
- (NSString)lastName;
- (SFAppleIDContactInfo)initWithCoder:(id)a3;
- (SFAppleIDContactInfo)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setValidatedEmailAddresses:(id)a3;
- (void)setValidatedPhoneNumbers:(id)a3;
@end

@implementation SFAppleIDContactInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppleIDContactInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFAppleIDContactInfo;
  v5 = [(SFAppleIDContactInfo *)&v20 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"FirstName"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FirstName"];
      firstName = v5->_firstName;
      v5->_firstName = (NSString *)v6;
    }
    if ([v4 containsValueForKey:@"LastName"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastName"];
      lastName = v5->_lastName;
      v5->_lastName = (NSString *)v8;
    }
    if ([v4 containsValueForKey:@"ValidatedEmailAddresses"])
    {
      v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_opt_class();
      v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      v13 = [v4 decodeObjectOfClasses:v12 forKey:@"ValidatedEmailAddresses"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v5->_validatedEmailAddresses, v13);
      }
    }
    if ([v4 containsValueForKey:@"ValidatedPhoneNumbers"])
    {
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      v17 = [v4 decodeObjectOfClasses:v16 forKey:@"ValidatedPhoneNumbers"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v5->_validatedPhoneNumbers, v17);
      }
    }
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  firstName = self->_firstName;
  id v9 = v4;
  if (firstName)
  {
    [v4 encodeObject:firstName forKey:@"FirstName"];
    id v4 = v9;
  }
  lastName = self->_lastName;
  if (lastName)
  {
    [v9 encodeObject:lastName forKey:@"LastName"];
    id v4 = v9;
  }
  validatedEmailAddresses = self->_validatedEmailAddresses;
  if (validatedEmailAddresses)
  {
    [v9 encodeObject:validatedEmailAddresses forKey:@"ValidatedEmailAddresses"];
    id v4 = v9;
  }
  validatedPhoneNumbers = self->_validatedPhoneNumbers;
  if (validatedPhoneNumbers)
  {
    [v9 encodeObject:validatedPhoneNumbers forKey:@"ValidatedPhoneNumbers"];
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_firstName);
    objc_storeStrong(v5 + 2, self->_lastName);
    objc_storeStrong(v5 + 3, self->_validatedEmailAddresses);
    objc_storeStrong(v5 + 4, self->_validatedPhoneNumbers);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFAppleIDContactInfo *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SFAppleIDContactInfo *)self isEqualToContactInfo:v5];

  return v6;
}

- (BOOL)isEqualToContactInfo:(id)a3
{
  uint64_t v4 = (SFAppleIDContactInfo *)a3;
  if (self == v4)
  {
    char v23 = 1;
    goto LABEL_18;
  }
  v5 = [(SFAppleIDContactInfo *)self firstName];
  uint64_t v6 = [(SFAppleIDContactInfo *)v4 firstName];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    uint64_t v8 = [(SFAppleIDContactInfo *)self firstName];
    id v9 = [(SFAppleIDContactInfo *)v4 firstName];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_12;
    }
  }
  uint64_t v11 = [(SFAppleIDContactInfo *)self lastName];
  uint64_t v12 = [(SFAppleIDContactInfo *)v4 lastName];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    v14 = [(SFAppleIDContactInfo *)self lastName];
    uint64_t v15 = [(SFAppleIDContactInfo *)v4 lastName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  v17 = [(SFAppleIDContactInfo *)self validatedEmailAddresses];
  uint64_t v18 = [(SFAppleIDContactInfo *)v4 validatedEmailAddresses];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    v19 = (void *)v18;
    objc_super v20 = [(SFAppleIDContactInfo *)self validatedEmailAddresses];
    v21 = [(SFAppleIDContactInfo *)v4 validatedEmailAddresses];
    int v22 = [v20 isEqual:v21];

    if (!v22)
    {
LABEL_12:
      char v23 = 0;
      goto LABEL_18;
    }
  }
  v24 = [(SFAppleIDContactInfo *)self validatedPhoneNumbers];
  uint64_t v25 = [(SFAppleIDContactInfo *)v4 validatedPhoneNumbers];
  if (v24 == (void *)v25)
  {
    char v23 = 1;
    v26 = v24;
  }
  else
  {
    v26 = (void *)v25;
    v27 = [(SFAppleIDContactInfo *)self validatedPhoneNumbers];
    v28 = [(SFAppleIDContactInfo *)v4 validatedPhoneNumbers];
    char v23 = [v27 isEqual:v28];
  }
LABEL_18:

  return v23;
}

- (SFAppleIDContactInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFAppleIDContactInfo;
  v5 = [(SFAppleIDContactInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"FirstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"LastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"ValidatedEmails"];
    validatedEmailAddresses = v5->_validatedEmailAddresses;
    v5->_validatedEmailAddresses = (NSArray *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"ValidatedPhones"];
    validatedPhoneNumbers = v5->_validatedPhoneNumbers;
    v5->_validatedPhoneNumbers = (NSArray *)v12;
  }
  return v5;
}

- (id)description
{
  NSAppendPrintF();
  id v7 = 0;
  NSAppendPrintF();
  id v2 = v7;

  NSAppendPrintF();
  id v3 = v2;

  NSAppendPrintF();
  id v4 = v3;

  NSAppendPrintF();
  id v5 = v4;

  return v5;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSArray)validatedEmailAddresses
{
  return self->_validatedEmailAddresses;
}

- (void)setValidatedEmailAddresses:(id)a3
{
}

- (NSArray)validatedPhoneNumbers
{
  return self->_validatedPhoneNumbers;
}

- (void)setValidatedPhoneNumbers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_validatedEmailAddresses, 0);
  objc_storeStrong((id *)&self->_lastName, 0);

  objc_storeStrong((id *)&self->_firstName, 0);
}

@end