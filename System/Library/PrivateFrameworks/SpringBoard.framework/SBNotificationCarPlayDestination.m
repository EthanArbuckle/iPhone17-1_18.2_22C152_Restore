@interface SBNotificationCarPlayDestination
- (BOOL)_inCallOrFaceTime;
- (BOOL)_isCurrentlyAnnouncing;
- (BOOL)_notificationRequestShouldShowModalSubActions:(id)a3;
- (BOOL)_notificationRequestSupportsSubActions:(id)a3;
- (BOOL)_setSuspended:(BOOL)a3 forPresentingAlertControllerForPresentable:(id)a4;
- (BOOL)_shouldAnnounceNotificationForActiveAVSession:(id)a3;
- (BOOL)_shouldAnnounceNotificationRequest:(id)a3;
- (BOOL)_shouldDeferPostingNotificationRequestForAnnounce:(id)a3;
- (BOOL)isActive;
- (BOOL)isAlertDestination;
- (BOOL)presentableViewControllerClosesByDefault:(id)a3;
- (BSAbsoluteMachTimer)_announceTimeoutTimer;
- (BSServiceConnectionEndpoint)endpoint;
- (NCCarPlayBannerSource)_carPlayBannerSource;
- (NCNotificationAlertDestinationDelegate)delegate;
- (NCNotificationRequest)_notificationRequestCurrentlyAnnouncing;
- (NSString)identifier;
- (SBNCAlertingController)alertingController;
- (SBNotificationCarPlayDestination)init;
- (id)_actionForNotificationRequest:(id)a3;
- (id)_allNotificationActionsForNotificationRequest:(id)a3;
- (id)_announcementStateObserver;
- (id)_appPolicyEvaluator;
- (id)_bulletinForNotificationRequest:(id)a3;
- (id)_closeNotificationActionForNotificationRequest:(id)a3;
- (id)_ignoreActionForNotificationRequest:(id)a3;
- (id)_newPresentableForNotificationRequest:(id)a3 layoutDescription:(id)a4;
- (id)_notificationRequestForAnnounceWithIdentifier:(id)a3;
- (id)_policyForApp:(id)a3;
- (id)_presentablesWithRequestIdentifier:(id)a3;
- (id)_removePresentable:(id)a3;
- (id)_subActionLabelsForNotificationRequest:(id)a3;
- (id)_subActionsForNotificationRequest:(id)a3;
- (id)_supplementaryActionsForNotificationRequest:(id)a3;
- (id)keyWindowForScreen:(id)a3;
- (int64_t)_announceDeactivationReasonForBannerRevocationReason:(id)a3;
- (int64_t)_defaultActionTypeForNotificationRequest:(id)a3;
- (int64_t)_effectiveDefaultActionTypeForNotificationRequest:(id)a3;
- (void)_addPresentable:(id)a3;
- (void)_callOrFaceTimeStateChanged;
- (void)_cancelAnnounceForNotificationRequest:(id)a3 withReason:(int64_t)a4 deactivateAnnounce:(BOOL)a5;
- (void)_clearNotificationRequestPendingAnnounceDeactivationIfNecessary;
- (void)_flushAnnounceNotificationRequestsShouldAnnounce:(BOOL)a3;
- (void)_flushNotificationRequestsPendingAnnounce;
- (void)_invalidateAnnounceTimeoutTimer;
- (void)_modifyNotificationRequest:(id)a3 inStore:(id)a4;
- (void)_postNotificationRequest:(id)a3 shouldAnnounce:(BOOL)a4;
- (void)_queueNotificationRequestWhileAnnouncing:(id)a3;
- (void)_requestAnnounceForNotificationRequest:(id)a3;
- (void)_setAnnounceTimeoutTimer:(id)a3;
- (void)_setNotificationRequestCurrentlyAnnouncing:(id)a3;
- (void)_startAnnounceTimeoutTimer;
- (void)_voicePromptStyleChanged:(id)a3;
- (void)_withdrawNotificationRequest:(id)a3 inStore:(id)a4;
- (void)bannerHostDidBecomeAvailableForMonitorListener:(id)a3;
- (void)bannerHostDidBecomeUnavailableForMonitorListener:(id)a3;
- (void)dealloc;
- (void)didCancelBannerOfPresentableViewController:(id)a3 reason:(id)a4;
- (void)didSelectBannerOfPresentableViewController:(id)a3;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationAnnouncementObserver:(id)a3 announcementSpeakingStateDidUpdate:(int64_t)a4 forNotificationRequestIdentifiers:(id)a5;
- (void)postNotificationRequest:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)setAlertingController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)withdrawNotificationRequest:(id)a3;
@end

@implementation SBNotificationCarPlayDestination

- (BOOL)isActive
{
  return [(BNBannerHostMonitorListener *)self->_bannerHostMonitorListener isBannerHostAvailable];
}

- (SBNotificationCarPlayDestination)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBNotificationCarPlayDestination;
  v2 = [(SBNotificationCarPlayDestination *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4F5B0]);
    v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.CarPlayApp", 0);
    uint64_t v5 = [v3 initWithServiceDomain:@"com.apple.frontboard" authorizedBundleIDs:v4];
    bannerHostMonitorListener = v2->_bannerHostMonitorListener;
    v2->_bannerHostMonitorListener = (BNBannerHostMonitorListener *)v5;

    [(BNBannerHostMonitorListener *)v2->_bannerHostMonitorListener addObserver:v2];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__callOrFaceTimeStateChanged name:@"SBCallCountChangedNotification" object:0];
    [v7 addObserver:v2 selector:sel__callOrFaceTimeStateChanged name:@"SBFaceTimeStateChangedNotification" object:0];
    v8 = (void *)MEMORY[0x1E4F74EF8];
    v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F74EF8]];
    v10 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    [v10 setAttribute:v9 forKey:*MEMORY[0x1E4F74EA8] error:0];

    [v7 addObserver:v2 selector:sel__voicePromptStyleChanged_ name:*v8 object:0];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(BSAbsoluteMachTimer *)self->_announceTimeoutTimer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SBNotificationCarPlayDestination;
  [(SBNotificationCarPlayDestination *)&v4 dealloc];
}

- (id)keyWindowForScreen:(id)a3
{
  id v4 = a3;
  if ([(SBNotificationCarPlayDestination *)self isActive])
  {
    uint64_t v5 = [(SBNotificationCarPlayDestination *)self _carPlayBannerSource];
    v6 = [v5 keyWindowForScreen:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAlertDestination
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x1E4FB3850];
}

- (BSServiceConnectionEndpoint)endpoint
{
  return (BSServiceConnectionEndpoint *)[MEMORY[0x1E4F629E0] dashboardEndpoint];
}

- (void)postNotificationRequest:(id)a3
{
  id v4 = a3;
  [(SBNotificationCarPlayDestination *)self _postNotificationRequest:v4 shouldAnnounce:[(SBNotificationCarPlayDestination *)self _shouldAnnounceNotificationRequest:v4]];
}

- (void)_postNotificationRequest:(id)a3 shouldAnnounce:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 alertOptions];
    char v9 = [v8 shouldSuppress];

    if ((v9 & 1) == 0)
    {
      if ([(SBNotificationCarPlayDestination *)self _shouldDeferPostingNotificationRequestForAnnounce:v7])
      {
        [(SBNotificationCarPlayDestination *)self _queueNotificationRequestWhileAnnouncing:v7];
      }
      else
      {
        [(SBNotificationCarPlayDestination *)self _clearNotificationRequestPendingAnnounceDeactivationIfNecessary];
        if (![(SBNotificationCarPlayDestination *)self _isCurrentlyAnnouncing]
          || (-[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing"), v10 = objc_claimAutoreleasedReturnValue(), int v11 = [v10 matchesRequest:v7], v10, v11))
        {
          objc_super v12 = [(SBNotificationCarPlayDestination *)self _carPlayBannerSource];
          id v25 = 0;
          v13 = [v12 layoutDescriptionWithError:&v25];
          id v14 = v25;

          if (v13)
          {
            id v15 = [(SBNotificationCarPlayDestination *)self _newPresentableForNotificationRequest:v7 layoutDescription:v13];
            v16 = [(SBNotificationCarPlayDestination *)self _carPlayBannerSource];
            id v24 = 0;
            char v17 = [v16 postPresentable:v15 options:0 userInfo:0 error:&v24];
            id v18 = v24;

            if ((v17 & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
                -[SBNotificationCarPlayDestination _postNotificationRequest:shouldAnnounce:]();
              }
              id v19 = [(SBNotificationCarPlayDestination *)self _removePresentable:v15];
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
              -[SBNotificationCarPlayDestination _postNotificationRequest:shouldAnnounce:]();
            }
            id v18 = v14;
          }
        }
        if (v4)
        {
          uint64_t v20 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
          v21 = (void *)v20;
          if (v20) {
            v22 = (void *)v20;
          }
          else {
            v22 = v7;
          }
          [(SBNotificationCarPlayDestination *)self _setNotificationRequestCurrentlyAnnouncing:v22];

          [(SBNotificationCarPlayDestination *)self _requestAnnounceForNotificationRequest:v7];
        }
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__SBNotificationCarPlayDestination__postNotificationRequest_shouldAnnounce___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __76__SBNotificationCarPlayDestination__postNotificationRequest_shouldAnnounce___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 destinationDidBecomeReadyToReceiveNotifications:*(void *)(a1 + 32)];
}

- (void)modifyNotificationRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = objc_msgSend(v4, "carPlayRequestIdentifier", 0);
    v7 = [(SBNotificationCarPlayDestination *)self _presentablesWithRequestIdentifier:v6];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) updateRequestToInstance:v5];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(SBNotificationCarPlayDestination *)self _modifyNotificationRequest:v5 inStore:self->_notificationRequestsForAnnounce];
    [(SBNotificationCarPlayDestination *)self _modifyNotificationRequest:v5 inStore:self->_notificationRequestsPendingAnnounce];
  }
}

