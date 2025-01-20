@interface RBDomainAttributeManagerDataProvider
- (BOOL)_checkConflictingAttributes:(uint64_t)a3 error:;
- (RBDomainAttributeManagerDataProvider)initWithDictionary:(id)a3;
- (RBDomainAttributeManagerDataProvider)initWithPath:(id)a3;
- (RBDomainAttributeTemplate)_templateWithDomain:(void *)a3 name:(void *)a4 dictionary:(void *)a5 errors:;
- (RBDomainAttributeTemplate)_validatedDomainAttributeTemplateFromDomainAttributeTemplate:(void *)a3 dependenciesByFullyQualifiedName:(void *)a4 errors:;
- (id)_additionalRestrictionsFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:;
- (id)_attributeTemplateForItem:(void *)a3 domain:(void *)a4 name:(void *)a5 errors:;
- (id)_attributeTemplateGroupsFromArray:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:;
- (id)_attributeTemplatesFromArray:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:;
- (id)_bundlePropertiesFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:;
- (id)_legalClassNames;
- (id)_legalPropertyNamesByClassName;
- (id)_restrictionFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:;
- (id)_templatesByDomainWithErrors:(void *)a1;
- (id)_templatesWithDomain:(void *)a3 fromDictionary:(void *)a4 errors:;
- (id)_templatesWithDomain:(void *)a3 fromFilename:(void *)a4 dirpath:(void *)a5 errors:;
- (id)_validatedAttributeTemplateFromAttributeTemplate:(void *)a3 domainAttributeTemplate:(void *)a4 dependenciesByFullyQualifiedName:(void *)a5 errors:;
- (id)templatesByDomain;
- (id)validDomains;
- (id)validationErrors;
- (uint64_t)_isPropertyLegalForClassName:(void *)a3 propertyName:(void *)a4 value:(uint64_t)a5 error:;
- (void)_configureTemplate:(void *)a3 fromInfo:(void *)a4 forDomain:(void *)a5 name:(char)a6 allowRestrictions:(void *)a7 errors:;
- (void)_isAttributeClassNameLegal:(void *)result;
- (void)_preAttributeTemplateFromAttributeTemplate:(void *)a3 domainAttributeTemplate:(void *)a4 generateDependenciesByFullyQualifiedName:;
- (void)_preDomainAttributeTemplateFromDomainAttributeTemplate:(void *)a3 generateDependenciesByFullyQualifiedName:;
- (void)_templatesWithDomain:(void *)a3 fromFilename:(void *)a4 errors:;
- (void)_validatedTemplatesByDomainWithErrors:(void *)a1;
@end

@implementation RBDomainAttributeManagerDataProvider

- (RBDomainAttributeManagerDataProvider)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBDomainAttributeManagerDataProvider;
  v5 = [(RBDomainAttributeManagerDataProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    path = v5->_path;
    v5->_path = (NSString *)v6;
  }
  return v5;
}

- (RBDomainAttributeManagerDataProvider)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBDomainAttributeManagerDataProvider;
  uint64_t v6 = [(RBDomainAttributeManagerDataProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawTemplates, a3);
  }

  return v7;
}

- (id)validationErrors
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = -[RBDomainAttributeManagerDataProvider _validatedTemplatesByDomainWithErrors:](self, v3);
  return v3;
}

- (void)_validatedTemplatesByDomainWithErrors:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:](a1, v3);
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke;
    v16[3] = &unk_2647C8EA0;
    v16[4] = a1;
    id v7 = v6;
    id v17 = v7;
    [v4 enumerateKeysAndObjectsUsingBlock:v16];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_3;
    v12[3] = &unk_2647C8EF0;
    v12[4] = a1;
    id v13 = v7;
    id v14 = v3;
    id v8 = v5;
    id v15 = v8;
    id v9 = v7;
    [v4 enumerateKeysAndObjectsUsingBlock:v12];
    v10 = v15;
    a1 = v8;
  }
  return a1;
}

- (id)validDomains
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:](self, v3);
  id v5 = [v4 allKeys];

  return v5;
}

