@interface SBRemoteTransientOverlaySession
- (BOOL)hasPendingButtonEvents:(unint64_t)a3;
- (BOOL)hasServiceProcessIdentifier:(int)a3;
- (BOOL)isActivated;
- (BOOL)isPendingInvalidation;
- (BOOL)isPrepared;
- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3;
- (BOOL)isPresentedOnWindowScene:(id)a3;
- (BOOL)isSwitcherEligible;
- (BOOL)isValid;
- (BOOL)remoteTransientOverlayViewController:(id)a3 prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:(id)a4;
- (NSError)error;
- (NSString)serviceBundleIdentifier;
- (NSString)sessionID;
- (SBRemoteTransientOverlaySessionHostDelegate)hostDelegate;
- (SBSRemoteAlertDefinition)definition;
- (id)_actionForHandlingButtonEvents:(unint64_t)a3;
- (id)_initWithSessionID:(id)a3 definition:(id)a4 sceneWorkspaceController:(id)a5;
- (id)remoteTransientOverlayViewController:(id)a3 requestsActionForHandlingButtonEvents:(unint64_t)a4;
- (void)_addTransaction:(id)a3;
- (void)_didActivate;
- (void)_didDeactivate;
- (void)_invalidateWithReason:(int64_t)a3 error:(id)a4;
- (void)_processPendingTransactions;
- (void)_registerObserversForTransaction:(id)a3;
- (void)_requestInvalidationWithReason:(int64_t)a3 error:(id)a4;
- (void)activateWithContext:(id)a3;
- (void)addSessionObserver:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)getActionForHandlingButtonEvents:(unint64_t)a3 completion:(id)a4;
- (void)invalidate;
- (void)prepareWithConfigurationContext:(id)a3;
- (void)remoteTransientOverlayViewController:(id)a3 didDisappearAnimated:(BOOL)a4;
- (void)remoteTransientOverlayViewController:(id)a3 didTerminateWithError:(id)a4;
- (void)remoteTransientOverlayViewController:(id)a3 willAppearAnimated:(BOOL)a4;
- (void)remoteTransientOverlayViewControllerDidInvalidate:(id)a3;
- (void)remoteTransientOverlayViewControllerRequestsDeactivation:(id)a3;
- (void)remoteTransientOverlayViewControllerRequestsInvalidation:(id)a3;
- (void)removeSessionObserver:(id)a3;
- (void)setHostDelegate:(id)a3;
@end

@implementation SBRemoteTransientOverlaySession

- (id)_initWithSessionID:(id)a3 definition:(id)a4 sceneWorkspaceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBRemoteTransientOverlaySession;
  v11 = [(SBRemoteTransientOverlaySession *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    definition = v11->_definition;
    v11->_definition = (SBSRemoteAlertDefinition *)v12;

    uint64_t v14 = [v8 copy];
    sessionID = v11->_sessionID;
    v11->_sessionID = (NSString *)v14;

    v11->_valid = 1;
    objc_storeStrong((id *)&v11->_sceneWorkspaceController, a5);
  }

  return v11;
}

- (void)dealloc
{
  [(SBRemoteTransientOverlayViewController *)self->_containerViewController setDelegate:0];
  [(SBRemoteTransientOverlayViewController *)self->_secondaryViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlaySession;
  [(SBRemoteTransientOverlaySession *)&v3 dealloc];
}

- (void)remoteTransientOverlayViewControllerRequestsDeactivation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = SBLogTransientOverlay();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(SBRemoteTransientOverlaySession *)self deactivate];
}

- (BOOL)remoteTransientOverlayViewController:(id)a3 prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:(id)a4
{
  v4 = self;
  p_hostDelegate = &self->_hostDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_hostDelegate);
  LOBYTE(v4) = [WeakRetained remoteTransientOverlaySession:v4 prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:v6];

  return (char)v4;
}

- (id)remoteTransientOverlayViewController:(id)a3 requestsActionForHandlingButtonEvents:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v7 = SBLogTransientOverlay();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v11 = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  __int16 v9 = [(SBRemoteTransientOverlaySession *)self _actionForHandlingButtonEvents:a4];
  return v9;
}

- (void)remoteTransientOverlayViewControllerDidInvalidate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = SBLogTransientOverlay();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(SBRemoteTransientOverlaySession *)self _invalidateWithReason:3 error:0];
}

- (void)remoteTransientOverlayViewControllerRequestsInvalidation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = SBLogTransientOverlay();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(SBRemoteTransientOverlaySession *)self _requestInvalidationWithReason:2 error:0];
}

