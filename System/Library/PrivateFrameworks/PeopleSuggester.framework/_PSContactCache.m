@interface _PSContactCache
+ (_PSContactCache)sharedInstance;
- (_PSContactCache)init;
- (id)_getCachedContactForHandle:(id)a3;
- (id)_getCachedFaceTimeableHandleForContactIdentifier:(id)a3;
- (id)contactKeysToFetch;
- (id)fetchMeContact;
- (id)getContactForHandle:(id)a3 handleType:(int64_t)a4;
- (id)getFaceTimeableHandleForContact:(id)a3 interactionStore:(id)a4 seedRecipientHandle:(id)a5;
- (id)getMeContact;
- (int64_t)getFaceTimeIDSStatusForHandle:(id)a3 contactType:(unint64_t)a4;
- (void)_purge;
- (void)_removeAllHandlesForContactIdentifier:(id)a3;
- (void)_setContact:(id)a3;
- (void)_setContact:(id)a3 forHandle:(id)a4;
- (void)_setLikelyFaceTimeHandle:(id)a3 forContactIdentifier:(id)a4;
- (void)dealloc;
- (void)fetchMeContact;
- (void)getMeContact;
- (void)syncChangeHistory;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation _PSContactCache

- (_PSContactCache)init
{
  v43.receiver = self;
  v43.super_class = (Class)_PSContactCache;
  v2 = [(_PSContactCache *)&v43 init];
  if (!v2) {
    return v2;
  }
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2050000000;
  v3 = (void *)getCNContactStoreClass_softClass_7;
  uint64_t v52 = getCNContactStoreClass_softClass_7;
  if (!getCNContactStoreClass_softClass_7)
  {
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    v46 = __getCNContactStoreClass_block_invoke_7;
    v47 = &unk_1E5ADE858;
    v48 = &v49;
    ContactsLibraryCore_8();
    Class Class = objc_getClass("CNContactStore");
    *(void *)(v48[1] + 24) = Class;
    getCNContactStoreClass_softClass_7 = *(void *)(v48[1] + 24);
    v3 = (void *)v50[3];
  }
  id v5 = v3;
  _Block_object_dispose(&v49, 8);
  uint64_t v6 = objc_opt_new();
  contactStore = v2->_contactStore;
  v2->_contactStore = (CNContactStore *)v6;

  uint64_t v8 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"ps_contact_cache_notification"];
  notificationQueue = v2->_notificationQueue;
  v2->_notificationQueue = (OS_dispatch_queue *)v8;

  id v10 = objc_alloc(MEMORY[0x1E4F93B70]);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:64];
  uint64_t v12 = [v10 initWithGuardedData:v11];
  cachedContactForHandle = v2->_cachedContactForHandle;
  v2->_cachedContactForHandle = (_PASLock *)v12;

  id v14 = objc_alloc(MEMORY[0x1E4F93B70]);
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:64];
  uint64_t v16 = [v14 initWithGuardedData:v15];
  cachedFaceTimeableHandleForContactIdentifier = v2->_cachedFaceTimeableHandleForContactIdentifier;
  v2->_cachedFaceTimeableHandleForContactIdentifier = (_PASLock *)v16;

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2050000000;
  v18 = (void *)getIDSIDQueryControllerClass_softClass;
  uint64_t v52 = getIDSIDQueryControllerClass_softClass;
  if (!getIDSIDQueryControllerClass_softClass)
  {
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    v46 = __getIDSIDQueryControllerClass_block_invoke;
    v47 = &unk_1E5ADE858;
    v48 = &v49;
    IDSLibraryCore();
    Class v19 = objc_getClass("IDSIDQueryController");
    *(void *)(v48[1] + 24) = v19;
    getIDSIDQueryControllerClass_softClass Class = *(void *)(v48[1] + 24);
    v18 = (void *)v50[3];
  }
  id v20 = v18;
  _Block_object_dispose(&v49, 8);
  uint64_t v21 = [v20 sharedInstance];
  idsQueryController = v2->_idsQueryController;
  v2->_idsQueryController = (IDSIDQueryController *)v21;

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  v23 = (id *)getIDSServiceNameFaceTimeSymbolLoc_ptr;
  uint64_t v52 = getIDSServiceNameFaceTimeSymbolLoc_ptr;
  if (!getIDSServiceNameFaceTimeSymbolLoc_ptr)
  {
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    v46 = __getIDSServiceNameFaceTimeSymbolLoc_block_invoke;
    v47 = &unk_1E5ADE858;
    v48 = &v49;
    v24 = (void *)IDSLibrary();
    v25 = dlsym(v24, "IDSServiceNameFaceTime");
    *(void *)(v48[1] + 24) = v25;
    getIDSServiceNameFaceTimeSymbolLoc_ptr = *(void *)(v48[1] + 24);
    v23 = (id *)v50[3];
  }
  _Block_object_dispose(&v49, 8);
  if (v23)
  {
    objc_storeStrong((id *)&v2->_faceTimeServiceName, *v23);
    [(IDSIDQueryController *)v2->_idsQueryController _warmupQueryCacheForService:v2->_faceTimeServiceName];
    uint64_t v26 = [(CNContactStore *)v2->_contactStore currentHistoryToken];
    changeHistoryToken = v2->_changeHistoryToken;
    v2->_changeHistoryToken = (NSData *)v26;

    objc_initWeak(&location, v2);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23___PSContactCache_init__block_invoke;
    block[3] = &unk_1E5ADFE98;
    objc_copyWeak(&v41, &location);
    dispatch_block_t v28 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    v30 = (id *)getCNContactStoreDidChangeNotificationSymbolLoc_ptr_0;
    uint64_t v52 = getCNContactStoreDidChangeNotificationSymbolLoc_ptr_0;
    if (!getCNContactStoreDidChangeNotificationSymbolLoc_ptr_0)
    {
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      v46 = __getCNContactStoreDidChangeNotificationSymbolLoc_block_invoke_0;
      v47 = &unk_1E5ADE858;
      v48 = &v49;
      v31 = (void *)ContactsLibrary_7();
      v32 = dlsym(v31, "CNContactStoreDidChangeNotification");
      *(void *)(v48[1] + 24) = v32;
      getCNContactStoreDidChangeNotificationSymbolLoc_ptr_0 = *(void *)(v48[1] + 24);
      v30 = (id *)v50[3];
    }
    _Block_object_dispose(&v49, 8);
    if (v30)
    {
      id v33 = *v30;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __23___PSContactCache_init__block_invoke_2;
      v38[3] = &unk_1E5ADFEC0;
      id v34 = v28;
      id v39 = v34;
      uint64_t v35 = [v29 addObserverForName:v33 object:0 queue:0 usingBlock:v38];
      notificationCenterToken = v2->_notificationCenterToken;
      v2->_notificationCenterToken = v35;

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
      return v2;
    }
  }
  else
  {
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
  }
  dlerror();
  result = (_PSContactCache *)abort_report_np();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_notificationCenterToken];

  v4.receiver = self;
  v4.super_class = (Class)_PSContactCache;
  [(_PSContactCache *)&v4 dealloc];
}

