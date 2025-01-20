@interface NMSInitialCloudLibraryImportObserver
- (NMSInitialCloudLibraryImportObserver)init;
- (void)_handleInitialCloudLibraryImportCompleted;
- (void)_performInitialImportBlocks;
- (void)performBlockWhenLibraryIsReady:(id)a3;
@end

@implementation NMSInitialCloudLibraryImportObserver

- (NMSInitialCloudLibraryImportObserver)init
{
  v13.receiver = self;
  v13.super_class = (Class)NMSInitialCloudLibraryImportObserver;
  v2 = [(NMSInitialCloudLibraryImportObserver *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoMusicSync.InitialCloudLibraryImportObserver", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    initialImportBlocks = v2->_initialImportBlocks;
    v2->_initialImportBlocks = v6;

    id v8 = objc_alloc(MEMORY[0x263F890C8]);
    v9 = [MEMORY[0x263F893C0] autoupdatingActiveAccount];
    uint64_t v10 = [v8 initWithUserIdentity:v9];
    cloudClient = v2->_cloudClient;
    v2->_cloudClient = (ICCloudClient *)v10;
  }
  return v2;
}

- (void)performBlockWhenLibraryIsReady:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__NMSInitialCloudLibraryImportObserver_performBlockWhenLibraryIsReady___block_invoke;
  v7[3] = &unk_264633B88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __71__NMSInitialCloudLibraryImportObserver_performBlockWhenLibraryIsReady___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3 = (void *)MEMORY[0x223CA14E0](*(void *)(a1 + 40));
  [v2 addObject:v3];

  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 16))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_ICCloudClientInitialCloudLibraryImportCompletedNotification, (CFStringRef)*MEMORY[0x263F88EB0], 0, (CFNotificationSuspensionBehavior)0);
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  int v6 = [*(id *)(v4 + 24) initialLibrarySyncsComplete];
  v7 = NMLogForCategory(5);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "[NMSInitialCloudLibraryImportObserver] Initial library syncs complete. Performing initial import blocks.", buf, 2u);
    }

    [*(id *)(a1 + 32) _performInitialImportBlocks];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "[NMSInitialCloudLibraryImportObserver] Initial library syncs are not complete. Waiting for ICCloudClientInitialCloudLibraryImportCompletedNotification.", v9, 2u);
    }
  }
}

- (void)_handleInitialCloudLibraryImportCompleted
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__NMSInitialCloudLibraryImportObserver__handleInitialCloudLibraryImportCompleted__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __81__NMSInitialCloudLibraryImportObserver__handleInitialCloudLibraryImportCompleted__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 16))
  {
    uint64_t v1 = result;
    v2 = NMLogForCategory(5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[NMSInitialCloudLibraryImportObserver] Received ICCloudClientInitialCloudLibraryImportCompletedNotification. Performing initial import blocks.", v3, 2u);
    }

    return [*(id *)(v1 + 32) _performInitialImportBlocks];
  }
  return result;
}

- (void)_performInitialImportBlocks
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F88EB0] object:0];

  self->_isObserving = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_initialImportBlocks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_initialImportBlocks removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_cloudClient, 0);

  objc_storeStrong((id *)&self->_initialImportBlocks, 0);
}

@end