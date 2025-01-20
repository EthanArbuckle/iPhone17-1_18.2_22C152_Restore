@interface SBAirplaneModeController
+ (id)sharedInstance;
- (BOOL)isInAirplaneMode;
- (SBAirplaneModeController)init;
- (SBAirplaneModeDelegate)delegate;
- (void)airplaneModeChanged;
- (void)setDelegate:(id)a3;
- (void)setInAirplaneMode:(BOOL)a3;
@end

@implementation SBAirplaneModeController

+ (id)sharedInstance
{
  if (sharedInstance___sharedAirplaneToken != -1) {
    dispatch_once(&sharedInstance___sharedAirplaneToken, &__block_literal_global_206);
  }
  v2 = (void *)sharedInstance___airplaneModeController;
  return v2;
}

- (BOOL)isInAirplaneMode
{
  return self->_cachedInAirplaneMode;
}

void __42__SBAirplaneModeController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBAirplaneModeController);
  v1 = (void *)sharedInstance___airplaneModeController;
  sharedInstance___airplaneModeController = (uint64_t)v0;
}

- (SBAirplaneModeController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBAirplaneModeController;
  v2 = [(SBAirplaneModeController *)&v8 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    radioQueue = v2->_radioQueue;
    v2->_radioQueue = (OS_dispatch_queue *)Serial;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F4BE78]) initWithQueue:v2->_radioQueue];
    radioPrefs = v2->_radioPrefs;
    v2->_radioPrefs = (RadiosPreferences *)v5;

    [(RadiosPreferences *)v2->_radioPrefs setDelegate:v2];
    [(RadiosPreferences *)v2->_radioPrefs refresh];
    v2->_cachedInAirplaneMode = [(RadiosPreferences *)v2->_radioPrefs airplaneMode];
  }
  return v2;
}

- (void)setInAirplaneMode:(BOOL)a3
{
}

- (void)airplaneModeChanged
{
  [(RadiosPreferences *)self->_radioPrefs refresh];
  char v3 = [(RadiosPreferences *)self->_radioPrefs airplaneMode];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SBAirplaneModeController_airplaneModeChanged__block_invoke;
  v4[3] = &unk_1E6AF5D38;
  char v5 = v3;
  v4[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __47__SBAirplaneModeController_airplaneModeChanged__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 16))
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:*MEMORY[0x1E4FA79F0] object:0 userInfo:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = *(unsigned char *)(a1 + 40);
    char v3 = [*(id *)(a1 + 32) delegate];
    [v3 airplaneModeDidChange:*(unsigned __int8 *)(a1 + 40)];

    [v2 postNotificationName:*MEMORY[0x1E4FA79E0] object:0 userInfo:0];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = +[SBApplicationController sharedInstance];
    char v5 = [v4 allApplications];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setHasDisplayedLaunchAlert:0 forType:2];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [v2 postNotificationName:*MEMORY[0x1E4FA79E8] object:0 userInfo:0];
  }
}

- (SBAirplaneModeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAirplaneModeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radioQueue, 0);
  objc_storeStrong((id *)&self->_radioPrefs, 0);
}

@end