+ (_PSContactCache)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_33);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;

  return (_PSContactCache *)v2;
}

- (void)_setContact:(id)a3 forHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cachedContactForHandle = self->_cachedContactForHandle;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41___PSContactCache__setContact_forHandle___block_invoke;
  v11[3] = &unk_1E5AE0F50;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)cachedContactForHandle runWithLockAcquired:v11];
}

- (void)_removeAllHandlesForContactIdentifier:(id)a3
{
  id v4 = a3;
  cachedContactForHandle = self->_cachedContactForHandle;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57___PSContactCache__removeAllHandlesForContactIdentifier___block_invoke;
  v7[3] = &unk_1E5AE0FA0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)cachedContactForHandle runWithLockAcquired:v7];
}

- (void)_purge
{
  v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "_PSContactCache: Purging cache.", v4, 2u);
  }

  [(_PASLock *)self->_cachedContactForHandle runWithLockAcquired:&__block_literal_global_52];
  [(_PASLock *)self->_cachedFaceTimeableHandleForContactIdentifier runWithLockAcquired:&__block_literal_global_54];
}

- (id)_getCachedContactForHandle:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__17;
    v15 = __Block_byref_object_dispose__17;
    id v16 = 0;
    cachedContactForHandle = self->_cachedContactForHandle;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46___PSContactCache__getCachedContactForHandle___block_invoke;
    v8[3] = &unk_1E5AE0FE8;
    id v10 = &v11;
    id v9 = v4;
    [(_PASLock *)cachedContactForHandle runWithLockAcquired:v8];
    id v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (void)_setLikelyFaceTimeHandle:(id)a3 forContactIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cachedFaceTimeableHandleForContactIdentifier = self->_cachedFaceTimeableHandleForContactIdentifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65___PSContactCache__setLikelyFaceTimeHandle_forContactIdentifier___block_invoke;
  v11[3] = &unk_1E5AE0F50;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)cachedFaceTimeableHandleForContactIdentifier runWithLockAcquired:v11];
}

