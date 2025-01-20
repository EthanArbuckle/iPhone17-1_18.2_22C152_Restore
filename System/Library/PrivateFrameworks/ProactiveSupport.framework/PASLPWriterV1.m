@interface PASLPWriterV1
@end

@implementation PASLPWriterV1

void __70___PASLPWriterV1__writePlist_allDictionaryKeys_toBuffer_size_actSize___block_invoke(uint64_t a1)
{
}

void __70___PASLPWriterV1__writePlist_allDictionaryKeys_toBuffer_size_actSize___block_invoke_2(uint64_t a1)
{
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1A62450A0]();
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", 4 * objc_msgSend(v4, "count") + 4);
  v7 = (_DWORD *)[v6 mutableBytes];
  _DWORD *v7 = [v4 count];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_7;
  v10[3] = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
  v10[4] = v7;
  v10[5] = a2;
  [v4 enumerateObjectsUsingBlock:v10];
  id v8 = v6;
  *(_DWORD *)(a2 + 8) = _block_invoke((uint64_t *)a2, (const void *)[v8 bytes], objc_msgSend(v8, "length") | 0x400000000) | 0xE0000000;
  *(unsigned char *)(a2 + 12) = 1;
  ++*(void *)(*(void *)(*(void *)a2 + 32) + 80);

  return 1;
}

void __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  v5 = (void *)MEMORY[0x1A62450A0]();
  int v6 = +[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]((uint64_t)_PASLPWriterV1, v8, **(void **)(a1 + 40), *(void *)(*(void *)(a1 + 40) + 16) + 1);
  uint64_t v7 = *(void *)(a1 + 40);
  *(_DWORD *)(*(void *)(a1 + 32) + 4 * a3 + 4) = v6;
  ++*(void *)(*(void *)(*(void *)v7 + 32) + 88);
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_3_103(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1A62450A0]();
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", (8 * objc_msgSend(v4, "count")) | 4);
  uint64_t v7 = (_DWORD *)[v6 mutableBytes];
  _DWORD *v7 = [v4 count];
  id v8 = (void *)MEMORY[0x1A62450A0]();
  v9 = [v4 allKeys];
  v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_110];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_5_111;
  v14[3] = &unk_1E5AEBB48;
  uint64_t v16 = a2;
  v17 = v7;
  id v11 = v4;
  id v15 = v11;
  [v10 enumerateObjectsUsingBlock:v14];
  id v12 = v6;
  *(_DWORD *)(a2 + 8) = _block_invoke((uint64_t *)a2, (const void *)[v12 bytes], objc_msgSend(v12, "length") | 0x400000000) | 0xC0000000;
  *(unsigned char *)(a2 + 12) = 1;
  ++*(void *)(*(void *)(*(void *)a2 + 32) + 96);

  return 1;
}

