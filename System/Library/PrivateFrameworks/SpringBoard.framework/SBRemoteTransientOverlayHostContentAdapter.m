@interface SBRemoteTransientOverlayHostContentAdapter
+ (void)requestContentAdaptersForAlertDefinition:(id)a3 sceneWorkspaceController:(id)a4 connectionHandler:(id)a5;
- (BOOL)_allowsHomeButtonDismissal;
- (BOOL)_performButtonEvents:(unint64_t)a3;
- (BOOL)_shouldInvalidateForSecureDrawingMode;
- (BOOL)allowsCustomPresentationDismissalAnimations;
- (BOOL)allowsStackingOverlayContentAbove;
- (BOOL)handleDoubleHeightStatusBarTap;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hidEventDeferringDisabled;
- (BOOL)isActivatingForSiri;
- (BOOL)isAttachedToWindowedAccessory;
- (BOOL)isContentOpaque;
- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3;
- (BOOL)isScreenshotMarkup;
- (BOOL)isSwitcherEligible;
- (BOOL)shouldDisableBanners;
- (BOOL)shouldDisableControlCenter;
- (BOOL)shouldDisableInteractiveScreenshotGesture;
- (BOOL)shouldDisableOrientationUpdates;
- (BOOL)shouldDisableReachability;
- (BOOL)shouldDisableSiri;
- (BOOL)shouldEnableFadeInAnimation;
- (BOOL)shouldEnableFadeOutAnimation;
- (BOOL)shouldIgnoreContentOverlayInsetUpdates;
- (BOOL)shouldInvalidateWhenDeactivated;
- (BOOL)shouldPendAlertItems;
- (BOOL)shouldPresentEmbeddedInTargetSceneIfRequested;
- (BOOL)shouldUpdateSceneBasedViewController;
- (BOOL)shouldUseSceneBasedKeyboardFocus;
- (CGRect)windowedAccessoryCutoutFrameInScreen;
- (FBSSceneIdentityToken)clientSceneIdentityToken;
- (FBScene)sceneForClientSettings;
- (NSNumber)preferredSceneDeactivationReasonValue;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (NSString)associatedSceneIdentifierToSuppressInSystemAperture;
- (NSString)description;
- (NSString)preferredDisplayLayoutElementIdentifier;
- (NSString)serviceBundleIdentifier;
- (SBIdleTimerCoordinating)idleTimerCoordinator;
- (SBRemoteTransientOverlayHostContentAdapterDelegate)delegate;
- (_UILegibilitySettings)preferredStatusBarLegibilitySettings;
- (double)customIdleExpirationTimeout;
- (id)_contentViewController;
- (id)_initWithContentViewController:(id)a3;
- (id)_initWithSceneController:(id)a3 processIdentity:(id)a4 configurationIdentifier:(id)a5;
- (id)contentViewControllerForPresentationEmbeddedInSceneView:(BOOL)a3;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)dismissScene:(id)a3;
- (id)keyboardFocusTarget;
- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)preferredStatusBarVisibility;
- (int)serviceProcessIdentifier;
- (int64_t)defaultPreferredInterfaceOrientationForPresentationForRemoteTransientOverlayHostViewController:(id)a3;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)preferredBackgroundStyle;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredLockedGestureDismissalStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredUnlockedGestureDismissalStyle;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (unint64_t)_desiredHardwareButtonEvents;
- (unint64_t)supportedInterfaceOrientations;
- (void)_callSceneViewControllerReadyBlockWithError:(id)a3;
- (void)_handleUpdatedSwipeDismissalStyle:(int64_t)a3;
- (void)_setDesiredAutoLockDuration:(double)a3;
- (void)_setDesiredIdleTimerSettings:(id)a3;
- (void)_setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_updateBackgroundActivitiesToSuppressWithAnimationSettings:(id)a3;
- (void)_updateContentOpaqueProperty;
- (void)_updatePreferredBackgroundStyleWithAnimationSettings:(id)a3;
- (void)_updatePreferredGestureDismissalStyles;
- (void)_updatePreferredWhitePointAdaptivityStyle:(int64_t)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didDeactivateForRemoteAlertSessionDeactivation;
- (void)didInvalidateForRemoteAlert;
- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4;
- (void)dismissForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4;
- (void)doBoundsPreservingRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
- (void)featurePolicyHostComponentDidChangeShouldDisableAlertItems:(id)a3;
- (void)featurePolicyHostComponentDidChangeShouldDisableBanners:(id)a3;
- (void)featurePolicyHostComponentDidChangeShouldDisableControlCenter:(id)a3;
- (void)featurePolicyHostComponentDidChangeShouldDisableInteractiveScreenshotGesture:(id)a3;
- (void)featurePolicyHostComponentDidChangeShouldDisableReachability:(id)a3;
- (void)featurePolicyHostComponentDidChangeShouldDisableSiri:(id)a3;
- (void)handlePictureInPictureDidBegin;
- (void)prepareForActivationWithContext:(id)a3 presentationMode:(int64_t)a4 windowScene:(id)a5 completion:(id)a6;
- (void)presentForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4;
- (void)preserveInputViewsAnimated:(BOOL)a3;
- (void)remoteAlertSceneHostComponent:(id)a3 didChangeBackgroundActivitiesToSuppressWithAnimationSettings:(id)a4;
- (void)remoteAlertSceneHostComponent:(id)a3 didChangePreferredStatusBarVisibilityWithAnimationSettings:(id)a4;
- (void)remoteAlertSceneHostComponent:(id)a3 didChangeWallpaperStyleWithAnimationSettings:(id)a4;
- (void)remoteAlertSceneHostComponent:(id)a3 didSetIdleTimerDisabled:(BOOL)a4 forReason:(id)a5;
- (void)remoteAlertSceneHostComponentDidChangeDesiredAutoLockDuration:(id)a3;
- (void)remoteAlertSceneHostComponentDidChangeDesiredIdleTimerSettings:(id)a3;
- (void)remoteAlertSceneHostComponentDidChangeHIDEventDeferringDisabled:(id)a3;
- (void)remoteAlertSceneHostComponentDidChangePreferredSceneDeactivationReason:(id)a3;
- (void)remoteAlertSceneHostComponentDidChangeShouldDisableOrientationUpdates:(id)a3;
- (void)remoteAlertSceneHostComponentDidChangeSupportedInterfaceOrientations:(id)a3;
- (void)remoteAlertSceneHostComponentDidChangeSwipeDismissalStyle:(id)a3;
- (void)remoteAlertSceneHostComponentDidChangeWhitePointAdaptivityStyle:(id)a3;
- (void)remoteAlertSceneHostComponentDidDeactivate:(id)a3;
- (void)remoteAlertSceneHostComponentDidInvalidate:(id)a3;
- (void)remoteTransientOverlayHostViewController:(id)a3 didChangeBackgroundActivitiesToSuppressWithAnimationSettings:(id)a4;
- (void)remoteTransientOverlayHostViewController:(id)a3 didChangeLaunchingInterfaceOrientation:(int64_t)a4;
- (void)remoteTransientOverlayHostViewController:(id)a3 didChangeWhitePointAdaptivityStyle:(int64_t)a4;
- (void)remoteTransientOverlayHostViewController:(id)a3 didSetDesiredIdleTimerSettings:(id)a4;
- (void)remoteTransientOverlayHostViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4 forReason:(id)a5;
- (void)remoteTransientOverlayHostViewController:(id)a3 didTerminateWithError:(id)a4;
- (void)remoteTransientOverlayHostViewController:(id)a3 requestsWallpaperEffectUpdateWithAnimationSettings:(id)a4;
- (void)remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:(id)a3;
- (void)remoteTransientOverlayHostViewControllerDidChangePreferredSceneDeactivationReasonValue:(id)a3;
- (void)remoteTransientOverlayHostViewControllerDidChangePrefersWallpaperTunnel:(id)a3;
- (void)remoteTransientOverlayHostViewControllerDidChangeRequestedBackgroundStyle:(id)a3 withAnimationSettings:(id)a4;
- (void)remoteTransientOverlayHostViewControllerDidChangeShouldDisableOrientationUpdates:(id)a3;
- (void)remoteTransientOverlayHostViewControllerDidChangeSwipeDismissalStyle:(id)a3;
- (void)remoteTransientOverlayHostViewControllerRequestsDeactivation:(id)a3;
- (void)remoteTransientOverlayHostViewControllerRequestsInvalidation:(id)a3;
- (void)restoreInputViewsAnimated:(BOOL)a3;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
- (void)setActivatingForSiri:(BOOL)a3;
- (void)setAllowsCustomPresentationDismissalAnimations:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHidEventDeferringDisabled:(BOOL)a3;
- (void)setIdleTimerCoordinator:(id)a3;
- (void)setIsScreenshotMarkup:(BOOL)a3;
- (void)setMediaOverridePID:(int)a3;
- (void)setShouldEnableFadeInAnimation:(BOOL)a3;
- (void)setShouldEnableFadeOutAnimation:(BOOL)a3;
- (void)setShouldIgnoreContentOverlayInsetUpdates:(BOOL)a3;
- (void)setShouldPresentEmbeddedInTargetSceneIfRequested:(BOOL)a3;
- (void)setSwitcherEligible:(BOOL)a3;
@end

