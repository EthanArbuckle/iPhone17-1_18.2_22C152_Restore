@interface NDTObjectCache
- (NDTObjectCache)initWithCapacity:(int64_t)a3;
- (NSMutableOrderedSet)cache;
- (double)hitRatio;
- (id)cachedCopy:(id)a3;
- (id)description;
- (int64_t)accesses;
- (int64_t)capacity;
- (int64_t)hits;
- (void)purge;
- (void)setAccesses:(int64_t)a3;
- (void)setCache:(id)a3;
- (void)setCapacity:(int64_t)a3;
- (void)setHits:(int64_t)a3;
@end

@implementation NDTObjectCache

- (NDTObjectCache)initWithCapacity:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NDTObjectCache;
  v4 = [(NDTObjectCache *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableOrderedSet *)[objc_alloc((Class)NSMutableOrderedSet) initWithCapacity:a3];
    cache = v4->_cache;
    v4->_cache = v5;

    v4->_capacity = a3;
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (id)cachedCopy:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NDTObjectCache *)self setAccesses:(char *)[(NDTObjectCache *)self accesses] + 1];
  v6 = [(NDTObjectCache *)self cache];
  id v7 = [v6 indexOfObject:v4];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [v4 copy];
    while (1)
    {
      v9 = [(NDTObjectCache *)self cache];
      id v10 = [v9 count];
      unint64_t v11 = [(NDTObjectCache *)self capacity];

      if ((unint64_t)v10 < v11) {
        break;
      }
      v12 = [(NDTObjectCache *)self cache];
      v13 = [(NDTObjectCache *)self cache];
      [v12 removeObjectAtIndex:((char *)[v13 count]) - 1];
    }
  }
  else
  {
    [(NDTObjectCache *)self setHits:(char *)[(NDTObjectCache *)self hits] + 1];
    v14 = [(NDTObjectCache *)self cache];
    id v8 = [v14 objectAtIndex:v7];

    v15 = [(NDTObjectCache *)self cache];
    [v15 removeObjectAtIndex:v7];
  }
  v16 = [(NDTObjectCache *)self cache];
  [v16 insertObject:v8 atIndex:0];

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)purge
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NDTObjectCache *)self cache];
  [v4 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (double)hitRatio
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NDTObjectCache *)self accesses] < 1)
  {
    double v5 = 0.0;
  }
  else
  {
    double v4 = (double)[(NDTObjectCache *)self hits];
    double v5 = v4 / (double)[(NDTObjectCache *)self accesses];
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  int64_t v5 = [(NDTObjectCache *)self capacity];
  [(NDTObjectCache *)self hitRatio];
  id v7 = +[NSString stringWithFormat:@"<%@:%p capacity:%d, hitRatio:%f>", v4, self, v5, v6];

  return v7;
}

- (NSMutableOrderedSet)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(int64_t)a3
{
  self->_capacity = a3;
}

- (int64_t)hits
{
  return self->_hits;
}

- (void)setHits:(int64_t)a3
{
  self->_hits = a3;
}

- (int64_t)accesses
{
  return self->_accesses;
}

- (void)setAccesses:(int64_t)a3
{
  self->_accesses = a3;
}

- (void).cxx_destruct
{
}

@end