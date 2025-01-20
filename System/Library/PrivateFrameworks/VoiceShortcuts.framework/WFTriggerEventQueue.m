@interface WFTriggerEventQueue
+ (BOOL)shouldRunTrigger:(id)a3 forEvent:(id)a4 runEvents:(id)a5 error:(id *)a6;
+ (double)rateLimitingTimeoutForTrigger:(id)a3 runEvents:(id)a4;
- (BOOL)deleteTriggerEvent:(id)a3 error:(id *)a4;
- (BOOL)isTriggerEventStale:(id)a3;
- (BOOL)shouldRunEmailOrMessageTrigger:(id)a3 forEvent:(id)a4 runEvents:(id)a5 error:(id *)a6;
- (OS_dispatch_queue)queue;
- (WFDatabaseProvider)databaseProvider;
- (WFTriggerBootManager)triggerBootManager;
- (WFTriggerEventQueue)initWithDatabaseProvider:(id)a3 notificationManager:(id)a4 notificationScheduler:(id)a5;
- (WFTriggerEventQueue)initWithDatabaseProvider:(id)a3 notificationManager:(id)a4 notificationScheduler:(id)a5 triggerBootManager:(id)a6;
- (WFTriggerEventRunner)triggerEventRunner;
- (WFTriggerNotificationScheduler)notificationScheduler;
- (WFTriggerUserNotificationManager)notificationManager;
- (id)configuredTriggerForIdentifier:(id)a3 workflowReference:(id *)a4 error:(id *)a5;
- (id)databaseWithError:(id *)a3;
- (id)nextTriggerEventWithError:(id *)a3;
- (id)triggerEventForConfiguredTrigger:(id)a3 eventInfo:(id)a4 confirmed:(BOOL)a5 error:(id *)a6;
- (unint64_t)numberOfEventsInQueueWithConfirmationOnly:(BOOL)a3;
- (void)deactivateEphemeralTriggerIfNeeded:(id)a3 completion:(id)a4;
- (void)didFinishRunningWithError:(id)a3 cancelled:(BOOL)a4 trigger:(id)a5 runEvent:(id)a6;
- (void)disableTriggersWithIdentifiers:(id)a3;
- (void)enqueueTriggerWithIdentifier:(id)a3 eventInfo:(id)a4 force:(BOOL)a5 completion:(id)a6;
- (void)handleRemovedIgnoredNotifications:(id)a3;
- (void)logMetricForTrigger:(id)a3;
- (void)notificationManager:(id)a3 didDismissTriggerWithIdentifier:(id)a4 pendingTriggerEventIDs:(id)a5;
- (void)notificationManager:(id)a3 didFailToPostNotificationPromptWithTriggerIdentifier:(id)a4 pendingTriggerEventIDs:(id)a5;
- (void)notificationManager:(id)a3 didRequestDisablementOfTriggersWithIdentifiers:(id)a4;
- (void)notificationManager:(id)a3 receivedConfirmationToRunTriggerWithIdentifier:(id)a4 pendingTriggerEventIDs:(id)a5;
- (void)removeAllStaleTriggerEventsIgnoringValidIDs:(id)a3;
- (void)removePendingTriggerEventsWithEventIDs:(id)a3;
- (void)resume;
- (void)resumeWithConfiguredTrigger:(id)a3 workflowReference:(id)a4 eventInfo:(id)a5;
- (void)runWithConfiguredTrigger:(id)a3 workflowReference:(id)a4 eventInfo:(id)a5;
- (void)setConfirmedForTriggerEventIDs:(id)a3 error:(id *)a4;
@end

@implementation WFTriggerEventQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_triggerBootManager, 0);
  objc_storeStrong((id *)&self->_notificationScheduler, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_triggerEventRunner, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFTriggerBootManager)triggerBootManager
{
  return self->_triggerBootManager;
}

- (WFTriggerNotificationScheduler)notificationScheduler
{
  return self->_notificationScheduler;
}

- (WFTriggerUserNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (WFTriggerEventRunner)triggerEventRunner
{
  return self->_triggerEventRunner;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (void)deactivateEphemeralTriggerIfNeeded:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl() && ([v6 shouldRecur] & 1) == 0)
  {
    id v23 = 0;
    v8 = [(WFTriggerEventQueue *)self databaseWithError:&v23];
    id v9 = v23;
    v10 = v9;
    if (v8)
    {
      id v22 = v9;
      v11 = [v8 recordWithDescriptor:v6 error:&v22];
      id v12 = v22;

      if (v11)
      {
        [v11 setEnabled:0];
        id v21 = v12;
        char v13 = [v8 saveRecord:v11 withDescriptor:v6 error:&v21];
        id v14 = v21;

        if (v13)
        {
          v15 = [MEMORY[0x1E4FB4540] standardClient];
          v16 = [v6 identifier];
          v17 = [v6 trigger];
          uint64_t v18 = [(id)objc_opt_class() triggerBacking];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __69__WFTriggerEventQueue_deactivateEphemeralTriggerIfNeeded_completion___block_invoke;
          v19[3] = &unk_1E6540E70;
          id v20 = v7;
          [v15 unregisterTriggerWithIdentifier:v16 triggerBacking:v18 completion:v19];
        }
        else
        {
          (*((void (**)(id, void, id))v7 + 2))(v7, 0, v14);
        }
        id v12 = v14;
      }
      else
      {
        (*((void (**)(id, void, id))v7 + 2))(v7, 0, v12);
      }

      v10 = v12;
    }
    else
    {
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
    }
  }
}

uint64_t __69__WFTriggerEventQueue_deactivateEphemeralTriggerIfNeeded_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logMetricForTrigger:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FB7368];
  id v4 = a3;
  id v8 = objc_alloc_init(v3);
  objc_msgSend(v8, "setRequiredRuntimeConfirmation:", objc_msgSend(v4, "shouldPrompt"));
  v5 = [v4 trigger];

  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v8 setTriggerType:v7];

  [v8 track];
}

