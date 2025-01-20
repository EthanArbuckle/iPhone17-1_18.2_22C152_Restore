@interface PKAccountUser
+ (BOOL)currentUser:(id)a3 canShareZone:(id)a4 withAccountUser:(id)a5;
+ (BOOL)currentUser:(id)a3 shouldRequestZoneShareForZone:(id)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)hasHandle:(id)a3;
- (BOOL)isCurrentUser;
- (BOOL)isDirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountUser:(id)a3;
- (BOOL)supportsMonthlySpendLimit;
- (BOOL)supportsPhysicalCardActivation;
- (BOOL)supportsRequestPhysicalCard;
- (NSDate)lastUpdated;
- (NSPersonNameComponents)nameComponents;
- (NSSet)addressableHandles;
- (NSSet)supportedFeatures;
- (NSSet)transactionSourceIdentifiers;
- (NSString)accountIdentifier;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)firstName;
- (NSString)lastName;
- (PKAccountUser)initWithCoder:(id)a3;
- (PKAccountUser)initWithDictionary:(id)a3;
- (PKAccountUserNotificationSettings)notificationSettings;
- (PKAccountUserPreferences)preferences;
- (id)_featureWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)monthlySpendLimitFeatureDescriptor;
- (id)physicalCardActivationFeatureDescriptor;
- (id)requestPhysicalCardFeatureDescriptor;
- (unint64_t)accessLevel;
- (unint64_t)accountState;
- (unint64_t)hash;
- (unint64_t)identityStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessLevel:(unint64_t)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountState:(unint64_t)a3;
- (void)setAddressableHandles:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setCurrentUser:(BOOL)a3;
- (void)setDirty:(BOOL)a3;
- (void)setFirstName:(id)a3;
- (void)setIdentityStatus:(unint64_t)a3;
- (void)setLastName:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setNotificationSettings:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setSupportedFeatures:(id)a3;
- (void)setTransactionSourceIdentifiers:(id)a3;
@end

@implementation PKAccountUser

- (PKAccountUser)initWithDictionary:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PKAccountUser;
  v5 = [(PKAccountUser *)&v39 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"accessLevel"];
    v5->_accessLevel = PKAccountAccessLevelFromString(v6);

    uint64_t v7 = [v4 PKStringForKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v7;

    v9 = [v4 PKStringForKey:@"state"];
    v5->_accountState = PKAccountStateFromString(v9);

    uint64_t v10 = [v4 PKStringForKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v14;

    uint64_t v16 = [v4 PKSetContaining:objc_opt_class() forKey:@"addressableHandles"];
    addressableHandles = v5->_addressableHandles;
    v5->_addressableHandles = (NSSet *)v16;

    v18 = [v4 PKSetContaining:objc_opt_class() forKey:@"supportedFeatures"];
    uint64_t v19 = objc_msgSend(v18, "pk_setByApplyingBlock:", &__block_literal_global_90);
    supportedFeatures = v5->_supportedFeatures;
    v5->_supportedFeatures = (NSSet *)v19;

    v21 = [PKAccountUserPreferences alloc];
    v22 = [v4 PKDictionaryForKey:@"preferences"];
    uint64_t v23 = [(PKAccountUserPreferences *)v21 initWithDictionary:v22];
    preferences = v5->_preferences;
    v5->_preferences = (PKAccountUserPreferences *)v23;

    v25 = [v4 PKStringForKey:@"identityStatus"];
    v26 = v25;
    if (v25 != @"verified")
    {
      if (v25)
      {
        char v27 = [(__CFString *)v25 isEqualToString:@"verified"];

        if (v27) {
          goto LABEL_5;
        }
        v29 = v26;
        if (v29 == @"notVerified"
          || (v30 = v29,
              char v31 = [(__CFString *)v29 isEqualToString:@"notVerified"],
              v30,
              (v31 & 1) != 0))
        {
          uint64_t v28 = 2;
          goto LABEL_16;
        }
        v32 = v30;
        if (v32 == @"verificationPending"
          || (v33 = v32,
              char v34 = [(__CFString *)v32 isEqualToString:@"verificationPending"],
              v33,
              (v34 & 1) != 0))
        {
          uint64_t v28 = 3;
          goto LABEL_16;
        }
        v35 = v33;
        if (v35 == @"notEligible"
          || (v36 = v35,
              int v37 = [(__CFString *)v35 isEqualToString:@"notEligible"],
              v36,
              v37))
        {
          uint64_t v28 = 4;
          goto LABEL_16;
        }
      }
      uint64_t v28 = 0;
      goto LABEL_16;
    }
LABEL_5:
    uint64_t v28 = 1;
LABEL_16:

    v5->_identityStatus = v28;
  }

  return v5;
}

