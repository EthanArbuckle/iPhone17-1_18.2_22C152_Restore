@interface PPNotificationManager
+ (BOOL)_changePotentiallyAffectsCache:(id)a3;
+ (id)addCalendarVisibilityObserverForLifetimeOfObject:(id)a3 block:(id)a4;
+ (id)sharedInstance;
+ (void)addContactsObserverForLifetimeOfObject:(id)a3 block:(id)a4;
+ (void)addEventKitObserverForLifetimeOfObject:(id)a3 block:(id)a4;
+ (void)addMeCardObserverForLifetimeOfObject:(id)a3 block:(id)a4;
+ (void)addPortraitChangeObserverForLifetimeOfObject:(id)a3 block:(id)a4;
+ (void)addPortraitInvalidationObserverForLifetimeOfObject:(id)a3 block:(id)a4;
+ (void)addSuggestionsObserverForLifetimeOfObject:(id)a3 block:(id)a4;
- (PPNotificationManager)initWithQueueName:(const char *)a3 notificationCenter:(id)a4;
- (id)addCalendarVisibilityChangeBlock:(id)a3 forLifetimeOfObject:(id)a4;
- (void)_registerForEventKitChangeTrackingWithGuardedData:(id)a3;
- (void)addContactsChangeBlock:(id)a3 forLifetimeOfObject:(id)a4;
- (void)addEventKitChangeBlock:(id)a3 forLifetimeOfObject:(id)a4;
- (void)addMeCardChangeBlock:(id)a3 forLifetimeOfObject:(id)a4;
- (void)addPortraitChangeBlock:(id)a3 forLifetimeOfObject:(id)a4;
- (void)addPortraitInvalidationBlock:(id)a3 forLifetimeOfObject:(id)a4;
- (void)addSuggestionsChangeBlock:(id)a3 forLifetimeOfObject:(id)a4;
- (void)dealloc;
- (void)fetchObjectChangesFromStore:(id)a3 usingBlock:(id)a4;
- (void)setEKStore:(id)a3;
- (void)simulatePortraitChange;
- (void)simulatePortraitInvalidation;
- (void)stopListening;
- (void)waitOnQueueToDrain;
@end

@implementation PPNotificationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_lockedData, 0);
}

- (void)addSuggestionsChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E550F218;
  id v12 = v7;
  id v13 = v6;
  v11[4] = self;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)lockedData runWithLockAcquired:v11];
}

void __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (!v3[17])
  {
    v4 = [[PPNotificationHandler alloc] initWithName:@"suggestions" waitSeconds:10.0];
    v5 = (void *)v3[17];
    v3[17] = v4;
  }
  if (!v3[16])
  {
    uint64_t v6 = [MEMORY[0x1E4F5DB70] serviceForContacts];
    id v7 = (void *)v3[16];
    v3[16] = v6;
  }
  if (!v3[18])
  {
    v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_INFO, "PPNotificationManager registering for Found in Apps changes", buf, 2u);
    }

    *(void *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v9 = (void *)v3[16];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_221;
    v18[3] = &unk_1E550F390;
    objc_copyWeak(&v19, (id *)buf);
    uint64_t v10 = [v9 registerContactsChangeObserver:v18];
    v11 = (void *)v3[18];
    v3[18] = v10;

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  id v12 = (void *)[*(id *)(a1 + 48) copy];
  id v13 = (void *)v3[17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_4;
  v16[3] = &unk_1E550F1F0;
  id v17 = v12;
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = v12;
  [v13 addObserverBlock:v16 forLifetimeOfObject:v14];
}

void __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_221(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_2;
    block[3] = &unk_1E550F488;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }
}

uint64_t __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] runWithLockAcquired:&__block_literal_global_223];
    WeakRetained = v2;
  }
}

uint64_t __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 136) fireWithObjects:0];
}

