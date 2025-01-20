@interface NSURLCredentialStorage
@end

@implementation NSURLCredentialStorage

void __152__NSURLCredentialStorage_SafariCoreExtras__safari_deleteCredentialWithEmptyServerHostForUser_forHTMLFormProtectionSpace_forGroupID_fromRecentlyDeleted___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  v6 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
  if (![v6 length])
  {
    v7 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F3BD40]];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;

    *a4 = 1;
  }
}

id __71__NSURLCredentialStorage_SafariCoreExtras__safari_allSafariCredentials__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 authenticationMethod];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F18C88]];

  if (v6) {
    id v7 = v4;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

uint64_t __123__NSURLCredentialStorage_SafariCoreExtras__safari_migrateKeychainItemsWithInvalidAuthenticationTypesWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B728F000, v2, OS_LOG_TYPE_INFO, "Starting migration for keychain items with invalid authentication types", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_safari_migrateKeychainItemsWithInvalidAuthenticationTypes");
  v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_INFO, "Finished migration for keychain items with invalid authentication types", v5, 2u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __102__NSURLCredentialStorage_SafariCoreExtras___safari_migrateKeychainItemsWithInvalidAuthenticationTypes__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  if (!v9)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v11];
  }
  v10 = [v9 objectForKeyedSubscript:v7];
  if (!v10)
  {
    v10 = [MEMORY[0x1E4F1CA80] set];
    [v9 setObject:v10 forKeyedSubscript:v7];
  }
  [v10 addObject:v8];
}

__CFString *__102__NSURLCredentialStorage_SafariCoreExtras___safari_migrateKeychainItemsWithInvalidAuthenticationTypes__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
  v3 = &stru_1F105D3F0;
  if (v2)
  {
    uint64_t v4 = [[NSString alloc] initWithData:v2 encoding:4];
    v5 = (void *)v4;
    if (v4) {
      int v6 = (__CFString *)v4;
    }
    else {
      int v6 = &stru_1F105D3F0;
    }
    v3 = v6;
  }
  return v3;
}

BOOL __102__NSURLCredentialStorage_SafariCoreExtras___safari_migrateKeychainItemsWithInvalidAuthenticationTypes__block_invoke_86(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F3BD40];
  uint64_t v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F3BD40]];
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    uint64_t v10 = v2;
    v11[0] = v3;
    CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    OSStatus v6 = SecItemDelete(v5);
    BOOL v7 = v6 == 0;
    if (v6)
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __102__NSURLCredentialStorage_SafariCoreExtras___safari_migrateKeychainItemsWithInvalidAuthenticationTypes__block_invoke_86_cold_1();
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __107__NSURLCredentialStorage_SafariCoreExtras___safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CFDictionaryRef v5 = *(void **)(a1 + 32);
  OSStatus v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = [v6 sharedGroupID];
  objc_msgSend(v5, "_safari_getKeychainItemForSidecar:ofType:groupID:fromRecentlyDeleted:", v7, a2, v8, objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_safari_addKeychainItem:ofType:toSidecarDictionary:", v9, a2, *(void *)(a1 + 48));
}

void __106__NSURLCredentialStorage_SafariCoreExtras___safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CFDictionaryRef v5 = *(void **)(a1 + 32);
  OSStatus v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = [v6 sharedGroupID];
  objc_msgSend(v5, "_safari_getKeychainItemForSidecar:ofType:groupID:fromRecentlyDeleted:", v7, a2, v8, objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_safari_addKeychainItem:ofType:toSidecarDictionary:", v9, a2, *(void *)(a1 + 48));
}

WBSSavedAccountSidecar *__88__NSURLCredentialStorage_SafariCoreExtras__safari_allPersonalSidecarsInPersonalKeychain__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  CFDictionaryRef v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
  uint64_t v6 = *MEMORY[0x1E4F3B5C0];
  id v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
  id v9 = objc_msgSend(v4, "_safari_sidecarDictionaryFromData:user:domain:", v5, v7, v8);

  if (v9)
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_safari_protectionSpaceFromKeychainDictionary:", v3);
    id v11 = [WBSSavedAccountSidecar alloc];
    v12 = [v3 objectForKeyedSubscript:v6];
    v13 = [(WBSSavedAccountSidecar *)v11 initWithUser:v12 protectionSpace:v10 dictionaryRepresentation:v9];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

WBSSavedAccountSidecar *__103__NSURLCredentialStorage_SafariCoreExtras__safari_allRecentlyDeletedPersonalSidecarsInPersonalKeychain__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  CFDictionaryRef v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
  uint64_t v6 = *MEMORY[0x1E4F3B5C0];
  id v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
  id v9 = objc_msgSend(v4, "_safari_sidecarDictionaryFromData:user:domain:", v5, v7, v8);

  if (v9)
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_safari_protectionSpaceFromKeychainDictionary:", v3);
    id v11 = [WBSSavedAccountSidecar alloc];
    v12 = [v3 objectForKeyedSubscript:v6];
    v13 = [(WBSSavedAccountSidecar *)v11 initWithUser:v12 protectionSpace:v10 dictionaryRepresentation:v9];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