- (void)didFinishRunningWithError:(id)a3 cancelled:(BOOL)a4 trigger:(id)a5 runEvent:(id)a6
{
  BOOL v8 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  char v13 = getWFTriggersLogObject();
  id v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[WFTriggerEventQueue didFinishRunningWithError:cancelled:trigger:runEvent:]";
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_ERROR, "%s Finished running with error: %@", buf, 0x16u);
    }

    id v14 = [(WFTriggerEventQueue *)self notificationManager];
    [v14 postNotificationThatTrigger:v11 failedWithError:v10];
    uint64_t v15 = 2;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[WFTriggerEventQueue didFinishRunningWithError:cancelled:trigger:runEvent:]";
      __int16 v23 = 1024;
      LODWORD(v24) = v8;
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEBUG, "%s Finished running workflow in background extension (cancelled: %d)", buf, 0x12u);
    }
    uint64_t v15 = 1;
  }

  v16 = [(WFTriggerEventQueue *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WFTriggerEventQueue_didFinishRunningWithError_cancelled_trigger_runEvent___block_invoke;
  block[3] = &unk_1E6540EC0;
  block[4] = self;
  id v19 = v12;
  uint64_t v20 = v15;
  id v17 = v12;
  dispatch_async(v16, block);

  [(WFTriggerEventQueue *)self resume];
}

void __76__WFTriggerEventQueue_didFinishRunningWithError_cancelled_trigger_runEvent___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  id v7 = 0;
  v3 = [v2 databaseWithError:&v7];
  id v4 = v7;
  if (v3)
  {
    [v3 setOutcome:a1[6] forRunEvent:a1[5]];
  }
  else
  {
    v5 = getWFTriggersLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[5];
      *(_DWORD *)buf = 136315650;
      id v9 = "-[WFTriggerEventQueue didFinishRunningWithError:cancelled:trigger:runEvent:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Unable to load database, not setting outcome for run event %@: %{public}@", buf, 0x20u);
    }
  }
}

- (void)notificationManager:(id)a3 didRequestDisablementOfTriggersWithIdentifiers:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[WFTriggerEventQueue notificationManager:didRequestDisablementOfTriggersWithIdentifiers:]";
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Disabling triggers with identifiers: %{public}@", buf, 0x16u);
  }

  if ([v5 count])
  {
    id v7 = [(WFTriggerEventQueue *)self queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__WFTriggerEventQueue_notificationManager_didRequestDisablementOfTriggersWithIdentifiers___block_invoke;
    v9[3] = &unk_1E6541F68;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(v7, v9);
  }
  else
  {
    BOOL v8 = getWFTriggersLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v12 = "-[WFTriggerEventQueue notificationManager:didRequestDisablementOfTriggersWithIdentifiers:]";
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEBUG, "%s No event info found to delete", buf, 0xCu);
    }
  }
}

uint64_t __90__WFTriggerEventQueue_notificationManager_didRequestDisablementOfTriggersWithIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) disableTriggersWithIdentifiers:*(void *)(a1 + 40)];
}

- (void)notificationManager:(id)a3 didFailToPostNotificationPromptWithTriggerIdentifier:(id)a4 pendingTriggerEventIDs:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = getWFTriggersLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[WFTriggerEventQueue notificationManager:didFailToPostNotificationPromptWithTriggerIdentifier:pendingTriggerEventIDs:]";
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEBUG, "%s Failed to post notifciation prompt for trigger with identifier: %{public}@", buf, 0x16u);
  }

  if ([v8 count])
  {
    id v10 = [(WFTriggerEventQueue *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __119__WFTriggerEventQueue_notificationManager_didFailToPostNotificationPromptWithTriggerIdentifier_pendingTriggerEventIDs___block_invoke;
    v12[3] = &unk_1E6541F68;
    v12[4] = self;
    id v13 = v8;
    dispatch_async(v10, v12);
  }
  else
  {
    uint64_t v11 = getWFTriggersLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[WFTriggerEventQueue notificationManager:didFailToPostNotificationPromptWithTriggerIdentifier:pendingTriggerEventIDs:]";
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEBUG, "%s No event info found to delete", buf, 0xCu);
    }
  }
}

uint64_t __119__WFTriggerEventQueue_notificationManager_didFailToPostNotificationPromptWithTriggerIdentifier_pendingTriggerEventIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removePendingTriggerEventsWithEventIDs:*(void *)(a1 + 40)];
}

- (void)notificationManager:(id)a3 didDismissTriggerWithIdentifier:(id)a4 pendingTriggerEventIDs:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = getWFTriggersLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[WFTriggerEventQueue notificationManager:didDismissTriggerWithIdentifier:pendingTriggerEventIDs:]";
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEBUG, "%s User dismissed notification prompt for trigger with identifier: %{public}@", buf, 0x16u);
  }

  if ([v8 count])
  {
    id v10 = [(WFTriggerEventQueue *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __98__WFTriggerEventQueue_notificationManager_didDismissTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke;
    v12[3] = &unk_1E6541F68;
    v12[4] = self;
    id v13 = v8;
    dispatch_async(v10, v12);
  }
  else
  {
    uint64_t v11 = getWFTriggersLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[WFTriggerEventQueue notificationManager:didDismissTriggerWithIdentifier:pendingTriggerEventIDs:]";
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEBUG, "%s No event info found to delete", buf, 0xCu);
    }
  }
}

uint64_t __98__WFTriggerEventQueue_notificationManager_didDismissTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removePendingTriggerEventsWithEventIDs:*(void *)(a1 + 40)];
}

- (void)notificationManager:(id)a3 receivedConfirmationToRunTriggerWithIdentifier:(id)a4 pendingTriggerEventIDs:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 count];
    id v13 = [(WFTriggerEventQueue *)self queue];
    if (v12)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      id v19 = __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke_226;
      uint64_t v20 = &unk_1E6541F68;
      id v21 = self;
      id v14 = &v22;
      id v22 = v11;
      dispatch_async(v13, &v17);

      [(WFTriggerEventQueue *)self resume];
LABEL_10:

      goto LABEL_11;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke_2;
    block[3] = &unk_1E6541F68;
    block[4] = self;
    id v14 = &v24;
    id v24 = v9;
    __int16 v16 = block;
LABEL_9:
    dispatch_async(v13, v16);

    goto LABEL_10;
  }
  uint64_t v15 = getWFTriggersLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[WFTriggerEventQueue notificationManager:receivedConfirmationToRunTriggerWithIdentifier:pendingTriggerEventIDs:]";
    _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEBUG, "%s Failed to run trigger because recieved confirmation with no trigger identifier", buf, 0xCu);
  }

  if ([v11 count])
  {
    id v13 = [(WFTriggerEventQueue *)self queue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke;
    v25[3] = &unk_1E6541F68;
    v25[4] = self;
    id v14 = &v26;
    id v26 = v11;
    __int16 v16 = v25;
    goto LABEL_9;
  }
LABEL_11:
}

uint64_t __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removePendingTriggerEventsWithEventIDs:*(void *)(a1 + 40)];
}

