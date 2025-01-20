@interface PKCoarseLocationMonitor
+ (id)sharedInstance;
- (BOOL)coarseLocationEnabled;
- (PKCoarseLocationMonitor)init;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation PKCoarseLocationMonitor

+ (id)sharedInstance
{
  if (_MergedGlobals_297 != -1) {
    dispatch_once(&_MergedGlobals_297, &__block_literal_global_236);
  }
  v2 = (void *)qword_1EB4036C0;
  return v2;
}

void __41__PKCoarseLocationMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKCoarseLocationMonitor);
  v1 = (void *)qword_1EB4036C0;
  qword_1EB4036C0 = (uint64_t)v0;
}

- (PKCoarseLocationMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKCoarseLocationMonitor;
  v2 = [(PKCoarseLocationMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__PKCoarseLocationMonitor_init__block_invoke;
    block[3] = &unk_1E56D8AE0;
    v6 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  return v3;
}

void __31__PKCoarseLocationMonitor_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1E600]);
  PKPassKitCoreBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v7 bundlePath];
  uint64_t v4 = [v2 initWithEffectiveBundlePath:v3 delegate:*(void *)(a1 + 32) onQueue:MEMORY[0x1E4F14428]];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKCoarseLocationMonitor_locationManagerDidChangeAuthorization___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __65__PKCoarseLocationMonitor_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _limitsPrecision];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 16) != v2)
  {
    *(unsigned char *)(v3 + 16) = v2;
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"PKCoarseLocationMonitorEnabledStateChangedNotification" object:*(void *)(a1 + 40)];
  }
}

- (BOOL)coarseLocationEnabled
{
  return self->_coarseLocationEnabled;
}

- (void).cxx_destruct
{
}

@end