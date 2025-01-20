@interface PLModelMigrationAction_RemoveAllPurgeableClones
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (int64_t)removePurgableClonesForAssetUUID:(id)a3 withMOC:(id)a4 error:(id *)a5;
@end

@implementation PLModelMigrationAction_RemoveAllPurgeableClones

- (int64_t)removePurgableClonesForAssetUUID:(id)a3 withMOC:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = a4;
  id v9 = a3;
  v10 = +[PLManagedAsset entityName];
  v11 = [v7 fetchRequestWithEntityName:v10];

  v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uuid", v9];

  [v11 setPredicate:v12];
  id v19 = 0;
  v13 = [v8 executeFetchRequest:v11 error:&v19];

  id v14 = v19;
  v15 = v14;
  if (v13)
  {
    v16 = [v13 firstObject];
    if ([v16 isReadyForPurgeSyndicationResources]) {
      [v16 purgeSyndicationResourcesAfterMediaAnalysisProcessing];
    }

    int64_t v17 = 1;
  }
  else
  {
    if (a5) {
      *a5 = v14;
    }
    int64_t v17 = 3;
  }

  return v17;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 1;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1142;
  v36 = __Block_byref_object_dispose__1143;
  id v37 = 0;
  v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];
  uint64_t v9 = [v8 length];

  id v10 = objc_alloc(MEMORY[0x1E4F8B910]);
  v11 = [(PLModelMigrationActionBackground *)self pathManager];
  v12 = [v11 photoDirectoryWithType:26];
  v13 = (void *)[v10 initWithFilePath:v12];

  v42[0] = *MEMORY[0x1E4F1C660];
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __95__PLModelMigrationAction_RemoveAllPurgeableClones_performActionWithManagedObjectContext_error___block_invoke;
  v25 = &unk_1E58622D0;
  v26 = self;
  v29 = &v38;
  v30 = &v32;
  id v15 = v14;
  id v27 = v15;
  uint64_t v31 = v9;
  id v16 = v6;
  id v28 = v16;
  [v13 visitURLsLoadingPropertiesForKeys:v15 withBlock:&v22];
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  uint64_t v17 = v39[3];
  id v18 = (id)v33[5];
  id v19 = v18;
  if (v17 != 1 && a4) {
    *a4 = v18;
  }

  int64_t v20 = v39[3];
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v20;
}

+ (int64_t)actionProgressWeight
{
  return 400;
}

@end