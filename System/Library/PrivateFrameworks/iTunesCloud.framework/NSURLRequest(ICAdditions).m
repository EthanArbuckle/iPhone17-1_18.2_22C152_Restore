@interface NSURLRequest(ICAdditions)
- (id)ic_valueForHTTPHeaderField:()ICAdditions;
- (id)ic_valuesForCookieWithName:()ICAdditions;
@end

@implementation NSURLRequest(ICAdditions)

- (id)ic_valuesForCookieWithName:()ICAdditions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  v17 = objc_msgSend(a1, "ic_valueForHTTPHeaderField:", @"Cookie");
  v4 = [v17 componentsSeparatedByString:@"; "];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = [v9 rangeOfString:@"=" options:2];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = v10;
          uint64_t v13 = v11;
          v14 = [v9 substringToIndex:v10];
          if (![v19 caseInsensitiveCompare:v14])
          {
            v15 = [v9 substringFromIndex:v12 + v13];
            [v18 addObject:v15];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v18;
}

- (id)ic_valueForHTTPHeaderField:()ICAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 valueForHTTPHeaderField:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__35695;
    v17 = __Block_byref_object_dispose__35696;
    id v18 = 0;
    v8 = [a1 allHTTPHeaderFields];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__NSURLRequest_ICAdditions__ic_valueForHTTPHeaderField___block_invoke;
    v10[3] = &unk_1E5ACC540;
    id v11 = v4;
    uint64_t v12 = &v13;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];

    id v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }

  return v7;
}

@end