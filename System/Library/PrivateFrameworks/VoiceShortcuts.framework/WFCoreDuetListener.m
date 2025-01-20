@interface WFCoreDuetListener
- (BOOL)isCallbackRegisteredWithIdentifier:(id)a3;
- (BOOL)registerTrigger:(id)a3 error:(id *)a4;
- (NSMutableDictionary)registrations;
- (OS_dispatch_queue)queue;
- (SwiftVCDaemonXPCEventHandler)eventHandler;
- (WFCoreDuetListener)initWithDatabaseProvider:(id)a3 eventQueue:(id)a4;
- (WFDatabaseProvider)databaseProvider;
- (WFTriggerEventQueue)eventQueue;
- (_CDUserContext)userContext;
- (id)databaseWithError:(id *)a3;
- (void)checkTriggerStateWithIdentifier:(id)a3 completion:(id)a4;
- (void)checkTriggerStateWithKeyPath:(id)a3 completion:(id)a4;
- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6;
- (void)handleCallbackForTriggerWithIdentifier:(id)a3 info:(id)a4;
- (void)handleSunriseSunsetChanged;
- (void)queue_fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6;
- (void)queue_unregisterCallbackForIdentifier:(id)a3;
- (void)registerCallback:(id)a3 withIdentifier:(id)a4;
- (void)registerConfiguredTrigger:(id)a3 completion:(id)a4;
- (void)registerSunriseSunsetCallbackIfNeeded;
- (void)setEventQueue:(id)a3;
- (void)unregisterConfiguredTriggerWithIdentifier:(id)a3;
@end

@implementation WFCoreDuetListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setEventQueue:(id)a3
{
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

- (_CDUserContext)userContext
{
  return self->_userContext;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)checkTriggerStateWithKeyPath:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 328, @"Invalid parameter not satisfying: %@", @"keyPathName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 329, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v10 = [MEMORY[0x1E4F5B6E0] keyPathWithKey:v7];
  if (!v10)
  {
    v12 = [NSString stringWithFormat:@"[Triggers] Couldn't find keyPath for: %@", v7];
    v17 = getWFGeneralLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFCoreDuetListener checkTriggerStateWithKeyPath:completion:]";
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    v16 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1001, @"%@", v12);
    ((void (**)(void, void, void *))v9)[2](v9, 0, v16);
    goto LABEL_9;
  }
  v11 = [(WFCoreDuetListener *)self userContext];
  v12 = [v11 objectForKeyedSubscript:v10];

  v13 = NSString;
  if (v12)
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = [v13 stringWithFormat:@"(%@) %@", v15, v12];

    ((void (**)(void, void *, void))v9)[2](v9, v16, 0);
LABEL_9:

    goto LABEL_13;
  }
  v18 = [NSString stringWithFormat:@"[Triggers] No value for keyPath: %@", v10];
  v19 = getWFGeneralLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[WFCoreDuetListener checkTriggerStateWithKeyPath:completion:]";
    __int16 v25 = 2112;
    v26 = v18;
    _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v20 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 6001, @"%@", v18);
  ((void (**)(void, void, void *))v9)[2](v9, 0, v20);

  v12 = 0;
LABEL_13:
}

- (void)checkTriggerStateWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 293, @"Invalid parameter not satisfying: %@", @"triggerIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 294, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = [(WFCoreDuetListener *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WFCoreDuetListener_checkTriggerStateWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E6541F40;
  id v16 = v7;
  id v17 = v9;
  block[4] = self;
  id v11 = v7;
  id v12 = v9;
  dispatch_async(v10, block);
}