- (id)_templatesByDomainWithErrors:(void *)a1
{
  v113[1] = *MEMORY[0x263EF8340];
  id v85 = a2;
  if (a1)
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    id v4 = v3;
    if (!a1[1])
    {
      v12 = (void *)a1[2];
      v86[0] = MEMORY[0x263EF8330];
      v86[1] = 3221225472;
      v86[2] = __69__RBDomainAttributeManagerDataProvider__templatesByDomainWithErrors___block_invoke;
      v86[3] = &unk_2647C8F18;
      id v87 = v3;
      v88 = a1;
      id v89 = v85;
      [v12 enumerateKeysAndObjectsUsingBlock:v86];

      v11 = v87;
LABEL_52:

      goto LABEL_53;
    }
    id v5 = rbs_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[1];
      *(_DWORD *)buf = 138543362;
      uint64_t v102 = v6;
      _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, "Loading Domain Attributes from: %{public}@", buf, 0xCu);
    }

    id v7 = [(id)a1[1] stringByDeletingLastPathComponent];
    uint64_t v8 = [v7 stringByAppendingPathComponent:@"domains.plist"];

    [NSDictionary dictionaryWithContentsOfFile:v8];
    uint64_t v79 = v83 = v4;
    v80 = (void *)v8;
    if (v79)
    {
      id v9 = RBSArrayForKey();
      if (v9)
      {
        uint64_t v10 = [MEMORY[0x263EFFA08] setWithArray:v9];
        if (v10)
        {
          v11 = (void *)v10;
LABEL_21:

          v40 = [MEMORY[0x263F08850] defaultManager];
          uint64_t v41 = a1[1];
          id v99 = 0;
          v42 = [v40 contentsOfDirectoryAtPath:v41 error:&v99];
          id v78 = v99;

          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v43 = v42;
          uint64_t v44 = [v43 countByEnumeratingWithState:&v95 objects:v107 count:16];
          v84 = a1;
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v46 = *(void *)v96;
            uint64_t v82 = *MEMORY[0x263F08338];
            do
            {
              for (uint64_t i = 0; i != v45; ++i)
              {
                if (*(void *)v96 != v46) {
                  objc_enumerationMutation(v43);
                }
                v48 = *(void **)(*((void *)&v95 + 1) + 8 * i);
                v49 = [v48 stringByDeletingPathExtension];
                if ([v11 containsObject:v48])
                {
                  v50 = -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromFilename:errors:]((void **)a1, v49, v48, v85);
                  [v83 setObject:v50 forKeyedSubscript:v49];
                }
                else
                {
                  id v51 = v43;
                  v52 = v11;
                  v53 = rbs_general_log();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    uint64_t v102 = (uint64_t)v48;
                    _os_log_fault_impl(&dword_226AB3000, v53, OS_LOG_TYPE_FAULT, "Unknown RunningBoard domain file found: %{public}@", buf, 0xCu);
                  }

                  v54 = (void *)MEMORY[0x263F087E8];
                  uint64_t v105 = v82;
                  v55 = [NSString stringWithFormat:@"Domain %@ not allowed", v49];
                  v106 = v55;
                  v56 = [NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
                  v50 = [v54 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:4 userInfo:v56];

                  [v85 addObject:v50];
                  a1 = v84;
                  v11 = v52;
                  id v43 = v51;
                }
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v95 objects:v107 count:16];
            }
            while (v45);
          }

          if (os_variant_has_internal_content())
          {
            v81 = v11;
            v57 = [(id)a1[1] stringByReplacingOccurrencesOfString:@"System/Library/LifecyclePolicy" withString:@"AppleInternal/LifecyclePolicy"];
            v58 = [MEMORY[0x263F08850] defaultManager];
            id v94 = v78;
            v59 = [v58 contentsOfDirectoryAtPath:v57 error:&v94];
            id v77 = v94;

            v60 = rbs_general_log();
            id v4 = v83;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v61 = [v59 count];
              *(_DWORD *)buf = 134218242;
              uint64_t v102 = v61;
              __int16 v103 = 2114;
              v104 = v57;
              _os_log_impl(&dword_226AB3000, v60, OS_LOG_TYPE_DEFAULT, "Loading %lu Internal Domains from %{public}@", buf, 0x16u);
            }

            long long v92 = 0u;
            long long v93 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            id v43 = v59;
            uint64_t v62 = [v43 countByEnumeratingWithState:&v90 objects:v100 count:16];
            if (v62)
            {
              uint64_t v63 = v62;
              uint64_t v64 = *(void *)v91;
              do
              {
                for (uint64_t j = 0; j != v63; ++j)
                {
                  if (*(void *)v91 != v64) {
                    objc_enumerationMutation(v43);
                  }
                  v66 = *(void **)(*((void *)&v90 + 1) + 8 * j);
                  v67 = [v66 stringByDeletingPathExtension];
                  v68 = [v83 objectForKeyedSubscript:v67];

                  v69 = rbs_general_log();
                  BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
                  if (v68)
                  {
                    if (!v70) {
                      goto LABEL_47;
                    }
                    *(_DWORD *)buf = 138543362;
                    uint64_t v102 = (uint64_t)v67;
                    v71 = v69;
                    v72 = "Replacing domain %{public}@ with internal version";
                  }
                  else
                  {
                    if (!v70) {
                      goto LABEL_47;
                    }
                    *(_DWORD *)buf = 138543362;
                    uint64_t v102 = (uint64_t)v67;
                    v71 = v69;
                    v72 = "Adding internal domain %{public}@";
                  }
                  _os_log_impl(&dword_226AB3000, v71, OS_LOG_TYPE_DEFAULT, v72, buf, 0xCu);
LABEL_47:

                  v73 = -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromFilename:dirpath:errors:](v84, v67, v66, v57, v85);
                  [v83 setObject:v73 forKeyedSubscript:v67];
                }
                uint64_t v63 = [v43 countByEnumeratingWithState:&v90 objects:v100 count:16];
              }
              while (v63);
            }

            v74 = v77;
            v75 = (void *)v79;
            v11 = v81;
          }
          else
          {
            id v4 = v83;
            v74 = v78;
            v75 = (void *)v79;
          }

          goto LABEL_52;
        }
        v30 = rbs_general_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
          -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:](v30, v31, v32, v33, v34, v35, v36, v37);
        }

        v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v112 = *MEMORY[0x263F08338];
        v26 = [NSString stringWithFormat:@"Could not create domain set from plist"];
        v113[0] = v26;
        v27 = NSDictionary;
        v28 = (void **)v113;
        v29 = &v112;
      }
      else
      {
        id v17 = rbs_general_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:](v17, v18, v19, v20, v21, v22, v23, v24);
        }

        v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v110 = *MEMORY[0x263F08338];
        v26 = [NSString stringWithFormat:@"Domains array missing"];
        v111 = v26;
        v27 = NSDictionary;
        v28 = &v111;
        v29 = &v110;
      }
      v38 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
      v39 = [v25 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v38];

      [v85 addObject:v39];
    }
    else
    {
      id v13 = rbs_general_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:]();
      }

      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v108 = *MEMORY[0x263F08338];
      id v15 = [NSString stringWithFormat:@"Domains plist failure: %@", v8];
      v109 = v15;
      v16 = [NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
      id v9 = [v14 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v16];

      [v85 addObject:v9];
    }
    v11 = 0;
    goto LABEL_21;
  }
  id v4 = 0;
LABEL_53:

  return v4;
}

- (id)templatesByDomain
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = -[RBDomainAttributeManagerDataProvider _validatedTemplatesByDomainWithErrors:](self, v3);

  return v4;
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_2;
  v5[3] = &unk_2647C8E78;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
}

- (void)_preDomainAttributeTemplateFromDomainAttributeTemplate:(void *)a3 generateDependenciesByFullyQualifiedName:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [v5 attributeGroups];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke;
    v8[3] = &unk_2647C8FB8;
    v8[4] = a1;
    id v9 = v5;
    id v10 = v6;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 dictionary];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_4;
  id v14 = &unk_2647C8EC8;
  id v9 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v18 = v8;
  id v10 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:&v11];

  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v10, v7, v11, v12, v13, v14, v15);
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = -[RBDomainAttributeManagerDataProvider _validatedDomainAttributeTemplateFromDomainAttributeTemplate:dependenciesByFullyQualifiedName:errors:](*(void *)(a1 + 32), a3, *(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v5) {
    [*(id *)(a1 + 56) setObject:v5 forKeyedSubscript:v6];
  }
}

- (RBDomainAttributeTemplate)_validatedDomainAttributeTemplateFromDomainAttributeTemplate:(void *)a3 dependenciesByFullyQualifiedName:(void *)a4 errors:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = objc_alloc_init(RBDomainAttributeTemplate);
    -[RBDomainAttributeTemplate name]((uint64_t)v7);
    uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setName:](v10, v11);

    -[RBDomainAttributeTemplate domain]((uint64_t)v7);
    uint64_t v12 = (char *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setDomain:](v10, v12);

    id v13 = [v7 originatorEntitlements];
    [(RBDomainAttributeTemplate *)v10 setOriginatorEntitlements:v13];

    -[RBDomainAttributeTemplate endowmentNamespace]((uint64_t)v7);
    id v14 = (char *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setEndowmentNamespace:](v10, v14);

    uint64_t v15 = [v7 targetBundleProperties];
    [(RBDomainAttributeTemplate *)v10 setTargetBundleProperties:v15];

    id v16 = [v7 targetEntitlements];
    [(RBDomainAttributeTemplate *)v10 setTargetEntitlements:v16];

    id v17 = [v7 additionalRestrictions];
    [(RBDomainAttributeTemplate *)v10 setAdditionalRestrictions:v17];

    id v18 = [v7 restriction];
    [(RBDomainAttributeTemplate *)v10 setRestriction:v18];

    uint64_t v19 = [MEMORY[0x263EFF980] array];
    uint64_t v20 = [v7 attributeGroups];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke;
    v23[3] = &unk_2647C9008;
    v23[4] = a1;
    id v24 = v7;
    id v25 = v8;
    id v26 = v9;
    id v27 = v19;
    id v21 = v19;
    [v20 enumerateObjectsUsingBlock:v23];

    [(RBDomainAttributeTemplate *)v10 setAttributeGroups:v21];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_templatesWithDomain:(void *)a3 fromFilename:(void *)a4 errors:
{
  if (a1)
  {
    -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromFilename:dirpath:errors:](a1, a2, a3, a1[1], a4);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = vars8;
  }
  return a1;
}

- (id)_templatesWithDomain:(void *)a3 fromFilename:(void *)a4 dirpath:(void *)a5 errors:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = [a4 stringByAppendingPathComponent:v10];
    id v13 = [NSDictionary dictionaryWithContentsOfFile:v12];
    id v14 = [MEMORY[0x263EFF9A0] dictionary];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke;
    v18[3] = &unk_2647C8F68;
    v18[4] = a1;
    id v19 = v9;
    id v20 = v11;
    id v15 = v14;
    id v21 = v15;
    id v22 = v10;
    [v13 enumerateKeysAndObjectsUsingBlock:v18];
    id v16 = v22;
    a1 = v15;
  }
  return a1;
}

