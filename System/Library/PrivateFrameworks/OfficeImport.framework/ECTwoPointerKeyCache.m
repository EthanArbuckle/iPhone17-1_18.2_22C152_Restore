@interface ECTwoPointerKeyCache
- (ECTwoPointerKeyCache)init;
- (id)objectForKey1:(id)a3 key2:(id)a4;
- (void)setObject:(id)a3 forKey1:(id)a4 key2:(id)a5;
@end

@implementation ECTwoPointerKeyCache

- (ECTwoPointerKeyCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)ECTwoPointerKeyCache;
  v2 = [(ECTwoPointerKeyCache *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(OITSUPointerKeyDictionary);
    mCache = v2->mCache;
    v2->mCache = v3;
  }
  return v2;
}

- (id)objectForKey1:(id)a3 key2:(id)a4
{
  id v6 = a4;
  v7 = [(OITSUNoCopyDictionary *)self->mCache objectForKey:a3];
  v8 = [v7 objectForKey:v6];

  return v8;
}

- (void)setObject:(id)a3 forKey1:(id)a4 key2:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v11 && v8)
  {
    v10 = [(OITSUNoCopyDictionary *)self->mCache objectForKey:v8];
    if (!v10)
    {
      v10 = +[ECPointerNilKeyDictionary dictionary];
      -[OITSUNoCopyDictionary setObject:forKey:](self->mCache, "setObject:forKey:");
    }
    [v10 setObject:v11 forKey:v9];
  }
}

- (void).cxx_destruct
{
}

@end