@interface NSURLUtil
+ (id)dictionaryToQueryString:(id)a3;
+ (id)queryStringToQueryDictionary:(id)a3;
@end

@implementation NSURLUtil

+ (id)queryStringToQueryDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [a3 componentsSeparatedByString:@"&"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) componentsSeparatedByString:@"="];
        v10 = [v9 objectAtIndex:0];
        v11 = [MEMORY[0x1E4F1CA98] null];
        if ((unint64_t)[v9 count] >= 2)
        {
          uint64_t v12 = [v9 objectAtIndex:1];

          v11 = (void *)v12;
        }
        [v4 setObject:v11 forKey:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)dictionaryToQueryString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = objc_msgSend(v3, "keyEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v7)
        {
          v11 = [v7 stringByAppendingString:@"&"];
        }
        else
        {
          v11 = &stru_1F03A51F0;
        }
        uint64_t v7 = [(__CFString *)v11 stringByAppendingString:v10];

        uint64_t v12 = [v3 objectForKey:v10];
        v13 = [MEMORY[0x1E4F1CA98] null];

        if (v12 != v13)
        {
          v14 = [v7 stringByAppendingString:@"="];

          uint64_t v7 = [v14 stringByAppendingString:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end