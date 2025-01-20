@interface RBDomainAttributeManager
- (BOOL)_compareTargetBundleProperties:(void *)a3 withContext:;
- (BOOL)areTargetPropertiesValidForContext:(id)a3 forAttributeWithDomain:(id)a4 andName:(id)a5;
- (BOOL)containsAttributeWithDomain:(id)a3 andName:(id)a4;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBDomainAttributeManager)initWithDataProvider:(id)a3;
- (id)additionalRestrictionsForDomain:(id)a3 andName:(id)a4;
- (id)allEntitlements;
- (id)attributesForDomain:(id)a3 andName:(id)a4 context:(id)a5 withError:(id *)a6;
- (id)endowmentNamespaceForDomain:(id)a3 andName:(id)a4;
- (id)originatorEntitlementsForDomain:(id)a3 andName:(id)a4;
- (id)restrictionsForDomain:(id)a3 andName:(id)a4;
- (id)targetEntitlementsForDomain:(id)a3 andName:(id)a4;
- (uint64_t)_compareRestrictions:(void *)a3 withContext:;
- (void)_prepareAttributeTemplates;
@end

@implementation RBDomainAttributeManager

- (id)attributesForDomain:(id)a3 andName:(id)a4 context:(id)a5 withError:(id *)a6
{
  v60[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(NSDictionary *)self->_domainAttributeTemplatesByDomain objectForKeyedSubscript:v10];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 objectForKeyedSubscript:v11];
    if (v15)
    {
      v16 = [MEMORY[0x263EFF980] array];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      obj = [v15 attributeGroups];
      uint64_t v17 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (!v17) {
        goto LABEL_35;
      }
      uint64_t v18 = v17;
      v41 = v15;
      v42 = v14;
      id v43 = v11;
      id v44 = v10;
      uint64_t v19 = *(void *)v52;
      while (1)
      {
        uint64_t v20 = 0;
        uint64_t v45 = v18;
        do
        {
          if (*(void *)v52 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v51 + 1) + 8 * v20);
          if (!v12) {
            goto LABEL_11;
          }
          v22 = [*(id *)(*((void *)&v51 + 1) + 8 * v20) targetBundleProperties];
          if (-[RBDomainAttributeManager _compareTargetBundleProperties:withContext:]((BOOL)self, v22, v12))
          {
            v23 = [v21 restriction];
            int v24 = -[RBDomainAttributeManager _compareRestrictions:withContext:]((uint64_t)self, v23, v12);

            if (!v24) {
              goto LABEL_22;
            }
LABEL_11:
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            v22 = objc_msgSend(v21, "attributes", v41, v42, v43, v44);
            uint64_t v25 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = v19;
              id v28 = v12;
              v29 = self;
              uint64_t v30 = *(void *)v48;
              do
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v48 != v30) {
                    objc_enumerationMutation(v22);
                  }
                  v32 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                  if (v32)
                  {
                    v33 = (void *)[v32 copy];
                    [v16 addObject:v33];
                  }
                }
                uint64_t v26 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
              }
              while (v26);
              self = v29;
              id v12 = v28;
              uint64_t v19 = v27;
              uint64_t v18 = v45;
            }
          }

LABEL_22:
          ++v20;
        }
        while (v20 != v18);
        uint64_t v18 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (!v18)
        {
          id v11 = v43;
          id v10 = v44;
          v15 = v41;
          v14 = v42;
          goto LABEL_35;
        }
      }
    }
    if (a6)
    {
      v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v38 = *MEMORY[0x263F64670];
      uint64_t v57 = *MEMORY[0x263F08338];
      v58 = @"Could not find attribute name in domain plist";
      v39 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      *a6 = [v37 errorWithDomain:v38 code:2 userInfo:v39];
    }
    obj = rbs_assertion_log();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[RBDomainAttributeManager attributesForDomain:andName:context:withError:]((uint64_t)v11, (uint64_t)v10, obj);
    }
    v16 = 0;
LABEL_35:
  }
  else
  {
    if (a6)
    {
      v34 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F64670];
      uint64_t v59 = *MEMORY[0x263F08338];
      v60[0] = @"Could not find plist for domain attribute";
      v36 = [NSDictionary dictionaryWithObjects:v60 forKeys:&v59 count:1];
      *a6 = [v34 errorWithDomain:v35 code:2 userInfo:v36];
    }
    v15 = rbs_assertion_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RBDomainAttributeManager attributesForDomain:andName:context:withError:]((uint64_t)v10, v15);
    }
    v16 = 0;
  }

  return v16;
}

- (BOOL)_compareTargetBundleProperties:(void *)a3 withContext:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    v8 = [v6 targetProperties];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke;
    v11[3] = &unk_2647C8C48;
    id v9 = v8;
    id v12 = v9;
    v14 = &v15;
    id v13 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];
    a1 = *((unsigned char *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }

  return a1;
}

