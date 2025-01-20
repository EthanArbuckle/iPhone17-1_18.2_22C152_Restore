@interface UNCSectionInfoStore
- (UNCSectionInfoStore)initWithEffectiveSettings:(id)a3 persistence:(id)a4;
- (id)_queue_effectiveSectionInfoForSectionInfo:(id)a3;
- (id)_queue_sectionInfoForSectionID:(id)a3 effective:(BOOL)a4;
- (id)_queue_sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4;
- (id)activeSectionIDs;
- (id)allSortedActiveSections:(BOOL)a3;
- (id)allSortedSectionInfo:(BOOL)a3;
- (id)allUnsortedSectionInfoIDs;
- (id)clearedInfoForSectionID:(id)a3;
- (id)clearedSectionsByID;
- (id)effectiveSectionInfoForSectionInfo:(id)a3;
- (id)sectionInfoByID;
- (id)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4;
- (id)sectionInfosByIDForSectionIDs:(id)a3 effective:(BOOL)a4;
- (id)sortedSectionIDs;
- (id)sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4;
- (void)_queue_removeSectionWithID:(id)a3;
- (void)_queue_sortSectionIDs:(id)a3 usingGuideArray:(id)a4;
- (void)addActiveSectionID:(id)a3;
- (void)removeSectionWithID:(id)a3;
- (void)setClearedInfo:(id)a3 forSectionID:(id)a4;
- (void)setClearedSectionsByID:(id)a3;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4;
- (void)setSectionInfoByID:(id)a3;
@end

@implementation UNCSectionInfoStore

- (UNCSectionInfoStore)initWithEffectiveSettings:(id)a3 persistence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)UNCSectionInfoStore;
  v9 = [(UNCSectionInfoStore *)&v30 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settings, a3);
    objc_storeStrong((id *)&v10->_persistence, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.usernotificationserver.SectionInfoStore", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.usernotificationserver.SectionInfoStore.gateway", v14);
    gatewayQueue = v10->_gatewayQueue;
    v10->_gatewayQueue = (OS_dispatch_queue *)v15;

    v17 = [[UNCBulletinServerConnection alloc] initWithQueue:v10->_gatewayQueue];
    bbServerConnection = v10->_bbServerConnection;
    v10->_bbServerConnection = v17;

    v19 = v10->_gatewayQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__UNCSectionInfoStore_initWithEffectiveSettings_persistence___block_invoke;
    block[3] = &unk_265567728;
    v20 = v10;
    v29 = v20;
    dispatch_async(v19, block);
    v21 = [(UNCNotificationSettingsPersistentStore *)v10->_persistence readSectionInfo];
    uint64_t v22 = [v21 mutableCopy];
    queue_sectionInfoByID = v20->_queue_sectionInfoByID;
    v20->_queue_sectionInfoByID = (NSMutableDictionary *)v22;

    v24 = [(UNCNotificationSettingsPersistentStore *)v10->_persistence readClearedSections];
    uint64_t v25 = [v24 mutableCopy];
    queue_clearedSectionsByID = v20->_queue_clearedSectionsByID;
    v20->_queue_clearedSectionsByID = (NSMutableDictionary *)v25;
  }
  return v10;
}

void __61__UNCSectionInfoStore_initWithEffectiveSettings_persistence___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 64) activeSectionIDs];
  v3 = (void *)[v2 mutableCopy];

  v4 = *(void **)(a1 + 32);
  v5 = v4[1];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __61__UNCSectionInfoStore_initWithEffectiveSettings_persistence___block_invoke_2;
  v14 = &unk_265567628;
  dispatch_queue_t v15 = v4;
  id v6 = v3;
  id v16 = v6;
  dispatch_async(v5, &v11);
  id v7 = (void *)*MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(*(void *)(a1 + 32) + 32);
    v9 = v7;
    uint64_t v10 = objc_msgSend(v8, "count", v11, v12, v13, v14, v15);
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v10;
    _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "Initial fetch of activeSectionIDs count: %lu", buf, 0xCu);
  }
}