- (void)withdrawNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 carPlayRequestIdentifier];
    v7 = [(SBNotificationCarPlayDestination *)self _carPlayBannerSource];
    id v10 = 0;
    uint64_t v8 = [v7 revokePresentableWithRequestIdentifier:v6 reason:@"SBBannerRevocationReasonCarPlayDestinationExplicitDismissal" animated:1 userInfo:0 error:&v10];
    id v9 = v10;

    if (v8)
    {
      [(SBNotificationCarPlayDestination *)self _cancelAnnounceForNotificationRequest:v5 withReason:[(SBNotificationCarPlayDestination *)self _announceDeactivationReasonForBannerRevocationReason:@"SBBannerRevocationReasonCarPlayDestinationExplicitDismissal"] deactivateAnnounce:0];
      [(SBNotificationCarPlayDestination *)self _withdrawNotificationRequest:v5 inStore:self->_notificationRequestsPendingAnnounce];
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR))
    {
      -[SBNotificationCarPlayDestination withdrawNotificationRequest:]();
    }
  }
}

- (void)bannerHostDidBecomeAvailableForMonitorListener:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F64500], "sharedConfiguration", a3);
  uint64_t v5 = [v4 currentCountrySupportsCarIntegration];

  [(CRCarPlayAppPolicyEvaluator *)self->_appPolicyEvaluator setGeoSupported:v5];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBNotificationCarPlayDestinationAvailabilityDidChange" object:self];
}

- (void)bannerHostDidBecomeUnavailableForMonitorListener:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 postNotificationName:@"SBNotificationCarPlayDestinationAvailabilityDidChange" object:self];

  [(NCCarPlayBannerSource *)self->_carPlayBannerSource invalidate];
  carPlayBannerSource = self->_carPlayBannerSource;
  self->_carPlayBannerSource = 0;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 notificationRequest];

  id v10 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
  uint64_t v11 = [v9 matchesRequest:v10];

  long long v12 = [(SBNotificationCarPlayDestination *)self delegate];
  [v12 destination:self willPresentNotificationRequest:v9 suppressAlerts:v11];

  if ([(SBNotificationCarPlayDestination *)self _shouldAnnounceNotificationRequest:v9]&& ([(NSMutableArray *)self->_notificationRequestsForAnnounce containsObject:v9] & 1) == 0&& ([(NSMutableArray *)self->_notificationRequestsPendingAVSession containsObject:v9] & 1) == 0)
  {
    long long v13 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = v13;
      long long v15 = [v9 notificationIdentifier];
      v16 = objc_msgSend(v15, "un_logDigest");
      int v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "CarPlay requesting announce again for notification request %{public}@ on banner presentation", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v17 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
    id v18 = (void *)v17;
    if (v17) {
      id v19 = (void *)v17;
    }
    else {
      id v19 = v9;
    }
    [(SBNotificationCarPlayDestination *)self _setNotificationRequestCurrentlyAnnouncing:v19];

    [(SBNotificationCarPlayDestination *)self _requestAnnounceForNotificationRequest:v9];
  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v17 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v17;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [(SBNotificationCarPlayDestination *)self _removePresentable:v10];

  long long v12 = [v11 notificationRequest];
  if (([v7 isEqualToString:*MEMORY[0x1E4F57F30]] & 1) != 0
    || ([v7 isEqualToString:*MEMORY[0x1E4F57F38]] & 1) != 0
    || ([v7 isEqualToString:*MEMORY[0x1E4FB3878]] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x1E4FB3880]])
  {
    uint64_t v13 = [(SBNotificationCarPlayDestination *)self _ignoreActionForNotificationRequest:v12];
    long long v14 = (void *)v13;
    if (v13) {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
  }
  if (([v7 isEqualToString:@"SBBannerRevocationReasonCarPlayDestinationUserAction"] & 1) == 0) {
    [(SBNotificationCarPlayDestination *)self _cancelAnnounceForNotificationRequest:v12 withReason:[(SBNotificationCarPlayDestination *)self _announceDeactivationReasonForBannerRevocationReason:v7] deactivateAnnounce:1];
  }
  long long v15 = [v17 viewController];
  [v15 dismissViewControllerAnimated:1 completion:0];

  [(SBNotificationCarPlayDestination *)self _setSuspended:0 forPresentingAlertControllerForPresentable:v17];
  v16 = [(SBNotificationCarPlayDestination *)self delegate];
  [v16 destination:self didDismissNotificationRequest:v12];
}

- (BOOL)presentableViewControllerClosesByDefault:(id)a3
{
  id v4 = [a3 notificationRequest];
  LOBYTE(self) = [(SBNotificationCarPlayDestination *)self _effectiveDefaultActionTypeForNotificationRequest:v4] == 1;

  return (char)self;
}

- (void)didSelectBannerOfPresentableViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 notificationRequest];
  if ([(SBNotificationCarPlayDestination *)self _notificationRequestShouldShowModalSubActions:v5])
  {
    v31 = v4;
    [(SBNotificationCarPlayDestination *)self _setSuspended:1 forPresentingAlertControllerForPresentable:v4];
    id v6 = [(SBNotificationCarPlayDestination *)self _subActionLabelsForNotificationRequest:v5];
    id v7 = (void *)MEMORY[0x1E4F42728];
    uint64_t v8 = [v5 carPlayTitle];
    v30 = v5;
    id v9 = [v5 carPlayMessage];
    v33 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

    uint64_t v10 = [v6 count];
    id v32 = [(SBNotificationCarPlayDestination *)self _carPlayBannerSource];
    unint64_t v29 = v10;
    if (v10)
    {
      uint64_t v11 = 0;
      long long v12 = (char *)(v29 - 1);
      v28 = v42;
      uint64_t v13 = (char *)(v29 - 1);
      do
      {
        if (v29 <= 2) {
          long long v14 = v13;
        }
        else {
          long long v14 = v11;
        }
        long long v15 = v6;
        v16 = objc_msgSend(v6, "objectAtIndex:", v14, v28);
        id v17 = self;
        objc_initWeak(location, self);
        id v18 = (void *)MEMORY[0x1E4F42720];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v42[0] = __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke;
        v42[1] = &unk_1E6B0A910;
        objc_copyWeak(v46, location);
        id v43 = v30;
        v46[1] = v14;
        id v44 = v32;
        id v45 = v31;
        id v19 = [v18 actionWithTitle:v16 style:v14 == v12 handler:v41];
        [v33 addAction:v19];
        if (v14 == v12) {
          [v33 setPreferredAction:v19];
        }

        objc_destroyWeak(v46);
        objc_destroyWeak(location);

        ++v11;
        --v13;
        id v6 = v15;
        self = v17;
      }
      while (v13 != (char *)-1);
    }
    id v4 = v31;
    int v20 = [v31 parentViewController];
    if (objc_opt_respondsToSelector())
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_98;
      v38[3] = &unk_1E6AF5290;
      id v39 = v32;
      id v40 = v31;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_2;
      v35[3] = &unk_1E6AF5290;
      id v36 = v40;
      id v37 = v33;
      [v20 performCoordinatedUpdate:v38 updateResponseHandler:v35];
    }
    uint64_t v5 = v30;
  }
  else
  {
    v21 = [v4 notificationRequest];
    id v6 = [(SBNotificationCarPlayDestination *)self _actionForNotificationRequest:v21];

    if (v6) {
      v6[2](v6);
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F4F5B8];
    v23 = [MEMORY[0x1E4FB38C0] requesterIdentifier];
    id v24 = [v22 bannerSourceForDestination:1 forRequesterIdentifier:v23];

    id v25 = [v4 requestIdentifier];
    v33 = v24;
    id v34 = 0;
    v26 = [v24 revokePresentableWithRequestIdentifier:v25 reason:@"SBBannerRevocationReasonCarPlayDestinationUserAction" animated:1 userInfo:0 error:&v34];
    id v32 = v34;

    if (!v26)
    {
      v27 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
        [(SBNotificationCarPlayDestination *)v27 didSelectBannerOfPresentableViewController:(uint64_t)v32];
      }
    }
  }
}

