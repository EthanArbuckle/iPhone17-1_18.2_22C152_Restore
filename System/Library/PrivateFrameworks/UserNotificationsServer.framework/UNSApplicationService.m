@interface UNSApplicationService
- (BOOL)isApplicationForeground:(id)a3;
- (UNSApplicationService)initWithApplicationLauncher:(id)a3 categoryRepository:(id)a4 localizationService:(id)a5;
- (void)_queue_didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4;
- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UNSApplicationService

- (void)didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__UNSApplicationService_didChangeProcessState_forBundleIdentifier___block_invoke;
  block[3] = &unk_26462F678;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_queue_didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    if ([v9 isRunning]
      && ([v9 endowmentNamespaces],
          id v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 containsObject:@"com.apple.frontboard.visibility"],
          v7,
          v8))
    {
      [(NSMutableSet *)self->_foregroundBundleIdentifiers addObject:v6];
    }
    else
    {
      [(NSMutableSet *)self->_foregroundBundleIdentifiers removeObject:v6];
    }
  }
}

uint64_t __67__UNSApplicationService_didChangeProcessState_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeProcessState:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (UNSApplicationService)initWithApplicationLauncher:(id)a3 categoryRepository:(id)a4 localizationService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)UNSApplicationService;
  id v12 = [(UNSApplicationService *)&v20 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_applicationLauncher, a3);
    objc_storeStrong((id *)&v13->_categoryRepository, a4);
    objc_storeStrong((id *)&v13->_localizationService, a5);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    foregroundBundleIdentifiers = v13->_foregroundBundleIdentifiers;
    v13->_foregroundBundleIdentifiers = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.usernotificationsserver.ApplicationService", v16);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v17;
  }
  return v13;
}

- (BOOL)isApplicationForeground:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__UNSApplicationService_isApplicationForeground___block_invoke;
  block[3] = &unk_26462F950;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __49__UNSApplicationService_isApplicationForeground___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__UNSApplicationService_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_26462FD38;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __91__UNSApplicationService_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_willPresentNotification:forBundleIdentifier:withCompletionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_queue_willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(NSMutableSet *)self->_foregroundBundleIdentifiers containsObject:v9])
  {
    uint64_t v11 = [(UNCLocalizationService *)self->_localizationService bundleWithIdentifier:v9];
    id v12 = (void *)[objc_alloc(MEMORY[0x263F84258]) initWithBundle:v11 categoryRepository:self->_categoryRepository];
    id v13 = [v12 notificationForNotificationRecord:v8];
    applicationLauncher = self->_applicationLauncher;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __98__UNSApplicationService__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke;
    v15[3] = &unk_26462FD60;
    id v16 = v10;
    [(UNSApplicationLauncher *)applicationLauncher willPresentNotification:v13 forBundleIdentifier:v9 withCompletionHandler:v15];
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 27, 0);
  }
}

uint64_t __98__UNSApplicationService__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_applicationLauncher, 0);
  objc_storeStrong((id *)&self->_foregroundBundleIdentifiers, 0);
}

@end