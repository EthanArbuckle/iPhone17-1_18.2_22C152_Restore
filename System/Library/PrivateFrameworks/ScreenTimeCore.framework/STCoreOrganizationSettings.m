@interface STCoreOrganizationSettings
+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchResultsRequestsForChangesToOrganizationSettingsForUserWithDSID:(id)a3;
+ (id)keyPathsForValuesAffectingContentPrivacySiriImageGenerationRestriction;
+ (id)keyPathsForValuesAffectingIsCommunicationSafetyReceivingRestricted;
+ (id)keyPathsForValuesAffectingIsCommunicationSafetySendingRestricted;
+ (id)keyPathsForValuesAffectingIsEyeReliefEnabled;
- (BOOL)isCommunicationSafetyReceivingRestricted;
- (BOOL)isCommunicationSafetySendingRestricted;
- (BOOL)isEyeReliefEnabled;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (NSString)description;
- (id)defaultSettingsForFamilyMemberOfType:(id)a3;
- (id)dictionaryRepresentation;
- (int64_t)contentPrivacySiriImageGenerationRestriction;
- (void)_changeAppLimitsFromAskToWarn:(id)a3;
- (void)setContentPrivacySiriImageGenerationRestriction:(int64_t)a3;
- (void)setIsCommunicationSafetyReceivingRestricted:(BOOL)a3;
- (void)setIsCommunicationSafetySendingRestricted:(BOOL)a3;
- (void)setIsEyeReliefEnabled:(BOOL)a3;
@end

@implementation STCoreOrganizationSettings

- (BOOL)isCommunicationSafetySendingRestricted
{
  v3 = [(STCoreOrganizationSettings *)self primitiveValueForKey:@"isCommunicationSafetySendingRestricted"];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else if (_os_feature_enabled_impl())
  {
    v6 = [(STCoreOrganizationSettings *)self user];
    v7 = [v6 familyMemberType];
    v8 = [(STCoreOrganizationSettings *)self defaultSettingsForFamilyMemberOfType:v7];

    v9 = [v8 objectForKey:@"isCommunicationSafetySendingRestricted"];
    char v5 = [v9 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isCommunicationSafetyReceivingRestricted
{
  v3 = [(STCoreOrganizationSettings *)self primitiveValueForKey:@"isCommunicationSafetyReceivingRestricted"];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else if (_os_feature_enabled_impl())
  {
    v6 = [(STCoreOrganizationSettings *)self user];
    v7 = [v6 familyMemberType];
    v8 = [(STCoreOrganizationSettings *)self defaultSettingsForFamilyMemberOfType:v7];

    v9 = [v8 objectForKey:@"isCommunicationSafetyReceivingRestricted"];
    char v5 = [v9 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)fetchResultsRequestsForChangesToOrganizationSettingsForUserWithDSID:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"user.dsid", a3];
  v4 = +[STLocalOrganizationSettings fetchRequest];
  [v4 setPredicate:v3];
  char v5 = +[STiCloudOrganizationSettings fetchRequest];
  [v5 setPredicate:v3];
  v6 = +[STFamilyOrganizationSettings fetchRequest];
  [v6 setPredicate:v3];
  v7 = +[STFetchResultsRequest requestWithFetchRequest:v4];
  v12[0] = v7;
  v8 = +[STFetchResultsRequest requestWithFetchRequest:v5];
  v12[1] = v8;
  v9 = +[STFetchResultsRequest requestWithFetchRequest:v6];
  v12[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

  return v10;
}

- (BOOL)isEyeReliefEnabled
{
  v3 = [(STCoreOrganizationSettings *)self primitiveValueForKey:@"isEyeReliefEnabled"];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else if (_os_feature_enabled_impl())
  {
    v6 = [(STCoreOrganizationSettings *)self user];
    v7 = [v6 familyMemberType];
    v8 = [(STCoreOrganizationSettings *)self defaultSettingsForFamilyMemberOfType:v7];

    v9 = [v8 objectForKey:@"isEyeReliefEnabled"];
    char v5 = [v9 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setIsEyeReliefEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(STCoreOrganizationSettings *)self willChangeValueForKey:@"isEyeReliefEnabled"];
  char v5 = [NSNumber numberWithBool:v3];
  [(STCoreOrganizationSettings *)self setPrimitiveValue:v5 forKey:@"isEyeReliefEnabled"];

  [(STCoreOrganizationSettings *)self didChangeValueForKey:@"isEyeReliefEnabled"];
}

+ (id)keyPathsForValuesAffectingIsEyeReliefEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"user.familyMemberType", 0);
}

- (void)setIsCommunicationSafetySendingRestricted:(BOOL)a3
{
  BOOL v3 = a3;
  [(STCoreOrganizationSettings *)self willChangeValueForKey:@"isCommunicationSafetySendingRestricted"];
  char v5 = [NSNumber numberWithBool:v3];
  [(STCoreOrganizationSettings *)self setPrimitiveValue:v5 forKey:@"isCommunicationSafetySendingRestricted"];

  [(STCoreOrganizationSettings *)self didChangeValueForKey:@"isCommunicationSafetySendingRestricted"];
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetySendingRestricted
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"user.familyMemberType", 0);
}

- (void)setIsCommunicationSafetyReceivingRestricted:(BOOL)a3
{
  BOOL v3 = a3;
  [(STCoreOrganizationSettings *)self willChangeValueForKey:@"isCommunicationSafetyReceivingRestricted"];
  char v5 = [NSNumber numberWithBool:v3];
  [(STCoreOrganizationSettings *)self setPrimitiveValue:v5 forKey:@"isCommunicationSafetyReceivingRestricted"];

  [(STCoreOrganizationSettings *)self didChangeValueForKey:@"isCommunicationSafetyReceivingRestricted"];
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetyReceivingRestricted
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"user.familyMemberType", 0);
}

- (int64_t)contentPrivacySiriImageGenerationRestriction
{
  BOOL v3 = [(STCoreOrganizationSettings *)self primitiveValueForKey:@"contentPrivacySiriImageGenerationRestriction"];
  v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 longLongValue];
  }
  else if (_os_feature_enabled_impl())
  {
    v6 = [(STCoreOrganizationSettings *)self user];
    v7 = [v6 familyMemberType];
    v8 = [(STCoreOrganizationSettings *)self defaultSettingsForFamilyMemberOfType:v7];

    v9 = [v8 objectForKey:@"contentPrivacySiriImageGenerationRestriction"];
    int64_t v5 = [v9 longLongValue];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)setContentPrivacySiriImageGenerationRestriction:(int64_t)a3
{
  [(STCoreOrganizationSettings *)self willChangeValueForKey:@"contentPrivacySiriImageGenerationRestriction"];
  int64_t v5 = [NSNumber numberWithLongLong:a3];
  [(STCoreOrganizationSettings *)self setPrimitiveValue:v5 forKey:@"contentPrivacySiriImageGenerationRestriction"];

  [(STCoreOrganizationSettings *)self didChangeValueForKey:@"contentPrivacySiriImageGenerationRestriction"];
}