void __69__RBDomainAttributeManagerDataProvider__templatesByDomainWithErrors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v7 = a2;
  -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromDictionary:errors:](v5, v7, a3, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

- (id)_templatesWithDomain:(void *)a3 fromDictionary:(void *)a4 errors:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id v9 = (void *)MEMORY[0x263EFF9A0];
    id v10 = a3;
    id v11 = [v9 dictionary];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke;
    v15[3] = &unk_2647C87D8;
    v15[4] = a1;
    id v16 = v7;
    id v17 = v8;
    id v12 = v11;
    id v18 = v12;
    [v10 enumerateKeysAndObjectsUsingBlock:v15];

    id v13 = v18;
    a1 = v12;
  }
  return a1;
}

- (id)_attributeTemplateForItem:(void *)a3 domain:(void *)a4 name:(void *)a5 errors:
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v45 = a3;
  id v44 = a4;
  id v46 = a5;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 objectForKeyedSubscript:@"Class"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (-[RBDomainAttributeManagerDataProvider _isAttributeClassNameLegal:](a1, v10))
        {
          id v43 = v10;
          v42 = [MEMORY[0x263EFF9A0] dictionary];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v41 = v9;
          id v11 = v9;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
          if (!v12) {
            goto LABEL_21;
          }
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v49;
          uint64_t v15 = *MEMORY[0x263F08338];
          while (1)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v49 != v14) {
                objc_enumerationMutation(v11);
              }
              id v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v22 = rbs_assertion_log();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  id v62 = v45;
                  __int16 v63 = 2114;
                  id v64 = v44;
                  __int16 v65 = 2114;
                  id v66 = v17;
                  _os_log_error_impl(&dword_226AB3000, v22, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains subattribute property of wrong type: %{public}@", buf, 0x20u);
                }

                uint64_t v23 = (void *)MEMORY[0x263F087E8];
                uint64_t v52 = v15;
                id v24 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains subattribute template of wrong type: %@", v45, v44, v11];
                v53 = v24;
                id v25 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
                id v20 = [v23 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v25];

LABEL_17:
                [v46 addObject:v20];
                goto LABEL_18;
              }
              if ([v17 isEqualToString:@"Class"]) {
                continue;
              }
              id v18 = [v11 objectForKeyedSubscript:v17];
              id v47 = 0;
              char v19 = -[RBDomainAttributeManagerDataProvider _isPropertyLegalForClassName:propertyName:value:error:](a1, v43, v17, v18, (uint64_t)&v47);
              id v20 = v47;

              if ((v19 & 1) == 0) {
                goto LABEL_17;
              }
              id v21 = [v11 objectForKeyedSubscript:v17];
              [v42 setObject:v21 forKeyedSubscript:v17];

LABEL_18:
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
            if (!v13)
            {
LABEL_21:

              id v26 = v42;
              id v10 = v43;
              id v27 = +[RBAttributeFactory attributeForClass:v43 andProperties:v42 errors:v46];
              id v9 = v41;
              goto LABEL_32;
            }
          }
        }
        v38 = rbs_assertion_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v62 = v45;
          __int16 v63 = 2114;
          id v64 = v44;
          __int16 v65 = 2114;
          id v66 = v10;
          _os_log_error_impl(&dword_226AB3000, v38, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains subattribute property with an unsupported class name: %{public}@", buf, 0x20u);
        }

        uint64_t v33 = (void *)MEMORY[0x263F087E8];
        uint64_t v55 = *MEMORY[0x263F08338];
        uint64_t v34 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains subattribute property with an unsupported class name: %@", v45, v44, v10];
        v56 = v34;
        uint64_t v35 = NSDictionary;
        uint64_t v36 = &v56;
        uint64_t v37 = &v55;
      }
      else
      {
        uint64_t v32 = rbs_assertion_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v62 = v45;
          __int16 v63 = 2114;
          id v64 = v44;
          __int16 v65 = 2114;
          id v66 = v10;
          _os_log_error_impl(&dword_226AB3000, v32, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains subattribute with class name of wrong type: %{public}@", buf, 0x20u);
        }

        uint64_t v33 = (void *)MEMORY[0x263F087E8];
        uint64_t v57 = *MEMORY[0x263F08338];
        uint64_t v34 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains subattribute with class name of wrong type: %@", v45, v44, v10];
        v58 = v34;
        uint64_t v35 = NSDictionary;
        uint64_t v36 = &v58;
        uint64_t v37 = &v57;
      }
      v39 = [v35 dictionaryWithObjects:v36 forKeys:v37 count:1];
      id v26 = [v33 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v39];

      [v46 addObject:v26];
      id v27 = 0;
LABEL_32:
    }
    else
    {
      v28 = rbs_general_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v62 = v45;
        __int16 v63 = 2114;
        id v64 = v44;
        __int16 v65 = 2114;
        id v66 = v9;
        _os_log_error_impl(&dword_226AB3000, v28, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains subattribute template of wrong type: %{public}@", buf, 0x20u);
      }

      v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v59 = *MEMORY[0x263F08338];
      v30 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains subattribute template of wrong type: %@", v45, v44, v9];
      v60 = v30;
      uint64_t v31 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      id v10 = [v29 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v31];

      [v46 addObject:v10];
      id v27 = 0;
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (void)_isAttributeClassNameLegal:(void *)result
{
  if (result)
  {
    v2 = result;
    id v3 = a2;
    uint64_t v4 = -[RBDomainAttributeManagerDataProvider _legalClassNames](v2);
    uint64_t v5 = [v4 containsObject:v3];

    return (void *)v5;
  }
  return result;
}

- (uint64_t)_isPropertyLegalForClassName:(void *)a3 propertyName:(void *)a4 value:(uint64_t)a5 error:
{
  v37[1] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (!a1)
  {
    a5 = 0;
    goto LABEL_13;
  }
  uint64_t v12 = -[RBDomainAttributeManagerDataProvider _legalPropertyNamesByClassName](a1);
  uint64_t v13 = [v12 objectForKeyedSubscript:v9];
  uint64_t v14 = [v13 objectForKeyedSubscript:v10];
  uint64_t v15 = v14;
  if (!v14)
  {
    char v19 = rbs_assertion_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[RBDomainAttributeManagerDataProvider _isPropertyLegalForClassName:propertyName:value:error:]();
    }

    if (!a5) {
      goto LABEL_12;
    }
    id v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08338];
    id v21 = [NSString stringWithFormat:@"Unknown property %@ of attribute class %@", v10, v9];
    v37[0] = v21;
    id v22 = NSDictionary;
    uint64_t v23 = (void **)v37;
    id v24 = &v36;
LABEL_11:
    id v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    *(void *)a5 = [v20 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v25];

    a5 = 0;
    goto LABEL_12;
  }
  if (([v14 containsObject:v11] & 1) == 0 && objc_msgSend(v15, "count") != 1)
  {
    id v16 = [v15 firstObject];
    id v17 = [MEMORY[0x263EFF9D0] null];
    char v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {
      id v27 = rbs_assertion_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v31 = v11;
        __int16 v32 = 2114;
        id v33 = v10;
        __int16 v34 = 2114;
        id v35 = v9;
        _os_log_error_impl(&dword_226AB3000, v27, OS_LOG_TYPE_ERROR, "Unknown value %{public}@ for property %{public}@ of attribute class %{public}@", buf, 0x20u);
      }

      if (!a5) {
        goto LABEL_12;
      }
      id v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08338];
      id v21 = [NSString stringWithFormat:@"Unknown value %@ for property %@ of attribute class %@", v11, v10, v9];
      v29 = v21;
      id v22 = NSDictionary;
      uint64_t v23 = &v29;
      id v24 = &v28;
      goto LABEL_11;
    }
  }
  a5 = 1;
