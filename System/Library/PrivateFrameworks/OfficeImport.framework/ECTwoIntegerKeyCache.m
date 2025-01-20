@interface ECTwoIntegerKeyCache
- (BOOL)assertForCollisions;
- (ECTwoIntegerKeyCache)init;
- (id)objectForKey1:(int64_t)a3 key2:(int64_t)a4;
- (void)setAssertForCollisions:(BOOL)a3;
- (void)setObject:(id)a3 forKey1:(int64_t)a4 key2:(int64_t)a5;
@end

@implementation ECTwoIntegerKeyCache

- (ECTwoIntegerKeyCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)ECTwoIntegerKeyCache;
  v2 = [(ECTwoIntegerKeyCache *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(OITSUIntegerKeyDictionary);
    mCache = v2->mCache;
    v2->mCache = v3;

    v2->_assertForCollisions = 1;
  }
  return v2;
}

- (id)objectForKey1:(int64_t)a3 key2:(int64_t)a4
{
  v5 = [(OITSUIntegerKeyDictionary *)self->mCache objectForKey:a3];
  objc_super v6 = [v5 objectForKey:a4];

  return v6;
}

- (void)setObject:(id)a3 forKey1:(int64_t)a4 key2:(int64_t)a5
{
  id v9 = a3;
  v8 = [(OITSUIntegerKeyDictionary *)self->mCache objectForKey:a4];
  if (!v8)
  {
    v8 = objc_alloc_init(OITSUIntegerKeyDictionary);
    -[OITSUIntegerKeyDictionary setObject:forKey:](self->mCache, "setObject:forKey:");
  }
  [(OITSUIntegerKeyDictionary *)v8 setObject:v9 forKey:a5];
}

- (BOOL)assertForCollisions
{
  return self->_assertForCollisions;
}

- (void)setAssertForCollisions:(BOOL)a3
{
  self->_assertForCollisions = a3;
}

- (void).cxx_destruct
{
}

@end