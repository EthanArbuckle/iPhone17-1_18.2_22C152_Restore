@interface RMStoreProfilesAdapter
- (BOOL)_canAssumeOwnershipOfProfile:(id)a3 newProfile:(id)a4 newDeclarationKey:(id)a5 store:(id)a6;
- (BOOL)_canInstallProfile:(id)a3 store:(id)a4 declarationKey:(id)a5 outAssumeOwnership:(BOOL *)a6 error:(id *)a7;
- (BOOL)_canReplaceProfile:(id)a3 newProfile:(id)a4 newDeclarationKey:(id)a5 store:(id)a6 outAssumeOwnership:(BOOL *)a7 error:(id *)a8;
- (BOOL)_canUninstallProfileWithIdentifier:(id)a3 store:(id)a4 error:(id *)a5;
- (BOOL)_isManagedByMDM:(id)a3;
- (BOOL)_removeProfileWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isSystemScope;
- (RMStoreProfilesAdapter)initWithScope:(int64_t)a3;
- (id)_declarationKeyForProfile:(id)a3;
- (id)_declarationKeyForUserInfo:(id)a3;
- (id)_disallowedPayloadTypes;
- (id)_installOptionsForStore:(id)a3 declarationKey:(id)a4 assumeOwnership:(BOOL)a5;
- (id)_installProfileData:(id)a3 options:(id)a4 error:(id *)a5;
- (id)_payloadStructure:(id)a3;
- (id)_personaIDForStore:(id)a3;
- (id)_profileForIdentifier:(id)a3 rmOnly:(BOOL)a4;
- (id)allProfileIdentifiers;
- (id)installedProfileIdentifierByDeclarationKey;
- (id)profileNameForIdentifier:(id)a3;
- (void)allProfileIdentifiers;
- (void)installProfileData:(id)a3 store:(id)a4 declarationKey:(id)a5 completionHandler:(id)a6;
- (void)installedProfileIdentifierByDeclarationKey;
- (void)setIsSystemScope:(BOOL)a3;
- (void)uninstallProfileWithIdentifier:(id)a3 store:(id)a4 completionHandler:(id)a5;
@end

@implementation RMStoreProfilesAdapter

- (RMStoreProfilesAdapter)initWithScope:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RMStoreProfilesAdapter;
  result = [(RMStoreProfilesAdapter *)&v5 init];
  if (result) {
    result->_isSystemScope = a3 == 1;
  }
  return result;
}

- (id)allProfileIdentifiers
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  if ([(RMStoreProfilesAdapter *)self isSystemScope]) {
    uint64_t v4 = 19;
  }
  else {
    uint64_t v4 = 9;
  }
  objc_super v5 = [v3 installedProfileIdentifiersWithFilterFlags:v4];

  v6 = [MEMORY[0x263F635B0] profilesAdapter];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RMStoreProfilesAdapter allProfileIdentifiers]();
  }

  v7 = [MEMORY[0x263EFFA08] setWithArray:v5];

  return v7;
}

- (id)installedProfileIdentifierByDeclarationKey
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  if ([(RMStoreProfilesAdapter *)self isSystemScope]) {
    uint64_t v4 = 19;
  }
  else {
    uint64_t v4 = 9;
  }
  objc_super v5 = [v3 installedProfileIdentifiersWithFilterFlags:v4];

  v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x26115B460](v8);
        v14 = -[RMStoreProfilesAdapter _profileForIdentifier:rmOnly:](self, "_profileForIdentifier:rmOnly:", v12, 1, (void)v18);
        v15 = [(RMStoreProfilesAdapter *)self _declarationKeyForProfile:v14];
        if (v15) {
          [v6 setObject:v12 forKeyedSubscript:v15];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }

  v16 = [MEMORY[0x263F635B0] profilesAdapter];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[RMStoreProfilesAdapter installedProfileIdentifierByDeclarationKey]();
  }

  return v6;
}

- (id)profileNameForIdentifier:(id)a3
{
  v3 = [(RMStoreProfilesAdapter *)self _profileForIdentifier:a3 rmOnly:1];
  uint64_t v4 = [v3 friendlyName];

  return v4;
}

