@interface NSMutableArray
- (void)_maps_moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)_maps_popToFirstContextOfClass:(Class)a3;
- (void)_maps_popToLastContextOfClass:(Class)a3;
- (void)addObjectIfNotNil:(id)a3;
- (void)trimToLength:(unint64_t)a3;
@end

@implementation NSMutableArray

- (void)_maps_popToFirstContextOfClass:(Class)a3
{
  if (a3)
  {
    v4 = -[NSMutableArray _maps_firstContextOfClass:](self, "_maps_firstContextOfClass:");
    v5 = [(NSMutableArray *)self indexOfObject:v4];

    if (v5 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL && v5 != (char *)[(NSMutableArray *)self count] - 1)
    {
      v6 = v5 + 1;
      v7 = (char *)((unsigned char *)[(NSMutableArray *)self count] - v6);
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v6, v7);
    }
  }
}

- (void)_maps_popToLastContextOfClass:(Class)a3
{
  if (a3)
  {
    v4 = -[NSMutableArray _maps_lastContextOfClass:](self, "_maps_lastContextOfClass:");
    v5 = [(NSMutableArray *)self indexOfObject:v4];

    if (v5 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL && v5 != (char *)[(NSMutableArray *)self count] - 1)
    {
      v6 = v5 + 1;
      v7 = (char *)((unsigned char *)[(NSMutableArray *)self count] - v6);
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v6, v7);
    }
  }
}

- (void)trimToLength:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self count] > a3)
  {
    v5 = (char *)[(NSMutableArray *)self count] - a3;
    -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", a3, v5);
  }
}

- (void)addObjectIfNotNil:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self, "addObject:");
  }
}

- (void)_maps_moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  if ((unint64_t)[(NSMutableArray *)self count] <= a3)
  {
    NSExceptionName v7 = NSInvalidArgumentException;
    CFStringRef v8 = @"fromIndex out of bounds";
    goto LABEL_5;
  }
  if ((char *)[(NSMutableArray *)self count] - 1 < (char *)a4)
  {
    NSExceptionName v7 = NSInvalidArgumentException;
    CFStringRef v8 = @"toIndex out of bounds";
LABEL_5:
    id v9 = +[NSException exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
    goto LABEL_7;
  }
  id v9 = [(NSMutableArray *)self objectAtIndexedSubscript:a3];
  [(NSMutableArray *)self removeObjectAtIndex:a3];
  [(NSMutableArray *)self insertObject:v9 atIndex:a4];
LABEL_7:
}

@end