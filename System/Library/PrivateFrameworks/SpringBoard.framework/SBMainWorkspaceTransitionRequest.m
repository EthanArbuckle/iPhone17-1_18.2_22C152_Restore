@interface SBMainWorkspaceTransitionRequest
+ (id)ancillaryTransitionRequestsForTransitionRequest:(id)a3;
- (BOOL)isCrossingDisplays;
- (BOOL)isMainWorkspaceTransitionRequest;
- (BOOL)shouldPreventDismissalOfUnrelatedTransientOverlays;
- (BOOL)shouldPreventEmergencyNotificationBannerDismissal;
- (NSString)centerWindowSourceSceneID;
- (SBBannerUnfurlSourceContextProviding)bannerUnfurlSourceContextProvider;
- (SBMainWorkspaceTransitionRequest)initWithDisplayConfiguration:(id)a3;
- (id)_initWithWorkspace:(id)a3 displayConfiguration:(id)a4;
- (id)addCompletionHandler:(id)a3;
- (id)compactDescriptionBuilder;
- (id)completionBlock;
- (id)copyMainWorkspaceTransitionRequest;
- (id)succinctDescriptionBuilder;
- (id)transactionConfigurator;
- (id)transactionProvider;
- (int64_t)centerConfiguration;
- (int64_t)source;
- (void)_invalidateCompletionTasks;
- (void)dealloc;
- (void)declineWithReason:(id)a3;
- (void)finalize;
- (void)modifyTransientOverlayContext:(id)a3;
- (void)setBannerUnfurlSourceContextProvider:(id)a3;
- (void)setCenterConfiguration:(int64_t)a3;
- (void)setCenterWindowSourceSceneID:(id)a3;
- (void)setCrossingDisplays:(BOOL)a3;
- (void)setShouldPreventDismissalOfUnrelatedTransientOverlays:(BOOL)a3;
- (void)setShouldPreventEmergencyNotificationBannerDismissal:(BOOL)a3;
- (void)setSource:(int64_t)a3;
- (void)setTransactionConfigurator:(id)a3;
- (void)setTransactionProvider:(id)a3;
- (void)setTransientOverlayContext:(id)a3;
@end

@implementation SBMainWorkspaceTransitionRequest

void __70__SBMainWorkspaceTransitionRequest_copyMainWorkspaceTransitionRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) applicationContext];
  id v6 = [v4 entityForLayoutRole:a2];

  v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) setEntity:v6 forLayoutRole:a2];
    v5 = v6;
  }
}

- (int64_t)source
{
  return self->_source;
}

- (BOOL)isCrossingDisplays
{
  return self->_crossingDisplays;
}

- (SBBannerUnfurlSourceContextProviding)bannerUnfurlSourceContextProvider
{
  return self->_bannerUnfurlSourceContextProvider;
}