LABEL_12:

LABEL_13:
  return a5;
}

- (id)_attributeTemplatesFromArray:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  v49[1] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    uint64_t v13 = [MEMORY[0x263EFF980] array];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v32 = v9;
        id v14 = v9;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v14);
              }
              char v19 = -[RBDomainAttributeManagerDataProvider _attributeTemplateForItem:domain:name:errors:](a1, *(void **)(*((void *)&v33 + 1) + 8 * i), v10, v11, v12);
              if (v19) {
                [v13 addObject:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
          }
          while (v16);
        }

        if ([v13 count])
        {
          id v9 = v32;
          goto LABEL_23;
        }
        v30 = rbs_general_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[RBDomainAttributeManagerDataProvider _attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:]();
        }

        id v31 = (void *)MEMORY[0x263F087E8];
        uint64_t v37 = *MEMORY[0x263F08338];
        id v22 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains no subattributes", v10, v11];
        v38 = v22;
        uint64_t v23 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        uint64_t v28 = [v31 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v23];
        id v9 = v32;
        goto LABEL_22;
      }
      id v26 = rbs_general_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v43 = v10;
        __int16 v44 = 2114;
        id v45 = v11;
        __int16 v46 = 2114;
        id v47 = v9;
        _os_log_error_impl(&dword_226AB3000, v26, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains subattributes data of wrong type: %{public}@", buf, 0x20u);
      }

      id v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F08338];
      id v22 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains subattributes data of wrong type: %@", v10, v11, v9];
      id v41 = v22;
      uint64_t v23 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id v24 = v27;
      uint64_t v25 = 2;
    }
    else
    {
      id v20 = rbs_general_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[RBDomainAttributeManagerDataProvider _attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:]();
      }

      id v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v48 = *MEMORY[0x263F08338];
      id v22 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains no subattributes", v10, v11];
      v49[0] = v22;
      uint64_t v23 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
      id v24 = v21;
      uint64_t v25 = 1;
    }
    uint64_t v28 = [v24 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:v25 userInfo:v23];
LABEL_22:

    [v12 addObject:v28];
    goto LABEL_23;
  }
  uint64_t v13 = 0;
LABEL_23:

  return v13;
}

- (void)_configureTemplate:(void *)a3 fromInfo:(void *)a4 forDomain:(void *)a5 name:(char)a6 allowRestrictions:(void *)a7 errors:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (a1)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __108__RBDomainAttributeManagerDataProvider__configureTemplate_fromInfo_forDomain_name_allowRestrictions_errors___block_invoke;
    v18[3] = &unk_2647C8F40;
    id v19 = v15;
    id v20 = v14;
    char v25 = a6;
    id v21 = v17;
    uint64_t v22 = a1;
    id v23 = v16;
    id v24 = v13;
    [v20 enumerateKeysAndObjectsUsingBlock:v18];
  }
}

void __108__RBDomainAttributeManagerDataProvider__configureTemplate_fromInfo_forDomain_name_allowRestrictions_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08338];
    id v9 = [NSString stringWithFormat:@"RB Domain template %@ malformed: %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    v30[0] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    id v11 = v8;
    uint64_t v12 = 2;
    goto LABEL_8;
  }
  if (([v5 isEqualToString:@"Attributes"] & 1) == 0
    && ([v5 isEqualToString:@"AttributeGroups"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"Restriction"])
    {
      if (*(unsigned char *)(a1 + 80))
      {
LABEL_6:
        id v7 = -[RBDomainAttributeManagerDataProvider _restrictionFromDictionary:forDomainAttributeWithDomain:name:errors:](*(void *)(a1 + 56), v6, *(void **)(a1 + 32), *(void **)(a1 + 64), *(void **)(a1 + 48));
        [*(id *)(a1 + 72) setRestriction:v7];
LABEL_9:

        goto LABEL_10;
      }
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08338];
      id v9 = [NSString stringWithFormat:@"RB Domain template %@ contains unexpected restriction with key : %@", *(void *)(a1 + 32), v5];
      uint64_t v28 = v9;
      id v14 = NSDictionary;
      id v15 = &v28;
      id v16 = &v27;
    }
    else
    {
      if ([v5 isEqualToString:@"RequiredTargetBundleProperties"])
      {
        id v7 = -[RBDomainAttributeManagerDataProvider _bundlePropertiesFromDictionary:forDomainAttributeWithDomain:name:errors:](*(void *)(a1 + 56), v6, *(void **)(a1 + 32), *(void **)(a1 + 64), *(void **)(a1 + 48));
        [*(id *)(a1 + 72) setTargetBundleProperties:v7];
        goto LABEL_9;
      }
      if ([v5 isEqualToString:@"Selector"])
      {
        if (!*(unsigned char *)(a1 + 80)) {
          goto LABEL_6;
        }
        id v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v25 = *MEMORY[0x263F08338];
        id v9 = [NSString stringWithFormat:@"RB Domain template %@ contains unexpected selector", *(void *)(a1 + 32)];
        id v26 = v9;
        id v14 = NSDictionary;
        id v15 = &v26;
        id v16 = &v25;
      }
      else if ([v5 isEqualToString:@"RequiredOriginatorEntitlements"])
      {
        if (*(unsigned char *)(a1 + 80))
        {
          id v7 = +[RBEntitlementPredicate predicateForObject:v6 forDomain:*(void *)(a1 + 32) attribute:*(void *)(a1 + 64) errors:*(void *)(a1 + 48)];
          [*(id *)(a1 + 72) setOriginatorEntitlements:v7];
          goto LABEL_9;
        }
        id v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v23 = *MEMORY[0x263F08338];
        id v9 = [NSString stringWithFormat:@"RB Domain template %@ contains unexpected restriction with key : %@", *(void *)(a1 + 32), v5];
        id v24 = v9;
        id v14 = NSDictionary;
        id v15 = &v24;
        id v16 = &v23;
      }
      else if ([v5 isEqualToString:@"RequiredTargetEntitlements"])
      {
        if (*(unsigned char *)(a1 + 80))
        {
          id v7 = +[RBEntitlementPredicate predicateForObject:v6 forDomain:*(void *)(a1 + 32) attribute:*(void *)(a1 + 64) errors:*(void *)(a1 + 48)];
          [*(id *)(a1 + 72) setTargetEntitlements:v7];
          goto LABEL_9;
        }
        id v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v21 = *MEMORY[0x263F08338];
        id v9 = [NSString stringWithFormat:@"RB Domain template %@ contains unexpected restriction with key : %@", *(void *)(a1 + 32), v5];
        uint64_t v22 = v9;
        id v14 = NSDictionary;
        id v15 = &v22;
        id v16 = &v21;
      }
      else if ([v5 isEqualToString:@"AdditionalRestrictions"])
      {
        if (*(unsigned char *)(a1 + 80))
        {
          id v7 = -[RBDomainAttributeManagerDataProvider _additionalRestrictionsFromDictionary:forDomainAttributeWithDomain:name:errors:](*(void *)(a1 + 56), v6, *(void **)(a1 + 32), *(void **)(a1 + 64), *(void **)(a1 + 48));
          [*(id *)(a1 + 72) setAdditionalRestrictions:v7];
          goto LABEL_9;
        }
        id v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v19 = *MEMORY[0x263F08338];
        id v9 = [NSString stringWithFormat:@"RB Domain template %@ contains unexpected restriction with key : %@", *(void *)(a1 + 32), v5];
        id v20 = v9;
        id v14 = NSDictionary;
        id v15 = &v20;
        id v16 = &v19;
      }
      else
      {
        if ([v5 isEqualToString:@"EndowmentNamespace"]) {
          goto LABEL_10;
        }
        id v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v17 = *MEMORY[0x263F08338];
        id v9 = [NSString stringWithFormat:@"RB Domain template %@ contains unrecognized key: %@", *(void *)(a1 + 32), v5];
        char v18 = v9;
        id v14 = NSDictionary;
        id v15 = &v18;
        id v16 = &v17;
      }
    }
    id v10 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    id v11 = v13;
    uint64_t v12 = 4;
