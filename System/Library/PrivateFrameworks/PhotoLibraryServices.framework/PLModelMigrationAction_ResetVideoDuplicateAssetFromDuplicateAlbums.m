@interface PLModelMigrationAction_ResetVideoDuplicateAssetFromDuplicateAlbums
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetVideoDuplicateAssetFromDuplicateAlbums

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[PLManagedAsset fetchRequest];
  v8 = (void *)MEMORY[0x1E4F28BA0];
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"duplicateAssetVisibilityState", 0);
  v15[0] = v9;
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"kind", &unk_1EEBEE1A8];
  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v12 = [v8 andPredicateWithSubpredicates:v11];
  [v7 setPredicate:v12];

  [v7 setFetchBatchSize:100];
  int64_t v13 = +[PLModelMigrationActionUtility removeFromDuplicatesWithAction:self managedObjectContext:v6 fetchRequest:v7 requiresTokenReset:1 error:a4];

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return v13;
}

@end