void __61__UNCSectionInfoStore_initWithEffectiveSettings_persistence___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  id v5 = [*(id *)(a1 + 40) allObjects];
  uint64_t v2 = [v5 mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_sectionInfoForSectionID:(id)a3 effective:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [(NSMutableDictionary *)self->_queue_sectionInfoByID objectForKey:v6];
  if (v4)
  {
    uint64_t v8 = [(UNCSectionInfoStore *)self _queue_effectiveSectionInfoForSectionInfo:v7];

    id v7 = (void *)v8;
  }
  if (v7 && ([v7 sectionID], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    uint64_t v11 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_ERROR)) {
      -[UNCSectionInfoStore _queue_sectionInfoForSectionID:effective:]((uint64_t)v6, (uint64_t)v7, v11);
    }
    [(UNCSectionInfoStore *)self _queue_removeSectionWithID:v6];
    id v10 = 0;
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (id)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__14;
  uint64_t v19 = __Block_byref_object_dispose__14;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__UNCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke;
  v11[3] = &unk_2655685B0;
  id v12 = v6;
  v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __57__UNCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_sectionInfoForSectionID:effective:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

  return MEMORY[0x270F9A758]();
}

- (id)_queue_sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = (void *)MEMORY[0x263EFF980];
  id v9 = [v6 allObjects];
  id v10 = [v8 arrayWithArray:v9];

  [(UNCSectionInfoStore *)self _queue_sortSectionIDs:v10 usingGuideArray:self->_queue_sortedSectionIDs];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = -[UNCSectionInfoStore _queue_sectionInfoForSectionID:effective:](self, "_queue_sectionInfoForSectionID:effective:", *(void *)(*((void *)&v18 + 1) + 8 * i), v4, (void)v18);
        if (v16) {
          [v7 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v7;
}

- (id)sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__14;
  long long v19 = __Block_byref_object_dispose__14;
  id v20 = [MEMORY[0x263EFF8C0] array];
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__UNCSectionInfoStore_sortedSectionInfoForSectionIDs_effective___block_invoke;
  v11[3] = &unk_2655685B0;
  id v12 = v6;
  uint64_t v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __64__UNCSectionInfoStore_sortedSectionInfoForSectionIDs_effective___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_sortedSectionInfoForSectionIDs:effective:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

  return MEMORY[0x270F9A758]();
}

- (id)sectionInfosByIDForSectionIDs:(id)a3 effective:(BOOL)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__UNCSectionInfoStore_sectionInfosByIDForSectionIDs_effective___block_invoke;
  v14[3] = &unk_2655685D8;
  id v15 = v6;
  id v16 = self;
  BOOL v18 = a4;
  id v9 = v7;
  id v17 = v9;
  id v10 = v6;
  dispatch_sync(queue, v14);
  id v11 = v17;
  id v12 = v9;

  return v12;
}

