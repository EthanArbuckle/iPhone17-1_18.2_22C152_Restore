@interface REMChangeTracking
+ (id)defaultTransactionAuthorKeysToExclude;
+ (id)entityNamesToIncludeFromTrackingWithOptionProvider:(Class)a3;
+ (id)internalTransactionAuthorKeysToExclude;
+ (id)lastTransactionTimestampWithManagedObjectContext:(id)a3 affectedStores:(id)a4;
- (NSArray)entityNames;
- (NSSet)transactionAuthorKeysToExclude;
- (REMChangeTracking)initWithClientID:(id)a3 daemonController:(id)a4;
- (REMChangeTracking)initWithClientID:(id)a3 daemonController:(id)a4 transactionAuthorKeysToExclude:(id)a5;
- (REMChangeTrackingClientIdentifying)changeTrackingClientID;
- (REMDaemonController)daemonController;
- (id)currentChangeTokenForAccountTypes:(int64_t)a3 error:(id *)a4;
- (id)currentChangeTokenForAllAccountsWithError:(id *)a3;
- (id)currentChangeTokenWithError:(id *)a3;
- (id)earliestChangeTokenWithError:(id *)a3;
- (id)fetchAuxiliaryChangeInfosOfType:(Class)a3 withChangeObject:(id)a4 error:(id *)a5;
- (id)fetchHistoryAfterDate:(id)a3 error:(id *)a4;
- (id)fetchHistoryAfterToken:(id)a3 error:(id *)a4;
- (id)getTrackingStateWithError:(id *)a3;
- (id)persistenceStoreIDForAccountID:(id)a3 error:(id *)a4;
- (unint64_t)transactionFetchLimit;
- (void)_performChangeTrackingWithReason:(id)a3 block:(id)a4 xpcErrorHandler:(id)a5;
- (void)deleteHistoryBeforeDate:(id)a3 error:(id *)a4;
- (void)deleteHistoryBeforeToken:(id)a3 error:(id *)a4;
- (void)saveTrackingState:(id)a3 error:(id *)a4;
- (void)setEntityNames:(id)a3;
- (void)setTransactionFetchLimit:(unint64_t)a3;
@end

@implementation REMChangeTracking

+ (id)entityNamesToIncludeFromTrackingWithOptionProvider:(Class)a3
{
  return (id)[(objc_class *)a3 entityNamesToIncludeFromTracking];
}

+ (id)internalTransactionAuthorKeysToExclude
{
  if (internalTransactionAuthorKeysToExclude_onceTokenAuthorExclude != -1) {
    dispatch_once(&internalTransactionAuthorKeysToExclude_onceTokenAuthorExclude, &__block_literal_global_10);
  }
  v2 = (void *)internalTransactionAuthorKeysToExclude_defaultAuthorsToExclude;

  return v2;
}