- (void)remoteTransientOverlayViewController:(id)a3 didTerminateWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = SBLogTransientOverlay();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = NSStringFromSelector(a2);
      int v10 = 138543874;
      uint64_t v11 = self;
      __int16 v12 = 2114;
      __int16 v13 = v9;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = NSStringFromSelector(a2);
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    __int16 v13 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
    goto LABEL_6;
  }

  [(SBRemoteTransientOverlaySession *)self _requestInvalidationWithReason:5 error:v6];
}

- (void)remoteTransientOverlayViewController:(id)a3 willAppearAnimated:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = SBLogTransientOverlay();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = NSStringFromSelector(a2);
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    __int16 v13 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
  uint64_t v9 = [WeakRetained activeWallpaperVariantForRemoteTransientOverlaySession:self];

  [(SBRemoteTransientOverlayViewController *)self->_containerViewController setWallpaperVariant:v9];
  [(SBRemoteTransientOverlayViewController *)self->_secondaryViewController setWallpaperVariant:v9];
}

- (void)remoteTransientOverlayViewController:(id)a3 didDisappearAnimated:(BOOL)a4
{
  id v5 = a3;
  [(SBRemoteTransientOverlaySession *)self _didDeactivate];
  int v6 = [v5 shouldInvalidateWhenDeactivated];

  if (v6)
  {
    [(SBRemoteTransientOverlaySession *)self _requestInvalidationWithReason:3 error:0];
  }
}

- (void)activateWithContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_prepared)
  {
    __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBRemoteTransientOverlaySession.m" lineNumber:122 description:@"Session must be prepared before it can be activated."];
  }
  int v6 = SBLogTransientOverlay();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    v22 = self;
    __int16 v23 = 2114;
    v24 = v7;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@", buf, 0x20u);
  }
  id v8 = [(SBRemoteTransientOverlaySession *)self hostDelegate];
  char v9 = [v8 remoteTransientOverlaySession:self shouldActivateWithContext:v5];

  if (v9)
  {
    self->_hasInitiatedPresentation = 1;
    objc_initWeak((id *)buf, self);
    id v10 = objc_alloc(MEMORY[0x1E4F4F6C0]);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke;
    objc_super v17 = &unk_1E6B0A3D0;
    objc_copyWeak(v20, (id *)buf);
    v18 = self;
    v20[1] = (id)a2;
    id v19 = v5;
    uint64_t v11 = (void *)[v10 initWithBlock:&v14];
    objc_msgSend(v11, "setDebugName:", @"activateWithContext", v14, v15, v16, v17, v18);
    [(SBRemoteTransientOverlaySession *)self _addTransaction:v11];

    objc_destroyWeak(v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v12 = SBLogTransientOverlay();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Not activating due to hostDelegate preventing it", buf, 0xCu);
    }

    [(SBRemoteTransientOverlaySession *)self _invalidateWithReason:4 error:0];
  }
}

