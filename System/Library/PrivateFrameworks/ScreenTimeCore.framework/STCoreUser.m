@interface STCoreUser
+ (id)fetchLocalUserInContext:(id)a3 error:(id *)a4;
+ (id)fetchRequest;
+ (id)fetchRequestForFamilyMembers;
+ (id)fetchRequestForUsersWithDSID:(id)a3;
+ (id)fetchRequestMatchingAppleID:(id)a3;
+ (id)fetchRequestMatchingLocalUser;
+ (id)fetchRequestMatchingUmanagedRemoteAdults;
+ (id)fetchUserWithAppleID:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchUserWithDSID:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)keyPathsForValuesAffectingAllLimitsEnabled;
+ (id)keyPathsForValuesAffectingAppAndWebsiteActivityEnabled;
+ (id)keyPathsForValuesAffectingCanSetUpFamily;
+ (id)keyPathsForValuesAffectingCommunicationPolicy;
+ (id)keyPathsForValuesAffectingCommunicationWhileLimitedPolicy;
+ (id)keyPathsForValuesAffectingContactManagementState;
+ (id)keyPathsForValuesAffectingContentPrivacySiriImageGenerationRestriction;
+ (id)keyPathsForValuesAffectingDefaultUserPolicies;
+ (id)keyPathsForValuesAffectingEffectivePasscode;
+ (id)keyPathsForValuesAffectingEffectiveRecoveryAltDSID;
+ (id)keyPathsForValuesAffectingIsCommunicationSafetyAnalyticsEnabled;
+ (id)keyPathsForValuesAffectingIsCommunicationSafetyNotificationEnabled;
+ (id)keyPathsForValuesAffectingIsCommunicationSafetyReceivingRestricted;
+ (id)keyPathsForValuesAffectingIsCommunicationSafetySendingRestricted;
+ (id)keyPathsForValuesAffectingIsEyeReliefEnabled;
+ (id)keyPathsForValuesAffectingLocalizedFullName;
+ (id)keyPathsForValuesAffectingManaged;
+ (id)keyPathsForValuesAffectingManaging;
+ (id)keyPathsForValuesAffectingManagingOrganization;
+ (id)keyPathsForValuesAffectingNeedsToSetPasscode;
+ (id)keyPathsForValuesAffectingObservableAllLimitsEnabled;
+ (id)keyPathsForValuesAffectingObservableCanSetUpFamily;
+ (id)keyPathsForValuesAffectingObservableCommunicationSafetyAnalyticsEnabled;
+ (id)keyPathsForValuesAffectingObservableCommunicationSafetyNotificationEnabled;
+ (id)keyPathsForValuesAffectingObservableCommunicationSafetyReceivingRestricted;
+ (id)keyPathsForValuesAffectingObservableCommunicationSafetySendingRestricted;
+ (id)keyPathsForValuesAffectingObservableManagementEnabled;
+ (id)keyPathsForValuesAffectingObservableScreenTimeEnabled;
+ (id)keyPathsForValuesAffectingObservableShareWebUsage;
+ (id)keyPathsForValuesAffectingObservableSyncingEnabled;
+ (id)keyPathsForValuesAffectingScreenTimeEnabled;
+ (id)keyPathsForValuesAffectingShareWebUsage;
+ (id)keyPathsForValuesAffectingSyncingEnabled;
+ (id)localizedFullNameForAppleID:(id)a3 givenName:(id)a4 familyName:(id)a5 systemFullUserName:(id)a6;
- (BOOL)_validateAltDSID:(id)a3;
- (BOOL)_validateAppleID:(id)a3;
- (BOOL)_validateDSID:(id)a3;
- (BOOL)_validateLocalUser:(id)a3;
- (BOOL)_validateNumberOfLocalUsers:(id)a3;
- (BOOL)_validateRemoteUser:(id)a3;
- (BOOL)allLimitsEnabled;
- (BOOL)canSetUpFamily;
- (BOOL)contactsEditable;
- (BOOL)isCommunicationSafetyAnalyticsEnabled;
- (BOOL)isCommunicationSafetyNotificationEnabled;
- (BOOL)isCommunicationSafetyReceivingRestricted;
- (BOOL)isCommunicationSafetySendingRestricted;
- (BOOL)isEyeReliefEnabled;
- (BOOL)isManaged;
- (BOOL)isManaging;
- (BOOL)needsToSetPasscode;
- (BOOL)observableAllLimitsEnabled;
- (BOOL)observableCanSetUpFamily;
- (BOOL)observableCommunicationSafetyAnalyticsEnabled;
- (BOOL)observableCommunicationSafetyNotificationEnabled;
- (BOOL)observableCommunicationSafetyReceivingRestricted;
- (BOOL)observableCommunicationSafetySendingRestricted;
- (BOOL)observableManagementEnabled;
- (BOOL)observableScreenTimeEnabled;
- (BOOL)observableShareWebUsage;
- (BOOL)observableSyncingEnabled;
- (BOOL)screenTimeEnabled;
- (BOOL)shareWebUsage;
- (BOOL)syncingEnabled;
- (BOOL)unmodeledParticipatesInSharedLedger;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSNumber)isAppAndWebsiteActivityEnabled;
- (NSString)alwaysAllowActivationIdentifier;
- (NSString)alwaysAllowConfigurationIdentifier;
- (NSString)automaticDateTimeConfigurationIdentifier;
- (NSString)contentPrivacyActivationIdentifier;
- (NSString)effectivePasscode;
- (NSString)effectiveRecoveryAltDSID;
- (NSString)iCloudLogoutConfigurationIdentifier;
- (NSString)localizedFullName;
- (NSString)managedUserActivationIdentifier;
- (NSString)organizationIdentifier;
- (STCoreOrganization)managingOrganization;
- (STCoreOrganizationSettings)unmodeledManagingOrganizationSettings;
- (STCoreUser)initWithFamilyMemberType:(id)a3 context:(id)a4;
- (id)_contactStoreForUser;
- (id)_primaryContainerInContactStore:(id)a3 withError:(id *)a4;
- (id)contentPrivacyConfigurationIdentifierForType:(id)a3;
- (int64_t)communicationPolicy;
- (int64_t)communicationWhileLimitedPolicy;
- (int64_t)contactManagementState;
- (int64_t)contentPrivacySiriImageGenerationRestriction;
- (int64_t)defaultUserPolicies;
- (void)_contactStoreForUser;
- (void)didChangeValueForKey:(id)a3;
- (void)notifyServerOfScreenTimeEnabled:(BOOL)a3;
- (void)resetPasscode;
- (void)setAllLimitsEnabled:(BOOL)a3;
- (void)setCommunicationPolicy:(int64_t)a3;
- (void)setCommunicationWhileLimitedPolicy:(int64_t)a3;
- (void)setContactManagementState:(int64_t)a3;
- (void)setContactsEditable:(BOOL)a3;
- (void)setContentPrivacySiriImageGenerationRestriction:(int64_t)a3;
- (void)setDefaultUserPolicies:(int64_t)a3;
- (void)setEffectivePasscode:(id)a3;
- (void)setEffectiveRecoveryAltDSID:(id)a3;
- (void)setIsCommunicationSafetyAnalyticsEnabled:(BOOL)a3;
- (void)setIsCommunicationSafetyNotificationEnabled:(BOOL)a3;
- (void)setIsCommunicationSafetyReceivingRestricted:(BOOL)a3;
- (void)setIsCommunicationSafetySendingRestricted:(BOOL)a3;
- (void)setIsEyeReliefEnabled:(BOOL)a3;
- (void)setManaged:(BOOL)a3;
- (void)setObservableAllLimitsEnabled:(BOOL)a3;
- (void)setObservableCommunicationSafetyAnalyticsEnabled:(BOOL)a3;
- (void)setObservableCommunicationSafetyNotificationEnabled:(BOOL)a3;
- (void)setObservableCommunicationSafetyReceivingRestricted:(BOOL)a3;
- (void)setObservableCommunicationSafetySendingRestricted:(BOOL)a3;
- (void)setObservableManagementEnabled:(BOOL)a3;
- (void)setObservableScreenTimeEnabled:(BOOL)a3;
- (void)setObservableShareWebUsage:(BOOL)a3;
- (void)setObservableSyncingEnabled:(BOOL)a3;
- (void)setScreenTimeEnabled:(BOOL)a3;
- (void)setShareWebUsage:(BOOL)a3;
- (void)setSyncingEnabled:(BOOL)a3;
- (void)updateWithDescription:(id)a3;
@end

@implementation STCoreUser

- (BOOL)isCommunicationSafetyAnalyticsEnabled
{
  v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  char v3 = [v2 isCommunicationSafetyAnalyticsEnabled];

  return v3;
}

- (int64_t)communicationPolicy
{
  v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  char v3 = v2;
  if (v2) {
    int64_t v4 = [v2 communicationPolicy];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSString)effectivePasscode
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  char v3 = +[STLog screentime];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    v5 = [v2 passcode];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    BOOL v11 = v5 != 0;
    _os_log_impl(&dword_1DA519000, v3, OS_LOG_TYPE_INFO, "The effective passcode is from %{public}@ and is set %d", (uint8_t *)&v8, 0x12u);
  }
  v6 = [v2 passcode];

  return (NSString *)v6;
}

