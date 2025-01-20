@interface PLModelMigrationAction_AddMissingExtendedAttributeDateTimezone
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_AddMissingExtendedAttributeDateTimezone

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v29 = self;
  v6 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v32 = v5;
  uint64_t v7 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v5, v6);

  v8 = (void *)MEMORY[0x1E4F1C0D0];
  v9 = +[PLManagedAsset entityName];
  v10 = [v8 fetchRequestWithEntityName:v9];

  v11 = (void *)MEMORY[0x1E4F28BA0];
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"extendedAttributes");
  v36[0] = v12;
  v13 = (void *)MEMORY[0x1E4F28BA0];
  v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"extendedAttributes.dateCreated");
  v35[0] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"extendedAttributes.timezoneName");
  v35[1] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"extendedAttributes.timezoneOffset");
  v35[2] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  uint64_t v18 = [v13 orPredicateWithSubpredicates:v17];
  v19 = (void *)v7;
  v20 = (void *)v18;
  v36[1] = v18;
  v30 = v19;
  if (v19) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v19];
  }
  else {
  v21 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v36[2] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  v23 = [v11 andPredicateWithSubpredicates:v22];
  [v10 setPredicate:v23];

  v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v34 = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  [v10 setSortDescriptors:v25];

  id v33 = 0;
  int64_t v26 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:v29 managedObjectContext:v32 fetchRequest:v10 useObjectIDResumeMarker:1 error:&v33];
  id v27 = v33;
  [(PLModelMigrationActionBackground *)v29 finalizeProgress];
  if (a4) {
    *a4 = v27;
  }

  return v26;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end