void __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = 0;
  id v11 = 0;
  id v4 = [v2 configuredTriggerForIdentifier:v3 workflowReference:&v11 error:&v10];
  id v5 = v11;
  id v6 = v10;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v9 = getWFTriggersLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[WFTriggerEventQueue notificationManager:receivedConfirmationToRunTriggerWithIdentifier:pendingTriggerEvent"
            "IDs:]_block_invoke_2";
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger because it could not be found: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = objc_opt_new();
    [v8 resumeWithConfiguredTrigger:v4 workflowReference:v5 eventInfo:v9];
  }
}

void __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke_226(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v5 = 0;
  [v2 setConfirmedForTriggerEventIDs:v1 error:&v5];
  id v3 = v5;
  if (v3)
  {
    id v4 = getWFTriggersLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v7 = "-[WFTriggerEventQueue notificationManager:receivedConfirmationToRunTriggerWithIdentifier:pendingTriggerEventI"
           "Ds:]_block_invoke";
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Failed to set confirmed for trigger events with error: %{public}@", buf, 0x16u);
    }
  }
}

- (void)disableTriggersWithIdentifiers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  id v9 = 0;
  id v6 = [(WFTriggerEventQueue *)self databaseWithError:&v9];
  id v7 = v9;
  if (v6)
  {
    __int16 v8 = [objc_alloc(MEMORY[0x1E4FB7360]) initWithDatabase:v6];
    [v8 disableTriggersWithIdentifiers:v4];
  }
  else
  {
    __int16 v8 = getWFTriggersLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[WFTriggerEventQueue disableTriggersWithIdentifiers:]";
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Unable to load database: %{public}@", buf, 0x16u);
    }
  }
}

- (BOOL)isTriggerEventStale:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v4 dateCreated];

  __int16 v8 = [v5 components:16 fromDate:v7 toDate:v6 options:0];

  LOBYTE(v7) = [v8 day] > 6;
  return (char)v7;
}

- (void)removeAllStaleTriggerEventsIgnoringValidIDs:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  id v34 = 0;
  id v6 = [(WFTriggerEventQueue *)self databaseWithError:&v34];
  id v7 = v34;
  __int16 v8 = v7;
  if (v6)
  {
    v27 = v7;
    v28 = v6;
    id v9 = [v6 sortedTriggerEventsWithConfirmationOnly:0];
    uint64_t v10 = [v9 descriptors];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (!v12) {
      goto LABEL_21;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v17 = [v16 identifier];
        if ([v4 containsObject:v17])
        {

LABEL_15:
          id v22 = getWFTriggersLogObject();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          __int16 v23 = [v16 identifier];
          *(_DWORD *)buf = 136315394;
          v37 = "-[WFTriggerEventQueue removeAllStaleTriggerEventsIgnoringValidIDs:]";
          __int16 v38 = 2114;
          v39 = v23;
          id v24 = v22;
          os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
          id v26 = "%s Trigger event is valid with id: %{public}@";
LABEL_17:
          _os_log_impl(&dword_1C7D7E000, v24, v25, v26, buf, 0x16u);
          goto LABEL_18;
        }
        BOOL v18 = [(WFTriggerEventQueue *)self isTriggerEventStale:v16];

        if (!v18) {
          goto LABEL_15;
        }
        id v19 = getWFTriggersLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v16 identifier];
          *(_DWORD *)buf = 136315394;
          v37 = "-[WFTriggerEventQueue removeAllStaleTriggerEventsIgnoringValidIDs:]";
          __int16 v38 = 2114;
          v39 = v20;
          _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_DEFAULT, "%s Removing stale trigger event with id: %{public}@", buf, 0x16u);
        }
        id v29 = 0;
        BOOL v21 = [(WFTriggerEventQueue *)self deleteTriggerEvent:v16 error:&v29];
        id v22 = v29;
        if (!v21)
        {
          __int16 v23 = getWFTriggersLogObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v37 = "-[WFTriggerEventQueue removeAllStaleTriggerEventsIgnoringValidIDs:]";
            __int16 v38 = 2114;
            v39 = v22;
            id v24 = v23;
            os_log_type_t v25 = OS_LOG_TYPE_ERROR;
            id v26 = "%s Could not delete trigger notification with error %{public}@";
            goto LABEL_17;
          }
LABEL_18:
        }
LABEL_19:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (!v13)
      {
LABEL_21:

        __int16 v8 = v27;
        id v6 = v28;
        goto LABEL_24;
      }
    }
  }
  id v11 = getWFTriggersLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFTriggerEventQueue removeAllStaleTriggerEventsIgnoringValidIDs:]";
    __int16 v38 = 2114;
    v39 = v8;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Unable to load database: %{public}@", buf, 0x16u);
  }
LABEL_24:
}

- (void)handleRemovedIgnoredNotifications:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFTriggersLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[WFTriggerEventQueue handleRemovedIgnoredNotifications:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEBUG, "%s Removing all trigger events", buf, 0xCu);
  }

  id v6 = [(WFTriggerEventQueue *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__WFTriggerEventQueue_handleRemovedIgnoredNotifications___block_invoke;
  v8[3] = &unk_1E6541F68;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __57__WFTriggerEventQueue_handleRemovedIgnoredNotifications___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__WFTriggerEventQueue_handleRemovedIgnoredNotifications___block_invoke_2;
  v5[3] = &unk_1E6540C00;
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateObjectsUsingBlock:v5];
  [*(id *)(a1 + 40) removeAllStaleTriggerEventsIgnoringValidIDs:v4];
}

void __57__WFTriggerEventQueue_handleRemovedIgnoredNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  id v4 = [v3 content];
  id v6 = [v4 userInfo];

  id v5 = WFPendingTriggerEventIDsFromNotificationUserInfo();
  [*(id *)(a1 + 32) addObjectsFromArray:v5];
}

