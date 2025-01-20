@interface UMUser
- (BOOL)commitChanges;
- (BOOL)commitChangesWithError:(id *)a3;
- (BOOL)hasDataToSync;
- (BOOL)hasManagedCredentials;
- (BOOL)inFirstLoginSession;
- (BOOL)isAdminUser;
- (BOOL)isAuditor;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUser:(id)a3;
- (BOOL)isLoginUser;
- (BOOL)isPrimaryUser;
- (BOOL)isTransientUser;
- (BOOL)shouldFetchAttributes;
- (NSArray)allUserPersonas;
- (NSArray)languages;
- (NSDate)creationDate;
- (NSDate)firstLoginEndDate;
- (NSDate)firstLoginStartDate;
- (NSDate)lastCachedLoginEndDate;
- (NSDate)lastCachedLoginStartDate;
- (NSDate)lastLoginDate;
- (NSDate)lastLogoutEndDate;
- (NSDate)lastLogoutStartDate;
- (NSDate)lastRemoteAuthDate;
- (NSError)debugErrorCausingLogout;
- (NSError)errorCausingLogout;
- (NSString)alternateDSID;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)userAuxiliaryString;
- (NSString)username;
- (NSURL)homeDirectoryURL;
- (NSURL)photoURL;
- (UMUser)init;
- (double)passcodeBackOffInterval;
- (id)_photo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)userPersonaFromIdentityString:(id)a3;
- (unint64_t)dataQuota;
- (unint64_t)dataUsed;
- (unint64_t)passcodeLockGracePeriod;
- (unint64_t)passcodeType;
- (unint64_t)userType;
- (unsigned)gid;
- (unsigned)uid;
- (void)refetchUser;
- (void)setAlternateDSID:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDataQuota:(unint64_t)a3;
- (void)setDataUsed:(unint64_t)a3;
- (void)setDebugErrorCausingLogout:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setErrorCausingLogout:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setFirstLoginEndDate:(id)a3;
- (void)setFirstLoginStartDate:(id)a3;
- (void)setGid:(unsigned int)a3;
- (void)setGivenName:(id)a3;
- (void)setHasDataToSync:(BOOL)a3;
- (void)setHasManagedCredentials:(BOOL)a3;
- (void)setHomeDirectoryURL:(id)a3;
- (void)setIsAdminUser:(BOOL)a3;
- (void)setIsAuditor:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsLoginUser:(BOOL)a3;
- (void)setIsPrimaryUser:(BOOL)a3;
- (void)setIsTransientUser:(BOOL)a3;
- (void)setLanguages:(id)a3;
- (void)setLastCachedLoginEndDate:(id)a3;
- (void)setLastCachedLoginStartDate:(id)a3;
- (void)setLastLoginDate:(id)a3;
- (void)setLastLogoutEndDate:(id)a3;
- (void)setLastLogoutStartDate:(id)a3;
- (void)setLastRemoteAuthDate:(id)a3;
- (void)setPasscodeLockGracePeriod:(unint64_t)a3;
- (void)setPasscodeType:(unint64_t)a3;
- (void)setPhotoURL:(id)a3;
- (void)setShouldFetchAttributes:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUserAuxiliaryString:(id)a3;
- (void)setUsername:(id)a3;
- (void)set_photo:(id)a3;
@end

@implementation UMUser

- (UMUser)init
{
  v3.receiver = self;
  v3.super_class = (Class)UMUser;
  result = [(UMUser *)&v3 init];
  if (result)
  {
    result->_passcodeType = 3;
    result->_shouldFetchAttributes = 1;
  }
  return result;
}

- (unsigned)gid
{
  return self->_gid;
}

- (NSString)alternateDSID
{
  sub_190C5C95C(self);
  alternateDSID = self->_alternateDSID;
  return alternateDSID;
}

- (NSURL)homeDirectoryURL
{
  sub_190C5C95C(self);
  homeDirectoryURL = self->_homeDirectoryURL;
  return homeDirectoryURL;
}

