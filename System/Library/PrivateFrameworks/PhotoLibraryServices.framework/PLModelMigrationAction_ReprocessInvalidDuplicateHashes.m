@interface PLModelMigrationAction_ReprocessInvalidDuplicateHashes
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (int64_t)removeDuplicateHashesAndResetAlbumsWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ReprocessInvalidDuplicateHashes

- (int64_t)removeDuplicateHashesAndResetAlbumsWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v35[3] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v27 = a3;
  v5 = +[PLDuplicateDetectorExactPixel invalidHashData];
  uint64_t v6 = [v4 setWithArray:v5];

  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLManagedAsset entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) = %d", @"kind", 0);
  v35[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) != %d", @"additionalAttributes.sceneAnalysisVersion", 0);
  v35[1] = v12;
  v13 = (void *)MEMORY[0x1E4F28BA0];
  v26 = (void *)v6;
  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(%K) IN %@", @"additionalAttributes.sceneprint.duplicateMatchingData", v6];
  v34[0] = v14;
  v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(%K) IN %@", @"additionalAttributes.sceneprint.duplicateMatchingAlternateData", v6];
  v34[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v17 = [v13 orPredicateWithSubpredicates:v16];
  v35[2] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  v19 = [v10 andPredicateWithSubpredicates:v18];
  [v9 setPredicate:v19];

  v33[0] = @"albums";
  v33[1] = @"additionalAttributes";
  v33[2] = @"additionalAttributes.sceneprint";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  [v9 setRelationshipKeyPathsForPrefetching:v20];

  id v32 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __124__PLModelMigrationAction_ReprocessInvalidDuplicateHashes_removeDuplicateHashesAndResetAlbumsWithManagedObjectContext_error___block_invoke;
  v30[3] = &unk_1E586A1C0;
  id v21 = v26;
  id v31 = v21;
  int64_t v22 = +[PLModelMigrationActionUtility processManagedObjectsWithAction:self managedObjectContext:v27 fetchRequest:v9 pendingParentUnitCount:0 error:&v32 processingBlock:v30];

  id v23 = v32;
  v24 = v23;
  if (v22 != 1 && a4) {
    *a4 = v23;
  }

  return v22;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v10 = 0;
  int64_t v6 = [(PLModelMigrationAction_ReprocessInvalidDuplicateHashes *)self removeDuplicateHashesAndResetAlbumsWithManagedObjectContext:a3 error:&v10];
  id v7 = v10;
  v8 = v7;
  if (v6 != 1 && a4) {
    *a4 = v7;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return v6;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end