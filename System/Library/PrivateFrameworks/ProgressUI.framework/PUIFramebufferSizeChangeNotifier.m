@interface PUIFramebufferSizeChangeNotifier
+ (id)sharedInstance;
- (id)addListener:(id)a3;
- (void)_onMainQueue_notifyListeners;
- (void)removeListener:(id)a3;
@end

@implementation PUIFramebufferSizeChangeNotifier

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __50__PUIFramebufferSizeChangeNotifier_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PUIFramebufferSizeChangeNotifier);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

  if (sharedInstance_sharedInstance)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    v3 = *(void **)(sharedInstance_sharedInstance + 8);
    *(void *)(sharedInstance_sharedInstance + 8) = v2;

    uint64_t v4 = [objc_alloc(MEMORY[0x263F3F750]) initWithInitializationCompletion:&__block_literal_global_5];
    v5 = *(void **)(sharedInstance_sharedInstance + 16);
    *(void *)(sharedInstance_sharedInstance + 16) = v4;

    v6 = MEMORY[0x263EF83A0];
    dispatch_async(v6, &__block_literal_global_7);
  }
}

uint64_t __50__PUIFramebufferSizeChangeNotifier_sharedInstance__block_invoke_2()
{
  return objc_msgSend((id)sharedInstance_sharedInstance, "_onMainQueue_notifyListeners");
}

uint64_t __50__PUIFramebufferSizeChangeNotifier_sharedInstance__block_invoke_3()
{
  return objc_msgSend(*(id *)(sharedInstance_sharedInstance + 16), "addObserver:");
}

- (id)addListener:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self->_listeners;
  objc_sync_enter(v5);
  listeners = self->_listeners;
  v7 = (void *)MEMORY[0x2166C87D0](v4);
  v11[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [(NSMutableArray *)listeners addObject:v8];

  v9 = [(NSMutableArray *)self->_listeners lastObject];
  NSLog(&cfstr_DidAddNewFrame.isa, v9);
  objc_sync_exit(v5);

  return v9;
}

- (void)removeListener:(id)a3
{
  id v5 = a3;
  id v4 = self->_listeners;
  objc_sync_enter(v4);
  NSLog(&cfstr_WillRemoveFram.isa, v5);
  [(NSMutableArray *)self->_listeners removeObject:v5];
  objc_sync_exit(v4);
}

- (void)_onMainQueue_notifyListeners
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = self->_listeners;
  objc_sync_enter(v3);
  id v4 = [(FBSDisplayMonitor *)self->_displayMonitor mainConfiguration];
  id v5 = [v4 currentMode];
  [v5 pixelSize];
  double v7 = v6;
  double v9 = v8;

  v10 = [NSNumber numberWithDouble:v7];
  v11 = [NSNumber numberWithDouble:v9];
  NSLog(&cfstr_WillBroadcastN.isa, v10, v11);

  v12 = (void *)[(NSMutableArray *)self->_listeners copy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([(NSMutableArray *)self->_listeners containsObject:v17])
        {
          v18 = [v17 firstObject];
          v18[2](v7, v9);
        }
        else
        {
          NSLog(&cfstr_SkippingRemove.isa, v17);
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  objc_sync_exit(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end