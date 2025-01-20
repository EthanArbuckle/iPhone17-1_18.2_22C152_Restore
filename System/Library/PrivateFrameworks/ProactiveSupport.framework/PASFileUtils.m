@interface PASFileUtils
@end

@implementation PASFileUtils

uint64_t __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to initialize dirent db: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

void __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_5(uint64_t a1)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v22 = *MEMORY[0x1E4F28588];
  while (1)
  {
    *__error() = 0;
    v2 = readdir(*(DIR **)(a1 + 56));
    if (!v2) {
      break;
    }
    id v3 = v2;
    d_name = v2->d_name;
    if (strcmp(v2->d_name, "."))
    {
      if (strcmp(d_name, ".."))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        if (!v5 || (*(unsigned int (**)(uint64_t, dirent *))(v5 + 16))(v5, v3))
        {
          uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
          int v7 = *(void **)(v6 + 40);
          *(void *)(v6 + 40) = 0;

          id v8 = *(void **)(a1 + 32);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_2;
          v24[3] = &__block_descriptor_56_e29_v16__0___PASSqliteStatement_8l;
          v24[4] = v3;
          long long v25 = *(_OWORD *)(a1 + 64);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_3;
          v23[3] = &unk_1E5AEB6B0;
          v23[4] = *(void *)(a1 + 48);
          char v9 = [v8 prepAndRunQuery:@"INSERT OR IGNORE INTO dirents (name, dirent) VALUES (:name, :dirent)", v24, 0, v23 onPrep onRow onError];
          uint64_t v10 = *(void *)(a1 + 48);
          if ((v9 & 1) == 0 && !*(void *)(*(void *)(v10 + 8) + 40))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to insert dirent for unknown reason", buf, 2u);
            }
            uint64_t v30 = v22;
            v31[0] = @"_PASFileUtils failed to insert dirent for unknown reason";
            v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
            uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"_PASFileUtilsErrorDomain" code:1 userInfo:v11];
            uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
            v14 = *(void **)(v13 + 40);
            *(void *)(v13 + 40) = v12;

            uint64_t v10 = *(void *)(a1 + 48);
          }
          if (*(void *)(*(void *)(v10 + 8) + 40)) {
            return;
          }
        }
      }
    }
  }
  if (*__error())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = __error();
      v20 = strerror(*v19);
      int v21 = *__error();
      *(_DWORD *)buf = 136315394;
      v27 = v20;
      __int16 v28 = 1024;
      int v29 = v21;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASFileUtils failed on readdir: %s (%d)", buf, 0x12u);
    }
    v15 = __error();
    uint64_t v16 = posixError(*v15);
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

uint64_t __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_35(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v8 = 0;
  id v3 = [a2 getNSDataForColumn:0];
  if (!v3)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a1[5] object:a1[6] file:@"_PASFileUtils.m" lineNumber:115 description:@"Read nil blob from dirents query"];
  }
  bzero(v9, 0x418uLL);
  id v4 = v3;
  [v4 bytes];
  [v4 length];
  __memcpy_chk();
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v5 = v8;

  return v5;
}

uint64_t __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_2_40(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to read dirent row: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

void __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_2(void *a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = *(unsigned __int16 *)(a1[4] + 18);
  if (v3 >= 0x403)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a1[5] object:a1[6] file:@"_PASFileUtils.m" lineNumber:78 description:@"Bogus dirent size"];
  }
  unint64_t v4 = v3 + 22;
  uint64_t v5 = (void *)[[NSString alloc] initWithUTF8String:a1[4] + 21];
  [v8 bindNamedParam:":name" toNSString:v5];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a1[4] length:v4];
  [v8 bindNamedParam:":dirent" toNSData:v6];
}

uint64_t __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to insert dirent: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

@end