- (id)addCalendarVisibilityChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6355;
  v21 = __Block_byref_object_dispose__6356;
  id v22 = 0;
  lockedData = self->_lockedData;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke;
  v13[3] = &unk_1E550F368;
  v13[4] = self;
  v16 = &v17;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v14 = v10;
  [(_PASLock *)lockedData runWithLockAcquired:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (!v3[14])
  {
    v4 = [[PPNotificationHandler alloc] initWithName:@"calendars" waitSeconds:10.0];
    v5 = (void *)v3[14];
    v3[14] = v4;
  }
  if (!v3[13])
  {
    uint64_t v6 = PPNewEKEventStore();
    id v7 = (void *)v3[13];
    v3[13] = v6;
  }
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = (void *)v3[15];
  if (!v8)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    id v9 = (void *)getEKCalendarVisibilityManagerClass_softClass;
    uint64_t v28 = getEKCalendarVisibilityManagerClass_softClass;
    if (!getEKCalendarVisibilityManagerClass_softClass)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __getEKCalendarVisibilityManagerClass_block_invoke;
      v24[3] = &unk_1E550F408;
      v24[4] = &v25;
      __getEKCalendarVisibilityManagerClass_block_invoke((uint64_t)v24);
      id v9 = (void *)v26[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v25, 8);
    id v11 = [v10 alloc];
    uint64_t v12 = v3[13];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_2;
    v21[3] = &unk_1E550F488;
    objc_copyWeak(&v22, &location);
    uint64_t v13 = [v11 initWithEventStore:v12 visibilityChangedCallback:v21 queue:*(void *)(*(void *)(a1 + 32) + 16)];
    id v14 = (void *)v3[15];
    v3[15] = v13;

    objc_destroyWeak(&v22);
    v8 = (void *)v3[15];
  }
  id v15 = [v8 invisibleCalendars];
  uint64_t v16 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_217);
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  uint64_t v19 = (void *)v3[14];
  v20 = (void *)[*(id *)(a1 + 48) copy];
  [v19 addObserverBlock:v20 forLifetimeOfObject:*(void *)(a1 + 40)];

  objc_destroyWeak(&location);
}

void __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_3;
    block[3] = &unk_1E550F7E0;
    v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

id __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 calendarIdentifier];
  v3 = (void *)[v2 copy];

  return v3;
}

uint64_t __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) runWithLockAcquired:&__block_literal_global_212];
}

void __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 112);
  id v4 = [*(id *)(a2 + 120) invisibleCalendars];
  v3 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_215);
  [v2 fireWithObjects:v3];
}

id __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 calendarIdentifier];
  v3 = (void *)[v2 copy];

  return v3;
}

- (void)_registerForEventKitChangeTrackingWithGuardedData:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)*((void *)a3 + 13);
  id v7 = 0;
  uint64_t v4 = [v3 registerForDetailedChangeTracking:&v7];
  id v5 = v7;
  if (v4 == -1)
  {
    uint64_t v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_ERROR, "PPNotificationManager failed to register for detailed EK change tracking: %@", buf, 0xCu);
    }
  }
}

- (void)addEventKitChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E550F218;
  id v12 = v7;
  id v13 = v6;
  v11[4] = self;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)lockedData runWithLockAcquired:v11];
}

void __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*((void *)v3 + 11))
  {
    uint64_t v4 = [[PPNotificationHandler alloc] initWithName:@"events" waitSeconds:0.0];
    id v5 = (void *)*((void *)v3 + 11);
    *((void *)v3 + 11) = v4;
  }
  if (!*((void *)v3 + 13))
  {
    uint64_t v6 = PPNewEKEventStore();
    id v7 = (void *)*((void *)v3 + 13);
    *((void *)v3 + 13) = v6;
  }
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (!*((void *)v3 + 12))
  {
    [*(id *)(a1 + 32) _registerForEventKitChangeTrackingWithGuardedData:v3];
    [*((id *)v3 + 13) reset];
    v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *((void *)v3 + 13);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_INFO, "PPNotificationManager registering for event changes from %@", (uint8_t *)&buf, 0xCu);
    }

    id v10 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    id v11 = (id *)getEKEventStoreChangedNotificationSymbolLoc_ptr;
    uint64_t v28 = getEKEventStoreChangedNotificationSymbolLoc_ptr;
    if (!getEKEventStoreChangedNotificationSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v30 = __getEKEventStoreChangedNotificationSymbolLoc_block_invoke;
      v31 = &unk_1E550F408;
      v32 = &v25;
      id v12 = EventKitLibrary();
      id v13 = dlsym(v12, "EKEventStoreChangedNotification");
      *(void *)(v32[1] + 24) = v13;
      getEKEventStoreChangedNotificationSymbolLoc_ptr = *(void *)(v32[1] + 24);
      id v11 = (id *)v26[3];
    }
    _Block_object_dispose(&v25, 8);
    if (!v11)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      v21 = [NSString stringWithUTF8String:"NSString *getEKEventStoreChangedNotification(void)"];
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"PPNotificationManager.m", 38, @"%s", dlerror());

      __break(1u);
    }
    id v14 = *v11;
    uint64_t v15 = *((void *)v3 + 13);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_181;
    v22[3] = &unk_1E550F1C8;
    objc_copyWeak(&v23, &location);
    uint64_t v16 = [v10 addObserverForName:v14 object:v15 queue:0 usingBlock:v22];
    uint64_t v17 = (void *)*((void *)v3 + 12);
    *((void *)v3 + 12) = v16;

    objc_destroyWeak(&v23);
  }
  v18 = (void *)*((void *)v3 + 11);
  uint64_t v19 = (void *)[*(id *)(a1 + 48) copy];
  [v18 addObserverBlock:v19 forLifetimeOfObject:*(void *)(a1 + 40)];

  objc_destroyWeak(&location);
}

