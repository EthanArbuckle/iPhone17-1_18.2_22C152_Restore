@interface NSURLCredentialStorage(SafariCoreExtras)
+ (BOOL)safari_test_saveCredential:()SafariCoreExtras withArbitraryProtectionSpace:;
+ (id)_safari_personalSidecarDictionaryForPasskeyWithUserHandle:()SafariCoreExtras relyingPartyID:groupID:;
+ (id)safari_customTitleForPasskeyWithUserHandle:()SafariCoreExtras relyingPartyID:groupID:;
+ (id)safari_test_addTestingPasskeyItemWithCredentialID:()SafariCoreExtras groupID:toRecentlyDeleted:;
+ (void)safari_setLastUsedDate:()SafariCoreExtras forPasskeyWithUserHandle:relyingPartyID:groupID:context:;
+ (void)safari_test_purgeKeychainItemsFromTestingAccessGroups;
+ (void)safari_test_setUseTestingAccessGroups:()SafariCoreExtras;
- (BOOL)_safari_copyPersonalSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:;
- (BOOL)_safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:()SafariCoreExtras forGroupWithID:fromRecentlyDeleted:;
- (BOOL)_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:()SafariCoreExtras withNewUsername:fromRecentlyDeleted:;
- (BOOL)safari_copySavedAccountWithPasskey:()SafariCoreExtras toGroupWithID:;
- (BOOL)safari_copySavedAccountWithPasskeyToPersonalKeychain:()SafariCoreExtras;
- (BOOL)safari_copySavedAccountWithPassword:()SafariCoreExtras toGroupWithID:;
- (BOOL)safari_moveCredentialTypesToRecentlyDeleted:()SafariCoreExtras onSavedAccount:;
- (BOOL)safari_recoverSavedAccountFromRecentlyDeleted:()SafariCoreExtras;
- (BOOL)safari_setCredential:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:;
- (WBSGeneratedPassword)safari_addGeneratedPassword:()SafariCoreExtras forProtectionSpace:wasGeneratedInPrivateBrowsingSession:;
- (WBSGeneratedPassword)safari_updateGeneratedPassword:()SafariCoreExtras withPassword:;
- (id)_formattedLabelWithHost:()SafariCoreExtras user:;
- (id)_safari_accountStringForGeneratedPassword;
- (id)_safari_allCredentialItemsOfType:()SafariCoreExtras groupID:fromRecentlyDeleted:;
- (id)_safari_allSidecarItemsOfType:()SafariCoreExtras groupID:fromRecentlyDeleted:;
- (id)_safari_dataFromGeneratedPasswordDictionary:()SafariCoreExtras domain:;
- (id)_safari_dataFromSidecarDictionary:()SafariCoreExtras user:domain:;
- (id)_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:()SafariCoreExtras;
- (id)_safari_getCredentialItemsFromKeychainForPasswordInSavedAccount:()SafariCoreExtras;
- (id)_safari_getKeychainItemForSidecar:()SafariCoreExtras ofType:groupID:fromRecentlyDeleted:;
- (id)_safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount:()SafariCoreExtras;
- (id)_safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount:()SafariCoreExtras;
- (id)_safari_lastModifiedDateForPasskeyCredentialOnSavedAccount:()SafariCoreExtras;
- (id)_safari_lastModifiedDateForPasswordCredentialsOnSavedAccount:()SafariCoreExtras;
- (id)_safari_protectionSpaceFromKeychainDictionary:()SafariCoreExtras;
- (id)_safari_sidecarDictionaryFromData:()SafariCoreExtras user:domain:;
- (id)safari_allGeneratedPasswordItems;
- (id)safari_allPersonalSidecarsForGroupID:()SafariCoreExtras fromRecentlyDeleted:;
- (id)safari_allPersonalSidecarsInPersonalKeychain;
- (id)safari_allRecentlyDeletedPersonalSidecarsInPersonalKeychain;
- (id)safari_allSafariCredentials;
- (id)safari_allSharedSidecarsForGroupID:()SafariCoreExtras fromRecentlyDeleted:;
- (id)safari_mostRecentLastModifiedDateForCredentialsOnSavedAccount:()SafariCoreExtras;
- (uint64_t)_safari_allPersonalSidecarEntriesInPersonalKeychain;
- (uint64_t)_safari_allRecentlyDeletedPersonalSidecarEntriesInPersonalKeychain;
- (uint64_t)_safari_allRecentlyDeletedPersonalSidecarItemsInGroupWithID:()SafariCoreExtras;
- (uint64_t)_safari_allRecentlyDeletedPersonalSidecarItemsInPersonalKeychain;
- (uint64_t)_safari_allRecentlyDeletedSharedSidecarItemsInGroupWithID:()SafariCoreExtras;
- (uint64_t)_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:()SafariCoreExtras fromRecentlyDeleted:;
- (uint64_t)_safari_copySharedSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:;
- (uint64_t)_safari_deleteAllPasskeyCredentialsForGroupID:()SafariCoreExtras;
- (uint64_t)_safari_deleteAllPasswordCredentialsForGroupID:()SafariCoreExtras;
- (uint64_t)_safari_deleteAllPersonalSidecarsForGroupID:()SafariCoreExtras;
- (uint64_t)_safari_deleteAllRecentlyDeletedPasskeyCredentialsForGroupID:()SafariCoreExtras;
- (uint64_t)_safari_deleteAllRecentlyDeletedPasswordCredentialsForGroupID:()SafariCoreExtras;
- (uint64_t)_safari_deleteAllRecentlyDeletedPersonalSidecarsForGroupID:()SafariCoreExtras;
- (uint64_t)_safari_deleteAllRecentlyDeletedSharedSidecarsForGroupID:()SafariCoreExtras;
- (uint64_t)_safari_deleteAllSharedSidecarsForGroupID:()SafariCoreExtras;
- (uint64_t)_safari_moveKeychainItemsWithPersistentIdentifiers:()SafariCoreExtras toAccessGroup:;
- (uint64_t)_safari_movePasskeyCredentialFromSavedAccountToRecentlyDeleted:()SafariCoreExtras;
- (uint64_t)_safari_movePasskeySidecarsFromSavedAccountToRecentlyDeleted:()SafariCoreExtras;
- (uint64_t)_safari_movePasswordCredentialsFromSavedAccountToRecentlyDeleted:()SafariCoreExtras;
- (uint64_t)_safari_movePasswordSidecarsFromSavedAccountToRecentlyDeleted:()SafariCoreExtras;
- (uint64_t)_safari_moveSidecarItemsByTypeToRecentlyDeleted:()SafariCoreExtras savedAccount:;
- (uint64_t)_safari_recoverPasskeyCredentialFromRecentlyDeletedSavedAccount:()SafariCoreExtras;
- (uint64_t)_safari_recoverPasskeySidecarsFromRecentlyDeletedSavedAccount:()SafariCoreExtras;
- (uint64_t)_safari_recoverPasswordCredentialsFromRecentlyDeletedSavedAccount:()SafariCoreExtras;
- (uint64_t)_safari_recoverPasswordSidecarsFromRecentlyDeletedSavedAccount:()SafariCoreExtras;
- (uint64_t)_safari_recoverSidecarItemsByType:()SafariCoreExtras forRecentlyDeletedSavedAccount:;
- (uint64_t)_safari_removeDefaultCommentFromKeychainItemsMatchingQuery:()SafariCoreExtras;
- (uint64_t)safari_allPasswordCredentialItemsFromGroupID:()SafariCoreExtras;
- (uint64_t)safari_allPasswordCredentialItemsInPersonalKeychain;
- (uint64_t)safari_allRecentlyDeletedPasskeyCredentialItemsInGroupWithID:()SafariCoreExtras;
- (uint64_t)safari_allRecentlyDeletedPasskeyCredentialItemsInPersonalKeychain;
- (uint64_t)safari_allRecentlyDeletedPasswordCredentialItemsInGroupWithID:()SafariCoreExtras;
- (uint64_t)safari_allRecentlyDeletedPasswordCredentialItemsInPersonalKeychain;
- (uint64_t)safari_copySavedAccountWithPasswordToPersonalKeychain:()SafariCoreExtras;
- (uint64_t)safari_copySavedAccountWithPasswordToPersonalKeychain:()SafariCoreExtras withNewUsername:;
- (uint64_t)safari_deleteAllItemsForGroupID:()SafariCoreExtras;
- (void)_safari_addKeychainItem:()SafariCoreExtras ofType:toSidecarDictionary:;
- (void)_safari_migrateKeychainItemsWithInvalidAuthenticationTypes;
- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:;
- (void)safari_deleteAllGeneratedPasswords;
- (void)safari_deleteCredentialWithEmptyServerHostForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:;
- (void)safari_deleteGeneratedPassword:()SafariCoreExtras;
- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:;
- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:;
- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:;
- (void)safari_migrateKeychainItemsWithInvalidAuthenticationTypesWithCompletionHandler:()SafariCoreExtras;
- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:;
- (void)safari_setSidecar:()SafariCoreExtras credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:;
@end

@implementation NSURLCredentialStorage(SafariCoreExtras)

- (uint64_t)safari_allRecentlyDeletedPasswordCredentialItemsInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 1, 0, 1);
}

- (id)_safari_allCredentialItemsOfType:()SafariCoreExtras groupID:fromRecentlyDeleted:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a3 == 2)
  {
    id v8 = (id)*MEMORY[0x1E4F3B9A0];
    v9 = @"com.apple.webkit.webauthn.testing";
    BOOL v10 = shouldUseTestingAccessGroups == 0;
    v11 = @"com.apple.webkit.webauthn-recently-deleted.testing";
    if (!shouldUseTestingAccessGroups) {
      v9 = @"com.apple.webkit.webauthn";
    }
    v12 = @"com.apple.webkit.webauthn-recently-deleted";
  }
  else
  {
    if (a3 != 1)
    {
      v21 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      goto LABEL_17;
    }
    id v8 = (id)*MEMORY[0x1E4F3B998];
    v9 = @"com.apple.cfnetwork.testing";
    BOOL v10 = shouldUseTestingAccessGroups == 0;
    v11 = @"com.apple.cfnetwork-recently-deleted.testing";
    if (!shouldUseTestingAccessGroups) {
      v9 = @"com.apple.cfnetwork";
    }
    v12 = @"com.apple.cfnetwork-recently-deleted";
  }
  if (v10) {
    v11 = v12;
  }
  if (!a5) {
    v11 = v9;
  }
  v13 = v11;
  v14 = (const void *)*MEMORY[0x1E4F3B550];
  result[0] = *(CFTypeRef *)MEMORY[0x1E4F3B978];
  result[1] = v14;
  *(void *)buf = v8;
  *(void *)&buf[8] = v13;
  uint64_t v15 = *MEMORY[0x1E4F3B878];
  v16 = (const void *)*MEMORY[0x1E4F3BB80];
  result[2] = *(CFTypeRef *)MEMORY[0x1E4F3B878];
  result[3] = v16;
  uint64_t v17 = *MEMORY[0x1E4F3BB88];
  *(void *)&buf[16] = MEMORY[0x1E4F1CC38];
  uint64_t v40 = v17;
  v18 = (const void *)*MEMORY[0x1E4F3BC70];
  result[4] = *(CFTypeRef *)MEMORY[0x1E4F3BC68];
  result[5] = v18;
  uint64_t v41 = MEMORY[0x1E4F1CC38];
  uint64_t v42 = MEMORY[0x1E4F1CC38];
  v19 = (const void *)*MEMORY[0x1E4F3BD08];
  result[6] = *(CFTypeRef *)MEMORY[0x1E4F3BC78];
  result[7] = v19;
  uint64_t v43 = MEMORY[0x1E4F1CC38];
  uint64_t v44 = MEMORY[0x1E4F1CC38];
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:result count:8];
  v21 = (void *)[v20 mutableCopy];

  if ([v7 length])
  {
    uint64_t v22 = *MEMORY[0x1E4F3B858];
    v36[0] = v15;
    v36[1] = v22;
    v37[0] = MEMORY[0x1E4F1CC28];
    v37[1] = v7;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    [v21 addEntriesFromDictionary:v23];
  }
LABEL_17:

  result[0] = 0;
  OSStatus v24 = SecItemCopyMatching((CFDictionaryRef)v21, result);
  if (v24)
  {
    if (v24 == -25300)
    {
      v25 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *MEMORY[0x1E4F3B550];
        v27 = v25;
        v28 = [v21 objectForKeyedSubscript:v26];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v28;
        _os_log_impl(&dword_1B728F000, v27, OS_LOG_TYPE_DEFAULT, "No credential items found in access group %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v34 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:](v34);
      }
    }
    v29 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v29 = (void *)result[0];
    v30 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      uint64_t v32 = [v29 count];
      v33 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F3B550]];
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v33;
      _os_log_impl(&dword_1B728F000, v31, OS_LOG_TYPE_DEFAULT, "Fetched %li credential items from access group %{public}@", buf, 0x16u);
    }
  }

  return v29;
}

- (id)_safari_allSidecarItemsOfType:()SafariCoreExtras groupID:fromRecentlyDeleted:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F3B998];
  v9 = (const void *)*MEMORY[0x1E4F3BB80];
  result[0] = *(CFTypeRef *)MEMORY[0x1E4F3B978];
  result[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F3BB88];
  *(void *)buf = v8;
  *(void *)&buf[8] = v10;
  v11 = (__CFString *)MEMORY[0x1E4F1CC38];
  v12 = (const void *)*MEMORY[0x1E4F3BC70];
  result[2] = *(CFTypeRef *)MEMORY[0x1E4F3BC68];
  result[3] = v12;
  *(void *)&buf[16] = MEMORY[0x1E4F1CC38];
  uint64_t v50 = MEMORY[0x1E4F1CC38];
  v13 = (const void *)*MEMORY[0x1E4F3BD08];
  result[4] = *(CFTypeRef *)MEMORY[0x1E4F3BC78];
  result[5] = v13;
  uint64_t v51 = MEMORY[0x1E4F1CC38];
  uint64_t v52 = MEMORY[0x1E4F1CC38];
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:result count:6];
  uint64_t v15 = (void *)[v14 mutableCopy];

  if ([v7 length])
  {
    if (a3 == 1)
    {
      uint64_t v42 = *MEMORY[0x1E4F3B550];
      v27 = @"com.apple.password-manager.testing";
      v28 = @"com.apple.password-manager-recently-deleted.testing";
      if (!shouldUseTestingAccessGroups)
      {
        v27 = @"com.apple.password-manager";
        v28 = @"com.apple.password-manager-recently-deleted";
      }
      if (!a5) {
        v28 = v27;
      }
      v18 = v28;
      uint64_t v19 = *MEMORY[0x1E4F3B878];
      uint64_t v45 = v18;
      v46 = (__CFString *)MEMORY[0x1E4F1CC28];
      uint64_t v20 = *MEMORY[0x1E4F3B858];
    }
    else
    {
      if (a3) {
        goto LABEL_21;
      }
      uint64_t v42 = *MEMORY[0x1E4F3B550];
      v16 = @"com.apple.password-manager.personal.testing";
      uint64_t v17 = @"com.apple.password-manager.personal-recently-deleted.testing";
      if (!shouldUseTestingAccessGroups)
      {
        v16 = @"com.apple.password-manager.personal";
        uint64_t v17 = @"com.apple.password-manager.personal-recently-deleted";
      }
      if (!a5) {
        uint64_t v17 = v16;
      }
      v18 = v17;
      uint64_t v19 = *MEMORY[0x1E4F3B878];
      uint64_t v45 = v18;
      v46 = v11;
      uint64_t v20 = *MEMORY[0x1E4F3B7B8];
    }
    uint64_t v43 = v19;
    uint64_t v44 = v20;
    id v47 = v7;
    v25 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v26 = 3;
  }
  else
  {
    uint64_t v21 = *MEMORY[0x1E4F3B878];
    uint64_t v45 = v11;
    uint64_t v22 = *MEMORY[0x1E4F3B550];
    uint64_t v42 = v21;
    uint64_t v43 = v22;
    v23 = @"com.apple.password-manager.testing";
    OSStatus v24 = @"com.apple.password-manager-recently-deleted.testing";
    if (!shouldUseTestingAccessGroups)
    {
      v23 = @"com.apple.password-manager";
      OSStatus v24 = @"com.apple.password-manager-recently-deleted";
    }
    if (!a5) {
      OSStatus v24 = v23;
    }
    v18 = v24;
    v46 = v18;
    v25 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v26 = 2;
  }
  v29 = objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", &v45, &v42, v26, v42, v43, v44, v45, v46, v47);
  [v15 addEntriesFromDictionary:v29];

