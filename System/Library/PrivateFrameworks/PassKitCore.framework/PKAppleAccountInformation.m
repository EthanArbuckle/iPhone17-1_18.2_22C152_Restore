@interface PKAppleAccountInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)aidaAccountAvailable;
- (BOOL)aidaAccountRequiresAuthentication;
- (BOOL)isManagedAppleAccount;
- (BOOL)isSandboxAccount;
- (BOOL)isWalletEnabledOnManagedAppleAccount;
- (NSDate)creationDate;
- (NSString)aaAlternateDSID;
- (NSString)aaDSID;
- (NSString)aidaAlternateDSID;
- (NSString)aidaToken;
- (NSString)appleID;
- (NSString)authorizationHeader;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)primaryEmailAddress;
- (PKAppleAccountInformation)initWithCoder:(id)a3;
- (id)altDsidAppleAccountHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)primaryAppleAccountHash;
- (int64_t)ageCategory;
- (void)encodeWithCoder:(id)a3;
- (void)setAaAlternateDSID:(id)a3;
- (void)setAaDSID:(id)a3;
- (void)setAgeCategory:(int64_t)a3;
- (void)setAidaAlternateDSID:(id)a3;
- (void)setAidaToken:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setAuthorizationHeader:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setIsManagedAppleAccount:(BOOL)a3;
- (void)setIsSandboxAccount:(BOOL)a3;
- (void)setIsWalletEnabledOnManagedAppleAccount:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setPrimaryEmailAddress:(id)a3;
@end

@implementation PKAppleAccountInformation

- (BOOL)isManagedAppleAccount
{
  return self->_isManagedAppleAccount;
}

- (BOOL)isSandboxAccount
{
  return self->_isSandboxAccount;
}

- (void)setPrimaryEmailAddress:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (void)setIsWalletEnabledOnManagedAppleAccount:(BOOL)a3
{
  self->_isWalletEnabledOnManagedAppleAccount = a3;
}

- (void)setIsSandboxAccount:(BOOL)a3
{
  self->_isSandboxAccount = a3;
}

- (void)setIsManagedAppleAccount:(BOOL)a3
{
  self->_isManagedAppleAccount = a3;
}

- (void)setFirstName:(id)a3
{
}

- (void)setCreationDate:(id)a3
{
}

- (void)setAppleID:(id)a3
{
}

- (void)setAidaToken:(id)a3
{
}

- (void)setAidaAlternateDSID:(id)a3
{
}

- (void)setAgeCategory:(int64_t)a3
{
  self->_ageCategory = a3;
}

- (void)setAaDSID:(id)a3
{
}