void __65__WFCoreDuetListener_checkTriggerStateWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v21 = 0;
  v3 = [v2 databaseWithError:&v21];
  id v4 = v21;
  if (v3)
  {
    v5 = [v3 configuredTriggerForTriggerID:*(void *)(a1 + 40)];
    v6 = [v5 trigger];

    if (v6)
    {
      id v7 = [v6 contextStoreKeyPathForCurrentState];
      id v8 = v7;
      if (v7)
      {
        v9 = [v7 description];
        v10 = [*(id *)(a1 + 32) userContext];
        id v11 = [v10 objectForKeyedSubscript:v8];

        id v12 = NSString;
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = [v12 stringWithFormat:@"(%@) %@", v14, v11];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        v9 = [NSString stringWithFormat:@"[Triggers] Couldn't find keyPath for trigger: %@", v6];
        v19 = getWFGeneralLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "-[WFCoreDuetListener checkTriggerStateWithIdentifier:completion:]_block_invoke";
          __int16 v24 = 2112;
          id v25 = v9;
          _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
        }

        uint64_t v20 = *(void *)(a1 + 48);
        id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1001, @"%@", v9);
        (*(void (**)(uint64_t, void, void, void *))(v20 + 16))(v20, 0, 0, v11);
      }
    }
    else
    {
      id v8 = [NSString stringWithFormat:@"[Triggers] Couldn't find trigger with id: %@", *(void *)(a1 + 40)];
      id v17 = getWFGeneralLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[WFCoreDuetListener checkTriggerStateWithIdentifier:completion:]_block_invoke";
        __int16 v24 = 2112;
        id v25 = v8;
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }

      uint64_t v18 = *(void *)(a1 + 48);
      v9 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 6003, @"%@", v8);
      (*(void (**)(uint64_t, void, void, void *))(v18 + 16))(v18, 0, 0, v9);
    }
  }
  else
  {
    id v16 = getWFGeneralLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFCoreDuetListener checkTriggerStateWithIdentifier:completion:]_block_invoke";
      __int16 v24 = 2114;
      id v25 = v4;
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_ERROR, "%s Failed to load database: %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 285, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 286, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v13) {
    goto LABEL_5;
  }
LABEL_3:
  v15 = [(WFCoreDuetListener *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__WFCoreDuetListener_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke;
  block[3] = &unk_1E6541F90;
  block[4] = self;
  id v22 = v11;
  BOOL v25 = a4;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v15, block);
}

uint64_t __75__WFCoreDuetListener_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_fireTriggerWithIdentifier:force:eventInfo:completion:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)queue_fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = [(WFCoreDuetListener *)self queue];
  dispatch_assert_queue_V2(v14);

  if (v13)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 276, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 277, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v17 = [(WFCoreDuetListener *)self eventQueue];
  [v17 enqueueTriggerWithIdentifier:v13 eventInfo:v12 force:v7 completion:v11];
}

- (void)handleSunriseSunsetChanged
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(WFCoreDuetListener *)self queue];
  dispatch_assert_queue_V2(v3);

  id v25 = 0;
  id v4 = [(WFCoreDuetListener *)self databaseWithError:&v25];
  id v5 = v25;
  v6 = v5;
  if (v4)
  {
    id v18 = v5;
    v19 = v4;
    BOOL v7 = [v4 allConfiguredTriggers];
    id v8 = [v7 descriptors];
    v9 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_1099);

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v20 = 0;
          [(WFCoreDuetListener *)self registerTrigger:v15 error:&v20];
          id v16 = v20;
          if (v16)
          {
            id v17 = getWFTriggersLogObject();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v28 = "-[WFCoreDuetListener handleSunriseSunsetChanged]";
              __int16 v29 = 2114;
              id v30 = v16;
              _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_FAULT, "%s Failed to update trigger after sunrise/sunset change: %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    v6 = v18;
    id v4 = v19;
  }
  else
  {
    v10 = getWFTriggersLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[WFCoreDuetListener handleSunriseSunsetChanged]";
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Failed tp load database: %{public}@", buf, 0x16u);
    }
  }
}

id __48__WFCoreDuetListener_handleSunriseSunsetChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 trigger];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v2;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  id v5 = v4;
  return v5;
}

- (void)registerSunriseSunsetCallbackIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(WFCoreDuetListener *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(WFCoreDuetListener *)self isCallbackRegisteredWithIdentifier:@"com.apple.siriactionsd.registrationForSunsetSunrise"];
  id v5 = getWFTriggersLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFCoreDuetListener registerSunriseSunsetCallbackIfNeeded]";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Already registered for sunrise / sunset changes", buf, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFCoreDuetListener registerSunriseSunsetCallbackIfNeeded]";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Registering for sunrise / sunset changes", buf, 0xCu);
    }

    BOOL v7 = (void *)MEMORY[0x1E4F5B6E8];
    id v8 = [MEMORY[0x1E4F5B6B8] keyPathForSunriseSunsetDataDictionary];
    id v5 = [v7 predicateForChangeAtKeyPath:v8];

    objc_initWeak((id *)buf, self);
    v9 = (void *)MEMORY[0x1E4F5B6C8];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__WFCoreDuetListener_registerSunriseSunsetCallbackIfNeeded__block_invoke;
    v11[3] = &unk_1E6542200;
    objc_copyWeak(&v12, (id *)buf);
    v10 = [v9 localWakingRegistrationWithIdentifier:@"com.apple.siriactionsd.registrationForSunsetSunrise" contextualPredicate:v5 clientIdentifier:@"com.apple.siriactionsd.contextstore-registration" callback:v11];
    [(WFCoreDuetListener *)self registerCallback:v10 withIdentifier:@"com.apple.siriactionsd.registrationForSunsetSunrise"];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __59__WFCoreDuetListener_registerSunriseSunsetCallbackIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WFCoreDuetListener_registerSunriseSunsetCallbackIfNeeded__block_invoke_2;
  block[3] = &unk_1E65420F0;
  block[4] = WeakRetained;
  dispatch_async(v2, block);
}

