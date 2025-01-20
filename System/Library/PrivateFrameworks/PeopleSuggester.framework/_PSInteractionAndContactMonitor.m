@interface _PSInteractionAndContactMonitor
- (BOOL)contactIdIsInContactStore:(id)a3;
- (CNContactStore)contactStore;
- (NSSet)contactIdsSeen;
- (_CDInteractionStore)interactionStore;
- (_PSInteractionAndContactMonitor)initWithInteractionStore:(id)a3 contactStore:(id)a4;
- (void)dealloc;
- (void)enumerateContactStoreWithBlock:(id)a3;
- (void)fetchAllContactIdsFromContactStore;
- (void)fetchChangedContactIdsFromContactStore;
- (void)notifyWhenContactAddedToInteractionStore:(id)a3;
- (void)populateContactIdCachesWithMessageCache:(id)a3 shareCache:(id)a4;
- (void)setContactIdsSeen:(id)a3;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
@end

@implementation _PSInteractionAndContactMonitor

- (_PSInteractionAndContactMonitor)initWithInteractionStore:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(_PSInteractionAndContactMonitor *)self init];
  v10 = v9;
  if (!v9) {
    goto LABEL_6;
  }
  v9->_lock._os_unfair_lock_opaque = 0;
  objc_storeStrong((id *)&v9->_interactionStore, a3);
  objc_storeStrong((id *)&v10->_contactStore, a4);
  uint64_t v11 = objc_opt_new();
  contactStoreEnumerationCache = v10->_contactStoreEnumerationCache;
  v10->_contactStoreEnumerationCache = (NSMutableOrderedSet *)v11;

  uint64_t v13 = [(CNContactStore *)v10->_contactStore currentHistoryToken];
  changeHistoryToken = v10->_changeHistoryToken;
  v10->_changeHistoryToken = (NSData *)v13;

  uint64_t v15 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"ps_interaction_contact_monitor_notification"];
  notificationQueue = v10->_notificationQueue;
  v10->_notificationQueue = (OS_dispatch_queue *)v15;

  objc_initWeak(location, v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke;
  block[3] = &unk_1E5ADFE98;
  objc_copyWeak(&v29, location);
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  v19 = (id *)getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  uint64_t v35 = getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  if (!getCNContactStoreDidChangeNotificationSymbolLoc_ptr)
  {
    location[1] = (id)MEMORY[0x1E4F143A8];
    location[2] = (id)3221225472;
    location[3] = __getCNContactStoreDidChangeNotificationSymbolLoc_block_invoke;
    location[4] = &unk_1E5ADE858;
    v31 = &v32;
    v20 = (void *)ContactsLibrary_1();
    v21 = dlsym(v20, "CNContactStoreDidChangeNotification");
    *(void *)(v31[1] + 24) = v21;
    getCNContactStoreDidChangeNotificationSymbolLoc_ptr = *(void *)(v31[1] + 24);
    v19 = (id *)v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (v19)
  {
    id v22 = *v19;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke_2;
    v26[3] = &unk_1E5ADFEC0;
    id v23 = v17;
    id v27 = v23;
    id v24 = (id)[v18 addObserverForName:v22 object:0 queue:0 usingBlock:v26];

    objc_destroyWeak(&v29);
    objc_destroyWeak(location);
LABEL_6:

    return v10;
  }
  dlerror();
  result = (_PSInteractionAndContactMonitor *)abort_report_np();
  __break(1u);
  return result;
}

- (void)dealloc
{
  contactIdsInContactStore = self->_contactIdsInContactStore;
  if (contactIdsInContactStore) {
    CFRelease(contactIdsInContactStore);
  }
  v4.receiver = self;
  v4.super_class = (Class)_PSInteractionAndContactMonitor;
  [(_PSInteractionAndContactMonitor *)&v4 dealloc];
}

- (void)populateContactIdCachesWithMessageCache:(id)a3 shareCache:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9 = [(_PSInteractionAndContactMonitor *)self interactionStore];
  v10 = [(_PSInteractionAndContactMonitor *)self contactIdsSeen];

  if (!v10)
  {
    v28 = v9;
    id v29 = v8;
    v30 = self;
    uint64_t v11 = objc_opt_new();
    id v32 = v6;
    v12 = [v6 interactions];
    id v31 = v7;
    v26 = [v7 interactions];
    id v27 = v12;
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:");
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(obj);
          }
          dispatch_block_t v17 = [*(id *)(*((void *)&v38 + 1) + 8 * i) recipients];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v35 != v20) {
                  objc_enumerationMutation(v17);
                }
                id v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                id v23 = [v22 personId];

                if (v23)
                {
                  id v24 = [v22 personId];
                  [v11 addObject:v24];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v19);
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v14);
    }
    self = v30;
    os_unfair_lock_lock(&v30->_lock);
    v25 = (void *)[v11 copy];
    [(_PSInteractionAndContactMonitor *)v30 setContactIdsSeen:v25];

    os_unfair_lock_unlock(&v30->_lock);
    v9 = v28;
    id v8 = v29;
    [v29 addObserver:v30 selector:sel_notifyWhenContactAddedToInteractionStore_ name:*MEMORY[0x1E4F5B618] object:v28];

    id v7 = v31;
    id v6 = v32;
  }
  if (!self->_contactIdsInContactStore)
  {
    self->_contactIdsInContactStore = CFSetCreateMutable(0, 0, 0);
    [(_PSInteractionAndContactMonitor *)self fetchAllContactIdsFromContactStore];
  }
}

