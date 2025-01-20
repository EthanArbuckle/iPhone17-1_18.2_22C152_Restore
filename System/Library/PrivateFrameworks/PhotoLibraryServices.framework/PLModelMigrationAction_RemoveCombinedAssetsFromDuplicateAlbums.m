@interface PLModelMigrationAction_RemoveCombinedAssetsFromDuplicateAlbums
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveCombinedAssetsFromDuplicateAlbums

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[PLManagedAsset fetchRequest];
  v7 = (void *)MEMORY[0x1E4F28BA0];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"duplicateAssetVisibilityState", 0);
  v20[0] = v8;
  v9 = (void *)MEMORY[0x1E4F28BA0];
  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"kindSubtype", 10);
  v19[0] = v10;
  v11 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForDuplicateProcessingExclusions"), 0);
  v19[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v13 = [v9 orPredicateWithSubpredicates:v12];
  v20[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v15 = [v7 andPredicateWithSubpredicates:v14];
  [v6 setPredicate:v15];

  [v6 setFetchBatchSize:100];
  int64_t v16 = +[PLModelMigrationActionUtility removeFromDuplicatesWithAction:self managedObjectContext:v5 fetchRequest:v6 requiresTokenReset:1 error:a4];

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return v16;
}

@end