uint64_t __59__WFCoreDuetListener_registerSunriseSunsetCallbackIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSunriseSunsetChanged];
}

- (void)queue_unregisterCallbackForIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFCoreDuetListener *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(WFCoreDuetListener *)self registrations];
  BOOL v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    id v8 = getWFTriggersLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      id v12 = "-[WFCoreDuetListener queue_unregisterCallbackForIdentifier:]";
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEBUG, "%s Deleting context store registration for identifier: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    v9 = [(WFCoreDuetListener *)self userContext];
    [v9 deregisterCallback:v7];

    v10 = [(WFCoreDuetListener *)self registrations];
    [v10 setObject:0 forKeyedSubscript:v4];
  }
}

- (void)registerCallback:(id)a3 withIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [(WFCoreDuetListener *)self queue];
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 195, @"Invalid parameter not satisfying: %@", @"registration" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 196, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  [(WFCoreDuetListener *)self queue_unregisterCallbackForIdentifier:v7];
  v10 = getWFTriggersLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[WFCoreDuetListener registerCallback:withIdentifier:]";
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEBUG, "%s Creating context store registration for identifier: %{public}@", buf, 0x16u);
  }

  int v11 = [(WFCoreDuetListener *)self userContext];
  [v11 registerCallback:v8];

  id v12 = [(WFCoreDuetListener *)self registrations];
  [v12 setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)isCallbackRegisteredWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFCoreDuetListener *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(WFCoreDuetListener *)self registrations];
  id v7 = [v6 objectForKeyedSubscript:v4];

  return v7 != 0;
}

- (void)handleCallbackForTriggerWithIdentifier:(id)a3 info:(id)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [(WFCoreDuetListener *)self queue];
  dispatch_assert_queue_V2(v9);

  if (!v7)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 155, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v10 = getWFTriggersLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[WFCoreDuetListener handleCallbackForTriggerWithIdentifier:info:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s 🤖 Handling callback for registration with identifier (%{public}@) and info: %@", buf, 0x20u);
  }

  id v11 = v8;
  id v12 = getWFTriggersLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "VCEventInfoForUserFromContextStoreInfo";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEBUG, "%s rawInfo: %@", buf, 0x16u);
  }

  __int16 v13 = [v11 objectForKeyedSubscript:@"NewValue"];
  id v14 = [v11 objectForKeyedSubscript:@"OldValue"];
  if (v13)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v16 = (void *)MEMORY[0x1E4F1CC08];
    if (isKindOfClass)
    {
      __int16 v17 = [v13 value];
      id v18 = [v14 value];
      v28 = v17;
      uint64_t v19 = VCSerializedEventInfo(v17);
      uint64_t v27 = v18;
      uint64_t v20 = VCSerializedEventInfo(v18);
      long long v21 = (void *)v20;
      if (v19 | v20)
      {
        if (v19) {
          uint64_t v22 = v19;
        }
        else {
          uint64_t v22 = (uint64_t)v16;
        }
        v34[0] = @"NewValue";
        v34[1] = @"OldValue";
        if (v20) {
          uint64_t v23 = v20;
        }
        else {
          uint64_t v23 = (uint64_t)v16;
        }
        *(void *)buf = v22;
        *(void *)&buf[8] = v23;
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v34 count:2];
      }
      else
      {
        long long v24 = getWFTriggersLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "VCEventInfoForUserFromContextStoreInfo";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_FAULT, "%s Couldn't build safe object from Context Store info: %@", buf, 0x16u);
        }

        id v16 = (void *)MEMORY[0x1E4F1CC08];
      }
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F1CC08];
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __66__WFCoreDuetListener_handleCallbackForTriggerWithIdentifier_info___block_invoke;
  v29[3] = &unk_1E6540370;
  v29[4] = self;
  id v30 = v7;
  id v25 = v7;
  [(WFCoreDuetListener *)self fireTriggerWithIdentifier:v25 force:0 eventInfo:v16 completion:v29];
}