- (void)setAaAlternateDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_authorizationHeader, 0);
  objc_storeStrong((id *)&self->_primaryEmailAddress, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_aaAlternateDSID, 0);
  objc_storeStrong((id *)&self->_aaDSID, 0);
  objc_storeStrong((id *)&self->_aidaToken, 0);
  objc_storeStrong((id *)&self->_aidaAlternateDSID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleAccountInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKAppleAccountInformation;
  v5 = [(PKAppleAccountInformation *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aidaAlternateDSID"];
    aidaAlternateDSID = v5->_aidaAlternateDSID;
    v5->_aidaAlternateDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aidaToken"];
    aidaToken = v5->_aidaToken;
    v5->_aidaToken = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aaDSID"];
    aaDSID = v5->_aaDSID;
    v5->_aaDSID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aaAlternateDSID"];
    aaAlternateDSID = v5->_aaAlternateDSID;
    v5->_aaAlternateDSID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v14;

    v5->_isSandboxAccount = [v4 decodeBoolForKey:@"isSandboxAccount"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"email"];
    primaryEmailAddress = v5->_primaryEmailAddress;
    v5->_primaryEmailAddress = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v22;

    v5->_isManagedAppleAccount = [v4 decodeBoolForKey:@"isManagedAppleAccount"];
    v5->_isWalletEnabledOnManagedAppleAccount = [v4 decodeBoolForKey:@"isWalletEnabledOnManagedAppleAccount"];
    id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ageCategory"];
    if ([@"under13" isEqualToString:v24])
    {
      uint64_t v25 = 1;
    }
    else if ([@"under18" isEqualToString:v24])
    {
      uint64_t v25 = 2;
    }
    else if ([@"adult" isEqualToString:v24])
    {
      uint64_t v25 = 3;
    }
    else if ([@"managedAppleAccount" isEqualToString:v24])
    {
      uint64_t v25 = 4;
    }
    else
    {
      uint64_t v25 = 0;
    }

    v5->_ageCategory = v25;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  aidaAlternateDSID = self->_aidaAlternateDSID;
  id v7 = a3;
  [v7 encodeObject:aidaAlternateDSID forKey:@"aidaAlternateDSID"];
  [v7 encodeObject:self->_aidaToken forKey:@"aidaToken"];
  [v7 encodeObject:self->_aaDSID forKey:@"aaDSID"];
  [v7 encodeObject:self->_aaAlternateDSID forKey:@"aaAlternateDSID"];
  [v7 encodeObject:self->_appleID forKey:@"appleID"];
  [v7 encodeBool:self->_isSandboxAccount forKey:@"isSandboxAccount"];
  [v7 encodeObject:self->_firstName forKey:@"firstName"];
  [v7 encodeObject:self->_lastName forKey:@"lastName"];
  [v7 encodeObject:self->_primaryEmailAddress forKey:@"email"];
  [v7 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v7 encodeBool:self->_isManagedAppleAccount forKey:@"isManagedAppleAccount"];
  [v7 encodeBool:self->_isWalletEnabledOnManagedAppleAccount forKey:@"isWalletEnabledOnManagedAppleAccount"];
  unint64_t v5 = self->_ageCategory - 1;
  if (v5 > 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_1E56E4F68[v5];
  }
  [v7 encodeObject:v6 forKey:@"ageCategory"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PKAppleAccountInformation allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_aidaAlternateDSID, self->_aidaAlternateDSID);
  objc_storeStrong((id *)&v4->_aidaToken, self->_aidaToken);
  objc_storeStrong((id *)&v4->_aaDSID, self->_aaDSID);
  objc_storeStrong((id *)&v4->_aaAlternateDSID, self->_aaAlternateDSID);
  objc_storeStrong((id *)&v4->_appleID, self->_appleID);
  v4->_isSandboxAccount = self->_isSandboxAccount;
  objc_storeStrong((id *)&v4->_lastName, self->_lastName);
  objc_storeStrong((id *)&v4->_firstName, self->_firstName);
  objc_storeStrong((id *)&v4->_primaryEmailAddress, self->_primaryEmailAddress);
  objc_storeStrong((id *)&v4->_creationDate, self->_creationDate);
  v4->_isManagedAppleAccount = self->_isManagedAppleAccount;
  v4->_isWalletEnabledOnManagedAppleAccount = self->_isWalletEnabledOnManagedAppleAccount;
  v4->_ageCategory = self->_ageCategory;
  return v4;
}

- (NSString)authorizationHeader
{
  authorizationHeader = self->_authorizationHeader;
  if (!authorizationHeader)
  {
    id v4 = [NSString stringWithFormat:@"AppleToken %@:%@", self->_aidaAlternateDSID, self->_aidaToken];
    unint64_t v5 = self->_authorizationHeader;
    self->_authorizationHeader = v4;

    authorizationHeader = self->_authorizationHeader;
  }
  return authorizationHeader;
}

- (id)primaryAppleAccountHash
{
  return _PKAccountHash(self->_appleID);
}

- (id)altDsidAppleAccountHash
{
  return _PKAccountHash(self->_aaAlternateDSID);
}

- (BOOL)aidaAccountAvailable
{
  aidaAlternateDSID = self->_aidaAlternateDSID;
  if (aidaAlternateDSID)
  {
    if (self->_aidaToken)
    {
      aidaAlternateDSID = [(NSString *)aidaAlternateDSID length];
      if (aidaAlternateDSID) {
        LOBYTE(aidaAlternateDSID) = [(NSString *)self->_aidaToken length] != 0;
      }
    }
    else
    {
      LOBYTE(aidaAlternateDSID) = 0;
    }
  }
  return (char)aidaAlternateDSID;
}

- (BOOL)aidaAccountRequiresAuthentication
{
  aidaAlternateDSID = self->_aidaAlternateDSID;
  if (aidaAlternateDSID) {
    BOOL v4 = [(NSString *)aidaAlternateDSID length] != 0;
  }
  else {
    BOOL v4 = 0;
  }
  aidaToken = self->_aidaToken;
  if (aidaToken) {
    BOOL v6 = [(NSString *)aidaToken length] == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return v4 && v6;
}

- (NSString)aidaAlternateDSID
{
  return self->_aidaAlternateDSID;
}

- (NSString)aidaToken
{
  return self->_aidaToken;
}

- (NSString)aaDSID
{
  return self->_aaDSID;
}

- (NSString)aaAlternateDSID
{
  return self->_aaAlternateDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)primaryEmailAddress
{
  return self->_primaryEmailAddress;
}

- (void)setAuthorizationHeader:(id)a3
{
}

- (int64_t)ageCategory
{
  return self->_ageCategory;
}

- (BOOL)isWalletEnabledOnManagedAppleAccount
{
  return self->_isWalletEnabledOnManagedAppleAccount;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

@end