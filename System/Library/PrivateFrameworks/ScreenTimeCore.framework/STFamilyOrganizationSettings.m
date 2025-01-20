@interface STFamilyOrganizationSettings
+ (NSString)serializableClassName;
- (BOOL)_validateOrganization:(id)a3;
- (BOOL)_validateUser:(id)a3;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSString)description;
- (id)computeUniqueIdentifier;
- (id)dictionaryRepresentation;
- (void)didChangeValueForKey:(id)a3;
@end

@implementation STFamilyOrganizationSettings

- (id)computeUniqueIdentifier
{
  v3 = [(STFamilyOrganizationSettings *)self user];

  if (v3)
  {
    v4 = NSString;
    v5 = [(id)objc_opt_class() serializableClassName];
    v6 = [(STFamilyOrganizationSettings *)self user];
    v7 = [v6 dsid];
    v8 = [v7 stringValue];
    v9 = [v4 stringWithFormat:@"%@:%@", v5, v8];
  }
  else
  {
    v9 = [(id)objc_opt_class() serializableClassName];
  }
  return v9;
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"user"])
  {
    [(STUniquedManagedObject *)self updateUniqueIdentifier];
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"passcode"])
  {
    v5 = [(STFamilyOrganizationSettings *)self passcode];

    if (!v5)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v21 = [(STFamilyOrganizationSettings *)self organization];
      v18 = [v21 blueprints];

      uint64_t v22 = [(STVersionVector *)v18 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(v18);
            }
            v26 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            v27 = [v26 users];
            v28 = [(STFamilyOrganizationSettings *)self user];
            int v29 = [v27 containsObject:v28];

            if (v29) {
              [(STCoreOrganizationSettings *)self _changeAppLimitsFromAskToWarn:v26];
            }
          }
          uint64_t v23 = [(STVersionVector *)v18 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v23);
      }
      goto LABEL_29;
    }
  }
  if (![v4 isEqualToString:@"isManaged"])
  {
    if (![v4 isEqualToString:@"isDirty"]
      || ![(STFamilyOrganizationSettings *)self isDirty])
    {
      goto LABEL_30;
    }
    v15 = [MEMORY[0x1E4F1C9C8] now];
    [(STFamilyOrganizationSettings *)self setModificationDate:v15];

    v16 = [STVersionVector alloc];
    v17 = [(STFamilyOrganizationSettings *)self versionVector];
    v18 = [(STVersionVector *)v16 initWithDataRepresentation:v17];

    v19 = STGetDeviceUUID();
    [(STVersionVector *)v18 incrementNodeWithIdentifier:v19];

    v20 = [(STVersionVector *)v18 dataRepresentation];
    [(STFamilyOrganizationSettings *)self setVersionVector:v20];

LABEL_29:
    goto LABEL_30;
  }
  if (([(STFamilyOrganizationSettings *)self isManaged] & 1) == 0)
  {
    [(STFamilyOrganizationSettings *)self setPasscode:0];
    v6 = [(STFamilyOrganizationSettings *)self managedObjectContext];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v7 = [(STFamilyOrganizationSettings *)self user];
    v8 = [v7 usages];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          v14 = +[STLog screentime];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[STFamilyOrganizationSettings didChangeValueForKey:]";
            __int16 v41 = 2112;
            uint64_t v42 = v13;
            _os_log_impl(&dword_1DA519000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting usage (%@)", buf, 0x16u);
          }

          [v6 deleteObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v10);
    }
  }
LABEL_30:
  v30.receiver = self;
  v30.super_class = (Class)STFamilyOrganizationSettings;
  [(STFamilyOrganizationSettings *)&v30 didChangeValueForKey:v4];
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v4 = (STVersionVector *)a3;
  v5 = [STVersionVector alloc];
  v6 = [(STFamilyOrganizationSettings *)self versionVector];
  v7 = [(STVersionVector *)v5 initWithDataRepresentation:v6];

  v8 = [(STVersionVector *)v7 nodes];
  uint64_t v9 = [v8 count];

  uint64_t v10 = [(STVersionVector *)v4 objectForKeyedSubscript:@"versionVector"];
  uint64_t v11 = [[STVersionVector alloc] initWithDataRepresentation:v10];
  if (!v7) {
    goto LABEL_51;
  }
  v12 = +[STLog versionVector];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [(STFamilyOrganizationSettings *)self user];
    v14 = [v13 dsid];
    *(_DWORD *)buf = 138412802;
    v92 = v14;
    __int16 v93 = 2112;
    v94 = v7;
    __int16 v95 = 2112;
    v96 = v11;
    _os_log_impl(&dword_1DA519000, v12, OS_LOG_TYPE_INFO, "COMPARE SETTINGS (%@): %@ vs %@", buf, 0x20u);
  }
  uint64_t v15 = [(STVersionVector *)v7 evaluateCausality:v11];
  uint64_t v16 = v15;
  switch(v15)
  {
    case 1:
      v17 = +[STLog versionVector];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:].cold.4();
      }
      break;
    case 3:
      v17 = +[STLog versionVector];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:].cold.7();
      }
      break;
    case 2:
      v17 = +[STLog versionVector];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:].cold.6();
      }
      break;
    default:
      if (v15) {
        goto LABEL_17;
      }
      v17 = +[STLog versionVector];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:].cold.5();
      }
      break;
  }