@implementation SBRemoteTransientOverlayHostContentAdapter

- (id)_initWithContentViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRemoteTransientOverlayHostContentAdapter;
  v6 = [(SBRemoteTransientOverlayHostContentAdapter *)&v9 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hostRemoteViewController, a3);
    [p_isa[13] setDelegate:p_isa];
  }

  return p_isa;
}

- (id)_initWithSceneController:(id)a3 processIdentity:(id)a4 configurationIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBRemoteTransientOverlayHostContentAdapter;
  v12 = [(SBRemoteTransientOverlayHostContentAdapter *)&v22 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sceneController, a3);
    [p_isa[7] setPresenter:p_isa];
    objc_storeStrong(p_isa + 6, a4);
    v14 = [p_isa[7] scene];
    [v14 addObserver:p_isa];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = [v14 componentForExtension:v15 ofClass:objc_opt_class()];
    id v17 = p_isa[8];
    p_isa[8] = (id)v16;

    [p_isa[8] setDelegate:p_isa];
    [p_isa[8] setConfigurationIdentifier:v11];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = [v14 componentForExtension:v18 ofClass:objc_opt_class()];
    id v20 = p_isa[9];
    p_isa[9] = (id)v19;

    [p_isa[9] setDelegate:p_isa];
  }

  return p_isa;
}

- (void)dealloc
{
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    [(SBRemoteTransientOverlayHostViewController *)hostRemoteViewController setDelegate:0];
  }
  else
  {
    [(SBSUIRemoteAlertSceneHostComponent *)self->_remoteAlertHostComponent setDelegate:0];
    [(SBSUIFeaturePolicyHostComponent *)self->_featurePolicyHostComponent setDelegate:0];
    v4 = [(SBSingleSceneController *)self->_sceneController scene];
    [v4 removeObserver:self];

    [(SBSingleSceneController *)self->_sceneController invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayHostContentAdapter;
  [(SBRemoteTransientOverlayHostContentAdapter *)&v5 dealloc];
}

+ (void)requestContentAdaptersForAlertDefinition:(id)a3 sceneWorkspaceController:(id)a4 connectionHandler:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v50 = a4;
  id v9 = a5;
  id v10 = [v8 serviceName];
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__111;
  v78 = __Block_byref_object_dispose__111;
  id v79 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__111;
  v72 = __Block_byref_object_dispose__111;
  id v73 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__111;
  v66[4] = __Block_byref_object_dispose__111;
  id v67 = 0;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke;
  v63[3] = &unk_1E6B0C178;
  id v11 = v8;
  id v64 = v11;
  id v12 = v10;
  id v65 = v12;
  v13 = (void *)MEMORY[0x1D948C7A0](v63);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_2;
  v59[3] = &unk_1E6B0C1A0;
  id v62 = a1;
  id v14 = v13;
  id v60 = v14;
  v61 = v66;
  uint64_t v15 = (void *)MEMORY[0x1D948C7A0](v59);
  if ([v12 length])
  {
    uint64_t v16 = [v11 viewControllerClassName];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_3;
    v51[3] = &unk_1E6B0C1F0;
    id v54 = v15;
    v56 = &v74;
    v57 = v66;
    id v52 = v11;
    id v53 = v12;
    v58 = &v68;
    id v55 = v9;
    id v17 = +[_UIRemoteViewController requestViewController:v16 fromServiceWithBundleIdentifier:v53 connectionHandler:v51];

    uint64_t v18 = v54;
  }
  else
  {
    uint64_t v18 = [v11 sceneProvidingProcess];
    if (v18)
    {
      id v49 = objc_alloc_init(MEMORY[0x1E4F42D88]);
      id v19 = objc_alloc_init(MEMORY[0x1E4FA7C08]);
      [v49 setSpecification:v19];

      id v20 = NSString;
      v21 = [MEMORY[0x1E4F29128] UUID];
      objc_super v22 = [v21 UUIDString];
      v23 = [v20 stringWithFormat:@"%@-RemoteAlert", v22];
      [v49 setIdentifier:v23];

      v24 = [v49 specification];
      id v25 = (id)[v24 defaultExtensions];

      id v26 = objc_alloc_init(MEMORY[0x1E4F42BC8]);
      [v26 setPreferredSceneDeactivationReason:&unk_1F334B498];
      [v49 setInitialClientSettings:v26];
      v47 = v26;
      v27 = [SBSingleSceneController alloc];
      double v28 = *MEMORY[0x1E4F43CF8] + 5.0;
      v48 = -[SBSingleSceneController initWithSceneWorkspaceController:sceneRequestOptions:clientIdentity:traitsRole:level:](v27, "initWithSceneWorkspaceController:sceneRequestOptions:clientIdentity:traitsRole:level:", v50, v49, v18, v28);
      v29 = SBLogTransientOverlay();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [(SBSingleSceneController *)v48 scene];
        *(_DWORD *)buf = 138543618;
        v81 = v48;
        __int16 v82 = 2114;
        uint64_t v83 = (uint64_t)v30;
        _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEFAULT, "created singleSceneController %{public}@ with scene %{public}@", buf, 0x16u);
      }
      id v31 = objc_alloc((Class)a1);
      v32 = [v11 configurationIdentifier];
      uint64_t v33 = [v31 _initWithSceneController:v48 processIdentity:v18 configurationIdentifier:v32];
      v34 = (void *)v75[5];
      v75[5] = v33;

      (*((void (**)(id, uint64_t))v14 + 2))(v14, v75[5]);
      if (SBFIsChamoisExternalDisplayControllerAvailable()
        && [v11 supportsMultipleDisplayPresentations])
      {
        v35 = NSString;
        v45 = [MEMORY[0x1E4F29128] UUID];
        v36 = [v45 UUIDString];
        v37 = [v35 stringWithFormat:@"%@-RemoteAlert", v36];
        [v49 setIdentifier:v37];

        v46 = [[SBSingleSceneController alloc] initWithSceneWorkspaceController:v50 sceneRequestOptions:v49 clientIdentity:v18 traitsRole:@"SBTraitsParticipantRoleTransientOverlay" level:v28];
        v38 = SBLogTransientOverlay();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = [(SBSingleSceneController *)v46 scene];
          *(_DWORD *)buf = 138543618;
          v81 = v46;
          __int16 v82 = 2114;
          uint64_t v83 = v39;
          v40 = (void *)v39;
          _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_DEFAULT, "created secondary singleSceneController %{public}@ with scene %{public}@", buf, 0x16u);
        }
        id v41 = objc_alloc((Class)a1);
        v42 = [v11 secondaryConfigurationIdentifier];
        uint64_t v43 = [v41 _initWithSceneController:v46 processIdentity:v18 configurationIdentifier:v42];
        v44 = (void *)v69[5];
        v69[5] = v43;

        (*((void (**)(id, uint64_t))v14 + 2))(v14, v69[5]);
      }
    }
    (*((void (**)(id, uint64_t, uint64_t, void))v9 + 2))(v9, v75[5], v69[5], 0);
  }

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
}

