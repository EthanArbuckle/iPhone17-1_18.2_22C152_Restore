@interface PDCApplicationEventListener
+ (id)sharedInstance;
- (BOOL)cancelled;
- (PDCApplicationEventListener)initWithConsentStore:(id)a3 applicationEnvironment:(id)a4 targetQueue:(id)a5;
- (void)activate;
- (void)applicationDidUninstall:(id)a3;
- (void)checkForStaleConsentRecords;
- (void)invalidate;
- (void)setCancelled:(BOOL)a3;
@end

@implementation PDCApplicationEventListener

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_result;

  return v2;
}

void __45__PDCApplicationEventListener_sharedInstance__block_invoke()
{
  PDCGlobalConsentStoreInstance();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v0 = PDCGlobalApplicationEnvironment();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.PrivacyDisclosure.PDCApplicationEventListener", v1);

  v3 = [[PDCApplicationEventListener alloc] initWithConsentStore:v5 applicationEnvironment:v0 targetQueue:v2];
  v4 = (void *)sharedInstance_result;
  sharedInstance_result = (uint64_t)v3;
}

- (PDCApplicationEventListener)initWithConsentStore:(id)a3 applicationEnvironment:(id)a4 targetQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PDCApplicationEventListener;
  v12 = [(PDCApplicationEventListener *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_consentStore, a3);
    objc_storeStrong((id *)&v13->_applicationEnvironment, a4);
    objc_msgSend(NSString, "stringWithFormat:", @"PDCApplicationEventListener.0x%p", v13);
    id v14 = objc_claimAutoreleasedReturnValue();
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2(v15, v16, v11);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v17;

    v13->_activated._Value = 0;
    v19 = v13;
  }
  return v13;
}

- (void)activate
{
  if (+[PDCPreflightManager isPreflightFeatureEnabled])
  {
    if ((atomic_exchange(&self->_activated._Value, 1u) & 1) == 0)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__PDCApplicationEventListener_activate__block_invoke;
      block[3] = &unk_265479EC0;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
  else
  {
    [(PDCApplicationEventListener *)self invalidate];
  }
}

uint64_t __39__PDCApplicationEventListener_activate__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(void *)(result + 24))
  {
    uint64_t result = [(id)result cancelled];
    if ((result & 1) == 0)
    {
      uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) monitorAppEventsWithDelegate:*(void *)(a1 + 32) onQueue:*(void *)(*(void *)(a1 + 32) + 32)];
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 24);
      *(void *)(v4 + 24) = v3;

      v6 = *(void **)(a1 + 32);
      return [v6 checkForStaleConsentRecords];
    }
  }
  return result;
}

- (void)invalidate
{
  [(PDCApplicationEventListener *)self setCancelled:1];
  environmentMonitoringHandle = self->_environmentMonitoringHandle;

  [(PDCApplicationEnvironmentMonitoringHandle *)environmentMonitoringHandle invalidate];
}

- (void)checkForStaleConsentRecords
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(PDCConsentStore *)self->_consentStore consentedBundleIdentifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [(PDCApplicationEnvironment *)self->_applicationEnvironment applicationRecordForBundleIdentifier:v8];

        if (!v9) {
          id v10 = (id)[(PDCConsentStore *)self->_consentStore writeUserConsentedRegulatoryDisclosureVersion:0 forBundleIdentifier:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)applicationDidUninstall:(id)a3
{
  id v4 = a3;
  if (![(PDCApplicationEventListener *)self cancelled])
  {
    uint64_t v5 = [(PDCConsentStore *)self->_consentStore writeUserConsentedRegulatoryDisclosureVersion:0 forBundleIdentifier:v4];
    if (v5)
    {
      uint64_t v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(PDCApplicationEventListener *)(uint64_t)v4 applicationDidUninstall:v6];
      }
    }
  }
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_environmentMonitoringHandle, 0);
  objc_storeStrong((id *)&self->_applicationEnvironment, 0);

  objc_storeStrong((id *)&self->_consentStore, 0);
}

- (void)applicationDidUninstall:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25A653000, log, OS_LOG_TYPE_ERROR, "Error while deleting consent record for removed app %@: %@", (uint8_t *)&v3, 0x16u);
}

@end