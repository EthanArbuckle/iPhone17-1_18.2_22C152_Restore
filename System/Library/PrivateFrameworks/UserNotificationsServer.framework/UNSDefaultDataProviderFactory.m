@interface UNSDefaultDataProviderFactory
- (NSMutableDictionary)bundleIdentifierToDataProvider;
- (UNSDefaultDataProviderFactory)initWithApplicationLauncher:(id)a3 daemonLauncher:(id)a4 categoryRepository:(id)a5 notificationRepository:(id)a6 attachmentsService:(id)a7 topicRepository:(id)a8 localizationService:(id)a9 summaryService:(id)a10 settingsGateway:(id)a11;
- (id)_queue_effectiveSectionInfoForBundleIdentifier:(id)a3;
- (id)_queue_notificationSettingsForBundleIdentifier:(id)a3;
- (id)_queue_notificationSettingsForTopicsWithBundleIdentifier:(id)a3;
- (id)_queue_sectionInfoForBundleIdentifier:(id)a3;
- (id)notificationSettingsForBundleIdentifier:(id)a3;
- (id)notificationSettingsForTopicsWithBundleIdentifier:(id)a3;
- (void)_queue_addObserver:(id)a3;
- (void)_queue_createDataProviderWithNotificationSourceDescription:(id)a3 withCompletion:(id)a4;
- (void)_queue_createNewDefaultDataProviders:(id)a3;
- (void)_queue_notificationSourceDidInstall:(id)a3;
- (void)_queue_notificationSourceDidUninstall:(id)a3;
- (void)_queue_notificationSourcesDidInstall:(id)a3;
- (void)_queue_notificationSourcesDidUninstall:(id)a3;
- (void)_queue_removeDataProviderWithBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_queue_removeObserver:(id)a3;
- (void)_queue_sectionInfoDidChange:(id)a3;
- (void)_queue_setCriticalAlertAuthorization:(BOOL)a3 forNotificationSourceDescription:(id)a4 completionHandler:(id)a5;
- (void)_queue_setSectionInfo:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_updateSettingsWithAuthorizationStatus:(int64_t)a3 options:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 expirationDate:(id)a6 lastUserGrantDate:(id)a7 forNotificationSourceDescription:(id)a8 completionHandler:(id)a9;
- (void)_queue_updateSettingsWithAuthorizationStatus:(int64_t)a3 options:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 forNotificationSourceDescription:(id)a6 completionHandler:(id)a7;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)notificationSourcesDidInstall:(id)a3;
- (void)notificationSourcesDidUninstall:(id)a3;
- (void)observer:(id)a3 removeSection:(id)a4;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)removeObserver:(id)a3;
- (void)requestAuthorizationStatus:(int64_t)a3 withOptions:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 expirationDate:(id)a6 lastUserGrantDate:(id)a7 forNotificationSourceDescription:(id)a8 completionHandler:(id)a9;
- (void)requestAuthorizationStatus:(int64_t)a3 withOptions:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 forNotificationSourceDescription:(id)a6 completionHandler:(id)a7;
- (void)requestRemoveAuthorizationforNotificationSourceDescription:(id)a3 completionHandler:(id)a4;
- (void)setCriticalAlertAuthorization:(BOOL)a3 forNotificationSourceDescription:(id)a4 completionHandler:(id)a5;
- (void)updateAuthorizationWithOptions:(unint64_t)a3 scheduledDeliveryEnabled:(BOOL)a4 forNotificationSourceDescription:(id)a5 completionHandler:(id)a6;
@end

@implementation UNSDefaultDataProviderFactory

- (id)notificationSettingsForBundleIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  v5 = *MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__UNSDefaultDataProviderFactory_notificationSettingsForBundleIdentifier___block_invoke;
  block[3] = &unk_26462F950;
  id v11 = v4;
  v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)updateAuthorizationWithOptions:(unint64_t)a3 scheduledDeliveryEnabled:(BOOL)a4 forNotificationSourceDescription:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  v12 = [v10 bundleIdentifier];
  uint64_t v13 = *MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v12;
    __int16 v26 = 2048;
    unint64_t v27 = a3;
    _os_log_impl(&dword_22289A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating authorization options: %ld", buf, 0x16u);
  }
  queue = self->_queue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __140__UNSDefaultDataProviderFactory_updateAuthorizationWithOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke;
  v18[3] = &unk_26462FB90;
  id v21 = v11;
  unint64_t v22 = a3;
  BOOL v23 = a4;
  v18[4] = self;
  id v19 = v10;
  id v20 = v12;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  dispatch_async(queue, v18);
}