void __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  char v3 = [*(id *)(a1 + 32) isForCarPlay];
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    if ([*(id *)(a1 + 40) isEqualToString:@"com.apple.InCallService"])
    {
      [v6 setShouldEnableFadeInAnimation:1];
      [v6 setShouldEnableFadeOutAnimation:1];
      [v6 setSwitcherEligible:1];
    }
    else if ([*(id *)(a1 + 40) isEqualToString:@"com.apple.RemoteAlertTestUIService"])
    {
      [v6 setAllowsCustomPresentationDismissalAnimations:1];
    }
    else
    {
      int v5 = [*(id *)(a1 + 40) isEqualToString:@"com.apple.ScreenshotServicesService"];
      v4 = v6;
      if (!v5) {
        goto LABEL_9;
      }
      [v6 setIsScreenshotMarkup:1];
    }
    v4 = v6;
  }
LABEL_9:
}

void __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id obj = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = SBSafeCast(v8, v7);

  if (v9)
  {
    id v10 = (id) [objc_alloc(*(Class *)(a1 + 48)) _initWithContentViewController:v9];
    *a2 = v10;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_3:

    goto LABEL_7;
  }
  *a2 = 0;
  id v10 = obj;
  if (!obj)
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBRemoteTransientOverlayViewControllerErrorDomain" code:-1001 userInfo:0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
  if (!obj) {
    goto LABEL_3;
  }
LABEL_7:
}

void __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v15 = *(id *)(v3 + 40);
  (*(void (**)(void))(v2 + 16))();
  objc_storeStrong((id *)(v3 + 40), v15);
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
    && SBFIsChamoisExternalDisplayControllerAvailable()
    && ([*(id *)(a1 + 32) secondaryViewControllerClassName],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    int v5 = [*(id *)(a1 + 32) secondaryViewControllerClassName];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_4;
    v10[3] = &unk_1E6B0C1C8;
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 80);
    id v11 = v7;
    uint64_t v13 = v8;
    id v12 = *(id *)(a1 + 56);
    long long v14 = *(_OWORD *)(a1 + 64);
    id v9 = +[_UIRemoteViewController requestViewController:v5 fromServiceWithBundleIdentifier:v6 connectionHandler:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __130__SBRemoteTransientOverlayHostContentAdapter_requestContentAdaptersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  (*(void (**)(void))(v2 + 16))();
  objc_storeStrong((id *)(v3 + 40), obj);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (id)_contentViewController
{
  hostRemoteViewController = self->_hostRemoteViewController;
  if (!hostRemoteViewController) {
    hostRemoteViewController = (SBRemoteTransientOverlayHostViewController *)self->_sceneViewController;
  }
  return hostRemoteViewController;
}

- (id)contentViewControllerForPresentationEmbeddedInSceneView:(BOOL)a3
{
  hostRemoteViewController = self->_hostRemoteViewController;
  if (!hostRemoteViewController)
  {
    if (!a3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v5 = [(UIViewController *)self->_sceneViewController contentViewController];
        goto LABEL_7;
      }
    }
    hostRemoteViewController = (SBRemoteTransientOverlayHostViewController *)self->_sceneViewController;
  }
  int v5 = hostRemoteViewController;
LABEL_7:
  return v5;
}

- (int)serviceProcessIdentifier
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent)
  {
    v4 = [(SBSUIRemoteAlertSceneHostComponent *)remoteAlertHostComponent hostScene];
    int v5 = [v4 clientHandle];
    uint64_t v6 = [v5 processHandle];
    int v7 = [v6 pid];

    return v7;
  }
  else
  {
    hostRemoteViewController = self->_hostRemoteViewController;
    return [(_UIRemoteViewController *)hostRemoteViewController serviceProcessIdentifier];
  }
}

- (NSString)serviceBundleIdentifier
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent)
  {
    uint64_t v8 = [(_UIRemoteViewController *)self->_hostRemoteViewController serviceBundleIdentifier];
    goto LABEL_9;
  }
  v4 = [(SBSUIRemoteAlertSceneHostComponent *)remoteAlertHostComponent hostScene];
  int v5 = [v4 clientHandle];
  uint64_t v6 = [v5 processHandle];

  if ([v6 hasConsistentLaunchdJob])
  {
    uint64_t v7 = [v6 consistentJobLabel];
  }
  else
  {
    if (![v6 isDaemon])
    {
      if ([v6 isApplication])
      {
        id v10 = [v6 bundle];
        uint64_t v8 = [v10 identifier];
      }
      else
      {
        uint64_t v8 = 0;
      }
      goto LABEL_8;
    }
    uint64_t v7 = [v6 daemonJobLabel];
  }
  uint64_t v8 = (void *)v7;
LABEL_8:

LABEL_9:
  return (NSString *)v8;
}

- (NSString)preferredDisplayLayoutElementIdentifier
{
  uint64_t v3 = [(SBRemoteTransientOverlayHostContentAdapter *)self serviceBundleIdentifier];
  v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self serviceBundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.ContactsUI.LimitedAccessPromptView"];

  if (v5)
  {
    uint64_t v6 = [(SBSUIRemoteAlertSceneHostComponent *)self->_remoteAlertHostComponent hostScene];
    uint64_t v7 = [v6 identifier];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(SBRemoteTransientOverlayHostContentAdapter *)self serviceBundleIdentifier];
    }
    id v10 = v9;

    uint64_t v3 = v10;
  }
  return (NSString *)v3;
}

- (FBScene)sceneForClientSettings
{
  return [(SBSingleSceneController *)self->_sceneController scene];
}

- (FBSSceneIdentityToken)clientSceneIdentityToken
{
  uint64_t v2 = [(SBSUIRemoteAlertSceneHostComponent *)self->_remoteAlertHostComponent hostScene];
  uint64_t v3 = [v2 identityToken];

  return (FBSSceneIdentityToken *)v3;
}

- (NSString)associatedSceneIdentifierToSuppressInSystemAperture
{
  uint64_t v2 = [(SBSUIRemoteAlertSceneHostComponent *)self->_remoteAlertHostComponent hostScene];
  uint64_t v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)doBoundsPreservingRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  sceneViewController = self->_sceneViewController;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = sceneViewController;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v10 = v7;

  uint64_t v8 = v10;
  if (v10)
  {
    id v9 = [(UIViewController *)v10 view];
    [v9 setNeedsLayout];

    uint64_t v8 = v10;
  }
}

- (NSString)description
{
  return (NSString *)[(SBRemoteTransientOverlayHostContentAdapter *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBRemoteTransientOverlayHostContentAdapter *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = v3;
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    uint64_t v6 = @"remoteViewController";
  }
  else
  {
    id v7 = (id)[v3 appendObject:self->_remoteAlertHostComponent withName:@"remoteAlertSceneHostComponent"];
    hostRemoteViewController = self->_featurePolicyHostComponent;
    uint64_t v6 = @"featurePolicyHostComponent";
  }
  id v8 = (id)[v4 appendObject:hostRemoteViewController withName:v6];
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBRemoteTransientOverlayHostContentAdapter *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent) {
    return [(SBSUIRemoteAlertSceneHostComponent *)remoteAlertHostComponent allowsAlertStacking];
  }
  else {
    return [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController allowsStackingOverlayContentAbove];
  }
}

- (NSNumber)preferredSceneDeactivationReasonValue
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent) {
    [(SBSUIRemoteAlertSceneHostComponent *)remoteAlertHostComponent preferredSceneDeactivationReason];
  }
  else {
  v4 = [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController preferredSceneDeactivationReasonValue];
  }
  return (NSNumber *)v4;
}

