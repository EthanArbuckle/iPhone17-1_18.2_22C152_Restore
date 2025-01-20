@interface NSMutableSet
- (void)tsu_addNonNilObject:(id)a3;
- (void)tsu_addObjectsFromNonNilArray:(id)a3;
- (void)tsu_removeEqualObject:(id)a3;
- (void)tsu_removeObjectsPassingTest:(id)a3;
- (void)tsu_xorSet:(id)a3;
@end

@implementation NSMutableSet

- (void)tsu_xorSet:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ([(NSMutableSet *)self containsObject:v9]) {
          [(NSMutableSet *)self removeObject:v9];
        }
        else {
          [(NSMutableSet *)self addObject:v9];
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)tsu_addNonNilObject:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self, "addObject:");
  }
}

- (void)tsu_addObjectsFromNonNilArray:(id)a3
{
  if (a3) {
    -[NSMutableSet addObjectsFromArray:](self, "addObjectsFromArray:");
  }
}

- (void)tsu_removeEqualObject:(id)a3
{
  id v5 = [(NSMutableSet *)self allObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 isEqual:a3]) {
          [(NSMutableSet *)self removeObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)tsu_removeObjectsPassingTest:(id)a3
{
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(NSMutableSet *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(self);
          }
          uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          if ((*((unsigned int (**)(id, uint64_t))a3 + 2))(a3, v10))
          {
            if (!v7) {
              id v7 = +[NSMutableSet setWithCapacity:[(NSMutableSet *)self count]];
            }
            [(NSMutableSet *)v7 addObject:v10];
          }
        }
        id v6 = [(NSMutableSet *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
      if (v7) {
        [(NSMutableSet *)self minusSet:v7];
      }
    }
  }
}

@end