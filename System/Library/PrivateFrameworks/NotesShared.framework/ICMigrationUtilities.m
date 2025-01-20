@interface ICMigrationUtilities
+ (void)deleteMigratedHTMLAccountIfNecessaryForModernAccount:(id)a3;
+ (void)deleteMigratedHTMLAccountsInContext:(id)a3;
+ (void)fetchAndSetMigrationStateForAccountID:(id)a3 withCompletionHandler:(id)a4;
+ (void)fetchMigrationStateAndUserRecordForAccountID:(id)a3 withCompletionHandler:(id)a4;
+ (void)fetchMigrationStateForAccountID:(id)a3 withCompletionHandler:(id)a4;
+ (void)saveDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 didMigrateOnMac:(BOOL)a5 toACAccount:(id)a6 inStore:(id)a7 completionHandler:(id)a8;
+ (void)updateAllLegacyAccountMigrationStatesInContext:(id)a3;
+ (void)updateLegacyAccountMigrationStateForModernAccount:(id)a3;
@end

@implementation ICMigrationUtilities

+ (void)fetchMigrationStateForAccountID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__ICMigrationUtilities_fetchMigrationStateForAccountID_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E64A69B8;
  id v9 = v6;
  id v7 = v6;
  [a1 fetchMigrationStateAndUserRecordForAccountID:a3 withCompletionHandler:v8];
}

uint64_t __78__ICMigrationUtilities_fetchMigrationStateForAccountID_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4, a6);
  }
  return result;
}

+ (void)fetchMigrationStateAndUserRecordForAccountID:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[ICCloudContext newNotesContainerForAccountID:v5];
  v8 = [MEMORY[0x1E4F1A0A8] fetchCurrentUserRecordOperation];
  objc_initWeak(&location, v8);
  [v8 setQualityOfService:17];
  id v9 = [v8 configuration];
  [v9 setDiscretionaryNetworkBehavior:0];

  v10 = [v7 privateCloudDatabase];
  [v8 setDatabase:v10];

  v11 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[ICMigrationUtilities fetchMigrationStateAndUserRecordForAccountID:withCompletionHandler:]();
  }

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__27;
  v22[4] = __Block_byref_object_dispose__27;
  id v23 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E64A69E0;
  v21[4] = v28;
  v21[5] = v26;
  v21[6] = v24;
  v21[7] = v22;
  [v8 setPerRecordCompletionBlock:v21];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5;
  v14[3] = &unk_1E64A6A08;
  objc_copyWeak(&v20, &location);
  id v12 = v6;
  id v15 = v12;
  v16 = v28;
  v17 = v26;
  v18 = v24;
  v19 = v22;
  [v8 setFetchRecordsCompletionBlock:v14];
  v13 = [v7 privateCloudDatabase];
  [v13 addOperation:v8];

  objc_destroyWeak(&v20);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  objc_destroyWeak(&location);
}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v8 = os_log_create("com.apple.notes", "Migration");
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_cold_2();
    }

    v10 = [v6 objectForKeyedSubscript:@"DidChooseToMigrate"];
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = [v10 BOOLValue];

    v11 = [v6 objectForKeyedSubscript:@"DidFinishMigration"];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v11 BOOLValue];

    id v12 = [v6 objectForKeyedSubscript:@"DidMigrateOnMac"];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v12 BOOLValue];

    uint64_t v13 = *(void *)(a1[7] + 8);
    id v14 = v6;
    id v9 = *(NSObject **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_cold_1();
  }
}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5_cold_2((uint64_t)a1);
  }

  if (v4)
  {
    id v6 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5_cold_1();
    }
  }
  uint64_t v7 = a1[4];
  if (v7) {
    (*(void (**)(uint64_t, void, void, void, void, id))(v7 + 16))(v7, *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24), *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24), *(void *)(*(void *)(a1[8] + 8) + 40), v4);
  }
}

