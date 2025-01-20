@interface RBAllEntitlementPredicate
- (BOOL)matchesEntitlements:(id)a3;
- (RBAllEntitlementPredicate)initWithDictionary:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6;
- (id)allEntitlements;
- (id)description;
- (unint64_t)count;
@end

@implementation RBAllEntitlementPredicate

- (RBAllEntitlementPredicate)initWithDictionary:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)MEMORY[0x263EFF9A0];
  id v14 = a3;
  v15 = [v13 dictionary];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke;
  v26 = &unk_2647C87D8;
  id v27 = v10;
  id v28 = v11;
  id v29 = v12;
  id v30 = v15;
  id v16 = v15;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v14 enumerateKeysAndObjectsUsingBlock:&v23];

  objc_msgSend(NSDictionary, "dictionaryWithDictionary:", v16, v23, v24, v25, v26);
  v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  predicate = self->_predicate;
  self->_predicate = v20;

  return self;
}

void __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = RBAllEntitlementPredicate;
LABEL_11:
      id v16 = *(void **)(a1 + 56);
      id v17 = [(__objc2_class *)v7 predicateForObject:v5 forDomain:*(void *)(a1 + 32) attribute:*(void *)(a1 + 40) errors:*(void *)(a1 + 48)];
      [v16 setObject:v6 forKey:v17];

      goto LABEL_12;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = RBAnyEntitlementPredicate;
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 56) setObject:v6 forKey:v5];
      goto LABEL_12;
    }
    id v18 = rbs_general_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      v9 = (void *)MEMORY[0x263F087E8];
      id v10 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains entitlement name of wrong type: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v5, *MEMORY[0x263F08338]];
      v20 = v10;
      id v11 = NSDictionary;
      id v12 = &v20;
      v13 = &v19;
      goto LABEL_8;
    }
  }
  else
  {
    v8 = rbs_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_2();
    }

    if (*(void *)(a1 + 48))
    {
      v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = *MEMORY[0x263F08338];
      id v10 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains entitlement value of wrong type: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v6];
      v22[0] = v10;
      id v11 = NSDictionary;
      id v12 = (void **)v22;
      v13 = &v21;
LABEL_8:
      id v14 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
      v15 = [v9 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v14];

      [*(id *)(a1 + 48) addObject:v15];
    }
  }
LABEL_12:
}

- (BOOL)matchesEntitlements:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  predicate = self->_predicate;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__RBAllEntitlementPredicate_matchesEntitlements___block_invoke;
  v8[3] = &unk_2647C8800;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [(NSDictionary *)predicate enumerateKeysAndObjectsUsingBlock:v8];
  LOBYTE(predicate) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)predicate;
}

void __49__RBAllEntitlementPredicate_matchesEntitlements___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([*(id *)(a1 + 32) hasEntitlement:v6]) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (([v6 matchesEntitlements:*(void *)(a1 + 32)] & 1) == 0)
  {
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
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
  v5[2] = __34__RBAllEntitlementPredicate_count__block_invoke;
  v5[3] = &unk_2647C8828;
  v5[4] = &v6;
  [(NSDictionary *)predicate enumerateKeysAndObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __34__RBAllEntitlementPredicate_count__block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __44__RBAllEntitlementPredicate_allEntitlements__block_invoke;
  v8[3] = &unk_2647C8850;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)predicate enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithSet:v5];

  return v6;
}

void __44__RBAllEntitlementPredicate_allEntitlements__block_invoke(uint64_t a1, void *a2)
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
  id v4 = [(NSDictionary *)self->_predicate allKeys];
  id v5 = [v4 componentsJoinedByString:@" && "];
  id v6 = (void *)[v3 initWithFormat:@"(%@)", v5];

  return v6;
}

- (void).cxx_destruct
{
}

void __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_6(&dword_226AB3000, v0, v1, "Domain %{public}@ attribute %{public}@ contains entitlement name of wrong type: %{public}@");
}

void __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_6(&dword_226AB3000, v0, v1, "Domain %{public}@ attribute %{public}@ contains entitlement value of wrong type: %{public}@");
}

@end