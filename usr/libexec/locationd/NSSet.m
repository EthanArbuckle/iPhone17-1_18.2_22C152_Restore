@interface NSSet
- (id)cl_deepCopy;
- (id)cl_deepMutableCopy;
- (id)cl_setByRemovingObjectsFromSet:(id)a3;
@end

@implementation NSSet

- (id)cl_deepCopy
{
  id v2 = [(NSSet *)self cl_deepMutableCopy];
  id v3 = [objc_alloc((Class)NSSet) initWithSet:v2];

  return v3;
}

- (id)cl_deepMutableCopy
{
  id v3 = [objc_alloc((Class)NSMutableSet) initWithCapacity:-[NSSet count](self, "count")];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSSet *)self countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      id v5 = [(NSSet *)self countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)cl_setByRemovingObjectsFromSet:(id)a3
{
  id v5 = +[NSMutableSet set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSSet *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(self);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (([a3 containsObject:v10] & 1) == 0) {
          [v5 addObject:v10];
        }
      }
      id v7 = [(NSSet *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return [v5 copy];
}

@end