- (uint64_t)_compareRestrictions:(void *)a3 withContext:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (v5) {
      a1 = [v5 allowsContext:v6 withError:0];
    }
    else {
      a1 = 1;
    }
  }

  return a1;
}

- (id)endowmentNamespaceForDomain:(id)a3 andName:(id)a4
{
  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  id v6 = a4;
  v7 = [(NSDictionary *)domainAttributeTemplatesByDomain objectForKeyedSubscript:a3];
  v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = -[RBDomainAttributeTemplate endowmentNamespace]((uint64_t)v8);

  return v9;
}

- (id)originatorEntitlementsForDomain:(id)a3 andName:(id)a4
{
  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  id v6 = a4;
  v7 = [(NSDictionary *)domainAttributeTemplatesByDomain objectForKeyedSubscript:a3];
  v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = [v8 originatorEntitlements];

  return v9;
}

- (id)restrictionsForDomain:(id)a3 andName:(id)a4
{
  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  id v6 = a4;
  v7 = [(NSDictionary *)domainAttributeTemplatesByDomain objectForKeyedSubscript:a3];
  v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = [v8 restriction];

  return v9;
}

- (BOOL)areTargetPropertiesValidForContext:(id)a3 forAttributeWithDomain:(id)a4 andName:(id)a5
{
  v7 = self;
  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NSDictionary *)domainAttributeTemplatesByDomain objectForKeyedSubscript:a4];
  id v12 = [v11 objectForKeyedSubscript:v9];

  id v13 = [v12 targetBundleProperties];
  LOBYTE(v7) = -[RBDomainAttributeManager _compareTargetBundleProperties:withContext:]((BOOL)v7, v13, v10);

  return (char)v7;
}

- (id)additionalRestrictionsForDomain:(id)a3 andName:(id)a4
{
  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  id v6 = a4;
  v7 = [(NSDictionary *)domainAttributeTemplatesByDomain objectForKeyedSubscript:a3];
  v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = [v8 additionalRestrictions];
  id v11 = [v10 allKeys];
  id v12 = [v9 setWithArray:v11];

  return v12;
}

- (id)targetEntitlementsForDomain:(id)a3 andName:(id)a4
{
  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  id v6 = a4;
  v7 = [(NSDictionary *)domainAttributeTemplatesByDomain objectForKeyedSubscript:a3];
  v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = [v8 targetEntitlements];

  return v9;
}

void __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([v7 isEqualToString:@"SupportsBackgroundContentFetching"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [*(id *)(a1 + 32) supportsBackgroundContentFetching];
LABEL_35:
      int v15 = v9;
      int v16 = [v8 BOOLValue];
      goto LABEL_36;
    }
    id v10 = rbs_general_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_58;
    }
LABEL_63:

    goto LABEL_64;
  }
  if ([v7 isEqualToString:@"UsesSocketMonitoring"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [*(id *)(a1 + 32) usesSocketMonitoring];
      goto LABEL_35;
    }
    id v10 = rbs_general_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_58;
    }
    goto LABEL_63;
  }
  if ([v7 isEqualToString:@"SupportsBackgroundNetworkAuthentication"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [*(id *)(a1 + 32) supportsBackgroundNetworkAuthentication];
      goto LABEL_35;
    }
    id v10 = rbs_general_log();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_63;
    }
LABEL_58:
    __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_1();
    goto LABEL_63;
  }
  if ([v7 isEqualToString:@"SupportsUnboundedTaskCompletion"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [*(id *)(a1 + 32) supportsUnboundedTaskCompletion];
      goto LABEL_35;
    }
    id v10 = rbs_general_log();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_63;
    }
    goto LABEL_58;
  }
  if ([v7 isEqualToString:@"SupportsBackgroundAudio"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [*(id *)(a1 + 32) supportsBackgroundAudio];
      goto LABEL_35;
    }
    id v10 = rbs_general_log();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_63;
    }
    goto LABEL_58;
  }
  if ([v7 isEqualToString:@"ContinuousBackgroundMode"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = rbs_general_log();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_63;
      }
      goto LABEL_58;
    }
    int v11 = [*(id *)(a1 + 32) continuousBackgroundMode];
    if (v11 != [v8 BOOLValue])
    {
LABEL_37:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      *a4 = 1;
      goto LABEL_64;
    }
    id v12 = [*(id *)(a1 + 40) targetProcess];
    char v13 = [v12 isPlatformBinary];
    goto LABEL_28;
  }
  if ([v7 isEqualToString:@"IsExtension"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [*(id *)(a1 + 32) isExtension];
      goto LABEL_35;
    }
    id v10 = rbs_general_log();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_63;
    }
    goto LABEL_58;
  }
  if (![v7 isEqualToString:@"Platform"])
  {
    if ([v7 isEqualToString:@"NotPlatform"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v17 = [*(id *)(a1 + 32) platform];
        if (v17 != [v8 intValue]) {
          goto LABEL_64;
        }
        goto LABEL_37;
      }
      id v10 = rbs_general_log();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_63;
      }
      goto LABEL_58;
    }
    if (![v7 isEqualToString:@"BundleID"])
    {
      id v10 = rbs_general_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_11((uint64_t)v7, v10);
      }
      goto LABEL_63;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = rbs_general_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_10();
      }
      goto LABEL_63;
    }
    id v18 = [*(id *)(a1 + 32) bundleIdentifier];
    if (v18 == v8)
    {

      goto LABEL_64;
    }
    if (!v8 || !v18)
    {

      goto LABEL_37;
    }
    id v12 = v18;
    char v13 = [v18 isEqual:v8];
