@interface VUIUpNextButtonProperties
- (BOOL)confirmationShouldWaitCompletion;
- (BOOL)dismissOnSelect;
- (BOOL)isWatchListed;
- (NSString)canonicalID;
- (UIView)currentImageView;
- (VUIUpNextButtonProperties)init;
- (VUIUpNextButtonProtocol)delegate;
- (VUIUpNextStateView)addedStateView;
- (VUIUpNextStateView)removedStateView;
- (void)_toggleUpNextState;
- (void)_updatingState:(id)a3;
- (void)callAPIAndToggleUpNextState;
- (void)dealloc;
- (void)removeNotificationObserver;
- (void)setCanonicalID:(id)a3;
- (void)setConfirmationShouldWaitCompletion:(BOOL)a3;
- (void)setCurrentImageView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissOnSelect:(BOOL)a3;
- (void)setIsWatchListed:(BOOL)a3;
- (void)setupNotificationObserver;
- (void)updateButtonContentView;
@end

@implementation VUIUpNextButtonProperties

- (VUIUpNextButtonProperties)init
{
  v8.receiver = self;
  v8.super_class = (Class)VUIUpNextButtonProperties;
  v2 = [(VUIUpNextButtonProperties *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    addedStateView = v2->_addedStateView;
    v2->_addedStateView = (VUIUpNextStateView *)v3;

    uint64_t v5 = objc_opt_new();
    removedStateView = v2->_removedStateView;
    v2->_removedStateView = (VUIUpNextStateView *)v5;
  }
  return v2;
}

- (void)setupNotificationObserver
{
  uint64_t v3 = [(VUIUpNextButtonProperties *)self canonicalID];
  if (v3)
  {
    id v5 = v3;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__updatingState_ name:@"VUIUpNextRequestDidFinishNotification" object:0];

    uint64_t v3 = v5;
  }
}

- (void)removeNotificationObserver
{
  uint64_t v3 = [(VUIUpNextButtonProperties *)self canonicalID];
  if (v3)
  {
    id v5 = v3;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:@"VUIUpNextRequestDidFinishNotification" object:0];

    uint64_t v3 = v5;
  }
}

- (void)_toggleUpNextState
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VUIUpNextButtonProperties__toggleUpNextState__block_invoke;
  block[3] = &unk_1E6DF3D58;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __47__VUIUpNextButtonProperties__toggleUpNextState__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dismissOnSelect];
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsWatchListed:", objc_msgSend(*(id *)(a1 + 32), "isWatchListed") ^ 1);
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 updateButtonContentView];
  }
  return result;
}

- (void)callAPIAndToggleUpNextState
{
  v17[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VUIUpNextButtonProperties *)self isWatchListed];
  v4 = @"removed";
  if (v3) {
    v4 = @"added";
  }
  canonicalID = self->_canonicalID;
  v16[0] = @"itemID";
  v16[1] = @"state";
  v17[0] = canonicalID;
  v17[1] = v4;
  v16[2] = @"confirmationShouldWaitCompletion";
  v6 = (void *)MEMORY[0x1E4F28ED0];
  BOOL confirmationShouldWaitCompletion = self->_confirmationShouldWaitCompletion;
  objc_super v8 = canonicalID;
  v9 = [v6 numberWithBool:confirmationShouldWaitCompletion];
  v17[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  v11 = [[VUIActionUpdateUpNext alloc] initWithContextData:v10];
  if ([(VUIActionUpdateUpNext *)v11 isAccountRequired]
    && !+[VUIAuthenticationManager userHasActiveAccount]
    && +[VUIAuthenticationManager allowsAccountModification])
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__VUIUpNextButtonProperties_callAPIAndToggleUpNextState__block_invoke;
    v12[3] = &unk_1E6DF8A48;
    objc_copyWeak(&v14, &location);
    v13 = v11;
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:1 withCompletionHandler:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    [(VUIUpNextButtonProperties *)self _toggleUpNextState];
    [(VUIActionUpdateUpNext *)v11 performWithTargetResponder:0 completionHandler:0];
  }
}

void __56__VUIUpNextButtonProperties_callAPIAndToggleUpNextState__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (a2)
  {
    [WeakRetained _toggleUpNextState];
    [*(id *)(a1 + 32) performWithTargetResponder:0 completionHandler:0];
  }
  else
  {
    objc_super v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUIUpNextButtonProperties:: Authentication request failed with error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)updateButtonContentView
{
  id v3 = [(VUIUpNextButtonProperties *)self delegate];
  if ([(VUIUpNextButtonProperties *)self isWatchListed]) {
    [v3 upNextStateChangedToAdded];
  }
  else {
    [v3 upNextStateChangedToRemoved];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"VUIUpNextRequestDidFinishNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)VUIUpNextButtonProperties;
  [(VUIUpNextButtonProperties *)&v4 dealloc];
}

- (void)_updatingState:(id)a3
{
  id v4 = a3;
  id v13 = [v4 userInfo];
  id v5 = [v13 objectForKey:@"Error"];
  v6 = [v13 objectForKey:@"Action"];
  v7 = [v4 object];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [(VUIUpNextButtonProperties *)self canonicalID];
    int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      uint64_t v10 = [v6 unsignedIntegerValue];
      if (v5) {
        BOOL v11 = v6 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        if (v10 == 1)
        {
          if ([(VUIUpNextButtonProperties *)self isWatchListed]) {
            goto LABEL_21;
          }
        }
        else if (v10 || ![(VUIUpNextButtonProperties *)self isWatchListed])
        {
          goto LABEL_21;
        }
        uint64_t v12 = [(VUIUpNextButtonProperties *)self isWatchListed] ^ 1;
LABEL_20:
        [(VUIUpNextButtonProperties *)self setIsWatchListed:v12];
        [(VUIUpNextButtonProperties *)self updateButtonContentView];
        goto LABEL_21;
      }
      if (v10 == 1)
      {
        if (![(VUIUpNextButtonProperties *)self isWatchListed]) {
          goto LABEL_21;
        }
        uint64_t v12 = 0;
        goto LABEL_20;
      }
      if (!v10 && ![(VUIUpNextButtonProperties *)self isWatchListed])
      {
        uint64_t v12 = 1;
        goto LABEL_20;
      }
    }
  }
LABEL_21:
}

- (VUIUpNextStateView)addedStateView
{
  return self->_addedStateView;
}

- (VUIUpNextStateView)removedStateView
{
  return self->_removedStateView;
}

- (UIView)currentImageView
{
  return self->_currentImageView;
}

- (void)setCurrentImageView:(id)a3
{
}

- (VUIUpNextButtonProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIUpNextButtonProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
}

- (BOOL)isWatchListed
{
  return self->_isWatchListed;
}

- (void)setIsWatchListed:(BOOL)a3
{
  self->_isWatchListed = a3;
}

- (BOOL)dismissOnSelect
{
  return self->_dismissOnSelect;
}

- (void)setDismissOnSelect:(BOOL)a3
{
  self->_dismissOnSelect = a3;
}

- (BOOL)confirmationShouldWaitCompletion
{
  return self->_confirmationShouldWaitCompletion;
}

- (void)setConfirmationShouldWaitCompletion:(BOOL)a3
{
  self->_BOOL confirmationShouldWaitCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentImageView, 0);
  objc_storeStrong((id *)&self->_removedStateView, 0);
  objc_storeStrong((id *)&self->_addedStateView, 0);
}

@end