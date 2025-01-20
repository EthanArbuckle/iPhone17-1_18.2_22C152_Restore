@interface PLModelMigrationAction_RemoveLegacyImportedAssetsFromDuplicateAlbums
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveLegacyImportedAssetsFromDuplicateAlbums

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[PLManagedAsset fetchRequest];
  v8 = (void *)MEMORY[0x1E4F28BA0];
  v9 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForFinderSyncedAsset"), 0);
  v17[0] = v9;
  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"duplicateAssetVisibilityState", 0);
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v12 = [v8 andPredicateWithSubpredicates:v11];
  [v7 setPredicate:v12];

  v16 = @"albums";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v7 setRelationshipKeyPathsForPrefetching:v13];

  [v7 setFetchBatchSize:100];
  int64_t v14 = +[PLModelMigrationActionUtility removeFromDuplicatesWithAction:self managedObjectContext:v6 fetchRequest:v7 requiresTokenReset:0 error:a4];

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return v14;
}

@end