LABEL_8:
    id v7 = [v11 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:v12 userInfo:v10];

    [*(id *)(a1 + 48) addObject:v7];
    goto LABEL_9;
  }
LABEL_10:
}

- (id)_restrictionFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = 0;
  if (a1 && v9)
  {
    id v17 = 0;
    id v13 = +[RBDomainRestriction domainRestrictionForDictionary:v9 withError:&v17];
    id v14 = v17;
    if (v14)
    {
      id v15 = rbs_general_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v19 = v10;
        __int16 v20 = 2114;
        id v21 = v11;
        __int16 v22 = 2114;
        id v23 = v14;
        _os_log_error_impl(&dword_226AB3000, v15, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains restriction that failed to resolve with error: %{public}@", buf, 0x20u);
      }

      [v12 addObject:v14];
    }
  }
  return v13;
}

- (id)_bundlePropertiesFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    id v13 = [MEMORY[0x263EFF9A0] dictionary];
    if (!v9) {
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke;
      v20[3] = &unk_2647C87D8;
      id v21 = v10;
      id v22 = v11;
      id v23 = v12;
      id v24 = v13;
      [v9 enumerateKeysAndObjectsUsingBlock:v20];

      id v14 = v21;
LABEL_9:

      goto LABEL_10;
    }
    id v15 = rbs_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v28 = v10;
      __int16 v29 = 2114;
      id v30 = v11;
      __int16 v31 = 2114;
      id v32 = v9;
      _os_log_error_impl(&dword_226AB3000, v15, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains bundle properties of wrong type: %{public}@", buf, 0x20u);
    }

    if (v12)
    {
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F08338];
      id v17 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains bundle property of wrong type: %@", v10, v11, v9];
      id v26 = v17;
      char v18 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v14 = [v16 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v18];

      [v12 addObject:v14];
      goto LABEL_9;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_10:

  return v13;
}

- (id)_additionalRestrictionsFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    id v13 = [MEMORY[0x263EFF9A0] dictionary];
    if (!v9) {
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke;
      v20[3] = &unk_2647C87D8;
      id v21 = v10;
      id v22 = v11;
      id v23 = v12;
      id v24 = v13;
      [v9 enumerateKeysAndObjectsUsingBlock:v20];

      id v14 = v21;
LABEL_9:

      goto LABEL_10;
    }
    id v15 = rbs_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v28 = v10;
      __int16 v29 = 2114;
      id v30 = v11;
      __int16 v31 = 2114;
      id v32 = v9;
      _os_log_error_impl(&dword_226AB3000, v15, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains additionalRestrictions of wrong type: %{public}@", buf, 0x20u);
    }

    if (v12)
    {
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F08338];
      id v17 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains additionalRestrictions of wrong type: %@", v10, v11, v9];
      id v26 = v17;
      char v18 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v14 = [v16 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v18];

      [v12 addObject:v14];
      goto LABEL_9;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_10:

  return v13;
}

- (BOOL)_checkConflictingAttributes:(uint64_t)a3 error:
{
  if (result)
  {
    uint64_t v4 = [MEMORY[0x263EFFA08] setWithArray:a2];
    BOOL v5 = +[RBAssertionDescriptorValidator checkConflictingAttributes:v4 error:a3];

    return v5;
  }
  return result;
}

- (id)_attributeTemplateGroupsFromArray:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  v71[1] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  id v13 = v11;
  id v51 = a5;
  if (a1)
  {
    id v47 = [MEMORY[0x263EFF980] array];
    id v45 = v13;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v14 = v9;
        uint64_t v50 = [v14 countByEnumeratingWithState:&v53 objects:v61 count:16];
        if (v50)
        {
          id v44 = v9;
          uint64_t v48 = *MEMORY[0x263F08338];
          uint64_t v49 = *(void *)v54;
          id v46 = v14;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v54 != v49) {
                objc_enumerationMutation(v14);
              }
              id v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v17 = [v16 objectForKeyedSubscript:@"Attributes"];
                char v18 = -[RBDomainAttributeManagerDataProvider _attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:](v12, v17, v10, v13, v51);

                if (v18)
                {
                  id v52 = 0;
                  uint64_t v19 = (uint64_t)v12;
                  BOOL v20 = -[RBDomainAttributeManagerDataProvider _checkConflictingAttributes:error:]((BOOL)v12, (uint64_t)v18, (uint64_t)&v52);
                  id v21 = v52;
                  if (!v20)
                  {
                    id v22 = rbs_general_log();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v65 = v10;
                      __int16 v66 = 2112;
                      id v67 = v21;
                      _os_log_error_impl(&dword_226AB3000, v22, OS_LOG_TYPE_ERROR, "Conflicting attributes found in Domain: %@ with error: %@", buf, 0x16u);
                    }

                    id v23 = (void *)MEMORY[0x263F087E8];
                    uint64_t v57 = v48;
                    [NSString stringWithFormat:@"Error in Domain %@: %@", v10, v21];
                    v25 = id v24 = v10;
                    v58 = v25;
                    id v26 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
                    uint64_t v27 = [v23 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:5 userInfo:v26];

                    id v10 = v24;
                    [v51 addObject:v27];

                    id v13 = v45;
                  }
                  id v28 = objc_alloc_init(RBAttributeTemplateGroup);
                  [(RBAttributeTemplateGroup *)v28 setAttributes:v18];
                  -[RBDomainAttributeManagerDataProvider _configureTemplate:fromInfo:forDomain:name:allowRestrictions:errors:](v19, v28, v16, v10, v13, 0, v51);
                  [v47 addObject:v28];

                  id v12 = (void *)v19;
                  id v14 = v46;
                }
              }
              else
              {
                __int16 v29 = rbs_general_log();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  id v65 = v10;
                  __int16 v66 = 2114;
                  id v67 = v13;
                  __int16 v68 = 2114;
                  id v69 = v16;
                  _os_log_error_impl(&dword_226AB3000, v29, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains attribute group of wrong type: %{public}@", buf, 0x20u);
                }

                id v30 = (void *)MEMORY[0x263F087E8];
                uint64_t v59 = v48;
                __int16 v31 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains attribute group of wrong type: %@", v10, v13, v16];
                v60 = v31;
                id v32 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
                char v18 = [v30 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v32];

                [v51 addObject:v18];
              }
            }
            uint64_t v50 = [v14 countByEnumeratingWithState:&v53 objects:v61 count:16];
          }
          while (v50);
          id v9 = v44;
        }
        goto LABEL_29;
      }
      uint64_t v40 = rbs_general_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v65 = v10;
        __int16 v66 = 2114;
        id v67 = v13;
        __int16 v68 = 2114;
        id v69 = v9;
        _os_log_error_impl(&dword_226AB3000, v40, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains attribute groups data of wrong type: %{public}@", buf, 0x20u);
      }

      id v41 = v13;
      v42 = (void *)MEMORY[0x263F087E8];
      uint64_t v62 = *MEMORY[0x263F08338];
      long long v36 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains attribute groups data of wrong type: %@", v10, v41, v9];
      __int16 v63 = v36;
      uint64_t v37 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      v38 = v42;
      uint64_t v39 = 2;
    }
    else
    {
      uint64_t v33 = rbs_general_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[RBDomainAttributeManagerDataProvider _attributeTemplateGroupsFromArray:forDomainAttributeWithDomain:name:errors:]();
      }

      id v34 = v13;
      long long v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v70 = *MEMORY[0x263F08338];
      long long v36 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains no subattributes", v10, v34];
      v71[0] = v36;
      uint64_t v37 = [NSDictionary dictionaryWithObjects:v71 forKeys:&v70 count:1];
      v38 = v35;
      uint64_t v39 = 1;
    }
    id v14 = [v38 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:v39 userInfo:v37];

    [v51 addObject:v14];
    id v13 = v45;
