@interface FCEphemeralAssetKeyCache
- (FCEphemeralAssetKeyCache)init;
- (id)interestTokenForWrappingKeyIDs:(id)a3;
- (id)wrappingKeyForWrappingKeyID:(id)a3;
- (void)removeAllWrappingKeys;
- (void)setWrappingKey:(id)a3 forWrappingKeyID:(id)a4;
@end

@implementation FCEphemeralAssetKeyCache

- (FCEphemeralAssetKeyCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCEphemeralAssetKeyCache;
  v2 = [(FCEphemeralAssetKeyCache *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableDictionary);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;
  }
  return v2;
}

- (id)wrappingKeyForWrappingKeyID:(id)a3
{
  if (self) {
    self = (FCEphemeralAssetKeyCache *)self->_dictionary;
  }
  return (id)[(FCEphemeralAssetKeyCache *)self objectForKey:a3];
}

- (id)interestTokenForWrappingKeyIDs:(id)a3
{
  return +[FCInterestToken interestTokenWithRemoveInterestBlock:&__block_literal_global_111_0];
}

- (void)setWrappingKey:(id)a3 forWrappingKeyID:(id)a4
{
  if (self) {
    self = (FCEphemeralAssetKeyCache *)self->_dictionary;
  }
  [(FCEphemeralAssetKeyCache *)self setObject:a3 forKey:a4];
}

- (void)removeAllWrappingKeys
{
  if (self) {
    self = (FCEphemeralAssetKeyCache *)self->_dictionary;
  }
  [(FCEphemeralAssetKeyCache *)self removeAllObjects];
}

- (void).cxx_destruct
{
}

@end