void __66__WFCoreDuetListener_handleCallbackForTriggerWithIdentifier_info___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[WFCoreDuetListener handleCallbackForTriggerWithIdentifier:info:]_block_invoke";
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger: %{public}@", buf, 0x16u);
    }
  }
  id v7 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__WFCoreDuetListener_handleCallbackForTriggerWithIdentifier_info___block_invoke_208;
  v9[3] = &unk_1E6541F68;
  id v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  dispatch_async(v7, v9);
}

void __66__WFCoreDuetListener_handleCallbackForTriggerWithIdentifier_info___block_invoke_208(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v16 = 0;
  v3 = [v2 databaseWithError:&v16];
  id v4 = v16;
  if (v3)
  {
    id v5 = [v3 configuredTriggerForTriggerID:*(void *)(a1 + 40)];
    BOOL v6 = [v5 trigger];
    int v7 = [v6 needsRegistrationAfterFiring];

    if (v7)
    {
      id v8 = getWFTriggersLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v18 = "-[WFCoreDuetListener handleCallbackForTriggerWithIdentifier:info:]_block_invoke";
        _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_INFO, "%s Re-registering trigger", buf, 0xCu);
      }

      v9 = *(void **)(a1 + 32);
      id v15 = 0;
      char v10 = [v9 registerTrigger:v5 error:&v15];
      id v11 = v15;
      if ((v10 & 1) == 0)
      {
        id v12 = getWFTriggersLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 136315394;
          id v18 = "-[WFCoreDuetListener handleCallbackForTriggerWithIdentifier:info:]_block_invoke";
          __int16 v19 = 2114;
          uint64_t v20 = v13;
          _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_ERROR, "%s 🤖 Failed to reregister trigger after firing with identifier: %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = getWFTriggersLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      id v18 = "-[WFCoreDuetListener handleCallbackForTriggerWithIdentifier:info:]_block_invoke";
      __int16 v19 = 2114;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s 🤖 Failed to reregister trigger after firing with identifier because the database could not be loaded: %{public}@", buf, 0x16u);
    }
  }
}

- (void)unregisterConfiguredTriggerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFCoreDuetListener *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__WFCoreDuetListener_unregisterConfiguredTriggerWithIdentifier___block_invoke;
  v7[3] = &unk_1E6541F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__WFCoreDuetListener_unregisterConfiguredTriggerWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_unregisterCallbackForIdentifier:", *(void *)(a1 + 40));
}