- (int64_t)communicationWhileLimitedPolicy
{
  v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  char v3 = v2;
  if (v2) {
    int64_t v4 = [v2 communicationWhileLimitedPolicy];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isCommunicationSafetySendingRestricted
{
  v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  char v3 = [v2 isCommunicationSafetySendingRestricted];

  return v3;
}

+ (id)fetchLocalUserInContext:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 fetchRequestMatchingLocalUser];
  int v8 = [v6 executeFetchRequest:v7 error:a4];

  if (!v8) {
    goto LABEL_6;
  }
  if ((unint64_t)[v8 count] < 2)
  {
    v16 = [v8 firstObject];
    id v14 = v16;
    if (v16)
    {
      id v14 = v16;
      v15 = v14;
    }
    else
    {
      if (a4)
      {
        v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F28568];
        uint64_t v26 = *MEMORY[0x1E4F28568];
        v27 = @"There must be at least one local user object.";
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        v20 = [v17 errorWithDomain:@"STErrorDomain" code:10 userInfo:v19];

        if (v20)
        {
          v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v24 = v18;
          v25 = @"There must be at least one local user object.";
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          *a4 = [v21 errorWithDomain:@"STErrorDomain" code:10 userInfo:v22];
        }
      }
      v15 = 0;
    }
    goto LABEL_13;
  }
  if (!a4) {
    goto LABEL_6;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  uint64_t v30 = *MEMORY[0x1E4F28568];
  v31[0] = @"There must be one and only one local user object.";
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  uint64_t v12 = [v9 errorWithDomain:@"STErrorDomain" code:508 userInfo:v11];

  if (!v12)
  {
LABEL_6:
    v15 = 0;
    goto LABEL_14;
  }
  v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v28 = v10;
  v29 = @"There must be one and only one local user object.";
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  [v13 errorWithDomain:@"STErrorDomain" code:508 userInfo:v14];
  v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
  return v15;
}

+ (id)fetchRequestMatchingLocalUser
{
  v2 = [a1 fetchRequest];
  char v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"localUserDeviceState");
  [v2 setPredicate:v3];

  return v2;
}

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STCoreUser;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

- (BOOL)isCommunicationSafetyNotificationEnabled
{
  v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  char v3 = [v2 isCommunicationSafetyNotificationEnabled];

  return v3;
}

- (STCoreOrganizationSettings)unmodeledManagingOrganizationSettings
{
  if (!_os_feature_enabled_impl())
  {
    int v8 = [(STCoreUser *)self localSettings];
    uint64_t v9 = [(STCoreUser *)self familySettings];
    uint64_t v10 = [(STCoreUser *)self cloudSettings];
    if ([v9 isManaged])
    {
      id v11 = v9;
      goto LABEL_12;
    }
    if (v10)
    {
      id v11 = v10;
      goto LABEL_12;
    }
    if (_os_feature_enabled_impl())
    {
      v13 = [MEMORY[0x1E4F74230] sharedConnection];
      int v14 = [v13 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FD0]];

      if (v14 == 2)
      {
        id v7 = 0;
        goto LABEL_13;
      }
      id v11 = v8;
LABEL_12:
      id v7 = v11;
LABEL_13:

      goto LABEL_15;
    }
    v15 = [(STCoreUser *)self managedObjectContext];
    id v19 = 0;
    v16 = +[STScreenTimeSettings fetchScreenTimeSettingsInContext:v15 error:&v19];
    id v17 = v19;

    if (v16)
    {
      if ([v16 screenTimeEnabled])
      {
        id v7 = v8;
LABEL_29:

        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v18 = +[STLog screentime];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[STCoreUser(UnmodeledInternal) unmodeledManagingOrganizationSettings]();
      }
    }
    id v7 = 0;
    goto LABEL_29;
  }
  char v3 = [(STCoreUser *)self localUserDeviceState];

  if (v3)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__6;
    v25 = __Block_byref_object_dispose__6;
    id v26 = 0;
    objc_super v4 = [(STCoreUser *)self managedObjectContext];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__STCoreUser_UnmodeledInternal__unmodeledManagingOrganizationSettings__block_invoke;
    v20[3] = &unk_1E6BC6EF0;
    v20[4] = self;
    v20[5] = &v21;
    [v4 performBlockAndWait:v20];

    v5 = (void *)v22[5];
    if (!v5)
    {
      id v6 = +[STLog screentime];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser(UnmodeledInternal) unmodeledManagingOrganizationSettings]();
      }

      v5 = (void *)v22[5];
    }
    id v7 = v5;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v7 = [(STCoreUser *)self familySettings];
  }
LABEL_15:
  return (STCoreOrganizationSettings *)v7;
}

- (void).cxx_destruct
{
}

- (BOOL)isCommunicationSafetyReceivingRestricted
{
  v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  char v3 = [v2 isCommunicationSafetyReceivingRestricted];

  return v3;
}

- (STCoreUser)initWithFamilyMemberType:(id)a3 context:(id)a4
{
  id v6 = (NSString *)a3;
  v10.receiver = self;
  v10.super_class = (Class)STCoreUser;
  id v7 = [(STCoreUser *)&v10 initWithContext:a4];
  familyMemberType = v7->_familyMemberType;
  v7->_familyMemberType = v6;

  return v7;
}

- (void)updateWithDescription:(id)a3
{
  id v28 = a3;
  objc_super v4 = [v28 userDSID];
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (v5)
  {
    id v6 = [(STCoreUser *)self dsid];
    id v7 = [v28 userDSID];
    char v8 = [v6 isEqualToNumber:v7];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [v28 userDSID];
      [(STCoreUser *)self setDsid:v9];
    }
    objc_super v10 = [(STCoreUser *)self altDSID];
    id v11 = [v28 userAltDSID];
    char v12 = [v10 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      v13 = [v28 userAltDSID];
      [(STCoreUser *)self setAltDSID:v13];
    }
    int v14 = [(STCoreUser *)self givenName];
    v15 = [v28 givenName];
    char v16 = [v14 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      id v17 = [v28 givenName];
      [(STCoreUser *)self setGivenName:v17];
    }
    uint64_t v18 = [(STCoreUser *)self familyName];
    id v19 = [v28 familyName];
    char v20 = [v18 isEqualToString:v19];

    if ((v20 & 1) == 0)
    {
      uint64_t v21 = [v28 familyName];
      [(STCoreUser *)self setFamilyName:v21];
    }
  }
  else
  {
    v22 = [(STCoreUser *)self givenName];

    if (v22) {
      [(STCoreUser *)self setGivenName:0];
    }
    uint64_t v23 = [(STCoreUser *)self familyName];

    if (v23) {
      [(STCoreUser *)self setFamilyName:0];
    }
    uint64_t v24 = [(STCoreUser *)self familyMemberType];

    if (v24 != @"Unknown") {
      [(STCoreUser *)self setFamilyMemberType:@"Unknown"];
    }
    if ([(STCoreUser *)self isParent]) {
      [(STCoreUser *)self setIsParent:0];
    }
    if ([(STCoreUser *)self isFamilyOrganizer]) {
      [(STCoreUser *)self setIsFamilyOrganizer:0];
    }
    v25 = [(STCoreUser *)self dsid];
    char v26 = [v25 isEqualToNumber:&unk_1F349EC50];

    if ((v26 & 1) == 0) {
      [(STCoreUser *)self setDsid:&unk_1F349EC50];
    }
    v27 = [(STCoreUser *)self altDSID];

    if (v27) {
      [(STCoreUser *)self setAltDSID:0];
    }
    if ([(STCoreUser *)self supportsEncryption]) {
      [(STCoreUser *)self setSupportsEncryption:0];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"dsid"])
  {
    uint64_t v5 = [(STCoreUser *)self userDeviceStates];
    [v5 makeObjectsPerformSelector:sel_updateUniqueIdentifier];

    id v6 = [(STCoreUser *)self familySettings];
    [v6 updateUniqueIdentifier];
  }
  v7.receiver = self;
  v7.super_class = (Class)STCoreUser;
  [(STCoreUser *)&v7 didChangeValueForKey:v4];
}

+ (id)fetchUserWithDSID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v6 = +[STCoreUser fetchRequestForUsersWithDSID:](STCoreUser, "fetchRequestForUsersWithDSID:", a3, a4);
  objc_super v7 = [v6 execute:a5];

  if (v7)
  {
    char v8 = [v7 firstObject];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:11 userInfo:0];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)fetchUserWithAppleID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v6 = +[STCoreUser fetchRequestMatchingAppleID:](STCoreUser, "fetchRequestMatchingAppleID:", a3, a4);
  objc_super v7 = [v6 execute:a5];

  if (v7)
  {
    char v8 = [v7 firstObject];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:11 userInfo:0];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)fetchRequestMatchingUmanagedRemoteAdults
{
  v2 = [a1 fetchRequest];
  char v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NULL AND (%K == %@ OR %K == %@) AND (%K == nil OR %K == NO)", @"localUserDeviceState", @"familyMemberType", @"Unknown", @"familyMemberType", @"Adult", @"familySettings", @"familySettings.isManaged"];
  [v2 setPredicate:v3];

  return v2;
}

+ (id)fetchRequestForUsersWithDSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 fetchRequest];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"dsid", v4];

  [v5 setPredicate:v6];
  return v5;
}

+ (id)fetchRequestForFamilyMembers
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 fetchRequest];
  char v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"familySettings");
  [v2 setPredicate:v3];

  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dsid" ascending:1];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v2 setSortDescriptors:v5];

  return v2;
}

+ (id)fetchRequestMatchingAppleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 fetchRequest];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"appleID", v4];

  [v5 setPredicate:v6];
  return v5;
}

- (void)notifyServerOfScreenTimeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[STLog persistence];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Notify server of Screen Time state change", buf, 2u);
  }

  id v6 = objc_alloc(MEMORY[0x1E4F61868]);
  objc_super v7 = [(STCoreUser *)self dsid];
  char v8 = (void *)[v6 initWithFamilyMemberDSID:v7 flag:*MEMORY[0x1E4F61838] enabled:v3];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__STCoreUser_notifyServerOfScreenTimeEnabled___block_invoke;
  v10[3] = &unk_1E6BC7850;
  id v11 = v8;
  id v9 = v8;
  [v9 startRequestWithCompletionHandler:v10];
}

void __46__STCoreUser_notifyServerOfScreenTimeEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = +[STLog persistence];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __46__STCoreUser_notifyServerOfScreenTimeEnabled___block_invoke_cold_1();
    }
  }
}

- (id)_contactStoreForUser
{
  v13[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(STCoreUser *)self localUserDeviceState];

  if (v3)
  {
    id v4 = objc_opt_new();
  }
  else
  {
    uint64_t v5 = [(STCoreUser *)self altDSID];
    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F61850]);
      v12[0] = @"member-first-name";
      objc_super v7 = [(STCoreUser *)self givenName];
      v13[0] = v7;
      v12[1] = @"member-dsid";
      char v8 = [(STCoreUser *)self dsid];
      v12[2] = @"member-altDSID";
      v13[1] = v8;
      v13[2] = v5;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
      id v10 = [v6 initWithDictionaryRepresentation:v9];

      id v4 = [MEMORY[0x1E4F1B980] storeForFamilyMember:v10];
    }
    else
    {
      id v10 = +[STLog persistence];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[STCoreUser _contactStoreForUser]();
      }
      id v4 = 0;
    }
  }
  return v4;
}

- (id)_primaryContainerInContactStore:(id)a3 withError:(id *)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = [(STCoreUser *)self localUserDeviceState];

  if (v7)
  {
    char v8 = objc_opt_new();
    id v9 = [v8 aa_primaryAppleAccount];
    if (v9)
    {
      id v10 = v9;
      id v11 = [v9 childCardDAVAccountIdentifier];
      if (v11)
      {
        uint64_t v12 = [MEMORY[0x1E4F1B9B0] predicateForContainersInAccountWithExternalIdentifier:v11];

        char v8 = v12;
LABEL_7:
        id v17 = [v6 containersMatchingPredicate:v8 error:a4];
        uint64_t v18 = [v17 firstObject];

        goto LABEL_17;
      }
      char v20 = +[STLog persistence];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser _primaryContainerInContactStore:withError:]();
      }
    }
    else
    {
      id v19 = +[STLog persistence];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser _primaryContainerInContactStore:withError:]();
      }
    }
  }
  else
  {
    uint64_t v13 = [v6 defaultContainerIdentifier];
    if (v13)
    {
      int v14 = (void *)v13;
      v15 = (void *)MEMORY[0x1E4F1B9B0];
      v22[0] = v13;
      char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      char v8 = [v15 predicateForContainersWithIdentifiers:v16];

      goto LABEL_7;
    }
    char v8 = +[STLog persistence];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STCoreUser _primaryContainerInContactStore:withError:]();
    }
  }
  uint64_t v18 = 0;
LABEL_17:

  return v18;
}

+ (id)localizedFullNameForAppleID:(id)a3 givenName:(id)a4 familyName:(id)a5 systemFullUserName:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = [v12 length];

  if (v14)
  {
    [v13 setGivenName:v9];
    [v13 setFamilyName:v10];
LABEL_5:
    id v17 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v13 style:0 options:0];
    v15 = v13;
    goto LABEL_6;
  }
  v15 = objc_opt_new();
  uint64_t v16 = [v15 personNameComponentsFromString:v11];

  if (v16)
  {

    uint64_t v13 = (void *)v16;
    goto LABEL_5;
  }
  id v17 = v11;
LABEL_6:

  return v17;
}

- (NSString)localizedFullName
{
  BOOL v3 = [(STCoreUser *)self appleID];
  id v4 = [(STCoreUser *)self givenName];
  uint64_t v5 = [(STCoreUser *)self familyName];
  id v6 = NSFullUserName();
  objc_super v7 = +[STCoreUser localizedFullNameForAppleID:v3 givenName:v4 familyName:v5 systemFullUserName:v6];

  return (NSString *)v7;
}

+ (id)keyPathsForValuesAffectingLocalizedFullName
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"givenName", @"familyName", @"appleID", 0);
}

+ (id)keyPathsForValuesAffectingScreenTimeEnabled
{
  if (_os_feature_enabled_impl()) {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"localUserDeviceState", @"familySettings.isAppAndWebsiteActivityEnabled", @"familySettings.isManaged", 0);
  }
  else {
  id v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"localUserDeviceState", @"familySettings.isManaged", 0, v4);
  }
  return v2;
}

- (BOOL)screenTimeEnabled
{
  if (_os_feature_enabled_impl())
  {
    BOOL v3 = objc_opt_new();
    uint64_t v4 = [(STCoreUser *)self localUserDeviceState];

    if (v4)
    {
      id v22 = 0;
      uint64_t v5 = [v3 isScreenTimeEnabledForLocalUserWithError:&v22];
      id v6 = v22;
      char v7 = v5 != 0;
    }
    else
    {
      uint64_t v5 = [(STCoreUser *)self dsid];
      id v23 = 0;
      char v7 = [v3 isScreenTimeEnabledForRemoteUserWithDSID:v5 error:&v23];
      id v6 = v23;
    }

    if (v6)
    {
      id v12 = +[STLog persistence];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser(UnmodeledProperties) screenTimeEnabled]();
      }
    }
  }
  else
  {
    char v8 = [(STCoreUser *)self localUserDeviceState];

    if (v8)
    {
      id v9 = [(STCoreUser *)self managedObjectContext];
      id v21 = 0;
      id v10 = +[STScreenTimeSettings fetchScreenTimeSettingsInContext:v9 error:&v21];
      id v11 = v21;

      if (v10)
      {
        char v7 = [v10 screenTimeEnabled];
      }
      else
      {
        char v20 = +[STLog persistence];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          -[STCoreUser(UnmodeledProperties) screenTimeEnabled]();
        }

        char v7 = 0;
      }

      return v7;
    }
    int v13 = _os_feature_enabled_impl();
    uint64_t v14 = [(STCoreUser *)self familySettings];
    BOOL v3 = v14;
    if (v13)
    {
      v15 = [v14 isAppAndWebsiteActivityEnabled];

      uint64_t v16 = [(STCoreUser *)self familySettings];
      BOOL v3 = v16;
      if (v15)
      {
        id v17 = [v16 isAppAndWebsiteActivityEnabled];
        char v18 = [v17 BOOLValue];

        return v18;
      }
    }
    char v7 = [v3 isManaged];
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingAppAndWebsiteActivityEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"familySettings.isAppAndWebsiteActivityEnabled", @"cloudSettings.isAppAndWebsiteActivityEnabled", 0);
}

- (NSNumber)isAppAndWebsiteActivityEnabled
{
  if (_os_feature_enabled_impl())
  {
    BOOL v3 = objc_opt_new();
    uint64_t v4 = [(STCoreUser *)self localUserDeviceState];

    if (v4)
    {
      uint64_t v5 = [(STCoreUser *)self dsid];
      id v14 = 0;
      uint64_t v6 = [v3 isScreenTimeEnabledForRemoteUserWithDSID:v5 error:&v14];
      id v7 = v14;
    }
    else
    {
      id v15 = 0;
      uint64_t v5 = [v3 isScreenTimeEnabledForLocalUserWithError:&v15];
      id v7 = v15;
      uint64_t v6 = v5 != 0;
    }

    if (v7)
    {
      id v12 = +[STLog persistence];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser(UnmodeledProperties) screenTimeEnabled]();
      }
    }
    id v11 = [NSNumber numberWithBool:v6];
  }
  else
  {
    BOOL v3 = [(STCoreUser *)self familySettings];
    char v8 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];

    if (v8 == v3)
    {
      id v11 = [v3 isAppAndWebsiteActivityEnabled];
    }
    else
    {
      id v9 = [(STCoreUser *)self cloudSettings];
      id v10 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];

      if (v10 == v9)
      {
        id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isAppAndWebsiteActivityEnabled"));
      }
      else
      {
        id v11 = 0;
      }
    }
  }

  return (NSNumber *)v11;
}

+ (id)keyPathsForValuesAffectingSyncingEnabled
{
  if (_os_feature_enabled_impl())
  {
    id v2 = objc_opt_new();
  }
  else
  {
    id v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"screenTimeEnabled"];
  }
  return v2;
}

- (BOOL)syncingEnabled
{
  BOOL v3 = [(STCoreUser *)self localUserDeviceState];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(STCoreUser *)self managedObjectContext];
  id v10 = 0;
  uint64_t v5 = +[STScreenTimeSettings fetchScreenTimeSettingsInContext:v4 error:&v10];
  id v6 = v10;

  if (v5)
  {
    char v7 = [v5 cloudSyncEnabled];
  }
  else
  {
    char v8 = +[STLog persistence];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[STCoreUser(UnmodeledProperties) screenTimeEnabled]();
    }

    char v7 = 0;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingCanSetUpFamily
{
  if (_os_feature_enabled_impl()) {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"localUserDeviceState", @"dsid", @"familyMemberType", 0, v4);
  }
  else {
  id v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"screenTimeEnabled", @"localUserDeviceState", @"dsid", @"familyMemberType", 0);
  }
  return v2;
}

