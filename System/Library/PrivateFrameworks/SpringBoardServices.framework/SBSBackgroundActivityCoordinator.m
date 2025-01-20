@interface SBSBackgroundActivityCoordinator
- (NSSet)backgroundActivityIdentifiers;
- (SBSBackgroundActivityCoordinatorDelegate)delegate;
- (unint64_t)styleOverrides;
- (void)_handleStatusBarTapWithContext:(id)a3 withCompletionBlock:(id)a4;
- (void)_registrationInvalidated:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setRegisteredBackgroundActivityIdentifiers:(id)a3 reply:(id)a4;
- (void)setRegisteredStyleOverrides:(unint64_t)a3 reply:(id)a4;
@end

@implementation SBSBackgroundActivityCoordinator

- (void)dealloc
{
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "SBSBackgroundActivityCoordinator: Automatically canceling coordinator registration due to dealloc of coordinator.", buf, 2u);
  }

  [(SBSBackgroundActivityCoordinator *)self setRegisteredBackgroundActivityIdentifiers:0 reply:&__block_literal_global_52];
  v4.receiver = self;
  v4.super_class = (Class)SBSBackgroundActivityCoordinator;
  [(SBSBackgroundActivityCoordinator *)&v4 dealloc];
}

void __43__SBSBackgroundActivityCoordinator_dealloc__block_invoke()
{
  v0 = SBLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FBC5000, v0, OS_LOG_TYPE_INFO, "Sucessfully unregistered from all overrides", v1, 2u);
  }
}

- (void)setRegisteredBackgroundActivityIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_18FBC5000, v8, OS_LOG_TYPE_INFO, "SBSBackgroundActivityCoordinator: updating registration for coordinator %@", buf, 0xCu);
  }

  v9 = (NSSet *)[v7 copy];
  backgroundActivityIdentifiers = self->_backgroundActivityIdentifiers;
  self->_backgroundActivityIdentifiers = v9;

  NSUInteger v11 = [(NSSet *)self->_backgroundActivityIdentifiers count];
  v12 = +[SBSBackgroundActivityAssertionManager sharedInstance];
  v13 = v12;
  if (v11)
  {
    [v12 updateRegistrationForCoordinator:self reply:v6];
LABEL_7:

    goto LABEL_8;
  }
  [v12 unregisterCoordinator];

  if (v6)
  {
    v14 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__SBSBackgroundActivityCoordinator_setRegisteredBackgroundActivityIdentifiers_reply___block_invoke;
    block[3] = &unk_1E566B4D8;
    id v16 = v6;
    dispatch_async(v14, block);

    v13 = v16;
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __85__SBSBackgroundActivityCoordinator_setRegisteredBackgroundActivityIdentifiers_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleStatusBarTapWithContext:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v8 = soft_STBackgroundActivityIdentifiersDescription((uint64_t)self->_backgroundActivityIdentifiers);
  v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_18FBC5000, v9, OS_LOG_TYPE_INFO, "SBSBackgroundActivityCoordinator: sending status bar tap to delegate for background activities (%@)", (uint8_t *)&v12, 0xCu);
  }

  v10 = [(SBSBackgroundActivityCoordinator *)self delegate];
  NSUInteger v11 = v10;
  if (v10)
  {
    [v10 statusBarCoordinator:self receivedTapWithContext:v6 completionBlock:v7];
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

- (void)_registrationInvalidated:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = soft_STBackgroundActivityIdentifiersDescription((uint64_t)self->_backgroundActivityIdentifiers);
  id v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_18FBC5000, v6, OS_LOG_TYPE_INFO, "SBSBackgroundActivityCoordinator: Registration cancelled for style background activities (%@). Error: %@", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained statusBarCoordinator:self invalidatedRegistrationWithError:v4];
}

- (void)setRegisteredStyleOverrides:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  soft_STUIBackgroundActivityIdentifiersForStyleOverrides(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(SBSBackgroundActivityCoordinator *)self setRegisteredBackgroundActivityIdentifiers:v7 reply:v6];
}

- (unint64_t)styleOverrides
{
  v2 = [(SBSBackgroundActivityCoordinator *)self backgroundActivityIdentifiers];
  return soft_STUIStyleOverridesForBackgroundActivityIdentifiers((uint64_t)v2);
}

- (SBSBackgroundActivityCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSBackgroundActivityCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)backgroundActivityIdentifiers
{
  return self->_backgroundActivityIdentifiers;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiers, 0);
}

@end