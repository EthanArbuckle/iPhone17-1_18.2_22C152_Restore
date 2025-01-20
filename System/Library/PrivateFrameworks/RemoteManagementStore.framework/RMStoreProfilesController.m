@interface RMStoreProfilesController
+ (id)newProfileControllerWithPrefix:(id)a3 scope:(int64_t)a4;
- (NSString)profileIdentifierPrefix;
- (RMStoreProfilesAdapter)profilesAdapter;
- (RMStoreProfilesController)initWithProfileIdentifierPrefix:(id)a3;
- (RMStoreProfilesController)initWithProfileIdentifierPrefix:(id)a3 scope:(int64_t)a4;
- (RMStoreProfilesController)initWithProfilesAdapter:(id)a3 profileIdentifierPrefix:(id)a4;
- (id)allPrefixedProfileIdentifiers;
- (id)configurationByDeclarationKeyForConfigurations:(id)a3;
- (id)declarationKeyForStore:(id)a3 declaration:(id)a4;
- (id)installedProfileIdentifierByDeclarationKey;
- (id)installedProfileIdentifiers;
- (id)profileIdentifierForConfiguration:(id)a3;
- (id)profileIdentifierForDeclaration:(id)a3 store:(id)a4;
- (id)profileNameForProfileIdentifier:(id)a3;
- (void)_installProfileAtPath:(id)a3 store:(id)a4 declaration:(id)a5 completionHandler:(id)a6;
- (void)_installProfileData:(id)a3 store:(id)a4 declarationKey:(id)a5 completionHandler:(id)a6;
- (void)downloadAndInstallProfileConfiguration:(id)a3 fromURL:(id)a4 completionHandler:(id)a5;
- (void)downloadAndInstallProfileDeclaration:(id)a3 store:(id)a4 fromURL:(id)a5 completionHandler:(id)a6;
- (void)installedProfileIdentifierByDeclarationKey;
- (void)setProfileIdentifierPrefix:(id)a3;
- (void)setProfilesAdapter:(id)a3;
- (void)uninstallProfileWithIdentifier:(id)a3 store:(id)a4 completionHandler:(id)a5;
@end

@implementation RMStoreProfilesController

+ (id)newProfileControllerWithPrefix:(id)a3 scope:(int64_t)a4
{
  id v5 = a3;
  v6 = [[RMStoreProfilesController alloc] initWithProfileIdentifierPrefix:v5 scope:a4];

  return v6;
}

- (RMStoreProfilesController)initWithProfileIdentifierPrefix:(id)a3
{
  return [(RMStoreProfilesController *)self initWithProfileIdentifierPrefix:a3 scope:1];
}

- (RMStoreProfilesController)initWithProfileIdentifierPrefix:(id)a3 scope:(int64_t)a4
{
  id v6 = a3;
  v7 = [[RMStoreProfilesAdapter alloc] initWithScope:a4];
  v8 = [(RMStoreProfilesController *)self initWithProfilesAdapter:v7 profileIdentifierPrefix:v6];

  return v8;
}

- (RMStoreProfilesController)initWithProfilesAdapter:(id)a3 profileIdentifierPrefix:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMStoreProfilesController;
  v9 = [(RMStoreProfilesController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profilesAdapter, a3);
    objc_storeStrong((id *)&v10->_profileIdentifierPrefix, a4);
  }

  return v10;
}

- (id)installedProfileIdentifiers
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(RMStoreProfilesController *)self installedProfileIdentifierByDeclarationKey];
  v4 = [v3 allValues];
  id v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)allPrefixedProfileIdentifiers
{
  v3 = [(RMStoreProfilesController *)self profilesAdapter];
  v4 = [v3 allProfileIdentifiers];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__RMStoreProfilesController_allPrefixedProfileIdentifiers__block_invoke;
  v8[3] = &unk_26548FC30;
  v8[4] = self;
  id v5 = [MEMORY[0x263F08A98] predicateWithBlock:v8];
  id v6 = [v4 filteredSetUsingPredicate:v5];

  return v6;
}

uint64_t __58__RMStoreProfilesController_allPrefixedProfileIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 profileIdentifierPrefix];
  uint64_t v5 = [v3 hasPrefix:v4];

  return v5;
}

- (id)profileIdentifierForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 declaration];
  id v6 = [v4 store];

  id v7 = [(RMStoreProfilesController *)self profileIdentifierForDeclaration:v5 store:v6];

  return v7;
}

- (id)profileIdentifierForDeclaration:(id)a3 store:(id)a4
{
  uint64_t v5 = [(RMStoreProfilesController *)self declarationKeyForStore:a4 declaration:a3];
  id v6 = [(RMStoreProfilesController *)self installedProfileIdentifierByDeclarationKey];
  id v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (id)profileNameForProfileIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RMStoreProfilesController *)self profilesAdapter];
  id v6 = [v5 profileNameForIdentifier:v4];

  return v6;
}