- (id)_getCachedFaceTimeableHandleForContactIdentifier:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__17;
    v15 = __Block_byref_object_dispose__17;
    id v16 = 0;
    cachedFaceTimeableHandleForContactIdentifier = self->_cachedFaceTimeableHandleForContactIdentifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68___PSContactCache__getCachedFaceTimeableHandleForContactIdentifier___block_invoke;
    v8[3] = &unk_1E5AE0FE8;
    id v10 = &v11;
    id v9 = v4;
    [(_PASLock *)cachedFaceTimeableHandleForContactIdentifier runWithLockAcquired:v8];
    id v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (void)_setContact:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 identifier];
    [(_PSContactCache *)self _setContact:v5 forHandle:v6];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = [v5 phoneNumbers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (void *)MEMORY[0x1E4F5B3B0];
          uint64_t v13 = [*(id *)(*((void *)&v28 + 1) + 8 * v11) value];
          id v14 = [v13 stringValue];
          v15 = [v12 normalizedStringFromContactString:v14];

          [(_PSContactCache *)self _setContact:v5 forHandle:v15];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = objc_msgSend(v5, "emailAddresses", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = (void *)MEMORY[0x1E4F5B3B0];
          v22 = [*(id *)(*((void *)&v24 + 1) + 8 * v20) value];
          v23 = [v21 normalizedStringFromContactString:v22];

          [(_PSContactCache *)self _setContact:v5 forHandle:v23];
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }
  }
}

- (void)visitAddContactEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_PSContactCache visitAddContactEvent:]();
  }

  id v6 = [v4 contact];

  [(_PSContactCache *)self _setContact:v6];
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_PSContactCache visitUpdateContactEvent:]();
  }

  id v6 = [v4 contact];
  id v7 = [v6 identifier];
  [(_PSContactCache *)self _removeAllHandlesForContactIdentifier:v7];

  uint64_t v8 = [v4 contact];

  [(_PSContactCache *)self _setContact:v8];
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_PSContactCache visitDeleteContactEvent:]();
  }

  id v6 = [v4 contactIdentifier];

  [(_PSContactCache *)self _removeAllHandlesForContactIdentifier:v6];
}

- (void)syncChangeHistory
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSContactCache: Received a Drop Everything change history event. Purging contact cache.", v2, v3, v4, v5, v6);
}

- (id)fetchMeContact
{
  v15[1] = *MEMORY[0x1E4F143B8];
  contactStore = self->_contactStore;
  uint64_t v4 = getCNContactIdentifierKey_4();
  v15[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v12 = 0;
  uint8_t v6 = [(CNContactStore *)contactStore _crossPlatformUnifiedMeContactWithKeysToFetch:v5 error:&v12];
  id v7 = v12;

  if (v7)
  {
    uint64_t v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSContactCache fetchMeContact]();
    }
  }
  else if (v6)
  {
    goto LABEL_9;
  }
  uint64_t v9 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v7;
    _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, "_PSContactCache: Me Card query returns nil in _PSContactCache. Error: %@", buf, 0xCu);
  }

  uint8_t v6 = 0;
LABEL_9:
  uint64_t v10 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_DEFAULT, "_PSContactCache: Caching me contact results for future use", buf, 2u);
  }

  [(_PSContactCache *)self _setContact:v6 forHandle:@"kMeSentinelString"];

  return v6;
}