- (BOOL)canSetUpFamily
{
  BOOL v3 = [(STCoreUser *)self localUserDeviceState];

  if (_os_feature_enabled_impl())
  {
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
    if (![(STCoreUser *)self screenTimeEnabled] || !v3) {
      return (char)v4;
    }
  }
  uint64_t v4 = [(STCoreUser *)self dsid];
  if (v4)
  {
    uint64_t v5 = [(STCoreUser *)self dsid];
    char v6 = [v5 isEqualToNumber:&unk_1F349EC50];

    if (v6)
    {
LABEL_8:
      LOBYTE(v4) = 0;
      return (char)v4;
    }
    char v7 = [(STCoreUser *)self familyMemberType];
    if (([v7 isEqualToString:@"Adult"] & 1) != 0
      || ([v7 isEqualToString:@"Teen"] & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      LODWORD(v4) = [v7 isEqualToString:@"Child"] ^ 1;
    }
  }
  return (char)v4;
}

+ (id)keyPathsForValuesAffectingAllLimitsEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.allLimitsEnabled", @"cloudSettings.allLimitsEnabled", @"familySettings.allLimitsEnabled", 0);
}

- (BOOL)allLimitsEnabled
{
  id v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  char v3 = [v2 allLimitsEnabled];

  return v3;
}

+ (id)keyPathsForValuesAffectingDefaultUserPolicies
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"localSettings.defaultUserPolicies", @"cloudSettings.defaultUserPolicies", @"familySettings.defaultUserPolicies", 0);
}

- (int64_t)defaultUserPolicies
{
  id v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  int64_t v3 = [v2 defaultUserPolicies];

  return v3;
}

+ (id)keyPathsForValuesAffectingManagingOrganization
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"cloudSettings", @"familySettings", @"isManaged", @"localSettings", 0);
}

- (STCoreOrganization)managingOrganization
{
  int64_t v3 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  uint64_t v4 = [(STCoreUser *)self localSettings];

  if (v3 == v4)
  {
    char v8 = [(STCoreUser *)self localSettings];
  }
  else
  {
    uint64_t v5 = [(STCoreUser *)self cloudSettings];

    if (v3 == v5)
    {
      char v8 = [(STCoreUser *)self cloudSettings];
    }
    else
    {
      char v6 = [(STCoreUser *)self familySettings];

      if (v3 != v6)
      {
        char v7 = 0;
        goto LABEL_9;
      }
      char v8 = [(STCoreUser *)self familySettings];
    }
  }
  id v9 = v8;
  char v7 = [v8 organization];

LABEL_9:
  return (STCoreOrganization *)v7;
}

+ (id)keyPathsForValuesAffectingManaged
{
  if (_os_feature_enabled_impl()) {
    [MEMORY[0x1E4F1CAD0] setWithObject:@"familySettings.isManaged"];
  }
  else {
  id v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"screenTimeEnabled", @"familySettings.isManaged", 0);
  }
  return v2;
}

- (BOOL)isManaged
{
  int64_t v3 = [(STCoreUser *)self familySettings];
  uint64_t v4 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];

  if (v4 == v3) {
    char v5 = [v3 isManaged];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingManaging
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"isParent", @"familySettings.organization.settings", 0);
}

- (BOOL)isManaging
{
  int64_t v3 = [(STCoreUser *)self familySettings];
  int v4 = [(STCoreUser *)self isParent];
  char v5 = 0;
  if (v4 && v3)
  {
    char v6 = [v3 organization];
    char v7 = [v6 valueForKeyPath:@"settings.isManaged"];
    char v5 = [v7 containsObject:MEMORY[0x1E4F1CC38]];
  }
  return v5;
}

+ (id)keyPathsForValuesAffectingEffectivePasscode
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.passcode", @"cloudSettings.passcode", @"familySettings.passcode", 0);
}

+ (id)keyPathsForValuesAffectingEffectiveRecoveryAltDSID
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.recoveryAltDSID", @"cloudSettings.recoveryAltDSID", 0);
}

- (NSString)effectiveRecoveryAltDSID
{
  int64_t v3 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  int v4 = [(STCoreUser *)self localSettings];
  uint64_t v5 = [(STCoreUser *)self cloudSettings];
  char v6 = (void *)v5;
  if (v3 == v4 || v3 == (void *)v5)
  {
    char v7 = [v3 recoveryAltDSID];
  }
  else
  {
    char v7 = 0;
  }

  return (NSString *)v7;
}

+ (id)keyPathsForValuesAffectingNeedsToSetPasscode
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.needsToSetPasscode", 0);
}

- (BOOL)needsToSetPasscode
{
  id v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  char v3 = [v2 needsToSetPasscode];

  return v3;
}

+ (id)keyPathsForValuesAffectingShareWebUsage
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"familySettings.shareWebUsage", 0);
}

- (BOOL)shareWebUsage
{
  char v3 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  int v4 = [(STCoreUser *)self familySettings];
  if (v3 == v4) {
    char v5 = [v3 shareWebUsage];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (NSString)organizationIdentifier
{
  char v3 = [(STCoreUser *)self localUserDeviceState];
  int v4 = &STOrganizationIdentifierFamily;
  if (v3 && ![(STCoreUser *)self isManaged]) {
    int v4 = STOrganizationIdentifierPersonal;
  }
  char v5 = *v4;

  return v5;
}

+ (id)keyPathsForValuesAffectingCommunicationPolicy
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.communicationPolicy", @"cloudSettings.communicationPolicy", @"familySettings.communicationPolicy", 0);
}

+ (id)keyPathsForValuesAffectingCommunicationWhileLimitedPolicy
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.communicationWhileLimitedPolicy", @"cloudSettings.communicationWhileLimitedPolicy", @"familySettings.communicationWhileLimitedPolicy", 0);
}

- (BOOL)contactsEditable
{
  char v3 = [(STCoreUser *)self _contactStoreForUser];
  if (v3)
  {
    id v8 = 0;
    int v4 = [(STCoreUser *)self _primaryContainerInContactStore:v3 withError:&v8];
    id v5 = v8;
    if (v4)
    {
      LODWORD(v6) = [v4 isGuardianRestricted] ^ 1;
    }
    else
    {
      char v6 = +[STLog persistence];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser(UnmodeledProperties) contactsEditable]();
      }

      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return (char)v6;
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetySendingRestricted
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.isCommunicationSafetySendingRestricted", @"cloudSettings.isCommunicationSafetySendingRestricted", @"familySettings.isCommunicationSafetySendingRestricted", @"defaultUserPolicies", 0);
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetyReceivingRestricted
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.isCommunicationSafetyReceivingRestricted", @"cloudSettings.isCommunicationSafetyReceivingRestricted", @"familySettings.isCommunicationSafetyReceivingRestricted", 0);
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetyNotificationEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.isCommunicationSafetyNotificationEnabled", @"cloudSettings.isCommunicationSafetyNotificationEnabled", @"familySettings.isCommunicationSafetyNotificationEnabled", 0);
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetyAnalyticsEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.isCommunicationSafetyAnalyticsEnabled", @"cloudSettings.isCommunicationSafetyAnalyticsEnabled", @"familySettings.isCommunicationSafetyAnalyticsEnabled", 0);
}

+ (id)keyPathsForValuesAffectingIsEyeReliefEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.isEyeReliefEnabled", @"cloudSettings.isEyeReliefEnabled", @"familySettings.isEyeReliefEnabled", 0);
}

- (BOOL)isEyeReliefEnabled
{
  id v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  char v3 = [v2 isEyeReliefEnabled];

  return v3;
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!_os_feature_enabled_impl())
  {
    if (v3 || (_os_feature_enabled_impl() & 1) != 0)
    {
      id v5 = 0;
    }
    else
    {
      id v24 = 0;
      BOOL v10 = +[STBlueprint deleteManagedUserBlueprintForUser:self error:&v24];
      id v5 = v24;
      if (!v10)
      {
        id v11 = +[STLog persistence];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[STCoreUser(UnmodeledInternal) setScreenTimeEnabled:]();
        }
      }
      [(STCoreUser *)self setContactsEditable:1];
    }
    id v12 = [(STCoreUser *)self localUserDeviceState];

    if (!v12)
    {
      if (_os_feature_enabled_impl())
      {
        id v15 = [NSNumber numberWithBool:v3];
        uint64_t v16 = [(STCoreUser *)self familySettings];
        [v16 setIsAppAndWebsiteActivityEnabled:v15];
      }
      else
      {
        id v15 = [(STCoreUser *)self familySettings];
        [v15 setIsManaged:v3];
      }

      id v7 = [(STCoreUser *)self familySettings];
      [v7 setIsDirty:1];
      goto LABEL_35;
    }
    int v13 = [(STCoreUser *)self managedObjectContext];
    id v23 = v5;
    id v7 = +[STScreenTimeSettings fetchScreenTimeSettingsInContext:v13 error:&v23];
    id v14 = v23;

    if (v7)
    {
      [v7 setScreenTimeEnabled:v3];
    }
    else
    {
      id v17 = +[STLog persistence];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[STCoreUser(UnmodeledInternal) setScreenTimeEnabled:]();
      }
    }
    if (!_os_feature_enabled_impl())
    {
LABEL_34:
      id v5 = v14;
      goto LABEL_35;
    }
    char v18 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
    id v19 = [(STCoreUser *)self cloudSettings];
    if ([(STCoreUser *)self isManaged])
    {
      char v20 = [NSNumber numberWithBool:v3];
      id v21 = [(STCoreUser *)self familySettings];
      [v21 setIsAppAndWebsiteActivityEnabled:v20];

      id v22 = [(STCoreUser *)self familySettings];
      [v22 setIsDirty:1];
    }
    else
    {
      if (v18 != v19)
      {
LABEL_33:

        goto LABEL_34;
      }
      id v22 = [(STCoreUser *)self cloudSettings];
      [v22 setIsAppAndWebsiteActivityEnabled:v3];
    }

    goto LABEL_33;
  }
  id v5 = (id)objc_opt_new();
  char v6 = [(STCoreUser *)self localUserDeviceState];

  if (v6)
  {
    id v25 = 0;
    [v5 setScreenTimeEnabledForLocalUser:v3 error:&v25];
    id v7 = v25;
    if (!v7) {
      goto LABEL_35;
    }
  }
  else
  {
    id v8 = [(STCoreUser *)self dsid];
    id v26 = 0;
    [v5 setScreenTimeEnabledForRemoteUserWithDSID:v8 enabled:v3 error:&v26];
    id v7 = v26;

    if (!v7) {
      goto LABEL_35;
    }
  }
  id v9 = +[STLog persistence];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[STCoreUser(UnmodeledInternal) setScreenTimeEnabled:]();
  }