- (NSString)username
{
  sub_190C5C95C(self);
  username = self->_username;
  return username;
}

- (NSString)givenName
{
  sub_190C5C95C(self);
  givenName = self->_givenName;
  return givenName;
}

- (NSString)familyName
{
  sub_190C5C95C(self);
  familyName = self->_familyName;
  return familyName;
}

- (NSURL)photoURL
{
  sub_190C5C95C(self);
  photoURL = self->_photoURL;
  return photoURL;
}

- (NSString)userAuxiliaryString
{
  sub_190C5C95C(self);
  userAuxiliaryString = self->_userAuxiliaryString;
  return userAuxiliaryString;
}

- (NSDate)creationDate
{
  sub_190C5C95C(self);
  creationDate = self->_creationDate;
  return creationDate;
}

- (NSDate)lastLoginDate
{
  sub_190C5C95C(self);
  lastLoginDate = self->_lastLoginDate;
  return lastLoginDate;
}

- (NSDate)lastRemoteAuthDate
{
  sub_190C5C95C(self);
  lastRemoteAuthDate = self->_lastRemoteAuthDate;
  return lastRemoteAuthDate;
}

- (BOOL)isLoginUser
{
  return self->_isLoginUser;
}

- (BOOL)isAuditor
{
  return self->_isAuditor;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (BOOL)isTransientUser
{
  return self->_isTransientUser;
}

- (BOOL)isPrimaryUser
{
  return self->_isPrimaryUser;
}

- (BOOL)isAdminUser
{
  return self->_isAdminUser;
}

- (BOOL)inFirstLoginSession
{
  return !self->_firstLoginEndDate || !self->_lastCachedLoginStartDate;
}

- (unint64_t)passcodeLockGracePeriod
{
  return self->_passcodeLockGracePeriod;
}

- (NSArray)languages
{
  sub_190C5C95C(self);
  languages = self->_languages;
  return languages;
}

- (BOOL)hasManagedCredentials
{
  return self->_hasManagedCredentials;
}

- (NSError)errorCausingLogout
{
  sub_190C5C95C(self);
  errorCausingLogout = self->_errorCausingLogout;
  return errorCausingLogout;
}

- (NSError)debugErrorCausingLogout
{
  sub_190C5C95C(self);
  debugErrorCausingLogout = self->_debugErrorCausingLogout;
  return debugErrorCausingLogout;
}

- (unint64_t)passcodeType
{
  return self->_passcodeType;
}

- (NSDate)firstLoginStartDate
{
  sub_190C5C95C(self);
  firstLoginStartDate = self->_firstLoginStartDate;
  return firstLoginStartDate;
}

- (NSDate)firstLoginEndDate
{
  sub_190C5C95C(self);
  firstLoginEndDate = self->_firstLoginEndDate;
  return firstLoginEndDate;
}

- (NSDate)lastCachedLoginStartDate
{
  sub_190C5C95C(self);
  lastCachedLoginStartDate = self->_lastCachedLoginStartDate;
  return lastCachedLoginStartDate;
}

- (NSDate)lastCachedLoginEndDate
{
  sub_190C5C95C(self);
  lastCachedLoginEndDate = self->_lastCachedLoginEndDate;
  return lastCachedLoginEndDate;
}

- (NSDate)lastLogoutStartDate
{
  sub_190C5C95C(self);
  lastLogoutStartDate = self->_lastLogoutStartDate;
  return lastLogoutStartDate;
}

- (NSDate)lastLogoutEndDate
{
  sub_190C5C95C(self);
  lastLogoutEndDate = self->_lastLogoutEndDate;
  return lastLogoutEndDate;
}

- (double)passcodeBackOffInterval
{
  return sub_190C41038((uint64_t)UMMobileKeyBag, self);
}

- (BOOL)hasDataToSync
{
  return self->_hasDataToSync;
}

- (unint64_t)dataQuota
{
  int v4 = objc_msgSend_uid(self, a2, v2);
  if (v4 == getuid())
  {
    p_dataQuota = (unint64_t *)v9;
    sub_190C5D01C(self, v5, v6, (uint64_t)v9);
  }
  else
  {
    sub_190C5C824(self, 0);
    p_dataQuota = &self->_dataQuota;
  }
  return *p_dataQuota;
}

- (unint64_t)dataUsed
{
  int v4 = objc_msgSend_uid(self, a2, v2);
  if (v4 == getuid())
  {
    sub_190C5D01C(self, v5, v6, (uint64_t)&v9);
    p_dataUsed = (unint64_t *)&v10;
  }
  else
  {
    sub_190C5C824(self, 0);
    p_dataUsed = &self->_dataUsed;
  }
  return *p_dataUsed;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  if (!self->_displayName)
  {
    int v4 = objc_msgSend_givenName(self, a2, v2);
    if (v4)
    {
    }
    else
    {
      v7 = objc_msgSend_familyName(self, v5, v6);

      if (!v7) {
        goto LABEL_6;
      }
    }
    v8 = objc_opt_new();
    v11 = objc_msgSend_givenName(self, v9, v10);
    objc_msgSend_setGivenName_(v8, v12, (uint64_t)v11);

    v15 = objc_msgSend_familyName(self, v13, v14);
    objc_msgSend_setFamilyName_(v8, v16, (uint64_t)v15);

    objc_msgSend_localizedStringFromPersonNameComponents_style_options_(MEMORY[0x1E4F28F38], v17, (uint64_t)v8, 0, 0);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    displayName = self->_displayName;
    self->_displayName = v18;
  }
LABEL_6:
  v20 = self->_displayName;
  return v20;
}

- (unint64_t)userType
{
  return sub_190C3F204();
}

- (id)description
{
  int v4 = NSString;
  uint64_t v5 = objc_msgSend_uid(self, a2, v2);
  return (id)objc_msgSend_stringWithFormat_(v4, v6, @"%p(UID: %d)", self, v5);
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (UMUser *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4) {
      char isEqualToUser = 1;
    }
    else {
      char isEqualToUser = objc_msgSend_isEqualToUser_(self, v5, (uint64_t)v4);
    }
  }
  else
  {
    char isEqualToUser = 0;
  }

  return isEqualToUser;
}

