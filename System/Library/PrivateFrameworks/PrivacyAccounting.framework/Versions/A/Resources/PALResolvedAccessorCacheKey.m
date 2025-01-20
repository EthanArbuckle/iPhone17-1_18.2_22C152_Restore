@interface PALResolvedAccessorCacheKey
- (BOOL)isEqual:(id)a3;
- (PAApplication)accessor;
- (PABridgedTCCIdentity)clientProvidedIdentity;
- (PALResolvedAccessorCacheKey)initWithAccessor:(id)a3 clientProvidedIdentity:(id)a4;
- (unint64_t)hash;
@end

@implementation PALResolvedAccessorCacheKey

- (PALResolvedAccessorCacheKey)initWithAccessor:(id)a3 clientProvidedIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PALResolvedAccessorCacheKey;
  v9 = [(PALResolvedAccessorCacheKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessor, a3);
    objc_storeStrong((id *)&v10->_clientProvidedIdentity, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(PAApplication *)self->_accessor hash];
  return (unsigned char *)[(PABridgedTCCIdentity *)self->_clientProvidedIdentity hash] - (unsigned char *)v3 + 32 * (void)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PALResolvedAccessorCacheKey *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else if ([(PALResolvedAccessorCacheKey *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    accessor = self->_accessor;
    id v7 = [(PALResolvedAccessorCacheKey *)v5 accessor];
    if ([(PAApplication *)accessor isEqual:v7])
    {
      clientProvidedIdentity = self->_clientProvidedIdentity;
      if (clientProvidedIdentity == v5->_clientProvidedIdentity) {
        unsigned __int8 v9 = 1;
      }
      else {
        unsigned __int8 v9 = -[PABridgedTCCIdentity isEqual:](clientProvidedIdentity, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (PAApplication)accessor
{
  return self->_accessor;
}

- (PABridgedTCCIdentity)clientProvidedIdentity
{
  return self->_clientProvidedIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProvidedIdentity, 0);

  objc_storeStrong((id *)&self->_accessor, 0);
}

@end