PKCreditAccountFeatureDescriptor *__36__PKAccountUser_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCreditAccountFeatureDescriptor alloc] initWithDictionary:v2];

  return v3;
}

- (NSPersonNameComponents)nameComponents
{
  if (self->_firstName && self->_lastName)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    [v3 setGivenName:self->_firstName];
    [v3 setFamilyName:self->_lastName];
  }
  else
  {
    id v3 = 0;
  }
  return (NSPersonNameComponents *)v3;
}

+ (BOOL)currentUser:(id)a3 canShareZone:(id)a4 withAccountUser:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 accountState] == 4
    || ![v7 accountState]
    || [v9 accountState] == 4
    || ![v9 accountState])
  {
    goto LABEL_29;
  }
  uint64_t v10 = [v8 accountIdentifier];
  v11 = [v9 accountIdentifier];
  id v12 = v10;
  id v13 = v11;
  if (v12 == v13)
  {
  }
  else
  {
    uint64_t v14 = v13;
    if (!v12 || !v13) {
      goto LABEL_28;
    }
    char v15 = [v12 isEqualToString:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_29;
    }
  }
  uint64_t v16 = [v7 accountIdentifier];
  v17 = [v9 accountIdentifier];
  id v12 = v16;
  id v18 = v17;
  if (v12 == v18)
  {
  }
  else
  {
    uint64_t v14 = v18;
    if (!v12 || !v18) {
      goto LABEL_28;
    }
    char v19 = [v12 isEqualToString:v18];

    if ((v19 & 1) == 0) {
      goto LABEL_29;
    }
  }
  v20 = [v8 accountIdentifier];
  v21 = [v7 accountIdentifier];
  id v12 = v20;
  id v22 = v21;
  if (v12 == v22)
  {
  }
  else
  {
    uint64_t v14 = v22;
    if (!v12 || !v22) {
      goto LABEL_28;
    }
    char v23 = [v12 isEqualToString:v22];

    if ((v23 & 1) == 0) {
      goto LABEL_29;
    }
  }
  v24 = [v8 originatorAltDSID];
  v25 = [v7 altDSID];
  id v12 = v24;
  id v26 = v25;
  if (v12 != v26)
  {
    uint64_t v14 = v26;
    if (v12 && v26)
    {
      char v27 = [v12 isEqualToString:v26];

      if ((v27 & 1) == 0) {
        goto LABEL_29;
      }
      goto LABEL_32;
    }
LABEL_28:

    goto LABEL_29;
  }

LABEL_32:
  v30 = [v8 sharedUsersAltDSIDs];
  char v31 = [v9 altDSID];
  int v32 = [v30 containsObject:v31];

  if (v32)
  {
    BOOL v28 = [v8 access] == 1;
    goto LABEL_30;
  }
LABEL_29:
  BOOL v28 = 0;
LABEL_30:

  return v28;
}

