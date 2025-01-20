@interface PLModelMigrationAction_updateBrokenStyleableFromRebuild
- (id)buildFetchRequest;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_updateBrokenStyleableFromRebuild

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PLModelMigrationAction_updateBrokenStyleableFromRebuild *)self buildFetchRequest];
  id v15 = 0;
  id v16 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__PLModelMigrationAction_updateBrokenStyleableFromRebuild_performActionWithManagedObjectContext_error___block_invoke;
  v14[3] = &unk_1E586A1C0;
  int64_t v8 = +[PLModelMigrationActionUtility processManagedObjectsWithAction:self managedObjectContext:v6 fetchRequest:v7 pendingParentUnitCount:0 error:&v16 processingBlock:v14];

  id v9 = v16;
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v10 = v9;
  v11 = v10;
  if (v8 != 1 && a4 != 0) {
    *a4 = v10;
  }

  return v8;
}

- (id)buildFetchRequest
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[PLManagedAsset entityName];
  v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"kind", 0);
  v13[0] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %d", @"currentSleetCast", 0);
  v13[1] = v7;
  int64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uniformTypeIdentifier", *MEMORY[0x1E4F443E0]];
  v13[2] = v8;
  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 0", @"additionalAttributes.sleetIsReversible");
  v13[3] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  v11 = [v5 andPredicateWithSubpredicates:v10];
  [v4 setPredicate:v11];

  [v4 setFetchBatchSize:100];
  return v4;
}

@end