void __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained _subActionsForNotificationRequest:*(void *)(a1 + 32)];
  id v4 = [v3 objectAtIndexedSubscript:*(void *)(a1 + 64)];

  if (v4) {
    v4[2](v4);
  }
  id v6 = *(void **)(a1 + 48);
  uint64_t v5 = (void **)(a1 + 48);
  id v7 = *(v5 - 1);
  uint64_t v8 = [v6 requestIdentifier];
  id v12 = 0;
  id v9 = [v7 revokePresentableWithRequestIdentifier:v8 reason:@"SBBannerRevocationReasonCarPlayDestinationUserAction" animated:1 userInfo:0 error:&v12];
  id v10 = v12;

  if (!v9)
  {
    uint64_t v11 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_cold_1(v5, v11);
    }
  }
  [WeakRetained _setSuspended:0 forPresentingAlertControllerForPresentable:*v5];
}

void __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_98(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) layoutDescriptionWithError:0];
  [*(id *)(a1 + 40) setFillsContainer:1];
  id v2 = [*(id *)(a1 + 40) view];
  [v2 setHidden:1];

  id v3 = *(void **)(a1 + 40);
  [v10 presentationSize];
  double v5 = v4;
  double v7 = v6;
  [v10 containerSize];
  objc_msgSend(v3, "preferredContentSizeWithPresentationSize:containerSize:", v5, v7, v8, v9);
}

void __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_3;
  v2[3] = &unk_1E6AF5290;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)didCancelBannerOfPresentableViewController:(id)a3 reason:(id)a4
{
  id v5 = a3;
  double v6 = (void *)MEMORY[0x1E4F4F5B8];
  double v7 = (void *)MEMORY[0x1E4FB38C0];
  id v8 = a4;
  double v9 = [v7 requesterIdentifier];
  id v10 = [v6 bannerSourceForDestination:1 forRequesterIdentifier:v9];

  uint64_t v11 = [v5 requestIdentifier];
  id v15 = 0;
  id v12 = [v10 revokePresentableWithRequestIdentifier:v11 reason:v8 animated:1 userInfo:0 error:&v15];

  id v13 = v15;
  if (!v12)
  {
    long long v14 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      -[SBNotificationCarPlayDestination didCancelBannerOfPresentableViewController:reason:](v14, v5);
    }
  }
}

- (NCCarPlayBannerSource)_carPlayBannerSource
{
  carPlayBannerSource = self->_carPlayBannerSource;
  if (!carPlayBannerSource)
  {
    id v4 = (NCCarPlayBannerSource *)objc_alloc_init(MEMORY[0x1E4FB38C8]);
    id v5 = self->_carPlayBannerSource;
    self->_carPlayBannerSource = v4;

    carPlayBannerSource = self->_carPlayBannerSource;
  }
  return carPlayBannerSource;
}

- (id)_newPresentableForNotificationRequest:(id)a3 layoutDescription:(id)a4
{
  double v6 = (objc_class *)MEMORY[0x1E4FB38C0];
  id v7 = a4;
  id v8 = a3;
  double v9 = (void *)[[v6 alloc] initWithNotificationRequest:v8];

  [(SBNotificationCarPlayDestination *)self _addPresentable:v9];
  [v9 setDelegate:self];
  [v9 addPresentableObserver:self];
  [v7 presentationSize];
  double v11 = v10;
  double v13 = v12;
  [v7 containerSize];
  double v15 = v14;
  double v17 = v16;

  objc_msgSend(v9, "preferredContentSizeWithPresentationSize:containerSize:", v11, v13, v15, v17);
  objc_msgSend(v9, "setPreferredContentSize:");
  return v9;
}

- (void)_addPresentable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    presentables = v5->_presentables;
    if (!presentables)
    {
      uint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      id v8 = v5->_presentables;
      v5->_presentables = (NSHashTable *)v7;

      presentables = v5->_presentables;
    }
    [(NSHashTable *)presentables addObject:v9];
    objc_sync_exit(v5);

    id v4 = v9;
  }
}

- (id)_presentablesWithRequestIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = v5->_presentables;
    uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          double v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          double v12 = objc_msgSend(v11, "requestIdentifier", (void)v18);
          int v13 = [v12 isEqualToString:v4];

          if (v13) {
            [v6 addObject:v11];
          }
        }
        uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    id v14 = v6;
    if (![v14 count] && os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      -[SBNotificationCarPlayDestination _presentablesWithRequestIdentifier:]();
    }

    objc_sync_exit(v5);
  }
  else
  {
    id v14 = 0;
  }
  if (v14) {
    double v15 = v14;
  }
  else {
    double v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v16 = v15;

  return v16;
}

- (id)_removePresentable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    if ([(NSHashTable *)v5->_presentables containsObject:v4])
    {
      [(NSHashTable *)v5->_presentables removeObject:v4];
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR))
    {
      -[SBNotificationCarPlayDestination _removePresentable:]();
    }
    objc_sync_exit(v5);
  }
  return v4;
}

- (id)_appPolicyEvaluator
{
  appPolicyEvaluator = self->_appPolicyEvaluator;
  if (!appPolicyEvaluator)
  {
    id v4 = (CRCarPlayAppPolicyEvaluator *)objc_alloc_init(MEMORY[0x1E4F57EF8]);
    id v5 = self->_appPolicyEvaluator;
    self->_appPolicyEvaluator = v4;

    [(CRCarPlayAppPolicyEvaluator *)self->_appPolicyEvaluator setGeoSupported:1];
    appPolicyEvaluator = self->_appPolicyEvaluator;
  }
  return appPolicyEvaluator;
}

- (id)_policyForApp:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    double v12 = [NSString stringWithUTF8String:"-[SBNotificationCarPlayDestination _policyForApp:]"];
    [v11 handleFailureInFunction:v12 file:@"SBNotificationCarPlayDestination.m" lineNumber:404 description:@"this call must be made on the main thread"];
  }
  id v5 = [v4 info];
  id v6 = [v5 carPlayDeclaration];
  if (v6)
  {
    uint64_t v7 = [v5 bundleIdentifier];
    uint64_t v8 = [(NSMutableDictionary *)self->_appPolicyForBundleID objectForKey:v7];
    if (!v8)
    {
      uint64_t v9 = [(SBNotificationCarPlayDestination *)self _appPolicyEvaluator];
      uint64_t v8 = [v9 effectivePolicyForAppDeclaration:v6];

      if (v8) {
        [(NSMutableDictionary *)self->_appPolicyForBundleID setObject:v8 forKey:v7];
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (int64_t)_defaultActionTypeForNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sectionIdentifier];
  id v6 = +[SBApplicationController sharedInstance];
  uint64_t v7 = [v6 applicationWithBundleIdentifier:v5];

  uint64_t v8 = [(SBNotificationCarPlayDestination *)self _policyForApp:v7];
  uint64_t v9 = [v4 content];
  double v10 = [v9 contentType];

  if ([v8 bannerLaunchTypeForNotificationContentType:v10] == 1
    || ([v4 options],
        double v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 lauchUsingSiriForCarPlayDefaultAction],
        v11,
        (v12 & 1) != 0))
  {
    int64_t v13 = 2;
  }
  else
  {
    int64_t v13 = 0;
    if (([v8 canDisplayOnCarScreen] & 1) == 0)
    {
      id v14 = [(SBNotificationCarPlayDestination *)self _supplementaryActionsForNotificationRequest:v4];
      uint64_t v15 = [v14 count];

      if (!v15) {
        int64_t v13 = 1;
      }
    }
  }

  return v13;
}

