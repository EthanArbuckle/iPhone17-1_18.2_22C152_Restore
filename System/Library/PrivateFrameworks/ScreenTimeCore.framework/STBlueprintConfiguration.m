@interface STBlueprintConfiguration
+ (Class)cemDeclarationClassForConfigurationType:(id)a3;
+ (id)blueprintConfigurationTypeForDeclaration:(id)a3;
+ (id)blueprintConfigurationTypeForDeclarationType:(id)a3;
+ (id)cemConfigurationIdentifierWithType:(id)a3 forUser:(id)a4;
+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchRequestMatchingBlueprintsConfigurationForBlueprint:(id)a3 ofType:(id)a4 includeTombstones:(BOOL)a5;
+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4;
- (BOOL)_validateBlueprint:(id)a3;
- (BOOL)_validateIdentifier:(id)a3;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (id)_createIdentifierSubstringForBlueprintType:(id)a3 organization:(id)a4 configType:(id)a5 identifier:(id)a6 error:(id)a7;
- (id)_organizationStr:(id)a3;
- (id)cemConfiguration;
- (id)dictionaryRepresentation;
- (void)cemConfiguration;
- (void)setCemConfiguration:(id)a3;
@end

@implementation STBlueprintConfiguration

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"identifier"];
  [(STBlueprintConfiguration *)self setIdentifier:v5];

  v6 = [v4 objectForKeyedSubscript:@"type"];
  [(STBlueprintConfiguration *)self setType:v6];

  v7 = [v4 objectForKeyedSubscript:@"payloadPlist"];

  [(STBlueprintConfiguration *)self setPayloadPlist:v7];
  return 1;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(STBlueprintConfiguration *)self identifier];
  [v3 setObject:v4 forKeyedSubscript:@"identifier"];

  v5 = [(STBlueprintConfiguration *)self type];
  [v3 setObject:v5 forKeyedSubscript:@"type"];

  v6 = [(STBlueprintConfiguration *)self payloadPlist];
  [v3 setObject:v6 forKeyedSubscript:@"payloadPlist"];

  v7 = (void *)[v3 copy];
  return v7;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 objectForKeyedSubscript:@"identifier"];
  v11 = [a1 fetchRequest];
  v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v10];
  [v11 setPredicate:v12];

  v13 = [v11 execute:a5];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 firstObject];
    if (!v15)
    {
      v15 = [[STBlueprintConfiguration alloc] initWithContext:v9];
      v16 = [v8 objectForKeyedSubscript:@"identifier"];
      [(STBlueprintConfiguration *)v15 setIdentifier:v16];
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 fetchRequest];
  id v9 = &unk_1F349EC20;
  if (v7) {
    id v9 = v7;
  }
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@ AND %K == NO", v9, @"blueprint.users.dsid", @"blueprint.type", v6, @"blueprint.isTombstoned"];

  [v8 setPredicate:v10];
  return v8;
}

+ (id)fetchRequestMatchingBlueprintsConfigurationForBlueprint:(id)a3 ofType:(id)a4 includeTombstones:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [a1 fetchRequest];
  if (v5) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ AND %K == %@", @"type", v8, @"blueprint", v9, v13];
  }
  else {
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ AND %K == %@ AND %K == NO", @"type", v8, @"blueprint", v9, @"blueprint.isTombstoned"];
  }

  [v10 setPredicate:v11];
  return v10;
}

+ (id)cemConfigurationIdentifierWithType:(id)a3 forUser:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 localUserDeviceState];

  id v8 = [v6 familySettings];
  int v9 = [v8 isManaged];

  v10 = (void *)[@"digital_health_restrictions" mutableCopy];
  if (!v7 && v9)
  {
    v11 = [v6 dsid];
    [v10 appendFormat:@".%@", v11];
  }
  [v10 appendFormat:@".%@", v5];

  return v10;
}

