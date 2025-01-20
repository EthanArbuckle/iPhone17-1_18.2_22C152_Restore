@interface URTAlertPresenter
- (NSMutableDictionary)presentationsForDestinations;
- (OS_dispatch_queue)presentationsQueue;
- (URTAlertPresenter)init;
- (URTUserNotificationPresentation)userNotificationPresentation;
- (int)compatibilityResponse;
- (int)compatibilityResponseButtonFlag;
- (void)_addDefaultDestinationAlertFromUserNotificationContents:(id)a3 flags:(unint64_t)a4;
- (void)_addFromUserNotificationContents:(id)a3 toServiceDestination:(int64_t)a4;
- (void)_handleUserNotificationResponse:(unint64_t)a3;
- (void)_invokeCallbackForResponseFlags:(unint64_t)a3;
- (void)_presentationQueue_dismiss;
- (void)_presentationQueue_invalidate;
- (void)_presentationQueue_invokeAction:(id)a3 forPresentation:(id)a4;
- (void)_presentationQueue_removePresentation:(id)a3 forDestination:(int64_t)a4;
- (void)addAlert:(id)a3 forDestination:(int64_t)a4;
- (void)addAlert:(id)a3 forDestination:(int64_t)a4 preferringStyle:(int64_t)a5;
- (void)compatibilityCallback;
- (void)dismiss;
- (void)handleCancelActionForAlertPresentation:(id)a3;
- (void)handleDefaultActionForAlertPresentation:(id)a3;
- (void)handleOtherActionForAlertPresentation:(id)a3;
- (void)invalidate;
- (void)present;
- (void)setCompatibilityCallback:(void *)a3;
@end

@implementation URTAlertPresenter

- (URTAlertPresenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)URTAlertPresenter;
  v2 = [(URTAlertPresenter *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    presentationsForDestinations = v2->_presentationsForDestinations;
    v2->_presentationsForDestinations = v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.internal.UserAlerts.presentationQueue", v5);
    presentationsQueue = v2->_presentationsQueue;
    v2->_presentationsQueue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v2->_userNotificationPresentation, 0);
    v2->_compatibilityCallback = 0;
    *(void *)&v2->_compatibilityResponse = 0;
  }
  return v2;
}

