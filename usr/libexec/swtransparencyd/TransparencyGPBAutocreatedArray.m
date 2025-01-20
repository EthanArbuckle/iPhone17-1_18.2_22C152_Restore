@interface TransparencyGPBAutocreatedArray
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObject:(id)a3;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation TransparencyGPBAutocreatedArray

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBAutocreatedArray;
  [(TransparencyGPBAutocreatedArray *)&v3 dealloc];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_array count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_array objectAtIndex:a3];
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  array = self->_array;
  if (!array)
  {
    array = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_array = array;
  }
  [(NSMutableArray *)array insertObject:a3 atIndex:a4];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_1000EB4DC(autocreator, (uint64_t)self);
  }
}

- (void)removeObject:(id)a3
{
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
}

- (void)addObject:(id)a3
{
  array = self->_array;
  if (!array)
  {
    array = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_array = array;
  }
  [(NSMutableArray *)array addObject:a3];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_1000EB4DC(autocreator, (uint64_t)self);
  }
}

- (void)removeLastObject
{
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  array = self->_array;
  if (array)
  {
    return [(NSMutableArray *)array copyWithZone:a3];
  }
  else
  {
    v5 = +[NSMutableArray allocWithZone:a3];
    return [(NSMutableArray *)v5 init];
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  array = self->_array;
  if (array)
  {
    return [(NSMutableArray *)array mutableCopyWithZone:a3];
  }
  else
  {
    v5 = +[NSMutableArray allocWithZone:a3];
    return [(NSMutableArray *)v5 init];
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)[(NSMutableArray *)self->_array countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

@end