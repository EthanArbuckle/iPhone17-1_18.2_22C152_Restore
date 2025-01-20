@interface WFTriggerRegistrar
- (OS_dispatch_queue)queue;
- (SwiftVCDaemonXPCEventHandler)eventHandler;
- (WFBiomeListener)biomeListener;
- (WFCoreDuetListener)coreDuetListener;
- (WFDatabaseProvider)databaseProvider;
- (WFTriggerBootManager)triggerBootManager;
- (WFTriggerEventQueue)eventQueue;
- (WFTriggerNotificationScheduler)scheduler;
- (WFTriggerRegistrar)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4 userNotificationManager:(id)a5;
- (id)unableToLoadDatabaseErrorWithUnderlyingError:(id)a3;
- (int64_t)triggerBackingForConfiguredTrigger:(id)a3;
- (void)dealloc;
- (void)deleteTriggerWithIdentifier:(id)a3 allowedDeletionClasses:(id)a4 completion:(id)a5;
- (void)deleteTriggerWithIdentifier:(id)a3 completion:(id)a4;
- (void)deviceDidUnlockForFirstTime;
- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6;
- (void)getConfiguredTriggerDescriptionsWithCompletion:(id)a3;
- (void)handleRemovedIgnoredNotifications:(id)a3;
- (void)queue_registerConfiguredTrigger:(id)a3 completion:(id)a4;
- (void)queue_unregisterConfiguredTrigger:(id)a3;
- (void)queue_unregisterConfiguredTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4;
- (void)registerAllTriggersWithCompletion:(id)a3;
- (void)registerTriggerWithIdentifier:(id)a3 completion:(id)a4;
- (void)timeChangeDidOccur;
- (void)timezoneChangeDidOccur;
- (void)unregisterAllTriggers;
- (void)unregisterTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4;
@end

@implementation WFTriggerRegistrar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerBootManager, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_biomeListener, 0);
  objc_storeStrong((id *)&self->_coreDuetListener, 0);
}

- (WFTriggerBootManager)triggerBootManager
{
  return self->_triggerBootManager;
}

- (WFTriggerEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFTriggerNotificationScheduler)scheduler
{
  return self->_scheduler;
}

- (WFBiomeListener)biomeListener
{
  return self->_biomeListener;
}

- (WFCoreDuetListener)coreDuetListener
{
  return self->_coreDuetListener;
}

- (id)unableToLoadDatabaseErrorWithUnderlyingError:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, a3, @"Unable to load database");
}

- (int64_t)triggerBackingForConfiguredTrigger:(id)a3
{
  v3 = [a3 trigger];
  int64_t v4 = [(id)objc_opt_class() triggerBacking];

  return v4;
}

- (void)getConfiguredTriggerDescriptionsWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFTriggerRegistrar.m", 264, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v6 = [(WFTriggerRegistrar *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__WFTriggerRegistrar_getConfiguredTriggerDescriptionsWithCompletion___block_invoke;
  block[3] = &unk_1E6541728;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __69__WFTriggerRegistrar_getConfiguredTriggerDescriptionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) databaseProvider];
  id v10 = 0;
  v3 = [v2 databaseWithError:&v10];
  id v4 = v10;

  if (v3)
  {
    id v5 = [v3 allConfiguredTriggers];
    v6 = [v5 descriptors];
    id v7 = objc_msgSend(v6, "if_map:", &__block_literal_global_4542);

    v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) unableToLoadDatabaseErrorWithUnderlyingError:v4];
    v9 = getWFTriggersLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFTriggerRegistrar getConfiguredTriggerDescriptionsWithCompletion:]_block_invoke";
      __int16 v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Failed to get configured trigger descriptions: %{public}@", buf, 0x16u);
    }

    v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

id __69__WFTriggerRegistrar_getConfiguredTriggerDescriptionsWithCompletion___block_invoke_204(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 identifier];
  id v4 = [v2 trigger];

  id v5 = NSString;
  v6 = [(id)objc_opt_class() localizedDisplayName];
  id v7 = [v4 localizedDescriptionWithConfigurationSummary];
  v8 = [v5 stringWithFormat:@"%@ %@: %@", v3, v6, v7];

  return v8;
}