uint64_t __59__REMChangeTracking_internalTransactionAuthorKeysToExclude__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F578A8], @"com.apple.remindd.RDStoreController.defaultValuesMigration", @"com.apple.remindd.RDStoreController.JSONPropertiesMigration", @"com.apple.remindd.RDStoreController.CKParentReminderIdentifierMigration", @"com.apple.remindd.RDStoreController.OrphanedListMigration", @"com.apple.RDStoreController.deleteAccountStore", @"com.apple.remindd.RDDisplayDateUpdater", @"com.apple.remindd.notificationConsumer.lastBannerPresentationDate", @"com.apple.remindd.todayEngine.notification.lastBannerPresentationDate", @"com.apple.remindd.ICCloudContext.internal", @"com.apple.remindd.ICCloudContext.serverChangeToken", @"com.apple.remindd.RDHashtagLabelUpdater.author", @"com.apple.remindd.RDTemplateOperation.author", @"com.apple.remindd.RDGroceryOperation.author", @"com.apple.remindd.RDSharedInlineTagAutoConvertEngine.author", @"com.apple.remindd.RDSyncActivityNotificationEngine.author", @"com.apple.remindd.RDStagedLightweightMigrationAuthor.author",
    @"RDStoreControllerUnsetCKDirtyFlagsInNonCKAccountsMigrationAuthor",
    @"com.apple.remindd.RDStoreController.IsPinnedByCurrentUserMigrationAuthor",
    @"com.apple.remindd.RDStoreController.MostRecentTargetTemplateIdentifierByCurrentUserMigrationAuthor",
    @"com.apple.remindd.RDStoreController.RemoveObsoleteDueDateDeltasMigrationAuthor",
    @"com.apple.remindd.RDStalePinnedListsEventHandler.author",
    @"com.apple.remindd.RDStaleSharedToMeListMostRecentTargetTemplateIdentifierByCurrentUserEventHandler.author",
    @"RDStoreController.DeduplicationActivityAuthor",
    @"RDStoreController.SuggestConversionToGroceryListActivityAuthor",
    @"com.apple.remindd.RDStoreController.UpdateAlternativeDueDatesOfCalDavRemindersMigrationAuthor",
    @"RDStoreController.BatchDeleteExpiredRemindersActivityAuthor",
  internalTransactionAuthorKeysToExclude_defaultAuthorsToExclude = 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)defaultTransactionAuthorKeysToExclude
{
  if (defaultTransactionAuthorKeysToExclude_onceTokenAuthorExclude != -1) {
    dispatch_once(&defaultTransactionAuthorKeysToExclude_onceTokenAuthorExclude, &__block_literal_global_2);
  }
  v2 = (void *)defaultTransactionAuthorKeysToExclude_defaultAuthorsToExclude;

  return v2;
}

void __58__REMChangeTracking_defaultTransactionAuthorKeysToExclude__block_invoke()
{
  v0 = +[REMChangeTracking internalTransactionAuthorKeysToExclude];
  id v3 = (id)[v0 mutableCopy];

  [v3 addObject:@"com.apple.remindd.dataaccess.REMSaveRequest.author"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)defaultTransactionAuthorKeysToExclude_defaultAuthorsToExclude;
  defaultTransactionAuthorKeysToExclude_defaultAuthorsToExclude = v1;
}

+ (id)lastTransactionTimestampWithManagedObjectContext:(id)a3 affectedStores:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke;
  v14[3] = &unk_1E61DCE40;
  id v7 = v5;
  id v15 = v7;
  id v8 = v6;
  id v16 = v8;
  v17 = &v18;
  [v7 performBlockAndWait:v14];
  v9 = (void *)v19[5];
  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    v11 = (void *)v19[5];
    v19[5] = v10;

    v9 = (void *)v19[5];
  }
  id v12 = v9;

  _Block_object_dispose(&v18, 8);

  return v12;
}

void __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 currentPersistentHistoryTokenFromStores:*(void *)(a1 + 40)];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1C160] fetchHistoryTransactionForToken:v3];
    id v5 = *(void **)(a1 + 32);
    id v19 = 0;
    id v6 = [v5 executeRequest:v4 error:&v19];
    id v7 = v19;
    id v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      uint64_t v10 = [v6 result];
      uint64_t v11 = objc_opt_class();
      id v12 = [v10 lastObject];
      v13 = REMCheckedDynamicCast(v11, (uint64_t)v12);

      uint64_t v14 = objc_opt_class();
      id v15 = [v13 timestamp];
      uint64_t v16 = REMCheckedDynamicCast(v14, (uint64_t)v15);

      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
    else
    {
      uint64_t v10 = +[REMLog changeTracking];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke_cold_2();
      }
    }
  }
  else
  {
    v4 = +[REMLog changeTracking];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke_cold_1((uint64_t *)(a1 + 40), v4);
    }
  }
}

- (REMChangeTracking)initWithClientID:(id)a3 daemonController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() defaultTransactionAuthorKeysToExclude];
  BOOL v9 = [(REMChangeTracking *)self initWithClientID:v7 daemonController:v6 transactionAuthorKeysToExclude:v8];

  return v9;
}

- (REMChangeTracking)initWithClientID:(id)a3 daemonController:(id)a4 transactionAuthorKeysToExclude:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)REMChangeTracking;
  id v12 = [(REMChangeTracking *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_changeTrackingClientID, a3);
    objc_storeStrong((id *)&v13->_daemonController, a4);
    objc_storeStrong((id *)&v13->_transactionAuthorKeysToExclude, a5);
    entityNames = v13->_entityNames;
    v13->_entityNames = 0;
    v13->_transactionFetchLimit = 0;
  }
  return v13;
}