- (void)finalize
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SBMainWorkspaceTransitionRequest;
  [(SBWorkspaceTransitionRequest *)&v16 finalize];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  v5 = [v4 entities];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isApplicationSceneEntity]
          && ([v10 isDeviceApplicationSceneEntity] & 1) == 0)
        {
          v11 = [MEMORY[0x1E4F28B00] currentHandler];
          [v11 handleFailureInMethod:a2 object:self file:@"SBMainWorkspaceTransitionRequest.m" lineNumber:218 description:@"Entity for a device request must be a SBDeviceApplicationSceneEntity."];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)copyMainWorkspaceTransitionRequest
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v3 = [(SBWorkspaceTransitionRequest *)self workspace];
  v4 = [(SBWorkspaceTransitionRequest *)self displayConfiguration];
  v47 = v3;
  v5 = [v3 createRequestWithOptions:0 displayConfiguration:v4];

  objc_msgSend(v5, "setSource:", -[SBMainWorkspaceTransitionRequest source](self, "source"));
  uint64_t v6 = [(SBWorkspaceTransitionRequest *)self eventLabel];
  [v5 setEventLabel:v6];

  uint64_t v7 = [(SBMainWorkspaceTransitionRequest *)self bannerUnfurlSourceContextProvider];
  [v5 setBannerUnfurlSourceContextProvider:v7];

  objc_msgSend(v5, "setShouldPreventEmergencyNotificationBannerDismissal:", -[SBMainWorkspaceTransitionRequest shouldPreventEmergencyNotificationBannerDismissal](self, "shouldPreventEmergencyNotificationBannerDismissal"));
  objc_msgSend(v5, "setShouldPreventDismissalOfUnrelatedTransientOverlays:", -[SBMainWorkspaceTransitionRequest shouldPreventDismissalOfUnrelatedTransientOverlays](self, "shouldPreventDismissalOfUnrelatedTransientOverlays"));
  objc_msgSend(v5, "setCenterConfiguration:", -[SBMainWorkspaceTransitionRequest centerConfiguration](self, "centerConfiguration"));
  uint64_t v8 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __70__SBMainWorkspaceTransitionRequest_copyMainWorkspaceTransitionRequest__block_invoke;
  v52[3] = &unk_1E6B002B8;
  v52[4] = self;
  v9 = v8;
  v53 = v9;
  SBLayoutRoleEnumerateValidRoles(v52);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v10 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  v11 = [v10 entitiesWithRemovalContexts];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        v17 = [(SBWorkspaceTransitionRequest *)self applicationContext];
        uint64_t v18 = [v17 removalContextForEntity:v16];
        [(SBWorkspaceApplicationSceneTransitionContext *)v9 setRemovalContext:v18 forEntity:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v13);
  }

  v19 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  v20 = [v19 activatingEntity];
  [(SBWorkspaceApplicationSceneTransitionContext *)v9 setActivatingEntity:v20];

  v21 = [(SBWorkspaceTransitionRequest *)self transientOverlayContext];
  if (v21)
  {
    v22 = objc_alloc_init(SBWorkspaceTransientOverlayTransitionContext);
    -[SBWorkspaceTransientOverlayTransitionContext setAnimated:](v22, "setAnimated:", [v21 isAnimated]);
    v23 = [v21 scenePresenter];
    [(SBWorkspaceTransientOverlayTransitionContext *)v22 setScenePresenter:v23];

    v24 = [v21 presentationManager];
    [(SBWorkspaceTransientOverlayTransitionContext *)v22 setPresentationManager:v24];

    v25 = [v21 transientOverlay];
    [(SBWorkspaceTransientOverlayTransitionContext *)v22 setTransientOverlay:v25];

    -[SBWorkspaceTransientOverlayTransitionContext setTransitionType:](v22, "setTransitionType:", [v21 transitionType]);
  }
  else
  {
    v22 = 0;
  }
  v26 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedUnlockedEnvironmentMode:](v9, "setRequestedUnlockedEnvironmentMode:", [v26 requestedUnlockedEnvironmentMode]);

  v27 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedFloatingConfiguration:](v9, "setRequestedFloatingConfiguration:", [v27 requestedFloatingConfiguration]);

  v28 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedCenterConfiguration:](v9, "setRequestedCenterConfiguration:", [v28 requestedCenterConfiguration]);

  v29 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedPeekConfiguration:](v9, "setRequestedPeekConfiguration:", [v29 requestedPeekConfiguration]);

  v30 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedFloatingSwitcherVisible:](v9, "setRequestedFloatingSwitcherVisible:", [v30 requestedFloatingSwitcherVisible]);

  v31 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedCenterEntityModal:](v9, "setRequestedCenterEntityModal:", [v31 requestedCenterEntityModal]);

  v32 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setWaitsForSceneUpdates:](v9, "setWaitsForSceneUpdates:", [v32 waitsForSceneUpdates]);

  v33 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setPreferredInterfaceOrientation:](v9, "setPreferredInterfaceOrientation:", [v33 preferredInterfaceOrientation]);

  v34 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceTransitionContext setAnimationDisabled:](v9, "setAnimationDisabled:", [v34 animationDisabled]);

  v35 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setPrefersCrossfadeTransition:](v9, "setPrefersCrossfadeTransition:", [v35 prefersCrossfadeTransition]);

  v36 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setPrefersCenterZoomTransition:](v9, "setPrefersCenterZoomTransition:", [v36 prefersCenterZoomTransition]);

  v37 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setTransitioningToLessRecentSpace:](v9, "setTransitioningToLessRecentSpace:", [v37 isTransitioningToLessRecentSpace]);

  v38 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  v39 = [v38 requestedAppExposeBundleID];
  [(SBWorkspaceApplicationSceneTransitionContext *)v9 setRequestedAppExposeBundleID:v39];

  v40 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setDisablesAutoPIP:](v9, "setDisablesAutoPIP:", [v40 disablesAutoPIP]);

  v41 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  v42 = [v41 requestedEntityIdentifierToLayoutAttributes];
  [(SBWorkspaceApplicationSceneTransitionContext *)v9 setRequestedEntityIdentifierToLayoutAttributes:v42];

  v43 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  -[SBWorkspaceApplicationSceneTransitionContext setRetainsSiri:](v9, "setRetainsSiri:", [v43 retainsSiri]);

  v44 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  v45 = [v44 delegate];
  [(SBWorkspaceApplicationSceneTransitionContext *)v9 setDelegate:v45];

  [v5 setApplicationContext:v9];
  [v5 setTransientOverlayContext:v22];

  return v5;
}

