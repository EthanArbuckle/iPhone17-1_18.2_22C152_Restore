@interface WFSystemIntentAppEnumerator
- (WFSystemIntentAppEnumerator)init;
- (id)supportedIdentifiersForIntentClassName:(id)a3 includingUserActivityBasedApps:(BOOL)a4;
- (void)dealloc;
- (void)enumerate;
@end

@implementation WFSystemIntentAppEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersByUserActivityType, 0);
  objc_storeStrong((id *)&self->_identifiersByIntentName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)supportedIdentifiersForIntentClassName:(id)a3 includingUserActivityBasedApps:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9508;
  v19 = __Block_byref_object_dispose__9509;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__WFSystemIntentAppEnumerator_supportedIdentifiersForIntentClassName_includingUserActivityBasedApps___block_invoke;
  v11[3] = &unk_1E654EBA8;
  BOOL v14 = a4;
  id v12 = v6;
  v13 = &v15;
  v11[4] = self;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __101__WFSystemIntentAppEnumerator_supportedIdentifiersForIntentClassName_includingUserActivityBasedApps___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[3] || !v2[4])
  {
    [v2 enumerate];
    v2 = *(void **)(a1 + 32);
  }
  if (*(unsigned char *)(a1 + 56)) {
    v3 = (void *)v2[4];
  }
  else {
    v3 = (void *)v2[3];
  }
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)enumerate
{
  v95[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v2 = (NSDictionary *)objc_opt_new();
  v3 = (NSDictionary *)objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F22448]);
  v48 = (void *)[v4 initWithIdentifier:*MEMORY[0x1E4F300E8] error:0];
  v95[0] = v48;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:1];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = [obj countByEnumeratingWithState:&v85 objects:v94 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v86;
    uint64_t v55 = *MEMORY[0x1E4F300B8];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v86 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = v5;
        uint64_t v6 = *(void *)(*((void *)&v85 + 1) + 8 * v5);
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v54 = [MEMORY[0x1E4F223A0] enumeratorWithExtensionPointRecord:v6 options:0];
        id v59 = (id)[v54 countByEnumeratingWithState:&v81 objects:v93 count:16];
        if (v59)
        {
          uint64_t v57 = *(void *)v82;
          do
          {
            for (i = 0; i != v59; i = (char *)i + 1)
            {
              if (*(void *)v82 != v57) {
                objc_enumerationMutation(v54);
              }
              id v8 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              id v9 = (void *)MEMORY[0x1C87CA430]();
              v10 = objc_msgSend(v8, "if_extensionAttributesDictionary");
              v11 = [v10 objectForKeyedSubscript:v55];

              if (v11)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  id v12 = v11;
                }
                else {
                  id v12 = 0;
                }
              }
              else
              {
                id v12 = 0;
              }
              id v13 = v12;

              if ([v13 count])
              {
                BOOL v14 = [v8 containingBundleRecord];
                if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if (!objc_msgSend(v14, "wf_isAvailableInContext:", 0))
                  {
LABEL_33:

                    goto LABEL_34;
                  }
                }
                else
                {

                  BOOL v14 = 0;
                }
                uint64_t v15 = [v14 bundleIdentifier];
                v16 = v15;
                v63 = v9;
                if (v15)
                {
                  id v17 = v15;
                }
                else
                {
                  id v17 = [v8 bundleIdentifier];
                }
                v18 = v17;

                long long v79 = 0u;
                long long v80 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                id v61 = v13;
                id v19 = v13;
                uint64_t v20 = [v19 countByEnumeratingWithState:&v77 objects:v92 count:16];
                if (v20)
                {
                  uint64_t v21 = v20;
                  uint64_t v22 = *(void *)v78;
                  do
                  {
                    for (uint64_t j = 0; j != v21; ++j)
                    {
                      if (*(void *)v78 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      v24 = *(void **)(*((void *)&v77 + 1) + 8 * j);
                      WFInsertIdentifierForKey(v2, v24, v18);
                      WFInsertIdentifierForKey(v3, v24, v18);
                    }
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v77 objects:v92 count:16];
                  }
                  while (v21);
                }

                id v13 = v61;
                id v9 = v63;
                goto LABEL_33;
              }
LABEL_34:
            }
            id v59 = (id)[v54 countByEnumeratingWithState:&v81 objects:v93 count:16];
          }
          while (v59);
        }

        uint64_t v5 = v53 + 1;
      }
      while (v53 + 1 != v52);
      uint64_t v52 = [obj countByEnumeratingWithState:&v85 objects:v94 count:16];
    }
    while (v52);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  WFInstalledAppsEnumerator();
  id v60 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v60 countByEnumeratingWithState:&v73 objects:v91 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v74;
    uint64_t v56 = *(void *)v74;
    do
    {
      uint64_t v28 = 0;
      uint64_t v58 = v26;
      do
      {
        if (*(void *)v74 != v27) {
          objc_enumerationMutation(v60);
        }
        v29 = *(void **)(*((void *)&v73 + 1) + 8 * v28);
        v30 = (void *)MEMORY[0x1C87CA430]();
        v31 = [v29 supportedIntents];
        v32 = objc_msgSend(v29, "if_userActivityTypes");
        if (([v31 count] || objc_msgSend(v32, "count"))
          && objc_msgSend(v29, "wf_isAvailableInContext:", 0))
        {
          v62 = v32;
          v64 = v30;
          v33 = [v29 bundleIdentifier];
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v34 = v31;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v69 objects:v90 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v70;
            do
            {
              for (uint64_t k = 0; k != v36; ++k)
              {
                if (*(void *)v70 != v37) {
                  objc_enumerationMutation(v34);
                }
                v39 = *(void **)(*((void *)&v69 + 1) + 8 * k);
                WFInsertIdentifierForKey(v2, v39, v33);
                WFInsertIdentifierForKey(v3, v39, v33);
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v69 objects:v90 count:16];
            }
            while (v36);
          }

          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          v32 = v62;
          id v40 = v62;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v65 objects:v89 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v66;
            do
            {
              for (uint64_t m = 0; m != v42; ++m)
              {
                if (*(void *)v66 != v43) {
                  objc_enumerationMutation(v40);
                }
                WFInsertIdentifierForKey(v3, *(void **)(*((void *)&v65 + 1) + 8 * m), v33);
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v65 objects:v89 count:16];
            }
            while (v42);
          }

          uint64_t v27 = v56;
          uint64_t v26 = v58;
          v30 = v64;
        }

        ++v28;
      }
      while (v28 != v26);
      uint64_t v26 = [v60 countByEnumeratingWithState:&v73 objects:v91 count:16];
    }
    while (v26);
  }

  identifiersByIntentName = self->_identifiersByIntentName;
  self->_identifiersByIntentName = v2;
  v46 = v2;

  identifiersByUserActivityType = self->_identifiersByUserActivityType;
  self->_identifiersByUserActivityType = v3;
}

- (void)dealloc
{
  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)WFSystemIntentAppEnumerator;
  [(WFSystemIntentAppEnumerator *)&v3 dealloc];
}

- (WFSystemIntentAppEnumerator)init
{
  v12.receiver = self;
  v12.super_class = (Class)WFSystemIntentAppEnumerator;
  v2 = [(WFSystemIntentAppEnumerator *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.shortcuts.WFSystemIntentAppEnumerator", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    uint64_t v5 = (const char *)[(id)*MEMORY[0x1E4F22318] UTF8String];
    uint64_t v6 = v2->_queue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35__WFSystemIntentAppEnumerator_init__block_invoke;
    v9[3] = &unk_1E6555A28;
    objc_copyWeak(&v10, &location);
    notify_register_dispatch(v5, &v2->_token, v6, v9);
    v7 = v2;
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __35__WFSystemIntentAppEnumerator_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[3];
  WeakRetained[3] = 0;

  v2 = (void *)WeakRetained[4];
  WeakRetained[4] = 0;
}

@end