@interface STExecutableIdentityResolver
+ (id)responsibleIdentityForAuditToken:(id *)a3;
- (STExecutableIdentityResolver)init;
- (id)beginBatchResolutionSession;
- (id)resolvedIdentityForIdentity:(id)a3;
@end

@implementation STExecutableIdentityResolver

- (id)resolvedIdentityForIdentity:(id)a3
{
  id v4 = a3;
  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  v6 = [(STReferenceCountedCache *)cache cachedObjectForKey:v4];
  if (!v6)
  {
    v6 = _STExecutableIdentityResolvedIdentityForIdentity(v4, 0, 1);
  }

  return v6;
}

+ (id)responsibleIdentityForAuditToken:(id *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FA9390]);
  long long v5 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v5;
  v6 = (void *)[v4 initWithAuditToken:v9];
  v7 = _STExecutableIdentityResolvedIdentityForIdentity(v6, 1, 0);

  return v7;
}

- (STExecutableIdentityResolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)STExecutableIdentityResolver;
  v2 = [(STExecutableIdentityResolver *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(STReferenceCountedCache);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

- (id)beginBatchResolutionSession
{
  v3 = [STExecutableIdentityResolutionSession alloc];
  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  long long v5 = [(STExecutableIdentityResolutionSession *)v3 initWithResolver:self cache:cache];
  return v5;
}

- (void).cxx_destruct
{
}

@end