void __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_181(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)os_transaction_create();
  id v5 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_2;
    block[3] = &unk_1E550F320;
    objc_copyWeak(&v12, v5);
    id v10 = v4;
    id v11 = v3;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
  }
}

void __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_2(id *a1)
{
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
LABEL_19:

    return;
  }
  id v4 = a1[4];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  id v5 = (id *)getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_ptr;
  uint64_t v33 = (uint64_t (*)(uint64_t, uint64_t))getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_ptr;
  if (!getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_ptr)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    uint64_t v38 = (uint64_t)__getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_block_invoke;
    v39 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E550F408;
    v40 = (void (*)(uint64_t))&v30;
    uint64_t v6 = EventKitLibrary();
    id v7 = dlsym(v6, "EKEventStoreCalendarDataChangedUserInfoKey");
    *(void *)(*((void *)v40 + 1) + 24) = v7;
    getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_ptr = *(void *)(*((void *)v40 + 1) + 24);
    id v5 = (id *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (v5)
  {
    id v8 = *v5;
    if (v8
      && ([a1[5] userInfo],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          [v9 objectForKeyedSubscript:v8],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 BOOLValue],
          v10,
          v9,
          (v11 & 1) == 0))
    {
      id v13 = pp_default_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18CAA6000, v13, OS_LOG_TYPE_INFO, "PPNotificationManager ignoring non-Calendar EK change", buf, 2u);
      }
    }
    else
    {
      *(void *)long long buf = 0;
      uint64_t v37 = (uint64_t)buf;
      uint64_t v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__6355;
      v40 = __Block_byref_object_dispose__6356;
      id v41 = 0;
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x3032000000;
      uint64_t v33 = __Block_byref_object_copy__6355;
      v34 = __Block_byref_object_dispose__6356;
      id v35 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = &v26;
      uint64_t v28 = 0x2020000000;
      char v29 = 0;
      id v12 = (void *)WeakRetained[1];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_183;
      v20[3] = &unk_1E550F2D8;
      id v22 = buf;
      objc_copyWeak(&v25, v2);
      id v23 = &v26;
      v24 = &v30;
      v21 = WeakRetained;
      [v12 runWithLockAcquired:v20];
      if (*((unsigned char *)v27 + 24))
      {
        [*(id *)(v37 + 40) fireWithObjects:MEMORY[0x1E4F1CBF0]];
      }
      else
      {
        uint64_t v14 = objc_msgSend((id)v31[5], "_pas_filteredArrayWithTest:", &__block_literal_global_207);
        uint64_t v15 = (void *)v31[5];
        v31[5] = v14;

        if ([(id)v31[5] count])
        {
          [*(id *)(v37 + 40) fireWithObjects:v31[5]];
        }
        else
        {
          uint64_t v16 = pp_default_log_handle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v19 = 0;
            _os_log_impl(&dword_18CAA6000, v16, OS_LOG_TYPE_DEFAULT, "PPNotificationManager: received empty arrays from EK change tracking", v19, 2u);
          }
        }
      }

      objc_destroyWeak(&v25);
      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v30, 8);

      _Block_object_dispose(buf, 8);
    }

    goto LABEL_19;
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  v18 = [NSString stringWithUTF8String:"NSString *getEKEventStoreCalendarDataChangedUserInfoKey(void)"];
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PPNotificationManager.m", 39, @"%s", dlerror());

  __break(1u);
}

