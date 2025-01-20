@interface _SKUIResourceCacheValue
- (_SKUIResourceCacheValue)initWithResource:(id)a3 requestCacheKey:(id)a4;
- (id)requestCacheKey;
- (id)resource;
@end

@implementation _SKUIResourceCacheValue

- (_SKUIResourceCacheValue)initWithResource:(id)a3 requestCacheKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SKUIResourceCacheValue;
  v9 = [(_SKUIResourceCacheValue *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_resource, a3);
    objc_storeStrong(&v10->_requestCacheKey, a4);
  }

  return v10;
}

- (id)resource
{
  return self->_resource;
}

- (id)requestCacheKey
{
  return self->_requestCacheKey;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestCacheKey, 0);

  objc_storeStrong(&self->_resource, 0);
}

@end