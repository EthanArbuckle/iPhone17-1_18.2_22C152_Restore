@interface NSDictionary
- (id)cl_deepCopy;
- (id)cl_deepMutableCopy;
@end

@implementation NSDictionary

- (id)cl_deepCopy
{
  id v2 = [(NSDictionary *)self cl_deepMutableCopy];
  id v3 = [objc_alloc((Class)NSDictionary) initWithDictionary:v2];

  return v3;
}

- (id)cl_deepMutableCopy
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSDictionary count](self, "count")];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  NSUInteger v4 = [(NSDictionary *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    NSUInteger v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(self);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) cl_deepCopy];
        id v9 = [[-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v8) cl_deepCopy];
        [v3 setObject:v9 forKeyedSubscript:v8];

        ++v7;
      }
      while (v5 != v7);
      NSUInteger v5 = [(NSDictionary *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  return v3;
}

@end