void __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_183(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3[11]);
  if (v3[13])
  {
    *(void *)&long long v17 = 0;
    *((void *)&v17 + 1) = &v17;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__6355;
    v20 = __Block_byref_object_dispose__6356;
    id v21 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v5 = v3[13];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_184;
    v14[3] = &unk_1E550F290;
    uint64_t v6 = *(void *)(a1 + 56);
    v14[4] = *(void *)(a1 + 48);
    v14[5] = &v17;
    v14[6] = v6;
    id v7 = (void *)MEMORY[0x192F975A0](v14);
    [WeakRetained fetchObjectChangesFromStore:v5 usingBlock:v7];

    LODWORD(v5) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v8 = pp_default_log_handle();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_DEFAULT, "PPNotificationManager: EK changes truncated.", buf, 2u);
      }

      [*(id *)(a1 + 32) _registerForEventKitChangeTrackingWithGuardedData:v3];
    }
    else
    {
      if (v9)
      {
        char v11 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        id v12 = objc_opt_new();
        id v13 = objc_msgSend(v11, "_pas_leftFoldWithInitialObject:accumulate:", v12, &__block_literal_global_190);

        *(_DWORD *)long long buf = 138543362;
        uint64_t v16 = v13;
        _os_log_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_DEFAULT, "PPNotificationManager received EK changes: %{public}@", buf, 0xCu);
      }
      [v3[13] consumeAllChangesUpToToken:*(void *)(*((void *)&v17 + 1) + 40)];
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v17) = 138412290;
      *(void *)((char *)&v17 + 4) = v3;
      _os_log_fault_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_FAULT, "PPNotificationManager: EK store is nil when handling EK change: %@", (uint8_t *)&v17, 0xCu);
    }
  }
}

BOOL __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_204(uint64_t a1, uint64_t a2)
{
  return +[PPNotificationManager _changePotentiallyAffectsCache:a2];
}

void __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_184(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

id __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_187(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [v5 changeType];
  if (v6 >= 3) {
    id v7 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"EKChangeType[%u]", objc_msgSend(v5, "changeType"));
  }
  else {
    id v7 = off_1E550F440[v6];
  }
  id v8 = NSNumber;
  uint64_t v9 = [v4 objectForKeyedSubscript:v7];
  id v10 = v9;
  if (!v9) {
    uint64_t v9 = &unk_1EDA6B4E8;
  }
  uint64_t v11 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
  [v4 setObject:v11 forKeyedSubscript:v7];

  return v4;
}

- (void)fetchObjectChangesFromStore:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v8 = (void *)getEKObjectChangeClass_softClass;
  uint64_t v21 = getEKObjectChangeClass_softClass;
  if (!getEKObjectChangeClass_softClass)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getEKObjectChangeClass_block_invoke;
    v17[3] = &unk_1E550F408;
    v17[4] = &v18;
    __getEKObjectChangeClass_block_invoke((uint64_t)v17);
    id v8 = (void *)v19[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v18, 8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PPNotificationManager_fetchObjectChangesFromStore_usingBlock___block_invoke;
  v14[3] = &unk_1E550F268;
  id v10 = v6;
  id v16 = v10;
  uint64_t v11 = v7;
  uint64_t v15 = v11;
  [v9 objectChangesInStore:v5 resultHandler:v14];
  if (dispatch_semaphore_wait(v11, 0))
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"-[PPNotificationManager fetchObjectChangesFromStore:usingBlock:]"];
    [v12 handleFailureInFunction:v13 file:@"PPNotificationManager.m" lineNumber:548 description:@"+[EKObjectChange objectChangesInStore:resultHandler:] is expected to be synchronous"];
  }
}

intptr_t __64__PPNotificationManager_fetchObjectChangesFromStore_usingBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v2);
}

- (void)addPortraitInvalidationBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E550F218;
  id v12 = v7;
  id v13 = v6;
  v11[4] = self;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)lockedData runWithLockAcquired:v11];
}