- (id)installedProfileIdentifierByDeclarationKey
{
  id v3 = [(RMStoreProfilesController *)self profilesAdapter];
  id v4 = [v3 installedProfileIdentifierByDeclarationKey];

  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __71__RMStoreProfilesController_installedProfileIdentifierByDeclarationKey__block_invoke;
  v19 = &unk_26548FC58;
  v20 = self;
  id v6 = v5;
  id v21 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:&v16];
  id v7 = objc_msgSend(MEMORY[0x263F635B0], "profilesController", v16, v17, v18, v19, v20);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(RMStoreProfilesController *)(uint64_t)v6 installedProfileIdentifierByDeclarationKey];
  }

  v14 = (void *)[v6 copy];
  return v14;
}

void __71__RMStoreProfilesController_installedProfileIdentifierByDeclarationKey__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v9 subscriberIdentifier];
  id v7 = [*(id *)(a1 + 32) profileIdentifierPrefix];
  int v8 = [v6 isEqualToString:v7];

  if (v8) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v9];
  }
}

- (id)configurationByDeclarationKeyForConfigurations:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "store", (void)v16);
        uint64_t v13 = [v11 declaration];
        v14 = [(RMStoreProfilesController *)self declarationKeyForStore:v12 declaration:v13];

        [v5 setObject:v11 forKeyedSubscript:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)declarationKeyForStore:(id)a3 declaration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RMStoreProfilesController *)self profileIdentifierPrefix];
  id v9 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:v8 store:v7 declaration:v6];

  return v9;
}

- (void)downloadAndInstallProfileConfiguration:(id)a3 fromURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [v10 declaration];
  uint64_t v11 = [v10 store];

  [(RMStoreProfilesController *)self downloadAndInstallProfileDeclaration:v12 store:v11 fromURL:v9 completionHandler:v8];
}

- (void)downloadAndInstallProfileDeclaration:(id)a3 store:(id)a4 fromURL:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__RMStoreProfilesController_downloadAndInstallProfileDeclaration_store_fromURL_completionHandler___block_invoke;
  v16[3] = &unk_26548FC80;
  id v17 = v10;
  long long v18 = self;
  id v19 = v11;
  id v20 = v12;
  id v13 = v11;
  id v14 = v12;
  id v15 = v10;
  [v13 fetchDataAtURL:a5 completionHandler:v16];
}

void __98__RMStoreProfilesController_downloadAndInstallProfileDeclaration_store_fromURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x263F635B0] profilesController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __98__RMStoreProfilesController_downloadAndInstallProfileDeclaration_store_fromURL_completionHandler___block_invoke_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) declarationKeyForStore:*(void *)(a1 + 48) declaration:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _installProfileData:v5 store:*(void *)(a1 + 48) declarationKey:v8 completionHandler:*(void *)(a1 + 56)];
  }
}

- (void)_installProfileAtPath:(id)a3 store:(id)a4 declaration:(id)a5 completionHandler:(id)a6
{
  v35[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MEMORY[0x263F08850] defaultManager];
  id v33 = 0;
  id v15 = [v14 attributesOfItemAtPath:v10 error:&v33];
  id v16 = v33;
  id v17 = [v15 objectForKeyedSubscript:*MEMORY[0x263F080B8]];

  long long v18 = [v12 declarationIdentifier];
  if (v17)
  {
    if ([v17 longLongValue] >= 1 && objc_msgSend(v17, "longLongValue") < 30721)
    {
      id v32 = 0;
      v24 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v10 options:0 error:&v32];
      id v25 = v32;
      if (v24)
      {
        [(RMStoreProfilesController *)self declarationKeyForStore:v11 declaration:v12];
        v26 = id v28 = v25;
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke;
        v29[3] = &unk_26548FCA8;
        id v30 = v18;
        id v31 = v13;
        [(RMStoreProfilesController *)self _installProfileData:v24 store:v11 declarationKey:v26 completionHandler:v29];

        id v25 = v28;
      }
      else
      {
        v27 = [MEMORY[0x263F635B0] profilesController];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[RMStoreProfilesController _installProfileAtPath:store:declaration:completionHandler:]();
        }

        (*((void (**)(id, void, id))v13 + 2))(v13, 0, v25);
      }
    }
    else
    {
      id v19 = [MEMORY[0x263F635B0] profilesController];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[RMStoreProfilesController _installProfileAtPath:store:declaration:completionHandler:]((uint64_t)v18, v17);
      }

      id v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = *MEMORY[0x263F07F80];
      v35[0] = @"Invalid profile size";
      uint64_t v21 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
      uint64_t v22 = [v20 errorWithDomain:@"ProfilesErrorDomain" code:0 userInfo:v21];

      (*((void (**)(id, void, uint64_t))v13 + 2))(v13, 0, v22);
      id v16 = (id)v22;
    }
  }
  else
  {
    v23 = [MEMORY[0x263F635B0] profilesController];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[RMStoreProfilesController _installProfileAtPath:store:declaration:completionHandler:]();
    }

    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v16);
  }
}

