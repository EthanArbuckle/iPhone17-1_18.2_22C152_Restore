@interface PLModelMigrationAction_AddMissingExtendedAttributeDigitalZoomRatio
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_AddMissingExtendedAttributeDigitalZoomRatio

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v7 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v5, v6);

  v8 = (void *)MEMORY[0x1E4F1C0D0];
  v9 = +[PLManagedAsset entityName];
  v10 = [v8 fetchRequestWithEntityName:v9];

  v11 = (void *)MEMORY[0x1E4F28BA0];
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"extendedAttributes");
  v26[0] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"extendedAttributes.digitalZoomRatio");
  v26[1] = v13;
  v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
  v26[2] = v14;
  if (v7) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v7];
  }
  else {
  v15 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v26[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  v17 = [v11 andPredicateWithSubpredicates:v16];
  [v10 setPredicate:v17];

  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v25 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [v10 setSortDescriptors:v19];

  id v24 = 0;
  int64_t v20 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:self managedObjectContext:v5 fetchRequest:v10 useObjectIDResumeMarker:1 error:&v24];
  id v21 = v24;
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  if (a4) {
    *a4 = v21;
  }

  return v20;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end