@interface RBSHereditaryGrant
- (void)_withEndowmentFromContext:(void *)a3 block:;
@end

@implementation RBSHereditaryGrant

- (void)_withEndowmentFromContext:(void *)a3 block:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (void *)MEMORY[0x22A660FC0]();
    v8 = [a1 encodedEndowment];
    v9 = [v5 assertionID];
    if (!v8)
    {
      v10 = [a1 endowmentNamespace];
      v11 = [v5 availableInheritances];
      v12 = [v11 allNamespaces];
      int v13 = [v12 containsObject:v10];

      if (v13)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v14 = [a1 sourceEnvironment];
        v15 = [v11 inheritancesForEnvironment:v14];

        v8 = (void *)[v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v8)
        {
          v22 = v11;
          v23 = v7;
          id v24 = v5;
          uint64_t v16 = *(void *)v26;
          while (2)
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v15);
              }
              v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              v19 = [v18 endowmentNamespace];
              int v20 = [v19 isEqual:v10];

              if (v20)
              {
                v8 = [v18 encodedEndowment];
                uint64_t v21 = [v18 originatingIdentifier];

                v9 = (void *)v21;
                goto LABEL_15;
              }
            }
            v8 = (void *)[v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
            if (v8) {
              continue;
            }
            break;
          }
LABEL_15:
          v7 = v23;
          id v5 = v24;
          v11 = v22;
        }
      }
      else
      {
        v8 = 0;
      }
    }
    v6[2](v6, v8, v9);
  }
}

void __91__RBSHereditaryGrant_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v6 = 0;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "applyToAssertionTransientState:attributePath:context:", *(void *)(a1 + 40), RBSAttributePathIncrement(*(void *)(a1 + 56), v6 + i), *(void *)(a1 + 48));
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        v6 += i;
      }
      while (v5);
    }
  }
}

void __80__RBSHereditaryGrant_RBProcessState__applyToProcessState_attributePath_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F644C0]);
    uint64_t v5 = [*(id *)(a1 + 32) endowmentNamespace];
    char v6 = [*(id *)(a1 + 40) target];
    uint64_t v7 = [v6 environment];
    v8 = [*(id *)(a1 + 40) assertionID];
    long long v9 = (void *)[v4 _initWithNamespace:v5 environment:v7 encodedEndowment:v3 originatingIdentifier:v8 attributePath:*(void *)(a1 + 56)];

    [*(id *)(a1 + 48) addInheritance:v9];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v10 = objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "applyToProcessState:attributePath:context:", *(void *)(a1 + 48), RBSAttributePathIncrement(*(void *)(a1 + 56), v13 + i), *(void *)(a1 + 40));
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        v13 += i;
      }
      while (v12);
    }
  }
}

void __93__RBSHereditaryGrant_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v6 = 0;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "applyToAssertionIntransientState:attributePath:context:", *(void *)(a1 + 40), RBSAttributePathIncrement(*(void *)(a1 + 56), v6 + i), *(void *)(a1 + 48));
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        v6 += i;
      }
      while (v5);
    }
  }
}

void __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke(id *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [a1[4] attributes];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke_2;
    v4[3] = &unk_2647C88A0;
    id v5 = a1[5];
    id v6 = a1[6];
    [v3 enumerateObjectsUsingBlock:v4];
  }
}

void __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 effectiveAttributesWithContext:*(void *)(a1 + 40)];
  [v2 unionSet:v3];
}

@end