void __73__UNSDefaultDataProviderFactory_notificationSettingsForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSettingsForBundleIdentifier:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_notificationSettingsForBundleIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(UNSDefaultDataProviderFactory *)self _queue_effectiveSectionInfoForBundleIdentifier:v4];
  v6 = objc_msgSend(v5, "uns_notificationSettings");
  if (!v6)
  {
    v6 = [MEMORY[0x263F1DF60] emptySettings];
  }
  id v7 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v4;
    __int16 v11 = 1024;
    BOOL v12 = v6 != 0;
    _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got notification settings [ hasResult: %d ]", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (id)_queue_effectiveSectionInfoForBundleIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F1E028];
  v6 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting effective section info", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [(UNSSettingsGateway *)self->_settingsGateway effectiveSectionInfoForSectionID:v4];
  id v8 = *v5;
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

void __140__UNSDefaultDataProviderFactory_updateAuthorizationWithOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __140__UNSDefaultDataProviderFactory_updateAuthorizationWithOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke_2;
  v6[3] = &unk_26462FB18;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_queue_updateSettingsWithAuthorizationStatus:options:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:", 0, v2, v3, v5, v6);
}

- (void)_queue_updateSettingsWithAuthorizationStatus:(int64_t)a3 options:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 forNotificationSourceDescription:(id)a6 completionHandler:(id)a7
{
}

- (void)_queue_updateSettingsWithAuthorizationStatus:(int64_t)a3 options:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 expirationDate:(id)a6 lastUserGrantDate:(id)a7 forNotificationSourceDescription:(id)a8 completionHandler:(id)a9
{
  BOOL v11 = a5;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = [v17 bundleIdentifier];
  id v20 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v36 = v19;
    __int16 v37 = 2048;
    int64_t v38 = a3;
    __int16 v39 = 2048;
    unint64_t v40 = a4;
    __int16 v41 = 2112;
    id v42 = v15;
    __int16 v43 = 1024;
    BOOL v44 = v11;
    _os_log_impl(&dword_22289A000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update settings [authorizationStatus: %ld authorizationOptions: %ld authorizationExpirationDate: %@ scheduledDelivery: %{BOOL}d]", buf, 0x30u);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __195__UNSDefaultDataProviderFactory__queue_updateSettingsWithAuthorizationStatus_options_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke;
  v26[3] = &unk_26462FBE0;
  v26[4] = self;
  id v27 = v19;
  unint64_t v32 = a4;
  int64_t v33 = a3;
  id v28 = v17;
  id v29 = v15;
  BOOL v34 = v11;
  id v30 = v16;
  id v31 = v18;
  id v21 = v18;
  id v22 = v16;
  id v23 = v15;
  id v24 = v17;
  id v25 = v19;
  [(UNSDefaultDataProviderFactory *)self _queue_createDataProviderWithNotificationSourceDescription:v24 withCompletion:v26];
}

- (void)_queue_createDataProviderWithNotificationSourceDescription:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = [v6 bundleIdentifier];
  int v9 = [(NSMutableDictionary *)self->_bundleIdentifierToDataProvider objectForKey:v8];
  if (v9)
  {
    if (v7) {
      v7[2](v7, v9);
    }
    goto LABEL_17;
  }
  if (![v6 useDefaultDataProvider])
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_ERROR)) {
      -[UNSDefaultDataProviderFactory _queue_createDataProviderWithNotificationSourceDescription:withCompletion:]();
    }
    if (!v7) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ([v6 requiresTopics])
  {
    int v10 = [v6 defaultTopics];
    if (v10)
    {

      goto LABEL_14;
    }
    BOOL v11 = [(UNCNotificationTopicRepository *)self->_topicRepository topicsForBundleIdentifier:v8];

    if (v11) {
      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_ERROR)) {
      -[UNSDefaultDataProviderFactory _queue_createDataProviderWithNotificationSourceDescription:withCompletion:]();
    }
    if (!v7)
    {
LABEL_12:
      int v9 = 0;
      goto LABEL_17;
    }
LABEL_11:
    v7[2](v7, 0);
    goto LABEL_12;
  }