LABEL_35:
}

- (void)setManaged:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    [(STCoreUser *)self setScreenTimeEnabled:0];
    id v10 = 0;
    BOOL v5 = +[STBlueprint deleteManagedUserBlueprintForUser:self error:&v10];
    id v6 = v10;
    if (!v5)
    {
      id v7 = +[STLog persistence];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser(UnmodeledInternal) setScreenTimeEnabled:]();
      }
    }
    [(STCoreUser *)self setContactsEditable:1];
  }
  id v8 = [(STCoreUser *)self familySettings];
  [v8 setIsManaged:v3];

  id v9 = [(STCoreUser *)self familySettings];
  [v9 setIsDirty:1];
}

- (void)setSyncingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(STCoreUser *)self localUserDeviceState];

  if (v5)
  {
    id v6 = [(STCoreUser *)self managedObjectContext];
    id v10 = 0;
    id v7 = +[STScreenTimeSettings fetchScreenTimeSettingsInContext:v6 error:&v10];
    id v8 = v10;

    if (v7)
    {
      [v7 setCloudSyncEnabled:v3];
    }
    else
    {
      id v9 = +[STLog persistence];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[STCoreUser(UnmodeledInternal) setScreenTimeEnabled:]();
      }
    }
  }
}

- (void)setAllLimitsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setAllLimitsEnabled:v3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

- (void)setDefaultUserPolicies:(int64_t)a3
{
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setDefaultUserPolicies:a3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

- (void)setShareWebUsage:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(STCoreUser *)self familySettings];
  [v4 setShareWebUsage:v3];
  [v4 setIsDirty:1];
}

- (void)setEffectivePasscode:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  id v6 = +[STLog screentime];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 1024;
    BOOL v11 = v4 != 0;
    _os_log_impl(&dword_1DA519000, v6, OS_LOG_TYPE_DEFAULT, "The effective passcode is from %{public}@ and is being set %d", (uint8_t *)&v8, 0x12u);
  }

  [v5 setPasscode:v4];
  id v7 = [(STCoreUser *)self familySettings];
  if (v5 == v7) {
    [v5 setIsDirty:1];
  }
}

- (void)setEffectiveRecoveryAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  id v6 = [(STCoreUser *)self localSettings];
  uint64_t v7 = [(STCoreUser *)self cloudSettings];
  int v8 = (void *)v7;
  if (v5 == v6 || v5 == (void *)v7)
  {
    [v5 setRecoveryAltDSID:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[STCoreUser(UnmodeledInternal) setEffectiveRecoveryAltDSID:]();
  }
}

- (void)setCommunicationPolicy:(int64_t)a3
{
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setCommunicationPolicy:a3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

- (void)setCommunicationWhileLimitedPolicy:(int64_t)a3
{
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setCommunicationWhileLimitedPolicy:a3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

+ (id)keyPathsForValuesAffectingContactManagementState
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.contactManagementState", @"cloudSettings.contactManagementState", @"familySettings.contactManagementState", 0);
}

- (int64_t)contactManagementState
{
  id v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = [v2 contactManagementState];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setContactManagementState:(int64_t)a3
{
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setContactManagementState:a3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

+ (id)keyPathsForValuesAffectingContentPrivacySiriImageGenerationRestriction
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"managed", @"localSettings.contentPrivacySiriImageGenerationRestriction", @"cloudSettings.contentPrivacySiriImageGenerationRestriction", @"familySettings.contentPrivacySiriImageGenerationRestriction", 0);
}

- (int64_t)contentPrivacySiriImageGenerationRestriction
{
  id v2 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = [v2 contentPrivacySiriImageGenerationRestriction];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setContentPrivacySiriImageGenerationRestriction:(int64_t)a3
{
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setContentPrivacySiriImageGenerationRestriction:a3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

- (void)setContactsEditable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [(STCoreUser *)self _contactStoreForUser];
  if (v5)
  {
    id v17 = 0;
    id v6 = [(STCoreUser *)self _primaryContainerInContactStore:v5 withError:&v17];
    id v7 = v17;
    int v8 = (void *)[v6 mutableCopy];

    if (v8)
    {
      int v9 = !v3;
      [v8 setGuardianRestricted:!v3];
      __int16 v10 = objc_opt_new();
      [v10 setIgnoresGuardianRestrictions:1];
      [v10 updateContainer:v8];
      id v16 = v7;
      char v11 = [v5 executeSaveRequest:v10 error:&v16];
      id v12 = v16;

      int v13 = +[STLog persistence];
      id v14 = v13;
      if (v11)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v8 identifier];
          *(_DWORD *)buf = 67109378;
          int v19 = v9;
          __int16 v20 = 2114;
          id v21 = v15;
          _os_log_impl(&dword_1DA519000, v14, OS_LOG_TYPE_DEFAULT, "Set guardian restricted to %d on container %{public}@", buf, 0x12u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [(STCoreUser(UnmodeledInternal) *)v3 setContactsEditable:v14];
      }
    }
    else
    {
      __int16 v10 = +[STLog persistence];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser(UnmodeledInternal) setContactsEditable:]();
      }
      id v12 = v7;
    }
  }
}

- (void)setIsCommunicationSafetySendingRestricted:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setIsCommunicationSafetySendingRestricted:v3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

- (void)setIsCommunicationSafetyReceivingRestricted:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setIsCommunicationSafetyReceivingRestricted:v3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

- (void)setIsCommunicationSafetyNotificationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setIsCommunicationSafetyNotificationEnabled:v3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

- (void)setIsCommunicationSafetyAnalyticsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setIsCommunicationSafetyAnalyticsEnabled:v3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

- (void)setIsEyeReliefEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(STCoreUser *)self unmodeledManagingOrganizationSettings];
  [v6 setIsEyeReliefEnabled:v3];
  id v5 = [(STCoreUser *)self familySettings];
  if (v6 == v5) {
    [v6 setIsDirty:1];
  }
}

void __70__STCoreUser_UnmodeledInternal__unmodeledManagingOrganizationSettings__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v24 = 0;
  BOOL v3 = +[STScreenTimeSettings fetchScreenTimeSettingsInContext:v2 error:&v24];
  id v4 = v24;

  if (!v3)
  {
    id v5 = +[STLog screentime];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v4;
      _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "failed to fetch local settings: %{public}@. Current settings will be recalculated", buf, 0xCu);
    }
  }
  id v6 = [v3 currentOrganization];

  if (!v6)
  {
    id v7 = +[STLog screentime];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __70__STCoreUser_UnmodeledInternal__unmodeledManagingOrganizationSettings__block_invoke_cold_1();
    }
  }
  int v8 = [v3 currentOrganization];

  if (!v8)
  {
    uint64_t v12 = [*(id *)(a1 + 32) familySettings];
    if (v12)
    {
      int v13 = (void *)v12;
      id v14 = [*(id *)(a1 + 32) familySettings];
      int v15 = [v14 isManaged];

      if (v15)
      {
        id v16 = +[STLog screentime];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA519000, v16, OS_LOG_TYPE_DEFAULT, "Family settings indicated the user: (localUser, privacy: .public) is managed.", buf, 2u);
        }

        goto LABEL_18;
      }
    }
    int v19 = +[STLog screentime];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA519000, v19, OS_LOG_TYPE_DEFAULT, "The user: (localUser, privacy: .public) is using cloud settings.", buf, 2u);
    }

LABEL_23:
    uint64_t v11 = [*(id *)(a1 + 32) cloudSettings];
    goto LABEL_24;
  }
  int v9 = [v3 currentOrganization];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v11 = [*(id *)(a1 + 32) localSettings];
LABEL_24:
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
    id v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v11;

    goto LABEL_25;
  }
  id v17 = [v3 currentOrganization];
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if (v18)
  {
LABEL_18:
    uint64_t v11 = [*(id *)(a1 + 32) familySettings];
    goto LABEL_24;
  }
  __int16 v20 = [v3 currentOrganization];
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  if (v21) {
    goto LABEL_23;
  }
LABEL_25:
}

