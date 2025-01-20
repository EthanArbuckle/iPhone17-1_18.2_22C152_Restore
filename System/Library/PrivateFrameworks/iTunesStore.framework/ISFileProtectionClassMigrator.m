@interface ISFileProtectionClassMigrator
+ (BOOL)isMigrationNeeded;
+ (BOOL)migrate;
+ (void)setMigrationNeededIfNotSet:(BOOL)a3;
@end

@implementation ISFileProtectionClassMigrator

+ (BOOL)isMigrationNeeded
{
  return CFPreferencesGetAppBooleanValue(@"NeedsFileProtectionClassMigration", @"com.apple.itunesstored", 0) != 0;
}

+ (void)setMigrationNeededIfNotSet:(BOOL)a3
{
  BOOL v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(@"NeedsFileProtectionClassMigration", @"com.apple.itunesstored", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    CFPreferencesSetAppValue(@"NeedsFileProtectionClassMigration", (CFPropertyListRef)[NSNumber numberWithBool:v3], @"com.apple.itunesstored");
  }
}

+ (BOOL)migrate
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  v67 = [MEMORY[0x263F7B1F8] sharedStoreServicesConfig];
  v65 = CPSharedResourcesDirectory();
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x2020000000;
  char v92 = 1;
  if (!v65)
  {
    id v49 = v67;
    if (!v49)
    {
      id v49 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v50 = [v49 shouldLog];
    int v51 = [v49 shouldLogToDisk];
    v52 = [v49 OSLogObject];
    v53 = v52;
    if (v51) {
      int v54 = v50 | 2;
    }
    else {
      int v54 = v50;
    }
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
      int v55 = v54;
    }
    else {
      int v55 = v54 & 2;
    }
    if (v55)
    {
      LOWORD(v97) = 0;
      LODWORD(v60) = 2;
      v56 = (void *)_os_log_send_and_compose_impl();

      if (!v56)
      {
LABEL_86:

        BOOL v48 = 0;
        *((unsigned char *)v90 + 24) = 0;
        goto LABEL_88;
      }
      v53 = objc_msgSend(NSString, "stringWithCString:encoding:", v56, 4, &v97, v60);
      free(v56);
      SSFileLog();
    }

    goto LABEL_86;
  }
  v62 = [MEMORY[0x263F08850] defaultManager];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v2 = [&unk_26C6B05F0 countByEnumeratingWithState:&v85 objects:v99 count:16];
  if (!v2) {
    goto LABEL_23;
  }
  uint64_t v3 = *(void *)v86;
  do
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if (*(void *)v86 != v3) {
        objc_enumerationMutation(&unk_26C6B05F0);
      }
      objc_msgSend(v65, "stringByAppendingPathComponent:", *(void *)(*((void *)&v85 + 1) + 8 * i), v58, v60);
      id v5 = objc_claimAutoreleasedReturnValue();
      if ((_set_path_class((const char *)[v5 fileSystemRepresentation], 0) & 0xFFFFFFFD) != 0)
      {
        id v6 = v67;
        if (!v67)
        {
          id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        v7 = v6;
        int v8 = [v6 shouldLog];
        int v9 = [v7 shouldLogToDisk];
        v10 = [v7 OSLogObject];
        v11 = v10;
        if (v9) {
          int v12 = v8 | 2;
        }
        else {
          int v12 = v8;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          int v13 = v12;
        }
        else {
          int v13 = v12 & 2;
        }
        if (v13)
        {
          int v97 = 138543362;
          id v98 = v5;
          LODWORD(v60) = 12;
          v58 = &v97;
          v14 = (void *)_os_log_send_and_compose_impl();

          if (v14)
          {
            v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v97, v60);
            free(v14);
            v58 = (int *)v11;
            SSFileLog();
            goto LABEL_19;
          }
        }
        else
        {
LABEL_19:
        }
        *((unsigned char *)v90 + 24) = 0;
      }
    }
    uint64_t v2 = [&unk_26C6B05F0 countByEnumeratingWithState:&v85 objects:v99 count:16];
  }
  while (v2);