LABEL_21:
  result[0] = 0;
  OSStatus v30 = SecItemCopyMatching((CFDictionaryRef)v15, result);
  if (v30)
  {
    if (v30 == -25300)
    {
      v31 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = *MEMORY[0x1E4F3B550];
        v33 = v31;
        v34 = [v15 objectForKeyedSubscript:v32];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v34;
        _os_log_impl(&dword_1B728F000, v33, OS_LOG_TYPE_DEFAULT, "No sidecar items found in access group %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v40 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:](v40);
      }
    }
    v35 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v35 = (void *)result[0];
    v36 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v36;
      uint64_t v38 = [v35 count];
      v39 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F3B550]];
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v39;
      _os_log_impl(&dword_1B728F000, v37, OS_LOG_TYPE_DEFAULT, "Fetched %li sidecar items from access group %{public}@", buf, 0x16u);
    }
  }

  return v35;
}

- (id)safari_allPersonalSidecarsInPersonalKeychain
{
  v2 = objc_msgSend(a1, "_safari_allPersonalSidecarEntriesInPersonalKeychain");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__NSURLCredentialStorage_SafariCoreExtras__safari_allPersonalSidecarsInPersonalKeychain__block_invoke;
  v5[3] = &unk_1E615B9A0;
  v5[4] = a1;
  v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", v5);

  return v3;
}

- (id)safari_allRecentlyDeletedPersonalSidecarsInPersonalKeychain
{
  v2 = objc_msgSend(a1, "_safari_allRecentlyDeletedPersonalSidecarEntriesInPersonalKeychain");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__NSURLCredentialStorage_SafariCoreExtras__safari_allRecentlyDeletedPersonalSidecarsInPersonalKeychain__block_invoke;
  v5[3] = &unk_1E615B9A0;
  v5[4] = a1;
  v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", v5);

  return v3;
}

- (uint64_t)_safari_allRecentlyDeletedPersonalSidecarEntriesInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 0, 0, 1);
}

- (uint64_t)_safari_allPersonalSidecarEntriesInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 0, 0, 0);
}

- (uint64_t)safari_allPasswordCredentialItemsInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 1, 0, 0);
}

- (uint64_t)_safari_moveKeychainItemsWithPersistentIdentifiers:()SafariCoreExtras toAccessGroup:
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v41 = *MEMORY[0x1E4F3B550];
  v42[0] = v6;
  uint64_t v7 = 1;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v25 = v6;
    uint64_t v12 = *(void *)v27;
    uint64_t v13 = *MEMORY[0x1E4F3BD40];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v38 = v13;
        v16 = objc_msgSend(v15, "objectForKeyedSubscript:", v13, v25);
        v39 = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];

        if ((SecItemUpdateWithError() & 1) == 0)
        {
          v18 = WBS_LOG_CHANNEL_PREFIXKeychain();
          id v6 = v25;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = *MEMORY[0x1E4F3B5C0];
            uint64_t v21 = v18;
            uint64_t v22 = [v15 objectForKeyedSubscript:v20];
            v23 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
            OSStatus v24 = objc_msgSend(0, "safari_privacyPreservingDescription");
            *(_DWORD *)buf = 138413058;
            v31 = v22;
            __int16 v32 = 2112;
            v33 = v23;
            __int16 v34 = 2112;
            id v35 = v25;
            __int16 v36 = 2112;
            v37 = v24;
            _os_log_error_impl(&dword_1B728F000, v21, OS_LOG_TYPE_ERROR, "Unable to move credential %@ (%@) to access group %@: %@", buf, 0x2Au);
          }
          CFRelease(0);

          uint64_t v7 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v40 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    uint64_t v7 = 1;
    id v6 = v25;
  }
LABEL_13:

  return v7;
}

- (BOOL)safari_moveCredentialTypesToRecentlyDeleted:()SafariCoreExtras onSavedAccount:
{
  id v6 = a4;
  BOOL v7 = ((a3 & [v6 credentialTypes] & 1) == 0
     || objc_msgSend(a1, "_safari_movePasswordCredentialsFromSavedAccountToRecentlyDeleted:", v6)
     && objc_msgSend(a1, "_safari_movePasswordSidecarsFromSavedAccountToRecentlyDeleted:", v6))
    && ((a3 & [v6 credentialTypes] & 2) == 0
     || objc_msgSend(a1, "_safari_movePasskeyCredentialFromSavedAccountToRecentlyDeleted:", v6)
     && objc_msgSend(a1, "_safari_movePasskeySidecarsFromSavedAccountToRecentlyDeleted:", v6));

  return v7;
}

- (uint64_t)_safari_movePasswordCredentialsFromSavedAccountToRecentlyDeleted:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safari_getCredentialItemsFromKeychainForPasswordInSavedAccount:", v4);
  unint64_t v6 = [v5 count];
  BOOL v7 = [v4 protectionSpaces];

  unint64_t v8 = [v7 count];
  if (v6 >= v8)
  {
    if (shouldUseTestingAccessGroups) {
      uint64_t v10 = @"com.apple.cfnetwork-recently-deleted.testing";
    }
    else {
      uint64_t v10 = @"com.apple.cfnetwork-recently-deleted";
    }
    uint64_t v9 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v5, v10);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)_safari_movePasswordSidecarsFromSavedAccountToRecentlyDeleted:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount:", v4);
  uint64_t v6 = objc_msgSend(a1, "_safari_moveSidecarItemsByTypeToRecentlyDeleted:savedAccount:", v5, v4);

  return v6;
}

- (uint64_t)_safari_movePasskeyCredentialFromSavedAccountToRecentlyDeleted:()SafariCoreExtras
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(a1, "_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:");
  v3 = (void *)v2;
  if (v2)
  {
    v8[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    if (shouldUseTestingAccessGroups) {
      id v5 = @"com.apple.webkit.webauthn-recently-deleted.testing";
    }
    else {
      id v5 = @"com.apple.webkit.webauthn-recently-deleted";
    }
    uint64_t v6 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v4, v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)_safari_movePasskeySidecarsFromSavedAccountToRecentlyDeleted:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount:", v4);
  uint64_t v6 = objc_msgSend(a1, "_safari_moveSidecarItemsByTypeToRecentlyDeleted:savedAccount:", v5, v4);

  return v6;
}

- (uint64_t)_safari_moveSidecarItemsByTypeToRecentlyDeleted:()SafariCoreExtras savedAccount:
{
  id v6 = a3;
  int v7 = [a4 isSavedInPersonalKeychain];
  unint64_t v8 = @"com.apple.password-manager.personal-recently-deleted.testing";
  if (shouldUseTestingAccessGroups)
  {
    uint64_t v9 = @"com.apple.password-manager-recently-deleted.testing";
  }
  else
  {
    unint64_t v8 = @"com.apple.password-manager.personal-recently-deleted";
    uint64_t v9 = @"com.apple.password-manager-recently-deleted";
  }
  if (v7) {
    unint64_t v8 = v9;
  }
  uint64_t v10 = v8;
  uint64_t v11 = [v6 objectForKeyedSubscript:&unk_1F10862A8];
  int v12 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v11, v10);

  if (v12)
  {
    uint64_t v13 = [v6 objectForKeyedSubscript:&unk_1F10862C0];
    if (shouldUseTestingAccessGroups) {
      v14 = @"com.apple.password-manager-recently-deleted.testing";
    }
    else {
      v14 = @"com.apple.password-manager-recently-deleted";
    }
    uint64_t v15 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)safari_recoverSavedAccountFromRecentlyDeleted:()SafariCoreExtras
{
  id v4 = a3;
  int v5 = [v4 credentialTypes];
  BOOL v6 = ((v5 & 1) == 0
     || objc_msgSend(a1, "_safari_recoverPasswordCredentialsFromRecentlyDeletedSavedAccount:", v4)
     && objc_msgSend(a1, "_safari_recoverPasswordSidecarsFromRecentlyDeletedSavedAccount:", v4))
    && ((v5 & [v4 credentialTypes] & 2) == 0
     || objc_msgSend(a1, "_safari_recoverPasskeyCredentialFromRecentlyDeletedSavedAccount:", v4)
     && objc_msgSend(a1, "_safari_recoverPasskeySidecarsFromRecentlyDeletedSavedAccount:", v4));

  return v6;
}

- (uint64_t)_safari_recoverPasswordCredentialsFromRecentlyDeletedSavedAccount:()SafariCoreExtras
{
  id v4 = a3;
  int v5 = objc_msgSend(a1, "_safari_getCredentialItemsFromKeychainForPasswordInSavedAccount:", v4);
  unint64_t v6 = [v5 count];
  int v7 = [v4 protectionSpaces];

  unint64_t v8 = [v7 count];
  if (v6 >= v8)
  {
    if (shouldUseTestingAccessGroups) {
      uint64_t v10 = @"com.apple.cfnetwork.testing";
    }
    else {
      uint64_t v10 = @"com.apple.cfnetwork";
    }
    uint64_t v9 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v5, v10);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)_safari_recoverPasswordSidecarsFromRecentlyDeletedSavedAccount:()SafariCoreExtras
{
  id v4 = a3;
  int v5 = objc_msgSend(a1, "_safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount:", v4);
  uint64_t v6 = objc_msgSend(a1, "_safari_recoverSidecarItemsByType:forRecentlyDeletedSavedAccount:", v5, v4);

  return v6;
}

- (uint64_t)_safari_recoverPasskeyCredentialFromRecentlyDeletedSavedAccount:()SafariCoreExtras
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(a1, "_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:");
  v3 = (void *)v2;
  if (v2)
  {
    v8[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    if (shouldUseTestingAccessGroups) {
      int v5 = @"com.apple.webkit.webauthn.testing";
    }
    else {
      int v5 = @"com.apple.webkit.webauthn";
    }
    uint64_t v6 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v4, v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)_safari_recoverPasskeySidecarsFromRecentlyDeletedSavedAccount:()SafariCoreExtras
{
  id v4 = a3;
  int v5 = objc_msgSend(a1, "_safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount:", v4);
  uint64_t v6 = objc_msgSend(a1, "_safari_recoverSidecarItemsByType:forRecentlyDeletedSavedAccount:", v5, v4);

  return v6;
}

- (uint64_t)_safari_recoverSidecarItemsByType:()SafariCoreExtras forRecentlyDeletedSavedAccount:
{
  id v6 = a3;
  int v7 = [a4 isSavedInPersonalKeychain];
  unint64_t v8 = @"com.apple.password-manager.personal.testing";
  if (shouldUseTestingAccessGroups)
  {
    uint64_t v9 = @"com.apple.password-manager.testing";
  }
  else
  {
    unint64_t v8 = @"com.apple.password-manager.personal";
    uint64_t v9 = @"com.apple.password-manager";
  }
  if (v7) {
    unint64_t v8 = v9;
  }
  uint64_t v10 = v8;
  uint64_t v11 = [v6 objectForKeyedSubscript:&unk_1F10862A8];
  int v12 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v11, v10);

  if (v12)
  {
    uint64_t v13 = [v6 objectForKeyedSubscript:&unk_1F10862C0];
    if (shouldUseTestingAccessGroups) {
      v14 = @"com.apple.password-manager.testing";
    }
    else {
      v14 = @"com.apple.password-manager";
    }
    uint64_t v15 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_safari_getCredentialItemsFromKeychainForPasswordInSavedAccount:()SafariCoreExtras
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v23 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [v3 protectionSpaces];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    CFDictionaryRef v8 = 0;
    uint64_t v9 = *(void *)v26;
    *(void *)&long long v6 = 138412802;
    long long v22 = v6;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        CFDictionaryRef v11 = v8;
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v4);
        }
        int v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v3, "user", v22);
        v14 = [v3 sharedGroupID];
        queryForUserInProtectionSpace(v13, v12, 1, v14, [v3 isRecentlyDeleted]);
        CFDictionaryRef v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        CFTypeRef result = 0;
        OSStatus v15 = SecItemCopyMatching(v8, &result);
        if (v15)
        {
          OSStatus v16 = v15;
          uint64_t v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            continue;
          }
          v18 = v17;
          uint64_t v19 = [v3 user];
          uint64_t v20 = [v12 host];
          *(_DWORD *)buf = v22;
          OSStatus v30 = v19;
          __int16 v31 = 2112;
          __int16 v32 = v20;
          __int16 v33 = 2048;
          uint64_t v34 = v16;
          _os_log_error_impl(&dword_1B728F000, v18, OS_LOG_TYPE_ERROR, "Unable to query for password credential item for %@ (%@): %ld", buf, 0x20u);
        }
        else
        {
          uint64_t v19 = (void *)result;
          [v23 addObject:result];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (!v7)
      {

        break;
      }
    }
  }

  return v23;
}

- (id)_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:()SafariCoreExtras
{
  id v3 = a3;
  queryForPasskeyFromSavedAccount(v3);
  CFDictionaryRef v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = +[WBSFeatureAvailability isCredentialExchangeEnabled];
  CFTypeRef result = 0;
  OSStatus v6 = SecItemCopyMatching(v4, &result);
  OSStatus v7 = v6;
  if (v5 && v6 == -25300)
  {
    [(__CFDictionary *)v4 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3B5C8]];
    uint64_t v9 = credentialIDData(v3);
    [(__CFDictionary *)v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B5D0]];

    OSStatus v7 = SecItemCopyMatching(v4, &result);
  }
  if (v7)
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:](v10, v3);
    }
    CFDictionaryRef v11 = 0;
  }
  else
  {
    CFDictionaryRef v11 = (void *)result;
  }

  return v11;
}

- (BOOL)safari_setCredential:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:
{
  v54[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[WBSOngoingSharingGroupProvider sharedProvider];
  char v11 = [v10 canCurrentUserEditSavedAccountsInGroupWithID:v9];

  if ((v11 & 1) == 0)
  {
    if (!shouldUseTestingAccessGroups)
    {
      uint64_t v40 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        -[NSURLCredentialStorage(SafariCoreExtras) safari_setCredential:forHTMLFormProtectionSpace:forGroupID:]();
      }
    }
    goto LABEL_25;
  }
  if ([v7 persistence] != 3) {
    goto LABEL_25;
  }
  int v12 = [v8 authenticationMethod];
  if (([v12 isEqualToString:*MEMORY[0x1E4F18C88]] & 1) == 0)
  {

    goto LABEL_25;
  }
  char v13 = [v8 isProxy];

  if (v13)
  {
LABEL_25:
    BOOL v38 = 0;
    goto LABEL_26;
  }
  v14 = [v7 user];
  OSStatus v15 = queryForUserInProtectionSpace(v14, v8, 0, v9, 0);
  OSStatus v16 = (void *)[v15 mutableCopy];

  uint64_t v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  uint64_t v19 = *MEMORY[0x1E4F3B550];
  if (v18) {
    -[NSURLCredentialStorage(SafariCoreExtras) safari_setCredential:forHTMLFormProtectionSpace:forGroupID:](v17, v16, *MEMORY[0x1E4F3B550]);
  }
  CFDictionaryRef query = (const __CFDictionary *)v16;
  v53[0] = *MEMORY[0x1E4F3BD38];
  id v47 = [v7 password];
  uint64_t v20 = [v47 dataUsingEncoding:4];
  v54[0] = v20;
  uint64_t v45 = *MEMORY[0x1E4F3B788];
  v53[1] = *MEMORY[0x1E4F3B788];
  uint64_t v21 = NSString;
  long long v22 = [v8 host];
  id v23 = [v7 user];
  OSStatus v24 = [v21 stringWithFormat:@"%@ (%@)", v22, v23];
  v54[1] = v24;
  v53[2] = *MEMORY[0x1E4F3B678];
  uint64_t v25 = _WBSLocalizedString(@"Web form password", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  long long v26 = (void *)v25;
  uint64_t v46 = v19;
  v53[3] = v19;
  if (shouldUseTestingAccessGroups) {
    long long v27 = @"com.apple.cfnetwork.testing";
  }
  else {
    long long v27 = @"com.apple.cfnetwork";
  }
  v54[2] = v25;
  v54[3] = v27;
  long long v28 = (void *)MEMORY[0x1E4F1C9E8];
  long long v29 = v27;
  OSStatus v30 = [v28 dictionaryWithObjects:v54 forKeys:v53 count:4];

  __int16 v31 = (void *)[v30 mutableCopy];
  __int16 v32 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v42 = v32;
    uint64_t v43 = [v31 objectForKeyedSubscript:v46];
    uint64_t v44 = [v31 objectForKeyedSubscript:v45];
    *(_DWORD *)buf = 138543619;
    uint64_t v50 = v43;
    __int16 v51 = 2113;
    uint64_t v52 = v44;
    _os_log_debug_impl(&dword_1B728F000, v42, OS_LOG_TYPE_DEBUG, "Attributes for credential SecItemUpdate: { accessGroup: %{public}@, label: %{private}@ }", buf, 0x16u);
  }
  __int16 v33 = [v7 user];

  if (v33)
  {
    uint64_t v34 = [v7 user];
    [v31 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  }
  if (SecItemUpdate(query, (CFDictionaryRef)v31))
  {
    id v35 = (void *)[v31 mutableCopy];
    [v35 addEntriesFromDictionary:query];
    id v36 = v35;

    if (shouldUseTestingAccessGroups) {
      [v36 setObject:@"Passwords" forKey:*MEMORY[0x1E4F3B870]];
    }
    OSStatus v37 = SecItemAdd((CFDictionaryRef)v36, 0);
    BOOL v38 = v37 == 0;
    if (v37)
    {
      v39 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) safari_setCredential:forHTMLFormProtectionSpace:forGroupID:]();
      }
    }
  }
  else
  {
    BOOL v38 = 1;
    id v36 = v31;
  }

