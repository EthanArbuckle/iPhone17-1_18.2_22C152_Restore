@interface STKUSSDAlertSessionManager
- (STKCarrierSubscriptionMonitor)subscriptionMonitor;
- (STKUSSDAlertSessionManager)initWithSubscriptionMonitor:(id)a3;
- (id)_supplementaryServicesResponder;
- (id)remoteAlertDescriptorForSession:(id)a3;
- (void)_executeOnQueue:(id)a3;
- (void)_queue_handleUSSDEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5;
- (void)_queue_startListening;
- (void)_willPresentAlertHandle:(id)a3;
- (void)handleUSSDEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)suppServicesCompleted:(id)a3;
- (void)suppServicesError:(id)a3 error:(id)a4;
- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6;
- (void)suppServicesStarted:(id)a3;
@end

@implementation STKUSSDAlertSessionManager

- (STKUSSDAlertSessionManager)initWithSubscriptionMonitor:(id)a3
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = STKUSSDLog();
  v25.receiver = self;
  v25.super_class = (Class)STKUSSDAlertSessionManager;
  v8 = [(STKAlertSessionManager *)&v25 initWithEventQueue:v6 logger:v7];

  if (v8)
  {
    uint64_t v9 = BSDispatchQueueCreateWithQualityOfService();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v8->_queue];
    telephonyClient = v8->_telephonyClient;
    v8->_telephonyClient = (CoreTelephonyClient *)v11;

    objc_storeStrong((id *)&v8->_subscriptionMonitor, a3);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activeUSSDSessions = v8->_activeUSSDSessions;
    v8->_activeUSSDSessions = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    finishedUSSDSessions = v8->_finishedUSSDSessions;
    v8->_finishedUSSDSessions = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activeSupplementaryServicesSessions = v8->_activeSupplementaryServicesSessions;
    v8->_activeSupplementaryServicesSessions = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    finishedSupplementaryServicesSessions = v8->_finishedSupplementaryServicesSessions;
    v8->_finishedSupplementaryServicesSessions = v19;

    v21 = v8->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__STKUSSDAlertSessionManager_initWithSubscriptionMonitor___block_invoke;
    block[3] = &unk_2645F4458;
    v24 = v8;
    dispatch_sync(v21, block);
  }
  return v8;
}

uint64_t __58__STKUSSDAlertSessionManager_initWithSubscriptionMonitor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startListening");
}

- (void)_willPresentAlertHandle:(id)a3
{
}

- (id)remoteAlertDescriptorForSession:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    id v5 = [[STKUSSDSessionData alloc] initWithText:0 allowsResponse:0];
    v6 = [STKUSSDSessionAction alloc];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __62__STKUSSDAlertSessionManager_remoteAlertDescriptorForSession___block_invoke;
    v14 = &unk_2645F44A8;
    objc_copyWeak(&v17, &location);
    id v15 = v4;
    v16 = self;
    v7 = [(STKUSSDSessionAction *)v6 initWithInputData:v5 response:&v11];
    v8 = [_STKRemoteAlertDescriptor alloc];
    uint64_t v9 = [(_STKRemoteAlertDescriptor *)v8 initWithAction:v7, @"STKUSSDViewController", v11, v12, v13, v14 viewControllerName];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __62__STKUSSDAlertSessionManager_remoteAlertDescriptorForSession___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[4];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__STKUSSDAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_2;
    block[3] = &unk_2645F4480;
    void block[4] = WeakRetained;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = v9;
    uint64_t v13 = v10;
    id v14 = v5;
    uint64_t v15 = a2;
    dispatch_async(v8, block);
  }
}

uint64_t __62__STKUSSDAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 56) containsObject:*(void *)(a1 + 40)])
  {
    v2 = [*(id *)(a1 + 48) log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_221DC0000, v2, OS_LOG_TYPE_DEFAULT, "Sending response for active session - marking it as finished.", v6, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
  }
  v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 56)) {
    return objc_msgSend(v3, "sendResponse:withStringResult:", v4);
  }
  else {
    return [v3 sendResponse:v4];
  }
}

