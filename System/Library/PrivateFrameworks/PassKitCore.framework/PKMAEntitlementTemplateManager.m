@interface PKMAEntitlementTemplateManager
- (PKMAEntitlementTemplateManager)init;
- (id)_templatesFromAssetBundle:(id)a3;
- (id)cachedEntitlementTemplates;
- (void)entitlementTemplates:(id)a3;
@end

@implementation PKMAEntitlementTemplateManager

- (PKMAEntitlementTemplateManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKMAEntitlementTemplateManager;
  v2 = [(PKMAEntitlementTemplateManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[PKMobileAssetManager sharedInstance];
    mobileAssetManager = v2->_mobileAssetManager;
    v2->_mobileAssetManager = (PKMobileAssetManager *)v3;
  }
  return v2;
}

- (id)cachedEntitlementTemplates
{
  uint64_t v3 = [(PKMobileAssetManager *)self->_mobileAssetManager cachedDynamicAssetWithIdentifier:@"EntitlementTemplates.General" parameters:0];
  v4 = [(PKMAEntitlementTemplateManager *)self _templatesFromAssetBundle:v3];

  return v4;
}

- (void)entitlementTemplates:(id)a3
{
  id v4 = a3;
  mobileAssetManager = self->_mobileAssetManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PKMAEntitlementTemplateManager_entitlementTemplates___block_invoke;
  v7[3] = &unk_1E56DC070;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKMobileAssetManager *)mobileAssetManager dynamicAssetWithIdentifier:@"EntitlementTemplates.General" parameters:0 timeout:20 completion:v7];
}

void __55__PKMAEntitlementTemplateManager_entitlementTemplates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v9 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get entitlement templates: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v7);
    }
  }
  else if (*(void *)(a1 + 40))
  {
    id v8 = [*(id *)(a1 + 32) _templatesFromAssetBundle:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_templatesFromAssetBundle:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 URLsForResourcesWithExtension:@"json" subdirectory:0];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (!v8) {
      goto LABEL_33;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v48;
    unint64_t v11 = 0x1E4F1C000uLL;
    unint64_t v12 = 0x1E4F1C000uLL;
    uint64_t v34 = *(void *)v48;
    id v35 = v7;
    while (1)
    {
      uint64_t v13 = 0;
      uint64_t v36 = v9;
      do
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v40 = v13;
        v14 = (void *)[objc_alloc(*(Class *)(v11 + 2488)) initWithContentsOfURL:*(void *)(*((void *)&v47 + 1) + 8 * v13)];
        if (v14)
        {
          id v46 = 0;
          v39 = v14;
          v15 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v14 options:0 error:&v46];
          id v16 = v46;
          id v38 = v16;
          if (v15) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17)
          {
            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            v37 = v15;
            v18 = v15;
            uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v55 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v43;
              do
              {
                uint64_t v23 = 0;
                uint64_t v41 = v21;
                do
                {
                  if (*(void *)v43 != v22) {
                    objc_enumerationMutation(v18);
                  }
                  v24 = *(void **)(*((void *)&v42 + 1) + 8 * v23);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v25 = v18;
                    id v26 = v24;
                    v27 = [v26 PKStringForKey:@"entitlementTemplateType"];
                    v28 = [v6 objectForKeyedSubscript:v27];

                    if (v28)
                    {
                      PKLogFacilityTypeGetObject(0x21uLL);
                      v29 = (PKPassEntitlementTemplate *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(&v29->super, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v52 = v27;
                        __int16 v53 = 2112;
                        id v54 = v26;
                        _os_log_impl(&dword_190E10000, &v29->super, OS_LOG_TYPE_DEFAULT, "PKMAEntitlementTemplateManager: Warning: Template with type %@ already exists. Skipping: %@", buf, 0x16u);
                      }
                    }
                    else
                    {
                      v29 = [[PKPassEntitlementTemplate alloc] initWithDictionary:v26 bundle:v4];
                      [v26 objectForKeyedSubscript:@"entitlementTemplateType"];
                      unint64_t v30 = v12;
                      v32 = v31 = v4;
                      [v6 setValue:v29 forKey:v32];

                      id v4 = v31;
                      unint64_t v12 = v30;
                    }

                    v18 = v25;
                    uint64_t v21 = v41;
                  }
                  ++v23;
                }
                while (v21 != v23);
                uint64_t v21 = [v18 countByEnumeratingWithState:&v42 objects:v55 count:16];
              }
              while (v21);
              uint64_t v10 = v34;
              id v7 = v35;
              unint64_t v11 = 0x1E4F1C000;
            }
            uint64_t v9 = v36;
            v15 = v37;
          }
          else
          {
            v18 = PKLogFacilityTypeGetObject(0x21uLL);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v38;
              v52 = v38;
              _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "PKMAEntitlementTemplateManager: Failed to serialize template. %@", buf, 0xCu);
LABEL_30:

              v14 = v39;
              goto LABEL_31;
            }
          }
          v19 = v38;
          goto LABEL_30;
        }
LABEL_31:

        uint64_t v13 = v40 + 1;
      }
      while (v40 + 1 != v9);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (!v9)
      {
LABEL_33:

        goto LABEL_35;
      }
    }
  }
  id v6 = 0;
LABEL_35:

  return v6;
}

- (void).cxx_destruct
{
}

@end