void __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v48 = a2;
  v49 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained isValid])
  {
    id v46 = WeakRetained[2];
    if (!v46)
    {
      uint64_t v14 = SBLogTransientOverlay();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v16;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: canceling activation transaction because there is no container view controller", buf, 0x16u);
      }
      v49[2](v49, 1);
      goto LABEL_39;
    }
    v44 = [(id)SBApp windowSceneManager];
    int v6 = [WeakRetained hostDelegate];
    int v7 = [v6 embeddedDisplayWindowSceneForRemoteTransientOverlaySession:WeakRetained];

    id v43 = v7;
    v47 = [v44 activeDisplayWindowScene];
    id v8 = [*(id *)(a1 + 40) presentationTarget];
    char v9 = [v8 targetPredicate];
    v40 = [v9 scenePersistentIdentifier];

    if ([*(id *)(*(void *)(a1 + 32) + 80) prefersEmbeddedDisplayPresentation])
    {
      id v45 = v47;
      id v10 = v43;
      if (v43)
      {
LABEL_15:
        int v17 = [*(id *)(*(void *)(a1 + 32) + 80) prefersEmbeddedDisplayPresentation];
        v18 = v47;
        if (!v17) {
          v18 = v10;
        }
        id v19 = v18;
        if ([v19 isExternalDisplayWindowScene]) {
          BOOL v20 = WeakRetained[3] != 0;
        }
        else {
          BOOL v20 = 0;
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v72 = 0;
        v21 = dispatch_group_create();
        dispatch_group_enter(v21);
        BOOL v41 = v20;
        if (v20)
        {
          if (objc_msgSend(v10, "isExternalDisplayWindowScene", v19)) {
            uint64_t v22 = 3;
          }
          else {
            uint64_t v22 = 2;
          }
        }
        else
        {
          uint64_t v22 = objc_msgSend(v10, "isExternalDisplayWindowScene", v19);
        }
        BOOL v42 = v8 != 0;
        uint64_t v23 = *(void *)(a1 + 32);
        if (*(void *)(v23 + 24)
          || (BOOL v24 = v8 != 0, [*(id *)(v23 + 80) prefersEmbeddedDisplayPresentation]))
        {
          int v25 = [v10 isEqual:v47];
          if (v8) {
            BOOL v24 = v25;
          }
          else {
            BOOL v24 = 0;
          }
        }
        uint64_t v26 = v24 & ~[v8 requiresFullscreenPresentation];
        uint64_t v27 = *(void *)(a1 + 40);
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_16;
        v67[3] = &unk_1E6B0A380;
        v28 = WeakRetained;
        v68 = v28;
        v70 = buf;
        v29 = v21;
        v69 = v29;
        [v46 prepareForActivationWithContext:v27 presentationMode:v22 presentEmbedded:v26 windowScene:v10 completion:v67];
        if (v41)
        {
          dispatch_group_enter(v29);
          if ([v45 isExternalDisplayWindowScene]) {
            uint64_t v30 = 5;
          }
          else {
            uint64_t v30 = 4;
          }
          if (![v45 isEqual:v47]
            || [v8 requiresFullscreenPresentation])
          {
            BOOL v42 = 0;
          }
          id v31 = v28[3];
          uint64_t v32 = *(void *)(a1 + 40);
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_2;
          v63[3] = &unk_1E6B0A380;
          v64 = v28;
          v66 = buf;
          v65 = v29;
          [v31 prepareForActivationWithContext:v32 presentationMode:v30 presentEmbedded:v42 windowScene:v45 completion:v63];
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_3;
        block[3] = &unk_1E6B0A3A8;
        v58 = buf;
        v51 = v28;
        id v33 = *(id *)(a1 + 40);
        uint64_t v34 = *(void *)(a1 + 32);
        id v52 = v33;
        uint64_t v53 = v34;
        id v54 = v10;
        id v55 = v8;
        char v60 = v26;
        uint64_t v35 = *(void *)(a1 + 56);
        BOOL v61 = v41;
        uint64_t v59 = v35;
        id v56 = v45;
        BOOL v62 = v42;
        v57 = v49;
        id v36 = v45;
        id v37 = v8;
        id v38 = v10;
        dispatch_group_notify(v29, MEMORY[0x1E4F14428], block);

        _Block_object_dispose(buf, 8);
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      id v45 = v43;
      if (v40)
      {
        id v10 = [v44 windowSceneForPersistentIdentifier:v40];
        id v45 = v43;
        if (v10) {
          goto LABEL_15;
        }
      }
    }
    id v10 = v47;
    goto LABEL_15;
  }
  uint64_t v11 = SBLogTransientOverlay();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    __int16 v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: canceling activation transaction because session is no longer valid", buf, 0x16u);
  }
  v49[2](v49, 1);
LABEL_40:
}

void __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_16(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v4 = [v3 domain];
    if ([v4 isEqualToString:@"SBRemoteTransientOverlayViewControllerErrorDomain"])
    {
      uint64_t v5 = [v3 code];

      if (v5 == -1000)
      {
        uint64_t v6 = 1;
LABEL_7:
        [*(id *)(a1 + 32) _invalidateWithReason:v6 error:v3];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_8;
      }
    }
    else
    {
    }
    uint64_t v6 = 4;
    goto LABEL_7;
  }
LABEL_8:
  int v7 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v7);
}

void __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v4 = [v3 domain];
    if ([v4 isEqualToString:@"SBRemoteTransientOverlayViewControllerErrorDomain"])
    {
      uint64_t v5 = [v3 code];

      if (v5 == -1000)
      {
        uint64_t v6 = 1;
LABEL_7:
        [*(id *)(a1 + 32) _invalidateWithReason:v6 error:v3];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_8;
      }
    }
    else
    {
    }
    uint64_t v6 = 4;
    goto LABEL_7;
  }
LABEL_8:
  int v7 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v7);
}

