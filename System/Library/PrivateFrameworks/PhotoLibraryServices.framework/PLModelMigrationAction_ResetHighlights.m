@interface PLModelMigrationAction_ResetHighlights
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetHighlights

+ (int64_t)actionProgressWeight
{
  return 500;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [PLMomentGenerationDataManager alloc];
  v8 = [(PLModelMigrationActionCore *)self pathManager];
  v9 = [(PLMomentGenerationDataManager *)v7 initWithManagedObjectContext:v6 pathManagerForLightweightMigration:v8];

  v10 = [(PLMomentGenerationDataManager *)v9 generator];
  +[PLMomentGenerationDataManager setManagerMomentarilyBlessed:v9];
  if (v10)
  {
    uint64_t v23 = PLMomentGenerationShouldDeleteAllHighlightsKey;
    v24[0] = MEMORY[0x1E4F1CC38];
    int64_t v11 = 1;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __86__PLModelMigrationAction_ResetHighlights_performActionWithManagedObjectContext_error___block_invoke;
    v19[3] = &unk_1E5875CE0;
    v20 = v13;
    v14 = v13;
    [v10 rebuildAllHighlightsWithOptions:v12 completionHandler:v19];
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F8C500];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22 = @"Failed to obtain moment generator";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v12 = [v15 errorWithDomain:v16 code:41001 userInfo:v17];

    if (a4)
    {
      id v12 = v12;
      *a4 = v12;
    }
    int64_t v11 = 3;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return v11;
}

@end