- (void)handleUSSDEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__STKUSSDAlertSessionManager_handleUSSDEvent_responder_userInfo___block_invoke;
  v13[3] = &unk_2645F44D0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

uint64_t __65__STKUSSDAlertSessionManager_handleUSSDEvent_responder_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleUSSDEvent:responder:userInfo:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__STKUSSDAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_2645F44F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __61__STKUSSDAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v59;
    *(void *)&long long v4 = 134217984;
    long long v42 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v59 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "alertHandle", v42);
        uint64_t v10 = *(void **)(a1 + 40);

        if (v9 == v10)
        {
          id v11 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v42;
            v66 = v8;
            _os_log_impl(&dword_221DC0000, v11, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleDeactivated - ended active session", buf, 0xCu);
          }

          [v8 invalidate];
          [*(id *)(*(void *)(a1 + 32) + 56) removeObject:v8];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v5);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v12 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v55;
    *(void *)&long long v14 = 134217984;
    long long v43 = v14;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        v19 = objc_msgSend(v18, "alertHandle", v43);
        v20 = *(void **)(a1 + 40);

        if (v19 == v20)
        {
          [v18 invalidate];
          v21 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v43;
            v66 = v18;
            _os_log_impl(&dword_221DC0000, v21, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleDeactivated - Ended finished session", buf, 0xCu);
          }

          [*(id *)(*(void *)(a1 + 32) + 64) removeObject:v18];
        }
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v15);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v22 = (void *)[*(id *)(*(void *)(a1 + 32) + 80) copy];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v51;
    *(void *)&long long v24 = 134217984;
    long long v44 = v24;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v51 != v26) {
          objc_enumerationMutation(v22);
        }
        v28 = *(void **)(*((void *)&v50 + 1) + 8 * k);
        v29 = objc_msgSend(v28, "alertHandle", v44);
        v30 = *(void **)(a1 + 40);

        if (v29 == v30)
        {
          [v28 invalidate];
          v31 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v44;
            v66 = v28;
            _os_log_impl(&dword_221DC0000, v31, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleDeactivated - Ended active supplementary services session", buf, 0xCu);
          }

          [*(id *)(*(void *)(a1 + 32) + 80) removeObject:v28];
        }
      }
      uint64_t v25 = [v22 countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v25);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v32 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) copy];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v62 count:16];
  if (v33)
  {
    uint64_t v35 = v33;
    uint64_t v36 = *(void *)v47;
    *(void *)&long long v34 = 134217984;
    long long v45 = v34;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(v32);
        }
        v38 = *(void **)(*((void *)&v46 + 1) + 8 * m);
        v39 = objc_msgSend(v38, "alertHandle", v45);
        v40 = *(void **)(a1 + 40);

        if (v39 == v40)
        {
          [v38 invalidate];
          v41 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v45;
            v66 = v38;
            _os_log_impl(&dword_221DC0000, v41, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleDeactivated - Ended finished supplementary services session", buf, 0xCu);
          }

          [*(id *)(*(void *)(a1 + 32) + 88) removeObject:v38];
        }
      }
      uint64_t v35 = [v32 countByEnumeratingWithState:&v46 objects:v62 count:16];
    }
    while (v35);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a3;
  [v5 removeObserver:self];
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__STKUSSDAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke;
  v8[3] = &unk_2645F44F8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __71__STKUSSDAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v65;
    *(void *)&long long v4 = 134217984;
    long long v48 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v65 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "alertHandle", v48);
        uint64_t v10 = *(void **)(a1 + 40);

        if (v9 == v10)
        {
          id v11 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v48;
            v72 = v8;
            _os_log_impl(&dword_221DC0000, v11, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated - Ended active session", buf, 0xCu);
          }

          [v8 invalidate];
          [*(id *)(*(void *)(a1 + 32) + 56) removeObject:v8];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v64 objects:v73 count:16];
    }
    while (v5);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v12 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v61;
    *(void *)&long long v14 = 134217984;
    long long v49 = v14;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v61 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        v19 = objc_msgSend(v18, "alertHandle", v49);
        v20 = *(void **)(a1 + 40);

        if (v19 == v20)
        {
          v21 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v49;
            v72 = v18;
            _os_log_impl(&dword_221DC0000, v21, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated - Ended finished session", buf, 0xCu);
          }

          [v18 invalidate];
          [*(id *)(*(void *)(a1 + 32) + 64) removeObject:v18];
        }
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v15);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v22 = (void *)[*(id *)(*(void *)(a1 + 32) + 80) copy];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v57;
    *(void *)&long long v24 = 134217984;
    long long v50 = v24;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v57 != v26) {
          objc_enumerationMutation(v22);
        }
        v28 = *(void **)(*((void *)&v56 + 1) + 8 * k);
        v29 = objc_msgSend(v28, "alertHandle", v50);
        v30 = *(void **)(a1 + 40);

        if (v29 == v30)
        {
          v31 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v50;
            v72 = v28;
            _os_log_impl(&dword_221DC0000, v31, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated - Ended active supplementary services session", buf, 0xCu);
          }

          [v28 invalidate];
          [*(id *)(*(void *)(a1 + 32) + 80) removeObject:v28];
        }
      }
      uint64_t v25 = [v22 countByEnumeratingWithState:&v56 objects:v69 count:16];
    }
    while (v25);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v32 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) copy];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v68 count:16];
  if (v33)
  {
    uint64_t v35 = v33;
    uint64_t v36 = *(void *)v53;
    *(void *)&long long v34 = 134217984;
    long long v51 = v34;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v53 != v36) {
          objc_enumerationMutation(v32);
        }
        v38 = *(void **)(*((void *)&v52 + 1) + 8 * m);
        v39 = objc_msgSend(v38, "alertHandle", v51);
        v40 = *(void **)(a1 + 40);

        if (v39 == v40)
        {
          v41 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v51;
            v72 = v38;
            _os_log_impl(&dword_221DC0000, v41, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated - Ended finished supplementary services session", buf, 0xCu);
          }

          [v38 invalidate];
          [*(id *)(*(void *)(a1 + 32) + 88) removeObject:v38];
        }
      }
      uint64_t v35 = [v32 countByEnumeratingWithState:&v52 objects:v68 count:16];
    }
    while (v35);
  }

  long long v42 = [*(id *)(*(void *)(a1 + 32) + 72) alertHandle];
  long long v43 = *(void **)(a1 + 40);

  if (v42 == v43)
  {
    long long v44 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      long long v45 = *(void **)(*(void *)(a1 + 32) + 72);
      *(_DWORD *)buf = 134217984;
      v72 = v45;
      _os_log_impl(&dword_221DC0000, v44, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated - Ended coalescing session", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
    uint64_t v46 = *(void *)(a1 + 32);
    long long v47 = *(void **)(v46 + 72);
    *(void *)(v46 + 72) = 0;
  }
}