- (BOOL)unmodeledParticipatesInSharedLedger
{
  uint64_t v3 = [(STCoreUser *)self familySettings];
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = (void *)v3;
  id v5 = [(STCoreUser *)self familySettings];
  if (([v5 isManaged] & 1) != 0
    || [(STCoreUser *)self isFamilyOrganizer])
  {

    goto LABEL_8;
  }
  char v6 = [(STCoreUser *)self isParent];

  if ((v6 & 1) == 0)
  {
LABEL_7:
    id v4 = [(STCoreUser *)self familyMemberType];
    if (([v4 isEqualToString:@"Child"] & 1) == 0)
    {
      char v7 = [v4 isEqualToString:@"Teen"];
      goto LABEL_10;
    }
LABEL_8:
    char v7 = 1;
LABEL_10:

    return v7;
  }
  return 1;
}

- (NSString)contentPrivacyActivationIdentifier
{
  uint64_t v3 = [(STCoreUser *)self organizationIdentifier];
  if ([v3 isEqualToString:@"personal"])
  {
    id v4 = @"digital_health_restrictions";
  }
  else
  {
    id v5 = NSString;
    char v6 = [(STCoreUser *)self dsid];
    char v7 = [v6 stringValue];
    id v4 = [v5 stringWithFormat:@"%@.%@", @"digital_health_restrictions", v7];
  }
  return (NSString *)v4;
}

- (id)contentPrivacyConfigurationIdentifierForType:(id)a3
{
  id v4 = a3;
  id v5 = [(STCoreUser *)self organizationIdentifier];
  int v6 = [v5 isEqualToString:@"personal"];
  char v7 = NSString;
  if (v6)
  {
    int v8 = [NSString stringWithFormat:@"%@.%@", @"digital_health_restrictions", v4];
  }
  else
  {
    int v9 = [(STCoreUser *)self dsid];
    __int16 v10 = [v9 stringValue];
    int v8 = [v7 stringWithFormat:@"%@.%@.%@", @"digital_health_restrictions", v10, v4];
  }
  return v8;
}

- (NSString)alwaysAllowActivationIdentifier
{
  uint64_t v3 = [(STCoreUser *)self organizationIdentifier];
  if ([v3 isEqualToString:@"personal"])
  {
    id v4 = createIdentifierWithComponents(@"always_allow_activation", v3, 0);
  }
  else
  {
    id v5 = [(STCoreUser *)self dsid];
    int v6 = [v5 stringValue];
    id v4 = createIdentifierWithComponents(@"always_allow_activation", v3, v6);
  }
  return (NSString *)v4;
}

- (NSString)alwaysAllowConfigurationIdentifier
{
  uint64_t v3 = [(STCoreUser *)self organizationIdentifier];
  if ([v3 isEqualToString:@"personal"])
  {
    id v4 = createIdentifierWithComponents(@"always_allow_app_configuration", v3, 0);
  }
  else
  {
    id v5 = [(STCoreUser *)self dsid];
    int v6 = [v5 stringValue];
    id v4 = createIdentifierWithComponents(@"always_allow_app_configuration", v3, v6);
  }
  return (NSString *)v4;
}

- (NSString)managedUserActivationIdentifier
{
  id v2 = NSString;
  uint64_t v3 = [(STCoreUser *)self dsid];
  id v4 = [v3 stringValue];
  id v5 = [v2 stringWithFormat:@"%@_%@", @"managed_user_activation", v4];

  return (NSString *)v5;
}

- (NSString)iCloudLogoutConfigurationIdentifier
{
  id v2 = NSString;
  uint64_t v3 = [(STCoreUser *)self dsid];
  id v4 = [v3 stringValue];
  id v5 = [v2 stringWithFormat:@"%@_%@", @"icloud_logout_configuration", v4];

  return (NSString *)v5;
}

- (NSString)automaticDateTimeConfigurationIdentifier
{
  id v2 = NSString;
  uint64_t v3 = [(STCoreUser *)self dsid];
  id v4 = [v3 stringValue];
  id v5 = [v2 stringWithFormat:@"%@_%@", @"force_date_time_configuration", v4];

  return (NSString *)v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)STCoreUser;
  if (!-[STCoreUser validateForUpdate:](&v11, sel_validateForUpdate_))
  {
    id v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STCoreUser(Identifiers) validateForUpdate:]();
    }
    BOOL v7 = 0;
    goto LABEL_15;
  }
  if (_os_feature_enabled_impl())
  {
    id v5 = objc_opt_new();
    int v6 = [(STCoreUser *)self localUserDeviceState];

    if (v6) {
      [(STCoreUser *)self _validateLocalUser:v5];
    }
    else {
      [(STCoreUser *)self _validateRemoteUser:v5];
    }
    [(STCoreUser *)self _validateNumberOfLocalUsers:v5];
    [(STCoreUser *)self _validateDSID:v5];
    [(STCoreUser *)self _validateAltDSID:v5];
    [(STCoreUser *)self _validateAppleID:v5];
    if ([v5 count])
    {
      int v8 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser(Identifiers) validateForUpdate:](self);
      }
    }
    v10.receiver = self;
    v10.super_class = (Class)STCoreUser;
    BOOL v7 = [(NSManagedObject *)&v10 parseValidationErrors:a3 otherErrors:v5];
LABEL_15:

    return v7;
  }
  return 1;
}

- (BOOL)validateForInsert:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)STCoreUser;
  if (!-[STCoreUser validateForInsert:](&v11, sel_validateForInsert_))
  {
    id v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STCoreUser(Identifiers) validateForInsert:]();
    }
    BOOL v7 = 0;
    goto LABEL_15;
  }
  if (_os_feature_enabled_impl())
  {
    id v5 = objc_opt_new();
    int v6 = [(STCoreUser *)self localUserDeviceState];

    if (v6) {
      [(STCoreUser *)self _validateLocalUser:v5];
    }
    else {
      [(STCoreUser *)self _validateRemoteUser:v5];
    }
    [(STCoreUser *)self _validateNumberOfLocalUsers:v5];
    [(STCoreUser *)self _validateDSID:v5];
    [(STCoreUser *)self _validateAltDSID:v5];
    [(STCoreUser *)self _validateAppleID:v5];
    if ([v5 count])
    {
      int v8 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser(Identifiers) validateForInsert:](self);
      }
    }
    v10.receiver = self;
    v10.super_class = (Class)STCoreUser;
    BOOL v7 = [(NSManagedObject *)&v10 parseValidationErrors:a3 otherErrors:v5];
LABEL_15:

    return v7;
  }
  return 1;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STCoreUser;
  if (-[STCoreUser validateForDelete:](&v10, sel_validateForDelete_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    id v5 = objc_opt_new();
    [(STCoreUser *)self _validateNumberOfLocalUsers:v5];
    if ([v5 count])
    {
      int v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STCoreUser(Identifiers) validateForDelete:](self);
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STCoreUser;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    id v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STCoreUser(Identifiers) validateForDelete:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_validateAppleID:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(STCoreUser *)self appleID];
  int v6 = +[STCoreUser fetchRequestMatchingAppleID:v5];

  id v19 = 0;
  BOOL v7 = [v6 execute:&v19];
  id v8 = v19;
  if (!v7)
  {
    [v4 addObject:v8];
    BOOL v17 = 0;
    goto LABEL_10;
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    objc_super v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"There are multiple users with the same Apple ID.";
    objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    objc_super v11 = [v9 errorWithDomain:@"STErrorDomain" code:511 userInfo:v10];
    [v4 addObject:v11];
  }
  uint64_t v12 = [(STCoreUser *)self appleID];
  if (![v12 length]) {
    goto LABEL_7;
  }
  int v13 = [(STCoreUser *)self dsid];
  int v14 = [v13 intValue];

  if (!v14)
  {
    int v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    char v21 = @"If the user has an Apple ID, they must have a DSID.";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v16 = [v15 errorWithDomain:@"STErrorDomain" code:512 userInfo:v12];
    [v4 addObject:v16];

LABEL_7:
  }
  BOOL v17 = [v4 count] == 0;
LABEL_10:

  return v17;
}

- (BOOL)_validateAltDSID:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[STCoreUser fetchRequest];
  int v6 = (void *)MEMORY[0x1E4F28F60];
  BOOL v7 = [(STCoreUser *)self altDSID];
  id v8 = [v6 predicateWithFormat:@"%K == %@", @"altDSID", v7];
  [v5 setPredicate:v8];

  id v21 = 0;
  objc_super v9 = [v5 execute:&v21];
  id v10 = v21;
  if (!v9)
  {
    [v4 addObject:v10];
    BOOL v19 = 0;
    goto LABEL_10;
  }
  if ((unint64_t)[v9 count] >= 2)
  {
    objc_super v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"There are multiple users with the same altDSID.";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    int v13 = [v11 errorWithDomain:@"STErrorDomain" code:516 userInfo:v12];
    [v4 addObject:v13];
  }
  int v14 = [(STCoreUser *)self dsid];
  if ([v14 isEqual:&unk_1F349EC50]) {
    goto LABEL_7;
  }
  int v15 = [(STCoreUser *)self altDSID];
  uint64_t v16 = [v15 length];

  if (!v16)
  {
    BOOL v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    id v23 = @"If the user has a DSID, they must have an altDSID.";
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    char v18 = [v17 errorWithDomain:@"STErrorDomain" code:517 userInfo:v14];
    [v4 addObject:v18];

LABEL_7:
  }
  BOOL v19 = [v4 count] == 0;
LABEL_10:

  return v19;
}

