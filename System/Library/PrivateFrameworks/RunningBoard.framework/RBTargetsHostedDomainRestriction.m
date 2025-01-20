@interface RBTargetsHostedDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_init;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBTargetsHostedDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 targetProcess];
  v8 = [v7 identity];
  v9 = [v8 hostIdentifier];
  int v10 = [v9 pid];
  v11 = [v6 originatorProcess];

  int v12 = objc_msgSend(v11, "rbs_pid");
  if (a4 && v10 != v12)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F64670];
    uint64_t v15 = *MEMORY[0x263F08338];
    v21[0] = @"Target not hosted by originator";
    uint64_t v16 = *MEMORY[0x263F64668];
    v20[0] = v15;
    v20[1] = v16;
    v17 = [(RBTargetsHostedDomainRestriction *)self description];
    v21[1] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    *a4 = [v13 errorWithDomain:v14 code:3 userInfo:v18];
  }
  return v10 == v12;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)RBTargetsHostedDomainRestriction;
  id v2 = [(RBDomainRestriction *)&v6 _init];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  if (domainRestrictionForDictionary_withError__onceToken_244 != -1) {
    dispatch_once(&domainRestrictionForDictionary_withError__onceToken_244, &__block_literal_global_246);
  }
  id v4 = (void *)domainRestrictionForDictionary_withError__singleton_243;
  return v4;
}

uint64_t __77__RBTargetsHostedDomainRestriction_domainRestrictionForDictionary_withError___block_invoke()
{
  domainRestrictionForDictionary_withError__singleton_243 = [[RBTargetsHostedDomainRestriction alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)allEntitlements
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return v4 == v5;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_restrictions hash];
}

- (id)description
{
  id v2 = [NSString alloc];
  id v3 = [(id)objc_opt_class() description];
  uint64_t v4 = (void *)[v2 initWithFormat:@"<%@|>", v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end