+ (void)fetchAndSetMigrationStateForAccountID:(id)a3 withCompletionHandler:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[ICMigrationUtilities fetchAndSetMigrationStateForAccountID:withCompletionHandler:]();
  }

  id v9 = +[ICNoteContext sharedContext];
  v10 = [v9 managedObjectContext];
  if (v6)
  {
    v11 = +[ICAccount cloudKitAccountWithIdentifier:v6 context:v10];

    if (v11)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke;
      v20[3] = &unk_1E64A6A58;
      id v21 = v9;
      id v22 = v6;
      id v24 = a1;
      id v23 = v7;
      [a1 fetchMigrationStateAndUserRecordForAccountID:v22 withCompletionHandler:v20];

      id v12 = v21;
LABEL_14:

      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v13 = +[ICAccount cloudKitAccountInContext:v10];
    if (v13)
    {
      id v14 = (void *)v13;
      id v15 = [v9 primaryICloudACAccount];

      if (v15) {
        goto LABEL_15;
      }
    }
    else
    {
    }
  }
  v16 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[ICMigrationUtilities fetchAndSetMigrationStateForAccountID:withCompletionHandler:]();
  }

  if (v7)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F83668];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"No CloudKit account while fetching migration state";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v19 = [v17 errorWithDomain:v18 code:203 userInfo:v12];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v19);

    goto LABEL_14;
  }
LABEL_15:
}

void __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke(uint64_t a1, char a2, char a3, char a4, void *a5, void *a6)
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [*(id *)(a1 + 32) managedObjectContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke_2;
  v19[3] = &unk_1E64A6A30;
  id v20 = v12;
  id v21 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 32);
  char v25 = a2;
  char v26 = a3;
  char v27 = a4;
  id v22 = v14;
  id v23 = v11;
  long long v18 = *(_OWORD *)(a1 + 48);
  id v15 = (id)v18;
  long long v24 = v18;
  id v16 = v11;
  id v17 = v12;
  [v13 performBlockAndWait:v19];
}

void __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) managedObjectContext];
  if (v3)
  {
    id v5 = +[ICAccount cloudKitAccountWithIdentifier:v3 context:v4];

    id v6 = [MEMORY[0x1E4F836D8] sharedInstance];
    id v7 = [v6 iCloudACAccountWithIdentifier:*(void *)(a1 + 40)];

    if (!v5) {
      goto LABEL_11;
    }
  }
  else
  {
    id v5 = +[ICAccount cloudKitAccountInContext:v4];

    id v7 = [*(id *)(a1 + 48) primaryICloudACAccount];
    if (!v5) {
      goto LABEL_11;
    }
  }
  if (v7)
  {
    if (v2) {
      goto LABEL_13;
    }
    int v8 = [v5 didChooseToMigrate];
    int v9 = *(unsigned __int8 *)(a1 + 80);
    if (v9 != v8)
    {
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:*MEMORY[0x1E4F836A8] object:0];

      [v5 setDidChooseToMigrate:*(unsigned __int8 *)(a1 + 80)];
    }
    [v5 setDidFinishMigration:*(unsigned __int8 *)(a1 + 81)];
    [v5 setDidMigrateOnMac:*(unsigned __int8 *)(a1 + 82)];
    [v5 setServerRecord:*(void *)(a1 + 56)];
    id v11 = *(void **)(a1 + 72);
    uint64_t v12 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 81);
    uint64_t v14 = *(unsigned __int8 *)(a1 + 82);
    id v15 = [v7 accountStore];
    [v11 saveDidChooseToMigrate:v12 didFinishMigration:v13 didMigrateOnMac:v14 toACAccount:v7 inStore:v15 completionHandler:0];

    id v2 = 0;
    if (v9 != v8)
    {
      id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v17 = *MEMORY[0x1E4F836A0];
      uint64_t v24 = *MEMORY[0x1E4F83698];
      long long v18 = [v5 identifier];
      char v25 = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      [v16 postNotificationName:v17 object:0 userInfo:v19];

      id v2 = 0;
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_11:
  if (v2) {
    goto LABEL_13;
  }
  id v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v21 = *MEMORY[0x1E4F83668];
  uint64_t v26 = *MEMORY[0x1E4F28568];
  v27[0] = @"No CloudKit account after fetching migration state";
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  id v2 = [v20 errorWithDomain:v21 code:203 userInfo:v22];

  if (v2)
  {
LABEL_13:
    id v16 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke_2_cold_1();
    }
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v23 = *(void *)(a1 + 64);
  if (v23) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v23 + 16))(v23, [v5 didChooseToMigrate], objc_msgSend(v5, "didFinishMigration"), v2);
  }
}