LABEL_26:
  return v38;
}

- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = +[WBSOngoingSharingGroupProvider sharedProvider];
  char v13 = [v12 canCurrentUserEditSavedAccountsInGroupWithID:v11];

  if (v13)
  {
    v14 = queryForUserInProtectionSpace(v9, v10, 1, v11, a6);
    CFDictionaryRef v15 = (const __CFDictionary *)[v14 mutableCopy];

    CFTypeRef v27 = 0;
    OSStatus v16 = SecItemCopyMatching(v15, &v27);
    if (v16 != -25300)
    {
      if (v16)
      {
        uint64_t v25 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
        }
      }
      else
      {
        uint64_t v17 = (void *)v27;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v18 = *MEMORY[0x1E4F3BD40];
          uint64_t v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F3BD40]];
          uint64_t v20 = (void *)v19;
          if (v19)
          {
            uint64_t v28 = v18;
            v29[0] = v19;
            uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
            CFDictionaryRef v22 = (const __CFDictionary *)[v21 mutableCopy];

            if (SecItemDelete(v22))
            {
              id v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
              }
            }
          }
          else
          {
            long long v26 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
            }
          }
        }
      }
    }
  }
  else if (!shouldUseTestingAccessGroups)
  {
    OSStatus v24 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.4();
    }
  }
}

- (void)safari_deleteCredentialWithEmptyServerHostForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = +[WBSOngoingSharingGroupProvider sharedProvider];
  char v13 = [v12 canCurrentUserEditSavedAccountsInGroupWithID:v11];

  if (v13)
  {
    id v14 = v9;
    CFDictionaryRef v15 = queryForUserInProtectionSpace(v14, v10, 1, v11, a6);
    OSStatus v16 = (void *)[v15 mutableCopy];

    [v16 setObject:*MEMORY[0x1E4F3BB88] forKeyedSubscript:*MEMORY[0x1E4F3BB80]];
    CFTypeRef result = 0;
    if (SecItemCopyMatching((CFDictionaryRef)v16, &result))
    {
      uint64_t v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteCredentialWithEmptyServerHostForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
      }
    }
    else
    {
      uint64_t v19 = (void *)result;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = 0;
        uint64_t v28 = &v27;
        uint64_t v29 = 0x2020000000;
        uint64_t v30 = 0;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __152__NSURLCredentialStorage_SafariCoreExtras__safari_deleteCredentialWithEmptyServerHostForUser_forHTMLFormProtectionSpace_forGroupID_fromRecentlyDeleted___block_invoke;
        v26[3] = &unk_1E615B908;
        v26[4] = &v27;
        [v19 enumerateObjectsUsingBlock:v26];
        uint64_t v20 = *MEMORY[0x1E4F3B998];
        uint64_t v21 = *MEMORY[0x1E4F3BD40];
        v32[0] = *MEMORY[0x1E4F3B978];
        v32[1] = v21;
        uint64_t v22 = v28[3];
        v33[0] = v20;
        v33[1] = v22;
        id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
        CFDictionaryRef v24 = (const __CFDictionary *)[v23 mutableCopy];

        if (SecItemDelete(v24))
        {
          uint64_t v25 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteCredentialWithEmptyServerHostForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
          }
        }

        _Block_object_dispose(&v27, 8);
      }
    }
  }
  else if (!shouldUseTestingAccessGroups)
  {
    uint64_t v18 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteCredentialWithEmptyServerHostForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
    }
  }
}

- (id)_formattedLabelWithHost:()SafariCoreExtras user:
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v7 = [NSString stringWithFormat:@"%@ (%@)", v5, v6];
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 user];
  id v9 = queryForUserInProtectionSpace(v8, v7, 0, 0, 0);
  CFDictionaryRef v10 = (const __CFDictionary *)[v9 mutableCopy];

  id v11 = [v6 password];

  if (v11)
  {
    OSStatus v12 = SecItemCopyMatching(v10, 0);
    if (v12)
    {
      if (v12 == -25300)
      {
        char v13 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = v13;
          CFDictionaryRef v15 = [v6 user];
          OSStatus v16 = [v7 host];
          *(_DWORD *)buf = 138478083;
          uint64_t v46 = v15;
          __int16 v47 = 2113;
          v48 = v16;
          _os_log_impl(&dword_1B728F000, v14, OS_LOG_TYPE_INFO, "Credential for '%{private}@' in protection space %{private}@ doesn't exist.", buf, 0x16u);
        }
        objc_msgSend(a1, "safari_setCredential:forHTMLFormProtectionSpace:forGroupID:", v6, v7, &stru_1F105D3F0);
      }
      else
      {
        id v36 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:]();
        }
      }
    }
    else
    {
      BOOL v18 = +[WBSFeatureAvailability supportsURLCredentialStorageAccessControlGroups];
      uint64_t v19 = WBS_LOG_CHANNEL_PREFIXKeychain();
      uint64_t v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.6(v20);
        }
        uint64_t v21 = *MEMORY[0x1E4F3B660];
        [(__CFDictionary *)v10 setObject:@"default" forKeyedSubscript:*MEMORY[0x1E4F3B660]];
        uint64_t v22 = *MEMORY[0x1E4F3B5C0];
        [(__CFDictionary *)v10 removeObjectForKey:*MEMORY[0x1E4F3B5C0]];
        uint64_t v40 = v21;
        uint64_t v43 = v21;
        uint64_t v44 = &stru_1F105D3F0;
        OSStatus v23 = SecItemUpdate(v10, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1]);
        if (v23 != -25300 && v23)
        {
          OSStatus v37 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:]();
          }
        }
        else
        {
          uint64_t v38 = v22;
          CFDictionaryRef v24 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.5(v24, v6);
          }
          v41[0] = *MEMORY[0x1E4F3BD38];
          v39 = [v6 password];
          uint64_t v25 = [v39 dataUsingEncoding:4];
          v42[0] = v25;
          v41[1] = *MEMORY[0x1E4F3B788];
          long long v26 = [v7 host];
          uint64_t v27 = [v6 user];
          uint64_t v28 = [a1 _formattedLabelWithHost:v26 user:v27];
          v42[1] = v28;
          v41[2] = *MEMORY[0x1E4F3B678];
          uint64_t v29 = _WBSLocalizedString(@"Web form password", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
          v41[3] = v40;
          v42[2] = v29;
          void v42[3] = @"default";
          uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:4];
          __int16 v31 = (void *)[v30 mutableCopy];

          __int16 v32 = [v6 user];

          if (v32)
          {
            __int16 v33 = [v6 user];
            [v31 setObject:v33 forKeyedSubscript:v38];

            uint64_t v34 = [v6 user];
            [(__CFDictionary *)v10 setObject:v34 forKeyedSubscript:v38];
          }
          [(__CFDictionary *)v10 removeObjectForKey:v40];
          if (SecItemUpdate(v10, (CFDictionaryRef)v31))
          {
            id v35 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.4();
            }
          }
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.7();
      }
    }
  }
  else
  {
    uint64_t v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:](v17, v6);
    }
  }
}

- (id)safari_allSafariCredentials
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  if (+[WBSFeatureAvailability supportsURLCredentialStorageAccessControlGroups])
  {
    if (shouldUseTestingAccessGroups) {
      id v3 = @"com.apple.cfnetwork.testing";
    }
    else {
      id v3 = @"com.apple.cfnetwork";
    }
    uint64_t v4 = [a1 _allCredentialsWithAccessControlGroup:v3 includeLegacyKeychain:0];
  }
  else
  {
    uint64_t v4 = [a1 allCredentials];
  }
  id v5 = (void *)v4;
  id v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    [v2 timeIntervalSinceNow];
    int v13 = 136446466;
    id v14 = "all_credentials_fetch";
    __int16 v15 = 2048;
    double v16 = -v8;
    _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", (uint8_t *)&v13, 0x16u);
  }
  id v9 = objc_msgSend(v5, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_29);
  CFDictionaryRef v10 = v9;
  if (!v9) {
    id v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v11 = v9;

  return v11;
}

- (uint64_t)safari_allPasswordCredentialItemsFromGroupID:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 1, a3, 0);
}

- (uint64_t)safari_allRecentlyDeletedPasskeyCredentialItemsInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 2, 0, 1);
}

- (uint64_t)safari_allRecentlyDeletedPasswordCredentialItemsInGroupWithID:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 1, a3, 1);
}

- (uint64_t)safari_allRecentlyDeletedPasskeyCredentialItemsInGroupWithID:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 2, a3, 1);
}

- (uint64_t)_safari_removeDefaultCommentFromKeychainItemsMatchingQuery:()SafariCoreExtras
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F3B660];
  v11[0] = &stru_1F105D3F0;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  id v5 = [v3 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  CFTypeRef cf = 0;
  uint64_t v6 = SecItemUpdateWithError();

  if ((v6 & 1) == 0)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_removeDefaultCommentFromKeychainItemsMatchingQuery:]((uint64_t)&cf, v7);
    }
    CFRelease(cf);
  }

  return v6;
}

- (void)safari_migrateKeychainItemsWithInvalidAuthenticationTypesWithCompletionHandler:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __123__NSURLCredentialStorage_SafariCoreExtras__safari_migrateKeychainItemsWithInvalidAuthenticationTypesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_safari_migrateKeychainItemsWithInvalidAuthenticationTypes
{
  id v6 = a2;
  id v7 = objc_opt_class();
  *(_DWORD *)a1 = 138412290;
  *a4 = v7;
  id v8 = v7;
  _os_log_error_impl(&dword_1B728F000, v6, OS_LOG_TYPE_ERROR, "kSecAttrAccount value for keychain item was not of type string, got type: %@", a1, 0xCu);
}

- (id)_safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __107__NSURLCredentialStorage_SafariCoreExtras___safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount___block_invoke;
  v11[3] = &unk_1E615B978;
  v11[4] = a1;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [v7 enumeratePasswordSidecarsWithBlock:v11];
  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)_safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __106__NSURLCredentialStorage_SafariCoreExtras___safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount___block_invoke;
  v11[3] = &unk_1E615B978;
  v11[4] = a1;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [v7 enumeratePasskeySidecarsWithBlock:v11];
  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)_safari_getKeychainItemForSidecar:()SafariCoreExtras ofType:groupID:fromRecentlyDeleted:
{
  id v9 = a3;
  if (a4) {
    uint64_t v10 = 1936220530;
  }
  else {
    uint64_t v10 = 1835626085;
  }
  id v11 = a5;
  id v12 = [v9 user];
  id v13 = [v9 protectionSpace];
  queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(v10, v12, v13, v11, a6, 1);
  CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CFTypeRef result = 0;
  OSStatus v15 = SecItemCopyMatching(v14, &result);
  if (v15 != -25300 && v15)
  {
    uint64_t v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_getKeychainItemForSidecar:ofType:groupID:fromRecentlyDeleted:](v17, v9);
    }
    double v16 = 0;
  }
  else
  {
    double v16 = (void *)result;
  }

  return v16;
}

- (void)_safari_addKeychainItem:()SafariCoreExtras ofType:toSidecarDictionary:
{
  id v11 = a3;
  id v7 = a5;
  if (v11)
  {
    id v8 = [NSNumber numberWithInteger:a4];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v10 = [NSNumber numberWithInteger:a4];
      [v7 setObject:v9 forKeyedSubscript:v10];
    }
    [v9 addObject:v11];
  }
}

- (id)safari_allSharedSidecarsForGroupID:()SafariCoreExtras fromRecentlyDeleted:
{
  id v5 = objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 1, a3, a4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __99__NSURLCredentialStorage_SafariCoreExtras__safari_allSharedSidecarsForGroupID_fromRecentlyDeleted___block_invoke;
  v8[3] = &unk_1E615B9C8;
  v8[4] = a1;
  id v6 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);

  return v6;
}

- (id)safari_allPersonalSidecarsForGroupID:()SafariCoreExtras fromRecentlyDeleted:
{
  id v5 = objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 0, a3, a4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __101__NSURLCredentialStorage_SafariCoreExtras__safari_allPersonalSidecarsForGroupID_fromRecentlyDeleted___block_invoke;
  v8[3] = &unk_1E615B9A0;
  v8[4] = a1;
  id v6 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);

  return v6;
}

- (id)_safari_protectionSpaceFromKeychainDictionary:()SafariCoreExtras
{
  id v3 = (objc_class *)MEMORY[0x1E4F18D98];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B7C0]];
  uint64_t v8 = [v7 integerValue];
  id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B7C8]];

  uint64_t v10 = WBSHTTPProtocolFromSecAttrProtocolValue(v9);
  id v11 = (void *)[v5 initWithHost:v6 port:v8 protocol:v10 realm:0 authenticationMethod:*MEMORY[0x1E4F18C88]];

  return v11;
}

- (id)_safari_dataFromSidecarDictionary:()SafariCoreExtras user:domain:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v16 = 0;
  id v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v16];
  id v10 = v16;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      CFDictionaryRef v14 = v12;
      OSStatus v15 = objc_msgSend(v10, "safari_privacyPreservingDescription");
      *(_DWORD *)buf = 138478339;
      id v18 = v7;
      __int16 v19 = 2113;
      id v20 = v8;
      __int16 v21 = 2114;
      uint64_t v22 = v15;
      _os_log_fault_impl(&dword_1B728F000, v14, OS_LOG_TYPE_FAULT, "Unable to archive sidecar for %{private}@ (%{private}@): %{public}@", buf, 0x20u);
    }
  }

  return v9;
}

- (id)_safari_sidecarDictionaryFromData:()SafariCoreExtras user:domain:
{
  id v7 = a4;
  id v8 = a5;
  id v15 = 0;
  id v9 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v15];
  id v10 = v15;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
      goto LABEL_9;
    }
    id v13 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_sidecarDictionaryFromData:user:domain:]();
    }
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_sidecarDictionaryFromData:user:domain:](v12);
    }
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

- (void)safari_setSidecar:()SafariCoreExtras credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = +[WBSOngoingSharingGroupProvider sharedProvider];
  char v17 = [v16 canCurrentUserEditSavedAccountsInGroupWithID:v15];

  if (v17)
  {
    id v18 = [v12 dictionaryRepresentation];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v19 = a1;
      id v20 = v18;
      uint64_t v21 = 1835626085;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          CFDictionaryRef v24 = v23;
          uint64_t v25 = (objc_class *)objc_opt_class();
          long long v26 = NSStringFromClass(v25);
          uint64_t v27 = [v13 user];
          uint64_t v28 = [v14 host];
          int v29 = 138543874;
          uint64_t v30 = v26;
          __int16 v31 = 2112;
          __int16 v32 = v27;
          __int16 v33 = 2112;
          uint64_t v34 = v28;
          _os_log_error_impl(&dword_1B728F000, v24, OS_LOG_TYPE_ERROR, "Attempted to set non-sidecar object of type %{public}@ for %@ (%@)", (uint8_t *)&v29, 0x20u);
        }
        goto LABEL_12;
      }
      __int16 v19 = a1;
      id v20 = v18;
      uint64_t v21 = 1936220530;
    }
    objc_msgSend(v19, "_safari_setSidecarDictionary:type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:", v20, v21, v13, v14, v15, a7);