- (id)getFaceTimeableHandleForContact:(id)a3 interactionStore:(id)a4 seedRecipientHandle:(id)a5
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v20 = 0;
    goto LABEL_123;
  }
  uint64_t v11 = [v8 phoneNumbers];
  id v12 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_62);

  uint64_t v13 = [v8 emailAddresses];
  id v14 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_64);

  uint64_t v15 = [v12 count];
  uint64_t v16 = [v14 count] + v15;
  if (!v16)
  {
    id v20 = 0;
    goto LABEL_122;
  }
  if (v16 == 1)
  {
    uint64_t v17 = [v12 firstObject];
    uint64_t v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [v14 firstObject];
    }
    id v20 = v19;

    goto LABEL_122;
  }
  uint64_t v21 = [v8 identifier];
  v22 = [(_PSContactCache *)self _getCachedFaceTimeableHandleForContactIdentifier:v21];

  v132 = v22;
  if (v22)
  {
    v23 = +[_PSLogging generalChannel];
    long long v24 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      long long v25 = [v22 handle];
      long long v26 = [v8 identifier];
      *(_DWORD *)buf = 138412546;
      id v154 = v25;
      __int16 v155 = 2112;
      v156 = v26;
      _os_log_impl(&dword_1A314B000, v23, OS_LOG_TYPE_DEFAULT, "Returning cached FaceTimeable handle %@ for contact UUID %@", buf, 0x16u);
    }
    id v20 = [v132 handle];
    goto LABEL_121;
  }
  v130 = v14;
  v131 = v12;
  long long v27 = [v8 identifier];
  long long v28 = +[_PSConstants macFacetimeBundleId];
  v152[0] = v28;
  long long v29 = +[_PSConstants mobileFacetimeBundleId];
  v152[1] = v29;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:2];
  id v129 = v9;
  long long v30 = +[_PSInteractionStoreUtils mostRecentInteractionInvolvingMatchingIdentifier:v27 store:v9 bundleIds:v20];

  v128 = v30;
  if (!v30)
  {
    uint64_t v133 = 0;
    id v42 = 0;
    goto LABEL_32;
  }
  long long v31 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = [v8 identifier];
    *(_DWORD *)buf = 138412290;
    id v154 = v32;
    _os_log_impl(&dword_1A314B000, v31, OS_LOG_TYPE_DEFAULT, "Found previous FaceTime interaction to cache handle for contact UUID %@, checking with IDS filter", buf, 0xCu);
  }
  id v33 = [v30 recipients];
  v148[0] = MEMORY[0x1E4F143A8];
  v148[1] = 3221225472;
  v148[2] = __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_67;
  v148[3] = &unk_1E5AE1030;
  id v34 = v8;
  id v149 = v34;
  uint64_t v35 = objc_msgSend(v33, "_pas_filteredArrayWithTest:", v148);
  v36 = [v35 firstObject];

  id v20 = [v36 identifier];
  if (([v131 containsObject:v20] & 1) == 0
    && ![v130 containsObject:v20])
  {
    uint64_t v44 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = [v34 identifier];
      *(_DWORD *)buf = 138412290;
      id v154 = v45;
      _os_log_impl(&dword_1A314B000, v44, OS_LOG_TYPE_DEFAULT, "Found previous FaceTime interaction for best FaceTime handle, but handle no longer associated to contact %@", buf, 0xCu);
    }
    goto LABEL_28;
  }
  int64_t v37 = -[_PSContactCache getFaceTimeIDSStatusForHandle:contactType:](self, "getFaceTimeIDSStatusForHandle:contactType:", v20, [v36 type]);
  if (!v37)
  {
    id v42 = v20;
    uint64_t v133 = [v36 type];
    goto LABEL_30;
  }
  if (v37 != 1)
  {
LABEL_28:
    uint64_t v133 = 0;
    id v42 = 0;
LABEL_30:
    int v43 = 1;
    goto LABEL_31;
  }
  v38 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = [v34 identifier];
    *(_DWORD *)buf = 138412546;
    id v154 = v20;
    __int16 v155 = 2112;
    v156 = v39;
    _os_log_impl(&dword_1A314B000, v38, OS_LOG_TYPE_DEFAULT, "Caching handle %@ for contact UUID %@", buf, 0x16u);
  }
  v40 = [v34 identifier];
  [(_PSContactCache *)self _setLikelyFaceTimeHandle:v20 forContactIdentifier:v40];

  id v41 = v20;
  uint64_t v133 = 0;
  id v42 = 0;
  int v43 = 0;
LABEL_31:

  if (!v43) {
    goto LABEL_120;
  }