void __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_5_111(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1A62450A0]();
  id v7 = v5;
  id v8 = (const char *)[v7 UTF8String];
  if (!v8)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke_5"];
    [v21 handleFailureInFunction:v22 file:@"_PASLPWriterV1.m" lineNumber:752 description:@"unexpected failure of UTF-8 NSString conversion"];
  }
  uint64_t v9 = strlen(v8) + 1;
  uint64_t v10 = **(void **)(a1 + 40);
  value[0] = v8;
  value[1] = v9 | 0x100000000;
  id v11 = CFSetGetValue(*(CFSetRef *)(v10 + 16), value);
  if (!v11)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [NSString stringWithUTF8String:"+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke_5"];
    [v23 handleFailureInFunction:v24, @"_PASLPWriterV1.m", 761, @"failed to find dictionary key \"%@\" in string table", v7 file lineNumber description];
  }
  id v12 = **(void ***)(a1 + 40);
  uint64_t v13 = *v11 - *v12;
  if (v13 < *(unsigned int *)(*v12 + 4) || v13 + v9 > *(unsigned int *)(*v12 + 8))
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke_5"];
    [v19 handleFailureInFunction:v20, @"_PASLPWriterV1.m", 765, @"found dictionary key \"%@\" but not contained in string table", v7 file lineNumber description];

    id v12 = **(void ***)(a1 + 40);
    uint64_t v13 = *v11 - *v12;
  }
  uint64_t v14 = a3 + 1;
  *(_DWORD *)(*(void *)(a1 + 48) + 4 * (a3 + 1)) = v13 | 0xA0000000;
  ++*(void *)(v12[4] + 56);
  id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  int v16 = +[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]((uint64_t)_PASLPWriterV1, v15, **(void **)(a1 + 40), *(void *)(*(void *)(a1 + 40) + 16) + 1);
  uint64_t v17 = *(void *)(a1 + 48);
  *(_DWORD *)(v17 + 4 * ([*(id *)(a1 + 32) count] + v14)) = v16;

  uint64_t v18 = *(void *)(**(void **)(a1 + 40) + 32);
  ++*(void *)(v18 + 104);
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_4_107(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1A62450A0]();
  id v7 = v4;
  id v8 = (const char *)[v7 UTF8String];
  id v9 = v5;
  uint64_t v10 = [v9 UTF8String];
  id v11 = (const char *)v10;
  if (!v8 || !v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = [NSString stringWithUTF8String:"+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke_4"];
    [v14 handleFailureInFunction:v15 file:@"_PASLPWriterV1.m" lineNumber:743 description:@"unexpected failure of UTF-8 NSString conversion"];
  }
  uint64_t v12 = strcmp(v8, v11);

  return v12;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_2_97(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1A62450A0]();
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];
  if (!v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [NSString stringWithUTF8String:"+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke_2"];
    [v10 handleFailureInFunction:v11 file:@"_PASLPWriterV1.m" lineNumber:716 description:@"unexpected failure of UTF-8 NSString conversion"];
  }
  int v8 = strlen(v7);
  *(_DWORD *)(a2 + 8) = _block_invoke((uint64_t *)a2, v7, (v8 + 1) | 0x100000000) | 0xA0000000;
  *(unsigned char *)(a2 + 12) = 1;
  ++*(void *)(*(void *)(*(void *)a2 + 32) + 56);

  return 1;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_5(uint64_t a1, void **a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length] | 0x2000000000;
  id v7 = *a2;
  *(void *)&long long value = v5;
  *((void *)&value + 1) = v6;
  int v8 = CFSetGetValue((CFSetRef)v7[2], &value);
  if (v8)
  {
    uint64_t v9 = *v8 - **a2;
    if ((v9 & 0xFFFFFFFC) != 0)
    {
      uint64_t v10 = *(unsigned int *)(*v8 - 4);
      if ([v4 length] == v10)
      {
        *((_DWORD *)a2 + 2) = (v9 + 2147483644) | 0x80000000;
        *((unsigned char *)a2 + 12) = 1;
      }
    }
    if (!*((unsigned char *)a2 + 12) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(value) = 138412290;
      *(void *)((char *)&value + 4) = @"Warning: unexpectedly found aligned data region without matching size prefix.";
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "_PASLazyPlist: %@", (uint8_t *)&value, 0xCu);
    }
  }
  uint64_t v11 = (uint64_t)*a2;
  if (!*((unsigned char *)a2 + 12))
  {
    *(_DWORD *)bumpChecked(v11, 4) = 0;
    alignChecked(*a2, 0x20uLL);
    uint64_t v12 = (_DWORD *)bumpChecked((uint64_t)*a2, [v4 length]);
    *(v12 - 1) = [v4 length];
    id v13 = v4;
    memcpy(v12, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
    cacheBuffer((__CFSet *)(*a2)[2], (*a2)[4], (uint64_t)v12, v6);
    uint64_t v11 = (uint64_t)*a2;
    *((_DWORD *)a2 + 2) = (v12 - *(_DWORD *)*a2 + 2147483644) | 0x80000000;
    *((unsigned char *)a2 + 12) = 1;
  }
  ++*(void *)(*(void *)(v11 + 32) + 64);
  *(void *)((*a2)[4] + 72) += [v4 length];
  if (!*((unsigned char *)a2 + 12))
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    int v16 = [NSString stringWithUTF8String:"+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke"];
    [v15 handleFailureInFunction:v16, @"_PASLPWriterV1.m", 708, @"Invalid parameter not satisfying: %@", @"valueWordContext->hasValueWord" file lineNumber description];
  }
  return 1;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_4(double a1, uint64_t a2, uint64_t a3)
{
  double v5 = a1;
  *(_DWORD *)(a3 + 8) = _block_invoke((uint64_t *)a3, &v5, 0x100000008) | 0x60000000;
  *(unsigned char *)(a3 + 12) = 1;
  ++*(void *)(*(void *)(*(void *)a3 + 32) + 48);
  return 1;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_3(double a1, uint64_t a2, uint64_t a3)
{
  double v8 = a1;
  if (a1 >= -3.40282347e38)
  {
    float v4 = a1;
    BOOL v5 = a1 <= 3.40282347e38 && v4 == a1;
    if (v5 && (LOBYTE(v4) & 0xF) == 0)
    {
      *(_DWORD *)(a3 + 8) = (LODWORD(v4) >> 4) | 0x10000000;
      *(unsigned char *)(a3 + 12) = 1;
      ++*(void *)(*(void *)(*(void *)a3 + 32) + 32);
    }
  }
  if (!*(unsigned char *)(a3 + 12))
  {
    *(_DWORD *)(a3 + 8) = _block_invoke((uint64_t *)a3, &v8, 0x100000008) | 0x40000000;
    *(unsigned char *)(a3 + 12) = 1;
    ++*(void *)(*(void *)(*(void *)a3 + 32) + 40);
  }
  return 1;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = a3;
  if ((unint64_t)(a3 + 0x7FFFFFF) > 0xFFFFFFD)
  {
    int v4 = _block_invoke((uint64_t *)a2, &v7, 0x100000008) | 0x20000000;
    BOOL v5 = (void *)(*(void *)(*(void *)a2 + 32) + 24);
  }
  else
  {
    int v4 = a3 + 0x7FFFFFF;
    BOOL v5 = (void *)(*(void *)(*(void *)a2 + 32) + 16);
  }
  ++*v5;
  *(_DWORD *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 12) = 1;
  return 1;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    int v3 = 0xFFFFFFF;
  }
  else {
    int v3 = 268435454;
  }
  *(_DWORD *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 12) = 1;
  ++*(void *)(*(void *)(*(void *)a2 + 32) + 8);
  return 1;
}