LABEL_14:
  __int16 v12 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v8;
    _os_log_impl(&dword_22289A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Create default data provider", buf, 0xCu);
  }
  BOOL v13 = [[UNSDefaultDataProvider alloc] initWithNotificationSourceDescription:v6 applicationLauncher:self->_appLauncher daemonLauncher:self->_daemonLauncher categoryRepository:self->_categoryRepository notificationRepository:self->_notificationRepository topicRepository:self->_topicRepository attachmentsService:self->_attachmentsService localizationService:self->_localizationService summaryService:self->_summaryService queue:self->_queue];
  uint64_t v14 = [(UNSDefaultDataProviderFactory *)self _queue_effectiveSectionInfoForBundleIdentifier:v8];
  [(UNSDefaultDataProvider *)v13 setEffectiveSectionInfo:v14];

  [(NSMutableDictionary *)self->_bundleIdentifierToDataProvider setObject:v13 forKey:v8];
  objc_initWeak((id *)buf, self->_notificationRepository);
  dataProviderConnection = self->_dataProviderConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __107__UNSDefaultDataProviderFactory__queue_createDataProviderWithNotificationSourceDescription_withCompletion___block_invoke;
  v17[3] = &unk_26462FC30;
  id v18 = v8;
  id v20 = v7;
  int v9 = v13;
  id v19 = v9;
  objc_copyWeak(&v21, (id *)buf);
  id v16 = [(BBDataProviderConnection *)dataProviderConnection addDataProvider:v9 withCompletionHandler:v17];
  [(UNSDefaultDataProvider *)v9 setProxy:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
LABEL_17:
}

void __195__UNSDefaultDataProviderFactory__queue_updateSettingsWithAuthorizationStatus_options_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "_queue_sectionInfoForBundleIdentifier:", *(void *)(a1 + 40));
    uint64_t v5 = (void *)[v4 copy];
    objc_msgSend(v5, "uns_setPropertiesFromAuthorizationOptions:supportsProvisionalAlerts:", *(void *)(a1 + 80), objc_msgSend(*(id *)(a1 + 48), "supportsProvisionalAlerts"));
    switch(*(void *)(a1 + 88))
    {
      case 1:
        id v6 = v5;
        uint64_t v7 = 1;
        goto LABEL_10;
      case 2:
        id v6 = v5;
        uint64_t v7 = 2;
        goto LABEL_10;
      case 3:
        id v6 = v5;
        uint64_t v7 = 3;
LABEL_10:
        [v6 setAuthorizationStatus:v7];
        break;
      case 4:
        [v5 setAuthorizationStatus:4];
        [v5 setAuthorizationExpirationDate:*(void *)(a1 + 56)];
        [v5 setLastUserGrantedAuthorizationDate:*(void *)(a1 + 64)];
        break;
      default:
        break;
    }
    if ([v4 authorizationStatus] == 3 && objc_msgSend(v5, "authorizationStatus") == 2)
    {
      uint64_t v15 = 0;
    }
    else
    {
      if ([v4 authorizationStatus]
        || [v5 authorizationStatus] != 3
        || ([*(id *)(a1 + 48) supportsProvisionalAlerts] & 1) != 0)
      {
LABEL_20:
        if (*(unsigned char *)(a1 + 96)) {
          uint64_t v16 = 2;
        }
        else {
          uint64_t v16 = 1;
        }
        [v5 setScheduledDeliverySetting:v16];
        if ([v4 isEqual:v5])
        {
          uint64_t v17 = *(void *)(a1 + 72);
          if (v17) {
            (*(void (**)(uint64_t, uint64_t, void))(v17 + 16))(v17, [v4 hasEnabledSettings], 0);
          }
        }
        else
        {
          id v18 = *MEMORY[0x263F1E028];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = *(void *)(a1 + 40);
            int v21 = 138543362;
            uint64_t v22 = v19;
            _os_log_impl(&dword_22289A000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update Section info", (uint8_t *)&v21, 0xCu);
          }
          objc_msgSend(*(id *)(a1 + 32), "_queue_setSectionInfo:forBundleIdentifier:", v5, *(void *)(a1 + 40));
          id v20 = objc_msgSend(*(id *)(a1 + 32), "_queue_sectionInfoForBundleIdentifier:", *(void *)(a1 + 40));
          (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), [v20 hasEnabledSettings], 0);
        }
        goto LABEL_30;
      }
      uint64_t v15 = 1;
    }
    [v5 deliverQuietly:v15 changeAuthorizationStatus:0];
    goto LABEL_20;
  }
  if (*(void *)(a1 + 72))
  {
    id v8 = *MEMORY[0x263F1E028];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_ERROR)) {
      __195__UNSDefaultDataProviderFactory__queue_updateSettingsWithAuthorizationStatus_options_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
LABEL_30:
}