LABEL_12:

    goto LABEL_13;
  }
  if (!shouldUseTestingAccessGroups)
  {
    uint64_t v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
    }
  }
LABEL_13:
}

- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = +[WBSOngoingSharingGroupProvider sharedProvider];
  char v19 = [v18 canCurrentUserEditSavedAccountsInGroupWithID:v17];

  if (v19)
  {
    if ([v15 persistence] == 3)
    {
      id v20 = [v16 authenticationMethod];
      if ([v20 isEqualToString:*MEMORY[0x1E4F18C88]])
      {
        char v21 = [v16 isProxy];

        if ((v21 & 1) == 0)
        {
          uint64_t v22 = [v15 user];
          uint64_t v23 = [v16 host];
          CFDictionaryRef v24 = objc_msgSend(a1, "_safari_dataFromSidecarDictionary:user:domain:", v14, v22, v23);

          if (!v24)
          {
LABEL_33:

            goto LABEL_34;
          }
          uint64_t v25 = [v15 user];
          queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(a4, v25, v16, v17, a8, 0);
          CFDictionaryRef v26 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          CFDictionaryRef query = v26;
          if (a4 == 1936220530)
          {
            __int16 v33 = NSString;
            uint64_t v34 = _WBSLocalizedString(@"Password Manager Shared Metadata: %@ (%@)", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
            uint64_t v35 = [v16 host];
            id v36 = [v15 user];
            uint64_t v30 = objc_msgSend(v33, "localizedStringWithFormat:", v34, v35, v36);

            CFDictionaryRef v26 = query;
            __int16 v31 = @"Password Manager Shared Metadata";
          }
          else
          {
            if (a4 != 1835626085)
            {
              uint64_t v53 = WBS_LOG_CHANNEL_PREFIXKeychain();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                v54 = v53;
                v55 = [v16 host];
                v56 = [v15 user];
                *(_DWORD *)buf = 134218498;
                uint64_t v69 = a4;
                __int16 v70 = 2112;
                v71 = v55;
                __int16 v72 = 2112;
                v73 = v56;
                _os_log_error_impl(&dword_1B728F000, v54, OS_LOG_TYPE_ERROR, "Invalid sidecar type (%lu) while setting sidecar for %@ (%@)", buf, 0x20u);
              }
              goto LABEL_32;
            }
            uint64_t v27 = NSString;
            uint64_t v28 = [v16 host];
            int v29 = [v15 user];
            uint64_t v30 = [v27 localizedStringWithFormat:@"Password Manager Metadata: %@ (%@)", v28, v29];

            __int16 v31 = @"Password Manager Metadata";
          }
          uint64_t v37 = _WBSLocalizedString(v31, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
          uint64_t v38 = *MEMORY[0x1E4F3BD38];
          v62 = v24;
          v67[0] = v24;
          uint64_t v58 = *MEMORY[0x1E4F3B8C0];
          uint64_t v59 = v38;
          v66[0] = v38;
          v66[1] = v58;
          v39 = [NSNumber numberWithUnsignedInteger:a4];
          uint64_t v40 = *MEMORY[0x1E4F3B788];
          v67[1] = v39;
          v67[2] = v30;
          v61 = (void *)v30;
          uint64_t v41 = v40;
          uint64_t v42 = *MEMORY[0x1E4F3B678];
          v66[2] = v41;
          v66[3] = v42;
          v60 = (void *)v37;
          v67[3] = v37;
          uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:4];
          uint64_t v44 = objc_msgSend(v43, "safari_dictionaryByMergingWithDictionary:", v26);
          uint64_t v45 = (void *)[v44 mutableCopy];

          if (shouldUseTestingAccessGroups) {
            [v45 setObject:@"Passwords" forKey:*MEMORY[0x1E4F3B870]];
          }
          uint64_t v46 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            -[NSURLCredentialStorage(SafariCoreExtras) _safari_setSidecarDictionary:type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:].cold.4(v46, v45, v41);
          }
          OSStatus v47 = SecItemAdd((CFDictionaryRef)v45, 0);
          CFDictionaryRef v24 = v62;
          if (v47)
          {
            if (v47 != -25299)
            {
              v57 = WBS_LOG_CHANNEL_PREFIXKeychain();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                -[NSURLCredentialStorage(SafariCoreExtras) _safari_setSidecarDictionary:type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:]();
              }
              goto LABEL_31;
            }
            v64[0] = v59;
            v64[1] = v58;
            v65[0] = v62;
            v48 = [NSNumber numberWithUnsignedInteger:a4];
            v65[1] = v48;
            CFDictionaryRef v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];

            OSStatus v50 = SecItemUpdate(query, v49);
            __int16 v51 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              -[NSURLCredentialStorage(SafariCoreExtras) _safari_setSidecarDictionary:type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:](v51, query);
              if (v50) {
                goto LABEL_22;
              }
            }
            else if (v50)
            {
LABEL_22:
              uint64_t v52 = WBS_LOG_CHANNEL_PREFIXKeychain();
              CFDictionaryRef v24 = v62;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
                -[NSURLCredentialStorage(SafariCoreExtras) _safari_setSidecarDictionary:type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:]();
              }

              goto LABEL_31;
            }

            CFDictionaryRef v24 = v62;
          }
LABEL_31:

          CFDictionaryRef v26 = query;
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
      }
    }
  }
  else if (!shouldUseTestingAccessGroups)
  {
    __int16 v32 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
    }
  }
LABEL_34:
}

- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:
{
  void v32[2] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[WBSOngoingSharingGroupProvider sharedProvider];
  char v15 = [v14 canCurrentUserEditSavedAccountsInGroupWithID:v13];

  if (v15)
  {
    if (a3) {
      uint64_t v16 = 1936220530;
    }
    else {
      uint64_t v16 = 1835626085;
    }
    queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(v16, v11, v12, v13, a7, 1);
    CFDictionaryRef v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFTypeRef v30 = 0;
    OSStatus v18 = SecItemCopyMatching(v17, &v30);
    if (v18 != -25300)
    {
      if (v18)
      {
        uint64_t v28 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
        }
      }
      else
      {
        char v19 = (void *)v30;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = *MEMORY[0x1E4F3BD40];
          uint64_t v21 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F3BD40]];
          uint64_t v22 = (void *)v21;
          if (v21)
          {
            uint64_t v23 = *MEMORY[0x1E4F3B998];
            v31[0] = *MEMORY[0x1E4F3B978];
            v31[1] = v20;
            v32[0] = v23;
            v32[1] = v21;
            CFDictionaryRef v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
            CFDictionaryRef v25 = (const __CFDictionary *)[v24 mutableCopy];

            if (SecItemDelete(v25))
            {
              CFDictionaryRef v26 = WBS_LOG_CHANNEL_PREFIXKeychain();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
              }
            }
          }
          else
          {
            int v29 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:]();
            }
          }
        }
      }
    }
  }
  else if (!shouldUseTestingAccessGroups)
  {
    uint64_t v27 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.4();
    }
  }
}

- (uint64_t)safari_copySavedAccountWithPasswordToPersonalKeychain:()SafariCoreExtras
{
  return objc_msgSend(a1, "safari_copySavedAccountWithPasswordToPersonalKeychain:withNewUsername:", a3, 0);
}

- (uint64_t)safari_copySavedAccountWithPasswordToPersonalKeychain:()SafariCoreExtras withNewUsername:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v27 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [v26 protectionSpaces];
  uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v35;
    uint64_t v25 = *MEMORY[0x1E4F3B878];
    uint64_t v24 = *MEMORY[0x1E4F3B858];
    uint64_t v7 = *MEMORY[0x1E4F3B998];
    uint64_t v8 = *MEMORY[0x1E4F3B978];
    uint64_t v9 = *MEMORY[0x1E4F3BD40];
    uint64_t v22 = *MEMORY[0x1E4F3B5C0];
    uint64_t v21 = *MEMORY[0x1E4F3B870];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(obj);
        }
        queryForPasswordFromSavedAccountAndProtectionSpace(v26, *(void **)(*((void *)&v34 + 1) + 8 * i), 1);
        CFDictionaryRef v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        result[0] = 0;
        if (SecItemCopyMatching(v11, result))
        {
          uint64_t v16 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasswordToPersonalKeychain:withNewUsername:]();
          }
          goto LABEL_24;
        }
        id v12 = (void *)result[0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CFDictionaryRef v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasswordToPersonalKeychain:withNewUsername:](v17);
          }

          goto LABEL_24;
        }
        id v13 = (void *)[v12 mutableCopy];
        [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v25];
        [v13 setObject:0 forKeyedSubscript:v24];
        [v13 setObject:v7 forKeyedSubscript:v8];
        [v13 setObject:0 forKeyedSubscript:v9];
        if (v27) {
          [v13 setObject:v27 forKeyedSubscript:v22];
        }
        if (shouldUseTestingAccessGroups) {
          [v13 setObject:@"Passwords" forKey:v21];
        }
        OSStatus v14 = SecItemAdd((CFDictionaryRef)v13, 0);
        if (v14)
        {
          OSStatus v18 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            OSStatus v39 = v14;
            _os_log_error_impl(&dword_1B728F000, v18, OS_LOG_TYPE_ERROR, "SecItemAdd for password credential from group to personal keychain failed with error %d", buf, 8u);
          }

LABEL_24:
          uint64_t v15 = 0;
          goto LABEL_25;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  [v26 _writeFormerlySharedSavedAccountMarkerForCredentialTypes:1];
  [v26 _copySharablePasswordSidecarDataFromSharedSidecarsToPersonalSidecars];
  result[0] = 0;
  result[1] = result;
  result[2] = (CFTypeRef)0x2020000000;
  char v33 = 1;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __114__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasswordToPersonalKeychain_withNewUsername___block_invoke;
  v28[3] = &unk_1E615B9F0;
  __int16 v31 = result;
  v28[4] = a1;
  id v29 = v27;
  id v30 = v26;
  [v30 enumeratePasswordSidecarsWithBlock:v28];

  _Block_object_dispose(result, 8);
  uint64_t v15 = 1;
LABEL_25:

  return v15;
}

- (BOOL)safari_copySavedAccountWithPassword:()SafariCoreExtras toGroupWithID:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v8 = [v6 protectionSpaces];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = queryForPasswordFromSavedAccountAndProtectionSpace(v6, *(void **)(*((void *)&v29 + 1) + 8 * i), 0);
          objc_msgSend(a1, "_safari_removeDefaultCommentFromKeychainItemsMatchingQuery:", v12);
          CFTypeRef cf = 0;
          id v13 = (const void *)SecItemShareWithGroup();
          if (v13) {
            CFRelease(v13);
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v9);
    }

    if ([v6 hasPasswordSidecars])
    {
      [v6 _clearFormerlySharedSavedAccountMarkerForCredentialTypesIfNecessary:1];
      [v6 _copySharablePasswordSidecarDataFromPersonalSidecarsToSharedSidecars];
      OSStatus v14 = [v6 sharedGroupID];
      CFTypeRef cf = 0;
      p_CFTypeRef cf = &cf;
      uint64_t v27 = 0x2020000000;
      char v28 = 1;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __94__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPassword_toGroupWithID___block_invoke;
      v19[3] = &unk_1E615BA18;
      id v15 = v14;
      uint64_t v24 = &cf;
      id v20 = v15;
      uint64_t v21 = a1;
      id v22 = v7;
      id v23 = v6;
      [v23 enumeratePasswordSidecarsWithBlock:v19];
      BOOL v16 = *((unsigned char *)p_cf + 24) != 0;

      _Block_object_dispose(&cf, 8);
    }
    else
    {
      BOOL v16 = 1;
    }
  }
  else
  {
    CFDictionaryRef v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPassword:toGroupWithID:]();
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)safari_copySavedAccountWithPasskeyToPersonalKeychain:()SafariCoreExtras
{
  id v4 = a3;
  queryForPasskeyFromSavedAccount(v4);
  CFDictionaryRef v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = +[WBSFeatureAvailability isCredentialExchangeEnabled];
  CFTypeRef result = 0;
  OSStatus v7 = SecItemCopyMatching(v5, &result);
  OSStatus v8 = v7;
  if (v6 && v7 == -25300)
  {
    [(__CFDictionary *)v5 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3B5C8]];
    uint64_t v10 = credentialIDData(v4);
    [(__CFDictionary *)v5 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F3B5D0]];

    OSStatus v8 = SecItemCopyMatching(v5, &result);
  }
  if (v8)
  {
    CFDictionaryRef v11 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasskeyToPersonalKeychain:]();
    }
    BOOL v12 = 0;
  }
  else
  {
    id v13 = (void *)result;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      OSStatus v14 = (void *)[v13 mutableCopy];
      [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3B878]];
      [v14 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3B858]];
      [v14 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
      [v14 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3BD40]];
      if (shouldUseTestingAccessGroups) {
        [v14 setObject:@"Passwords" forKey:*MEMORY[0x1E4F3B870]];
      }
      OSStatus v15 = SecItemAdd((CFDictionaryRef)v14, 0);
      BOOL v12 = v15 == 0;
      if (v15)
      {
        BOOL v16 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasskeyToPersonalKeychain:]();
        }
      }
      else
      {
        [v4 _writeFormerlySharedSavedAccountMarkerForCredentialTypes:2];
        if ([v4 hasPasskeySidecars])
        {
          [v4 _copySharablePasskeySidecarDataFromSharedSidecarsToPersonalSidecars];
          v22[0] = 0;
          v22[1] = v22;
          v22[2] = 0x2020000000;
          char v23 = 1;
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __97__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasskeyToPersonalKeychain___block_invoke;
          v19[3] = &unk_1E615BA40;
          uint64_t v21 = v22;
          void v19[4] = a1;
          id v20 = v4;
          [v20 enumeratePasskeySidecarsWithBlock:v19];

          _Block_object_dispose(v22, 8);
        }
      }
    }
    else
    {
      CFDictionaryRef v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasskeyToPersonalKeychain:](v17);
      }
      BOOL v12 = 0;
    }
  }
  return v12;
}

- (BOOL)safari_copySavedAccountWithPasskey:()SafariCoreExtras toGroupWithID:
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    OSStatus v8 = queryForPasskeyFromSavedAccount(v6);
    objc_msgSend(a1, "_safari_removeDefaultCommentFromKeychainItemsMatchingQuery:", v8);
    id v32 = 0;
    BOOL v9 = +[WBSFeatureAvailability isCredentialExchangeEnabled];
    uint64_t v10 = (const void *)SecItemShareWithGroup();
    if (v10) {
      CFRelease(v10);
    }
    id v11 = v32;
    BOOL v12 = v11;
    if (v9)
    {
      id v13 = [v11 domain];
      if ([v13 isEqual:*MEMORY[0x1E4F28760]])
      {
        uint64_t v14 = [v12 code];

        if (v14 == -25300)
        {
          [v8 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3B5C8]];
          OSStatus v15 = credentialIDData(v6);
          [v8 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F3B5D0]];

          BOOL v16 = (const void *)SecItemShareWithGroup();
          if (v16) {
            CFRelease(v16);
          }
        }
      }
      else
      {
      }
    }
    BOOL v18 = 1;
    if ([v6 hasPasskeySidecars])
    {
      [v6 _clearFormerlySharedSavedAccountMarkerForCredentialTypesIfNecessary:2];
      [v6 _copySharablePasskeySidecarDataFromPersonalSidecarsToSharedSidecars];
      char v19 = [v6 sharedGroupID];
      uint64_t v28 = 0;
      long long v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 1;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __93__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasskey_toGroupWithID___block_invoke;
      void v22[3] = &unk_1E615BA18;
      id v20 = v19;
      uint64_t v27 = &v28;
      id v23 = v20;
      uint64_t v24 = a1;
      id v25 = v7;
      id v26 = v6;
      [v26 enumeratePasskeySidecarsWithBlock:v22];
      BOOL v18 = *((unsigned char *)v29 + 24) != 0;

      _Block_object_dispose(&v28, 8);
    }
  }
  else
  {
    CFDictionaryRef v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasskey:toGroupWithID:]();
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (uint64_t)_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:()SafariCoreExtras fromRecentlyDeleted:
{
  return objc_msgSend(a1, "_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:withNewUsername:fromRecentlyDeleted:", a3, 0, a4);
}

