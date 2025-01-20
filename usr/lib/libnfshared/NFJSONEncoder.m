@interface NFJSONEncoder
+ (id)encoder;
- (id)_JSONCompatibleArray:(id)a3;
- (id)_JSONCompatibleDictionary:(id)a3;
- (id)stringFromArray:(id)a3;
- (id)stringFromDictionary:(id)a3;
@end

@implementation NFJSONEncoder

+ (id)encoder
{
  v2 = objc_opt_new();

  return v2;
}

- (id)_JSONCompatibleArray:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__NFJSONEncoder__JSONCompatibleArray___block_invoke;
  v9[3] = &unk_1E65ABE70;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v4 enumerateObjectsUsingBlock:v9];

  id v7 = v6;
  return v7;
}

void __38__NFJSONEncoder__JSONCompatibleArray___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) _JSONCompatibleArray:v12];
LABEL_5:
    v5 = (void *)v4;
    [v3 addObject:v4];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) _JSONCompatibleDictionary:v12];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [*(id *)(a1 + 32) addObject:v12];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = [v12 NF_asHexString];
      [v6 addObject:v7];
    }
    else if (objc_opt_respondsToSelector())
    {
      v9 = *(void **)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      id v10 = [v12 asDictionary];
      v11 = [v8 _JSONCompatibleDictionary:v10];
      [v9 addObject:v11];
    }
  }
LABEL_9:
}

- (id)_JSONCompatibleDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__NFJSONEncoder__JSONCompatibleDictionary___block_invoke;
  v9[3] = &unk_1E65ABE98;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = v6;
  return v7;
}

void __43__NFJSONEncoder__JSONCompatibleDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) _JSONCompatibleArray:v5];
LABEL_5:
    v8 = (void *)v7;
    [v6 setObject:v7 forKey:v15];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) _JSONCompatibleDictionary:v5];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [*(id *)(a1 + 32) setObject:v5 forKey:v15];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = *(void **)(a1 + 32);
      id v10 = [v5 NF_asHexString];
      [v9 setObject:v10 forKey:v15];
    }
    else if (objc_opt_respondsToSelector())
    {
      id v12 = *(void **)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      v13 = [v5 asDictionary];
      v14 = [v11 _JSONCompatibleDictionary:v13];
      [v12 setObject:v14 forKey:v15];
    }
  }
LABEL_9:
}

- (id)stringFromArray:(id)a3
{
  v3 = [(NFJSONEncoder *)self _JSONCompatibleArray:a3];
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:1 error:&v7];
  id v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];

  return v5;
}

- (id)stringFromDictionary:(id)a3
{
  v3 = [(NFJSONEncoder *)self _JSONCompatibleDictionary:a3];
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:1 error:&v7];
  id v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];

  return v5;
}

@end