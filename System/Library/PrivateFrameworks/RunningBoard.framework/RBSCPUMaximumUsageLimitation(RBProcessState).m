@interface RBSCPUMaximumUsageLimitation(RBProcessState)
- (uint64_t)allowedWithAttribute:()RBProcessState error:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSCPUMaximumUsageLimitation(RBProcessState)

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (a4)
    {
      v7 = [NSString stringWithFormat:@"Attribute conflict: attribute %@ conflicts with attribute %@", a1, v6];
      v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F64670];
      uint64_t v12 = *MEMORY[0x263F08338];
      v13[0] = v7;
      v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *(void *)a4 = [v8 errorWithDomain:v9 code:2 userInfo:v10];

      a4 = 0;
    }
  }
  else
  {
    a4 = 1;
  }

  return a4;
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x263F64420], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v14 = a3;
  v7 = [a5 targetProcess];
  char v8 = [v7 isPlatformBinary];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [a1 role];
    v10 = [RBProcessCPUMaximumLimits alloc];
    uint64_t v11 = [a1 percentage];
    [a1 duration];
    v13 = -[RBProcessCPUMaximumLimits initWithPercentage:duration:violationPolicy:](v10, "initWithPercentage:duration:violationPolicy:", v11, vcvtpd_u64_f64(v12), [a1 violationPolicy]);
    [v14 setMaxCPUUsageLimits:v13 forRole:v9];
  }
}

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v5 = a3;
  unint64_t v4 = objc_msgSend(v5, "maxCPUUsageViolationPolicyForRole:", objc_msgSend(a1, "role"));
  if (v4 < [a1 violationPolicy]) {
    objc_msgSend(v5, "setMaxCPUUsageViolationPolicy:forRole:", objc_msgSend(a1, "violationPolicy"), objc_msgSend(a1, "role"));
  }
}

@end