- (BOOL)_validateDSID:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(STCoreUser *)self dsid];
  int v6 = +[STCoreUser fetchRequestForUsersWithDSID:v5];

  id v14 = 0;
  BOOL v7 = [v6 execute:&v14];
  id v8 = v14;
  if (v7)
  {
    if ((unint64_t)[v7 count] >= 2)
    {
      objc_super v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v16[0] = @"There are multiple users with the same DSID.";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      objc_super v11 = [v9 errorWithDomain:@"STErrorDomain" code:509 userInfo:v10];
      [v4 addObject:v11];
    }
    BOOL v12 = [v4 count] == 0;
  }
  else
  {
    [v4 addObject:v8];
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_validateLocalUser:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(STCoreUser *)self cloudSettings];

    if (!v5)
    {
      int v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"A local user must have Cloud Settings.";
      BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v8 = [v6 errorWithDomain:@"STErrorDomain" code:515 userInfo:v7];
      [v4 addObject:v8];
    }
  }
  objc_super v9 = [(STCoreUser *)self familyMemberType];
  if (v9 == @"Child") {
    goto LABEL_9;
  }
  id v10 = [(STCoreUser *)self familyMemberType];
  objc_super v11 = v10;
  if (v10 == @"Teen")
  {

LABEL_9:
    goto LABEL_10;
  }
  BOOL v12 = [(STCoreUser *)self familyMemberType];
  int v13 = v12;
  if (v12 != @"Adult")
  {

LABEL_12:
    goto LABEL_13;
  }
  char v18 = [(STCoreUser *)self isParent];

  if (v18) {
    goto LABEL_13;
  }
LABEL_10:
  id v14 = [(STCoreUser *)self familySettings];

  if (!v14)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v20 = @"A local user who is a child, teen, nor non-parent adult must have family settings.";
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    objc_super v11 = [v15 errorWithDomain:@"STErrorDomain" code:514 userInfo:v9];
    [v4 addObject:v11];
    goto LABEL_12;
  }
LABEL_13:
  BOOL v16 = [v4 count] == 0;

  return v16;
}

- (BOOL)_validateNumberOfLocalUsers:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[STCoreUser fetchRequestMatchingLocalUser];
  id v15 = 0;
  id v5 = [v4 execute:&v15];
  id v6 = v15;
  if (v5)
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      BOOL v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"There must be one and only one local user.";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      objc_super v9 = [v7 errorWithDomain:@"STErrorDomain" code:508 userInfo:v8];
      [v3 addObject:v9];
    }
    if (![v5 count])
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      BOOL v17 = @"There must be one local user.";
      objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      BOOL v12 = [v10 errorWithDomain:@"STErrorDomain" code:10 userInfo:v11];
      [v3 addObject:v12];
    }
    BOOL v13 = [v3 count] == 0;
  }
  else
  {
    [v3 addObject:v6];
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_validateRemoteUser:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(STCoreUser *)self isParent] & 1) == 0)
  {
    id v5 = [(STCoreUser *)self familySettings];

    if (!v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = @"A remote user must have Family Settings.";
      BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v8 = [v6 errorWithDomain:@"STErrorDomain" code:514 userInfo:v7];
      [v4 addObject:v8];
    }
  }
  uint64_t v9 = [(STCoreUser *)self familyMemberType];
  if (!v9
    || (id v10 = (void *)v9,
        [(STCoreUser *)self familyMemberType],
        objc_super v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqualToString:@"Unknown"],
        v11,
        v10,
        v12))
  {
    BOOL v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    uint64_t v19 = @"A remote user must be family member..";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v15 = [v13 errorWithDomain:@"STErrorDomain" code:513 userInfo:v14];
    [v4 addObject:v15];
  }
  BOOL v16 = [v4 count] == 0;

  return v16;
}

+ (id)keyPathsForValuesAffectingObservableScreenTimeEnabled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"screenTimeEnabled"];
}

