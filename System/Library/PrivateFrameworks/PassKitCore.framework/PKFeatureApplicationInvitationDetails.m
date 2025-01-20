@interface PKFeatureApplicationInvitationDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSPersonNameComponents)accountUserNameComponents;
- (NSPersonNameComponents)originatorNameComponents;
- (NSString)accountUserAltDSID;
- (NSString)accountUserFirstName;
- (NSString)accountUserLastName;
- (NSString)originatorAltDSID;
- (NSString)originatorFirstName;
- (NSString)originatorLastName;
- (PKFeatureApplicationInvitationDetails)initWithAccountUserAltDSID:(id)a3 accessLevel:(unint64_t)a4;
- (PKFeatureApplicationInvitationDetails)initWithCoder:(id)a3;
- (PKFeatureApplicationInvitationDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)jsonRepresentation;
- (unint64_t)accountUserAccessLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountUserAccessLevel:(unint64_t)a3;
- (void)setAccountUserAltDSID:(id)a3;
- (void)setAccountUserFirstName:(id)a3;
- (void)setAccountUserLastName:(id)a3;
- (void)setOriginatorAltDSID:(id)a3;
- (void)setOriginatorFirstName:(id)a3;
- (void)setOriginatorLastName:(id)a3;
@end

@implementation PKFeatureApplicationInvitationDetails

- (PKFeatureApplicationInvitationDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKFeatureApplicationInvitationDetails;
  v5 = [(PKFeatureApplicationInvitationDetails *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"accountUserAltDSID"];
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"originatorAltDSID"];
    originatorAltDSID = v5->_originatorAltDSID;
    v5->_originatorAltDSID = (NSString *)v8;

    v10 = [v4 PKStringForKey:@"accountUserAccessLevel"];
    v5->_accountUserAccessLevel = PKAccountAccessLevelFromString(v10);

    uint64_t v11 = [v4 PKStringForKey:@"originatorFirstName"];
    originatorFirstName = v5->_originatorFirstName;
    v5->_originatorFirstName = (NSString *)v11;

    uint64_t v13 = [v4 PKStringForKey:@"originatorLastName"];
    originatorLastName = v5->_originatorLastName;
    v5->_originatorLastName = (NSString *)v13;

    uint64_t v15 = [v4 PKStringForKey:@"accountUserFirstName"];
    accountUserFirstName = v5->_accountUserFirstName;
    v5->_accountUserFirstName = (NSString *)v15;

    uint64_t v17 = [v4 PKStringForKey:@"accountUserLastName"];
    accountUserLastName = v5->_accountUserLastName;
    v5->_accountUserLastName = (NSString *)v17;
  }
  return v5;
}

- (PKFeatureApplicationInvitationDetails)initWithAccountUserAltDSID:(id)a3 accessLevel:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKFeatureApplicationInvitationDetails;
  v7 = [(PKFeatureApplicationInvitationDetails *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    accountUserAltDSID = v7->_accountUserAltDSID;
    v7->_accountUserAltDSID = (NSString *)v8;

    v7->_accountUserAccessLevel = a4;
  }

  return v7;
}

- (id)jsonRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_accountUserAltDSID forKeyedSubscript:@"accountUserAltDSID"];
  [v3 setObject:self->_originatorAltDSID forKeyedSubscript:@"originatorAltDSID"];
  unint64_t accountUserAccessLevel = self->_accountUserAccessLevel;
  if (accountUserAccessLevel)
  {
    v5 = PKAccountAccessLevelToString(accountUserAccessLevel);
    [v3 setObject:v5 forKeyedSubscript:@"accountUserAccessLevel"];
  }
  [v3 setObject:self->_originatorFirstName forKeyedSubscript:@"originatorFirstName"];
  [v3 setObject:self->_originatorLastName forKeyedSubscript:@"originatorLastName"];
  [v3 setObject:self->_accountUserFirstName forKeyedSubscript:@"accountUserFirstName"];
  [v3 setObject:self->_accountUserLastName forKeyedSubscript:@"accountUserLastName"];
  id v6 = (void *)[v3 copy];

  return v6;
}