+ (void)saveDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 didMigrateOnMac:(BOOL)a5 toACAccount:(id)a6 inStore:(id)a7 completionHandler:(id)a8
{
  unsigned int v31 = a5;
  BOOL v32 = a4;
  BOOL v33 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a7;
  id v12 = a8;
  uint64_t v13 = os_log_create("com.apple.notes", "Migration");
  v30 = v11;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v28 = [v10 identifier];
    *(_DWORD *)buf = 67109890;
    BOOL v41 = v33;
    __int16 v42 = 1024;
    BOOL v43 = v32;
    __int16 v44 = 1024;
    unsigned int v45 = v31;
    __int16 v46 = 2112;
    v47 = v28;
    _os_log_debug_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEBUG, "Trying to set didChooseToMigrate=%d didFinishMigration=%d didMigrateOnMac=%d on ACAccount (%@)", buf, 0x1Eu);
  }
  uint64_t v14 = *MEMORY[0x1E4F835F8];
  id v15 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F835F8]];
  uint64_t v16 = *MEMORY[0x1E4F83600];
  uint64_t v17 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F83600]];
  uint64_t v18 = *MEMORY[0x1E4F83608];
  v19 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F83608]];
  int v20 = [v15 BOOLValue];
  int v21 = [v17 BOOLValue];
  int v22 = [v19 BOOLValue];
  if (!v15 || !v17 || !v19 || ((v20 ^ v33) & 1) != 0 || ((v21 ^ v32) & 1) != 0 || v22 != v31)
  {
    uint64_t v24 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      char v29 = [v10 identifier];
      *(_DWORD *)buf = 67109890;
      BOOL v41 = v33;
      __int16 v42 = 1024;
      BOOL v43 = v32;
      __int16 v44 = 1024;
      unsigned int v45 = v31;
      __int16 v46 = 2112;
      v47 = v29;
      _os_log_debug_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_DEBUG, "Actually setting didChooseToMigrate=%d didFinishMigration=%d didMigrateOnMac=%d on ACAccount (%@)", buf, 0x1Eu);
    }
    char v25 = [MEMORY[0x1E4F28ED0] numberWithBool:v33];
    [v10 setObject:v25 forKeyedSubscript:v14];

    uint64_t v26 = [MEMORY[0x1E4F28ED0] numberWithBool:v32];
    [v10 setObject:v26 forKeyedSubscript:v16];

    char v27 = [MEMORY[0x1E4F28ED0] numberWithBool:v31];
    [v10 setObject:v27 forKeyedSubscript:v18];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke;
    v34[3] = &unk_1E64A6A80;
    BOOL v37 = v33;
    BOOL v38 = v32;
    char v39 = v31;
    id v35 = v10;
    id v36 = v12;
    uint64_t v23 = v30;
    [v30 saveAccount:v35 withCompletionHandler:v34];
  }
  else
  {
    uint64_t v23 = v30;
    if (v12) {
      (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 1, 0);
    }
  }
}

