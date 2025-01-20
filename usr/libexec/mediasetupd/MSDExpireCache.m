@interface MSDExpireCache
- (MSDExpireCache)initWithExpiration:(double)a3;
- (MSDExpireCache)initWithExpiration:(double)a3 countLimit:(unint64_t)a4;
- (NSCache)storage;
- (double)expiration;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setExpiration:(double)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setStorage:(id)a3;
@end

@implementation MSDExpireCache

- (MSDExpireCache)initWithExpiration:(double)a3 countLimit:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MSDExpireCache;
  v6 = [(MSDExpireCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_expiration = a3;
    uint64_t v8 = objc_opt_new();
    storage = v7->_storage;
    v7->_storage = (NSCache *)v8;

    [(NSCache *)v7->_storage setCountLimit:a4];
  }
  return v7;
}

- (MSDExpireCache)initWithExpiration:(double)a3
{
  return [(MSDExpireCache *)self initWithExpiration:10 countLimit:a3];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSCache *)self->_storage objectForKey:v4];
  if (!v5) {
    goto LABEL_4;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [v5 creationTime];
  double v8 = v7;
  [(MSDExpireCache *)self expiration];
  if (v8 + v9 < Current)
  {
    [(NSCache *)self->_storage removeObjectForKey:v4];
LABEL_4:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = [v5 value];
LABEL_6:

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [[_MSDExpireCacheEntry alloc] initWithValue:v7];

  [(NSCache *)self->_storage setObject:v8 forKey:v6];
}

- (void)removeObjectForKey:(id)a3
{
}

- (void)removeAllObjects
{
}

- (unint64_t)count
{
  v2 = [(NSCache *)self->_storage allObjects];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSCache)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (double)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(double)a3
{
  self->_expiration = a3;
}

- (void).cxx_destruct
{
}

@end