- (int64_t)_effectiveDefaultActionTypeForNotificationRequest:(id)a3
{
  int64_t v4 = [(SBNotificationCarPlayDestination *)self _defaultActionTypeForNotificationRequest:a3];
  if ([(SBNotificationCarPlayDestination *)self _inCallOrFaceTime] && v4 == 2) {
    return 1;
  }
  else {
    return v4;
  }
}

- (id)_actionForNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SBNotificationCarPlayDestination *)self delegate];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__SBNotificationCarPlayDestination__actionForNotificationRequest___block_invoke;
  v11[3] = &unk_1E6AFD828;
  v11[4] = self;
  id v12 = v4;
  id v13 = v5;
  id v6 = v5;
  id v7 = v4;
  uint64_t v8 = (void *)MEMORY[0x1D948C7A0](v11);
  uint64_t v9 = (void *)[v8 copy];

  return v9;
}

uint64_t __66__SBNotificationCarPlayDestination__actionForNotificationRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _effectiveDefaultActionTypeForNotificationRequest:*(void *)(a1 + 40)];
  switch(v2)
  {
    case 0:
      uint64_t v8 = *(void **)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
      id v4 = [*(id *)(a1 + 40) defaultAction];
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = MEMORY[0x1E4F1CC08];
      id v12 = v8;
      uint64_t v13 = v9;
      id v14 = v4;
      uint64_t v15 = 1;
LABEL_7:
      [v12 destination:v13 executeAction:v14 forNotificationRequest:v10 requestAuthentication:v15 withParameters:v11 completion:0];
      goto LABEL_8;
    case 1:
      id v16 = *(void **)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 32);
      id v4 = [*(id *)(a1 + 40) closeAction];
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = MEMORY[0x1E4F1CC08];
      id v12 = v16;
      uint64_t v13 = v17;
      id v14 = v4;
      uint64_t v15 = 0;
      goto LABEL_7;
    case 2:
      id v3 = [*(id *)(a1 + 32) alertingController];
      [v3 killAlertsForNotificationRequest:*(void *)(a1 + 40)];

      id v4 = objc_opt_new();
      id v5 = objc_alloc(MEMORY[0x1E4F9F948]);
      id v6 = [*(id *)(a1 + 32) _bulletinForNotificationRequest:*(void *)(a1 + 40)];
      id v7 = (void *)[v5 initWithBBBulletin:v6];
      [v4 activateWithContext:v7];

LABEL_8:
      break;
  }
  return 1;
}

- (id)_ignoreActionForNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SBNotificationCarPlayDestination *)self delegate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBNotificationCarPlayDestination__ignoreActionForNotificationRequest___block_invoke;
  v10[3] = &unk_1E6AFD828;
  id v11 = v5;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = (void *)[v10 copy];

  return v8;
}

uint64_t __72__SBNotificationCarPlayDestination__ignoreActionForNotificationRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) silenceAction];
  [v2 destination:v3 executeAction:v4 forNotificationRequest:*(void *)(a1 + 48) requestAuthentication:0 withParameters:MEMORY[0x1E4F1CC08] completion:0];

  return 1;
}

- (id)_supplementaryActionsForNotificationRequest:(id)a3
{
  uint64_t v3 = [a3 supplementaryActions];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4FB3740]];

  return v4;
}

- (id)_closeNotificationActionForNotificationRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 options];
  if ([v4 hideCloseActionForCarPlay])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 closeAction];
  }

  return v5;
}

- (id)_allNotificationActionsForNotificationRequest:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(SBNotificationCarPlayDestination *)self _supplementaryActionsForNotificationRequest:v5];
  [v6 addObjectsFromArray:v7];
  uint64_t v8 = [(SBNotificationCarPlayDestination *)self _closeNotificationActionForNotificationRequest:v5];

  objc_msgSend(v6, "bs_safeAddObject:", v8);
  return v6;
}

- (BOOL)_notificationRequestSupportsSubActions:(id)a3
{
  id v4 = a3;
  if ([(SBNotificationCarPlayDestination *)self _defaultActionTypeForNotificationRequest:v4] == 2)
  {
    char v5 = 0;
  }
  else
  {
    id v6 = [v4 options];
    char v5 = [v6 allowActionsForCarPlay];
  }
  return v5;
}

- (BOOL)_notificationRequestShouldShowModalSubActions:(id)a3
{
  id v4 = a3;
  if ([(SBNotificationCarPlayDestination *)self _notificationRequestSupportsSubActions:v4])
  {
    char v5 = [(SBNotificationCarPlayDestination *)self _supplementaryActionsForNotificationRequest:v4];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_subActionLabelsForNotificationRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBNotificationCarPlayDestination *)self _notificationRequestSupportsSubActions:v4])
  {
    char v5 = [MEMORY[0x1E4F1CA48] array];
    BOOL v6 = [(SBNotificationCarPlayDestination *)self _supplementaryActionsForNotificationRequest:v4];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) title];
          if ([v11 length]) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    id v12 = [(SBNotificationCarPlayDestination *)self _closeNotificationActionForNotificationRequest:v4];
    if (v12)
    {
      id v13 = [MEMORY[0x1E4F28B50] mainBundle];
      id v14 = [v13 localizedStringForKey:@"BANNER_ALERT_CLOSE" value:&stru_1F3084718 table:@"CarDisplay"];
      [v5 addObject:v14];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_subActionsForNotificationRequest:(id)a3
{
  id v4 = a3;
  if ([(SBNotificationCarPlayDestination *)self _notificationRequestSupportsSubActions:v4])
  {
    objc_initWeak(&location, self);
    char v5 = [(SBNotificationCarPlayDestination *)self _allNotificationActionsForNotificationRequest:v4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__SBNotificationCarPlayDestination__subActionsForNotificationRequest___block_invoke;
    v8[3] = &unk_1E6B0A960;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    BOOL v6 = objc_msgSend(v5, "bs_map:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

id __70__SBNotificationCarPlayDestination__subActionsForNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SBNotificationCarPlayDestination__subActionsForNotificationRequest___block_invoke_2;
  v7[3] = &unk_1E6B0A938;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v4 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  char v5 = (void *)[v7 copy];

  objc_destroyWeak(&v10);
  return v5;
}

uint64_t __70__SBNotificationCarPlayDestination__subActionsForNotificationRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained delegate];
  [v3 destination:WeakRetained executeAction:*(void *)(a1 + 32) forNotificationRequest:*(void *)(a1 + 40) requestAuthentication:1 withParameters:MEMORY[0x1E4F1CC08] completion:0];

  return 1;
}

- (BOOL)_inCallOrFaceTime
{
  uint64_t v2 = +[SBTelephonyManager sharedTelephonyManager];
  if ([v2 inCall])
  {
    char v3 = 1;
  }
  else
  {
    id v4 = +[SBConferenceManager sharedInstance];
    char v3 = [v4 inFaceTime];
  }
  return v3;
}

- (void)_callOrFaceTimeStateChanged
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_presentables;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "invalidateDisplayProperties", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_bulletinForNotificationRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bulletin];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F50CB8]);
    uint64_t v5 = [v3 sectionIdentifier];
    [v4 setSectionID:v5];

    uint64_t v6 = [v3 carPlayTitle];
    [v4 setTitle:v6];

    long long v7 = [v3 carPlayMessage];
    [v4 setMessage:v7];
  }
  return v4;
}

- (BOOL)_setSuspended:(BOOL)a3 forPresentingAlertControllerForPresentable:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  long long v7 = [(SBNotificationCarPlayDestination *)self _carPlayBannerSource];
  uint64_t v8 = *MEMORY[0x1E4FB3890];
  id v17 = 0;
  int v9 = [v7 setSuspended:v4 forReason:v8 revokingCurrent:0 error:&v17];
  id v10 = v17;

  if (v9)
  {
    p_presentablePresentingAlertController = &self->_presentablePresentingAlertController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentablePresentingAlertController);
    id v13 = WeakRetained;
    id v14 = v6;
    if (!v4)
    {
      if (WeakRetained != v6)
      {
LABEL_6:

        goto LABEL_9;
      }
      id v14 = 0;
    }
    objc_storeWeak((id *)p_presentablePresentingAlertController, v14);
    goto LABEL_6;
  }
  uint64_t v15 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
    -[SBNotificationCarPlayDestination _setSuspended:forPresentingAlertControllerForPresentable:](v4, (uint64_t)v10, v15);
  }
LABEL_9:

  return v9;
}