- (BOOL)shouldPreventEmergencyNotificationBannerDismissal
{
  return self->_shouldPreventEmergencyNotificationBannerDismissal;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void)setShouldPreventDismissalOfUnrelatedTransientOverlays:(BOOL)a3
{
  self->_shouldPreventDismissalOfUnrelatedTransientOverlays = a3;
}

- (BOOL)shouldPreventDismissalOfUnrelatedTransientOverlays
{
  return self->_shouldPreventDismissalOfUnrelatedTransientOverlays;
}

- (void)setTransientOverlayContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 presentationManager];

    if (!v6)
    {
      uint64_t v7 = [(SBWorkspaceTransitionRequest *)self workspace];
      uint64_t v8 = [v7 transientOverlayPresentationManager];
      [v5 setPresentationManager:v8];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SBMainWorkspaceTransitionRequest;
  [(SBWorkspaceTransitionRequest *)&v9 setTransientOverlayContext:v5];
}

- (void)setShouldPreventEmergencyNotificationBannerDismissal:(BOOL)a3
{
  self->_shouldPreventEmergencyNotificationBannerDismissal = a3;
}

- (void)setCenterConfiguration:(int64_t)a3
{
  self->_centerConfiguration = a3;
}

- (void)setBannerUnfurlSourceContextProvider:(id)a3
{
}

- (int64_t)centerConfiguration
{
  return self->_centerConfiguration;
}

- (id)transactionConfigurator
{
  return self->_transactionConfigurator;
}

- (id)transactionProvider
{
  return self->_transactionProvider;
}

- (id)compactDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)SBMainWorkspaceTransitionRequest;
  v3 = [(SBWorkspaceTransitionRequest *)&v7 compactDescriptionBuilder];
  id v4 = SBMainWorkspaceTransitionSourceDescription(self->_source);
  id v5 = (id)[v3 appendObject:v4 withName:@"source"];

  return v3;
}

- (id)completionBlock
{
  if (self->_completionTasks)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__SBMainWorkspaceTransitionRequest_completionBlock__block_invoke_2;
    v4[3] = &unk_1E6AF80B8;
    objc_copyWeak(&v5, &location);
    v2 = (void *)[v4 copy];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    v2 = (void *)[&__block_literal_global_338 copy];
  }
  return v2;
}

- (void)declineWithReason:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)SBMainWorkspaceTransitionRequest;
  [(SBWorkspaceTransitionRequest *)&v15 declineWithReason:a3];
  if (![(SBWorkspaceTransitionRequest *)self isFinalized])
  {
    [(SBMainWorkspaceTransitionRequest *)self setTransactionProvider:0];
    [(SBMainWorkspaceTransitionRequest *)self setTransactionConfigurator:0];
    completionTasks = self->_completionTasks;
    if (completionTasks)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v5 = completionTasks;
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "task", (void)v11);
            v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
            v10[2](v10, 0);

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }
        while (v7);
      }

      [(SBMainWorkspaceTransitionRequest *)self _invalidateCompletionTasks];
    }
  }
}

- (void)setTransactionProvider:(id)a3
{
}

- (void)setTransactionConfigurator:(id)a3
{
}

- (SBMainWorkspaceTransitionRequest)initWithDisplayConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = +[SBWorkspace mainWorkspace];
  v8.receiver = self;
  v8.super_class = (Class)SBMainWorkspaceTransitionRequest;
  uint64_t v6 = [(SBWorkspaceTransitionRequest *)&v8 _initWithWorkspace:v5 displayConfiguration:v4];

  return v6;
}

- (id)succinctDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)SBMainWorkspaceTransitionRequest;
  v3 = [(SBWorkspaceTransitionRequest *)&v7 succinctDescriptionBuilder];
  id v4 = SBMainWorkspaceTransitionSourceDescription(self->_source);
  id v5 = (id)[v3 appendObject:v4 withName:@"source"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerWindowSourceSceneID, 0);
  objc_storeStrong((id *)&self->_bannerUnfurlSourceContextProvider, 0);
  objc_storeStrong((id *)&self->_completionTasks, 0);
  objc_storeStrong(&self->_transactionConfigurator, 0);
  objc_storeStrong(&self->_transactionProvider, 0);
}

