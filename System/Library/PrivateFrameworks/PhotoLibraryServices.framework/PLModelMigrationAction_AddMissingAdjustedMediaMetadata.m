@interface PLModelMigrationAction_AddMissingAdjustedMediaMetadata
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_AddMissingAdjustedMediaMetadata

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionBackground *)self databaseContext];
  v8 = (void *)[v7 newShortLivedLibraryWithName:"-[PLModelMigrationAction_AddMissingAdjustedMediaMetadata performActionWithManagedObjectContext:error:]"];

  v9 = [v8 libraryServicesManager];
  if (([v9 isCloudPhotoLibraryEnabled] & 1) != 0
    || [(PLModelMigrationAction_AddMissingAdjustedMediaMetadata *)self isUnitTestingWithLibraryServiceManager:v9])
  {
    v10 = [(PLModelMigrationActionBackground *)self resumeMarker];
    id v42 = v6;
    v11 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v10);

    v12 = (void *)MEMORY[0x1E4F1C0D0];
    v13 = +[PLManagedAsset entityName];
    v14 = [v12 fetchRequestWithEntityName:v13];

    v15 = (void *)MEMORY[0x1E4F28BA0];
    v16 = +[PLManagedAsset predicateForAdjustedAssetsWithKeyPathToAsset:0];
    v46[0] = v16;
    v41 = v8;
    if (v11) {
      [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v11];
    }
    else {
    v17 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
    v46[1] = v17;
    v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NULL", @"additionalAttributes.mediaMetadata");
    v46[2] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
    v20 = [v15 andPredicateWithSubpredicates:v19];
    [v14 setPredicate:v20];

    v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
    v45 = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    [v14 setSortDescriptors:v22];

    v44[0] = @"additionalAttributes";
    v44[1] = @"additionalAttributes.mediaMetadata";
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    [v14 setRelationshipKeyPathsForPrefetching:v23];

    id v43 = 0;
    id v6 = v42;
    int64_t v24 = +[PLModelMigrationActionUtility processManagedObjectWithAction:self managedObjectContext:v42 fetchRequest:v14 useObjectIDResumeMarker:1 error:&v43 processingBlock:&__block_literal_global_432];
    id v25 = v43;
    [(PLModelMigrationActionBackground *)self finalizeProgress];
    id v26 = v25;
    v27 = v26;
    if (v24 != 1 && a4) {
      *a4 = v26;
    }

    v8 = v41;
  }
  else
  {
    v28 = PLMigrationGetLog();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);

    if (v29)
    {
      v30 = [(PLModelMigrationActionBackground *)self logger];

      if (v30)
      {
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        *(_OWORD *)buf = 0u;
        long long v50 = 0u;
        v31 = PLMigrationGetLog();
        os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        int v47 = 138543362;
        v48 = v33;
        LODWORD(v40) = 12;
        v34 = (uint8_t *)_os_log_send_and_compose_impl();

        v35 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActionBackground.m", 1336, 1);

        if (v34 != buf) {
          free(v34);
        }
      }
      else
      {
        v36 = PLMigrationGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v38;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_INFO, "Skipping action %{public}@ based on CPL state", buf, 0xCu);
        }
      }
    }
    [(PLModelMigrationActionBackground *)self finalizeProgress];
    int64_t v24 = 1;
  }

  return v24;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end