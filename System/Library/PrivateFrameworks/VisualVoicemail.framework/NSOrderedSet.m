@interface NSOrderedSet
- (id)arrayByIntersectingWithOrderedSet:(id)a3;
- (id)arrayBySubtractingOrderedSet:(id)a3;
@end

@implementation NSOrderedSet

- (id)arrayBySubtractingOrderedSet:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FEEC;
  v8[3] = &unk_1000C18F8;
  id v9 = a3;
  id v4 = v9;
  v5 = [(NSOrderedSet *)self indexesOfObjectsPassingTest:v8];
  v6 = [(NSOrderedSet *)self objectsAtIndexes:v5];

  return v6;
}

- (id)arrayByIntersectingWithOrderedSet:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FFE0;
  v8[3] = &unk_1000C18F8;
  id v9 = a3;
  id v4 = v9;
  v5 = [(NSOrderedSet *)self indexesOfObjectsPassingTest:v8];
  v6 = [(NSOrderedSet *)self objectsAtIndexes:v5];

  return v6;
}

@end