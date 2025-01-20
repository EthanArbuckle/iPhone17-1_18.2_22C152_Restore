@interface RBAnyEntitlementPredicate
- (BOOL)matchesEntitlements:(id)a3;
- (RBAnyEntitlementPredicate)initWithArray:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6;
- (id)allEntitlements;
- (id)description;
- (unint64_t)count;
@end

@implementation RBAnyEntitlementPredicate

- (RBAnyEntitlementPredicate)initWithArray:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)MEMORY[0x263EFF980];
  id v14 = a3;
  v15 = [v13 array];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __70__RBAnyEntitlementPredicate_initWithArray_forDomain_attribute_errors___block_invoke;
  v26 = &unk_2647C8738;
  id v27 = v15;
  id v28 = v10;
  id v29 = v11;
  id v30 = v12;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = v15;
  [v14 enumerateObjectsUsingBlock:&v23];

  objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v19, v23, v24, v25, v26);
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  predicate = self->_predicate;
  self->_predicate = v20;

  return self;
}

void __70__RBAnyEntitlementPredicate_initWithArray_forDomain_attribute_errors___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = RBAllEntitlementPredicate;
LABEL_5:
    v5 = *(void **)(a1 + 32);
    v6 = [(__objc2_class *)v4 predicateForObject:v3 forDomain:*(void *)(a1 + 40) attribute:*(void *)(a1 + 48) errors:*(void *)(a1 + 56)];
    [v5 addObject:v6];

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = RBAnyEntitlementPredicate;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    v7 = rbs_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __70__RBAnyEntitlementPredicate_initWithArray_forDomain_attribute_errors___block_invoke_cold_1();
    }

    if (*(void *)(a1 + 56))
    {
      v8 = (void *)MEMORY[0x263F087E8];
      v9 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains entitlement value of wrong type: %@", *(void *)(a1 + 40), *(void *)(a1 + 48), v3, *MEMORY[0x263F08338]];
      v13[0] = v9;
      id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v11 = [v8 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v10];

      [*(id *)(a1 + 56) addObject:v11];
    }
  }
LABEL_6:
}

- (BOOL)matchesEntitlements:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  predicate = self->_predicate;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__RBAnyEntitlementPredicate_matchesEntitlements___block_invoke;
  v8[3] = &unk_2647C8760;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [(NSArray *)predicate enumerateObjectsUsingBlock:v8];
  LOBYTE(predicate) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)predicate;
}

void __49__RBAnyEntitlementPredicate_matchesEntitlements___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (![*(id *)(a1 + 32) hasEntitlement:v6]) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if ([v6 matchesEntitlements:*(void *)(a1 + 32)])
  {
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
LABEL_6:
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  predicate = self->_predicate;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__RBAnyEntitlementPredicate_count__block_invoke;
  v5[3] = &unk_2647C8788;
  v5[4] = &v6;
  [(NSArray *)predicate enumerateObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __34__RBAnyEntitlementPredicate_count__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v4 count];
  }
  else {
    uint64_t v3 = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v3;
}

- (id)allEntitlements
{
  uint64_t v3 = objc_opt_new();
  predicate = self->_predicate;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__RBAnyEntitlementPredicate_allEntitlements__block_invoke;
  v8[3] = &unk_2647C87B0;
  id v9 = v3;
  id v5 = v3;
  [(NSArray *)predicate enumerateObjectsUsingBlock:v8];
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithSet:v5];

  return v6;
}

void __44__RBAnyEntitlementPredicate_allEntitlements__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v5 = [v6 allEntitlements];
    [v4 unionSet:v5];
  }
  else
  {
    [v4 addObject:v6];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(NSArray *)self->_predicate componentsJoinedByString:@" || "];
  id v5 = (void *)[v3 initWithFormat:@"(%@)", v4];

  return v5;
}

- (void).cxx_destruct
{
}

void __70__RBAnyEntitlementPredicate_initWithArray_forDomain_attribute_errors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_6(&dword_226AB3000, v0, v1, "Domain %{public}@ attribute %{public}@ contains entitlement value of wrong type: %{public}@");
}

@end