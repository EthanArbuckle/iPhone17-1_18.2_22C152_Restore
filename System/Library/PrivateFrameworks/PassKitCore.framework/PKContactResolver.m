@interface PKContactResolver
+ (id)contactForFamilyMember:(id)a3 nameComponents:(id)a4 imageData:(id)a5;
+ (id)defaultContactResolver;
- (BOOL)hasCachedResultForAccountUser:(id)a3;
- (BOOL)hasCachedResultForHandle:(id)a3;
- (CNContactStore)contactStore;
- (NSArray)keysToFetch;
- (NSCache)altDSIDToContactCache;
- (NSCache)handleToContactCache;
- (NSHashTable)delegates;
- (PKContactResolver)initWithContactStore:(id)a3 keysToFetch:(id)a4;
- (id)_predicateForHandle:(id)a3;
- (id)contactForAccountUser:(id)a3;
- (id)contactForHandle:(id)a3;
- (id)contactForIdentifier:(id)a3;
- (void)_accessDelegatesWithHandler:(id)a3;
- (void)_handleContactStoreDidChangeNotification:(id)a3;
- (void)addDelegate:(id)a3;
- (void)contactForAccountUser:(id)a3 withCompletion:(id)a4;
- (void)contactForHandle:(id)a3 withCompletion:(id)a4;
- (void)contactForHandles:(id)a3 withCompletion:(id)a4;
- (void)invalidateCache;
- (void)removeDelegate:(id)a3;
- (void)setAltDSIDToContactCache:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setHandleToContactCache:(id)a3;
@end

@implementation PKContactResolver

+ (id)defaultContactResolver
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v12[0] = v2;
  v3 = [(objc_class *)_MergedGlobals_177() descriptorForRequiredKeysWithThreeDTouchEnabled:1];
  v12[1] = v3;
  v4 = [(Class)off_1EB402468() descriptorForRequiredKeys];
  v12[2] = v4;
  v5 = [(Class)off_1EB402470() descriptorForRequiredKeys];
  uint64_t v6 = *MEMORY[0x1E4F1ADC8];
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = *MEMORY[0x1E4F1AEE0];
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:6];

  v8 = [PKContactResolver alloc];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v10 = [(PKContactResolver *)v8 initWithContactStore:v9 keysToFetch:v7];

  return v10;
}

- (PKContactResolver)initWithContactStore:(id)a3 keysToFetch:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKContactResolver;
  id v9 = [(PKContactResolver *)&v23 init];
  v10 = v9;
  if (v9)
  {
    v9->_delegatesLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_contactStore, a3);
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    handleToContactCache = v10->_handleToContactCache;
    v10->_handleToContactCache = v11;

    v13 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    altDSIDToContactCache = v10->_altDSIDToContactCache;
    v10->_altDSIDToContactCache = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.PassKit.PKContactResolver.reply", 0);
    replyQueue = v10->_replyQueue;
    v10->_replyQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.PassKit.PKContactResolver.work", 0);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v10->_keysToFetch, a4);
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    delegates = v10->_delegates;
    v10->_delegates = (NSHashTable *)v19;

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v10 selector:sel__handleContactStoreDidChangeNotification_ name:*MEMORY[0x1E4F1AF80] object:0];
  }
  return v10;
}

- (void)addDelegate:(id)a3
{
  p_delegatesLock = &self->_delegatesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_delegatesLock);
  [(NSHashTable *)self->_delegates addObject:v5];

  os_unfair_lock_unlock(p_delegatesLock);
}

- (void)removeDelegate:(id)a3
{
  p_delegatesLock = &self->_delegatesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_delegatesLock);
  [(NSHashTable *)self->_delegates removeObject:v5];

  os_unfair_lock_lock(p_delegatesLock);
}

- (void)_accessDelegatesWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegatesLock);
    id v5 = [(NSHashTable *)self->_delegates allObjects];
    os_unfair_lock_unlock(&self->_delegatesLock);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__PKContactResolver__accessDelegatesWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __49__PKContactResolver__accessDelegatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)invalidateCache
{
  [(NSCache *)self->_handleToContactCache removeAllObjects];
  altDSIDToContactCache = self->_altDSIDToContactCache;
  [(NSCache *)altDSIDToContactCache removeAllObjects];
}

- (void)_handleContactStoreDidChangeNotification:(id)a3
{
  [(PKContactResolver *)self invalidateCache];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PKContactResolver__handleContactStoreDidChangeNotification___block_invoke;
  v4[3] = &unk_1E56EB588;
  v4[4] = self;
  [(PKContactResolver *)self _accessDelegatesWithHandler:v4];
}