LABEL_29:

    goto LABEL_30;
  }
  id v47 = 0;
LABEL_30:

  return v47;
}

void __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 56) setObject:v6 forKeyedSubscript:v5];
  }
  else
  {
    id v7 = rbs_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      id v8 = (void *)MEMORY[0x263F087E8];
      id v9 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains bundle property name of wrong type: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v5, *MEMORY[0x263F08338]];
      v13[0] = v9;
      id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v11 = [v8 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v10];

      [*(id *)(a1 + 48) addObject:v11];
    }
  }
}

void __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 56) setObject:v6 forKeyedSubscript:v5];
      goto LABEL_13;
    }
    id v13 = rbs_general_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      id v8 = (void *)MEMORY[0x263F087E8];
      id v9 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains entitlement value of wrong type: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v6, *MEMORY[0x263F08338]];
      id v17 = v9;
      id v10 = NSDictionary;
      id v11 = &v17;
      uint64_t v12 = &v16;
      goto LABEL_12;
    }
  }
  else
  {
    id v7 = rbs_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_2();
    }

    if (*(void *)(a1 + 48))
    {
      id v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08338];
      id v9 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains entitlement name of wrong type: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v5];
      v19[0] = v9;
      id v10 = NSDictionary;
      id v11 = (void **)v19;
      uint64_t v12 = &v18;
LABEL_12:
      id v14 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
      id v15 = [v8 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v14];

      [*(id *)(a1 + 48) addObject:v15];
    }
  }
LABEL_13:
}

- (RBDomainAttributeTemplate)_templateWithDomain:(void *)a3 name:(void *)a4 dictionary:(void *)a5 errors:
{
  v45[1] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a1) {
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = objc_alloc_init(RBDomainAttributeTemplate);
      -[RBDomainAttributeTemplate setName:](v13, v10);
      -[RBDomainAttributeTemplate setDomain:](v13, v9);
      -[RBDomainAttributeManagerDataProvider _configureTemplate:fromInfo:forDomain:name:allowRestrictions:errors:]((uint64_t)a1, v13, v11, v9, v10, 1, v12);
      id v14 = RBSArrayForKey();
      id v15 = [v14 firstObject];

      if (v15)
      {
        uint64_t v16 = rbs_general_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:](v16, v17, v18, v19, v20, v21, v22, v23);
        }

        id v24 = (void *)MEMORY[0x263F087E8];
        uint64_t v40 = *MEMORY[0x263F08338];
        uint64_t v25 = [NSString stringWithFormat:@"Domain attribute specified with legacy array EndowmentNamespace"];
        id v41 = v25;
        id v26 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        uint64_t v27 = [v24 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v26];

        [v12 addObject:v27];
        id v28 = v15;
      }
      else
      {
        RBSStringForKey();
        id v28 = (char *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
LABEL_20:
          uint64_t v37 = [v11 objectForKeyedSubscript:@"AttributeGroups"];
          v38 = -[RBDomainAttributeManagerDataProvider _attributeTemplateGroupsFromArray:forDomainAttributeWithDomain:name:errors:](a1, v37, v9, v10, v12);

          if (v38)
          {
            [(RBDomainAttributeTemplate *)v13 setAttributeGroups:v38];
          }
          else
          {

            id v13 = 0;
          }

          goto LABEL_24;
        }
      }
      -[RBDomainAttributeTemplate setEndowmentNamespace:](v13, v28);

      goto LABEL_20;
    }
    long long v35 = rbs_general_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:]();
    }

    if (v12)
    {
      id v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v42 = *MEMORY[0x263F08338];
      __int16 v31 = [NSString stringWithFormat:@"Domain attribute templates for %@ is not a dictionary: %@", v10, v11];
      id v43 = v31;
      id v32 = NSDictionary;
      uint64_t v33 = &v43;
      id v34 = &v42;
      goto LABEL_16;
    }
LABEL_17:
    id v13 = 0;
    goto LABEL_25;
  }
  __int16 v29 = rbs_general_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:]();
  }

  if (!v12) {
    goto LABEL_17;
  }
  id v30 = (void *)MEMORY[0x263F087E8];
  uint64_t v44 = *MEMORY[0x263F08338];
  __int16 v31 = [NSString stringWithFormat:@"Domain %@ attribute name is not a string: %@", v9, v10];
  v45[0] = v31;
  id v32 = NSDictionary;
  uint64_t v33 = (void **)v45;
  id v34 = &v44;
LABEL_16:
  long long v36 = [v32 dictionaryWithObjects:v33 forKeys:v34 count:1];
  id v15 = [v30 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v36];

  [v12 addObject:v15];
  id v13 = 0;
LABEL_24:

LABEL_25:
  return v13;
}

void __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:](*(void **)(a1 + 32), *(void **)(a1 + 40), v5, a3, *(void **)(a1 + 48));
  id v7 = (void *)v6;
  if (v6)
  {
    id v8 = *(void **)(a1 + 56);
    id v9 = -[RBDomainAttributeTemplate name](v6);
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  else
  {
    id v9 = rbs_general_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke_cold_1();
    }
  }
}

void __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:](*(void **)(a1 + 32), *(void **)(a1 + 40), v5, a3, *(void **)(a1 + 48));
  id v7 = (void *)v6;
  if (v6)
  {
    id v8 = *(void **)(a1 + 56);
    id v9 = -[RBDomainAttributeTemplate name](v6);
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  else
  {
    id v10 = rbs_general_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke_cold_1();
    }
  }
}

void __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 attributes];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke_2;
  v5[3] = &unk_2647C8F90;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 enumerateObjectsUsingBlock:v5];
}

void __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)_preAttributeTemplateFromAttributeTemplate:(void *)a3 domainAttributeTemplate:(void *)a4 generateDependenciesByFullyQualifiedName:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id v9 = a3;
    id v10 = -[RBDomainAttributeTemplate domain]((uint64_t)v9);
    id v11 = -[RBDomainAttributeTemplate name]((uint64_t)v9);

    id v12 = [v10 stringByAppendingPathExtension:v11];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v7;
      id v14 = [v13 domain];
      id v15 = [v13 name];
      uint64_t v16 = [v14 stringByAppendingPathExtension:v15];
      if ([v16 isEqualToString:v12])
      {
        uint64_t v17 = rbs_assertion_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[RBDomainAttributeManagerDataProvider _preAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:generateDependenciesByFullyQualifiedName:]();
        }
      }
      else
      {
        uint64_t v17 = [v8 objectForKeyedSubscript:v12];
        if (!v17)
        {
          uint64_t v17 = [MEMORY[0x263EFF9C0] set];
          [v8 setObject:v17 forKeyedSubscript:v12];
        }
        [v17 addObject:v16];
      }
    }
  }
}

