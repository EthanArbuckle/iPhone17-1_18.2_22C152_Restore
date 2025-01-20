@interface RBSSavedEndowmentGrant(RBProcessState)
- (BOOL)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSSavedEndowmentGrant(RBProcessState)

- (BOOL)isValidForContext:()RBProcessState withError:
{
  v37[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![v6 targetIsSystem])
  {
    v13 = [v6 originatorEntitlements];
    if (([v6 ignoreRestrictions] & 1) != 0
      || ([v13 hasEntitlementDomain:16] & 1) != 0)
    {
      v15 = [v6 savedEndowments];
      v16 = [a1 key];
      v17 = [v15 objectForKey:v16];
      BOOL v14 = v17 != 0;

      if (!a4 || v17) {
        goto LABEL_18;
      }
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F64670];
      uint64_t v20 = *MEMORY[0x263F08338];
      v33[0] = @"Can't find saved endowment for key";
      uint64_t v21 = *MEMORY[0x263F64668];
      v32[0] = v20;
      v32[1] = v21;
      v22 = [a1 description];
      v33[1] = v22;
      v23 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
      *a4 = [v18 errorWithDomain:v19 code:2 userInfo:v23];

      v24 = rbs_general_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[RBSSavedEndowmentGrant(RBProcessState) isValidForContext:withError:]((uint64_t)v15, a1, v24);
      }
    }
    else
    {
      if (!a4)
      {
LABEL_5:
        BOOL v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F64670];
      uint64_t v27 = *MEMORY[0x263F08338];
      v35[0] = @"Required client entitlement is missing";
      uint64_t v28 = *MEMORY[0x263F64668];
      v34[0] = v27;
      v34[1] = v28;
      v29 = [a1 description];
      v35[1] = v29;
      v30 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
      *a4 = [v25 errorWithDomain:v26 code:3 userInfo:v30];

      v15 = rbs_general_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[RBSSavedEndowmentGrant(RBProcessState) isValidForContext:withError:]((uint64_t)v13, v15);
      }
    }
    BOOL v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (a4)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F64670];
    uint64_t v9 = *MEMORY[0x263F08338];
    v37[0] = @"endowment grants cannot target the system";
    uint64_t v10 = *MEMORY[0x263F64668];
    v36[0] = v9;
    v36[1] = v10;
    v11 = [a1 description];
    v37[1] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    *a4 = [v7 errorWithDomain:v8 code:2 userInfo:v12];

    v13 = rbs_general_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RBSSavedEndowmentGrant(RBProcessState) isValidForContext:withError:](v6, v13);
    }
    goto LABEL_5;
  }
  BOOL v14 = 0;
LABEL_20:

  return v14;
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 savedEndowments];
  v11 = [a1 key];
  v12 = [v10 objectForKey:v11];

  if (v12)
  {
    uint64_t v21 = v8;
    id v13 = objc_alloc(MEMORY[0x263F644C0]);
    BOOL v14 = [a1 endowmentNamespace];
    v15 = [v9 target];
    v16 = [v15 environment];
    v17 = RBSEndowmentEncode();
    v18 = [v9 assertionID];
    uint64_t v19 = [v13 _initWithNamespace:v14 environment:v16 encodedEndowment:v17 originatingIdentifier:v18 attributePath:a4];

    uint64_t v20 = rbs_general_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v19;
      _os_log_impl(&dword_226AB3000, v20, OS_LOG_TYPE_DEFAULT, "Saved endowment grant adding inheritance %{public}@", buf, 0xCu);
    }

    id v8 = v21;
    [v21 addInheritance:v19];
  }
  else
  {
    uint64_t v19 = rbs_general_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[RBSSavedEndowmentGrant(RBProcessState) applyToProcessState:attributePath:context:]((uint64_t)a1, v19);
    }
  }
}

- (void)isValidForContext:()RBProcessState withError:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 targetIdentifier];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "endowment grants cannot target the system: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)isValidForContext:()RBProcessState withError:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = [a2 description];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_226AB3000, a3, OS_LOG_TYPE_ERROR, "Can't find saved endowment:%{public}@ for %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)isValidForContext:()RBProcessState withError:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Required client entitlement is missing: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)applyToProcessState:()RBProcessState attributePath:context:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Attempting to apply saved endowment grant with no corresponding saved endowment %{public}@", (uint8_t *)&v2, 0xCu);
}

@end