LABEL_28:
    char v14 = v13;

    if (v14) {
      goto LABEL_64;
    }
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = rbs_general_log();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_63;
    }
    goto LABEL_58;
  }
  int v15 = [*(id *)(a1 + 32) platform];
  int v16 = [v8 intValue];
LABEL_36:
  if (v15 != v16) {
    goto LABEL_37;
  }
LABEL_64:
}

- (RBDomainAttributeManager)initWithDataProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBDomainAttributeManager;
  id v6 = [(RBDomainAttributeManager *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataProvider, a3);
    -[RBDomainAttributeManager _prepareAttributeTemplates]((uint64_t)v7);
  }

  return v7;
}

- (void)_prepareAttributeTemplates
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x22A660FC0]();
    uint64_t v3 = [*(id *)(a1 + 16) templatesByDomain];
    v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v3;
  }
}

- (NSString)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__RBDomainAttributeManager_debugDescription__block_invoke;
  v11[3] = &unk_2647C8BE0;
  id v12 = v3;
  id v5 = v3;
  [(NSDictionary *)domainAttributeTemplatesByDomain enumerateKeysAndObjectsUsingBlock:v11];
  id v6 = [NSString alloc];
  id v7 = [(id)objc_opt_class() description];
  id v8 = [v5 description];
  objc_super v9 = (void *)[v6 initWithFormat:@"<%@|  domainAttributeTemplatesByDomain:%@>", v7, v8];

  return (NSString *)v9;
}

void __44__RBDomainAttributeManager_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 entriesToStringWithIndent:2 debug:1];
  [v4 appendFormat:@"\n\t%@={\n%@\n\t}", v5, v6];
}

- (id)allEntitlements
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__RBDomainAttributeManager_allEntitlements__block_invoke;
  block[3] = &unk_2647C7CC8;
  block[4] = self;
  if (allEntitlements_onceToken != -1) {
    dispatch_once(&allEntitlements_onceToken, block);
  }
  return (id)allEntitlements_entitlements;
}

uint64_t __43__RBDomainAttributeManager_allEntitlements__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = (void *)allEntitlements_entitlements;
  allEntitlements_entitlements = v2;

  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_18];
}

uint64_t __43__RBDomainAttributeManager_allEntitlements__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_18];
}

void __43__RBDomainAttributeManager_allEntitlements__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (void *)allEntitlements_entitlements;
  id v4 = a3;
  id v5 = [v4 originatorEntitlements];
  id v6 = [v5 allEntitlements];
  [v3 unionSet:v6];

  id v7 = (void *)allEntitlements_entitlements;
  id v8 = [v4 targetEntitlements];
  objc_super v9 = [v8 allEntitlements];
  [v7 unionSet:v9];

  id v10 = (void *)allEntitlements_entitlements;
  id v12 = [v4 restriction];

  int v11 = [v12 allEntitlements];
  [v10 unionSet:v11];
}

- (BOOL)containsAttributeWithDomain:(id)a3 andName:(id)a4
{
  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  id v6 = a4;
  id v7 = [(NSDictionary *)domainAttributeTemplatesByDomain objectForKeyedSubscript:a3];
  id v8 = [v7 objectForKeyedSubscript:v6];

  return v8 != 0;
}

- (NSString)stateCaptureTitle
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_domainAttributeTemplatesByDomain, 0);
}

- (void)attributesForDomain:(uint64_t)a1 andName:(NSObject *)a2 context:withError:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Could not find plist for domain %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)attributesForDomain:(os_log_t)log andName:context:withError:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "Could not find attribute name %{public}@ in domain plist %{public}@", (uint8_t *)&v3, 0x16u);
}

void __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_10(v0);
  OUTLINED_FUNCTION_1_8(&dword_226AB3000, v2, v3, "Malformed domain plist - %{public}@ is not of class %{public}@", v4, v5, v6, v7, v8);
}

void __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_10()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_10(v0);
  OUTLINED_FUNCTION_1_8(&dword_226AB3000, v2, v3, "Malformed domain plist - %{public}@ is not of class %{public}@", v4, v5, v6, v7, v8);
}

void __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_11(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_226AB3000, a2, OS_LOG_TYPE_FAULT, "Malformed domain plist - %{public}@ unrecognized", (uint8_t *)&v2, 0xCu);
}

@end