- (BOOL)shouldRunEmailOrMessageTrigger:(id)a3 forEvent:(id)a4 runEvents:(id)a5 error:(id *)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  __int16 v8 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([(WFTriggerEventQueue *)self numberOfEventsInQueueWithConfirmationOnly:0] < 0xC9)
  {
    id v9 = [v7 objectForKey:@"NewValue"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ((unint64_t)[v9 count] < 0xB)
      {
        BOOL v11 = 1;
        goto LABEL_14;
      }
      uint64_t v10 = getWFTriggersLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315138;
        uint64_t v14 = "-[WFTriggerEventQueue shouldRunEmailOrMessageTrigger:forEvent:runEvents:error:]";
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_INFO, "%s Trigger contains more than 10 emails or messages, not running trigger", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {

      uint64_t v10 = getWFTriggersLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315138;
        uint64_t v14 = "-[WFTriggerEventQueue shouldRunEmailOrMessageTrigger:forEvent:runEvents:error:]";
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_INFO, "%s Could not cast eventInfo to NSArray", (uint8_t *)&v13, 0xCu);
      }
      id v9 = 0;
    }
  }
  else
  {
    id v9 = getWFTriggersLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[WFTriggerEventQueue shouldRunEmailOrMessageTrigger:forEvent:runEvents:error:]";
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s Queue has more than 50 events, not running trigger", (uint8_t *)&v13, 0xCu);
    }
  }
  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (void)removePendingTriggerEventsWithEventIDs:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    long long v33 = "-[WFTriggerEventQueue removePendingTriggerEventsWithEventIDs:]";
    __int16 v34 = 2114;
    id v35 = v4;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEBUG, "%s Attempting to remove pending trigger events with identifiers %{public}@", buf, 0x16u);
  }

  id v31 = 0;
  id v7 = [(WFTriggerEventQueue *)self databaseWithError:&v31];
  id v8 = v31;
  if (v7)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v24 = v8;
      id v25 = v4;
      uint64_t v12 = *(void *)v28;
      while (1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v14 objectType:4];
          id v26 = 0;
          char v16 = [v7 deleteReference:v15 error:&v26];
          id v17 = v26;
          BOOL v18 = getWFTriggersLogObject();
          id v19 = v18;
          if (v16)
          {
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_15;
            }
            *(_DWORD *)buf = 136315394;
            long long v33 = "-[WFTriggerEventQueue removePendingTriggerEventsWithEventIDs:]";
            __int16 v34 = 2114;
            id v35 = v14;
            uint64_t v20 = v19;
            os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
            id v22 = "%s Successfully deleted trigger event with identifier: %{public}@";
            uint32_t v23 = 22;
          }
          else
          {
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              goto LABEL_15;
            }
            *(_DWORD *)buf = 136315650;
            long long v33 = "-[WFTriggerEventQueue removePendingTriggerEventsWithEventIDs:]";
            __int16 v34 = 2114;
            id v35 = v14;
            __int16 v36 = 2114;
            id v37 = v17;
            uint64_t v20 = v19;
            os_log_type_t v21 = OS_LOG_TYPE_ERROR;
            id v22 = "%s Failed to delete trigger event with identifier: %{public}@ with error: %{public}@";
            uint32_t v23 = 32;
          }
          _os_log_impl(&dword_1C7D7E000, v20, v21, v22, buf, v23);
LABEL_15:
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v38 count:16];
        if (!v11)
        {
          id v8 = v24;
          id v4 = v25;
          break;
        }
      }
    }
  }
  else
  {
    id v9 = getWFTriggersLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v33 = "-[WFTriggerEventQueue removePendingTriggerEventsWithEventIDs:]";
      __int16 v34 = 2114;
      id v35 = v8;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Unable to load database: %{public}@", buf, 0x16u);
    }
  }
}

- (void)setConfirmedForTriggerEventIDs:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = getWFTriggersLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    long long v30 = "-[WFTriggerEventQueue setConfirmedForTriggerEventIDs:error:]";
    __int16 v31 = 2114;
    id v32 = v6;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEBUG, "%s Attempting to mark trigger events as confirmed with ids: %{public}@", buf, 0x16u);
  }

  id v28 = 0;
  id v9 = [(WFTriggerEventQueue *)self databaseWithError:&v28];
  id v10 = v28;
  if (v9)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v21 = v10;
      id v22 = v6;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          char v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v23 = 0;
          objc_msgSend(v9, "setConfirmedForTriggerEventWithIdentifier:error:", v16, &v23, v21, v22);
          id v17 = v23;
          if (v17)
          {
            BOOL v18 = v17;
            id v19 = getWFTriggersLogObject();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              long long v30 = "-[WFTriggerEventQueue setConfirmedForTriggerEventIDs:error:]";
              __int16 v31 = 2114;
              id v32 = v16;
              __int16 v33 = 2114;
              __int16 v34 = v18;
              _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_ERROR, "%s Failed to set confirmed for trigger with eventID: %{public}@ error: %{public}@", buf, 0x20u);
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v35 count:16];
      }
      while (v13);
      id v10 = v21;
      id v6 = v22;
    }
  }
  else
  {
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, v10, @"Unable to load database");
    id v11 = v20;
    if (a4)
    {
      id v11 = v20;
      *a4 = v11;
    }
  }
}

- (id)triggerEventForConfiguredTrigger:(id)a3 eventInfo:(id)a4 confirmed:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = getWFTriggersLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v24 = "-[WFTriggerEventQueue triggerEventForConfiguredTrigger:eventInfo:confirmed:error:]";
    _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_DEFAULT, "%s 🤖 Attempting to create trigger events for configured trigger", buf, 0xCu);
  }

  id v22 = 0;
  uint64_t v14 = [(WFTriggerEventQueue *)self databaseWithError:&v22];
  id v15 = v22;
  if (v14)
  {
    id v16 = [v10 trigger];
    if (v16)
    {
      id v17 = WFSerializedTriggerEventInfo(v11);
      BOOL v18 = [v10 identifier];
      id v19 = [v14 createTriggerEventWithTriggerID:v18 eventInfo:v17 confirmed:v7 error:a6];

      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, v15, @"Unable to load database");
    id v16 = v20;
    if (a6)
    {
      id v16 = v20;
      id v19 = 0;
      *a6 = v16;
      goto LABEL_9;
    }
  }
  id v19 = 0;
LABEL_9:

  return v19;
}

- (id)configuredTriggerForIdentifier:(id)a3 workflowReference:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v9);

  id v26 = 0;
  id v10 = [(WFTriggerEventQueue *)self databaseWithError:&v26];
  id v11 = v26;
  if (v10)
  {
    uint64_t v12 = [v10 configuredTriggerForTriggerID:v8];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = [v12 workflowID];

      if (v14)
      {
        if (!a4
          || ([v13 workflowID],
              id v15 = objc_claimAutoreleasedReturnValue(),
              [v10 referenceForWorkflowID:v15],
              *a4 = (id)objc_claimAutoreleasedReturnValue(),
              v15,
              *a4))
        {
          id v13 = v13;
          id v16 = v13;
          goto LABEL_19;
        }
        id v22 = (void *)MEMORY[0x1E4F28C58];
        id v21 = [v13 workflowID];
        id v23 = objc_msgSend(v22, "vc_voiceShortcutErrorWithCode:reason:", 6001, @"Couldn't find workflow (%@) for trigger with identifier: %@", v21, v8);
        long long v24 = v23;
        if (a5) {
          *a5 = v23;
        }
      }
      else
      {
        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 6001, @"Missing workflow identifier for trigger with identifier: %@", v8);
        id v21 = v20;
        if (a5) {
          *a5 = v20;
        }
      }
    }
    else
    {
      BOOL v18 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 6003, @"Could not find trigger with identifier: %@", v8);
      id v19 = v18;
      if (a5) {
        *a5 = v18;
      }

      id v13 = 0;
    }
  }
  else
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, v11, @"Unable to load database");
    id v13 = v17;
    if (a5)
    {
      id v13 = v17;
      id v16 = 0;
      *a5 = v13;
      goto LABEL_19;
    }
  }
  id v16 = 0;
