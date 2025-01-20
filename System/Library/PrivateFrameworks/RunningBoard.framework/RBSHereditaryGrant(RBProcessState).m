@interface RBSHereditaryGrant(RBProcessState)
- (id)effectiveAttributesWithContext:()RBProcessState;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSHereditaryGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v8 = a3;
  id v9 = a5;
  [v9 pushActiveDueToInheritedEndowment];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __80__RBSHereditaryGrant_RBProcessState__applyToProcessState_attributePath_context___block_invoke;
  v15 = &unk_2647C8878;
  v16 = a1;
  id v17 = v9;
  id v18 = v8;
  uint64_t v19 = a4;
  id v10 = v8;
  id v11 = v9;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v11, &v12);
  objc_msgSend(v11, "popActiveDueToInheritedEndowment", v12, v13, v14, v15, v16);
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v8 = a3;
  id v9 = a5;
  [v9 pushActiveDueToInheritedEndowment];
  [v8 setHasHereditaryGrant:1];
  id v10 = [a1 sourceEnvironment];
  if (v10)
  {
    id v11 = [v8 sourceEnvironments];
    [v11 addObject:v10];
  }
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __93__RBSHereditaryGrant_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke;
  id v17 = &unk_2647C8878;
  id v18 = a1;
  id v19 = v8;
  id v20 = v9;
  uint64_t v21 = a4;
  id v12 = v9;
  id v13 = v8;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v12, &v14);
  objc_msgSend(v12, "popActiveDueToInheritedEndowment", v14, v15, v16, v17, v18);
}

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v8 = a3;
  id v9 = a5;
  [v9 pushActiveDueToInheritedEndowment];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __91__RBSHereditaryGrant_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke;
  uint64_t v15 = &unk_2647C8878;
  v16 = a1;
  id v17 = v8;
  id v18 = v9;
  uint64_t v19 = a4;
  id v10 = v9;
  id v11 = v8;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v10, &v12);
  objc_msgSend(v10, "popActiveDueToInheritedEndowment", v12, v13, v14, v15, v16);
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v44[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 targetIsSystem])
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = *MEMORY[0x263F64670];
      uint64_t v9 = *MEMORY[0x263F08338];
      v44[0] = @"Hereditary grants may not target the system";
      uint64_t v10 = *MEMORY[0x263F64668];
      v43[0] = v9;
      v43[1] = v10;
      id v11 = [a1 description];
      v44[1] = v11;
      uint64_t v12 = NSDictionary;
      uint64_t v13 = v44;
      uint64_t v14 = v43;
LABEL_18:
      id v20 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:2];
      [v7 errorWithDomain:v8 code:2 userInfo:v20];
      uint64_t v25 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v15 = [v6 target];
    v16 = [v15 environment];

    if (v16)
    {
      id v11 = [v6 originatorEntitlements];
      uint64_t v17 = [a1 encodedEndowment];
      if (v17
        && (id v18 = (void *)v17, v19 = [v11 hasEntitlementDomain:16], v18, (v19 & 1) == 0))
      {
        if (!a4)
        {
          uint64_t v25 = 0;
          goto LABEL_25;
        }
        v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v29 = *MEMORY[0x263F64670];
        uint64_t v30 = *MEMORY[0x263F08338];
        v40[0] = @"Required client entitlement is missing";
        uint64_t v31 = *MEMORY[0x263F64668];
        v39[0] = v30;
        v39[1] = v31;
        id v20 = [a1 description];
        v40[1] = v20;
        v32 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
        *a4 = [v28 errorWithDomain:v29 code:2 userInfo:v32];
      }
      else
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v20 = objc_msgSend(a1, "attributes", 0);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (!v21)
        {
          uint64_t v25 = 1;
          goto LABEL_24;
        }
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v35;
LABEL_9:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          if (![*(id *)(*((void *)&v34 + 1) + 8 * v24) isValidForContext:v6 withError:a4])break; {
          if (v22 == ++v24)
          }
          {
            uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
            uint64_t v25 = 1;
            if (v22) {
              goto LABEL_9;
            }
            goto LABEL_24;
          }
        }
      }
      uint64_t v25 = 0;
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
    if (a4)
    {
      v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = *MEMORY[0x263F64670];
      uint64_t v26 = *MEMORY[0x263F08338];
      v42[0] = @"Hereditary grants must specify a target environment";
      uint64_t v27 = *MEMORY[0x263F64668];
      v41[0] = v26;
      v41[1] = v27;
      id v11 = [a1 description];
      v42[1] = v11;
      uint64_t v12 = NSDictionary;
      uint64_t v13 = v42;
      uint64_t v14 = v41;
      goto LABEL_18;
    }
  }
  uint64_t v25 = 0;
LABEL_26:

  return v25;
}

- (id)effectiveAttributesWithContext:()RBProcessState
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  [v4 pushActiveDueToInheritedEndowment];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke;
  v11[3] = &unk_2647C88C8;
  v11[4] = a1;
  id v6 = v5;
  id v12 = v6;
  id v13 = v4;
  id v7 = v4;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v7, v11);
  [v6 addObject:a1];
  [v7 popActiveDueToInheritedEndowment];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

@end