LABEL_17:
  [(STVersionVector *)v7 join:v11];
  v18 = [(STVersionVector *)v7 dataRepresentation];
  [(STFamilyOrganizationSettings *)self setVersionVector:v18];

  switch(v16)
  {
    case 1:
      v19 = +[STLog screentime];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v19, OS_LOG_TYPE_INFO, "Received family settings representation is out of date. Skipping update.", buf, 2u);
      }
      goto LABEL_44;
    case 3:
      long long v31 = +[STLog screentime];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        long long v32 = [(STFamilyOrganizationSettings *)self dictionaryRepresentation];
        *(_DWORD *)buf = 138412546;
        v92 = v32;
        __int16 v93 = 2112;
        v94 = v4;
        _os_log_impl(&dword_1DA519000, v31, OS_LOG_TYPE_INFO, "Family settings version clocks equal: %@ \n %@", buf, 0x16u);
      }
      if (v9)
      {
        BOOL v33 = 1;
        goto LABEL_88;
      }
      break;
    case 2:
      v20 = +[STLog screentime];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v20, OS_LOG_TYPE_DEFAULT, "Settings version clocks concurrent. Most recent modification wins", buf, 2u);
      }

      v21 = +[STLog screentime];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:](self, v21);
      }

      uint64_t v22 = +[STLog screentime];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:]();
      }

      v19 = [(STFamilyOrganizationSettings *)self modificationDate];
      uint64_t v23 = [(STVersionVector *)v4 objectForKeyedSubscript:@"modificationDate"];
      uint64_t v24 = +[STLog screentime];
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (v19 && v23)
      {
        if (v25)
        {
          *(_DWORD *)buf = 138412546;
          v92 = v19;
          __int16 v93 = 2112;
          v94 = v23;
          _os_log_impl(&dword_1DA519000, v24, OS_LOG_TYPE_DEFAULT, "Local modification date = %@, Incoming modification date = %@", buf, 0x16u);
        }

        uint64_t v26 = [v19 compare:v23];
        uint64_t v24 = +[STLog screentime];
        BOOL v27 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v26 != -1)
        {
          if (v27)
          {
            *(_DWORD *)buf = 138412546;
            v92 = v19;
            __int16 v93 = 2112;
            v94 = v23;
            v28 = "Local settings is more recently modified. We will ignore the received settings. Local = %@, Incoming = %@";
            int v29 = v24;
            uint32_t v30 = 22;
LABEL_42:
            _os_log_impl(&dword_1DA519000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
            goto LABEL_43;
          }
          goto LABEL_43;
        }
        if (!v27) {
          goto LABEL_50;
        }
        *(_DWORD *)buf = 138412546;
        v92 = v19;
        __int16 v93 = 2112;
        v94 = v23;
        long long v34 = "Received settings is more recently modified. We will overwrite the local settings. Local = %@, Incoming = %@";
        long long v35 = v24;
        uint32_t v36 = 22;
      }
      else
      {
        if (v19)
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            v28 = "Only the local blueprint has a modification date. We will ignore the received blueprint.";
            int v29 = v24;
            uint32_t v30 = 2;
            goto LABEL_42;
          }
LABEL_43:

LABEL_44:
          BOOL v33 = 0;
LABEL_87:

          goto LABEL_88;
        }
        if (!v25) {
          goto LABEL_50;
        }
        *(_WORD *)buf = 0;
        long long v34 = "Only the inboud blueprint has a modification date. We will overwrite the local blueprint.";
        long long v35 = v24;
        uint32_t v36 = 2;
      }
      _os_log_impl(&dword_1DA519000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
LABEL_50:

      break;
  }
