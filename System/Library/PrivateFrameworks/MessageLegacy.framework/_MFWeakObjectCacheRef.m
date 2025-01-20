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
  [objc_loadWeak((id *)&self->_cache) objectForKey:self->_key shouldGenerate:0 wasCached:0];

  v3.receiver = self;
  v3.super_class = (Class)_MFWeakObjectCacheRef;
  [(_MFWeakObjectCacheRef *)&v3 dealloc];
}

- (NSCopying)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (MFWeakObjectCache)cache
{
  return (MFWeakObjectCache *)objc_loadWeak((id *)&self->_cache);
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end