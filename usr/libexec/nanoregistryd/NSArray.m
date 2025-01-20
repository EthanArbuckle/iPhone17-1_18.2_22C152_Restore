@interface NSArray
- (id)joinedDescription;
@end

@implementation NSArray

- (id)joinedDescription
{
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) description];
        v10 = +[NSString stringWithFormat:@"%ld: %@", 0, v9, (void)v13];
        [v3 addObject:v10];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = [v3 componentsJoinedByString:@","];

  return v11;
}

@end