- (void)notificationAnnouncementObserver:(id)a3 announcementSpeakingStateDidUpdate:(int64_t)a4 forNotificationRequestIdentifiers:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = objc_msgSend(v7, "bs_compactMap:", &__block_literal_global_332);
  int v9 = (os_log_t *)MEMORY[0x1E4FB3750];
  id v10 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    uint64_t v12 = AFSiriUserNotificationAnnouncementSpeakingStateGetName();
    *(_DWORD *)buf = 138543618;
    v75 = v12;
    __int16 v76 = 2114;
    v77 = v8;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "CarPlay received updated announce state:%{public}@ for requests %{public}@", buf, 0x16u);
  }
  if (a4 == 2)
  {
    id v14 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
    v30 = [(SBNotificationCarPlayDestination *)self _carPlayBannerSource];
    [v30 didFinishAnnounceForNotificationRequest:v14];

    if ((unint64_t)[(NSMutableArray *)self->_notificationRequestsForAnnounce count] < 2)
    {
      v54 = [(SBNotificationCarPlayDestination *)self _announcementStateObserver];
      v55 = [v7 firstObject];
      [v54 stopObservingNotificationWithRequestIdentifier:v55];

      os_log_t v56 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v57 = v56;
        v58 = [v14 notificationIdentifier];
        v59 = objc_msgSend(v58, "un_logDigest");
        *(_DWORD *)buf = 138543362;
        v75 = v59;
        _os_log_impl(&dword_1D85BA000, v57, OS_LOG_TYPE_DEFAULT, "Carplay setting up deferred announce deactivation for %{public}@ on announce finish since this is the last notification to be announced", buf, 0xCu);
      }
      objc_storeStrong((id *)&self->_notificationRequestPendingDeactivation, v14);
    }
    else
    {
      os_log_t log = v8;
      if (v14)
      {
        [(NSMutableArray *)self->_notificationRequestsForAnnounce removeObject:v14];
        [(NSMutableDictionary *)self->_announceRequestsForNotificationRequests removeObjectForKey:v14];
      }
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v31 = v7;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v69 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v68 + 1) + 8 * i);
            id v37 = [(SBNotificationCarPlayDestination *)self _announcementStateObserver];
            [v37 stopObservingNotificationWithRequestIdentifier:v36];

            v38 = [(SBNotificationCarPlayDestination *)self _notificationRequestForAnnounceWithIdentifier:v36];
            if (v38)
            {
              [(NSMutableArray *)self->_notificationRequestsForAnnounce removeObject:v38];
              [(NSMutableDictionary *)self->_announceRequestsForNotificationRequests removeObjectForKey:v38];
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v68 objects:v73 count:16];
        }
        while (v33);
      }

      if ([(NSMutableArray *)self->_notificationRequestsForAnnounce count])
      {
        os_log_t v39 = *v9;
        uint64_t v8 = log;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = v39;
          v41 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
          v42 = [v41 notificationIdentifier];
          id v43 = objc_msgSend(v42, "un_logDigest");
          *(_DWORD *)buf = 138543362;
          v75 = v43;
          _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "Carplay withdrawing notification request %{public}@ on announce finish while pending other announce notifications", buf, 0xCu);
        }
        id v44 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
        [(SBNotificationCarPlayDestination *)self withdrawNotificationRequest:v44];

        [(SBNotificationCarPlayDestination *)self _setNotificationRequestCurrentlyAnnouncing:0];
        [(SBNotificationCarPlayDestination *)self _startAnnounceTimeoutTimer];
      }
      else
      {
        [(SBNotificationCarPlayDestination *)self _setNotificationRequestCurrentlyAnnouncing:0];
        notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
        self->_notificationRequestsForAnnounce = 0;

        announceRequestsForNotificationRequests = self->_announceRequestsForNotificationRequests;
        self->_announceRequestsForNotificationRequests = 0;

        [(SBNotificationCarPlayDestination *)self _flushNotificationRequestsPendingAnnounce];
        uint64_t v8 = log;
      }
    }
  }
  else
  {
    if (a4 == 1)
    {
      [(SBNotificationCarPlayDestination *)self _invalidateAnnounceTimeoutTimer];
      id v13 = [v7 firstObject];
      id v14 = [(SBNotificationCarPlayDestination *)self _notificationRequestForAnnounceWithIdentifier:v13];

      uint64_t v15 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
      if (v15)
      {
        long long v16 = (void *)v15;
        id v17 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
        char v18 = [v14 matchesRequest:v17];

        if (v18) {
          goto LABEL_14;
        }
      }
      long long v19 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
      if (([v14 matchesRequest:v19] & 1) == 0)
      {
        long long v20 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];

        if (!v20)
        {
LABEL_13:
          [(SBNotificationCarPlayDestination *)self _setNotificationRequestCurrentlyAnnouncing:v14];
          v27 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
          [(SBNotificationCarPlayDestination *)self _postNotificationRequest:v27 shouldAnnounce:0];

LABEL_14:
          v28 = [(SBNotificationCarPlayDestination *)self _carPlayBannerSource];
          unint64_t v29 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
          [v28 didBeginAnnounceForNotificationRequest:v29];

          goto LABEL_47;
        }
        os_log_t v21 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          loga = v21;
          uint64_t v22 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
          uint64_t v23 = [v22 notificationIdentifier];
          id v24 = objc_msgSend(v23, "un_logDigest");
          id v25 = [v14 notificationIdentifier];
          v26 = objc_msgSend(v25, "un_logDigest");
          *(_DWORD *)buf = 138543618;
          v75 = v24;
          __int16 v76 = 2114;
          v77 = v26;
          _os_log_impl(&dword_1D85BA000, loga, OS_LOG_TYPE_DEFAULT, "Carplay withdrawing currently announcing notification request %{public}@ as it is starting announce for request %{public}@", buf, 0x16u);
        }
        long long v19 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
        [(SBNotificationCarPlayDestination *)self withdrawNotificationRequest:v19];
      }

      goto LABEL_13;
    }
    id v14 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
    if (v14)
    {
      id v45 = [(SBNotificationCarPlayDestination *)self _carPlayBannerSource];
      [v45 didFinishAnnounceForNotificationRequest:v14];
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v46 = v7;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v65 != v49) {
            objc_enumerationMutation(v46);
          }
          uint64_t v51 = *(void *)(*((void *)&v64 + 1) + 8 * j);
          v52 = [(SBNotificationCarPlayDestination *)self _announcementStateObserver];
          [v52 stopObservingNotificationWithRequestIdentifier:v51];

          v53 = [(SBNotificationCarPlayDestination *)self _notificationRequestForAnnounceWithIdentifier:v51];
          if (v53)
          {
            [(NSMutableArray *)self->_notificationRequestsForAnnounce removeObject:v53];
            [(NSMutableDictionary *)self->_announceRequestsForNotificationRequests removeObjectForKey:v53];
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v48);
    }

    [(SBNotificationCarPlayDestination *)self _invalidateAnnounceTimeoutTimer];
    [(SBNotificationCarPlayDestination *)self _setNotificationRequestCurrentlyAnnouncing:0];
    [(SBNotificationCarPlayDestination *)self _flushAnnounceNotificationRequestsShouldAnnounce:0];
    [(SBNotificationCarPlayDestination *)self _flushNotificationRequestsPendingAnnounce];
  }
LABEL_47:
}

uint64_t __138__SBNotificationCarPlayDestination_notificationAnnouncementObserver_announcementSpeakingStateDidUpdate_forNotificationRequestIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "un_logDigest");
}

- (BOOL)_isCurrentlyAnnouncing
{
  return [(NSMutableArray *)self->_notificationRequestsForAnnounce count] != 0;
}

- (BOOL)_shouldAnnounceNotificationRequest:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    BOOL v4 = [v3 options];
    char v5 = [v4 shouldAnnounceForCarPlay];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldDeferPostingNotificationRequestForAnnounce:(id)a3
{
  id v4 = a3;
  if ([(SBNotificationCarPlayDestination *)self _isCurrentlyAnnouncing]) {
    BOOL v5 = ![(SBNotificationCarPlayDestination *)self _shouldAnnounceNotificationRequest:v4];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_announcementStateObserver
{
  announcementStateObserver = self->_announcementStateObserver;
  if (!announcementStateObserver)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F4E650]);
    BOOL v5 = (AFUserNotificationAnnouncementSpeakingStateObserver *)[v4 initWithQueue:MEMORY[0x1E4F14428] delegate:self];
    id v6 = self->_announcementStateObserver;
    self->_announcementStateObserver = v5;

    announcementStateObserver = self->_announcementStateObserver;
  }
  return announcementStateObserver;
}