uint64_t __62__PKContactResolver__handleContactStoreDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contactsDidChangeForContactResolver:*(void *)(a1 + 32)];
}

- (id)_predicateForHandle:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 containsString:@"@"])
    {
      uint64_t v5 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v4];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1BA70] phoneNumberWithDigits:v4 countryCode:0];
      if (v6)
      {
        uint64_t v5 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v6];
      }
      else
      {
        long long v7 = PKLogFacilityTypeGetObject(0xBuLL);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          uint64_t v10 = 0;
          _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Could not convert phone number to CNPhoneNumber: %@", (uint8_t *)&v9, 0xCu);
        }

        uint64_t v5 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasCachedResultForHandle:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = -[NSCache objectForKey:](self->_handleToContactCache, "objectForKey:");
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)contactForHandle:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v11 = 0;
    goto LABEL_19;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  objc_super v23 = __Block_byref_object_copy__40;
  v24 = __Block_byref_object_dispose__40;
  id v25 = 0;
  uint64_t v5 = [(NSCache *)self->_handleToContactCache objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    if (v5 == v6) {
      long long v7 = 0;
    }
    else {
      long long v7 = v5;
    }
    long long v8 = v21;
    id v9 = v7;
    uint64_t v10 = (void *)v8[5];
    v8[5] = (uint64_t)v9;
    goto LABEL_17;
  }
  uint64_t v6 = [(PKContactResolver *)self _predicateForHandle:v4];
  if (v6)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:self->_keysToFetch];
    [v10 setPredicate:v6];
    contactStore = self->_contactStore;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __38__PKContactResolver_contactForHandle___block_invoke;
    v18[3] = &unk_1E56EB5B0;
    v18[4] = &v20;
    id v19 = 0;
    [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v10 error:&v19 usingBlock:v18];
    id v13 = v19;
    if (v13)
    {
      v14 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v13;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Error fetching contact: %@", buf, 0xCu);
      }
    }
    else
    {
      handleToContactCache = self->_handleToContactCache;
      v16 = v21[5];
      v14 = v16;
      if (!v16)
      {
        v14 = [MEMORY[0x1E4F1CA98] null];
      }
      [(NSCache *)handleToContactCache setObject:v14 forKey:v4];
      if (v16) {
        goto LABEL_16;
      }
    }

LABEL_16:
LABEL_17:
  }
  id v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
LABEL_19:

  return v11;
}

void __38__PKContactResolver_contactForHandle___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)contactForIdentifier:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1B8F8];
    v25[0] = v4;
    long long v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    long long v8 = [v6 predicateForContactsWithIdentifiers:v7];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:self->_keysToFetch];
    [v9 setPredicate:v8];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__40;
    v21 = __Block_byref_object_dispose__40;
    id v22 = 0;
    contactStore = self->_contactStore;
    v15[4] = &v17;
    id v16 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__PKContactResolver_contactForIdentifier___block_invoke;
    v15[3] = &unk_1E56EB5B0;
    [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v9 error:&v16 usingBlock:v15];
    id v11 = v16;
    if (v11)
    {
      uint64_t v12 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v11;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Error fetching contact: %@", buf, 0xCu);
      }
    }
    id v13 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __42__PKContactResolver_contactForIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (BOOL)hasCachedResultForAccountUser:(id)a3
{
  if (!a3) {
    return 0;
  }
  altDSIDToContactCache = self->_altDSIDToContactCache;
  id v4 = [a3 altDSID];
  uint64_t v5 = [(NSCache *)altDSIDToContactCache objectForKey:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)contactForAccountUser:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31 = v4;
  if (v4)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__40;
    v42 = __Block_byref_object_dispose__40;
    id v43 = 0;
    uint64_t v5 = [v4 altDSID];
    [(NSCache *)self->_altDSIDToContactCache objectForKey:v5];
    v30 = v29 = (void *)v5;
    if (v30)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      long long v7 = v30;
      id v8 = (id)v6;
      if (v30 == (void *)v6) {
        long long v7 = 0;
      }
      id v9 = v39;
      id v10 = v7;
      id v11 = (void *)v9[5];
      v9[5] = (uint64_t)v10;
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v14 = [v31 addressableHandles];
      if (v14) {
        [v13 unionSet:v14];
      }
      id v27 = (void *)v14;
      uint64_t v28 = [v31 appleID];
      if (v28) {
        [v13 addObject:v28];
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v8 = v13;
      uint64_t v15 = [v8 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v8);
            }
            v18 = [(PKContactResolver *)self _predicateForHandle:*(void *)(*((void *)&v34 + 1) + 8 * i)];
            if (v18)
            {
              uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:self->_keysToFetch];
              [v19 setPredicate:v18];
              contactStore = self->_contactStore;
              v32[0] = MEMORY[0x1E4F143A8];
              v32[1] = 3221225472;
              v32[2] = __43__PKContactResolver_contactForAccountUser___block_invoke;
              v32[3] = &unk_1E56EB5B0;
              v32[4] = &v38;
              id v33 = 0;
              [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v19 error:&v33 usingBlock:v32];
              id v21 = v33;
              if (v21)
              {
                id v22 = PKLogFacilityTypeGetObject(0xEuLL);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v45 = v21;
                  _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Error fetching contact: %@", buf, 0xCu);
                }
              }
              else if (v39[5])
              {

                goto LABEL_27;
              }
            }
          }
          uint64_t v15 = [v8 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_27:

      altDSIDToContactCache = self->_altDSIDToContactCache;
      id v24 = (void *)v39[5];
      id v25 = v24;
      if (!v24)
      {
        id v25 = [MEMORY[0x1E4F1CA98] null];
      }
      [(NSCache *)altDSIDToContactCache setObject:v25 forKey:v29];
      if (!v24) {

      }
      id v11 = v27;
    }

    id v12 = (id)v39[5];
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __43__PKContactResolver_contactForAccountUser___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)contactForAccountUser:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PKContactResolver_contactForAccountUser_withCompletion___block_invoke;
    block[3] = &unk_1E56D89F0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