- (void)installProfileData:(id)a3 store:(id)a4 declarationKey:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *, void))a6;
  unsigned __int8 v23 = 0;
  id v22 = 0;
  BOOL v14 = [(RMStoreProfilesAdapter *)self _canInstallProfile:v10 store:v11 declarationKey:v12 outAssumeOwnership:&v23 error:&v22];
  id v15 = v22;
  if (v14)
  {
    v16 = [(RMStoreProfilesAdapter *)self _installOptionsForStore:v11 declarationKey:v12 assumeOwnership:v23];
    id v21 = v15;
    v17 = [(RMStoreProfilesAdapter *)self _installProfileData:v10 options:v16 error:&v21];
    id v18 = v21;

    long long v19 = [MEMORY[0x263F635B0] profilesAdapter];
    long long v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[RMStoreProfilesAdapter installProfileData:store:declarationKey:completionHandler:]();
      }

      v13[2](v13, v17, 0);
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[RMStoreProfilesAdapter installProfileData:store:declarationKey:completionHandler:]();
      }

      ((void (**)(id, void *, id))v13)[2](v13, 0, v18);
    }
  }
  else
  {
    ((void (**)(id, void *, id))v13)[2](v13, 0, v15);
    id v18 = v15;
  }
}

- (void)uninstallProfileWithIdentifier:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, id))a5;
  id v18 = 0;
  BOOL v10 = [(RMStoreProfilesAdapter *)self _canUninstallProfileWithIdentifier:v8 store:a4 error:&v18];
  id v11 = v18;
  id v12 = v11;
  if (v10)
  {
    id v17 = v11;
    BOOL v13 = [(RMStoreProfilesAdapter *)self _removeProfileWithIdentifier:v8 error:&v17];
    id v14 = v17;

    id v15 = [MEMORY[0x263F635B0] profilesAdapter];
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[RMStoreProfilesAdapter uninstallProfileWithIdentifier:store:completionHandler:]();
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[RMStoreProfilesAdapter uninstallProfileWithIdentifier:store:completionHandler:]();
    }
  }
  else
  {
    id v14 = v11;
  }
  v9[2](v9, v14);
}

- (id)_installProfileData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F53C50];
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [v7 sharedConnection];
  id v11 = [v10 installProfileData:v9 options:v8 outError:a5];

  return v11;
}

- (BOOL)_removeProfileWithIdentifier:(id)a3 error:(id *)a4
{
  objc_super v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a3;
  id v7 = [v5 sharedConnection];
  if ([(RMStoreProfilesAdapter *)self isSystemScope]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [v7 removeProfileWithIdentifier:v6 installationType:v8];

  return 1;
}

- (id)_installOptionsForStore:(id)a3 declarationKey:(id)a4 assumeOwnership:(BOOL)a5
{
  BOOL v5 = a5;
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v26 = @"DeclarationKey";
  id v9 = [a4 key];
  v27[0] = v9;
  BOOL v10 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];

  uint64_t v11 = *MEMORY[0x263F53D78];
  v25[0] = @"com.apple.RemoteManagement.ProfilesController";
  uint64_t v12 = *MEMORY[0x263F53D70];
  v24[0] = v11;
  v24[1] = v12;
  BOOL v13 = NSNumber;
  if ([(RMStoreProfilesAdapter *)self isSystemScope]) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 2;
  }
  id v15 = [v13 numberWithInteger:v14];
  uint64_t v16 = *MEMORY[0x263F53DB8];
  v25[1] = v15;
  v25[2] = MEMORY[0x263EFFA88];
  v24[2] = v16;
  v24[3] = @"RemoteManagement.UserInfo";
  v25[3] = v10;
  id v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  id v18 = (void *)[v17 mutableCopy];

  if (![v8 type]) {
    [v18 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F53DC0]];
  }
  long long v19 = [v8 enrollmentURL];
  long long v20 = [v19 scheme];
  int v21 = [v20 isEqualToString:@"mdm"];

  if (v21) {
    [v18 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F53D98]];
  }
  if (v5) {
    [v18 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F53D58]];
  }
  id v22 = [MEMORY[0x263F635B0] profilesAdapter];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[RMStoreProfilesAdapter _installOptionsForStore:declarationKey:assumeOwnership:]();
  }

  return v18;
}

