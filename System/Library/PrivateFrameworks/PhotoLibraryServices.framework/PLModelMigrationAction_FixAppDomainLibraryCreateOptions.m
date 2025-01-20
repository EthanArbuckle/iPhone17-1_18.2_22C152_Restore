@interface PLModelMigrationAction_FixAppDomainLibraryCreateOptions
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixAppDomainLibraryCreateOptions

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionCore *)self pathManager];
  v8 = [v7 libraryURL];

  if (!v8)
  {
    v21 = PLMigrationGetLog();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
      v23 = [(PLModelMigrationActionCore *)self logger];

      if (v23)
      {
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        *(_OWORD *)buf = 0u;
        long long v84 = 0u;
        v24 = PLMigrationGetLog();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        LOWORD(v81) = 0;
        LODWORD(v76) = 2;
        v25 = (uint8_t *)_os_log_send_and_compose_impl();

        v26 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 1287, 16);

        if (v25 != buf) {
          free(v25);
        }
      }
      else
      {
        v55 = PLMigrationGetLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_ERROR, "Failed to update create options, missing libraryURL", buf, 2u);
        }
      }
    }
    v56 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v57 = *MEMORY[0x1E4F8C500];
    uint64_t v79 = *MEMORY[0x1E4F28228];
    v80 = @"Missing required libraryURL";
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    v12 = [v56 errorWithDomain:v57 code:41001 userInfo:v58];

    if (MEMORY[0x19F38BDA0]())
    {
      v39 = v12;
      goto LABEL_61;
    }
    v59 = PLMigrationGetLog();
    BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);

    if (!v60)
    {
LABEL_53:
      [(PLModelMigrationActionCore *)self finalizeProgress];
      v70 = v12;
      int64_t v71 = 1;
      goto LABEL_64;
    }
    v61 = [(PLModelMigrationActionCore *)self logger];

    if (v61)
    {
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      *(_OWORD *)buf = 0u;
      long long v84 = 0u;
      v62 = PLMigrationGetLog();
      os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
      LOWORD(v81) = 0;
      LODWORD(v76) = 2;
      v63 = (uint8_t *)_os_log_send_and_compose_impl();

      v64 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v64, "logWithMessage:fromCodeLocation:type:", v63, "PLModelMigrationActions_18000.m", 1296, 0);

      if (v63 != buf) {
        free(v63);
      }
      goto LABEL_53;
    }
    v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring failure for non-internal device to avoid unecessary rebuild due to unexpected conditions", buf, 2u);
    }
    goto LABEL_52;
  }
  v9 = [(PLModelMigrationActionCore *)self pathManager];
  v10 = [v9 libraryURL];
  id v78 = 0;
  v11 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v10 createIfMissing:0 error:&v78];
  v12 = v78;

  if ([v11 domain] != 3)
  {
    v27 = PLMigrationGetLog();
    v28 = v27;
    if (v11)
    {
      BOOL v29 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      if (v29)
      {
        v30 = [(PLModelMigrationActionCore *)self logger];

        if (v30)
        {
          long long v113 = 0u;
          long long v114 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          *(_OWORD *)buf = 0u;
          long long v84 = 0u;
          v31 = PLMigrationGetLog();
          os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
          int v81 = 138412290;
          v82 = v11;
          LODWORD(v76) = 12;
          v32 = (uint8_t *)_os_log_send_and_compose_impl();

          v33 = [(PLModelMigrationActionCore *)self logger];
          v34 = v33;
          v35 = v32;
          uint64_t v36 = 1281;
          uint64_t v37 = 0;
          goto LABEL_24;
        }
        v65 = PLMigrationGetLog();
        if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_51;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v11;
        v66 = "Skipping non-app library %@";
        v67 = v65;
        os_log_type_t v68 = OS_LOG_TYPE_DEFAULT;
LABEL_50:
        _os_log_impl(&dword_19B3C7000, v67, v68, v66, buf, 0xCu);
LABEL_51:
      }
    }
    else
    {
      BOOL v47 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (v47)
      {
        v48 = [(PLModelMigrationActionCore *)self logger];

        if (v48)
        {
          long long v113 = 0u;
          long long v114 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          *(_OWORD *)buf = 0u;
          long long v84 = 0u;
          v49 = PLMigrationGetLog();
          os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
          int v81 = 138412290;
          v82 = v12;
          LODWORD(v76) = 12;
          v32 = (uint8_t *)_os_log_send_and_compose_impl();

          v33 = [(PLModelMigrationActionCore *)self logger];
          v34 = v33;
          v35 = v32;
          uint64_t v36 = 1283;
          uint64_t v37 = 16;
LABEL_24:
          objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v35, "PLModelMigrationActions_18000.m", v36, v37);

          if (v32 != buf) {
            free(v32);
          }
          goto LABEL_52;
        }
        v65 = PLMigrationGetLog();
        if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          goto LABEL_51;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v12;
        v66 = "Failed to update create options, missing library identifier (%@)";
        v67 = v65;
        os_log_type_t v68 = OS_LOG_TYPE_ERROR;
        goto LABEL_50;
      }
    }