- (void)suppServicesStarted:(id)a3
{
  id v4 = [(STKUSSDAlertSessionManager *)self _supplementaryServicesResponder];
  [(STKUSSDAlertSessionManager *)self _queue_handleUSSDEvent:6 responder:v4 userInfo:MEMORY[0x263EFFA78]];
}

- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a6;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  id v11 = [NSNumber numberWithUnsignedInt:v7];
  [v10 setObject:v11 forKey:@"STKUSSDSupplementaryServiceEventTypeKey"];

  id v12 = [NSNumber numberWithUnsignedInt:v6];
  [v10 setObject:v12 forKey:@"STKUSSDSupplementaryServiceSettingTypeKey"];

  if (v9)
  {
    uint64_t v13 = (void *)[v9 copy];
    [v10 setObject:v13 forKey:@"STKUSSDSupplementaryServiceNotificationDataKey"];
  }
  long long v14 = [(STKAlertSessionManager *)self log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F29CA0] sharedInstance];
    int v16 = [v15 isInternalInstall];

    if (!v16) {
      goto LABEL_9;
    }
  }
  id v17 = [(STKAlertSessionManager *)self log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109890;
    v19[1] = v7;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    _os_log_impl(&dword_221DC0000, v17, OS_LOG_TYPE_DEFAULT, "RAW: Event received: %d, settingsType: %d, data: %@, userInfo: %@", (uint8_t *)v19, 0x22u);
  }

