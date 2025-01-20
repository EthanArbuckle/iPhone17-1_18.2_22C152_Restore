@interface UNSSettingsGateway
- (UNSSettingsGateway)init;
- (id)_queue_allEffectiveSectionInfos;
- (id)_queue_allSectionInfos;
- (id)_queue_effectiveSectionInfoForSectionID:(id)a3;
- (id)_queue_effectiveSectionInfosForSectionIDs:(id)a3;
- (id)_queue_globalScheduledDeliveryTimes;
- (id)_queue_sectionInfoForSectionID:(id)a3;
- (id)_queue_sectionInfosForSectionIDs:(id)a3;
- (id)allEffectiveSectionInfo;
- (id)allSectionInfo;
- (id)effectiveSectionInfoForSectionID:(id)a3;
- (id)effectiveSectionInfoForSectionIDs:(id)a3;
- (id)globalScheduledDeliveryTimes;
- (id)sectionInfoForSectionID:(id)a3;
- (id)sectionInfoForSectionIDs:(id)a3;
- (int64_t)_queue_globalAnnounceCarPlaySetting;
- (int64_t)_queue_globalAnnounceHeadphonesSetting;
- (int64_t)_queue_globalAnnounceSetting;
- (int64_t)_queue_globalContentPreviewSetting;
- (int64_t)_queue_globalNotificationListDisplayStyleSetting;
- (int64_t)_queue_globalScheduledDeliverySetting;
- (int64_t)_queue_globalScheduledDeliveryShowNextSummarySetting;
- (int64_t)_queue_globalSummarizationSetting;
- (int64_t)globalAnnounceCarPlaySetting;
- (int64_t)globalAnnounceHeadphonesSetting;
- (int64_t)globalAnnounceSetting;
- (int64_t)globalContentPreviewSetting;
- (int64_t)globalNotificationListDisplayStyleSetting;
- (int64_t)globalScheduledDeliverySetting;
- (int64_t)globalScheduledDeliveryShowNextSummarySetting;
- (int64_t)globalSummarizationSetting;
- (void)_queue_addObserver:(id)a3;
- (void)_queue_getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4;
- (void)_queue_removeObserver:(id)a3;
- (void)_queue_setGlobalAnnounceCarPlaySetting:(int64_t)a3;
- (void)_queue_setGlobalAnnounceHeadphonesSetting:(int64_t)a3;
- (void)_queue_setGlobalAnnounceSetting:(int64_t)a3;
- (void)_queue_setGlobalContentPreviewSetting:(int64_t)a3;
- (void)_queue_setGlobalNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)_queue_setGlobalScheduledDeliverySetting:(int64_t)a3;
- (void)_queue_setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3;
- (void)_queue_setGlobalScheduledDeliveryTimes:(id)a3;
- (void)_queue_setGlobalSummarizationSetting:(int64_t)a3;
- (void)_queue_setSectionInfo:(id)a3 forSectionID:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4;
- (void)observer:(id)a3 updateGlobalSettings:(id)a4;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3;
- (void)setGlobalAnnounceHeadphonesSetting:(int64_t)a3;
- (void)setGlobalAnnounceSetting:(int64_t)a3;
- (void)setGlobalContentPreviewSetting:(int64_t)a3;
- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)setGlobalScheduledDeliverySetting:(int64_t)a3;
- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3;
- (void)setGlobalScheduledDeliveryTimes:(id)a3;
- (void)setGlobalSummarizationSetting:(int64_t)a3;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4;
@end

@implementation UNSSettingsGateway

