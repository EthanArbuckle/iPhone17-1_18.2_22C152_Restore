@interface PLModelMigrationAction_UpdateDayHighlightDateTitles
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_UpdateDayHighlightDateTitles

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v8 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v7);

  v9 = (void *)MEMORY[0x1E4F1C0D0];
  v10 = +[PLPhotosHighlight entityName];
  v11 = [v9 fetchRequestWithEntityName:v10];

  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v32[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v11 setSortDescriptors:v13];

  v14 = (void *)MEMORY[0x1E4F28BA0];
  v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %u", @"kind", 0);
  v31[0] = v15;
  if (v8) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v8];
  }
  else {
  v16 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v31[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v18 = [v14 andPredicateWithSubpredicates:v17];
  [v11 setPredicate:v18];

  v30[0] = @"assets";
  v30[1] = @"extendedAssets";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  [v11 setRelationshipKeyPathsForPrefetching:v19];

  v20 = objc_alloc_init(PLDateRangeTitleGenerator);
  id v29 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __99__PLModelMigrationAction_UpdateDayHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke;
  v27[3] = &unk_1E5862408;
  v21 = v20;
  v28 = v21;
  int64_t v22 = +[PLModelMigrationActionUtility processManagedObjectWithAction:self managedObjectContext:v6 fetchRequest:v11 useObjectIDResumeMarker:1 error:&v29 processingBlock:v27];
  id v23 = v29;
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  id v24 = v23;
  v25 = v24;
  if (v22 != 1 && a4) {
    *a4 = v24;
  }

  return v22;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end