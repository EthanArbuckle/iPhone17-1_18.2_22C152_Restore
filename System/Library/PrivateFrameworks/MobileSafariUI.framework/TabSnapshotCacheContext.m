@interface TabSnapshotCacheContext
- (BOOL)updating;
- (NSOrderedSet)identifiersToCache;
- (id)description;
- (unint64_t)capacity;
- (void)setCapacity:(unint64_t)a3;
- (void)setIdentifiersToCache:(id)a3;
- (void)setUpdating:(BOOL)a3;
@end

@implementation TabSnapshotCacheContext

- (NSOrderedSet)identifiersToCache
{
  return self->_identifiersToCache;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (void)setIdentifiersToCache:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  v7 = @"YES";
  if (!self->_updating) {
    v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"<%@: %p updating = %@; capacity = %zu>", v5, self, v7, self->_capacity];;

  return v8;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (void).cxx_destruct
{
}

@end