- (id)currentChangeTokenForAllAccountsWithError:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__5;
  uint64_t v18 = __Block_byref_object_dispose__5;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__5;
  id v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke;
  v7[3] = &unk_1E61DCE90;
  v7[4] = &v14;
  v7[5] = &v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke_3;
  v6[3] = &unk_1E61DC1F8;
  v6[4] = &v8;
  [(REMChangeTracking *)self _performChangeTrackingWithReason:@"currentChangeTokenForAllAccounts" block:v7 xpcErrorHandler:v6];
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v4 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v4;
}

uint64_t __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke_2;
  v3[3] = &unk_1E61DCE68;
  long long v4 = *(_OWORD *)(a1 + 32);
  return [a2 currentChangeToken:v3];
}

void __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = v3;
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithREMChangeErrorCode:11];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

void __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)currentChangeTokenForAccountTypes:(int64_t)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__5;
  id v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__5;
  id v13 = __Block_byref_object_dispose__5;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke;
  v8[3] = &unk_1E61DCEE0;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = &v15;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke_3;
  v7[3] = &unk_1E61DC1F8;
  v7[4] = &v9;
  [(REMChangeTracking *)self _performChangeTrackingWithReason:@"currentChangeTokenForAccountTypes" block:v8 xpcErrorHandler:v7];
  if (a4) {
    *a4 = (id) v10[5];
  }
  id v5 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

uint64_t __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke_2;
  uint64_t v7 = &unk_1E61DCEB8;
  long long v8 = *(_OWORD *)(a1 + 32);
  uint64_t v9 = v2;
  return objc_msgSend(a2, "currentChangeTokenForAccountTypes:completion:");
}