- (void)fetchAllContactIdsFromContactStore
{
  v15[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactIdsInContactStore = self->_contactIdsInContactStore;
  if (contactIdsInContactStore) {
    CFRelease(contactIdsInContactStore);
  }
  self->_contactIdsInContactStore = CFSetCreateMutable(0, 0, 0);
  [(NSMutableOrderedSet *)self->_contactStoreEnumerationCache removeAllObjects];
  id v5 = objc_alloc((Class)getCNContactFetchRequestClass());
  id v6 = getCNContactIdentifierKey_1();
  v15[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v8 = (void *)[v5 initWithKeysToFetch:v7];

  [v8 setContactBatchCount:100];
  v9 = [(_PSInteractionAndContactMonitor *)self contactStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69___PSInteractionAndContactMonitor_fetchAllContactIdsFromContactStore__block_invoke;
  v12[3] = &unk_1E5ADFEE8;
  v12[4] = self;
  [v9 enumerateContactsWithFetchRequest:v8 error:0 usingBlock:v12];

  v10 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    CFIndex Count = CFSetGetCount(self->_contactIdsInContactStore);
    *(_DWORD *)buf = 134217984;
    CFIndex v14 = Count;
    _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_INFO, "_PSInteractionAndContactMonitor: Fetched all %tu contact ids from contact store", buf, 0xCu);
  }

  os_unfair_lock_unlock(p_lock);
  notify_post((const char *)[@"com.apple.PeopleSuggester.ReQuery" UTF8String]);
}

- (void)fetchChangedContactIdsFromContactStore
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "_PSInteractionAndContactMonitor: Received a Drop Everything change history event. Purging contact IDs.", v1, 2u);
}