- (BOOL)_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:()SafariCoreExtras withNewUsername:fromRecentlyDeleted:
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 dictionaryRepresentation];
  id v11 = [v8 user];
  BOOL v12 = [v8 protectionSpace];
  id v13 = [v12 host];
  uint64_t v14 = objc_msgSend(a1, "_safari_dataFromSidecarDictionary:user:domain:", v10, v11, v13);

  if (v14)
  {
    OSStatus v15 = v9;
    if (!v9)
    {
      OSStatus v15 = [v8 user];
    }
    BOOL v16 = [v8 protectionSpace];
    CFDictionaryRef v17 = queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1835626085, v15, v16, 0, a5, 0);

    if (!v9) {
    uint64_t v18 = *MEMORY[0x1E4F3B8C0];
    }
    v24[0] = *MEMORY[0x1E4F3BD38];
    v24[1] = v18;
    v25[0] = v14;
    v25[1] = &unk_1F10862D8;
    v24[2] = *MEMORY[0x1E4F3B7B8];
    v25[2] = &stru_1F105D3F0;
    char v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
    [v17 addEntriesFromDictionary:v19];

    if (shouldUseTestingAccessGroups) {
      [v17 setObject:@"Passwords" forKey:*MEMORY[0x1E4F3B870]];
    }
    OSStatus v20 = SecItemAdd((CFDictionaryRef)v17, 0);
    BOOL v21 = v20 == 0;
    if (v20)
    {
      id v22 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:withNewUsername:fromRecentlyDeleted:]();
      }
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)_safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:()SafariCoreExtras forGroupWithID:fromRecentlyDeleted:
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 dictionaryRepresentation];
  id v11 = [v8 user];
  BOOL v12 = [v8 protectionSpace];
  id v13 = [v12 host];
  uint64_t v14 = objc_msgSend(a1, "_safari_dataFromSidecarDictionary:user:domain:", v10, v11, v13);

  if (v14)
  {
    OSStatus v15 = [v8 user];
    BOOL v16 = [v8 protectionSpace];
    CFDictionaryRef v17 = queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1835626085, v15, v16, v9, a5, 0);

    uint64_t v18 = *MEMORY[0x1E4F3B8C0];
    v24[0] = *MEMORY[0x1E4F3BD38];
    v24[1] = v18;
    v25[0] = v14;
    v25[1] = &unk_1F10862D8;
    char v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v17 addEntriesFromDictionary:v19];

    if (shouldUseTestingAccessGroups) {
      [v17 setObject:@"Passwords" forKey:*MEMORY[0x1E4F3B870]];
    }
    OSStatus v20 = SecItemAdd((CFDictionaryRef)v17, 0);
    BOOL v21 = v20 == 0;
    if (v20)
    {
      id v22 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:forGroupWithID:fromRecentlyDeleted:]();
      }
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)_safari_copyPersonalSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 dictionaryRepresentation];
  BOOL v12 = [v9 user];
  id v13 = [v9 protectionSpace];
  uint64_t v14 = [v13 host];
  OSStatus v15 = objc_msgSend(a1, "_safari_dataFromSidecarDictionary:user:domain:", v11, v12, v14);

  if (v15)
  {
    BOOL v16 = [v9 user];
    CFDictionaryRef v17 = [v9 protectionSpace];
    uint64_t v18 = queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1835626085, v16, v17, v10, a6, 0);

    uint64_t v19 = *MEMORY[0x1E4F3B8C0];
    v25[0] = *MEMORY[0x1E4F3BD38];
    v25[1] = v19;
    v26[0] = v15;
    v26[1] = &unk_1F10862D8;
    OSStatus v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v18 addEntriesFromDictionary:v20];

    if (shouldUseTestingAccessGroups) {
      [v18 setObject:@"Passwords" forKey:*MEMORY[0x1E4F3B870]];
    }
    OSStatus v21 = SecItemAdd((CFDictionaryRef)v18, 0);
    BOOL v22 = v21 == 0;
    if (v21)
    {
      id v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_copyPersonalSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:]();
      }
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (uint64_t)_safari_copySharedSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:
{
  void v32[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![v11 length])
  {
    uint64_t v18 = [v10 dictionaryRepresentation];
    uint64_t v19 = [v10 user];
    OSStatus v20 = [v10 protectionSpace];
    OSStatus v21 = [v20 host];
    OSStatus v15 = objc_msgSend(a1, "_safari_dataFromSidecarDictionary:user:domain:", v18, v19, v21);

    if (!v15)
    {
      uint64_t v17 = 0;
      goto LABEL_17;
    }
    BOOL v22 = [v10 user];
    id v23 = [v10 protectionSpace];
    uint64_t v24 = queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1936220530, v22, v23, v12, a6, 0);

    uint64_t v25 = *MEMORY[0x1E4F3B8C0];
    v31[0] = *MEMORY[0x1E4F3BD38];
    v31[1] = v25;
    v32[0] = v15;
    v32[1] = &unk_1F10862F0;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    [v24 addEntriesFromDictionary:v26];

    if (shouldUseTestingAccessGroups) {
      [v24 setObject:@"Passwords" forKey:*MEMORY[0x1E4F3B870]];
    }
    if (!SecItemAdd((CFDictionaryRef)v24, 0))
    {

      goto LABEL_4;
    }
    uint64_t v27 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_copySharedSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:]();
    }

LABEL_15:
    uint64_t v17 = 0;
    goto LABEL_16;
  }
  id v13 = [v10 user];
  uint64_t v14 = [v10 protectionSpace];
  OSStatus v15 = queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1936220530, v13, v14, v11, a6, 1);

  CFTypeRef cf = 0;
  BOOL v16 = (const void *)SecItemShareWithGroup();
  if (!v16)
  {
    uint64_t v28 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_copySharedSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:]((uint64_t)v12, (uint64_t)&cf, v28);
    }
    CFRelease(cf);
    goto LABEL_15;
  }
  CFRelease(v16);
LABEL_4:
  uint64_t v17 = 1;
LABEL_16:

LABEL_17:
  return v17;
}

- (uint64_t)safari_deleteAllItemsForGroupID:()SafariCoreExtras
{
  id v4 = a3;
  if ([v4 length])
  {
    int v5 = objc_msgSend(a1, "_safari_deleteAllPasswordCredentialsForGroupID:", v4);
    int v6 = objc_msgSend(a1, "_safari_deleteAllRecentlyDeletedPasswordCredentialsForGroupID:", v4);
    int v7 = objc_msgSend(a1, "_safari_deleteAllPasskeyCredentialsForGroupID:", v4);
    int v8 = objc_msgSend(a1, "_safari_deleteAllRecentlyDeletedPasskeyCredentialsForGroupID:", v4);
    int v9 = objc_msgSend(a1, "_safari_deleteAllSharedSidecarsForGroupID:", v4);
    int v10 = objc_msgSend(a1, "_safari_deleteAllRecentlyDeletedSharedSidecarsForGroupID:", v4);
    int v11 = objc_msgSend(a1, "_safari_deleteAllPersonalSidecarsForGroupID:", v4);
    uint64_t v12 = objc_msgSend(a1, "_safari_deleteAllRecentlyDeletedPersonalSidecarsForGroupID:", v4) & v11 & v10 & v9 & v8 & v7 & v6 & v5;
  }
  else
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteAllItemsForGroupID:]();
    }
    uint64_t v12 = 1;
  }

  return v12;
}

- (uint64_t)_safari_deleteAllPasswordCredentialsForGroupID:()SafariCoreExtras
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B998];
  uint64_t v5 = *MEMORY[0x1E4F3B550];
  v18[0] = *MEMORY[0x1E4F3B978];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups) {
    int v6 = @"com.apple.cfnetwork.testing";
  }
  else {
    int v6 = @"com.apple.cfnetwork";
  }
  v19[0] = v4;
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B858];
  v18[2] = *MEMORY[0x1E4F3B878];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E4F1CC28];
  v19[3] = a3;
  int v8 = (void *)MEMORY[0x1E4F1C9E8];
  int v9 = v6;
  id v10 = a3;
  CFDictionaryRef v11 = [v8 dictionaryWithObjects:v19 forKeys:v18 count:4];

  OSStatus v12 = SecItemDelete(v11);
  OSStatus v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllPasswordCredentialsForGroupID:]();
      }
    }
  }
  if (v13) {
    BOOL v15 = v13 == -25300;
  }
  else {
    BOOL v15 = 1;
  }
  uint64_t v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllRecentlyDeletedPasswordCredentialsForGroupID:()SafariCoreExtras
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B998];
  uint64_t v5 = *MEMORY[0x1E4F3B550];
  v18[0] = *MEMORY[0x1E4F3B978];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups) {
    int v6 = @"com.apple.cfnetwork-recently-deleted.testing";
  }
  else {
    int v6 = @"com.apple.cfnetwork-recently-deleted";
  }
  v19[0] = v4;
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B858];
  v18[2] = *MEMORY[0x1E4F3B878];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E4F1CC28];
  v19[3] = a3;
  int v8 = (void *)MEMORY[0x1E4F1C9E8];
  int v9 = v6;
  id v10 = a3;
  CFDictionaryRef v11 = [v8 dictionaryWithObjects:v19 forKeys:v18 count:4];

  OSStatus v12 = SecItemDelete(v11);
  OSStatus v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllRecentlyDeletedPasswordCredentialsForGroupID:]();
      }
    }
  }
  if (v13) {
    BOOL v15 = v13 == -25300;
  }
  else {
    BOOL v15 = 1;
  }
  uint64_t v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllPasskeyCredentialsForGroupID:()SafariCoreExtras
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B9A0];
  uint64_t v5 = *MEMORY[0x1E4F3B550];
  v18[0] = *MEMORY[0x1E4F3B978];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups) {
    int v6 = @"com.apple.webkit.webauthn.testing";
  }
  else {
    int v6 = @"com.apple.webkit.webauthn";
  }
  v19[0] = v4;
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B858];
  v18[2] = *MEMORY[0x1E4F3B878];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E4F1CC28];
  v19[3] = a3;
  int v8 = (void *)MEMORY[0x1E4F1C9E8];
  int v9 = v6;
  id v10 = a3;
  CFDictionaryRef v11 = [v8 dictionaryWithObjects:v19 forKeys:v18 count:4];

  OSStatus v12 = SecItemDelete(v11);
  OSStatus v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllPasskeyCredentialsForGroupID:]();
      }
    }
  }
  if (v13) {
    BOOL v15 = v13 == -25300;
  }
  else {
    BOOL v15 = 1;
  }
  uint64_t v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllRecentlyDeletedPasskeyCredentialsForGroupID:()SafariCoreExtras
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B9A0];
  uint64_t v5 = *MEMORY[0x1E4F3B550];
  v18[0] = *MEMORY[0x1E4F3B978];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups) {
    int v6 = @"com.apple.webkit.webauthn-recently-deleted.testing";
  }
  else {
    int v6 = @"com.apple.webkit.webauthn-recently-deleted";
  }
  v19[0] = v4;
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B858];
  v18[2] = *MEMORY[0x1E4F3B878];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E4F1CC28];
  v19[3] = a3;
  int v8 = (void *)MEMORY[0x1E4F1C9E8];
  int v9 = v6;
  id v10 = a3;
  CFDictionaryRef v11 = [v8 dictionaryWithObjects:v19 forKeys:v18 count:4];

  OSStatus v12 = SecItemDelete(v11);
  OSStatus v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllRecentlyDeletedPasskeyCredentialsForGroupID:]();
      }
    }
  }
  if (v13) {
    BOOL v15 = v13 == -25300;
  }
  else {
    BOOL v15 = 1;
  }
  uint64_t v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllSharedSidecarsForGroupID:()SafariCoreExtras
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B998];
  uint64_t v5 = *MEMORY[0x1E4F3B550];
  v18[0] = *MEMORY[0x1E4F3B978];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups) {
    int v6 = @"com.apple.password-manager.testing";
  }
  else {
    int v6 = @"com.apple.password-manager";
  }
  v19[0] = v4;
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B858];
  v18[2] = *MEMORY[0x1E4F3B878];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E4F1CC28];
  v19[3] = a3;
  int v8 = (void *)MEMORY[0x1E4F1C9E8];
  int v9 = v6;
  id v10 = a3;
  CFDictionaryRef v11 = [v8 dictionaryWithObjects:v19 forKeys:v18 count:4];

  OSStatus v12 = SecItemDelete(v11);
  OSStatus v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllSharedSidecarsForGroupID:]();
      }
    }
  }
  if (v13) {
    BOOL v15 = v13 == -25300;
  }
  else {
    BOOL v15 = 1;
  }
  uint64_t v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllRecentlyDeletedSharedSidecarsForGroupID:()SafariCoreExtras
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B998];
  uint64_t v5 = *MEMORY[0x1E4F3B550];
  v18[0] = *MEMORY[0x1E4F3B978];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups) {
    int v6 = @"com.apple.password-manager-recently-deleted.testing";
  }
  else {
    int v6 = @"com.apple.password-manager-recently-deleted";
  }
  v19[0] = v4;
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B858];
  v18[2] = *MEMORY[0x1E4F3B878];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E4F1CC28];
  v19[3] = a3;
  int v8 = (void *)MEMORY[0x1E4F1C9E8];
  int v9 = v6;
  id v10 = a3;
  CFDictionaryRef v11 = [v8 dictionaryWithObjects:v19 forKeys:v18 count:4];

  OSStatus v12 = SecItemDelete(v11);
  OSStatus v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllRecentlyDeletedSharedSidecarsForGroupID:]();
      }
    }
  }
  if (v13) {
    BOOL v15 = v13 == -25300;
  }
  else {
    BOOL v15 = 1;
  }
  uint64_t v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllPersonalSidecarsForGroupID:()SafariCoreExtras
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B998];
  uint64_t v5 = *MEMORY[0x1E4F3B550];
  v18[0] = *MEMORY[0x1E4F3B978];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups) {
    int v6 = @"com.apple.password-manager.personal.testing";
  }
  else {
    int v6 = @"com.apple.password-manager.personal";
  }
  v19[0] = v4;
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B7B8];
  v18[2] = *MEMORY[0x1E4F3B878];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E4F1CC38];
  v19[3] = a3;
  int v8 = (void *)MEMORY[0x1E4F1C9E8];
  int v9 = v6;
  id v10 = a3;
  CFDictionaryRef v11 = [v8 dictionaryWithObjects:v19 forKeys:v18 count:4];

  OSStatus v12 = SecItemDelete(v11);
  OSStatus v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllPersonalSidecarsForGroupID:]();
      }
    }
  }
  if (v13) {
    BOOL v15 = v13 == -25300;
  }
  else {
    BOOL v15 = 1;
  }
  uint64_t v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllRecentlyDeletedPersonalSidecarsForGroupID:()SafariCoreExtras
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B998];
  uint64_t v5 = *MEMORY[0x1E4F3B550];
  v18[0] = *MEMORY[0x1E4F3B978];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups) {
    int v6 = @"com.apple.password-manager.personal-recently-deleted.testing";
  }
  else {
    int v6 = @"com.apple.password-manager.personal-recently-deleted";
  }
  v19[0] = v4;
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B7B8];
  v18[2] = *MEMORY[0x1E4F3B878];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E4F1CC38];
  v19[3] = a3;
  int v8 = (void *)MEMORY[0x1E4F1C9E8];
  int v9 = v6;
  id v10 = a3;
  CFDictionaryRef v11 = [v8 dictionaryWithObjects:v19 forKeys:v18 count:4];

  OSStatus v12 = SecItemDelete(v11);
  OSStatus v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllRecentlyDeletedPersonalSidecarsForGroupID:]();
      }
    }
  }
  if (v13) {
    BOOL v15 = v13 == -25300;
  }
  else {
    BOOL v15 = 1;
  }
  uint64_t v16 = v15;

  return v16;
}