- (id)_personaIDForStore:(id)a3
{
  id v3 = a3;
  if ([v3 dataSeparated])
  {
    uint64_t v4 = [v3 personaIdentifier];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_canInstallProfile:(id)a3 store:(id)a4 declarationKey:(id)a5 outAssumeOwnership:(BOOL *)a6 error:(id *)a7
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v57 = 0;
  uint64_t v14 = [MEMORY[0x263F53C48] profileWithData:a3 outError:&v57];
  id v15 = v57;
  uint64_t v16 = v15;
  if (v14)
  {
    v43 = a6;
    v47 = a7;
    id v48 = v15;
    id v17 = [v14 identifier];
    id v18 = [MEMORY[0x263F635B0] profilesAdapter];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[RMStoreProfilesAdapter _canInstallProfile:store:declarationKey:outAssumeOwnership:error:].cold.4();
    }

    [v14 payloads];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v54;
      id v44 = v13;
      id v45 = v12;
      id v46 = v17;
      uint64_t v41 = *(void *)v54;
      v42 = self;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v54 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * v23), "type", v41, v42);
          v25 = [v24 lowercaseString];

          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          v26 = [(RMStoreProfilesAdapter *)self _disallowedPayloadTypes];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v58 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v50;
            while (2)
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v50 != v29) {
                  objc_enumerationMutation(v26);
                }
                v31 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                if ([v31 isEqualToString:v25])
                {
                  v34 = [MEMORY[0x263F635B0] profilesAdapter];
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                    -[RMStoreProfilesAdapter _canInstallProfile:store:declarationKey:outAssumeOwnership:error:]();
                  }

                  id v13 = v44;
                  id v12 = v45;
                  if (v47)
                  {
                    v35 = [MEMORY[0x263F63598] createProfilePayloadNotAllowedErrorWithPayloadType:v31];
                    v36 = v35;
                    if (v35) {
                      id *v47 = v35;
                    }
                  }
                  BOOL v33 = 0;
                  v32 = v19;
                  id v17 = v46;
                  goto LABEL_28;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v58 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }

          ++v23;
          id v17 = v46;
          uint64_t v22 = v41;
          self = v42;
        }
        while (v23 != v21);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v53 objects:v59 count:16];
        id v13 = v44;
        id v12 = v45;
      }
      while (v21);
    }

    v32 = [(RMStoreProfilesAdapter *)self _profileForIdentifier:v17 rmOnly:0];
    if (v32)
    {
      BOOL v33 = [(RMStoreProfilesAdapter *)self _canReplaceProfile:v32 newProfile:v14 newDeclarationKey:v13 store:v12 outAssumeOwnership:v43 error:v47];
    }
    else
    {
      v40 = [MEMORY[0x263F635B0] profilesAdapter];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        -[RMStoreProfilesAdapter _canInstallProfile:store:declarationKey:outAssumeOwnership:error:]();
      }

      BOOL v33 = 1;
    }
LABEL_28:

    uint64_t v16 = v48;
  }
  else
  {
    v38 = [MEMORY[0x263F635B0] profilesAdapter];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[RMStoreProfilesAdapter _canInstallProfile:store:declarationKey:outAssumeOwnership:error:]();
    }

    if (!a7)
    {
      BOOL v33 = 0;
      goto LABEL_30;
    }
    v39 = [MEMORY[0x263F63598] createProfileInvalidErrorWithUnderlyingError:v16];
    id v17 = v39;
    if (v39)
    {
      id v17 = v39;
      BOOL v33 = 0;
      *a7 = v17;
    }
    else
    {
      BOOL v33 = 0;
    }
  }

LABEL_30:
  return v33;
}

- (BOOL)_canReplaceProfile:(id)a3 newProfile:(id)a4 newDeclarationKey:(id)a5 store:(id)a6 outAssumeOwnership:(BOOL *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = [(RMStoreProfilesAdapter *)self _declarationKeyForProfile:v13];
  id v18 = [v13 identifier];
  id v19 = [MEMORY[0x263F635B0] profilesAdapter];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[RMStoreProfilesAdapter _canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:].cold.4();
  }

  if (v17)
  {
    uint64_t v20 = [v17 subscriberIdentifier];
    uint64_t v21 = [v15 subscriberIdentifier];
    char v22 = [v20 isEqualToString:v21];

    if (v22)
    {
      uint64_t v23 = [v17 storeIdentifier];
      v24 = [v15 storeIdentifier];
      char v25 = [v23 isEqualToString:v24];

      if (v25)
      {
        v26 = [v17 declarationIdentifier];
        uint64_t v27 = [v15 declarationIdentifier];
        char v28 = [v26 isEqualToString:v27];

        if (v28)
        {
          char v29 = 1;
          goto LABEL_21;
        }
        v30 = [MEMORY[0x263F635B0] profilesAdapter];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[RMStoreProfilesAdapter _canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:]();
        }
      }
      else
      {
        v30 = [MEMORY[0x263F635B0] profilesAdapter];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[RMStoreProfilesAdapter _canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:]();
        }
      }
    }
    else
    {
      v30 = [MEMORY[0x263F635B0] profilesAdapter];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[RMStoreProfilesAdapter _canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:]();
      }
    }
  }
  else if ([(RMStoreProfilesAdapter *)self _canAssumeOwnershipOfProfile:v13 newProfile:v14 newDeclarationKey:v15 store:v16])
  {
    char v29 = 1;
    *a7 = 1;
    goto LABEL_21;
  }
  char v29 = (char)a8;
  if (a8)
  {
    v31 = [MEMORY[0x263F63598] createProfileCannotReplaceOtherProfile:v18];
    v32 = v31;
    if (v31) {
      *a8 = v31;
    }

    char v29 = 0;
  }
