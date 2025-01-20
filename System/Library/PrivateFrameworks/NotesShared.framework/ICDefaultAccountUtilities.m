@interface ICDefaultAccountUtilities
+ (id)_defaultAccountIdentifierForTests;
+ (id)accountToAddNewNoteWithTagSelection:(id)a3 modernContext:(id)a4;
+ (id)defaultAccount;
+ (id)defaultAccountWithHTMLNoteContext:(id)a3;
+ (id)defaultFolderWithHTMLNoteContext:(id)a3;
+ (void)_setDefaultAccountIdentifierForTests:(id)a3;
+ (void)setDefaultAccountIdentifier:(id)a3;
@end

@implementation ICDefaultAccountUtilities

+ (id)defaultAccount
{
  return (id)[a1 defaultAccountWithHTMLNoteContext:0];
}

+ (id)defaultAccountWithHTMLNoteContext:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[ICNoteContext sharedContext];
  CFStringRef v5 = (const __CFString *)ICSettingsBundleID();
  CFPreferencesAppSynchronize(v5);
  uint64_t v62 = 0;
  v63[0] = &v62;
  v63[1] = 0x3032000000;
  v63[2] = __Block_byref_object_copy__54;
  v63[3] = __Block_byref_object_dispose__54;
  id v64 = [MEMORY[0x1E4F837D0] objectForKey:@"DefaultNotesAccount"];
  v6 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.9((uint64_t)v63, v6);
  }

  if ([MEMORY[0x1E4F83738] isRunningUnitTests])
  {
    v7 = +[ICDefaultAccountUtilities _defaultAccountIdentifierForTests];
    if ([v7 length])
    {
      objc_storeStrong((id *)(v63[0] + 40), v7);
      v8 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.8((uint64_t)v63, v8);
      }
    }
  }
  v9 = [v4 managedObjectContext];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke;
  v60[3] = &unk_1E64A4240;
  id v10 = v4;
  id v61 = v10;
  [v9 performBlockAndWait:v60];

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__54;
  v58 = __Block_byref_object_dispose__54;
  id v59 = 0;
  v11 = *(void **)(v63[0] + 40);
  if (!v11) {
    goto LABEL_28;
  }
  if ([v11 isEqualToString:@"DeviceLocalAccount"])
  {
    v12 = [MEMORY[0x1E4F837D0] objectForKey:*MEMORY[0x1E4F83820]];
    int v13 = [v12 BOOLValue];

    v14 = os_log_create("com.apple.notes", "Accounts");
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      if (v15) {
        +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.6();
      }

      v16 = [v10 managedObjectContext];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_10;
      v52[3] = &unk_1E64A4528;
      v53[1] = &v54;
      v53[0] = v10;
      [v16 performBlockAndWait:v52];

      v17 = (id *)v53;
    }
    else
    {
      if (v15) {
        +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.7();
      }

      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_12;
      v50[3] = &unk_1E64A4528;
      v51[1] = &v54;
      v51[0] = v3;
      [v51[0] performBlockAndWait:v50];
      v17 = v51;
    }
  }
  if (!v55[5])
  {
    v18 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.5();
    }

    v19 = [v10 managedObjectContext];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_14;
    v46[3] = &unk_1E64A4818;
    v48 = &v62;
    id v20 = v10;
    id v47 = v20;
    v49 = &v54;
    [v19 performBlockAndWait:v46];

    if (!v55[5])
    {
      v21 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.4();
      }

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_15;
      v42[3] = &unk_1E64A4818;
      v44 = &v54;
      id v22 = v3;
      id v43 = v22;
      v45 = &v62;
      [v22 performBlockAndWait:v42];
      *(void *)buf = 0;
      v66 = buf;
      uint64_t v67 = 0x3032000000;
      v68 = __Block_byref_object_copy__54;
      v69 = __Block_byref_object_dispose__54;
      ICProtocolCast();
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      if (*((void *)v66 + 5))
      {
        v23 = [v20 managedObjectContext];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_2;
        v37[3] = &unk_1E64A9208;
        id v38 = v22;
        v40 = buf;
        id v39 = v20;
        v41 = &v54;
        [v23 performBlockAndWait:v37];
      }
      _Block_object_dispose(buf, 8);

      if (!v55[5])
      {
LABEL_28:
        v24 = os_log_create("com.apple.notes", "Accounts");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:]();
        }

        v25 = [v10 managedObjectContext];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_118;
        v34[3] = &unk_1E64A4528;
        v36 = &v54;
        id v35 = v10;
        [v25 performBlockAndWait:v34];

        if (!v55[5])
        {
          v26 = os_log_create("com.apple.notes", "Accounts");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:]();
          }

          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_119;
          v31[3] = &unk_1E64A44A8;
          id v32 = v3;
          v33 = &v54;
          [v32 performBlockAndWait:v31];
        }
      }
    }
  }
  v27 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v28 = [(id)v55[5] objectID];
    +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:v27];
  }

  id v29 = (id)v55[5];
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v62, 8);
  return v29;
}

