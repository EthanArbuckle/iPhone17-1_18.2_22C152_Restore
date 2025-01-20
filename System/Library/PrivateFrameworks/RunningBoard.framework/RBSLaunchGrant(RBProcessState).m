@interface RBSLaunchGrant(RBProcessState)
- (uint64_t)applyToAcquisitionContext:()RBProcessState;
- (uint64_t)applyToProcessState:()RBProcessState attributePath:context:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
@end

@implementation RBSLaunchGrant(RBProcessState)

- (uint64_t)applyToProcessState:()RBProcessState attributePath:context:
{
  return [a3 setGuaranteedRunning:1];
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v18[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![MEMORY[0x263F64420] allowedForPrimitiveAttributeForProcessTarget:v6 withError:a4])goto LABEL_6; {
  v7 = [v6 target];
  }
  v8 = [v7 identity];
  char v9 = [v8 hasConsistentLaunchdJob];

  if ((v9 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_7;
    }
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F64670];
    uint64_t v12 = *MEMORY[0x263F08338];
    v18[0] = @"Attribute is only applicable to daemons and angels";
    uint64_t v13 = *MEMORY[0x263F64668];
    v17[0] = v12;
    v17[1] = v13;
    v14 = [a1 description];
    v18[1] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    *(void *)a4 = [v10 errorWithDomain:v11 code:2 userInfo:v15];

LABEL_6:
    a4 = 0;
    goto LABEL_7;
  }
  a4 = 1;
LABEL_7:

  return a4;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v6 = a3;
  id v7 = a5;
  if ([v7 isActiveDueToInheritedEndowment])
  {
    v8 = rbs_assertion_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RBSLaunchGrant(RBProcessState) applyToAssertionIntransientState:attributePath:context:](v7, v8);
    }
  }
  else
  {
    [v6 setIsPersistent:1];
  }
}

- (uint64_t)applyToAcquisitionContext:()RBProcessState
{
  return [a3 setAllowAbstractTarget:1];
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 assertion];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Not applying RBSLaunchGrant as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", (uint8_t *)&v4, 0xCu);
}

@end