@interface PLModelMigrationAction_FixExtendedAttributeDateCreated
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixExtendedAttributeDateCreated

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v28 = self;
  v6 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v31 = v5;
  uint64_t v7 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v5, v6);

  v8 = (void *)MEMORY[0x1E4F1C0D0];
  v9 = +[PLManagedAsset entityName];
  v10 = [v8 fetchRequestWithEntityName:v9];

  v11 = (void *)MEMORY[0x1E4F28BA0];
  v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"additionalAttributes.dateCreatedSource", &unk_1EEBF13E8];
  v35[0] = v27;
  v12 = (void *)MEMORY[0x1E4F28BA0];
  v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"extendedAttributes.dateCreated");
  v34[0] = v13;
  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"additionalAttributes.dateCreatedSource", &unk_1EEBF1400];
  v34[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v16 = [v12 andPredicateWithSubpredicates:v15];
  v35[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v18 = [v11 orPredicateWithSubpredicates:v17];
  v36[0] = v18;
  v29 = (void *)v7;
  if (v7) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v7];
  }
  else {
  v19 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v36[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v21 = [v11 andPredicateWithSubpredicates:v20];
  [v10 setPredicate:v21];

  v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v33 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  [v10 setSortDescriptors:v23];

  id v32 = 0;
  int64_t v24 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:v28 managedObjectContext:v31 fetchRequest:v10 useObjectIDResumeMarker:1 error:&v32];
  id v25 = v32;
  [(PLModelMigrationActionBackground *)v28 finalizeProgress];
  if (a4) {
    *a4 = v25;
  }

  return v24;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end