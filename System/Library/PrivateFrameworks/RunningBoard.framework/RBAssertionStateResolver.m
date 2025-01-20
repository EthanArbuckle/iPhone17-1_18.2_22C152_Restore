@interface RBAssertionStateResolver
- (NSMapTable)savedEndowments;
- (RBAssertionCollection)assertionCollection;
- (RBBundlePropertiesManaging)bundlePropertiesManager;
- (RBDomainAttributeManaging)domainAttributeManager;
- (RBEntitlementManaging)entitlementManager;
- (RBProcessIndex)processIndex;
- (RBProcessMap)stateMap;
- (RBSystemState)systemState;
- (id)assertionDescriptorsWithFlattenedAttributes:(BOOL)a3;
- (id)resolveForAssertions:(id)a3;
- (void)setAssertionCollection:(id)a3;
- (void)setBundlePropertiesManager:(id)a3;
- (void)setDomainAttributeManager:(id)a3;
- (void)setEntitlementManager:(id)a3;
- (void)setProcessIndex:(id)a3;
- (void)setSavedEndowments:(id)a3;
- (void)setStateMap:(id)a3;
- (void)setSystemState:(id)a3;
@end

@implementation RBAssertionStateResolver

- (void)setSystemState:(id)a3
{
}

- (id)resolveForAssertions:(id)a3
{
  id v4 = a3;
  v5 = -[RBAssertionResolutionContext initWithAssertions:]([RBAssertionResolutionContext alloc], v4);

  -[RBAssertionResolutionContext setAssertionCollection:]((uint64_t)v5, self->_assertionCollection);
  -[RBAssertionResolutionContext setProcessIndex:]((uint64_t)v5, self->_processIndex);
  -[RBAssertionResolutionContext setStateMap:]((uint64_t)v5, self->_stateMap);
  -[RBAssertionResolutionContext setDomainAttributeManager:]((uint64_t)v5, self->_domainAttributeManager);
  -[RBAssertionResolutionContext setBundlePropertiesManager:]((uint64_t)v5, self->_bundlePropertiesManager);
  -[RBAssertionResolutionContext setEntitlementManager:]((uint64_t)v5, self->_entitlementManager);
  -[RBAssertionResolutionContext setSavedEndowments:]((uint64_t)v5, self->_savedEndowments);
  -[RBAssertionResolutionContext setSystemState:]((uint64_t)v5, self->_systemState);
  -[RBAssertionResolutionContext resolve]((uint64_t)v5);
  return v5;
}

- (id)assertionDescriptorsWithFlattenedAttributes:(BOOL)a3
{
  v5 = -[RBAssertionResolutionContext initWithAssertions:]([RBAssertionResolutionContext alloc], 0);
  -[RBAssertionResolutionContext setAssertionCollection:]((uint64_t)v5, self->_assertionCollection);
  -[RBAssertionResolutionContext setProcessIndex:]((uint64_t)v5, self->_processIndex);
  -[RBAssertionResolutionContext setStateMap:]((uint64_t)v5, self->_stateMap);
  -[RBAssertionResolutionContext setDomainAttributeManager:]((uint64_t)v5, self->_domainAttributeManager);
  -[RBAssertionResolutionContext setBundlePropertiesManager:]((uint64_t)v5, self->_bundlePropertiesManager);
  -[RBAssertionResolutionContext setEntitlementManager:]((uint64_t)v5, self->_entitlementManager);
  -[RBAssertionResolutionContext setSavedEndowments:]((uint64_t)v5, self->_savedEndowments);
  v6 = [MEMORY[0x263EFF9C0] set];
  assertionCollection = self->_assertionCollection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke;
  v13[3] = &unk_2647C8DB0;
  BOOL v16 = a3;
  id v14 = v5;
  id v8 = v6;
  id v15 = v8;
  v9 = v5;
  [(RBAssertionCollection *)assertionCollection enumerateAssertionsWithBlock:v13];
  v10 = v15;
  id v11 = v8;

  return v11;
}

void __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isActive])
  {
    id v4 = [v3 target];
    v5 = [v3 attributes];
    if (*(unsigned char *)(a1 + 48))
    {
      v6 = [MEMORY[0x263EFF980] array];
      v7 = -[RBAssertionResolutionContext _createContextForAssertion:](*(void **)(a1 + 32), v3);
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      v18 = __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke_2;
      v19 = &unk_2647C88A0;
      id v8 = v6;
      id v20 = v8;
      id v21 = v7;
      id v9 = v7;
      [v5 enumerateObjectsUsingBlock:&v16];
      id v10 = v8;

      v5 = v10;
    }
    id v11 = (void *)MEMORY[0x263F64410];
    v12 = objc_msgSend(v3, "identifier", v16, v17, v18, v19);
    v13 = [v4 createRBSTarget];
    id v14 = [v3 explanation];
    id v15 = [v11 descriptorWithIdentifier:v12 target:v13 explanation:v14 attributes:v5];

    [*(id *)(a1 + 40) addObject:v15];
  }
}

void __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 effectiveAttributesWithContext:*(void *)(a1 + 40)];
  id v3 = [v4 allObjects];
  [v2 addObjectsFromArray:v3];
}

- (RBAssertionCollection)assertionCollection
{
  return self->_assertionCollection;
}

- (void)setAssertionCollection:(id)a3
{
}

- (RBProcessIndex)processIndex
{
  return self->_processIndex;
}

- (void)setProcessIndex:(id)a3
{
}

- (RBProcessMap)stateMap
{
  return self->_stateMap;
}

- (void)setStateMap:(id)a3
{
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return self->_domainAttributeManager;
}

- (void)setDomainAttributeManager:(id)a3
{
}

- (RBBundlePropertiesManaging)bundlePropertiesManager
{
  return self->_bundlePropertiesManager;
}

- (void)setBundlePropertiesManager:(id)a3
{
}

- (RBEntitlementManaging)entitlementManager
{
  return self->_entitlementManager;
}

- (void)setEntitlementManager:(id)a3
{
}

- (NSMapTable)savedEndowments
{
  return self->_savedEndowments;
}

- (void)setSavedEndowments:(id)a3
{
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_domainAttributeManager, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_assertionCollection, 0);
}

@end