void __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*((void *)v3 + 9))
  {
    id v4 = [[PPNotificationHandler alloc] initWithName:@"portraitInvalidation" waitSeconds:10.0];
    id v5 = (void *)*((void *)v3 + 9);
    *((void *)v3 + 9) = v4;
  }
  if (!*((_DWORD *)v3 + 20))
  {
    id v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_INFO, "PPNotificationManager registering for Portrait invalidations", buf, 2u);
    }

    *(void *)long long buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke_170;
    handler[3] = &unk_1E550F240;
    objc_copyWeak(&v17, (id *)buf);
    if (notify_register_dispatch("com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated", (int *)v3 + 20, v7, handler))
    {
      id v8 = pp_default_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_DEFAULT, "PP failed to register for Portrait entity invalidation notifications", v15, 2u);
      }
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  id v9 = (void *)[*(id *)(a1 + 48) copy];
  id v10 = (void *)*((void *)v3 + 9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke_173;
  v13[3] = &unk_1E550F1F0;
  id v14 = v9;
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v9;
  [v10 addObserverBlock:v13 forLifetimeOfObject:v11];
}

void __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke_170(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] runWithLockAcquired:&__block_literal_global_172];
    id WeakRetained = v2;
  }
}

uint64_t __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke_173(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 72) fireWithObjects:0];
}

- (void)addPortraitChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E550F218;
  id v12 = v7;
  id v13 = v6;
  v11[4] = self;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)lockedData runWithLockAcquired:v11];
}

void __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*((void *)v3 + 7))
  {
    id v4 = [[PPNotificationHandler alloc] initWithName:@"portraitChange" waitSeconds:3.0];
    id v5 = (void *)*((void *)v3 + 7);
    *((void *)v3 + 7) = v4;
  }
  if (!*((_DWORD *)v3 + 16))
  {
    id v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_INFO, "PPNotificationManager registering for Portrait changes", buf, 2u);
    }

    *(void *)long long buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke_161;
    handler[3] = &unk_1E550F240;
    objc_copyWeak(&v17, (id *)buf);
    if (notify_register_dispatch("com.apple.proactive.PersonalizationPortrait.namedEntitiesDidChangeMeaningfully", (int *)v3 + 16, v7, handler))
    {
      id v8 = pp_default_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_DEFAULT, "PP failed to register for Portrait entity change notifications", v15, 2u);
      }
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  id v9 = (void *)[*(id *)(a1 + 48) copy];
  id v10 = (void *)*((void *)v3 + 7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke_165;
  v13[3] = &unk_1E550F1F0;
  id v14 = v9;
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v9;
  [v10 addObserverBlock:v13 forLifetimeOfObject:v11];
}

void __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke_161(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] runWithLockAcquired:&__block_literal_global_163];
    id WeakRetained = v2;
  }
}

uint64_t __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke_165(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 56) fireWithObjects:0];
}

- (void)addMeCardChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E550F218;
  id v12 = v7;
  id v13 = v6;
  v11[4] = self;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)lockedData runWithLockAcquired:v11];
}

void __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3[4])
  {
    id v4 = [[PPNotificationHandler alloc] initWithName:@"meCard" waitSeconds:10.0];
    id v5 = (void *)v3[4];
    v3[4] = v4;
  }
  if (!v3[3])
  {
    uint64_t v6 = PPSharedCNContactStore();
    id v7 = (void *)v3[3];
    v3[3] = v6;
  }
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (!v3[5])
  {
    id v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_INFO, "PPNotificationManager registering for Me card changes", buf, 2u);
    }

    id v9 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v10 = *MEMORY[0x1E4F1AF88];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_148;
    v25[3] = &unk_1E550F1C8;
    objc_copyWeak(&v26, &location);
    uint64_t v11 = [v9 addObserverForName:v10 object:0 queue:0 usingBlock:v25];
    id v12 = (void *)v3[5];
    v3[5] = v11;

    objc_destroyWeak(&v26);
  }
  if (!v3[6])
  {
    id v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18CAA6000, v13, OS_LOG_TYPE_INFO, "PPNotificationManager registering for Me card donations", buf, 2u);
    }

    id v14 = [MEMORY[0x1E4F28C40] defaultCenter];
    uint64_t v15 = *MEMORY[0x1E4F5A180];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_152;
    v23[3] = &unk_1E550F1C8;
    objc_copyWeak(&v24, &location);
    uint64_t v16 = [v14 addObserverForName:v15 object:0 queue:0 usingBlock:v23];
    id v17 = (void *)v3[6];
    v3[6] = v16;

    objc_destroyWeak(&v24);
  }
  uint64_t v18 = (void *)[*(id *)(a1 + 48) copy];
  uint64_t v19 = (void *)v3[4];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_4;
  v21[3] = &unk_1E550F1F0;
  id v20 = v18;
  id v22 = v20;
  [v19 addObserverBlock:v21 forLifetimeOfObject:*(void *)(a1 + 40)];

  objc_destroyWeak(&location);
}