LABEL_32:
  v46 = v131;
  if ([v131 count])
  {
    v47 = [v8 identifier];
    v48 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v49 = [v48 dateByAddingTimeInterval:-86400.0];
    uint64_t v50 = +[_PSInteractionStoreUtils someIMessageInteractionInvolvingContactIdentifier:v47 store:v129 contactType:1 afterStartDate:v49];

    uint64_t v51 = (void *)v50;
    if (v50)
    {
      uint64_t v52 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = [v8 identifier];
        *(_DWORD *)buf = 138412290;
        id v154 = v53;
        _os_log_impl(&dword_1A314B000, v52, OS_LOG_TYPE_DEFAULT, "Found previous phone iMessage interaction to cache handle for contact UUID %@, checking with IDS filter", buf, 0xCu);
      }
      v134 = v51;
      v54 = [v51 recipients];
      v146[0] = MEMORY[0x1E4F143A8];
      v146[1] = 3221225472;
      v146[2] = __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_69;
      v146[3] = &unk_1E5AE1030;
      id v55 = v8;
      id v147 = v55;
      v56 = objc_msgSend(v54, "_pas_filteredArrayWithTest:", v146);
      v57 = [v56 firstObject];

      v58 = v57;
      v59 = [v57 identifier];
      if (([v131 containsObject:v59] & 1) != 0
        || [v130 containsObject:v59])
      {
        int64_t v60 = -[_PSContactCache getFaceTimeIDSStatusForHandle:contactType:](self, "getFaceTimeIDSStatusForHandle:contactType:", v59, [v58 type]);
        if (v60 == 1)
        {
          v126 = v58;
          v61 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v62 = [v55 identifier];
            *(_DWORD *)buf = 138412546;
            id v154 = v59;
            __int16 v155 = 2112;
            v156 = v62;
            _os_log_impl(&dword_1A314B000, v61, OS_LOG_TYPE_DEFAULT, "Caching handle %@ for contact UUID %@", buf, 0x16u);
          }
          v63 = [v55 identifier];
          [(_PSContactCache *)self _setLikelyFaceTimeHandle:v59 forContactIdentifier:v63];

          id v20 = v59;
          int v64 = 0;
          v58 = v126;
        }
        else
        {
          int v64 = 1;
          if (!v42 && !v60)
          {
            id v42 = v59;
            uint64_t v133 = [v58 type];
          }
        }
      }
      else
      {
        v65 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          [v55 identifier];
          v67 = v66 = v58;
          *(_DWORD *)buf = 138412290;
          id v154 = v67;
          _os_log_impl(&dword_1A314B000, v65, OS_LOG_TYPE_DEFAULT, "Found previous phone iMessage interaction for best FaceTime handle, but handle no longer associated to contact %@", buf, 0xCu);

          v58 = v66;
        }

        int v64 = 1;
      }

      if (!v64)
      {
        v100 = v134;
        goto LABEL_119;
      }
      v46 = v131;
      uint64_t v51 = v134;
    }
  }
  v68 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    v69 = [v8 identifier];
    *(_DWORD *)buf = 138412290;
    id v154 = v69;
    _os_log_impl(&dword_1A314B000, v68, OS_LOG_TYPE_DEFAULT, "Checking IDS eligibility for phone numbers belong to contact UUID %@", buf, 0xCu);
  }
  v135 = v10;

  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v70 = v46;
  uint64_t v71 = [v70 countByEnumeratingWithState:&v142 objects:v151 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v143;
    do
    {
      for (uint64_t i = 0; i != v72; ++i)
      {
        if (*(void *)v143 != v73) {
          objc_enumerationMutation(v70);
        }
        v75 = *(void **)(*((void *)&v142 + 1) + 8 * i);
        int64_t v76 = [(_PSContactCache *)self getFaceTimeIDSStatusForHandle:v75 contactType:1];
        if (v76)
        {
          if (v76 == 1)
          {
            v96 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
            {
              v98 = [v8 identifier];
              *(_DWORD *)buf = 138412546;
              id v154 = v75;
              __int16 v155 = 2112;
              v156 = v98;
LABEL_79:
              _os_log_impl(&dword_1A314B000, v96, OS_LOG_TYPE_DEFAULT, "Caching handle %@ for contact UUID %@", buf, 0x16u);
            }
            goto LABEL_80;
          }
        }
        else if (!v42 || [v135 isEqualToString:v75])
        {
          id v77 = v75;

          uint64_t v133 = 1;
          id v42 = v77;
        }
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v142 objects:v151 count:16];
    }
    while (v72);
  }

  id v10 = v135;
  if ([v130 count])
  {
    v78 = [v8 identifier];
    v79 = [MEMORY[0x1E4F1C9C8] now];
    v80 = [v79 dateByAddingTimeInterval:-86400.0];
    v81 = +[_PSInteractionStoreUtils someIMessageInteractionInvolvingContactIdentifier:v78 store:v129 contactType:2 afterStartDate:v80];

    v82 = &off_1E5ADE000;
    if (!v81)
    {
LABEL_91:

      goto LABEL_92;
    }
    v83 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v84 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      id v154 = v84;
      _os_log_impl(&dword_1A314B000, v83, OS_LOG_TYPE_DEFAULT, "Found previous email iMessage interaction to cache handle for contact UUID %@", buf, 0xCu);
    }
    v85 = [v81 recipients];
    v140[0] = MEMORY[0x1E4F143A8];
    v140[1] = 3221225472;
    v140[2] = __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_70;
    v140[3] = &unk_1E5AE1030;
    id v125 = v8;
    id v141 = v125;
    v86 = objc_msgSend(v85, "_pas_filteredArrayWithTest:", v140);
    v87 = [v86 firstObject];

    v88 = [v87 identifier];
    v127 = v81;
    if (([v70 containsObject:v88] & 1) == 0
      && ![v130 containsObject:v88])
    {
      v124 = v88;
      v82 = &off_1E5ADE000;
      v101 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        [v125 identifier];
        v103 = v102 = v87;
        *(_DWORD *)buf = 138412290;
        id v154 = v103;
        _os_log_impl(&dword_1A314B000, v101, OS_LOG_TYPE_DEFAULT, "Found previous email iMessage interaction for best FaceTime handle, but handle no longer associated to contact %@", buf, 0xCu);

        v87 = v102;
      }

      int v95 = 1;
      v88 = v124;
      goto LABEL_89;
    }
    int64_t v89 = -[_PSContactCache getFaceTimeIDSStatusForHandle:contactType:](self, "getFaceTimeIDSStatusForHandle:contactType:", v88, [v87 type]);
    if (v89 == 1)
    {
      v90 = v88;
      v91 = v87;
      v92 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        v93 = [v125 identifier];
        *(_DWORD *)buf = 138412546;
        id v154 = v90;
        __int16 v155 = 2112;
        v156 = v93;
        _os_log_impl(&dword_1A314B000, v92, OS_LOG_TYPE_DEFAULT, "Caching handle %@ for contact UUID %@", buf, 0x16u);
      }
      v94 = [v125 identifier];
      v88 = v90;
      [(_PSContactCache *)self _setLikelyFaceTimeHandle:v90 forContactIdentifier:v94];

      id v20 = v90;
      int v95 = 0;
      v87 = v91;
    }
    else
    {
      int v95 = 1;
      if (!v89)
      {
        v82 = &off_1E5ADE000;
        if (!v42)
        {
          id v42 = v88;
          uint64_t v133 = 2;
        }
        goto LABEL_89;
      }
    }
    v82 = &off_1E5ADE000;