- (void)deleteTriggerWithIdentifier:(id)a3 allowedDeletionClasses:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(WFTriggerRegistrar *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WFTriggerRegistrar_deleteTriggerWithIdentifier_allowedDeletionClasses_completion___block_invoke;
  block[3] = &unk_1E65415F0;
  block[4] = self;
  id v17 = v9;
  id v19 = v11;
  SEL v20 = a2;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __84__WFTriggerRegistrar_deleteTriggerWithIdentifier_allowedDeletionClasses_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseProvider];
  id v12 = 0;
  v3 = [v2 databaseWithError:&v12];
  id v4 = v12;

  if (v3)
  {
    id v5 = [v3 configuredTriggerForTriggerID:*(void *)(a1 + 40)];
    if (!v5) {
      goto LABEL_10;
    }
    if (![*(id *)(a1 + 32) triggerBackingForConfiguredTrigger:v5])
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"WFTriggerRegistrar.m" lineNumber:245 description:@"Trigger did not specify a backing source and cannot be registered."];
    }
    if (![*(id *)(a1 + 48) count]
      || (v6 = *(void **)(a1 + 48),
          [v5 trigger],
          id v7 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v6) = [v6 containsObject:objc_opt_class()],
          v7,
          (v6 & 1) != 0))
    {
      id v11 = 0;
      char v8 = [v3 deleteReference:v5 error:&v11];
      id v9 = v11;
      if (v8) {
        objc_msgSend(*(id *)(a1 + 32), "queue_unregisterConfiguredTrigger:", v5);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
LABEL_10:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)deleteTriggerWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(WFTriggerRegistrar *)self queue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__WFTriggerRegistrar_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke;
  v18[3] = &unk_1E6540EE8;
  v18[4] = self;
  id v19 = v11;
  id v21 = v13;
  SEL v22 = a2;
  BOOL v23 = a4;
  id v20 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(v14, v18);
}

void __75__WFTriggerRegistrar_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseProvider];
  id v10 = 0;
  v3 = [v2 databaseWithError:&v10];
  id v4 = v10;

  if (!v3)
  {
    uint64_t v8 = *(void *)(a1 + 56);
    id v5 = [*(id *)(a1 + 32) unableToLoadDatabaseErrorWithUnderlyingError:v4];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v5);
    goto LABEL_14;
  }
  id v5 = [v3 configuredTriggerForTriggerID:*(void *)(a1 + 40)];
  if (!v5)
  {
    (*(void (**)(void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, 0);
    goto LABEL_14;
  }
  uint64_t v6 = [*(id *)(a1 + 32) triggerBackingForConfiguredTrigger:v5];
  switch(v6)
  {
    case 1:
      id v9 = [*(id *)(a1 + 32) coreDuetListener];
LABEL_12:
      id v7 = v9;
      [v9 fireTriggerWithIdentifier:*(void *)(a1 + 40) force:*(unsigned __int8 *)(a1 + 72) eventInfo:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
      goto LABEL_13;
    case 2:
      id v9 = [*(id *)(a1 + 32) biomeListener];
      goto LABEL_12;
    case 0:
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"WFTriggerRegistrar.m" lineNumber:215 description:@"Trigger did not specify a backing source and cannot be fired."];
LABEL_13:

      break;
  }
LABEL_14:
}

- (void)queue_unregisterConfiguredTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4
{
  id v14 = a3;
  uint64_t v6 = [(WFTriggerRegistrar *)self queue];
  dispatch_assert_queue_V2(v6);

  if (a4 == 2)
  {
    id v7 = [(WFTriggerRegistrar *)self biomeListener];
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    id v7 = [(WFTriggerRegistrar *)self coreDuetListener];
  }
  uint64_t v8 = v7;
  [v7 unregisterConfiguredTriggerWithIdentifier:v14];

LABEL_6:
  id v9 = [(WFTriggerRegistrar *)self databaseProvider];
  id v10 = [v9 databaseWithError:0];

  id v11 = [(WFTriggerRegistrar *)self triggerBootManager];
  id v12 = [v10 allConfiguredTriggers];
  id v13 = [v12 descriptors];
  [v11 configuredTriggersDidChange:v13];
}

- (void)queue_unregisterConfiguredTrigger:(id)a3
{
  id v15 = a3;
  id v5 = [(WFTriggerRegistrar *)self queue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(WFTriggerRegistrar *)self triggerBackingForConfiguredTrigger:v15];
  id v7 = NSString;
  uint64_t v8 = [v15 trigger];
  id v9 = [v7 stringWithFormat:@"Trigger (%@) did not specify a backing source and cannot be unregistered", v8];

  if (!v6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"WFTriggerRegistrar.m" lineNumber:180 description:v9];
  }
  id v10 = [(WFTriggerRegistrar *)self scheduler];
  id v11 = [v15 identifier];
  [v10 cancelActivitiesFromTriggerIdentifier:v11];

  id v12 = [v15 identifier];
  id v13 = [v15 trigger];
  -[WFTriggerRegistrar queue_unregisterConfiguredTriggerWithIdentifier:triggerBacking:](self, "queue_unregisterConfiguredTriggerWithIdentifier:triggerBacking:", v12, [(id)objc_opt_class() triggerBacking]);
}