LABEL_23:
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v15 = objc_msgSend(&unk_26C6B0608, "countByEnumeratingWithState:objects:count:", &v81, v96, 16, v58);
  if (!v15) {
    goto LABEL_65;
  }
  uint64_t v61 = *(void *)v82;
  uint64_t v16 = *MEMORY[0x263EFF6A8];
  while (2)
  {
    uint64_t v17 = 0;
    uint64_t v63 = v15;
    while (2)
    {
      if (*(void *)v82 != v61) {
        objc_enumerationMutation(&unk_26C6B0608);
      }
      uint64_t v18 = objc_msgSend(v65, "stringByAppendingPathComponent:", *(void *)(*((void *)&v81 + 1) + 8 * v17), v59, v60);
      v80 = 0;
      v19 = [NSURL fileURLWithPath:v18 isDirectory:1];
      uint64_t v95 = v16;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __40__ISFileProtectionClassMigrator_migrate__block_invoke;
      v77[3] = &unk_264260C58;
      id v21 = v67;
      id v78 = v21;
      v79 = &v89;
      v22 = [v62 enumeratorAtURL:v19 includingPropertiesForKeys:v20 options:0 errorHandler:v77];
      v66 = (void *)v18;
      uint64_t v64 = v17;

      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v73 objects:v94 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v74;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v74 != v25) {
              objc_enumerationMutation(v23);
            }
            v27 = *(void **)(*((void *)&v73 + 1) + 8 * j);
            id v72 = 0;
            if (!objc_msgSend(v27, "getResourceValue:forKey:error:", &v72, v16, &v80, v59))
            {
              id v36 = v21;
              if (!v67)
              {
                id v36 = [MEMORY[0x263F7B1F8] sharedConfig];
              }
              v29 = v36;
              int v37 = [v36 shouldLog];
              int v38 = [v29 shouldLogToDisk];
              v39 = [v29 OSLogObject];
              v40 = v39;
              if (v38) {
                v37 |= 2u;
              }
              if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
                int v41 = v37;
              }
              else {
                int v41 = v37 & 2;
              }
              if (v41)
              {
                int v97 = 138543362;
                id v98 = v80;
                LODWORD(v60) = 12;
                v59 = &v97;
                v42 = (void *)_os_log_send_and_compose_impl();

                if (v42)
                {
                  v40 = objc_msgSend(NSString, "stringWithCString:encoding:", v42, 4, &v97, v60);
                  free(v42);
                  v59 = (int *)v40;
                  SSFileLog();
                  goto LABEL_58;
                }
              }
              else
              {
LABEL_58:
              }
LABEL_59:

              *((unsigned char *)v90 + 24) = 0;
              continue;
            }
            if ([v72 BOOLValue])
            {
              if ((_set_path_class((const char *)[v27 fileSystemRepresentation], 0) & 0xFFFFFFFD) == 0)continue; {
              id v28 = v21;
              }
              if (!v67)
              {
                id v28 = [MEMORY[0x263F7B1F8] sharedConfig];
              }
              v29 = v28;
              int v30 = [v28 shouldLog];
              int v31 = [v29 shouldLogToDisk];
              v32 = [v29 OSLogObject];
              v33 = v32;
              if (v31) {
                v30 |= 2u;
              }
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
                int v34 = v30;
              }
              else {
                int v34 = v30 & 2;
              }
              if (v34)
              {
                int v97 = 138543362;
                id v98 = v66;
                LODWORD(v60) = 12;
                v59 = &v97;
                v35 = (void *)_os_log_send_and_compose_impl();

                if (!v35) {
                  goto LABEL_59;
                }
                v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, &v97, v60);
                free(v35);
                v59 = (int *)v33;
                SSFileLog();
              }

              goto LABEL_59;
            }
            v43 = [v27 path];
            setFileClassC(v43, v21, (unsigned char *)v90 + 24);
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v73 objects:v94 count:16];
        }
        while (v24);
      }

      uint64_t v17 = v64 + 1;
      if (v64 + 1 != v63) {
        continue;
      }
      break;
    }
    uint64_t v15 = [&unk_26C6B0608 countByEnumeratingWithState:&v81 objects:v96 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_65:
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v44 = objc_msgSend(&unk_26C6B0620, "countByEnumeratingWithState:objects:count:", &v68, v93, 16, v59);
  if (v44)
  {
    uint64_t v45 = *(void *)v69;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v69 != v45) {
          objc_enumerationMutation(&unk_26C6B0620);
        }
        v47 = [v65 stringByAppendingPathComponent:*(void *)(*((void *)&v68 + 1) + 8 * k)];
        setFileClassC(v47, v67, (unsigned char *)v90 + 24);
      }
      uint64_t v44 = [&unk_26C6B0620 countByEnumeratingWithState:&v68 objects:v93 count:16];
    }
    while (v44);
  }

  if (*((unsigned char *)v90 + 24))
  {
    CFPreferencesSetAppValue(@"NeedsFileProtectionClassMigration", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.itunesstored");
    BOOL v48 = *((unsigned char *)v90 + 24) != 0;
  }
  else
  {
    BOOL v48 = 0;
  }
LABEL_88:
  _Block_object_dispose(&v89, 8);

  return v48;
}

uint64_t __40__ISFileProtectionClassMigrator_migrate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (!v7)
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  v10 = [v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    int v11 = v9;
  }
  else {
    int v11 = v9 & 2;
  }
  if (!v11) {
    goto LABEL_12;
  }
  int v17 = 138543362;
  id v18 = v6;
  LODWORD(v16) = 12;
  int v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v17, v16);
    free(v12);
    SSFileLog();
LABEL_12:
  }
  if ([v6 code] != 260
    || ([v6 domain],
        int v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 isEqualToString:*MEMORY[0x263F07F70]],
        v13,
        (v14 & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }

  return 1;
}

@end