- (int64_t)preferredStatusBarStyle
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent) {
    remoteAlertHostComponent = self->_hostRemoteViewController;
  }
  return [remoteAlertHostComponent preferredStatusBarStyle];
}

- (int)preferredStatusBarVisibility
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent) {
    return [(SBSUIRemoteAlertSceneHostComponent *)remoteAlertHostComponent preferredStatusBarVisibility];
  }
  else {
    return [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController _preferredStatusBarVisibility];
  }
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent) {
    [(SBSUIRemoteAlertSceneHostComponent *)remoteAlertHostComponent backgroundActivitiesToSuppress];
  }
  else {
  v4 = [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController preferredBackgroundActivitiesToSuppress];
  }
  return (NSSet *)v4;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  if (self->_preferredWhitePointAdaptivityStyleValue)
  {
    preferredWhitePointAdaptivityStyleValue = self->_preferredWhitePointAdaptivityStyleValue;
    return [(NSNumber *)preferredWhitePointAdaptivityStyleValue integerValue];
  }
  else
  {
    v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self _contentViewController];
    int64_t v5 = [v4 preferredWhitePointAdaptivityStyle];

    return v5;
  }
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  int64_t result = self->_launchingInterfaceOrientation;
  if (!result)
  {
    v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
    int64_t v5 = [v4 defaultPreferredInterfaceOrientationForPresentationForRemoteTransientOverlayHostContentAdapter:self];

    return v5;
  }
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent)
  {
    unint64_t v4 = [(SBSUIRemoteAlertSceneHostComponent *)remoteAlertHostComponent supportedInterfaceOrientations];
    if (v4) {
      return v4;
    }
    id v7 = [(SBSingleSceneController *)self->_sceneController scene];
    id v8 = [v7 clientHandle];

    if (!v8) {
      goto LABEL_9;
    }
    id v9 = +[SBApplicationController sharedInstance];
    id v10 = [v8 bundleIdentifier];
    id v11 = [v9 applicationWithBundleIdentifier:v10];

    id v12 = [v11 info];
    unint64_t v4 = [v12 supportedInterfaceOrientations];

    if (v4)
    {
      return v4;
    }
    else
    {
LABEL_9:
      sceneController = self->_sceneController;
      return [(SBSingleSceneController *)sceneController initialSupportedInterfaceOrientations];
    }
  }
  else
  {
    hostRemoteViewController = self->_hostRemoteViewController;
    return [(_UIRemoteViewController *)hostRemoteViewController supportedInterfaceOrientations];
  }
}

- (BOOL)shouldDisableOrientationUpdates
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent) {
    remoteAlertHostComponent = self->_hostRemoteViewController;
  }
  return [remoteAlertHostComponent shouldDisableOrientationUpdates];
}

- (BOOL)shouldIgnoreContentOverlayInsetUpdates
{
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController) {
    LOBYTE(hostRemoteViewController) = [(SBRemoteTransientOverlayHostViewController *)hostRemoteViewController shouldIgnoreContentOverlayInsetUpdates];
  }
  return (char)hostRemoteViewController;
}

- (void)setShouldIgnoreContentOverlayInsetUpdates:(BOOL)a3
{
}

- (void)setIsScreenshotMarkup:(BOOL)a3
{
  if (self->_isScreenshotMarkup != a3)
  {
    self->_isScreenshotMarkup = a3;
    id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
    [v4 remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:self];
  }
}

- (BOOL)shouldDisableBanners
{
  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (!featurePolicyHostComponent) {
    featurePolicyHostComponent = self->_hostRemoteViewController;
  }
  return [featurePolicyHostComponent shouldDisableBanners];
}

- (BOOL)shouldDisableControlCenter
{
  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (!featurePolicyHostComponent) {
    featurePolicyHostComponent = self->_hostRemoteViewController;
  }
  return [featurePolicyHostComponent shouldDisableControlCenter];
}

- (BOOL)shouldDisableReachability
{
  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (!featurePolicyHostComponent) {
    featurePolicyHostComponent = self->_hostRemoteViewController;
  }
  return [featurePolicyHostComponent shouldDisableReachability];
}

- (BOOL)shouldDisableInteractiveScreenshotGesture
{
  if (self->_isScreenshotMarkup) {
    return 1;
  }
  if (self->_featurePolicyHostComponent) {
    featurePolicyHostComponent = self->_featurePolicyHostComponent;
  }
  else {
    featurePolicyHostComponent = self->_hostRemoteViewController;
  }
  return [featurePolicyHostComponent shouldDisableInteractiveScreenshotGesture];
}

- (BOOL)shouldDisableSiri
{
  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (!featurePolicyHostComponent) {
    featurePolicyHostComponent = self->_hostRemoteViewController;
  }
  return [featurePolicyHostComponent shouldDisableSiri];
}

- (BOOL)shouldPendAlertItems
{
  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (featurePolicyHostComponent) {
    return [(SBSUIFeaturePolicyHostComponent *)featurePolicyHostComponent shouldDisableAlertItems];
  }
  else {
    return [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController shouldPendAlertItems];
  }
}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return self->_remoteAlertHostComponent != 0;
}

- (BOOL)shouldUpdateSceneBasedViewController
{
  return self->_remoteAlertHostComponent != 0;
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent) {
    return 0;
  }
  id v4 = a3;
  int64_t v5 = [(SBSUIRemoteAlertSceneHostComponent *)remoteAlertHostComponent hostScene];
  uint64_t v6 = [v5 identityToken];
  id v7 = [v6 stringRepresentation];
  char v8 = [v7 isEqualToString:v4];

  return v8;
}

- (id)keyboardFocusTarget
{
  uint64_t v2 = [(SBSUIRemoteAlertSceneHostComponent *)self->_remoteAlertHostComponent hostScene];
  uint64_t v3 = [v2 clientHandle];
  id v4 = [v3 processHandle];
  int v5 = [v4 pid];

  if (v5 < 1)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = +[SBKeyboardFocusTarget targetForFBScene:v2];
  }

  return v6;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(void))a4;
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    [(SBRemoteTransientOverlayHostViewController *)hostRemoteViewController configureWithContext:v9 completion:v6];
  }
  else
  {
    remoteAlertHostComponent = self->_remoteAlertHostComponent;
    if (remoteAlertHostComponent)
    {
      [(SBSUIRemoteAlertSceneHostComponent *)remoteAlertHostComponent setConfigurationContext:v9];
      if (v6) {
        v6[2](v6);
      }
    }
  }
}

- (void)prepareForActivationWithContext:(id)a3 presentationMode:(int64_t)a4 windowScene:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 isActivatingForSiri]) {
    self->_activatingForSiri = 1;
  }
  if ([v10 isSwitcherEligible])
  {
    uint64_t v13 = [(SBRemoteTransientOverlayHostContentAdapter *)self serviceBundleIdentifier];
    if (v13)
    {
      if (prepareForActivationWithContext_presentationMode_windowScene_completion__oOnceToken != -1) {
        dispatch_once(&prepareForActivationWithContext_presentationMode_windowScene_completion__oOnceToken, &__block_literal_global_367);
      }
      if ([(id)prepareForActivationWithContext_presentationMode_windowScene_completion__sAllowedBundleIDs containsObject:v13]&& !self->_switcherEligible)
      {
        self->_switcherEligible = 1;
        [(SBRemoteTransientOverlayHostContentAdapter *)self _updatePreferredGestureDismissalStyles];
      }
    }
  }
  if ([v10 shouldInvalidateWhenDeactivated]) {
    BOOL v14 = !self->_switcherEligible;
  }
  else {
    BOOL v14 = 0;
  }
  self->_shouldInvalidateWhenDeactivated = v14;
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    [(SBRemoteTransientOverlayHostViewController *)hostRemoteViewController prepareForActivationWithContext:v10 presentationMode:a4 completion:v12];
  }
  else if (self->_remoteAlertHostComponent)
  {
    [v10 setPresentationMode:a4];
    [(SBSUIRemoteAlertSceneHostComponent *)self->_remoteAlertHostComponent setActivationContext:v10];
    [(SBSUIRemoteAlertSceneHostComponent *)self->_remoteAlertHostComponent setDefaultStatusBarHeightsForWindowScene:v11];
    uint64_t v16 = (void *)[v12 copy];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __118__SBRemoteTransientOverlayHostContentAdapter_prepareForActivationWithContext_presentationMode_windowScene_completion___block_invoke_2;
    v22[3] = &unk_1E6AF5DA8;
    id v23 = v16;
    id v17 = v16;
    uint64_t v18 = (void *)MEMORY[0x1D948C7A0](v22);
    id sceneViewControllerReadyBlock = self->_sceneViewControllerReadyBlock;
    self->_id sceneViewControllerReadyBlock = v18;

    -[SBSingleSceneController setInitialSupportedInterfaceOrientations:](self->_sceneController, "setInitialSupportedInterfaceOrientations:", [v10 initialSupportedInterfaceOrientations]);
    sceneController = self->_sceneController;
    v21 = [v11 _fbsDisplayConfiguration];
    [(SBSingleSceneController *)sceneController setTargetDisplayConfiguration:v21];
  }
}

