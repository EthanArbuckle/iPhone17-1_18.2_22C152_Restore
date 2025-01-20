@interface NSDictionary(ParsecExtras)
- (float)prs_floatForKey:()ParsecExtras;
- (id)prs_URLForKey:()ParsecExtras;
- (id)prs_arrayForKey:()ParsecExtras;
- (id)prs_arrayWithClass:()ParsecExtras forKey:;
- (id)prs_dataForKey:()ParsecExtras;
- (id)prs_dateForKey:()ParsecExtras;
- (id)prs_dictionaryForKey:()ParsecExtras;
- (id)prs_numberForKey:()ParsecExtras;
- (id)prs_objectWithClass:()ParsecExtras forKey:;
- (id)prs_objectWithClassArray:()ParsecExtras forKey:;
- (id)prs_stringForKey:()ParsecExtras;
- (uint64_t)prs_BOOLForKey:()ParsecExtras;
- (uint64_t)prs_intForKey:()ParsecExtras;
- (uint64_t)prs_integerForKey:()ParsecExtras;
@end

@implementation NSDictionary(ParsecExtras)

- (uint64_t)prs_BOOLForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "prs_numberForKey:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (id)prs_stringForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)prs_numberForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)prs_dataForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)prs_dateForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)prs_arrayForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)prs_dictionaryForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)prs_URLForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v3];
    if (!v4)
    {
      v5 = [v3 stringByAddingPercentEscapesUsingEncoding:4];
      if (v5) {
        v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v5];
      }
      else {
        v4 = 0;
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)prs_integerForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = [v2 integerValue];

  return v3;
}

- (uint64_t)prs_intForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = [v2 intValue];

  return v3;
}

- (float)prs_floatForKey:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (id)prs_arrayWithClass:()ParsecExtras forKey:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a1, "prs_arrayForKey:", a4);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = [a3 alloc];
            v14 = objc_msgSend(v13, "initWithData:", v12, (void)v16);
            if (v14) {
              [v6 addObject:v14];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)prs_objectWithClass:()ParsecExtras forKey:
{
  id v6 = a4;
  id v7 = [a3 alloc];
  uint64_t v8 = objc_msgSend(a1, "prs_dictionaryForKey:", v6);

  uint64_t v9 = (void *)[v7 initWithData:v8];
  return v9;
}

- (id)prs_objectWithClassArray:()ParsecExtras forKey:
{
  id v6 = a4;
  id v7 = [a3 alloc];
  uint64_t v8 = objc_msgSend(a1, "prs_arrayForKey:", v6);

  uint64_t v9 = (void *)[v7 initWithArray:v8];
  return v9;
}

@end