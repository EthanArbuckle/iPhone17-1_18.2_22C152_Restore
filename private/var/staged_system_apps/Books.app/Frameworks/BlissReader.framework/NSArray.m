@interface NSArray
- (id)arrayPiecewiseTransformedBy:(id)a3;
- (id)tsaxExtractElementsOfType:(Class)a3;
- (id)tsaxObjectsPassingTest:(id)a3;
@end

@implementation NSArray

- (id)arrayPiecewiseTransformedBy:(id)a3
{
  id v5 = +[NSMutableArray array];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6D644;
  v7[3] = &unk_458040;
  v7[4] = v5;
  v7[5] = a3;
  [(NSArray *)self enumerateObjectsUsingBlock:v7];
  return v5;
}

- (id)tsaxExtractElementsOfType:(Class)a3
{
  v4 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSArray *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(self);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v9];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)tsaxObjectsPassingTest:(id)a3
{
  v4 = [(NSArray *)self indexesOfObjectsPassingTest:a3];

  return [(NSArray *)self objectsAtIndexes:v4];
}

@end