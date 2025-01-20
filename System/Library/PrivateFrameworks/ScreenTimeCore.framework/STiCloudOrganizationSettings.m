@interface STiCloudOrganizationSettings
+ (NSString)serializableClassName;
- (BOOL)_validateNumberOfCloudSettings:(id)a3;
- (BOOL)_validateUser:(id)a3;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (id)computeUniqueIdentifier;
- (id)dictionaryRepresentation;
- (void)didChangeValueForKey:(id)a3;
@end

@implementation STiCloudOrganizationSettings

- (id)computeUniqueIdentifier
{
  v2 = objc_opt_class();
  return (id)[v2 serializableClassName];
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)STiCloudOrganizationSettings;
  if ([(STCoreOrganizationSettings *)&v46 updateWithDictionaryRepresentation:v4])
  {
    v5 = [(STiCloudOrganizationSettings *)self managedObjectContext];
    id v45 = 0;
    v6 = +[STiCloudOrganization fetchOrCreateiCloudOrganizationWithContext:v5 error:&v45];
    id v7 = v45;

    BOOL v8 = v6 != 0;
    if (v6)
    {
      [(STiCloudOrganizationSettings *)self setOrganization:v6];
      v9 = [v4 objectForKeyedSubscript:@"passcode"];
      [(STiCloudOrganizationSettings *)self setPasscode:v9];

      v10 = [v4 objectForKeyedSubscript:@"recoveryAltDSID"];
      [(STiCloudOrganizationSettings *)self setRecoveryAltDSID:v10];

      v11 = [v4 objectForKeyedSubscript:@"allLimitsEnabled"];
      v12 = v11;
      if (v11) {
        [(STiCloudOrganizationSettings *)self setAllLimitsEnabled:[v11 BOOLValue]];
      }
      v13 = [v4 objectForKeyedSubscript:@"defaultUserPolicies"];
      v14 = v13;
      if (v13) {
        -[STiCloudOrganizationSettings setDefaultUserPolicies:](self, "setDefaultUserPolicies:", [v13 longLongValue]);
      }
      v15 = [v4 objectForKeyedSubscript:@"communicationPolicy"];
      v16 = v15;
      if (v15) {
        -[STiCloudOrganizationSettings setCommunicationPolicy:](self, "setCommunicationPolicy:", [v15 longLongValue]);
      }
      v17 = [v4 objectForKeyedSubscript:@"communicationWhileLimitedPolicy"];
      v18 = v17;
      if (v17) {
        -[STiCloudOrganizationSettings setCommunicationWhileLimitedPolicy:](self, "setCommunicationWhileLimitedPolicy:", [v17 longLongValue]);
      }
      v42 = v14;
      v43 = v12;
      v19 = [v4 objectForKeyedSubscript:@"contactManagementState"];
      v20 = v19;
      if (v19)
      {
        uint64_t v21 = [v19 longLongValue];
        if (v21 != [(STiCloudOrganizationSettings *)self contactManagementState]) {
          -[STiCloudOrganizationSettings setContactManagementState:](self, "setContactManagementState:", [v20 longLongValue]);
        }
      }
      v41 = v16;
      v22 = objc_msgSend(v4, "objectForKeyedSubscript:", @"contentPrivacySiriImageGenerationRestriction", v20);
      v23 = v22;
      if (v22)
      {
        uint64_t v24 = [v22 longLongValue];
        if (v24 != -[STCoreOrganizationSettings contentPrivacySiriImageGenerationRestriction](self, "contentPrivacySiriImageGenerationRestriction"))-[STCoreOrganizationSettings setContentPrivacySiriImageGenerationRestriction:](self, "setContentPrivacySiriImageGenerationRestriction:", [v23 longLongValue]); {
      }
        }
      v40 = v18;
      v25 = [v4 objectForKeyedSubscript:@"isCommunicationSafetySendingRestricted"];
      v26 = v25;
      if (v25) {
        -[STCoreOrganizationSettings setIsCommunicationSafetySendingRestricted:](self, "setIsCommunicationSafetySendingRestricted:", [v25 BOOLValue]);
      }
      v27 = [v4 objectForKeyedSubscript:@"isCommunicationSafetyReceivingRestricted"];
      v28 = v27;
      if (v27) {
        -[STCoreOrganizationSettings setIsCommunicationSafetyReceivingRestricted:](self, "setIsCommunicationSafetyReceivingRestricted:", [v27 BOOLValue]);
      }
      v29 = [v4 objectForKeyedSubscript:@"isCommunicationSafetyNotificationEnabled"];
      v30 = v29;
      if (v29) {
        -[STiCloudOrganizationSettings setIsCommunicationSafetyNotificationEnabled:](self, "setIsCommunicationSafetyNotificationEnabled:", [v29 BOOLValue]);
      }
      id v44 = v7;
      v31 = [v4 objectForKeyedSubscript:@"isCommunicationSafetyAnalyticsEnabled"];
      v32 = v31;
      if (v31) {
        -[STiCloudOrganizationSettings setIsCommunicationSafetyAnalyticsEnabled:](self, "setIsCommunicationSafetyAnalyticsEnabled:", [v31 BOOLValue]);
      }
      v33 = [v4 objectForKeyedSubscript:@"isEyeReliefEnabled"];
      v34 = v33;
      if (v33) {
        -[STCoreOrganizationSettings setIsEyeReliefEnabled:](self, "setIsEyeReliefEnabled:", [v33 BOOLValue]);
      }
      v35 = [v4 objectForKeyedSubscript:@"isAppAndWebsiteActivityEnabled"];
      v36 = v35;
      if (v35) {
        -[STiCloudOrganizationSettings setIsAppAndWebsiteActivityEnabled:](self, "setIsAppAndWebsiteActivityEnabled:", [v35 BOOLValue]);
      }
      [(STUniquedManagedObject *)self updateUniqueIdentifier];

      BOOL v8 = 1;
      v37 = v43;
      id v7 = v44;
    }
    else
    {
      v37 = +[STLog persistence];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        -[STiCloudOrganizationSettings updateWithDictionaryRepresentation:]();
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v13.receiver = self;
  v13.super_class = (Class)STiCloudOrganizationSettings;
  id v4 = [(STCoreOrganizationSettings *)&v13 dictionaryRepresentation];
  v5 = [v3 dictionaryWithDictionary:v4];

  v6 = [(id)objc_opt_class() serializableClassName];
  [v5 setObject:v6 forKeyedSubscript:@"class"];

  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[STiCloudOrganizationSettings isAppAndWebsiteActivityEnabled](self, "isAppAndWebsiteActivityEnabled"));
  [v5 setObject:v7 forKeyedSubscript:@"isAppAndWebsiteActivityEnabled"];

  BOOL v8 = [(STiCloudOrganizationSettings *)self organization];
  v9 = [(id)objc_opt_class() serializableClassName];
  [v5 setObject:v9 forKeyedSubscript:@"organization"];

  v10 = [(STiCloudOrganizationSettings *)self recoveryAltDSID];
  [v5 setObject:v10 forKeyedSubscript:@"recoveryAltDSID"];

  v11 = (void *)[v5 copy];
  return v11;
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"user"])
  {
    [(STUniquedManagedObject *)self updateUniqueIdentifier];
  }
  else if ([v4 isEqualToString:@"passcode"])
  {
    v5 = [(STiCloudOrganizationSettings *)self passcode];

    if (!v5)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v6 = [(STiCloudOrganizationSettings *)self organization];
      id v7 = [v6 blueprints];

      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            objc_super v13 = [v12 users];
            v14 = [(STiCloudOrganizationSettings *)self user];
            int v15 = [v13 containsObject:v14];

            if (v15) {
              [(STCoreOrganizationSettings *)self _changeAppLimitsFromAskToWarn:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)STiCloudOrganizationSettings;
  [(STiCloudOrganizationSettings *)&v16 didChangeValueForKey:v4];
}

- (BOOL)validateForUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STiCloudOrganizationSettings;
  if (-[STiCloudOrganizationSettings validateForUpdate:](&v10, sel_validateForUpdate_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STiCloudOrganizationSettings *)self _validateNumberOfCloudSettings:v5];
    [(STiCloudOrganizationSettings *)self _validateUser:v5];
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STiCloudOrganizationSettings validateForUpdate:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STiCloudOrganizationSettings;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STiCloudOrganizationSettings validateForUpdate:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STiCloudOrganizationSettings;
  if (-[STiCloudOrganizationSettings validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STiCloudOrganizationSettings *)self _validateNumberOfCloudSettings:v5];
    [(STiCloudOrganizationSettings *)self _validateUser:v5];
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STiCloudOrganizationSettings validateForInsert:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STiCloudOrganizationSettings;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STiCloudOrganizationSettings validateForInsert:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STiCloudOrganizationSettings;
  return [(STiCloudOrganizationSettings *)&v4 validateForDelete:a3];
}