uint64_t __55__SBRemoteTransientOverlaySession_activateWithContext___block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    id v2 = *(id *)(*(void *)(a1 + 32) + 16);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
    if (v2)
    {
      v4 = [[SBRemoteTransientOverlayPresentationRequest alloc] initWithViewController:v2];
      -[SBRemoteTransientOverlayPresentationRequest setShouldDismissPresentedBanners:](v4, "setShouldDismissPresentedBanners:", [*(id *)(a1 + 40) shouldDismissPresentedBanners]);
      -[SBRemoteTransientOverlayPresentationRequest setShouldStashPictureInPictureIfNeeded:](v4, "setShouldStashPictureInPictureIfNeeded:", [*(id *)(a1 + 40) shouldStashPictureInPictureIfNeeded]);
      if ([v2 isActivatingForSiri]) {
        [(SBRemoteTransientOverlayPresentationRequest *)v4 setShouldDismissSiri:0];
      }
      -[SBRemoteTransientOverlayPresentationRequest setIsScreenshotMarkup:](v4, "setIsScreenshotMarkup:", [v2 isScreenshotMarkup]);
      if (*(void *)(*(void *)(a1 + 32) + 24)
        || [*(id *)(*(void *)(a1 + 48) + 80) prefersEmbeddedDisplayPresentation])
      {
        [(SBRemoteTransientOverlayPresentationRequest *)v4 setWindowScene:*(void *)(a1 + 56)];
      }
      [(SBRemoteTransientOverlayPresentationRequest *)v4 setPresentationTarget:*(void *)(a1 + 64)];
      [(SBRemoteTransientOverlayPresentationRequest *)v4 setShouldPresentEmbeddedInTargetScene:*(unsigned __int8 *)(a1 + 104)];
      uint64_t v5 = [*(id *)(*(void *)(a1 + 48) + 80) sceneProvidingProcess];
      [(SBRemoteTransientOverlayPresentationRequest *)v4 setIsSceneBacked:v5 != 0];

      if ([WeakRetained remoteTransientOverlaySession:*(void *)(a1 + 32) performPresentationRequest:v4])
      {

        if (*(unsigned char *)(a1 + 105))
        {
          id v6 = *(id *)(*(void *)(a1 + 32) + 24);
          if (v6)
          {
            int v7 = [[SBRemoteTransientOverlayPresentationRequest alloc] initWithViewController:v6];
            -[SBRemoteTransientOverlayPresentationRequest setShouldDismissPresentedBanners:](v7, "setShouldDismissPresentedBanners:", [*(id *)(a1 + 40) shouldDismissPresentedBanners]);
            if ([v6 isActivatingForSiri]) {
              [(SBRemoteTransientOverlayPresentationRequest *)v7 setShouldDismissSiri:0];
            }
            -[SBRemoteTransientOverlayPresentationRequest setIsScreenshotMarkup:](v7, "setIsScreenshotMarkup:", [v6 isScreenshotMarkup]);
            [(SBRemoteTransientOverlayPresentationRequest *)v7 setPresentationTarget:*(void *)(a1 + 64)];
            [(SBRemoteTransientOverlayPresentationRequest *)v7 setWindowScene:*(void *)(a1 + 72)];
            [(SBRemoteTransientOverlayPresentationRequest *)v7 setShouldPresentEmbeddedInTargetScene:*(unsigned __int8 *)(a1 + 106)];
            id v8 = [*(id *)(*(void *)(a1 + 48) + 80) sceneProvidingProcess];
            [(SBRemoteTransientOverlayPresentationRequest *)v7 setIsSceneBacked:v8 != 0];

            char v9 = [WeakRetained remoteTransientOverlaySession:*(void *)(a1 + 32) performPresentationRequest:v7];
            if ((v9 & 1) == 0) {
              [*(id *)(a1 + 32) _invalidateWithReason:4 error:0];
            }
          }
          else
          {
            __int16 v13 = SBLogTransientOverlay();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v14 = *(void *)(a1 + 48);
              uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 96));
              int v17 = 138543618;
              uint64_t v18 = v14;
              __int16 v19 = 2114;
              BOOL v20 = v15;
              _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: can't perform secondary presentation, view controller is nil", (uint8_t *)&v17, 0x16u);
            }
            char v9 = 0;
          }
        }
        else
        {
          char v9 = 0;
        }
        char v12 = 1;
        goto LABEL_26;
      }
      [*(id *)(a1 + 32) _invalidateWithReason:4 error:0];
    }
    else
    {
      SBLogTransientOverlay();
      v4 = (SBRemoteTransientOverlayPresentationRequest *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 48);
        uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 96));
        int v17 = 138543618;
        uint64_t v18 = v10;
        __int16 v19 = 2114;
        BOOL v20 = v11;
        _os_log_impl(&dword_1D85BA000, &v4->super, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: can't perform presentation, primary container view controller is nil", (uint8_t *)&v17, 0x16u);
      }
    }

    char v12 = 0;
    char v9 = 0;
LABEL_26:
    *(unsigned char *)(*(void *)(a1 + 32) + 34) = v12;
    *(unsigned char *)(*(void *)(a1 + 32) + 35) = v9;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (void)addSessionObserver:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v7];
}