void __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_148(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_2;
    block[3] = &unk_1E550F488;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }
}

void __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_152(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_2_153;
    block[3] = &unk_1E550F488;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }
}

uint64_t __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_2_153(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] runWithLockAcquired:&__block_literal_global_156_6419];
    id WeakRetained = v2;
  }
}

uint64_t __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_3_154(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 32) fireWithObjects:0];
}

void __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] runWithLockAcquired:&__block_literal_global_150];
    id WeakRetained = v2;
  }
}

uint64_t __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 32) fireWithObjects:0];
}

- (void)addContactsChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E550F218;
  id v12 = v7;
  id v13 = v6;
  v11[4] = self;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)lockedData runWithLockAcquired:v11];
}

void __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3[3])
  {
    uint64_t v4 = PPSharedCNContactStore();
    id v5 = (void *)v3[3];
    v3[3] = v4;
  }
  if (!v3[1])
  {
    id v6 = [[PPNotificationHandler alloc] initWithName:@"contacts" waitSeconds:10.0];
    id v7 = (void *)v3[1];
    v3[1] = v6;
  }
  if (!v3[2])
  {
    id v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_INFO, "PPNotificationManager registering for contacts changes", buf, 2u);
    }

    *(void *)long long buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v9 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v10 = *MEMORY[0x1E4F1AF80];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_140;
    v19[3] = &unk_1E550F1C8;
    objc_copyWeak(&v20, (id *)buf);
    uint64_t v11 = [v9 addObserverForName:v10 object:0 queue:0 usingBlock:v19];
    id v12 = (void *)v3[2];
    v3[2] = v11;

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  id v13 = (void *)[*(id *)(a1 + 48) copy];
  id v14 = (void *)v3[1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_4;
  v17[3] = &unk_1E550F1F0;
  id v18 = v13;
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = v13;
  [v14 addObserverBlock:v17 forLifetimeOfObject:v15];
}

void __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_140(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_2;
    block[3] = &unk_1E550F488;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }
}

uint64_t __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] runWithLockAcquired:&__block_literal_global_142];
    id WeakRetained = v2;
  }
}

uint64_t __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) fireWithObjects:0];
}

- (void)stopListening
{
  lockedData = self->_lockedData;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__PPNotificationManager_stopListening__block_invoke;
  v3[3] = &unk_1E550F180;
  v3[4] = self;
  [(_PASLock *)lockedData runWithLockAcquired:v3];
}

void __38__PPNotificationManager_stopListening__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_18CAA6000, v4, OS_LOG_TYPE_INFO, "PPNotificationManager stopping listening", v12, 2u);
  }

  if (*((void *)v3 + 2))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObserver:");
    id v5 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = 0;
  }
  if (*((void *)v3 + 5))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObserver:");
    id v6 = (void *)*((void *)v3 + 5);
    *((void *)v3 + 5) = 0;
  }
  if (*((void *)v3 + 6))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObserver:");
    id v7 = (void *)*((void *)v3 + 6);
    *((void *)v3 + 6) = 0;
  }
  if (*((void *)v3 + 12))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObserver:");
    id v8 = (void *)*((void *)v3 + 12);
    *((void *)v3 + 12) = 0;
  }
  if (*((void *)v3 + 18))
  {
    objc_msgSend(*((id *)v3 + 16), "deregisterContactsChangeObserverWithToken:");
    id v9 = (void *)*((void *)v3 + 18);
    *((void *)v3 + 18) = 0;
  }
  int v10 = *((_DWORD *)v3 + 16);
  if (v10)
  {
    notify_cancel(v10);
    *((_DWORD *)v3 + 16) = 0;
  }
  int v11 = *((_DWORD *)v3 + 20);
  if (v11)
  {
    notify_cancel(v11);
    *((_DWORD *)v3 + 20) = 0;
  }
}