void __118__SBRemoteTransientOverlayHostContentAdapter_prepareForActivationWithContext_presentationMode_windowScene_completion___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.RemoteAlertTestUIService";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)prepareForActivationWithContext_presentationMode_windowScene_completion__sAllowedBundleIDs;
  prepareForActivationWithContext_presentationMode_windowScene_completion__sAllowedBundleIDs = v2;
}

uint64_t __118__SBRemoteTransientOverlayHostContentAdapter_prepareForActivationWithContext_presentationMode_windowScene_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didDeactivateForRemoteAlertSessionDeactivation
{
  if (self->_sceneController
    && !self->_invalidating
    && ![(SBRemoteTransientOverlayHostContentAdapter *)self shouldInvalidateWhenDeactivated])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__SBRemoteTransientOverlayHostContentAdapter_didDeactivateForRemoteAlertSessionDeactivation__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __92__SBRemoteTransientOverlayHostContentAdapter_didDeactivateForRemoteAlertSessionDeactivation__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setTargetDisplayConfiguration:0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  return [v2 setSceneActive:0];
}

- (void)didInvalidateForRemoteAlert
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (remoteAlertHostComponent)
  {
    [(SBSUIRemoteAlertSceneHostComponent *)remoteAlertHostComponent didInvalidateForRemoteAlertServiceInvalidation];
  }
  else
  {
    hostRemoteViewController = self->_hostRemoteViewController;
    if (hostRemoteViewController) {
      [(SBRemoteTransientOverlayHostViewController *)hostRemoteViewController didInvalidateForRemoteAlert];
    }
  }
}

- (void)handlePictureInPictureDidBegin
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogTransientOverlay();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = NSStringFromSelector(a2);
    int v7 = 138543618;
    char v8 = self;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Received %{public}@, invalidating...", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v6 remoteTransientOverlayHostContentAdapterRequestsInvalidation:self];
}

- (void)preserveInputViewsAnimated:(BOOL)a3
{
}

- (void)restoreInputViewsAnimated:(BOOL)a3
{
}

- (BOOL)isAttachedToWindowedAccessory
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent) {
    remoteAlertHostComponent = self->_hostRemoteViewController;
  }
  return [remoteAlertHostComponent isAttachedToWindowedAccessory];
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent) {
    remoteAlertHostComponent = self->_hostRemoteViewController;
  }
  [remoteAlertHostComponent windowedAccessoryCutoutFrameInScreen];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  if (self->_remoteAlertHostComponent) {
    remoteAlertHostComponent = self->_remoteAlertHostComponent;
  }
  else {
    remoteAlertHostComponent = self->_hostRemoteViewController;
  }
  objc_msgSend(remoteAlertHostComponent, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)setMediaOverridePID:(int)a3
{
}

- (void)setShouldPresentEmbeddedInTargetSceneIfRequested:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldPresentEmbeddedInTargetSceneIfRequested = a3;
  -[SBSingleSceneController setShouldPresentAnyContentState:](self->_sceneController, "setShouldPresentAnyContentState:");
  BOOL v5 = !v3;
  [(SBSingleSceneController *)self->_sceneController setShouldActivateForDisplayConfiguration:v5];
  sceneController = self->_sceneController;
  [(SBSingleSceneController *)sceneController setShouldForegroundForDisplayConfiguration:v5];
}

- (BOOL)hidEventDeferringDisabled
{
  return [(SBSUIRemoteAlertSceneHostComponent *)self->_remoteAlertHostComponent hidEventDeferringDisabled];
}

- (BOOL)shouldEnableFadeInAnimation
{
  return [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController shouldEnableFadeInAnimation];
}

- (void)setShouldEnableFadeInAnimation:(BOOL)a3
{
}

- (BOOL)shouldEnableFadeOutAnimation
{
  return [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController shouldEnableFadeOutAnimation];
}

- (void)setShouldEnableFadeOutAnimation:(BOOL)a3
{
}

- (BOOL)allowsCustomPresentationDismissalAnimations
{
  return [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController allowsCustomPresentationDismissalAnimations];
}

- (void)setAllowsCustomPresentationDismissalAnimations:(BOOL)a3
{
}

- (void)presentForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  double v6 = (void (**)(void))a4;
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    char v8 = v6;
    [(SBRemoteTransientOverlayHostViewController *)hostRemoteViewController presentForTransientOverlayAnimated:v4 completion:v6];
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    char v8 = v6;
    v6[2](v6);
  }
  double v6 = v8;
LABEL_6:
}

- (void)dismissForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  double v6 = (void (**)(void))a4;
  hostRemoteViewController = self->_hostRemoteViewController;
  if (hostRemoteViewController)
  {
    char v8 = v6;
    [(SBRemoteTransientOverlayHostViewController *)hostRemoteViewController dismissForTransientOverlayAnimated:v4 completion:v6];
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    char v8 = v6;
    v6[2](v6);
  }
  double v6 = v8;
LABEL_6:
}

- (BOOL)handleDoubleHeightStatusBarTap
{
  return [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController handleDoubleHeightStatusBarTap];
}

- (BOOL)handleHomeButtonPress
{
  if (([(SBRemoteTransientOverlayHostContentAdapter *)self _desiredHardwareButtonEvents] & 0x10) != 0)
  {
    LOBYTE(v3) = [(SBRemoteTransientOverlayHostContentAdapter *)self _performButtonEvents:16];
  }
  else
  {
    BOOL v3 = [(SBRemoteTransientOverlayHostContentAdapter *)self _allowsHomeButtonDismissal];
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ([(SBRemoteTransientOverlayHostContentAdapter *)self isSwitcherEligible]) {
        [WeakRetained remoteTransientOverlayHostContentAdapterRequestsDeactivation:self];
      }
      else {
        [WeakRetained remoteTransientOverlayHostContentAdapterRequestsInvalidation:self];
      }

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  if (([(SBRemoteTransientOverlayHostContentAdapter *)self _desiredHardwareButtonEvents] & 1) == 0) {
    return 0;
  }
  return [(SBRemoteTransientOverlayHostContentAdapter *)self _performButtonEvents:1];
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  if (([(SBRemoteTransientOverlayHostContentAdapter *)self _desiredHardwareButtonEvents] & 2) == 0) {
    return 0;
  }
  return [(SBRemoteTransientOverlayHostContentAdapter *)self _performButtonEvents:2];
}

- (BOOL)handleVolumeDownButtonPress
{
  if (([(SBRemoteTransientOverlayHostContentAdapter *)self _desiredHardwareButtonEvents] & 4) == 0) {
    return 0;
  }
  return [(SBRemoteTransientOverlayHostContentAdapter *)self _performButtonEvents:4];
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(SBRemoteTransientOverlayHostContentAdapter *)self _desiredHardwareButtonEvents];
  if (!v3)
  {
    if ((v5 & 8) != 0)
    {
      uint64_t v6 = 8;
      goto LABEL_7;
    }
    return 0;
  }
  if ((v5 & 0x20) == 0) {
    return 0;
  }
  uint64_t v6 = 32;
LABEL_7:
  return [(SBRemoteTransientOverlayHostContentAdapter *)self _performButtonEvents:v6];
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return +[SBIdleTimerBehavior behaviorForBehaviorProvider:self];
}