- (uint64_t)_safari_allRecentlyDeletedPersonalSidecarItemsInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 0, &stru_1F105D3F0, 1);
}

- (uint64_t)_safari_allRecentlyDeletedPersonalSidecarItemsInGroupWithID:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 0, a3, 1);
}

- (uint64_t)_safari_allRecentlyDeletedSharedSidecarItemsInGroupWithID:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 1, a3, 1);
}

+ (id)safari_customTitleForPasskeyWithUserHandle:()SafariCoreExtras relyingPartyID:groupID:
{
  v1 = objc_msgSend(a1, "_safari_personalSidecarDictionaryForPasskeyWithUserHandle:relyingPartyID:groupID:");
  uint64_t v2 = [v1 objectForKeyedSubscript:@"title"];
  if (v2) {
    id v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

+ (void)safari_setLastUsedDate:()SafariCoreExtras forPasskeyWithUserHandle:relyingPartyID:groupID:context:
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  objc_msgSend(a1, "_safari_personalSidecarDictionaryForPasskeyWithUserHandle:relyingPartyID:groupID:", v15, v14, v13);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v14);

  uint64_t v18 = [[WBSSavedAccountSidecar alloc] initWithUser:v15 protectionSpace:v17 dictionaryRepresentation:v21];
  [(WBSSavedAccountSidecar *)v18 setLastUsedDate:v16 forContext:v12];

  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F18D88], "safari_credentialWithUser:password:persistence:", v15, &stru_1F105D3F0, 3);

  OSStatus v20 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  objc_msgSend(v20, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v18, v19, v17, v13, 0);
}

- (id)_safari_dataFromGeneratedPasswordDictionary:()SafariCoreExtras domain:
{
  id v5 = a4;
  id v11 = 0;
  int v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v11];
  id v7 = v11;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    int v9 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_dataFromGeneratedPasswordDictionary:domain:]((uint64_t)v5, v9, v7);
    }
  }

  return v6;
}

- (id)_safari_accountStringForGeneratedPassword
{
  v0 = [MEMORY[0x1E4F1C9C8] now];
  v1 = NSString;
  [v0 timeIntervalSinceReferenceDate];
  id v3 = objc_msgSend(v1, "stringWithFormat:", @"%f", v2);

  return v3;
}

- (id)safari_allGeneratedPasswordItems
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F3B998];
  uint64_t v1 = *MEMORY[0x1E4F3BB80];
  CFTypeRef v26 = (CFTypeRef)*MEMORY[0x1E4F3B978];
  uint64_t v27 = v1;
  uint64_t v2 = *MEMORY[0x1E4F3BB88];
  *(void *)buf = v0;
  *(void *)&buf[8] = v2;
  uint64_t v3 = *MEMORY[0x1E4F3B550];
  if (shouldUseTestingAccessGroups) {
    uint64_t v4 = @"com.apple.password-manager.generated-passwords.testing";
  }
  else {
    uint64_t v4 = @"com.apple.password-manager.generated-passwords";
  }
  uint64_t v5 = *MEMORY[0x1E4F3B878];
  uint64_t v28 = *MEMORY[0x1E4F3B550];
  uint64_t v29 = v5;
  uint64_t v6 = *MEMORY[0x1E4F3B880];
  *(void *)&buf[16] = v4;
  uint64_t v35 = v6;
  uint64_t v7 = *MEMORY[0x1E4F3BC70];
  uint64_t v30 = *MEMORY[0x1E4F3BC68];
  uint64_t v31 = v7;
  uint64_t v36 = MEMORY[0x1E4F1CC38];
  uint64_t v37 = MEMORY[0x1E4F1CC38];
  uint64_t v8 = *MEMORY[0x1E4F3BD08];
  uint64_t v32 = *MEMORY[0x1E4F3BC78];
  uint64_t v33 = v8;
  uint64_t v38 = MEMORY[0x1E4F1CC38];
  uint64_t v39 = MEMORY[0x1E4F1CC38];
  int v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = v4;
  id v11 = [v9 dictionaryWithObjects:buf forKeys:&v26 count:8];

  CFDictionaryRef v12 = (const __CFDictionary *)objc_msgSend(v11, "mutableCopy", v26, v27, v28, v29, v30, v31, v32, v33, *(void *)buf, *(void *)&buf[8], *(void *)&buf[16], v35, v36, v37, v38, v39);
  CFTypeRef v26 = 0;
  OSStatus v13 = SecItemCopyMatching(v12, &v26);
  if (v13)
  {
    OSStatus v14 = v13;
    if (v13 == -25300)
    {
      id v15 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:
        uint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_13;
      }
      id v16 = v15;
      uint64_t v17 = [(__CFDictionary *)v12 objectForKeyedSubscript:v3];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_1B728F000, v16, OS_LOG_TYPE_DEFAULT, "No recently generated password items found in access group %{public}@", buf, 0xCu);
    }
    else
    {
      id v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      uint64_t v25 = v23;
      uint64_t v17 = [(__CFDictionary *)v12 objectForKeyedSubscript:v3];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v14;
      _os_log_error_impl(&dword_1B728F000, v25, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed to fetch recently generated password items in access group %{public}@, result %i", buf, 0x12u);
    }
    goto LABEL_12;
  }
  uint64_t v18 = (void *)v26;
  uint64_t v19 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    OSStatus v20 = v19;
    uint64_t v21 = [v18 count];
    BOOL v22 = [(__CFDictionary *)v12 objectForKeyedSubscript:v3];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v22;
    _os_log_impl(&dword_1B728F000, v20, OS_LOG_TYPE_DEFAULT, "Fetched %li recently generated password items from access group %{public}@", buf, 0x16u);
  }
LABEL_13:

  return v18;
}

- (WBSGeneratedPassword)safari_addGeneratedPassword:()SafariCoreExtras forProtectionSpace:wasGeneratedInPrivateBrowsingSession:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    CFDictionaryRef v12 = [v8 host];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v12;
    _os_log_impl(&dword_1B728F000, v11, OS_LOG_TYPE_DEFAULT, "Adding generated password for %@", buf, 0xCu);
  }
  OSStatus v13 = +[WBSGeneratedPassword keychainDictionaryRepresentationWithPassword:v9];

  OSStatus v14 = [v8 host];
  id v15 = objc_msgSend(a1, "_safari_dataFromGeneratedPasswordDictionary:domain:", v13, v14);

  if (v15)
  {
    int v53 = a5;
    objc_msgSend(a1, "_safari_accountStringForGeneratedPassword");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v54 = v15;
    id v17 = v15;
    id v55 = v8;
    id v18 = v8;
    uint64_t v19 = *MEMORY[0x1E4F3B998];
    OSStatus v20 = (const void *)*MEMORY[0x1E4F3B5E8];
    result[0] = *(CFTypeRef *)MEMORY[0x1E4F3B978];
    result[1] = v20;
    uint64_t v21 = *MEMORY[0x1E4F3B5F8];
    *(void *)buf = v19;
    *(void *)&buf[8] = v21;
    result[2] = *(CFTypeRef *)MEMORY[0x1E4F3B788];
    BOOL v22 = NSString;
    id v23 = _WBSLocalizedString(@"Generated Password for %@", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    uint64_t v24 = [v18 host];
    uint64_t v25 = objc_msgSend(v22, "localizedStringWithFormat:", v23, v24);
    *(void *)&buf[16] = v25;
    CFTypeRef result[3] = *(CFTypeRef *)MEMORY[0x1E4F3B678];
    uint64_t v26 = _WBSLocalizedString(@"Generated Password", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    uint64_t v27 = (void *)v26;
    uint64_t v28 = (const void *)*MEMORY[0x1E4F3B550];
    if (shouldUseTestingAccessGroups) {
      uint64_t v29 = @"com.apple.password-manager.generated-passwords.testing";
    }
    else {
      uint64_t v29 = @"com.apple.password-manager.generated-passwords";
    }
    uint64_t v66 = v26;
    v67 = v29;
    uint64_t v30 = (const void *)*MEMORY[0x1E4F3B878];
    uint64_t v52 = v28;
    result[4] = v28;
    result[5] = v30;
    uint64_t v31 = (const void *)*MEMORY[0x1E4F3B5C0];
    uint64_t v68 = MEMORY[0x1E4F1CC38];
    id v69 = v16;
    uint64_t v32 = (const void *)*MEMORY[0x1E4F3BD38];
    CFTypeRef result[6] = v31;
    result[7] = v32;
    id v70 = v17;
    uint64_t v33 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v34 = v29;
    uint64_t v35 = [v33 dictionaryWithObjects:buf forKeys:result count:8];

    uint64_t v36 = (void *)[v35 mutableCopy];
    uint64_t v37 = (void *)MEMORY[0x1E4F3B870];
    if (shouldUseTestingAccessGroups) {
      [v36 setObject:@"Passwords" forKey:*MEMORY[0x1E4F3B870]];
    }
    if (v53)
    {
      uint64_t v58 = *MEMORY[0x1E4F3B848];
      uint64_t v38 = +[WBSGeneratedPassword privateBrowsingSentinel];
      uint64_t v59 = *MEMORY[0x1E4F3B7C0];
      uint64_t v61 = (uint64_t)v38;
      v62 = &unk_1F1086308;
      uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v58 count:2];
      [v36 addEntriesFromDictionary:v39];
    }
    else
    {
      uint64_t v58 = *MEMORY[0x1E4F3B7C8];
      uint64_t v61 = objc_msgSend(v18, "safari_protocolAsSecAttrProtocolValue");
      uint64_t v59 = *MEMORY[0x1E4F3B848];
      uint64_t v38 = [v18 host];
      v62 = v38;
      uint64_t v60 = *MEMORY[0x1E4F3B7C0];
      uint64_t v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "port"));
      v63 = v39;
      uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v58 count:3];
      [v36 addEntriesFromDictionary:v41];
    }
    uint64_t v42 = *MEMORY[0x1E4F3BC68];
    v56[0] = *MEMORY[0x1E4F3BC78];
    v56[1] = v42;
    v57[0] = MEMORY[0x1E4F1CC38];
    v57[1] = MEMORY[0x1E4F1CC38];
    uint64_t v43 = *MEMORY[0x1E4F3BD08];
    v56[2] = *MEMORY[0x1E4F3BC70];
    v56[3] = v43;
    v57[2] = MEMORY[0x1E4F1CC38];
    v57[3] = MEMORY[0x1E4F1CC38];
    uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4];
    [v36 addEntriesFromDictionary:v44];

    if (shouldUseTestingAccessGroups) {
      [v36 setObject:@"Passwords" forKey:*v37];
    }
    result[0] = 0;
    OSStatus v45 = SecItemAdd((CFDictionaryRef)v36, result);
    id v15 = v54;
    if (v45)
    {
      OSStatus v46 = v45;
      OSStatus v47 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        OSStatus v50 = v47;
        __int16 v51 = [v36 objectForKeyedSubscript:v52];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v51;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v46;
        _os_log_error_impl(&dword_1B728F000, v50, OS_LOG_TYPE_ERROR, "SecItemAdd failed to add generated password item in access group %{public}@: status=%ld", buf, 0x16u);
      }
      uint64_t v40 = 0;
    }
    else
    {
      v48 = (void *)result[0];
      uint64_t v40 = [[WBSGeneratedPassword alloc] initWithKeychainItemDictionary:result[0]];
    }
    id v8 = v55;
  }
  else
  {
    uint64_t v40 = 0;
  }

  return v40;
}

- (WBSGeneratedPassword)safari_updateGeneratedPassword:()SafariCoreExtras withPassword:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v6 protectionSpace];
    id v11 = [v10 host];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_DEFAULT, "Updating generated password for %@", buf, 0xCu);
  }
  CFDictionaryRef v12 = [v6 keychainPersistentReference];
  if (v12)
  {
    OSStatus v13 = [v6 keychainDictionaryRepresentationWithPassword:v7];
    OSStatus v14 = [v6 protectionSpace];
    id v15 = [v14 host];
    id v16 = objc_msgSend(a1, "_safari_dataFromGeneratedPasswordDictionary:domain:", v13, v15);

    if (!v16)
    {
      id v23 = 0;
LABEL_17:

      goto LABEL_18;
    }
    id v17 = objc_msgSend(a1, "_safari_accountStringForGeneratedPassword");
    uint64_t v18 = *MEMORY[0x1E4F3BD40];
    uint64_t v33 = *MEMORY[0x1E4F3BD40];
    uint64_t v34 = v12;
    CFDictionaryRef v19 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v20 = *MEMORY[0x1E4F3BD38];
    v31[0] = *MEMORY[0x1E4F3B5C0];
    v31[1] = v20;
    v32[0] = v17;
    v32[1] = v16;
    if (SecItemUpdate(v19, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2]))
    {
      uint64_t v21 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) safari_updateGeneratedPassword:withPassword:]();
      }
    }
    else
    {
      *(void *)buf = 0;
      uint64_t v24 = *MEMORY[0x1E4F3BC68];
      v29[0] = v18;
      v29[1] = v24;
      v30[0] = v12;
      v30[1] = MEMORY[0x1E4F1CC38];
      uint64_t v25 = *MEMORY[0x1E4F3BC78];
      void v29[2] = *MEMORY[0x1E4F3BC70];
      v29[3] = v25;
      v30[2] = MEMORY[0x1E4F1CC38];
      v30[3] = MEMORY[0x1E4F1CC38];
      v29[4] = *MEMORY[0x1E4F3BB80];
      v30[4] = *MEMORY[0x1E4F3BB90];
      if (!SecItemCopyMatching((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:5], (CFTypeRef *)buf))
      {
        uint64_t v28 = *(void **)buf;
        id v23 = [[WBSGeneratedPassword alloc] initWithKeychainItemDictionary:*(void *)buf];

        goto LABEL_16;
      }
      uint64_t v26 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) safari_updateGeneratedPassword:withPassword:]();
      }
    }
    id v23 = 0;
LABEL_16:

    goto LABEL_17;
  }
  BOOL v22 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[NSURLCredentialStorage(SafariCoreExtras) safari_updateGeneratedPassword:withPassword:]();
  }
  id v23 = 0;
LABEL_18:

  return v23;
}