LABEL_19:

  return v16;
}

- (id)nextTriggerEventWithError:(id *)a3
{
  id v5 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  id v14 = 0;
  id v6 = [(WFTriggerEventQueue *)self databaseWithError:&v14];
  id v7 = v14;
  if (v6)
  {
    id v8 = [v6 sortedTriggerEventsWithConfirmationOnly:1];
    id v9 = [v8 descriptors];
    id v10 = [v9 firstObject];

    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = v11;
      goto LABEL_8;
    }
    id v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, v7, @"Unable to load database");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v11 = v11;
      uint64_t v12 = 0;
      *a3 = v11;
      goto LABEL_8;
    }
  }
  uint64_t v12 = 0;
LABEL_8:

  return v12;
}

- (BOOL)deleteTriggerEvent:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v7);

  id v16 = 0;
  id v8 = [(WFTriggerEventQueue *)self databaseWithError:&v16];
  id v9 = v16;
  if (v8)
  {
    id v10 = getWFTriggersLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v6 identifier];
      *(_DWORD *)buf = 136315394;
      BOOL v18 = "-[WFTriggerEventQueue deleteTriggerEvent:error:]";
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s Removing trigger event with identifier: %{public}@", buf, 0x16u);
    }
    char v12 = [v8 deleteReference:v6 error:a4];
  }
  else
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, v9, @"Unable to load database");
    id v14 = v13;
    if (a4) {
      *a4 = v13;
    }

    char v12 = 0;
  }

  return v12;
}

- (unint64_t)numberOfEventsInQueueWithConfirmationOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(WFTriggerEventQueue *)self databaseWithError:0];
  id v7 = [v6 sortedTriggerEventsWithConfirmationOnly:v3];
  unint64_t v8 = [v7 count];

  return v8;
}

- (id)databaseWithError:(id *)a3
{
  id v5 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(WFTriggerEventQueue *)self databaseProvider];
  id v7 = [v6 databaseWithError:a3];

  return v7;
}

