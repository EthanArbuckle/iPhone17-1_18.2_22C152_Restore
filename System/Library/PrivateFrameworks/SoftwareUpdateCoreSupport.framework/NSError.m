@interface NSError
@end

@implementation NSError

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v9 = +[SUCoreErrorInformation safeUserInfoValueClasses];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_3;
  v12[3] = &unk_1E60B6A80;
  id v10 = v8;
  id v13 = v10;
  id v11 = v9;
  id v14 = v11;
  v15 = &v16;
  [v11 enumerateObjectsUsingBlock:v12];
  if (!*((unsigned char *)v17 + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

  _Block_object_dispose(&v16, 8);
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_2;
    v23[3] = &unk_1E60B6AA8;
    uint64_t v10 = *(void *)(a1 + 32);
    id v24 = v9;
    uint64_t v25 = v10;
    [v9 enumerateObjectsUsingBlock:v23];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_4;
    v22[3] = &unk_1E60B6AD0;
    v22[4] = *(void *)(a1 + 32);
    [v8 enumerateObjectsUsingBlock:v22];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4F28A50]]) {
      goto LABEL_9;
    }
LABEL_8:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_6;
    v21[3] = &unk_1E60B6AF8;
    v21[4] = *(void *)(a1 + 32);
    [v8 enumerateKeysAndObjectsUsingBlock:v21];
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    id v11 = +[SUCoreErrorInformation safeUserInfoValueClasses];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_8;
    v13[3] = &unk_1E60B6A80;
    id v14 = v8;
    id v12 = v11;
    id v15 = v12;
    uint64_t v16 = &v17;
    [v12 enumerateObjectsUsingBlock:v13];
    if (!*((unsigned char *)v18 + 24))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }

    _Block_object_dispose(&v17, 8);
  }
LABEL_9:
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v6 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v6 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v6 = +[SUCoreErrorInformation safeUserInfoValueClasses];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_5;
  v9[3] = &unk_1E60B6A80;
  id v7 = v5;
  id v10 = v7;
  id v8 = v6;
  id v11 = v8;
  id v12 = &v13;
  [v8 enumerateObjectsUsingBlock:v9];
  if (!*((unsigned char *)v14 + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }

  _Block_object_dispose(&v13, 8);
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v6 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_6(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = 0;
    char v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v9 = +[SUCoreErrorInformation safeUserInfoValueClasses];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_7;
    v11[3] = &unk_1E60B6A80;
    id v12 = v8;
    id v10 = v9;
    id v13 = v10;
    id v14 = &v15;
    [v10 enumerateObjectsUsingBlock:v11];
    if (!*((unsigned char *)v16 + 24))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v6 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end