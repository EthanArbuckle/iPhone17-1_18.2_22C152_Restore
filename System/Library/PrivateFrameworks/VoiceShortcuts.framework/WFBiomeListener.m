@interface WFBiomeListener
+ (id)registrationError;
- (BOOL)isTransactionEventDuplicate:(id)a3 forTrigger:(id)a4 withSeenTransactionIdentifiers:(id)a5;
- (NSMutableDictionary)remoteTriggerIDToSinks;
- (NSMutableDictionary)seenTransactionIdentifiers;
- (NSMutableDictionary)triggerIDToSinks;
- (OS_dispatch_queue)queue;
- (WFBiomeListener)initWithEventQueue:(id)a3;
- (WFTriggerEventQueue)eventQueue;
- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6;
- (void)queue_fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6;
- (void)queue_handleEvent:(id)a3 forTrigger:(id)a4;
- (void)queue_unregisterConfiguredTriggerWithIdentifier:(id)a3;
- (void)registerConfiguredTrigger:(id)a3 completion:(id)a4;
- (void)setSeenTransactionIdentifiers:(id)a3;
- (void)unregisterConfiguredTriggerWithIdentifier:(id)a3;
@end

@implementation WFBiomeListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenTransactionIdentifiers, 0);
  objc_storeStrong((id *)&self->_remoteTriggerIDToSinks, 0);
  objc_storeStrong((id *)&self->_triggerIDToSinks, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setSeenTransactionIdentifiers:(id)a3
{
}

- (NSMutableDictionary)seenTransactionIdentifiers
{
  return self->_seenTransactionIdentifiers;
}

- (NSMutableDictionary)remoteTriggerIDToSinks
{
  return self->_remoteTriggerIDToSinks;
}

- (NSMutableDictionary)triggerIDToSinks
{
  return self->_triggerIDToSinks;
}

- (WFTriggerEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isTransactionEventDuplicate:(id)a3 forTrigger:(id)a4 withSeenTransactionIdentifiers:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 trigger];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = [v10 transactionIdentifierWithEvent:v7];
    if ([v11 length])
    {
      v12 = [v8 identifier];
      v13 = [v9 objectForKeyedSubscript:v12];
      v14 = v13;
      if (v13) {
        id v15 = v13;
      }
      else {
        id v15 = (id)objc_opt_new();
      }
      v17 = v15;

      int v16 = [v17 containsObject:v11];
      if (v16)
      {
        v18 = getWFTriggersLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136315394;
          v21 = "-[WFBiomeListener isTransactionEventDuplicate:forTrigger:withSeenTransactionIdentifiers:]";
          __int16 v22 = 2112;
          v23 = v11;
          _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_DEFAULT, "%s Ignoring duplicate transaction identifier %@", (uint8_t *)&v20, 0x16u);
        }
      }
      else
      {
        [v17 addObject:v11];
        v18 = [v8 identifier];
        [v9 setObject:v17 forKeyedSubscript:v18];
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  else
  {

    LOBYTE(v16) = 0;
  }

  return v16;
}

- (void)queue_handleEvent:(id)a3 forTrigger:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(WFBiomeListener *)self queue];
  dispatch_assert_queue_V2(v9);

  if (!v8)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFBiomeListener.m", 171, @"Invalid parameter not satisfying: %@", @"configuredTrigger" object file lineNumber description];
  }
  id v10 = [v8 trigger];
  v11 = getWFTriggersLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 identifier];
    *(_DWORD *)buf = 136315906;
    v23 = "-[WFBiomeListener queue_handleEvent:forTrigger:]";
    __int16 v24 = 2112;
    v25 = v10;
    __int16 v26 = 2114;
    v27 = v12;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s 🤖 Handling event for trigger with identifier (%@, %{public}@) and event: %@", buf, 0x2Au);
  }
  v13 = [(WFBiomeListener *)self seenTransactionIdentifiers];
  BOOL v14 = [(WFBiomeListener *)self isTransactionEventDuplicate:v7 forTrigger:v8 withSeenTransactionIdentifiers:v13];

  if (!v14)
  {
    id v15 = [v8 identifier];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke;
    v17[3] = &unk_1E6542000;
    id v18 = v10;
    id v19 = v8;
    id v20 = v7;
    v21 = self;
    [v18 shouldFireInResponseToEvent:v20 triggerIdentifier:v15 completion:v17];
  }
}

void __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v14 = "-[WFBiomeListener queue_handleEvent:forTrigger:]_block_invoke";
    __int16 v15 = 1024;
    LODWORD(v16) = a2;
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s 🤖 Should the trigger fire in response to this event? %d", buf, 0x12u);
  }

  if (a2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke_210;
    v11[3] = &unk_1E6541FD8;
    uint64_t v5 = *(void *)(a1 + 48);
    v11[4] = *(void *)(a1 + 56);
    v6 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    [v6 eventInfoForEvent:v5 completion:v11];
  }
  else
  {
    id v7 = getWFTriggersLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [*(id *)(a1 + 40) identifier];
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315906;
      BOOL v14 = "-[WFBiomeListener queue_handleEvent:forTrigger:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s 🤖 Trigger (%@, %{public}@) should NOT fire in response to event: %@, dropping", buf, 0x2Au);
    }
  }
}