- (void)_requestAnnounceForNotificationRequest:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (os_log_t *)MEMORY[0x1E4FB3750];
  id v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    uint64_t v8 = [v4 notificationIdentifier];
    int v9 = objc_msgSend(v8, "un_logDigest");
    *(_DWORD *)buf = 138543362;
    id v46 = v9;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "CarPlay requesting announce for notification request %{public}@", buf, 0xCu);
  }
  if ([(SBNotificationCarPlayDestination *)self _isCurrentlyAnnouncing]
    || [(SBNotificationCarPlayDestination *)self _shouldAnnounceNotificationForActiveAVSession:v4])
  {
    id v10 = [v4 notificationIdentifier];
    id v11 = [(SBNotificationCarPlayDestination *)self _announcementStateObserver];
    [v11 startObservingNotificationWithRequestIdentifier:v10];

    notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
    if (!notificationRequestsForAnnounce)
    {
      id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v14 = self->_notificationRequestsForAnnounce;
      self->_notificationRequestsForAnnounce = v13;

      notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
    }
    [(NSMutableArray *)notificationRequestsForAnnounce addObject:v4];
    id v37 = [v4 userNotification];
    uint64_t v15 = [(SBNotificationCarPlayDestination *)self _bulletinForNotificationRequest:v4];
    long long v16 = [v15 summary];
    id v17 = [v16 string];

    if ([v17 length])
    {
      char v18 = (void *)[objc_alloc(MEMORY[0x1E4F4E5D0]) initWithSummary:v17 summaryType:2 error:0];
      uint64_t v19 = 0;
    }
    else
    {
      char v18 = 0;
      uint64_t v19 = 1;
    }
    id v20 = objc_alloc(MEMORY[0x1E4F4E5C8]);
    os_log_t v21 = [v4 sectionIdentifier];
    uint64_t v22 = (void *)[v20 initWithUserNotification:v37 sourceAppId:v21 platform:2 summaryDecision:v19 summary:v18];

    announceRequestsForNotificationRequests = self->_announceRequestsForNotificationRequests;
    if (!announceRequestsForNotificationRequests)
    {
      id v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v25 = self->_announceRequestsForNotificationRequests;
      self->_announceRequestsForNotificationRequests = v24;

      announceRequestsForNotificationRequests = self->_announceRequestsForNotificationRequests;
    }
    [(NSMutableDictionary *)announceRequestsForNotificationRequests setObject:v22 forKey:v4];
    uint64_t v26 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
    v27 = (void *)v26;
    if (v26) {
      id v28 = (id)v26;
    }
    else {
      id v28 = v4;
    }
    [(SBNotificationCarPlayDestination *)self _setNotificationRequestCurrentlyAnnouncing:v28];

    objc_initWeak((id *)buf, self);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke;
    v40[3] = &unk_1E6AF9840;
    id v29 = v10;
    id v41 = v29;
    objc_copyWeak(&v44, (id *)buf);
    id v42 = v4;
    id v43 = self;
    [v22 performRequestWithCompletion:v40];
    if ([v17 length])
    {
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F4E5D0]) initWithSummary:v17 summaryType:2 error:0];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke_151;
      v38[3] = &unk_1E6AF5350;
      id v39 = v15;
      [v22 deliverSummary:v30 completion:v38];
    }
    objc_destroyWeak(&v44);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    os_log_t v31 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = v31;
      uint64_t v33 = [v4 notificationIdentifier];
      uint64_t v34 = objc_msgSend(v33, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      id v46 = v34;
      _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "CarPlay request to announce notification request %{public}@ dropped due to current AV session", buf, 0xCu);
    }
    id v35 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
    BOOL v36 = v35 == v4;

    if (v36) {
      [(SBNotificationCarPlayDestination *)self _setNotificationRequestCurrentlyAnnouncing:0];
    }
  }
}

void __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke_2;
  block[3] = &unk_1E6B0A988;
  id v7 = *(id *)(a1 + 32);
  char v11 = a2;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  dispatch_sync(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = objc_msgSend(v3, "un_logDigest");
    id v6 = (void *)v5;
    id v7 = @"succeeded";
    if (!*(unsigned char *)(a1 + 64)) {
      id v7 = @"failed";
    }
    int v15 = 138543618;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    char v18 = v7;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay request to announce notification request %{public}@ %@", (uint8_t *)&v15, 0x16u);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = WeakRetained;
  if (*(unsigned char *)(a1 + 64))
  {
    id v10 = [*(id *)(a1 + 48) _notificationRequestCurrentlyAnnouncing];
    char v11 = *(void **)(a1 + 40);

    if (v10 == v11) {
      [*(id *)(a1 + 48) _startAnnounceTimeoutTimer];
    }
  }
  else
  {
    uint64_t v12 = [WeakRetained _announcementStateObserver];
    [v12 stopObservingNotificationWithRequestIdentifier:*(void *)(a1 + 32)];

    id v13 = [v9 _notificationRequestCurrentlyAnnouncing];
    id v14 = *(void **)(a1 + 40);

    if (v13 == v14) {
      [v9 _setNotificationRequestCurrentlyAnnouncing:0];
    }
    [v9[6] removeObject:*(void *)(a1 + 40)];
    [v9[11] removeObjectForKey:*(void *)(a1 + 40)];
    if ([v9[6] count]) {
      [v9 _flushAnnounceNotificationRequestsShouldAnnounce:1];
    }
    else {
      [v9 _flushNotificationRequestsPendingAnnounce];
    }
  }
}

void __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke_151(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 publisherMatchID];
    id v8 = objc_msgSend(v7, "un_logDigest");
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Did delivery summary for notification %{public}@: %{BOOL}u", (uint8_t *)&v9, 0x12u);
  }
}

- (int64_t)_announceDeactivationReasonForBannerRevocationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SBBannerRevocationReasonCarPlayDestinationExplicitDismissal"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FB3870]])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F57F30]])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F57F38]])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FB3878]])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FB3880]])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FB3888]])
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_cancelAnnounceForNotificationRequest:(id)a3 withReason:(int64_t)a4 deactivateAnnounce:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  void v41[2] = __104__SBNotificationCarPlayDestination__cancelAnnounceForNotificationRequest_withReason_deactivateAnnounce___block_invoke;
  v41[3] = &unk_1E6B0A9B0;
  id v10 = v8;
  id v42 = v10;
  uint64_t v11 = [(NSMutableArray *)notificationRequestsForAnnounce indexOfObjectPassingTest:v41];
  int v12 = (os_log_t *)MEMORY[0x1E4FB3750];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = v11;
    id v14 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = v14;
      uint64_t v16 = [v10 notificationIdentifier];
      __int16 v17 = objc_msgSend(v16, "un_logDigest");
      char v18 = AFSiriDeactivationReasonGetName();
      *(_DWORD *)buf = 138543874;
      id v44 = v17;
      __int16 v45 = 2114;
      id v46 = v18;
      __int16 v47 = 1024;
      BOOL v48 = v5;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "CarPlay clearing announce for notification request %{public}@ for reason %{public}@ with deactivation = %{BOOL}d", buf, 0x1Cu);
    }
    uint64_t v19 = [(NSMutableArray *)self->_notificationRequestsForAnnounce objectAtIndex:v13];
    [(NSMutableArray *)self->_notificationRequestsForAnnounce removeObject:v19];
    id v20 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
    int v21 = [v19 matchesRequest:v20];

    if (v21) {
      [(SBNotificationCarPlayDestination *)self _setNotificationRequestCurrentlyAnnouncing:0];
    }
    uint64_t v22 = [(NSMutableDictionary *)self->_announceRequestsForNotificationRequests objectForKey:v19];
    [(NSMutableDictionary *)self->_announceRequestsForNotificationRequests removeObjectForKey:v19];
    if (v22 && v5 && AFSiriDeactivationReasonGetIsValidAndSpecified())
    {
      os_log_t v23 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = v23;
        id v25 = [v10 notificationIdentifier];
        uint64_t v26 = objc_msgSend(v25, "un_logDigest");
        v27 = AFSiriDeactivationReasonGetName();
        *(_DWORD *)buf = 138543618;
        id v44 = v26;
        __int16 v45 = 2114;
        id v46 = v27;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "CarPlay requesting deactivate announce for notification request %{public}@ for reason %{public}@", buf, 0x16u);
      }
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __104__SBNotificationCarPlayDestination__cancelAnnounceForNotificationRequest_withReason_deactivateAnnounce___block_invoke_153;
      id v39 = &unk_1E6AF5350;
      id v40 = v19;
      [v22 deactivateRequestForReason:a4 completion:&v36];
    }
    if (![(NSMutableArray *)self->_notificationRequestsForAnnounce count])
    {
      id v28 = self->_notificationRequestsForAnnounce;
      self->_notificationRequestsForAnnounce = 0;

      announceRequestsForNotificationRequests = self->_announceRequestsForNotificationRequests;
      self->_announceRequestsForNotificationRequests = 0;
    }
    if ([(NCNotificationRequest *)self->_notificationRequestPendingDeactivation matchesRequest:v19])
    {
      notificationRequestPendingDeactivation = self->_notificationRequestPendingDeactivation;
      self->_notificationRequestPendingDeactivation = 0;
    }
  }
  if ([(NSMutableArray *)self->_notificationRequestsPendingAVSession containsObject:v10])
  {
    os_log_t v31 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = v31;
      uint64_t v33 = [v10 notificationIdentifier];
      uint64_t v34 = objc_msgSend(v33, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      id v44 = v34;
      _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "CarPlay removing request %{public}@ from announce list pending AV session completion", buf, 0xCu);
    }
    [(NSMutableArray *)self->_notificationRequestsPendingAVSession removeObject:v10];
    if (![(NSMutableArray *)self->_notificationRequestsPendingAVSession count])
    {
      notificationRequestsPendingAVSession = self->_notificationRequestsPendingAVSession;
      self->_notificationRequestsPendingAVSession = 0;
    }
  }
}

