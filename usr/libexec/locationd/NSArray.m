@interface NSArray
- (id)cl_deepCopy;
- (id)cl_deepMutableCopy;
@end

@implementation NSArray

- (id)cl_deepCopy
{
  id v2 = [(NSArray *)self cl_deepMutableCopy];
  id v3 = [objc_alloc((Class)NSArray) initWithArray:v2];

  return v3;
}

- (id)cl_deepMutableCopy
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self, "count")];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSArray *)self countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(self);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) cl_deepCopy];
        [v3 addObject:v8];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)self countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return v3;
}

@end