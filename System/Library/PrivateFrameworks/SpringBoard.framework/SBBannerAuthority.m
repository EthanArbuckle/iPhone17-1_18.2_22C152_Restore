@interface SBBannerAuthority
- (BNConsideringDelegate)delegate;
- (BOOL)_isScreenSharingActive;
- (BOOL)_shouldDropPresentableDuringScreenSharing:(id)a3 userInfo:(id)a4;
- (BOOL)_shouldDropPresentablesDuringScreenSharing;
- (SBBannerAuthority)init;
- (int64_t)_mediatedDecisionFromDecisions:(id)a3 defaultDecision:(int64_t)a4;
- (int64_t)shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5;
- (int64_t)shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5 stateChange:(id *)a6;
- (int64_t)shouldNewTierBeAddedToTopForPresentable:(id)a3 withPresentable:(id)a4;
- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4;
- (int64_t)shouldPostPresentable:(id)a3 userInfo:(id)a4 reason:(id *)a5;
- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5;
- (void)_configureSinksIfNecessary;
- (void)_setScreenSharingActive:(BOOL)a3;
- (void)bannerAuthority:(id)a3 mayChangeDecisionForResponsiblePresentable:(id)a4;
- (void)registerAuthority:(id)a3 forRequesterIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBBannerAuthority

- (SBBannerAuthority)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBBannerAuthority;
  v2 = [(SBBannerAuthority *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SBBannerAuthority *)v2 _configureSinksIfNecessary];
  }
  return v3;
}

- (void)registerAuthority:(id)a3 forRequesterIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && v6)
  {
    requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
    if (!requesterIDsToAuthorities)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = self->_requesterIDsToAuthorities;
      self->_requesterIDsToAuthorities = v8;

      requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
    }
    [(NSMutableDictionary *)requesterIDsToAuthorities setObject:v10 forKey:v6];
    if (objc_opt_respondsToSelector()) {
      [v10 setDelegate:self];
    }
  }
}

- (int64_t)shouldPostPresentable:(id)a3 userInfo:(id)a4 reason:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(SBBannerAuthority *)self _isScreenSharingActive]
    && [(SBBannerAuthority *)self _shouldDropPresentablesDuringScreenSharing]&& [(SBBannerAuthority *)self _shouldDropPresentableDuringScreenSharing:v8 userInfo:v9])
  {
    if (a5) {
      *a5 = @"Posting not permitted during screen sharing";
    }
    int64_t v10 = -1;
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v8 presentableType] == 1)
  {
    int64_t v10 = 1;
    v11 = v9;
  }
  else
  {
    requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
    v13 = [v8 requesterIdentifier];
    v14 = [(NSMutableDictionary *)requesterIDsToAuthorities objectForKey:v13];

    v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_249];
    v11 = [v9 filteredArrayUsingPredicate:v15];

    v16 = self->_requesterIDsToAuthorities;
    v17 = [v11 lastObject];
    v18 = [v17 requesterIdentifier];
    v19 = [(NSMutableDictionary *)v16 objectForKey:v18];

    if (v14)
    {
      id v33 = 0;
      uint64_t v20 = [v14 shouldPresentPresentable:v8 withPresentedPresentables:v11 responsiblePresentable:&v33];
      id v30 = v33;
    }
    else
    {
      id v30 = 0;
      uint64_t v20 = 0;
    }
    v31 = v14;
    v21 = a5;
    if (v19)
    {
      id v32 = 0;
      uint64_t v22 = [v19 shouldPresentPresentable:v8 withPresentedPresentables:v11 responsiblePresentable:&v32];
      id v23 = v32;
    }
    else
    {
      id v23 = 0;
      uint64_t v22 = 0;
    }
    v24 = objc_msgSend(NSNumber, "numberWithInteger:", v20, v20);
    v34[0] = v24;
    v25 = [NSNumber numberWithInteger:v22];
    v34[1] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    int64_t v10 = [(SBBannerAuthority *)self _mediatedDecisionFromDecisions:v26 defaultDecision:1];

    if (v21)
    {
      v27 = v23;
      if (v10 == v22 || (v27 = v30, v10 == v29)) {
        id *v21 = v27;
      }
    }
  }
  return v10;
}