- (void)enqueueTriggerWithIdentifier:(id)a3 eventInfo:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  char v12 = [(WFTriggerEventQueue *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__WFTriggerEventQueue_enqueueTriggerWithIdentifier_eventInfo_force_completion___block_invoke;
  v16[3] = &unk_1E6541538;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __79__WFTriggerEventQueue_enqueueTriggerWithIdentifier_eventInfo_force_completion___block_invoke(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v69 = 0;
  id v70 = 0;
  id v4 = [v2 configuredTriggerForIdentifier:v3 workflowReference:&v70 error:&v69];
  id v5 = v70;
  id v6 = v69;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v9 = [v4 trigger];
    id v10 = getWFTriggersLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 136315394;
      v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
      __int16 v74 = 2114;
      id v75 = v13;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s 🤖 Enqueuing trigger of type: %{public}@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    id v68 = 0;
    char v15 = [v9 shouldFireTriggerWithEventInfo:v14 error:&v68];
    id v16 = v68;

    if ((v15 & 1) == 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_58:

      id v6 = v16;
      goto LABEL_59;
    }
    id v17 = *(void **)(a1 + 32);
    id v67 = v16;
    id v18 = [v17 databaseWithError:&v67];
    id v19 = v67;

    if (!v18)
    {
      id v32 = getWFTriggersLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
        __int16 v74 = 2114;
        id v75 = v19;
        _os_log_impl(&dword_1C7D7E000, v32, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger because database is not available: %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_57;
    }
    uint64_t v20 = [v4 identifier];
    uint64_t v21 = [v18 sortedRunEventsForTriggerID:v20];
    id v22 = [(id)v21 descriptors];

    id v23 = objc_opt_class();
    uint64_t v24 = *(void *)(a1 + 48);
    id v66 = v19;
    LOBYTE(v21) = [v23 shouldRunTrigger:v4 forEvent:v24 runEvents:v22 error:&v66];
    id v25 = v66;

    if ((v21 & 1) == 0)
    {
      __int16 v33 = getWFTriggersLogObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        __int16 v34 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 136315906;
        v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
        __int16 v74 = 2112;
        id v75 = v4;
        __int16 v76 = 2112;
        v77 = v34;
        __int16 v78 = 2112;
        id v79 = v25;
        _os_log_impl(&dword_1C7D7E000, v33, OS_LOG_TYPE_INFO, "%s Not running trigger (%@) for event (%@) because: %@", buf, 0x2Au);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_56;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v26 = *(void **)(a1 + 32);
      uint64_t v27 = *(void *)(a1 + 48);
      id v65 = v25;
      char v28 = [v26 shouldRunEmailOrMessageTrigger:v4 forEvent:v27 runEvents:v22 error:&v65];
      id v29 = v65;

      if ((v28 & 1) == 0)
      {
        long long v30 = getWFTriggersLogObject();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          __int16 v31 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 136315906;
          v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
          __int16 v74 = 2112;
          id v75 = v4;
          __int16 v76 = 2112;
          v77 = v31;
          __int16 v78 = 2112;
          id v79 = v29;
          _os_log_impl(&dword_1C7D7E000, v30, OS_LOG_TYPE_INFO, "%s Not running trigger (%@) for event (%@) because: %@", buf, 0x2Au);
        }

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        id v25 = v29;
        goto LABEL_56;
      }
    }
    else
    {
      id v29 = v25;
    }
    if (([v4 shouldPrompt] & 1) != 0
      || ([(id)objc_opt_class() isAllowedToRunAutomatically] & 1) == 0)
    {
      id v35 = getWFTriggersLogObject();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
        __int16 v74 = 2114;
        id v75 = v36;
        _os_log_impl(&dword_1C7D7E000, v35, OS_LOG_TYPE_DEFAULT, "%s 🤖 Trigger needs confirmation, adding (%{public}@) to run queue", buf, 0x16u);
      }

      if ([v9 requiresEventInfoAsInput])
      {
        id v37 = *(void **)(a1 + 32);
        uint64_t v38 = *(void *)(a1 + 48);
        id v64 = v29;
        uint64_t v39 = [v37 triggerEventForConfiguredTrigger:v4 eventInfo:v38 confirmed:0 error:&v64];
        id v25 = v64;

        if (!v39)
        {
          v55 = getWFTriggersLogObject();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
            __int16 v74 = 2114;
            id v75 = v25;
            _os_log_impl(&dword_1C7D7E000, v55, OS_LOG_TYPE_ERROR, "%s Failed to create trigger events with error: %{public}@", buf, 0x16u);
          }

          goto LABEL_56;
        }
        uint64_t v40 = [v39 identifier];
        v71 = v40;
        v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];

        id v29 = v25;
      }
      else
      {
        v61 = 0;
      }
      VCOSTransactionWithName(@"WFTriggerEventQueue.enqueueTriggerWithIdentifier");
      v60 = v59 = v22;
      if (ActionKitLibrary_sOnce != -1) {
        dispatch_once(&ActionKitLibrary_sOnce, &__block_literal_global_354);
      }
      id v63 = v29;
      v41 = [MEMORY[0x1E4FB7390] workflowWithReference:v5 database:v18 error:&v63];
      id v25 = v63;

      if (!v41)
      {
        v53 = getWFTriggersLogObject();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = [v5 identifier];
          *(_DWORD *)buf = 136315906;
          v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
          __int16 v74 = 2112;
          id v75 = v54;
          __int16 v76 = 2112;
          v77 = v9;
          __int16 v78 = 2114;
          id v79 = v25;
          _os_log_impl(&dword_1C7D7E000, v53, OS_LOG_TYPE_ERROR, "%s Failed to fetch workflow (%@) for trigger (%@): %{public}@", buf, 0x2Au);
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

        goto LABEL_56;
      }
      v42 = [v41 actions];
      v58 = v41;
      v43 = [v41 actions];
      unint64_t v44 = [v43 count];

      if (v44 >= 8) {
        uint64_t v45 = 8;
      }
      else {
        uint64_t v45 = v44;
      }
      v46 = objc_msgSend(v42, "subarrayWithRange:", 0, v45);

      v57 = v46;
      uint64_t v47 = objc_msgSend(v46, "if_compactMap:", &__block_literal_global_191);
      uint64_t v48 = [v9 requiresEventInfoAsInput] ^ 1;
      uint64_t v49 = [*(id *)(a1 + 32) notificationManager];
      id v62 = 0;
      v50 = v61;
      v56 = (void *)v47;
      LOBYTE(v47) = [(id)v49 postNotificationOfType:0 forTrigger:v4 workflowReference:v5 removeDeliveredNotifications:v48 pendingTriggerEventIDs:v61 actionIcons:v47 error:&v62];
      id v51 = v62;

      LOBYTE(v49) = v47;
      id v22 = v59;
      if ((v49 & 1) == 0)
      {
        v52 = getWFTriggersLogObject();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke_2";
          __int16 v74 = 2114;
          id v75 = v51;
          _os_log_impl(&dword_1C7D7E000, v52, OS_LOG_TYPE_ERROR, "%s Failed to post notification prompt with error: %{public}@", buf, 0x16u);
        }

        v50 = v61;
        if ([v61 count]) {
          [*(id *)(a1 + 32) removePendingTriggerEventsWithEventIDs:v61];
        }
      }
      [*(id *)(a1 + 32) resume];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      [*(id *)(a1 + 32) resumeWithConfiguredTrigger:v4 workflowReference:v5 eventInfo:*(void *)(a1 + 48)];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      id v25 = v29;
    }
    [*(id *)(a1 + 32) logMetricForTrigger:v4];
LABEL_56:

    id v19 = v25;
LABEL_57:

    id v16 = v19;
    goto LABEL_58;
  }
  unint64_t v8 = getWFTriggersLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
    __int16 v74 = 2114;
    id v75 = v6;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger because it could not be found: %{public}@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_59:
}

uint64_t __79__WFTriggerEventQueue_enqueueTriggerWithIdentifier_eventInfo_force_completion___block_invoke_188(uint64_t a1, void *a2)
{
  return [a2 icon];
}

- (void)runWithConfiguredTrigger:(id)a3 workflowReference:(id)a4 eventInfo:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v11);

  char v12 = [(WFTriggerEventQueue *)self triggerBootManager];
  [v12 willRunAutomations];

  id v13 = [(WFTriggerEventQueue *)self triggerEventRunner];
  uint64_t v14 = [v8 workflowID];
  int v15 = [v13 isRunningWorkflowWithIdentifier:v14];

  if (v15)
  {
    id v16 = getWFTriggersLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      id v17 = [v8 workflowID];
      *(_DWORD *)buf = 136315394;
      id v29 = "-[WFTriggerEventQueue runWithConfiguredTrigger:workflowReference:eventInfo:]";
      __int16 v30 = 2114;
      id v31 = v17;
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_FAULT, "%s Attempted to run trigger while triggerEventRunner is running with workflow id: %{public}@.", buf, 0x16u);
    }
    goto LABEL_18;
  }
  if ([v8 shouldPrompt]) {
    goto LABEL_16;
  }
  id v18 = [v8 trigger];
  int v19 = [(id)objc_opt_class() isAllowedToRunAutomatically];

  if (!v19) {
    goto LABEL_16;
  }
  if (([v8 shouldNotify] & 1) != 0
    || ([v8 trigger],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = [(id)objc_opt_class() requiresNotification],
        v20,
        v21))
  {
    id v22 = [(WFTriggerEventQueue *)self notificationManager];
    id v27 = 0;
    char v23 = [v22 postNotificationOfType:1 forTrigger:v8 workflowReference:v9 removeDeliveredNotifications:1 pendingTriggerEventIDs:0 actionIcons:0 error:&v27];
    id v24 = v27;

    if ((v23 & 1) == 0)
    {
      id v25 = getWFTriggersLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v29 = "-[WFTriggerEventQueue runWithConfiguredTrigger:workflowReference:eventInfo:]";
        __int16 v30 = 2114;
        id v31 = v24;
        _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_ERROR, "%s Failed to post notification alert due to error: %{public}@", buf, 0x16u);
      }

      goto LABEL_18;
    }
  }
  else
  {
    if ((int)[v8 notificationLevel] > 2) {
      goto LABEL_16;
    }
    id v24 = [(WFTriggerEventQueue *)self notificationScheduler];
    [v24 scheduleTriggerForNotifications:v8];
  }