void __58__PKContactResolver_contactForAccountUser_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactForAccountUser:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PKContactResolver_contactForAccountUser_withCompletion___block_invoke_2;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 48);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __58__PKContactResolver_contactForAccountUser_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)contactForHandles:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PKContactResolver_contactForHandles_withCompletion___block_invoke;
    block[3] = &unk_1E56D89F0;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(workQueue, block);
  }
}

void __54__PKContactResolver_contactForHandles_withCompletion___block_invoke(id *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = a1[4];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if ([a1[5] hasCachedResultForHandle:v9])
        {
          id v10 = [*((id *)a1[5] + 6) objectForKey:v9];
          if (v10)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v2 setObject:v10 forKey:v9];
            }
          }
        }
        else
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * j);
          uint64_t v17 = [a1[5] contactForHandle:v16];
          if (v17) {
            [v2 setObject:v17 forKey:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v13);
    }
  }
  v18 = *((void *)a1[5] + 1);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__PKContactResolver_contactForHandles_withCompletion___block_invoke_2;
  v21[3] = &unk_1E56D83D8;
  id v19 = a1[6];
  id v22 = v2;
  id v23 = v19;
  id v20 = v2;
  dispatch_async(v18, v21);
}

void __54__PKContactResolver_contactForHandles_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)contactForHandle:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PKContactResolver_contactForHandle_withCompletion___block_invoke;
    block[3] = &unk_1E56D89F0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

void __53__PKContactResolver_contactForHandle_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactForHandle:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PKContactResolver_contactForHandle_withCompletion___block_invoke_2;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 48);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __53__PKContactResolver_contactForHandle_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)contactForFamilyMember:(id)a3 nameComponents:(id)a4 imageData:(id)a5
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  id v9 = a5;
  if (!(v7 | v8))
  {
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  if (v7)
  {
    id v11 = [(id)v7 firstName];
    [v10 setGivenName:v11];

    uint64_t v12 = [(id)v7 lastName];
LABEL_7:
    uint64_t v15 = (void *)v12;
    [v10 setFamilyName:v12];

    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v14 = [(id)v8 givenName];
    [v10 setGivenName:v14];

    uint64_t v12 = [(id)v8 familyName];
    goto LABEL_7;
  }
LABEL_8:
  [v10 setImageData:v9];
  uint64_t v13 = (void *)[v10 copy];

LABEL_9:
  return v13;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (NSCache)handleToContactCache
{
  return self->_handleToContactCache;
}

- (void)setHandleToContactCache:(id)a3
{
}

- (NSCache)altDSIDToContactCache
{
  return self->_altDSIDToContactCache;
}

- (void)setAltDSIDToContactCache:(id)a3
{
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_altDSIDToContactCache, 0);
  objc_storeStrong((id *)&self->_handleToContactCache, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

@end