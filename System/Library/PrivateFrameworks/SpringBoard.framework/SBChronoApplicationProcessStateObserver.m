@interface SBChronoApplicationProcessStateObserver
+ (SBChronoApplicationProcessStateObserver)sharedInstance;
- (BOOL)_shouldInformChronoForApplication:(id)a3;
- (SBChronoApplicationProcessStateObserver)init;
- (void)_queue_handleApplicationProcessStateDidChangeIfNecessary:(id)a3;
- (void)applicationProcessStateDidChange:(id)a3;
@end

@implementation SBChronoApplicationProcessStateObserver

uint64_t __76__SBChronoApplicationProcessStateObserver_applicationProcessStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleApplicationProcessStateDidChangeIfNecessary:", *(void *)(a1 + 40));
}

uint64_t __77__SBChronoApplicationProcessStateObserver__shouldInformChronoForApplication___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 extensionPointRecord];
  v3 = [v2 identifier];
  uint64_t v4 = CHSIsWidgetExtensionPoint();

  return v4;
}

- (void)applicationProcessStateDidChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SBChronoApplicationProcessStateObserver_applicationProcessStateDidChange___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_queue_handleApplicationProcessStateDidChangeIfNecessary:(id)a3
{
  id v4 = a3;
  id v12 = [v4 object];
  v5 = [v4 userInfo];

  id v6 = [v5 objectForKey:@"previousProcessState"];

  char v7 = [v6 isForeground];
  id v8 = [v12 processState];
  int v9 = [v8 isForeground];

  if (v9
    && (v7 & 1) == 0
    && [(SBChronoApplicationProcessStateObserver *)self _shouldInformChronoForApplication:v12])
  {
    service = self->_service;
    v11 = [v12 bundleIdentifier];
    [(CHSInteractionEventService *)service applicationEnteredForegroundWithBundleID:v11];
  }
}

- (BOOL)_shouldInformChronoForApplication:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v6 = [v4 bundleIdentifier];
  char v7 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];

  if (v7)
  {
    id v8 = [v7 applicationExtensionRecords];
    int v9 = objc_msgSend(v8, "bs_filter:", &__block_literal_global_10_0);

    if ([v9 count])
    {
      extensionProvider = self->_extensionProvider;
      v11 = [v4 bundleIdentifier];
      id v12 = [(CHSWidgetExtensionProvider *)extensionProvider widgetExtensionContainerForContainerBundleIdentifier:v11];

      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2020000000;
      char v20 = 0;
      v13 = [v12 localExtensions];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __77__SBChronoApplicationProcessStateObserver__shouldInformChronoForApplication___block_invoke_2;
      v16[3] = &unk_1E6AFC480;
      v16[4] = &v17;
      [v13 enumerateObjectsUsingBlock:v16];

      BOOL v14 = *((unsigned char *)v18 + 24) == 0;
      _Block_object_dispose(&v17, 8);
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __77__SBChronoApplicationProcessStateObserver__shouldInformChronoForApplication___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v6 = [v9 orderedDescriptors];
  if ([v6 count])
  {
  }
  else
  {
    char v7 = [v9 orderedControlDescriptors];
    uint64_t v8 = [v7 count];

    if (!v8) {
      goto LABEL_5;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  *a4 = 1;
LABEL_5:
}

+ (SBChronoApplicationProcessStateObserver)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1) {
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_85);
  }
  v2 = (void *)sharedInstance___instance_0;
  return (SBChronoApplicationProcessStateObserver *)v2;
}

void __57__SBChronoApplicationProcessStateObserver_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBChronoApplicationProcessStateObserver);
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;
}

- (SBChronoApplicationProcessStateObserver)init
{
  v19.receiver = self;
  v19.super_class = (Class)SBChronoApplicationProcessStateObserver;
  v2 = [(SBChronoApplicationProcessStateObserver *)&v19 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F58E50]);
    id v4 = [MEMORY[0x1E4F58E10] visible];
    id v5 = [MEMORY[0x1E4F58C68] visible];
    id v6 = (void *)[v3 initWithWidgetsPredicate:v4 controlsPredicate:v5];

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F58E40]) initWithOptions:v6];
    extensionProvider = v2->_extensionProvider;
    v2->_extensionProvider = (CHSWidgetExtensionProvider *)v7;

    id v9 = (CHSInteractionEventService *)objc_alloc_init(MEMORY[0x1E4F58D08]);
    service = v2->_service;
    v2->_service = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.chronoservices.SBChronoApplicationProcessStateObserver", v12);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;

    v15 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SBChronoApplicationProcessStateObserver_init__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    v18 = v2;
    dispatch_async(v15, block);
  }
  return v2;
}

id __47__SBChronoApplicationProcessStateObserver_init__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 16) containers];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end