void __55__UNSSettingsGateway_effectiveSectionInfoForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveSectionInfoForSectionID:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_effectiveSectionInfoForSectionID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F1E070];
  v6 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting effective section info", (uint8_t *)&v10, 0xCu);
  }
  v7 = [(BBSettingsGateway *)self->_settingsGateway effectiveSectionInfoForSectionID:v4];
  v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v4;
    __int16 v12 = 1024;
    BOOL v13 = v7 != 0;
    _os_log_impl(&dword_22289A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got effective section info [ hasResult: %d ]", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

- (id)sectionInfoForSectionID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Getting sectionInfo for section identifier: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__UNSSettingsGateway_sectionInfoForSectionID___block_invoke;
  block[3] = &unk_26462F950;
  id v11 = v4;
  __int16 v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)effectiveSectionInfoForSectionID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Getting effectiveSectionInfo for section identifier: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__UNSSettingsGateway_effectiveSectionInfoForSectionID___block_invoke;
  block[3] = &unk_26462F950;
  id v11 = v4;
  __int16 v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __46__UNSSettingsGateway_sectionInfoForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_sectionInfoForSectionID:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_sectionInfoForSectionID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F1E070];
  v6 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting section info", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [(BBSettingsGateway *)self->_settingsGateway sectionInfoForSectionID:v4];
  id v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v4;
    __int16 v12 = 1024;
    BOOL v13 = v7 != 0;
    _os_log_impl(&dword_22289A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got section info [ hasResult: %d ]", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

- (UNSSettingsGateway)init
{
  v13.receiver = self;
  v13.super_class = (Class)UNSSettingsGateway;
  uint64_t v2 = [(UNSSettingsGateway *)&v13 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.usernotificationsserver.SettingsGateway", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F2BCC0]) initWithQueue:v2->_queue];
    settingsGateway = v2->_settingsGateway;
    v2->_settingsGateway = (BBSettingsGateway *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F2BC90]) initWithQueue:v2->_queue];
    settingsObserver = v2->_settingsObserver;
    v2->_settingsObserver = (BBObserver *)v10;

    [(BBObserver *)v2->_settingsObserver setObserverFeed:512];
    [(BBObserver *)v2->_settingsObserver setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(BBSettingsGateway *)self->_settingsGateway invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UNSSettingsGateway;
  [(UNSSettingsGateway *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__UNSSettingsGateway_addObserver___block_invoke;
  v7[3] = &unk_26462F430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __34__UNSSettingsGateway_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:", *(void *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__UNSSettingsGateway_removeObserver___block_invoke;
  v7[3] = &unk_26462F430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __37__UNSSettingsGateway_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:", *(void *)(a1 + 40));
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__UNSSettingsGateway_setSectionInfo_forSectionID___block_invoke;
  block[3] = &unk_26462F678;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __50__UNSSettingsGateway_setSectionInfo_forSectionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setSectionInfo:forSectionID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)effectiveSectionInfoForSectionIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Getting effectiveSectionInfos for section identifiers: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__UNSSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke;
  block[3] = &unk_26462F950;
  id v11 = v4;
  id v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __56__UNSSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveSectionInfosForSectionIDs:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)sectionInfoForSectionIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Getting sectionInfos for section identifiers: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__UNSSettingsGateway_sectionInfoForSectionIDs___block_invoke;
  block[3] = &unk_26462F950;
  id v11 = v4;
  id v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __47__UNSSettingsGateway_sectionInfoForSectionIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_sectionInfosForSectionIDs:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_22289A000, v8, OS_LOG_TYPE_DEFAULT, "Getting sectionInfos for section identifiers: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__UNSSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke;
  block[3] = &unk_26462F208;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __65__UNSSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_getSectionInfoForSectionIDs:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)allEffectiveSectionInfo
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__5;
  id v13 = __Block_byref_object_dispose__5;
  id v14 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting allEffectiveSectionInfos", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__UNSSettingsGateway_allEffectiveSectionInfo__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __45__UNSSettingsGateway_allEffectiveSectionInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_allEffectiveSectionInfos");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)allSectionInfo
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__5;
  id v13 = __Block_byref_object_dispose__5;
  id v14 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting allSectionInfos", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__UNSSettingsGateway_allSectionInfo__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __36__UNSSettingsGateway_allSectionInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_allSectionInfos");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)globalContentPreviewSetting
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalContentPreviewSetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__UNSSettingsGateway_globalContentPreviewSetting__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __49__UNSSettingsGateway_globalContentPreviewSetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalContentPreviewSetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalContentPreviewSetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__UNSSettingsGateway_setGlobalContentPreviewSetting___block_invoke;
  v4[3] = &unk_264630180;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __53__UNSSettingsGateway_setGlobalContentPreviewSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalContentPreviewSetting:", *(void *)(a1 + 40));
}

