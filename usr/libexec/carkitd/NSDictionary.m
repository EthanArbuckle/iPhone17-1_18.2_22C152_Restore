@interface NSDictionary
- (id)cr_dictionaryWithValuesForPresentKeys:(id)a3;
@end

@implementation NSDictionary

- (id)cr_dictionaryWithValuesForPresentKeys:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v13 = -[NSDictionary objectForKey:](self, "objectForKey:", v12, (void)v15);
          if (v13) {
            [v6 setObject:v13 forKey:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v6 = &__NSDictionary0__struct;
  }

  return v6;
}

@end