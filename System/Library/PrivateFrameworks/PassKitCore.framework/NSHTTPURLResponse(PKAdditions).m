@interface NSHTTPURLResponse(PKAdditions)
- (id)pk_valueForHTTPHeaderField:()PKAdditions;
@end

@implementation NSHTTPURLResponse(PKAdditions)

- (id)pk_valueForHTTPHeaderField:()PKAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 allHeaderFields];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = objc_msgSend(v5, "allKeys", 0);
  v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (![v10 caseInsensitiveCompare:v4])
        {
          v7 = [v5 valueForKey:v10];
          goto LABEL_11;
        }
      }
      v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

@end