- (void)dealloc
{
  [(PPNotificationManager *)self stopListening];
  v3.receiver = self;
  v3.super_class = (Class)PPNotificationManager;
  [(PPNotificationManager *)&v3 dealloc];
}

- (PPNotificationManager)initWithQueueName:(const char *)a3 notificationCenter:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPNotificationManager;
  id v8 = [(PPNotificationManager *)&v16 init];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F93B70]);
    int v10 = objc_opt_new();
    uint64_t v11 = [v9 initWithGuardedData:v10];
    lockedData = v8->_lockedData;
    v8->_lockedData = (_PASLock *)v11;

    uint64_t v13 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:a3 qosClass:9];
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v8->_notificationCenter, a4);
  }

  return v8;
}

- (void)setEKStore:(id)a3
{
  id v5 = a3;
  lockedData = self->_lockedData;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__PPNotificationManager_setEKStore___block_invoke;
  v8[3] = &unk_1E550F158;
  id v9 = v5;
  SEL v10 = a2;
  v8[4] = self;
  id v7 = v5;
  [(_PASLock *)lockedData runWithLockAcquired:v8];
}

void __36__PPNotificationManager_setEKStore___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_super v3 = v5 + 13;
  if (v5[13])
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"PPNotificationManager.m", 270, @"EKStore already exists: %@", *v3 object file lineNumber description];
  }
  objc_storeStrong(v3, *(id *)(a1 + 40));
}

+ (void)addSuggestionsObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() sharedInstance];
  [v7 addSuggestionsChangeBlock:v5 forLifetimeOfObject:v6];
}

+ (id)addCalendarVisibilityObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() sharedInstance];
  id v8 = [v7 addCalendarVisibilityChangeBlock:v5 forLifetimeOfObject:v6];

  return v8;
}

+ (void)addEventKitObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() sharedInstance];
  [v7 addEventKitChangeBlock:v5 forLifetimeOfObject:v6];
}

+ (BOOL)_changePotentiallyAffectsCache:(id)a3
{
  id v3 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2050000000;
  uint64_t v4 = (void *)getEKCalendarItemChangeClass_softClass;
  uint64_t v26 = getEKCalendarItemChangeClass_softClass;
  if (!getEKCalendarItemChangeClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __getEKCalendarItemChangeClass_block_invoke;
    uint64_t v21 = &unk_1E550F408;
    id v22 = &v23;
    __getEKCalendarItemChangeClass_block_invoke((uint64_t)&v18);
    uint64_t v4 = (void *)v24[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_16;
  }
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v6 = (void *)getEKExceptionDateChangeClass_softClass;
  uint64_t v26 = getEKExceptionDateChangeClass_softClass;
  if (!getEKExceptionDateChangeClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __getEKExceptionDateChangeClass_block_invoke;
    uint64_t v21 = &unk_1E550F408;
    id v22 = &v23;
    __getEKExceptionDateChangeClass_block_invoke((uint64_t)&v18);
    id v6 = (void *)v24[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_16;
  }
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v8 = (void *)getEKRecurrenceChangeClass_softClass;
  uint64_t v26 = getEKRecurrenceChangeClass_softClass;
  if (!getEKRecurrenceChangeClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __getEKRecurrenceChangeClass_block_invoke;
    uint64_t v21 = &unk_1E550F408;
    id v22 = &v23;
    __getEKRecurrenceChangeClass_block_invoke((uint64_t)&v18);
    id v8 = (void *)v24[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_16;
  }
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2050000000;
  SEL v10 = (void *)getEKEventChangeClass_softClass;
  uint64_t v26 = getEKEventChangeClass_softClass;
  if (!getEKEventChangeClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __getEKEventChangeClass_block_invoke;
    uint64_t v21 = &unk_1E550F408;
    id v22 = &v23;
    __getEKEventChangeClass_block_invoke((uint64_t)&v18);
    SEL v10 = (void *)v24[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_16;
  }
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v12 = (void *)getEKAttendeeChangeClass_softClass;
  uint64_t v26 = getEKAttendeeChangeClass_softClass;
  if (!getEKAttendeeChangeClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __getEKAttendeeChangeClass_block_invoke;
    uint64_t v21 = &unk_1E550F408;
    id v22 = &v23;
    __getEKAttendeeChangeClass_block_invoke((uint64_t)&v18);
    id v12 = (void *)v24[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_16:
    char isKindOfClass = 1;
  }
  else
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2050000000;
    objc_super v16 = (void *)getEKOrganizerChangeClass_softClass;
    uint64_t v26 = getEKOrganizerChangeClass_softClass;
    if (!getEKOrganizerChangeClass_softClass)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __getEKOrganizerChangeClass_block_invoke;
      uint64_t v21 = &unk_1E550F408;
      id v22 = &v23;
      __getEKOrganizerChangeClass_block_invoke((uint64_t)&v18);
      objc_super v16 = (void *)v24[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v23, 8);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (void)addPortraitInvalidationObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() sharedInstance];
  [v7 addPortraitInvalidationBlock:v5 forLifetimeOfObject:v6];
}

+ (void)addPortraitChangeObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() sharedInstance];
  [v7 addPortraitChangeBlock:v5 forLifetimeOfObject:v6];
}

+ (void)addMeCardObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() sharedInstance];
  [v7 addMeCardChangeBlock:v5 forLifetimeOfObject:v6];
}

