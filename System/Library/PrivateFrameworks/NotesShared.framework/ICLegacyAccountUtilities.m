@interface ICLegacyAccountUtilities
+ (BOOL)didChooseToMigrateAccount:(id)a3 context:(id)a4;
+ (BOOL)didChooseToMigrateAccountsForContext:(id)a3 forAccountPassingTest:(id)a4;
+ (BOOL)didChooseToMigrateLegacyAccountType:(int64_t)a3;
+ (BOOL)isLegacyLocalAccount:(id)a3;
+ (id)accountForAccountIdentifier:(id)a3 context:(id)a4;
+ (id)accountForEmailAddress:(id)a3 context:(id)a4;
+ (id)accountIdentifierForAccount:(id)a3;
+ (id)emailAddressForAccount:(id)a3;
+ (id)legacyAccountForICloudACAccount:(id)a3 context:(id)a4;
+ (id)legacyAccountForICloudAccount:(id)a3 context:(id)a4;
+ (id)legacyAccountForLegacyAccountType:(int64_t)a3 context:(id)a4;
+ (id)legacyAccountForLocalAccountWithContext:(id)a3;
+ (id)legacyAccountForPrimaryICloudAccountWithContext:(id)a3;
@end

@implementation ICLegacyAccountUtilities

+ (BOOL)didChooseToMigrateAccountsForContext:(id)a3 forAccountPassingTest:(id)a4
{
  v6 = (unsigned int (**)(id, void *))a4;
  uint64_t v7 = 0;
  char v8 = 1;
  while (1)
  {
    char v9 = v8;
    v10 = [a1 legacyAccountForLegacyAccountType:v7 context:a3];
    if (v10)
    {
      if (v6[2](v6, v10) && [a1 didChooseToMigrateLegacyAccountType:v7]) {
        break;
      }
    }

    char v8 = 0;
    BOOL v11 = 0;
    uint64_t v7 = 1;
    if ((v9 & 1) == 0) {
      goto LABEL_8;
    }
  }

  BOOL v11 = 1;
LABEL_8:

  return v11;
}

+ (BOOL)didChooseToMigrateAccount:(id)a3 context:(id)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__ICLegacyAccountUtilities_didChooseToMigrateAccount_context___block_invoke;
  v9[3] = &unk_1E64A5A38;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [a1 didChooseToMigrateAccountsForContext:a4 forAccountPassingTest:v9];

  return (char)a4;
}

uint64_t __62__ICLegacyAccountUtilities_didChooseToMigrateAccount_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2 == a2) {
    return 1;
  }
  id v3 = a2;
  v4 = [v2 accountIdentifier];
  v5 = [v3 accountIdentifier];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

+ (BOOL)didChooseToMigrateLegacyAccountType:(int64_t)a3
{
  if (a3 == 1)
  {
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v5 = [v4 BOOLForKey:*MEMORY[0x1E4F83818]];
    goto LABEL_5;
  }
  if (!a3)
  {
    v4 = [MEMORY[0x1E4F836D8] sharedInstance];
    char v5 = [v4 didChooseToMigratePrimaryICloudAccount];
LABEL_5:
    BOOL v6 = v5;

    return v6;
  }
  char v8 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[ICLegacyAccountUtilities didChooseToMigrateLegacyAccountType:](a3, v8);
  }

  return 0;
}

+ (id)legacyAccountForLegacyAccountType:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    uint64_t v7 = [a1 legacyAccountForLocalAccountWithContext:v6];
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v7 = [a1 legacyAccountForPrimaryICloudAccountWithContext:v6];
LABEL_5:
    char v8 = (void *)v7;
    goto LABEL_9;
  }
  char v9 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[ICLegacyAccountUtilities didChooseToMigrateLegacyAccountType:](a3, v9);
  }

  char v8 = 0;
LABEL_9:

  return v8;
}

+ (id)legacyAccountForICloudAccount:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 accountType] == 1)
  {
    char v8 = [MEMORY[0x1E4F836D8] sharedInstance];
    char v9 = [v6 identifier];
    id v10 = [v8 iCloudACAccountWithIdentifier:v9];

    BOOL v11 = [a1 legacyAccountForICloudACAccount:v10 context:v7];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)isLegacyLocalAccount:(id)a3
{
  return [a3 legacyAccountType] == 0;
}

+ (id)accountForAccountIdentifier:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  id v7 = ICCheckedDynamicCast();

  char v8 = [v7 accountForAccountId:v6];

  return v8;
}

+ (id)legacyAccountForPrimaryICloudAccountWithContext:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F836D8];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  id v7 = [v6 primaryICloudACAccount];

  char v8 = [a1 legacyAccountForICloudACAccount:v7 context:v5];

  return v8;
}

+ (id)legacyAccountForICloudACAccount:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = objc_msgSend(a3, "childAccountsWithAccountTypeIdentifier:", *MEMORY[0x1E4F177F8], 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) identifier];
      v13 = [a1 accountForAccountIdentifier:v12 context:v6];

      if (v13) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  return v13;
}

+ (id)legacyAccountForLocalAccountWithContext:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = ICCheckedDynamicCast();

  id v5 = [v4 localAccount];

  return v5;
}

+ (id)accountIdentifierForAccount:(id)a3
{
  return (id)[a3 accountIdentifier];
}

+ (id)accountForEmailAddress:(id)a3 context:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  v25 = v6;
  id v7 = ICCheckedDynamicCast();
  uint64_t v8 = [MEMORY[0x1E4F82D50] sharedAccountUtilities];
  uint64_t v9 = [v8 accountsEnabledForNotes];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v17 = objc_msgSend(v16, "identifier", v25);
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }

  long long v18 = [v7 allAccounts];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __59__ICLegacyAccountUtilities_accountForEmailAddress_context___block_invoke;
  v26[3] = &unk_1E64A5A60;
  id v27 = v10;
  id v28 = v8;
  id v29 = v5;
  id v19 = v5;
  id v20 = v8;
  id v21 = v10;
  v22 = objc_msgSend(v18, "ic_objectsPassingTest:", v26);
  v23 = [v22 firstObject];

  return v23;
}

uint64_t __59__ICLegacyAccountUtilities_accountForEmailAddress_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 accountIdentifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v11 = [*(id *)(a1 + 40) accountStore];
    uint64_t v12 = [v6 accountIdentifier];
    uint64_t v9 = [v11 accountWithIdentifier:v12];

    if (v6) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  if (!v6) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v10 = [v9 username];
  if ([v10 isEqualToString:*(void *)(a1 + 48)])
  {

LABEL_8:
    uint64_t v13 = 1;
    *a4 = 1;
    goto LABEL_9;
  }
  uint64_t v14 = [v9 displayAccount];
  long long v15 = [v14 username];
  uint64_t v13 = [v15 isEqualToString:*(void *)(a1 + 48)];

  if (v13) {
    goto LABEL_8;
  }
LABEL_9:

  return v13;
}

+ (id)emailAddressForAccount:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F82D50];
  id v4 = a3;
  id v5 = [v3 sharedAccountUtilities];
  id v6 = [v5 accountStore];

  id v7 = [v4 accountIdentifier];

  uint64_t v8 = [v6 accountWithIdentifier:v7];

  uint64_t v9 = [v8 username];

  return v9;
}

+ (void)didChooseToMigrateLegacyAccountType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Invalid account type %ld", (uint8_t *)&v2, 0xCu);
}

@end