- (int64_t)idleTimerDuration
{
  if (self->_shouldUseLockedIdleTimerDuration) {
    return 1;
  }
  else {
    return 12;
  }
}

- (int64_t)idleTimerMode
{
  if ([(NSMutableSet *)self->_idleTimerDisabledReasons count]) {
    return 3;
  }
  if (self->_shouldUseLockedIdleTimerDuration) {
    return 2;
  }
  return 1;
}

- (int64_t)idleWarnMode
{
  if (self->_shouldDisableIdleWarn) {
    return 1;
  }
  else {
    return 2;
  }
}

- (double)customIdleExpirationTimeout
{
  return self->_customIdleExpirationTimeout;
}

- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4
{
  char v5 = (void (**)(void))a4;
  BOOL v6 = [(SBRemoteTransientOverlayHostContentAdapter *)self shouldPresentEmbeddedInTargetSceneIfRequested];
  double v7 = v5[2](v5);

  if (v6) {
    [v7 traitsOrientedResizableViewController];
  }
  else {
  char v8 = [v7 traitsOrientedViewController];
  }
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v8;

  if (self->_sceneViewControllerReadyBlock)
  {
    id v10 = [(SBSingleSceneController *)self->_sceneController scene];
    if ([v10 isValid]
      && ([v10 clientHandle], uint64_t v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
    {
      self->_sceneViewControllerWaitingForClientConnection = 1;
    }
    else
    {
      [(SBRemoteTransientOverlayHostContentAdapter *)self _callSceneViewControllerReadyBlockWithError:0];
    }
  }
  return 0;
}

- (id)dismissScene:(id)a3
{
  BOOL v4 = [(UIViewController *)self->_sceneViewController parentViewController];
  objc_msgSend(v4, "bs_removeChildViewController:", self->_sceneViewController);

  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = 0;

  return 0;
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  if (self->_sceneViewControllerWaitingForClientConnection)
  {
    if (self->_sceneViewControllerReadyBlock)
    {
      self->_sceneViewControllerWaitingForClientConnection = 0;
      -[SBRemoteTransientOverlayHostContentAdapter _callSceneViewControllerReadyBlockWithError:](self, "_callSceneViewControllerReadyBlockWithError:", 0, a4);
    }
  }
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if (self->_sceneViewControllerWaitingForClientConnection && self->_sceneViewControllerReadyBlock)
    {
      self->_sceneViewControllerWaitingForClientConnection = 0;
      [(SBRemoteTransientOverlayHostContentAdapter *)self _callSceneViewControllerReadyBlockWithError:v6];
    }
    else
    {
      double v7 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
      [v7 remoteTransientOverlayHostContentAdapter:self didTerminateWithError:v6];
    }
  }
}

- (void)featurePolicyHostComponentDidChangeShouldDisableBanners:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:self];
}

- (void)featurePolicyHostComponentDidChangeShouldDisableAlertItems:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:self];
}

- (void)featurePolicyHostComponentDidChangeShouldDisableControlCenter:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:self];
}

- (void)featurePolicyHostComponentDidChangeShouldDisableSiri:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:self];
}

- (void)featurePolicyHostComponentDidChangeShouldDisableInteractiveScreenshotGesture:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:self];
}

- (void)featurePolicyHostComponentDidChangeShouldDisableReachability:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:self];
}

- (void)remoteAlertSceneHostComponentDidDeactivate:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterRequestsDeactivation:self];
}

- (void)remoteAlertSceneHostComponentDidInvalidate:(id)a3
{
  self->_invalidating = 1;
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterRequestsInvalidation:self];
}

- (void)remoteAlertSceneHostComponent:(id)a3 didChangeWallpaperStyleWithAnimationSettings:(id)a4
{
}

- (void)remoteAlertSceneHostComponentDidChangeSwipeDismissalStyle:(id)a3
{
  uint64_t v4 = [a3 swipeDismissalStyle];
  [(SBRemoteTransientOverlayHostContentAdapter *)self _handleUpdatedSwipeDismissalStyle:v4];
}

- (void)remoteAlertSceneHostComponent:(id)a3 didChangeBackgroundActivitiesToSuppressWithAnimationSettings:(id)a4
{
}

- (void)remoteAlertSceneHostComponent:(id)a3 didSetIdleTimerDisabled:(BOOL)a4 forReason:(id)a5
{
}

- (void)remoteAlertSceneHostComponentDidChangeDesiredAutoLockDuration:(id)a3
{
  [a3 desiredAutoLockDuration];
  -[SBRemoteTransientOverlayHostContentAdapter _setDesiredAutoLockDuration:](self, "_setDesiredAutoLockDuration:");
}

- (void)remoteAlertSceneHostComponentDidChangeDesiredIdleTimerSettings:(id)a3
{
  id v4 = [a3 desiredIdleTimerSettings];
  [(SBRemoteTransientOverlayHostContentAdapter *)self _setDesiredIdleTimerSettings:v4];
}

- (void)remoteAlertSceneHostComponentDidChangeShouldDisableOrientationUpdates:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeShouldDisableOrientationUpdates:self];
}

- (void)remoteAlertSceneHostComponentDidChangeSupportedInterfaceOrientations:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeSupportedInterfaceOrientations:self];
}

- (void)remoteAlertSceneHostComponent:(id)a3 didChangePreferredStatusBarVisibilityWithAnimationSettings:(id)a4
{
  id v5 = a4;
  id v6 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v6 remoteTransientOverlayHostContentAdapter:self needsStatusBarAppearanceUpdateWithAnimationSettings:v5];
}

- (void)remoteAlertSceneHostComponentDidChangeWhitePointAdaptivityStyle:(id)a3
{
  uint64_t v4 = [a3 whitePointAdaptivityStyle];
  [(SBRemoteTransientOverlayHostContentAdapter *)self _updatePreferredWhitePointAdaptivityStyle:v4];
}

- (void)remoteAlertSceneHostComponentDidChangePreferredSceneDeactivationReason:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangePreferredSceneDeactivationReasonValue:self];
}

- (void)remoteAlertSceneHostComponentDidChangeHIDEventDeferringDisabled:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeHIDEventDeferringDisabled:self];
}

- (void)remoteTransientOverlayHostViewControllerDidChangePrefersWallpaperTunnel:(id)a3
{
}

- (void)remoteTransientOverlayHostViewControllerDidChangeRequestedBackgroundStyle:(id)a3 withAnimationSettings:(id)a4
{
}

- (void)remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeFeaturePolicy:self];
}

- (void)remoteTransientOverlayHostViewControllerDidChangeSwipeDismissalStyle:(id)a3
{
  uint64_t v4 = [a3 swipeDismissalStyle];
  [(SBRemoteTransientOverlayHostContentAdapter *)self _handleUpdatedSwipeDismissalStyle:v4];
}

- (void)remoteTransientOverlayHostViewController:(id)a3 didChangeWhitePointAdaptivityStyle:(int64_t)a4
{
}

- (void)remoteTransientOverlayHostViewControllerDidChangePreferredSceneDeactivationReasonValue:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangePreferredSceneDeactivationReasonValue:self];
}

- (void)remoteTransientOverlayHostViewController:(id)a3 didChangeBackgroundActivitiesToSuppressWithAnimationSettings:(id)a4
{
}

- (void)remoteTransientOverlayHostViewController:(id)a3 didChangeLaunchingInterfaceOrientation:(int64_t)a4
{
  self->_launchingInterfaceOrientation = a4;
}