void __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(RBAttributeTemplateGroup);
  id v5 = [v3 originatorEntitlements];
  [(RBAttributeTemplateGroup *)v4 setOriginatorEntitlements:v5];

  id v6 = [v3 targetBundleProperties];
  [(RBAttributeTemplateGroup *)v4 setTargetBundleProperties:v6];

  id v7 = [v3 targetEntitlements];
  [(RBAttributeTemplateGroup *)v4 setTargetEntitlements:v7];

  id v8 = [v3 additionalRestrictions];
  [(RBAttributeTemplateGroup *)v4 setAdditionalRestrictions:v8];

  id v9 = [v3 restriction];
  [(RBAttributeTemplateGroup *)v4 setRestriction:v9];

  id v10 = [MEMORY[0x263EFF980] array];
  id v11 = [v3 attributes];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke_2;
  v14[3] = &unk_2647C8FE0;
  id v12 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v12;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = v10;
  id v13 = v10;
  [v11 enumerateObjectsUsingBlock:v14];

  [(RBAttributeTemplateGroup *)v4 setAttributes:v13];
  [*(id *)(a1 + 64) addObject:v4];
}

uint64_t __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke_2(void **a1, void *a2)
{
  uint64_t v3 = -[RBDomainAttributeManagerDataProvider _validatedAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:dependenciesByFullyQualifiedName:errors:](a1[4], a2, a1[5], a1[6], a1[7]);
  if (v3) {
    [a1[8] addObject:v3];
  }
  return MEMORY[0x270F9A758]();
}

- (id)_validatedAttributeTemplateFromAttributeTemplate:(void *)a3 domainAttributeTemplate:(void *)a4 dependenciesByFullyQualifiedName:(void *)a5 errors:
{
  v47[1] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    id v12 = a3;
    id v13 = -[RBDomainAttributeTemplate domain]((uint64_t)v12);
    id v14 = -[RBDomainAttributeTemplate name]((uint64_t)v12);

    id v15 = [v13 stringByAppendingPathExtension:v14];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    id v16 = v9;
    id v17 = [v16 domain];
    id v18 = [v16 name];
    uint64_t v19 = [v17 stringByAppendingPathExtension:v18];
    if ([v19 isEqualToString:v15])
    {
      uint64_t v20 = rbs_assertion_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[RBDomainAttributeManagerDataProvider _preAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:generateDependenciesByFullyQualifiedName:]();
      }

      if (!v11)
      {
        int v23 = 1;
        goto LABEL_17;
      }
      uint64_t v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08338];
      [NSString stringWithFormat:@"Domain attribute %@ attempts to include itself", v15];
      uint64_t v22 = v42 = v19;
      v47[0] = v22;
      int v23 = 1;
      [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
      uint64_t v40 = v18;
      id v24 = v16;
      id v25 = v11;
      id v26 = v10;
      v28 = uint64_t v27 = v17;
      __int16 v29 = [v21 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v28];

      id v17 = v27;
      id v10 = v26;
      id v11 = v25;
      id v16 = v24;
      id v18 = v40;

      uint64_t v19 = v42;
      [v11 addObject:v29];
    }
    else
    {
      __int16 v29 = [v10 objectForKeyedSubscript:v19];
      if ([v29 containsObject:v15])
      {
        id v43 = v19;
        id v30 = rbs_assertion_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[RBDomainAttributeManagerDataProvider _validatedAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:dependenciesByFullyQualifiedName:errors:]();
        }

        if (v11)
        {
          __int16 v31 = (void *)MEMORY[0x263F087E8];
          uint64_t v44 = *MEMORY[0x263F08338];
          id v41 = [NSString stringWithFormat:@"Detected cycle between domain attributes %@ and %@", v15, v43];
          id v45 = v41;
          [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          id v32 = v18;
          id v33 = v16;
          id v34 = v11;
          id v35 = v10;
          v37 = long long v36 = v17;
          v38 = [v31 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v37];

          id v17 = v36;
          id v10 = v35;
          id v11 = v34;
          id v16 = v33;
          id v18 = v32;

          [v11 addObject:v38];
          uint64_t v19 = v43;
          int v23 = 1;
        }
        else
        {
          int v23 = 1;
          uint64_t v19 = v43;
        }
      }
      else
      {
        int v23 = 0;
      }
    }

LABEL_17:
    if (v23)
    {
      a1 = 0;
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:
    a1 = (void *)[v9 copy];
    goto LABEL_20;
  }
LABEL_21:

  return a1;
}

