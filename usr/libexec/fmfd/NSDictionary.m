@interface NSDictionary
+ (NSDictionary)dictionaryWithContentsOfData:(id)a3;
- (NSDictionary)dictionaryWithLowercaseKeys;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
@end

@implementation NSDictionary

+ (NSDictionary)dictionaryWithContentsOfData:(id)a3
{
  uint64_t v5 = 0;
  v3 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:&v5 error:0];

  return (NSDictionary *)v3;
}

- (NSDictionary)dictionaryWithLowercaseKeys
{
  v3 = +[NSMutableDictionary dictionaryWithCapacity:[(NSDictionary *)self count]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(NSDictionary *)self allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [(NSDictionary *)self objectForKeyedSubscript:v9];
        v11 = [v9 lowercaseString];
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  v4 = [(NSDictionary *)self objectForKey:a3];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

@end