LABEL_9:
  v18 = [(STKUSSDAlertSessionManager *)self _supplementaryServicesResponder];
  [(STKUSSDAlertSessionManager *)self _queue_handleUSSDEvent:7 responder:v18 userInfo:v10];
}

- (void)suppServicesCompleted:(id)a3
{
  id v4 = [(STKUSSDAlertSessionManager *)self _supplementaryServicesResponder];
  [(STKUSSDAlertSessionManager *)self _queue_handleUSSDEvent:9 responder:v4 userInfo:MEMORY[0x263EFFA78]];
}

- (void)suppServicesError:(id)a3 error:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F034A0]];

    id v9 = [v6 localizedDescription];

    if (v9)
    {
      uint64_t v10 = [v6 localizedDescription];
      [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x263F034B0]];
    }
  }
  else
  {
    id v7 = 0;
  }
  id v11 = [(STKUSSDAlertSessionManager *)self _supplementaryServicesResponder];
  [(STKUSSDAlertSessionManager *)self _queue_handleUSSDEvent:8 responder:v11 userInfo:v7];
}

- (void)_executeOnQueue:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"STKUSSDAlertSessionManager.m", 219, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__STKUSSDAlertSessionManager__executeOnQueue___block_invoke;
  block[3] = &unk_2645F4520;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