void __63__UNCSectionInfoStore_sectionInfosByIDForSectionIDs_effective___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "_queue_sectionInfoForSectionID:effective:", v7, *(unsigned __int8 *)(a1 + 56), (void)v9);
        if (v8) {
          [*(id *)(a1 + 48) setObject:v8 forKey:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)_queue_effectiveSectionInfoForSectionInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    uint64_t v5 = [v4 factorySectionID];
    if (!v5
      || (-[UNCSectionInfoStore _queue_sectionInfoForSectionID:effective:](self, "_queue_sectionInfoForSectionID:effective:", v5, 0), (v6 = objc_claimAutoreleasedReturnValue()) == 0)|| (uint64_t v7 = (void *)v6, objc_msgSend(v4, "effectiveSectionInfoWithFactoryInfo:defaultContentPreviewSetting:globalAnnounceSetting:globalScheduledDeliverySetting:hasPairedVehiclesForCarPlay:hasDestinationForRemoteNotifications:", v6, -[UNCEffectiveSettings effectiveGlobalContentPreviewSetting](self->_settings, "effectiveGlobalContentPreviewSetting"), -[UNCEffectiveSettings effectiveGlobalAnnounceSetting](self->_settings, "effectiveGlobalAnnounceSetting"), -[UNCEffectiveSettings effectiveGlobalScheduledDeliverySetting](self->_settings, "effectiveGlobalScheduledDeliverySetting"), -[UNCEffectiveSettings hasPairedVehiclesForCarPlay](self->_settings, "hasPairedVehiclesForCarPlay"),
            1),
          id v8 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v8))
    {
      id v8 = objc_msgSend(v4, "effectiveSectionInfoWithDefaultContentPreviewSetting:globalAnnounceSetting:globalScheduledDeliverySetting:hasPairedVehiclesForCarPlay:hasDestinationForRemoteNotifications:", -[UNCEffectiveSettings effectiveGlobalContentPreviewSetting](self->_settings, "effectiveGlobalContentPreviewSetting"), -[UNCEffectiveSettings effectiveGlobalAnnounceSetting](self->_settings, "effectiveGlobalAnnounceSetting"), -[UNCEffectiveSettings effectiveGlobalScheduledDeliverySetting](self->_settings, "effectiveGlobalScheduledDeliverySetting"), -[UNCEffectiveSettings hasPairedVehiclesForCarPlay](self->_settings, "hasPairedVehiclesForCarPlay"), 1);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)effectiveSectionInfoForSectionInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__14;
    id v16 = __Block_byref_object_dispose__14;
    id v17 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__UNCSectionInfoStore_effectiveSectionInfoForSectionInfo___block_invoke;
    block[3] = &unk_265567700;
    long long v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(queue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __58__UNCSectionInfoStore_effectiveSectionInfoForSectionInfo___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveSectionInfoForSectionInfo:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__UNCSectionInfoStore_setSectionInfo_forSectionID___block_invoke;
  block[3] = &unk_2655676D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __51__UNCSectionInfoStore_setSectionInfo_forSectionID___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 24) setObject:a1[5] forKey:a1[6]];
  [*(id *)(a1[4] + 72) writeSectionInfo:*(void *)(a1[4] + 24)];
  id v2 = *(void **)(a1[4] + 64);
  uint64_t v3 = a1[6];

  return [v2 refreshSectionInfoForID:v3];
}

- (void)_queue_removeSectionWithID:(id)a3
{
  queue_sectionInfoByID = self->_queue_sectionInfoByID;
  id v5 = a3;
  [(NSMutableDictionary *)queue_sectionInfoByID removeObjectForKey:v5];
  [(NSMutableSet *)self->_queue_activeSectionIDs removeObject:v5];
  [(NSMutableArray *)self->_queue_sortedSectionIDs removeObject:v5];

  [(UNCNotificationSettingsPersistentStore *)self->_persistence writeSectionInfo:self->_queue_sectionInfoByID];
  persistence = self->_persistence;
  queue_clearedSectionsByID = self->_queue_clearedSectionsByID;

  [(UNCNotificationSettingsPersistentStore *)persistence writeClearedSections:queue_clearedSectionsByID];
}

- (void)removeSectionWithID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__UNCSectionInfoStore_removeSectionWithID___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __43__UNCSectionInfoStore_removeSectionWithID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeSectionWithID:", *(void *)(a1 + 40));
}

- (void)addActiveSectionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__UNCSectionInfoStore_addActiveSectionID___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __42__UNCSectionInfoStore_addActiveSectionID___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 40);
    return [v4 addObject:v3];
  }
  return result;
}

- (id)activeSectionIDs
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__14;
  id v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__UNCSectionInfoStore_activeSectionIDs__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__UNCSectionInfoStore_activeSectionIDs__block_invoke(uint64_t a1)
{
}

