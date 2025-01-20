@interface RBSConditionAttribute(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToSystemState:()RBProcessState attributePath:context:;
@end

@implementation RBSConditionAttribute(RBProcessState)

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    v4 = [a1 condition];
    objc_msgSend(v5, "upgradeCondition:toValue:", v4, objc_msgSend(a1, "value"));
  }
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v26[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (([v6 targetIsSystem] & 1) == 0)
  {
    if (!a4) {
      goto LABEL_8;
    }
    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F64670];
    uint64_t v11 = *MEMORY[0x263F08338];
    v26[0] = @"Attribute is not current supported for process target";
    uint64_t v12 = *MEMORY[0x263F64668];
    v25[0] = v11;
    v25[1] = v12;
    v13 = [a1 description];
    v26[1] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    v15 = v9;
    uint64_t v16 = v10;
    uint64_t v17 = 2;
LABEL_7:
    *(void *)a4 = [v15 errorWithDomain:v16 code:v17 userInfo:v14];

    a4 = 0;
    goto LABEL_8;
  }
  if (([v6 ignoreRestrictions] & 1) == 0)
  {
    v7 = [v6 originatorEntitlements];
    char v8 = [v7 hasEntitlement:@"com.apple.runningboard.primitiveattribute"];

    if ((v8 & 1) == 0)
    {
      if (!a4) {
        goto LABEL_8;
      }
      v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F64670];
      uint64_t v21 = *MEMORY[0x263F08338];
      v24[0] = @"Required client entitlement is missing";
      uint64_t v22 = *MEMORY[0x263F64668];
      v23[0] = v21;
      v23[1] = v22;
      v13 = [a1 description];
      v24[1] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
      v15 = v19;
      uint64_t v16 = v20;
      uint64_t v17 = 3;
      goto LABEL_7;
    }
  }
  a4 = 1;
LABEL_8:

  return a4;
}

@end