void __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v14 = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1[4] + 8);
    id v5 = v3;
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    long long v8 = NSString;
    id v6 = [NSNumber numberWithInteger:a1[6]];
    uint64_t v9 = [v6 description];
    uint64_t v10 = [v8 stringWithFormat:@"types=%@", v9];
    uint64_t v11 = [v7 errorWithREMChangeErrorCode:11 debugDescription:v10];
    uint64_t v12 = *(void *)(a1[5] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

void __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)currentChangeTokenWithError:(id *)a3
{
  uint64_t v5 = objc_opt_class();
  id v6 = [(REMChangeTracking *)self changeTrackingClientID];
  uint64_t v7 = REMCheckedDynamicCast(v5, (uint64_t)v6);

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__5;
  id v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__REMChangeTracking_currentChangeTokenWithError___block_invoke;
  v12[3] = &unk_1E61DCF30;
  id v8 = v7;
  id v13 = v8;
  id v14 = &v22;
  uint64_t v15 = &v16;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__REMChangeTracking_currentChangeTokenWithError___block_invoke_3;
  v11[3] = &unk_1E61DC1F8;
  v11[4] = &v16;
  [(REMChangeTracking *)self _performChangeTrackingWithReason:@"currentChangeToken" block:v12 xpcErrorHandler:v11];
  if (a3) {
    *a3 = (id) v17[5];
  }
  id v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __49__REMChangeTracking_currentChangeTokenWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 accountIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__REMChangeTracking_currentChangeTokenWithError___block_invoke_2;
  v8[3] = &unk_1E61DCF08;
  uint64_t v10 = *(void *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v7;
  long long v9 = v7;
  [v4 currentChangeTokenForAccountID:v5 completion:v8];
}

void __49__REMChangeTracking_currentChangeTokenWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v13 = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = v3;
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    long long v7 = (void *)MEMORY[0x1E4F28C58];
    id v8 = NSString;
    id v6 = [*(id *)(a1 + 32) accountIdentifier];
    long long v9 = [v8 stringWithFormat:@"accountIdentifier=%@", v6];
    uint64_t v10 = [v7 errorWithREMChangeErrorCode:11 debugDescription:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

void __49__REMChangeTracking_currentChangeTokenWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)earliestChangeTokenWithError:(id *)a3
{
  uint64_t v5 = objc_opt_class();
  id v6 = [(REMChangeTracking *)self changeTrackingClientID];
  long long v7 = REMCheckedDynamicCast(v5, (uint64_t)v6);

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__5;
  id v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke;
  v12[3] = &unk_1E61DCF30;
  id v8 = v7;
  id v13 = v8;
  id v14 = &v22;
  uint64_t v15 = &v16;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke_3;
  v11[3] = &unk_1E61DC1F8;
  v11[4] = &v16;
  [(REMChangeTracking *)self _performChangeTrackingWithReason:@"earliestChangeToken" block:v12 xpcErrorHandler:v11];
  if (a3) {
    *a3 = (id) v17[5];
  }
  id v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 accountIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke_2;
  v8[3] = &unk_1E61DCF08;
  uint64_t v10 = *(void *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v7;
  long long v9 = v7;
  [v4 earliestChangeTokenForAccountID:v5 completion:v8];
}

void __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v13 = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = v3;
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    long long v7 = (void *)MEMORY[0x1E4F28C58];
    id v8 = NSString;
    id v6 = [*(id *)(a1 + 32) accountIdentifier];
    long long v9 = [v8 stringWithFormat:@"accountIdentifier=%@", v6];
    uint64_t v10 = [v7 errorWithREMChangeErrorCode:11 debugDescription:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

void __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)getTrackingStateWithError:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__5;
  uint64_t v18 = __Block_byref_object_dispose__5;
  id v19 = 0;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__5;
  uint64_t v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__REMChangeTracking_getTrackingStateWithError___block_invoke;
  v7[3] = &unk_1E61DCF30;
  v7[4] = self;
  void v7[5] = &v14;
  void v7[6] = &v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__REMChangeTracking_getTrackingStateWithError___block_invoke_3;
  v6[3] = &unk_1E61DC1F8;
  v6[4] = &v8;
  [(REMChangeTracking *)self _performChangeTrackingWithReason:@"getTrackingState" block:v7 xpcErrorHandler:v6];
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v4 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v4;
}

void __47__REMChangeTracking_getTrackingStateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 changeTrackingClientID];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__REMChangeTracking_getTrackingStateWithError___block_invoke_2;
  v6[3] = &unk_1E61DCF58;
  long long v7 = *(_OWORD *)(a1 + 40);
  [v4 getTrackingStateWithClientID:v5 completion:v6];
}

void __47__REMChangeTracking_getTrackingStateWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __47__REMChangeTracking_getTrackingStateWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)saveTrackingState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__REMChangeTracking_saveTrackingState_error___block_invoke;
  v9[3] = &unk_1E61DCF80;
  id v7 = v6;
  id v10 = v7;
  id v11 = self;
  uint64_t v12 = &v13;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__REMChangeTracking_saveTrackingState_error___block_invoke_3;
  v8[3] = &unk_1E61DC1F8;
  void v8[4] = &v13;
  [(REMChangeTracking *)self _performChangeTrackingWithReason:@"saveTrackingState" block:v9 xpcErrorHandler:v8];
  if (a4) {
    *a4 = (id) v14[5];
  }

  _Block_object_dispose(&v13, 8);
}

void __45__REMChangeTracking_saveTrackingState_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 changeTrackingClientID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__REMChangeTracking_saveTrackingState_error___block_invoke_2;
  v7[3] = &unk_1E61DC1F8;
  v7[4] = a1[6];
  [v5 saveTrackingState:v3 withClientID:v6 completionHandler:v7];
}

