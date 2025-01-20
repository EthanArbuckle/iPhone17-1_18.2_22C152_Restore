@interface LaunchStateController
+ (id)sharedController;
- (BOOL)hasCompletedLaunch;
- (LaunchStateController)init;
- (void)applicationUIDidBecomeActive;
- (void)doAfterUIBecomesActive:(id)a3;
- (void)forceMarkUIBecomeActiveForTesting;
@end

@implementation LaunchStateController

+ (id)sharedController
{
  if (sharedController_onceToken_0 != -1) {
    dispatch_once(&sharedController_onceToken_0, &__block_literal_global_66);
  }
  v2 = (void *)sharedController_sharedController_0;
  return v2;
}

- (BOOL)hasCompletedLaunch
{
  return self->_hasCompletedLaunch;
}

uint64_t __53__LaunchStateController_applicationUIDidBecomeActive__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)applicationUIDidBecomeActive
{
  if (!self->_hasCompletedLaunch)
  {
    self->_hasCompletedLaunch = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__LaunchStateController_applicationUIDidBecomeActive__block_invoke;
    block[3] = &unk_1E6D77E20;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)doAfterUIBecomesActive:(id)a3
{
  if (self->_hasCompletedLaunch)
  {
    v3 = (void (*)(id))*((void *)a3 + 2);
    v3(a3);
  }
  else
  {
    actionBlocks = self->_actionBlocks;
    id v5 = (id)MEMORY[0x1E4E42950](a3, a2);
    [(NSMutableArray *)actionBlocks addObject:v5];
  }
}

uint64_t __53__LaunchStateController_applicationUIDidBecomeActive__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) enumerateObjectsUsingBlock:&__block_literal_global_6];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 removeAllObjects];
}

void __41__LaunchStateController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(LaunchStateController);
  v1 = (void *)sharedController_sharedController_0;
  sharedController_sharedController_0 = (uint64_t)v0;
}

- (LaunchStateController)init
{
  v7.receiver = self;
  v7.super_class = (Class)LaunchStateController;
  v2 = [(LaunchStateController *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    actionBlocks = v2->_actionBlocks;
    v2->_actionBlocks = (NSMutableArray *)v3;

    id v5 = v2;
  }

  return v2;
}

- (void)forceMarkUIBecomeActiveForTesting
{
  if (!self->_hasCompletedLaunch)
  {
    self->_hasCompletedLaunch = 1;
    [(NSMutableArray *)self->_actionBlocks enumerateObjectsUsingBlock:&__block_literal_global_4_0];
    actionBlocks = self->_actionBlocks;
    [(NSMutableArray *)actionBlocks removeAllObjects];
  }
}

uint64_t __58__LaunchStateController_forceMarkUIBecomeActiveForTesting__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void).cxx_destruct
{
}

@end