+ (BOOL)currentUser:(id)a3 shouldRequestZoneShareForZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 accountState] == 4 || !objc_msgSend(v5, "accountState")) {
    goto LABEL_13;
  }
  id v7 = [v6 accountIdentifier];
  id v8 = [v5 accountIdentifier];
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_13;
    }
    char v12 = [v9 isEqualToString:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_13;
    }
  }
  if ([v6 access] != 2)
  {
LABEL_13:
    BOOL v14 = 0;
    goto LABEL_14;
  }
  uint64_t v17 = 0;
  id v13 = [v6 zoneName];
  uint64_t v16 = 0;
  +[PKCloudStoreZone zoneValueForZoneName:v13 outZoneType:&v17 outAccountIdentifier:&v16 altDSID:0];

  if ((unint64_t)(v17 - 5) >= 2)
  {
    if (v17 == 4)
    {
      BOOL v14 = [v5 accessLevel] == 1;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  BOOL v14 = (unint64_t)([v5 accessLevel] - 1) < 2;
LABEL_14:

  return v14;
}

- (BOOL)hasHandle:(id)a3
{
  return [(NSSet *)self->_addressableHandles containsObject:a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountUser *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountUser *)self isEqualToAccountUser:v5];

  return v6;
}

- (BOOL)isEqualToAccountUser:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  id v5 = v4;
  if (!v4 || self->_accessLevel != *((void *)v4 + 2)) {
    goto LABEL_48;
  }
  altDSID = self->_altDSID;
  id v7 = (NSString *)*((void *)v5 + 3);
  if (altDSID && v7)
  {
    if ((-[NSString isEqual:](altDSID, "isEqual:") & 1) == 0) {
      goto LABEL_48;
    }
  }
  else if (altDSID != v7)
  {
    goto LABEL_48;
  }
  if (self->_accountState != *((void *)v5 + 4)
    || self->_currentUser != v5[8]
    || self->_identityStatus != *((void *)v5 + 9))
  {
    goto LABEL_48;
  }
  firstName = self->_firstName;
  id v9 = (NSString *)*((void *)v5 + 14);
  if (firstName && v9)
  {
    if ((-[NSString isEqual:](firstName, "isEqual:") & 1) == 0) {
      goto LABEL_48;
    }
  }
  else if (firstName != v9)
  {
    goto LABEL_48;
  }
  lastName = self->_lastName;
  v11 = (NSString *)*((void *)v5 + 15);
  if (lastName && v11)
  {
    if ((-[NSString isEqual:](lastName, "isEqual:") & 1) == 0) {
      goto LABEL_48;
    }
  }
  else if (lastName != v11)
  {
    goto LABEL_48;
  }
  appleID = self->_appleID;
  id v13 = (NSString *)*((void *)v5 + 5);
  if (appleID && v13)
  {
    if ((-[NSString isEqual:](appleID, "isEqual:") & 1) == 0) {
      goto LABEL_48;
    }
  }
  else if (appleID != v13)
  {
    goto LABEL_48;
  }
  addressableHandles = self->_addressableHandles;
  char v15 = (NSSet *)*((void *)v5 + 6);
  if (addressableHandles && v15)
  {
    if ((-[NSSet isEqual:](addressableHandles, "isEqual:") & 1) == 0) {
      goto LABEL_48;
    }
  }
  else if (addressableHandles != v15)
  {
    goto LABEL_48;
  }
  supportedFeatures = self->_supportedFeatures;
  uint64_t v17 = (NSSet *)*((void *)v5 + 7);
  if (supportedFeatures && v17)
  {
    if ((-[NSSet isEqual:](supportedFeatures, "isEqual:") & 1) == 0) {
      goto LABEL_48;
    }
  }
  else if (supportedFeatures != v17)
  {
    goto LABEL_48;
  }
  transactionSourceIdentifiers = self->_transactionSourceIdentifiers;
  char v19 = (NSSet *)*((void *)v5 + 11);
  if (transactionSourceIdentifiers && v19)
  {
    if ((-[NSSet isEqual:](transactionSourceIdentifiers, "isEqual:") & 1) == 0) {
      goto LABEL_48;
    }
  }
  else if (transactionSourceIdentifiers != v19)
  {
    goto LABEL_48;
  }
  accountIdentifier = self->_accountIdentifier;
  v21 = (NSString *)*((void *)v5 + 12);
  if (!accountIdentifier || !v21)
  {
    if (accountIdentifier == v21) {
      goto LABEL_44;
    }
LABEL_48:
    BOOL v24 = 0;
    goto LABEL_49;
  }
  if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_48;
  }
