@interface RBSPersistentAttribute(RBProcessState)
- (uint64_t)applyToAcquisitionContext:()RBProcessState;
- (unint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
@end

@implementation RBSPersistentAttribute(RBProcessState)

- (unint64_t)isValidForContext:()RBProcessState withError:
{
  v28[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 ignoreRestrictions])
  {
    BOOL v7 = a4 == 0;
    LODWORD(v8) = 1;
  }
  else
  {
    v9 = [v6 originatorEntitlements];
    LODWORD(v8) = [v9 hasEntitlement:@"com.apple.runningboard.primitiveattribute"];

    BOOL v7 = a4 == 0;
    if (a4 && (v8 & 1) == 0)
    {
      unint64_t v8 = MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F64670];
      uint64_t v11 = *MEMORY[0x263F08338];
      v28[0] = @"Required client entitlement is missing";
      uint64_t v12 = *MEMORY[0x263F64668];
      v27[0] = v11;
      v27[1] = v12;
      v13 = [a1 description];
      v28[1] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      *a4 = [(id)v8 errorWithDomain:v10 code:2 userInfo:v14];

      BOOL v7 = 0;
      LODWORD(v8) = 0;
    }
  }
  v15 = [v6 assertionDescriptor];
  v16 = [v15 target];
  v17 = [v16 processIdentity];

  if (v17) {
    unint64_t v8 = v8;
  }
  else {
    unint64_t v8 = 0;
  }
  if (!v7 && !v17)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F64670];
    uint64_t v20 = *MEMORY[0x263F08338];
    v26[0] = @"Persistent attributes must target a process identity";
    uint64_t v21 = *MEMORY[0x263F64668];
    v25[0] = v20;
    v25[1] = v21;
    v22 = [a1 description];
    v26[1] = v22;
    v23 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    *a4 = [v18 errorWithDomain:v19 code:2 userInfo:v23];

    unint64_t v8 = 0;
  }

  return v8;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v6 = a3;
  id v7 = a5;
  if ([v7 isActiveDueToInheritedEndowment])
  {
    unint64_t v8 = rbs_assertion_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RBSPersistentAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:](v7, v8);
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
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Not applying RBSPersistentAttribute as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", (uint8_t *)&v4, 0xCu);
}

@end