@interface PLModelMigrationAction_AddMissingExtendedAttributeFocalLengthIn35mm
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_AddMissingExtendedAttributeFocalLengthIn35mm

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v8 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v7);

  v9 = (void *)MEMORY[0x1E4F1C0D0];
  v10 = +[PLManagedAsset entityName];
  v11 = [v9 fetchRequestWithEntityName:v10];

  v12 = (void *)MEMORY[0x1E4F28BA0];
  v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"extendedAttributes");
  v25[0] = v13;
  v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"extendedAttributes.focalLengthIn35mm");
  v25[1] = v14;
  if (v8) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v8];
  }
  else {
  v15 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v25[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  v17 = [v12 andPredicateWithSubpredicates:v16];
  [v11 setPredicate:v17];

  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v24 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [v11 setSortDescriptors:v19];

  id v23 = 0;
  int64_t v20 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:self managedObjectContext:v6 fetchRequest:v11 useObjectIDResumeMarker:1 error:&v23];
  id v21 = v23;
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