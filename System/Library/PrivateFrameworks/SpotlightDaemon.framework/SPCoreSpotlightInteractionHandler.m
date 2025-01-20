@interface SPCoreSpotlightInteractionHandler
- (CNContactStore)contactStore;
- (id)attributeForIntent:(id)a3 direction:(int64_t)a4;
- (id)interestingContactIdentifiersFromIntent:(id)a3;
- (void)handleInteraction:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)setContactStore:(id)a3;
@end

@implementation SPCoreSpotlightInteractionHandler

- (id)interestingContactIdentifiersFromIntent:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setNumberStyle:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v5 = [v3 contacts];
LABEL_4:
    v6 = (void *)v5;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 recipients];
    goto LABEL_4;
  }
  v6 = 0;
LABEL_5:
  v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "contactIdentifier", (void)v15);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)handleInteraction:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v6 = a3;
  v7 = [v6 intent];
  id v8 = [(SPCoreSpotlightInteractionHandler *)self interestingContactIdentifiersFromIntent:v7];
  if (v8)
  {
    uint64_t v9 = -[SPCoreSpotlightInteractionHandler attributeForIntent:direction:](self, "attributeForIntent:direction:", v7, [v6 direction]);
    if (v9)
    {
      if (handleInteraction_bundleID_protectionClass__onceToken != -1) {
        dispatch_once(&handleInteraction_bundleID_protectionClass__onceToken, &__block_literal_global_2);
      }
      uint64_t v10 = handleInteraction_bundleID_protectionClass__helperQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __80__SPCoreSpotlightInteractionHandler_handleInteraction_bundleID_protectionClass___block_invoke_2;
      block[3] = &unk_2645064D0;
      id v12 = v6;
      id v13 = v9;
      id v14 = v8;
      dispatch_async(v10, block);
    }
  }
}

- (id)attributeForIntent:(id)a3 direction:(int64_t)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a4 == 2)
      {
        id v6 = (id *)MEMORY[0x263F02430];
        goto LABEL_14;
      }
      if (a4 == 1)
      {
        id v6 = (id *)MEMORY[0x263F025F0];
        goto LABEL_14;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = (id *)MEMORY[0x263F025D0];
        goto LABEL_14;
      }
    }
LABEL_11:
    id v7 = 0;
    goto LABEL_15;
  }
  if (a4 == 2)
  {
    id v6 = (id *)MEMORY[0x263F02400];
    goto LABEL_14;
  }
  if (a4 != 1) {
    goto LABEL_11;
  }
  id v6 = (id *)MEMORY[0x263F025C0];
LABEL_14:
  id v7 = *v6;
LABEL_15:

  return v7;
}

void __80__SPCoreSpotlightInteractionHandler_handleInteraction_bundleID_protectionClass___block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.corespotlight.interactionhelper", v0);
  v2 = (void *)handleInteraction_bundleID_protectionClass__helperQueue;
  handleInteraction_bundleID_protectionClass__helperQueue = (uint64_t)v1;
}

void __80__SPCoreSpotlightInteractionHandler_handleInteraction_bundleID_protectionClass___block_invoke_2(uint64_t a1)
{
  v25[2] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dateInterval];
  id v3 = [v2 startDate];

  v4 = (void *)SICopyRoundedDate();
  uint64_t v5 = *MEMORY[0x263F025D0];
  if ([*(id *)(a1 + 40) isEqualToString:*MEMORY[0x263F025D0]])
  {
    uint64_t v6 = *MEMORY[0x263F025E8];
    v25[0] = v5;
    v25[1] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }
  id v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v10;
    _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_INFO, "adding contacts interaction %@ identifiers %@", buf, 0x16u);
  }

  uint64_t v11 = +[SPCoreSpotlightIndexer sharedInstance];
  uint64_t v12 = *MEMORY[0x263F08098];
  id v13 = *(void **)(a1 + 48);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__SPCoreSpotlightInteractionHandler_handleInteraction_bundleID_protectionClass___block_invoke_9;
  v16[3] = &unk_2645064A8;
  id v17 = v13;
  id v18 = *(id *)(a1 + 40);
  id v19 = v3;
  id v20 = v4;
  id v14 = v4;
  id v15 = v3;
  [v11 fetchAttributesForProtectionClass:v12 attributes:v7 bundleID:@"com.apple.MobileAddressBook" identifiers:v17 completion:v16];
}