BOOL __95__SBBannerAuthority_shouldPresentPresentable_withPresentedPresentables_responsiblePresentable___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = (objc_opt_respondsToSelector() & 1) == 0 || [v2 presentableType] != 1;

  return v3;
}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
  id v9 = [v6 requesterIdentifier];
  int64_t v10 = [(NSMutableDictionary *)requesterIDsToAuthorities objectForKey:v9];

  v11 = self->_requesterIDsToAuthorities;
  v12 = [v7 requesterIdentifier];
  v13 = [(NSMutableDictionary *)v11 objectForKey:v12];

  if (!v10)
  {
    uint64_t v14 = 0;
    if (v13) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v15 = 0;
    goto LABEL_6;
  }
  uint64_t v14 = [v10 shouldOverlapPresentable:v6 withPresentable:v7];
  if (!v13) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v15 = [v13 shouldOverlapPresentable:v6 withPresentable:v7];
LABEL_6:
  v16 = [NSNumber numberWithInteger:v14];
  v21[0] = v16;
  v17 = [NSNumber numberWithInteger:v15];
  v21[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  int64_t v19 = [(SBBannerAuthority *)self _mediatedDecisionFromDecisions:v18 defaultDecision:1];

  return v19;
}

- (int64_t)shouldNewTierBeAddedToTopForPresentable:(id)a3 withPresentable:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
  id v9 = [v6 requesterIdentifier];
  int64_t v10 = [(NSMutableDictionary *)requesterIDsToAuthorities objectForKey:v9];

  v11 = self->_requesterIDsToAuthorities;
  v12 = [v7 requesterIdentifier];
  v13 = [(NSMutableDictionary *)v11 objectForKey:v12];

  if (objc_opt_respondsToSelector()) {
    uint64_t v14 = [v10 shouldNewTierBeAddedToTopForPresentable:v6 withPresentable:v7];
  }
  else {
    uint64_t v14 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v15 = [v13 shouldNewTierBeAddedToTopForPresentable:v6 withPresentable:v7];
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = [NSNumber numberWithInteger:v14];
  v21[0] = v16;
  v17 = [NSNumber numberWithInteger:v15];
  v21[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  int64_t v19 = [(SBBannerAuthority *)self _mediatedDecisionFromDecisions:v18 defaultDecision:1];

  return v19;
}

- (int64_t)shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  return [(SBBannerAuthority *)self shouldMorphToPresentable:a3 withPresentedPresentables:a4 responsiblePresentable:a5 stateChange:0];
}

- (int64_t)shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5 stateChange:(id *)a6
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
  v11 = [v8 requesterIdentifier];
  v12 = [(NSMutableDictionary *)requesterIDsToAuthorities objectForKey:v11];

  v13 = self->_requesterIDsToAuthorities;
  uint64_t v14 = [v9 lastObject];
  uint64_t v15 = [v14 requesterIdentifier];
  uint64_t v16 = [(NSMutableDictionary *)v13 objectForKey:v15];

  if (objc_opt_respondsToSelector())
  {
    id v44 = 0;
    id v45 = 0;
    uint64_t v17 = [v12 shouldMorphToPresentable:v8 withPresentedPresentables:v9 responsiblePresentable:&v45 stateChange:&v44];
    id v18 = v45;
    id v19 = v44;
  }
  else
  {
    id v18 = 0;
    uint64_t v17 = 0;
    id v19 = (id)MEMORY[0x1E4F1CC28];
  }
  v38 = v18;
  v40 = v12;
  v39 = (void *)v16;
  if (objc_opt_respondsToSelector())
  {
    id v42 = 0;
    id v43 = 0;
    uint64_t v20 = (void *)v16;
    v21 = v8;
    uint64_t v22 = v9;
    uint64_t v23 = [v20 shouldMorphToPresentable:v8 withPresentedPresentables:v9 responsiblePresentable:&v43 stateChange:&v42];
    id v24 = v43;
    id v37 = v42;
  }
  else
  {
    uint64_t v22 = v9;
    v21 = v8;
    id v24 = 0;
    uint64_t v23 = 0;
    id v37 = (id)MEMORY[0x1E4F1CC28];
  }
  [NSNumber numberWithInteger:v17];
  v26 = uint64_t v25 = v17;
  v46[0] = v26;
  v27 = [NSNumber numberWithInteger:v23];
  v46[1] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  int64_t v29 = [(SBBannerAuthority *)self _mediatedDecisionFromDecisions:v28 defaultDecision:-1];

  if (v29 == v23)
  {
    id v30 = a6;
    v31 = v38;
    if (a5) {
      *a5 = v24;
    }
    id v32 = v37;
    id v33 = v37;
    if (!a6) {
      goto LABEL_18;
    }
LABEL_17:
    *id v30 = v33;
    goto LABEL_18;
  }
  BOOL v34 = v29 == v25;
  id v30 = a6;
  id v32 = v37;
  v31 = v38;
  if (v34)
  {
    if (a5) {
      *a5 = v38;
    }
    id v33 = v19;
    if (a6) {
      goto LABEL_17;
    }
  }