LABEL_51:
  v90.receiver = self;
  v90.super_class = (Class)STFamilyOrganizationSettings;
  if ([(STCoreOrganizationSettings *)&v90 updateWithDictionaryRepresentation:v4])
  {
    int v37 = _os_feature_enabled_impl();
    long long v38 = [(STFamilyOrganizationSettings *)self managedObjectContext];
    if (v37)
    {
      uint64_t v89 = 0;
      v39 = (id *)&v89;
      uint64_t v40 = +[STFamilyOrganization fetchWithContext:v38 error:&v89];
    }
    else
    {
      uint64_t v88 = 0;
      v39 = (id *)&v88;
      uint64_t v40 = +[STFamilyOrganization fetchOrCreateFamilyOrganizationWithContext:v38 error:&v88];
    }
    __int16 v41 = (void *)v40;
    v19 = *v39;

    BOOL v33 = v41 != 0;
    if (!v41)
    {
      v73 = +[STLog persistence];
      if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
        -[STiCloudOrganizationSettings updateWithDictionaryRepresentation:]();
      }
      goto LABEL_86;
    }
    [(STFamilyOrganizationSettings *)self setOrganization:v41];
    char v76 = [(STFamilyOrganizationSettings *)self isManaged];
    uint64_t v42 = [(STVersionVector *)v4 objectForKeyedSubscript:@"isManaged"];
    -[STFamilyOrganizationSettings setIsManaged:](self, "setIsManaged:", [v42 BOOLValue]);

    v43 = [(STVersionVector *)v4 objectForKeyedSubscript:@"passcode"];
    [(STFamilyOrganizationSettings *)self setPasscode:v43];

    v44 = [(STVersionVector *)v4 objectForKeyedSubscript:@"allLimitsEnabled"];
    uint64_t v45 = v44;
    if (v44) {
      [(STFamilyOrganizationSettings *)self setAllLimitsEnabled:[v44 BOOLValue]];
    }
    v81 = v45;
    v46 = [(STVersionVector *)v4 objectForKeyedSubscript:@"defaultUserPolicies"];
    v47 = v46;
    if (v46) {
      -[STFamilyOrganizationSettings setDefaultUserPolicies:](self, "setDefaultUserPolicies:", [v46 longLongValue]);
    }
    v48 = [(STVersionVector *)v4 objectForKeyedSubscript:@"communicationPolicy"];
    v49 = v48;
    if (v48) {
      -[STFamilyOrganizationSettings setCommunicationPolicy:](self, "setCommunicationPolicy:", [v48 longLongValue]);
    }
    v80 = v49;
    v85 = v10;
    v50 = [(STVersionVector *)v4 objectForKeyedSubscript:@"communicationWhileLimitedPolicy"];
    v51 = v50;
    if (v50) {
      -[STFamilyOrganizationSettings setCommunicationWhileLimitedPolicy:](self, "setCommunicationWhileLimitedPolicy:", [v50 longLongValue]);
    }
    v52 = [(STVersionVector *)v4 objectForKeyedSubscript:@"contactManagementState"];
    v87 = v52;
    if (v52)
    {
      v53 = v47;
      uint64_t v54 = [v52 longLongValue];
      BOOL v55 = v54 == [(STFamilyOrganizationSettings *)self contactManagementState];
      v47 = v53;
      if (!v55) {
        -[STFamilyOrganizationSettings setContactManagementState:](self, "setContactManagementState:", [v87 longLongValue]);
      }
    }
    v56 = [(STVersionVector *)v4 objectForKeyedSubscript:@"contentPrivacySiriImageGenerationRestriction"];
    v86 = v56;
    if (v56)
    {
      v57 = v47;
      uint64_t v58 = [v56 longLongValue];
      BOOL v55 = v58 == [(STCoreOrganizationSettings *)self contentPrivacySiriImageGenerationRestriction];
      v47 = v57;
      if (!v55) {
        -[STCoreOrganizationSettings setContentPrivacySiriImageGenerationRestriction:](self, "setContentPrivacySiriImageGenerationRestriction:", [v86 longLongValue]);
      }
    }
    v84 = v11;
    v59 = [(STVersionVector *)v4 objectForKeyedSubscript:@"isCommunicationSafetySendingRestricted"];
    v60 = v59;
    if (v59) {
      -[STCoreOrganizationSettings setIsCommunicationSafetySendingRestricted:](self, "setIsCommunicationSafetySendingRestricted:", [v59 BOOLValue]);
    }
    v79 = v51;
    v61 = [(STVersionVector *)v4 objectForKeyedSubscript:@"isCommunicationSafetyReceivingRestricted"];
    v62 = v61;
    if (v61) {
      -[STCoreOrganizationSettings setIsCommunicationSafetyReceivingRestricted:](self, "setIsCommunicationSafetyReceivingRestricted:", [v61 BOOLValue]);
    }
    v77 = v62;
    v78 = v60;
    v63 = [(STVersionVector *)v4 objectForKeyedSubscript:@"isCommunicationSafetyNotificationEnabled"];
    v64 = v63;
    if (v63) {
      -[STFamilyOrganizationSettings setIsCommunicationSafetyNotificationEnabled:](self, "setIsCommunicationSafetyNotificationEnabled:", [v63 BOOLValue]);
    }
    v83 = v19;
    v65 = [(STVersionVector *)v4 objectForKeyedSubscript:@"isCommunicationSafetyAnalyticsEnabled"];
    v66 = v65;
    if (v65) {
      -[STFamilyOrganizationSettings setIsCommunicationSafetyAnalyticsEnabled:](self, "setIsCommunicationSafetyAnalyticsEnabled:", [v65 BOOLValue]);
    }
    v82 = v41;
    v67 = [(STVersionVector *)v4 objectForKeyedSubscript:@"isEyeReliefEnabled"];
    v68 = v67;
    if (v67) {
      -[STCoreOrganizationSettings setIsEyeReliefEnabled:](self, "setIsEyeReliefEnabled:", [v67 BOOLValue]);
    }
    v69 = [(STVersionVector *)v4 objectForKeyedSubscript:@"isAppAndWebsiteActivityEnabled"];
    v70 = v69;
    if (!v69)
    {
      char v75 = [(STFamilyOrganizationSettings *)self isManaged];
      if (v76)
      {
        if (v75) {
          goto LABEL_83;
        }
        v70 = (void *)MEMORY[0x1E4F1CC28];
      }
      else
      {
        if ((v75 & 1) == 0) {
          goto LABEL_83;
        }
        v70 = (void *)MEMORY[0x1E4F1CC38];
      }
    }
    [(STFamilyOrganizationSettings *)self setIsAppAndWebsiteActivityEnabled:v70];
