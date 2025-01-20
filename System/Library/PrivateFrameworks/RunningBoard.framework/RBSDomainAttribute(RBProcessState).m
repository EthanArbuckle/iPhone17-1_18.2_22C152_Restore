@interface RBSDomainAttribute(RBProcessState)
- (id)effectiveAttributesWithContext:()RBProcessState;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAcquisitionContext:()RBProcessState;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
- (void)applyToSystemState:()RBProcessState attributePath:context:;
@end

@implementation RBSDomainAttribute(RBProcessState)

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v8 = a3;
  id v9 = a5;
  [v8 setHasDomainAttribute:1];
  v10 = [a1 sourceEnvironment];
  if (v10)
  {
    v11 = [v8 sourceEnvironments];
    [v11 addObject:v10];
  }
  id v12 = [NSString alloc];
  v13 = [a1 domain];
  v14 = [a1 name];
  v15 = (void *)[v12 initWithFormat:@"%@:%@", v13, v14];

  v16 = [v8 domainAttributes];

  if (v16)
  {
    id v17 = [NSString alloc];
    v18 = [v8 domainAttributes];
    v19 = (void *)[v17 initWithFormat:@"%@,%@", v18, v15];
    [v8 setDomainAttributes:v19];
  }
  else
  {
    [v8 setDomainAttributes:v15];
  }
  BOOL v29 = 0;
  if (-[RBSDomainAttribute _contextContainsRequiredEndowment:requiresEndowment:](a1, v9, &v29))
  {
    if (v29) {
      [v9 pushActiveDueToInheritedEndowment];
    }
    v20 = [v9 domainAttributeManager];
    v21 = [a1 domain];
    v22 = [a1 name];
    v23 = [v20 attributesForDomain:v21 andName:v22 context:v9 withError:0];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __93__RBSDomainAttribute_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke;
    v25[3] = &unk_2647C8E00;
    id v26 = v8;
    uint64_t v28 = a4;
    id v24 = v9;
    id v27 = v24;
    [v23 enumerateObjectsUsingBlock:v25];
    if (v29) {
      [v24 popActiveDueToInheritedEndowment];
    }
  }
}

- (void)applyToAcquisitionContext:()RBProcessState
{
  id v4 = a3;
  v5 = [v4 daemonContext];
  v6 = [v5 domainAttributeManager];
  v7 = [a1 domain];
  id v8 = [a1 name];
  id v9 = [v6 attributesForDomain:v7 andName:v8 context:0 withError:0];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__RBSDomainAttribute_RBProcessState__applyToAcquisitionContext___block_invoke;
  v11[3] = &unk_2647C8E28;
  id v12 = v4;
  id v10 = v4;
  [v9 enumerateObjectsUsingBlock:v11];
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v34[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 ignoreRestrictions]) {
    goto LABEL_2;
  }
  v13 = [v6 domainAttributeManager];
  v14 = [a1 domain];
  v15 = [a1 name];
  char v16 = [v13 areTargetPropertiesValidForContext:v6 forAttributeWithDomain:v14 andName:v15];

  if (v16)
  {
    if (-[RBSDomainAttribute _areOriginatorEntitlementsValidForContext:withError:](a1, v6, a4)
      && -[RBSDomainAttribute _areTargetEntitlementsValidForContext:withError:](a1, v6, a4)
      && -[RBSDomainAttribute _areAdditionalRestrictionsValidForContext:withError:](a1, v6, a4)
      && -[RBSDomainAttribute _doesRestrictionAllowForContext:withError:](a1, v6, (uint64_t)a4))
    {
LABEL_2:
      [v6 pushIgnoreRestrictions];
      v7 = [v6 domainAttributeManager];
      id v8 = [a1 domain];
      id v9 = [a1 name];
      id v31 = 0;
      id v10 = [v7 attributesForDomain:v8 andName:v9 context:v6 withError:&v31];
      id v11 = v31;

      if (!v11)
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v10 = v10;
        uint64_t v22 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v28;
          while (2)
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v28 != v24) {
                objc_enumerationMutation(v10);
              }
              if (!objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v25), "isValidForContext:withError:", v6, a4, (void)v27))
              {

                goto LABEL_25;
              }
              ++v25;
            }
            while (v23 != v25);
            uint64_t v23 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        [v6 popIgnoreRestrictions];
        uint64_t v21 = 1;
        goto LABEL_26;
      }
      if (!a4)
      {
LABEL_25:
        uint64_t v21 = 0;
        goto LABEL_26;
      }
      id v12 = v11;
      id v11 = v12;