+ (id)keyPathsForValuesAffectingContentPrivacySiriImageGenerationRestriction
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"user.familyMemberType", 0);
}

- (id)defaultSettingsForFamilyMemberOfType:(id)a3
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"Child"])
  {
    v5[0] = @"isEyeReliefEnabled";
    v5[1] = @"isCommunicationSafetySendingRestricted";
    v6[0] = &unk_1F349EC38;
    v6[1] = &unk_1F349EC38;
    v5[2] = @"isCommunicationSafetyReceivingRestricted";
    v6[2] = &unk_1F349EC38;
    BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v8 = a3;
  id v9 = a4;
  if (_os_feature_enabled_impl())
  {
    v10 = [v8 objectForKeyedSubscript:@"class"];
    v11 = [v8 objectForKeyedSubscript:@"user"];
    if ([v10 length])
    {
      if ([v11 unsignedIntValue]) {
        goto LABEL_6;
      }
      v12 = +[STCoreUser fetchLocalUserInContext:v9 error:a5];
      if (v12)
      {
        v13 = v12;
        uint64_t v14 = [v12 dsid];

        v11 = (void *)v14;
LABEL_6:
        v15 = +[STiCloudOrganizationSettings serializableClassName];
        int v16 = [v10 isEqualToString:v15];

        if (v16)
        {
          v17 = +[STiCloudOrganizationSettings fetchRequest];
          v18 = (objc_class *)objc_opt_class();
          uint64_t v19 = +[STiCloudOrganization fetchOrCreateiCloudOrganizationWithContext:v9 error:a5];
          if (!v19)
          {
            v20 = +[STLog persistence];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:]();
            }
            goto LABEL_50;
          }
          v20 = v19;
LABEL_40:
          v35 = [v17 execute:a5];
          if (v35)
          {
            v36 = v35;
            uint64_t v37 = [v35 count];
            if (v37 == 1)
            {
              v47 = +[STLog persistence];
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v54 = v8;
                _os_log_impl(&dword_1DA519000, v47, OS_LOG_TYPE_DEFAULT, "There is already a settings object that matches: %{public}@.", buf, 0xCu);
              }

              v23 = [v36 firstObject];
            }
            else if (v37)
            {
              v48 = +[STLog persistence];
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.5();
              }

              if (a5
                && ([MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:1 userInfo:0], v49 = objc_claimAutoreleasedReturnValue(), v49, v49))
              {
                [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:1 userInfo:0];
                v23 = 0;
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v23 = 0;
              }
            }
            else
            {
              v38 = +[STLog persistence];
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v54 = v8;
                _os_log_impl(&dword_1DA519000, v38, OS_LOG_TYPE_DEFAULT, "There is not already a settings object that matches: %{public}@. A new one will be created", buf, 0xCu);
              }

              v39 = +[STCoreUser fetchLocalUserInContext:v9 error:a5];
              if (v39)
              {
                v23 = [[v18 alloc] initWithContext:v9];
                [v23 setUser:v39];
                [v23 setValue:v20 forKey:@"organization"];
              }
              else
              {
                v50 = +[STLog persistence];
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                  +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.6();
                }

                v23 = 0;
              }
            }
            v51 = +[STLog persistence];
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v36;
              _os_log_impl(&dword_1DA519000, v51, OS_LOG_TYPE_DEFAULT, "Settings created via the simplified agent path. Settings: %@", buf, 0xCu);
            }

            v20 = v36;
            goto LABEL_67;
          }
          v40 = +[STLog persistence];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.4((uint64_t)a5, v40, v41, v42, v43, v44, v45, v46);
          }