LABEL_83:
    [(STVersionVector *)v7 dataRepresentation];
    v72 = v71 = v47;
    [(STFamilyOrganizationSettings *)self setVersionVector:v72];

    uint64_t v11 = v84;
    uint64_t v10 = v85;
    __int16 v41 = v82;
    v19 = v83;
    v73 = v81;
LABEL_86:

    goto LABEL_87;
  }
  BOOL v33 = 0;
LABEL_88:

  return v33;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v16.receiver = self;
  v16.super_class = (Class)STFamilyOrganizationSettings;
  id v4 = [(STCoreOrganizationSettings *)&v16 dictionaryRepresentation];
  v5 = [v3 dictionaryWithDictionary:v4];

  v6 = [(id)objc_opt_class() serializableClassName];
  [v5 setObject:v6 forKeyedSubscript:@"class"];

  v7 = [(STFamilyOrganizationSettings *)self organization];
  v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  [v5 setObject:v9 forKeyedSubscript:@"organization"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[STFamilyOrganizationSettings isManaged](self, "isManaged"));
  [v5 setObject:v10 forKeyedSubscript:@"isManaged"];

  uint64_t v11 = [(STFamilyOrganizationSettings *)self versionVector];
  [v5 setObject:v11 forKeyedSubscript:@"versionVector"];

  v12 = [(STFamilyOrganizationSettings *)self isAppAndWebsiteActivityEnabled];

  if (v12)
  {
    uint64_t v13 = [(STFamilyOrganizationSettings *)self isAppAndWebsiteActivityEnabled];
    [v5 setObject:v13 forKeyedSubscript:@"isAppAndWebsiteActivityEnabled"];
  }
  v14 = (void *)[v5 copy];

  return v14;
}

