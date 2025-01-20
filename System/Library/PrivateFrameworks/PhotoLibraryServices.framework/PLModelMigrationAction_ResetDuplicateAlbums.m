@interface PLModelMigrationAction_ResetDuplicateAlbums
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetDuplicateAlbums

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[PLManagedAsset fetchRequest];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"duplicateAssetVisibilityState", 0);
  [v7 setPredicate:v8];

  [v7 setFetchBatchSize:100];
  int64_t v9 = +[PLModelMigrationActionUtility removeFromDuplicatesWithAction:self managedObjectContext:v6 fetchRequest:v7 requiresTokenReset:1 error:a4];

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return v9;
}

@end