- (void)notifyWhenContactAddedToInteractionStore:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5B620]];

  id v6 = [(_PSInteractionAndContactMonitor *)self contactIdsSeen];
  id v7 = (void *)[v6 mutableCopy];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v5;
  uint64_t v26 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v26)
  {
    id v29 = v7;
    char v28 = 0;
    uint64_t v24 = *(void *)v35;
    v25 = v8;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v8);
        }
        uint64_t v27 = v9;
        v10 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v9), "recipients", v24);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              uint64_t v16 = [v15 identifier];
              if (v16)
              {
                dispatch_block_t v17 = (void *)v16;
                uint64_t v18 = [(_PSInteractionAndContactMonitor *)self contactIdsSeen];
                uint64_t v19 = [v15 identifier];
                char v20 = [v18 containsObject:v19];

                if ((v20 & 1) == 0)
                {
                  v21 = [v15 identifier];
                  [v29 addObject:v21];

                  char v28 = 1;
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v12);
        }

        uint64_t v9 = v27 + 1;
        id v8 = v25;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v26);

    os_unfair_lock_lock(&self->_lock);
    id v7 = v29;
    id v22 = (void *)[v29 copy];
    [(_PSInteractionAndContactMonitor *)self setContactIdsSeen:v22];

    os_unfair_lock_unlock(&self->_lock);
    if (v28) {
      notify_post((const char *)[@"com.apple.PeopleSuggester.ReQuery" UTF8String]);
    }
  }
  else
  {

    os_unfair_lock_lock(&self->_lock);
    id v23 = (void *)[v7 copy];
    [(_PSInteractionAndContactMonitor *)self setContactIdsSeen:v23];

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (NSSet)contactIdsSeen
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = (void *)[(NSSet *)self->_contactIdsSeen copy];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (BOOL)contactIdIsInContactStore:(id)a3
{
  objc_super v4 = (const void *)objc_msgSend(a3, "_ps_pointerSizedHash");
  os_unfair_lock_lock(&self->_lock);
  contactIdsInContactStore = self->_contactIdsInContactStore;
  if (contactIdsInContactStore) {
    BOOL v6 = CFSetContainsValue(contactIdsInContactStore, v4) != 0;
  }
  else {
    BOOL v6 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  return v6;
}

- (void)enumerateContactStoreWithBlock:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMutableOrderedSet *)self->_contactStoreEnumerationCache set];
  BOOL v6 = (void *)[v5 copy];

  os_unfair_lock_unlock(&self->_lock);
  unsigned __int8 v28 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x1A6243860]();
        v4[2](v4, v12, &v28);
        LODWORD(v12) = v28;
        if (v12)
        {
          uint64_t v19 = v7;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  CFIndex v14 = [(_PSInteractionAndContactMonitor *)self contactStore];
  id v15 = objc_alloc((Class)getCNContactFetchRequestClass());
  uint64_t v16 = getCNContactIdentifierKey_1();
  id v29 = v16;
  dispatch_block_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  uint64_t v18 = (void *)[v15 initWithKeysToFetch:v17];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66___PSInteractionAndContactMonitor_enumerateContactStoreWithBlock___block_invoke;
  v20[3] = &unk_1E5ADFF10;
  id v21 = v7;
  id v22 = self;
  id v23 = v4;
  [v14 enumerateContactsWithFetchRequest:v18 error:0 usingBlock:v20];

  uint64_t v19 = v21;
LABEL_11:
}

- (void)visitDropEverythingEvent:(id)a3
{
  objc_super v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_INFO, "_PSInteractionAndContactMonitor: Received drop everything event, refetching contacts", v5, 2u);
  }

  [(_PSInteractionAndContactMonitor *)self fetchAllContactIdsFromContactStore];
}

- (void)visitAddContactEvent:(id)a3
{
  objc_super v4 = [a3 contact];
  id v5 = [v4 identifier];

  [(NSMutableOrderedSet *)self->_historyChangesQueuedToAddToEnumerationCache _ps_appendObject:v5 truncatingToCount:32];
  CFSetAddValue(self->_historyChangesQueuedToAdd, (const void *)objc_msgSend(v5, "_ps_pointerSizedHash"));
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4 = [a3 contactIdentifier];
  [(NSMutableOrderedSet *)self->_historyChangesQueuedToAddToEnumerationCache removeObject:v4];
  CFSetAddValue(self->_historyChangesQueuedToDelete, (const void *)objc_msgSend(v4, "_ps_pointerSizedHash"));
}

- (void)setContactIdsSeen:(id)a3
{
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_contactIdsSeen, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong(&self->_processContactChanges, 0);
  objc_storeStrong((id *)&self->_historyChangesQueuedToAddToEnumerationCache, 0);
  objc_storeStrong((id *)&self->_changeHistoryToken, 0);

  objc_storeStrong((id *)&self->_contactStoreEnumerationCache, 0);
}

@end