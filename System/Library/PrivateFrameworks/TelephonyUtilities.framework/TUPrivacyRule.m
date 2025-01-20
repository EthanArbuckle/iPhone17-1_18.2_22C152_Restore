@interface TUPrivacyRule
+ (id)ruleForBusinessID:(id)a3;
+ (id)ruleForEmail:(id)a3;
+ (id)ruleForPhoneNumber:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)businessID;
- (NSString)email;
- (TUPhoneNumber)phoneNumber;
- (TUPrivacyRule)initWithCoder:(id)a3;
- (id)initForBusinessID:(id)a3;
- (id)initForEmail:(id)a3;
- (id)initForPhoneNumber:(id)a3;
- (int)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUPrivacyRule

- (id)initForPhoneNumber:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUPrivacyRule;
  v6 = [(TUPrivacyRule *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    objc_storeStrong((id *)&v6->_phoneNumber, a3);
    if (!v7->_phoneNumber)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)initForEmail:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUPrivacyRule;
  v6 = [(TUPrivacyRule *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_email, a3);
    if (!v7->_email)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)initForBusinessID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUPrivacyRule;
  v6 = [(TUPrivacyRule *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_businessID, a3);
    if (!v7->_businessID)
    {

      v7 = 0;
    }
  }

  return v7;
}

+ (id)ruleForPhoneNumber:(id)a3
{
  id v3 = a3;
  id v4 = [[TUPrivacyRule alloc] initForPhoneNumber:v3];

  return v4;
}

+ (id)ruleForEmail:(id)a3
{
  id v3 = a3;
  id v4 = [[TUPrivacyRule alloc] initForEmail:v3];

  return v4;
}

+ (id)ruleForBusinessID:(id)a3
{
  id v3 = a3;
  id v4 = [[TUPrivacyRule alloc] initForBusinessID:v3];

  return v4;
}

- (TUPrivacyRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUPrivacyRule;
  id v5 = [(TUPrivacyRule *)&v12 init];
  if (v5)
  {
    int v6 = [v4 decodeInt32ForKey:@"Type"];
    v5->_type = v6;
    switch(v6)
    {
      case 2:
        uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BusinessID"];
        businessID = (TUPhoneNumber *)v5->_businessID;
        v5->_businessID = (NSString *)v9;
        goto LABEL_8;
      case 1:
        uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Email"];
        businessID = (TUPhoneNumber *)v5->_email;
        v5->_email = (NSString *)v10;
        goto LABEL_8;
      case 0:
        uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PhoneNumber"];
        businessID = v5->_phoneNumber;
        v5->_phoneNumber = (TUPhoneNumber *)v7;
LABEL_8:

        break;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt32:self->_type forKey:@"Type"];
  uint64_t type = self->_type;
  if (type <= 2) {
    [v5 encodeObject:*((void *)&self->_phoneNumber + type) forKey:off_1E58E7DC8[(int)type]];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(TUPrivacyRule *)self type];
    if (v6 == [v5 type])
    {
      int type = self->_type;
      switch(type)
      {
        case 2:
          v8 = [(TUPrivacyRule *)self businessID];
          uint64_t v9 = [v5 businessID];
          goto LABEL_11;
        case 1:
          v8 = [(TUPrivacyRule *)self email];
          uint64_t v9 = [v5 email];
          goto LABEL_11;
        case 0:
          v8 = [(TUPrivacyRule *)self phoneNumber];
          uint64_t v9 = [v5 phoneNumber];
LABEL_11:
          v11 = (void *)v9;
          char v10 = [v8 isEqual:v9];

          goto LABEL_12;
      }
    }
    char v10 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v10 = 0;
LABEL_13:

  return v10;
}

- (int)type
{
  return self->_type;
}

- (TUPhoneNumber)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)businessID
{
  return self->_businessID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessID, 0);
  objc_storeStrong((id *)&self->_email, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end