- (void)invalidate
{
  v3 = [(URTAlertPresenter *)self presentationsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__URTAlertPresenter_invalidate__block_invoke;
  block[3] = &unk_26479AA18;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __31__URTAlertPresenter_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentationQueue_invalidate");
}

- (void)addAlert:(id)a3 forDestination:(int64_t)a4
{
}

- (void)addAlert:(id)a3 forDestination:(int64_t)a4 preferringStyle:(int64_t)a5
{
  id v8 = a3;
  objc_super v9 = [(URTAlertPresenter *)self presentationsQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__URTAlertPresenter_addAlert_forDestination_preferringStyle___block_invoke;
  v11[3] = &unk_26479AA40;
  int64_t v14 = a4;
  int64_t v15 = a5;
  id v12 = v8;
  v13 = self;
  id v10 = v8;
  dispatch_sync(v9, v11);
}

void __61__URTAlertPresenter_addAlert_forDestination_preferringStyle___block_invoke(uint64_t a1)
{
  v2 = off_26479A830;
  if (*(void *)(a1 + 48)) {
    v2 = &off_26479A838;
  }
  id v5 = (id)[objc_alloc(*v2) initWithAlert:*(void *)(a1 + 32) forDestination:*(void *)(a1 + 48) preferredPresentationStyle:*(void *)(a1 + 56)];
  [v5 setDelegate:*(void *)(a1 + 40)];
  v3 = [*(id *)(a1 + 40) presentationsForDestinations];
  v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v3 setObject:v5 forKey:v4];
}

- (void)_addDefaultDestinationAlertFromUserNotificationContents:(id)a3 flags:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(URTAlertPresenter *)self presentationsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__URTAlertPresenter__addDefaultDestinationAlertFromUserNotificationContents_flags___block_invoke;
  block[3] = &unk_26479AA68;
  v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

void __83__URTAlertPresenter__addDefaultDestinationAlertFromUserNotificationContents_flags___block_invoke(uint64_t a1)
{
  v3 = [[URTUserNotificationPresentation alloc] initWithContents:*(void *)(a1 + 32) flags:*(void *)(a1 + 48)];
  objc_storeWeak((id *)(*(void *)(a1 + 40) + 40), v3);
  v2 = [*(id *)(a1 + 40) presentationsForDestinations];
  [v2 setObject:v3 forKey:&unk_26D9FC688];
}

- (void)_addFromUserNotificationContents:(id)a3 toServiceDestination:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263EFFFC8]];
  uint64_t v8 = URTVerifyString(v7);

  objc_super v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263EFFFD8]];
  uint64_t v10 = URTVerifyString(v9);

  if (v8 | v10)
  {
    int64_t v24 = a4;
    objc_initWeak(&location, self);
    v11 = +[URTAlert alertWithTitle:v8 message:v10];
    unint64_t v12 = [v6 objectForKeyedSubscript:*MEMORY[0x263F00000]];
    v13 = URTVerifyString(v12);

    if (v13)
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke;
      v29[3] = &unk_26479AA90;
      objc_copyWeak(&v30, &location);
      int64_t v14 = +[URTAlertAction actionWithTitle:v13 handler:v29];
      [v11 setDefaultAction:v14];

      objc_destroyWeak(&v30);
    }
    int64_t v15 = [v6 objectForKeyedSubscript:*MEMORY[0x263F00020]];
    v16 = URTVerifyString(v15);

    if (v16)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke_2;
      v27[3] = &unk_26479AA90;
      objc_copyWeak(&v28, &location);
      v17 = +[URTAlertAction actionWithTitle:v16 handler:v27];
      [v11 setOtherAction:v17];

      objc_destroyWeak(&v28);
    }
    v18 = [v6 objectForKeyedSubscript:*MEMORY[0x263EFFFE8]];
    v19 = URTVerifyString(v18);

    if (v19)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke_3;
      v25[3] = &unk_26479AA90;
      objc_copyWeak(&v26, &location);
      v20 = +[URTAlertAction actionWithTitle:v16 handler:v25];
      [v11 setCancelAction:v20];

      objc_destroyWeak(&v26);
    }
    v21 = [v6 objectForKeyedSubscript:@"SBUserNotificationAllowedApplications"];
    uint64_t v22 = objc_opt_class();
    v23 = URTVerifyClass(v21, v22);

    [v11 setAllowedApplicationBundleIDs:v23];
    [(URTAlertPresenter *)self addAlert:v11 forDestination:v24];

    objc_destroyWeak(&location);
  }
}

void __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeCallbackForResponseFlags:0];
}

void __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeCallbackForResponseFlags:2];
}

void __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeCallbackForResponseFlags:1];
}

- (void)present
{
  v3 = [(URTAlertPresenter *)self presentationsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__URTAlertPresenter_present__block_invoke;
  block[3] = &unk_26479AA18;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __28__URTAlertPresenter_present__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "presentationsForDestinations", 0);
  v2 = [v1 allValues];

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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) present];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)dismiss
{
  uint64_t v3 = [(URTAlertPresenter *)self presentationsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__URTAlertPresenter_dismiss__block_invoke;
  block[3] = &unk_26479AA18;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __28__URTAlertPresenter_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentationQueue_dismiss");
}

- (void)handleCancelActionForAlertPresentation:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = URTLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_2262C3000, v5, OS_LOG_TYPE_DEFAULT, "cancel button pressed for presentation %@", buf, 0xCu);
  }

  uint64_t v6 = [(URTAlertPresenter *)self presentationsQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__URTAlertPresenter_handleCancelActionForAlertPresentation___block_invoke;
  v8[3] = &unk_26479A958;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __60__URTAlertPresenter_handleCancelActionForAlertPresentation___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) alert];
  uint64_t v3 = [v4 cancelAction];
  objc_msgSend(v2, "_presentationQueue_invokeAction:forPresentation:", v3, *(void *)(a1 + 40));
}

- (void)handleDefaultActionForAlertPresentation:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = URTLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_2262C3000, v5, OS_LOG_TYPE_DEFAULT, "default button pressed for presentation %@", buf, 0xCu);
  }

  uint64_t v6 = [(URTAlertPresenter *)self presentationsQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__URTAlertPresenter_handleDefaultActionForAlertPresentation___block_invoke;
  v8[3] = &unk_26479A958;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __61__URTAlertPresenter_handleDefaultActionForAlertPresentation___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) alert];
  uint64_t v3 = [v4 defaultAction];
  objc_msgSend(v2, "_presentationQueue_invokeAction:forPresentation:", v3, *(void *)(a1 + 40));
}

