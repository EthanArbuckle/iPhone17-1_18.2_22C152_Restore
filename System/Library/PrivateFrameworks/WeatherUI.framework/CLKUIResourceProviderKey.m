@interface CLKUIResourceProviderKey
- (CLKUIResourceProviderKey)init;
- (NSNumber)key;
@end

@implementation CLKUIResourceProviderKey

- (CLKUIResourceProviderKey)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLKUIResourceProviderKey;
  v2 = [(CLKUIResourceProviderKey *)&v7 init];
  if (v2)
  {
    atomic_fetch_add(_CLKUIGenerateUniqueInteger_value, 1u);
    uint64_t v3 = atomic_load((unsigned int *)_CLKUIGenerateUniqueInteger_value);
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:v3];
    key = v2->_key;
    v2->_key = (NSNumber *)v4;
  }
  return v2;
}

- (NSNumber)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end