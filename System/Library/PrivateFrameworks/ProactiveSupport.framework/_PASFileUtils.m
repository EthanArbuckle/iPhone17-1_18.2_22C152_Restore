@interface _PASFileUtils
+ (BOOL)iterSortedEntriesInDirectory:(id)a3 selectDirent:(id)a4 onSortedDirent:(id)a5 error:(id *)a6;
+ (id)mkstempWithPrefix:(id)a3 error:(id *)a4;
@end

@implementation _PASFileUtils

+ (id)mkstempWithPrefix:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"_PASFileUtils.m", 152, @"Invalid parameter not satisfying: %@", @"prefix" object file lineNumber description];
  }
  id v8 = [v7 stringByAppendingString:@"XXXXXX"];
  v9 = (const char *)[v8 UTF8String];
  if (v9)
  {
    id v10 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:v9 length:strlen(v9) + 1];
    v11 = (char *)[v10 mutableBytes];
    *__error() = 0;
    uint64_t v12 = mkstemp(v11);
    if ((v12 & 0x80000000) != 0)
    {
      if (!a4)
      {
        v15 = 0;
        goto LABEL_14;
      }
      id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v20 = *MEMORY[0x1E4F28798];
      uint64_t v21 = *__error();
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v22 = NSString;
      v23 = __error();
      v14 = [v22 stringWithUTF8String:strerror(*v23)];
      v29 = v14;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      *a4 = (id)[v19 initWithDomain:v20 code:v21 userInfo:v24];

      v15 = 0;
    }
    else
    {
      uint64_t v13 = v12;
      if (fcntl(v12, 64, 6) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "+[_PASFileUtils mkstempWithPrefix:error:] failed to set PROTECTION_CLASS_F", buf, 2u);
      }
      v14 = (void *)[[NSString alloc] initWithCString:v11 encoding:4];
      v15 = [[_PASTempfileDescr alloc] initWithFd:v13 path:v14];
    }

LABEL_14:
    goto LABEL_15;
  }
  if (a4)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28798];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31[0] = @"path is not valid unicode";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v18 = (id)[v16 initWithDomain:v17 code:22 userInfo:v10];
    v15 = 0;
    *a4 = v18;
    goto LABEL_14;
  }
  v15 = 0;
LABEL_15:

  return v15;
}

+ (BOOL)iterSortedEntriesInDirectory:(id)a3 selectDirent:(id)a4 onSortedDirent:(id)a5 error:(id *)a6
{
  v52[2] = *(id *)MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v11;
  v15 = opendir((const char *)[v14 UTF8String]);
  if (v15)
  {
    id v16 = v15;
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v50 = __Block_byref_object_copy__2716;
    v51 = __Block_byref_object_dispose__2717;
    v52[0] = 0;
    id obj = 0;
    uint64_t v17 = +[_PASSqliteDatabase sqliteDatabaseWithFilename:&stru_1EF678A50 contentProtection:0 errorHandler:0 error:&obj];
    objc_storeStrong(v52, obj);
    if (v17)
    {
      id v18 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = 0;

      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke;
      v43[3] = &unk_1E5AEB6B0;
      v43[4] = buf;
      [v17 prepAndRunNonDataQueries:&unk_1EF683990 onError:v43];
      id v19 = *(void **)(*(void *)&buf[8] + 40);
      if (!v19)
      {
        *(void *)(*(void *)&buf[8] + 40) = 0;
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_5;
        v36[3] = &unk_1E5AEB338;
        v40 = v16;
        id v38 = v12;
        v39 = buf;
        id v20 = v17;
        id v37 = v20;
        SEL v41 = a2;
        id v42 = a1;
        [v20 writeTransaction:v36];

        id v19 = *(void **)(*(void *)&buf[8] + 40);
        if (!v19)
        {
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_35;
          v32[3] = &unk_1E5AEB360;
          SEL v34 = a2;
          id v35 = a1;
          id v33 = v13;
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          void v31[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_2_40;
          v31[3] = &unk_1E5AEB6B0;
          v31[4] = buf;
          if (([v20 prepAndRunQuery:@"SELECT dirent FROM dirents ORDER BY name ASC" onPrep:0 onRow:v32 onError:v31] & 1) == 0&& !*(void *)(*(void *)&buf[8] + 40))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v47 = 0;
              _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to read dirent row for unknown reason", v47, 2u);
            }
            uint64_t v45 = *MEMORY[0x1E4F28588];
            v46 = @"_PASFileUtils failed to read dirent row for unknown reason";
            uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
            uint64_t v22 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"_PASFileUtilsErrorDomain" code:2 userInfo:v21];
            v23 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v22;
          }
          id v19 = *(void **)(*(void *)&buf[8] + 40);
          if (!v19)
          {
            BOOL v25 = 1;
            goto LABEL_25;
          }
        }
      }
      if (!a6) {
        goto LABEL_24;
      }
LABEL_19:
      BOOL v25 = 0;
      *a6 = v19;
LABEL_25:
      [v17 closePermanently];
      closedir(v16);

      _Block_object_dispose(buf, 8);
      goto LABEL_26;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)v47 = 138412290;
      uint64_t v48 = v29;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to open dirent db: %@", v47, 0xCu);
      if (a6) {
        goto LABEL_18;
      }
    }
    else if (a6)
    {
LABEL_18:
      id v19 = *(void **)(*(void *)&buf[8] + 40);
      goto LABEL_19;
    }
LABEL_24:
    BOOL v25 = 0;
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v26 = __error();
    v27 = strerror(*v26);
    int v28 = *__error();
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = v28;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to open directory \"%@\": %s (%d)", buf, 0x1Cu);
    if (a6) {
      goto LABEL_15;
    }
LABEL_21:
    BOOL v25 = 0;
    goto LABEL_26;
  }
  if (!a6) {
    goto LABEL_21;
  }
LABEL_15:
  v24 = __error();
  posixError(*v24);
  BOOL v25 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v25;
}

@end