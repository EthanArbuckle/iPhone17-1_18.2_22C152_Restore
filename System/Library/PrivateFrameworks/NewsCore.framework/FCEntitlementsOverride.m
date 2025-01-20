@interface FCEntitlementsOverride
- (FCEntitlementsOverride)initWithEntitlements:(id)a3 error:(id)a4;
- (NSArray)entitlements;
- (NSError)error;
- (void)setEntitlements:(id)a3;
- (void)setError:(id)a3;
@end

@implementation FCEntitlementsOverride

- (FCEntitlementsOverride)initWithEntitlements:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCEntitlementsOverride;
  v8 = [(FCEntitlementsOverride *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    entitlements = v8->_entitlements;
    v8->_entitlements = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

- (NSArray)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
}

@end