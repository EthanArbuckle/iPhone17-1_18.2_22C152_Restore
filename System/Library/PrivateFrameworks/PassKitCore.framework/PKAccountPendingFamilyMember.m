@interface PKAccountPendingFamilyMember
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToAccountPendingFamilyMember:(id)a3;
- (BOOL)displayedNotification;
- (BOOL)isEqual:(id)a3;
- (NSDate)inviteDate;
- (NSString)accountIdentifier;
- (NSString)altDSID;
- (NSString)inviteEmail;
- (PKAccountPendingFamilyMember)initWithCoder:(id)a3;
- (PKAccountPendingFamilyMember)initWithPendingFamilyMember:(id)a3 accountIdentifier:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setDisplayedNotification:(BOOL)a3;
- (void)setInviteDate:(id)a3;
- (void)setInviteEmail:(id)a3;
@end

@implementation PKAccountPendingFamilyMember

- (PKAccountPendingFamilyMember)initWithPendingFamilyMember:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKAccountPendingFamilyMember;
  v8 = [(PKAccountPendingFamilyMember *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountIdentifier, a4);
    uint64_t v10 = [v6 invitationDate];
    inviteDate = v9->_inviteDate;
    v9->_inviteDate = (NSDate *)v10;

    uint64_t v12 = [v6 inviteEmail];
    inviteEmail = v9->_inviteEmail;
    v9->_inviteEmail = (NSString *)v12;

    v9->_displayedNotification = 0;
    uint64_t v14 = [v6 altDSID];
    altDSID = v9->_altDSID;
    v9->_altDSID = (NSString *)v14;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKAccountPendingFamilyMember *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountPendingFamilyMember *)self _isEqualToAccountPendingFamilyMember:v5];

  return v6;
}

- (BOOL)_isEqualToAccountPendingFamilyMember:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_19;
  }
  BOOL v6 = (void *)*((void *)v4 + 3);
  id v7 = self->_inviteEmail;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    LOBYTE(v10) = 0;
    if (!v7 || !v8) {
      goto LABEL_26;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_27;
    }
  }
  inviteDate = self->_inviteDate;
  uint64_t v12 = (NSDate *)*((void *)v5 + 4);
  if (inviteDate && v12)
  {
    if ((-[NSDate isEqual:](inviteDate, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (inviteDate != v12)
  {
    goto LABEL_19;
  }
  if (self->_displayedNotification == v5[8])
  {
    v13 = (void *)*((void *)v5 + 2);
    id v7 = self->_accountIdentifier;
    uint64_t v14 = v13;
    if (v7 == v14)
    {

LABEL_21:
      altDSID = self->_altDSID;
      v16 = (void *)*((void *)v5 + 5);
      id v7 = altDSID;
      objc_super v17 = v16;
      if (v7 == v17)
      {
        LOBYTE(v10) = 1;
        v9 = v7;
      }
      else
      {
        v9 = v17;
        LOBYTE(v10) = 0;
        if (v7 && v17) {
          LOBYTE(v10) = [(NSString *)v7 isEqualToString:v17];
        }
      }
      goto LABEL_26;
    }
    v9 = v14;
    LOBYTE(v10) = 0;
    if (v7 && v14)
    {
      BOOL v10 = [(NSString *)v7 isEqualToString:v14];

      if (!v10) {
        goto LABEL_27;
      }
      goto LABEL_21;
    }
LABEL_26:

    goto LABEL_27;
  }
LABEL_19:
  LOBYTE(v10) = 0;
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_inviteEmail];
  [v3 safelyAddObject:self->_inviteDate];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_altDSID];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_displayedNotification - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPendingFamilyMember)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountPendingFamilyMember;
  unint64_t v5 = [(PKAccountPendingFamilyMember *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inviteDate"];
    inviteDate = v5->_inviteDate;
    v5->_inviteDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inviteEmail"];
    inviteEmail = v5->_inviteEmail;
    v5->_inviteEmail = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v10;

    v5->_displayedNotification = [v4 decodeBoolForKey:@"displayedNotification"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL displayedNotification = self->_displayedNotification;
  id v5 = a3;
  [v5 encodeBool:displayedNotification forKey:@"displayedNotification"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_inviteEmail forKey:@"inviteEmail"];
  [v5 encodeObject:self->_inviteDate forKey:@"inviteDate"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"inviteEmail: '%@'; ", self->_inviteEmail];
  [v3 appendFormat:@"inviteDate: '%@'; ", self->_inviteDate];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  if (self->_displayedNotification) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"displayedNotification: '%@'; ", v4];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)inviteEmail
{
  return self->_inviteEmail;
}

- (void)setInviteEmail:(id)a3
{
}

- (NSDate)inviteDate
{
  return self->_inviteDate;
}

- (void)setInviteDate:(id)a3
{
}

- (BOOL)displayedNotification
{
  return self->_displayedNotification;
}

- (void)setDisplayedNotification:(BOOL)a3
{
  self->_BOOL displayedNotification = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_inviteDate, 0);
  objc_storeStrong((id *)&self->_inviteEmail, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end