- (void)remoteTransientOverlayHostViewControllerDidChangeShouldDisableOrientationUpdates:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterDidChangeShouldDisableOrientationUpdates:self];
}

- (void)remoteTransientOverlayHostViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4 forReason:(id)a5
{
}

- (void)remoteTransientOverlayHostViewController:(id)a3 didSetDesiredIdleTimerSettings:(id)a4
{
}

- (void)remoteTransientOverlayHostViewControllerRequestsDeactivation:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterRequestsDeactivation:self];
}

- (void)remoteTransientOverlayHostViewControllerRequestsInvalidation:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v4 remoteTransientOverlayHostContentAdapterRequestsInvalidation:self];
}

- (void)remoteTransientOverlayHostViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v6 remoteTransientOverlayHostContentAdapter:self didTerminateWithError:v5];
}

- (void)remoteTransientOverlayHostViewController:(id)a3 requestsWallpaperEffectUpdateWithAnimationSettings:(id)a4
{
  id v5 = a4;
  id v6 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  [v6 remoteTransientOverlayHostContentAdapter:self requestsWallpaperEffectUpdateWithAnimationSettings:v5];
}

- (int64_t)defaultPreferredInterfaceOrientationForPresentationForRemoteTransientOverlayHostViewController:(id)a3
{
  id v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self delegate];
  int64_t v5 = [v4 defaultPreferredInterfaceOrientationForPresentationForRemoteTransientOverlayHostContentAdapter:self];

  return v5;
}

- (BOOL)_shouldInvalidateForSecureDrawingMode
{
  BOOL v3 = [(SBSUIRemoteAlertSceneHostComponent *)self->_remoteAlertHostComponent hostScene];
  id v4 = [v3 clientHandle];
  int64_t v5 = [v4 processHandle];
  char v6 = objc_msgSend(v5, "sb_canDrawWhileLocked");

  double v7 = [(id)SBApp windowSceneManager];
  id v8 = [(SBSingleSceneController *)self->_sceneController targetDisplayConfiguration];
  __int16 v9 = [v8 identity];
  id v10 = [v7 windowSceneForDisplayIdentity:v9];

  uint64_t v11 = [v10 secureDisplayStateProvider];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(id)SBApp authenticationController];
  }
  BOOL v14 = v13;

  char v15 = [v14 isInSecureDisplayMode] & (v6 ^ 1);
  return v15;
}

- (void)_callSceneViewControllerReadyBlockWithError:(id)a3
{
  id v4 = a3;
  if (self->_sceneViewControllerReadyBlock)
  {
    if (!v4)
    {
      if ([(SBRemoteTransientOverlayHostContentAdapter *)self _shouldInvalidateForSecureDrawingMode])
      {
        id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBRemoteTransientOverlayViewControllerErrorDomain" code:-1000 userInfo:0];
      }
      else
      {
        id v4 = 0;
      }
    }
    id v6 = v4;
    (*((void (**)(void))self->_sceneViewControllerReadyBlock + 2))();
    id sceneViewControllerReadyBlock = self->_sceneViewControllerReadyBlock;
    self->_id sceneViewControllerReadyBlock = 0;

    id v4 = v6;
  }
}

- (void)_setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  idleTimerDisabledReasons = self->_idleTimerDisabledReasons;
  id v14 = v6;
  if (v4)
  {
    if (!idleTimerDisabledReasons)
    {
      id v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      __int16 v9 = self->_idleTimerDisabledReasons;
      self->_idleTimerDisabledReasons = v8;

      id v6 = v14;
      idleTimerDisabledReasons = self->_idleTimerDisabledReasons;
    }
    [(NSMutableSet *)idleTimerDisabledReasons addObject:v6];
  }
  else
  {
    [(NSMutableSet *)idleTimerDisabledReasons removeObject:v6];
    if (![(NSMutableSet *)self->_idleTimerDisabledReasons count])
    {
      id v10 = self->_idleTimerDisabledReasons;
      self->_idleTimerDisabledReasons = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  id v12 = [(SBRemoteTransientOverlayHostContentAdapter *)self coordinatorRequestedIdleTimerBehavior:WeakRetained];
  id v13 = (id)[WeakRetained idleTimerProvider:self didProposeBehavior:v12 forReason:v14];
}

- (void)_setDesiredAutoLockDuration:(double)a3
{
  self->_customIdleExpirationTimeout = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  BOOL v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self coordinatorRequestedIdleTimerBehavior:WeakRetained];
  id v5 = (id)[WeakRetained idleTimerProvider:self didProposeBehavior:v4 forReason:@"SBRemoteTransientOverlayHostContentAdapterSetDesiredAutoLockDuration"];
}

- (void)_setDesiredIdleTimerSettings:(id)a3
{
  id v4 = a3;
  self->_shouldUseLockedIdleTimerDuration = [v4 usesLockScreenRules];
  self->_shouldDisableIdleWarn = [v4 disablesWarn];
  [v4 autoLockTimeout];
  double v6 = v5;

  self->_customIdleExpirationTimeout = v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  double v7 = [(SBRemoteTransientOverlayHostContentAdapter *)self coordinatorRequestedIdleTimerBehavior:WeakRetained];
  id v8 = (id)[WeakRetained idleTimerProvider:self didProposeBehavior:v7 forReason:@"SBRemoteTransientOverlayHostContentAdapterSetDesiredIdleTimerSettings"];
}

- (unint64_t)_desiredHardwareButtonEvents
{
  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (featurePolicyHostComponent) {
    return [(SBSUIFeaturePolicyHostComponent *)featurePolicyHostComponent desiredHardwareButtonEvents];
  }
  else {
    return [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController preferredHardwareButtonEvents];
  }
}

- (BOOL)_allowsHomeButtonDismissal
{
  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (featurePolicyHostComponent) {
    return [(SBSUIFeaturePolicyHostComponent *)featurePolicyHostComponent allowsMenuButtonDismissal];
  }
  else {
    return [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController allowsHomeButtonDismissal];
  }
}

- (BOOL)_performButtonEvents:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = [WeakRetained remoteTransientOverlayHostContentAdapter:self requestsActionForHandlingButtonEvents:a3];

  double v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  if (v6)
  {
    remoteAlertHostComponent = self->_remoteAlertHostComponent;
    if (!remoteAlertHostComponent) {
      remoteAlertHostComponent = self->_hostRemoteViewController;
    }
    [remoteAlertHostComponent handleButtonActions:v7];
  }

  return v6 != 0;
}

- (void)_handleUpdatedSwipeDismissalStyle:(int64_t)a3
{
  if (a3 != 1) {
    goto LABEL_6;
  }
  uint64_t v4 = [(SBRemoteTransientOverlayHostContentAdapter *)self serviceBundleIdentifier];
  if (v4)
  {
    double v5 = (void *)v4;
    if (_handleUpdatedSwipeDismissalStyle__oOnceToken != -1) {
      dispatch_once(&_handleUpdatedSwipeDismissalStyle__oOnceToken, &__block_literal_global_46_3);
    }
    int v6 = [(id)_handleUpdatedSwipeDismissalStyle__sAllowedBundleIDs containsObject:v5];

    if (v6)
    {
LABEL_6:
      [(SBRemoteTransientOverlayHostContentAdapter *)self _updatePreferredGestureDismissalStyles];
    }
  }
}

void __80__SBRemoteTransientOverlayHostContentAdapter__handleUpdatedSwipeDismissalStyle___block_invoke()
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.InCallService";
  v4[1] = @"com.apple.PassbookUIService";
  void v4[2] = @"com.apple.TVRemoteUIService";
  v4[3] = @"com.apple.RemoteAlertTestUIService";
  v4[4] = @"com.apple.GameCenterRemoteAlert";
  v4[5] = @"com.apple.SystemExperienceAutomationAngel.sessions";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  BOOL v3 = (void *)_handleUpdatedSwipeDismissalStyle__sAllowedBundleIDs;
  _handleUpdatedSwipeDismissalStyle__sAllowedBundleIDs = v2;
}

