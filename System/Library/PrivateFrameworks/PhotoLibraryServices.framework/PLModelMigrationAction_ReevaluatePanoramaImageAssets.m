@interface PLModelMigrationAction_ReevaluatePanoramaImageAssets
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ReevaluatePanoramaImageAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v8 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v7);

  v9 = (void *)MEMORY[0x1E4F1C0D0];
  v10 = +[PLManagedAsset entityName];
  v11 = [v9 fetchRequestWithEntityName:v10];

  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
  if (v8)
  {
    v13 = (void *)MEMORY[0x1E4F28BA0];
    v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v8];
    v26[0] = v14;
    v26[1] = v12;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v16 = [v13 andPredicateWithSubpredicates:v15];

    v12 = (void *)v16;
  }
  [v11 setPredicate:v12];
  v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v25 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [v11 setSortDescriptors:v18];

  v24 = @"master.mediaMetadata";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [v11 setRelationshipKeyPathsForPrefetching:v19];

  [v11 setFetchBatchSize:100];
  id v23 = 0;
  int64_t v20 = +[PLModelMigrationActionUtility processManagedObjectWithAction:self managedObjectContext:v6 fetchRequest:v11 useObjectIDResumeMarker:1 error:&v23 processingBlock:&__block_literal_global_1227];
  id v21 = v23;
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  if (a4) {
    *a4 = v21;
  }

  return v20;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end