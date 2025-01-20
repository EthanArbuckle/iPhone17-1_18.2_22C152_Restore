@interface NSDictionary
- (id)joinedDescription;
@end

@implementation NSDictionary

- (id)joinedDescription
{
  v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = self;
  id v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [(NSDictionary *)v4 objectForKeyedSubscript:v9];
        v11 = [v9 description];
        v12 = [v10 description];
        v13 = +[NSString stringWithFormat:@"%@: %@", v11, v12, (void)v16];
        [v3 addObject:v13];
      }
      id v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v14 = [v3 componentsJoinedByString:@","];

  return v14;
}

@end