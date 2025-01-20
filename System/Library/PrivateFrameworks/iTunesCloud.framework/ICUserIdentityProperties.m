@interface ICUserIdentityProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isActiveLocker;
- (BOOL)isCloudBackupEnabled;
- (BOOL)isDelegated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentityProperties:(id)a3;
- (BOOL)isManagedAppleID;
- (BOOL)isSandboxed;
- (BOOL)isSubscriptionStatusEnabled;
- (BOOL)isU18MinorAccount;
- (ICDelegateToken)delegateToken;
- (ICUserIdentityProperties)initWithCoder:(id)a3;
- (NSArray)homeUserIdentifiers;
- (NSDate)ageVerificationExpirationDate;
- (NSDictionary)cloudLibraryStateReason;
- (NSDictionary)privacyAcknowledgementVersions;
- (NSDictionary)privateListeningEnabledForHomeUsers;
- (NSNumber)DSID;
- (NSNumber)mergeToCloudLibraryPreference;
- (NSNumber)privateListeningEnabled;
- (NSString)alternateDSID;
- (NSString)carrierBundleDeviceIdentifier;
- (NSString)firstName;
- (NSString)iCloudPersonID;
- (NSString)lastName;
- (NSString)storefrontIdentifier;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudBackupEnabled:(BOOL)a3;
- (void)setHomeUserIdentifiers:(id)a3;
- (void)setICloudPersonID:(id)a3;
- (void)setPrivateListeningEnabledForHomeUsers:(id)a3;
@end

@implementation ICUserIdentityProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyAcknowledgementVersions, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabledForHomeUsers, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_cloudLibraryStateReason, 0);
  objc_storeStrong((id *)&self->_homeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_mergeToCloudLibraryPreference, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_iCloudPersonID, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_delegateToken, 0);
  objc_storeStrong((id *)&self->_carrierBundleDeviceIdentifier, 0);

  objc_storeStrong((id *)&self->_alternateDSID, 0);
}

- (NSNumber)DSID
{
  return self->_dsid;
}

