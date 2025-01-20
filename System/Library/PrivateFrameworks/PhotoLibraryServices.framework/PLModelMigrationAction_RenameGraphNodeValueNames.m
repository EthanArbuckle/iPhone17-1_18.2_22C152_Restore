@interface PLModelMigrationAction_RenameGraphNodeValueNames
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RenameGraphNodeValueNames

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v40[9] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 1;
  v7 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:2 pendingParentUnitCount:2];
  v39[0] = @"CustomTitle";
  v39[1] = @"ManualOrder";
  v40[0] = @"customTitle";
  v40[1] = @"manualOrder";
  v39[2] = @"AutomaticOrder";
  v39[3] = @"VerifiedType";
  v40[2] = @"automaticOrder";
  v40[3] = @"socialGroupVerifiedType";
  v39[4] = @"Label";
  v39[5] = @"Identifier";
  v40[4] = @"label";
  v40[5] = @"identifier";
  v39[6] = @"Type";
  v39[7] = @"RankingScore";
  v40[6] = @"type";
  v40[7] = @"rankingScore";
  v39[8] = @"SynonymsString";
  v40[8] = @"synonymsString";
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:9];
  [v7 becomeCurrentWithPendingUnitCount:1];
  v8 = (void *)MEMORY[0x1E4F1C0D0];
  v9 = +[PLGraphNodeValue entityName];
  v10 = [v8 fetchRequestWithEntityName:v9];

  id v34 = 0;
  v11 = [v6 executeFetchRequest:v10 error:&v34];
  id v12 = v34;
  if (v11)
  {
    v23 = [PLEnumerateAndSaveController alloc];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = [(PLModelMigrationActionCore *)self pathManager];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke;
    v32[3] = &unk_1E586FB88;
    id v33 = v6;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke_2;
    v30[3] = &unk_1E586AA58;
    id v31 = v7;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke_3;
    v26[3] = &unk_1E5869F40;
    id v27 = v31;
    v29 = &v35;
    id v28 = v24;
    v16 = [(PLEnumerateAndSaveController *)v23 initWithName:v14 fetchRequest:v10 context:v33 pathManager:v15 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v32 didFetchObjectIDsBlock:v30 processResultBlock:v26];

    id v25 = v12;
    [(PLEnumerateAndSaveController *)v16 processObjectsWithError:&v25];
    id v17 = v25;

    id v12 = v17;
  }
  else
  {
    v36[3] = 3;
  }
  [v7 resignCurrent];
  uint64_t v18 = v36[3];
  id v19 = v12;
  v20 = v19;
  if (v18 != 1 && a4) {
    *a4 = v19;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v21 = v36[3];

  _Block_object_dispose(&v35, 8);
  return v21;
}

@end