LABEL_89:

    if (v95)
    {
      v81 = v127;
      goto LABEL_91;
    }
    v100 = v127;
LABEL_119:

    goto LABEL_120;
  }
  v82 = &off_1E5ADE000;
LABEL_92:
  if ([v70 count])
  {
    if (v133 == 1)
    {
      id v20 = v42;
    }
    else
    {
      v115 = [v8 phoneNumbers];
      v116 = [v115 firstObject];
      v117 = [v116 value];
      id v20 = [v117 formattedInternationalStringValue];
    }
    v118 = [v82[172] generalChannel];
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      v119 = [v8 identifier];
      *(_DWORD *)buf = 138412546;
      id v154 = v20;
      __int16 v155 = 2112;
      v156 = v119;
      _os_log_impl(&dword_1A314B000, v118, OS_LOG_TYPE_DEFAULT, "As best effort guess, using phone number %@ for contact UUID %@", buf, 0x16u);
    }
    goto LABEL_120;
  }
  v104 = [v82[172] generalChannel];
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    v105 = [v8 identifier];
    *(_DWORD *)buf = 138412290;
    id v154 = v105;
    _os_log_impl(&dword_1A314B000, v104, OS_LOG_TYPE_DEFAULT, "Checking IDS eligibility for emails belong to contact UUID %@", buf, 0xCu);
  }
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v70 = v130;
  uint64_t v106 = [v70 countByEnumeratingWithState:&v136 objects:v150 count:16];
  if (!v106)
  {
LABEL_110:

    v112 = +[_PSLogging generalChannel];
    BOOL v113 = os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT);
    if (v42)
    {
      id v10 = v135;
      if (v113)
      {
        v114 = [v8 identifier];
        *(_DWORD *)buf = 138412546;
        id v154 = v42;
        __int16 v155 = 2112;
        v156 = v114;
        _os_log_impl(&dword_1A314B000, v112, OS_LOG_TYPE_DEFAULT, "Caching fallback handle %@ for contact UUID %@", buf, 0x16u);
      }
      id v42 = v42;
      id v20 = v42;
    }
    else
    {
      id v10 = v135;
      if (v113)
      {
        v122 = [v8 identifier];
        *(_DWORD *)buf = 138412546;
        id v154 = 0;
        __int16 v155 = 2112;
        v156 = v122;
        _os_log_impl(&dword_1A314B000, v112, OS_LOG_TYPE_DEFAULT, "Caching handle %@ for contact UUID %@", buf, 0x16u);
      }
      v123 = [v8 identifier];
      [(_PSContactCache *)self _setLikelyFaceTimeHandle:0 forContactIdentifier:v123];

      id v42 = 0;
      id v20 = 0;
    }
    goto LABEL_120;
  }
  uint64_t v107 = v106;
  uint64_t v108 = *(void *)v137;
LABEL_99:
  uint64_t v109 = 0;
  while (1)
  {
    if (*(void *)v137 != v108) {
      objc_enumerationMutation(v70);
    }
    v75 = *(void **)(*((void *)&v136 + 1) + 8 * v109);
    int64_t v110 = [(_PSContactCache *)self getFaceTimeIDSStatusForHandle:v75 contactType:1];
    if (!v110)
    {
      if (!v42 || [v135 isEqualToString:v75])
      {
        id v111 = v75;

        id v42 = v111;
      }
      goto LABEL_108;
    }
    if (v110 == 1) {
      break;
    }
LABEL_108:
    if (v107 == ++v109)
    {
      uint64_t v107 = [v70 countByEnumeratingWithState:&v136 objects:v150 count:16];
      if (v107) {
        goto LABEL_99;
      }
      goto LABEL_110;
    }
  }
  v96 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    v98 = [v8 identifier];
    *(_DWORD *)buf = 138412546;
    id v154 = v75;
    __int16 v155 = 2112;
    v156 = v98;
    goto LABEL_79;
  }
LABEL_80:

  v99 = [v8 identifier];
  [(_PSContactCache *)self _setLikelyFaceTimeHandle:v75 forContactIdentifier:v99];

  id v20 = v75;
  id v10 = v135;
LABEL_120:

  id v9 = v129;
  id v14 = v130;
  id v12 = v131;
  long long v24 = 0;
LABEL_121:

LABEL_122:
LABEL_123:

  return v20;
}