LABEL_16:
  id v26 = [(WFTriggerEventQueue *)self triggerEventRunner];
  [v26 startRunningWorkflow:v9 forTrigger:v8 eventInfo:v10];

  if (_os_feature_enabled_impl()) {
    [(WFTriggerEventQueue *)self deactivateEphemeralTriggerIfNeeded:v8 completion:&__block_literal_global_3325];
  }
LABEL_18:
}

void __76__WFTriggerEventQueue_runWithConfiguredTrigger_workflowReference_eventInfo___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = getWFTriggersLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      BOOL v7 = "-[WFTriggerEventQueue runWithConfiguredTrigger:workflowReference:eventInfo:]_block_invoke";
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to deactivate ephemeral trigger: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)resumeWithConfiguredTrigger:(id)a3 workflowReference:(id)a4 eventInfo:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFTriggerEventQueue *)self queue];
  dispatch_assert_queue_V2(v11);

  char v12 = getWFTriggersLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v8 identifier];
    *(_DWORD *)buf = 136315394;
    id v25 = "-[WFTriggerEventQueue resumeWithConfiguredTrigger:workflowReference:eventInfo:]";
    __int16 v26 = 2114;
    id v27 = v13;
    _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, "%s 🤖 Resuming trigger with id: %{public}@", buf, 0x16u);
  }
  uint64_t v14 = [(WFTriggerEventQueue *)self triggerEventRunner];
  int v15 = [v8 workflowID];
  if ([v14 isRunningWorkflowWithIdentifier:v15])
  {
  }
  else
  {
    id v16 = [(WFTriggerEventQueue *)self triggerBootManager];
    char v17 = [v16 canRunAutomations];

    if (v17)
    {
      [(WFTriggerEventQueue *)self runWithConfiguredTrigger:v8 workflowReference:v9 eventInfo:v10];
      goto LABEL_14;
    }
  }
  id v18 = getWFTriggersLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = [v8 workflowID];
    *(_DWORD *)buf = 136315394;
    id v25 = "-[WFTriggerEventQueue resumeWithConfiguredTrigger:workflowReference:eventInfo:]";
    __int16 v26 = 2114;
    id v27 = v19;
    _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_DEFAULT, "%s 🤖 Persisting to database because triggerEventRunner is running workflow with id: %{public}@", buf, 0x16u);
  }
  id v23 = 0;
  uint64_t v20 = [(WFTriggerEventQueue *)self triggerEventForConfiguredTrigger:v8 eventInfo:v10 confirmed:1 error:&v23];
  id v21 = v23;

  if (!v20)
  {
    id v22 = getWFTriggersLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v25 = "-[WFTriggerEventQueue resumeWithConfiguredTrigger:workflowReference:eventInfo:]";
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2114;
      id v29 = v21;
      _os_log_impl(&dword_1C7D7E000, v22, OS_LOG_TYPE_ERROR, "%s Failed to create trigger events for trigger %@: %{public}@", buf, 0x20u);
    }
  }
LABEL_14:
}

- (void)resume
{
  uint64_t v3 = [(WFTriggerEventQueue *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__WFTriggerEventQueue_resume__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __29__WFTriggerEventQueue_resume__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v32 = 0;
  uint64_t v3 = [v2 nextTriggerEventWithError:&v32];
  id v4 = v32;
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) triggerBootManager];
    char v6 = [v5 canRunAutomations];

    if (v6)
    {
      BOOL v7 = [v3 triggerID];
      if (!v7)
      {
        id v10 = getWFTriggersLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v34 = "-[WFTriggerEventQueue resume]_block_invoke";
          _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Not resuming queue due to missing trigger id", buf, 0xCu);
        }
        goto LABEL_31;
      }
      id v8 = *(void **)(a1 + 32);
      uint64_t v30 = v4;
      id v31 = 0;
      id v9 = [v8 configuredTriggerForIdentifier:v7 workflowReference:&v31 error:&v30];
      id v10 = v31;
      id v11 = v30;

      if (v9 && v10)
      {
        char v12 = [*(id *)(a1 + 32) triggerEventRunner];
        id v13 = [v10 identifier];
        int v14 = [v12 isRunningWorkflowWithIdentifier:v13];

        if (!v14)
        {
          id v22 = *(void **)(a1 + 32);
          id v29 = v11;
          char v23 = [v22 deleteTriggerEvent:v3 error:&v29];
          id v4 = v29;

          if ((v23 & 1) == 0)
          {
            id v24 = getWFTriggersLogObject();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              __int16 v34 = "-[WFTriggerEventQueue resume]_block_invoke";
              __int16 v35 = 2114;
              uint64_t v36 = v4;
              _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_ERROR, "%s Unable to delete next trigger event with error: %{public}@", buf, 0x16u);
            }
          }
          id v25 = getWFTriggersLogObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v26 = [v3 triggerID];
            *(_DWORD *)buf = 136315394;
            __int16 v34 = "-[WFTriggerEventQueue resume]_block_invoke";
            __int16 v35 = 2114;
            uint64_t v36 = v26;
            _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_DEFAULT, "%s 🤖 Resuming processing for trigger with identifier %{public}@", buf, 0x16u);
          }
          id v27 = *(void **)(a1 + 32);
          int v15 = [v3 eventInfo];
          __int16 v28 = WFTriggerEventInfoDictionaryConverter(v15);
          [v27 runWithConfiguredTrigger:v9 workflowReference:v10 eventInfo:v28];

          goto LABEL_30;
        }
        int v15 = getWFTriggersLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          id v16 = [v10 identifier];
          *(_DWORD *)buf = 136315394;
          __int16 v34 = "-[WFTriggerEventQueue resume]_block_invoke";
          __int16 v35 = 2112;
          uint64_t v36 = v16;
          _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEBUG, "%s Not resuming because the triggerEventRunner is running a workflow with identifier %@", buf, 0x16u);
        }
      }
      else
      {
        int v15 = getWFTriggersLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v34 = "-[WFTriggerEventQueue resume]_block_invoke";
          __int16 v35 = 2114;
          uint64_t v36 = v11;
          _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger because it could not be found: %{public}@", buf, 0x16u);
        }
      }
      id v4 = v11;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    BOOL v7 = getWFTriggersLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v34 = "-[WFTriggerEventQueue resume]_block_invoke";
      id v18 = "%s Not resuming queue due to boot manager not allowing automation runs";
      int v19 = v7;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      uint32_t v21 = 12;
      goto LABEL_14;
    }
    goto LABEL_32;
  }
  char v17 = getWFTriggersLogObject();
  BOOL v7 = v17;
  if (v4)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v34 = "-[WFTriggerEventQueue resume]_block_invoke";
      __int16 v35 = 2114;
      uint64_t v36 = v4;
      id v18 = "%s Unable to get next trigger event with error: %{public}@";
      int v19 = v7;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      uint32_t v21 = 22;