LABEL_52:

    goto LABEL_53;
  }
  v13 = [[PLGlobalValues alloc] initWithManagedObjectContext:v6];
  uint64_t v14 = [(PLGlobalValues *)v13 libraryCreateOptions];
  if ((~(_BYTE)v14 & 0x73) == 0)
  {
    v15 = PLMigrationGetLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      v17 = [(PLModelMigrationActionCore *)self logger];

      if (v17)
      {
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        *(_OWORD *)buf = 0u;
        long long v84 = 0u;
        v18 = PLMigrationGetLog();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        LOWORD(v81) = 0;
        LODWORD(v76) = 2;
        v19 = (uint8_t *)_os_log_send_and_compose_impl();

        v20 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v20, "logWithMessage:fromCodeLocation:type:", v19, "PLModelMigrationActions_18000.m", 1278, 0);

        if (v19 != buf) {
          free(v19);
        }
      }
      else
      {
        v69 = PLMigrationGetLog();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_DEFAULT, "Library has all required create options", buf, 2u);
        }
      }
    }
    v39 = v12;
LABEL_47:

    v12 = v39;
    goto LABEL_53;
  }
  +[PLGlobalValues setLibraryCreateOptions:v14 | 0x73 managedObjectContext:v6];
  v77 = v12;
  int v38 = [v6 save:&v77];
  v39 = v77;

  v40 = PLMigrationGetLog();
  v41 = v40;
  if (v38)
  {
    BOOL v42 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

    if (v42)
    {
      v43 = [(PLModelMigrationActionCore *)self logger];

      if (v43)
      {
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        *(_OWORD *)buf = 0u;
        long long v84 = 0u;
        v44 = PLMigrationGetLog();
        os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
        LOWORD(v81) = 0;
        LODWORD(v76) = 2;
        v45 = (uint8_t *)_os_log_send_and_compose_impl();

        v46 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v46, "logWithMessage:fromCodeLocation:type:", v45, "PLModelMigrationActions_18000.m", 1271, 0);

        if (v45 != buf) {
          free(v45);
        }
      }
      else
      {
        v72 = PLMigrationGetLog();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v72, OS_LOG_TYPE_DEFAULT, "Fixed app library create options to disable unsupported services", buf, 2u);
        }
      }
    }
    goto LABEL_47;
  }
  BOOL v50 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

  if (v50)
  {
    v51 = [(PLModelMigrationActionCore *)self logger];

    if (v51)
    {
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      *(_OWORD *)buf = 0u;
      long long v84 = 0u;
      v52 = PLMigrationGetLog();
      os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
      int v81 = 138412290;
      v82 = v39;
      LODWORD(v76) = 12;
      v53 = (uint8_t *)_os_log_send_and_compose_impl();

      v54 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v54, "logWithMessage:fromCodeLocation:type:", v53, "PLModelMigrationActions_18000.m", 1273, 16);

      if (v53 != buf) {
        free(v53);
      }
    }
    else
    {
      v73 = PLMigrationGetLog();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v39;
        _os_log_impl(&dword_19B3C7000, v73, OS_LOG_TYPE_ERROR, "Failed to update create options, %@", buf, 0xCu);
      }
    }
  }

  MEMORY[0x19F38BDA0]();
LABEL_61:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  v74 = v39;
  v70 = v74;
  if (a4)
  {
    v70 = v74;
    *a4 = v70;
  }
  int64_t v71 = 3;
LABEL_64:

  return v71;
}

@end