void __45__REMChangeTracking_saveTrackingState_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __45__REMChangeTracking_saveTrackingState_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)fetchHistoryAfterToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__5;
  v41 = __Block_byref_object_dispose__5;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__5;
  v35 = __Block_byref_object_dispose__5;
  id v36 = 0;
  id v7 = [(REMChangeTracking *)self entityNames];
  if ([v7 count]) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = [(REMChangeTracking *)self transactionFetchLimit];
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke;
  v25[3] = &unk_1E61DCFD0;
  id v9 = v6;
  id v26 = v9;
  id v27 = self;
  v28 = &v37;
  v29 = &v31;
  unint64_t v30 = v8;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke_3;
  v24[3] = &unk_1E61DC1F8;
  v24[4] = &v31;
  [(REMChangeTracking *)self _performChangeTrackingWithReason:@"fetchHistoryAfterToken" block:v25 xpcErrorHandler:v24];
  id v10 = (void *)v38[5];
  id v11 = [(REMChangeTracking *)self transactionAuthorKeysToExclude];
  uint64_t v12 = [v11 allObjects];
  [v10 consolidateAndFilterChangesWithTransactionAuthors:v12 isExclusion:1];

  if (!v38[5])
  {
    if (!v32[5])
    {
      uint64_t v17 = +[REMLog changeTracking];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[REMChangeTracking fetchHistoryAfterToken:error:]((uint64_t)v9, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    uint64_t v13 = +[REMChangeSet errorChangeSetWithError:](REMChangeSet, "errorChangeSetWithError:");
    uint64_t v14 = (void *)v38[5];
    v38[5] = v13;
  }
  if (a4) {
    *a4 = (id) v32[5];
  }
  id v15 = (id)v38[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v15;
}

void __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 entityNames];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v9 = *(void *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke_2;
  v10[3] = &unk_1E61DCFA8;
  long long v11 = *(_OWORD *)(a1 + 48);
  [v5 fetchHistoryAfterToken:v3 entityNames:v8 transactionFetchLimit:v9 completionHandler:v10];
}

void __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)fetchHistoryAfterDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__5;
  v41 = __Block_byref_object_dispose__5;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__5;
  v35 = __Block_byref_object_dispose__5;
  id v36 = 0;
  uint64_t v7 = [(REMChangeTracking *)self entityNames];
  if ([v7 count]) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = [(REMChangeTracking *)self transactionFetchLimit];
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke;
  v25[3] = &unk_1E61DCFD0;
  id v9 = v6;
  id v26 = v9;
  id v27 = self;
  v28 = &v37;
  v29 = &v31;
  unint64_t v30 = v8;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke_3;
  v24[3] = &unk_1E61DC1F8;
  v24[4] = &v31;
  [(REMChangeTracking *)self _performChangeTrackingWithReason:@"fetchHistoryAfterDate" block:v25 xpcErrorHandler:v24];
  id v10 = (void *)v38[5];
  id v11 = [(REMChangeTracking *)self transactionAuthorKeysToExclude];
  uint64_t v12 = [v11 allObjects];
  [v10 consolidateAndFilterChangesWithTransactionAuthors:v12 isExclusion:1];

  if (!v38[5])
  {
    if (!v32[5])
    {
      uint64_t v17 = +[REMLog changeTracking];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[REMChangeTracking fetchHistoryAfterDate:error:]((uint64_t)v9, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    uint64_t v13 = +[REMChangeSet errorChangeSetWithError:](REMChangeSet, "errorChangeSetWithError:");
    uint64_t v14 = (void *)v38[5];
    v38[5] = v13;
  }
  if (a4) {
    *a4 = (id) v32[5];
  }
  id v15 = (id)v38[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v15;
}

void __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 entityNames];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v9 = *(void *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke_2;
  v10[3] = &unk_1E61DCFA8;
  long long v11 = *(_OWORD *)(a1 + 48);
  [v5 fetchHistoryAfterDate:v3 entityNames:v8 transactionFetchLimit:v9 completionHandler:v10];
}

void __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)deleteHistoryBeforeToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5;
  uint64_t v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke;
  v9[3] = &unk_1E61DCFF8;
  id v7 = v6;
  id v10 = v7;
  id v11 = &v12;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke_3;
  v8[3] = &unk_1E61DC1F8;
  void v8[4] = &v12;
  [(REMChangeTracking *)self _performChangeTrackingWithReason:@"deleteHistoryBeforeToken" block:v9 xpcErrorHandler:v8];
  if (a4) {
    *a4 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke_2;
  v4[3] = &unk_1E61DC1F8;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 deleteHistoryBeforeToken:v2 completionHandler:v4];
}

