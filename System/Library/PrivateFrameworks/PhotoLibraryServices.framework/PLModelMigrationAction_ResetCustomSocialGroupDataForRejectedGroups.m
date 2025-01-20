@interface PLModelMigrationAction_ResetCustomSocialGroupDataForRejectedGroups
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetCustomSocialGroupDataForRejectedGroups

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  v19 = (id *)&v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__43798;
  v22 = __Block_byref_object_dispose__43799;
  id v23 = 0;
  v7 = +[PLGraphNode fetchRequest];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"primaryLabelCode", 1000);
  [v7 setPredicate:v8];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  +[PLGraphLabel ensureLabelsAreUpdatedInContext:v6];
  v9 = v19;
  id v10 = v19[5];
  v15[5] = v17;
  id obj = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __114__PLModelMigrationAction_ResetCustomSocialGroupDataForRejectedGroups_performActionWithManagedObjectContext_error___block_invoke;
  v15[3] = &unk_1E586A1E8;
  v15[4] = &v18;
  int64_t v11 = +[PLModelMigrationActionUtility processManagedObjectsWithAction:self managedObjectContext:v6 fetchRequest:v7 pendingParentUnitCount:0 error:&obj processingBlock:v15];
  objc_storeStrong(v9 + 5, obj);
  id v12 = v19[5];
  v13 = v12;
  if (v11 != 1 && a4) {
    *a4 = v12;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(&v18, 8);
  return v11;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end