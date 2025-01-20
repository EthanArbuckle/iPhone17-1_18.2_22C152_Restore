@interface RBSTagAttribute(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
- (void)applyToSystemState:()RBProcessState attributePath:context:;
@end

@implementation RBSTagAttribute(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 ignoreRestrictions])
  {
    uint64_t v7 = 1;
  }
  else
  {
    v8 = [v6 originatorEntitlements];
    uint64_t v7 = [v8 hasEntitlement:@"com.apple.runningboard.primitiveattribute"];

    if (a4 && (v7 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F64670];
      uint64_t v11 = *MEMORY[0x263F08338];
      v17[0] = @"Required client entitlement is missing";
      uint64_t v12 = *MEMORY[0x263F64668];
      v16[0] = v11;
      v16[1] = v12;
      v13 = [a1 description];
      v17[1] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      *a4 = [v9 errorWithDomain:v10 code:2 userInfo:v14];

      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v4 = a3;
  id v5 = [a1 tag];
  [v4 addTag:v5];
}

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v4 = a3;
  id v5 = [a1 tag];
  [v4 addTag:v5];
}

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  id v4 = a3;
  id v5 = [a1 tag];
  [v4 addTag:v5];
}

@end