void __80__SPCoreSpotlightInteractionHandler_handleInteraction_bundleID_protectionClass___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v36 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v37 = *(void *)v39;
    uint64_t v35 = *MEMORY[0x263F025D0];
    uint64_t v34 = *MEMORY[0x263F024D0];
    uint64_t v31 = *MEMORY[0x263F025E8];
    v32 = (void *)*MEMORY[0x263EFFD08];
    id v30 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v39 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v8 = [v3 objectForKey:v7];

        if (v8)
        {
          uint64_t v9 = objc_opt_new();
          [v9 setBundleID:@"com.apple.MobileAddressBook"];
          [v9 setUniqueIdentifier:v7];
          [v9 setIsUpdate:1];
          if ([*(id *)(a1 + 40) isEqualToString:v35])
          {
            uint64_t v10 = [v3 objectForKey:v7];
            uint64_t v11 = v10;
            if (v10)
            {
              uint64_t v12 = [v10 firstObject];
              id v13 = [v11 objectAtIndex:1];
              if (v12 && v12 != v32)
              {
                id v14 = (void *)[v12 mutableCopy];
                id v15 = NSNumber;
                long long v16 = [v12 objectAtIndexedSubscript:0];
                id v17 = objc_msgSend(v15, "numberWithUnsignedLongLong:", objc_msgSend(v16, "unsignedLongLongValue") + 1);
                [v14 setObject:v17 atIndexedSubscript:0];

                id v3 = v30;
                id v18 = (void *)[v14 copy];

                uint64_t v12 = v14;
LABEL_17:

                if (!v13 || v13 == v32)
                {
                  id v20 = &unk_26D0C8C50;
                }
                else
                {
                  uint64_t v22 = (void *)[v13 mutableCopy];
                  __int16 v23 = NSNumber;
                  uint64_t v24 = [v13 objectAtIndexedSubscript:0];
                  v25 = objc_msgSend(v23, "numberWithUnsignedLongLong:", objc_msgSend(v24, "unsignedLongLongValue") + 1);
                  [v22 setObject:v25 atIndexedSubscript:0];

                  id v3 = v30;
                  id v20 = (void *)[v22 copy];

                  id v13 = v22;
                }

                id v26 = objc_alloc(MEMORY[0x263F02AE8]);
                uint64_t v27 = *(void *)(a1 + 48);
                v45[0] = *(void *)(a1 + 40);
                v45[1] = v31;
                v46[0] = v18;
                v46[1] = v20;
                v45[2] = v34;
                v46[2] = v27;
                v21 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
                v28 = (void *)[v26 initWithAttributes:v21];
                [v9 setAttributeSet:v28];

LABEL_22:
                [v36 addObject:v9];
                goto LABEL_23;
              }
            }
            else
            {
              uint64_t v12 = 0;
              id v13 = 0;
            }
            id v18 = &unk_26D0C8C38;
            goto LABEL_17;
          }
          uint64_t v11 = [NSString stringWithFormat:@":A:%@", *(void *)(a1 + 40)];
          id v19 = objc_alloc(MEMORY[0x263F02AE8]);
          uint64_t v42 = *(void *)(a1 + 56);
          v43[0] = v11;
          id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
          v43[1] = v34;
          v44[0] = v18;
          v44[1] = *(void *)(a1 + 48);
          id v20 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
          v21 = (void *)[v19 initWithAttributes:v20];
          [v9 setAttributeSet:v21];
          goto LABEL_22;
        }
        uint64_t v9 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v48 = v7;
          _os_log_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_DEFAULT, "interaction-related identifier not indexed %@", buf, 0xCu);
        }
LABEL_23:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v5);
  }

  v29 = +[SPCoreSpotlightIndexer sharedInstance];
  [v29 indexSearchableItems:v36 deleteSearchableItemsWithIdentifiers:0 clientState:0 clientStateName:0 protectionClass:*MEMORY[0x263F08098] forBundleID:@"com.apple.MobileAddressBook" options:0 completionHandler:0];
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end