- (NSString)storefrontIdentifier
{
  if (self->_storefrontIdentifier) {
    return self->_storefrontIdentifier;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (BOOL)isActiveLocker
{
  return self->_activeLocker;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  if ([v4 isSubclassOfClass:objc_opt_class()])
  {
    v5 = [+[ICUserIdentityProperties allocWithZone:a3] init];
    if (v5) {
      __CopyHelper(self, v5, (uint64_t)a3);
    }
    return v5;
  }
  else
  {
    return self;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  if ([v5 isSubclassOfClass:v6]) {
    v7 = v5;
  }
  else {
    v7 = (void *)v6;
  }
  v8 = objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", a3), "init");
  if (v8) {
    __CopyHelper(self, v8, (uint64_t)a3);
  }
  return v8;
}

- (BOOL)isDelegated
{
  return self->_delegated;
}

- (BOOL)isSandboxed
{
  return self->_sandboxed;
}

- (NSDictionary)cloudLibraryStateReason
{
  return self->_cloudLibraryStateReason;
}

- (void)setICloudPersonID:(id)a3
{
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->_cloudBackupEnabled = a3;
}

- (BOOL)isCloudBackupEnabled
{
  return self->_cloudBackupEnabled;
}

- (BOOL)isU18MinorAccount
{
  return self->_u18MinorAccount;
}

- (void)setPrivateListeningEnabledForHomeUsers:(id)a3
{
}

- (NSNumber)privateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (void)setHomeUserIdentifiers:(id)a3
{
}

- (BOOL)isSubscriptionStatusEnabled
{
  return self->_subscriptionStatusEnabled;
}

- (BOOL)isManagedAppleID
{
  return self->_managedAppleID;
}

- (BOOL)isActive
{
  return self->_active;
}

- (ICDelegateToken)delegateToken
{
  return self->_delegateToken;
}

- (void)encodeWithCoder:(id)a3
{
  alternateDSID = self->_alternateDSID;
  id v5 = a3;
  [v5 encodeObject:alternateDSID forKey:@"altDSID"];
  [v5 encodeObject:self->_carrierBundleDeviceIdentifier forKey:@"carrierDeviceID"];
  [v5 encodeBool:self->_cloudBackupEnabled forKey:@"cloudBackup"];
  [v5 encodeBool:self->_delegated forKey:@"delegated"];
  [v5 encodeObject:self->_delegateToken forKey:@"delegateToken"];
  [v5 encodeObject:self->_dsid forKey:@"dsid"];
  [v5 encodeObject:self->_firstName forKey:@"firstName"];
  [v5 encodeObject:self->_iCloudPersonID forKey:@"iCloudPersonID"];
  [v5 encodeObject:self->_lastName forKey:@"lastName"];
  [v5 encodeBool:self->_managedAppleID forKey:@"isManaged"];
  [v5 encodeBool:self->_sandboxed forKey:@"sandboxed"];
  [v5 encodeObject:self->_storefrontIdentifier forKey:@"storefront"];
  [v5 encodeBool:self->_subscriptionStatusEnabled forKey:@"subscriptionStatusEnabled"];
  [v5 encodeObject:self->_username forKey:@"username"];
  [v5 encodeObject:self->_mergeToCloudLibraryPreference forKey:@"mergeToCloudLibraryPreference"];
  [v5 encodeObject:self->_homeUserIdentifiers forKey:@"homeUserIdentifiers"];
  [v5 encodeObject:self->_cloudLibraryStateReason forKey:@"cloudLibraryStateReason"];
  [v5 encodeObject:self->_privateListeningEnabled forKey:@"privateListeningEnabled"];
  [v5 encodeBool:self->_activeLocker forKey:@"activeLocker"];
  [v5 encodeBool:self->_active forKey:@"active"];
  [v5 encodeObject:self->_privateListeningEnabledForHomeUsers forKey:@"privateListeningEnabledForHomeUsers"];
  [v5 encodeObject:self->_privacyAcknowledgementVersions forKey:@"privacyAcknowledgementVersions"];
  [v5 encodeBool:self->_u18MinorAccount forKey:@"u18MinorAccount"];
}

- (ICUserIdentityProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)ICUserIdentityProperties;
  id v5 = [(ICUserIdentityProperties *)&v48 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    alternateDSID = v5->_alternateDSID;
    v5->_alternateDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierDeviceID"];
    carrierBundleDeviceIdentifier = v5->_carrierBundleDeviceIdentifier;
    v5->_carrierBundleDeviceIdentifier = (NSString *)v8;

    v5->_cloudBackupEnabled = [v4 decodeBoolForKey:@"cloudBackup"];
    v5->_delegated = [v4 decodeBoolForKey:@"delegated"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"delegateToken"];
    delegateToken = v5->_delegateToken;
    v5->_delegateToken = (ICDelegateToken *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iCloudPersonID"];
    iCloudPersonID = v5->_iCloudPersonID;
    v5->_iCloudPersonID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v18;

    v5->_managedAppleID = [v4 decodeBoolForKey:@"isManaged"];
    v5->_sandboxed = [v4 decodeBoolForKey:@"sandboxed"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storefront"];
    storefrontIdentifier = v5->_storefrontIdentifier;
    v5->_storefrontIdentifier = (NSString *)v20;

    v5->_subscriptionStatusEnabled = [v4 decodeBoolForKey:@"subscriptionStatusEnabled"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
    username = v5->_username;
    v5->_username = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mergeToCloudLibraryPreference"];
    mergeToCloudLibraryPreference = v5->_mergeToCloudLibraryPreference;
    v5->_mergeToCloudLibraryPreference = (NSNumber *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"homeUserIdentifiers"];
    homeUserIdentifiers = v5->_homeUserIdentifiers;
    v5->_homeUserIdentifiers = (NSArray *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudLibraryStateReason"];
    cloudLibraryStateReason = v5->_cloudLibraryStateReason;
    v5->_cloudLibraryStateReason = (NSDictionary *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateListeningEnabled"];
    privateListeningEnabled = v5->_privateListeningEnabled;
    v5->_privateListeningEnabled = (NSNumber *)v33;

    v5->_activeLocker = [v4 decodeBoolForKey:@"activeLocker"];
    v5->_active = [v4 decodeBoolForKey:@"active"];
    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"privateListeningEnabledForHomeUsers"];
    privateListeningEnabledForHomeUsers = v5->_privateListeningEnabledForHomeUsers;
    v5->_privateListeningEnabledForHomeUsers = (NSDictionary *)v39;

    v41 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    v44 = objc_msgSend(v41, "setWithObjects:", v42, v43, objc_opt_class(), 0);
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"privacyAcknowledgementVersions"];
    privacyAcknowledgementVersions = v5->_privacyAcknowledgementVersions;
    v5->_privacyAcknowledgementVersions = (NSDictionary *)v45;

    v5->_u18MinorAccount = [v4 decodeBoolForKey:@"u18MinorAccount"];
  }

  return v5;
}

- (BOOL)isEqualToIdentityProperties:(id)a3
{
  id v4 = (ICUserIdentityProperties *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_65;
  }
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    id v6 = [(ICUserIdentityProperties *)self alternateDSID];
    id v7 = [(ICUserIdentityProperties *)v5 alternateDSID];
    if (v6 == v7)
    {
    }
    else
    {
      uint64_t v8 = v7;
      char v9 = [v6 isEqual:v7];

      if ((v9 & 1) == 0) {
        goto LABEL_65;
      }
    }
    id v11 = [(ICUserIdentityProperties *)self carrierBundleDeviceIdentifier];
    id v12 = [(ICUserIdentityProperties *)v5 carrierBundleDeviceIdentifier];
    if (v11 == v12)
    {
    }
    else
    {
      v13 = v12;
      char v14 = [v11 isEqual:v12];

      if ((v14 & 1) == 0) {
        goto LABEL_65;
      }
    }
    id v15 = [(ICUserIdentityProperties *)self DSID];
    id v16 = [(ICUserIdentityProperties *)v5 DSID];
    if (v15 == v16)
    {
    }
    else
    {
      v17 = v16;
      char v18 = [v15 isEqual:v16];

      if ((v18 & 1) == 0) {
        goto LABEL_65;
      }
    }
    id v19 = [(ICUserIdentityProperties *)self firstName];
    id v20 = [(ICUserIdentityProperties *)v5 firstName];
    if (v19 == v20)
    {
    }
    else
    {
      v21 = v20;
      char v22 = [v19 isEqual:v20];

      if ((v22 & 1) == 0) {
        goto LABEL_65;
      }
    }
    id v23 = [(ICUserIdentityProperties *)self lastName];
    id v24 = [(ICUserIdentityProperties *)v5 lastName];
    if (v23 == v24)
    {
    }
    else
    {
      v25 = v24;
      char v26 = [v23 isEqual:v24];

      if ((v26 & 1) == 0) {
        goto LABEL_65;
      }
    }
    BOOL v27 = [(ICUserIdentityProperties *)self isManagedAppleID];
    if (v27 != [(ICUserIdentityProperties *)v5 isManagedAppleID]) {
      goto LABEL_65;
    }
    BOOL v28 = [(ICUserIdentityProperties *)self isSandboxed];
    if (v28 != [(ICUserIdentityProperties *)v5 isSandboxed]) {
      goto LABEL_65;
    }
    id v29 = [(ICUserIdentityProperties *)self storefrontIdentifier];
    id v30 = [(ICUserIdentityProperties *)v5 storefrontIdentifier];
    if (v29 == v30)
    {
    }
    else
    {
      uint64_t v31 = v30;
      char v32 = [v29 isEqual:v30];

      if ((v32 & 1) == 0) {
        goto LABEL_65;
      }
    }
    BOOL v33 = [(ICUserIdentityProperties *)self isSubscriptionStatusEnabled];
    if (v33 != [(ICUserIdentityProperties *)v5 isSubscriptionStatusEnabled]) {
      goto LABEL_65;
    }
    id v34 = [(ICUserIdentityProperties *)self username];
    id v35 = [(ICUserIdentityProperties *)v5 username];
    if (v34 == v35)
    {
    }
    else
    {
      uint64_t v36 = v35;
      char v37 = [v34 isEqual:v35];

      if ((v37 & 1) == 0) {
        goto LABEL_65;
      }
    }
    id v38 = [(ICUserIdentityProperties *)self mergeToCloudLibraryPreference];
    id v39 = [(ICUserIdentityProperties *)v5 mergeToCloudLibraryPreference];
    if (v38 == v39)
    {
    }
    else
    {
      v40 = v39;
      char v41 = [v38 isEqual:v39];

      if ((v41 & 1) == 0) {
        goto LABEL_65;
      }
    }
    id v42 = [(ICUserIdentityProperties *)self homeUserIdentifiers];
    id v43 = [(ICUserIdentityProperties *)v5 homeUserIdentifiers];
    if (v42 == v43)
    {
    }
    else
    {
      v44 = v43;
      char v45 = [v42 isEqual:v43];

      if ((v45 & 1) == 0) {
        goto LABEL_65;
      }
    }
    id v46 = [(ICUserIdentityProperties *)self cloudLibraryStateReason];
    id v47 = [(ICUserIdentityProperties *)v5 cloudLibraryStateReason];
    if (v46 == v47)
    {
    }
    else
    {
      objc_super v48 = v47;
      char v49 = [v46 isEqual:v47];

      if ((v49 & 1) == 0) {
        goto LABEL_65;
      }
    }
    id v50 = [(ICUserIdentityProperties *)self privateListeningEnabled];
    id v51 = [(ICUserIdentityProperties *)v5 privateListeningEnabled];
    if (v50 == v51)
    {
    }
    else
    {
      v52 = v51;
      char v53 = [v50 isEqual:v51];

      if ((v53 & 1) == 0) {
        goto LABEL_65;
      }
    }
    BOOL v54 = [(ICUserIdentityProperties *)self isActiveLocker];
    if (v54 != [(ICUserIdentityProperties *)v5 isActiveLocker]) {
      goto LABEL_65;
    }
    BOOL v55 = [(ICUserIdentityProperties *)self isActive];
    if (v55 != [(ICUserIdentityProperties *)v5 isActive]) {
      goto LABEL_65;
    }
    id v56 = [(ICUserIdentityProperties *)self privateListeningEnabledForHomeUsers];
    id v57 = [(ICUserIdentityProperties *)v5 privateListeningEnabledForHomeUsers];
    if (v56 == v57)
    {
    }
    else
    {
      v58 = v57;
      char v59 = [v56 isEqual:v57];

      if ((v59 & 1) == 0) {
        goto LABEL_65;
      }
    }
    BOOL v60 = [(ICUserIdentityProperties *)self isCloudBackupEnabled];
    if (v60 != [(ICUserIdentityProperties *)v5 isCloudBackupEnabled]) {
      goto LABEL_65;
    }
    id v61 = [(ICUserIdentityProperties *)self iCloudPersonID];
    id v62 = [(ICUserIdentityProperties *)v5 iCloudPersonID];
    if (v61 == v62)
    {
    }
    else
    {
      v63 = v62;
      char v64 = [v61 isEqual:v62];

      if ((v64 & 1) == 0) {
        goto LABEL_65;
      }
    }
    BOOL v65 = [(ICUserIdentityProperties *)self isDelegated];
    if (v65 != [(ICUserIdentityProperties *)v5 isDelegated])
    {
LABEL_65:
      char v10 = 0;
      goto LABEL_66;
    }
    id v66 = [(ICUserIdentityProperties *)self delegateToken];
    id v67 = [(ICUserIdentityProperties *)v5 delegateToken];
    if (v66 == v67)
    {
    }
    else
    {
      v68 = v67;
      char v69 = [v66 isEqual:v67];

      if ((v69 & 1) == 0) {
        goto LABEL_65;
      }
    }
    v71 = [(ICUserIdentityProperties *)self privacyAcknowledgementVersions];
    v72 = [(ICUserIdentityProperties *)v5 privacyAcknowledgementVersions];
    if (v71 == v72) {
      char v10 = 1;
    }
    else {
      char v10 = [v71 isEqual:v72];
    }
  }
LABEL_66:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICUserIdentityProperties *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(ICUserIdentityProperties *)self isEqualToIdentityProperties:v4];
  }

  return v5;
}

- (NSDictionary)privacyAcknowledgementVersions
{
  return self->_privacyAcknowledgementVersions;
}

- (NSDictionary)privateListeningEnabledForHomeUsers
{
  return self->_privateListeningEnabledForHomeUsers;
}

- (NSArray)homeUserIdentifiers
{
  return self->_homeUserIdentifiers;
}

- (NSNumber)mergeToCloudLibraryPreference
{
  return self->_mergeToCloudLibraryPreference;
}

- (NSDate)ageVerificationExpirationDate
{
  return 0;
}

- (NSString)username
{
  if (self->_username) {
    return self->_username;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)lastName
{
  if (self->_lastName) {
    return self->_lastName;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)iCloudPersonID
{
  if (self->_iCloudPersonID) {
    return self->_iCloudPersonID;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)firstName
{
  if (self->_firstName) {
    return self->_firstName;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)carrierBundleDeviceIdentifier
{
  if (self->_carrierBundleDeviceIdentifier) {
    return self->_carrierBundleDeviceIdentifier;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)alternateDSID
{
  return self->_alternateDSID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end