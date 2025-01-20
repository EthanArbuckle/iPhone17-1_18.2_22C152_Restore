@interface PXApplicationState
+ (BOOL)isLaunchedForTesting;
+ (BOOL)isRunningInPhotosApp;
+ (BOOL)isRunningInPhotosTopShelfExtension;
+ (PXApplicationState)sharedState;
- (BOOL)isDisablingIdleTimerForReasons:(id *)a3;
- (BOOL)isHidden;
- (BOOL)isInactive;
- (BOOL)isLaunchedForTesting;
- (PXApplicationState)init;
- (PXApplicationState)initWithApplication:(id)a3;
- (PXApplicationState)initWithApplication:(id)a3 isExtension:(BOOL)a4;
- (UIApplication)application;
- (id)beginDisablingIdleTimerForReason:(id)a3;
- (int64_t)visibilityState;
- (void)_appDidBecomeActive:(id)a3;
- (void)_appDidBecomeHidden:(id)a3;
- (void)_appDidBecomeInactive:(id)a3;
- (void)_appDidBecomeUnhidden:(id)a3;
- (void)_invalidateVisibilityState;
- (void)_sceneDidActivate:(id)a3;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_sceneWillDeactivate:(id)a3;
- (void)_sceneWillEnterBackground:(id)a3;
- (void)_updateIfNeeded;
- (void)_updateVisibilityState;
- (void)didPerformChanges;
- (void)endDisablingIdleTimer:(id)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsInactive:(BOOL)a3;
- (void)setVisibilityState:(int64_t)a3;
@end

@implementation PXApplicationState

- (BOOL)isLaunchedForTesting
{
  return +[PXApplicationState isLaunchedForTesting];
}

+ (PXApplicationState)sharedState
{
  if (sharedState_onceToken != -1) {
    dispatch_once(&sharedState_onceToken, &__block_literal_global_97116);
  }
  v2 = (void *)sharedState_sharedState;
  return (PXApplicationState *)v2;
}

uint64_t __44__PXApplicationState__updateVisibilityState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisibilityState:*(void *)(a1 + 40)];
}

+ (BOOL)isRunningInPhotosApp
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = [v2 processName];

  LOBYTE(v2) = [v3 isEqualToString:@"Photos"];
  return (char)v2;
}

+ (BOOL)isLaunchedForTesting
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  char v3 = [v2 launchedToTest];

  return v3;
}

- (void)_appDidBecomeUnhidden:(id)a3
{
}

- (void)setVisibilityState:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_visibilityState != a3)
  {
    self->_int64_t visibilityState = a3;
    v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t visibilityState = self->_visibilityState;
      int v6 = 136315394;
      v7 = "-[PXApplicationState setVisibilityState:]";
      __int16 v8 = 2048;
      int64_t v9 = visibilityState;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "%s visibilityState: %li", (uint8_t *)&v6, 0x16u);
    }

    [(PXApplicationState *)self signalChange:1];
  }
}

void __33__PXApplicationState_sharedState__block_invoke()
{
  v0 = [PXApplicationState alloc];
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v1 = [(PXApplicationState *)v0 initWithApplication:v3 isExtension:_UIApplicationIsExtension()];
  v2 = (void *)sharedState_sharedState;
  sharedState_sharedState = v1;
}