- (id)_legalPropertyNamesByClassName
{
  if (a1)
  {
    if (_legalPropertyNamesByClassName_onceToken != -1) {
      dispatch_once(&_legalPropertyNamesByClassName_onceToken, &__block_literal_global_263);
    }
    a1 = (id)_legalPropertyNamesByClassName_legalPropertyNamesByClassName;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_legalClassNames
{
  if (a1)
  {
    if (_legalClassNames_onceToken != -1) {
      dispatch_once(&_legalClassNames_onceToken, &__block_literal_global_24);
    }
    a1 = (id)_legalClassNames_legalClassNames;
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t __56__RBDomainAttributeManagerDataProvider__legalClassNames__block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"RBSAcquisitionCompletionAttribute", @"RBSCPUAccessGrant", @"RBSSuspendableCPUGrant", @"RBSCarPlayModeGrant", @"RBSCoalitionLevelGrant", @"RBSCPUMaximumUsageLimitation", @"RBSCPUMinimumUsageGrant", @"RBSDefineRelativeStartTimeGrant", @"RBSDomainAttribute", @"RBSDebugGrant", @"RBSDurationAttribute", @"RBSGPUAccessGrant", @"RBSJetsamPriorityGrant", @"RBSBaseMemoryGrant", @"RBSLaunchGrant", @"RBSPreserveBaseMemoryGrant", @"RBSPreventIdleSleepGrant",
    @"RBSPreventResourceUsageInvalidationAttribute",
    @"RBSResistTerminationGrant",
    @"RBSRunningReasonAttribute",
    @"RBSTagAttribute",
    @"RBSAppNapEnableGrant",
    @"RBSAppNapInactiveGrant",
    @"RBSAppNapPreventBackgroundSocketsGrant",
    @"RBSAppNapPreventDiskThrottleGrant",
    @"RBSAppNapPreventLowPriorityCPUGrant",
    @"RBSAppNapPreventSuppressedCPUGrant",
    @"RBSAppNapPreventTimerThrottleGrant",
    @"RBSMimicTaskSuspensionAttribute",
    @"RBSForceRoleManageAttribute",
    @"RBSEndowmentGrant",
    @"RBSSubordinateProcessAttribute",
    @"RBSSavedEndowmentGrant",
    @"RBSConditionAttribute",
    @"RBSInvalidateUnderConditionAttribute",
    @"RBSPersistentAttribute",
  _legalClassNames_legalClassNames = 0);
  return MEMORY[0x270F9A758]();
}

void __70__RBDomainAttributeManagerDataProvider__legalPropertyNamesByClassName__block_invoke()
{
  v90[19] = *MEMORY[0x263EF8340];
  v89[0] = @"RBSAcquisitionCompletionAttribute";
  v89[1] = @"RBSCoalitionLevelGrant";
  v90[0] = &unk_26DAB1570;
  v90[1] = &unk_26DAB1598;
  v89[2] = @"RBSCPUAccessGrant";
  v89[3] = @"RBSSuspendableCPUGrant";
  v90[2] = &unk_26DAB15C0;
  v90[3] = &unk_26DAB15E8;
  v89[4] = @"RBSCPUMaximumUsageLimitation";
  v87[0] = @"Duration";
  uint64_t v48 = [MEMORY[0x263EFF9D0] null];
  v86 = v48;
  id v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v86 count:1];
  v88[0] = v47;
  v87[1] = @"Percentage";
  uint64_t v46 = [MEMORY[0x263EFF9D0] null];
  id v85 = v46;
  id v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
  v88[1] = v45;
  v88[2] = &unk_26DAB1740;
  v87[2] = @"Role";
  v87[3] = @"ViolationPolicy";
  v88[3] = &unk_26DAB1758;
  uint64_t v44 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:4];
  v90[4] = v44;
  v89[5] = @"RBSCPUMinimumUsageGrant";
  v83[0] = @"Duration";
  id v43 = [MEMORY[0x263EFF9D0] null];
  uint64_t v82 = v43;
  uint64_t v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
  v84[0] = v42;
  v83[1] = @"Percentage";
  id v41 = [MEMORY[0x263EFF9D0] null];
  v81 = v41;
  uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v81 count:1];
  v83[2] = @"Role";
  v84[1] = v40;
  v84[2] = &unk_26DAB1770;
  uint64_t v39 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:3];
  v90[5] = v39;
  v89[6] = @"RBSDurationAttribute";
  v80[0] = &unk_26DAB1788;
  v79[0] = @"EndPolicy";
  v79[1] = @"WarningDuration";
  v38 = [MEMORY[0x263EFF9D0] null];
  id v78 = v38;
  uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
  v80[1] = v37;
  v79[2] = @"InvalidationDuration";
  long long v36 = [MEMORY[0x263EFF9D0] null];
  id v77 = v36;
  id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
  v79[3] = @"StartPolicy";
  v80[2] = v35;
  v80[3] = &unk_26DAB17A0;
  id v34 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:4];
  v90[6] = v34;
  v89[7] = @"RBSDomainAttribute";
  v75[0] = @"Domain";
  id v33 = [MEMORY[0x263EFF9D0] null];
  v74 = v33;
  id v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v74 count:1];
  v76[0] = v32;
  v75[1] = @"Name";
  __int16 v31 = [MEMORY[0x263EFF9D0] null];
  v73 = v31;
  id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
  v76[1] = v30;
  __int16 v29 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
  v90[7] = v29;
  v89[8] = @"RBSJetsamPriorityGrant";
  v71 = @"Band";
  id v28 = [MEMORY[0x263EFF9D0] null];
  uint64_t v70 = v28;
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
  v72 = v27;
  id v26 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  v90[8] = v26;
  v89[9] = @"RBSBaseMemoryGrant";
  v68[0] = @"Category";
  id v25 = [MEMORY[0x263EFF9D0] null];
  id v67 = v25;
  id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
  v68[1] = @"Strength";
  v69[0] = v24;
  v69[1] = &unk_26DAB17B8;
  int v23 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
  v90[9] = v23;
  v90[10] = &unk_26DAB1610;
  v89[10] = @"RBSResistTerminationGrant";
  v89[11] = @"RBSRunningReasonAttribute";
  id v65 = @"RunningReason";
  uint64_t v22 = [MEMORY[0x263EFF9D0] null];
  id v64 = v22;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
  __int16 v66 = v21;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  v90[11] = v20;
  v89[12] = @"RBSTagAttribute";
  uint64_t v62 = @"Tag";
  uint64_t v19 = [MEMORY[0x263EFF9D0] null];
  uint64_t v61 = v19;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
  __int16 v63 = v18;
  id v17 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  v90[12] = v17;
  v90[13] = &unk_26DAB1638;
  v89[13] = @"RBSAppNapPreventTimerThrottleGrant";
  v89[14] = @"RBSEndowmentGrant";
  v90[14] = &unk_26DAB1660;
  v89[15] = @"RBSSavedEndowmentGrant";
  v59[0] = @"Namespace";
  id v16 = [MEMORY[0x263EFF9D0] null];
  v58 = v16;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
  v59[1] = @"Key";
  v60[0] = v15;
  id v14 = [MEMORY[0x263EFF9D0] null];
  uint64_t v57 = v14;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
  v60[1] = v13;
  id v12 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
  v90[15] = v12;
  v90[16] = &unk_26DAB1688;
  v89[16] = @"RBSGPUAccessGrant";
  v89[17] = @"RBSConditionAttribute";
  v55[0] = @"Condition";
  id v11 = [MEMORY[0x263EFF9D0] null];
  long long v54 = v11;
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
  v55[1] = @"Value";
  v56[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF9D0] null];
  long long v53 = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
  v56[1] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  v90[17] = v3;
  v89[18] = @"RBSInvalidateUnderConditionAttribute";
  v51[0] = @"Condition";
  uint64_t v4 = [MEMORY[0x263EFF9D0] null];
  uint64_t v50 = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
  v51[1] = @"MinValue";
  v52[0] = v5;
  id v6 = [MEMORY[0x263EFF9D0] null];
  uint64_t v49 = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
  v52[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
  v90[18] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:19];
  id v10 = (void *)_legalPropertyNamesByClassName_legalPropertyNamesByClassName;
  _legalPropertyNamesByClassName_legalPropertyNamesByClassName = v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawTemplates, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_templatesByDomainWithErrors:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_226AB3000, v0, OS_LOG_TYPE_FAULT, "Domains plist failure: %{public}@", v1, 0xCu);
}

- (void)_templatesByDomainWithErrors:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_templatesByDomainWithErrors:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_isPropertyLegalForClassName:propertyName:value:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Unknown property %{public}@ of attribute class %{public}@");
}

- (void)_attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Domain %{public}@ attribute %@ contains no subattributes");
}

- (void)_attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Domain %{public}@ attribute %{public}@ contains no valid subattributes");
}

- (void)_attributeTemplateGroupsFromArray:forDomainAttributeWithDomain:name:errors:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Domain %{public}@ attribute %{public}@ contains no attribute groups");
}

void __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_6(&dword_226AB3000, v0, v1, "Domain %{public}@ attribute %{public}@ contains bundle property name of wrong type: %{public}@");
}

void __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_6(&dword_226AB3000, v0, v1, "Domain %{public}@ attribute %{public}@ contains dditional restriction value of wrong type: %{public}@");
}

void __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_6(&dword_226AB3000, v0, v1, "Domain %{public}@ attribute %{public}@ contains additional restriction of wrong type: %{public}@");
}

- (void)_templateWithDomain:(uint64_t)a3 name:(uint64_t)a4 dictionary:(uint64_t)a5 errors:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_templateWithDomain:name:dictionary:errors:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Domain attribute templates for %{public}@ is not a dictionary: %{public}@");
}

- (void)_templateWithDomain:name:dictionary:errors:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Domain %{public}@ attribute name is not a string: %{public}@");
}

void __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Error extracting domain attribute template with name %{public}@ from file %{public}@");
}

void __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Error extracting domain attribute template with name %{public}@", v2, v3, v4, v5, v6);
}

- (void)_preAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:generateDependenciesByFullyQualifiedName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Domain attribute %{public}@ attempts to include itself", v2, v3, v4, v5, v6);
}

- (void)_validatedAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:dependenciesByFullyQualifiedName:errors:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Detected cycle between domain attributes %{public}@ and %{public}@");
}

@end