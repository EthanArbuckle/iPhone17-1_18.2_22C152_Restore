@interface RBSDomainAttribute
- (uint64_t)_areAdditionalRestrictionsValidForContext:(void *)a3 withError:;
- (uint64_t)_areOriginatorEntitlementsValidForContext:(void *)a3 withError:;
- (uint64_t)_areTargetEntitlementsValidForContext:(void *)a3 withError:;
- (uint64_t)_contextContainsRequiredEndowment:(BOOL *)a3 requiresEndowment:;
- (uint64_t)_doesRestrictionAllowForContext:(uint64_t)a3 withError:;
@end

@implementation RBSDomainAttribute

uint64_t __64__RBSDomainAttribute_RBProcessState__applyToAcquisitionContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applyToAcquisitionContext:*(void *)(a1 + 32)];
}

- (uint64_t)_areOriginatorEntitlementsValidForContext:(void *)a3 withError:
{
  v43[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = v5;
  if (!a1)
  {
    uint64_t v32 = 0;
    goto LABEL_18;
  }
  v7 = [v5 domainAttributeManager];
  v8 = [a1 domain];
  v9 = [a1 name];
  v10 = [v7 endowmentNamespaceForDomain:v8 andName:v9];

  v11 = [a1 sourceEnvironment];
  v12 = v11;
  if (v10)
  {

    if (!v12)
    {
      if (a3)
      {
        v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v14 = *MEMORY[0x263F64670];
        uint64_t v15 = *MEMORY[0x263F08338];
        v43[0] = @"Domain attribute requires a source environment";
        uint64_t v16 = *MEMORY[0x263F64668];
        v42[0] = v15;
        v42[1] = v16;
        v17 = [a1 description];
        v43[1] = v17;
        v42[2] = *MEMORY[0x263F64678];
        v18 = [a1 fullyQualifiedName];
        v43[2] = v18;
        v19 = NSDictionary;
        v20 = v43;
        v21 = v42;
LABEL_9:
        v24 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:3];
        v25 = v13;
        uint64_t v26 = v14;
        uint64_t v27 = 2;
        goto LABEL_14;
      }
      goto LABEL_19;
    }
  }
  else
  {

    if (v12)
    {
      if (a3)
      {
        v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v14 = *MEMORY[0x263F64670];
        uint64_t v22 = *MEMORY[0x263F08338];
        v41[0] = @"Domain attribute specifies a source environment when none is required";
        uint64_t v23 = *MEMORY[0x263F64668];
        v40[0] = v22;
        v40[1] = v23;
        v17 = [a1 description];
        v41[1] = v17;
        v40[2] = *MEMORY[0x263F64678];
        v18 = [a1 fullyQualifiedName];
        v41[2] = v18;
        v19 = NSDictionary;
        v20 = v41;
        v21 = v40;
        goto LABEL_9;
      }
LABEL_19:
      uint64_t v32 = 0;
      goto LABEL_17;
    }
  }
  v28 = [v6 domainAttributeManager];
  v29 = [a1 domain];
  v30 = [a1 name];
  v17 = [v28 originatorEntitlementsForDomain:v29 andName:v30];

  if (!v17)
  {
    uint64_t v32 = 1;
    goto LABEL_16;
  }
  v31 = [v6 originatorEntitlements];
  uint64_t v32 = [v17 matchesEntitlements:v31];

  if (!a3 || (v32 & 1) != 0) {
    goto LABEL_16;
  }
  v33 = (void *)MEMORY[0x263F087E8];
  uint64_t v34 = *MEMORY[0x263F64670];
  uint64_t v35 = *MEMORY[0x263F08338];
  v39[0] = @"Required client entitlement is missing";
  uint64_t v36 = *MEMORY[0x263F64668];
  v38[0] = v35;
  v38[1] = v36;
  v18 = [a1 description];
  v39[1] = v18;
  v24 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  v25 = v33;
  uint64_t v26 = v34;
  uint64_t v27 = 3;
LABEL_14:
  *a3 = [v25 errorWithDomain:v26 code:v27 userInfo:v24];

  uint64_t v32 = 0;
LABEL_16:

LABEL_17:
LABEL_18:

  return v32;
}

- (uint64_t)_contextContainsRequiredEndowment:(BOOL *)a3 requiresEndowment:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = v5;
  if (!a1)
  {
    uint64_t v18 = 0;
    goto LABEL_21;
  }
  v7 = [v5 domainAttributeManager];
  v8 = [a1 domain];
  v9 = [a1 name];
  v10 = [v7 endowmentNamespaceForDomain:v8 andName:v9];

  if (v10)
  {
    v11 = [v6 availableInheritances];
    v12 = [v11 allNamespaces];
    int v13 = [v12 containsObject:v10];

    if (v13)
    {
      uint64_t v14 = [v6 availableInheritances];
      uint64_t v15 = [a1 sourceEnvironment];
      uint64_t v16 = [v14 inheritancesForEnvironment:v15];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "endowmentNamespace", (void)v24);
            char v22 = [v10 isEqual:v21];

            if (v22)
            {
              uint64_t v18 = 1;
              goto LABEL_17;
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
    else
    {
      uint64_t v18 = 0;
    }

    if (!a3) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v18 = 1;
    if (!a3) {
      goto LABEL_20;
    }
  }
  *a3 = v10 != 0;
LABEL_20:

LABEL_21:
  return v18;
}

