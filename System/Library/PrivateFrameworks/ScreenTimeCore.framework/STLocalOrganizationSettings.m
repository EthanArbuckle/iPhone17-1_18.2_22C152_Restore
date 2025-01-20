@interface STLocalOrganizationSettings
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (id)dictionaryRepresentation;
- (void)didChangeValueForKey:(id)a3;
@end

@implementation STLocalOrganizationSettings

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)STLocalOrganizationSettings;
  if ([(STCoreOrganizationSettings *)&v44 updateWithDictionaryRepresentation:v4])
  {
    v5 = [(STLocalOrganizationSettings *)self managedObjectContext];
    id v43 = 0;
    v6 = +[STLocalOrganization fetchOrCreateLocalOrganizationWithContext:v5 error:&v43];
    id v7 = v43;

    BOOL v8 = v6 != 0;
    if (v6)
    {
      [(STLocalOrganizationSettings *)self setOrganization:v6];
      v9 = [v4 objectForKeyedSubscript:@"passcode"];
      [(STLocalOrganizationSettings *)self setPasscode:v9];

      v10 = [v4 objectForKeyedSubscript:@"recoveryAltDSID"];
      [(STLocalOrganizationSettings *)self setRecoveryAltDSID:v10];

      v11 = [v4 objectForKeyedSubscript:@"allLimitsEnabled"];
      v12 = v11;
      if (v11) {
        [(STLocalOrganizationSettings *)self setAllLimitsEnabled:[v11 BOOLValue]];
      }
      v13 = [v4 objectForKeyedSubscript:@"defaultUserPolicies"];
      v14 = v13;
      if (v13) {
        -[STLocalOrganizationSettings setDefaultUserPolicies:](self, "setDefaultUserPolicies:", [v13 longLongValue]);
      }
      v15 = [v4 objectForKeyedSubscript:@"communicationPolicy"];
      v16 = v15;
      if (v15) {
        -[STLocalOrganizationSettings setCommunicationPolicy:](self, "setCommunicationPolicy:", [v15 longLongValue]);
      }
      v17 = [v4 objectForKeyedSubscript:@"communicationWhileLimitedPolicy"];
      v18 = v17;
      if (v17) {
        -[STLocalOrganizationSettings setCommunicationWhileLimitedPolicy:](self, "setCommunicationWhileLimitedPolicy:", [v17 longLongValue]);
      }
      v40 = v14;
      v41 = v12;
      v19 = [v4 objectForKeyedSubscript:@"contactManagementState"];
      v20 = v19;
      if (v19)
      {
        uint64_t v21 = [v19 longLongValue];
        if (v21 != [(STLocalOrganizationSettings *)self contactManagementState]) {
          -[STLocalOrganizationSettings setContactManagementState:](self, "setContactManagementState:", [v20 longLongValue]);
        }
      }
      v39 = v16;
      v22 = [v4 objectForKeyedSubscript:@"contentPrivacySiriImageGenerationRestriction"];
      v23 = v22;
      if (v22)
      {
        uint64_t v24 = [v22 longLongValue];
        if (v24 != -[STCoreOrganizationSettings contentPrivacySiriImageGenerationRestriction](self, "contentPrivacySiriImageGenerationRestriction"))-[STCoreOrganizationSettings setContentPrivacySiriImageGenerationRestriction:](self, "setContentPrivacySiriImageGenerationRestriction:", [v23 longLongValue]); {
      }
        }
      v38 = v18;
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
      v42 = v6;
      v29 = [v4 objectForKeyedSubscript:@"isCommunicationSafetyNotificationEnabled"];
      v30 = v29;
      if (v29) {
        -[STLocalOrganizationSettings setIsCommunicationSafetyNotificationEnabled:](self, "setIsCommunicationSafetyNotificationEnabled:", [v29 BOOLValue]);
      }
      id v31 = v7;
      v32 = [v4 objectForKeyedSubscript:@"isCommunicationSafetyAnalyticsEnabled"];
      v33 = v32;
      if (v32) {
        -[STLocalOrganizationSettings setIsCommunicationSafetyAnalyticsEnabled:](self, "setIsCommunicationSafetyAnalyticsEnabled:", [v32 BOOLValue]);
      }
      v34 = [v4 objectForKeyedSubscript:@"isEyeReliefEnabled"];
      v35 = v34;
      if (v34) {
        -[STCoreOrganizationSettings setIsEyeReliefEnabled:](self, "setIsEyeReliefEnabled:", [v34 BOOLValue]);
      }

      BOOL v8 = 1;
      id v7 = v31;
      v36 = v41;
      v6 = v42;
    }
    else
    {
      v36 = +[STLog persistence];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        -[STLocalOrganizationSettings updateWithDictionaryRepresentation:]();
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
  v12.receiver = self;
  v12.super_class = (Class)STLocalOrganizationSettings;
  id v4 = [(STCoreOrganizationSettings *)&v12 dictionaryRepresentation];
  v5 = [v3 dictionaryWithDictionary:v4];

  v6 = [(STLocalOrganizationSettings *)self organization];
  id v7 = (objc_class *)objc_opt_class();
  BOOL v8 = NSStringFromClass(v7);
  [v5 setObject:v8 forKeyedSubscript:@"organization"];

  v9 = [(STLocalOrganizationSettings *)self recoveryAltDSID];
  [v5 setObject:v9 forKeyedSubscript:@"recoveryAltDSID"];

  v10 = (void *)[v5 copy];
  return v10;
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"passcode"])
  {
    [(STLocalOrganizationSettings *)self setNeedsToSetPasscode:0];
    v5 = [(STLocalOrganizationSettings *)self passcode];

    if (!v5)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v6 = [(STLocalOrganizationSettings *)self organization];
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
            objc_super v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            v13 = [v12 users];
            v14 = [(STLocalOrganizationSettings *)self user];
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
  v16.super_class = (Class)STLocalOrganizationSettings;
  [(STLocalOrganizationSettings *)&v16 didChangeValueForKey:v4];
}

- (void)updateWithDictionaryRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "could not fetch local organization: %{public}@", v2, v3, v4, v5, v6);
}

@end