- (int64_t)getFaceTimeIDSStatusForHandle:(id)a3 contactType:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    int64_t v7 = 1;
    goto LABEL_16;
  }
  if (a4 - 3 < 0xFFFFFFFFFFFFFFFELL)
  {
    int64_t v7 = 2;
    goto LABEL_16;
  }
  id v8 = v6;
  if (a4 == 1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    id v9 = (uint64_t (*)(id))getIDSCopyIDForPhoneNumberSymbolLoc_ptr;
    id v20 = getIDSCopyIDForPhoneNumberSymbolLoc_ptr;
    if (!getIDSCopyIDForPhoneNumberSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getIDSCopyIDForPhoneNumberSymbolLoc_block_invoke;
      v22 = &unk_1E5ADE858;
      v23 = &v17;
      id v10 = (void *)IDSLibrary();
      uint64_t v11 = dlsym(v10, "IDSCopyIDForPhoneNumber");
      *(void *)(v23[1] + 24) = v11;
      getIDSCopyIDForPhoneNumberSymbolLoc_ptr = *(_UNKNOWN **)(v23[1] + 24);
      id v9 = (uint64_t (*)(id))v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v9) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    id v9 = (uint64_t (*)(id))getIDSCopyIDForEmailAddressSymbolLoc_ptr;
    id v20 = (void *)getIDSCopyIDForEmailAddressSymbolLoc_ptr;
    if (!getIDSCopyIDForEmailAddressSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getIDSCopyIDForEmailAddressSymbolLoc_block_invoke;
      v22 = &unk_1E5ADE858;
      v23 = &v17;
      id v12 = (void *)IDSLibrary();
      uint64_t v13 = dlsym(v12, "IDSCopyIDForEmailAddress");
      *(void *)(v23[1] + 24) = v13;
      getIDSCopyIDForEmailAddressSymbolLoc_ptr = *(void *)(v23[1] + 24);
      id v9 = (uint64_t (*)(id))v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v9)
    {
LABEL_17:
      -[_PSBlockedHandlesCache beginSyncingWithTU]();
      __break(1u);
    }
  }
  id v14 = (void *)v9(v8);

  int64_t v7 = [(IDSIDQueryController *)self->_idsQueryController _currentIDStatusForDestination:v14, self->_faceTimeServiceName, 0, @"com.apple.PeopleSuggester.IDSListener", v17 service respectExpiry listenerID];
  uint64_t v15 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_INFO, "Handle %@ received IDS status %ld", buf, 0x16u);
  }

LABEL_16:
  return v7;
}

- (id)getMeContact
{
  uint64_t v3 = [(_PSContactCache *)self _getCachedContactForHandle:@"kMeSentinelString"];
  if (v3)
  {
    uint64_t v4 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[_PSContactCache getMeContact]();
    }

    uint64_t v5 = [v3 contact];
  }
  else
  {
    uint64_t v5 = [(_PSContactCache *)self fetchMeContact];
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)getContactForHandle:(id)a3 handleType:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v11 = 0;
    goto LABEL_30;
  }
  int64_t v7 = v6;
  id v8 = [MEMORY[0x1E4F5B3B0] normalizedStringFromContactString:v6];

  id v9 = [(_PSContactCache *)self _getCachedContactForHandle:v8];
  if (!v9)
  {
    switch(a4)
    {
      case 2:
        id CNContactClass_3 = getCNContactClass_3();
        uint64_t v31 = 0;
        v32 = &v31;
        uint64_t v33 = 0x2050000000;
        uint64_t v18 = (void *)getCNPhoneNumberClass_softClass_3;
        uint64_t v34 = getCNPhoneNumberClass_softClass_3;
        if (!getCNPhoneNumberClass_softClass_3)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getCNPhoneNumberClass_block_invoke_3;
          v36 = &unk_1E5ADE858;
          int64_t v37 = &v31;
          ContactsLibraryCore_8();
          Class Class = objc_getClass("CNPhoneNumber");
          *(void *)(v37[1] + 24) = Class;
          getCNPhoneNumberClass_softClass_3 = *(void *)(v37[1] + 24);
          uint64_t v18 = (void *)v32[3];
        }
        id v20 = v18;
        _Block_object_dispose(&v31, 8);
        uint64_t v21 = [v20 phoneNumberWithStringValue:v8];
        uint64_t v16 = [CNContactClass_3 predicateForContactsMatchingPhoneNumber:v21];

        break;
      case 1:
        uint64_t v16 = [getCNContactClass_3() predicateForContactsMatchingEmailAddress:v8];
        break;
      case 0:
        contactStore = self->_contactStore;
        uint64_t v13 = [(_PSContactCache *)self contactKeysToFetch];
        id v30 = 0;
        id v14 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:v8 keysToFetch:v13 error:&v30];
        id v15 = v30;

        uint64_t v16 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412803;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2117;
          *(void *)&buf[14] = v14;
          *(_WORD *)&buf[22] = 2112;
          v36 = v15;
          _os_log_impl(&dword_1A314B000, v16, OS_LOG_TYPE_DEFAULT, "_PSContactCache: ZKW FaceTime suggestions attempted to lookup contact for uuid %@, found contact %{sensitive}@, error %@", buf, 0x20u);
        }
