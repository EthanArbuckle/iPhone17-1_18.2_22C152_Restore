@interface NSString(PowerlogExtensions)
- (id)stringByReplacingOccurrencesOfStrings:()PowerlogExtensions withString:;
- (id)strip;
- (id)tokenizedByString:()PowerlogExtensions;
- (id)tokenizedByStrings:()PowerlogExtensions;
- (uint64_t)compareFloat:()PowerlogExtensions;
- (uint64_t)compareInt:()PowerlogExtensions;
- (uint64_t)containsStringInArray:()PowerlogExtensions;
- (uint64_t)matchingStringInArray:()PowerlogExtensions;
@end

@implementation NSString(PowerlogExtensions)

- (id)stringByReplacingOccurrencesOfStrings:()PowerlogExtensions withString:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      v13 = v8;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v6);
        }
        id v8 = [v13 stringByReplacingOccurrencesOfString:*(void *)(*((void *)&v15 + 1) + 8 * v12) withString:v7];

        ++v12;
        v13 = v8;
      }
      while (v10 != v12);
      uint64_t v10 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v8;
}

- (id)strip
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (id)tokenizedByString:()PowerlogExtensions
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1C1869120]();
  id v6 = [MEMORY[0x1E4F28FE8] scannerWithString:a1];
  id v7 = objc_opt_new();
  if (([v6 isAtEnd] & 1) == 0)
  {
    id v8 = 0;
    do
    {
      uint64_t v9 = v8;
      id v12 = v8;
      int v10 = [v6 scanUpToString:v4 intoString:&v12];
      id v8 = v12;

      if (v10) {
        [v7 addObject:v8];
      }
      else {
        objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);
      }
    }
    while (![v6 isAtEnd]);
  }

  return v7;
}

- (id)tokenizedByStrings:()PowerlogExtensions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", a1, 0);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v12 = v5;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = [*(id *)(*((void *)&v20 + 1) + 8 * j) tokenizedByString:v10];
              [v11 addObjectsFromArray:v17];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v14);
        }

        v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  return v5;
}

- (uint64_t)matchingStringInArray:()PowerlogExtensions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= [a1 caseInsensitiveCompare:*(void *)(*((void *)&v11 + 1) + 8 * i)] == 0;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (uint64_t)containsStringInArray:()PowerlogExtensions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= [a1 rangeOfString:*(void *)(*((void *)&v11 + 1) + 8 * i)] != 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (uint64_t)compareFloat:()PowerlogExtensions
{
  id v4 = a3;
  [a1 floatValue];
  float v6 = v5;
  [v4 floatValue];
  float v8 = v7;

  uint64_t v9 = -1;
  if (v6 >= v8) {
    uint64_t v9 = 1;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

- (uint64_t)compareInt:()PowerlogExtensions
{
  id v4 = a3;
  int v5 = [a1 intValue];
  int v6 = [v4 intValue];

  uint64_t v7 = -1;
  if (v5 >= v6) {
    uint64_t v7 = 1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

@end