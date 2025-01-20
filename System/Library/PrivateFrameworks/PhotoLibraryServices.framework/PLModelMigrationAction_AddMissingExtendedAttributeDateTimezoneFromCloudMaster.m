@interface PLModelMigrationAction_AddMissingExtendedAttributeDateTimezoneFromCloudMaster
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_AddMissingExtendedAttributeDateTimezoneFromCloudMaster

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v38 = self;
  v6 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v41 = v5;
  uint64_t v7 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v5, v6);

  v8 = (void *)MEMORY[0x1E4F1C0D0];
  v9 = +[PLManagedAsset entityName];
  v42 = [v8 fetchRequestWithEntityName:v9];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v37 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"additionalAttributes.dateCreatedSource", &unk_1EEBECD08];
  v48[0] = v37;
  v11 = (void *)MEMORY[0x1E4F28BA0];
  v36 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"additionalAttributes.dateCreatedSource", &unk_1EEBECCF0];
  v47[0] = v36;
  v12 = (void *)MEMORY[0x1E4F28BA0];
  v35 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"extendedAttributes.dateCreated");
  v46[0] = v35;
  v13 = (void *)MEMORY[0x1E4F28BA0];
  v34 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"extendedAttributes.timezoneName");
  v45[0] = v34;
  v33 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"extendedAttributes.timezoneOffset");
  v45[1] = v33;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v31 = objc_msgSend(v13, "andPredicateWithSubpredicates:");
  v46[1] = v31;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  v15 = [v12 orPredicateWithSubpredicates:v14];
  v47[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  v17 = [v11 andPredicateWithSubpredicates:v16];
  v48[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  v19 = v10;
  v20 = [v10 orPredicateWithSubpredicates:v18];
  v49[0] = v20;
  v39 = (void *)v7;
  if (v7) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v7];
  }
  else {
  v21 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v49[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  v23 = [v19 andPredicateWithSubpredicates:v22];
  [v42 setPredicate:v23];

  v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v44 = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  [v42 setSortDescriptors:v25];

  [v42 setFetchBatchSize:100];
  id v43 = 0;
  int64_t v26 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:v38 managedObjectContext:v41 fetchRequest:v42 useObjectIDResumeMarker:1 error:&v43];
  id v27 = v43;
  [(PLModelMigrationActionBackground *)v38 finalizeProgress];
  id v28 = v27;
  v29 = v28;
  if (v26 != 1 && a4) {
    *a4 = v28;
  }

  return v26;
}

+ (int64_t)actionProgressWeight
{
  return 400;
}

@end