- (int64_t)globalAnnounceSetting
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalAnnounceSetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__UNSSettingsGateway_globalAnnounceSetting__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __43__UNSSettingsGateway_globalAnnounceSetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalAnnounceSetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceSetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__UNSSettingsGateway_setGlobalAnnounceSetting___block_invoke;
  v4[3] = &unk_264630180;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __47__UNSSettingsGateway_setGlobalAnnounceSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalAnnounceSetting:", *(void *)(a1 + 40));
}

- (int64_t)globalAnnounceHeadphonesSetting
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalAnnounceHeadphonesSetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__UNSSettingsGateway_globalAnnounceHeadphonesSetting__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __53__UNSSettingsGateway_globalAnnounceHeadphonesSetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalAnnounceHeadphonesSetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__UNSSettingsGateway_setGlobalAnnounceHeadphonesSetting___block_invoke;
  v4[3] = &unk_264630180;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __57__UNSSettingsGateway_setGlobalAnnounceHeadphonesSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalAnnounceHeadphonesSetting:", *(void *)(a1 + 40));
}

- (int64_t)globalAnnounceCarPlaySetting
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalAnnounceCarPlaySetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__UNSSettingsGateway_globalAnnounceCarPlaySetting__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __50__UNSSettingsGateway_globalAnnounceCarPlaySetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalAnnounceCarPlaySetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__UNSSettingsGateway_setGlobalAnnounceCarPlaySetting___block_invoke;
  v4[3] = &unk_264630180;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __54__UNSSettingsGateway_setGlobalAnnounceCarPlaySetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalAnnounceCarPlaySetting:", *(void *)(a1 + 40));
}

- (int64_t)globalScheduledDeliverySetting
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalScheduledDeliverySetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__UNSSettingsGateway_globalScheduledDeliverySetting__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __52__UNSSettingsGateway_globalScheduledDeliverySetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliverySetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__UNSSettingsGateway_setGlobalScheduledDeliverySetting___block_invoke;
  v4[3] = &unk_264630180;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __56__UNSSettingsGateway_setGlobalScheduledDeliverySetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalScheduledDeliverySetting:", *(void *)(a1 + 40));
}

- (id)globalScheduledDeliveryTimes
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__5;
  id v13 = __Block_byref_object_dispose__5;
  id v14 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalScheduledDeliveryTimes", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__UNSSettingsGateway_globalScheduledDeliveryTimes__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __50__UNSSettingsGateway_globalScheduledDeliveryTimes__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliveryTimes");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setGlobalScheduledDeliveryTimes:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__UNSSettingsGateway_setGlobalScheduledDeliveryTimes___block_invoke;
  v7[3] = &unk_26462F430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __54__UNSSettingsGateway_setGlobalScheduledDeliveryTimes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalScheduledDeliveryTimes:", *(void *)(a1 + 40));
}

- (int64_t)globalScheduledDeliveryShowNextSummarySetting
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalScheduledDeliveryShowNextSummarySetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__UNSSettingsGateway_globalScheduledDeliveryShowNextSummarySetting__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __67__UNSSettingsGateway_globalScheduledDeliveryShowNextSummarySetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliveryShowNextSummarySetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__UNSSettingsGateway_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke;
  v4[3] = &unk_264630180;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __71__UNSSettingsGateway_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalScheduledDeliveryShowNextSummarySetting:", *(void *)(a1 + 40));
}

