@interface PLModelMigrationAction_RemoveInvalidExtendedAttributesDateTimezone
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveInvalidExtendedAttributesDateTimezone

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v77[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28BA0];
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a3;
  v7 = objc_msgSend(v5, "predicateWithFormat:", @"%K = nil", @"dateCreated");
  v77[0] = v7;
  v8 = (void *)MEMORY[0x1E4F28BA0];
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"timezoneName");
  v76[0] = v9;
  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"timezoneOffset");
  v76[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  v12 = [v8 orPredicateWithSubpredicates:v11];
  v77[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
  v14 = [v4 andPredicateWithSubpredicates:v13];

  v74[0] = @"timezoneName";
  uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  v74[1] = @"timezoneOffset";
  v75[0] = v15;
  v16 = [MEMORY[0x1E4F1CA98] null];
  v75[1] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];

  v18 = +[PLExtendedAttributes entityName];
  id v38 = 0;
  LOBYTE(v15) = +[PLModelMigrator executeBatchUpdateWithEntityName:v18 predicate:v14 propertiesToUpdate:v17 managedObjectContext:v6 error:&v38];

  id v19 = v38;
  if (v15)
  {
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v20 = v19;
    if (a4) {
      *a4 = v20;
    }
    int64_t v21 = 1;
  }
  else
  {
    v22 = PLMigrationGetLog();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

    if (v23)
    {
      v24 = [(PLModelMigrationActionCore *)self logger];

      if (v24)
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        memset(buf, 0, sizeof(buf));
        v25 = PLMigrationGetLog();
        os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
        v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        int v39 = 138543618;
        v40 = v27;
        __int16 v41 = 2114;
        id v42 = v19;
        LODWORD(v35) = 22;
        v28 = (uint8_t *)_os_log_send_and_compose_impl();

        v29 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_16000.m", 294, 16);

        if (v28 != buf) {
          free(v28);
        }
      }
      else
      {
        v30 = PLMigrationGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v19;
          _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Failed to execute batch update request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v33 = v19;
    int64_t v21 = 3;
  }

  return v21;
}

@end