+ (void)addContactsObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() sharedInstance];
  [v7 addContactsChangeBlock:v5 forLifetimeOfObject:v6];
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken12_6446 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken12_6446, &__block_literal_global_6447);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_6448;
  return v2;
}

void __39__PPNotificationManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  v1 = [PPNotificationManager alloc];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = [(PPNotificationManager *)v1 initWithQueueName:"com.apple.proactive.PersonalizationPortrait.PPNotificationManager.serialQueue" notificationCenter:v2];
  uint64_t v4 = (void *)sharedInstance__pasExprOnceResult_6448;
  sharedInstance__pasExprOnceResult_6448 = v3;
}

- (void)simulatePortraitInvalidation
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__6355;
  id v9 = __Block_byref_object_dispose__6356;
  id v10 = 0;
  lockedData = self->_lockedData;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PPNotificationManager_TestHelpers__simulatePortraitInvalidation__block_invoke;
  v4[3] = &unk_1E550F3E0;
  v4[4] = &v5;
  [(_PASLock *)lockedData runWithLockAcquired:v4];
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  [v3 fireWithObjects:0];
}

void __66__PPNotificationManager_TestHelpers__simulatePortraitInvalidation__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)simulatePortraitChange
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__6355;
  id v9 = __Block_byref_object_dispose__6356;
  id v10 = 0;
  lockedData = self->_lockedData;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PPNotificationManager_TestHelpers__simulatePortraitChange__block_invoke;
  v4[3] = &unk_1E550F3E0;
  v4[4] = &v5;
  [(_PASLock *)lockedData runWithLockAcquired:v4];
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  [v3 fireWithObjects:0];
}

void __60__PPNotificationManager_TestHelpers__simulatePortraitChange__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)waitOnQueueToDrain
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PPNotificationManager_TestHelpers__waitOnQueueToDrain__block_invoke;
  block[3] = &unk_1E550F7E0;
  dispatch_semaphore_t v7 = v3;
  uint64_t v5 = v3;
  dispatch_async(serialQueue, block);
  [(_PASLock *)self->_lockedData runWithLockAcquired:&__block_literal_global_271];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v5 timeoutSeconds:&__block_literal_global_273 onAcquire:&__block_literal_global_275 onTimeout:5.0];
}

intptr_t __56__PPNotificationManager_TestHelpers__waitOnQueueToDrain__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__PPNotificationManager_TestHelpers__waitOnQueueToDrain__block_invoke_4()
{
  id v0 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PPNotificationManagerWaitOnQueueToDrainTimeout" reason:@"PPNotificationManager waitOnQueueToDrain timeout" userInfo:0];
  objc_exception_throw(v0);
}

uint64_t __56__PPNotificationManager_TestHelpers__waitOnQueueToDrain__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)a2[1];
  dispatch_semaphore_t v3 = a2;
  [v2 waitOnQueueToDrain];
  [(id)v3[4] waitOnQueueToDrain];
  [(id)v3[11] waitOnQueueToDrain];
  [(id)v3[7] waitOnQueueToDrain];
  [(id)v3[9] waitOnQueueToDrain];
  uint64_t v4 = (void *)v3[17];

  return [v4 waitOnQueueToDrain];
}

@end