@interface BYSilentLoginUpgradeGuarantor
+ (id)sharedInstance;
- (BOOL)didEnsureQueuesAndStartSilentLoginUpgrade;
- (BYSilentLoginUpgradeGuarantor)init;
- (OS_dispatch_queue)shortLivedTokenUpgradeCompletionQueue;
- (OS_dispatch_queue)silentLoginUpgradeCompletionQueue;
- (void)_ensureQueuesAndStartSilentLoginUpgrade;
- (void)blockUntilShortLivedTokenUpgradeCompletes;
- (void)blockUntilSilentLoginUpgradeCompletes;
- (void)blockUntilSilentLoginUpgradeCompletesForNonLoginUser;
- (void)setDidEnsureQueuesAndStartSilentLoginUpgrade:(BOOL)a3;
- (void)setShortLivedTokenUpgradeCompletionQueue:(id)a3;
- (void)setSilentLoginUpgradeCompletionQueue:(id)a3;
@end

@implementation BYSilentLoginUpgradeGuarantor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __47__BYSilentLoginUpgradeGuarantor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(BYSilentLoginUpgradeGuarantor);
  return MEMORY[0x1F41817F8]();
}

- (BYSilentLoginUpgradeGuarantor)init
{
  v5.receiver = self;
  v5.super_class = (Class)BYSilentLoginUpgradeGuarantor;
  v2 = [(BYSilentLoginUpgradeGuarantor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BYSilentLoginUpgradeGuarantor *)v2 setDidEnsureQueuesAndStartSilentLoginUpgrade:0];
  }
  return v3;
}

- (void)_ensureQueuesAndStartSilentLoginUpgrade
{
  v2 = self;
  objc_sync_enter(v2);
  if (![(BYSilentLoginUpgradeGuarantor *)v2 didEnsureQueuesAndStartSilentLoginUpgrade])
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.purplebuddy.silentloginupgradecompletion", 0);
    [(BYSilentLoginUpgradeGuarantor *)v2 setSilentLoginUpgradeCompletionQueue:v3];

    v4 = [(BYSilentLoginUpgradeGuarantor *)v2 silentLoginUpgradeCompletionQueue];
    dispatch_suspend(v4);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.purplebuddy.shortlivedtokenupgradecompletion", 0);
    [(BYSilentLoginUpgradeGuarantor *)v2 setShortLivedTokenUpgradeCompletionQueue:v5];

    v6 = [(BYSilentLoginUpgradeGuarantor *)v2 shortLivedTokenUpgradeCompletionQueue];
    dispatch_suspend(v6);

    v7 = +[BYManagedAppleIDBootstrap sharedManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__BYSilentLoginUpgradeGuarantor__ensureQueuesAndStartSilentLoginUpgrade__block_invoke;
    v9[3] = &unk_1E5D2C280;
    v9[4] = v2;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__BYSilentLoginUpgradeGuarantor__ensureQueuesAndStartSilentLoginUpgrade__block_invoke_5;
    v8[3] = &unk_1E5D2BA60;
    v8[4] = v2;
    [v7 runSilentLoginUpgradeIfNeededWithCompletion:v9 shortLivedTokenUpgradeCompletion:v8];

    [(BYSilentLoginUpgradeGuarantor *)v2 setDidEnsureQueuesAndStartSilentLoginUpgrade:1];
  }
  objc_sync_exit(v2);
}

void __72__BYSilentLoginUpgradeGuarantor__ensureQueuesAndStartSilentLoginUpgrade__block_invoke(uint64_t a1)
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Daemon did finish silent upgrade. Resuming completion queue.", v4, 2u);
  }

  dispatch_queue_t v3 = [*(id *)(a1 + 32) silentLoginUpgradeCompletionQueue];
  dispatch_resume(v3);
}

void __72__BYSilentLoginUpgradeGuarantor__ensureQueuesAndStartSilentLoginUpgrade__block_invoke_5(uint64_t a1)
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Daemon did finish short lived token upgrade. Resuming completion queue.", v4, 2u);
  }

  dispatch_queue_t v3 = [*(id *)(a1 + 32) shortLivedTokenUpgradeCompletionQueue];
  dispatch_resume(v3);
}

- (void)blockUntilSilentLoginUpgradeCompletesForNonLoginUser
{
  [(BYSilentLoginUpgradeGuarantor *)self _ensureQueuesAndStartSilentLoginUpgrade];
  dispatch_queue_t v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "blockUntilSilentLoginUpgradeCompletesForNonLoginUser will schedule block.", v5, 2u);
  }

  v4 = [(BYSilentLoginUpgradeGuarantor *)self silentLoginUpgradeCompletionQueue];
  dispatch_sync(v4, &__block_literal_global_7);
}

void __85__BYSilentLoginUpgradeGuarantor_blockUntilSilentLoginUpgradeCompletesForNonLoginUser__block_invoke()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "blockUntilSilentLoginUpgradeCompletesForNonLoginUser returning.", v1, 2u);
  }
}

- (void)blockUntilSilentLoginUpgradeCompletes
{
  dispatch_queue_t v3 = +[BYManagedAppleIDBootstrap sharedManager];
  char v4 = [v3 isLoginUser];

  if (v4)
  {
    [(BYSilentLoginUpgradeGuarantor *)self didShortCircuitSilentLoginUpgrade];
  }
  else
  {
    [(BYSilentLoginUpgradeGuarantor *)self blockUntilSilentLoginUpgradeCompletesForNonLoginUser];
  }
}

- (void)blockUntilShortLivedTokenUpgradeCompletes
{
  dispatch_queue_t v3 = +[BYManagedAppleIDBootstrap sharedManager];
  char v4 = [v3 isLoginUser];

  if (v4)
  {
    [(BYSilentLoginUpgradeGuarantor *)self didShortCircuitShortLivedTokenUpgrade];
  }
  else
  {
    [(BYSilentLoginUpgradeGuarantor *)self _ensureQueuesAndStartSilentLoginUpgrade];
    dispatch_queue_t v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "blockUntilShortLivedTokenUpgradeCompletes will schedule block.", v7, 2u);
    }

    v6 = [(BYSilentLoginUpgradeGuarantor *)self shortLivedTokenUpgradeCompletionQueue];
    dispatch_sync(v6, &__block_literal_global_9);
  }
}

void __74__BYSilentLoginUpgradeGuarantor_blockUntilShortLivedTokenUpgradeCompletes__block_invoke()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "blockUntilShortLivedTokenUpgradeCompletes returning.", v1, 2u);
  }
}

- (BOOL)didEnsureQueuesAndStartSilentLoginUpgrade
{
  return self->_didEnsureQueuesAndStartSilentLoginUpgrade;
}

- (void)setDidEnsureQueuesAndStartSilentLoginUpgrade:(BOOL)a3
{
  self->_didEnsureQueuesAndStartSilentLoginUpgrade = a3;
}

- (OS_dispatch_queue)silentLoginUpgradeCompletionQueue
{
  return self->_silentLoginUpgradeCompletionQueue;
}

- (void)setSilentLoginUpgradeCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)shortLivedTokenUpgradeCompletionQueue
{
  return self->_shortLivedTokenUpgradeCompletionQueue;
}

- (void)setShortLivedTokenUpgradeCompletionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortLivedTokenUpgradeCompletionQueue, 0);
  objc_storeStrong((id *)&self->_silentLoginUpgradeCompletionQueue, 0);
}

@end