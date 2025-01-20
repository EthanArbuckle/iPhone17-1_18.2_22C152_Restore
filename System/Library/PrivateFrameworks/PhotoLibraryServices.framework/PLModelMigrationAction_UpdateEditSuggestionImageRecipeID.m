@interface PLModelMigrationAction_UpdateEditSuggestionImageRecipeID
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_UpdateEditSuggestionImageRecipeID

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[PLInternalResource fetchRequest];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"recipeID", 66136);
  [v7 setPredicate:v8];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v16[4] = &v18;
  id v17 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __104__PLModelMigrationAction_UpdateEditSuggestionImageRecipeID_performActionWithManagedObjectContext_error___block_invoke;
  v16[3] = &unk_1E586A210;
  int64_t v9 = +[PLModelMigrationActionUtility processManagedObjectsWithAction:self managedObjectContext:v6 fetchRequest:v7 pendingParentUnitCount:0 error:&v17 processingBlock:v16];
  id v10 = v17;
  v11 = PLMigrationGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v19[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "PLModelMigrationAction_UpdateEditSuggestionImageRecipeID: updated %ld resources.", buf, 0xCu);
  }

  id v13 = v10;
  v14 = v13;
  if (v9 != 1 && a4) {
    *a4 = v13;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  _Block_object_dispose(&v18, 8);

  return v9;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end