LABEL_14:
      _os_log_impl(&dword_1C7D7E000, v19, v20, v18, buf, v21);
    }
LABEL_32:

    goto LABEL_33;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v34 = "-[WFTriggerEventQueue resume]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEBUG, "%s Not resuming because there are no events in the queue", buf, 0xCu);
  }
  id v4 = v7;
LABEL_33:
}

- (WFTriggerEventQueue)initWithDatabaseProvider:(id)a3 notificationManager:(id)a4 notificationScheduler:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    char v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFTriggerEventQueue.m", 62, @"Invalid parameter not satisfying: %@", @"databaseProvider" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)WFTriggerEventQueue;
  id v13 = [(WFTriggerEventQueue *)&v24 init];
  int v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_databaseProvider, a3);
    objc_storeStrong((id *)&v14->_notificationManager, a4);
    objc_storeStrong((id *)&v14->_notificationScheduler, a5);
    [(WFTriggerUserNotificationManager *)v14->_notificationManager setDelegate:v14];
    int v15 = [[WFTriggerEventRunner alloc] initWithDatabaseProvider:v10 delegate:v14];
    triggerEventRunner = v14->_triggerEventRunner;
    v14->_triggerEventRunner = v15;

    char v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.siriactionsd.WFTriggerEventQueue", v18);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v19;

    uint32_t v21 = v14;
  }

  return v14;
}

- (WFTriggerEventQueue)initWithDatabaseProvider:(id)a3 notificationManager:(id)a4 notificationScheduler:(id)a5 triggerBootManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    dispatch_queue_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFTriggerEventQueue.m", 50, @"Invalid parameter not satisfying: %@", @"databaseProvider" object file lineNumber description];
  }
  int v15 = [(WFTriggerEventQueue *)self initWithDatabaseProvider:v11 notificationManager:v12 notificationScheduler:v13];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_triggerBootManager, a6);
    char v17 = v16;
  }

  return v16;
}

+ (double)rateLimitingTimeoutForTrigger:(id)a3 runEvents:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (v6 && [v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:buf count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v11 = 0;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        uint64_t v13 = 0;
        unint64_t v14 = v10 + v11;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "outcome", (void)v18) == 1)
          {
            unint64_t v14 = v11 + v13;
            goto LABEL_17;
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:buf count:16];
        unint64_t v11 = v14;
        if (v10) {
          continue;
        }
        break;
      }
LABEL_17:

      if (v14 > 5) {
        double v16 = 120.0;
      }
      else {
        double v16 = dbl_1C7EBA640[v14];
      }
    }
    else
    {

      double v16 = 1.0;
    }
  }
  else
  {
    int v15 = getWFTriggersLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      char v23 = "+[WFTriggerEventQueue rateLimitingTimeoutForTrigger:runEvents:]";
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_INFO, "%s No recent runs for trigger (%@); running it",
        buf,
        0x16u);
    }

    double v16 = 0.0;
  }

  return v16;
}

+ (BOOL)shouldRunTrigger:(id)a3 forEvent:(id)a4 runEvents:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    id v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"WFTriggerEventQueue.m", 444, @"Invalid parameter not satisfying: %@", @"trigger" object file lineNumber description];
  }
  if ([v11 isEnabled])
  {
    if ([v11 shouldPrompt])
    {
      unint64_t v14 = getWFTriggersLogObject();
      BOOL v15 = 1;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v34 = "+[WFTriggerEventQueue shouldRunTrigger:forEvent:runEvents:error:]";
        double v16 = "%s Don't bother rate-limiting prompt automations; the user is doing that when they press Run";
        char v17 = v14;
        uint32_t v18 = 12;
LABEL_18:
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      }
    }
    else if ([v13 count])
    {
      [a1 rateLimitingTimeoutForTrigger:v11 runEvents:v13];
      double v22 = v21;
      unint64_t v14 = [v13 firstObject];
      char v23 = [v14 date];
      __int16 v24 = [v23 dateByAddingTimeInterval:v22];

      id v25 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v26 = [v24 compare:v25];

      BOOL v15 = v26 != 1;
      if (v26 == 1)
      {
        id v27 = [NSString stringWithFormat:@"Not running trigger (%@) for event (%@) due to rate-limiting with timeout=%0.0f", v11, v12, *(void *)&v22];
        __int16 v28 = getWFTriggersLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v34 = "+[WFTriggerEventQueue shouldRunTrigger:forEvent:runEvents:error:]";
          __int16 v35 = 2112;
          uint64_t v36 = v27;
          _os_log_impl(&dword_1C7D7E000, v28, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
        }

        id v29 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 6004, @"%@", v27);
        uint64_t v30 = v29;
        if (a6) {
          *a6 = v29;
        }
      }
      else
      {
        id v27 = getWFTriggersLogObject();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v34 = "+[WFTriggerEventQueue shouldRunTrigger:forEvent:runEvents:error:]";
          __int16 v35 = 2112;
          uint64_t v36 = v11;
          _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_INFO, "%s No rate-limiting checks applied; running trigger (%@)",
            buf,
            0x16u);
        }
      }
    }
    else
    {
      unint64_t v14 = getWFTriggersLogObject();
      BOOL v15 = 1;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v34 = "+[WFTriggerEventQueue shouldRunTrigger:forEvent:runEvents:error:]";
        __int16 v35 = 2112;
        uint64_t v36 = v11;
        double v16 = "%s No recent runs for trigger (%@); running it";
        char v17 = v14;
        uint32_t v18 = 22;
        goto LABEL_18;
      }
    }
  }
  else
  {
    long long v19 = getWFTriggersLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v34 = "+[WFTriggerEventQueue shouldRunTrigger:forEvent:runEvents:error:]";
      __int16 v35 = 2112;
      uint64_t v36 = v11;
      _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_INFO, "%s Trigger (%@) is disabled; not running it", buf, 0x16u);
    }

    long long v20 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 6005, @"Automation disabled");
    unint64_t v14 = v20;
    if (a6)
    {
      unint64_t v14 = v20;
      BOOL v15 = 0;
      *a6 = v14;
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

@end