- (uint64_t)_doesRestrictionAllowForContext:(uint64_t)a3 withError:
{
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = [v5 domainAttributeManager];
    v8 = [a1 domain];
    v9 = [a1 name];
    v10 = [v7 restrictionsForDomain:v8 andName:v9];

    if (v10) {
      uint64_t v11 = [v10 allowsContext:v6 withError:a3];
    }
    else {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (uint64_t)_areTargetEntitlementsValidForContext:(void *)a3 withError:
{
  v21[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = [v5 domainAttributeManager];
    v8 = [a1 domain];
    v9 = [a1 name];
    v10 = [v7 targetEntitlementsForDomain:v8 andName:v9];

    if (v10)
    {
      uint64_t v11 = [v6 targetEntitlements];
      uint64_t v12 = [v10 matchesEntitlements:v11];

      if (a3 && (v12 & 1) == 0)
      {
        int v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v14 = *MEMORY[0x263F64670];
        uint64_t v15 = *MEMORY[0x263F08338];
        v21[0] = @"Target is not running or required target entitlement is missing";
        uint64_t v16 = *MEMORY[0x263F64668];
        v20[0] = v15;
        v20[1] = v16;
        id v17 = [a1 description];
        v21[1] = v17;
        uint64_t v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
        *a3 = [v13 errorWithDomain:v14 code:3 userInfo:v18];

        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (uint64_t)_areAdditionalRestrictionsValidForContext:(void *)a3 withError:
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = [v5 domainAttributeManager];
    v8 = [a1 domain];
    v9 = [a1 name];
    v10 = [v7 additionalRestrictionsForDomain:v8 andName:v9];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v42 = a1;
      v43 = a3;
      uint64_t v14 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v16, "isEqualToString:", @"TargetsSelf", v42))
          {
            id v17 = [v6 targetIdentity];
            uint64_t v18 = [v6 originatorProcess];
            uint64_t v19 = [v18 identity];
            char v20 = [v17 isEqual:v19];

            if ((v20 & 1) == 0)
            {
              uint64_t v29 = v43;
              if (v43)
              {
                id v25 = v11;
                v30 = (void *)MEMORY[0x263F087E8];
                uint64_t v31 = *MEMORY[0x263F64670];
                uint64_t v32 = *MEMORY[0x263F08338];
                v51[0] = @"This domain attribute can only target self";
                uint64_t v33 = *MEMORY[0x263F64668];
                v50[0] = v32;
                v50[1] = v33;
                uint64_t v34 = [v42 description];
                v51[1] = v34;
                uint64_t v35 = NSDictionary;
                uint64_t v36 = v51;
                v37 = v50;
LABEL_20:
                v40 = [v35 dictionaryWithObjects:v36 forKeys:v37 count:2];
                void *v29 = [v30 errorWithDomain:v31 code:3 userInfo:v40];

                uint64_t v28 = 0;
                id v11 = v25;
                goto LABEL_22;
              }
LABEL_21:
              uint64_t v28 = 0;
              goto LABEL_22;
            }
          }
          else if ([v16 isEqualToString:@"TargetsHosted"])
          {
            v21 = [v6 targetIdentity];
            char v22 = [v21 hostIdentifier];
            int v23 = [v22 pid];
            long long v24 = [v6 originatorProcess];
            id v25 = v11;
            int v26 = objc_msgSend(v24, "rbs_pid");

            BOOL v27 = v23 == v26;
            id v11 = v25;
            if (!v27)
            {
              uint64_t v29 = v43;
              if (v43)
              {
                v30 = (void *)MEMORY[0x263F087E8];
                uint64_t v31 = *MEMORY[0x263F64670];
                uint64_t v38 = *MEMORY[0x263F08338];
                v49[0] = @"This domain attribute can only target processes hosted by the originator";
                uint64_t v39 = *MEMORY[0x263F64668];
                v48[0] = v38;
                v48[1] = v39;
                uint64_t v34 = [v42 description];
                v49[1] = v34;
                uint64_t v35 = NSDictionary;
                uint64_t v36 = v49;
                v37 = v48;
                goto LABEL_20;
              }
              goto LABEL_21;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    uint64_t v28 = 1;
LABEL_22:
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

void __93__RBSDomainAttribute_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke(void *a1, void *a2, char a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[6];
  id v7 = a2;
  objc_msgSend(v7, "applyToAssertionIntransientState:attributePath:context:", v5, RBSAttributePathIncrement(v6, a3), a1[5]);
}

void __91__RBSDomainAttribute_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke(void *a1, void *a2, char a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[6];
  id v7 = a2;
  objc_msgSend(v7, "applyToAssertionTransientState:attributePath:context:", v5, RBSAttributePathIncrement(v6, a3), a1[5]);
}

void __80__RBSDomainAttribute_RBProcessState__applyToProcessState_attributePath_context___block_invoke(void *a1, void *a2, char a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[6];
  id v7 = a2;
  objc_msgSend(v7, "applyToProcessState:attributePath:context:", v5, RBSAttributePathIncrement(v6, a3), a1[5]);
}

void __69__RBSDomainAttribute_RBProcessState__effectiveAttributesWithContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 effectiveAttributesWithContext:*(void *)(a1 + 40)];
  [v2 unionSet:v3];
}

@end