- (BOOL)isEqualToUser:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_alternateDSID(self, v5, v6);
  if (v7
    && (uint64_t v10 = (void *)v7,
        objc_msgSend_alternateDSID(v4, v8, v9),
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v12 = objc_msgSend_alternateDSID(self, v8, v9);
    uint64_t v15 = objc_msgSend_alternateDSID(v4, v13, v14);
  }
  else
  {
    uint64_t v17 = objc_msgSend_username(self, v8, v9);
    if (!v17
      || (v20 = (void *)v17,
          objc_msgSend_username(v4, v18, v19),
          v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          v20,
          !v21))
    {
      int v26 = objc_msgSend_uid(self, v18, v19);
      char isEqualToString = v26 == objc_msgSend_uid(v4, v27, v28);
      goto LABEL_9;
    }
    v12 = objc_msgSend_username(self, v18, v19);
    uint64_t v15 = objc_msgSend_username(v4, v22, v23);
  }
  v24 = (void *)v15;
  char isEqualToString = objc_msgSend_isEqualToString_(v12, v16, v15);

LABEL_9:
  return isEqualToString;
}

- (void)refetchUser
{
  objc_super v3 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v3, @"Force Marking UMUser with UID:%d to refetch Attributes on next access", v4, v5, v6, v7, v8, v9, self->_uid);

  self->_shouldFetchAttributes = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  sub_190C5D53C((uint64_t)v4, self);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  sub_190C5D53C((uint64_t)v4, self);
  return v4;
}

- (BOOL)commitChanges
{
  return MEMORY[0x1F4181798](self, sel_commitChangesWithError_, 0);
}

- (BOOL)commitChangesWithError:(id *)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  LOBYTE(a3) = sub_190C44020((uint64_t)UMMobileKeyBag, v4, a3);
  objc_sync_exit(v4);

  return (char)a3;
}