void __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke_210(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke_2;
  block[3] = &unk_1E65420A0;
  uint64_t v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  id v5 = (id)v3;
  if (*(void *)(a1 + 48)) {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CC08];
  }
  objc_msgSend(v2, "queue_fireTriggerWithIdentifier:force:eventInfo:completion:", v3, 0, v4, &__block_literal_global_7060);
}

void __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = getWFTriggersLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[WFBiomeListener queue_handleEvent:forTrigger:]_block_invoke_3";
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)queue_fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  BOOL v14 = [(WFBiomeListener *)self queue];
  dispatch_assert_queue_V2(v14);

  if (v13)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFBiomeListener.m", 164, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFBiomeListener.m", 165, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v17 = [(WFBiomeListener *)self eventQueue];
  [v17 enqueueTriggerWithIdentifier:v13 eventInfo:v12 force:v7 completion:v11];
}

- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(WFBiomeListener *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WFBiomeListener_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke;
  block[3] = &unk_1E6541F90;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __72__WFBiomeListener_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_fireTriggerWithIdentifier:force:eventInfo:completion:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)queue_unregisterConfiguredTriggerWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFBiomeListener *)self queue];
  dispatch_assert_queue_V2(v5);

  int v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    id v17 = "-[WFBiomeListener queue_unregisterConfiguredTriggerWithIdentifier:]";
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s [Biome] Unregistering trigger with identifier: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  BOOL v7 = [(WFBiomeListener *)self triggerIDToSinks];
  uint64_t v8 = [v7 objectForKey:v4];

  id v9 = [(WFBiomeListener *)self remoteTriggerIDToSinks];
  uint64_t v10 = [v9 objectForKey:v4];

  if (!(v8 | v10))
  {
    id v15 = getWFTriggersLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      id v17 = "-[WFBiomeListener queue_unregisterConfiguredTriggerWithIdentifier:]";
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEFAULT, "%s [Biome] No sink associated with identifier: %{public}@, nothing to unregister", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_12;
  }
  if (v8)
  {
    [(id)v8 cancel];
    id v11 = [(WFBiomeListener *)self triggerIDToSinks];
    [v11 removeObjectForKey:v4];
  }
  if (v10)
  {
    id v12 = [(WFBiomeListener *)self remoteTriggerIDToSinks];
    id v13 = [v12 allValues];
    unint64_t v14 = [v13 count];

    if (v14 <= 1) {
      [MEMORY[0x1E4FB7380] unregisterContextSyncClient];
    }
    [(id)v10 cancel];
    id v15 = [(WFBiomeListener *)self remoteTriggerIDToSinks];
    [v15 removeObjectForKey:v4];
LABEL_12:
  }
}

- (void)unregisterConfiguredTriggerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFBiomeListener *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__WFBiomeListener_unregisterConfiguredTriggerWithIdentifier___block_invoke;
  v7[3] = &unk_1E6541F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __61__WFBiomeListener_unregisterConfiguredTriggerWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_unregisterConfiguredTriggerWithIdentifier:", *(void *)(a1 + 40));
}

