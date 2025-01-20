@interface RBTargetEntitlementDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithEntitlement:(id)a3;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBTargetEntitlementDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  v6 = [a3 targetEntitlements];
  char v7 = [v6 hasEntitlement:self->_entitlement];

  if (a4 && (v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F646B8];
    v10 = [NSString stringWithFormat:@"target is not running or doesn't have entitlement %@", self->_entitlement, *MEMORY[0x263F08338]];
    v14[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = [v8 errorWithDomain:v9 code:1 userInfo:v11];
  }
  return v7;
}

- (id)_initWithEntitlement:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBTargetEntitlementDomainRestriction;
  v5 = [(RBDomainRestriction *)&v10 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    char v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = v5;
  }

  return v5;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:@"Entitlement"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = [[RBTargetEntitlementDomainRestriction alloc] _initWithEntitlement:v6];
  }
  else if (a4)
  {
    char v7 = (void *)MEMORY[0x263F087E8];
    v8 = [NSString stringWithFormat:@"RBTargetEntitlementDomainRestriction doesn't specify entitlement: %@", v5, *MEMORY[0x263F08338]];
    v14[0] = v8;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_super v10 = [v7 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v9];

    id v11 = v10;
    *a4 = v11;

    a4 = 0;
  }

  return a4;
}

- (id)allEntitlements
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:self->_entitlement];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBTargetEntitlementDomainRestriction *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  entitlement = self->_entitlement;
  v8 = v4->_entitlement;
  if (entitlement == v8)
  {
LABEL_10:
    char v6 = 1;
    goto LABEL_11;
  }
  if (entitlement) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v6 = -[NSString isEqual:](entitlement, "isEqual:");
    goto LABEL_11;
  }
LABEL_3:
  char v6 = 0;
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_entitlement hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@>", v4, self->_entitlement];

  return v5;
}

- (void).cxx_destruct
{
}

@end