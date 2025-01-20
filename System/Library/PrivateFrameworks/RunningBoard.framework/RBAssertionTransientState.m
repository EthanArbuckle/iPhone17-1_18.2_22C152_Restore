@interface RBAssertionTransientState
- (BOOL)isEqual:(id)a3;
- (NSSet)tags;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)maxCPUUsageViolationPolicyForRole:(unsigned __int8)a3;
- (void)addTag:(id)a3;
- (void)setMaxCPUUsageViolationPolicy:(unint64_t)a3 forRole:(unsigned __int8)a4;
- (void)unionState:(id)a3;
@end

@implementation RBAssertionTransientState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_cpuUsageViolationPoliciesByRole, 0);
}

- (void)addTag:(id)a3
{
  id v4 = a3;
  tags = self->_tags;
  id v8 = v4;
  if (!tags)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = self->_tags;
    self->_tags = v6;

    id v4 = v8;
    tags = self->_tags;
  }
  [(NSMutableSet *)tags addObject:v4];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v4 = [(NSMutableSet *)self->_tags allObjects];
  uint64_t v5 = [v4 count];

  cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__RBAssertionTransientState_description__block_invoke;
  v15[3] = &unk_2647C8040;
  id v7 = v3;
  id v16 = v7;
  [(NSMutableDictionary *)cpuUsageViolationPoliciesByRole enumerateKeysAndObjectsUsingBlock:v15];
  id v8 = [NSString alloc];
  uint64_t v9 = [(id)objc_opt_class() description];
  v10 = (void *)v9;
  if (v5)
  {
    v11 = [(NSMutableSet *)self->_tags allObjects];
    v12 = [v11 componentsJoinedByString:@",\n\t"];
    v13 = (void *)[v8 initWithFormat:@"<%@| policies:[\n\t%@\n\t]%@%@>", v10, v7, @" tags:[\n\t", v12];
  }
  else
  {
    v13 = (void *)[v8 initWithFormat:@"<%@| policies:[\n\t%@\n\t]%@%@>", v9, v7, &stru_26DA9D688, &stru_26DA9D688];
  }

  return v13;
}

- (void)setMaxCPUUsageViolationPolicy:(unint64_t)a3 forRole:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  if (!self->_cpuUsageViolationPoliciesByRole)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
    self->_cpuUsageViolationPoliciesByRole = v7;
  }
  id v11 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = self->_cpuUsageViolationPoliciesByRole;
  v10 = [NSNumber numberWithUnsignedChar:v4];
  [(NSMutableDictionary *)v9 setObject:v11 forKeyedSubscript:v10];
}

- (unint64_t)maxCPUUsageViolationPolicyForRole:(unsigned __int8)a3
{
  cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
  uint64_t v4 = [NSNumber numberWithUnsignedChar:a3];
  uint64_t v5 = [(NSMutableDictionary *)cpuUsageViolationPoliciesByRole objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

void __40__RBAssertionTransientState_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [a2 unsignedIntegerValue];
  NSStringFromRBSRole();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 unsignedIntegerValue];

  unint64_t v6 = NSStringFromRBSCPUMaximumUsageViolationPolicy();
  [v4 appendFormat:@"%@=%@\n\t", v7, v6];
}

- (void)unionState:(id)a3
{
  uint64_t v4 = (RBAssertionTransientState *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4 && v4 != self)
  {
    unint64_t v6 = v4->_cpuUsageViolationPoliciesByRole;
    if ([(NSMutableDictionary *)v6 count])
    {
      if (self->_cpuUsageViolationPoliciesByRole)
      {
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __40__RBAssertionTransientState_unionState___block_invoke;
        v13[3] = &unk_2647C8040;
        v13[4] = self;
        [(NSMutableDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v13];
      }
      else
      {
        id v7 = (NSMutableDictionary *)[(NSMutableDictionary *)v6 mutableCopy];
        cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
        self->_cpuUsageViolationPoliciesByRole = v7;
      }
    }
    id v9 = p_isa[2];
    if ([v9 count])
    {
      tags = self->_tags;
      if (tags)
      {
        [(NSMutableSet *)tags unionSet:v9];
      }
      else
      {
        id v11 = (NSMutableSet *)[v9 mutableCopy];
        v12 = self->_tags;
        self->_tags = v11;
      }
    }
  }
}

void __40__RBAssertionTransientState_unionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a3;
  id v7 = a2;
  id v13 = [v5 objectForKeyedSubscript:v7];
  id v8 = NSNumber;
  unint64_t v9 = [v13 unsignedIntegerValue];
  unint64_t v10 = [v6 unsignedIntegerValue];

  if (v9 <= v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  v12 = [v8 numberWithUnsignedInteger:v11];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v12 forKeyedSubscript:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[RBAssertionTransientState allocWithZone:](RBAssertionTransientState, "allocWithZone:") init];
  uint64_t v6 = [(NSMutableDictionary *)self->_cpuUsageViolationPoliciesByRole mutableCopyWithZone:a3];
  cpuUsageViolationPoliciesByRole = v5->_cpuUsageViolationPoliciesByRole;
  v5->_cpuUsageViolationPoliciesByRole = (NSMutableDictionary *)v6;

  uint64_t v8 = [(NSMutableSet *)self->_tags mutableCopyWithZone:a3];
  tags = v5->_tags;
  v5->_tags = (NSMutableSet *)v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RBAssertionTransientState *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    if ((uint64_t v5 = objc_opt_class(), v5 != objc_opt_class())
      || (tags = self->_tags, tags != v4->_tags) && !-[NSMutableSet isEqualToSet:](tags, "isEqualToSet:")
      || (cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole,
          cpuUsageViolationPoliciesByRole != v4->_cpuUsageViolationPoliciesByRole)
      && !-[NSMutableDictionary isEqualToDictionary:](cpuUsageViolationPoliciesByRole, "isEqualToDictionary:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableSet *)self->_tags hash];
  return [(NSMutableDictionary *)self->_cpuUsageViolationPoliciesByRole hash] ^ v3;
}

- (NSSet)tags
{
  return &self->_tags->super;
}

@end