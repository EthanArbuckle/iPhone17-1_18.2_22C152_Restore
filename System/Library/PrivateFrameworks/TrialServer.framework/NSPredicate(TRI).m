@interface NSPredicate(TRI)
+ (id)triLoggablePredicateWithFormat:()TRI;
+ (id)triLoggablePredicateWithValue:()TRI;
+ (void)_triAnnotatePredicate:()TRI format:usingArgs:;
- (id)triLogDesc;
- (void)triSetLogDesc:()TRI;
@end

@implementation NSPredicate(TRI)

- (void)triSetLogDesc:()TRI
{
}

- (id)triLogDesc
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = objc_getAssociatedObject(a1, "triLogDesc");
  if (!v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = 0;
      goto LABEL_24;
    }
    id v4 = a1;
    v5 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [v4 subpredicates];
    uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v11 = [NSString alloc];
          v12 = [v10 triLogDesc];
          v13 = v12;
          if (!v12)
          {
            v1 = [v10 description];
            v13 = v1;
          }
          v14 = (void *)[v11 initWithFormat:@"(%@)", v13];
          [v5 addObject:v14];

          if (!v12) {
        }
          }
        uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }

    uint64_t v15 = [v4 compoundPredicateType];
    if (v15 == 2)
    {
      v18 = @" OR ";
    }
    else
    {
      if (v15 != 1)
      {
        if (v15)
        {
          v3 = 0;
        }
        else
        {
          id v16 = [NSString alloc];
          v17 = [v5 componentsJoinedByString:@", "];
          v3 = (void *)[v16 initWithFormat:@"NOT %@", v17];
        }
        goto LABEL_23;
      }
      v18 = @" AND ";
    }
    v3 = [v5 componentsJoinedByString:v18];
LABEL_23:
  }
LABEL_24:
  id v19 = v3;

  return v19;
}

+ (void)_triAnnotatePredicate:()TRI format:usingArgs:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_opt_new();
  if (![v8 length])
  {
LABEL_15:
    v20 = (void *)[v9 copy];
    [v7 triSetLogDesc:v20];

    goto LABEL_16;
  }
  uint64_t v10 = 0;
  while (1)
  {
    __int16 v22 = 0;
    int v11 = [v8 characterAtIndex:v10];
    __int16 v22 = v11;
    if (v11 == 37)
    {
      uint64_t v12 = v10 + 1;
      if (v10 + 1 < (unint64_t)[v8 length]) {
        break;
      }
    }
    id v16 = (void *)[[NSString alloc] initWithCharacters:&v22 length:1];
    [v9 appendString:v16];

    uint64_t v12 = v10;
LABEL_14:
    uint64_t v10 = v12 + 1;
    if (v12 + 1 >= (unint64_t)[v8 length]) {
      goto LABEL_15;
    }
  }
  __int16 v22 = [v8 characterAtIndex:v10 + 1];
  v13 = (__CFString *)[[NSString alloc] initWithCharacters:&v22 length:1];
  if (v22 == 75)
  {
    id v17 = [NSString alloc];
    v18 = (void *)*a5;
    *a5 += 8;
    id v19 = (void *)[v17 initWithFormat:@"%@", *v18];
    [v9 appendString:v19];

LABEL_13:
    goto LABEL_14;
  }
  if (v22 == 37)
  {
    v14 = v9;
    uint64_t v15 = v13;
LABEL_12:
    [v14 appendString:v15];
    goto LABEL_13;
  }
  if ([@"@" containsString:v13])
  {
    *a5 += 8;
    v14 = v9;
    uint64_t v15 = @"?";
    goto LABEL_12;
  }
  v21 = TRILogCategory_Server();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v24 = "+[NSPredicate(TRI) _triAnnotatePredicate:format:usingArgs:]";
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "%s: unsupported format specifier \"%@\"", buf, 0x16u);
  }

LABEL_16:
}

+ (id)triLoggablePredicateWithFormat:()TRI
{
  id v10 = a3;
  int v11 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:v10 arguments:&a9];
  v14 = &a9;
  [a1 _triAnnotatePredicate:v12 format:v10 usingArgs:&v14];

  return v12;
}

+ (id)triLoggablePredicateWithValue:()TRI
{
  id v4 = (void *)MEMORY[0x1E016E7F0]();
  v5 = [MEMORY[0x1E4F28F60] predicateWithValue:a3];
  uint64_t v6 = v5;
  if (a3) {
    id v7 = @"TRUEPREDICATE";
  }
  else {
    id v7 = @"FALSEPREDICATE";
  }
  [v5 triSetLogDesc:v7];
  return v6;
}

@end