- (void)unregisterTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(WFTriggerRegistrar *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__WFTriggerRegistrar_unregisterTriggerWithIdentifier_triggerBacking___block_invoke;
  block[3] = &unk_1E6540EC0;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __69__WFTriggerRegistrar_unregisterTriggerWithIdentifier_triggerBacking___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseProvider];
  id v6 = 0;
  v3 = [v2 databaseWithError:&v6];
  id v4 = v6;

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) scheduler];
    [v5 cancelActivitiesFromTriggerIdentifier:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(a1 + 32), "queue_unregisterConfiguredTriggerWithIdentifier:triggerBacking:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

- (void)unregisterAllTriggers
{
  v3 = [(WFTriggerRegistrar *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__WFTriggerRegistrar_unregisterAllTriggers__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __43__WFTriggerRegistrar_unregisterAllTriggers__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) databaseProvider];
  id v15 = 0;
  v3 = [v2 databaseWithError:&v15];
  id v4 = v15;

  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(v3, "allConfiguredTriggers", 0);
    id v6 = [v5 descriptors];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(a1 + 32), "queue_unregisterConfiguredTrigger:", *(void *)(*((void *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)queue_registerConfiguredTrigger:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFTriggerRegistrar *)self queue];
  dispatch_assert_queue_V2(v8);

  int64_t v9 = [(WFTriggerRegistrar *)self triggerBackingForConfiguredTrigger:v12];
  if (v9 == 1)
  {
    long long v11 = [(WFTriggerRegistrar *)self coreDuetListener];
LABEL_7:
    uint64_t v10 = v11;
    [v11 registerConfiguredTrigger:v12 completion:v7];
    goto LABEL_8;
  }
  if (v9 == 2)
  {
    long long v11 = [(WFTriggerRegistrar *)self biomeListener];
    goto LABEL_7;
  }
  if (v9) {
    goto LABEL_9;
  }
  uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2 object:self file:@"WFTriggerRegistrar.m" lineNumber:138 description:@"Trigger did not specify a backing source and cannot be registered."];
LABEL_8:

LABEL_9:
}

- (void)registerTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFTriggerRegistrar *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__WFTriggerRegistrar_registerTriggerWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E6541F40;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __63__WFTriggerRegistrar_registerTriggerWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) databaseProvider];
  id v13 = 0;
  v3 = [v2 databaseWithError:&v13];
  id v4 = v13;

  if (v3)
  {
    uint64_t v5 = [v3 configuredTriggerForTriggerID:*(void *)(a1 + 40)];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [*(id *)(a1 + 32) triggerBootManager];
      uint64_t v8 = [v3 allConfiguredTriggers];
      id v9 = [v8 descriptors];
      [v7 configuredTriggersDidChange:v9];

      objc_msgSend(*(id *)(a1 + 32), "queue_registerConfiguredTrigger:completion:", v6, *(void *)(a1 + 48));
    }
    else
    {
      long long v11 = getWFTriggersLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        id v15 = "-[WFTriggerRegistrar registerTriggerWithIdentifier:completion:]_block_invoke";
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s No configured trigger for identifier: %@", buf, 0x16u);
      }

      id v6 = 0;
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) unableToLoadDatabaseErrorWithUnderlyingError:v4];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v6);
  }
}