LABEL_21:

  return v29;
}

- (BOOL)_canAssumeOwnershipOfProfile:(id)a3 newProfile:(id)a4 newDeclarationKey:(id)a5 store:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 identifier];
  id v15 = [MEMORY[0x263F635B0] profilesAdapter];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:].cold.6();
  }

  id v16 = [v13 enrollmentURL];

  id v17 = [v16 scheme];
  char v18 = [v17 isEqualToString:@"mdm"];

  if ((v18 & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x263F635B0] profilesAdapter];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:].cold.5(v21);
    }
    goto LABEL_12;
  }
  if ([(RMStoreProfilesAdapter *)self _isManagedByMDM:v10])
  {
    id v19 = [v12 subscriberIdentifier];
    int v20 = [v19 isEqualToString:@"com.apple.RemoteManagement.InteractiveLegacyProfilesExtension"];

    if (v20)
    {
      uint64_t v21 = [MEMORY[0x263F635B0] profilesAdapter];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    uint64_t v21 = [v11 UUID];
    v24 = [v10 UUID];
    if ([v21 isEqualToString:v24])
    {
      char v25 = [(RMStoreProfilesAdapter *)self _payloadStructure:v11];
      v26 = [(RMStoreProfilesAdapter *)self _payloadStructure:v10];
      if ([v25 isEqualToSet:v26])
      {
        uint64_t v27 = [MEMORY[0x263F635B0] profilesAdapter];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:]();
        }

        BOOL v22 = 1;
LABEL_23:

        goto LABEL_13;
      }
    }
    char v25 = [MEMORY[0x263F635B0] profilesAdapter];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:]();
    }
    BOOL v22 = 0;
    goto LABEL_23;
  }
  uint64_t v21 = [MEMORY[0x263F635B0] profilesAdapter];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
LABEL_11:
  }
    -[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:]();
LABEL_12:
  BOOL v22 = 0;
LABEL_13:

  return v22;
}

- (id)_payloadStructure:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [a3 payloads];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "identifier", (void)v16);
        v20[0] = v11;
        id v12 = [v10 UUID];
        v20[1] = v12;
        id v13 = [v10 type];
        v20[2] = v13;
        id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];

        [v4 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_canUninstallProfileWithIdentifier:(id)a3 store:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x263F635B0] profilesAdapter];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[RMStoreProfilesAdapter _canUninstallProfileWithIdentifier:store:error:].cold.4();
  }

  id v11 = [(RMStoreProfilesAdapter *)self _profileForIdentifier:v8 rmOnly:1];
  if (v11)
  {
    id v12 = [(RMStoreProfilesAdapter *)self _declarationKeyForProfile:v11];
    if (v12 || ([v8 hasPrefix:@"com.apple.RemoteManagement.PasscodeSettingsExtension"] & 1) != 0)
    {
      if (!v9
        || ([v12 storeIdentifier],
            id v13 = objc_claimAutoreleasedReturnValue(),
            [v9 identifier],
            id v14 = objc_claimAutoreleasedReturnValue(),
            char v15 = [v13 isEqualToString:v14],
            v14,
            v13,
            (v15 & 1) != 0))
      {
        BOOL v16 = 1;
LABEL_24:

        goto LABEL_25;
      }
      long long v19 = [MEMORY[0x263F635B0] profilesAdapter];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[RMStoreProfilesAdapter _canUninstallProfileWithIdentifier:store:error:]();
      }
    }
    else
    {
      long long v19 = [MEMORY[0x263F635B0] profilesAdapter];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[RMStoreProfilesAdapter _canUninstallProfileWithIdentifier:store:error:]();
      }
    }

    if (a5)
    {
      id v20 = [MEMORY[0x263F63598] createProfileCannotRemoveOtherProfile:v8];
      if (v20)
      {
        id v20 = v20;
        *a5 = v20;
      }
    }
    goto LABEL_23;
  }
  long long v17 = [MEMORY[0x263F635B0] profilesAdapter];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[RMStoreProfilesAdapter _canUninstallProfileWithIdentifier:store:error:]();
  }

  if (a5)
  {
    long long v18 = [MEMORY[0x263F63598] createProfileCannotFindRemoveProfile:v8];
    id v12 = v18;
    if (v18)
    {
      id v12 = v18;
      BOOL v16 = 0;
      *a5 = v12;
      goto LABEL_24;
    }
LABEL_23:
    BOOL v16 = 0;
    goto LABEL_24;
  }
  BOOL v16 = 0;