void __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = os_log_create("com.apple.notes", "Migration");
  id v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke_cold_2();
    }
  }
  else
  {
    int v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke_cold_1(a1, v8);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

+ (void)updateLegacyAccountMigrationStateForModernAccount:(id)a3
{
  id v3 = a3;
  id v4 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[ICMigrationUtilities updateLegacyAccountMigrationStateForModernAccount:](v3);
  }

  id v5 = objc_alloc_init(MEMORY[0x1E4F82D78]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke;
  v12[3] = &unk_1E64A4218;
  id v13 = v3;
  id v14 = v5;
  id v6 = v5;
  id v7 = v3;
  int v8 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v12);
  v8[2](v8, v9, v10, v11);
}

void __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  int v2 = [*(id *)(a1 + 32) accountType];
  if (v2 == 1)
  {
    id v6 = [*(id *)(a1 + 32) managedObjectContext];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_2;
    v19[3] = &unk_1E64A4528;
    int v21 = &v22;
    id v20 = *(id *)(a1 + 32);
    [v6 performBlockAndWait:v19];

    id v5 = +[ICLegacyAccountUtilities legacyAccountForPrimaryICloudAccountWithContext:*(void *)(a1 + 40)];
  }
  else
  {
    if (v2 != 3)
    {
      id v5 = 0;
      goto LABEL_19;
    }
    id v3 = [MEMORY[0x1E4F837D0] objectForKey:*MEMORY[0x1E4F83818]];
    char v4 = [v3 BOOLValue];
    *((unsigned char *)v23 + 24) = v4;

    id v5 = +[ICLegacyAccountUtilities legacyAccountForLocalAccountWithContext:*(void *)(a1 + 40)];
  }
  if (v5)
  {
    int v7 = [v5 didChooseToMigrate];
    if (*((unsigned __int8 *)v23 + 24) != v7)
    {
      if ([*(id *)(a1 + 32) didFinishMigration])
      {
        int v8 = (void *)MEMORY[0x1E4F83700];
        uint64_t v9 = [v5 accountIdentifier];
        [v8 markAccountReindexedForMigration:v9];

        uint64_t v10 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v11 = [v5 accountIdentifier];
          __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_3(v11, v27, v10);
        }
      }
      id v12 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v13 = [v5 accountIdentifier];
        __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_2(v13, buf, v12);
      }

      [v5 setDidChooseToMigrate:*((unsigned __int8 *)v23 + 24)];
      id v14 = *(void **)(a1 + 40);
      id v18 = 0;
      char v15 = [v14 save:&v18];
      id v16 = v18;
      if ((v15 & 1) == 0)
      {
        uint64_t v17 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_1();
        }
      }
    }
  }
LABEL_19:
  _Block_object_dispose(&v22, 8);
}

uint64_t __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) didChooseToMigrate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (void)updateAllLegacyAccountMigrationStatesInContext:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[ICMigrationUtilities updateAllLegacyAccountMigrationStatesInContext:]();
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__ICMigrationUtilities_updateAllLegacyAccountMigrationStatesInContext___block_invoke;
  v7[3] = &unk_1E64A6458;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v6 performBlockAndWait:v7];
}

void __71__ICMigrationUtilities_updateAllLegacyAccountMigrationStatesInContext___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = +[ICAccount allAccountsInContext:*(void *)(a1 + 32)];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) updateLegacyAccountMigrationStateForModernAccount:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (void)deleteMigratedHTMLAccountsInContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__ICMigrationUtilities_deleteMigratedHTMLAccountsInContext___block_invoke;
  v6[3] = &unk_1E64A6458;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