void __140__UNSDefaultDataProviderFactory_updateAuthorizationWithOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Authorization granted: %d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (id)_queue_sectionInfoForBundleIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F1E028];
  id v6 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting section info", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = [(UNSSettingsGateway *)self->_settingsGateway sectionInfoForSectionID:v4];
  uint64_t v8 = *v5;
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

- (UNSDefaultDataProviderFactory)initWithApplicationLauncher:(id)a3 daemonLauncher:(id)a4 categoryRepository:(id)a5 notificationRepository:(id)a6 attachmentsService:(id)a7 topicRepository:(id)a8 localizationService:(id)a9 summaryService:(id)a10 settingsGateway:(id)a11
{
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  id v41 = a6;
  id v40 = a7;
  id v39 = a8;
  id v38 = a9;
  id v37 = a10;
  id v36 = a11;
  v45.receiver = self;
  v45.super_class = (Class)UNSDefaultDataProviderFactory;
  id v18 = [(UNSDefaultDataProviderFactory *)&v45 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_appLauncher, a3);
    objc_storeStrong((id *)&v19->_daemonLauncher, a4);
    objc_storeStrong((id *)&v19->_categoryRepository, a5);
    objc_storeStrong((id *)&v19->_notificationRepository, a6);
    objc_storeStrong((id *)&v19->_topicRepository, a8);
    objc_storeStrong((id *)&v19->_localizationService, a9);
    objc_storeStrong((id *)&v19->_summaryService, a10);
    id v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bundleIdentifierToDataProvider = v19->_bundleIdentifierToDataProvider;
    v19->_bundleIdentifierToDataProvider = v20;

    uint64_t v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    authorizedBundleIdentifiers = v19->_authorizedBundleIdentifiers;
    v19->_authorizedBundleIdentifiers = v22;

    uint64_t v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    supportedBundleIdentifiers = v19->_supportedBundleIdentifiers;
    v19->_supportedBundleIdentifiers = v24;

    __int16 v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observers = v19->_observers;
    v19->_observers = v26;

    id v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.usernotificationsserver.DefaultDataProviderFactory", v28);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v29;

    objc_storeStrong((id *)&v19->_attachmentsService, a7);
    uint64_t v31 = [objc_alloc(MEMORY[0x263F2BC70]) initWithServiceName:@"com.apple.usernotificationsserver.DefaultDataProviderFactory" onQueue:v19->_queue];
    dataProviderConnection = v19->_dataProviderConnection;
    v19->_dataProviderConnection = (BBDataProviderConnection *)v31;

    objc_storeStrong((id *)&v19->_settingsGateway, a11);
    uint64_t v33 = [objc_alloc(MEMORY[0x263F2BC90]) initWithQueue:v19->_queue];
    settingsObserver = v19->_settingsObserver;
    v19->_settingsObserver = (BBObserver *)v33;

    [(BBObserver *)v19->_settingsObserver setObserverFeed:512];
    [(BBObserver *)v19->_settingsObserver setDelegate:v19];
  }

  return v19;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(BBDataProviderConnection *)self->_dataProviderConnection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)UNSDefaultDataProviderFactory;
  [(UNSDefaultDataProviderFactory *)&v4 dealloc];
}

- (id)notificationSettingsForTopicsWithBundleIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__2;
  uint64_t v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  id v5 = *MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings for topics", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__UNSDefaultDataProviderFactory_notificationSettingsForTopicsWithBundleIdentifier___block_invoke;
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

void __83__UNSDefaultDataProviderFactory_notificationSettingsForTopicsWithBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSettingsForTopicsWithBundleIdentifier:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)requestAuthorizationStatus:(int64_t)a3 withOptions:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 forNotificationSourceDescription:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [v12 bundleIdentifier];
  uint64_t v15 = *MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v28 = v14;
    __int16 v29 = 2048;
    int64_t v30 = a3;
    __int16 v31 = 2048;
    unint64_t v32 = a4;
    __int16 v33 = 1024;
    BOOL v34 = v8;
    _os_log_impl(&dword_22289A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization status: %ld options: %ld scheduledDelivery: %{BOOL}d", buf, 0x26u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __148__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_26462FB40;
  int64_t v24 = a3;
  unint64_t v25 = a4;
  BOOL v26 = v8;
  block[4] = self;
  id v21 = v12;
  id v22 = v14;
  id v23 = v13;
  id v17 = v13;
  id v18 = v14;
  id v19 = v12;
  dispatch_async(queue, block);
}