- (BOOL)registerTrigger:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(WFCoreDuetListener *)self queue];
  dispatch_assert_queue_V2(v7);

  if (!v6)
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 92, @"Invalid parameter not satisfying: %@", @"configuredTrigger" object file lineNumber description];
  }
  id v8 = [v6 identifier];
  if ([v6 isEnabled])
  {
    id v9 = [v6 trigger];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (![v9 event] || (v10 = objc_msgSend(v9, "event"), id v11 = v9, v10 == 1))
      {
        [(WFCoreDuetListener *)self registerSunriseSunsetCallbackIfNeeded];
        id v11 = v9;
      }
    }
    else
    {

      id v11 = 0;
    }
    v36 = v11;
    uint64_t v13 = [v9 contextStorePredicate];
    BOOL v37 = v13 != 0;
    if (v13)
    {
      unsigned int v35 = [v9 contextStoreQualityOfService];
      int v14 = [v9 contextStoreRegistrationIsForWatch];
      id v15 = getWFTriggersLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (v14) {
          id v16 = @"watch";
        }
        else {
          id v16 = @"phone";
        }
        __int16 v17 = [v6 identifier];
        id v18 = (objc_class *)objc_opt_class();
        __int16 v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 136316418;
        v42 = "-[WFCoreDuetListener registerTrigger:error:]";
        __int16 v43 = 2112;
        id v44 = v13;
        __int16 v45 = 1024;
        *(_DWORD *)v46 = v35;
        *(_WORD *)&v46[4] = 2112;
        *(void *)&v46[6] = v16;
        __int16 v47 = 2112;
        v48 = v17;
        __int16 v49 = 2114;
        v50 = v19;
        _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEFAULT, "%s Registering predicate (%@) with QoS (%u) device (%@) for trigger: (%@) of trigger type: (%{public}@)", buf, 0x3Au);
      }
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__WFCoreDuetListener_registerTrigger_error___block_invoke;
      aBlock[3] = &unk_1E6542200;
      objc_copyWeak(&v39, &location);
      uint64_t v20 = _Block_copy(aBlock);
      if (v14)
      {
        id v21 = v13;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          uint64_t v23 = v21;
        }
        else {
          uint64_t v23 = 0;
        }
        id v24 = v23;

        if (isKindOfClass)
        {
          id v25 = [MEMORY[0x1E4F5B6C8] registrationWithIdentifier:v8 contextualPredicate:v21 deviceTypes:64 clientIdentifier:@"com.apple.siriactionsd.contextstore-registration" mustWake:1 qualityOfService:v35 callback:v20];
        }
        else
        {
          __int16 v29 = getWFTriggersLogObject();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          {
            id v30 = (objc_class *)objc_opt_class();
            uint64_t v31 = NSStringFromClass(v30);
            *(_DWORD *)buf = 136315394;
            v42 = "-[WFCoreDuetListener registerTrigger:error:]";
            __int16 v43 = 2114;
            id v44 = v31;
            _os_log_impl(&dword_1C7D7E000, v29, OS_LOG_TYPE_FAULT, "%s For watch, predicate must be _CDMDCSContextualPredicate, not %{public}@", buf, 0x16u);
          }
          id v25 = 0;
        }
      }
      else
      {
        LODWORD(v34) = v35;
        id v25 = [MEMORY[0x1E4F5B6C8] registrationWithIdentifier:v8 contextualPredicate:v13 dismissalPolicy:0 deviceSet:0 clientIdentifier:@"com.apple.siriactionsd.contextstore-registration" mustWake:1 qualityOfService:v34 callback:v20];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v25 setLocationManagerEffectiveBundleID:*MEMORY[0x1E4FB4BE8]];
      }
      [(WFCoreDuetListener *)self registerCallback:v25 withIdentifier:v8];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v26 = getWFTriggersLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        uint64_t v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 136315650;
        v42 = "-[WFCoreDuetListener registerTrigger:error:]";
        __int16 v43 = 2112;
        id v44 = v9;
        __int16 v45 = 2114;
        *(void *)v46 = v28;
        _os_log_impl(&dword_1C7D7E000, v26, OS_LOG_TYPE_FAULT, "%s Unable to generate predicate for trigger: %@ of type: %{public}@, unregistering.", buf, 0x20u);
      }
      [(WFCoreDuetListener *)self queue_unregisterCallbackForIdentifier:v8];
    }
  }
  else
  {
    id v12 = [v6 identifier];
    [(WFCoreDuetListener *)self queue_unregisterCallbackForIdentifier:v12];

    BOOL v37 = 0;
  }

  return v37;
}

void __44__WFCoreDuetListener_registerTrigger_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__WFCoreDuetListener_registerTrigger_error___block_invoke_2;
  block[3] = &unk_1E65420A0;
  block[4] = WeakRetained;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __44__WFCoreDuetListener_registerTrigger_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallbackForTriggerWithIdentifier:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
}

- (void)registerConfiguredTrigger:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFCoreDuetListener *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WFCoreDuetListener_registerConfiguredTrigger_completion___block_invoke;
  block[3] = &unk_1E6541F40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __59__WFCoreDuetListener_registerConfiguredTrigger_completion___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v5 = 0;
  [v2 registerTrigger:v3 error:&v5];
  id v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)databaseWithError:(id *)a3
{
  id v5 = [(WFCoreDuetListener *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(WFCoreDuetListener *)self databaseProvider];
  id v7 = [v6 databaseWithError:a3];

  return v7;
}

- (WFCoreDuetListener)initWithDatabaseProvider:(id)a3 eventQueue:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFCoreDuetListener.m", 56, @"Invalid parameter not satisfying: %@", @"databaseProvider" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)WFCoreDuetListener;
  id v10 = [(WFCoreDuetListener *)&v22 init];
  if (v10)
  {
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.siriactionsd.WFCoreDuetListener", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [MEMORY[0x1E4F5B6A8] userContext];
    userContext = v10->_userContext;
    v10->_userContext = (_CDUserContext *)v15;

    objc_storeStrong((id *)&v10->_databaseProvider, a3);
    objc_storeStrong((id *)&v10->_eventQueue, a4);
    uint64_t v17 = objc_opt_new();
    registrations = v10->_registrations;
    v10->_registrations = (NSMutableDictionary *)v17;

    __int16 v19 = v10;
  }

  return v10;
}

@end