- (id)allSortedActiveSections:(BOOL)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__14;
  id v12 = __Block_byref_object_dispose__14;
  id v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__UNCSectionInfoStore_allSortedActiveSections___block_invoke;
  block[3] = &unk_265568600;
  void block[4] = self;
  void block[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __47__UNCSectionInfoStore_allSortedActiveSections___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_sortedSectionInfoForSectionIDs:effective:", *(void *)(*(void *)(a1 + 32) + 32), *(unsigned __int8 *)(a1 + 48));

  return MEMORY[0x270F9A758]();
}

- (id)sortedSectionIDs
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__14;
  uint64_t v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__UNCSectionInfoStore_sortedSectionIDs__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__UNCSectionInfoStore_sortedSectionIDs__block_invoke(uint64_t a1)
{
}

- (void)_queue_sortSectionIDs:(id)a3 usingGuideArray:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v37 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v6 count])
  {
    uint64_t v8 = [v7 count];
    if (v6 != v7)
    {
      if (v8)
      {
        v34 = v7;
        id v9 = [MEMORY[0x263EFFA08] setWithArray:v7];
        uint64_t v10 = [MEMORY[0x263EFFA08] setWithArray:v6];
        v38 = [MEMORY[0x263EFF9A0] dictionary];
        v43 = (void *)[v6 mutableCopy];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v33 = v6;
        obuint64_t j = v6;
        uint64_t v39 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (v39)
        {
          uint64_t v36 = *(void *)v56;
          id v11 = (os_log_t *)MEMORY[0x263F1E070];
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v56 != v36) {
                objc_enumerationMutation(obj);
              }
              uint64_t v44 = *(void *)(*((void *)&v55 + 1) + 8 * i);
              id v13 = -[UNCSectionInfoStore _queue_sectionInfoForSectionID:effective:](v37, "_queue_sectionInfoForSectionID:effective:");
              uint64_t v14 = [v13 dataProviderIDs];
              if ([v14 count])
              {
                v41 = v13;
                uint64_t v42 = i;
                id v15 = [MEMORY[0x263EFF980] array];
                long long v51 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                long long v54 = 0u;
                v40 = v14;
                id v16 = v14;
                uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v64 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v52;
                  do
                  {
                    for (uint64_t j = 0; j != v18; ++j)
                    {
                      if (*(void *)v52 != v19) {
                        objc_enumerationMutation(v16);
                      }
                      uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8 * j);
                      if ([v10 containsObject:v21])
                      {
                        if (([v9 containsObject:v21] & 1) == 0) {
                          [v15 addObject:v21];
                        }
                      }
                      else
                      {
                        uint64_t v22 = *v11;
                        if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v61 = v21;
                          __int16 v62 = 2112;
                          uint64_t v63 = v44;
                          _os_log_error_impl(&dword_2608DB000, v22, OS_LOG_TYPE_ERROR, "UNCSectionInfoStore: unknown subsection \"%@\" (of \"%@\") cannot be sorted.", buf, 0x16u);
                        }
                      }
                    }
                    uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v64 count:16];
                  }
                  while (v18);
                }

                if ([v15 count])
                {
                  [v38 setObject:v15 forKey:v44];
                  [v43 removeObjectsInArray:v15];
                }

                id v13 = v41;
                uint64_t i = v42;
                uint64_t v14 = v40;
              }
            }
            uint64_t v39 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
          }
          while (v39);
        }

        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __61__UNCSectionInfoStore__queue_sortSectionIDs_usingGuideArray___block_invoke;
        v49[3] = &unk_265568628;
        id v50 = v34;
        [v43 sortUsingComparator:v49];
        uint64_t v23 = v38;
        if ([v38 count])
        {
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          v24 = [v38 allKeys];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v59 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v46;
            do
            {
              for (uint64_t k = 0; k != v26; ++k)
              {
                if (*(void *)v46 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = *(void *)(*((void *)&v45 + 1) + 8 * k);
                objc_super v30 = [v38 objectForKey:v29];
                uint64_t v31 = [v43 indexOfObject:v29];
                if (v31 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v32 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v31 + 1, objc_msgSend(v30, "count"));
                  [v43 insertObjects:v30 atIndexes:v32];
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v59 count:16];
            }
            while (v26);
          }

          uint64_t v23 = v38;
        }
        [obj removeAllObjects];
        [obj addObjectsFromArray:v43];

        id v6 = v33;
        id v7 = v34;
      }
    }
  }
}