void __60__ICMigrationUtilities_deleteMigratedHTMLAccountsInContext___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = +[ICAccount allAccountsInContext:*(void *)(a1 + 32)];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) deleteMigratedHTMLAccountIfNecessaryForModernAccount:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (void)deleteMigratedHTMLAccountIfNecessaryForModernAccount:(id)a3
{
  id v3 = a3;
  if ([v3 didFinishMigration])
  {
    uint64_t v4 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[ICMigrationUtilities deleteMigratedHTMLAccountIfNecessaryForModernAccount:](v3);
    }

    uint64_t v5 = ICNewLegacyContext();
    uint64_t v6 = [v5 managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke;
    v9[3] = &unk_1E64A4500;
    id v10 = v3;
    id v11 = v5;
    id v12 = v6;
    id v7 = v6;
    id v8 = v5;
    [v7 performBlockAndWait:v9];
  }
}

void __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) accountType];
  if (v3 == 1)
  {
    uint64_t v4 = +[ICLegacyAccountUtilities legacyAccountForICloudAccount:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  }
  else
  {
    if (v3 != 3) {
      goto LABEL_9;
    }
    uint64_t v4 = +[ICLegacyAccountUtilities legacyAccountForLocalAccountWithContext:*(void *)(a1 + 40)];
  }
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke_cold_2(v2);
    }

    objc_opt_class();
    id v7 = ICCheckedDynamicCast();
    objc_opt_class();
    id v8 = ICCheckedDynamicCast();
    [v7 forceDeleteAccount:v8];

    objc_msgSend(*(id *)(a1 + 48), "ic_saveWithLogDescription:", @"Deleting migrated HTML account");
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke_cold_1(v2);
  }

LABEL_12:
}

+ (void)fetchMigrationStateAndUserRecordForAccountID:withCompletionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Fetching migration state from user record: %@", v1, 0xCu);
}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Per-record error fetching user record: %@", v2, v3, v4, v5, v6);
}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetched user record", v2, v3, v4, v5, v6);
}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error fetching user record: %@", v2, v3, v4, v5, v6);
}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5_cold_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Fetch user record operation completed: %@", v4, v5, v6, v7, v8);
}

+ (void)fetchAndSetMigrationStateForAccountID:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Trying to fetch migration state with no CloudKit account", v2, v3, v4, v5, v6);
}

+ (void)fetchAndSetMigrationStateForAccountID:withCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetching and setting migration state", v2, v3, v4, v5, v6);
}

void __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error while fetching and setting migration state: %@", v2, v3, v4, v5, v6);
}

void __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int8 *)(a1 + 48);
  int v4 = *(unsigned __int8 *)(a1 + 49);
  int v5 = *(unsigned __int8 *)(a1 + 50);
  uint8_t v6 = [*(id *)(a1 + 32) identifier];
  v7[0] = 67109890;
  v7[1] = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 1024;
  int v11 = v5;
  __int16 v12 = 2112;
  id v13 = v6;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Saved didChooseToMigrate=%d didFinishMigration=%d didMigrateOnMac=%d on ACAccount (%@)", (uint8_t *)v7, 0x1Eu);
}

void __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error saving migration state to ACAccount: %@", v2, v3, v4, v5, v6);
}

+ (void)updateLegacyAccountMigrationStateForModernAccount:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Updating migration state for HTML account associated with %@", v4, v5, v6, v7, v8);
}

void __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error saving legacy context after updating migration state: %@", v2, v3, v4, v5, v6);
}

void __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Updating migration state for legacy account %@", buf, 0xCu);
}

void __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Marked this legacy account to avoid it triggering reindexing %@", buf, 0xCu);
}

+ (void)updateAllLegacyAccountMigrationStatesInContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Updating all account migration states", v2, v3, v4, v5, v6);
}

+ (void)deleteMigratedHTMLAccountIfNecessaryForModernAccount:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Trying to delete HTML account for modern account %@", v4, v5, v6, v7, v8);
}

void __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Couldn't find HTML account for modern account %@", v4, v5, v6, v7, v8);
}

void __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke_cold_2(id *a1)
{
  uint64_t v1 = [*a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Deleting HTML account for modern account %@", v4, v5, v6, v7, v8);
}

@end