LABEL_50:
          v23 = 0;
LABEL_67:

          goto LABEL_68;
        }
        v29 = +[STFamilyOrganizationSettings serializableClassName];
        int v30 = [v10 isEqualToString:v29];

        if (v30)
        {
          v17 = +[STFamilyOrganizationSettings fetchRequest];
          v18 = (objc_class *)objc_opt_class();
          uint64_t v31 = +[STFamilyOrganization fetchWithContext:v9 error:a5];
          if (!v31)
          {
            v20 = +[STLog persistence];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.7();
            }
            goto LABEL_50;
          }
          v20 = v31;
          v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"user.dsid", v11];
          [v17 setPredicate:v32];

          goto LABEL_40;
        }
        v33 = +[STLog persistence];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.8();
        }

        if (a5)
        {
          v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:1 userInfo:0];

          if (v20)
          {
            [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:1 userInfo:0];
            v20 = 0;
            v18 = 0;
            v17 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
        }
        else
        {
          v20 = 0;
        }
        v18 = 0;
        v17 = 0;
        goto LABEL_40;
      }
      v34 = +[STLog persistence];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:]();
      }
    }
    else
    {
      v27 = +[STLog persistence];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:]();
      }

      if (a5)
      {
        v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:1 userInfo:0];

        if (v28)
        {
          [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:1 userInfo:0];
          v23 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_69;
        }
      }
    }
    v23 = 0;
    goto LABEL_69;
  }
  v10 = [v8 objectForKeyedSubscript:@"user"];
  v11 = [a1 fetchRequest];
  v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"user.dsid", v10];
  [v11 setPredicate:v21];

  v22 = [v11 execute:a5];
  v17 = v22;
  if (v22)
  {
    v23 = [v22 firstObject];
    if (v23)
    {
LABEL_13:
      v26 = +[STLog persistence];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v23;
        _os_log_impl(&dword_1DA519000, v26, OS_LOG_TYPE_DEFAULT, "Settings created via the legacy path. Settings: %@", buf, 0xCu);
      }

      goto LABEL_68;
    }
    uint64_t v24 = +[STCoreUser fetchUserWithDSID:v10 inContext:v9 error:a5];
    if (v24)
    {
      v25 = (void *)v24;
      v23 = [objc_alloc((Class)a1) initWithContext:v9];
      [v23 setUser:v25];

      goto LABEL_13;
    }
  }
  v23 = 0;
LABEL_68:

LABEL_69:
  return v23;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"modificationDate"];
  if (v4) {
    [(STCoreOrganizationSettings *)self setModificationDate:v4];
  }

  return 1;
}