- (BOOL)observableScreenTimeEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(STCoreUser *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__STCoreUser_Observable__observableScreenTimeEnabled__block_invoke;
  v5[3] = &unk_1E6BC78C8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __53__STCoreUser_Observable__observableScreenTimeEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) screenTimeEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableScreenTimeEnabled:(BOOL)a3
{
  id v5 = [(STCoreUser *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __57__STCoreUser_Observable__setObservableScreenTimeEnabled___block_invoke;
  v7[3] = &unk_1E6BC78F0;
  BOOL v9 = a3;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __57__STCoreUser_Observable__setObservableScreenTimeEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setScreenTimeEnabled:*(unsigned __int8 *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 48) && (_os_feature_enabled_impl() & 1) == 0)
  {
    [*(id *)(a1 + 32) setEffectivePasscode:0];
    [*(id *)(a1 + 32) setEffectiveRecoveryAltDSID:0];
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([*(id *)(a1 + 40) hasChanges])
    {
      id v2 = *(void **)(a1 + 40);
      id v6 = 0;
      char v3 = [v2 save:&v6];
      id v4 = v6;
      if ((v3 & 1) == 0)
      {
        id v5 = +[STLog persistence];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          __57__STCoreUser_Observable__setObservableScreenTimeEnabled___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v4 = 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingObservableManagementEnabled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"managed"];
}

- (BOOL)observableManagementEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [(STCoreUser *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__STCoreUser_Observable__observableManagementEnabled__block_invoke;
  v5[3] = &unk_1E6BC78C8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __53__STCoreUser_Observable__observableManagementEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isManaged];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableManagementEnabled:(BOOL)a3
{
  id v5 = [(STCoreUser *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __57__STCoreUser_Observable__setObservableManagementEnabled___block_invoke;
  v7[3] = &unk_1E6BC78F0;
  BOOL v9 = a3;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __57__STCoreUser_Observable__setObservableManagementEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setManaged:*(unsigned __int8 *)(a1 + 48)];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([*(id *)(a1 + 40) hasChanges])
    {
      id v2 = *(void **)(a1 + 40);
      id v6 = 0;
      char v3 = [v2 save:&v6];
      id v4 = v6;
      if ((v3 & 1) == 0)
      {
        id v5 = +[STLog persistence];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          __57__STCoreUser_Observable__setObservableManagementEnabled___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v4 = 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingObservableSyncingEnabled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"syncingEnabled"];
}

- (BOOL)observableSyncingEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [(STCoreUser *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__STCoreUser_Observable__observableSyncingEnabled__block_invoke;
  v5[3] = &unk_1E6BC78C8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__STCoreUser_Observable__observableSyncingEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) syncingEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableSyncingEnabled:(BOOL)a3
{
  id v5 = [(STCoreUser *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __54__STCoreUser_Observable__setObservableSyncingEnabled___block_invoke;
  v7[3] = &unk_1E6BC78F0;
  BOOL v9 = a3;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __54__STCoreUser_Observable__setObservableSyncingEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSyncingEnabled:*(unsigned __int8 *)(a1 + 48)];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([*(id *)(a1 + 40) hasChanges])
    {
      id v2 = *(void **)(a1 + 40);
      id v6 = 0;
      char v3 = [v2 save:&v6];
      id v4 = v6;
      if ((v3 & 1) == 0)
      {
        id v5 = +[STLog persistence];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          __54__STCoreUser_Observable__setObservableSyncingEnabled___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v4 = 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingObservableAllLimitsEnabled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"allLimitsEnabled"];
}

- (BOOL)observableAllLimitsEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  char v3 = [(STCoreUser *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__STCoreUser_Observable__observableAllLimitsEnabled__block_invoke;
  v5[3] = &unk_1E6BC78C8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __52__STCoreUser_Observable__observableAllLimitsEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) allLimitsEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableAllLimitsEnabled:(BOOL)a3
{
  id v5 = [(STCoreUser *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __56__STCoreUser_Observable__setObservableAllLimitsEnabled___block_invoke;
  v7[3] = &unk_1E6BC78F0;
  BOOL v9 = a3;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __56__STCoreUser_Observable__setObservableAllLimitsEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAllLimitsEnabled:*(unsigned __int8 *)(a1 + 48)];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([*(id *)(a1 + 40) hasChanges])
    {
      id v2 = *(void **)(a1 + 40);
      id v6 = 0;
      char v3 = [v2 save:&v6];
      id v4 = v6;
      if ((v3 & 1) == 0)
      {
        id v5 = +[STLog persistence];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          __56__STCoreUser_Observable__setObservableAllLimitsEnabled___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v4 = 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingObservableCanSetUpFamily
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"canSetUpFamily"];
}

- (BOOL)observableCanSetUpFamily
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [(STCoreUser *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__STCoreUser_Observable__observableCanSetUpFamily__block_invoke;
  v5[3] = &unk_1E6BC78C8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__STCoreUser_Observable__observableCanSetUpFamily__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canSetUpFamily];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingObservableShareWebUsage
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"shareWebUsage"];
}

- (BOOL)observableShareWebUsage
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  char v3 = [(STCoreUser *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__STCoreUser_Observable__observableShareWebUsage__block_invoke;
  v5[3] = &unk_1E6BC78C8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __49__STCoreUser_Observable__observableShareWebUsage__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shareWebUsage];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableShareWebUsage:(BOOL)a3
{
  id v5 = [(STCoreUser *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __53__STCoreUser_Observable__setObservableShareWebUsage___block_invoke;
  v7[3] = &unk_1E6BC78F0;
  BOOL v9 = a3;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __53__STCoreUser_Observable__setObservableShareWebUsage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShareWebUsage:*(unsigned __int8 *)(a1 + 48)];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([*(id *)(a1 + 40) hasChanges])
    {
      id v2 = *(void **)(a1 + 40);
      id v6 = 0;
      char v3 = [v2 save:&v6];
      id v4 = v6;
      if ((v3 & 1) == 0)
      {
        id v5 = +[STLog persistence];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          __53__STCoreUser_Observable__setObservableShareWebUsage___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v4 = 0;
    }
  }
}

- (void)resetPasscode
{
  id v4 = [[STPINController alloc] initWithUser:self];
  char v3 = [(STCoreUser *)self effectivePasscode];
  [(STPINController *)v4 removePIN:v3 completionHandler:&__block_literal_global_11];
}

void __39__STCoreUser_Observable__resetPasscode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    char v3 = +[STLog persistence];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __39__STCoreUser_Observable__resetPasscode__block_invoke_cold_1();
    }
  }
}

+ (id)keyPathsForValuesAffectingObservableCommunicationSafetySendingRestricted
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"isCommunicationSafetySendingRestricted"];
}

- (BOOL)observableCommunicationSafetySendingRestricted
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [(STCoreUser *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__STCoreUser_Observable__observableCommunicationSafetySendingRestricted__block_invoke;
  v5[3] = &unk_1E6BC78C8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __72__STCoreUser_Observable__observableCommunicationSafetySendingRestricted__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCommunicationSafetySendingRestricted];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableCommunicationSafetySendingRestricted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = +[STLog communicationSafety];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v12 = v3;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Setting isCommunicationSafetySendingRestricted restriction to: %{public}u", buf, 8u);
  }

  uint64_t v6 = [(STCoreUser *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__STCoreUser_Observable__setObservableCommunicationSafetySendingRestricted___block_invoke;
  v8[3] = &unk_1E6BC78F0;
  BOOL v10 = v3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v7 performBlockAndWait:v8];
}

void __76__STCoreUser_Observable__setObservableCommunicationSafetySendingRestricted___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsCommunicationSafetySendingRestricted:*(unsigned __int8 *)(a1 + 48)];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([*(id *)(a1 + 40) hasChanges])
    {
      id v2 = *(void **)(a1 + 40);
      id v6 = 0;
      char v3 = [v2 save:&v6];
      id v4 = v6;
      if ((v3 & 1) == 0)
      {
        id v5 = +[STLog communicationSafety];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          __76__STCoreUser_Observable__setObservableCommunicationSafetySendingRestricted___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v4 = 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingObservableCommunicationSafetyReceivingRestricted
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"isCommunicationSafetyReceivingRestricted"];
}

- (BOOL)observableCommunicationSafetyReceivingRestricted
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [(STCoreUser *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__STCoreUser_Observable__observableCommunicationSafetyReceivingRestricted__block_invoke;
  v5[3] = &unk_1E6BC78C8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __74__STCoreUser_Observable__observableCommunicationSafetyReceivingRestricted__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCommunicationSafetyReceivingRestricted];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableCommunicationSafetyReceivingRestricted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = +[STLog communicationSafety];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v12 = v3;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Setting isCommunicationSafetyReceivingRestricted restriction to: %{public}u", buf, 8u);
  }

  uint64_t v6 = [(STCoreUser *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__STCoreUser_Observable__setObservableCommunicationSafetyReceivingRestricted___block_invoke;
  v8[3] = &unk_1E6BC78F0;
  BOOL v10 = v3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v7 performBlockAndWait:v8];
}

void __78__STCoreUser_Observable__setObservableCommunicationSafetyReceivingRestricted___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsCommunicationSafetyReceivingRestricted:*(unsigned __int8 *)(a1 + 48)];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([*(id *)(a1 + 40) hasChanges])
    {
      id v2 = *(void **)(a1 + 40);
      id v6 = 0;
      char v3 = [v2 save:&v6];
      id v4 = v6;
      if ((v3 & 1) == 0)
      {
        id v5 = +[STLog communicationSafety];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          __78__STCoreUser_Observable__setObservableCommunicationSafetyReceivingRestricted___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v4 = 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingObservableCommunicationSafetyNotificationEnabled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"isCommunicationSafetyNotificationEnabled"];
}

- (BOOL)observableCommunicationSafetyNotificationEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [(STCoreUser *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__STCoreUser_Observable__observableCommunicationSafetyNotificationEnabled__block_invoke;
  v5[3] = &unk_1E6BC78C8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __74__STCoreUser_Observable__observableCommunicationSafetyNotificationEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCommunicationSafetyNotificationEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableCommunicationSafetyNotificationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = +[STLog communicationSafety];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v12 = v3;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Setting isCommunicationSafetyNotificationEnabled restriction to: %{public}u", buf, 8u);
  }

  uint64_t v6 = [(STCoreUser *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__STCoreUser_Observable__setObservableCommunicationSafetyNotificationEnabled___block_invoke;
  v8[3] = &unk_1E6BC78F0;
  BOOL v10 = v3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v7 performBlockAndWait:v8];
}

void __78__STCoreUser_Observable__setObservableCommunicationSafetyNotificationEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsCommunicationSafetyNotificationEnabled:*(unsigned __int8 *)(a1 + 48)];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([*(id *)(a1 + 40) hasChanges])
    {
      id v2 = *(void **)(a1 + 40);
      id v6 = 0;
      char v3 = [v2 save:&v6];
      id v4 = v6;
      if ((v3 & 1) == 0)
      {
        id v5 = +[STLog communicationSafety];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          __78__STCoreUser_Observable__setObservableCommunicationSafetyNotificationEnabled___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v4 = 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingObservableCommunicationSafetyAnalyticsEnabled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"isCommunicationSafetyAnalyticsEnabled"];
}

- (BOOL)observableCommunicationSafetyAnalyticsEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [(STCoreUser *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__STCoreUser_Observable__observableCommunicationSafetyAnalyticsEnabled__block_invoke;
  v5[3] = &unk_1E6BC78C8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __71__STCoreUser_Observable__observableCommunicationSafetyAnalyticsEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCommunicationSafetyAnalyticsEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableCommunicationSafetyAnalyticsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = +[STLog communicationSafety];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v12 = v3;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Setting isCommunicationSafetyAnalyticsEnabled to: %{public}u", buf, 8u);
  }

  uint64_t v6 = [(STCoreUser *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__STCoreUser_Observable__setObservableCommunicationSafetyAnalyticsEnabled___block_invoke;
  v8[3] = &unk_1E6BC78F0;
  BOOL v10 = v3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v7 performBlockAndWait:v8];
}

void __75__STCoreUser_Observable__setObservableCommunicationSafetyAnalyticsEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsCommunicationSafetyAnalyticsEnabled:*(unsigned __int8 *)(a1 + 48)];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([*(id *)(a1 + 40) hasChanges])
    {
      id v2 = *(void **)(a1 + 40);
      id v6 = 0;
      char v3 = [v2 save:&v6];
      id v4 = v6;
      if ((v3 & 1) == 0)
      {
        id v5 = +[STLog communicationSafety];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          __75__STCoreUser_Observable__setObservableCommunicationSafetyAnalyticsEnabled___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v4 = 0;
    }
  }
}

void __46__STCoreUser_notifyServerOfScreenTimeEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Error sending family state to server %{public}@", v2, v3, v4, v5, v6);
}

- (void)_contactStoreForUser
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "User has no altDSID: %@", v2, v3, v4, v5, v6);
}

- (void)_primaryContainerInContactStore:withError:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "Default Contact container identifier is nil", v2, v3, v4, v5, v6);
}

- (void)_primaryContainerInContactStore:withError:.cold.2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "No Apple Account exists for user", v2, v3, v4, v5, v6);
}

- (void)_primaryContainerInContactStore:withError:.cold.3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "No CardDAV identifier found for user", v2, v3, v4, v5, v6);
}

void __70__STCoreUser_UnmodeledInternal__unmodeledManagingOrganizationSettings__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  _os_log_fault_impl(&dword_1DA519000, v0, OS_LOG_TYPE_FAULT, "No current organizaiton in ST settings. Current settings will be recalculated.", v1, 2u);
}

void __57__STCoreUser_Observable__setObservableScreenTimeEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to save Screen Time enabled: %{public}@", v2, v3, v4, v5, v6);
}

void __57__STCoreUser_Observable__setObservableManagementEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to save management enabled: %{public}@", v2, v3, v4, v5, v6);
}

void __54__STCoreUser_Observable__setObservableSyncingEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to save syncing enabled: %{public}@", v2, v3, v4, v5, v6);
}

void __56__STCoreUser_Observable__setObservableAllLimitsEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to save all limits enabled: %{public}@", v2, v3, v4, v5, v6);
}

void __53__STCoreUser_Observable__setObservableShareWebUsage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to save web usage sharing: %{public}@", v2, v3, v4, v5, v6);
}

void __39__STCoreUser_Observable__resetPasscode__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to reset passcode: %{public}@", v2, v3, v4, v5, v6);
}

void __76__STCoreUser_Observable__setObservableCommunicationSafetySendingRestricted___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to save communication safety sending restriction: %{public}@", v2, v3, v4, v5, v6);
}

void __78__STCoreUser_Observable__setObservableCommunicationSafetyReceivingRestricted___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to save communication safety receiving restriction: %{public}@", v2, v3, v4, v5, v6);
}

void __78__STCoreUser_Observable__setObservableCommunicationSafetyNotificationEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to save isCommunicationSafetyNotificationEnabled restriction: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STCoreUser_Observable__setObservableCommunicationSafetyAnalyticsEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to save isCommunicationSafetyAnalyticsEnabled: %{public}@", v2, v3, v4, v5, v6);
}

@end