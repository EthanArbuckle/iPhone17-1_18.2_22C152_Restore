@interface RBSPrewarmAttribute(RBProcessState)
- (uint64_t)allowedWithAttribute:()RBProcessState error:;
- (uint64_t)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToSystemState:()RBProcessState attributePath:context:;
@end

@implementation RBSPrewarmAttribute(RBProcessState)

- (uint64_t)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  return [a3 setInvalidatesSynchronously:1];
}

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  id v4 = a3;
  id v5 = [a1 identity];
  [a1 interval];
  objc_msgSend(v4, "prewarmIdentity:withInterval:", v5);
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v24[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 target];
  char v8 = [v7 isSystem];

  if (v8)
  {
    v9 = [v6 originatorEntitlements];
    if (([v6 ignoreRestrictions] & 1) != 0
      || ([v9 hasEntitlement:@"com.apple.runningboard.launchprocess"] & 1) != 0)
    {
      a4 = 1;
LABEL_8:

      goto LABEL_9;
    }
    if (!a4) {
      goto LABEL_8;
    }
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F64670];
    uint64_t v18 = *MEMORY[0x263F08338];
    v22[0] = @"Required client entitlement is missing for attribute";
    uint64_t v19 = *MEMORY[0x263F64668];
    v21[0] = v18;
    v21[1] = v19;
    v14 = [a1 description];
    v22[1] = v14;
    v20 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    *(void *)a4 = [v16 errorWithDomain:v17 code:2 userInfo:v20];

LABEL_7:
    a4 = 0;
    goto LABEL_8;
  }
  if (a4)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F64670];
    uint64_t v12 = *MEMORY[0x263F08338];
    v24[0] = @"Prewarm attribute must target system";
    uint64_t v13 = *MEMORY[0x263F64668];
    v23[0] = v12;
    v23[1] = v13;
    v9 = [a1 description];
    v24[1] = v9;
    v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    *(void *)a4 = [v10 errorWithDomain:v11 code:2 userInfo:v14];
    goto LABEL_7;
  }
LABEL_9:

  return a4;
}

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    a4 = 1;
  }
  else if (a4)
  {
    char v8 = [NSString stringWithFormat:@"Attribute conflict: attribute %@ conflicts with attribute %@", a1, v6];
    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F64670];
    uint64_t v12 = *MEMORY[0x263F08338];
    v13[0] = v8;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *(void *)a4 = [v9 errorWithDomain:v10 code:2 userInfo:v11];

    a4 = 0;
  }

  return a4;
}

@end