+ (Class)cemDeclarationClassForConfigurationType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"legacy.restrictions.apps"] & 1) != 0
    || ([v3 isEqualToString:@"system.camera"] & 1) != 0
    || ([v3 isEqualToString:@"system.siri"] & 1) != 0
    || ([v3 isEqualToString:@"system.airdrop"] & 1) != 0
    || ([v3 isEqualToString:@"system.carplay"] & 1) != 0
    || ([v3 isEqualToString:@"media.settings"] & 1) != 0
    || ([v3 isEqualToString:@"application.store"] & 1) != 0
    || ([v3 isEqualToString:@"system.ratings"] & 1) != 0
    || ([v3 isEqualToString:@"system.music"] & 1) != 0
    || ([v3 isEqualToString:@"system.webcontentfilter.basic"] & 1) != 0
    || ([v3 isEqualToString:@"system.gamecenter"] & 1) != 0
    || ([v3 isEqualToString:@"passcode.settings"] & 1) != 0
    || ([v3 isEqualToString:@"account.settings"] & 1) != 0
    || ([v3 isEqualToString:@"network.cellular.settings"] & 1) != 0
    || ([v3 isEqualToString:@"system.donotdisturb"] & 1) != 0
    || ([v3 isEqualToString:@"system.tvprovider"] & 1) != 0
    || [v3 isEqualToString:@"application.settings"])
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }

  return (Class)v4;
}

