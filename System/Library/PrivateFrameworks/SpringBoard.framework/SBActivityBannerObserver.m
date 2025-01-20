@interface SBActivityBannerObserver
- (BOOL)_isActivityOngoing:(id)a3;
- (BOOL)_isBundleIdentifierSuppressed:(id)a3;
- (BOOL)_shouldSuppressPresentationForActivityIdentifier:(id)a3;
- (BOOL)shouldHandleActivityItem:(id)a3;
- (NSMutableDictionary)bannerPresentableByActivityIdentifier;
- (NSMutableDictionary)itemByActivityIdentifier;
- (NSMutableSet)prominentAlertPresentingActivities;
- (SBActivityBannerObserver)init;
- (int64_t)activityEnvironment;
- (void)_dismissBannerWithActivityIdentifier:(id)a3;
- (void)_handleActivityAlert:(id)a3 present:(BOOL)a4;
- (void)_handleProminentActivityAlert:(id)a3 prominent:(BOOL)a4;
- (void)_postBannerWithActivityIdentifier:(id)a3 payloadIdentifier:(id)a4 prominent:(BOOL)a5 completion:(id)a6;
- (void)_sendAnalyticsEventWithPayloadBuilder:(id)a3;
- (void)activityBannerDidDisappear:(id)a3 activityIdentifier:(id)a4;
- (void)activityBannerWantsToBeDismissed:(id)a3 activityIdentifier:(id)a4;
- (void)activityBannerWillDisappear:(id)a3 activityIdentifier:(id)a4;
- (void)activityDidDismiss:(id)a3;
- (void)activityDidEnd:(id)a3;
- (void)activityDidStart:(id)a3;
- (void)activityEnvironmentChanged:(int64_t)a3;
- (void)activityProminenceChanged:(BOOL)a3 item:(id)a4;
- (void)dealloc;
- (void)dismissAlert:(id)a3;
- (void)presentAlert:(id)a3;
- (void)setActivityEnvironment:(int64_t)a3;
- (void)setBannerPresentableByActivityIdentifier:(id)a3;
- (void)setItemByActivityIdentifier:(id)a3;
- (void)setProminentAlertPresentingActivities:(id)a3;
@end

@implementation SBActivityBannerObserver

- (SBActivityBannerObserver)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBActivityBannerObserver;
  v2 = [(SBActivityBannerObserver *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    prominentAlertPresentingActivities = v2->_prominentAlertPresentingActivities;
    v2->_prominentAlertPresentingActivities = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    itemByActivityIdentifier = v2->_itemByActivityIdentifier;
    v2->_itemByActivityIdentifier = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    bannerPresentableByActivityIdentifier = v2->_bannerPresentableByActivityIdentifier;
    v2->_bannerPresentableByActivityIdentifier = (NSMutableDictionary *)v7;

    v2->_activityEnvironment = 0;
  }
  return v2;
}

- (void)dealloc
{
  prominentAlertPresentingActivities = self->_prominentAlertPresentingActivities;
  self->_prominentAlertPresentingActivities = 0;

  itemByActivityIdentifier = self->_itemByActivityIdentifier;
  self->_itemByActivityIdentifier = 0;

  bannerPresentableByActivityIdentifier = self->_bannerPresentableByActivityIdentifier;
  self->_bannerPresentableByActivityIdentifier = 0;

  v6.receiver = self;
  v6.super_class = (Class)SBActivityBannerObserver;
  [(SBActivityBannerObserver *)&v6 dealloc];
}

- (void)activityDidStart:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  [(NSMutableDictionary *)self->_itemByActivityIdentifier setObject:v4 forKey:v5];
}

- (void)activityDidEnd:(id)a3
{
  id v4 = [a3 identifier];
  [(SBActivityBannerObserver *)self _dismissBannerWithActivityIdentifier:v4];
  [(NSMutableDictionary *)self->_itemByActivityIdentifier removeObjectForKey:v4];
}

- (void)activityDidDismiss:(id)a3
{
  id v4 = [a3 identifier];
  [(SBActivityBannerObserver *)self _dismissBannerWithActivityIdentifier:v4];
  [(NSMutableDictionary *)self->_itemByActivityIdentifier removeObjectForKey:v4];
}

- (BOOL)shouldHandleActivityItem:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = [a3 descriptor];
  id v4 = [v3 presentationOptions];
  id v5 = [v4 destinations];
  int v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_333);

  if ([v4 isActionButtonInitiated] && (SBSIsSystemApertureAvailable() & 1) == 0)
  {
    uint64_t v7 = [v4 destinations];
    v6 |= objc_msgSend(v7, "bs_containsObjectPassingTest:", &__block_literal_global_9_4);
  }
  v8 = +[SBLiveActivityDomain rootSettings];
  char v9 = [v8 disableActivityAlertsAsBanners];

  char v10 = v6 & ~v9;
  return v10;
}