uint64_t __104__SBNotificationCarPlayDestination__cancelAnnounceForNotificationRequest_withReason_deactivateAnnounce___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesRequest:a2];
}

void __104__SBNotificationCarPlayDestination__cancelAnnounceForNotificationRequest_withReason_deactivateAnnounce___block_invoke_153(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v4 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 notificationIdentifier];
    uint64_t v8 = objc_msgSend(v7, "un_logDigest");
    int v9 = (void *)v8;
    id v10 = @"failed";
    if (a2) {
      id v10 = @"succeeded";
    }
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "CarPlay request to deactivate announce for notification %{public}@ %@", (uint8_t *)&v11, 0x16u);
  }
}

- (BOOL)_shouldAnnounceNotificationForActiveAVSession:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  id v6 = [v5 attributeForKey:*MEMORY[0x1E4F74EF0]];

  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F74F08]];
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = v6;
      int v9 = "CarPlay should announce notification because current AV prompt style is %@";
      id v10 = v8;
      uint32_t v11 = 12;
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v24, v11);
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    __int16 v13 = [v12 attributeForKey:*MEMORY[0x1E4F74B50]];
    int v14 = [v13 BOOLValue];

    uint64_t v15 = *MEMORY[0x1E4FB3750];
    BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LOWORD(v24) = 0;
        int v9 = "CarPlay should not announce notification because AV currently playing longer duration session";
        id v10 = v15;
        uint32_t v11 = 2;
        goto LABEL_7;
      }
    }
    else
    {
      if (v16)
      {
        __int16 v17 = v15;
        char v18 = [v4 notificationIdentifier];
        uint64_t v19 = objc_msgSend(v18, "un_logDigest");
        int v24 = 138543618;
        id v25 = v19;
        __int16 v26 = 2112;
        v27 = v6;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "CarPlay deferring announce for notification %{public}@ because current AV prompt style is %@", (uint8_t *)&v24, 0x16u);
      }
      notificationRequestsPendingAVSession = self->_notificationRequestsPendingAVSession;
      if (!notificationRequestsPendingAVSession)
      {
        int v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v22 = self->_notificationRequestsPendingAVSession;
        self->_notificationRequestsPendingAVSession = v21;

        notificationRequestsPendingAVSession = self->_notificationRequestsPendingAVSession;
      }
      if (([(NSMutableArray *)notificationRequestsPendingAVSession containsObject:v4] & 1) == 0) {
        [(NSMutableArray *)self->_notificationRequestsPendingAVSession addObject:v4];
      }
    }
  }

  return v7;
}

- (void)_voicePromptStyleChanged:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKey:*MEMORY[0x1E4F74F00]];

  if ([v5 isEqualToString:*MEMORY[0x1E4F74F08]]
    && [(NSMutableArray *)self->_notificationRequestsPendingAVSession count])
  {
    id v6 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "CarPlay voice prompt changed to %@, requesting announce again for pending notification requests", buf, 0xCu);
    }
    int v7 = self->_notificationRequestsPendingAVSession;
    notificationRequestsPendingAVSession = self->_notificationRequestsPendingAVSession;
    self->_notificationRequestsPendingAVSession = 0;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v9 = v7;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          -[SBNotificationCarPlayDestination _requestAnnounceForNotificationRequest:](self, "_requestAnnounceForNotificationRequest:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_setNotificationRequestCurrentlyAnnouncing:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (NCNotificationRequest *)a3;
  notificationRequestCurrentlyAnnouncing = self->_notificationRequestCurrentlyAnnouncing;
  p_notificationRequestCurrentlyAnnouncing = &self->_notificationRequestCurrentlyAnnouncing;
  if (notificationRequestCurrentlyAnnouncing != v5)
  {
    uint64_t v8 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = v8;
      uint64_t v10 = [(NCNotificationRequest *)v5 notificationIdentifier];
      uint64_t v11 = objc_msgSend(v10, "un_logDigest");
      uint64_t v12 = [(NCNotificationRequest *)*p_notificationRequestCurrentlyAnnouncing notificationIdentifier];
      uint64_t v13 = objc_msgSend(v12, "un_logDigest");
      int v14 = 138543618;
      long long v15 = v11;
      __int16 v16 = 2114;
      long long v17 = v13;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "CarPlay setting currently announcing notification request to %{public}@ from %{public}@", (uint8_t *)&v14, 0x16u);
    }
    objc_storeStrong((id *)p_notificationRequestCurrentlyAnnouncing, a3);
  }
}

- (void)_clearNotificationRequestPendingAnnounceDeactivationIfNecessary
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_notificationRequestPendingDeactivation)
  {
    id v3 = [(SBNotificationCarPlayDestination *)self _notificationRequestCurrentlyAnnouncing];
    notificationRequestPendingDeactivation = self->_notificationRequestPendingDeactivation;

    if (v3 == notificationRequestPendingDeactivation)
    {
      BOOL v5 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        id v6 = self->_notificationRequestPendingDeactivation;
        int v7 = v5;
        uint64_t v8 = [(NCNotificationRequest *)v6 notificationIdentifier];
        int v9 = objc_msgSend(v8, "un_logDigest");
        int v10 = 138543362;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "CarPlay clearing notification request %{public}@ pending announce deactivation and requesting early deactivation", (uint8_t *)&v10, 0xCu);
      }
      [(SBNotificationCarPlayDestination *)self _cancelAnnounceForNotificationRequest:self->_notificationRequestPendingDeactivation withReason:[(SBNotificationCarPlayDestination *)self _announceDeactivationReasonForBannerRevocationReason:@"SBBannerRevocationReasonCarPlayDestinationExplicitDismissal"] deactivateAnnounce:1];
    }
  }
}

- (id)_notificationRequestForAnnounceWithIdentifier:(id)a3
{
  id v4 = a3;
  notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__SBNotificationCarPlayDestination__notificationRequestForAnnounceWithIdentifier___block_invoke;
  v10[3] = &unk_1E6B0A9B0;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [(NSMutableArray *)notificationRequestsForAnnounce indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(NSMutableArray *)self->_notificationRequestsForAnnounce objectAtIndex:v7];
  }

  return v8;
}

uint64_t __82__SBNotificationCarPlayDestination__notificationRequestForAnnounceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 notificationIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_queueNotificationRequestWhileAnnouncing:(id)a3
{
  id v4 = a3;
  notificationRequestsPendingAnnounce = self->_notificationRequestsPendingAnnounce;
  id v8 = v4;
  if (!notificationRequestsPendingAnnounce)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_notificationRequestsPendingAnnounce;
    self->_notificationRequestsPendingAnnounce = v6;

    id v4 = v8;
    notificationRequestsPendingAnnounce = self->_notificationRequestsPendingAnnounce;
  }
  [(NSMutableArray *)notificationRequestsPendingAnnounce addObject:v4];
}

- (void)_modifyNotificationRequest:(id)a3 inStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__SBNotificationCarPlayDestination__modifyNotificationRequest_inStore___block_invoke;
    v9[3] = &unk_1E6B0A9B0;
    id v7 = v5;
    id v10 = v7;
    uint64_t v8 = [v6 indexOfObjectPassingTest:v9];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      [v6 replaceObjectAtIndex:v8 withObject:v7];
    }
  }
}

