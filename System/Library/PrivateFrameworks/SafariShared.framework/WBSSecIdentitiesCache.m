@interface WBSSecIdentitiesCache
- (WBSSecIdentitiesCache)init;
- (__SecIdentity)secIdentityForDomain:(id)a3;
- (void)setSecIdentity:(__SecIdentity *)a3 forDomain:(id)a4;
@end

@implementation WBSSecIdentitiesCache

- (WBSSecIdentitiesCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSSecIdentitiesCache;
  v2 = [(WBSSecIdentitiesCache *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    domainsToIdentities = v2->_domainsToIdentities;
    v2->_domainsToIdentities = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (__SecIdentity)secIdentityForDomain:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_domainsToIdentities objectForKeyedSubscript:a3];

  return (__SecIdentity *)v3;
}

- (void)setSecIdentity:(__SecIdentity *)a3 forDomain:(id)a4
{
  domainsToIdentities = self->_domainsToIdentities;
  if (a3) {
    [(NSMutableDictionary *)domainsToIdentities setObject:a3 forKeyedSubscript:a4];
  }
  else {
    [(NSMutableDictionary *)domainsToIdentities removeObjectForKey:a4];
  }
}

- (void).cxx_destruct
{
}

@end