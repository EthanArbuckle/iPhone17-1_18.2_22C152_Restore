@interface PLModelMigrationAction_RenameSearchEntityGraphNodeValueNames_Label_Type_Identifier
- (int64_t)_renameSearchEntityGraphNodeValueName:(id)a3 toName:(id)a4 inContext:(id)a5 error:(id *)a6;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RenameSearchEntityGraphNodeValueNames_Label_Type_Identifier

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v16 = 0;
  int64_t v7 = [(PLModelMigrationAction_RenameSearchEntityGraphNodeValueNames_Label_Type_Identifier *)self _renameSearchEntityGraphNodeValueName:@"Label" toName:@"searchEntityLabel" inContext:v6 error:&v16];
  id v8 = v16;
  id v9 = v8;
  if (v7 == 1)
  {
    id v15 = v8;
    int64_t v7 = [(PLModelMigrationAction_RenameSearchEntityGraphNodeValueNames_Label_Type_Identifier *)self _renameSearchEntityGraphNodeValueName:@"Type" toName:@"searchEntityType" inContext:v6 error:&v15];
    id v10 = v15;

    if (v7 == 1)
    {
      id v14 = v10;
      int64_t v7 = [(PLModelMigrationAction_RenameSearchEntityGraphNodeValueNames_Label_Type_Identifier *)self _renameSearchEntityGraphNodeValueName:@"Identifier" toName:@"searchEntityIdentifier" inContext:v6 error:&v14];
      id v9 = v14;
    }
    else
    {
      id v9 = v10;
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v11 = v9;
  v12 = v11;
  if (v7 != 1 && a4) {
    *a4 = v11;
  }

  return v7;
}

- (int64_t)_renameSearchEntityGraphNodeValueName:(id)a3 toName:(id)a4 inContext:(id)a5 error:(id *)a6
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v49 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1C0D0];
  id v11 = a3;
  v12 = +[PLGraphNode entityName];
  v13 = [v10 fetchRequestWithEntityName:v12];

  id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"primaryLabelCode", 1100);
  [v13 setPredicate:v14];

  [v13 setResultType:1];
  id v51 = 0;
  v48 = v9;
  id v15 = [v9 executeFetchRequest:v13 error:&v51];
  id v16 = v51;
  if (!v15)
  {
    v17 = PLMigrationGetLog();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v18)
    {
      v19 = [(PLModelMigrationActionCore *)self logger];

      if (v19)
      {
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v20 = PLMigrationGetLog();
        os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        int v52 = 138412290;
        id v53 = v16;
        LODWORD(v46) = 12;
        v21 = (uint8_t *)_os_log_send_and_compose_impl();

        v22 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_18000.m", 1218, 16);

        if (v21 != buf) {
          free(v21);
        }
      }
      else
      {
        v23 = PLMigrationGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v16;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to fetch OIDs for search entity nodes, %@", buf, 0xCu);
        }
      }
    }
  }
  v24 = self;
  v25 = (void *)MEMORY[0x1E4F28BA0];
  v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"node", v15];
  v58[0] = v26;
  v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"valueName", v11];

  v58[1] = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  v29 = [v25 andPredicateWithSubpredicates:v28];

  v56 = @"valueName";
  id v57 = v49;
  int64_t v30 = 1;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  v32 = +[PLGraphNodeValue entityName];
  id v50 = v16;
  LOBYTE(v28) = +[PLModelMigrator executeBatchUpdateWithEntityName:v32 predicate:v29 propertiesToUpdate:v31 managedObjectContext:v48 error:&v50];
  id v33 = v50;

  if ((v28 & 1) == 0)
  {
    v34 = PLMigrationGetLog();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);

    if (v35)
    {
      v36 = [(PLModelMigrationActionCore *)v24 logger];

      if (v36)
      {
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v37 = PLMigrationGetLog();
        os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        int v52 = 138543618;
        id v53 = v39;
        __int16 v54 = 2112;
        id v55 = v33;
        LODWORD(v47) = 22;
        v40 = (uint8_t *)_os_log_send_and_compose_impl();

        v41 = [(PLModelMigrationActionCore *)v24 logger];
        objc_msgSend(v41, "logWithMessage:fromCodeLocation:type:", v40, "PLModelMigrationActions_18000.m", 1229, 16);

        if (v40 != buf) {
          free(v40);
        }
      }
      else
      {
        v42 = PLMigrationGetLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = (objc_class *)objc_opt_class();
          v44 = NSStringFromClass(v43);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v44;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v33;
          _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "Failed to execute batch update request for %{public}@. Error: %@", buf, 0x16u);
        }
      }
    }
    int64_t v30 = 3;
  }

  return v30;
}

@end