LABEL_25:

  return v16;
}

- (id)_profileForIdentifier:(id)a3 rmOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(RMStoreProfilesAdapter *)self isSystemScope];
  id v8 = [MEMORY[0x263F53C50] sharedConnection];
  id v9 = v8;
  if (v7) {
    [v8 installedSystemProfileWithIdentifier:v6];
  }
  else {
  id v10 = [v8 installedUserProfileWithIdentifier:v6];
  }

  if (!v4
    || ([(RMStoreProfilesAdapter *)self _declarationKeyForProfile:v10],
        id v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    id v11 = v10;
  }

  return v11;
}

- (BOOL)_isManagedByMDM:(id)a3
{
  return [a3 isManagedByMDM];
}

- (id)_declarationKeyForProfile:(id)a3
{
  BOOL v4 = [a3 installOptions];
  id v5 = [(RMStoreProfilesAdapter *)self _declarationKeyForUserInfo:v4];

  return v5;
}

- (id)_declarationKeyForUserInfo:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"RemoteManagement.UserInfo"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v4 = [v3 objectForKeyedSubscript:@"DeclarationKey"];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v5 = +[RMStoreDeclarationKey newDeclarationKey:v4];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_disallowedPayloadTypes
{
  if (_disallowedPayloadTypes_onceToken != -1) {
    dispatch_once(&_disallowedPayloadTypes_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)_disallowedPayloadTypes_disallowedPayloadTypes;
  return v2;
}

void __49__RMStoreProfilesAdapter__disallowedPayloadTypes__block_invoke()
{
  v0 = (void *)_disallowedPayloadTypes_disallowedPayloadTypes;
  _disallowedPayloadTypes_disallowedPayloadTypes = (uint64_t)&unk_2708CB418;
}

- (BOOL)isSystemScope
{
  return self->_isSystemScope;
}

- (void)setIsSystemScope:(BOOL)a3
{
  self->_isSystemScope = a3;
}

- (void)allProfileIdentifiers
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Found all profiles: %{public}@", v2, v3, v4, v5, v6);
}

- (void)installedProfileIdentifierByDeclarationKey
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Found installed profiles: %{public}@", v2, v3, v4, v5, v6);
}

- (void)installProfileData:store:declarationKey:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Error installing profile: %{public}@", v2, v3, v4, v5, v6);
}

- (void)installProfileData:store:declarationKey:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Installed profile: %{public}@", v2, v3, v4, v5, v6);
}

- (void)uninstallProfileWithIdentifier:store:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Removed profile: %{public}@", v2, v3, v4, v5, v6);
}

- (void)uninstallProfileWithIdentifier:store:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Error removing profile: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_installOptionsForStore:declarationKey:assumeOwnership:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Install options: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canInstallProfile:store:declarationKey:outAssumeOwnership:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Invalid profile data: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canInstallProfile:store:declarationKey:outAssumeOwnership:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "No existing profile when installing: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canInstallProfile:store:declarationKey:outAssumeOwnership:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Profile payload type disallowed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canInstallProfile:store:declarationKey:outAssumeOwnership:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Checking if profile can be installed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Existing profile is not managed by the same configuration: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Existing profile is not managed by the same store: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Existing profile is not managed by the same subscriber: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Checking if existing profile can be replaced: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Cannot take control of a profile not managed by MDM: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Existing profile can be taken over: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Cannot take control of existing profile that does not match new profile: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canAssumeOwnershipOfProfile:(os_log_t)log newProfile:newDeclarationKey:store:.cold.5(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_25B003000, log, OS_LOG_TYPE_ERROR, "Non-MDM stores cannot take control of profiles", v1, 2u);
}

- (void)_canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Checking if existing profile can be taken over: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canUninstallProfileWithIdentifier:store:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Existing profile cannot be found: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canUninstallProfileWithIdentifier:store:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Existing profile is not managed by the same store: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canUninstallProfileWithIdentifier:store:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Existing profile has no declaration key: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_canUninstallProfileWithIdentifier:store:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Checking if profile can be removed: %{public}@", v2, v3, v4, v5, v6);
}

@end