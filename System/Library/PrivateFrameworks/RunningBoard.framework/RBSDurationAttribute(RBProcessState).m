@interface RBSDurationAttribute(RBProcessState)
- (uint64_t)allowedWithAttribute:()RBProcessState error:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
@end

@implementation RBSDurationAttribute(RBProcessState)

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([a1 startPolicy] == 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ([a1 startPolicy] != 3
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      a4 = 1;
      goto LABEL_14;
    }
    if (a4)
    {
      v7 = [NSString stringWithFormat:@"Attribute conflict: attribute %@ conflicts with attribute %@", a1, v6];
      v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F64670];
      uint64_t v15 = *MEMORY[0x263F08338];
      v16 = v7;
      v10 = NSDictionary;
      v11 = &v16;
      v12 = &v15;
      goto LABEL_12;
    }
  }
  else if (a4)
  {
    v7 = [NSString stringWithFormat:@"Attribute conflict: attribute %@ conflicts with attribute %@", a1, v6];
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F64670];
    uint64_t v17 = *MEMORY[0x263F08338];
    v18[0] = v7;
    v10 = NSDictionary;
    v11 = (void **)v18;
    v12 = &v17;
LABEL_12:
    v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    *(void *)a4 = [v8 errorWithDomain:v9 code:2 userInfo:v13];

    a4 = 0;
  }
LABEL_14:

  return a4;
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v23[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 originatorEntitlements];
  if (([v6 ignoreRestrictions] & 1) != 0
    || ([v7 hasEntitlement:@"com.apple.runningboard.primitiveattribute"] & 1) != 0
    || ([v7 hasEntitlementDomain:2] & 1) != 0)
  {
    if ([a1 startPolicy] == 1 || !objc_msgSend(v6, "targetIsSystem"))
    {
      a4 = 1;
    }
    else if (a4)
    {
      v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F64670];
      uint64_t v10 = *MEMORY[0x263F08338];
      v21[0] = @"Start policy must be 'fixed' for the system target";
      uint64_t v11 = *MEMORY[0x263F64668];
      v20[0] = v10;
      v20[1] = v11;
      v12 = [a1 description];
      v21[1] = v12;
      v13 = NSDictionary;
      v14 = v21;
      uint64_t v15 = v20;
LABEL_11:
      v18 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:2];
      *(void *)a4 = [v8 errorWithDomain:v9 code:2 userInfo:v18];

      a4 = 0;
    }
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F64670];
    uint64_t v16 = *MEMORY[0x263F08338];
    v23[0] = @"Required client entitlement is missing";
    uint64_t v17 = *MEMORY[0x263F64668];
    v22[0] = v16;
    v22[1] = v17;
    v12 = [a1 description];
    v23[1] = v12;
    v13 = NSDictionary;
    v14 = v23;
    uint64_t v15 = v22;
    goto LABEL_11;
  }

  return a4;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 isActiveDueToInheritedEndowment])
  {
    uint64_t v9 = rbs_assertion_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBSDurationAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:](v8, v9);
    }
  }
  else
  {
    [a1 invalidationDuration];
    double v11 = v10;
    [v7 invalidationDuration];
    if (v11 > v12) {
      [v7 setInvalidationDuration:v11];
    }
    [a1 warningDuration];
    double v14 = v13;
    [v7 warningDuration];
    if (v14 > v15) {
      [v7 setWarningDuration:v14];
    }
    unint64_t v16 = [a1 startPolicy];
    if (v16 > [v7 startPolicy]) {
      [v7 setStartPolicy:v16];
    }
    unint64_t v17 = [a1 endPolicy];
    if (v17 > [v7 endPolicy]) {
      [v7 setEndPolicy:v17];
    }
  }
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 assertion];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Not applying RBSDurationAttribute as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", (uint8_t *)&v4, 0xCu);
}

@end