LABEL_18:

  return v29;
}

- (void)bannerAuthority:(id)a3 mayChangeDecisionForResponsiblePresentable:(id)a4
{
  id v11 = a4;
  requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
  id v7 = a3;
  id v8 = [(NSMutableDictionary *)requesterIDsToAuthorities allValues];
  int v9 = [v8 containsObject:v7];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bannerAuthority:self mayChangeDecisionForResponsiblePresentable:v11];
  }
}

- (int64_t)_mediatedDecisionFromDecisions:(id)a3 defaultDecision:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v6)
  {
LABEL_15:

LABEL_16:
    int64_t v8 = a4;
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  int64_t v8 = 0;
  uint64_t v9 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue", (void)v13);
      if (v11)
      {
        if (v8 && v8 != v11) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v11 = v8;
      }
      int64_t v8 = v11;
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v7);

  if (!v8) {
    goto LABEL_16;
  }
LABEL_17:

  return v8;
}

- (void)_configureSinksIfNecessary
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sinks && !v2->_isConfiguringSinks)
  {
    BOOL v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sinks = v2->_sinks;
    v2->_sinks = v3;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)Serial;

    v2->_isConfiguringSinks = 1;
    uint64_t v7 = v2->_biomeQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = v2;
    dispatch_async(v7, block);
  }
  objc_sync_exit(v2);
}

void __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = SBLogBanners();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Configuring screen sharing sink", buf, 2u);
  }

  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.springboard.bannerauthority.screensharing" targetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  v4 = [MEMORY[0x1E4F504C8] screenSharingStream];
  id v5 = [v4 publisher];
  uint64_t v6 = [v5 subscribeOn:v3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke_31;
  v8[3] = &unk_1E6B071B8;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v7 = [v6 sinkWithCompletion:&__block_literal_global_30_3 receiveInput:v8];

  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v7 forKeyedSubscript:@"com.apple.springboard.bannerauthority.screensharing"];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
}

void __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = SBLogBanners();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke_27_cold_1(v2, v3);
  }
}

uint64_t __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a2 eventBody];
  uint64_t v4 = [v3 isStart];

  id v5 = SBLogBanners();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"not active";
    if (v4) {
      uint64_t v6 = @"active";
    }
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Screen sharing is %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return [*(id *)(a1 + 32) _setScreenSharingActive:v4];
}

- (BOOL)_shouldDropPresentablesDuringScreenSharing
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"SBAllowNotificationsDuringScreenSharing"] ^ 1;

  return v3;
}

- (BOOL)_shouldDropPresentableDuringScreenSharing:(id)a3 userInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a4 objectForKey:*MEMORY[0x1E4FA7FA8]];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  int v11 = [v10 BOOLValue];
  if (v11)
  {
    v12 = SBLogBanners();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      id v21 = v5;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Based on user info key, shouldn't drop presentable while screen sharing: %{public}@", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    long long v13 = [v5 requesterIdentifier];
    if (BSEqualStrings())
    {
      long long v14 = [v5 requestIdentifier];
      int v15 = [v14 hasPrefix:@"com.apple.conversationController"];

      if (v15)
      {
        v12 = SBLogBanners();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[SBBannerAuthority _shouldDropPresentableDuringScreenSharing:userInfo:]((uint64_t)v5, v12);
        }
        goto LABEL_17;
      }
    }
    else
    {
    }
    long long v16 = [v5 requesterIdentifier];
    int v17 = BSEqualStrings();

    if (!v17)
    {
      BOOL v18 = 1;
      goto LABEL_18;
    }
    v12 = SBLogBanners();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SBBannerAuthority _shouldDropPresentableDuringScreenSharing:userInfo:]((uint64_t)v5, v12);
    }
  }
LABEL_17:

  BOOL v18 = 0;
LABEL_18:

  return v18;
}

- (BNConsideringDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNConsideringDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_isScreenSharingActive
{
  return self->_screenSharingActive;
}

- (void)_setScreenSharingActive:(BOOL)a3
{
  self->_screenSharingActive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_requesterIDsToAuthorities, 0);
}

void __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke_27_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = [a1 error];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Screen sharing sink completion was unexpectely invoked (error: %{public}@)", (uint8_t *)&v4, 0xCu);
}

- (void)_shouldDropPresentableDuringScreenSharing:(uint64_t)a1 userInfo:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Exempting Expanse presentable: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_shouldDropPresentableDuringScreenSharing:(uint64_t)a1 userInfo:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Exempting Bluetooth Smart Routing presentable: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end