- (int64_t)globalNotificationListDisplayStyleSetting
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalNotificationListDisplayStyleSetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__UNSSettingsGateway_globalNotificationListDisplayStyleSetting__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __63__UNSSettingsGateway_globalNotificationListDisplayStyleSetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalNotificationListDisplayStyleSetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__UNSSettingsGateway_setGlobalNotificationListDisplayStyleSetting___block_invoke;
  v4[3] = &unk_264630180;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __67__UNSSettingsGateway_setGlobalNotificationListDisplayStyleSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalNotificationListDisplayStyleSetting:", *(void *)(a1 + 40));
}

- (int64_t)globalSummarizationSetting
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting GlobalSummarizationSetting", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__UNSSettingsGateway_globalSummarizationSetting__block_invoke;
  v7[3] = &unk_264630158;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __48__UNSSettingsGateway_globalSummarizationSetting__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalSummarizationSetting");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalSummarizationSetting:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__UNSSettingsGateway_setGlobalSummarizationSetting___block_invoke;
  v4[3] = &unk_264630180;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __52__UNSSettingsGateway_setGlobalSummarizationSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalSummarizationSetting:", *(void *)(a1 + 40));
}

- (void)_queue_addObserver:(id)a3
{
}

- (void)_queue_removeObserver:(id)a3
{
}

- (void)_queue_setSectionInfo:(id)a3 forSectionID:(id)a4
{
}

- (id)_queue_effectiveSectionInfosForSectionIDs:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v9 = 138543362;
    id v10 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Getting effective section infos from settingsGateway: [%{public}@]", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(BBSettingsGateway *)self->_settingsGateway effectiveSectionInfoForSectionIDs:v4];

  return v7;
}

- (id)_queue_sectionInfosForSectionIDs:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v9 = 138543362;
    id v10 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Getting section infos from settingsGateway: [%{public}@]", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(BBSettingsGateway *)self->_settingsGateway sectionInfoForSectionIDs:v4];

  return v7;
}

- (void)_queue_getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  settingsGateway = self->_settingsGateway;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__UNSSettingsGateway__queue_getSectionInfoForSectionIDs_withCompletion___block_invoke;
  v11[3] = &unk_2646301A8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(BBSettingsGateway *)settingsGateway getSectionInfoForSectionIDs:v10 withCompletion:v11];
}

void __72__UNSSettingsGateway__queue_getSectionInfoForSectionIDs_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 1024;
    BOOL v9 = v3 != 0;
    _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got section infos [ hasResult: %d ]", (uint8_t *)&v6, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_queue_allEffectiveSectionInfos
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    __int16 v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting all effective section infos from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = [(BBSettingsGateway *)self->_settingsGateway allEffectiveSectionInfo];
  return v5;
}

- (id)_queue_allSectionInfos
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    __int16 v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting all section infos from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = [(BBSettingsGateway *)self->_settingsGateway allSectionInfo];
  return v5;
}

- (int64_t)_queue_globalContentPreviewSetting
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v6 = 138543362;
    int v7 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalContentPreviewSetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return [(BBSettingsGateway *)self->_settingsGateway effectiveGlobalContentPreviewsSetting];
}

- (void)_queue_setGlobalContentPreviewSetting:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    uint64_t v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalContentPreviewSetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(BBSettingsGateway *)self->_settingsGateway setEffectiveGlobalContentPreviewsSetting:a3];
}

- (int64_t)_queue_globalAnnounceSetting
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v6 = 138543362;
    int v7 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalAnnounceSetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return [(BBSettingsGateway *)self->_settingsGateway effectiveGlobalAnnounceSetting];
}

- (void)_queue_setGlobalAnnounceSetting:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    uint64_t v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalAnnounceSetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(BBSettingsGateway *)self->_settingsGateway setEffectiveGlobalAnnounceSetting:a3];
}

- (int64_t)_queue_globalAnnounceHeadphonesSetting
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v6 = 138543362;
    int v7 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalAnnounceHeadphonesSetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return [(BBSettingsGateway *)self->_settingsGateway effectiveGlobalAnnounceHeadphonesSetting];
}