- (void)safari_deleteGeneratedPassword:()SafariCoreExtras
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 protectionSpace];
  uint64_t v5 = [v3 generationDate];
  id v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v4 host];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_DEFAULT, "Removing generated password item for %@", buf, 0xCu);
  }
  id v9 = NSString;
  [v5 timeIntervalSinceReferenceDate];
  id v11 = objc_msgSend(v9, "stringWithFormat:", @"%f", v10);
  id v12 = v4;
  uint64_t v13 = *MEMORY[0x1E4F3B998];
  uint64_t v14 = *MEMORY[0x1E4F3B5E8];
  v52[0] = *MEMORY[0x1E4F3B978];
  v52[1] = v14;
  uint64_t v15 = *MEMORY[0x1E4F3B5F8];
  *(void *)buf = v13;
  *(void *)&buf[8] = v15;
  uint64_t v16 = *MEMORY[0x1E4F3B550];
  v52[2] = *MEMORY[0x1E4F3B5C0];
  v52[3] = v16;
  if (shouldUseTestingAccessGroups) {
    id v17 = @"com.apple.password-manager.generated-passwords.testing";
  }
  else {
    id v17 = @"com.apple.password-manager.generated-passwords";
  }
  *(void *)&buf[16] = v11;
  v54 = v17;
  uint64_t v18 = *MEMORY[0x1E4F3B880];
  uint64_t v19 = *MEMORY[0x1E4F3BB80];
  v52[4] = *MEMORY[0x1E4F3B878];
  v52[5] = v19;
  uint64_t v20 = *MEMORY[0x1E4F3BB90];
  uint64_t v55 = v18;
  uint64_t v56 = v20;
  uint64_t v21 = *MEMORY[0x1E4F3BC70];
  v52[6] = *MEMORY[0x1E4F3BC68];
  v52[7] = v21;
  uint64_t v57 = MEMORY[0x1E4F1CC38];
  uint64_t v58 = MEMORY[0x1E4F1CC38];
  uint64_t v22 = *MEMORY[0x1E4F3BD08];
  v52[8] = *MEMORY[0x1E4F3BC78];
  v52[9] = v22;
  uint64_t v59 = MEMORY[0x1E4F1CC38];
  uint64_t v60 = MEMORY[0x1E4F1CC38];
  id v23 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v24 = v17;
  uint64_t v25 = [v23 dictionaryWithObjects:buf forKeys:v52 count:10];

  uint64_t v26 = (void *)[v25 mutableCopy];
  if (v12)
  {
    uint64_t v46 = *MEMORY[0x1E4F3B7C8];
    uint64_t v49 = objc_msgSend(v12, "safari_protocolAsSecAttrProtocolValue");
    uint64_t v47 = *MEMORY[0x1E4F3B848];
    uint64_t v27 = [v12 host];
    OSStatus v50 = v27;
    uint64_t v48 = *MEMORY[0x1E4F3B7C0];
    uint64_t v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "port"));
    __int16 v51 = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v46 count:3];
    [v26 addEntriesFromDictionary:v29];
  }
  else
  {
    uint64_t v46 = *MEMORY[0x1E4F3B848];
    uint64_t v27 = +[WBSGeneratedPassword privateBrowsingSentinel];
    uint64_t v47 = *MEMORY[0x1E4F3B7C0];
    uint64_t v49 = (uint64_t)v27;
    OSStatus v50 = &unk_1F1086308;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v46 count:2];
    [v26 addEntriesFromDictionary:v28];
  }

  uint64_t v30 = [v3 keychainPersistentReference];
  if (v30) {
    goto LABEL_10;
  }
  uint64_t v36 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = v36;
    uint64_t v38 = [v12 host];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v38;
    _os_log_impl(&dword_1B728F000, v37, OS_LOG_TYPE_DEFAULT, "Removing generated password item for %@", buf, 0xCu);
  }
  *(void *)buf = 0;
  OSStatus v39 = SecItemCopyMatching((CFDictionaryRef)v26, (CFTypeRef *)buf);
  if (!v39)
  {
    uint64_t v42 = *(void **)buf;
    uint64_t v30 = [*(id *)buf objectForKeyedSubscript:*MEMORY[0x1E4F3BD40]];

LABEL_10:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v44 = *MEMORY[0x1E4F3BD40];
      OSStatus v45 = v30;
      OSStatus v31 = SecItemDelete((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1]);
      if (v31)
      {
        OSStatus v32 = v31;
        uint64_t v33 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = v33;
          uint64_t v35 = [v12 host];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v5;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v35;
          *(_WORD *)&buf[22] = 2048;
          v54 = (__CFString *)v32;
          _os_log_error_impl(&dword_1B728F000, v34, OS_LOG_TYPE_ERROR, "Failed to delete recently generated password item for date %@ and host %@: status=%ld", buf, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v41 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteGeneratedPassword:]();
      }
    }
    goto LABEL_26;
  }
  if (v39 == -25300)
  {
    uint64_t v40 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      [(NSURLCredentialStorage(SafariCoreExtras) *)(uint64_t)v5 safari_deleteGeneratedPassword:v12];
    }
  }
  else
  {
    uint64_t v43 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      [(NSURLCredentialStorage(SafariCoreExtras) *)(uint64_t)v5 safari_deleteGeneratedPassword:v12];
    }
  }
  uint64_t v30 = 0;
LABEL_26:
}

- (void)safari_deleteAllGeneratedPasswords
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Error deleting all generated password items in Keychain, status=%ld", v2, v3, v4, v5, v6);
}

+ (void)safari_test_setUseTestingAccessGroups:()SafariCoreExtras
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  shouldUseTestingAccessGroups = a3;
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (shouldUseTestingAccessGroups) {
      uint64_t v4 = @"com.apple.cfnetwork.testing";
    }
    else {
      uint64_t v4 = @"com.apple.cfnetwork";
    }
    uint64_t v5 = v4;
    if (shouldUseTestingAccessGroups) {
      uint8_t v6 = @"com.apple.webkit.webauthn.testing";
    }
    else {
      uint8_t v6 = @"com.apple.webkit.webauthn";
    }
    id v7 = v6;
    if (shouldUseTestingAccessGroups) {
      id v8 = @"com.apple.password-manager.testing";
    }
    else {
      id v8 = @"com.apple.password-manager";
    }
    id v9 = v8;
    if (shouldUseTestingAccessGroups) {
      uint64_t v10 = @"com.apple.password-manager.personal.testing";
    }
    else {
      uint64_t v10 = @"com.apple.password-manager.personal";
    }
    id v11 = v10;
    if (shouldUseTestingAccessGroups) {
      id v12 = @"com.apple.password-manager.generated-passwords.testing";
    }
    else {
      id v12 = @"com.apple.password-manager.generated-passwords";
    }
    uint64_t v13 = v12;
    int v23 = 138413314;
    uint64_t v24 = v5;
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v9;
    __int16 v29 = 2112;
    uint64_t v30 = v11;
    __int16 v31 = 2112;
    OSStatus v32 = v13;
    _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_DEFAULT, "Password Manager Keychain Access Groups:\n\t         Passwords: %@\n\t          Passkeys: %@\n\t          Sidecars: %@\t Personal Sidecars: %@\n\tRecently Generated: %@\n", (uint8_t *)&v23, 0x34u);
  }
  uint64_t v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (shouldUseTestingAccessGroups) {
      uint64_t v15 = @"com.apple.cfnetwork-recently-deleted.testing";
    }
    else {
      uint64_t v15 = @"com.apple.cfnetwork-recently-deleted";
    }
    uint64_t v16 = v15;
    if (shouldUseTestingAccessGroups) {
      id v17 = @"com.apple.webkit.webauthn-recently-deleted.testing";
    }
    else {
      id v17 = @"com.apple.webkit.webauthn-recently-deleted";
    }
    uint64_t v18 = v17;
    if (shouldUseTestingAccessGroups) {
      uint64_t v19 = @"com.apple.password-manager-recently-deleted.testing";
    }
    else {
      uint64_t v19 = @"com.apple.password-manager-recently-deleted";
    }
    uint64_t v20 = v19;
    if (shouldUseTestingAccessGroups) {
      uint64_t v21 = @"com.apple.password-manager.personal-recently-deleted.testing";
    }
    else {
      uint64_t v21 = @"com.apple.password-manager.personal-recently-deleted";
    }
    uint64_t v22 = v21;
    int v23 = 138413058;
    uint64_t v24 = v16;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    __int16 v27 = 2112;
    uint64_t v28 = v20;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    _os_log_impl(&dword_1B728F000, v14, OS_LOG_TYPE_DEFAULT, "Password Manager Recently Deleted Keychain Access Groups:\n\t        Passwords: %@\n\t         Passkeys: %@\n\t         Sidecars: %@\tPersonal Sidecars: %@\n", (uint8_t *)&v23, 0x2Au);
  }
}

- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[WBSOngoingSharingGroupProvider sharedProvider];
  char v8 = [v7 canCurrentUserEditSavedAccountsInGroupWithID:v6];

  if (v8)
  {
    id v9 = queryForPasskeyFromSavedAccount(v5);
    uint64_t v10 = [v6 length];
    if (v10) {
      uint64_t v11 = MEMORY[0x1E4F1CC28];
    }
    else {
      uint64_t v11 = MEMORY[0x1E4F1CC38];
    }
    if (v10) {
      id v12 = v6;
    }
    else {
      id v12 = 0;
    }
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3B878]];
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F3B858]];
    BOOL v13 = +[WBSFeatureAvailability isCredentialExchangeEnabled];
    CFTypeRef v27 = 0;
    OSStatus v14 = SecItemCopyMatching((CFDictionaryRef)v9, &v27);
    OSStatus v15 = v14;
    if (v13 && v14 == -25300)
    {
      [v9 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3B5C8]];
      uint64_t v16 = credentialIDData(v5);
      [v9 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F3B5D0]];

      OSStatus v15 = SecItemCopyMatching((CFDictionaryRef)v9, &v27);
    }
    if (v15 != -25300)
    {
      if (v15)
      {
        __int16 v25 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasskeyFromSavedAccount:groupID:]();
        }
      }
      else
      {
        id v17 = (void *)v27;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v18 = *MEMORY[0x1E4F3BD40];
          uint64_t v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F3BD40]];
          uint64_t v20 = (void *)v19;
          if (v19)
          {
            uint64_t v28 = v18;
            v29[0] = v19;
            uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
            CFDictionaryRef v22 = (const __CFDictionary *)[v21 mutableCopy];

            if (SecItemDelete(v22))
            {
              int v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasskeyFromSavedAccount:groupID:]();
              }
            }
          }
          else
          {
            uint64_t v26 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasskeyFromSavedAccount:groupID:]();
            }
          }
        }
      }
    }
  }
  else if (!shouldUseTestingAccessGroups)
  {
    uint64_t v24 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasskeyFromSavedAccount:groupID:].cold.4();
    }
  }
}

+ (void)safari_test_purgeKeychainItemsFromTestingAccessGroups
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Refusing to dump data from testing access groups while not in testing mode!", v2, v3, v4, v5, v6);
}

+ (id)safari_test_addTestingPasskeyItemWithCredentialID:()SafariCoreExtras groupID:toRecentlyDeleted:
{
  v39[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (shouldUseTestingAccessGroups)
  {
    uint64_t v33 = v8;
    BOOL v10 = +[WBSFeatureAvailability isCredentialExchangeEnabled];
    uint64_t v11 = *MEMORY[0x1E4F3B978];
    uint64_t v12 = *MEMORY[0x1E4F3B9A0];
    v39[0] = *MEMORY[0x1E4F3B9A0];
    uint64_t v13 = *MEMORY[0x1E4F3B550];
    v38[0] = v11;
    v38[1] = v13;
    OSStatus v14 = @"com.apple.webkit.webauthn.testing";
    OSStatus v15 = @"com.apple.webkit.webauthn-recently-deleted.testing";
    if (!shouldUseTestingAccessGroups)
    {
      OSStatus v14 = @"com.apple.webkit.webauthn";
      OSStatus v15 = @"com.apple.webkit.webauthn-recently-deleted";
    }
    if (a5) {
      OSStatus v14 = v15;
    }
    uint64_t v16 = v14;
    uint64_t v17 = *MEMORY[0x1E4F3BD08];
    uint64_t v18 = MEMORY[0x1E4F1CC38];
    v39[1] = v16;
    v39[2] = MEMORY[0x1E4F1CC38];
    uint64_t v19 = *MEMORY[0x1E4F3BC68];
    v38[2] = v17;
    v38[3] = v19;
    v38[4] = *MEMORY[0x1E4F3B878];
    v39[3] = MEMORY[0x1E4F1CC38];
    v39[4] = MEMORY[0x1E4F1CC38];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:5];
    uint64_t v21 = (void *)[v20 mutableCopy];

    CFDictionaryRef v22 = [v7 dataUsingEncoding:4];
    int v23 = (void *)MEMORY[0x1E4F3B5C8];
    if (!v10) {
      int v23 = (void *)MEMORY[0x1E4F3B5D0];
    }
    [v21 setObject:v22 forKeyedSubscript:*v23];

    if (shouldUseTestingAccessGroups) {
      [v21 setObject:@"Passwords" forKey:*MEMORY[0x1E4F3B870]];
    }
    CFTypeRef result = 0;
    OSStatus v24 = SecItemAdd((CFDictionaryRef)v21, &result);
    __int16 v25 = (void *)result;
    if (v24)
    {
      uint64_t v26 = 0;
      id v27 = (id)result;
      id v9 = v33;
    }
    else
    {
      if ([v33 length])
      {
        CFTypeRef cf = 0;
        v36[0] = v11;
        v36[1] = v19;
        v37[0] = v12;
        v37[1] = v18;
        void v36[2] = *MEMORY[0x1E4F3BB80];
        void v37[2] = *MEMORY[0x1E4F3BB90];
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
        __int16 v29 = objc_msgSend(v25, "safari_dictionaryByMergingWithDictionary:", v28);

        uint64_t v30 = (void *)SecItemShareWithGroup();
        id v9 = v33;
        if (SecItemDelete((CFDictionaryRef)v21))
        {
          __int16 v31 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            +[NSURLCredentialStorage(SafariCoreExtras) safari_test_addTestingPasskeyItemWithCredentialID:groupID:toRecentlyDeleted:]();
          }
        }
      }
      else
      {
        uint64_t v30 = v25;
        id v9 = v33;
      }
      id v27 = v30;
      uint64_t v26 = v27;
    }
  }
  else
  {
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)safari_mostRecentLastModifiedDateForCredentialsOnSavedAccount:()SafariCoreExtras
{
  id v4 = a3;
  if ([v4 credentialTypes])
  {
    objc_msgSend(a1, "_safari_lastModifiedDateForPasswordCredentialsOnSavedAccount:", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if (([v4 credentialTypes] & 2) != 0)
  {
    uint8_t v6 = objc_msgSend(a1, "_safari_lastModifiedDateForPasskeyCredentialOnSavedAccount:", v4);
    id v7 = v6;
    if (v5)
    {
      uint64_t v8 = [v5 laterDate:v6];

      id v5 = (id)v8;
    }
    else
    {
      id v5 = v6;
    }
  }
  return v5;
}

- (id)_safari_lastModifiedDateForPasswordCredentialsOnSavedAccount:()SafariCoreExtras
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend(a1, "_safari_getCredentialItemsFromKeychainForPasswordInSavedAccount:");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = *MEMORY[0x1E4F3B790];
    uint64_t v7 = *MEMORY[0x1E4F3B668];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v1);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        BOOL v10 = [v9 objectForKeyedSubscript:v6];
        uint64_t v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [v9 objectForKeyedSubscript:v7];
        }
        uint64_t v13 = v12;

        if (v4)
        {
          uint64_t v14 = [v4 laterDate:v13];

          id v4 = (id)v14;
        }
        else
        {
          id v4 = v13;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_safari_lastModifiedDateForPasskeyCredentialOnSavedAccount:()SafariCoreExtras
{
  uint64_t v1 = objc_msgSend(a1, "_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:");
  uint64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F3B790]];

  return v2;
}

+ (BOOL)safari_test_saveCredential:()SafariCoreExtras withArbitraryProtectionSpace:
{
  void v25[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 user];
  uint64_t v8 = queryForUserInProtectionSpace(v7, v5, 0, &stru_1F105D3F0, 0);

  v24[0] = *MEMORY[0x1E4F3B5E8];
  id v9 = [v5 authenticationMethod];
  if ([v9 isEqualToString:*MEMORY[0x1E4F18C88]])
  {
    BOOL v10 = (id *)MEMORY[0x1E4F3B5F8];
LABEL_11:
    id v11 = *v10;
    goto LABEL_12;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F18C80]])
  {
    BOOL v10 = (id *)MEMORY[0x1E4F3B5F0];
    goto LABEL_11;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F18C90]])
  {
    BOOL v10 = (id *)MEMORY[0x1E4F3B600];
    goto LABEL_11;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F18C98]])
  {
    BOOL v10 = (id *)MEMORY[0x1E4F3B608];
    goto LABEL_11;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F18CA0]])
  {
    BOOL v10 = (id *)MEMORY[0x1E4F3B610];
    goto LABEL_11;
  }
  CFDictionaryRef v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    +[NSURLCredentialStorage(SafariCoreExtras) safari_test_saveCredential:withArbitraryProtectionSpace:]();
  }
  id v11 = 0;
LABEL_12:

  v25[0] = v11;
  v24[1] = *MEMORY[0x1E4F3BD38];
  id v12 = [v6 password];
  uint64_t v13 = [v12 dataUsingEncoding:4];
  v25[1] = v13;
  void v24[2] = *MEMORY[0x1E4F3B788];
  uint64_t v14 = NSString;
  int v23 = v5;
  OSStatus v15 = [v5 host];
  long long v16 = [v6 user];

  long long v17 = [v14 stringWithFormat:@"%@ (%@)", v15, v16];
  void v25[2] = v17;
  void v24[3] = *MEMORY[0x1E4F3B678];
  long long v18 = _WBSLocalizedString(@"Web form password", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  void v25[3] = v18;
  long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  [v8 addEntriesFromDictionary:v19];

  if (shouldUseTestingAccessGroups) {
    [v8 setObject:@"Passwords" forKey:*MEMORY[0x1E4F3B870]];
  }
  BOOL v20 = SecItemAdd((CFDictionaryRef)v8, 0) == 0;

  return v20;
}

