@interface PLModelMigrationAction_AddMissingExtendedAttributeOrientation
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_AddMissingExtendedAttributeOrientation

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v8 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v7);

  v9 = (void *)MEMORY[0x1E4F1C0D0];
  v10 = +[PLManagedAsset entityName];
  v11 = [v9 fetchRequestWithEntityName:v10];

  v12 = (void *)MEMORY[0x1E4F28BA0];
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"kind", &unk_1EEBF1418];
  v24[0] = v13;
  if (v8) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v8];
  }
  else {
  v14 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v24[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v16 = [v12 andPredicateWithSubpredicates:v15];
  [v11 setPredicate:v16];

  v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v23 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  [v11 setSortDescriptors:v18];

  id v22 = 0;
  int64_t v19 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:self managedObjectContext:v6 fetchRequest:v11 useObjectIDResumeMarker:1 error:&v22];
  id v20 = v22;
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  if (a4) {
    *a4 = v20;
  }

  return v19;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end