- (void)deactivate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  v4 = SBLogTransientOverlay();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v6 = objc_alloc(MEMORY[0x1E4F4F6C0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__SBRemoteTransientOverlaySession_deactivate__block_invoke;
  v8[3] = &unk_1E6B01DC8;
  objc_copyWeak(&v9, (id *)buf);
  id v7 = (void *)[v6 initWithBlock:v8];
  [v7 setDebugName:@"deactivate"];
  [(SBRemoteTransientOverlaySession *)self _addTransaction:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __45__SBRemoteTransientOverlaySession_deactivate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isValid])
  {
    id v6 = WeakRetained[2];
    if (v6)
    {
      id v7 = objc_loadWeakRetained(WeakRetained + 13);
      id v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      id v9 = [[SBRemoteTransientOverlayDismissalRequest alloc] initWithViewController:v6];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_2;
      v17[3] = &unk_1E6AF4AC0;
      uint64_t v10 = v8;
      uint64_t v18 = v10;
      [(SBRemoteTransientOverlayDismissalRequest *)v9 setCompletionHandler:v17];
      [v7 remoteTransientOverlaySession:WeakRetained performDismissalRequest:v9];
      id v11 = WeakRetained[3];
      if (v11)
      {
        dispatch_group_enter(v10);
        __int16 v12 = [[SBRemoteTransientOverlayDismissalRequest alloc] initWithViewController:v11];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_3;
        v15[3] = &unk_1E6AF4AC0;
        uint64_t v16 = v10;
        [(SBRemoteTransientOverlayDismissalRequest *)v12 setCompletionHandler:v15];
        [v7 remoteTransientOverlaySession:WeakRetained performDismissalRequest:v12];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_4;
      block[3] = &unk_1E6AF5300;
      id v14 = v4;
      dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_2(uint64_t a1)
{
}

void __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_3(uint64_t a1)
{
}

uint64_t __45__SBRemoteTransientOverlaySession_deactivate__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getActionForHandlingButtonEvents:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F4F6C0]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  __int16 v12 = __79__SBRemoteTransientOverlaySession_getActionForHandlingButtonEvents_completion___block_invoke;
  __int16 v13 = &unk_1E6B0A420;
  objc_copyWeak(v15, &location);
  id v8 = v6;
  id v14 = v8;
  v15[1] = (id)a3;
  id v9 = (void *)[v7 initWithBlock:&v10];
  objc_msgSend(v9, "setDebugName:", @"getActionForHandlingButtonEvents", v10, v11, v12, v13);
  [(SBRemoteTransientOverlaySession *)self _addTransaction:v9];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __79__SBRemoteTransientOverlaySession_getActionForHandlingButtonEvents_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __79__SBRemoteTransientOverlaySession_getActionForHandlingButtonEvents_completion___block_invoke_2;
  __int16 v12 = &unk_1E6B0A3F8;
  id v13 = v4;
  id v14 = *(id *)(a1 + 32);
  id v6 = v4;
  id v7 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](&v9);
  if (objc_msgSend(WeakRetained, "isValid", v9, v10, v11, v12))
  {
    id v8 = [WeakRetained _actionForHandlingButtonEvents:*(void *)(a1 + 48)];
    ((void (**)(void, void *, void))v7)[2](v7, v8, 0);
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

void __79__SBRemoteTransientOverlaySession_getActionForHandlingButtonEvents_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = a3 != 0;
  id v6 = *(void (**)(uint64_t, BOOL))(v4 + 16);
  id v7 = a2;
  v6(v4, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)hasPendingButtonEvents:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  identifierToHandlingButtonEvents = self->_identifierToHandlingButtonEvents;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SBRemoteTransientOverlaySession_hasPendingButtonEvents___block_invoke;
  v6[3] = &unk_1E6B0A448;
  v6[4] = &v7;
  v6[5] = a3;
  [(NSMutableDictionary *)identifierToHandlingButtonEvents enumerateKeysAndObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __58__SBRemoteTransientOverlaySession_hasPendingButtonEvents___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 integerValue];
  if ((*(void *)(a1 + 40) & result) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)hasServiceProcessIdentifier:(int)a3
{
  return [(SBRemoteTransientOverlayViewController *)self->_containerViewController hasServiceProcessIdentifier:*(void *)&a3];
}

- (NSString)serviceBundleIdentifier
{
  return (NSString *)[(SBRemoteTransientOverlayViewController *)self->_containerViewController serviceBundleIdentifier];
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  return [(SBRemoteTransientOverlayViewController *)self->_containerViewController isPresentedFromSceneWithIdentityTokenString:a3];
}

- (BOOL)isPresentedOnWindowScene:(id)a3
{
  char v4 = [(UIViewController *)self->_containerViewController _sbWindowScene];
  if ([v4 isMainDisplayWindowScene])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(UIViewController *)self->_secondaryViewController _sbWindowScene];
    char v5 = [v6 isMainDisplayWindowScene];
  }
  return v5;
}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  [(SBRemoteTransientOverlaySession *)self _requestInvalidationWithReason:2 error:0];
}

- (BOOL)isSwitcherEligible
{
  return [(SBRemoteTransientOverlayViewController *)self->_containerViewController isSwitcherEligible];
}

