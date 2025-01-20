@interface PLModelMigrationAction_UpdateDuplicateProcessingStateScreenshot
+ (int64_t)actionProgressWeight;
- (id)fetchRequestForScreenshot;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_UpdateDuplicateProcessingStateScreenshot

- (id)fetchRequestForScreenshot
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v2 = +[PLSceneClassification fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = (void *)MEMORY[0x1E4F28F60];
  v5 = +[PLSceneClassification PLJunkSceneClassificationIDForLabel:@"screenshot"];
  v6 = [v4 predicateWithFormat:@"%K == %@", @"sceneIdentifier", v5];
  v13[0] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %lf", @"confidence", 0x3FE28F5C28F5C28FLL);
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v9 = [v3 andPredicateWithSubpredicates:v8];
  [v2 setPredicate:v9];

  v12 = @"assetAttributes.asset";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v2 setRelationshipKeyPathsForPrefetching:v10];

  [v2 setFetchBatchSize:100];
  return v2;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PLModelMigrationActionCore *)self progress];
  uint64_t v8 = [v7 totalUnitCount] / 7;

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v10 = [(PLModelMigrationAction_UpdateDuplicateProcessingStateScreenshot *)self fetchRequestForScreenshot];
  id v20 = 0;
  int64_t v11 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self updateSceneClassificationDuplicateProcessingStateWithProcessingState:64 pendingParentUnitCount:v8 assetProcessingStateMap:v9 context:v6 request:v10 error:&v20];
  id v12 = v20;

  if (v11 == 1)
  {
    if ([v9 count])
    {
      v13 = (void *)MEMORY[0x19F38D3B0]();
      id v19 = v12;
      int64_t v11 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self processAssetStateMap:v9 pendingParentUnitCount:v8 context:v6 error:&v19];
      id v14 = v19;

      id v12 = v14;
    }
    else
    {
      int64_t v11 = 1;
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v15 = v12;
  v16 = v15;
  if (v11 != 1 && a4 != 0) {
    *a4 = v15;
  }

  return v11;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end