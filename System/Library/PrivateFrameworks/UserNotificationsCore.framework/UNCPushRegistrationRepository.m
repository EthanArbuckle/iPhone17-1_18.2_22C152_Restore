@interface UNCPushRegistrationRepository
- (UNCPushRegistrationRepository)initWithDirectory:(id)a3 librarian:(id)a4;
- (id)_queue_registrationForBundleIdentifier:(id)a3;
- (id)allBundleIdentifiers;
- (id)registrationForBundleIdentifier:(id)a3;
- (void)_queue_removeRegistrationForBundleIdentifier:(id)a3;
- (void)_queue_setRegistration:(id)a3 forBundleIdentifier:(id)a4;
- (void)notificationSourcesDidUninstall:(id)a3;
- (void)removeRegistrationForBundleIdentifier:(id)a3;
- (void)setRegistration:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation UNCPushRegistrationRepository

- (void)_queue_setRegistration:(id)a3 forBundleIdentifier:(id)a4
{
  repository = self->_repository;
  v6 = UNCPushRegistrationToDictionary;
  v7 = (void (*)(uint64_t, void *))*((void *)UNCPushRegistrationToDictionary + 2);
  id v8 = a4;
  v7((uint64_t)v6, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(UNCKeyedDictionaryRepository *)repository setDictionary:v9 forKey:v8];
}

- (void)setRegistration:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__UNCPushRegistrationRepository_setRegistration_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __69__UNCPushRegistrationRepository_setRegistration_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setRegistration:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_removeRegistrationForBundleIdentifier:(id)a3
{
}

uint64_t __71__UNCPushRegistrationRepository_removeRegistrationForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeRegistrationForBundleIdentifier:", *(void *)(a1 + 40));
}

- (void)removeRegistrationForBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__UNCPushRegistrationRepository_removeRegistrationForBundleIdentifier___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (UNCPushRegistrationRepository)initWithDirectory:(id)a3 librarian:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[UNCKeyedDictionaryRepository alloc] initWithDirectory:v7 fileName:@"PushRegistration" pathExtension:@"plist" librarian:v6];

  v14.receiver = self;
  v14.super_class = (Class)UNCPushRegistrationRepository;
  id v9 = [(UNCPushRegistrationRepository *)&v14 init];
  if (v9)
  {
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.usernotificationsserver.PushRegistrationRepository", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_repository, v8);
  }

  return v9;
}

- (id)allBundleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__UNCPushRegistrationRepository_allBundleIdentifiers__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __53__UNCPushRegistrationRepository_allBundleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];

  return MEMORY[0x270F9A758]();
}

- (id)registrationForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__UNCPushRegistrationRepository_registrationForBundleIdentifier___block_invoke;
  block[3] = &unk_265567700;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __65__UNCPushRegistrationRepository_registrationForBundleIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_registrationForBundleIdentifier:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__UNCPushRegistrationRepository_notificationSourcesDidUninstall___block_invoke;
  v7[3] = &unk_265567628;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __65__UNCPushRegistrationRepository_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "bundleIdentifier", (void)v9);
        objc_msgSend(v7, "_queue_removeRegistrationForBundleIdentifier:", v8);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)_queue_registrationForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(UNCKeyedDictionaryRepository *)self->_repository dictionaryForKey:a3];
  if (v3)
  {
    uint64_t v4 = (*((void (**)(uint64_t, void *))UNCDictionaryToUNCPushRegistration + 2))((uint64_t)UNCDictionaryToUNCPushRegistration, v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_repository, 0);
}

@end