@interface NSURLComponents(SXAdditions)
- (id)queryValueForName:()SXAdditions;
@end

@implementation NSURLComponents(SXAdditions)

- (id)queryValueForName:()SXAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = objc_msgSend(a1, "queryItems", 0);
    v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v10 = [v9 name];
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            v12 = [v9 value];
            v6 = [v12 stringByRemovingPercentEncoding];

            goto LABEL_12;
          }
        }
        v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
    v6 = 0;
  }

  return v6;
}

@end