- (void)_queue_setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    uint64_t v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalAnnounceHeadphonesSetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(BBSettingsGateway *)self->_settingsGateway setEffectiveGlobalAnnounceHeadphonesSetting:a3];
}

- (int64_t)_queue_globalAnnounceCarPlaySetting
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v6 = 138543362;
    int v7 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalAnnounceCarPlaySetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return [(BBSettingsGateway *)self->_settingsGateway effectiveGlobalAnnounceCarPlaySetting];
}

- (void)_queue_setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    uint64_t v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalAnnounceCarPlaySetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(BBSettingsGateway *)self->_settingsGateway setEffectiveGlobalAnnounceCarPlaySetting:a3];
}

- (int64_t)_queue_globalScheduledDeliverySetting
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v6 = 138543362;
    int v7 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalScheduledDeliverySetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return [(BBSettingsGateway *)self->_settingsGateway effectiveGlobalScheduledDeliverySetting];
}

- (void)_queue_setGlobalScheduledDeliverySetting:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    uint64_t v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalScheduledDeliverySetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(BBSettingsGateway *)self->_settingsGateway setEffectiveGlobalScheduledDeliverySetting:a3];
}

- (id)_queue_globalScheduledDeliveryTimes
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    uint64_t v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalScheduledDeliveryTimes from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = [(BBSettingsGateway *)self->_settingsGateway effectiveGlobalScheduledDeliveryTimes];
  return v5;
}

- (void)_queue_setGlobalScheduledDeliveryTimes:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    uint64_t v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalScheduledDeliveryTimes from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(BBSettingsGateway *)self->_settingsGateway setEffectiveGlobalScheduledDeliveryTimes:v4];
}

- (int64_t)_queue_globalScheduledDeliveryShowNextSummarySetting
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v6 = 138543362;
    int v7 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalScheduledDeliveryShowNextSummarySetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return [(BBSettingsGateway *)self->_settingsGateway effectiveGlobalScheduledDeliveryShowNextSummarySetting];
}

- (void)_queue_setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    uint64_t v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalScheduledDeliveryShowNextSummarySetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(BBSettingsGateway *)self->_settingsGateway setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:a3];
}

- (int64_t)_queue_globalNotificationListDisplayStyleSetting
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v6 = 138543362;
    int v7 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalNotificationListDisplayStyleSetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return [(BBSettingsGateway *)self->_settingsGateway effectiveGlobalNotificationListDisplayStyleSetting];
}

- (void)_queue_setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    uint64_t v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalNotificationListDisplayStyleSetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(BBSettingsGateway *)self->_settingsGateway setEffectiveGlobalNotificationListDisplayStyleSetting:a3];
}

- (int64_t)_queue_globalSummarizationSetting
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v6 = 138543362;
    int v7 = settingsGateway;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "Getting globalSummarizationSetting from settingsGateway: [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  return [(BBSettingsGateway *)self->_settingsGateway effectiveGlobalSummarizationSetting];
}

- (void)_queue_setGlobalSummarizationSetting:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    settingsGateway = self->_settingsGateway;
    int v7 = 138543362;
    uint64_t v8 = settingsGateway;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Setting globalSummarizationSetting from settingsGateway: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(BBSettingsGateway *)self->_settingsGateway setEffectiveGlobalSummarizationSetting:a3];
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__UNSSettingsGateway_observer_updateSectionInfo___block_invoke;
  v8[3] = &unk_26462F430;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __49__UNSSettingsGateway_observer_updateSectionInfo___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFFA08]);
  id v3 = [*(id *)(a1 + 32) sectionID];
  id v4 = objc_msgSend(v2, "initWithObjects:", v3, 0);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) settingsGateway:*(void *)(a1 + 40) didUpdateSectionInfoForSectionIDs:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__UNSSettingsGateway_observer_updateGlobalSettings___block_invoke;
  v8[3] = &unk_26462F430;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __52__UNSSettingsGateway_observer_updateGlobalSettings___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "settingsGateway:didUpdateGlobalSettings:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsObserver, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end