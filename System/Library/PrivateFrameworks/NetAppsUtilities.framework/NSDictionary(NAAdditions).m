@interface NSDictionary(NAAdditions)
- (id)na_dictionaryByMappingValues:()NAAdditions;
- (id)na_filter:()NAAdditions;
- (id)na_firstKeyPassingTest:()NAAdditions;
- (id)na_flatMap:()NAAdditions;
- (id)na_map:()NAAdditions;
- (id)na_reduceWithInitialValue:()NAAdditions reducer:;
- (uint64_t)na_allSatisfy:()NAAdditions;
- (uint64_t)na_any:()NAAdditions;
- (void)na_each:()NAAdditions;
@end

@implementation NSDictionary(NAAdditions)

- (void)na_each:()NAAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__NSDictionary_NAAdditions__na_each___block_invoke;
  v6[3] = &unk_1E6109940;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v6];
}

- (id)na_dictionaryByMappingValues:()NAAdditions
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__NSDictionary_NAAdditions__na_dictionaryByMappingValues___block_invoke;
    v10[3] = &unk_1E61098C8;
    id v12 = v4;
    id v6 = v5;
    id v11 = v6;
    [a1 enumerateKeysAndObjectsUsingBlock:v10];
    id v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = a1;
  }

  return v8;
}

- (id)na_reduceWithInitialValue:()NAAdditions reducer:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v8 = v6;
  id v20 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__NSDictionary_NAAdditions__na_reduceWithInitialValue_reducer___block_invoke;
  v12[3] = &unk_1E61098F0;
  v14 = &v15;
  id v9 = v7;
  id v13 = v9;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)na_firstKeyPassingTest:()NAAdditions
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = [a1 allKeys];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__NSDictionary_NAAdditions__na_firstKeyPassingTest___block_invoke;
  v10[3] = &unk_1E61098A0;
  void v10[4] = a1;
  id v7 = v4;
  id v11 = v7;
  id v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)na_map:()NAAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__NSDictionary_NAAdditions__na_map___block_invoke;
  v11[3] = &unk_1E61098C8;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  id v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)na_flatMap:()NAAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__NSDictionary_NAAdditions__na_flatMap___block_invoke;
  v11[3] = &unk_1E61098C8;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  id v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)na_filter:()NAAdditions
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __39__NSDictionary_NAAdditions__na_filter___block_invoke;
    id v12 = &unk_1E61098C8;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateKeysAndObjectsUsingBlock:&v9];
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v6, v9, v10, v11, v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

- (uint64_t)na_any:()NAAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__NSDictionary_NAAdditions__na_any___block_invoke;
  v8[3] = &unk_1E6109918;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)na_allSatisfy:()NAAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__NSDictionary_NAAdditions__na_allSatisfy___block_invoke;
  v8[3] = &unk_1E6109918;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end