uint64_t __46__STKUSSDAlertSessionManager__executeOnQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_queue_handleUSSDEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  BSDispatchQueueAssert();
  switch(a3)
  {
    case 0:
      id v10 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221DC0000, v10, OS_LOG_TYPE_DEFAULT, "Unknown STKUSSDEvent", buf, 2u);
      }
      goto LABEL_63;
    case 1:
      id v11 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221DC0000, v11, OS_LOG_TYPE_DEFAULT, "Event Begin", buf, 2u);
      }

      id v12 = [STKUSSDAlertSession alloc];
      uint64_t v13 = [(STKAlertSessionManager *)self log];
      id v10 = [(STKUSSDAlertSession *)v12 initWithLogger:v13 responseProvider:v8 event:1 options:v9 sound:0];

      [(NSMutableArray *)self->_activeUSSDSessions addObject:v10];
      long long v14 = &__block_literal_global_0;
      goto LABEL_26;
    case 2:
      uint64_t v15 = [v9 objectForKeyedSubscript:*MEMORY[0x263F034C0]];
      int v16 = [v9 objectForKeyedSubscript:*MEMORY[0x263F034B8]];
      int v51 = [v16 BOOLValue];

      id v17 = [v9 objectForKeyedSubscript:@"kCallSimSlot"];
      uint64_t v18 = [v17 integerValue];

      v19 = [(STKCarrierSubscriptionMonitor *)self->_subscriptionMonitor subscriptionInfoForSlot:v18];
      __int16 v20 = [v19 ussdFilter];

      int v21 = [(NSMutableArray *)self->_activeUSSDSessions lastObject];
      __int16 v22 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v50 = v20;
        id v23 = [MEMORY[0x263F29CA0] sharedInstance];
        int v24 = [v23 isInternalInstall];
        if (v24)
        {
          uint64_t v25 = [NSString stringWithFormat:@", string: %@", v15];
        }
        else
        {
          uint64_t v25 = &stru_26D4601D0;
        }
        *(_DWORD *)buf = 134218498;
        long long v67 = v21;
        __int16 v68 = 1024;
        int v69 = v51;
        __int16 v70 = 2114;
        v71 = v25;
        _os_log_impl(&dword_221DC0000, v22, OS_LOG_TYPE_DEFAULT, "Session <%p> - String Event (should respond? %d%{public}@)", buf, 0x1Cu);
        if (v24) {

        }
        __int16 v20 = v50;
      }

      char v65 = 0;
      if (!v21)
      {
        if ((v51 & 1) != 0 || ([v20 shouldFilterString:v15 coalescable:&v65] & 1) == 0)
        {
          long long v42 = [STKUSSDAlertSession alloc];
          long long v43 = [(STKAlertSessionManager *)self log];
          int v21 = [(STKUSSDAlertSession *)v42 initWithLogger:v43 responseProvider:v8 event:2 options:v9 sound:0];

          if (v65)
          {
            long long v44 = [(STKAlertSessionManager *)self log];
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              long long v67 = v21;
              _os_log_impl(&dword_221DC0000, v44, OS_LOG_TYPE_DEFAULT, "Session <%p> - String should coalesce.", buf, 0xCu);
            }

            p_coalescingUSSDSession = (id *)&self->_coalescingUSSDSession;
            if (self->_coalescingUSSDSession)
            {
              -[NSMutableArray addObject:](self->_finishedUSSDSessions, "addObject:");
              id v46 = *p_coalescingUSSDSession;
              v63[0] = MEMORY[0x263EF8330];
              v63[1] = 3221225472;
              v63[2] = __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_34;
              v63[3] = &unk_2645F4568;
              v63[4] = self;
              long long v64 = v21;
              [v46 performUSSDUpdate:v63];
              [*p_coalescingUSSDSession invalidate];
            }
            objc_storeStrong((id *)&self->_coalescingUSSDSession, v21);
          }
          else
          {
            [(NSMutableArray *)self->_activeUSSDSessions addObject:v21];
          }
          [(STKAlertSessionManager *)self enqueuePresentationForSession:v21 completion:&__block_literal_global_38];
        }
        else
        {
          int v21 = 0;
        }
      }
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_2;
      v60[3] = &unk_2645F4590;
      id v10 = v15;
      long long v61 = v10;
      char v62 = v51;
      [(STKUSSDAlertSession *)v21 performUSSDUpdate:v60];
      [(STKUSSDAlertSession *)v21 setHasReceivedContent:1];
      long long v47 = [v9 objectForKeyedSubscript:*MEMORY[0x263F034C8]];
      char v48 = [v47 BOOLValue];

      if ((v48 & 1) == 0)
      {
        long long v49 = +[STKSoundFactory soundForSystemSoundID:1050 duration:0.0];
        [(STKAlertSession *)v21 setSound:v49];
        [v49 playSound];
      }
      goto LABEL_63;
    case 3:
      uint64_t v26 = 56;
      id v10 = [(NSMutableArray *)self->_activeUSSDSessions lastObject];
      v27 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        long long v67 = (STKUSSDAlertSession *)v10;
        _os_log_impl(&dword_221DC0000, v27, OS_LOG_TYPE_DEFAULT, "Session <%p> - End Event", buf, 0xCu);
      }

      if (!v10) {
        goto LABEL_63;
      }
      if (([v10 hasReceivedContent] & 1) == 0) {
        goto LABEL_42;
      }
      [(NSMutableArray *)self->_finishedUSSDSessions addObject:v10];
      goto LABEL_43;
    case 4:
      id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F034B0]];
      v28 = [v9 objectForKeyedSubscript:*MEMORY[0x263F034A0]];
      uint64_t v29 = [v28 integerValue];

      v30 = [(NSMutableArray *)self->_activeUSSDSessions lastObject];
      v31 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        long long v67 = v30;
        __int16 v68 = 1024;
        int v69 = v29;
        __int16 v70 = 2112;
        v71 = v10;
        _os_log_impl(&dword_221DC0000, v31, OS_LOG_TYPE_DEFAULT, "Session <%p> - Error Event, errorCode: %d, error: %@", buf, 0x1Cu);
      }

      if (!v30) {
        goto LABEL_36;
      }
      [(NSMutableArray *)self->_finishedUSSDSessions addObject:v30];
      [(NSMutableArray *)self->_activeUSSDSessions removeObject:v30];
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_40;
      v57[3] = &unk_2645F45B8;
      uint64_t v59 = v29;
      long long v58 = v10;
      [(STKUSSDAlertSession *)v30 performUSSDUpdate:v57];
      [(STKUSSDAlertSession *)v30 setHasReceivedContent:1];
      v32 = v58;
      goto LABEL_35;
    case 5:
      id v10 = [(NSMutableArray *)self->_activeUSSDSessions lastObject];
      uint64_t v33 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        long long v67 = (STKUSSDAlertSession *)v10;
        _os_log_impl(&dword_221DC0000, v33, OS_LOG_TYPE_DEFAULT, "Session <%p> - Terminated Event", buf, 0xCu);
      }

      if (v10)
      {
        [(NSMutableArray *)self->_finishedUSSDSessions addObject:v10];
        [(NSMutableArray *)self->_activeUSSDSessions removeLastObject];
        [v10 performUSSDUpdate:&__block_literal_global_43];
      }
      goto LABEL_63;
    case 6:
      long long v34 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221DC0000, v34, OS_LOG_TYPE_DEFAULT, "Supplementary Services Begin", buf, 2u);
      }

      uint64_t v35 = [STKUSSDAlertSession alloc];
      uint64_t v36 = [(STKAlertSessionManager *)self log];
      id v10 = [(STKUSSDAlertSession *)v35 initWithLogger:v36 responseProvider:v8 event:6 options:v9 sound:0];

      [(NSMutableArray *)self->_activeSupplementaryServicesSessions addObject:v10];
      long long v14 = &__block_literal_global_46;
