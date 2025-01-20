@interface RBSPreventIdleSleepGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
- (void)applyToSystemState:()RBProcessState attributePath:context:;
@end

@implementation RBSPreventIdleSleepGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 originatorEntitlements];
  char v8 = [v6 ignoreRestrictions];

  if ((v8 & 1) != 0
    || ([v7 hasEntitlement:@"com.apple.runningboard.primitiveattribute"] & 1) != 0)
  {
    a4 = 1;
  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F64670];
    uint64_t v12 = *MEMORY[0x263F08338];
    v17[0] = @"Required client entitlement is missing";
    uint64_t v13 = *MEMORY[0x263F64668];
    v16[0] = v12;
    v16[1] = v13;
    v14 = [a1 description];
    v17[1] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    *(void *)a4 = [v10 errorWithDomain:v11 code:2 userInfo:v15];

    a4 = 0;
  }

  return a4;
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v6 = a5;
  id v7 = a3;
  [v7 setPreventIdleSleep:1];
  char v8 = NSString;
  id v12 = [v6 assertionID];
  v9 = [v6 assertion];

  v10 = [v9 explanation];
  uint64_t v11 = [v8 stringWithFormat:@"%@:%@", v12, v10];
  [v7 addPreventIdleSleepIdentifier:v11];
}

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  id v6 = a5;
  id v7 = a3;
  [v7 setPreventIdleSleep:1];
  char v8 = NSString;
  id v12 = [v6 assertionID];
  v9 = [v6 assertion];

  v10 = [v9 explanation];
  uint64_t v11 = [v8 stringWithFormat:@"%@:%@", v12, v10];
  [v7 addPreventIdleSleepIdentifier:v11];
}

@end