void __148__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __148__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke_2;
  v7[3] = &unk_26462FB18;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  objc_msgSend(v5, "_queue_updateSettingsWithAuthorizationStatus:options:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:", v2, v3, v4, v6, v7);
}

void __148__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Authorization granted: %d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)requestAuthorizationStatus:(int64_t)a3 withOptions:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 expirationDate:(id)a6 lastUserGrantDate:(id)a7 forNotificationSourceDescription:(id)a8 completionHandler:(id)a9
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = [v17 bundleIdentifier];
  id v20 = *MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v37 = v19;
    __int16 v38 = 2048;
    int64_t v39 = a3;
    __int16 v40 = 2048;
    unint64_t v41 = a4;
    __int16 v42 = 2112;
    id v43 = v15;
    _os_log_impl(&dword_22289A000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization status: %ld options: %ld expiration: %@", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __181__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_26462FB68;
  int64_t v33 = a3;
  unint64_t v34 = a4;
  BOOL v35 = a5;
  block[4] = self;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  id v31 = v19;
  id v32 = v18;
  id v22 = v18;
  id v23 = v19;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  dispatch_async(queue, block);
}

void __181__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 96);
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __181__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke_2;
  v9[3] = &unk_26462FB18;
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  objc_msgSend(v5, "_queue_updateSettingsWithAuthorizationStatus:options:scheduledDeliveryEnabled:expirationDate:lastUserGrantDate:forNotificationSourceDescription:completionHandler:", v2, v3, v4, v6, v7, v8, v9);
}

void __181__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Authorization granted: %d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)requestRemoveAuthorizationforNotificationSourceDescription:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __110__UNSDefaultDataProviderFactory_requestRemoveAuthorizationforNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_26462F208;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __110__UNSDefaultDataProviderFactory_requestRemoveAuthorizationforNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) bundleIdentifier];
  objc_msgSend(v2, "_queue_removeDataProviderWithBundleIdentifier:completionHandler:", v3, *(void *)(a1 + 48));
}

- (void)setCriticalAlertAuthorization:(BOOL)a3 forNotificationSourceDescription:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __114__UNSDefaultDataProviderFactory_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke;
  v13[3] = &unk_26462FBB8;
  BOOL v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __114__UNSDefaultDataProviderFactory_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __114__UNSDefaultDataProviderFactory_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke_2;
  v5[3] = &unk_26462FB18;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_queue_setCriticalAlertAuthorization:forNotificationSourceDescription:completionHandler:", v2, v6, v5);
}

void __114__UNSDefaultDataProviderFactory_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)*MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = [v7 bundleIdentifier];
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 1024;
    int v14 = a2;
    _os_log_impl(&dword_22289A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Authorization granted: %d", (uint8_t *)&v11, 0x12u);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__UNSDefaultDataProviderFactory_addObserver___block_invoke;
  v7[3] = &unk_26462F430;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __45__UNSDefaultDataProviderFactory_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:", *(void *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__UNSDefaultDataProviderFactory_removeObserver___block_invoke;
  v7[3] = &unk_26462F430;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __48__UNSDefaultDataProviderFactory_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:", *(void *)(a1 + 40));
}