LABEL_26:
      [(STKAlertSessionManager *)self enqueuePresentationForSession:v10 completion:v14];
      goto LABEL_63;
    case 7:
      id v10 = [(NSMutableArray *)self->_activeSupplementaryServicesSessions lastObject];
      v37 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        long long v67 = (STKUSSDAlertSession *)v10;
        _os_log_impl(&dword_221DC0000, v37, OS_LOG_TYPE_DEFAULT, "Session <%p> - Supplementary Services Event", buf, 0xCu);
      }

      if (v10)
      {
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_47;
        v55[3] = &unk_2645F4600;
        id v56 = v9;
        [v10 performUSSDUpdate:v55];
        [v10 setHasReceivedContent:1];
      }
      goto LABEL_63;
    case 8:
      id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F034B0]];
      v38 = [v9 objectForKeyedSubscript:*MEMORY[0x263F034A0]];
      uint64_t v39 = [v38 integerValue];

      v30 = [(NSMutableArray *)self->_activeSupplementaryServicesSessions lastObject];
      v40 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        long long v67 = v30;
        __int16 v68 = 1024;
        int v69 = v39;
        __int16 v70 = 2112;
        v71 = v10;
        _os_log_impl(&dword_221DC0000, v40, OS_LOG_TYPE_DEFAULT, "Session <%p> - Supplementary Services Error, errorCode: %d, error: %@", buf, 0x1Cu);
      }

      if (!v30) {
        goto LABEL_36;
      }
      [(NSMutableArray *)self->_finishedSupplementaryServicesSessions addObject:v30];
      [(NSMutableArray *)self->_activeSupplementaryServicesSessions removeLastObject];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_48;
      v52[3] = &unk_2645F45B8;
      uint64_t v54 = v39;
      long long v53 = v10;
      [(STKUSSDAlertSession *)v30 performUSSDUpdate:v52];
      [(STKUSSDAlertSession *)v30 setHasReceivedContent:1];
      v32 = v53;