- (void)prepareWithConfigurationContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_prepared)
  {
    id v6 = SBLogTransientOverlay();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      BOOL v20 = v7;
      __int16 v21 = 2114;
      id v22 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@", buf, 0x20u);
    }
    self->_prepared = 1;
    objc_initWeak((id *)buf, self);
    id v8 = objc_alloc(MEMORY[0x1E4F4F6C0]);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    __int16 v12 = __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke;
    id v13 = &unk_1E6B0A3D0;
    objc_copyWeak(v16, (id *)buf);
    id v14 = self;
    v16[1] = (id)a2;
    id v15 = v5;
    uint64_t v9 = (void *)[v8 initWithBlock:&v10];
    objc_msgSend(v9, "setDebugName:", @"prepareWithConfigurationContext", v10, v11, v12, v13, v14);
    [(SBRemoteTransientOverlaySession *)self _addTransaction:v9];

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }
}

void __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained isValid])
  {
    id v6 = [WeakRetained definition];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 64);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_35;
    v12[3] = &unk_1E6B0A470;
    id v13 = v6;
    id v14 = WeakRetained;
    id v15 = *(id *)(a1 + 40);
    id v16 = v4;
    id v8 = v6;
    +[SBRemoteTransientOverlayViewController requestViewControllersForAlertDefinition:v8 sceneWorkspaceController:v7 connectionHandler:v12];
  }
  else
  {
    uint64_t v9 = SBLogTransientOverlay();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      BOOL v20 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: bailing out early because session is no longer valid", buf, 0x16u);
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_35(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v8
    && (!SBFIsChamoisExternalDisplayControllerAvailable()
     || ([*(id *)(a1 + 32) secondaryViewControllerClassName],
         uint64_t v11 = objc_claimAutoreleasedReturnValue(),
         v11,
         v9)
     || !v11))
  {
    __int16 v12 = +[SBUIController sharedInstanceIfExists];
    int v13 = [v12 isConnectedToWindowedAccessory];

    if (v13)
    {
      id v14 = +[SBUIController sharedInstanceIfExists];
      [v14 visibleScreenCoordinatesForWindowedAccessory];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;

      objc_msgSend(v8, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", 1, v16, v18, v20, v22);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), a2);
    [v8 setDelegate:*(void *)(a1 + 40)];
    uint64_t v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    uint64_t v24 = *(void *)(a1 + 48);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_2;
    v31[3] = &unk_1E6AF4AC0;
    int v25 = v23;
    uint64_t v32 = v25;
    [v8 configureWithContext:v24 completion:v31];
    if (v9)
    {
      dispatch_group_enter(v25);
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), a3);
      [v9 setDelegate:*(void *)(a1 + 40)];
      [v8 setPairedRemoteTransientOverlay:v9];
      [v9 setPairedRemoteTransientOverlay:v8];
      uint64_t v26 = *(void *)(a1 + 48);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_3;
      v29[3] = &unk_1E6AF4AC0;
      uint64_t v30 = v25;
      [v9 configureWithContext:v26 completion:v29];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_4;
    block[3] = &unk_1E6AF5300;
    id v28 = *(id *)(a1 + 56);
    dispatch_group_notify(v25, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [*(id *)(a1 + 40) _invalidateWithReason:4 error:v10];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_2(uint64_t a1)
{
}

void __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_3(uint64_t a1)
{
}

uint64_t __67__SBRemoteTransientOverlaySession_prepareWithConfigurationContext___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeSessionObserver:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(NSHashTable *)self->_observers removeObject:v4];

  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)_addTransaction:(id)a3
{
  id v8 = a3;
  BSDispatchQueueAssertMain();
  if (self->_activeTransaction)
  {
    pendingTransactions = self->_pendingTransactions;
    if (!pendingTransactions)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = self->_pendingTransactions;
      self->_pendingTransactions = v6;

      pendingTransactions = self->_pendingTransactions;
    }
    [(NSMutableArray *)pendingTransactions addObject:v8];
  }
  else
  {
    objc_storeStrong((id *)&self->_activeTransaction, a3);
    [(SBRemoteTransientOverlaySession *)self _registerObserversForTransaction:self->_activeTransaction];
    [(BSTransaction *)self->_activeTransaction begin];
  }
}

- (void)_didActivate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (!self->_activated)
  {
    id v4 = SBLogTransientOverlay();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      double v18 = self;
      __int16 v19 = 2114;
      double v20 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    self->_activated = 1;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 remoteTransientOverlaySessionDidActivate:self];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_didDeactivate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (self->_activated)
  {
    id v4 = SBLogTransientOverlay();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      double v18 = self;
      __int16 v19 = 2114;
      double v20 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    [(SBRemoteTransientOverlayViewController *)self->_containerViewController didDeactivate];
    [(SBRemoteTransientOverlayViewController *)self->_secondaryViewController didDeactivate];
    self->_activated = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 remoteTransientOverlaySessionDidDeactivate:self];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (id)_actionForHandlingButtonEvents:(unint64_t)a3
{
  BSDispatchQueueAssertMain();
  if (self->_containerViewController)
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    identifierToHandlingButtonEvents = self->_identifierToHandlingButtonEvents;
    if (!identifierToHandlingButtonEvents)
    {
      uint64_t v7 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      uint64_t v8 = self->_identifierToHandlingButtonEvents;
      self->_identifierToHandlingButtonEvents = v7;

      identifierToHandlingButtonEvents = self->_identifierToHandlingButtonEvents;
    }
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)identifierToHandlingButtonEvents setObject:v9 forKey:v5];

    id v10 = objc_alloc(MEMORY[0x1E4FA7D20]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__SBRemoteTransientOverlaySession__actionForHandlingButtonEvents___block_invoke;
    v14[3] = &unk_1E6B0A498;
    v14[4] = self;
    id v15 = v5;
    unint64_t v16 = a3;
    id v11 = v5;
    long long v12 = (void *)[v10 initWithButtonEvents:a3 withHandler:v14];
  }
  else
  {
    long long v12 = 0;
  }
  return v12;
}

