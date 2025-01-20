@interface PLPropertyListFilter
+ (BOOL)canEncodeInPropertyList:(id)a3;
+ (id)_filterArray:(id)a3 block:(id)a4;
+ (id)_filterDictionary:(id)a3 block:(id)a4;
+ (id)filterPropertyList:(id)a3;
+ (id)filterPropertyList:(id)a3 block:(id)a4;
+ (id)filterPropertyListNoData:(id)a3;
@end

@implementation PLPropertyListFilter

+ (BOOL)canEncodeInPropertyList:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)filterPropertyListNoData:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PLPropertyListFilter_filterPropertyListNoData___block_invoke;
  v5[3] = &__block_descriptor_40_e11__24__0_8_16l;
  v5[4] = a1;
  id v3 = [a1 filterPropertyList:a3 block:v5];
  return v3;
}

id __49__PLPropertyListFilter_filterPropertyListNoData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
  }
  else
  {
    if ([*(id *)(a1 + 32) canEncodeInPropertyList:v4]) {
      v6 = v4;
    }
    else {
      v6 = 0;
    }
    id v5 = v6;
  }

  return v5;
}

+ (id)filterPropertyList:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PLPropertyListFilter_filterPropertyList___block_invoke;
  v5[3] = &__block_descriptor_40_e11__24__0_8_16l;
  v5[4] = a1;
  id v3 = [a1 filterPropertyList:a3 block:v5];
  return v3;
}

id __43__PLPropertyListFilter_filterPropertyList___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  if ([v3 canEncodeInPropertyList:v4]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (id)filterPropertyList:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [a1 _filterDictionary:v6 block:v7];
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [a1 _filterArray:v6 block:v7];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

+ (id)_filterArray:(id)a3 block:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (*((void (**)(id, void, void))v7 + 2))(v7, 0, *(void *)(*((void *)&v20 + 1) + 8 * i));
        if (v14)
        {
          v15 = (void *)v14;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v16 = [a1 _filterDictionary:v15 block:v7];
LABEL_11:
            v17 = (void *)v16;

            v15 = v17;
            if (!v17) {
              continue;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v16 = objc_msgSend(a1, "_filterArray:block:", v15, v7, (void)v20);
              goto LABEL_11;
            }
          }
          objc_msgSend(v8, "addObject:", v15, (void)v20);

          continue;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  if ([v9 count] && !objc_msgSend(v8, "count")) {
    id v18 = 0;
  }
  else {
    id v18 = v8;
  }

  return v18;
}

+ (id)_filterDictionary:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__PLPropertyListFilter__filterDictionary_block___block_invoke;
  v15[3] = &unk_1E5868F10;
  id v17 = v6;
  id v18 = a1;
  id v10 = v9;
  id v16 = v10;
  id v11 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];
  uint64_t v12 = [v8 count];

  if (v12 && ![v10 count]) {
    id v13 = 0;
  }
  else {
    id v13 = v10;
  }

  return v13;
}

uint64_t __48__PLPropertyListFilter__filterDictionary_block___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3)
  {
    id v4 = (void *)v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [*(id *)(a1 + 48) _filterDictionary:v4 block:*(void *)(a1 + 40)];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v7 = v9;
        goto LABEL_9;
      }
      uint64_t v5 = [*(id *)(a1 + 48) _filterArray:v4 block:*(void *)(a1 + 40)];
    }
    id v6 = (void *)v5;

    id v4 = v6;
    id v7 = v9;
    if (!v6) {
      goto LABEL_10;
    }
LABEL_9:
    [*(id *)(a1 + 32) setObject:v4 forKey:v7];
  }
LABEL_10:
  return MEMORY[0x1F4181870]();
}

@end