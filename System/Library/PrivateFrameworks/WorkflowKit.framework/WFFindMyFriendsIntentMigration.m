@interface WFFindMyFriendsIntentMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
+ (id)classNameConversion;
+ (id)launchIdConversion;
+ (id)parameterConversion;
- (BOOL)convertParametersAndUpdateIntent:(id *)a3;
- (BOOL)updateBundleIdentifierForIntent:(id)a3;
- (BOOL)updateClassNameForIntent:(id)a3;
- (void)migrateWorkflow;
@end

@implementation WFFindMyFriendsIntentMigration

- (BOOL)convertParametersAndUpdateIntent:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = *a3;
  v5 = [v4 launchId];
  v6 = [v4 _className];
  v7 = +[WFFindMyFriendsIntentMigration parameterConversion];
  v8 = [v7 objectForKeyedSubscript:v5];
  v9 = [v8 objectForKeyedSubscript:v6];
  v10 = [v4 backingStore];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v5, 0);
    [MEMORY[0x1E4F304C8] sharedConnection];
    v44 = id v51 = 0;
    v45 = (void *)v11;
    v12 = [v44 loadSchemasForBundleIdentifiers:v11 error:&v51];
    id v13 = v51;
    v46 = [v12 objectForKey:v5];

    if (v13)
    {
      v14 = getWFWorkflowMigrationLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v54 = "-[WFFindMyFriendsIntentMigration convertParametersAndUpdateIntent:]";
        __int16 v55 = 2114;
        v56 = v5;
        __int16 v57 = 2114;
        v58 = v6;
        __int16 v59 = 2114;
        id v60 = v13;
        _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Error loading schema for %{public}@ when converting %{public}@: %{public}@", buf, 0x2Au);
      }
    }
    v43 = v13;
    if (v46)
    {
      v38 = a3;
      v39 = v8;
      v40 = v7;
      v42 = v5;
      id v15 = objc_alloc(MEMORY[0x1E4F304D0]);
      [v4 identifier];
      v17 = v16 = v10;
      v41 = v6;
      v18 = (void *)[v15 _initWithIdentifier:v17 schema:v46 name:v6 data:0];

      v37 = v16;
      v19 = [v16 _objectDescription];
      v20 = [v19 attributes];
      v21 = [v20 allValues];
      v22 = [v21 valueForKey:@"propertyName"];

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v48 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            uint64_t v29 = [v9 objectForKeyedSubscript:v28];
            v30 = (void *)v29;
            if (v29) {
              v31 = (void *)v29;
            }
            else {
              v31 = v28;
            }
            id v32 = v31;

            v33 = [v4 valueForKey:v28];
            [v18 setValue:v33 forKey:v32];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v25);
      }

      id v34 = v18;
      id *v38 = v34;
      BOOL v35 = [v9 count] != 0;

      v6 = v41;
      v5 = v42;
      v8 = v39;
      v7 = v40;
      v10 = v37;
    }
    else
    {
      BOOL v35 = 0;
    }
  }
  else
  {

    BOOL v35 = 0;
  }

  return v35;
}

- (BOOL)updateClassNameForIntent:(id)a3
{
  id v3 = a3;
  id v4 = +[WFFindMyFriendsIntentMigration classNameConversion];
  v5 = [v3 launchId];
  v6 = [v4 objectForKeyedSubscript:v5];

  v7 = [v3 _className];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = [v3 _codableDescription];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v9 setClassName:v8];
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)updateBundleIdentifierForIntent:(id)a3
{
  id v3 = a3;
  id v4 = +[WFFindMyFriendsIntentMigration launchIdConversion];
  v5 = [v3 launchId];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    [v3 _setLaunchId:v6];
  }

  return v6 != 0;
}

- (void)migrateWorkflow
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v32;
    v7 = @"is.workflow.actions.sirikit.donation.handle";
    *(void *)&long long v4 = 136315394;
    long long v26 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v27 = v5;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
        BOOL v10 = [(WFWorkflowMigration *)self actionIdentifierKey];
        uint64_t v11 = [v9 objectForKey:v10];
        int v12 = [v11 isEqualToString:v7];

        if (v12)
        {
          id v13 = [(WFWorkflowMigration *)self actionParametersKey];
          v14 = [v9 objectForKey:v13];

          uint64_t v15 = WFExtractDonatedIntentFromSerializedParameters(v14);
          if (v15)
          {
            v16 = (void *)v15;
            uint64_t v17 = v6;
            v18 = v7;
            BOOL v19 = [(WFFindMyFriendsIntentMigration *)self updateBundleIdentifierForIntent:v15];
            BOOL v20 = [(WFFindMyFriendsIntentMigration *)self updateClassNameForIntent:v16];
            id v30 = v16;
            BOOL v21 = [(WFFindMyFriendsIntentMigration *)self convertParametersAndUpdateIntent:&v30];
            id v22 = v30;

            if (v19 || v20 || v21)
            {
              id v29 = 0;
              id v23 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v22 requiringSecureCoding:1 error:&v29];
              id v24 = v29;
              if (v23)
              {
                [v14 setObject:v23 forKey:@"IntentData"];
                v7 = v18;
              }
              else
              {
                uint64_t v25 = getWFWorkflowMigrationLogObject();
                v7 = v18;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v26;
                  v36 = "-[WFFindMyFriendsIntentMigration migrateWorkflow]";
                  __int16 v37 = 2114;
                  id v38 = v24;
                  _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_ERROR, "%s Error archiving intent data: %{public}@", buf, 0x16u);
                }
              }
              uint64_t v6 = v17;
            }
            else
            {
              v7 = v18;
              uint64_t v6 = v17;
            }
            uint64_t v5 = v27;
          }
          else
          {
            id v22 = 0;
          }
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)self finish];
}

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a4;
  if (WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.sirikit.donation.handle", a3)) {
    BOOL v6 = WFCompareBundleVersions(v5, @"900") == 3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)parameterConversion
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"LocateDeviceIntent";
  v5[1] = @"PlaySoundIntent";
  v6[0] = &unk_1F2318070;
  v6[1] = &unk_1F2318098;
  v7 = @"com.apple.findmy";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v8[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v3;
}

+ (id)classNameConversion
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"com.apple.findmy";
  v5[0] = @"FMIPLocateIntent";
  v5[1] = @"FMIPPlaySoundIntent";
  v6[0] = @"LocateDeviceIntent";
  v6[1] = @"PlaySoundIntent";
  void v5[2] = @"FMFLocateIntent";
  void v6[2] = @"LocateIntent";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  v8[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v3;
}

+ (id)launchIdConversion
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.mobileme.fmf1";
  v4[1] = @"com.apple.mobileme.fmip1";
  v5[0] = @"com.apple.findmy";
  v5[1] = @"com.apple.findmy";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end