- (id)dictionaryRepresentation
{
  v22.receiver = self;
  v22.super_class = (Class)STCoreOrganizationSettings;
  BOOL v3 = [(STUniquedManagedObject *)&v22 dictionaryRepresentation];
  v4 = [(STCoreOrganizationSettings *)self user];
  int64_t v5 = [v4 dsid];
  [v3 setObject:v5 forKeyedSubscript:@"user"];

  v6 = [(STCoreOrganizationSettings *)self passcode];
  [v3 setObject:v6 forKeyedSubscript:@"passcode"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[STCoreOrganizationSettings allLimitsEnabled](self, "allLimitsEnabled"));
  [v3 setObject:v7 forKeyedSubscript:@"allLimitsEnabled"];

  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[STCoreOrganizationSettings defaultUserPolicies](self, "defaultUserPolicies"));
  [v3 setObject:v8 forKeyedSubscript:@"defaultUserPolicies"];

  id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[STCoreOrganizationSettings communicationPolicy](self, "communicationPolicy"));
  [v3 setObject:v9 forKeyedSubscript:@"communicationPolicy"];

  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[STCoreOrganizationSettings communicationWhileLimitedPolicy](self, "communicationWhileLimitedPolicy"));
  [v3 setObject:v10 forKeyedSubscript:@"communicationWhileLimitedPolicy"];

  v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[STCoreOrganizationSettings contactManagementState](self, "contactManagementState"));
  [v3 setObject:v11 forKeyedSubscript:@"contactManagementState"];

  v12 = objc_msgSend(NSNumber, "numberWithLongLong:", -[STCoreOrganizationSettings contentPrivacySiriImageGenerationRestriction](self, "contentPrivacySiriImageGenerationRestriction"));
  [v3 setObject:v12 forKeyedSubscript:@"contentPrivacySiriImageGenerationRestriction"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[STCoreOrganizationSettings isCommunicationSafetySendingRestricted](self, "isCommunicationSafetySendingRestricted"));
  [v3 setObject:v13 forKeyedSubscript:@"isCommunicationSafetySendingRestricted"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[STCoreOrganizationSettings isCommunicationSafetyReceivingRestricted](self, "isCommunicationSafetyReceivingRestricted"));
  [v3 setObject:v14 forKeyedSubscript:@"isCommunicationSafetyReceivingRestricted"];

  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[STCoreOrganizationSettings isCommunicationSafetyNotificationEnabled](self, "isCommunicationSafetyNotificationEnabled"));
  [v3 setObject:v15 forKeyedSubscript:@"isCommunicationSafetyNotificationEnabled"];

  int v16 = objc_msgSend(NSNumber, "numberWithBool:", -[STCoreOrganizationSettings isCommunicationSafetyAnalyticsEnabled](self, "isCommunicationSafetyAnalyticsEnabled"));
  [v3 setObject:v16 forKeyedSubscript:@"isCommunicationSafetyAnalyticsEnabled"];

  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[STCoreOrganizationSettings isEyeReliefEnabled](self, "isEyeReliefEnabled"));
  [v3 setObject:v17 forKeyedSubscript:@"isEyeReliefEnabled"];

  v18 = [(STCoreOrganizationSettings *)self modificationDate];

  if (v18)
  {
    uint64_t v19 = [(STCoreOrganizationSettings *)self modificationDate];
    [v3 setObject:v19 forKeyedSubscript:@"modificationDate"];
  }
  v20 = (void *)[v3 copy];

  return v20;
}

