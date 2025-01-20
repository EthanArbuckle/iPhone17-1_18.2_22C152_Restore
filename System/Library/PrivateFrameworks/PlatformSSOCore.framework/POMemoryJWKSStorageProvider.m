@interface POMemoryJWKSStorageProvider
- (NSMutableDictionary)cache;
- (POMemoryJWKSStorageProvider)init;
- (id)jwksCacheForExtensionIdentifier:(id)a3;
- (void)setCache:(id)a3;
- (void)setJwksCache:(id)a3 forExtensionIdentifier:(id)a4;
@end

@implementation POMemoryJWKSStorageProvider

- (POMemoryJWKSStorageProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)POMemoryJWKSStorageProvider;
  v2 = [(POMemoryJWKSStorageProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFFA78] mutableCopy];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)jwksCacheForExtensionIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_cache objectForKeyedSubscript:a3];
}

- (void)setJwksCache:(id)a3 forExtensionIdentifier:(id)a4
{
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end