void __66__SBRemoteTransientOverlaySession__actionForHandlingButtonEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  BSDispatchMain();
}

void __66__SBRemoteTransientOverlaySession__actionForHandlingButtonEvents___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  if (v4 && ([v4 error], id v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    if (![*(id *)(a1 + 48) unHandledButtonEvents]) {
      return;
    }
  }
  else if (!v5)
  {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  [WeakRetained remoteTransientOverlaySession:*(void *)(a1 + 32) requestsHandlingForButtonEvents:*(void *)(a1 + 56) viewController:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)_invalidateWithReason:(int64_t)a3 error:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BSDispatchQueueAssertMain();
  self->_pendingInvalidation = 0;
  uint64_t v8 = SBLogTransientOverlay();
  uint64_t v9 = v8;
  if (v7)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v10 = NSStringFromSelector(a2);
    SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
    id v11 = SBSRemoteAlertHandleInvalidationErrorDescription();
    *(_DWORD *)buf = 138544130;
    v40 = self;
    __int16 v41 = 2114;
    BOOL v42 = v10;
    __int16 v43 = 2114;
    v44 = v11;
    __int16 v45 = 2114;
    id v46 = v7;
    _os_log_error_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@, error: %{public}@", buf, 0x2Au);
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v10 = NSStringFromSelector(a2);
    SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
    id v11 = SBSRemoteAlertHandleInvalidationErrorDescription();
    *(_DWORD *)buf = 138543874;
    v40 = self;
    __int16 v41 = 2114;
    BOOL v42 = v10;
    __int16 v43 = 2114;
    v44 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@", buf, 0x20u);
  }

LABEL_7:
  [(SBRemoteTransientOverlayViewController *)self->_containerViewController didInvalidate];
  containerViewController = self->_containerViewController;
  self->_containerViewController = 0;

  [(SBRemoteTransientOverlayViewController *)self->_secondaryViewController didInvalidate];
  secondaryViewController = self->_secondaryViewController;
  self->_secondaryViewController = 0;

  if (self->_activated)
  {
    self->_activated = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v14 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          __int16 v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v19 remoteTransientOverlaySessionDidDeactivate:self];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v16);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
  [WeakRetained remoteTransientOverlaySession:self didInvalidateWithReason:a3 error:v7];

  if (self->_valid)
  {
    self->_valid = 0;
    uint64_t v21 = (NSError *)[v7 copy];
    error = self->_error;
    self->_error = v21;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v23 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v30 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v28 remoteTransientOverlaySession:self didInvalidateWithReason:a3 error:v7];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v25);
    }
  }
}

- (void)_requestInvalidationWithReason:(int64_t)a3 error:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BSDispatchQueueAssertMain();
  if (self->_valid && !self->_pendingInvalidation) {
    self->_pendingInvalidation = 1;
  }
  uint64_t v8 = SBLogTransientOverlay();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = NSStringFromSelector(a2);
      SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
      id v11 = SBSRemoteAlertHandleInvalidationErrorDescription();
      *(_DWORD *)buf = 138544130;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      uint64_t v25 = v11;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_error_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@, error: %{public}@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = NSStringFromSelector(a2);
    SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
    long long v13 = SBSRemoteAlertHandleInvalidationErrorDescription();
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = self;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    uint64_t v25 = v13;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  id v14 = objc_alloc(MEMORY[0x1E4F4F6C0]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke;
  v17[3] = &unk_1E6B0A4E8;
  objc_copyWeak(v19, (id *)buf);
  v19[1] = (id)a3;
  id v15 = v7;
  id v18 = v15;
  uint64_t v16 = (void *)[v14 initWithBlock:v17];
  [v16 setDebugName:@"_requestInvalidationWithReason"];
  [(SBRemoteTransientOverlaySession *)self _addTransaction:v16];

  objc_destroyWeak(v19);
  objc_destroyWeak((id *)buf);
}

