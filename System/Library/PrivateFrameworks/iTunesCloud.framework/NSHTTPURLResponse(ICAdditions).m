@interface NSHTTPURLResponse(ICAdditions)
- (BOOL)hasCacheControl;
- (double)cacheControlMaxAge;
- (id)_cacheControlParameters;
- (id)ic_valueForHTTPHeaderField:()ICAdditions;
@end

@implementation NSHTTPURLResponse(ICAdditions)

- (id)ic_valueForHTTPHeaderField:()ICAdditions
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__26589;
  v16 = __Block_byref_object_dispose__26590;
  id v17 = 0;
  v5 = [a1 allHeaderFields];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__NSHTTPURLResponse_ICAdditions__ic_valueForHTTPHeaderField___block_invoke;
  v9[3] = &unk_1E5ACC540;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_cacheControlParameters
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v2 = objc_msgSend(a1, "ic_valueForHTTPHeaderField:", @"Cache-Control");
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v15 = v2;
    id v4 = [v2 componentsSeparatedByString:@","];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"="];
          if ([v9 count] == 2)
          {
            id v10 = [v9 objectAtIndex:0];
            v11 = [v10 stringByTrimmingCharactersInSet:v3];

            uint64_t v12 = [v9 objectAtIndex:1];
            v13 = [v12 stringByTrimmingCharactersInSet:v3];

            [v16 setObject:v13 forKey:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    v2 = v15;
  }

  return v16;
}

- (double)cacheControlMaxAge
{
  v1 = [a1 _cacheControlParameters];
  v2 = [v1 objectForKey:@"max-age"];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (BOOL)hasCacheControl
{
  v1 = objc_msgSend(a1, "ic_valueForHTTPHeaderField:", @"Cache-Control");
  BOOL v2 = v1 != 0;

  return v2;
}

@end