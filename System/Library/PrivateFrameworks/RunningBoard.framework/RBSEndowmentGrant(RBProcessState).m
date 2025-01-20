@interface RBSEndowmentGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSEndowmentGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v24[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 targetIsSystem])
  {
    if (!a4)
    {
      uint64_t v13 = 0;
      goto LABEL_9;
    }
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F64670];
    uint64_t v9 = *MEMORY[0x263F08338];
    v24[0] = @"endowment grants cannot target the system";
    uint64_t v10 = *MEMORY[0x263F64668];
    v23[0] = v9;
    v23[1] = v10;
    v11 = [a1 description];
    v24[1] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v7 errorWithDomain:v8 code:2 userInfo:v12];
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = [v6 originatorEntitlements];
    uint64_t v14 = [v11 hasEntitlementDomain:16];
    uint64_t v13 = v14;
    if (!a4 || (v14 & 1) != 0) {
      goto LABEL_8;
    }
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F64670];
    uint64_t v17 = *MEMORY[0x263F08338];
    v22[0] = @"Required client entitlement is missing";
    uint64_t v18 = *MEMORY[0x263F64668];
    v21[0] = v17;
    v21[1] = v18;
    v12 = [a1 description];
    v22[1] = v12;
    v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    *a4 = [v15 errorWithDomain:v16 code:2 userInfo:v19];
  }
LABEL_8:

LABEL_9:
  return v13;
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  uint64_t v8 = (objc_class *)MEMORY[0x263F644C0];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  v12 = [a1 endowmentNamespace];
  uint64_t v13 = [v9 target];
  uint64_t v14 = [v13 environment];
  v15 = [a1 encodedEndowment];
  uint64_t v16 = [v9 assertionID];

  id v17 = (id)[v11 _initWithNamespace:v12 environment:v14 encodedEndowment:v15 originatingIdentifier:v16 attributePath:a4];
  [v10 addInheritance:v17];
}

@end