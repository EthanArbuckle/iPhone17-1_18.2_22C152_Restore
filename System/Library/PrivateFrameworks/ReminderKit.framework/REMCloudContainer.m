@interface REMCloudContainer
+ (BOOL)isSandboxEnvironment;
+ (id)_newCloudContainerForAccountIdentifier:(id)a3;
+ (id)newCloudContainerForAccount:(id)a3;
+ (id)newCloudContainerForAccountID:(id)a3;
+ (id)newCloudContainerWithPublicCloudDatabase;
+ (void)_writeLogCreatingCKContainerWithAccountIdentifier:(id)a3 personaIdentifier:(id)a4;
@end

@implementation REMCloudContainer

+ (BOOL)isSandboxEnvironment
{
  return 0;
}

+ (id)newCloudContainerForAccount:(id)a3
{
  v4 = [a3 objectID];
  v5 = [v4 uuid];
  v6 = [v5 UUIDString];

  v7 = (void *)[a1 newCloudContainerForAccountID:v6];
  return v7;
}

+ (id)newCloudContainerForAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v5 = +[REMAppleAccountUtilities sharedInstance];
  id v6 = (id)objc_msgSend(v5, "unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__REMCloudContainer_newCloudContainerForAccountID___block_invoke;
  v10[3] = &unk_1E61DD070;
  id v13 = a1;
  id v7 = v4;
  id v11 = v7;
  v12 = &v14;
  [v5 performBlockInPersonaContextForAccountIdentifier:v7 block:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __51__REMCloudContainer_newCloudContainerForAccountID___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 48) _writeLogCreatingCKContainerWithAccountIdentifier:*(void *)(a1 + 32) personaIdentifier:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 48) _newCloudContainerForAccountIdentifier:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

+ (id)_newCloudContainerForAccountIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "accountIdentifier");
  }
  if ([a1 isSandboxEnvironment]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.reminders" environment:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F19E30]) initWithAccountID:v4];
  [v7 setAccountOverrideInfo:v8];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v6 options:v7];
  v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_DEFAULT, "Created new CloudKit container {accountIdentifier: %{public}@}", buf, 0xCu);
  }

  [v9 setSourceApplicationBundleIdentifier:@"com.apple.reminders"];
  return v9;
}

+ (void)_writeLogCreatingCKContainerWithAccountIdentifier:(id)a3 personaIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[REMAppleAccountUtilities sharedInstance];
  id v8 = [v7 currentPersonaUserPersonaUniqueString];
  v9 = +[REMLog cloudkit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138544130;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 1024;
    int v15 = [v7 isCurrentPersonaDataSeparated];
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_1B9AA2000, v9, OS_LOG_TYPE_DEFAULT, "[newCloudContainerForAccountID] Creating CKContainer with {accountIdentifier: %{public}@, account.personaIdentifier: %{public}@, currentPersona.isDataSeparatedPersona: %d, currentPersona.userPersonaUniqueString: %{public}@}", (uint8_t *)&v10, 0x26u);
  }
}

+ (id)newCloudContainerWithPublicCloudDatabase
{
  if ([a1 isSandboxEnvironment]) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.reminders.fdb" environment:v2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v3];
  [v4 setSourceApplicationBundleIdentifier:@"com.apple.reminders"];
  id v5 = +[REMLog cloudkit];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_DEFAULT, "Created CKContainer with public cloud database", v7, 2u);
  }

  return v4;
}

@end