LABEL_13:
      uint64_t v21 = 0;
      *a4 = v12;
LABEL_26:

      goto LABEL_27;
    }
  }
  else if (a4)
  {
    id v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F64670];
    uint64_t v19 = *MEMORY[0x263F08338];
    v34[0] = @"Target for domain attribute is missing a required plist property";
    uint64_t v20 = *MEMORY[0x263F64668];
    v33[0] = v19;
    v33[1] = v20;
    id v11 = [a1 description];
    v34[1] = v11;
    id v10 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v12 = [v17 errorWithDomain:v18 code:2 userInfo:v10];
    goto LABEL_13;
  }
  uint64_t v21 = 0;
LABEL_27:

  return v21;
}

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v8 = a3;
  id v9 = a5;
  BOOL v22 = 0;
  if (-[RBSDomainAttribute _contextContainsRequiredEndowment:requiresEndowment:](a1, v9, &v22))
  {
    if (v22) {
      [v9 pushActiveDueToInheritedEndowment];
    }
    id v10 = [v9 domainAttributeManager];
    id v11 = [a1 domain];
    id v12 = [a1 name];
    v13 = [v10 attributesForDomain:v11 andName:v12 context:v9 withError:0];

    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __91__RBSDomainAttribute_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke;
    uint64_t v18 = &unk_2647C8E00;
    id v19 = v8;
    uint64_t v21 = a4;
    id v14 = v9;
    id v20 = v14;
    [v13 enumerateObjectsUsingBlock:&v15];
    if (v22) {
      objc_msgSend(v14, "popActiveDueToInheritedEndowment", v15, v16, v17, v18, v19);
    }
  }
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v8 = a3;
  id v9 = a5;
  BOOL v22 = 0;
  if (-[RBSDomainAttribute _contextContainsRequiredEndowment:requiresEndowment:](a1, v9, &v22))
  {
    if (v22) {
      [v9 pushActiveDueToInheritedEndowment];
    }
    id v10 = [v9 domainAttributeManager];
    id v11 = [a1 domain];
    id v12 = [a1 name];
    v13 = [v10 attributesForDomain:v11 andName:v12 context:v9 withError:0];

    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __80__RBSDomainAttribute_RBProcessState__applyToProcessState_attributePath_context___block_invoke;
    uint64_t v18 = &unk_2647C8E00;
    id v19 = v8;
    uint64_t v21 = a4;
    id v14 = v9;
    id v20 = v14;
    [v13 enumerateObjectsUsingBlock:&v15];
    if (v22) {
      objc_msgSend(v14, "popActiveDueToInheritedEndowment", v15, v16, v17, v18, v19);
    }
  }
}

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  BOOL v24 = 0;
  if (-[RBSDomainAttribute _contextContainsRequiredEndowment:requiresEndowment:](a1, v9, &v24))
  {
    if (v24) {
      [v9 pushActiveDueToInheritedEndowment];
    }
    id v10 = [v9 domainAttributeManager];
    id v11 = [a1 domain];
    id v12 = [a1 name];
    v13 = [v10 attributesForDomain:v11 andName:v12 context:v9 withError:0];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      char v17 = 0;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "applyToSystemState:attributePath:context:", v8, RBSAttributePathIncrement(a4, v17 + i), v9, (void)v20);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
        v17 += i;
      }
      while (v16);
    }

    if (v24) {
      [v9 popActiveDueToInheritedEndowment];
    }
  }
}

- (id)effectiveAttributesWithContext:()RBProcessState
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  if (-[RBSDomainAttribute _contextContainsRequiredEndowment:requiresEndowment:](a1, v4, 0))
  {
    id v6 = [v4 domainAttributeManager];
    v7 = [a1 domain];
    id v8 = [a1 name];
    id v9 = [v6 attributesForDomain:v7 andName:v8 context:v4 withError:0];

    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __69__RBSDomainAttribute_RBProcessState__effectiveAttributesWithContext___block_invoke;
    id v14 = &unk_2647C88A0;
    id v15 = v5;
    id v16 = v4;
    [v9 enumerateObjectsUsingBlock:&v11];
  }
  objc_msgSend(v5, "addObject:", a1, v11, v12, v13, v14);

  return v5;
}

@end