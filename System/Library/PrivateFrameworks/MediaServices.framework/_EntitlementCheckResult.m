@interface _EntitlementCheckResult
- (BOOL)isEntitled;
- (NSError)error;
- (NSString)entitlement;
- (NSString)group;
- (_EntitlementCheckResult)initWithEntitlement:(id)a3 group:(id)a4;
- (void)setEntitled:(BOOL)a3;
- (void)setEntitlement:(id)a3;
- (void)setError:(id)a3;
- (void)setGroup:(id)a3;
@end

@implementation _EntitlementCheckResult

- (NSError)error
{
  return self->_error;
}

- (BOOL)isEntitled
{
  return self->_entitled;
}

- (_EntitlementCheckResult)initWithEntitlement:(id)a3 group:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EntitlementCheckResult;
  v8 = [(_EntitlementCheckResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    entitlement = v8->_entitlement;
    v8->_entitlement = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    group = v8->_group;
    v8->_group = (NSString *)v11;
  }
  return v8;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSString)group
{
  return self->_group;
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setEntitlement:(id)a3
{
}

- (void)setGroup:(id)a3
{
}

- (void)setError:(id)a3
{
}

@end