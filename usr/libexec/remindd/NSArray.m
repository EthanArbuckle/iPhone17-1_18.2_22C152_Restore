@interface NSArray
- (BOOL)ic_containsObjectPassingTest:(id)a3;
- (BOOL)ic_indexIsValid:(int64_t)a3;
- (id)ic_arrayByAddingNonNilObject:(id)a3;
- (id)ic_arrayByAddingObjectsFromNonNilArray:(id)a3;
- (id)ic_arrayByGroupingIntoArraysWithMaxCount:(unint64_t)a3;
- (id)ic_map:(id)a3;
- (id)ic_objectAfter:(id)a3;
- (id)ic_objectAfter:(id)a3 wrap:(BOOL)a4;
- (id)ic_objectBefore:(id)a3;
- (id)ic_objectBefore:(id)a3 wrap:(BOOL)a4;
- (id)ic_objectPassingTest:(id)a3;
- (id)ic_objectsOfClass:(Class)a3;
- (id)ic_objectsPassingTest:(id)a3;
- (id)ic_randomObject;
- (id)jsonify;
- (unint64_t)ic_indexOfSortedObject:(id)a3 insertionIndex:(unint64_t *)a4 usingComparator:(id)a5;
@end

@implementation NSArray

- (id)ic_randomObject
{
  v3 = [(NSArray *)self count];
  if (v3)
  {
    v3 = [(NSArray *)self objectAtIndexedSubscript:arc4random_uniform((uint32_t)[(NSArray *)self count])];
  }

  return v3;
}

- (id)ic_objectPassingTest:(id)a3
{
  NSUInteger v4 = [(NSArray *)self indexOfObjectPassingTest:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self objectAtIndex:v4];
  }

  return v5;
}

- (BOOL)ic_containsObjectPassingTest:(id)a3
{
  v3 = [(NSArray *)self ic_objectPassingTest:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)ic_objectsPassingTest:(id)a3
{
  BOOL v4 = [(NSArray *)self indexesOfObjectsPassingTest:a3];
  v5 = [(NSArray *)self objectsAtIndexes:v4];

  return v5;
}

- (id)ic_objectsOfClass:(Class)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005D3C0;
  v5[3] = &unk_1008B00A0;
  v5[4] = a3;
  v3 = [(NSArray *)self ic_objectsPassingTest:v5];

  return v3;
}

- (id)ic_arrayByGroupingIntoArraysWithMaxCount:(unint64_t)a3
{
  v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = self;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v9 count:v16];
        if (!v9 || (unint64_t)v13 >= a3)
        {
          uint64_t v14 = +[NSMutableArray arrayWithCapacity:a3];

          [v5 addObject:v14];
          v9 = (void *)v14;
        }
        [v9 addObject:v12];
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v5;
}

- (unint64_t)ic_indexOfSortedObject:(id)a3 insertionIndex:(unint64_t *)a4 usingComparator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, [(NSArray *)self count], 1280, v9);

  if (a4) {
    *a4 = v10;
  }
  if (v10 >= [(NSArray *)self count]
    || ([(NSArray *)self objectAtIndexedSubscript:v10],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 isEqual:v8],
        v11,
        (v12 & 1) == 0))
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)ic_indexIsValid:(int64_t)a3
{
  return a3 >= 1 && [(NSArray *)self count] > a3;
}

- (id)ic_objectBefore:(id)a3
{
  return [(NSArray *)self ic_objectBefore:a3 wrap:0];
}

- (id)ic_objectAfter:(id)a3
{
  return [(NSArray *)self ic_objectAfter:a3 wrap:0];
}

- (id)ic_objectBefore:(id)a3 wrap:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger v6 = [(NSArray *)self indexOfObject:a3];
  id v7 = 0;
  if (v6) {
    int v8 = 1;
  }
  else {
    int v8 = v4;
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8)
  {
    id v7 = [(NSArray *)self objectAtIndexedSubscript:([(NSArray *)self count] + v6 - 1) % [(NSArray *)self count]];
  }

  return v7;
}

- (id)ic_objectAfter:(id)a3 wrap:(BOOL)a4
{
  NSUInteger v6 = [(NSArray *)self indexOfObject:a3];
  if (v6 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL || (id v7 = v6, !a4) && v6 == (char *)[(NSArray *)self count] - 1)
  {
    int v8 = 0;
  }
  else
  {
    int v8 = [(NSArray *)self objectAtIndexedSubscript:(unint64_t)(v7 + 1) % [(NSArray *)self count]];
  }

  return v8;
}

- (id)ic_arrayByAddingNonNilObject:(id)a3
{
  BOOL v4 = self;
  v5 = v4;
  if (a3)
  {
    uint64_t v6 = [(NSArray *)v4 arrayByAddingObject:a3];

    v5 = (void *)v6;
  }

  return v5;
}

- (id)ic_arrayByAddingObjectsFromNonNilArray:(id)a3
{
  BOOL v4 = self;
  v5 = v4;
  if (a3)
  {
    uint64_t v6 = [(NSArray *)v4 arrayByAddingObjectsFromArray:a3];

    v5 = (void *)v6;
  }

  return v5;
}

- (id)ic_map:(id)a3
{
  id v4 = a3;
  +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_10005D93C;
  unsigned __int8 v12 = &unk_1008B00C8;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v4;
  id v5 = v13;
  id v6 = v4;
  [(NSArray *)self enumerateObjectsUsingBlock:&v9];
  id v7 = [v5 copy:v9, v10, v11, v12];

  return v7;
}

- (id)jsonify
{
  v2 = self;
  id v3 = sub_100413F78((Class *)NSMutableArray_ptr, (void (*)(void))&NSArray.makeIterator());

  return v3;
}

@end