LABEL_22:

        if (!v14 || v15)
        {
          long long v27 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v8;
            _os_log_impl(&dword_1A314B000, v27, OS_LOG_TYPE_DEFAULT, "_PSContactCache: Unable to find contact for handle %@, caching nil", buf, 0xCu);
          }

          [(_PSContactCache *)self _setContact:0 forHandle:v8];
          id v11 = 0;
        }
        else
        {
          [(_PSContactCache *)self _setContact:v14];
          id v11 = v14;
        }

        goto LABEL_29;
      default:
        v22 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[_PSContactCache getContactForHandle:handleType:]();
        }

        uint64_t v16 = 0;
        break;
    }
    v23 = self->_contactStore;
    uint64_t v24 = [(_PSContactCache *)self contactKeysToFetch];
    id v29 = 0;
    long long v25 = [(CNContactStore *)v23 unifiedContactsMatchingPredicate:v16 keysToFetch:v24 error:&v29];
    id v15 = v29;

    long long v26 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412803;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2117;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2112;
      v36 = v15;
      _os_log_impl(&dword_1A314B000, v26, OS_LOG_TYPE_DEFAULT, "_PSContactCache: ZKW FaceTime suggestions attempted to lookup contact for handle %@, found contacts %{sensitive}@, error %@", buf, 0x20u);
    }

    id v14 = [v25 firstObject];

    goto LABEL_22;
  }
  id v10 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_PSContactCache getContactForHandle:handleType:]();
  }

  id v11 = [v9 contact];
LABEL_29:

LABEL_30:

  return v11;
}

- (id)contactKeysToFetch
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000;
  uint64_t v2 = (void *)getCNContactFormatterClass_softClass_5;
  uint64_t v18 = getCNContactFormatterClass_softClass_5;
  if (!getCNContactFormatterClass_softClass_5)
  {
    ContactsLibraryCore_8();
    v16[3] = (uint64_t)objc_getClass("CNContactFormatter");
    getCNContactFormatterClass_softClass_5 = v16[3];
    uint64_t v2 = (void *)v16[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v15, 8);
  uint64_t v4 = [v3 descriptorForRequiredKeysForStyle:0];
  uint64_t v5 = getCNContactIdentifierKey_4();
  v19[0] = v5;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v6 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_6;
  uint64_t v18 = getCNContactPhoneNumbersKeySymbolLoc_ptr_6;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_6)
  {
    int64_t v7 = (void *)ContactsLibrary_7();
    v16[3] = (uint64_t)dlsym(v7, "CNContactPhoneNumbersKey");
    getCNContactPhoneNumbersKeySymbolLoc_ptr_6 = v16[3];
    id v6 = (id *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v6) {
    goto LABEL_12;
  }
  id v8 = *v6;
  v19[1] = v8;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v9 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_6;
  uint64_t v18 = getCNContactEmailAddressesKeySymbolLoc_ptr_6;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_6)
  {
    id v10 = (void *)ContactsLibrary_7();
    v16[3] = (uint64_t)dlsym(v10, "CNContactEmailAddressesKey");
    getCNContactEmailAddressesKeySymbolLoc_ptr_6 = v16[3];
    id v9 = (id *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v9)
  {
LABEL_12:
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  id v20 = *v9;
  uint64_t v21 = v4;
  id v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = v20;
  uint64_t v13 = [v11 arrayWithObjects:v19 count:4];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTimeServiceName, 0);
  objc_storeStrong((id *)&self->_idsQueryController, 0);
  objc_storeStrong((id *)&self->_cachedFaceTimeableHandleForContactIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedContactForHandle, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenterToken, 0);
  objc_storeStrong((id *)&self->_changeHistoryToken, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)visitAddContactEvent:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSContactCache: Processing Add Contact change history event from ContactStore.", v2, v3, v4, v5, v6);
}

- (void)visitUpdateContactEvent:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSContactCache: Processing Update Contact change history event from ContactStore.", v2, v3, v4, v5, v6);
}

- (void)visitDeleteContactEvent:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSContactCache: Processing Delete Contact change history event from ContactStore.", v2, v3, v4, v5, v6);
}

- (void)fetchMeContact
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error fetching me contact from store in _PSContactCache: %@", v2, v3, v4, v5, v6);
}

- (void)getMeContact
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSContactCache: Returning cached contact for me", v2, v3, v4, v5, v6);
}

- (void)getContactForHandle:handleType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "_PSContactCache: Unknown handle type %ld", v2, v3, v4, v5, v6);
}

- (void)getContactForHandle:handleType:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "_PSContactCache: Returning cached contact for %@", v1, 0xCu);
}

@end