- (NSString)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)STFamilyOrganizationSettings;
  id v4 = [(STCoreOrganizationSettings *)&v11 description];
  unsigned int v5 = [(STFamilyOrganizationSettings *)self isDirty];
  unsigned int v6 = [(STFamilyOrganizationSettings *)self isManaged];
  unsigned int v7 = [(STFamilyOrganizationSettings *)self shareWebUsage];
  v8 = [(STFamilyOrganizationSettings *)self isAppAndWebsiteActivityEnabled];
  uint64_t v9 = [v3 stringWithFormat:@"%@, ({\n isDirty: %d\n isManaged: %d\n shareWebUsage: %d\n isAppAndWebsiteActivityEnabled: %@\n})", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STFamilyOrganizationSettings;
  if (-[STFamilyOrganizationSettings validateForUpdate:](&v10, sel_validateForUpdate_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    unsigned int v5 = objc_opt_new();
    [(STFamilyOrganizationSettings *)self _validateUser:v5];
    [(STFamilyOrganizationSettings *)self _validateOrganization:v5];
    if ([v5 count])
    {
      unsigned int v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STFamilyOrganizationSettings validateForUpdate:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STFamilyOrganizationSettings;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    unsigned int v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STFamilyOrganizationSettings validateForUpdate:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STFamilyOrganizationSettings;
  if (-[STFamilyOrganizationSettings validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    unsigned int v5 = objc_opt_new();
    [(STFamilyOrganizationSettings *)self _validateUser:v5];
    [(STFamilyOrganizationSettings *)self _validateOrganization:v5];
    if ([v5 count])
    {
      unsigned int v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STFamilyOrganizationSettings validateForInsert:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STFamilyOrganizationSettings;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    unsigned int v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STFamilyOrganizationSettings validateForInsert:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STFamilyOrganizationSettings;
  return [(STFamilyOrganizationSettings *)&v4 validateForDelete:a3];
}

- (BOOL)_validateOrganization:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [(STFamilyOrganizationSettings *)self organization];

  if (!v5)
  {
    unsigned int v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Family settings is not related to an organization. This is not supported.";
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v8 = [v6 errorWithDomain:@"STErrorDomain" code:507 userInfo:v7];
    [v4 addObject:v8];
  }
  BOOL v9 = [v4 count] == 0;

  return v9;
}

- (BOOL)_validateUser:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [(STFamilyOrganizationSettings *)self user];
  uint64_t v6 = [v5 familyMemberType];
  BOOL v7 = (uint64_t *)MEMORY[0x1E4F28568];
  if (v6)
  {
    v8 = (void *)v6;
    BOOL v9 = [(STFamilyOrganizationSettings *)self user];
    objc_super v10 = [v9 familyMemberType];

    if (v10 != @"Unknown") {
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v23 = *v7;
  v24[0] = @"Family settings are assigned to a user that is not in a family. This is not supported.";
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  uint64_t v13 = [v11 errorWithDomain:@"STErrorDomain" code:536 userInfo:v12];
  [v4 addObject:v13];

LABEL_6:
  v14 = [(STFamilyOrganizationSettings *)self user];
  int v15 = [v14 isParent];

  if (v15)
  {
    objc_super v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *v7;
    uint64_t v22 = @"Family settings are assigned to a guardian. This is not supported.";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v18 = [v16 errorWithDomain:@"STErrorDomain" code:535 userInfo:v17];
    [v4 addObject:v18];
  }
  BOOL v19 = [v4 count] == 0;

  return v19;
}

+ (NSString)serializableClassName
{
  return (NSString *)@"famset";
}

- (void)updateWithDictionaryRepresentation:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEBUG, "R: %@", v1, 0xCu);
}

- (void)updateWithDictionaryRepresentation:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3 = [a1 dictionaryRepresentation];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DA519000, a2, OS_LOG_TYPE_DEBUG, "L: %@", v4, 0xCu);
}

- (void)updateWithDictionaryRepresentation:.cold.4()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Local newer", v2, v3, v4, v5, v6);
}

- (void)updateWithDictionaryRepresentation:.cold.5()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Local older", v2, v3, v4, v5, v6);
}

- (void)updateWithDictionaryRepresentation:.cold.6()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Concurrent", v2, v3, v4, v5, v6);
}

- (void)updateWithDictionaryRepresentation:.cold.7()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Local equal", v2, v3, v4, v5, v6);
}

- (void)validateForUpdate:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for update on FamilyOrganizationSettings failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForUpdate:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update on FamilyOrganizationSettings failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for Insert on FamilyOrganizationSettings failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for Insert on FamilyOrganizationSettings failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end