- (void)registerConfiguredTrigger:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFBiomeListener *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke;
  block[3] = &unk_1E6541F40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) identifier];
  if (([*(id *)(a1 + 32) isEnabled] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "queue_unregisterConfiguredTriggerWithIdentifier:", v2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_24;
  }
  uint64_t v3 = [*(id *)(a1 + 32) trigger];
  id v4 = [*(id *)(a1 + 40) triggerIDToSinks];
  id v5 = [v4 objectForKey:v2];
  if (v5)
  {

LABEL_6:
    objc_msgSend(*(id *)(a1 + 40), "queue_unregisterConfiguredTriggerWithIdentifier:", v2);
    goto LABEL_7;
  }
  id v6 = [*(id *)(a1 + 40) remoteTriggerIDToSinks];
  id v7 = [v6 objectForKey:v2];

  if (v7) {
    goto LABEL_6;
  }
LABEL_7:
  id v8 = getWFTriggersLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v56 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
    __int16 v57 = 2112;
    v58 = v9;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEFAULT, "%s 🤖 [Biome] Registering configured trigger: %@", buf, 0x16u);
  }

  id v10 = [NSString stringWithFormat:@"com.apple.siriactionsd.%@", v2];
  id v11 = objc_alloc(MEMORY[0x1E4F502E8]);
  id v12 = [*(id *)(a1 + 40) queue];
  uint64_t v13 = [v11 initWithIdentifier:v10 targetQueue:v12];

  v44 = (void *)v13;
  id v14 = [v3 publisherWithScheduler:v13];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_172;
  v53[3] = &unk_1E6541EF0;
  id v54 = v3;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_174;
  v50[3] = &unk_1E6541F18;
  id v15 = v54;
  id v51 = v15;
  int8x16_t v42 = *(int8x16_t *)(a1 + 32);
  id v16 = (id)v42.i64[0];
  int8x16_t v52 = vextq_s8(v42, v42, 8uLL);
  id v17 = [v14 sinkWithCompletion:v53 receiveInput:v50];

  if (v17)
  {
    __int16 v18 = [*(id *)(a1 + 40) triggerIDToSinks];
    [v18 setObject:v17 forKey:v2];

    if (![v15 hasRemotePublisher]) {
      goto LABEL_20;
    }
    v43 = v10;
    id v19 = [NSString stringWithFormat:@"com.apple.siriactionsd.remote.%@", v2];
    id v20 = objc_alloc(MEMORY[0x1E4F502E8]);
    BOOL v21 = [*(id *)(a1 + 40) queue];
    __int16 v22 = (void *)[v20 initWithIdentifier:v19 targetQueue:v21];

    v23 = [v15 remotePublisherWithScheduler:v22];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_182;
    v48[3] = &unk_1E6541EF0;
    id v49 = v15;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_183;
    v45[3] = &unk_1E6541F18;
    id v46 = v49;
    int8x16_t v41 = *(int8x16_t *)(a1 + 32);
    id v24 = (id)v41.i64[0];
    int8x16_t v47 = vextq_s8(v41, v41, 8uLL);
    v25 = [v23 sinkWithCompletion:v48 receiveInput:v45];

    if (v25)
    {
      __int16 v26 = [*(id *)(a1 + 40) remoteTriggerIDToSinks];
      [v26 setObject:v25 forKey:v2];
    }
    else
    {
      v33 = v19;
      v34 = getWFTriggersLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        v35 = [*(id *)(a1 + 32) trigger];
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        *(_DWORD *)buf = 136315394;
        v56 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke_2";
        __int16 v57 = 2114;
        v58 = v37;
        _os_log_impl(&dword_1C7D7E000, v34, OS_LOG_TYPE_FAULT, "%s Could not register trigger of type %{public}@ due to missing remote sink", buf, 0x16u);
      }
      uint64_t v38 = *(void *)(a1 + 48);
      __int16 v26 = [(id)objc_opt_class() registrationError];
      (*(void (**)(uint64_t, void, void *))(v38 + 16))(v38, 0, v26);
      id v19 = v33;
    }

    id v10 = v43;
    if (v25)
    {
LABEL_20:
      v39 = getWFTriggersLogObject();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v56 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
        __int16 v57 = 2112;
        v58 = v40;
        _os_log_impl(&dword_1C7D7E000, v39, OS_LOG_TYPE_DEFAULT, "%s 🤖 [Biome] Registered configured trigger: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v27 = getWFTriggersLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      __int16 v28 = [*(id *)(a1 + 32) trigger];
      id v29 = (objc_class *)objc_opt_class();
      uint64_t v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 136315394;
      v56 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke_2";
      __int16 v57 = 2114;
      v58 = v30;
      _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_FAULT, "%s Could not register trigger of type %{public}@ due to missing sink", buf, 0x16u);
    }
    uint64_t v31 = *(void *)(a1 + 48);
    v32 = [(id)objc_opt_class() registrationError];
    (*(void (**)(uint64_t, void, void *))(v31 + 16))(v31, 0, v32);
  }
LABEL_24:
}

void __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_172(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    id v5 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s Event cancelled %@", (uint8_t *)&v4, 0x16u);
  }
}

void __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_174(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    uint64_t v13 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s Received input %@ from trigger %@", buf, 0x20u);
  }

  __int16 v6 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_175;
  block[3] = &unk_1E65420A0;
  uint64_t v7 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_182(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    uint64_t v5 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s Event cancelled %@ remote", (uint8_t *)&v4, 0x16u);
  }
}

void __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_183(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    uint64_t v13 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s Received input %@ from trigger %@", buf, 0x20u);
  }

  __int16 v6 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_184;
  block[3] = &unk_1E65420A0;
  uint64_t v7 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, block);
}

uint64_t __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_184(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_handleEvent:forTrigger:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_175(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_handleEvent:forTrigger:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (WFBiomeListener)initWithEventQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFBiomeListener;
  __int16 v6 = [(WFBiomeListener *)&v19 init];
  if (v6)
  {
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.siriactionsd.WFBiomeListener", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_eventQueue, a3);
    uint64_t v11 = objc_opt_new();
    triggerIDToSinks = v6->_triggerIDToSinks;
    v6->_triggerIDToSinks = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    remoteTriggerIDToSinks = v6->_remoteTriggerIDToSinks;
    v6->_remoteTriggerIDToSinks = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    seenTransactionIdentifiers = v6->_seenTransactionIdentifiers;
    v6->_seenTransactionIdentifiers = (NSMutableDictionary *)v15;

    uint64_t v17 = v6;
  }

  return v6;
}

+ (id)registrationError
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v8[0] = *MEMORY[0x1E4F28588];
  v8[1] = v3;
  v9[0] = @"Automation could not be registered";
  v9[1] = @"The associated automation could not be registered due to an underlying error.";
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v5 = (void *)[v2 initWithDictionary:v4];

  __int16 v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB7490] code:1002 userInfo:v5];

  return v6;
}

@end