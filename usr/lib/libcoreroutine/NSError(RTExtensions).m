@interface NSError(RTExtensions)
- (id)_detailedErrors;
- (id)_underlyingErrorsRTMultiError;
- (id)flattenErrors;
- (uint64_t)isOnlyThrottlingError;
- (uint64_t)isOnlyTimeoutError;
@end

@implementation NSError(RTExtensions)

- (uint64_t)isOnlyThrottlingError
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v1 = [a1 flattenErrors];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v2)
  {
    uint64_t v13 = 1;
    goto LABEL_19;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v16;
  uint64_t v5 = *MEMORY[0x1E4F63EB0];
  while (2)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v16 != v4) {
        objc_enumerationMutation(v1);
      }
      v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      v8 = [v7 domain];
      v9 = GEOErrorDomain();
      if (([v8 isEqualToString:v9] & 1) == 0)
      {

LABEL_18:
        uint64_t v13 = 0;
        goto LABEL_19;
      }
      if ([v7 code] == -7)
      {
        v10 = [v7 userInfo];
        v11 = [v10 objectForKeyedSubscript:v5];
        if ([v11 integerValue] == 429)
        {

          continue;
        }
        uint64_t v12 = [v7 code];
      }
      else
      {
        uint64_t v12 = [v7 code];
      }

      if (v12 != -3) {
        goto LABEL_18;
      }
    }
    uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
    uint64_t v13 = 1;
    if (v3) {
      continue;
    }
    break;
  }
LABEL_19:

  return v13;
}

- (uint64_t)isOnlyTimeoutError
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v1 = [a1 flattenErrors];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    uint64_t v5 = *MEMORY[0x1E4F5CFE8];
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v8 = [v7 domain];
        if (![v8 isEqualToString:v5])
        {

LABEL_13:
          uint64_t v10 = 0;
          goto LABEL_14;
        }
        uint64_t v9 = [v7 code];

        if (v9 != 15) {
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v10 = 1;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
LABEL_14:

  return v10;
}

- (id)_underlyingErrorsRTMultiError
{
  uint64_t v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F5CFE8]] && objc_msgSend(a1, "code") == 9)
  {
    uint64_t v3 = [a1 userInfo];
    uint64_t v4 = *MEMORY[0x1E4F5CFE0];
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5CFE0]];

    if (v5)
    {
      v6 = [a1 userInfo];
      v7 = [v6 objectForKeyedSubscript:v4];

      goto LABEL_7;
    }
  }
  else
  {
  }
  v7 = [MEMORY[0x1E4F1C978] array];
LABEL_7:

  return v7;
}

- (id)_detailedErrors
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [a1 _underlyingErrorsRTMultiError];
  [v2 addObjectsFromArray:v3];

  uint64_t v4 = [a1 underlyingErrors];
  [v2 addObjectsFromArray:v4];

  return v2;
}

- (id)flattenErrors
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [a1 _detailedErrors];
  if ([v3 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) flattenErrors:v11];
          [v2 addObjectsFromArray:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [v2 addObject:a1];
  }

  return v2;
}

@end