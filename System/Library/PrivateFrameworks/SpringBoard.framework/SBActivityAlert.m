@interface SBActivityAlert
- (ACUISActivityAlertOptions)options;
- (BOOL)_hasPresentationDestination:(int64_t)a3;
- (BOOL)_isHostApplicationForeground;
- (BOOL)canPresentAlertTypeAmbientInEnvironment:(int64_t)a3;
- (BOOL)canPresentAlertTypeBannerOrSystemApertureInEnvironment:(int64_t)a3;
- (BOOL)canPresentAlertTypeNoneInEnvironment:(int64_t)a3;
- (BOOL)canPresentInEnvironment:(int64_t)a3 alertType:(int64_t)a4;
- (BOOL)isProminent;
- (BOOL)shouldAlertInEnvironment:(int64_t)a3;
- (NSString)body;
- (NSString)description;
- (NSString)payloadIdentifier;
- (NSString)title;
- (SBActivityAlert)alertWithScreenOn:(BOOL)a3 playSound:(BOOL)a4;
- (SBActivityAlert)initWithItem:(id)a3 payloadIdentifier:(id)a4 options:(id)a5 title:(id)a6 body:(id)a7;
- (SBActivityItem)item;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_playSound;
- (void)setProminent:(BOOL)a3;
@end

@implementation SBActivityAlert

- (SBActivityAlert)initWithItem:(id)a3 payloadIdentifier:(id)a4 options:(id)a5 title:(id)a6 body:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBActivityAlert;
  v17 = [(SBActivityAlert *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_item, a3);
    objc_storeStrong((id *)&v18->_payloadIdentifier, a4);
    objc_storeStrong((id *)&v18->_options, a5);
    objc_storeStrong((id *)&v18->_title, a6);
    objc_storeStrong((id *)&v18->_body, a7);
  }

  return v18;
}

- (SBActivityAlert)alertWithScreenOn:(BOOL)a3 playSound:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  v7 = [(SBActivityItem *)self->_item identifier];
  if (v4)
  {
    v8 = SBLogActivity();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] alerting with sound", buf, 0xCu);
    }

    [(SBActivityAlert *)self _playSound];
  }
  if (v5)
  {
    v9 = SBLogActivity();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Turn on screen", buf, 0xCu);
    }

    v10 = +[SBLockScreenManager sharedInstance];
    id v13 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
    uint64_t v14 = MEMORY[0x1E4F1CC38];
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v10 unlockUIFromSource:36 withOptions:v11];
  }
  return result;
}

- (BOOL)canPresentInEnvironment:(int64_t)a3 alertType:(int64_t)a4
{
  BSDispatchQueueAssertMain();
  switch(a4)
  {
    case 0:
      BOOL result = [(SBActivityAlert *)self canPresentAlertTypeNoneInEnvironment:a3];
      break;
    case 1:
    case 2:
      BOOL result = [(SBActivityAlert *)self canPresentAlertTypeBannerOrSystemApertureInEnvironment:a3];
      break;
    case 3:
      BOOL result = [(SBActivityAlert *)self canPresentAlertTypeAmbientInEnvironment:a3];
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (BOOL)canPresentAlertTypeNoneInEnvironment:(int64_t)a3
{
  return a3
      || -[SBActivityAlert canPresentAlertTypeBannerOrSystemApertureInEnvironment:](self, "canPresentAlertTypeBannerOrSystemApertureInEnvironment:");
}

- (BOOL)canPresentAlertTypeAmbientInEnvironment:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)canPresentAlertTypeBannerOrSystemApertureInEnvironment:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v5 = +[SBLiveActivityDomain rootSettings];
    int v6 = [v5 allowAlertsOnHostApp];

    v7 = [(SBActivityAlert *)self item];
    v8 = [v7 descriptor];
    v9 = [v8 presentationOptions];
    int v10 = [v9 shouldSuppressAlertContentOnLockScreen];

    v11 = +[SBCoverSheetPresentationManager sharedInstance];
    int v12 = [v11 isPresented];

    if (v6)
    {
      BOOL v13 = 0;
      int v14 = v10 & v12;
    }
    else
    {
      BOOL v13 = [(SBActivityAlert *)self _isHostApplicationForeground];
      int v14 = v13 | v10 & v12;
    }
    int v3 = v14 ^ 1;
    id v15 = SBLogActivity();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(SBActivityItem *)self->_item identifier];
      int v18 = 138544642;
      v19 = v16;
      __int16 v20 = 1024;
      int v21 = v3;
      __int16 v22 = 1024;
      BOOL v23 = v13;
      __int16 v24 = 1024;
      int v25 = v12;
      __int16 v26 = 1024;
      int v27 = v10 ^ 1;
      __int16 v28 = 1024;
      int v29 = v6;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] can present alert: %d,  isHostApplicationForeground: %d, isCoverSheetVisible: %d, allowAlertsOnCoverSheet: %d, allowAlertsOnHostApp: %d", (uint8_t *)&v18, 0x2Au);
    }
  }
  return v3;
}