uint64_t __61__UNCSectionInfoStore__queue_sortSectionIDs_usingGuideArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqual:v6])
  {
    uint64_t v7 = 0;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "isEqual:", v5, (void)v15))
          {
            uint64_t v7 = -1;
            goto LABEL_16;
          }
          if ([v13 isEqual:v6])
          {
            uint64_t v7 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v7 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
LABEL_16:
  }
  return v7;
}

- (id)allUnsortedSectionInfoIDs
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__14;
  uint64_t v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__UNCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __48__UNCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) allKeys];

  return MEMORY[0x270F9A758]();
}

- (id)allSortedSectionInfo:(BOOL)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__14;
  id v12 = __Block_byref_object_dispose__14;
  id v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__UNCSectionInfoStore_allSortedSectionInfo___block_invoke;
  block[3] = &unk_265568650;
  void block[4] = self;
  void block[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __44__UNCSectionInfoStore_allSortedSectionInfo___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(*(void *)(a1 + 32) + 40)];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_sortedSectionInfoForSectionIDs:effective:", v5, *(unsigned __int8 *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)sectionInfoByID
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__14;
  uint64_t v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__UNCSectionInfoStore_sectionInfoByID__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __38__UNCSectionInfoStore_sectionInfoByID__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];

  return MEMORY[0x270F9A758]();
}

- (void)setSectionInfoByID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__UNCSectionInfoStore_setSectionInfoByID___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __42__UNCSectionInfoStore_setSectionInfoByID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) mutableCopy];

  return MEMORY[0x270F9A758]();
}

- (id)clearedInfoForSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__14;
  long long v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__UNCSectionInfoStore_clearedInfoForSectionID___block_invoke;
  block[3] = &unk_265567700;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __47__UNCSectionInfoStore_clearedInfoForSectionID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 48) objectForKey:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (id)clearedSectionsByID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__14;
  id v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__UNCSectionInfoStore_clearedSectionsByID__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__UNCSectionInfoStore_clearedSectionsByID__block_invoke(uint64_t a1)
{
}

- (void)setClearedInfo:(id)a3 forSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__UNCSectionInfoStore_setClearedInfo_forSectionID___block_invoke;
  block[3] = &unk_2655676D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __51__UNCSectionInfoStore_setClearedInfo_forSectionID___block_invoke(void *a1)
{
  if (a1[4]
    && ([MEMORY[0x263EFF9D0] null],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 isEqual:a1[4]],
        v2,
        (v3 & 1) == 0))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = *(void **)(a1[5] + 48);
    uint64_t v9 = a1[6];
    return [v8 setObject:v7 forKey:v9];
  }
  else
  {
    uint64_t v4 = a1[6];
    id v5 = *(void **)(a1[5] + 48);
    return [v5 removeObjectForKey:v4];
  }
}

- (void)setClearedSectionsByID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__UNCSectionInfoStore_setClearedSectionsByID___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __46__UNCSectionInfoStore_setClearedSectionsByID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = [*(id *)(a1 + 40) mutableCopy];

  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_bbServerConnection, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_queue_clearedSectionsByID, 0);
  objc_storeStrong((id *)&self->_queue_sortedSectionIDs, 0);
  objc_storeStrong((id *)&self->_queue_activeSectionIDs, 0);
  objc_storeStrong((id *)&self->_queue_sectionInfoByID, 0);
  objc_storeStrong((id *)&self->_gatewayQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_sectionInfoForSectionID:(os_log_t)log effective:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "Produced invalid sectionInfo without ID for %@: %@", (uint8_t *)&v3, 0x16u);
}

@end