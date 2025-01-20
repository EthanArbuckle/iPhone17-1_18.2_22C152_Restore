@interface NSURLComponents(TelephonyUtilities)
- (BOOL)containsPercentEncodedQueryItemWithName:()TelephonyUtilities;
- (BOOL)containsQueryItemWithName:()TelephonyUtilities;
- (id)firstQueryItemWithName:()TelephonyUtilities;
@end

@implementation NSURLComponents(TelephonyUtilities)

- (id)firstQueryItemWithName:()TelephonyUtilities
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = objc_msgSend(a1, "queryItems", 0);
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = [v9 name];
          int v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)containsQueryItemWithName:()TelephonyUtilities
{
  v1 = objc_msgSend(a1, "firstQueryItemWithName:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)containsPercentEncodedQueryItemWithName:()TelephonyUtilities
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = objc_msgSend(a1, "percentEncodedQueryItems", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        int v11 = [v10 name];
        char v12 = [v11 isEqualToString:v4];

        if (v12) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10 != 0;
}

@end