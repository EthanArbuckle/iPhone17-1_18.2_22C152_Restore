@interface PUIJSONSerialization
+ (id)dataWithJSONObject:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (id)dateToString:(id)a3;
+ (id)recursivelyReplaceNSDateWithNSString:(id)a3;
@end

@implementation PUIJSONSerialization

+ (id)recursivelyReplaceNSDateWithNSString:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v12 = [v6 objectForKeyedSubscript:v11];
          v13 = [a1 recursivelyReplaceNSDateWithNSString:v12];
          [v5 setObject:v13 forKeyedSubscript:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = [a1 dateToString:v4];
      }
      else
      {
        id v20 = v4;
      }
      v19 = v20;
      goto LABEL_23;
    }
    v5 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = v4;
    uint64_t v14 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v6);
          }
          v18 = objc_msgSend(a1, "recursivelyReplaceNSDateWithNSString:", *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
          [v5 addObject:v18];
        }
        uint64_t v15 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
    }
  }

  v19 = (void *)[v5 copy];
LABEL_23:

  return v19;
}

+ (id)dateToString:(id)a3
{
  uint64_t v3 = dateToString__onceToken[0];
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(dateToString__onceToken, &__block_literal_global_23);
  }
  v5 = [(id)dateToString__formatter stringFromDate:v4];

  return v5;
}

void __37__PUIJSONSerialization_dateToString___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)dateToString__formatter;
  dateToString__formatter = v0;

  [(id)dateToString__formatter setFormatOptions:3955];
  id v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [(id)dateToString__formatter setTimeZone:v2];
}

+ (id)dataWithJSONObject:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8 = [a1 recursivelyReplaceNSDateWithNSString:a3];
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PUIJSONSerialization;
  uint64_t v9 = objc_msgSendSuper2(&v11, sel_dataWithJSONObject_options_error_, v8, a4, a5);

  return v9;
}

@end