uint64_t __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addOrDeleteLocalAccountIfNecessary];
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_10(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v2 = +[ICAccount localAccountInContext:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_12(uint64_t a1)
{
  objc_opt_class();
  ICCheckedDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 localAccount];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_14(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  v4 = +[ICAccount accountWithIdentifier:v2 context:v3];

  if ([v4 didChooseToMigrate])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_14_cold_1();
    }
  }
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_15(uint64_t a1)
{
  objc_opt_class();
  ICCheckedDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 accountForAccountId:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__54;
  int v13 = __Block_byref_object_dispose__54;
  id v14 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_3;
  v8[3] = &unk_1E64A6310;
  uint64_t v3 = *(void *)(a1 + 48);
  v8[4] = &v9;
  v8[5] = v3;
  [v2 performBlockAndWait:v8];
  uint64_t v4 = v10[5];
  id v5 = [*(id *)(a1 + 40) managedObjectContext];
  v6 = +[ICAccount accountWithIdentifier:v4 context:v5];

  if ([v6 accountType] == 1 && objc_msgSend(v6, "didChooseToMigrate"))
  {
    v7 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_2_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v6);
  }

  _Block_object_dispose(&v9, 8);
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = +[ICLegacyAccountUtilities accountIdentifierForAccount:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_118(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v2 = +[ICAccount cloudKitIfMigratedElseLocalAccountInContext:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_119(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t v2 = ICCheckedDynamicCast();
  uint64_t v3 = [v2 accountUtilities];
  uint64_t v4 = [v3 accountsEnabledForNotes];
  id v5 = [v4 lastObject];

  if (v5)
  {
    objc_opt_class();
    v6 = ICCheckedDynamicCast();
    v7 = [v5 identifier];
    uint64_t v8 = [v6 accountForAccountId:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v31 = v5;
      uint64_t v11 = [v5 childAccounts];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v33;
        uint64_t v15 = *MEMORY[0x1E4F175F0];
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v33 != v14) {
              objc_enumerationMutation(v11);
            }
            v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            v18 = [v17 accountType];
            v19 = [v18 syncableDataclasses];
            int v20 = [v19 containsObject:v15];

            if (v20)
            {
              objc_opt_class();
              v21 = ICCheckedDynamicCast();
              id v22 = [v17 identifier];
              uint64_t v23 = [v21 accountForAccountId:v22];
              uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
              v25 = *(void **)(v24 + 40);
              *(void *)(v24 + 40) = v23;

              goto LABEL_13;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      id v5 = v31;
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v26 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_119_cold_1();
    }

    objc_opt_class();
    v27 = ICCheckedDynamicCast();
    uint64_t v28 = [v27 localAccount];
    uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;
  }
}

+ (void)_setDefaultAccountIdentifierForTests:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&ICDefaultAccountIdentifierLock);
  uint64_t v4 = (void *)ICDefaultAccountIdentifierLockForTests;
  ICDefaultAccountIdentifierLockForTests = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&ICDefaultAccountIdentifierLock);
}

+ (id)_defaultAccountIdentifierForTests
{
  os_unfair_lock_lock((os_unfair_lock_t)&ICDefaultAccountIdentifierLock);
  id v2 = (id)ICDefaultAccountIdentifierLockForTests;
  os_unfair_lock_unlock((os_unfair_lock_t)&ICDefaultAccountIdentifierLock);
  return v2;
}

+ (void)setDefaultAccountIdentifier:(id)a3
{
  [MEMORY[0x1E4F837D0] setObject:a3 forKey:@"DefaultNotesAccount"];
  id v3 = [MEMORY[0x1E4F83808] sharedWidget];
  [v3 reloadTimelinesWithReason:@"Default account has changed"];
}

+ (id)defaultFolderWithHTMLNoteContext:(id)a3
{
  id v4 = a3;
  id v5 = [a1 defaultAccountWithHTMLNoteContext:v4];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__54;
  int v20 = __Block_byref_object_dispose__54;
  id v21 = 0;
  v6 = [v5 objectID];
  int v7 = objc_msgSend(v6, "ic_isModernAccountType");

  if (v7)
  {
    uint64_t v8 = [v5 managedObjectContext];
    uint64_t v9 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__ICDefaultAccountUtilities_defaultFolderWithHTMLNoteContext___block_invoke;
    v15[3] = &unk_1E64A4528;
    v15[5] = &v16;
    v15[4] = v5;
    [v8 performBlockAndWait:v15];
  }
  else
  {
    id v10 = [v5 objectID];
    int v11 = objc_msgSend(v10, "ic_isLegacyAccountType");

    if (!v11) {
      goto LABEL_6;
    }
    uint64_t v8 = [v5 managedObjectContext];
    uint64_t v9 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__ICDefaultAccountUtilities_defaultFolderWithHTMLNoteContext___block_invoke_2;
    v14[3] = &unk_1E64A4528;
    v14[5] = &v16;
    v14[4] = v5;
    [v8 performBlockAndWait:v14];
  }

LABEL_6:
  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __62__ICDefaultAccountUtilities_defaultFolderWithHTMLNoteContext___block_invoke(uint64_t a1)
{
  objc_opt_class();
  ICCheckedDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 defaultFolder];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __62__ICDefaultAccountUtilities_defaultFolderWithHTMLNoteContext___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  ICCheckedProtocolCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v6 defaultFolder];
  uint64_t v3 = ICCheckedDynamicCast();
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)accountToAddNewNoteWithTagSelection:(id)a3 modernContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 managedObjectContext];

  if (v8 != v7)
  {
    uint64_t v9 = [v6 copyWithManagedObjectContext:v7];

    id v6 = (id)v9;
  }
  id v10 = [a1 defaultAccountWithHTMLNoteContext:0];
  objc_opt_class();
  int v11 = ICDynamicCast();
  if ([v6 isEmpty])
  {
    id v12 = v11;
  }
  else
  {
    uint64_t v13 = [v6 tags];
    uint64_t v14 = [v13 count];

    uint64_t v15 = [v6 tags];
    uint64_t v16 = v15;
    if (v14 == 1)
    {
      v17 = [v15 firstObject];
      uint64_t v18 = [v17 account];
      v19 = (void *)v18;
      if (v18) {
        int v20 = (void *)v18;
      }
      else {
        int v20 = v11;
      }
      id v12 = v20;
    }
    else
    {
      id v21 = objc_msgSend(v15, "ic_compactMap:", &__block_literal_global_62);

      id v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
      if ([v22 count] == 1)
      {
        id v23 = [v22 anyObject];
      }
      else
      {
        id v23 = v11;
      }
      id v12 = v23;
    }
  }

  return v12;
}

