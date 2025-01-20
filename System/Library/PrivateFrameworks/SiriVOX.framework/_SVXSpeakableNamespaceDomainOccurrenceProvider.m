@interface _SVXSpeakableNamespaceDomainOccurrenceProvider
+ (id)providerForDomain:(id)a3;
- (NSSet)deferredMessageKeys;
- (NSString)domain;
- (id)stringForExpression:(id)a3;
- (unint64_t)count;
- (void)setCount:(unint64_t)a3;
- (void)setDeferredMessageKeys:(id)a3;
- (void)setDomain:(id)a3;
@end

@implementation _SVXSpeakableNamespaceDomainOccurrenceProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredMessageKeys, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setDeferredMessageKeys:(id)a3
{
}

- (NSSet)deferredMessageKeys
{
  return self->_deferredMessageKeys;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (id)stringForExpression:(id)a3
{
  id v4 = a3;
  v5 = [(_SVXSpeakableNamespaceDomainOccurrenceProvider *)self deferredMessageKeys];
  int v6 = [v5 containsObject:v4];

  if (v6) {
    ++self->_count;
  }
  v7 = (void *)[v4 copy];

  return v7;
}

+ (id)providerForDomain:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F65BB8];
  if ([a3 isEqualToString:*MEMORY[0x263F65BB8]])
  {
    id v4 = objc_opt_new();
    [v4 setDomain:v3];
    v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F65BC8], *MEMORY[0x263F65BD0], *MEMORY[0x263F65BD8], *MEMORY[0x263F65BE0], *MEMORY[0x263F65BE8], *MEMORY[0x263F65BF0], 0);
    [v4 setDeferredMessageKeys:v5];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end