BOOL __53__SBActivityBannerObserver_shouldHandleActivityItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 destination] == 1;
}

BOOL __53__SBActivityBannerObserver_shouldHandleActivityItem___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 destination] == 2;
}

- (void)presentAlert:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (SBUIIsSystemApertureEnabled())
  {
    char v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"SBUIIsSystemApertureEnabled() == false"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBActivityBannerObserver *)a2 presentAlert:(uint64_t)v9];
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8D277A8);
  }
  if ([v5 canPresentInEnvironment:self->_activityEnvironment alertType:1])
  {
    [(SBActivityBannerObserver *)self _handleActivityAlert:v5 present:1];
  }
  else
  {
    int v6 = SBLogActivity();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 item];
      v8 = [v7 identifier];
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Not presenting activity alert because activity environment is ambient or lock screen is visible", buf, 0xCu);
    }
  }
}

- (void)dismissAlert:(id)a3
{
  id v6 = a3;
  if (SBUIIsSystemApertureEnabled())
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"SBUIIsSystemApertureEnabled() == false"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBActivityBannerObserver *)a2 dismissAlert:(uint64_t)v5];
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    [(SBActivityBannerObserver *)self _handleActivityAlert:v6 present:0];
  }
}

- (void)activityProminenceChanged:(BOOL)a3 item:(id)a4
{
  BOOL v4 = a3;
  id v6 = [a4 identifier];
  [(SBActivityBannerObserver *)self _handleProminentActivityAlert:v6 prominent:v4];
}

- (void)activityEnvironmentChanged:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_activityEnvironment != a3)
  {
    self->_activityEnvironment = a3;
    if (a3 == 1)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      BOOL v4 = [(NSMutableDictionary *)self->_itemByActivityIdentifier allValues];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            char v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) identifier];
            [(SBActivityBannerObserver *)self _dismissBannerWithActivityIdentifier:v9];

            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }
    }
  }
}

- (BOOL)_isActivityOngoing:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [(NSMutableDictionary *)self->_itemByActivityIdentifier objectForKey:v4];

  return v5 != 0;
}

- (BOOL)_isBundleIdentifierSuppressed:(id)a3
{
  uint64_t v3 = (void *)SBApp;
  id v4 = a3;
  uint64_t v5 = [v3 windowSceneManager];
  uint64_t v6 = [v5 activeDisplayWindowScene];

  uint64_t v7 = [v6 zStackResolver];
  uint64_t v8 = [v7 settingsOfParticipantWithIdentifier:30];
  char v9 = [v8 associatedBundleIdentifiersToSuppressInSystemAperture];
  char v10 = [v9 containsObject:v4];

  return v10;
}

- (BOOL)_shouldSuppressPresentationForActivityIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBActivityBannerObserver *)self _isActivityOngoing:v4])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_itemByActivityIdentifier objectForKey:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 descriptor];
      uint64_t v8 = [v7 presentationOptions];
      char v9 = [v8 shouldSuppressAlertContentOnLockScreen] ^ 1;
    }
    else
    {
      char v9 = 0;
    }
    long long v11 = +[SBCoverSheetPresentationManager sharedInstance];
    int v12 = [v11 isPresented];

    if ((v9 & 1) != 0 || !v12)
    {
      v14 = [v6 descriptor];
      long long v13 = [v14 platterTargetBundleIdentifier];

      BOOL v10 = [(SBActivityBannerObserver *)self _isBundleIdentifierSuppressed:v13];
      if (v10)
      {
        uint64_t v15 = SBLogActivity();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138543362;
          id v18 = v4;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Not handling activity prominence update because activity bundle identifier is suppressed by existing content on display", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    else
    {
      long long v13 = SBLogActivity();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        id v18 = v4;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Not handling activity prominence update because activity has a lockscreen UI visible", (uint8_t *)&v17, 0xCu);
      }
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    uint64_t v6 = SBLogActivity();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] activity has ended, not handling prominence update", (uint8_t *)&v17, 0xCu);
    }
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)_handleProminentActivityAlert:(id)a3 prominent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssertMain();
  if (![(SBActivityBannerObserver *)self _shouldSuppressPresentationForActivityIdentifier:v6])
  {
    uint64_t v7 = SBLogActivity();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      id v10 = v6;
      __int16 v11 = 1024;
      BOOL v12 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] handling activity prominence: %d", (uint8_t *)&v9, 0x12u);
    }

    if (v4)
    {
      if (self->_activityEnvironment == 1)
      {
        uint64_t v8 = SBLogActivity();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[SBActivityBannerObserver _handleProminentActivityAlert:prominent:]((uint64_t)v6, v8);
        }
      }
      else
      {
        [(SBActivityBannerObserver *)self _postBannerWithActivityIdentifier:v6 payloadIdentifier:0 prominent:1 completion:0];
      }
    }
    else
    {
      [(NSMutableSet *)self->_prominentAlertPresentingActivities removeObject:v6];
      [(SBActivityBannerObserver *)self _dismissBannerWithActivityIdentifier:v6];
    }
  }
}