- (PXApplicationState)initWithApplication:(id)a3 isExtension:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXApplicationState;
  __int16 v8 = [(PXApplicationState *)&v21 init];
  int64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_application, a3);
    v9->_needsUpdateVisibilityState = 1;
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (v4)
    {
      v9->_isInactive = 0;
      v11 = (void *)MEMORY[0x1E4F28270];
      v12 = &selRef__appDidBecomeActive_;
      v13 = (void *)MEMORY[0x1E4F28288];
      v14 = &selRef__appDidBecomeInactive_;
      id v15 = v7;
    }
    else
    {
      v9->_isInactive = [v7 applicationState] != 0;
      id v15 = 0;
      v9->_isHidden = [v7 applicationState] == 2;
      v11 = (void *)MEMORY[0x1E4FB2E80];
      v12 = &selRef__sceneDidActivate_;
      v13 = (void *)MEMORY[0x1E4FB2EA8];
      v14 = &selRef__sceneWillDeactivate_;
    }
    [v10 addObserver:v9 selector:*v14 name:*v13 object:v15];
    [v10 addObserver:v9 selector:*v12 name:*v11 object:v15];
    [v10 addObserver:v9 selector:sel__appDidBecomeHidden_ name:*MEMORY[0x1E4FB2E90] object:0];
    [v10 addObserver:v9 selector:sel__appDidBecomeUnhidden_ name:*MEMORY[0x1E4FB2EB0] object:0];
    v16 = PLUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int64_t visibilityState = v9->_visibilityState;
      *(_DWORD *)buf = 136315906;
      v23 = "-[PXApplicationState initWithApplication:isExtension:]";
      __int16 v24 = 2112;
      id v25 = v7;
      __int16 v26 = 1024;
      BOOL v27 = v4;
      __int16 v28 = 2048;
      int64_t v29 = visibilityState;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "%s application: %@ isExtension: %i visibilityState: %ld", buf, 0x26u);
    }

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:3];
    disabledIdleTimerTokens = v9->_disabledIdleTimerTokens;
    v9->_disabledIdleTimerTokens = (NSMutableSet *)v18;

    [(PXApplicationState *)v9 _updateIfNeeded];
  }

  return v9;
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXApplicationState;
  [(PXApplicationState *)&v3 didPerformChanges];
  [(PXApplicationState *)self _updateIfNeeded];
}

- (void)_updateVisibilityState
{
  if ([(PXApplicationState *)self isHidden])
  {
    uint64_t v3 = 3;
  }
  else
  {
    BOOL v4 = [(PXApplicationState *)self isInactive];
    uint64_t v3 = 1;
    if (v4) {
      uint64_t v3 = 2;
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PXApplicationState__updateVisibilityState__block_invoke;
  v5[3] = &unk_1E5DD09C8;
  v5[4] = self;
  v5[5] = v3;
  [(PXApplicationState *)self performChanges:v5];
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)_updateIfNeeded
{
  if (self->_needsUpdateVisibilityState) {
    [(PXApplicationState *)self _updateVisibilityState];
  }
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (void)_sceneDidActivate:(id)a3
{
  id v7 = [a3 object];
  BOOL v4 = [v7 session];
  v5 = [v4 role];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4FB3130]];

  if (v6) {
    [(PXApplicationState *)self setIsInactive:0];
  }
}

- (void)setIsInactive:(BOOL)a3
{
  if (self->_isInactive != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __36__PXApplicationState_setIsInactive___block_invoke;
    v3[3] = &unk_1E5DCEB78;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXApplicationState *)self performChanges:v3];
  }
}

uint64_t __34__PXApplicationState_setIsHidden___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 106);
    int v5 = 136315394;
    int v6 = "-[PXApplicationState setIsHidden:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%s isHidden: %i", (uint8_t *)&v5, 0x12u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 106) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateVisibilityState];
}

uint64_t __36__PXApplicationState_setIsInactive___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 105) = *(unsigned char *)(a1 + 40);
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 105);
    int v5 = 136315394;
    int v6 = "-[PXApplicationState setIsInactive:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%s isInactive: %i", (uint8_t *)&v5, 0x12u);
  }

  return [*(id *)(a1 + 32) _invalidateVisibilityState];
}

- (void)_invalidateVisibilityState
{
  self->_needsUpdateVisibilityState = 1;
}

- (void)setIsHidden:(BOOL)a3
{
  if (self->_isHidden != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __34__PXApplicationState_setIsHidden___block_invoke;
    v3[3] = &unk_1E5DCEB78;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXApplicationState *)self performChanges:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_disabledIdleTimerTokens, 0);
}