void __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)deleteHistoryBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5;
  uint64_t v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke;
  v9[3] = &unk_1E61DCFF8;
  id v7 = v6;
  id v10 = v7;
  id v11 = &v12;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke_3;
  v8[3] = &unk_1E61DC1F8;
  void v8[4] = &v12;
  [(REMChangeTracking *)self _performChangeTrackingWithReason:@"deleteHistoryBeforeDate" block:v9 xpcErrorHandler:v8];
  if (a4) {
    *a4 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke_2;
  v4[3] = &unk_1E61DC1F8;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 deleteHistoryBeforeDate:v2 completionHandler:v4];
}

void __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)persistenceStoreIDForAccountID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5;
  unint64_t v30 = __Block_byref_object_dispose__5;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__5;
  uint64_t v24 = __Block_byref_object_dispose__5;
  id v25 = 0;
  id v7 = [(REMChangeTracking *)self daemonController];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke;
  v19[3] = &unk_1E61DC308;
  v19[4] = self;
  v19[5] = &v20;
  uint64_t v8 = [v7 syncDebugPerformerWithReason:@"persistenceStoreID" errorHandler:v19];

  if (!v21[5])
  {
    if (!v8)
    {
      id v11 = +[REMLog changeTracking];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[REMChangeTracking persistenceStoreIDForAccountID:error:]((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke_54;
    v18[3] = &unk_1E61DD020;
    v18[4] = &v26;
    [v8 persistenceStoreIDForAccountID:v6 completion:v18];
  }
  if (a4) {
    *a4 = (id) v21[5];
  }
  id v9 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v9;
}

void __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLog changeTracking];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke_54(uint64_t a1, void *a2)
{
}

- (void)_performChangeTrackingWithReason:(id)a3 block:(id)a4 xpcErrorHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  id v11 = [(REMChangeTracking *)self daemonController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__REMChangeTracking__performChangeTrackingWithReason_block_xpcErrorHandler___block_invoke;
  v15[3] = &unk_1E61DD048;
  v15[4] = self;
  id v12 = v10;
  id v16 = v12;
  uint64_t v17 = &v18;
  uint64_t v13 = [v11 syncChangeTrackingPerformerWithReason:v8 errorHandler:v15];

  if (!v19[5])
  {
    if (!v13)
    {
      uint64_t v14 = +[REMLog changeTracking];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](v14);
      }
    }
    v9[2](v9, v13);
  }

  _Block_object_dispose(&v18, 8);
}

void __76__REMChangeTracking__performChangeTrackingWithReason_block_xpcErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLog changeTracking];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__REMChangeTracking__performChangeTrackingWithReason_block_xpcErrorHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (REMChangeTrackingClientIdentifying)changeTrackingClientID
{
  return self->_changeTrackingClientID;
}

- (REMDaemonController)daemonController
{
  return self->_daemonController;
}

- (NSArray)entityNames
{
  return self->_entityNames;
}

- (void)setEntityNames:(id)a3
{
}

- (unint64_t)transactionFetchLimit
{
  return self->_transactionFetchLimit;
}

- (void)setTransactionFetchLimit:(unint64_t)a3
{
  self->_transactionFetchLimit = a3;
}

- (NSSet)transactionAuthorKeysToExclude
{
  return self->_transactionAuthorKeysToExclude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionAuthorKeysToExclude, 0);
  objc_storeStrong((id *)&self->_entityNames, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);

  objc_storeStrong((id *)&self->_changeTrackingClientID, 0);
}