- (void)_handleActivityAlert:(id)a3 present:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v7 = [v6 item];
  uint64_t v8 = [v7 identifier];

  int v9 = [v6 payloadIdentifier];
  if (v4)
  {
    if ([(SBActivityBannerObserver *)self _isActivityOngoing:v8])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __57__SBActivityBannerObserver__handleActivityAlert_present___block_invoke;
      v11[3] = &unk_1E6AFC6D0;
      id v12 = v6;
      [(SBActivityBannerObserver *)self _postBannerWithActivityIdentifier:v8 payloadIdentifier:v9 prominent:0 completion:v11];
    }
    else
    {
      id v10 = SBLogActivity();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v8;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] activity has ended, not handling alert update", buf, 0xCu);
      }
    }
  }
  else
  {
    [(SBActivityBannerObserver *)self _dismissBannerWithActivityIdentifier:v8];
  }
}

uint64_t __57__SBActivityBannerObserver__handleActivityAlert_present___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) alertWithScreenOn:1 playSound:1];
  }
  return result;
}

- (void)_sendAnalyticsEventWithPayloadBuilder:(id)a3
{
}

- (void)_postBannerWithActivityIdentifier:(id)a3 payloadIdentifier:(id)a4 prominent:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BSDispatchQueueAssertMain();
  uint64_t v13 = [(NSMutableDictionary *)self->_itemByActivityIdentifier objectForKey:v10];
  v14 = [v13 descriptor];
  if (v14)
  {
    if (v7) {
      [(NSMutableSet *)self->_prominentAlertPresentingActivities addObject:v10];
    }
    uint64_t v15 = [(NSMutableDictionary *)self->_bannerPresentableByActivityIdentifier objectForKey:v10];

    if (v15)
    {
      v16 = SBLogActivity();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v26 = v10;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Already showing a banner", buf, 0xCu);
      }
    }
    else
    {
      [(SBActivityBannerObserver *)self _dismissBannerWithActivityIdentifier:v10];
      id v18 = [(SBActivityViewController *)[SBActivityBannerViewController alloc] initWithActivityItem:v13 sceneType:1 payloadID:v11];
      [(SBActivityBannerViewController *)v18 setBannerDelegate:self];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke;
      v19[3] = &unk_1E6B0AAD0;
      id v20 = v10;
      id v24 = v12;
      v21 = self;
      v22 = v18;
      id v23 = v14;
      v16 = v18;
      [v16 ensureContent:MEMORY[0x1E4F14428] queue:v19 completion:1.79769313e308];
    }
    goto LABEL_12;
  }
  int v17 = SBLogActivity();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SBActivityBannerObserver _postBannerWithActivityIdentifier:payloadIdentifier:prominent:completion:]((uint64_t)v10, v17);
  }

  if (v12)
  {
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBActivityBannerObserverErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, NSObject *))v12 + 2))(v12, v16);
LABEL_12:
  }
}

void __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BSDispatchQueueAssertMain();
  if (v3)
  {
    BOOL v4 = SBLogActivity();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_cold_2(a1);
    }

    uint64_t v5 = *(void *)(a1 + 64);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
  }
  else
  {
    id v6 = (uint64_t *)(a1 + 32);
    if ([*(id *)(a1 + 40) _isActivityOngoing:*(void *)(a1 + 32)])
    {
      BOOL v7 = [(id)SBApp bannerManager];
      uint64_t v8 = *(void *)(a1 + 48);
      id v21 = 0;
      char v9 = [v7 postPresentable:v8 withOptions:1 userInfo:0 error:&v21];
      id v10 = v21;

      id v11 = SBLogActivity();
      id v12 = v11;
      if (v9)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *v6;
          *(_DWORD *)buf = 138543362;
          uint64_t v23 = v13;
          _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] posted activity banner successfully", buf, 0xCu);
        }

        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_28;
        v18[3] = &unk_1E6AFFB58;
        v14 = *(void **)(a1 + 40);
        id v19 = *(id *)(a1 + 32);
        id v20 = *(id *)(a1 + 56);
        [v14 _sendAnalyticsEventWithPayloadBuilder:v18];
        [*(id *)(*(void *)(a1 + 40) + 24) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 32)];
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_cold_1((void *)(a1 + 32));
        }

        [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 32)];
      }
    }
    else
    {
      uint64_t v15 = SBLogActivity();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *v6;
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v16;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] activity has ended, not posting a banner", buf, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:*(void *)(a1 + 32)];
      [*(id *)(a1 + 48) invalidate];
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBActivityBannerObserverErrorDomain" code:2 userInfo:0];
    }
    uint64_t v17 = *(void *)(a1 + 64);
    if (v17) {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v10);
    }
  }
}

