@interface NSMutableSet
- (void)crl_addNonNilObject:(id)a3;
- (void)crl_addObjectsFromNonNilArray:(id)a3;
- (void)crl_removeEqualObject:(id)a3;
- (void)crl_removeObjectsPassingTest:(id)a3;
- (void)crl_xorSet:(id)a3;
@end

@implementation NSMutableSet

- (void)crl_xorSet:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ([(NSMutableSet *)self containsObject:v9]) {
          [(NSMutableSet *)self removeObject:v9];
        }
        else {
          [(NSMutableSet *)self addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)crl_addNonNilObject:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self, "addObject:");
  }
}

- (void)crl_addObjectsFromNonNilArray:(id)a3
{
  if (a3) {
    -[NSMutableSet addObjectsFromArray:](self, "addObjectsFromArray:");
  }
}

- (void)crl_removeEqualObject:(id)a3
{
  id v4 = a3;
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
        if ([v10 isEqual:v4]) {
          [(NSMutableSet *)self removeObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)crl_removeObjectsPassingTest:(id)a3
{
  id v4 = (unsigned int (**)(id, void))a3;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = self;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v6)
    {
      uint64_t v8 = v5;
      goto LABEL_16;
    }
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (v4[2](v4, v11))
        {
          if (!v8)
          {
            uint64_t v8 = +[NSMutableSet setWithCapacity:[(NSMutableSet *)v5 count]];
          }
          [v8 addObject:v11, v12];
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);

    if (v8)
    {
      [(NSMutableSet *)v5 minusSet:v8];
LABEL_16:
    }
  }
}

@end