- (id)fetchAuxiliaryChangeInfosOfType:(Class)a3 withChangeObject:(id)a4 error:(id *)a5
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v56 = a4;
  v66 = [MEMORY[0x1E4F1CA48] array];
  v67 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v56];
  if ([v56 isCoalesced])
  {
    id v6 = [v56 coalescedChanges];
    if (!v6)
    {
      v52 = +[REMLog changeTracking];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
        -[REMChangeTracking(REMAuxiliaryChangeInfoAdditions) fetchAuxiliaryChangeInfosOfType:withChangeObject:error:](v52);
      }
    }
    uint64_t v7 = [v5 arrayByAddingObjectsFromArray:v6];

    uint64_t v5 = (void *)v7;
  }
  id v8 = [(objc_class *)a3 cdEntityName];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v5;
  uint64_t v62 = [obj countByEnumeratingWithState:&v88 objects:v104 count:16];
  if (v62)
  {
    id v60 = *(id *)v89;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(id *)v89 != v60)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(obj);
          uint64_t v9 = v10;
        }
        uint64_t v64 = v9;
        id v11 = [*(id *)(*((void *)&v88 + 1) + 8 * v9) transaction];
        id v12 = [v11 changes];

        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v84 objects:v103 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v85;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v85 != v15) {
                objc_enumerationMutation(v13);
              }
              uint64_t v17 = *(void **)(*((void *)&v84 + 1) + 8 * v16);
              if (![v17 changeType])
              {
                uint64_t v18 = [v17 changedObjectID];
                if (v18)
                {
                  uint64_t v19 = [v17 changedObjectID];
                  uint64_t v20 = [v19 entityName];
                  int v21 = [v20 isEqual:v8];

                  if (v21)
                  {
                    uint64_t v22 = [v17 changedObjectID];
                    [v66 addObject:v22];

                    id v23 = [v17 changedObjectID];
                    [v67 setObject:v17 forKey:v23];
                  }
                }
              }
              ++v16;
            }
            while (v14 != v16);
            uint64_t v24 = [v13 countByEnumeratingWithState:&v84 objects:v103 count:16];
            uint64_t v14 = v24;
          }
          while (v24);
        }

        uint64_t v9 = v64 + 1;
      }
      while (v64 + 1 != v62);
      uint64_t v62 = [obj countByEnumeratingWithState:&v88 objects:v104 count:16];
    }
    while (v62);
  }

  id v25 = +[REMAuxiliaryChangeInfoFetchResult auxiliaryChangeInfoFetchResultOfType:a3];
  BOOL v26 = [v66 count] == 0;
  id v27 = +[REMLog changeTracking];
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (v26)
  {
    if (v28)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v56;
      _os_log_impl(&dword_1B9AA2000, v27, OS_LOG_TYPE_INFO, "No auxiliary change info object IDs found with change object {changeObject: %@}", buf, 0xCu);
    }

    id v33 = v25;
  }
  else
  {
    if (v28)
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v66;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v56;
      _os_log_impl(&dword_1B9AA2000, v27, OS_LOG_TYPE_INFO, "Auxiliary change info object IDs to fetch {objectIDs: %{public}@, changeObject: %@}", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v100 = __Block_byref_object_copy__5;
    v101 = __Block_byref_object_dispose__5;
    id v102 = 0;
    uint64_t v78 = 0;
    v79 = (id *)&v78;
    uint64_t v80 = 0x3032000000;
    v81 = __Block_byref_object_copy__5;
    v82 = __Block_byref_object_dispose__5;
    id v83 = 0;
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke;
    v74[3] = &unk_1E61DCF30;
    id v29 = v66;
    id v75 = v29;
    v76 = buf;
    v77 = &v78;
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke_3;
    v73[3] = &unk_1E61DC1F8;
    v73[4] = &v78;
    [(REMChangeTracking *)self _performChangeTrackingWithReason:@"fetchAuxiliaryChangeInfo" block:v74 xpcErrorHandler:v73];
    if (v79[5] || !*(void *)(*(void *)&buf[8] + 40))
    {
      unint64_t v30 = +[REMLog changeTracking];
      id v31 = v25;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v51 = [v79[5] localizedDescription];
        *(_DWORD *)v93 = 138543874;
        v94 = v51;
        __int16 v95 = 2112;
        id v96 = v56;
        __int16 v97 = 2114;
        uint64_t v98 = (uint64_t)v29;
        _os_log_error_impl(&dword_1B9AA2000, v30, OS_LOG_TYPE_ERROR, "Daemon returned error for auxiliary change info fetch with {error: %{public}@, changeObject: %@, auxChgInfoIds: %{public}@}", v93, 0x20u);
      }
      v32 = v31;
      v65 = 0;
    }
    else
    {
      v65 = v25;
      v58 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v29, "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v61 = v29;
      uint64_t v34 = [v61 countByEnumeratingWithState:&v69 objects:v92 count:16];
      if (v34)
      {
        uint64_t v63 = *(void *)v70;
        *(void *)&long long v35 = 138543362;
        long long v53 = v35;
        do
        {
          uint64_t v36 = v34;
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v70 != v63) {
              objc_enumerationMutation(v61);
            }
            v38 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            uint64_t v39 = objc_msgSend(v67, "objectForKeyedSubscript:", v38, v53);
            if (!v39)
            {
              v48 = +[REMLog changeTracking];
              if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v93 = v53;
                v94 = v38;
                _os_log_fault_impl(&dword_1B9AA2000, v48, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!changeObject) -- ERROR changeObjectsMap lost track of {auxiliaryChangeInfoObjectID: %{public}@}", v93, 0xCu);
              }
            }
            v40 = [*(id *)(*(void *)&buf[8] + 40) objectForKeyedSubscript:v38];
            if (!v40)
            {
              v49 = +[REMLog changeTracking];
              if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v93 = v53;
                v94 = v38;
                _os_log_fault_impl(&dword_1B9AA2000, v49, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!data) -- ERROR XPC returned a mapOfData that has no data entry for {auxiliaryChangeInfoObjectID: %{public}@}", v93, 0xCu);
              }
            }
            id v68 = 0;
            v41 = (void *)v39;
            id v42 = [v65 auxiliaryChangeInfoFromData:v40 withObjectID:v38 fromChangeObject:v39 error:&v68];
            id v43 = v68;
            id v44 = v68;
            if (v44 || !v42)
            {
              v45 = +[REMLog changeTracking];
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                uint64_t v46 = [v44 localizedDescription];
                *(_DWORD *)v93 = 138412802;
                v94 = v41;
                __int16 v95 = 2114;
                id v96 = v38;
                __int16 v97 = 2114;
                uint64_t v98 = v46;
                v47 = (void *)v46;
                _os_log_error_impl(&dword_1B9AA2000, v45, OS_LOG_TYPE_ERROR, "Failed to decode one of the change infos data for {changeObject: %@, objectID: %{public}@, decodeError: %{public}@}", v93, 0x20u);
              }
              objc_storeStrong(v79 + 5, v43);
            }
            else
            {
              [v58 addObject:v42];
            }
          }
          uint64_t v34 = [v61 countByEnumeratingWithState:&v69 objects:v92 count:16];
        }
        while (v34);
      }

      [v65 setAuxiliaryChangeInfos:v58];
      v32 = v58;
    }

    if (a5) {
      *a5 = v79[5];
    }
    id v33 = v65;

    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(buf, 8);
  }

  return v33;
}