id __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_28(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v7[0] = v2;
  v6[0] = @"activityId";
  v6[1] = @"bundleId";
  id v3 = [v1 platterTargetBundleIdentifier];
  v6[2] = @"eventType";
  v7[1] = v3;
  v7[2] = @"alert-banner";
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (void)_dismissBannerWithActivityIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [(NSMutableDictionary *)self->_bannerPresentableByActivityIdentifier objectForKey:v4];
  if (v5)
  {
    if ([(NSMutableSet *)self->_prominentAlertPresentingActivities containsObject:v4])
    {
      id v6 = SBLogActivity();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v4;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Showing alert prominently, not dismissing it", buf, 0xCu);
      }
    }
    else
    {
      BOOL v7 = [(id)SBApp bannerManager];
      uint64_t v8 = [MEMORY[0x1E4F4F5E8] uniqueIdentificationForPresentable:v5];
      id v12 = 0;
      id v9 = (id)[v7 revokePresentablesWithIdentification:v8 reason:@"_SBActivityBannerRevocationReasonDismissed" options:0 userInfo:0 error:&v12];
      id v6 = v12;

      id v10 = SBLogActivity();
      id v11 = v10;
      if (v6)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[SBActivityBannerObserver _dismissBannerWithActivityIdentifier:]((uint64_t)v4);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v4;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dismissed the alert successfully", buf, 0xCu);
      }
    }
  }
}

- (void)activityBannerWillDisappear:(id)a3 activityIdentifier:(id)a4
{
}

- (void)activityBannerDidDisappear:(id)a3 activityIdentifier:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BSDispatchQueueAssertMain();
  id v6 = SBLogActivity();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Activity banner dismissed", (uint8_t *)&v7, 0xCu);
  }

  [(NSMutableDictionary *)self->_bannerPresentableByActivityIdentifier removeObjectForKey:v5];
  [(NSMutableSet *)self->_prominentAlertPresentingActivities removeObject:v5];
}

- (void)activityBannerWantsToBeDismissed:(id)a3 activityIdentifier:(id)a4
{
}

- (NSMutableSet)prominentAlertPresentingActivities
{
  return self->_prominentAlertPresentingActivities;
}

- (void)setProminentAlertPresentingActivities:(id)a3
{
}

- (NSMutableDictionary)itemByActivityIdentifier
{
  return self->_itemByActivityIdentifier;
}

- (void)setItemByActivityIdentifier:(id)a3
{
}

- (NSMutableDictionary)bannerPresentableByActivityIdentifier
{
  return self->_bannerPresentableByActivityIdentifier;
}

- (void)setBannerPresentableByActivityIdentifier:(id)a3
{
}

- (int64_t)activityEnvironment
{
  return self->_activityEnvironment;
}

- (void)setActivityEnvironment:(int64_t)a3
{
  self->_activityEnvironment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerPresentableByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_itemByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_prominentAlertPresentingActivities, 0);
}

- (void)presentAlert:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"SBActivityBannerObserver.m";
  __int16 v10 = 1024;
  int v11 = 163;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)dismissAlert:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"SBActivityBannerObserver.m";
  __int16 v10 = 1024;
  int v11 = 173;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_handleProminentActivityAlert:(uint64_t)a1 prominent:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "[ActivityID: %{public}@] Environment is ambient, banner alert can't become prominent", (uint8_t *)&v2, 0xCu);
}

- (void)_postBannerWithActivityIdentifier:(uint64_t)a1 payloadIdentifier:(NSObject *)a2 prominent:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "[ActivityID: %{public}@] No descriptor found", (uint8_t *)&v2, 0xCu);
}

void __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v1, v2, "[ActivityID: %{public}@] throws an error while posting activity banner: %{public}@", (void)v3, DWORD2(v3));
}

void __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v1, v2, "[ActivityID: %{public}@] throws an error while ensuring activity content: %{public}@", (void)v3, DWORD2(v3));
}

- (void)_dismissBannerWithActivityIdentifier:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v1, v2, "[ActivityID: %{public}@] throws an error while dismissing activity alert: %{public}@", (void)v3, DWORD2(v3));
}

@end