- (void)handleOtherActionForAlertPresentation:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = URTLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_2262C3000, v5, OS_LOG_TYPE_DEFAULT, "other button pressed for presentation %@", buf, 0xCu);
  }

  uint64_t v6 = [(URTAlertPresenter *)self presentationsQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__URTAlertPresenter_handleOtherActionForAlertPresentation___block_invoke;
  v8[3] = &unk_26479A958;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __59__URTAlertPresenter_handleOtherActionForAlertPresentation___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) alert];
  uint64_t v3 = [v4 otherAction];
  objc_msgSend(v2, "_presentationQueue_invokeAction:forPresentation:", v3, *(void *)(a1 + 40));
}

- (void)_presentationQueue_invalidate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(URTAlertPresenter *)self presentationsForDestinations];
  id v4 = [v3 allValues];

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
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) invalidate];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  id v9 = [(URTAlertPresenter *)self presentationsForDestinations];
  [v9 removeAllObjects];
}

- (void)_presentationQueue_dismiss
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(URTAlertPresenter *)self presentationsForDestinations];
  id v4 = [v3 allValues];

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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) dismiss];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(URTAlertPresenter *)self _presentationQueue_invalidate];
}

- (void)_presentationQueue_removePresentation:(id)a3 forDestination:(int64_t)a4
{
  [a3 invalidate];
  id v7 = [(URTAlertPresenter *)self presentationsForDestinations];
  uint64_t v6 = [NSNumber numberWithInteger:a4];
  [v7 removeObjectForKey:v6];
}

- (void)_presentationQueue_invokeAction:(id)a3 forPresentation:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 handler];

  if (v7)
  {
    uint64_t v8 = [v9 handler];
    ((void (**)(void, id))v8)[2](v8, v9);
  }
  -[URTAlertPresenter _presentationQueue_removePresentation:forDestination:](self, "_presentationQueue_removePresentation:forDestination:", v6, [v6 destination]);

  [(URTAlertPresenter *)self _presentationQueue_dismiss];
}

- (void)_invokeCallbackForResponseFlags:(unint64_t)a3
{
  uint64_t v5 = [(URTAlertPresenter *)self compatibilityCallback];
  Main = CFRunLoopGetMain();
  id v7 = (const void *)*MEMORY[0x263EFFE88];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__URTAlertPresenter__invokeCallbackForResponseFlags___block_invoke;
  block[3] = &unk_26479AAC0;
  void block[4] = self;
  void block[5] = v5;
  block[6] = a3;
  CFRunLoopPerformBlock(Main, v7, block);
  uint64_t v8 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v8);
}

void *__53__URTAlertPresenter__invokeCallbackForResponseFlags___block_invoke(void *result)
{
  v1 = (uint64_t (*)(void, void))result[5];
  if (v1) {
    return (void *)v1(result[4], result[6]);
  }
  return result;
}

- (void)_handleUserNotificationResponse:(unint64_t)a3
{
  uint64_t v5 = [(URTAlertPresenter *)self compatibilityCallback];
  if (v5) {
    v5(self, a3);
  }
  id v6 = [(URTAlertPresenter *)self presentationsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__URTAlertPresenter__handleUserNotificationResponse___block_invoke;
  block[3] = &unk_26479AA18;
  void block[4] = self;
  dispatch_sync(v6, block);
}

uint64_t __53__URTAlertPresenter__handleUserNotificationResponse___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 userNotificationPresentation];
  objc_msgSend(v2, "_presentationQueue_removePresentation:forDestination:", v3, 0);

  id v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_presentationQueue_dismiss");
}

- (NSMutableDictionary)presentationsForDestinations
{
  return self->_presentationsForDestinations;
}

- (OS_dispatch_queue)presentationsQueue
{
  return self->_presentationsQueue;
}

- (void)compatibilityCallback
{
  return self->_compatibilityCallback;
}

- (void)setCompatibilityCallback:(void *)a3
{
  self->_compatibilityCallback = a3;
}

- (int)compatibilityResponse
{
  return self->_compatibilityResponse;
}

- (int)compatibilityResponseButtonFlag
{
  return self->_compatibilityResponseButtonFlag;
}

- (URTUserNotificationPresentation)userNotificationPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userNotificationPresentation);
  return (URTUserNotificationPresentation *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userNotificationPresentation);
  objc_storeStrong((id *)&self->_presentationsQueue, 0);
  objc_storeStrong((id *)&self->_presentationsForDestinations, 0);
}

@end