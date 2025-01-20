@interface NSMutableArray
- (id)tsu_dequeue;
- (id)tsu_pop;
- (unint64_t)tsu_insertObject:(id)a3 usingComparator:(id)a4;
- (void)tsu_addNonNilObject:(id)a3;
- (void)tsu_addObjects:(id)a3;
- (void)tsu_addObjectsFromNonNilArray:(id)a3;
- (void)tsu_enqueue:(id)a3;
- (void)tsu_removeObjectsIdenticalToObjectsInArray:(id)a3;
- (void)tsu_trimObjectsFromIndex:(unint64_t)a3;
@end

@implementation NSMutableArray

- (void)tsu_enqueue:(id)a3
{
}

- (id)tsu_dequeue
{
  return [(NSMutableArray *)self tsu_pop];
}

- (id)tsu_pop
{
  id v3 = [(NSMutableArray *)self lastObject];
  if (v3) {
    [(NSMutableArray *)self removeLastObject];
  }
  return v3;
}

- (void)tsu_addObjects:(id)a3
{
  v5 = &v6;
  if (a3)
  {
    do
    {
      -[NSMutableArray addObject:](self, "addObject:");
      v4 = v5++;
    }
    while (*v4);
  }
}

- (void)tsu_addNonNilObject:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self, "addObject:");
  }
}

- (void)tsu_addObjectsFromNonNilArray:(id)a3
{
  if (a3) {
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:");
  }
}

- (void)tsu_removeObjectsIdenticalToObjectsInArray:(id)a3
{
  if (self == a3)
  {
    [(NSMutableArray *)self removeAllObjects];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          id v10 = [(NSMutableArray *)self indexOfObjectIdenticalTo:v9];
          if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            for (id j = v10;
                  j != (id)0x7FFFFFFFFFFFFFFFLL;
                  id j = [(NSMutableArray *)self indexOfObjectIdenticalTo:v9])
            {
              [(NSMutableArray *)self removeObjectAtIndex:j];
            }
          }
        }
        id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)tsu_trimObjectsFromIndex:(unint64_t)a3
{
  id v5 = (char *)[(NSMutableArray *)self count];
  if ((unint64_t)v5 > a3)
  {
    -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", a3, &v5[-a3]);
  }
}

- (unint64_t)tsu_insertObject:(id)a3 usingComparator:(id)a4
{
  id v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, [(NSMutableArray *)self count], 1024, a4);
  [(NSMutableArray *)self insertObject:a3 atIndex:v6];
  return (unint64_t)v6;
}

@end