LABEL_35:

LABEL_36:
      goto LABEL_63;
    case 9:
      uint64_t v26 = 80;
      id v10 = [(NSMutableArray *)self->_activeSupplementaryServicesSessions lastObject];
      v41 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        long long v67 = (STKUSSDAlertSession *)v10;
        _os_log_impl(&dword_221DC0000, v41, OS_LOG_TYPE_DEFAULT, "Session <%p> - Supplementary Services End", buf, 0xCu);
      }

      if (!v10) {
        goto LABEL_63;
      }
      if ([v10 hasReceivedContent])
      {
        [(NSMutableArray *)self->_finishedSupplementaryServicesSessions addObject:v10];
        [v10 performUSSDUpdate:&__block_literal_global_51];
      }
      else
      {
LABEL_42:
        [v10 invalidate];
      }
LABEL_43:
      [*(id *)((char *)&self->super.super.isa + v26) removeLastObject];
LABEL_63:

LABEL_64:
      return;
    default:
      goto LABEL_64;
  }
}

void __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_221DC0000, v5, OS_LOG_TYPE_DEFAULT, "Session <%p> - Dismissing prior coalesced session.", (uint8_t *)&v7, 0xCu);
  }

  [v4 dismissCoalescingSession];
}

void __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 sessionDidReceiveString:v3];
  [v4 sessionWantsResponse:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_40(uint64_t a1, void *a2)
{
  return [a2 sessionDidReceiveErrorCode:*(void *)(a1 + 40) string:*(void *)(a1 + 32)];
}

uint64_t __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_41(uint64_t a1, void *a2)
{
  return [a2 sessionDidTerminate];
}

uint64_t __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_47(uint64_t a1, void *a2)
{
  return [a2 sessionDidReceiveSupplementaryServicesEvent:*(void *)(a1 + 32)];
}

uint64_t __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_48(uint64_t a1, void *a2)
{
  return [a2 sessionDidReceiveErrorCode:*(void *)(a1 + 40) string:*(void *)(a1 + 32)];
}

uint64_t __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_49(uint64_t a1, void *a2)
{
  return [a2 sessionDidReceiveString:0];
}

- (id)_supplementaryServicesResponder
{
  uint64_t v3 = [_STKUSSDResponseProvider alloc];
  queue = self->_queue;
  telephonyClient = self->_telephonyClient;
  uint64_t v6 = [(STKAlertSessionManager *)self log];
  int v7 = [(_STKUSSDResponseProvider *)v3 initWithQueue:queue telephonyClient:telephonyClient options:MEMORY[0x263EFFA78] logger:v6];

  return v7;
}

- (void)_queue_startListening
{
  BSDispatchQueueAssert();
  if (!self->_serverConnection)
  {
    uint64_t v3 = (__CTServerConnection *)_CTServerConnectionCreate();
    self->_serverConnection = v3;
    if (v3)
    {
      _CTServerConnectionSetTargetQueue();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
    }
  }
  telephonyClient = self->_telephonyClient;
  if (telephonyClient) {
    [(CoreTelephonyClient *)telephonyClient setDelegate:self];
  }
}

- (STKCarrierSubscriptionMonitor)subscriptionMonitor
{
  return self->_subscriptionMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionMonitor, 0);
  objc_storeStrong((id *)&self->_finishedSupplementaryServicesSessions, 0);
  objc_storeStrong((id *)&self->_activeSupplementaryServicesSessions, 0);
  objc_storeStrong((id *)&self->_coalescingUSSDSession, 0);
  objc_storeStrong((id *)&self->_finishedUSSDSessions, 0);
  objc_storeStrong((id *)&self->_activeUSSDSessions, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end