- (void)_queue_sectionInfoDidChange:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 sectionID];
  id v20 = v4;
  id v6 = objc_msgSend(v4, "uns_notificationSettings");
  int v7 = [v6 hasEnabledSettings];
  int v8 = [(NSMutableSet *)self->_authorizedBundleIdentifiers containsObject:v5];
  id v9 = (os_log_t *)MEMORY[0x263F1E028];
  if (v7 != v8)
  {
    uint64_t v10 = *MEMORY[0x263F1E028];
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v5;
        _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] User notification settings were enabled", buf, 0xCu);
      }
      [(NSMutableSet *)self->_authorizedBundleIdentifiers addObject:v5];
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v5;
        _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] User notification settings were disabled", buf, 0xCu);
      }
      [(NSMutableSet *)self->_authorizedBundleIdentifiers removeObject:v5];
    }
  }
  id v12 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v5;
    _os_log_impl(&dword_22289A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notify observers that user notifications settings were updated", buf, 0xCu);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  __int16 v13 = self->_observers;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
        if (objc_opt_respondsToSelector()) {
          [v18 didChangeNotificationSettings:v6 forBundleIdentifier:v5];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  id v19 = [(NSMutableDictionary *)self->_bundleIdentifierToDataProvider objectForKey:v5];
  [v19 setEffectiveSectionInfo:v20];
}

- (void)_queue_addObserver:(id)a3
{
}

- (void)_queue_removeObserver:(id)a3
{
}

- (id)_queue_notificationSettingsForTopicsWithBundleIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = [(UNSDefaultDataProviderFactory *)self _queue_sectionInfoForBundleIdentifier:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v7 = objc_msgSend(v6, "subsections", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        __int16 v13 = [v12 subsectionID];
        uint64_t v14 = objc_msgSend(v12, "uns_notificationSettings");
        [v5 setObject:v14 forKey:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v9);
  }

  uint64_t v15 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = v4;
    __int16 v23 = 1024;
    BOOL v24 = v5 != 0;
    _os_log_impl(&dword_22289A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got notification settings for topics [ hasResult: %d ]", buf, 0x12u);
  }

  return v5;
}

- (void)_queue_setSectionInfo:(id)a3 forBundleIdentifier:(id)a4
{
}

- (void)_queue_setCriticalAlertAuthorization:(BOOL)a3 forNotificationSourceDescription:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __121__UNSDefaultDataProviderFactory__queue_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke;
  v12[3] = &unk_26462FC08;
  id v13 = v8;
  uint64_t v14 = self;
  BOOL v16 = a3;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(UNSDefaultDataProviderFactory *)self _queue_createDataProviderWithNotificationSourceDescription:v11 withCompletion:v12];
}

void __121__UNSDefaultDataProviderFactory__queue_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = [*(id *)(a1 + 32) bundleIdentifier];
  if (a2)
  {
    id v5 = objc_msgSend(*(id *)(a1 + 40), "_queue_sectionInfoForBundleIdentifier:", v4);
    id v6 = *MEMORY[0x263F1E028];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(unsigned __int8 *)(a1 + 56);
      int v12 = 138543618;
      id v13 = v4;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set criticalAlert to %d", (uint8_t *)&v12, 0x12u);
    }
    id v8 = (void *)[v5 copy];
    id v9 = v8;
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    [v8 setCriticalAlertSetting:v10];
    objc_msgSend(*(id *)(a1 + 40), "_queue_setSectionInfo:forBundleIdentifier:", v9, v4);
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, BOOL, void))(v11 + 16))(v11, [v9 criticalAlertSetting] == 2, 0);
    }
  }
  else if (*(void *)(a1 + 48))
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_ERROR)) {
      __121__UNSDefaultDataProviderFactory__queue_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __107__UNSDefaultDataProviderFactory__queue_createDataProviderWithNotificationSourceDescription_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (NSObject **)MEMORY[0x263F1E028];
  id v3 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v4;
    _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did create default data provider", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 40));
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v7 = *v2;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Purging invalid notification records", (uint8_t *)&v9, 0xCu);
  }
  [WeakRetained removeInvalidNotificationRecordsForBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)_queue_removeDataProviderWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, BOOL, void))a4;
  uint64_t v8 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_22289A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove data provider", (uint8_t *)&v11, 0xCu);
  }
  int v9 = [(NSMutableDictionary *)self->_bundleIdentifierToDataProvider objectForKey:v6];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 uninstall];
    [(BBDataProviderConnection *)self->_dataProviderConnection removeDataProviderWithSectionID:v6];
    [(NSMutableDictionary *)self->_bundleIdentifierToDataProvider removeObjectForKey:v6];
    [(NSMutableSet *)self->_authorizedBundleIdentifiers removeObject:v6];
  }
  if (v7) {
    v7[2](v7, v10 != 0, 0);
  }
}