+ (id)_safari_personalSidecarDictionaryForPasskeyWithUserHandle:()SafariCoreExtras relyingPartyID:groupID:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x1E4F18D98];
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_msgSend(v8, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", a4);
  queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1835626085, v10, v11, v9, 0, 1);
  CFDictionaryRef v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CFTypeRef result = 0;
  OSStatus v13 = SecItemCopyMatching(v12, &result);
  if (v13)
  {
    if (v13 == -25300)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *MEMORY[0x1E4F3B550];
        long long v16 = v14;
        long long v17 = [(__CFDictionary *)v12 objectForKeyedSubscript:v15];
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v17;
        _os_log_impl(&dword_1B728F000, v16, OS_LOG_TYPE_DEFAULT, "Passkey sidecar fetching: no sidecar items found in access group %{public}@", buf, 0xCu);
      }
    }
    else
    {
      OSStatus v24 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[NSURLCredentialStorage(SafariCoreExtras) _safari_personalSidecarDictionaryForPasskeyWithUserHandle:relyingPartyID:groupID:](v24);
      }
    }
    int v23 = 0;
  }
  else
  {
    long long v18 = (void *)result;
    long long v19 = [a1 sharedCredentialStorage];
    BOOL v20 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
    uint64_t v21 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
    CFDictionaryRef v22 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
    int v23 = objc_msgSend(v19, "_safari_sidecarDictionaryFromData:user:domain:", v20, v21, v22);
  }
  return v23;
}

- (void)_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:()SafariCoreExtras .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = [(id)OUTLINED_FUNCTION_3() passkeyCredentialID];
  id v6 = [a2 passkeyRelyingPartyID];
  int v7 = 138412802;
  uint64_t v8 = v5;
  OUTLINED_FUNCTION_18();
  _os_log_error_impl(&dword_1B728F000, v2, OS_LOG_TYPE_ERROR, "Unable to query for passkey credential item for %@ (%@): %ld", (uint8_t *)&v7, 0x20u);
}

- (void)safari_setCredential:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:.cold.1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1B728F000, v0, v1, "SecItemAdd failed with error %d", v2, v3, v4, v5, v6);
}

- (void)safari_setCredential:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:.cold.2(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint8_t v6 = [a2 objectForKeyedSubscript:a3];
  int v7 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
  uint64_t v8 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  uint64_t v9 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F3B858]];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v10, v11, v12, v13, v14, 0x2Au);
}

- (void)safari_setCredential:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:.cold.3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1B728F000, v0, v1, "The user tried to update credential in a group they have read only permission in.", v2, v3, v4, v5, v6);
}

- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1B728F000, v0, v1, "SecItemCopyMatching failed while trying to delete password credential in group %{private}@: %ld");
}

- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Password credential in group %{private}@ did not contain valid persistent identifier.", v2, v3, v4, v5, v6);
}

- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete password credential from group %{private}@: %ld");
}

- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1B728F000, v0, v1, "The user tried to delete a credential in a group they have read only permission in.", v2, v3, v4, v5, v6);
}

- (void)safari_deleteCredentialWithEmptyServerHostForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete credential with empty host: %ld", v2, v3, v4, v5, v6);
}

- (void)safari_deleteCredentialWithEmptyServerHostForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1B728F000, v0, v1, "SecItemCopyMatching failed while trying to delete credential with empty host: %d", v2, v3, v4, v5, v6);
}

- (void)safari_deleteCredentialWithEmptyServerHostForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1B728F000, v0, v1, "The user tried to delete credential in a group they have read only permission in.", v2, v3, v4, v5, v6);
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.1(void *a1, void *a2)
{
  id v4 = a1;
  [(id)OUTLINED_FUNCTION_3() user];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_2() host];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_22(&dword_1B728F000, v6, v7, "Attempting to set a credential for '%{private}@' with no password as default for %{private}@", v8, v9, v10, v11, 3u);
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1B728F000, v0, v1, "SecItemCopyMatching failed with status %i.", v2, v3, v4, v5, v6);
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1B728F000, v0, v1, "SecItemUpdate failed to remove default status from credential with result %i.", v2, v3, v4, v5, v6);
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.4()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1B728F000, v0, v1, "SecItemUpdate failed to set default credential with status %i", v2, v3, v4, v5, v6);
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.5(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  [(id)OUTLINED_FUNCTION_3() user];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_2() host];
  int v6 = 138478083;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_13();
  _os_log_debug_impl(&dword_1B728F000, v2, OS_LOG_TYPE_DEBUG, "Making '%{private}@' credential default for protection space %{private}@.", (uint8_t *)&v6, 0x16u);
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.6(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_2() host];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0xCu);
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.7()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Keychain access groups not supported. Skipping setting default credential.", v2, v3, v4, v5, v6);
}

- (void)_safari_allCredentialItemsOfType:()SafariCoreExtras groupID:fromRecentlyDeleted:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_12(), "objectForKeyedSubscript:");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_14(&dword_1B728F000, v4, v5, "SecItemCopyMatching failed to fetch credential items in access group %{public}@, result %i", v6, v7, v8, v9, v10);
}

- (void)_safari_removeDefaultCommentFromKeychainItemsMatchingQuery:()SafariCoreExtras .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_20(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v2, v4, "Unable to remove default comment from keychain item: %@", v5);
}

- (void)_safari_getKeychainItemForSidecar:()SafariCoreExtras ofType:groupID:fromRecentlyDeleted:.cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 user];
  uint64_t v5 = [a2 protectionSpace];
  uint64_t v6 = [v5 host];
  int v7 = 138412802;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_18();
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Unable to query for sidecar item for %@ (%@): %ld", (uint8_t *)&v7, 0x20u);
}

- (void)_safari_allSidecarItemsOfType:()SafariCoreExtras groupID:fromRecentlyDeleted:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_12(), "objectForKeyedSubscript:");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_14(&dword_1B728F000, v4, v5, "SecItemCopyMatching failed to fetch sidecar items in access group %{public}@, result %i", v6, v7, v8, v9, v10);
}

- (void)_safari_sidecarDictionaryFromData:()SafariCoreExtras user:domain:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v1, v4, "Error deserializing sidecar data: %{public}@", v5);
}

- (void)_safari_sidecarDictionaryFromData:()SafariCoreExtras user:domain:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2113;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1B728F000, v1, OS_LOG_TYPE_FAULT, "Extracted non-Dictionary sidecar from Keychain for %{private}@ (%{private}@)", v2, 0x16u);
}

- (void)safari_setSidecar:()SafariCoreExtras credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1B728F000, v0, v1, "The user tried to update a sidecar in a group they have read only permission in.", v2, v3, v4, v5, v6);
}

- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to create new sidecar Keychain item. status=%ld", v2, v3, v4, v5, v6);
}

- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Unable to update existing sidecar Keychain item. status=%ld", v2, v3, v4, v5, v6);
}

- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:.cold.3(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F3B550];
  uint64_t v4 = a1;
  uint64_t v5 = [a2 objectForKeyedSubscript:v3];
  uint8_t v6 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
  uint64_t v7 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  OUTLINED_FUNCTION_16();
  uint8_t v10 = v6;
  __int16 v11 = 2113;
  uint64_t v12 = v8;
  _os_log_debug_impl(&dword_1B728F000, v4, OS_LOG_TYPE_DEBUG, "Query for sidecar SecItemUpdate: { accessGroup: %{public}@, service: %{public}@, account: %{private}@ }", v9, 0x20u);
}

- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:.cold.4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  uint64_t v7 = objc_msgSend((id)OUTLINED_FUNCTION_12(), "objectForKeyedSubscript:");
  uint64_t v8 = [a2 objectForKeyedSubscript:a3];
  int v9 = 138543619;
  uint8_t v10 = v7;
  OUTLINED_FUNCTION_13();
  _os_log_debug_impl(&dword_1B728F000, v3, OS_LOG_TYPE_DEBUG, "Attributes for sidecar SecItemAdd: { accessGroup: %{public}@, label: %{private}@ }", (uint8_t *)&v9, 0x16u);
}

- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemCopyMatching failed while trying to delete sidecar entry: %ld", v2, v3, v4, v5, v6);
}

- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Sidecar entry did not contain valid persistent identifier.", v2, v3, v4, v5, v6);
}

- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete sidecar entry: %ld", v2, v3, v4, v5, v6);
}

- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1B728F000, v0, v1, "The user tried to delete a sidecar in a group they have read only permission in.", v2, v3, v4, v5, v6);
}

- (void)safari_copySavedAccountWithPasswordToPersonalKeychain:()SafariCoreExtras withNewUsername:.cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v1, v2, "SecItemCopyMatching for password credential received unexpected class %@", v3);
}

- (void)safari_copySavedAccountWithPasswordToPersonalKeychain:()SafariCoreExtras withNewUsername:.cold.2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1B728F000, v0, v1, "SecItemCopyMatching failed while trying to move password credential to personal keychain with error %d", v2, v3, v4, v5, v6);
}

- (void)safari_copySavedAccountWithPassword:()SafariCoreExtras toGroupWithID:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Trying to copy a password to a shared group but did not specify a group ID", v2, v3, v4, v5, v6);
}

- (void)safari_copySavedAccountWithPassword:()SafariCoreExtras toGroupWithID:.cold.2(uint64_t a1, void *a2)
{
  uint64_t v3 = OUTLINED_FUNCTION_20(a1, a2);
  uint64_t v4 = objc_msgSend(v2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v3, v5, "Failed to copy password item to group with error: %{public}@", v6);
}

- (void)safari_copySavedAccountWithPasskeyToPersonalKeychain:()SafariCoreExtras .cold.1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1B728F000, v0, v1, "SecItemAdd for password credential from group to personal keychain failed with error %d", v2, v3, v4, v5, v6);
}

- (void)safari_copySavedAccountWithPasskeyToPersonalKeychain:()SafariCoreExtras .cold.2(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v1, v2, "SecItemCopyMatching for passkey credential received unexpected class %@", v3);
}

- (void)safari_copySavedAccountWithPasskeyToPersonalKeychain:()SafariCoreExtras .cold.3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1B728F000, v0, v1, "SecItemCopyMatching failed while trying to move passkey credential to personal keychain with error %d", v2, v3, v4, v5, v6);
}

- (void)safari_copySavedAccountWithPasskey:()SafariCoreExtras toGroupWithID:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Trying to copy a passkey to a shared group but did not specify a group ID", v2, v3, v4, v5, v6);
}

- (void)safari_copySavedAccountWithPasskey:()SafariCoreExtras toGroupWithID:.cold.2(uint64_t a1, void *a2)
{
  uint64_t v3 = OUTLINED_FUNCTION_20(a1, a2);
  uint64_t v4 = objc_msgSend(v2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v3, v5, "Failed to share password to group with error: %{public}@", v6);
}

- (void)_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:()SafariCoreExtras withNewUsername:fromRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to move personal sidecar from personal access group for shared credentials to personal keychain with error %ld", v2, v3, v4, v5, v6);
}

- (void)_safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:()SafariCoreExtras forGroupWithID:fromRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1B728F000, v0, v1, "Failed to copy personal sidecar to personal sidecar access group for shared group %{private}@, error %ld");
}

- (void)_safari_copyPersonalSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1B728F000, v0, v1, "Error updating shared sidecar after sharing with group %@, error %ld");
}

- (void)_safari_copySharedSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1B728F000, v0, v1, "Error adding shared sidecar to group %{private}@, error %ld");
}

- (void)_safari_copySharedSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:.cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_1B728F000, v6, v7, "Error sharing shared sidecar with group %@, error %{public}@", v8, v9, v10, v11, 2u);
}

- (void)safari_deleteAllItemsForGroupID:()SafariCoreExtras .cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Invalid group ID passed into method to delete all items from group after exit", v2, v3, v4, v5, v6);
}

- (void)_safari_deleteAllPasswordCredentialsForGroupID:()SafariCoreExtras .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete passwords from exited group: %ld", v2, v3, v4, v5, v6);
}

- (void)_safari_deleteAllRecentlyDeletedPasswordCredentialsForGroupID:()SafariCoreExtras .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete recently deleted passwords from exited group: %ld", v2, v3, v4, v5, v6);
}

- (void)_safari_deleteAllPasskeyCredentialsForGroupID:()SafariCoreExtras .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete passkeys from exited group: %ld", v2, v3, v4, v5, v6);
}

- (void)_safari_deleteAllRecentlyDeletedPasskeyCredentialsForGroupID:()SafariCoreExtras .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete recently deleted passkeys from exited group: %ld", v2, v3, v4, v5, v6);
}

- (void)_safari_deleteAllSharedSidecarsForGroupID:()SafariCoreExtras .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete shared sidecars from exited group: %ld", v2, v3, v4, v5, v6);
}

- (void)_safari_deleteAllRecentlyDeletedSharedSidecarsForGroupID:()SafariCoreExtras .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete recently deleted shared sidecars from exited group: %ld", v2, v3, v4, v5, v6);
}

- (void)_safari_deleteAllPersonalSidecarsForGroupID:()SafariCoreExtras .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete personal sidecars from exited group: %ld", v2, v3, v4, v5, v6);
}

- (void)_safari_deleteAllRecentlyDeletedPersonalSidecarsForGroupID:()SafariCoreExtras .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete recently deleted personal sidecars from exited group: %ld", v2, v3, v4, v5, v6);
}

- (void)_safari_dataFromGeneratedPasswordDictionary:()SafariCoreExtras domain:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_22(&dword_1B728F000, v6, v7, "Unable to archive generated password for %{private}@: %{public}@", v8, v9, v10, v11, 3u);
}

- (void)safari_updateGeneratedPassword:()SafariCoreExtras withPassword:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Tried to update generated password record that had not been previously persisted", v2, v3, v4, v5, v6);
}

- (void)safari_updateGeneratedPassword:()SafariCoreExtras withPassword:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to fetch updated generated password item in Keychain: status=%ld", v2, v3, v4, v5, v6);
}

- (void)safari_updateGeneratedPassword:()SafariCoreExtras withPassword:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to update generated password item in Keychain: status=%ld", v2, v3, v4, v5, v6);
}

- (void)safari_deleteGeneratedPassword:()SafariCoreExtras .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 host];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_1B728F000, v6, v7, "Unable to fetch generated password item for date %@ and host %@", v8, v9, v10, v11, 2u);
}

- (void)safari_deleteGeneratedPassword:()SafariCoreExtras .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 host];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_1B728F000, v6, v7, "No generated password item found for date %@ and host %@", v8, v9, v10, v11, 2u);
}

- (void)safari_deleteGeneratedPassword:()SafariCoreExtras .cold.3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Unable to get persistent reference for generated password item in Keychain", v2, v3, v4, v5, v6);
}

- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemCopyMatching failed while trying to delete recently deleted passkey credential: %ld", v2, v3, v4, v5, v6);
}

- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Recently deleted passkey credential did not contain valid persistent identifier.", v2, v3, v4, v5, v6);
}

- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "SecItemDelete failed while trying to delete recently deleted passkey credential: %ld", v2, v3, v4, v5, v6);
}

- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:.cold.4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1B728F000, v0, v1, "The user tried to delete a passkey in a group they have read only permission in.", v2, v3, v4, v5, v6);
}

+ (void)safari_test_addTestingPasskeyItemWithCredentialID:()SafariCoreExtras groupID:toRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Unable to delete unshared record", v2, v3, v4, v5, v6);
}

+ (void)safari_test_addTestingPasskeyItemWithCredentialID:()SafariCoreExtras groupID:toRecentlyDeleted:.cold.2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_20(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v2, v4, "Unable to create testing passkey item, error %{public}@", v5);
}

+ (void)safari_test_saveCredential:()SafariCoreExtras withArbitraryProtectionSpace:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Encountered unexpected authentication method: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_safari_personalSidecarDictionaryForPasskeyWithUserHandle:()SafariCoreExtras relyingPartyID:groupID:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_12(), "objectForKeyedSubscript:");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_14(&dword_1B728F000, v4, v5, "Passkey sidecar fetching: SecItemCopyMatching failed to fetch sidecar items in access group %{public}@, result %i", v6, v7, v8, v9, v10);
}

@end