- (NSPersonNameComponents)originatorNameComponents
{
  if (self->_accountUserFirstName && self->_accountUserLastName)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    [v3 setGivenName:self->_originatorFirstName];
    [v3 setFamilyName:self->_originatorLastName];
  }
  else
  {
    id v3 = 0;
  }
  return (NSPersonNameComponents *)v3;
}

- (NSPersonNameComponents)accountUserNameComponents
{
  if (self->_accountUserFirstName && self->_accountUserLastName)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    [v3 setGivenName:self->_accountUserFirstName];
    [v3 setFamilyName:self->_accountUserLastName];
  }
  else
  {
    id v3 = 0;
  }
  return (NSPersonNameComponents *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKFeatureApplicationInvitationDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        accountUserAltDSID = v6->_accountUserAltDSID;
        uint64_t v8 = self->_accountUserAltDSID;
        v9 = accountUserAltDSID;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9) {
            goto LABEL_43;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_44;
          }
        }
        originatorAltDSID = v6->_originatorAltDSID;
        uint64_t v8 = self->_originatorAltDSID;
        uint64_t v13 = originatorAltDSID;
        if (v8 == v13)
        {
        }
        else
        {
          v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13) {
            goto LABEL_43;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v13];

          if (!v11) {
            goto LABEL_44;
          }
        }
        if (self->_accountUserAccessLevel != v6->_accountUserAccessLevel)
        {
          LOBYTE(v11) = 0;
LABEL_44:

          goto LABEL_45;
        }
        originatorFirstName = v6->_originatorFirstName;
        uint64_t v8 = self->_originatorFirstName;
        uint64_t v15 = originatorFirstName;
        if (v8 == v15)
        {
        }
        else
        {
          v10 = v15;
          LOBYTE(v11) = 0;
          if (!v8 || !v15) {
            goto LABEL_43;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v15];

          if (!v11) {
            goto LABEL_44;
          }
        }
        originatorLastName = v6->_originatorLastName;
        uint64_t v8 = self->_originatorLastName;
        uint64_t v17 = originatorLastName;
        if (v8 == v17)
        {
        }
        else
        {
          v10 = v17;
          LOBYTE(v11) = 0;
          if (!v8 || !v17) {
            goto LABEL_43;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v17];

          if (!v11) {
            goto LABEL_44;
          }
        }
        accountUserFirstName = v6->_accountUserFirstName;
        uint64_t v8 = self->_accountUserFirstName;
        v19 = accountUserFirstName;
        if (v8 == v19)
        {

LABEL_38:
          accountUserLastName = self->_accountUserLastName;
          v21 = v6->_accountUserLastName;
          uint64_t v8 = accountUserLastName;
          v22 = v21;
          if (v8 == v22)
          {
            LOBYTE(v11) = 1;
            v10 = v8;
          }
          else
          {
            v10 = v22;
            LOBYTE(v11) = 0;
            if (v8 && v22) {
              LOBYTE(v11) = [(NSString *)v8 isEqualToString:v22];
            }
          }
          goto LABEL_43;
        }
        v10 = v19;
        LOBYTE(v11) = 0;
        if (v8 && v19)
        {
          BOOL v11 = [(NSString *)v8 isEqualToString:v19];

          if (!v11) {
            goto LABEL_44;
          }
          goto LABEL_38;
        }