- (void)_queue_createNewDefaultDataProviders:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "Getting all section infos possible default data providers", buf, 2u);
  }
  long long v18 = v3;
  if ([v3 count])
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = [MEMORY[0x263EFF9C0] set];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v3;
    uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          int v11 = [v10 bundleIdentifier];
          [v5 setObject:v10 forKey:v11];
          if ([v10 useDefaultDataProvider]
            && [v10 suppressUserAuthorizationPrompt]
            && (([v10 hideSettings] & 1) != 0
             || [v10 automaticallyShowSettings]))
          {
            id v12 = (void *)*MEMORY[0x263F1E028];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = v12;
              int v14 = [v10 useDefaultDataProvider];
              int v15 = [v10 suppressUserAuthorizationPrompt];
              int v16 = [v10 hideSettings];
              *(_DWORD *)buf = 138544130;
              id v30 = v11;
              __int16 v31 = 1024;
              int v32 = v14;
              __int16 v33 = 1024;
              int v34 = v15;
              __int16 v35 = 1024;
              int v36 = v16;
              _os_log_impl(&dword_22289A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Automatically create data provider [ useDefaultDataProvider: %d suppressUserAuthorizationPrompt: %d hideSettings: %d]", buf, 0x1Eu);
            }
            [(UNSDefaultDataProviderFactory *)self _queue_createDataProviderWithNotificationSourceDescription:v10 withCompletion:0];
          }
          else
          {
            [v6 addObject:v11];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v7);
    }

    if ([v6 count])
    {
      objc_initWeak((id *)buf, self->_queue);
      settingsGateway = self->_settingsGateway;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __70__UNSDefaultDataProviderFactory__queue_createNewDefaultDataProviders___block_invoke;
      v21[3] = &unk_26462FC58;
      objc_copyWeak(&v24, (id *)buf);
      id v22 = v5;
      __int16 v23 = self;
      [(UNSSettingsGateway *)settingsGateway getSectionInfoForSectionIDs:v6 withCompletion:v21];

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __70__UNSDefaultDataProviderFactory__queue_createNewDefaultDataProviders___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__UNSDefaultDataProviderFactory__queue_createNewDefaultDataProviders___block_invoke_2;
    block[3] = &unk_26462F678;
    id v8 = v3;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = v6;
    dispatch_async(WeakRetained, block);
  }
}

void __70__UNSDefaultDataProviderFactory__queue_createNewDefaultDataProviders___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = (os_log_t *)MEMORY[0x263F1E028];
  id v3 = (void *)*MEMORY[0x263F1E028];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = v3;
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = [v4 count];
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Got %ld section infos for default data providers with visible settings", buf, 0xCu);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v22;
    *(void *)&long long v8 = 138543618;
    long long v20 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        os_log_t v13 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = v13;
          int v15 = [v12 sectionID];
          int v16 = [v12 hasEnabledSettings];
          *(_DWORD *)buf = v20;
          uint64_t v26 = (uint64_t)v15;
          __int16 v27 = 1024;
          int v28 = v16;
          _os_log_impl(&dword_22289A000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got section info [ enabled: %d ]", buf, 0x12u);
        }
        long long v17 = *(void **)(a1 + 40);
        long long v18 = objc_msgSend(v12, "sectionID", v20, (void)v21);
        long long v19 = [v17 objectForKey:v18];

        objc_msgSend(*(id *)(a1 + 48), "_queue_createDataProviderWithNotificationSourceDescription:withCompletion:", v19, 0);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v9);
  }
}

- (void)_queue_notificationSourcesDidInstall:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(UNSDefaultDataProviderFactory *)self _queue_notificationSourceDidInstall:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  uint64_t v9 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_7);
  [(UNSDefaultDataProviderFactory *)self _queue_createNewDefaultDataProviders:v9];
}

uint64_t __70__UNSDefaultDataProviderFactory__queue_notificationSourcesDidInstall___block_invoke(uint64_t a1, void *a2)
{
  return [a2 useDefaultDataProvider];
}

- (void)_queue_notificationSourceDidInstall:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 bundleIdentifier];
  int v6 = [v4 useDefaultDataProvider];
  uint64_t v7 = *MEMORY[0x263F1E028];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      long long v10 = v5;
      _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application installed using default data provider", (uint8_t *)&v9, 0xCu);
    }
    [(NSMutableSet *)self->_supportedBundleIdentifiers addObject:v5];
    uint64_t v8 = [(NSMutableDictionary *)self->_bundleIdentifierToDataProvider objectForKey:v5];
    [v8 setNotificationSourceDescription:v4];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEBUG))
  {
    -[UNSDefaultDataProviderFactory _queue_notificationSourceDidInstall:]();
  }
}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(UNSDefaultDataProviderFactory *)self _queue_notificationSourceDidUninstall:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_queue_notificationSourceDidUninstall:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 bundleIdentifier];
  int v6 = [v4 useDefaultDataProvider];

  uint64_t v7 = *MEMORY[0x263F1E028];
  uint64_t v8 = *MEMORY[0x263F1E028];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      long long v10 = v5;
      _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application uninstalled using default data provider", (uint8_t *)&v9, 0xCu);
    }
    [(NSMutableSet *)self->_supportedBundleIdentifiers removeObject:v5];
    [(UNSDefaultDataProviderFactory *)self _queue_removeDataProviderWithBundleIdentifier:v5 completionHandler:0];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[UNSDefaultDataProviderFactory _queue_notificationSourceDidUninstall:]();
  }
}

