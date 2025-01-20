@interface SearchUIContactCache
+ (SearchUIContactCache)sharedCache;
+ (id)placeholderContact;
- (CNContactStore)contactStore;
- (SearchUIContactCache)init;
- (id)contactForContactViewController:(id)a3;
- (id)contactForIdentifier:(id)a3;
- (id)contactsForIdentifiers:(id)a3;
- (id)itemsToBatchPreFetchForRowModel:(id)a3;
- (void)computeObjectsForKeys:(id)a3 completionHandler:(id)a4;
- (void)fetchContactForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchContactForPerson:(id)a3 completionHandler:(id)a4;
- (void)fetchContactsForIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setContactStore:(id)a3;
@end

@implementation SearchUIContactCache

+ (SearchUIContactCache)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedCache_sharedCache;
  return (SearchUIContactCache *)v2;
}

uint64_t __35__SearchUIContactCache_sharedCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedCache_sharedCache;
  sharedCache_sharedCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SearchUIContactCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)SearchUIContactCache;
  v2 = [(TLKAsyncCache *)&v11 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [v3 setIncludeSuggestedContacts:1];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v3];
    [(SearchUIContactCache *)v2 setContactStore:v4];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F1AF80];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __28__SearchUIContactCache_init__block_invoke;
    v9[3] = &unk_1E6E72E20;
    v10 = v2;
    id v7 = (id)[v5 addObserverForName:v6 object:0 queue:0 usingBlock:v9];
  }
  return v2;
}

uint64_t __28__SearchUIContactCache_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clear];
}

- (void)fetchContactForPerson:(id)a3 completionHandler:(id)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 contactIdentifier];

  if (v8)
  {
    v9 = [v6 contactIdentifier];
    v48[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __64__SearchUIContactCache_fetchContactForPerson_completionHandler___block_invoke;
    v44[3] = &unk_1E6E72E48;
    id v45 = v7;
    [(SearchUIContactCache *)self fetchContactsForIdentifiers:v10 completionHandler:v44];

    objc_super v11 = v45;
  }
  else
  {
    v35 = (void (**)(void, void *))v7;
    v12 = objc_opt_new();
    v13 = [v6 displayName];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      v15 = +[SearchUIUtilities localizedStringForKey:@"MAYBE_CONTACT_STRING"];
      [v12 setNamePrefix:v15];

      v16 = objc_opt_new();
      v17 = [v6 displayName];
      v18 = [v16 personNameComponentsFromString:v17];

      [v18 overrideComponentsInContact:v12];
    }
    v34 = v12;
    v19 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v20 = [v6 phoneNumbers];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v41;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = objc_msgSend(MEMORY[0x1E4F1BA70], "phoneNumberWithStringValue:", *(void *)(*((void *)&v40 + 1) + 8 * v24), v34);
          v26 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v25];
          [v19 addObject:v26];

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v22);
    }

    objc_super v11 = v34;
    [v34 setPhoneNumbers:v19];
    v27 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v28 = [v6 emailAddresses];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v37;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = objc_msgSend(MEMORY[0x1E4F1BA20], "labeledValueWithLabel:value:", 0, *(void *)(*((void *)&v36 + 1) + 8 * v32), v34);
          [v27 addObject:v33];

          ++v32;
        }
        while (v30 != v32);
        uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v30);
    }

    [v11 setEmailAddresses:v27];
    id v7 = v35;
    v35[2](v35, v11);
  }
}

void __64__SearchUIContactCache_fetchContactForPerson_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)fetchContactForIdentifier:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v12[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v8 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__SearchUIContactCache_fetchContactForIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E6E72E48;
  id v9 = v7;
  id v11 = v9;
  [(SearchUIContactCache *)self fetchContactsForIdentifiers:v8 completionHandler:v10];
  if (v6) {
}
  }

void __68__SearchUIContactCache_fetchContactForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)fetchContactsForIdentifiers:(id)a3 completionHandler:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([v6 count])
  {
    [(TLKAsyncCache *)self getObjectsForKeys:v6 completionHandler:v7];
  }
  else
  {
    v8 = [(id)objc_opt_class() placeholderContact];
    v10[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v7[2](v7, v9);
  }
}

- (void)computeObjectsForKeys:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = [(SearchUIContactCache *)self contactsForIdentifiers:a3];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (id)contactsForIdentifiers:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (contactsForIdentifiers__onceToken != -1) {
    dispatch_once(&contactsForIdentifiers__onceToken, &__block_literal_global_21);
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1B8F8], "predicateForContactsWithIdentifiers:", v4, v4);
  id v6 = [(SearchUIContactCache *)self contactStore];
  uint64_t v32 = (void *)v5;
  id v7 = [v6 unifiedContactsMatchingPredicate:v5 keysToFetch:contactsForIdentifiers__requiredKeys error:0];

  id v8 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v14 = [v13 identifier];
        [v8 setObject:v13 forKeyedSubscript:v14];

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v15 = [v13 linkedContacts];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v39 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = [*(id *)(*((void *)&v38 + 1) + 8 * j) identifier];
              [v8 setObject:v13 forKeyedSubscript:v20];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v17);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v10);
  }

  uint64_t v21 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = v31;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * k)];
        if (v27)
        {
          [v21 addObject:v27];
        }
        else
        {
          v28 = [(id)objc_opt_class() placeholderContact];
          [v21 addObject:v28];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v24);
  }

  uint64_t v29 = (void *)[v21 copy];
  return v29;
}

void __47__SearchUIContactCache_contactsForIdentifiers___block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1BB90] descriptorForRequiredKeys];
  uint64_t v1 = *MEMORY[0x1E4F1AE18];
  v6[0] = v0;
  v6[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1BB38] descriptorForRequiredKeysWithThreeDTouchEnabled:1];
  v6[2] = v2;
  id v3 = [MEMORY[0x1E4F1BB18] descriptorForRequiredKeys];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  uint64_t v5 = (void *)contactsForIdentifiers__requiredKeys;
  contactsForIdentifiers__requiredKeys = v4;
}

- (id)contactForIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TLKAsyncCache *)self getCachedObjectIfAvailableForKey:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_3:
    id v8 = v7;
    goto LABEL_6;
  }
  if (!v4)
  {
    id v7 = [(id)objc_opt_class() placeholderContact];
    goto LABEL_3;
  }
  v12[0] = v4;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v10 = [(SearchUIContactCache *)self contactsForIdentifiers:v9];
  id v8 = [v10 firstObject];

LABEL_6:
  return v8;
}

- (id)contactForContactViewController:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SearchUIContactCache *)self contactStore];
  id v6 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = [v5 unifiedContactWithIdentifier:v4 keysToFetch:v7 error:0];

  return v8;
}

+ (id)placeholderContact
{
  if (placeholderContact_onceToken != -1) {
    dispatch_once(&placeholderContact_onceToken, &__block_literal_global_29);
  }
  uint64_t v2 = (void *)placeholderContact_placeholderContact;
  return v2;
}

uint64_t __42__SearchUIContactCache_placeholderContact__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = placeholderContact_placeholderContact;
  placeholderContact_placeholderContact = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)itemsToBatchPreFetchForRowModel:(id)a3
{
  return (id)[a3 contactIdentifiers];
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end