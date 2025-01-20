@interface RBTargetsSelfDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_init;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBTargetsSelfDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 targetProcess];
  v8 = [v7 identity];
  v9 = [v6 originatorProcess];

  v10 = [v9 identity];
  char v11 = [v8 isEqual:v10];

  if (a4 && (v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F64670];
    uint64_t v14 = *MEMORY[0x263F08338];
    v20[0] = @"Target isn't originator";
    uint64_t v15 = *MEMORY[0x263F64668];
    v19[0] = v14;
    v19[1] = v15;
    v16 = [(RBTargetsSelfDomainRestriction *)self description];
    v20[1] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    *a4 = [v12 errorWithDomain:v13 code:3 userInfo:v17];
  }
  return v11;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)RBTargetsSelfDomainRestriction;
  id v2 = [(RBDomainRestriction *)&v6 _init];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  if (domainRestrictionForDictionary_withError__onceToken != -1) {
    dispatch_once(&domainRestrictionForDictionary_withError__onceToken, &__block_literal_global_22);
  }
  id v4 = (void *)domainRestrictionForDictionary_withError__singleton;
  return v4;
}

uint64_t __75__RBTargetsSelfDomainRestriction_domainRestrictionForDictionary_withError___block_invoke()
{
  domainRestrictionForDictionary_withError__singleton = [[RBTargetsSelfDomainRestriction alloc] _init];
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