- (void)notificationSourcesDidInstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__UNSDefaultDataProviderFactory_notificationSourcesDidInstall___block_invoke;
  v7[3] = &unk_26462F430;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __63__UNSDefaultDataProviderFactory_notificationSourcesDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidInstall:", *(void *)(a1 + 40));
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__UNSDefaultDataProviderFactory_notificationSourcesDidUninstall___block_invoke;
  v7[3] = &unk_26462F430;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __65__UNSDefaultDataProviderFactory_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(void *)(a1 + 40));
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__UNSDefaultDataProviderFactory_observer_updateSectionInfo___block_invoke;
  v8[3] = &unk_26462F430;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __60__UNSDefaultDataProviderFactory_observer_updateSectionInfo___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) sectionID];
  int v3 = [*(id *)(*(void *)(a1 + 40) + 24) containsObject:v2];
  id v4 = *MEMORY[0x263F1E028];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v2;
      _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Default data provider section info did change", (uint8_t *)&v7, 0xCu);
    }
    id v5 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:v2];
    if (!v5)
    {
      id v6 = [MEMORY[0x263F84278] sourceDescriptionWithBundleIdentifier:v2];
      if (v6) {
        objc_msgSend(*(id *)(a1 + 40), "_queue_createDataProviderWithNotificationSourceDescription:withCompletion:", v6, 0);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_queue_sectionInfoDidChange:", *(void *)(a1 + 32));
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E028], OS_LOG_TYPE_DEBUG))
  {
    __60__UNSDefaultDataProviderFactory_observer_updateSectionInfo___block_invoke_cold_1();
  }
}

- (void)observer:(id)a3 removeSection:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__UNSDefaultDataProviderFactory_observer_removeSection___block_invoke;
  v8[3] = &unk_26462F430;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __56__UNSDefaultDataProviderFactory_observer_removeSection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeDataProviderWithBundleIdentifier:completionHandler:", *(void *)(a1 + 40), 0);
}

- (NSMutableDictionary)bundleIdentifierToDataProvider
{
  return self->_bundleIdentifierToDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_summaryService, 0);
  objc_storeStrong((id *)&self->_settingsObserver, 0);
  objc_storeStrong((id *)&self->_dataProviderConnection, 0);
  objc_storeStrong((id *)&self->_attachmentsService, 0);
  objc_storeStrong((id *)&self->_topicRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_daemonLauncher, 0);
  objc_storeStrong((id *)&self->_appLauncher, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_supportedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_authorizedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToDataProvider, 0);
}

void __195__UNSDefaultDataProviderFactory__queue_updateSettingsWithAuthorizationStatus_options_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __121__UNSDefaultDataProviderFactory__queue_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] No data provider", v2, v3, v4, v5, v6);
}

- (void)_queue_createDataProviderWithNotificationSourceDescription:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Do not register notification settings for an app requires topics but does not have them defined", v2, v3, v4, v5, v6);
}

- (void)_queue_createDataProviderWithNotificationSourceDescription:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Do not register notification settings for an app that is using a custom data provider", v2, v3, v4, v5, v6);
}

- (void)_queue_notificationSourceDidInstall:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_22289A000, v0, v1, "[%{public}@] Application installed using custom data provider", v2, v3, v4, v5, v6);
}

- (void)_queue_notificationSourceDidUninstall:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_22289A000, v0, v1, "[%{public}@] Application uninstalled using custom data provider", v2, v3, v4, v5, v6);
}

void __60__UNSDefaultDataProviderFactory_observer_updateSectionInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_22289A000, v0, v1, "[%{public}@] Section info updated for custom data provider", v2, v3, v4, v5, v6);
}

@end