- (void)_updatePreferredGestureDismissalStyles
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent) {
    remoteAlertHostComponent = self->_hostRemoteViewController;
  }
  uint64_t v4 = [remoteAlertHostComponent dismissalAnimationStyle];
  hostRemoteViewController = self->_remoteAlertHostComponent;
  if (!hostRemoteViewController) {
    hostRemoteViewController = self->_hostRemoteViewController;
  }
  uint64_t v6 = [hostRemoteViewController swipeDismissalStyle];
  featurePolicyHostComponent = self->_featurePolicyHostComponent;
  if (featurePolicyHostComponent) {
    int v8 = [(SBSUIFeaturePolicyHostComponent *)featurePolicyHostComponent allowsMenuButtonDismissal];
  }
  else {
    int v8 = [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController allowsHomeButtonDismissal];
  }
  int v9 = v8;
  id v10 = self->_featurePolicyHostComponent;
  if (v10) {
    uint64_t v11 = [(SBSUIFeaturePolicyHostComponent *)v10 desiredHardwareButtonEvents];
  }
  else {
    uint64_t v11 = [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController preferredHardwareButtonEvents];
  }
  unint64_t v12 = v11;
  if (v4 == 2 && [(SBRemoteTransientOverlayHostContentAdapter *)self isSwitcherEligible])
  {
    int64_t v13 = 3;
    int64_t v14 = 2;
  }
  else
  {
    int64_t v13 = 2;
    uint64_t v15 = (v12 >> 4) & 1;
    int64_t v16 = v9 | v15;
    if (v6 == 1) {
      int64_t v14 = 2;
    }
    else {
      int64_t v14 = v9 | v15;
    }
    if (v6 != 1) {
      int64_t v13 = v16;
    }
  }
  if (self->_preferredUnlockedGestureDismissalStyle != v13 || self->_preferredLockedGestureDismissalStyle != v14)
  {
    self->_preferredLockedGestureDismissalStyle = v14;
    self->_preferredUnlockedGestureDismissalStyle = v13;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteTransientOverlayHostContentAdapterDidChangeGestureDismissalStyles:self];
  }
}

- (void)_updatePreferredWhitePointAdaptivityStyle:(int64_t)a3
{
  preferredWhitePointAdaptivityStyleValue = self->_preferredWhitePointAdaptivityStyleValue;
  if (!preferredWhitePointAdaptivityStyleValue
    || ([NSNumber numberWithInteger:a3],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = [(NSNumber *)preferredWhitePointAdaptivityStyleValue isEqualToNumber:v6],
        v6,
        !v7))
  {
    int v8 = [NSNumber numberWithInteger:a3];
    int v9 = self->_preferredWhitePointAdaptivityStyleValue;
    self->_preferredWhitePointAdaptivityStyleValue = v8;

    id v10 = [(SBRemoteTransientOverlayHostContentAdapter *)self _contentViewController];
    [v10 setNeedsWhitePointAdaptivityStyleUpdate];
  }
}

- (void)_updateBackgroundActivitiesToSuppressWithAnimationSettings:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithEmptyParameters];
  if (v4)
  {
    [v4 duration];
    objc_msgSend(v5, "setDuration:");
    [v4 delay];
    objc_msgSend(v5, "setDelay:");
    [v5 setStyleAnimation:1];
    uint64_t v6 = [MEMORY[0x1E4F4F898] factoryWithSettings:v4];
    [v5 setAnimationFactory:v6];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __105__SBRemoteTransientOverlayHostContentAdapter__updateBackgroundActivitiesToSuppressWithAnimationSettings___block_invoke;
  v7[3] = &unk_1E6AF4AC0;
  v7[4] = self;
  [MEMORY[0x1E4F42E48] animateWithParameters:v5 animations:v7 completion:0];
}

void __105__SBRemoteTransientOverlayHostContentAdapter__updateBackgroundActivitiesToSuppressWithAnimationSettings___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _contentViewController];
  [v1 setNeedsStatusBarAppearanceUpdate];
}

- (void)_updateContentOpaqueProperty
{
  remoteAlertHostComponent = self->_remoteAlertHostComponent;
  if (!remoteAlertHostComponent) {
    remoteAlertHostComponent = self->_hostRemoteViewController;
  }
  BOOL v4 = ([remoteAlertHostComponent isContentOpaque] & 1) != 0
    || [(SBRemoteTransientOverlayHostContentAdapter *)self preferredBackgroundStyle] != 0;
  if (self->_contentOpaque != v4)
  {
    self->_contentOpaque = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteTransientOverlayHostContentAdapterDidChangeContentOpaque:self];
  }
}

- (void)_updatePreferredBackgroundStyleWithAnimationSettings:(id)a3
{
  id v13 = a3;
  uint64_t v4 = objc_opt_class();
  double v5 = [(SBSUIRemoteAlertSceneHostComponent *)self->_remoteAlertHostComponent hostScene];
  uint64_t v6 = [v5 clientSettings];
  BOOL v7 = SBSafeCast(v4, v6);

  uint64_t v8 = [v7 backgroundStyle];
  int64_t v9 = v8;
  if (self->_remoteAlertHostComponent)
  {
    BOOL v10 = v8 != 0;
  }
  else
  {
    BOOL v10 = [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController prefersWallpaperTunnelActive];
    if (!self->_remoteAlertHostComponent) {
      int64_t v9 = [(SBRemoteTransientOverlayHostViewController *)self->_hostRemoteViewController requestedBackgroundStyle];
    }
  }
  if (v10) {
    int64_t v11 = v9;
  }
  else {
    int64_t v11 = 0;
  }
  if (self->_preferredBackgroundStyle != v11)
  {
    self->_preferredBackgroundStyle = v11;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteTransientOverlayHostContentAdapter:self requestsWallpaperEffectUpdateWithAnimationSettings:v13];

    [(SBRemoteTransientOverlayHostContentAdapter *)self _updateContentOpaqueProperty];
  }
}

- (SBRemoteTransientOverlayHostContentAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRemoteTransientOverlayHostContentAdapterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActivatingForSiri
{
  return self->_activatingForSiri;
}

- (void)setActivatingForSiri:(BOOL)a3
{
  self->_activatingForSiri = a3;
}

- (BOOL)isContentOpaque
{
  return self->_contentOpaque;
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  return (SBIdleTimerCoordinating *)WeakRetained;
}

- (void)setIdleTimerCoordinator:(id)a3
{
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return self->_preferredLockedGestureDismissalStyle;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return self->_preferredUnlockedGestureDismissalStyle;
}

- (int64_t)preferredBackgroundStyle
{
  return self->_preferredBackgroundStyle;
}

- (_UILegibilitySettings)preferredStatusBarLegibilitySettings
{
  return self->_preferredStatusBarLegibilitySettings;
}

- (BOOL)shouldInvalidateWhenDeactivated
{
  return self->_shouldInvalidateWhenDeactivated;
}

- (BOOL)isScreenshotMarkup
{
  return self->_isScreenshotMarkup;
}

- (BOOL)isSwitcherEligible
{
  return self->_switcherEligible;
}

- (void)setSwitcherEligible:(BOOL)a3
{
  self->_switcherEligible = a3;
}

- (BOOL)shouldPresentEmbeddedInTargetSceneIfRequested
{
  return self->_shouldPresentEmbeddedInTargetSceneIfRequested;
}

- (void)setHidEventDeferringDisabled:(BOOL)a3
{
  self->_hidEventDeferringDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredStatusBarLegibilitySettings, 0);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostRemoteViewController, 0);
  objc_storeStrong(&self->_sceneViewControllerReadyBlock, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_featurePolicyHostComponent, 0);
  objc_storeStrong((id *)&self->_remoteAlertHostComponent, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);
  objc_storeStrong((id *)&self->_sceneProcessIdentity, 0);
  objc_storeStrong((id *)&self->_preferredWhitePointAdaptivityStyleValue, 0);
  objc_storeStrong((id *)&self->_idleTimerDisabledReasons, 0);
}

@end