+ (id)blueprintConfigurationTypeForDeclaration:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = @"legacy.restrictions.apps";
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = @"system.camera";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = @"system.siri";
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = @"system.airdrop";
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v4 = @"system.carplay";
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v4 = @"media.settings";
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v4 = @"application.store";
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v4 = @"system.ratings";
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v4 = @"system.music";
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v4 = @"system.webcontentfilter.basic";
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v4 = @"system.gamecenter";
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v4 = @"passcode.settings";
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v4 = @"account.settings";
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v4 = @"network.cellular.settings";
                            }
                            else
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v4 = @"system.donotdisturb";
                              }
                              else
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v4 = @"system.tvprovider";
                                }
                                else
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v4 = @"application.settings";
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass()) {
                                      id v4 = @"system.icloud";
                                    }
                                    else {
                                      id v4 = 0;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

+ (id)blueprintConfigurationTypeForDeclarationType:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F59F68] registeredIdentifier];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = STBlueprintTypeAlwaysAllowedApps;
LABEL_5:
    int v9 = *v6;
    goto LABEL_6;
  }
  id v7 = [MEMORY[0x1E4F59F70] registeredIdentifier];
  char v8 = [v3 isEqualToString:v7];

  if (v8)
  {
    id v6 = STBlueprintTypeDowntime;
    goto LABEL_5;
  }
  v11 = [MEMORY[0x1E4F59F48] registeredIdentifier];
  char v12 = [v3 isEqualToString:v11];

  if (v12)
  {
    int v9 = @"legacy.restrictions.apps";
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F5A000] registeredIdentifier];
    char v14 = [v3 isEqualToString:v13];

    if (v14)
    {
      int v9 = @"system.camera";
    }
    else
    {
      v15 = [MEMORY[0x1E4F5A038] registeredIdentifier];
      char v16 = [v3 isEqualToString:v15];

      if (v16)
      {
        int v9 = @"system.siri";
      }
      else
      {
        v17 = [MEMORY[0x1E4F59FE8] registeredIdentifier];
        char v18 = [v3 isEqualToString:v17];

        if (v18)
        {
          int v9 = @"system.airdrop";
        }
        else
        {
          v19 = [MEMORY[0x1E4F5A008] registeredIdentifier];
          char v20 = [v3 isEqualToString:v19];

          if (v20)
          {
            int v9 = @"system.carplay";
          }
          else
          {
            v21 = [MEMORY[0x1E4F59F50] registeredIdentifier];
            char v22 = [v3 isEqualToString:v21];

            if (v22)
            {
              int v9 = @"media.settings";
            }
            else
            {
              v23 = [MEMORY[0x1E4F59F30] registeredIdentifier];
              char v24 = [v3 isEqualToString:v23];

              if (v24)
              {
                int v9 = @"application.store";
              }
              else
              {
                v25 = [MEMORY[0x1E4F5A030] registeredIdentifier];
                char v26 = [v3 isEqualToString:v25];

                if (v26)
                {
                  int v9 = @"system.ratings";
                }
                else
                {
                  v27 = [MEMORY[0x1E4F5A028] registeredIdentifier];
                  char v28 = [v3 isEqualToString:v27];

                  if (v28)
                  {
                    int v9 = @"system.music";
                  }
                  else
                  {
                    v29 = [MEMORY[0x1E4F59FF0] registeredIdentifier];
                    char v30 = [v3 isEqualToString:v29];

                    if (v30)
                    {
                      int v9 = @"system.webcontentfilter.basic";
                    }
                    else
                    {
                      v31 = [MEMORY[0x1E4F5A020] registeredIdentifier];
                      char v32 = [v3 isEqualToString:v31];

                      if (v32)
                      {
                        int v9 = @"system.gamecenter";
                      }
                      else
                      {
                        v33 = [MEMORY[0x1E4F59F60] registeredIdentifier];
                        char v34 = [v3 isEqualToString:v33];

                        if (v34)
                        {
                          int v9 = @"passcode.settings";
                        }
                        else
                        {
                          v35 = [MEMORY[0x1E4F59F18] registeredIdentifier];
                          char v36 = [v3 isEqualToString:v35];

                          if (v36)
                          {
                            int v9 = @"account.settings";
                          }
                          else
                          {
                            v37 = [MEMORY[0x1E4F59F58] registeredIdentifier];
                            char v38 = [v3 isEqualToString:v37];

                            if (v38)
                            {
                              int v9 = @"network.cellular.settings";
                            }
                            else
                            {
                              v39 = [MEMORY[0x1E4F5A018] registeredIdentifier];
                              char v40 = [v3 isEqualToString:v39];

                              if (v40)
                              {
                                int v9 = @"system.donotdisturb";
                              }
                              else
                              {
                                v41 = [MEMORY[0x1E4F5A040] registeredIdentifier];
                                char v42 = [v3 isEqualToString:v41];

                                if (v42)
                                {
                                  int v9 = @"system.tvprovider";
                                }
                                else
                                {
                                  v43 = [MEMORY[0x1E4F59F28] registeredIdentifier];
                                  char v44 = [v3 isEqualToString:v43];

                                  if (v44)
                                  {
                                    int v9 = @"application.settings";
                                  }
                                  else
                                  {
                                    v45 = [MEMORY[0x1E4F5A050] registeredIdentifier];
                                    int v46 = [v3 isEqualToString:v45];

                                    if (v46) {
                                      int v9 = @"system.icloud";
                                    }
                                    else {
                                      int v9 = 0;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_6:

  return v9;
}

- (id)cemConfiguration
{
  id v3 = [(STBlueprintConfiguration *)self payloadPlist];
  if (v3)
  {
    id v4 = [(STBlueprintConfiguration *)self type];

    if (v4)
    {
      char v5 = (void *)MEMORY[0x1E4F59F38];
      id v6 = [(STBlueprintConfiguration *)self payloadPlist];
      id v10 = 0;
      id v3 = [v5 declarationForData:v6 error:&v10];
      id v7 = v10;

      if (!v3)
      {
        char v8 = +[STLog blueprint];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[STBlueprintConfiguration cemConfiguration](self);
        }
      }
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (void)setCemConfiguration:(id)a3
{
  id v4 = a3;
  id v8 = 0;
  char v5 = [v4 serializeAsDataWithError:&v8];
  id v6 = v8;
  if (v5)
  {
    [(STBlueprintConfiguration *)self setPayloadPlist:v5];
  }
  else
  {
    id v7 = +[STLog blueprint];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[STBlueprintConfiguration setCemConfiguration:](v4);
    }
  }
}

- (BOOL)validateForUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprintConfiguration;
  if (-[STBlueprintConfiguration validateForUpdate:](&v10, sel_validateForUpdate_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    char v5 = objc_opt_new();
    [(STBlueprintConfiguration *)self _validateBlueprint:v5];
    [(STBlueprintConfiguration *)self _validateIdentifier:v5];
    if ([v5 count])
    {
      id v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STBlueprintConfiguration validateForUpdate:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STBlueprintConfiguration;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    char v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STBlueprintConfiguration validateForUpdate:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprintConfiguration;
  if (-[STBlueprintConfiguration validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    char v5 = objc_opt_new();
    [(STBlueprintConfiguration *)self _validateBlueprint:v5];
    [(STBlueprintConfiguration *)self _validateIdentifier:v5];
    if ([v5 count])
    {
      id v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STBlueprintConfiguration validateForInsert:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STBlueprintConfiguration;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    char v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STBlueprintConfiguration validateForInsert:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STBlueprintConfiguration;
  BOOL v3 = [(STBlueprintConfiguration *)&v5 validateForDelete:a3];
  if (v3) {
    _os_feature_enabled_impl();
  }
  return v3;
}

- (BOOL)_validateBlueprint:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[STBlueprintConfiguration fetchRequest];
  id v32 = 0;
  objc_super v5 = [v4 execute:&v32];
  id v6 = v32;
  BOOL v7 = v6;
  if (v5)
  {
    id v25 = v6;
    char v26 = v4;
    v27 = v3;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    char v24 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      uint64_t v12 = *MEMORY[0x1E4F28568];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          char v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v15 = [v14 blueprint];

          if (!v15)
          {
            char v16 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v33 = v12;
            v17 = NSString;
            char v18 = [v14 identifier];
            v19 = [v17 stringWithFormat:@"Blueprint is missing for BlueprintConfigruation identifier: %@", v18];
            char v34 = v19;
            char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
            v21 = [v16 errorWithDomain:@"STErrorDomain" code:550 userInfo:v20];
            [v27 addObject:v21];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v10);
    }

    id v3 = v27;
    BOOL v22 = [v27 count] == 0;
    BOOL v7 = v25;
    id v4 = v26;
    objc_super v5 = v24;
  }
  else
  {
    [v3 addObject:v6];
    BOOL v22 = 0;
  }

  return v22;
}

- (id)_organizationStr:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return @"family";
  }
  else {
    return @"personal";
  }
}

- (BOOL)_validateIdentifier:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v4 = +[STBlueprintConfiguration fetchRequest];
  id v45 = 0;
  objc_super v5 = [v4 execute:&v45];
  id v6 = v45;
  BOOL v7 = v6;
  if (v5)
  {
    id v32 = v6;
    uint64_t v33 = v4;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v31 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      uint64_t v34 = *MEMORY[0x1E4F28568];
      v35 = self;
      uint64_t v37 = *(void *)v42;
      do
      {
        uint64_t v12 = 0;
        uint64_t v38 = v10;
        do
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
          if (v13)
          {
            char v14 = [*(id *)(*((void *)&v41 + 1) + 8 * v12) blueprint];

            if (v14)
            {
              v15 = [v13 blueprint];
              uint64_t v16 = [v15 type];

              v17 = [v13 blueprint];
              char v18 = [v17 organization];

              v19 = [(STBlueprintConfiguration *)self _organizationStr:v18];
              char v20 = [v13 identifier];
              v21 = [v13 type];
              char v40 = (void *)v16;
              BOOL v22 = [(STBlueprintConfiguration *)self _createIdentifierSubstringForBlueprintType:v16 organization:v19 configType:v21 identifier:v20 error:v39];
              if (v22 && ([v20 containsString:v22] & 1) == 0)
              {
                v23 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v46 = v34;
                char v24 = NSString;
                uint64_t v36 = [v13 identifier];
                id v25 = [v24 stringWithFormat:@"BlueprintConfiguration identifier is not valid. Identifier: %@", v36];
                v47 = v25;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
                v27 = id v26 = v8;
                long long v28 = [v23 errorWithDomain:@"STErrorDomain" code:551 userInfo:v27];
                [v39 addObject:v28];

                self = v35;
                id v8 = v26;
              }
              uint64_t v11 = v37;
              uint64_t v10 = v38;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v10);
    }

    BOOL v29 = [v39 count] == 0;
    BOOL v7 = v32;
    id v4 = v33;
    objc_super v5 = v31;
  }
  else
  {
    [v39 addObject:v6];
    BOOL v29 = 0;
  }

  return v29;
}

- (id)_createIdentifierSubstringForBlueprintType:(id)a3 organization:(id)a4 configType:(id)a5 identifier:(id)a6 error:(id)a7
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v11)
  {
    char v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v19 = [NSString stringWithFormat:@"Blueprint type is nil for BlueprintConfigruation identifier: %@, Org: %@", v14, v12];
    v36[0] = v19;
    char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v21 = v18;
    uint64_t v22 = 555;
    goto LABEL_6;
  }
  if (![v11 isEqualToString:@"always-allowed-apps"])
  {
    if ([v11 isEqualToString:@"restrictions"])
    {
      if (v13)
      {
        id v25 = NSString;
        id v26 = STRestrictionsBaseIdentifier;
LABEL_11:
        [v25 stringWithFormat:@"%@", *v26, v30];
        goto LABEL_12;
      }
LABEL_7:
      char v24 = 0;
      goto LABEL_13;
    }
    if ([v11 isEqualToString:@"downtime"])
    {
      uint64_t v16 = NSString;
      v17 = &STConfigurationIdentifierDowntime;
      goto LABEL_4;
    }
    if ([v11 isEqualToString:@"usage-limit"])
    {
      uint64_t v16 = NSString;
      v17 = &STConfigurationIdentifierUsageLimit;
      goto LABEL_4;
    }
    if ([v11 isEqualToString:@"managed-user"])
    {
      if ([v13 isEqualToString:@"com.apple.configuration.system.dateandtime"])
      {
        id v25 = NSString;
        id v26 = STForceDateTimeConfigurationIdentifier;
        goto LABEL_11;
      }
      if ([v13 isEqualToString:@"com.apple.configuration.policy.icloud.account"])
      {
        id v25 = NSString;
        id v26 = STICloudLogoutConfigurationIdentifier;
        goto LABEL_11;
      }
      BOOL v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v19 = [NSString stringWithFormat:@"Unsupported configuration type for managed user configuration. BlueprintConfigruation identifier: %@, Configuration Type: %@, Blueprint Type: %@, Org: %@", v14, v13, v11, v12];
      uint64_t v34 = v19;
      char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v21 = v29;
      uint64_t v22 = 553;
    }
    else
    {
      long long v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v19 = [NSString stringWithFormat:@"Unknown Blueprint type used to create BlueprintConfigruation identifier: %@, Blueprint Type: %@, Org: %@", v14, v11, v12];
      id v32 = v19;
      char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v21 = v28;
      uint64_t v22 = 554;
    }
LABEL_6:
    v23 = [v21 errorWithDomain:@"STErrorDomain" code:v22 userInfo:v20];
    [v15 addObject:v23];

    goto LABEL_7;
  }
  uint64_t v16 = NSString;
  v17 = STAlwaysAllowConfigurationIdentifier;
LABEL_4:
  [v16 stringWithFormat:@"%@_%@", *v17, v12];
  char v24 = LABEL_12:;
LABEL_13:

  return v24;
}

- (void)cemConfiguration
{
  v1 = [a1 type];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v2, v3, "Error creating configuration for type %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

- (void)setCemConfiguration:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 declarationType];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v2, v3, "Error serializing configuration %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

- (void)validateForUpdate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "%{public}s Validate for Update on BlueprintConfiguration failed with error: %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)validateForUpdate:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_1DA519000, v0, OS_LOG_TYPE_FAULT, "%{public}s Built-in CoreData Validation for update on BlueprintConfiguration failed with: %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)validateForInsert:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "%{public}s Validate for insert on BlueprintConfiguration failed with error: %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)validateForInsert:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_1DA519000, v0, OS_LOG_TYPE_FAULT, "%{public}s Built-in CoreData Validation for insert on BlueprintConfiguration failed with: %{public}@", (uint8_t *)v1, 0x16u);
}

@end