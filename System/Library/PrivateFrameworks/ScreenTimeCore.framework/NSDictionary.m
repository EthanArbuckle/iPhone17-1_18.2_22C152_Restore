@interface NSDictionary
- (id)orderedDescription;
@end

@implementation NSDictionary

- (id)orderedDescription
{
  v3 = [(NSDictionary *)self allKeys];
  v4 = [v3 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

  v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        v12 = [v11 orderedDescription];
        [v5 addObject:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = [v5 componentsJoinedByString:&stru_10030A6D8];

  return v13;
}

@end