uint64_t __71__SBNotificationCarPlayDestination__modifyNotificationRequest_inStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesRequest:a2];
}

- (void)_withdrawNotificationRequest:(id)a3 inStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__SBNotificationCarPlayDestination__withdrawNotificationRequest_inStore___block_invoke;
    v8[3] = &unk_1E6B0A9B0;
    id v9 = v5;
    uint64_t v7 = [v6 indexOfObjectPassingTest:v8];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      [v6 removeObjectAtIndex:v7];
    }
  }
}

uint64_t __73__SBNotificationCarPlayDestination__withdrawNotificationRequest_inStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesRequest:a2];
}

- (void)_flushNotificationRequestsPendingAnnounce
{
  if ([(NSMutableArray *)self->_notificationRequestsPendingAnnounce count])
  {
    id v3 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay flushing notification requests pending announce", buf, 2u);
    }
    notificationRequestsPendingAnnounce = self->_notificationRequestsPendingAnnounce;
    self->_notificationRequestsPendingAnnounce = 0;
    id v5 = notificationRequestsPendingAnnounce;

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__SBNotificationCarPlayDestination__flushNotificationRequestsPendingAnnounce__block_invoke;
    v6[3] = &unk_1E6B0A9D8;
    v6[4] = self;
    [(NSMutableArray *)v5 enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __77__SBNotificationCarPlayDestination__flushNotificationRequestsPendingAnnounce__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) postNotificationRequest:a2];
}

- (void)_flushAnnounceNotificationRequestsShouldAnnounce:(BOOL)a3
{
  if ([(NSMutableArray *)self->_notificationRequestsForAnnounce count])
  {
    id v5 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "CarPlay flushing all announce notification requests", buf, 2u);
    }
    notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
    self->_notificationRequestsForAnnounce = 0;
    uint64_t v7 = notificationRequestsForAnnounce;

    announceRequestsForNotificationRequests = self->_announceRequestsForNotificationRequests;
    self->_announceRequestsForNotificationRequests = 0;

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__SBNotificationCarPlayDestination__flushAnnounceNotificationRequestsShouldAnnounce___block_invoke;
    v10[3] = &unk_1E6B0AA00;
    void v10[4] = self;
    BOOL v11 = a3;
    [(NSMutableArray *)v7 enumerateObjectsUsingBlock:v10];
    notificationRequestPendingDeactivation = self->_notificationRequestPendingDeactivation;
    self->_notificationRequestPendingDeactivation = 0;
  }
}

void __85__SBNotificationCarPlayDestination__flushAnnounceNotificationRequestsShouldAnnounce___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 matchesRequest:*(void *)(*(void *)(a1 + 32) + 72)] & 1) == 0) {
    [*(id *)(a1 + 32) _postNotificationRequest:v3 shouldAnnounce:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)_startAnnounceTimeoutTimer
{
  if (!self->_announceTimeoutTimer)
  {
    id v3 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay starting announce timeout timer", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    id v4 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBNotificationCarPlayDestination.announceTimeoutTimer"];
    announceTimeoutTimer = self->_announceTimeoutTimer;
    self->_announceTimeoutTimer = v4;

    id v6 = self->_announceTimeoutTimer;
    uint64_t v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__SBNotificationCarPlayDestination__startAnnounceTimeoutTimer__block_invoke;
    v9[3] = &unk_1E6AF5838;
    objc_copyWeak(&v10, buf);
    [(BSAbsoluteMachTimer *)v6 scheduleWithFireInterval:v7 leewayInterval:v9 queue:10.0 handler:0.0];

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

void __62__SBNotificationCarPlayDestination__startAnnounceTimeoutTimer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)*MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_ERROR)) {
    __62__SBNotificationCarPlayDestination__startAnnounceTimeoutTimer__block_invoke_cold_1((uint64_t)WeakRetained, v5);
  }
  id v6 = [WeakRetained _announceTimeoutTimer];

  if (v6 == v3) {
    [WeakRetained _invalidateAnnounceTimeoutTimer];
  }
  [WeakRetained _setNotificationRequestCurrentlyAnnouncing:0];
  [WeakRetained _flushAnnounceNotificationRequestsShouldAnnounce:1];
  [WeakRetained _flushNotificationRequestsPendingAnnounce];
}

- (void)_invalidateAnnounceTimeoutTimer
{
  id v3 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay cancelling announce timeout timer", v5, 2u);
  }
  [(BSAbsoluteMachTimer *)self->_announceTimeoutTimer invalidate];
  announceTimeoutTimer = self->_announceTimeoutTimer;
  self->_announceTimeoutTimer = 0;
}

- (NCNotificationAlertDestinationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NCNotificationAlertDestinationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBNCAlertingController)alertingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertingController);
  return (SBNCAlertingController *)WeakRetained;
}

- (void)setAlertingController:(id)a3
{
}

- (BSAbsoluteMachTimer)_announceTimeoutTimer
{
  return self->_announceTimeoutTimer;
}

- (void)_setAnnounceTimeoutTimer:(id)a3
{
}

- (NCNotificationRequest)_notificationRequestCurrentlyAnnouncing
{
  return self->_notificationRequestCurrentlyAnnouncing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRequestCurrentlyAnnouncing, 0);
  objc_storeStrong((id *)&self->_announceTimeoutTimer, 0);
  objc_destroyWeak((id *)&self->_alertingController);
  objc_storeStrong((id *)&self->_carPlayBannerSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_announceRequestsForNotificationRequests, 0);
  objc_storeStrong((id *)&self->_announcementStateObserver, 0);
  objc_storeStrong((id *)&self->_notificationRequestPendingDeactivation, 0);
  objc_storeStrong((id *)&self->_notificationRequestsPendingAVSession, 0);
  objc_storeStrong((id *)&self->_notificationRequestsPendingAnnounce, 0);
  objc_storeStrong((id *)&self->_notificationRequestsForAnnounce, 0);
  objc_destroyWeak((id *)&self->_presentablePresentingAlertController);
  objc_storeStrong((id *)&self->_appPolicyForBundleID, 0);
  objc_storeStrong((id *)&self->_appPolicyEvaluator, 0);
  objc_storeStrong((id *)&self->_presentables, 0);
  objc_storeStrong((id *)&self->_bannerHostMonitorListener, 0);
}

- (void)_postNotificationRequest:shouldAnnounce:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error requesting presentation and container sizes: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_postNotificationRequest:shouldAnnounce:.cold.2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "Error attempting to post presentable: presentable: %{public}@; error: %{public}@");
}

- (void)withdrawNotificationRequest:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "Error attempting to revoke presentable: requestID: %{public}@; error: %{public}@");
}

- (void)didSelectBannerOfPresentableViewController:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 requestIdentifier];
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_ERROR, "Error attempting to revoke presentable: requestID: %{public}@; error: %{public}@",
    (uint8_t *)&v7,
    0x16u);
}

void __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  uint64_t v4 = [v2 requestIdentifier];
  OUTLINED_FUNCTION_2_18();
  OUTLINED_FUNCTION_5_2(&dword_1D85BA000, v5, v6, "Error attempting to revoke presentable: requestID: %{public}@; error: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

- (void)didCancelBannerOfPresentableViewController:(void *)a1 reason:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 requestIdentifier];
  OUTLINED_FUNCTION_2_18();
  OUTLINED_FUNCTION_5_2(&dword_1D85BA000, v5, v6, "Error attempting to revoke presentable: requestID: %{public}@; error: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

- (void)_presentablesWithRequestIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "No presentables for requestID: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_removePresentable:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "No presentable to remove: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setSuspended:(NSObject *)a3 forPresentingAlertControllerForPresentable:.cold.1(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = @"suspend";
  if ((a1 & 1) == 0) {
    uint64_t v3 = @"resume";
  }
  *(_DWORD *)uint64_t v4 = 138543618;
  *(void *)&v4[4] = v3;
  *(_WORD *)&v4[12] = 2114;
  *(void *)&v4[14] = a2;
  OUTLINED_FUNCTION_3(&dword_1D85BA000, a2, a3, "Error attempting to %{public}@: %{public}@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], *MEMORY[0x1E4F143B8]);
}

void __62__SBNotificationCarPlayDestination__startAnnounceTimeoutTimer__block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = a2;
  [v2 count];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_ERROR, "Timed out while waiting for announce to start for %lu notifications!", v4, 0xCu);
}

@end