uint64_t __70___PASLPWriterV1__writePlist_allDictionaryKeys_toBuffer_size_actSize___block_invoke_3(uint64_t a1, const char **a2, const char **a3)
{
  return strcmp(*a2, *a3);
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_11(uint64_t a1, uint64_t a2)
{
  int v3 = objc_opt_new();
  int v4 = (void *)[[NSString alloc] initWithFormat:@"The object is not plist-compatible: %@", @"plist contains value which is not plist-compatible"];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  [v3 setObject:@"plist contains value which is not plist-compatible" forKeyedSubscript:*MEMORY[0x1E4F28588]];
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = (void *)[v3 copy];
  uint64_t v7 = [v5 initWithDomain:@"_PASLazyPlistErrorDomain" code:6 userInfo:v6];

  double v8 = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v7;

  return 0;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_10;
  v7[3] = &unk_1E5AEBAE0;
  v7[4] = &v8;
  v7[5] = a2;
  [v4 enumerateObjectsUsingBlock:v7];
  *(void *)(a2 + 8) += 8;
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v6 = (void *)MEMORY[0x1A62450A0]();
  if ((+[_PASLPWriterV1 _scanPlist:recursionDepth:sizeUpperBound:allDictionaryKeys:error:]((uint64_t)_PASLPWriterV1, v7, **(void **)(a1 + 40) + 1, (uint64_t *)(*(void *)(a1 + 40) + 8), *(void **)(*(void *)(a1 + 40) + 16), (id *)(*(void *)(a1 + 40) + 24)) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_8;
  v7[3] = &unk_1E5AEBA98;
  v7[4] = &v8;
  v7[5] = a2;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  *(void *)(a2 + 8) += 8;
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_8(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v27 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)MEMORY[0x1A62450A0]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = objc_opt_new();
    id v19 = [NSString alloc];
    v20 = @"plist contains dictionary key which is not a string";
LABEL_7:
    v21 = (void *)[v19 initWithFormat:@"The object is not plist-compatible: %@", v20];
    [v18 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    [v18 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    v23 = (void *)[v18 copy];
    uint64_t v24 = [v22 initWithDomain:@"_PASLazyPlistErrorDomain" code:6 userInfo:v23];

    uint64_t v25 = *(void *)(a1 + 40);
    v26 = *(void **)(v25 + 24);
    *(void *)(v25 + 24) = v24;

    goto LABEL_8;
  }
  id v9 = v27;
  uint64_t v10 = [v9 UTF8String];
  if (!v10)
  {
    uint64_t v18 = objc_opt_new();
    id v19 = [NSString alloc];
    v20 = @"object contains NSString dictionary key which is not valid Unicode";
    goto LABEL_7;
  }
  char v11 = (const char *)v10;
  [*(id *)(*(void *)(a1 + 40) + 16) addObject:v9];
  size_t v12 = strlen(v11);
  id v13 = *(uint64_t **)(a1 + 40);
  uint64_t v14 = *v13;
  id v15 = (void *)v13[2];
  int v16 = (id *)(v13 + 3);
  uint64_t v17 = v13[1];
  *++id v13 = v12 + v17 + 5;
  if ((+[_PASLPWriterV1 _scanPlist:recursionDepth:sizeUpperBound:allDictionaryKeys:error:]((uint64_t)_PASLPWriterV1, v7, v14 + 1, v13, v15, v16) & 1) == 0)
  {
LABEL_8:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

BOOL __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_6(int a1, uint64_t a2, id a3)
{
  id v4 = (const char *)[a3 UTF8String];
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)(a2 + 8) += strlen(v4) + 8;
  }
  else
  {
    uint64_t v6 = objc_opt_new();
    id v7 = (void *)[[NSString alloc] initWithFormat:@"The object is not plist-compatible: %@", @"plist contains NSString which is not valid Unicode"];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    [v6 setObject:@"plist contains NSString which is not valid Unicode" forKeyedSubscript:*MEMORY[0x1E4F28588]];
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v9 = (void *)[v6 copy];
    uint64_t v10 = [v8 initWithDomain:@"_PASLazyPlistErrorDomain" code:6 userInfo:v9];

    char v11 = *(void **)(a2 + 24);
    *(void *)(a2 + 24) = v10;
  }
  return v5 != 0;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(a2 + 8) += [a3 length] + 42;
  return 1;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 8) += 12;
  return 1;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 8) += 12;
  return 1;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 8) += 12;
  return 1;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 8) += 4;
  return 1;
}

@end