LABEL_44:
  preferences = self->_preferences;
  char v23 = (PKAccountUserPreferences *)*((void *)v5 + 8);
  if (preferences && v23) {
    BOOL v24 = -[PKAccountUserPreferences isEqual:](preferences, "isEqual:");
  }
  else {
    BOOL v24 = preferences == v23;
  }
LABEL_49:

  return v24;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_altDSID];
  [v3 safelyAddObject:self->_firstName];
  [v3 safelyAddObject:self->_lastName];
  [v3 safelyAddObject:self->_supportedFeatures];
  [v3 safelyAddObject:self->_transactionSourceIdentifiers];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_addressableHandles];
  [v3 safelyAddObject:self->_appleID];
  [v3 safelyAddObject:self->_preferences];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_accessLevel - v4 + 32 * v4;
  unint64_t v6 = self->_accountState - v5 + 32 * v5;
  uint64_t v7 = self->_currentUser - v6 + 32 * v6;
  unint64_t v8 = self->_identityStatus - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  if (self->_currentUser) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  [v3 appendFormat:@"isCurrentUser: '%@'; ", v4];
  unint64_t v5 = PKAccountAccessLevelToString(self->_accessLevel);
  [v3 appendFormat:@"accessLevel: '%@'; ", v5];

  unint64_t v6 = PKAccountStateToString(self->_accountState);
  [v3 appendFormat:@"state: '%@'; ", v6];

  [v3 appendFormat:@"firstName: '%@'; ", self->_firstName];
  [v3 appendFormat:@"lastName: '%@'; ", self->_lastName];
  [v3 appendFormat:@"appleID: '%@'; ", self->_appleID];
  unint64_t identityStatus = self->_identityStatus;
  if (identityStatus > 4) {
    unint64_t v8 = @"unknown";
  }
  else {
    unint64_t v8 = off_1E56E58B8[identityStatus];
  }
  [v3 appendFormat:@"identityStatus: '%@'; ", v8];
  [v3 appendFormat:@"supportedFeatures: '%@'; ", self->_supportedFeatures];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"transactionSourceIdentifiers: '%@'; ", self->_transactionSourceIdentifiers];
  [v3 appendFormat:@"preferences: '%@'; ", self->_preferences];
  [v3 appendFormat:@"addressableHandles: '%@'; ", self->_addressableHandles];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountUser)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKAccountUser;
  unint64_t v5 = [(PKAccountUser *)&v36 init];
  if (v5)
  {
    v5->_accessLevel = [v4 decodeIntegerForKey:@"accessLevel"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v5->_accountState = [v4 decodeIntegerForKey:@"state"];
    v5->_currentUser = [v4 decodeIntegerForKey:@"currentUser"] != 0;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v10;

    char v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    BOOL v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"supportedFeatures"];
    supportedFeatures = v5->_supportedFeatures;
    v5->_supportedFeatures = (NSSet *)v15;

    uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    char v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"transactionSourceIdentifier"];
    transactionSourceIdentifiers = v5->_transactionSourceIdentifiers;
    v5->_transactionSourceIdentifiers = (NSSet *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v24;

    id v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    BOOL v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"addressableHandles"];
    addressableHandles = v5->_addressableHandles;
    v5->_addressableHandles = (NSSet *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferences"];
    preferences = v5->_preferences;
    v5->_preferences = (PKAccountUserPreferences *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationSettings"];
    notificationSettings = v5->_notificationSettings;
    v5->_notificationSettings = (PKAccountUserNotificationSettings *)v33;

    v5->_unint64_t identityStatus = [v4 decodeIntegerForKey:@"identityStatus"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t accessLevel = self->_accessLevel;
  id v5 = a3;
  [v5 encodeInteger:accessLevel forKey:@"accessLevel"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
  [v5 encodeInteger:self->_accountState forKey:@"state"];
  [v5 encodeInteger:self->_currentUser forKey:@"currentUser"];
  [v5 encodeObject:self->_firstName forKey:@"firstName"];
  [v5 encodeObject:self->_lastName forKey:@"lastName"];
  [v5 encodeObject:self->_supportedFeatures forKey:@"supportedFeatures"];
  [v5 encodeObject:self->_transactionSourceIdentifiers forKey:@"transactionSourceIdentifier"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_appleID forKey:@"appleID"];
  [v5 encodeObject:self->_addressableHandles forKey:@"addressableHandles"];
  [v5 encodeObject:self->_preferences forKey:@"preferences"];
  [v5 encodeObject:self->_notificationSettings forKey:@"notificationSettings"];
  [v5 encodeInteger:self->_identityStatus forKey:@"identityStatus"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKAccountUser allocWithZone:](PKAccountUser, "allocWithZone:") init];
  v5->_unint64_t accessLevel = self->_accessLevel;
  uint64_t v6 = [(NSString *)self->_altDSID copyWithZone:a3];
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v6;

  v5->_accountState = self->_accountState;
  v5->_currentUser = self->_currentUser;
  v5->_unint64_t identityStatus = self->_identityStatus;
  uint64_t v8 = [(NSString *)self->_firstName copyWithZone:a3];
  firstName = v5->_firstName;
  v5->_firstName = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_lastName copyWithZone:a3];
  lastName = v5->_lastName;
  v5->_lastName = (NSString *)v10;

  uint64_t v12 = [(NSSet *)self->_supportedFeatures copyWithZone:a3];
  supportedFeatures = v5->_supportedFeatures;
  v5->_supportedFeatures = (NSSet *)v12;

  uint64_t v14 = [(NSSet *)self->_transactionSourceIdentifiers copyWithZone:a3];
  transactionSourceIdentifiers = v5->_transactionSourceIdentifiers;
  v5->_transactionSourceIdentifiers = (NSSet *)v14;

  uint64_t v16 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_appleID copyWithZone:a3];
  appleID = v5->_appleID;
  v5->_appleID = (NSString *)v18;

  uint64_t v20 = [(NSSet *)self->_addressableHandles copyWithZone:a3];
  addressableHandles = v5->_addressableHandles;
  v5->_addressableHandles = (NSSet *)v20;

  uint64_t v22 = [(PKAccountUserPreferences *)self->_preferences copyWithZone:a3];
  preferences = v5->_preferences;
  v5->_preferences = v22;

  return v5;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(unint64_t)a3
{
  self->_unint64_t accessLevel = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (unint64_t)accountState
{
  return self->_accountState;
}

- (void)setAccountState:(unint64_t)a3
{
  self->_accountState = a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (BOOL)isCurrentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(BOOL)a3
{
  self->_currentUser = a3;
}

- (NSSet)addressableHandles
{
  return self->_addressableHandles;
}

- (void)setAddressableHandles:(id)a3
{
}

- (NSSet)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void)setSupportedFeatures:(id)a3
{
}

- (PKAccountUserPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (unint64_t)identityStatus
{
  return self->_identityStatus;
}

- (void)setIdentityStatus:(unint64_t)a3
{
  self->_unint64_t identityStatus = a3;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSSet)transactionSourceIdentifiers
{
  return self->_transactionSourceIdentifiers;
}

- (void)setTransactionSourceIdentifiers:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (PKAccountUserNotificationSettings)notificationSettings
{
  return self->_notificationSettings;
}

- (void)setNotificationSettings:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_notificationSettings, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_addressableHandles, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (BOOL)supportsRequestPhysicalCard
{
  id v2 = [(PKAccountUser *)self requestPhysicalCardFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)requestPhysicalCardFeatureDescriptor
{
  return [(PKAccountUser *)self _featureWithIdentifier:@"requestPhysicalCard"];
}

- (BOOL)supportsMonthlySpendLimit
{
  id v2 = [(PKAccountUser *)self monthlySpendLimitFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)monthlySpendLimitFeatureDescriptor
{
  return [(PKAccountUser *)self _featureWithIdentifier:@"monthlySpendLimit"];
}

- (BOOL)supportsPhysicalCardActivation
{
  id v2 = [(PKAccountUser *)self physicalCardActivationFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)physicalCardActivationFeatureDescriptor
{
  return [(PKAccountUser *)self _featureWithIdentifier:@"physicalCardActivation"];
}

- (id)_featureWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(PKAccountUser *)self supportedFeatures];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end