LABEL_43:

        goto LABEL_44;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_45:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_accountUserAltDSID];
  [v3 safelyAddObject:self->_originatorAltDSID];
  [v3 safelyAddObject:self->_originatorFirstName];
  [v3 safelyAddObject:self->_originatorLastName];
  [v3 safelyAddObject:self->_accountUserFirstName];
  [v3 safelyAddObject:self->_accountUserLastName];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_accountUserAccessLevel - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"accountUserAltDSID: '%@'; ", self->_accountUserAltDSID];
  [v3 appendFormat:@"originatorAltDSID: '%@'; ", self->_originatorAltDSID];
  uint64_t v4 = PKAccountAccessLevelToString(self->_accountUserAccessLevel);
  [v3 appendFormat:@"accountUserAccessLevel: '%@'; ", v4];

  [v3 appendFormat:@"originatorFirstName: '%@'; ", self->_originatorFirstName];
  [v3 appendFormat:@"originatorLastName: '%@'; ", self->_originatorLastName];
  [v3 appendFormat:@"accountUserFirstName: '%@'; ", self->_accountUserFirstName];
  [v3 appendFormat:@"accountUserLastName: '%@'; ", self->_accountUserLastName];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplicationInvitationDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKFeatureApplicationInvitationDetails;
  unint64_t v5 = [(PKFeatureApplicationInvitationDetails *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUserAltDSID"];
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorAltDSID"];
    originatorAltDSID = v5->_originatorAltDSID;
    v5->_originatorAltDSID = (NSString *)v8;

    v5->_unint64_t accountUserAccessLevel = [v4 decodeIntegerForKey:@"accountUserAccessLevel"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorFirstName"];
    originatorFirstName = v5->_originatorFirstName;
    v5->_originatorFirstName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorLastName"];
    originatorLastName = v5->_originatorLastName;
    v5->_originatorLastName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUserFirstName"];
    accountUserFirstName = v5->_accountUserFirstName;
    v5->_accountUserFirstName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUserLastName"];
    accountUserLastName = v5->_accountUserLastName;
    v5->_accountUserLastName = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  accountUserAltDSID = self->_accountUserAltDSID;
  id v5 = a3;
  [v5 encodeObject:accountUserAltDSID forKey:@"accountUserAltDSID"];
  [v5 encodeObject:self->_originatorAltDSID forKey:@"originatorAltDSID"];
  [v5 encodeInteger:self->_accountUserAccessLevel forKey:@"accountUserAccessLevel"];
  [v5 encodeObject:self->_originatorFirstName forKey:@"originatorFirstName"];
  [v5 encodeObject:self->_originatorLastName forKey:@"originatorLastName"];
  [v5 encodeObject:self->_accountUserFirstName forKey:@"accountUserFirstName"];
  [v5 encodeObject:self->_accountUserLastName forKey:@"accountUserLastName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKFeatureApplicationInvitationDetails allocWithZone:](PKFeatureApplicationInvitationDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_accountUserAltDSID copyWithZone:a3];
  accountUserAltDSID = v5->_accountUserAltDSID;
  v5->_accountUserAltDSID = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_originatorAltDSID copyWithZone:a3];
  originatorAltDSID = v5->_originatorAltDSID;
  v5->_originatorAltDSID = (NSString *)v8;

  v5->_unint64_t accountUserAccessLevel = self->_accountUserAccessLevel;
  uint64_t v10 = [(NSString *)self->_originatorFirstName copyWithZone:a3];
  originatorFirstName = v5->_originatorFirstName;
  v5->_originatorFirstName = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_originatorLastName copyWithZone:a3];
  originatorLastName = v5->_originatorLastName;
  v5->_originatorLastName = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_accountUserFirstName copyWithZone:a3];
  accountUserFirstName = v5->_accountUserFirstName;
  v5->_accountUserFirstName = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_accountUserLastName copyWithZone:a3];
  accountUserLastName = v5->_accountUserLastName;
  v5->_accountUserLastName = (NSString *)v16;

  return v5;
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
}

- (NSString)originatorAltDSID
{
  return self->_originatorAltDSID;
}

- (void)setOriginatorAltDSID:(id)a3
{
}

- (unint64_t)accountUserAccessLevel
{
  return self->_accountUserAccessLevel;
}

- (void)setAccountUserAccessLevel:(unint64_t)a3
{
  self->_unint64_t accountUserAccessLevel = a3;
}

- (NSString)originatorFirstName
{
  return self->_originatorFirstName;
}

- (void)setOriginatorFirstName:(id)a3
{
}

- (NSString)originatorLastName
{
  return self->_originatorLastName;
}

- (void)setOriginatorLastName:(id)a3
{
}

- (NSString)accountUserFirstName
{
  return self->_accountUserFirstName;
}

- (void)setAccountUserFirstName:(id)a3
{
}

- (NSString)accountUserLastName
{
  return self->_accountUserLastName;
}

- (void)setAccountUserLastName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUserLastName, 0);
  objc_storeStrong((id *)&self->_accountUserFirstName, 0);
  objc_storeStrong((id *)&self->_originatorLastName, 0);
  objc_storeStrong((id *)&self->_originatorFirstName, 0);
  objc_storeStrong((id *)&self->_originatorAltDSID, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
}

@end