- (NSArray)allUserPersonas
{
  objc_super v3 = sub_190C3A85C();
  if (v3)
  {
    uint64_t v4 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v2, (uint64_t)v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSArray *)v4;
}

- (id)userPersonaFromIdentityString:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"DEADDEAD-DEAD-DEAD-DEAD-DEADDEADDEAD"))
  {
    objc_super v3 = sub_190C3A85C();
  }
  else
  {
    objc_super v3 = 0;
  }
  return v3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (void)setAlternateDSID:(id)a3
{
}

- (void)setHomeDirectoryURL:(id)a3
{
}

- (void)setUsername:(id)a3
{
}

- (void)setGivenName:(id)a3
{
}

- (void)setFamilyName:(id)a3
{
}

- (void)setPhotoURL:(id)a3
{
}

- (void)setUserAuxiliaryString:(id)a3
{
}

- (void)setCreationDate:(id)a3
{
}

- (void)setLastLoginDate:(id)a3
{
}

- (void)setLastRemoteAuthDate:(id)a3
{
}

- (void)setPasscodeType:(unint64_t)a3
{
  self->_passcodeType = a3;
}

- (void)setIsLoginUser:(BOOL)a3
{
  self->_isLoginUser = a3;
}

- (void)setIsAuditor:(BOOL)a3
{
  self->_isAuditor = a3;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (void)setIsTransientUser:(BOOL)a3
{
  self->_isTransientUser = a3;
}

- (void)setIsPrimaryUser:(BOOL)a3
{
  self->_isPrimaryUser = a3;
}

- (void)setIsAdminUser:(BOOL)a3
{
  self->_isAdminUser = a3;
}

- (void)setPasscodeLockGracePeriod:(unint64_t)a3
{
  self->_passcodeLockGracePeriod = a3;
}

- (void)setLanguages:(id)a3
{
}

- (void)setHasManagedCredentials:(BOOL)a3
{
  self->_hasManagedCredentials = a3;
}

- (void)setDataQuota:(unint64_t)a3
{
  self->_dataQuota = a3;
}

- (void)setDataUsed:(unint64_t)a3
{
  self->_dataUsed = a3;
}

- (void)setHasDataToSync:(BOOL)a3
{
  self->_hasDataToSync = a3;
}

- (void)setErrorCausingLogout:(id)a3
{
}

- (id)_photo
{
  return self->__photo;
}

- (void)set_photo:(id)a3
{
}

- (BOOL)shouldFetchAttributes
{
  return self->_shouldFetchAttributes;
}

- (void)setShouldFetchAttributes:(BOOL)a3
{
  self->_shouldFetchAttributes = a3;
}

- (void)setFirstLoginStartDate:(id)a3
{
}

- (void)setFirstLoginEndDate:(id)a3
{
}

- (void)setLastCachedLoginStartDate:(id)a3
{
}

- (void)setLastCachedLoginEndDate:(id)a3
{
}

- (void)setLastLogoutStartDate:(id)a3
{
}

- (void)setLastLogoutEndDate:(id)a3
{
}

- (void)setDebugErrorCausingLogout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugErrorCausingLogout, 0);
  objc_storeStrong((id *)&self->_lastLogoutEndDate, 0);
  objc_storeStrong((id *)&self->_lastLogoutStartDate, 0);
  objc_storeStrong((id *)&self->_lastCachedLoginEndDate, 0);
  objc_storeStrong((id *)&self->_lastCachedLoginStartDate, 0);
  objc_storeStrong((id *)&self->_firstLoginEndDate, 0);
  objc_storeStrong((id *)&self->_firstLoginStartDate, 0);
  objc_storeStrong(&self->__photo, 0);
  objc_storeStrong((id *)&self->_errorCausingLogout, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_lastRemoteAuthDate, 0);
  objc_storeStrong((id *)&self->_lastLoginDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_userAuxiliaryString, 0);
  objc_storeStrong((id *)&self->_photoURL, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_homeDirectoryURL, 0);
  objc_storeStrong((id *)&self->_alternateDSID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end