- (void)registerAllTriggersWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFTriggerRegistrar *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke;
  v7[3] = &unk_1E6541728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseProvider];
  id v15 = 0;
  v3 = [v2 databaseWithError:&v15];
  id v4 = v15;

  if (v3)
  {
    uint64_t v5 = [*(id *)(a1 + 32) triggerBootManager];
    id v6 = [v3 allConfiguredTriggers];
    id v7 = [v6 descriptors];
    [v5 configuredTriggersDidChange:v7];

    id v8 = [v3 allConfiguredTriggers];
    id v9 = [v8 descriptors];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_2;
    v14[3] = &unk_1E6540E98;
    v14[4] = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_4;
    v12[3] = &unk_1E6540FE8;
    id v13 = *(id *)(a1 + 40);
    objc_msgSend(v9, "if_mapAsynchronously:completionHandler:", v14, v12);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      long long v11 = [*(id *)(a1 + 32) unableToLoadDatabaseErrorWithUnderlyingError:v4];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
    }
  }
}

void __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_3;
  v9[3] = &unk_1E6540E70;
  id v10 = v6;
  id v8 = v6;
  objc_msgSend(v7, "queue_registerConfiguredTrigger:completion:", a2, v9);
}

uint64_t __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  }
  return result;
}

uint64_t __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleRemovedIgnoredNotifications:(id)a3
{
  id v4 = a3;
  id v5 = [(WFTriggerRegistrar *)self eventQueue];
  [v5 handleRemovedIgnoredNotifications:v4];
}

- (void)timeChangeDidOccur
{
}

- (void)timezoneChangeDidOccur
{
}

- (void)deviceDidUnlockForFirstTime
{
  v3 = [(WFTriggerRegistrar *)self triggerBootManager];
  [v3 deviceWasUnlockedForTheFirstTime];

  [(WFTriggerRegistrar *)self registerAllTriggersWithCompletion:0];
}

- (void)dealloc
{
  v3 = [(WFTriggerRegistrar *)self eventHandler];
  [v3 removeObserver:self name:@"com.apple.mobile.keybagd.first_unlock"];

  id v4 = [(WFTriggerRegistrar *)self eventHandler];
  [v4 removeObserver:self name:@"com.apple.system.timezone"];

  id v5 = [(WFTriggerRegistrar *)self eventHandler];
  [v5 removeObserver:self name:@"com.apple.system.clock_set"];

  v6.receiver = self;
  v6.super_class = (Class)WFTriggerRegistrar;
  [(WFTriggerRegistrar *)&v6 dealloc];
}

- (WFTriggerRegistrar)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4 userNotificationManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)WFTriggerRegistrar;
  uint64_t v12 = [(WFTriggerRegistrar *)&v32 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseProvider, a3);
    objc_storeStrong((id *)&v13->_eventHandler, a4);
    long long v14 = [[WFTriggerUserNotificationManager alloc] initWithUserNotificationManager:v11];
    id v15 = [[WFTriggerNotificationScheduler alloc] initWithUserNotificationManager:v14 databaseProvider:v9];
    scheduler = v13->_scheduler;
    v13->_scheduler = v15;

    uint64_t v17 = [[WFTriggerBootManager alloc] initWithDatabaseProvider:v9];
    [(WFTriggerBootManager *)v17 start];
    triggerBootManager = v13->_triggerBootManager;
    v13->_triggerBootManager = v17;
    id v19 = v17;

    id v20 = [[WFTriggerEventQueue alloc] initWithDatabaseProvider:v9 notificationManager:v14 notificationScheduler:v13->_scheduler triggerBootManager:v19];
    eventQueue = v13->_eventQueue;
    v13->_eventQueue = v20;

    SEL v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.siriactionsd.WFTriggerRegistrar", v23);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v24;

    v26 = [[WFCoreDuetListener alloc] initWithDatabaseProvider:v9 eventQueue:v13->_eventQueue];
    coreDuetListener = v13->_coreDuetListener;
    v13->_coreDuetListener = v26;

    v28 = [[WFBiomeListener alloc] initWithEventQueue:v13->_eventQueue];
    biomeListener = v13->_biomeListener;
    v13->_biomeListener = v28;

    [(SwiftVCDaemonXPCEventHandler *)v13->_eventHandler addObserver:v13 selector:sel_deviceDidUnlockForFirstTime name:@"com.apple.mobile.keybagd.first_unlock"];
    [(SwiftVCDaemonXPCEventHandler *)v13->_eventHandler addObserver:v13 selector:sel_timezoneChangeDidOccur name:@"com.apple.system.timezone"];
    [(SwiftVCDaemonXPCEventHandler *)v13->_eventHandler addObserver:v13 selector:sel_timeChangeDidOccur name:@"com.apple.system.clock_set"];

    v30 = v13;
  }

  return v13;
}

@end