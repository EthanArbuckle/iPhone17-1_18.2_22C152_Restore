@interface NSMutableArray
- (id)tsaxPopObject;
- (void)moveFirstObjectToLast;
- (void)moveLastObjectToFirst;
- (void)shuffle;
- (void)tsaxAddObjectIfNotNil:(id)a3;
- (void)tsaxAddObjectIfNotNilWithAssert:(id)a3;
- (void)tsaxAddObjectsFromArrayIfNotNil:(id)a3;
- (void)tsaxAddObjectsFromArrayIfNotNilWithAssert:(id)a3;
- (void)tsaxAddObjectsInReverseOrder:(id)a3;
@end

@implementation NSMutableArray

- (void)moveFirstObjectToLast
{
  if ([(NSMutableArray *)self count])
  {
    id v3 = [(NSMutableArray *)self objectAtIndex:0];
    [(NSMutableArray *)self removeObjectAtIndex:0];
    [(NSMutableArray *)self addObject:v3];
  }
}

- (void)moveLastObjectToFirst
{
  if ([(NSMutableArray *)self count])
  {
    id v3 = [(NSMutableArray *)self lastObject];
    [(NSMutableArray *)self removeLastObject];
    [(NSMutableArray *)self insertObject:v3 atIndex:0];
  }
}

- (void)shuffle
{
  id v3 = (char *)[(NSMutableArray *)self count];
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
      [(NSMutableArray *)self exchangeObjectAtIndex:i withObjectAtIndex:arc4random() % (unint64_t)(i + 1)];
  }
}

- (void)tsaxAddObjectIfNotNil:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self, "addObject:");
  }
}

- (void)tsaxAddObjectIfNotNilWithAssert:(id)a3
{
  if (a3)
  {
    -[NSMutableArray addObject:](self, "addObject:");
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Parameter was nil.", v4, v5, v6, v7, v8, vars0))abort(); {
  }
    }
}

- (void)tsaxAddObjectsFromArrayIfNotNil:(id)a3
{
  if (a3 && [a3 count])
  {
    [(NSMutableArray *)self addObjectsFromArray:a3];
  }
}

- (void)tsaxAddObjectsFromArrayIfNotNilWithAssert:(id)a3
{
  if (a3)
  {
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:");
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Parameter was nil.", v4, v5, v6, v7, v8, vars0))abort(); {
  }
    }
}

- (void)tsaxAddObjectsInReverseOrder:(id)a3
{
  if ([a3 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [a3 reverseObjectEnumerator];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(NSMutableArray *)self addObject:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (id)tsaxPopObject
{
  id v3 = [(NSMutableArray *)self lastObject];
  [(NSMutableArray *)self removeLastObject];

  return v3;
}

@end