uint64_t __79__ICDefaultAccountUtilities_accountToAddNewNoteWithTagSelection_modernContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 account];
}

+ (void)defaultAccountWithHTMLNoteContext:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Retrieved default account {accountID: %@}", buf, 0xCu);
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Falling back to default HTML account", v2, v3, v4, v5, v6);
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Falling back to default modern account", v2, v3, v4, v5, v6);
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetching HTML account", v2, v3, v4, v5, v6);
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetching modern account", v2, v3, v4, v5, v6);
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetching modern local account", v2, v3, v4, v5, v6);
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetching HTML local account", v2, v3, v4, v5, v6);
}

+ (void)defaultAccountWithHTMLNoteContext:(uint64_t)a1 .cold.8(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Overriding default account ID for testing {accountID: %@}", (uint8_t *)&v3, 0xCu);
}

+ (void)defaultAccountWithHTMLNoteContext:(uint64_t)a1 .cold.9(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Retrieved default account ID from settings {accountID: %@}", (uint8_t *)&v3, 0xCu);
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_14_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Ignoring unmigrated modern account", v2, v3, v4, v5, v6);
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Using migrated modern account for HTML account", v2, v3, v4, v5, v6);
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_119_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Falling back to local HTML account", v2, v3, v4, v5, v6);
}

@end