void __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263F635B0];
  id v7 = a2;
  id v8 = [v6 profilesController];
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_installProfileData:(id)a3 store:(id)a4 declarationKey:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__4;
  v26[4] = __Block_byref_object_dispose__4;
  id v27 = 0;
  id v14 = [(RMStoreProfilesController *)self installedProfileIdentifierByDeclarationKey];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke;
  v23[3] = &unk_26548FCD0;
  id v15 = v12;
  id v24 = v15;
  id v25 = v26;
  [v14 enumerateKeysAndObjectsUsingBlock:v23];
  id v16 = [(RMStoreProfilesController *)self profilesAdapter];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2;
  v19[3] = &unk_26548FD20;
  uint64_t v22 = v26;
  v19[4] = self;
  id v17 = v11;
  id v20 = v17;
  id v18 = v13;
  id v21 = v18;
  [v16 installProfileData:v10 store:v17 declarationKey:v15 completionHandler:v19];

  _Block_object_dispose(v26, 8);
}

void __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  id v8 = [a2 keyWithoutServerToken];
  id v9 = [*(id *)(a1 + 32) keyWithoutServerToken];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    goto LABEL_2;
  }
  id v7 = [MEMORY[0x263F635B0] profilesController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2_cold_2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }

  id v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v14 || ([v14 isEqualToString:v5] & 1) != 0)
  {
LABEL_2:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v15 = [MEMORY[0x263F635B0] profilesController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2_cold_1();
    }

    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(*(void *)(v16 + 8) + 40);
    id v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_32;
    v20[3] = &unk_26548FCF8;
    uint64_t v24 = v16;
    id v23 = *(id *)(a1 + 48);
    id v21 = v5;
    id v22 = 0;
    [v18 uninstallProfileWithIdentifier:v17 store:v19 completionHandler:v20];
  }
}

uint64_t __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_32(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [MEMORY[0x263F635B0] profilesController];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_32_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)uninstallProfileWithIdentifier:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x263F635B0];
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [v9 profilesController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[RMStoreProfilesController uninstallProfileWithIdentifier:store:completionHandler:]((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
  }

  uint64_t v19 = [(RMStoreProfilesController *)self profilesAdapter];
  [v19 uninstallProfileWithIdentifier:v8 store:v11 completionHandler:v10];
}

- (RMStoreProfilesAdapter)profilesAdapter
{
  return self->_profilesAdapter;
}

- (void)setProfilesAdapter:(id)a3
{
}

- (NSString)profileIdentifierPrefix
{
  return self->_profileIdentifierPrefix;
}

- (void)setProfileIdentifierPrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifierPrefix, 0);
  objc_storeStrong((id *)&self->_profilesAdapter, 0);
}

- (void)installedProfileIdentifierByDeclarationKey
{
}

void __98__RMStoreProfilesController_downloadAndInstallProfileDeclaration_store_fromURL_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) declarationIdentifier];
  OUTLINED_FUNCTION_3_0(&dword_25B003000, v2, v3, "Unable to download profile or declaration identifier %{public}@: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_installProfileAtPath:store:declaration:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3(&dword_25B003000, v0, v1, "Unable to check size of profile for declaration identifier %{public}@: %{public}@");
}

- (void)_installProfileAtPath:(uint64_t)a1 store:(void *)a2 declaration:completionHandler:.cold.2(uint64_t a1, void *a2)
{
  [a2 longLongValue];
  OUTLINED_FUNCTION_3_0(&dword_25B003000, v2, v3, "Profile for declaration identifier %{public}@ has invalid size %lld", v4, v5, v6, v7, 2u);
}

- (void)_installProfileAtPath:store:declaration:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3(&dword_25B003000, v0, v1, "Unable to read profile for declaration identifier %{public}@: %{public}@");
}

void __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Installed profile for declaration identifier %{public}@", v2, v3, v4, v5, v6);
}

void __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_25B003000, v0, v1, "Error installing profile for declaration identifier %{public}@: %{public}@");
}

void __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_4(&dword_25B003000, v0, v1, "Uninstall old profile during replacement with identifier %{public}@", v2, v3, v4, v5, v6);
}

void __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_32_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_25B003000, v0, OS_LOG_TYPE_ERROR, "Unable to uninstall old profile during replacement with identifier %{public}@", v1, 0xCu);
}

- (void)uninstallProfileWithIdentifier:(uint64_t)a3 store:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end