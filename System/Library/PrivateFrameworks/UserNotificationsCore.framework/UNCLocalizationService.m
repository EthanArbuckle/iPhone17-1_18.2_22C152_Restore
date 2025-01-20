@interface UNCLocalizationService
- (UNCLocalizationService)init;
- (id)_queue_bundleWithIdentifier:(id)a3;
- (id)bundleWithIdentifier:(id)a3;
- (void)_queue_notificationSourcesDidInstall:(id)a3;
- (void)_queue_notificationSourcesDidUninstall:(id)a3;
- (void)_queue_unloadBundleWithIdentifier:(id)a3;
- (void)notificationSourcesDidInstall:(id)a3;
- (void)notificationSourcesDidUninstall:(id)a3;
- (void)unloadBundleWithIdentifier:(id)a3;
@end

@implementation UNCLocalizationService

uint64_t __47__UNCLocalizationService_bundleWithIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_bundleWithIdentifier:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (id)_queue_bundleWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_bundleIdentifierToBundle objectForKey:v4];
    if (!v5)
    {
      v6 = [(NSMutableDictionary *)self->_bundleIdentifierToBundleURL objectForKey:v4];
      if (v6)
      {
        v5 = (void *)[objc_alloc(MEMORY[0x263F29C00]) initWithURL:v6];
        if (v5) {
          [(NSMutableDictionary *)self->_bundleIdentifierToBundle setObject:v5 forKey:v4];
        }
      }
      else
      {
        v5 = 0;
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)bundleWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__UNCLocalizationService_bundleWithIdentifier___block_invoke;
  block[3] = &unk_265567700;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (UNCLocalizationService)init
{
  v11.receiver = self;
  v11.super_class = (Class)UNCLocalizationService;
  v2 = [(UNCLocalizationService *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.usernotifications.UNCLocalizationService", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bundleIdentifierToBundle = v2->_bundleIdentifierToBundle;
    v2->_bundleIdentifierToBundle = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bundleIdentifierToBundleURL = v2->_bundleIdentifierToBundleURL;
    v2->_bundleIdentifierToBundleURL = v8;
  }
  return v2;
}

- (void)unloadBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__UNCLocalizationService_unloadBundleWithIdentifier___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __53__UNCLocalizationService_unloadBundleWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unloadBundleWithIdentifier:", *(void *)(a1 + 40));
}

- (void)notificationSourcesDidInstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__UNCLocalizationService_notificationSourcesDidInstall___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __56__UNCLocalizationService_notificationSourcesDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidInstall:", *(void *)(a1 + 40));
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__UNCLocalizationService_notificationSourcesDidUninstall___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __58__UNCLocalizationService_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(void *)(a1 + 40));
}

- (void)_queue_unloadBundleWithIdentifier:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifierToBundle, "removeObjectForKey:");
  }
}

- (void)_queue_notificationSourcesDidInstall:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 bundleIdentifier];
        bundleIdentifierToBundleURL = self->_bundleIdentifierToBundleURL;
        uint64_t v12 = [v9 bundleURL];
        [(NSMutableDictionary *)bundleIdentifierToBundleURL setObject:v12 forKey:v10];

        [(NSMutableDictionary *)self->_bundleIdentifierToBundle removeObjectForKey:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
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
        v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) bundleIdentifier];
        [(NSMutableDictionary *)self->_bundleIdentifierToBundleURL removeObjectForKey:v9];
        [(NSMutableDictionary *)self->_bundleIdentifierToBundle removeObjectForKey:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierToBundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToBundle, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end