- (void)dealloc
{
  [(SBMainWorkspaceTransitionRequest *)self _invalidateCompletionTasks];
  v3.receiver = self;
  v3.super_class = (Class)SBMainWorkspaceTransitionRequest;
  [(SBMainWorkspaceTransitionRequest *)&v3 dealloc];
}

- (void)_invalidateCompletionTasks
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[(NSMutableArray *)self->_completionTasks copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "invalidate", (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_completionTasks removeAllObjects];
  completionTasks = self->_completionTasks;
  self->_completionTasks = 0;
}

+ (id)ancillaryTransitionRequestsForTransitionRequest:(id)a3
{
  id v3 = a3;
  id v4 = [(id)SBApp windowSceneManager];
  uint64_t v5 = [v4 connectedWindowScenes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__SBMainWorkspaceTransitionRequest_ancillaryTransitionRequestsForTransitionRequest___block_invoke;
  v9[3] = &unk_1E6B0AC88;
  id v10 = v3;
  id v6 = v3;
  uint64_t v7 = objc_msgSend(v5, "bs_compactMap:", v9);

  return v7;
}

- (BOOL)isMainWorkspaceTransitionRequest
{
  return 1;
}

id __84__SBMainWorkspaceTransitionRequest_ancillaryTransitionRequestsForTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 switcherController];
  id v4 = [v3 _ancillaryTransitionRequestForTransitionRequest:*(void *)(a1 + 32)];

  return v4;
}

- (id)_initWithWorkspace:(id)a3 displayConfiguration:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28B00];
  id v7 = a4;
  uint64_t v8 = [v6 currentHandler];
  [v8 handleFailureInMethod:a2 object:self file:@"SBMainWorkspaceTransitionRequest.m" lineNumber:65 description:@"call init instead"];

  uint64_t v9 = [(SBMainWorkspaceTransitionRequest *)self initWithDisplayConfiguration:v7];
  return v9;
}

- (id)addCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_completionTasks)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
      completionTasks = self->_completionTasks;
      self->_completionTasks = v5;
    }
    objc_initWeak(&location, self);
    id v7 = [SBMainWorkspaceTransitionRequestCompletionTask alloc];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    long long v12 = __57__SBMainWorkspaceTransitionRequest_addCompletionHandler___block_invoke;
    long long v13 = &unk_1E6AF4FB8;
    objc_copyWeak(&v14, &location);
    uint64_t v8 = [(BSSimpleAssertion *)v7 initWithIdentifier:@"SBMainWorkspaceTransitionRequest" forReason:@"Completion" invalidationBlock:&v10];
    -[SBMainWorkspaceTransitionRequestCompletionTask setTask:](v8, "setTask:", v4, v10, v11, v12, v13);
    [(NSMutableArray *)self->_completionTasks addObject:v8];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __57__SBMainWorkspaceTransitionRequest_addCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[14] removeObject:v5];
  }
}

void __51__SBMainWorkspaceTransitionRequest_completionBlock__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = WeakRetained[14];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "task", (void)v13);

          if (v11)
          {
            long long v12 = [v10 task];
            v12[2](v12, a2);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v4 _invalidateCompletionTasks];
  }
}

- (void)modifyTransientOverlayContext:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBMainWorkspaceTransitionRequest;
  [(SBWorkspaceTransitionRequest *)&v11 modifyTransientOverlayContext:a3];
  id v4 = [(SBWorkspaceTransitionRequest *)self transientOverlayContext];
  id v5 = [v4 transientOverlay];
  uint64_t v6 = [v5 viewController];

  if (![v4 transitionType])
  {
    if ([v6 prefersContinuityDisplayPresentation]
      && +[SBContinuitySessionManager areContinuitySessionsAllowed])
    {
      uint64_t v7 = +[SBContinuitySessionManager sharedInstance];
      uint64_t v8 = [v7 currentSession];

      if ([v8 state] == 10)
      {
        uint64_t v9 = [v8 mainWindowScene];

        if (v9)
        {
LABEL_10:
          [v4 setWindowScene:v9];

          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    if ([v6 prefersEmbeddedDisplayPresentation])
    {
      uint64_t v10 = [(SBWorkspaceTransitionRequest *)self workspace];
      uint64_t v9 = [v10 mainWindowScene];

      if (v9) {
        goto LABEL_10;
      }
    }
  }
LABEL_11:
}

- (void)setCrossingDisplays:(BOOL)a3
{
  self->_crossingDisplays = a3;
}

- (NSString)centerWindowSourceSceneID
{
  return self->_centerWindowSourceSceneID;
}

- (void)setCenterWindowSourceSceneID:(id)a3
{
}

@end