uint64_t __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke_2;
  v4[3] = &unk_1E61DC6F0;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 fetchAuxiliaryChangeInfos:v2 completionHandler:v4];
}

void __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke_3(uint64_t a1, void *a2)
{
}

void __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "+[lastTransactionTimestampWithManagedObjectContext:affectedStores:] Failed to obtain current PHT token {affectedsStores: %@}", (uint8_t *)&v3, 0xCu);
}

void __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "+[lastTransactionTimestampWithManagedObjectContext:affectedStores:] Failed to fetch history {error: %{public}@, affectedsStores: %@}");
}

- (void)fetchHistoryAfterToken:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, a2, a3, "rem_log_fault_if (!error) -- Daemon returned nil result and error for persistentHistoryFetch {token: %{public}@}", a5, a6, a7, a8, 2u);
}

- (void)fetchHistoryAfterDate:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, a2, a3, "rem_log_fault_if (!error) -- Daemon returned nil result and error for persistentHistoryFetch {date: %{public}@}", a5, a6, a7, a8, 2u);
}

- (void)persistenceStoreIDForAccountID:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "xpc error while using debug performer {error: %{public}@, store: %@}");
}

- (void)_performChangeTrackingWithReason:(os_log_t)log block:xpcErrorHandler:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!changeTrackingPerformer) -- Returned nil for both error and changeTrackingPerformer", v1, 2u);
}

void __76__REMChangeTracking__performChangeTrackingWithReason_block_xpcErrorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "xpc error while using changeTracking performer {error: %{public}@, store: %@}");
}

@end