@interface NSURL(SPAdditions)
+ (id)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:;
+ (id)sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:;
@end

@implementation NSURL(SPAdditions)

+ (id)sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:
{
  v1 = objc_msgSend(a1, "_sp_URLFromFileID:filename:parentFileID:documentID:");
  if (v1 && _CFURLIsItemPromiseAtURL())
  {
    uint64_t v5 = 0;
    uint64_t v2 = _CFURLCopyLogicalURLOfPromiseAtURL();

    if (!v2)
    {
      v3 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        +[NSURL(SPAdditions) sp_URLFromFileID:filename:parentFileID:documentID:]((uint64_t)v1, &v5, v3);
      }
    }
    v1 = (void *)v2;
  }
  return v1;
}

+ (id)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (!v12)
  {
    v22 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:](v22);
    }
    goto LABEL_37;
  }
  int v14 = [v12 unsignedIntValue];
  if (v9)
  {
    [v9 unsignedLongValue];
    int v15 = openbyid();
    if ((v15 & 0x80000000) == 0)
    {
      int v16 = v15;
      uint64_t v38 = 0;
      long long v37 = xmmword_1BDC5D420;
      bzero(v39, 0x410uLL);
      if (fgetattrlist(v16, &v37, v39, 0x410uLL, 0x21u) < 0)
      {
        v19 = PRSLogCategoryDefault();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.4();
        }
      }
      else
      {
        if (v40 == v14)
        {
          v17 = (char *)&v41 + v41;
          v18 = (void *)MEMORY[0x1E4F1CB10];
          v19 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v37, v38);
          v20 = [v19 stringWithFileSystemRepresentation:v17 length:v42];
          v21 = [v18 fileURLWithPath:v20];

          goto LABEL_14;
        }
        v19 = PRSLogCategoryDefault();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:]();
        }
      }
      v21 = 0;
LABEL_14:

      close(v16);
      if (v21) {
        goto LABEL_45;
      }
    }
  }
  if (!v10) {
    goto LABEL_28;
  }
  if (!v11) {
    goto LABEL_28;
  }
  [v11 unsignedLongValue];
  int v23 = openbyid();
  if (v23 < 0) {
    goto LABEL_28;
  }
  int v24 = v23;
  int v25 = openat(v23, (const char *)[v10 fileSystemRepresentation], 256);
  close(v24);
  if (v25 < 0) {
    goto LABEL_28;
  }
  uint64_t v38 = 0;
  long long v37 = xmmword_1BDC5D420;
  bzero(v39, 0x410uLL);
  if (fgetattrlist(v25, &v37, v39, 0x410uLL, 0x21u) < 0)
  {
    v28 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.4();
    }
  }
  else
  {
    if (v40 == v14)
    {
      v26 = (char *)&v41 + v41;
      v27 = (void *)MEMORY[0x1E4F1CB10];
      v28 = [MEMORY[0x1E4F28CB8] defaultManager];
      v29 = [v28 stringWithFileSystemRepresentation:v26 length:v42];
      v21 = [v27 fileURLWithPath:v29];

      goto LABEL_27;
    }
    v28 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:]();
    }
  }
  v21 = 0;
LABEL_27:

  close(v25);
  if (v21) {
    goto LABEL_45;
  }
LABEL_28:
  if (device_id_onceToken != -1) {
    dispatch_once(&device_id_onceToken, &__block_literal_global_8);
  }
  if (!GSLibraryResolveDocumentId2())
  {
    v22 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:]();
    }
LABEL_37:

    goto LABEL_38;
  }
  int v30 = openbyid();
  if (v30 < 0)
  {
LABEL_38:
    v21 = 0;
    goto LABEL_45;
  }
  int v31 = v30;
  uint64_t v38 = 0;
  long long v37 = xmmword_1BDC5D420;
  bzero(v39, 0x410uLL);
  if (fgetattrlist(v31, &v37, v39, 0x410uLL, 0x21u) < 0)
  {
    v34 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.4();
    }
    goto LABEL_43;
  }
  if (v40 != v14)
  {
    v34 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:]();
    }
LABEL_43:
    v21 = 0;
    goto LABEL_44;
  }
  v32 = (char *)&v41 + v41;
  v33 = (void *)MEMORY[0x1E4F1CB10];
  v34 = [MEMORY[0x1E4F28CB8] defaultManager];
  v35 = [v34 stringWithFileSystemRepresentation:v32 length:v42];
  v21 = [v33 fileURLWithPath:v35];

LABEL_44:
  close(v31);
LABEL_45:

  return v21;
}

+ (void)sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "Failed to copy logical URL of promise at %@: %@", (uint8_t *)&v4, 0x16u);
}

+ (void)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "Item missing document ID", v1, 2u);
}

+ (void)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:.cold.2()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BDB2A000, v1, v2, "GSLibraryResolveDocumentId2 failed, errno:%d(%s)", v3, v4, v5, v6, v7);
}

+ (void)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BDB2A000, v0, v1, "document IDs didn't match (%d v/s %d)", v2, v3);
}

+ (void)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:.cold.4()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BDB2A000, v1, v2, "fgetattrlist failed, error:%d(%s)", v3, v4, v5, v6, v7);
}

@end