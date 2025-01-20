@interface NSDictionary
- (id)stringForCaseInsensitiveStringKey:(id)a3;
@end

@implementation NSDictionary

- (id)stringForCaseInsensitiveStringKey:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self;
  id v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!objc_msgSend(v9, "compare:options:", v4, 1, (void)v11))
        {
          id v6 = [(NSDictionary *)v5 objectForKeyedSubscript:v9];
          goto LABEL_11;
        }
      }
      id v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end