@interface SESAtomicArray
- (SESAtomicArray)init;
- (id)firstWhere:(id)a3;
- (id)snapshot;
- (void)addObject:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
@end

@implementation SESAtomicArray

- (SESAtomicArray)init
{
  v7.receiver = self;
  v7.super_class = (Class)SESAtomicArray;
  v2 = [(SESAtomicArray *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    objects = v3->_objects;
    v3->_objects = (NSMutableArray *)v4;
  }
  return v3;
}

- (id)snapshot
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_objects copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_objects addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_objects removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeAllObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_objects removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (id)firstWhere:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(NSMutableArray *)self->_objects find:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void).cxx_destruct
{
}

@end