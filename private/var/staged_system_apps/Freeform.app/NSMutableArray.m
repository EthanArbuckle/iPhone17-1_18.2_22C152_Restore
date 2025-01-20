@interface NSMutableArray
- (id)crl_pop;
- (id)crlaxPopObject;
- (unint64_t)crl_insertObject:(id)a3 usingComparator:(id)a4;
- (void)crl_addNonNilObject:(id)a3;
- (void)crl_addObjects:(id)a3;
- (void)crl_addObjectsFromNonNilArray:(id)a3;
- (void)crl_enqueue:(id)a3;
- (void)crl_removeObjectsIdenticalToObjectsInArray:(id)a3;
- (void)crl_trimObjectsFromIndex:(unint64_t)a3;
- (void)crlaxAddObjectIfNotNil:(id)a3;
- (void)crlaxAddObjectIfNotNilWithAssert:(id)a3;
- (void)crlaxAddObjectsFromArrayIfNotNil:(id)a3;
- (void)crlaxAddObjectsFromArrayIfNotNilWithAssert:(id)a3;
- (void)crlaxAddObjectsInReverseOrder:(id)a3;
@end

@implementation NSMutableArray

- (void)crl_enqueue:(id)a3
{
}

- (id)crl_pop
{
  v3 = [(NSMutableArray *)self lastObject];
  if (v3) {
    [(NSMutableArray *)self removeLastObject];
  }

  return v3;
}

- (void)crl_addObjects:(id)a3
{
  id v4 = a3;
  v8 = (id *)&v9;
  if (v4)
  {
    v5 = v4;
    do
    {
      [(NSMutableArray *)self addObject:v5];
      v6 = v8++;
      id v7 = *v6;

      v5 = v7;
    }
    while (v7);
  }
}

- (void)crl_addNonNilObject:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self, "addObject:");
  }
}

- (void)crl_addObjectsFromNonNilArray:(id)a3
{
  if (a3) {
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:");
  }
}

- (void)crl_removeObjectsIdenticalToObjectsInArray:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  v5 = v4;
  if (self == v4)
  {
    [(NSMutableArray *)self removeAllObjects];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v11 = [(NSMutableArray *)self indexOfObjectIdenticalTo:v10];
          if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            for (id j = v11;
                  j != (id)0x7FFFFFFFFFFFFFFFLL;
                  id j = [(NSMutableArray *)self indexOfObjectIdenticalTo:v10])
            {
              [(NSMutableArray *)self removeObjectAtIndex:j];
            }
          }
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)crl_trimObjectsFromIndex:(unint64_t)a3
{
  v5 = (char *)[(NSMutableArray *)self count];
  if ((unint64_t)v5 > a3)
  {
    -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", a3, &v5[-a3]);
  }
}

- (unint64_t)crl_insertObject:(id)a3 usingComparator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, [(NSMutableArray *)self count], 1024, v6);

  [(NSMutableArray *)self insertObject:v7 atIndex:v8];
  return (unint64_t)v8;
}

- (void)crlaxAddObjectIfNotNil:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self, "addObject:");
  }
}

- (void)crlaxAddObjectIfNotNilWithAssert:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    [(NSMutableArray *)self addObject:v4];
  }
  else if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Parameter was nil.", v6, v7, v8, v9, v10, v11))abort(); {
  }
    }
}

- (void)crlaxAddObjectsFromArrayIfNotNil:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v7 = v4;
    id v6 = [v4 count];
    v5 = v7;
    if (v6)
    {
      [(NSMutableArray *)self addObjectsFromArray:v7];
      v5 = v7;
    }
  }
}

- (void)crlaxAddObjectsFromArrayIfNotNilWithAssert:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    [(NSMutableArray *)self addObjectsFromArray:v4];
  }
  else if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Parameter was nil.", v6, v7, v8, v9, v10, v11))abort(); {
  }
    }
}

- (void)crlaxAddObjectsInReverseOrder:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = [v4 reverseObjectEnumerator];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(NSMutableArray *)self addObject:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (id)crlaxPopObject
{
  v3 = [(NSMutableArray *)self lastObject];
  [(NSMutableArray *)self removeLastObject];

  return v3;
}

@end