- (BOOL)_validateNumberOfCloudSettings:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = +[STiCloudOrganizationSettings fetchRequest];
  id v12 = 0;
  v5 = [v4 execute:&v12];
  id v6 = v12;
  if (v5)
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      BOOL v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14[0] = @"There must be no more than one cloud settings object.";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      objc_super v9 = [v7 errorWithDomain:@"STErrorDomain" code:533 userInfo:v8];
      [v3 addObject:v9];
    }
    BOOL v10 = [v3 count] == 0;
  }
  else
  {
    [v3 addObject:v6];
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_validateUser:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(STiCloudOrganizationSettings *)self user];
  id v6 = [v5 localUserDeviceState];

  if (!v6)
  {
    BOOL v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Cloud settings are assigned to a remote user. Cloud settings can only be assigned to a local user.";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_super v9 = [v7 errorWithDomain:@"STErrorDomain" code:534 userInfo:v8];
    [v4 addObject:v9];
  }
  BOOL v10 = [v4 count] == 0;

  return v10;
}

+ (NSString)serializableClassName
{
  return (NSString *)@"icset";
}

- (void)updateWithDictionaryRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to fetch organization: %{public}@", v2, v3, v4, v5, v6);
}

- (void)validateForUpdate:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for update on CloudOrganizationSettings failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForUpdate:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update on CloudOrganizationSettings failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for Insert on CloudOrganizationSettings failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for Insert on CloudOrganizationSettings failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end