- (BOOL)shouldAlertInEnvironment:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  BOOL v5 = [(SBActivityAlert *)self _hasPresentationDestination:3];
  BOOL v6 = [(SBActivityAlert *)self _hasPresentationDestination:1];
  BOOL v7 = [(SBActivityAlert *)self _hasPresentationDestination:0];
  int v8 = (v6 || v7) | [(SBActivityAlert *)self _hasPresentationDestination:2];
  if (a3) {
    LOBYTE(v8) = 0;
  }
  if (a3 == 1) {
    return v5;
  }
  else {
    return v8;
  }
}

- (BOOL)_hasPresentationDestination:(int64_t)a3
{
  BOOL v4 = [(SBActivityAlert *)self item];
  BOOL v5 = [v4 descriptor];

  BOOL v6 = [v5 presentationOptions];
  BOOL v7 = [v6 destinations];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SBActivityAlert__hasPresentationDestination___block_invoke;
  v9[3] = &__block_descriptor_40_e43_B16__0__ACActivityPresentationDestination_8l;
  v9[4] = a3;
  LOBYTE(a3) = objc_msgSend(v7, "bs_containsObjectPassingTest:", v9);

  return a3;
}

BOOL __47__SBActivityAlert__hasPresentationDestination___block_invoke(uint64_t a1, void *a2)
{
  return [a2 destination] == *(void *)(a1 + 32);
}

- (void)_playSound
{
  uint64_t v2 = [(ACUISActivityAlertOptions *)self->_options alertConfiguration];
  if (!v2) {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4FAF5E8]) initWithType:16];
  }
  id v7 = (id)v2;
  id v3 = objc_alloc(MEMORY[0x1E4FA79C8]);
  BOOL v4 = [MEMORY[0x1E4FAF5E0] alertWithConfiguration:v7];
  BOOL v5 = (void *)[v3 initWithToneAlert:v4];

  BOOL v6 = +[SBSoundController sharedInstance];
  [v6 playSoundWithDefaultEnvironment:v5];
}

- (BOOL)_isHostApplicationForeground
{
  BSDispatchQueueAssertMain();
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v3 = [(SBActivityItem *)self->_item descriptor];
  BOOL v4 = [v3 platterTargetBundleIdentifier];
  BOOL v5 = [(id)SBApp windowSceneManager];
  BOOL v6 = [v5 activeDisplayWindowScene];

  id v7 = [v6 switcherController];
  int v8 = [v7 switcherCoordinator];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__SBActivityAlert__isHostApplicationForeground__block_invoke;
  v11[3] = &unk_1E6AFC258;
  id v9 = v4;
  id v12 = v9;
  BOOL v13 = &v14;
  [v8 enumerateSwitcherControllersWithBlock:v11];

  LOBYTE(v7) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v7;
}

void __47__SBActivityAlert__isHostApplicationForeground__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = objc_msgSend(a2, "layoutStateApplicationSceneHandles", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) application];
        v11 = [v10 bundleIdentifier];
        int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

        if (v12)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          *a3 = 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)SBActivityAlert;
  id v3 = [(SBActivityAlert *)&v6 description];
  BOOL v4 = [(SBActivityAlert *)self descriptionWithMultilinePrefix:v3];

  return (NSString *)v4;
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBActivityAlert *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBActivityAlert *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(SBActivityAlert *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_item withName:@"item"];
  id v6 = (id)[v4 appendObject:self->_payloadIdentifier withName:@"payloadIdentifier"];
  id v7 = (id)[v4 appendObject:self->_options withName:@"options"];
  return v4;
}

- (SBActivityItem)item
{
  return self->_item;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (ACUISActivityAlertOptions)options
{
  return self->_options;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (void)setProminent:(BOOL)a3
{
  self->_prominent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end