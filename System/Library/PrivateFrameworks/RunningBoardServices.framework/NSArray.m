@interface NSArray
- (id)elementsToString:(char)a3 debug:;
@end

@implementation NSArray

- (id)elementsToString:(char)a3 debug:
{
  id v3 = a1;
  if (a1)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__0;
    v14 = __Block_byref_object_dispose__0;
    id v15 = [MEMORY[0x1E4F28E78] string];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__NSArray_RunningBoard__elementsToString_debug___block_invoke;
    v7[3] = &unk_1E57412F0;
    v7[4] = &v10;
    int v8 = a2;
    char v9 = a3;
    [v3 enumerateObjectsUsingBlock:v7];
    id v3 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  return v3;
}

void __48__NSArray_RunningBoard__elementsToString_debug___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v24 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v6 = *(_DWORD *)(a1 + 40);
    if (v6 >= 8) {
      int v6 = 8;
    }
    v7 = &_indentPrefix_tabs[8 - v6];
    id v8 = v24;
    objc_msgSend(v5, "appendFormat:", @"%s%lu:{\n", v7, a3);
    char v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v10 = [v8 entriesToStringWithIndent:(*(_DWORD *)(a1 + 40) + 1) debug:*(unsigned __int8 *)(a1 + 44)];

    [v9 appendFormat:@"%@", v10];
    int v11 = *(_DWORD *)(a1 + 40);
    if (v11 >= 8) {
      int v11 = 8;
    }
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "appendFormat:", @"%s}\n", &_indentPrefix_tabs[8 - v11], v21, v23);
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v13 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v14 = *(_DWORD *)(a1 + 40);
    if (v14 >= 8) {
      int v14 = 8;
    }
    id v15 = &_indentPrefix_tabs[8 - v14];
    if (isKindOfClass)
    {
      id v16 = v24;
      objc_msgSend(v13, "appendFormat:", @"%s%lu:[\n", v15, a3);
      v17 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      v18 = -[NSArray elementsToString:debug:](v16);

      [v17 appendFormat:@"%@", v18];
      int v19 = *(_DWORD *)(a1 + 40);
      if (v19 >= 8) {
        int v19 = 8;
      }
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "appendFormat:", @"%s]\n", &_indentPrefix_tabs[8 - v19], v22, v23);
    }
    else if (*(unsigned char *)(a1 + 44))
    {
      [v13 appendFormat:@"%s%lu:\"%@\"\n", v15, a3, v24];
    }
    else
    {
      v20 = [v24 debugDescription];
      [v13 appendFormat:@"%s%lu:\"%@\"\n", v15, a3, v20];
    }
  }
}

@end