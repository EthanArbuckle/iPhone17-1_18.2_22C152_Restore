@interface _MFWeakObjectCacheRef
- (MFWeakObjectCache)cache;
- (NSCopying)key;
- (void)dealloc;
- (void)setCache:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation _MFWeakObjectCacheRef

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  id v4 = (id)[WeakRetained objectForKey:self->_key shouldGenerate:0 wasCached:0];

  v5.receiver = self;
  v5.super_class = (Class)_MFWeakObjectCacheRef;
  [(_MFWeakObjectCacheRef *)&v5 dealloc];
}

- (void)setKey:(id)a3
{
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSCopying)key
{
  return self->_key;
}

- (MFWeakObjectCache)cache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  return (MFWeakObjectCache *)WeakRetained;
}

@end