- (UIApplication)application
{
  return self->_application;
}

- (int64_t)visibilityState
{
  return self->_visibilityState;
}

- (BOOL)isDisablingIdleTimerForReasons:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSMutableSet *)self->_disabledIdleTimerTokens count];
  if (!v5)
  {
    v13 = 0;
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  __int16 v7 = self->_disabledIdleTimerTokens;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "reason", (void)v15);
        [v6 addObject:v12];
      }
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v13 = (void *)[v6 copy];
  if (a3) {
LABEL_10:
  }
    *a3 = v13;
LABEL_11:

  return v5 != 0;
}

- (void)endDisablingIdleTimer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 reason];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "End disabling idle timer for reason: %@", buf, 0xCu);
  }
  if (([(NSMutableSet *)self->_disabledIdleTimerTokens containsObject:v4] & 1) == 0) {
    PXAssertGetLog();
  }
  [(NSMutableSet *)self->_disabledIdleTimerTokens removeObject:v4];
  if (![(NSMutableSet *)self->_disabledIdleTimerTokens count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PXApplicationState_endDisablingIdleTimer___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __44__PXApplicationState_endDisablingIdleTimer___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) application];
  [v1 setIdleTimerDisabled:0];
}

- (id)beginDisablingIdleTimerForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[PXApplicationState isRunningInPhotosApp]
    || (PFProcessIsLaunchedToExecuteTests() & 1) != 0)
  {
    uint64_t v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Begin disabling idle timer for reason: %@", buf, 0xCu);
    }

    id v6 = [[PXApplicationDisabledIdleTimerToken alloc] initWithReason:v4 powerAssertionID:0];
    if (![(NSMutableSet *)self->_disabledIdleTimerTokens count])
    {
      __int16 v7 = [(PXApplicationState *)self application];
      if (!v7) {
        PXAssertGetLog();
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__PXApplicationState_beginDisablingIdleTimerForReason___block_invoke;
      block[3] = &unk_1E5DD36F8;
      id v12 = v7;
      id v8 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    [(NSMutableSet *)self->_disabledIdleTimerTokens addObject:v6];
  }
  else
  {
    uint64_t v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Skipping disabling idle timer (requested for reason: %@), because process is not the Photos app", buf, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

uint64_t __55__PXApplicationState_beginDisablingIdleTimerForReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIdleTimerDisabled:1];
}

- (void)_sceneWillEnterBackground:(id)a3
{
  id v7 = [a3 object];
  id v4 = [v7 session];
  uint64_t v5 = [v4 role];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4FB3130]];

  if (v6) {
    [(PXApplicationState *)self setIsHidden:0];
  }
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v7 = [a3 object];
  id v4 = [v7 session];
  uint64_t v5 = [v4 role];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4FB3130]];

  if (v6) {
    [(PXApplicationState *)self setIsHidden:1];
  }
}

- (void)_sceneWillDeactivate:(id)a3
{
  id v7 = [a3 object];
  id v4 = [v7 session];
  uint64_t v5 = [v4 role];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4FB3130]];

  if (v6) {
    [(PXApplicationState *)self setIsInactive:1];
  }
}

- (void)_appDidBecomeHidden:(id)a3
{
}

- (void)_appDidBecomeActive:(id)a3
{
}

- (void)_appDidBecomeInactive:(id)a3
{
}

- (PXApplicationState)initWithApplication:(id)a3
{
  return [(PXApplicationState *)self initWithApplication:a3 isExtension:0];
}

- (PXApplicationState)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXApplicationState.m", 73, @"%s is not available as initializer", "-[PXApplicationState init]");

  abort();
}

+ (BOOL)isRunningInPhotosTopShelfExtension
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  int v3 = [v2 processName];

  LOBYTE(v2) = [0 isEqualToString:v3];
  return (char)v2;
}

@end