void __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_2;
  v22[3] = &unk_1E6B0A4C0;
  id v6 = (id *)WeakRetained;
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v23 = v6;
  uint64_t v26 = v7;
  id v24 = *(id *)(a1 + 32);
  id v8 = v4;
  id v25 = v8;
  uint64_t v9 = (void (**)(void, void))MEMORY[0x1D948C7A0](v22);
  if ([v6 isValid])
  {
    id v10 = v6[2];
    if (v10 && *((unsigned char *)v6 + 33))
    {
      id v11 = objc_loadWeakRetained(v6 + 13);
      long long v12 = dispatch_group_create();
      dispatch_group_enter(v12);
      long long v13 = [[SBRemoteTransientOverlayDismissalRequest alloc] initWithViewController:v10];
      [(SBRemoteTransientOverlayDismissalRequest *)v13 setShouldInvalidatePresentation:1];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      id v20[2] = __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_3;
      v20[3] = &unk_1E6AF4AC0;
      id v14 = v12;
      uint64_t v21 = v14;
      [(SBRemoteTransientOverlayDismissalRequest *)v13 setCompletionHandler:v20];
      [v11 remoteTransientOverlaySession:v6 performDismissalRequest:v13];
      if (v6[3])
      {
        dispatch_group_enter(v14);
        id v15 = [[SBRemoteTransientOverlayDismissalRequest alloc] initWithViewController:v6[3]];
        [(SBRemoteTransientOverlayDismissalRequest *)v15 setShouldInvalidatePresentation:1];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_4;
        v18[3] = &unk_1E6AF4AC0;
        __int16 v19 = v14;
        [(SBRemoteTransientOverlayDismissalRequest *)v15 setCompletionHandler:v18];
        [v11 remoteTransientOverlaySession:v6 performDismissalRequest:v15];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_5;
      block[3] = &unk_1E6AF5300;
      uint64_t v17 = v9;
      dispatch_group_notify(v14, MEMORY[0x1E4F14428], block);
    }
    else
    {
      v9[2](v9, 1);
    }
  }
  else
  {
    v9[2](v9, 1);
  }
}

uint64_t __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateWithReason:*(void *)(a1 + 56) error:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_3(uint64_t a1)
{
}

void __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_4(uint64_t a1)
{
}

uint64_t __72__SBRemoteTransientOverlaySession__requestInvalidationWithReason_error___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_processPendingTransactions
{
  obuint64_t j = [(NSMutableArray *)self->_pendingTransactions firstObject];
  if (obj) {
    [(NSMutableArray *)self->_pendingTransactions removeObjectAtIndex:0];
  }
  objc_storeStrong((id *)&self->_activeTransaction, obj);
  if (self->_activeTransaction)
  {
    -[SBRemoteTransientOverlaySession _registerObserversForTransaction:](self, "_registerObserversForTransaction:");
    [(BSTransaction *)self->_activeTransaction begin];
  }
  if (![(NSMutableArray *)self->_pendingTransactions count])
  {
    pendingTransactions = self->_pendingTransactions;
    self->_pendingTransactions = 0;
  }
}

- (void)_registerObserversForTransaction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__SBRemoteTransientOverlaySession__registerObserversForTransaction___block_invoke;
  v5[3] = &unk_1E6B0A538;
  objc_copyWeak(&v6, &location);
  [v4 registerBlockObserver:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __68__SBRemoteTransientOverlaySession__registerObserversForTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__SBRemoteTransientOverlaySession__registerObserversForTransaction___block_invoke_2;
  v4[3] = &unk_1E6B0A510;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  [v3 addTransactionDidCompleteBlock:v4];
  objc_destroyWeak(&v5);
}

void __68__SBRemoteTransientOverlaySession__registerObserversForTransaction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _processPendingTransactions];
    id WeakRetained = v2;
  }
}

- (SBSRemoteAlertDefinition)definition
{
  return self->_definition;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (BOOL)isPrepared
{
  return self->_prepared;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)isPendingInvalidation
{
  return self->_pendingInvalidation;
}

- (SBRemoteTransientOverlaySessionHostDelegate)hostDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
  return (SBRemoteTransientOverlaySessionHostDelegate *)WeakRetained;
}

- (void)setHostDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostDelegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_sceneWorkspaceController, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_identifierToHandlingButtonEvents, 0);
  objc_storeStrong((id *)&self->_secondaryViewController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
}

@end