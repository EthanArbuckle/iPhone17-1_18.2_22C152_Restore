@interface _LocalizedImageCache
- (_LocalizedImageCache)init;
- (id)imageForKey:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)setImage:(id)a3 forKey:(id)a4;
@end

@implementation _LocalizedImageCache

- (_LocalizedImageCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)_LocalizedImageCache;
  v2 = [(_LocalizedImageCache *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__localeChanged name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v2;
}

- (id)imageForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_cache objectForKeyedSubscript:a3];
}

- (void)setImage:(id)a3 forKey:(id)a4
{
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  v4.receiver = self;
  v4.super_class = (Class)_LocalizedImageCache;
  [(_LocalizedImageCache *)&v4 dealloc];
}

- (void)removeAllObjects
{
}

- (void).cxx_destruct
{
}

@end