- (void)_changeAppLimitsFromAskToWarn:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 type];
  if ([v4 isEqualToString:@"usage-limit"])
  {

    goto LABEL_4;
  }
  int64_t v5 = [v3 type];
  int v6 = [v5 isEqualToString:@"downtime"];

  if (v6)
  {
LABEL_4:
    v7 = [v3 configurations];
    v8 = [v7 anyObject];

    if (!v8)
    {
LABEL_31:

      goto LABEL_32;
    }
    id v9 = [v8 payloadPlist];

    if (!v9)
    {
      v13 = +[STLog persistence];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        +[STBlueprint _buildConfigurationsByDeclarationIdentifierFromBlueprint:error:]();
      }
      goto LABEL_30;
    }
    v10 = (void *)MEMORY[0x1E4F59F38];
    v11 = [v8 payloadPlist];
    id v27 = 0;
    v12 = [v10 declarationForData:v11 error:&v27];
    v13 = v27;

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = v12;
        v15 = [v14 payloadMode];
        char v16 = [v15 isEqualToString:*MEMORY[0x1E4F59EC0]];

        if (v16)
        {
          v17 = (void *)MEMORY[0x1E4F59ED0];
LABEL_21:
          [v12 setPayloadMode:*v17];

          v23 = +[STLog persistence];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [v8 identifier];
            *(_DWORD *)buf = 138543362;
            v29 = v24;
            _os_log_impl(&dword_1DA519000, v23, OS_LOG_TYPE_DEFAULT, "Updating configuration payload %{public}@ from ask to warn", buf, 0xCu);
          }
          [v12 updateServerHash];
          v26 = v13;
          uint64_t v14 = [v12 serializeAsDataWithError:&v26];
          v18 = v26;

          if (v14)
          {
            [v8 setPayloadPlist:v14];
          }
          else
          {
            v25 = +[STLog persistence];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[STCoreOrganizationSettings _changeAppLimitsFromAskToWarn:](v8);
            }
          }
          goto LABEL_28;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = v12;
          uint64_t v19 = [v14 payloadMode];
          char v20 = [v19 isEqualToString:*MEMORY[0x1E4F59EE8]];

          if (v20)
          {
            v17 = (void *)MEMORY[0x1E4F59EF0];
            goto LABEL_21;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_29:

LABEL_30:
            goto LABEL_31;
          }
          uint64_t v14 = v12;
          v21 = [v14 payloadMode];
          int v22 = [v21 isEqualToString:*MEMORY[0x1E4F59ED8]];

          if (v22)
          {
            v17 = (void *)MEMORY[0x1E4F59EE0];
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      uint64_t v14 = +[STLog persistence];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[STCoreOrganizationSettings _changeAppLimitsFromAskToWarn:](v8);
      }
    }
    v18 = v13;
LABEL_28:

    v13 = v18;
    goto LABEL_29;
  }
LABEL_32:
}

- (NSString)description
{
  v8 = NSString;
  uint64_t v7 = objc_opt_class();
  id v9 = [(STCoreOrganizationSettings *)self user];
  int v6 = [v9 dsid];
  id v3 = [(STCoreOrganizationSettings *)self passcode];
  objc_msgSend(v8, "stringWithFormat:", @"<%@: %p> ({\n user: %@\n passcode enabled: %d\n allLimitsEnabled: %d\n defaultUserPolicies: %lu\n communicationPolicy: %lld\n communicationWhileLimitedPolicy: %lld\n contactManagementState: %lld\n contentPrivacySiriImageGenerationRestriction: %lld\n isCommunicationSafetySendingRestricted: %d\n isCommunicationSafetyReceivingRestricted: %d\n isCommunicationSafetyNotificationEnabled: %d\n isCommunicationSafetyAnalyticsEnabled: %d\n isEyeReliefEnabled: %d\n)}", v7, self, v6, v3 != 0, -[STCoreOrganizationSettings allLimitsEnabled](self, "allLimitsEnabled"), -[STCoreOrganizationSettings defaultUserPolicies](self, "defaultUserPolicies"), -[STCoreOrganizationSettings communicationPolicy](self, "communicationPolicy"), -[STCoreOrganizationSettings communicationWhileLimitedPolicy](self, "communicationWhileLimitedPolicy"), -[STCoreOrganizationSettings contactManagementState](self, "contactManagementState"), -[STCoreOrganizationSettings contentPrivacySiriImageGenerationRestriction](self, "contentPrivacySiriImageGenerationRestriction"), -[STCoreOrganizationSettings isCommunicationSafetySendingRestricted](self, "isCommunicationSafetySendingRestricted"), -[STCoreOrganizationSettings isCommunicationSafetyReceivingRestricted](self, "isCommunicationSafetyReceivingRestricted"),
  v4 = [(STCoreOrganizationSettings *)self isCommunicationSafetyNotificationEnabled], [(STCoreOrganizationSettings *)self isCommunicationSafetyAnalyticsEnabled], [(STCoreOrganizationSettings *)self isEyeReliefEnabled]);

  return (NSString *)v4;
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Settings payload does not contain a class key: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Settings payload does not contain a user dsid and we could not find a local user: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Cloud organization could not be created: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)fetchOrCreateWithDictionaryRepresentation:(uint64_t)a3 inContext:(uint64_t)a4 error:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Settings payload is not supported as a serialized object: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Unable to find local user for:: %{public}@.", v2, v3, v4, v5, v6);
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Family organization does not exist: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Settings payload is not supported as a serialized object: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_changeAppLimitsFromAskToWarn:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v2, v3, "Failed to deserialize configuration payload %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_changeAppLimitsFromAskToWarn:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v2, v3, "Failed to serialize configuration payload %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

@end