WBSSavedAccountSharedSidecar *__99__NSURLCredentialStorage_SafariCoreExtras__safari_allSharedSidecarsForGroupID_fromRecentlyDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  CFDictionaryRef v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
  uint64_t v6 = *MEMORY[0x1E4F3B5C0];
  id v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
  id v9 = objc_msgSend(v4, "_safari_sidecarDictionaryFromData:user:domain:", v5, v7, v8);

  if (v9)
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_safari_protectionSpaceFromKeychainDictionary:", v3);
    id v11 = [WBSSavedAccountSharedSidecar alloc];
    v12 = [v3 objectForKeyedSubscript:v6];
    v13 = [(WBSSavedAccountSharedSidecar *)v11 initWithUser:v12 protectionSpace:v10 dictionaryRepresentation:v9];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

WBSSavedAccountSidecar *__101__NSURLCredentialStorage_SafariCoreExtras__safari_allPersonalSidecarsForGroupID_fromRecentlyDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  CFDictionaryRef v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
  uint64_t v6 = *MEMORY[0x1E4F3B5C0];
  id v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
  id v9 = objc_msgSend(v4, "_safari_sidecarDictionaryFromData:user:domain:", v5, v7, v8);

  if (v9)
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_safari_protectionSpaceFromKeychainDictionary:", v3);
    id v11 = [WBSSavedAccountSidecar alloc];
    v12 = [v3 objectForKeyedSubscript:v6];
    v13 = [(WBSSavedAccountSidecar *)v11 initWithUser:v12 protectionSpace:v10 dictionaryRepresentation:v9];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __114__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasswordToPersonalKeychain_withNewUsername___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if (a2 != 1)
  {
    id v8 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:withNewUsername:fromRecentlyDeleted:", v7, *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "isRecentlyDeleted"));
    id v7 = v8;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

void __94__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPassword_toGroupWithID___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  if (a2 == 1)
  {
    char v9 = objc_msgSend(*(id *)(a1 + 40), "_safari_copySharedSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:", v10, *(void *)(a1 + 32), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isRecentlyDeleted"));
  }
  else
  {
    if (a2) {
      goto LABEL_8;
    }
    uint64_t v7 = [*(id *)(a1 + 32) length];
    id v8 = *(void **)(a1 + 40);
    if (v7) {
      char v9 = objc_msgSend(v8, "_safari_copyPersonalSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:", v10, *(void *)(a1 + 32), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isRecentlyDeleted"));
    }
    else {
      char v9 = objc_msgSend(v8, "_safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:forGroupWithID:fromRecentlyDeleted:", v10, *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isRecentlyDeleted"));
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v9;
LABEL_8:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    *a4 = 1;
  }
}

void __97__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasskeyToPersonalKeychain___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if (a2 != 1)
  {
    id v8 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:fromRecentlyDeleted:", v7, objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted"));
    id v7 = v8;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

void __93__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasskey_toGroupWithID___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  if (a2 == 1)
  {
    char v11 = objc_msgSend(*(id *)(a1 + 40), "_safari_copySharedSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:", v12, *(void *)(a1 + 32), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isRecentlyDeleted"));
  }
  else
  {
    if (a2) {
      goto LABEL_8;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = [*(id *)(a1 + 56) isRecentlyDeleted];
    if (v7) {
      char v11 = objc_msgSend(v8, "_safari_copyPersonalSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:", v12, v7, v9, v10);
    }
    else {
      char v11 = objc_msgSend(v8, "_safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:forGroupWithID:fromRecentlyDeleted:", v12, v9, v10);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;
LABEL_8:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    *a4 = 1;
  }
}

void __97__NSURLCredentialStorage_SafariCoreExtras__safari_test_purgeKeychainItemsFromTestingAccessGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F3B550];
  v19[0] = *MEMORY[0x1E4F3B978];
  v19[1] = v6;
  v20[0] = v4;
  v20[1] = v5;
  uint64_t v7 = *MEMORY[0x1E4F3B880];
  uint64_t v8 = *MEMORY[0x1E4F3BD08];
  v19[2] = *MEMORY[0x1E4F3B878];
  v19[3] = v8;
  v20[2] = v7;
  v20[3] = MEMORY[0x1E4F1CC38];
  OSStatus v9 = SecItemDelete((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4]);
  if (v9)
  {
    OSStatus v10 = v9;
    if (v9 == -25300)
    {
      char v11 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543618;
        id v14 = v4;
        __int16 v15 = 2114;
        id v16 = v5;
        _os_log_impl(&dword_1B728F000, v11, OS_LOG_TYPE_DEFAULT, "No %{public}@ entries found to delete in %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      id v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543874;
        id v14 = v4;
        __int16 v15 = 2114;
        id v16 = v5;
        __int16 v17 = 2048;
        uint64_t v18 = v10;
        _os_log_error_impl(&dword_1B728F000, v12, OS_LOG_TYPE_ERROR, "Failed to delete all %{public}@ entries in %{public}@, result %ld", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

void __102__NSURLCredentialStorage_SafariCoreExtras___safari_migrateKeychainItemsWithInvalidAuthenticationTypes__block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to delete keychain item with invalid authentication type: %ld", v2, v3, v4, v5, v6);
}

@end