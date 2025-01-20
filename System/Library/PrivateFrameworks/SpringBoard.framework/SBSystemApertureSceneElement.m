@interface SBSystemApertureSceneElement
+ (FBSceneWorkspace)sceneWorkspace;
+ (NSArray)activeElements;
+ (NSSet)scenesForBacklightSession;
+ (id)activePlaceholderElementPassingTest:(id)a3;
+ (id)defaultAnimationParameters;
+ (id)elementsReadyForPresentation;
+ (id)sceneWorkspaceIdentifier;
+ (void)addActiveElement:(id)a3;
+ (void)addElementReadyForPresentation:(id)a3;
+ (void)hostedScenesDidChange;
+ (void)removeActiveElement:(id)a3;
+ (void)removeElementReadyForPresentation:(id)a3;
- (BNPresentable)presentable;
- (BOOL)_activateCorrespondingAppSceneIfPossible:(int64_t)a3;
- (BOOL)_calculateRequiresSuppressionFromSystemAperture;
- (BOOL)_canShowWhileLocked;
- (BOOL)_handleAction:(id)a3;
- (BOOL)_handleLaunchAction;
- (BOOL)_hasActivationAttribute:(unint64_t)a3;
- (BOOL)_hasPresentationBehavior:(unint64_t)a3;
- (BOOL)_isAssociatedWithBundleIdentifier:(id)a3;
- (BOOL)_isAssociatedWithSceneWithPersistenceIdentifier:(id)a3;
- (BOOL)_isValidAlertingSource:(int64_t)a3;
- (BOOL)_ownsScene;
- (BOOL)_requiresForegroundScene;
- (BOOL)_sceneDisplayConfigurationValid;
- (BOOL)_shouldHandleLaunchAction;
- (BOOL)_shouldSuppressBackgroundActivities;
- (BOOL)_supportsMenuPresentations;
- (BOOL)_tryMovingToPlaceholderElementWithClientSettingsDiff:(id)a3 forScene:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (BOOL)_updateRequiresSuppressionFromSystemAperture;
- (BOOL)acceptsFullScreenTransitionFromSceneWithIdentifier:(id)a3 ofBundleId:(id)a4;
- (BOOL)alwaysAllowTapToAppForBodyTaps;
- (BOOL)backlightIsOrWillBecomeActive;
- (BOOL)handleElementViewEvent:(int64_t)a3;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hasActivityBehavior;
- (BOOL)hasAlertBehavior;
- (BOOL)hasBeenRemoved;
- (BOOL)hasCompletedInitialPresentation;
- (BOOL)hasHandledLaunchAction;
- (BOOL)invalidatingForMoveToPlaceholderElement;
- (BOOL)isActivated;
- (BOOL)isAffiliatedWithSessionMonitor;
- (BOOL)isAlerting;
- (BOOL)isBiometricKit;
- (BOOL)isDeactivating;
- (BOOL)isExpanding;
- (BOOL)isFixedInOrientation;
- (BOOL)isInteractiveDismissalEnabled;
- (BOOL)isMinimalPresentationPossible;
- (BOOL)isPreviewing;
- (BOOL)isProminent;
- (BOOL)isReadyForPresentation;
- (BOOL)isRequestingMenuPresentation;
- (BOOL)isSuppressedByProximityReader;
- (BOOL)isUrgent;
- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4;
- (BOOL)requiresSuppressionFromSystemAperture;
- (BOOL)shouldIgnoreSystemChromeSuppressionWhilePresentingAppWithBundleId:(id)a3;
- (BOOL)shouldSuppressElementWhileOnContinuityDisplay;
- (BOOL)shouldSuppressElementWhileOnCoversheet;
- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3;
- (BOOL)shouldSuppressElementWhilePresentingNoAppsOrScenes;
- (BOOL)shouldSuppressElementWhilePresentingSceneWithIdentifier:(id)a3;
- (BOOL)shouldSuppressElementWhileProximityReaderPresent;
- (BOOL)wantsLayoutPassForClientUpdate;
- (BOOL)wantsSpecialFlowerBoundsResizingAnimationForWallet;
- (BSInvalidatable)activeApplicationElementAssertion;
- (BSInvalidatable)statusBarStyleOverridesSuppressionAssertion;
- (CGRect)_frameForSceneViewInContainerView:(id)a3;
- (CGRect)_frameInSceneContainerForView:(id)a3;
- (CGRect)_obstructedAreaFrame;
- (CGSize)_sizeForSceneView;
- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5;
- (FBScene)scene;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (NSHashTable)_layoutObservers;
- (NSMutableArray)deferredSceneActions;
- (NSMutableDictionary)userInfo;
- (NSSet)representedBackgroundActivityIdentifiers;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)elementIdentifier;
- (SAActivityHosting)activityHost;
- (SAAlertHosting)alertHost;
- (SAAssertion)elementHostPrefersSuppressionAssertion;
- (SAAutomaticallyInvalidatable)_alertingActivityAssertion;
- (SAAutomaticallyInvalidatable)_sessionMonitorAssertion;
- (SAElementHosting)elementHost;
- (SAUILayoutHosting)layoutHost;
- (SBApplication)associatedApplication;
- (SBDeviceApplicationSceneHandle)associatedApplicationSceneHandle;
- (SBSystemActionElementPreviewingCoordinator)previewingCoordinator;
- (SBSystemApertureBackgroundActivitiesSuppressing)statusBarBackgroundActivitiesSuppresser;
- (SBSystemApertureGestureHandling)gestureHandler;
- (SBSystemAperturePlatformElementHosting)platformElementHost;
- (SBSystemApertureSceneElement)initWithScene:(id)a3 placeholderContentProvider:(id)a4 statusBarBackgroundActivitiesSuppresser:(id)a5 readyForPresentationHandler:(id)a6;
- (SBSystemApertureSceneElement)initWithScene:(id)a3 statusBarBackgroundActivitiesSuppresser:(id)a4 readyForPresentationHandler:(id)a5;
- (SBSystemApertureSceneElement)initWithSceneSpecification:(id)a3 sceneClientIdentity:(id)a4 statusBarBackgroundActivitiesSuppresser:(id)a5 readyForPresentationHandler:(id)a6;
- (SBSystemApertureSceneElementAccessoryView)detachedMinimalView;
- (SBSystemApertureSceneElementAccessoryView)leadingView;
- (SBSystemApertureSceneElementAccessoryView)minimalView;
- (SBSystemApertureSceneElementAccessoryView)trailingView;
- (SBSystemApertureSceneElementConfiguration)configuration;
- (SBSystemApertureSceneElementLaunchActionHandling)launchActionHandler;
- (SBSystemApertureSceneElementPlaceholderContentProviding)placeholderContentProvider;
- (SBSystemApertureSceneElementPlaceholderWrapperView)leadingWrapperView;
- (SBSystemApertureSceneElementPlaceholderWrapperView)minimalWrapperView;
- (SBSystemApertureSceneElementPlaceholderWrapperView)trailingWrapperView;
- (SBSystemApertureSceneElementScenePresenterView)sceneView;
- (SBSystemApertureSettings)settings;
- (SBUISystemApertureAlertingAction)_alertingAction;
- (UIColor)keyColor;
- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4;
- (id)_bundleIdForLaunchTargetWithScenePersistenceIdentifier:(id)a3;
- (id)_existingAlertingAssertion;
- (id)_inferredElementIdentifier;
- (id)_proposeTransitionParametersForTransitionToFrameInSceneView:(CGRect)a3 excludingParametersAssociatedWithReasons:(unint64_t)a4 usingCurrentAnimationParameters:(BOOL)a5;
- (id)clientInvalidationRequestHandler;
- (id)deactivationHandler;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)postSceneActivationPlaceholderElementFoundHandler;
- (id)postSceneActivationPlaceholderTest;
- (id)readyHandler;
- (id)requestAlertingAssertionImplicitlyDismissable:(BOOL)a3;
- (id)sceneClientSettings;
- (id)sceneInvalidationHandler;
- (id)sceneSettings;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)transitionRequestHandler;
- (int)elementAppearState;
- (int64_t)_clientLayoutModeForLayoutMode:(int64_t)a3;
- (int64_t)_layoutModeForClientLayoutMode:(int64_t)a3;
- (int64_t)alertingSource;
- (int64_t)customLayoutRequestingSpecialFlowerBoundsResizingAnimation;
- (int64_t)initialPreferredLayoutMode;
- (int64_t)layoutMode;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)mostRecentLayoutModeChangeReason;
- (int64_t)preferredLayoutMode;
- (int64_t)systemApertureCustomLayout;
- (int64_t)systemApertureLayoutCustomizingOptions;
- (unint64_t)_effectivePresentationBehaviors;
- (unint64_t)_updateReasonsForTransitionWithProposedParameters:(id)a3;
- (unint64_t)_updateReasonsForTransitionWithProposedParameters:(id)a3 excludingReasons:(unint64_t)a4;
- (unint64_t)activationAttributes;
- (unint64_t)layoutAxis;
- (unint64_t)obstructionEdge;
- (void)_acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded;
- (void)_activateSceneWithInitialOtherSettings:(id)a3 clientSettings:(id)a4 initialLayoutMode:(int64_t)a5;
- (void)_addActivationAttribute:(unint64_t)a3;
- (void)_applyTransitionParameters:(id)a3;
- (void)_commonInitWithScene:(id)a3 placeholderContentProvider:(id)a4 statusBarBackgroundActivitiesSuppresser:(id)a5 readyForPresentationHandler:(id)a6;
- (void)_finishDeactivationIfNeeded;
- (void)_handleAlertingAssertionRequestForReason:(id)a3 implicitlyDismissable:(BOOL)a4;
- (void)_layoutHostMayNotPerformLayoutUpdate;
- (void)_layoutSceneViewInContainerView:(id)a3;
- (void)_setAlertingAction:(id)a3;
- (void)_setupSceneViewInContainerView:(id)a3;
- (void)_updateActiveElementsAndAssociatedApplication;
- (void)_updateAlertAssertionIfNecessary;
- (void)_updateMutableSceneSettings:(id)a3 withParameters:(id)a4;
- (void)_updatePortalViews;
- (void)_updateReadyForPresentationIfNeeded;
- (void)_updateScene:(id)a3 activatingIfNeeded:(BOOL)a4 settingsWithTransitionBlock:(id)a5;
- (void)_updateSceneBackgroundStateIfNeeded;
- (void)_updateSceneWithTransitionParameters:(id)a3;
- (void)activate;
- (void)activateWithInitialOtherClientSettings:(id)a3;
- (void)activateWithInitialOtherSceneSettings:(id)a3;
- (void)activateWithInitialOtherSceneSettings:(id)a3 clientSettings:(id)a4 transitionRequestHandler:(id)a5;
- (void)activateWithPostActivationPlaceholderTest:(id)a3 foundPlaceholderHandler:(id)a4;
- (void)addElementLayoutSpecifierObserver:(id)a3;
- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5;
- (void)deactivateWhenRemovedWithHandler:(id)a3;
- (void)dealloc;
- (void)element:(id)a3 visibilityDidChange:(BOOL)a4;
- (void)element:(id)a3 visibilityWillChange:(BOOL)a4;
- (void)invalidate;
- (void)placeholderWrapperViewDidChangeContentView:(id)a3;
- (void)pop;
- (void)removeElementLayoutSpecifierObserver:(id)a3;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)setActivated:(BOOL)a3;
- (void)setActiveApplicationElementAssertion:(id)a3;
- (void)setActivityHost:(id)a3;
- (void)setAffiliatedWithSessionMonitor:(BOOL)a3;
- (void)setAlertHost:(id)a3;
- (void)setAlwaysAllowTapToAppForBodyTaps:(BOOL)a3;
- (void)setAssociatedApplication:(id)a3;
- (void)setAssociatedApplicationSceneHandle:(id)a3;
- (void)setBacklightIsOrWillBecomeActive:(BOOL)a3;
- (void)setClientInvalidationRequestHandler:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDeactivationHandler:(id)a3;
- (void)setDeferredSceneActions:(id)a3;
- (void)setDetachedMinimalView:(id)a3;
- (void)setElementAppearState:(int)a3;
- (void)setElementHost:(id)a3;
- (void)setElementHostPrefersSuppressionAssertion:(id)a3;
- (void)setElementProviderPrefersSuppression:(BOOL)a3;
- (void)setExpanding:(BOOL)a3;
- (void)setGestureHandler:(id)a3;
- (void)setHasBeenRemoved:(BOOL)a3;
- (void)setHasCompletedInitialPresentation:(BOOL)a3;
- (void)setHasHandledLaunchAction:(BOOL)a3;
- (void)setInitialPreferredLayoutMode:(int64_t)a3;
- (void)setInvalidatingForMoveToPlaceholderElement:(BOOL)a3;
- (void)setLaunchActionHandler:(id)a3;
- (void)setLayoutAxis:(unint64_t)a3;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (void)setLeadingView:(id)a3;
- (void)setLeadingWrapperView:(id)a3;
- (void)setMinimalView:(id)a3;
- (void)setMinimalWrapperView:(id)a3;
- (void)setMostRecentLayoutModeChangeReason:(int64_t)a3;
- (void)setObstructionEdge:(unint64_t)a3;
- (void)setPlaceholderContentProvider:(id)a3;
- (void)setPlatformElementHost:(id)a3;
- (void)setPostSceneActivationPlaceholderElementFoundHandler:(id)a3;
- (void)setPostSceneActivationPlaceholderTest:(id)a3;
- (void)setPresentable:(id)a3;
- (void)setPreviewing:(BOOL)a3;
- (void)setProminent:(BOOL)a3;
- (void)setReadyForPresentation:(BOOL)a3;
- (void)setRequiresSuppressionFromSystemAperture:(BOOL)a3;
- (void)setScene:(id)a3;
- (void)setSceneInvalidationHandler:(id)a3;
- (void)setSceneView:(id)a3;
- (void)setStatusBarBackgroundActivitiesSuppresser:(id)a3;
- (void)setStatusBarStyleOverridesSuppressionAssertion:(id)a3;
- (void)setSuppressed:(BOOL)a3;
- (void)setSuppressedByProximityReader:(BOOL)a3;
- (void)setTrailingView:(id)a3;
- (void)setTrailingWrapperView:(id)a3;
- (void)setUrgent:(BOOL)a3;
- (void)setWantsLayoutPassForClientUpdate:(BOOL)a3;
- (void)setWantsSpecialFlowerBoundsResizingAnimationForWallet:(BOOL)a3;
- (void)suppressForReason:(int64_t)a3;
- (void)systemApertureElementAssertionAcquired;
- (void)systemApertureElementAssertionInvalidated;
- (void)updateWithConnectedScene:(id)a3 configuration:(id)a4 elementAssertionAcquisitionHandler:(id)a5;
@end

@implementation SBSystemApertureSceneElement

+ (id)activePlaceholderElementPassingTest:(id)a3
{
  id v4 = a3;
  v5 = [a1 activeElements];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__SBSystemApertureSceneElement_activePlaceholderElementPassingTest___block_invoke;
  v9[3] = &unk_1E6B0C6A8;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __68__SBSystemApertureSceneElement_activePlaceholderElementPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 placeholderContentProvider];
  if (v4)
  {
    v5 = [v3 scene];
    if (v5) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (NSArray)activeElements
{
  return (NSArray *)[(id)SBSystemApertureSceneElementActiveElements allObjects];
}

+ (NSSet)scenesForBacklightSession
{
  v2 = [a1 activeElements];
  id v3 = objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_375);

  if (v3) {
    [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }
  else {
  id v4 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v4;
}

uint64_t __57__SBSystemApertureSceneElement_scenesForBacklightSession__block_invoke(uint64_t a1, void *a2)
{
  return [a2 scene];
}

+ (void)addActiveElement:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = (void *)SBSystemApertureSceneElementActiveElements;
    if (!SBSystemApertureSceneElementActiveElements)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v6 = (void *)SBSystemApertureSceneElementActiveElements;
      SBSystemApertureSceneElementActiveElements = v5;

      id v4 = (void *)SBSystemApertureSceneElementActiveElements;
    }
    [v4 addObject:v7];
  }
  [a1 hostedScenesDidChange];
}

+ (void)removeActiveElement:(id)a3
{
  id v5 = a3;
  if (v5) {
    [(id)SBSystemApertureSceneElementActiveElements removeObject:v5];
  }
  if (![(id)SBSystemApertureSceneElementActiveElements count])
  {
    id v4 = (void *)SBSystemApertureSceneElementActiveElements;
    SBSystemApertureSceneElementActiveElements = 0;
  }
  [a1 hostedScenesDidChange];
}

+ (id)elementsReadyForPresentation
{
  return (id)[(id)SBSystemApertureSceneElementsReadyForPresentation allObjects];
}

+ (void)addElementReadyForPresentation:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)SBSystemApertureSceneElementsReadyForPresentation;
    id v7 = v3;
    if (!SBSystemApertureSceneElementsReadyForPresentation)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v6 = (void *)SBSystemApertureSceneElementsReadyForPresentation;
      SBSystemApertureSceneElementsReadyForPresentation = v5;

      id v4 = (void *)SBSystemApertureSceneElementsReadyForPresentation;
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

+ (void)removeElementReadyForPresentation:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(id)SBSystemApertureSceneElementsReadyForPresentation removeObject:v4];
  }
  if (![(id)SBSystemApertureSceneElementsReadyForPresentation count])
  {
    id v3 = (void *)SBSystemApertureSceneElementsReadyForPresentation;
    SBSystemApertureSceneElementsReadyForPresentation = 0;
  }
}

+ (void)hostedScenesDidChange
{
  id v2 = [(id)SBApp systemApertureControllerForMainDisplay];
  if (objc_opt_respondsToSelector()) {
    [v2 hostedScenesDidChange];
  }
}

+ (id)sceneWorkspaceIdentifier
{
  return @"com.apple.SpringBoardUIServices.SystemAperture";
}

+ (FBSceneWorkspace)sceneWorkspace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SBSystemApertureSceneElement_sceneWorkspace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sceneWorkspace_onceToken != -1) {
    dispatch_once(&sceneWorkspace_onceToken, block);
  }
  id v2 = (void *)sceneWorkspace_sceneWorkspace;
  return (FBSceneWorkspace *)v2;
}

void __46__SBSystemApertureSceneElement_sceneWorkspace__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F624B0]);
  id v5 = [*(id *)(a1 + 32) sceneWorkspaceIdentifier];
  uint64_t v3 = [v2 initWithIdentifier:v5];
  id v4 = (void *)sceneWorkspace_sceneWorkspace;
  sceneWorkspace_sceneWorkspace = v3;
}

+ (id)defaultAnimationParameters
{
  if (defaultAnimationParameters_onceToken != -1) {
    dispatch_once(&defaultAnimationParameters_onceToken, &__block_literal_global_36_1);
  }
  id v2 = (void *)defaultAnimationParameters_params;
  return v2;
}

void __58__SBSystemApertureSceneElement_defaultAnimationParameters__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4FA7D48]);
  id v5 = +[SBSystemApertureDomain rootSettings];
  v1 = [v5 defaultInterfaceElementTransitionSettings];
  id v2 = [v1 boundsBehaviorSettings];
  uint64_t v3 = [v0 initWithFluidBehaviorSettings:v2 tracking:0 retargeted:0];
  id v4 = (void *)defaultAnimationParameters_params;
  defaultAnimationParameters_params = v3;
}

- (SBSystemApertureSceneElement)initWithSceneSpecification:(id)a3 sceneClientIdentity:(id)a4 statusBarBackgroundActivitiesSuppresser:(id)a5 readyForPresentationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = [(id)objc_opt_class() sceneWorkspace];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __147__SBSystemApertureSceneElement_initWithSceneSpecification_sceneClientIdentity_statusBarBackgroundActivitiesSuppresser_readyForPresentationHandler___block_invoke;
  v21[3] = &unk_1E6B0C6F0;
  id v22 = v10;
  id v23 = v11;
  v15 = self;
  v24 = v15;
  id v16 = v11;
  id v17 = v10;
  v18 = [v14 createScene:v21];

  v19 = [(SBSystemApertureSceneElement *)v15 initWithScene:v18 statusBarBackgroundActivitiesSuppresser:v13 readyForPresentationHandler:v12];
  return v19;
}

void __147__SBSystemApertureSceneElement_initWithSceneSpecification_sceneClientIdentity_statusBarBackgroundActivitiesSuppresser_readyForPresentationHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSpecification:v3];
  [v4 setClientIdentity:*(void *)(a1 + 40)];
  id v5 = [(id)objc_opt_class() sceneWorkspace];
  id v9 = [v5 identifier];

  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];

  v8 = [NSString stringWithFormat:@"%@ - %@", v9, v7];
  [v4 setIdentifier:v8];
}

- (SBSystemApertureSceneElement)initWithScene:(id)a3 statusBarBackgroundActivitiesSuppresser:(id)a4 readyForPresentationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSystemApertureSceneElement;
  id v11 = [(SBSystemApertureSceneElement *)&v14 init];
  id v12 = v11;
  if (v11) {
    [(SBSystemApertureSceneElement *)v11 _commonInitWithScene:v8 placeholderContentProvider:0 statusBarBackgroundActivitiesSuppresser:v9 readyForPresentationHandler:v10];
  }

  return v12;
}

- (SBSystemApertureSceneElement)initWithScene:(id)a3 placeholderContentProvider:(id)a4 statusBarBackgroundActivitiesSuppresser:(id)a5 readyForPresentationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBSystemApertureSceneElement;
  objc_super v14 = [(SBSystemApertureSceneElement *)&v17 init];
  v15 = v14;
  if (v14) {
    [(SBSystemApertureSceneElement *)v14 _commonInitWithScene:v10 placeholderContentProvider:v11 statusBarBackgroundActivitiesSuppresser:v12 readyForPresentationHandler:v13];
  }

  return v15;
}

- (void)_commonInitWithScene:(id)a3 placeholderContentProvider:(id)a4 statusBarBackgroundActivitiesSuppresser:(id)a5 readyForPresentationHandler:(id)a6
{
  id v37 = a3;
  id v11 = a4;
  objc_storeStrong((id *)&self->_scene, a3);
  id v12 = a6;
  id v13 = a5;
  objc_storeWeak((id *)&self->_placeholderContentProvider, v11);
  objc_super v14 = (void *)[v12 copy];

  id readyHandler = self->_readyHandler;
  self->_id readyHandler = v14;

  objc_storeWeak((id *)&self->_statusBarBackgroundActivitiesSuppresser, v13);
  id v16 = (SBSystemApertureSceneElementAccessoryView *)objc_alloc_init(MEMORY[0x1E4FA7988]);
  leadingView = self->_leadingView;
  self->_leadingView = v16;

  v18 = (SBSystemApertureSceneElementAccessoryView *)objc_alloc_init(MEMORY[0x1E4FA7988]);
  trailingView = self->_trailingView;
  self->_trailingView = v18;

  v20 = (SBSystemApertureSceneElementAccessoryView *)objc_alloc_init(MEMORY[0x1E4FA7988]);
  minimalView = self->_minimalView;
  self->_minimalView = v20;

  if (v11)
  {
    id v22 = [MEMORY[0x1E4F1CA48] array];
    deferredSceneActions = self->_deferredSceneActions;
    self->_deferredSceneActions = v22;
  }
  v24 = [v11 leadingView];
  if (v24)
  {
    v25 = [[SBSystemApertureSceneElementPlaceholderWrapperView alloc] initWithContentView:v24];
    leadingWrapperView = self->_leadingWrapperView;
    self->_leadingWrapperView = v25;

    [(SBSystemApertureSceneElementPlaceholderWrapperView *)self->_leadingWrapperView setDelegate:self];
  }
  v27 = [v11 trailingView];
  if (v27)
  {
    v28 = [[SBSystemApertureSceneElementPlaceholderWrapperView alloc] initWithContentView:v27];
    trailingWrapperView = self->_trailingWrapperView;
    self->_trailingWrapperView = v28;

    [(SBSystemApertureSceneElementPlaceholderWrapperView *)self->_trailingWrapperView setDelegate:self];
  }
  v30 = [v11 minimalView];
  if (v30)
  {
    v31 = [SBSystemApertureSceneElementPlaceholderWrapperView alloc];
    if (v30 == v24) {
      v32 = 0;
    }
    else {
      v32 = v30;
    }
    v33 = [(SBSystemApertureSceneElementPlaceholderWrapperView *)v31 initWithContentView:v32];
    minimalWrapperView = self->_minimalWrapperView;
    self->_minimalWrapperView = v33;

    [(SBSystemApertureSceneElementPlaceholderWrapperView *)self->_minimalWrapperView setDelegate:self];
  }
  self->_wantsLayoutPassForClientUpdate = 1;
  self->_obstructionEdge = 1;
  v35 = (SBSystemActionElementPreviewingCoordinator *)-[SBSystemActionElementPreviewingCoordinator initWithElement:]([SBSystemActionElementPreviewingCoordinator alloc], self);
  previewingCoordinator = self->_previewingCoordinator;
  self->_previewingCoordinator = v35;
}

- (void)deactivateWhenRemovedWithHandler:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if ([(SBSystemApertureSceneElement *)self isDeactivating])
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBSystemApertureSceneElement.m" lineNumber:402 description:@"Cannot deactivate if already deactivating."];
  }
  if (![(SBSystemApertureSceneElement *)self isActivated])
  {
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBSystemApertureSceneElement.m" lineNumber:403 description:@"Cannot deactivate if not activated."];
  }
  [(SBSystemApertureSceneElement *)self _addActivationAttribute:8];
  uint64_t v6 = [(SBSystemApertureSceneElement *)self scene];
  if (![v6 isActive]) {
    goto LABEL_8;
  }
  id v7 = [(SBSystemApertureSceneElement *)self scene];
  id v8 = [v7 clientHandle];
  id v9 = [v8 processHandle];
  id v10 = [v9 currentState];
  int v11 = [v10 isRunning];

  if (v11)
  {
    uint64_t v6 = [(SBSystemApertureSceneElement *)self scene];
    [v6 performUpdate:&__block_literal_global_62];
LABEL_8:
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__SBSystemApertureSceneElement_deactivateWhenRemovedWithHandler___block_invoke_2;
  v18[3] = &unk_1E6AFFD10;
  id v19 = v5;
  id v12 = v5;
  [(SBSystemApertureSceneElement *)self setDeactivationHandler:v18];
  [(SBSystemApertureSceneElement *)self _finishDeactivationIfNeeded];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__SBSystemApertureSceneElement_deactivateWhenRemovedWithHandler___block_invoke_3;
  v15[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __65__SBSystemApertureSceneElement_deactivateWhenRemovedWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 otherSettings];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 setObject:MEMORY[0x1E4F1CC38] forSetting:3213017];
}

void __65__SBSystemApertureSceneElement_deactivateWhenRemovedWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __65__SBSystemApertureSceneElement_deactivateWhenRemovedWithHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [(id)objc_opt_class() removeElementReadyForPresentation:WeakRetained];
  }
}

- (void)_finishDeactivationIfNeeded
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self isDeactivating];
  BOOL v4 = [(SBSystemApertureSceneElement *)self _hasActivationAttribute:1];
  BOOL v5 = [(SBSystemApertureSceneElement *)self _hasActivationAttribute:2];
  BOOL v6 = [(SBSystemApertureSceneElement *)self _hasActivationAttribute:4];
  int64_t v7 = [(SBSystemApertureSceneElement *)self layoutMode];
  int v8 = v6 && v5 || !v5;
  if (v7 != -1) {
    int v8 = 0;
  }
  if (!v4) {
    int v8 = 1;
  }
  if ((v3 & v8) == 1)
  {
    uint64_t v10 = [(SBSystemApertureSceneElement *)self deactivationHandler];
    [(SBSystemApertureSceneElement *)self setDeactivationHandler:0];
    id v9 = (void *)v10;
    if (v10)
    {
      (*(void (**)(uint64_t, SBSystemApertureSceneElement *))(v10 + 16))(v10, self);
      id v9 = (void *)v10;
    }
  }
}

- (void)_addActivationAttribute:(unint64_t)a3
{
  self->_activationAttributes |= a3;
  [(SBSystemApertureSceneElement *)self _finishDeactivationIfNeeded];
}

- (BOOL)_hasActivationAttribute:(unint64_t)a3
{
  return (a3 & ~self->_activationAttributes) == 0;
}

- (BOOL)isDeactivating
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self _hasActivationAttribute:8];
  if (v3)
  {
    LOBYTE(v3) = [(SBSystemApertureSceneElement *)self isActivated];
  }
  return v3;
}

- (void)invalidate
{
  if (![(SBSystemApertureSceneElement *)self isActivated])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SBSystemApertureSceneElement.m" lineNumber:461 description:@"Cannot invalidate if not activated."];
  }
  if ([(SAAutomaticallyInvalidatable *)self->_alertingActivityAssertion isValid])
  {
    alertingActivityAssertion = self->_alertingActivityAssertion;
    self->_alertingActivityAssertion = 0;
    BOOL v5 = alertingActivityAssertion;

    [(SAAutomaticallyInvalidatable *)v5 invalidateWithReason:@"scene element invalidated"];
  }
  [(SBSystemApertureSceneElement *)self setActivated:0];
  [(SBSystemApertureSceneElement *)self _acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded];
  BOOL v6 = [(SBSystemApertureSceneElement *)self scene];
  int64_t v7 = [v6 layerManager];
  [v7 removeObserver:self];

  int v8 = [(SBSystemApertureSceneElement *)self scene];
  [v8 removeObserver:self];

  LODWORD(v8) = [(SBSystemApertureSceneElement *)self _ownsScene];
  id v9 = [(SBSystemApertureSceneElement *)self scene];
  id v16 = v9;
  if (v8)
  {
    [v9 performUpdate:&__block_literal_global_72_1];

    id v16 = [(SBSystemApertureSceneElement *)self scene];
    [v16 invalidate];
  }
  else if ([v9 isActive])
  {
    uint64_t v10 = [(SBSystemApertureSceneElement *)self scene];
    int v11 = [v10 clientHandle];
    id v12 = [v11 processHandle];
    id v13 = [v12 currentState];
    if ([v13 isRunning])
    {
      BOOL invalidatingForMoveToPlaceholderElement = self->_invalidatingForMoveToPlaceholderElement;

      if (invalidatingForMoveToPlaceholderElement) {
        return;
      }
      id v16 = [(SBSystemApertureSceneElement *)self scene];
      [v16 performUpdate:&__block_literal_global_74_0];
    }
    else
    {
    }
  }
}

void __42__SBSystemApertureSceneElement_invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 otherSettings];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = v6;

  [v2 setForeground:0];
  objc_msgSend(v7, "SBUISA_setLayoutMode:forSetting:", -1, 3213009);
}

void __42__SBSystemApertureSceneElement_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 otherSettings];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = v6;

  [v2 setForeground:0];
  objc_msgSend(v7, "SBUISA_setLayoutMode:forSetting:", -1, 3213009);
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_activeApplicationElementAssertion invalidate];
  activeApplicationElementAssertion = self->_activeApplicationElementAssertion;
  self->_activeApplicationElementAssertion = 0;

  if ([(SBSystemApertureSceneElement *)self isActivated])
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBSystemApertureSceneElement.m" lineNumber:490 description:@"Failed to invalidate."];
  }
  v6.receiver = self;
  v6.super_class = (Class)SBSystemApertureSceneElement;
  [(SBSystemApertureSceneElement *)&v6 dealloc];
}

- (SBSystemApertureSceneElementConfiguration)configuration
{
  configuration = self->_configuration;
  if (!configuration)
  {
    uint64_t v4 = objc_alloc_init(SBSystemApertureSceneElementConfiguration);
    id v5 = self->_configuration;
    self->_configuration = v4;

    configuration = self->_configuration;
  }
  return configuration;
}

- (void)setConfiguration:(id)a3
{
  id v8 = a3;
  if ([(SBSystemApertureSceneElement *)self isActivated])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBSystemApertureSceneElement.m", 502, @"SBSystemApertureSceneElementConfiguration may only be set when %@ is not activated", self object file lineNumber description];
  }
  id v5 = (SBSystemApertureSceneElementConfiguration *)[v8 copy];
  configuration = self->_configuration;
  self->_configuration = v5;
}

- (void)activate
{
}

- (void)activateWithInitialOtherSceneSettings:(id)a3
{
}

uint64_t __70__SBSystemApertureSceneElement_activateWithInitialOtherSceneSettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateSceneWithTransitionParameters:");
}

- (void)activateWithInitialOtherClientSettings:(id)a3
{
}

uint64_t __71__SBSystemApertureSceneElement_activateWithInitialOtherClientSettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateSceneWithTransitionParameters:");
}

- (void)activateWithInitialOtherSceneSettings:(id)a3 clientSettings:(id)a4 transitionRequestHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if ([(SBSystemApertureSceneElement *)self isActivated])
  {
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBSystemApertureSceneElement.m" lineNumber:523 description:@"Already activated."];
  }
  [(SBSystemApertureSceneElement *)self setActivated:1];
  [(SBSystemApertureSceneElement *)self _acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded];
  id v12 = (void *)MEMORY[0x1D948C7A0](v9);

  id transitionRequestHandler = self->_transitionRequestHandler;
  self->_id transitionRequestHandler = v12;

  [(SBSystemApertureSceneElement *)self _activateSceneWithInitialOtherSettings:v11 clientSettings:v10 initialLayoutMode:1];
  [(SBSystemApertureSceneElement *)self _updateReadyForPresentationIfNeeded];
}

- (void)activateWithPostActivationPlaceholderTest:(id)a3 foundPlaceholderHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 copy];
  id postSceneActivationPlaceholderTest = self->_postSceneActivationPlaceholderTest;
  self->_id postSceneActivationPlaceholderTest = v7;

  id v9 = (void *)[v6 copy];
  id postSceneActivationPlaceholderElementFoundHandler = self->_postSceneActivationPlaceholderElementFoundHandler;
  self->_id postSceneActivationPlaceholderElementFoundHandler = v9;

  [(SBSystemApertureSceneElement *)self activate];
}

- (void)updateWithConnectedScene:(id)a3 configuration:(id)a4 elementAssertionAcquisitionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  if (![(SBSystemApertureSceneElement *)self isActivated] || !WeakRetained)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"SBSystemApertureSceneElement.m" lineNumber:539 description:@"Invalid to add a scene to an inactive element or one that isn't using placeholder content"];
  }
  objc_storeStrong((id *)&self->_scene, a3);
  if (v11)
  {
    objc_super v14 = (SBSystemApertureSceneElementConfiguration *)[v11 copy];
    configuration = self->_configuration;
    self->_configuration = v14;
  }
  [(SBSystemApertureSceneElement *)self _activateSceneWithInitialOtherSettings:0 clientSettings:0 initialLayoutMode:[(SBSystemApertureSceneElement *)self _clientLayoutModeForLayoutMode:[(SBSystemApertureSceneElement *)self layoutMode]]];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = self->_deferredSceneActions;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * v20) + 16))(*(void *)(*((void *)&v27 + 1) + 8 * v20));
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v18);
  }

  deferredSceneActions = self->_deferredSceneActions;
  self->_deferredSceneActions = 0;

  objc_msgSend(WeakRetained, "noteSceneClientWantsControlOfElementWithAssertionTransferBlock:", v12, (void)v27);
  id v22 = [(SBSystemApertureSceneElement *)self sceneSettings];
  objc_msgSend(v22, "SBUISA_containerViewFrame");
  id v23 = -[SBSystemApertureSceneElement _proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:](self, "_proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:", 128, 0);

  [(SBSystemApertureSceneElement *)self _applyTransitionParameters:v23];
  v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v31 = @"SBSystemApertureNotificationUserInfoElementKey";
  v32 = self;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  [v24 postNotificationName:@"SBSystemApertureElementKeyColorDidInvalidateNotification" object:0 userInfo:v25];
}

- (void)_activateSceneWithInitialOtherSettings:(id)a3 clientSettings:(id)a4 initialLayoutMode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SBSystemApertureSceneElement *)self scene];
  [v10 addObserver:self];

  id v11 = [(SBSystemApertureSceneElement *)self scene];
  id v12 = [v11 layerManager];
  [v12 addObserver:self];

  id v13 = objc_alloc_init(SBSystemApertureSceneElementTransitionParameters);
  if ([(SBSystemApertureSceneElement *)self _requiresForegroundScene])
  {
    [(SBSystemApertureSceneElementTransitionParameters *)v13 setWantsForeground:1];
  }
  else
  {
    objc_super v14 = [(SBSystemApertureSceneElement *)self scene];
    v15 = [v14 settings];
    -[SBSystemApertureSceneElementTransitionParameters setWantsForeground:](v13, "setWantsForeground:", [v15 isForeground]);
  }
  [(SBSystemApertureSceneElementTransitionParameters *)v13 setShouldSetForeground:[(SBSystemApertureSceneElementTransitionParameters *)v13 wantsForeground]];
  id v16 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  objc_msgSend(v16, "SBUISA_setLayoutMode:forSetting:", a5, 3213009);
  [(SBSystemApertureSceneElement *)self _obstructedAreaFrame];
  objc_msgSend(v16, "SBUISA_setCGRect:forSetting:", 3213015);
  if (v8) {
    [v16 applySettings:v8];
  }
  v43 = v8;
  uint64_t v17 = v9;
  [(SBSystemApertureSceneElement *)self _sizeForSceneView];
  -[SBSystemApertureSceneElementTransitionParameters setSceneSize:](v13, "setSceneSize:");
  [(SBSystemApertureSceneElementTransitionParameters *)v13 setOtherSystemApertureSceneSettingsToApply:v16];
  uint64_t v18 = [MEMORY[0x1E4F42790] transitionContext];
  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = (void *)MEMORY[0x1E4FA7D98];
  v21 = [(id)objc_opt_class() defaultAnimationParameters];
  id v22 = [v20 transientLocalResizeSceneActionWithAnimationParameters:v21];
  id v23 = [v19 setWithObject:v22];

  [v18 setActions:v23];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  if ([(SBSystemApertureSceneElement *)self _ownsScene]) {
    goto LABEL_13;
  }
  uint64_t v25 = [(SBSystemApertureSceneElement *)self scene];
  if (!v25) {
    goto LABEL_9;
  }
  v26 = (void *)v25;
  long long v27 = [(SBSystemApertureSceneElement *)self scene];
  char v28 = [v27 isActive];

  if ((v28 & 1) == 0)
  {
LABEL_13:
    v31 = [(SBSystemApertureSceneElement *)self scene];
    int v32 = [v31 isActive];

    if (v32)
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      [v38 handleFailureInMethod:v42 object:self file:@"SBSystemApertureSceneElement.m" lineNumber:583 description:@"Scene should not be active!"];
    }
    v33 = [(SBSystemApertureSceneElement *)self scene];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke;
    v44[3] = &unk_1E6B0C780;
    v44[4] = self;
    v45 = v13;
    id v46 = v17;
    id v47 = WeakRetained;
    [v33 configureParameters:v44];

    uint64_t v34 = [(SBSystemApertureSceneElement *)self scene];
    [v34 activateWithTransitionContext:v18];
  }
  else
  {
LABEL_9:
    long long v29 = [(SBSystemApertureSceneElement *)self scene];
    char v30 = [v29 isActive];

    if ((v30 & 1) == 0 && !WeakRetained)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:v42 object:self file:@"SBSystemApertureSceneElement.m" lineNumber:605 description:@"Scene must be active prior to activating element if we're not showing placeholder content."];
    }
    [(SBSystemApertureSceneElementTransitionParameters *)v13 setTransitionContext:v18];
    [(SBSystemApertureSceneElement *)self _updateSceneWithTransitionParameters:v13];
  }
  uint64_t v35 = [(SBSystemApertureSceneElement *)self scene];
  if (v35)
  {
    v36 = (void *)v35;
    BOOL v37 = [(SBSystemApertureSceneElement *)self _sceneDisplayConfigurationValid];

    if (!v37)
    {
      v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:v42 object:self file:@"SBSystemApertureSceneElement.m" lineNumber:609 description:@"Scenes must use valid display configurations for system aperture."];
    }
  }
}

void __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke_2;
  v9[3] = &unk_1E6B03DC8;
  uint64_t v4 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v4;
  [v3 updateSettingsWithBlock:v9];
  id v5 = *(void **)(a1 + 48);
  if (v5 || *(void *)(a1 + 56))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke_3;
    v6[3] = &unk_1E6B0C758;
    id v7 = v5;
    id v8 = *(id *)(a1 + 56);
    [v3 updateClientSettingsWithBlock:v6];
  }
}

void __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setInterfaceOrientation:1];
  id v3 = [MEMORY[0x1E4F62420] mainConfiguration];
  [v4 setDisplayConfiguration:v3];

  [*(id *)(a1 + 32) _updateMutableSceneSettings:v4 withParameters:*(void *)(a1 + 40)];
}

void __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 otherSettings];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v8 = v6;

  if (*(void *)(a1 + 32)) {
    objc_msgSend(v8, "applySettings:");
  }
  uint64_t v7 = [*(id *)(a1 + 40) contentRole];
  if (v7) {
    objc_msgSend(v8, "SBUISA_setContentRole:forSetting:", v7, 3213018);
  }
}

- (BOOL)_sceneDisplayConfigurationValid
{
  id v2 = [(SBSystemApertureSceneElement *)self scene];
  id v3 = [v2 settings];
  uint64_t v4 = [v3 displayConfiguration];
  id v5 = [v4 identity];

  if ([v5 isMainDisplay]) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 isContinuityDisplay];
  }

  return v6;
}

- (id)_existingAlertingAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained alertingActivityAssertion];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_alertHost);
    id v5 = [v6 alertAssertion];
  }
  return v5;
}

- (BOOL)_isValidAlertingSource:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v18 = [NSString stringWithFormat:@"SAUIAlertingSourceUnspecified is an invalid source."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBSystemApertureSceneElement *)a2 _isValidAlertingSource:(uint64_t)v18];
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8DEDBA8);
  }
  int64_t alertingSource = self->_alertingSource;
  if (alertingSource == a3) {
    return 1;
  }
  BOOL v6 = alertingSource == 0;
  if (alertingSource)
  {
    uint64_t v7 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(SBSystemApertureSceneElement *)self succinctDescription];
      unint64_t v9 = self->_alertingSource;
      id v10 = @"[invalid]";
      id v11 = @"[invalid]";
      if (v9 <= 2) {
        id v11 = off_1E6B0C9B8[v9];
      }
      if (a3 == 1) {
        id v10 = @"SAUIAlertingSourceHost";
      }
      if (a3 == 2) {
        id v10 = @"SAUIAlertingSourceClient";
      }
      id v12 = v10;
      int v19 = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      id v22 = v11;
      __int16 v23 = 2114;
      v24 = v12;
      _os_log_error_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Changing alerting source is not allowed. Attempting to change alerting source from %{public}@ to %{public}@", (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    self->_int64_t alertingSource = a3;
    uint64_t v7 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(SBSystemApertureSceneElement *)self succinctDescription];
      objc_super v14 = @"[invalid]";
      if (a3 == 1) {
        objc_super v14 = @"SAUIAlertingSourceHost";
      }
      if (a3 == 2) {
        objc_super v14 = @"SAUIAlertingSourceClient";
      }
      v15 = v14;
      int v19 = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      id v22 = v15;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting alerting to %{public}@", (uint8_t *)&v19, 0x16u);
    }
  }

  return v6;
}

- (void)_handleAlertingAssertionRequestForReason:(id)a3 implicitlyDismissable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([(SBUISystemApertureAlertingAction *)self->_alertingAction isValid] & 1) == 0)
  {
    uint64_t v7 = [(SBSystemApertureSceneElement *)self _existingAlertingAssertion];
    if (([v7 isValid] & 1) == 0
      && [(SBSystemApertureSceneElement *)self hasActivityBehavior])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
      unint64_t v9 = [WeakRetained alertWithReason:v6 implicitlyDismissable:v4];
      alertingActivityAssertion = self->_alertingActivityAssertion;
      self->_alertingActivityAssertion = v9;

      objc_initWeak(&location, self);
      objc_initWeak(&from, self->_alertingActivityAssertion);
      id v11 = self->_alertingActivityAssertion;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke;
      v36[3] = &unk_1E6AF9240;
      objc_copyWeak(&v37, &location);
      objc_copyWeak(&v38, &from);
      [(SAAutomaticallyInvalidatable *)v11 addInvalidationBlock:v36];
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v37);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    objc_initWeak(&v35, self);
    id location = 0;
    p_id location = &location;
    uint64_t v31 = 0x3042000000;
    int v32 = __Block_byref_object_copy__113;
    v33 = __Block_byref_object_dispose__113;
    id v34 = 0;
    id from = 0;
    p_id from = &from;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__117;
    long long v27 = __Block_byref_object_dispose__118;
    id v12 = (void *)MEMORY[0x1E4F4F670];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke_120;
    v21[3] = &unk_1E6B0C7D0;
    objc_copyWeak(&v22, &v35);
    void v21[4] = &location;
    id v28 = [v12 responderWithHandler:v21];
    id v13 = objc_alloc(MEMORY[0x1E4FA7D40]);
    objc_super v14 = (SBUISystemApertureAlertingAction *)[v13 initWithInfo:0 responder:p_from[5]];
    alertingAction = self->_alertingAction;
    self->_alertingAction = v14;

    objc_storeWeak(p_location + 5, self->_alertingAction);
    id v16 = [(SBSystemApertureSceneElement *)self _existingAlertingAssertion];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke_3;
    v19[3] = &unk_1E6B0C7F8;
    v19[4] = &location;
    v19[5] = &from;
    objc_copyWeak(&v20, &v35);
    [v16 addInvalidationBlock:v19];

    if (self->_alertingSource == 2)
    {
      scene = self->_scene;
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", self->_alertingAction, 0);
      [(FBScene *)scene sendActions:v18];
    }
    objc_destroyWeak(&v20);
    _Block_object_dispose(&from, 8);

    objc_destroyWeak(&v22);
    _Block_object_dispose(&location, 8);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v35);
  }
}

void __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = (id)WeakRetained[41];
    id v6 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));

    id WeakRetained = v6;
    if (v3 == v4)
    {
      id v5 = (void *)v6[41];
      v6[41] = 0;

      id WeakRetained = v6;
    }
  }
}

void __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke_120(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  BSDispatchMain();
  objc_destroyWeak(&v4);
}

void __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];
  id v10 = v2;
  if (v2)
  {
    id v3 = [v2 localizedDescription];
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) info];
    id v3 = [v4 objectForSetting:0];

    if (!v3) {
      goto LABEL_8;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [WeakRetained _existingAlertingAssertion];

  if ([v6 isValid]) {
    [v6 invalidateWithReason:v3];
  }

LABEL_8:
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [v7 _alertingAction];
  id v9 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

  if (v8 == v9) {
    [v7 _setAlertingAction:0];
  }
}

void __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) annul];
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [v2 _alertingAction];

  if (v3 == WeakRetained) {
    [v2 _setAlertingAction:0];
  }
}

- (id)sceneSettings
{
  id v2 = [(SBSystemApertureSceneElement *)self scene];
  id v3 = [v2 settings];
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)sceneClientSettings
{
  id v2 = [(SBSystemApertureSceneElement *)self scene];
  id v3 = [v2 clientSettings];
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)setActivated:(BOOL)a3
{
  if (self->_activated != a3)
  {
    BOOL v3 = a3;
    self->_activated = a3;
    id v5 = +[SBBacklightController sharedInstanceIfExists];
    self->_backlightIsOrWillBecomeActive = [v5 backlightState] != 4;

    [(SBSystemApertureSceneElement *)self _updateActiveElementsAndAssociatedApplication];
    id v6 = +[SBBacklightController sharedInstanceIfExists];
    id v7 = v6;
    if (v3) {
      [v6 addObserver:self];
    }
    else {
      [v6 removeObserver:self];
    }
  }
}

- (void)setBacklightIsOrWillBecomeActive:(BOOL)a3
{
  if (self->_backlightIsOrWillBecomeActive != a3)
  {
    self->_backlightIsOrWillBecomeActive = a3;
    [(SBSystemApertureSceneElement *)self _updateSceneBackgroundStateIfNeeded];
  }
}

- (NSMutableDictionary)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
  {
    if ([(SBSystemApertureSceneElement *)self _shouldHandleLaunchAction])
    {
      LOBYTE(v4) = [(SBSystemApertureSceneElement *)self _handleLaunchAction];
      return v4;
    }
    if ([(SBSystemApertureSceneElement *)self layoutMode] == 1
      || [(SBSystemApertureSceneElement *)self layoutMode] == 2)
    {
      [(SBSystemApertureSceneElement *)self _updateScene:self->_scene activatingIfNeeded:0 settingsWithTransitionBlock:&__block_literal_global_129_0];
    }
LABEL_12:
    LOBYTE(v4) = 0;
    return v4;
  }
  if (a3 != 4) {
    goto LABEL_12;
  }
  BOOL v4 = [(SBSystemApertureSceneElement *)self _hasPresentationBehavior:128];
  if (v4)
  {
    [(SBSystemApertureSceneElement *)self _updateScene:self->_scene activatingIfNeeded:0 settingsWithTransitionBlock:&__block_literal_global_132_0];
    LOBYTE(v4) = 1;
  }
  return v4;
}

id __55__SBSystemApertureSceneElement_handleElementViewEvent___block_invoke()
{
  id v0 = [MEMORY[0x1E4F42790] transitionContext];
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FA7D90]) initWithCommand:13];
  BOOL v3 = [v1 setWithObject:v2];

  [v0 setActions:v3];
  return v0;
}

id __55__SBSystemApertureSceneElement_handleElementViewEvent___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F42790] transitionContext];
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FA7D90]) initWithCommand:11];
  BOOL v3 = [v1 setWithObject:v2];

  [v0 setActions:v3];
  return v0;
}

- (BOOL)_shouldHandleLaunchAction
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self layoutMode] == 1
    || [(SBSystemApertureSceneElement *)self layoutMode] == 2;
  if ([(SBSystemApertureSceneElement *)self _hasPresentationBehavior:16]) {
    return 0;
  }
  else {
    return ![(SBSystemApertureSceneElement *)self _hasPresentationBehavior:32] || !v3;
  }
}

- (BOOL)_handleLaunchAction
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  uint64_t v4 = objc_msgSend(v3, "SBUISA_associatedAppBundleIdentifier");

  id v5 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  uint64_t v6 = objc_msgSend(v5, "SBUISA_associatedScenePersistenceIdentifier");

  if (!(v4 | v6))
  {
    uint64_t v6 = [(SBApplicationSceneHandle *)self->_associatedApplicationSceneHandle persistenceIdentifier];
  }
  id v7 = [(SBSystemApertureSceneElement *)self launchActionHandler];
  uint64_t v8 = [v7 sceneElement:self decisionForLaunchActionOfAppWithBundleIdentifier:v4 persistenceIdentifier:v6];

  BOOL v9 = v8 != 1
    && [(SBSystemApertureSceneElement *)self _activateCorrespondingAppSceneIfPossible:v8];
  BOOL v10 = v8 == 1 || v9;

  return v10;
}

- (id)_bundleIdForLaunchTargetWithScenePersistenceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__117;
  id v22 = __Block_byref_object_dispose__118;
  id v5 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  objc_msgSend(v5, "SBUISA_associatedAppBundleIdentifier");
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    uint64_t v6 = +[SBSceneManagerCoordinator sharedInstance];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__SBSystemApertureSceneElement__bundleIdForLaunchTargetWithScenePersistenceIdentifier___block_invoke;
    v15[3] = &unk_1E6B0C840;
    id v16 = v4;
    uint64_t v17 = &v18;
    [v6 enumerateSceneManagersWithBlock:v15];
  }
  id v7 = (void *)v19[5];
  if (!v7)
  {
    uint64_t v8 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
    BOOL v9 = objc_msgSend(v8, "SBUISA_launchURL");

    if (v9)
    {
      BOOL v10 = SBWorkspaceApplicationForURLWithError(v9, 0, 0);
      uint64_t v11 = [v10 bundleIdentifier];
      id v12 = (void *)v19[5];
      v19[5] = v11;
    }
    id v7 = (void *)v19[5];
  }
  id v13 = v7;
  _Block_object_dispose(&v18, 8);

  return v13;
}

void __87__SBSystemApertureSceneElement__bundleIdForLaunchTargetWithScenePersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 existingSceneHandleForPersistenceIdentifier:*(void *)(a1 + 32)];
  BOOL v3 = [v5 application];
  id v4 = [v3 bundleIdentifier];
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  }
}

- (BOOL)_activateCorrespondingAppSceneIfPossible:(int64_t)a3
{
  if (a3 == 2)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
    id v4 = objc_msgSend(v5, "SBUISA_associatedScenePersistenceIdentifier");
  }
  uint64_t v6 = [(SBSystemApertureSceneElement *)self _bundleIdForLaunchTargetWithScenePersistenceIdentifier:v4];
  id v7 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  uint64_t v8 = objc_msgSend(v7, "SBUISA_launchURL");

  BOOL v9 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  BOOL v10 = objc_msgSend(v9, "SBUISA_launchAction");

  if (v6
    && (+[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists"), uint64_t v11 = objc_claimAutoreleasedReturnValue(), [v11 applicationWithBundleIdentifier:v6], v12 = objc_claimAutoreleasedReturnValue(), v12, v11, v12))
  {
    id v13 = objc_alloc_init(SBLockScreenUnlockRequest);
    [(SBLockScreenUnlockRequest *)v13 setSource:24];
    [(SBLockScreenUnlockRequest *)v13 setIntent:3];
    [(SBLockScreenUnlockRequest *)v13 setName:@"Launch App from System Aperture Unlock"];
    [(SBLockScreenUnlockRequest *)v13 setWantsBiometricPresentation:1];
    objc_super v14 = [(SBSystemApertureSceneElementScenePresenterView *)self->_sceneView _sbWindowScene];
    [(SBLockScreenUnlockRequest *)v13 setWindowScene:v14];
    objc_initWeak(&location, self);
    v15 = +[SBLockScreenManager sharedInstance];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    __int16 v21 = __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke;
    id v22 = &unk_1E6B0C868;
    id v23 = v6;
    objc_copyWeak(&v29, &location);
    id v16 = v14;
    id v24 = v16;
    id v25 = v4;
    id v26 = v8;
    id v27 = v10;
    id v28 = self;
    [v15 unlockWithRequest:v13 completion:&v19];

    -[SBSystemApertureSceneElement setHasHandledLaunchAction:](self, "setHasHandledLaunchAction:", 1, v19, v20, v21, v22);
    [(SBSystemApertureSceneElement *)self _updateRequiresSuppressionFromSystemAperture];
    if ([(SBSystemApertureSceneElement *)self _hasPresentationBehavior:512])
    {
      [(SBSystemApertureSceneElement *)self setAffiliatedWithSessionMonitor:0];
      if ([(SAAutomaticallyInvalidatable *)self->_alertingActivityAssertion isValid]) {
        [(SAAutomaticallyInvalidatable *)self->_alertingActivityAssertion invalidateWithReason:@"Dismissing upon handling launch action"];
      }
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

void __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke(uint64_t a1, int a2)
{
  if (!a2) {
    return;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.InCallService"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    int v5 = [WeakRetained isActivated];

    if (!v5) {
      return;
    }
  }
  uint64_t v6 = [*(id *)(a1 + 40) sceneManager];
  id v7 = +[SBApplicationController sharedInstance];
  uint64_t v8 = [v7 applicationWithBundleIdentifier:*(void *)(a1 + 32)];

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    id v2 = [v6 displayIdentity];
    BOOL v10 = +[SBDeviceApplicationSceneEntity entityWithApplication:v8 scenePersistenceIdentifier:v9 sceneHandleProvider:v6 displayIdentity:v2];
  }
  else
  {
    uint64_t v11 = [SBDeviceApplicationSceneEntity alloc];
    int v12 = __sb__runningInSpringBoard();
    char v13 = v12;
    if (v12)
    {
      BOOL v14 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      id v2 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v14 = [v2 userInterfaceIdiom] == 1;
    }
    v15 = [v6 displayIdentity];
    BOOL v10 = [(SBDeviceApplicationSceneEntity *)v11 initWithApplication:v8 generatingNewPrimarySceneIfRequired:v14 sceneHandleProvider:v6 displayIdentity:v15];

    if (v13) {
      goto LABEL_11;
    }
  }

LABEL_11:
  if (*(void *)(a1 + 56)) {
    id v16 = (id)[objc_alloc(MEMORY[0x1E4F42C20]) initWithURL:*(void *)(a1 + 56)];
  }
  else {
    id v16 = *(id *)(a1 + 64);
  }
  BOOL v17 = v16;
  if (v16)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
    [(SBApplicationSceneEntity *)v10 addActions:v18];
  }
  uint64_t v19 = [*(id *)(*(void *)(a1 + 72) + 208) _fbsDisplayConfiguration];
  uint64_t v20 = +[SBWorkspace mainWorkspace];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke_2;
  v22[3] = &unk_1E6AF57E8;
  id v23 = v10;
  __int16 v21 = v10;
  [v20 requestTransitionWithOptions:0 displayConfiguration:v19 builder:v22 validator:&__block_literal_global_152_1];
}

void __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:61];
  [v3 setEventLabel:@"LaunchFromSystemAperture"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke_3;
  v4[3] = &unk_1E6AF57C0;
  id v5 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
}

void __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setFlag:1 forActivationSetting:63];
  [v4 setActivatingEntity:*(void *)(a1 + 32)];
}

uint64_t __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke_4()
{
  return 1;
}

- (id)_inferredElementIdentifier
{
  id v3 = (id)*MEMORY[0x1E4FA7F60];
  id v4 = [(FBScene *)self->_scene clientHandle];
  id v5 = [v4 bundleIdentifier];

  if (([v5 isEqualToString:@"com.apple.MusicUIService"] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.MediaRemoteUI"] & 1) != 0)
  {
    uint64_t v6 = (id *)MEMORY[0x1E4FA7F30];
LABEL_4:
    id v7 = *v6;

    id v3 = v7;
    goto LABEL_5;
  }
  if ([v5 isEqualToString:@"com.apple.VoiceMemos"])
  {
    uint64_t v6 = (id *)MEMORY[0x1E4FA7F68];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"com.apple.ReplayKit.ReplayKitAngel"])
  {
    uint64_t v6 = (id *)MEMORY[0x1E4FA7F40];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"com.apple.InCallService"])
  {
    uint64_t v6 = (id *)MEMORY[0x1E4FA7EF8];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"com.apple.Sharing.AirDropUI"])
  {
    uint64_t v6 = (id *)MEMORY[0x1E4FA7EF0];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"com.apple.Maps"])
  {
    uint64_t v6 = (id *)MEMORY[0x1E4FA7F58];
    goto LABEL_4;
  }
  if ([(SBSystemApertureSceneElement *)self hasActivityBehavior])
  {
    uint64_t v6 = (id *)MEMORY[0x1E4FA7F18];
    goto LABEL_4;
  }
LABEL_5:

  return v3;
}

- (NSString)elementIdentifier
{
  id v3 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  id v4 = objc_msgSend(v3, "SBUISA_elementIdentifier");

  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    uint64_t v6 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained elementIdentifier];
    }
    else {
    id v4 = [(SBSystemApertureSceneElement *)self _inferredElementIdentifier];
    }
  }
  return (NSString *)v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)clientIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  id v4 = WeakRetained;
  if (WeakRetained && !self->_scene)
  {
    uint64_t v9 = [WeakRetained clientIdentifier];
  }
  else
  {
    clientIdentifier = self->_clientIdentifier;
    if (!clientIdentifier)
    {
      uint64_t v6 = [(FBScene *)self->_scene clientHandle];
      id v7 = [v6 bundleIdentifier];
      uint64_t v8 = self->_clientIdentifier;
      self->_clientIdentifier = v7;

      clientIdentifier = self->_clientIdentifier;
    }
    uint64_t v9 = clientIdentifier;
  }
  BOOL v10 = v9;

  return v10;
}

- (void)setReadyForPresentation:(BOOL)a3
{
  if (self->_readyForPresentation != a3)
  {
    BOOL v3 = a3;
    self->_readyForPresentation = a3;
    [(SBSystemApertureSceneElement *)self _updateActiveElementsAndAssociatedApplication];
    if (v3) {
      [(SBSystemApertureSceneElement *)self _addActivationAttribute:16];
    }
    if (self->_readyHandler)
    {
      uint64_t v6 = (void (**)(id, SBSystemApertureSceneElement *, uint64_t))MEMORY[0x1D948C7A0]();
      id readyHandler = self->_readyHandler;
      self->_id readyHandler = 0;

      [(id)objc_opt_class() addElementReadyForPresentation:self];
      v6[2](v6, self, 1);
    }
  }
}

- (void)setLayoutHost:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_layoutHost, obj);
    self->_initialPreferredLayoutMode = [(SBSystemApertureSceneElement *)self preferredLayoutMode];
    [(SBSystemApertureSceneElement *)self _acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded];
    id v5 = obj;
  }
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int64_t layoutMode = self->_layoutMode;
  if (layoutMode == a3) {
    return;
  }
  if (a3 == -1)
  {
    [(SBSystemApertureSceneElement *)self setHasBeenRemoved:1];
    int64_t layoutMode = self->_layoutMode;
  }
  self->_mostRecentLayoutModeChangeReason = a4;
  uint64_t v8 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(SBSystemApertureSceneElement *)self succinctDescription];
    BOOL v10 = SAUIStringFromElementViewLayoutMode();
    uint64_t v11 = SAUIStringFromElementViewLayoutMode();
    *(_DWORD *)buf = 138543874;
    v39 = v9;
    __int16 v40 = 2114;
    v41 = v10;
    __int16 v42 = 2114;
    v43 = v11;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ layoutMode: %{public}@ -> %{public}@", buf, 0x20u);
  }
  self->_int64_t layoutMode = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v12 = [(SBSystemApertureSceneElement *)self _layoutObservers];
  char v13 = (void *)[v12 copy];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * i) elementLayoutSpecifier:self layoutModeDidChange:layoutMode reason:a4];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v15);
  }

  self->_wantsLayoutPassForClientUpdate = 1;
  if (a3 < 1)
  {
    if (layoutMode <= 1) {
      [(SBSystemApertureSceneElement *)self _layoutHostMayNotPerformLayoutUpdate];
    }
    if (a3 == -1) {
      [(SBSystemApertureSceneElement *)self _finishDeactivationIfNeeded];
    }
    goto LABEL_33;
  }
  [(SBSystemApertureSceneElement *)self _addActivationAttribute:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  if (a3 == 2)
  {
    p_leadingWrapperView = &self->_leadingWrapperView;
    leadingWrapperView = self->_leadingWrapperView;
    if (!leadingWrapperView) {
      goto LABEL_32;
    }
    id v27 = [(SBSystemApertureSceneElementPlaceholderWrapperView *)leadingWrapperView contentView];
    leadingView = self->_leadingView;

    if (v27 == leadingView) {
      goto LABEL_32;
    }
    id v23 = [WeakRetained leadingView];
    if (!v23) {
      goto LABEL_31;
    }
    id v29 = [WeakRetained minimalView];

    if (v29 != v23) {
      goto LABEL_31;
    }
    uint64_t v25 = 264;
    goto LABEL_30;
  }
  if (a3 != 1) {
    goto LABEL_32;
  }
  minimalWrapperView = self->_minimalWrapperView;
  if (!minimalWrapperView) {
    goto LABEL_32;
  }
  uint64_t v20 = [(SBSystemApertureSceneElementPlaceholderWrapperView *)minimalWrapperView contentView];
  minimalView = self->_minimalView;

  if (v20 == minimalView) {
    goto LABEL_32;
  }
  p_leadingWrapperView = &self->_minimalWrapperView;
  id v23 = [WeakRetained minimalView];
  if (v23)
  {
    id v24 = [WeakRetained leadingView];

    if (v24 == v23)
    {
      uint64_t v25 = 248;
LABEL_30:
      [*(id *)((char *)&self->super.isa + v25) setContentView:0];
    }
  }
LABEL_31:
  [(SBSystemApertureSceneElementPlaceholderWrapperView *)*p_leadingWrapperView setContentView:v23];

LABEL_32:
LABEL_33:
  if (layoutMode == 3)
  {
    char v30 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
    int v31 = objc_msgSend(v30, "SBUISA_hasMenuPresentation");

    if (v31)
    {
      int v32 = [(SBSystemApertureSceneElement *)self layoutHost];
      [v32 menuPresentationRequestDidChangeForLayoutSpecifier:self];
    }
  }
  [(SBSystemApertureSceneElement *)self _updateSceneBackgroundStateIfNeeded];
  [(SBSystemApertureSceneElement *)self _updateActiveElementsAndAssociatedApplication];
  -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
}

- (int64_t)_layoutModeForClientLayoutMode:(int64_t)a3
{
  int64_t result = 0;
  switch(a3)
  {
    case -1:
      int64_t result = -1;
      break;
    case 0:
      if ([(SBSystemApertureSceneElement *)self isActivated]
        && ![(SBSystemApertureSceneElement *)self isDeactivating]
        && (self->_leadingWrapperView || self->_trailingWrapperView))
      {
        goto LABEL_10;
      }
      int64_t result = 0;
      break;
    case 2:
      int64_t result = 1;
      break;
    case 3:
LABEL_10:
      int64_t result = 2;
      break;
    case 4:
      int64_t result = 3;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)_clientLayoutModeForLayoutMode:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4) {
    return 0;
  }
  else {
    return qword_1D8FD3200[a3 + 1];
  }
}

- (int64_t)preferredLayoutMode
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  int64_t v4 = -[SBSystemApertureSceneElement _layoutModeForClientLayoutMode:](self, "_layoutModeForClientLayoutMode:", objc_msgSend(v3, "SBUISA_preferredLayoutMode"));
  int64_t v5 = [(SBSystemApertureSceneElement *)self maximumSupportedLayoutMode];

  if (v4 >= v5) {
    return v5;
  }
  else {
    return v4;
  }
}

- (int64_t)minimumSupportedLayoutMode
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  int64_t v4 = -[SBSystemApertureSceneElement _layoutModeForClientLayoutMode:](self, "_layoutModeForClientLayoutMode:", objc_msgSend(v3, "SBUISA_minimumLayoutMode"));
  int64_t v5 = [(SBSystemApertureSceneElement *)self maximumSupportedLayoutMode];

  if (v4 >= v5) {
    return v5;
  }
  else {
    return v4;
  }
}

- (int64_t)maximumSupportedLayoutMode
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  int64_t v4 = -[SBSystemApertureSceneElement _layoutModeForClientLayoutMode:](self, "_layoutModeForClientLayoutMode:", objc_msgSend(v3, "SBUISA_maximumLayoutMode"));

  int64_t v5 = [(SBSystemApertureSceneElement *)self elementIdentifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4FA7F30]];

  if (v6) {
    int64_t v7 = 3;
  }
  else {
    int64_t v7 = v4;
  }
  if ([(SBSystemApertureSceneElement *)self hasBeenRemoved]) {
    return -1;
  }
  else {
    return v7;
  }
}

- (BOOL)isRequestingMenuPresentation
{
  if ([(SBSystemApertureSceneElement *)self layoutMode] != 3) {
    return 0;
  }
  BOOL v3 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  if (objc_msgSend(v3, "SBUISA_hasMenuPresentation")) {
    BOOL v4 = [(SBSystemApertureSceneElement *)self _supportsMenuPresentations];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setHasBeenRemoved:(BOOL)a3
{
  if (self->_hasBeenRemoved != a3)
  {
    self->_hasBeenRemoved = a3;
    if ([(SBSystemApertureSceneElement *)self _updateRequiresSuppressionFromSystemAperture])
    {
      id v4 = [(SBSystemApertureSceneElement *)self layoutHost];
      [v4 preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
    }
  }
}

- (void)setSuppressedByProximityReader:(BOOL)a3
{
  if (self->_suppressedByProximityReader != a3)
  {
    self->_suppressedByProximityReader = a3;
    [(SBSystemApertureSceneElement *)self _acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded];
  }
}

- (void)setPreviewing:(BOOL)a3
{
  if (self->_previewing != a3)
  {
    self->_previewing = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setUrgent:(BOOL)a3
{
  if (self->_urgent != a3)
  {
    self->_urgent = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setExpanding:(BOOL)a3
{
  if (self->_expanding != a3)
  {
    self->_expanding = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setProminent:(BOOL)a3
{
  if (self->_prominent != a3)
  {
    self->_prominent = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (void)pop
{
}

- (void)suppressForReason:(int64_t)a3
{
  [(SBSystemApertureSceneElement *)self setSuppressedByProximityReader:a3 == 7];
}

- (void)setSuppressed:(BOOL)a3
{
  if (!a3) {
    [(SBSystemApertureSceneElement *)self setSuppressedByProximityReader:0];
  }
}

- (BOOL)_isAssociatedWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  int v6 = objc_msgSend(v5, "SBUISA_associatedAppBundleIdentifier");
  char v7 = [v6 isEqualToString:v4];

  if ([(SBSystemApertureSceneElement *)self _hasPresentationBehavior:4096])
  {
    char v8 = 0;
  }
  else
  {
    uint64_t v9 = [(SBApplicationSceneHandle *)self->_associatedApplicationSceneHandle application];
    BOOL v10 = [v9 bundleIdentifier];
    char v8 = [v10 isEqualToString:v4];
  }
  if ([(SBSystemApertureSceneElement *)self _hasPresentationBehavior:4096])
  {
    char v11 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    char v13 = [WeakRetained clientIdentifier];
    char v11 = [v13 isEqualToString:v4];
  }
  if ([(SBSystemApertureSceneElement *)self _hasPresentationBehavior:4096])
  {
    char v14 = 0;
  }
  else
  {
    uint64_t v15 = [(FBScene *)self->_scene clientHandle];
    uint64_t v16 = [v15 bundleIdentifier];
    char v14 = [v16 isEqualToString:v4];
  }
  return v8 | v7 | v11 | v14;
}

- (BOOL)_isAssociatedWithSceneWithPersistenceIdentifier:(id)a3
{
  id v4 = a3;
  if (-[SBSystemApertureSceneElement _isAssociatedWithBundleIdentifier:](self, "_isAssociatedWithBundleIdentifier:", @"com.apple.InCallService")&& ([v4 isEqualToString:@"SBAmbientFullScreenPresentationInCallSceneIdentifier"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F62490] sharedInstance];
    char v7 = [v6 sceneWithIdentifier:v4];

    char v8 = [v7 settings];
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        char v11 = v10;
      }
      else {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
    id v12 = v11;

    char v13 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
    char v14 = objc_msgSend(v13, "SBUISA_associatedScenePersistenceIdentifier");
    uint64_t v15 = [v12 persistenceIdentifier];
    if ([v14 isEqualToString:v15])
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v16 = [(SBApplicationSceneHandle *)self->_associatedApplicationSceneHandle persistenceIdentifier];
      BOOL v17 = [v12 persistenceIdentifier];
      char v5 = [v16 isEqualToString:v17];
    }
  }

  return v5;
}

- (BOOL)acceptsFullScreenTransitionFromSceneWithIdentifier:(id)a3 ofBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBSystemApertureSceneElement *)self requiresSuppressionFromSystemAperture]|| [(SBSystemApertureSceneElement *)self _hasPresentationBehavior:1024])
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [(SBSystemApertureSceneElement *)self _isAssociatedWithBundleIdentifier:v7]|| [(SBSystemApertureSceneElement *)self _isAssociatedWithSceneWithPersistenceIdentifier:v6];
  }

  return v8;
}

- (BOOL)shouldSuppressElementWhilePresentingSceneWithIdentifier:(id)a3
{
  id v4 = a3;
  LOBYTE(v5) = ![(SBSystemApertureSceneElement *)self _hasPresentationBehavior:4]
            && [(SBSystemApertureSceneElement *)self _isAssociatedWithSceneWithPersistenceIdentifier:v4];
  if ([(SBSystemApertureSceneElement *)self _hasPresentationBehavior:1024])
  {
    id v6 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
    id v7 = objc_msgSend(v6, "SBUISA_associatedScenePersistenceIdentifier");

    if (v7) {
      BOOL v5 = ![(SBSystemApertureSceneElement *)self _isAssociatedWithSceneWithPersistenceIdentifier:v4];
    }
  }

  return v5;
}

- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  uint64_t v6 = objc_msgSend(v5, "SBUISA_associatedAppBundleIdentifier");

  id v7 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  uint64_t v8 = objc_msgSend(v7, "SBUISA_associatedScenePersistenceIdentifier");

  if (v6 | v8)
  {
    BOOL v11 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    id v10 = [WeakRetained clientIdentifier];
    BOOL v11 = v10 == 0;
  }
  LOBYTE(v12) = 0;
  if (![(SBSystemApertureSceneElement *)self _hasPresentationBehavior:2] && !v11) {
    LOBYTE(v12) = (BSEqualStrings() & 1) == 0
  }
               && [(SBSystemApertureSceneElement *)self _isAssociatedWithBundleIdentifier:v4];
  if ([(SBSystemApertureSceneElement *)self _hasPresentationBehavior:1024]) {
    BOOL v12 = ![(SBSystemApertureSceneElement *)self _isAssociatedWithBundleIdentifier:v4];
  }

  return v12;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return ![(SBSystemApertureSceneElement *)self _hasPresentationBehavior:8];
}

- (BOOL)shouldSuppressElementWhileOnContinuityDisplay
{
  if ([(SBSystemApertureSceneElement *)self _hasPresentationBehavior:2048]) {
    return 1;
  }
  id v4 = [(SBSystemApertureSceneElement *)self associatedApplicationSceneHandle];
  BOOL v5 = [v4 application];
  uint64_t v6 = [v5 bundleIdentifier];
  char v7 = [v6 isEqualToString:@"com.apple.InCallService"];

  return v7;
}

- (BOOL)shouldSuppressElementWhileProximityReaderPresent
{
  BOOL v3 = [(FBScene *)self->_scene clientHandle];
  id v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.CoreAuthUI"])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v6 = [(FBScene *)self->_scene clientHandle];
    char v7 = [v6 bundleIdentifier];
    int v5 = [v7 isEqualToString:@"com.apple.PassbookUISceneService"] ^ 1;
  }
  return v5;
}

- (BOOL)shouldSuppressElementWhilePresentingNoAppsOrScenes
{
  return [(SBSystemApertureSceneElement *)self _hasPresentationBehavior:1024];
}

- (BOOL)shouldIgnoreSystemChromeSuppressionWhilePresentingAppWithBundleId:(id)a3
{
  id v4 = a3;
  if ([(SBSystemApertureSceneElement *)self _hasPresentationBehavior:2]) {
    BOOL v5 = [(SBSystemApertureSceneElement *)self _isAssociatedWithBundleIdentifier:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_updateRequiresSuppressionFromSystemAperture
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self requiresSuppressionFromSystemAperture];
  BOOL v4 = [(SBSystemApertureSceneElement *)self _calculateRequiresSuppressionFromSystemAperture];
  self->_requiresSuppressionFromSystemAperture = v4;
  return v3 ^ v4;
}

- (BOOL)_calculateRequiresSuppressionFromSystemAperture
{
  if ([(SBSystemApertureSceneElement *)self isAffiliatedWithSessionMonitor]
    && ![(SBSystemApertureSceneElement *)self hasBeenRemoved])
  {
    return 0;
  }
  BOOL v3 = [(SBSystemApertureSceneElement *)self preferredLayoutMode] <= 0
    && ![(SBSystemApertureSceneElement *)self requiresSuppressionFromSystemAperture]|| [(SBSystemApertureSceneElement *)self maximumSupportedLayoutMode] < 1;
  BOOL v5 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  uint64_t v6 = objc_msgSend(v5, "SBUISA_associatedAppBundleIdentifier");

  BOOL v7 = [(SBSystemApertureSceneElement *)self _hasPresentationBehavior:256];
  if (v6) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v7;
  }
  int v9 = v3 || v8;
  id v10 = [(SBSystemApertureSceneElement *)self elementIdentifier];
  if (![v10 isEqualToString:*MEMORY[0x1E4FA7F30]]) {
    goto LABEL_14;
  }
  int v11 = [v6 isEqualToString:@"com.apple.VoiceMemos"];

  if (v11)
  {
    id v10 = +[SBSystemApertureSceneElement activeElements];
    v9 |= objc_msgSend(v10, "bs_containsObjectPassingTest:", &__block_literal_global_188_0);
LABEL_14:
  }
  BOOL v12 = v9 != 0;
  if (([(SAAutomaticallyInvalidatable *)self->_alertingActivityAssertion isValid] & 1) == 0)
  {
    BOOL v13 = [(SAAssertion *)self->_elementHostPrefersSuppressionAssertion isValid];
    if (v9) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v13;
    }
  }
  if ([(SBSystemApertureSceneElement *)self hasHandledLaunchAction]) {
    BOOL v14 = [(SBSystemApertureSceneElement *)self _hasPresentationBehavior:512];
  }
  else {
    BOOL v14 = 0;
  }
  BOOL v4 = (v14 | v12 | [(SBSystemApertureSceneElement *)self hasBeenRemoved]) != 0;

  return v4;
}

uint64_t __79__SBSystemApertureSceneElement__calculateRequiresSuppressionFromSystemAperture__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 elementIdentifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4FA7F68]];

  return v3;
}

- (BOOL)isInteractiveDismissalEnabled
{
  uint64_t v3 = [(SBSystemApertureSceneElement *)self scene];
  if (v3)
  {
    BOOL v4 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
    int v5 = objc_msgSend(v4, "SBUISA_preventsInteractiveDismissal") ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isMinimalPresentationPossible
{
  if ([(SBSystemApertureSceneElement *)self hasAlertBehavior]) {
    return self->_minimalView != 0;
  }
  BOOL v4 = [(SBSystemApertureSceneElement *)self configuration];
  if ([v4 isMinimalPresentationPossible]) {
    BOOL v3 = self->_minimalView != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (unint64_t)_effectivePresentationBehaviors
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  unint64_t v4 = objc_msgSend(v3, "SBUISA_presentationBehaviors");

  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  uint64_t v6 = WeakRetained;
  if (self->_scene) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = WeakRetained == 0;
  }
  if (!v7) {
    unint64_t v4 = [WeakRetained presentationBehaviors];
  }

  return v4;
}

- (BOOL)_hasPresentationBehavior:(unint64_t)a3
{
  LOBYTE(v5) = (a3 & ~[(SBSystemApertureSceneElement *)self _effectivePresentationBehaviors]) == 0;
  if ([(SBSystemApertureSceneElement *)self alwaysAllowTapToAppForBodyTaps])
  {
    if (a3 == 16)
    {
      LOBYTE(v5) = 0;
    }
    else if (a3 == 32)
    {
      uint64_t v6 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
      unint64_t v5 = ((unint64_t)objc_msgSend(v6, "SBUISA_presentationBehaviors") >> 4) & 1;
    }
  }
  return v5;
}

- (BOOL)isAffiliatedWithSessionMonitor
{
  return [(SAAutomaticallyInvalidatable *)self->_sessionMonitorAssertion isValid];
}

- (UIColor)keyColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  if (WeakRetained && !self->_scene && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unint64_t v4 = [WeakRetained keyColor];
  }
  else
  {
    unint64_t v5 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
    unint64_t v4 = objc_msgSend(v5, "SBUISA_keyColor");
  }
  return (UIColor *)v4;
}

- (void)setAffiliatedWithSessionMonitor:(BOOL)a3
{
  int v3 = a3;
  if ([(SBSystemApertureSceneElement *)self hasHandledLaunchAction]) {
    v3 &= ~[(SBSystemApertureSceneElement *)self _hasPresentationBehavior:512];
  }
  if (v3 != [(SBSystemApertureSceneElement *)self isAffiliatedWithSessionMonitor])
  {
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v6 = [WeakRetained systemManagedAlertingActivityAssertionWithReason:@"affiliated with session monitor"];
        sessionMonitorAssertion = self->_sessionMonitorAssertion;
        self->_sessionMonitorAssertion = v6;
      }
    }
    else
    {
      [(SAAutomaticallyInvalidatable *)self->_sessionMonitorAssertion invalidateWithReason:@"no longer associated with session monitor"];
    }
    if ([(SBSystemApertureSceneElement *)self _updateRequiresSuppressionFromSystemAperture])
    {
      id v8 = [(SBSystemApertureSceneElement *)self layoutHost];
      [v8 preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
    }
  }
}

- (BOOL)isAlerting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
  int v3 = [WeakRetained alertingActivityAssertion];
  char v4 = [v3 isValid];

  return v4;
}

- (id)requestAlertingAssertionImplicitlyDismissable:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBSystemApertureSceneElement *)self _isValidAlertingSource:1])
  {
    [(SBSystemApertureSceneElement *)self _handleAlertingAssertionRequestForReason:@"Scene Element - SBSystemApertureContextAccepting Request" implicitlyDismissable:v3];
    unint64_t v5 = [(SBSystemApertureSceneElement *)self _existingAlertingAssertion];
    if ([(SBSystemApertureSceneElement *)self _updateRequiresSuppressionFromSystemAperture])
    {
      uint64_t v6 = [(SBSystemApertureSceneElement *)self layoutHost];
      [v6 preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (void)setElementProviderPrefersSuppression:(BOOL)a3
{
  elementHostPrefersSuppressionAssertion = self->_elementHostPrefersSuppressionAssertion;
  if (a3)
  {
    if (![(SAAssertion *)elementHostPrefersSuppressionAssertion isValid])
    {
      unint64_t v5 = (SAAssertion *)objc_alloc_init(MEMORY[0x1E4FA92F0]);
      uint64_t v6 = self->_elementHostPrefersSuppressionAssertion;
      self->_elementHostPrefersSuppressionAssertion = v5;

      objc_initWeak(&location, self);
      objc_initWeak(&from, self->_elementHostPrefersSuppressionAssertion);
      BOOL v7 = self->_elementHostPrefersSuppressionAssertion;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      int v11 = __69__SBSystemApertureSceneElement_setElementProviderPrefersSuppression___block_invoke;
      BOOL v12 = &unk_1E6AF9240;
      objc_copyWeak(&v13, &location);
      objc_copyWeak(&v14, &from);
      [(SAAssertion *)v7 addInvalidationBlock:&v9];
      if ([(SBSystemApertureSceneElement *)self _updateRequiresSuppressionFromSystemAperture])
      {
        id v8 = [(SBSystemApertureSceneElement *)self layoutHost];
        [v8 preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
      }
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(SAAssertion *)elementHostPrefersSuppressionAssertion invalidateWithReason:@"setElementProviderPrefersSuppression called with NO"];
  }
}

void __69__SBSystemApertureSceneElement_setElementProviderPrefersSuppression___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (id)*((void *)WeakRetained + 51);
    uint64_t v9 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));

    BOOL v3 = v9;
    if (v4 == v5)
    {
      uint64_t v6 = (void *)v9[51];
      v9[51] = 0;

      int v7 = [v9 _updateRequiresSuppressionFromSystemAperture];
      BOOL v3 = v9;
      if (v7)
      {
        id v8 = [v9 layoutHost];
        [v8 preferredLayoutModeDidInvalidateForLayoutSpecifier:v9];

        BOOL v3 = v9;
      }
    }
  }
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  int64_t v3 = [(SBSystemApertureSceneElement *)self isProminent];
  trailingWrapperView = self->_trailingWrapperView;
  if (trailingWrapperView)
  {
    id v5 = [(SBSystemApertureSceneElementPlaceholderWrapperView *)trailingWrapperView contentView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    int v7 = [WeakRetained trailingView];
    if (v5 == v7)
    {
      [(SBSystemApertureSceneElementPlaceholderWrapperView *)self->_trailingWrapperView bounds];
      BOOL v8 = v10 == 0.0 && v9 == 0.0;
    }
    else
    {
      BOOL v8 = 0;
    }

    if (v8) {
      return v3 | 2;
    }
  }
  return v3;
}

- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  BOOL v8 = v7;
  if (a4 == 2)
  {
    if (objc_msgSend(v7, "SBUISA_specifiesPreferredPaddingForCompactLayout"))
    {
      id v9 = [(SBSystemApertureSceneElement *)self leadingView];
      if (v9 == v6)
      {
        BOOL v10 = 1;
      }
      else
      {
        id v11 = [(SBSystemApertureSceneElement *)self trailingView];
        BOOL v10 = v11 == v6;
      }
      goto LABEL_10;
    }
  }
  else if (a4 == 1 && objc_msgSend(v7, "SBUISA_attachedMinimalViewRequiresZeroPadding"))
  {
    id v9 = [(SBSystemApertureSceneElement *)self minimalView];
    BOOL v10 = v9 == v6;
LABEL_10:

    goto LABEL_11;
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  id v7 = [(SBSystemApertureSceneElement *)self leadingView];

  if (v7 == v5)
  {
    objc_msgSend(v6, "SBUISA_preferredPaddingForCompactLayout");
    double v9 = v10;
  }
  else
  {
    id v8 = [(SBSystemApertureSceneElement *)self trailingView];

    if (v8 == v5)
    {
      objc_msgSend(v6, "SBUISA_preferredPaddingForCompactLayout");
      double v9 = v11;
    }
    else
    {
      [(SBSystemApertureSceneElement *)self minimalView];

      double v9 = 0.0;
    }
  }

  return v9;
}

- (BOOL)isFixedInOrientation
{
  if ([(SBSystemApertureSceneElement *)self wantsSpecialFlowerBoundsResizingAnimationForWallet])
  {
    return 1;
  }
  id v4 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  char v5 = objc_msgSend(v4, "SBUISA_prefersFixedPortraitOrientation");

  return v5;
}

- (void)_layoutHostMayNotPerformLayoutUpdate
{
  if ([(SBSystemApertureSceneElement *)self wantsLayoutPassForClientUpdate]
    && [(SBSystemApertureSceneElement *)self layoutMode] <= 1)
  {
    int64_t v3 = [(SBSystemApertureSceneElement *)self sceneSettings];
    objc_msgSend(v3, "SBUISA_containerViewFrame");
    -[SBSystemApertureSceneElement _proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:](self, "_proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:", -193, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    if ([(SBSystemApertureSceneElement *)self _updateReasonsForTransitionWithProposedParameters:v4 excludingReasons:-193])
    {
      self->_wantsLayoutPassForClientUpdate = 0;
      [(SBSystemApertureSceneElement *)self _applyTransitionParameters:v4];
    }
  }
}

- (BOOL)_requiresForegroundScene
{
  if ([(SBSystemApertureSceneElement *)self backlightIsOrWillBecomeActive])
  {
    return [(SBSystemApertureSceneElement *)self elementAppearState]
        || [(SBSystemApertureSceneElement *)self layoutMode] > 0;
  }
  else
  {
    id v4 = [(SBSystemApertureSceneElement *)self configuration];
    if ([v4 entersBackgroundWhenBacklightIsOff])
    {
      BOOL v3 = 0;
    }
    else if ([(SBSystemApertureSceneElement *)self elementAppearState])
    {
      BOOL v3 = 1;
    }
    else
    {
      BOOL v3 = [(SBSystemApertureSceneElement *)self layoutMode] > 0;
    }
  }
  return v3;
}

- (void)_updateSceneBackgroundStateIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBSystemApertureSceneElement *)self sceneSettings];
  objc_msgSend(v3, "SBUISA_containerViewFrame");
  id v4 = -[SBSystemApertureSceneElement _proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:](self, "_proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:", -129, 0);

  if ([(SBSystemApertureSceneElement *)self _updateReasonsForTransitionWithProposedParameters:v4 excludingReasons:-129])
  {
    char v5 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SBSystemApertureSceneElement *)self succinctDescription];
      int v7 = 138543618;
      id v8 = v6;
      __int16 v9 = 1024;
      int v10 = [v4 wantsForeground];
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ updating to foreground %{BOOL}u", (uint8_t *)&v7, 0x12u);
    }
    [(SBSystemApertureSceneElement *)self _applyTransitionParameters:v4];
  }
}

- (BOOL)isBiometricKit
{
  id v2 = [(SBSystemApertureSceneElement *)self presentable];
  BOOL v3 = [v2 requesterIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.BiometricKitUI"];

  return v4;
}

- (int64_t)customLayoutRequestingSpecialFlowerBoundsResizingAnimation
{
  if ([(SBSystemApertureSceneElement *)self isBiometricKit]) {
    return 3;
  }
  if ([(SBSystemApertureSceneElement *)self wantsSpecialFlowerBoundsResizingAnimationForWallet])
  {
    return 3;
  }
  return 0;
}

- (void)systemApertureElementAssertionAcquired
{
}

- (void)systemApertureElementAssertionInvalidated
{
}

- (NSSet)representedBackgroundActivityIdentifiers
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  char v4 = objc_msgSend(v3, "SBUISA_backgroundActivitiesToSuppress");

  uint64_t v5 = [(SBSystemApertureSceneElement *)self associatedApplication];
  if (v5)
  {
    id v6 = (void *)v5;
    int v7 = [(id)SBApp nowLocatingApps];
    id v8 = [(SBSystemApertureSceneElement *)self associatedApplication];
    int v9 = [v7 containsObject:v8];

    if (v9)
    {
      uint64_t v10 = [v4 setByAddingObject:*MEMORY[0x1E4FA95C0]];

      char v4 = (void *)v10;
    }
  }
  return (NSSet *)v4;
}

- (BOOL)handleHomeButtonPress
{
  return 0;
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
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  if (([(SBDeviceApplicationSceneHandle *)self->_associatedApplicationSceneHandle preferredHardwareButtonEventTypes] & 2) == 0)return 0; {
  associatedApplicationSceneHandle = self->_associatedApplicationSceneHandle;
  }
  return [(SBDeviceApplicationSceneHandle *)associatedApplicationSceneHandle handleHardwareButtonEventType:1];
}

- (BOOL)handleVolumeDownButtonPress
{
  if (([(SBDeviceApplicationSceneHandle *)self->_associatedApplicationSceneHandle preferredHardwareButtonEventTypes] & 4) == 0)return 0; {
  associatedApplicationSceneHandle = self->_associatedApplicationSceneHandle;
  }
  return [(SBDeviceApplicationSceneHandle *)associatedApplicationSceneHandle handleHardwareButtonEventType:2];
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(SBDeviceApplicationSceneHandle *)self->_associatedApplicationSceneHandle preferredHardwareButtonEventTypes];
  if (!v3)
  {
    if ((v5 & 8) != 0)
    {
      uint64_t v6 = 3;
      goto LABEL_7;
    }
    return 0;
  }
  if ((v5 & 0x10) == 0) {
    return 0;
  }
  uint64_t v6 = 4;
LABEL_7:
  associatedApplicationSceneHandle = self->_associatedApplicationSceneHandle;
  return [(SBDeviceApplicationSceneHandle *)associatedApplicationSceneHandle handleHardwareButtonEventType:v6];
}

- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  if (a4 != 4) {
    -[SBSystemApertureSceneElement setBacklightIsOrWillBecomeActive:](self, "setBacklightIsOrWillBecomeActive:", 1, a4, a5);
  }
}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  [(SBSystemApertureSceneElement *)self setBacklightIsOrWillBecomeActive:a4 != 4];
}

- (void)_updatePortalViews
{
  BOOL v3 = [(SBSystemApertureSceneElement *)self scene];
  char v4 = [v3 clientSettings];
  int v5 = objc_msgSend(v4, "SBUISA_contextId");
  if ([v3 contentState] == 2)
  {
    uint64_t v6 = [v3 layerManager];
    int v7 = [v6 layers];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __50__SBSystemApertureSceneElement__updatePortalViews__block_invoke;
    v28[3] = &__block_descriptor_36_e22_B16__0__FBSceneLayer_8l;
    int v29 = v5;
    id v8 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v28);
    uint64_t v9 = [v8 contextID];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = objc_msgSend(v4, "SBUISA_leadingViewRenderingId");
  leadingView = self->_leadingView;
  objc_msgSend(v4, "SBUISA_preferredLeadingViewSize");
  -[SBSystemApertureSceneElementAccessoryView setPreferredSize:](leadingView, "setPreferredSize:");
  [(SBSystemApertureSceneElementAccessoryView *)self->_leadingView setSourceLayerRenderingId:v10 contextId:v9];
  BOOL v12 = self->_leadingView;
  id v13 = objc_msgSend(v4, "SBUISA_leadingViewAccessibilityLabel");
  [(SBSystemApertureSceneElementAccessoryView *)v12 setAccessibilityLabel:v13];

  uint64_t v14 = objc_msgSend(v4, "SBUISA_trailingViewRenderingId");
  trailingView = self->_trailingView;
  objc_msgSend(v4, "SBUISA_preferredTrailingViewSize");
  -[SBSystemApertureSceneElementAccessoryView setPreferredSize:](trailingView, "setPreferredSize:");
  [(SBSystemApertureSceneElementAccessoryView *)self->_trailingView setSourceLayerRenderingId:v14 contextId:v9];
  uint64_t v16 = self->_trailingView;
  BOOL v17 = objc_msgSend(v4, "SBUISA_trailingViewAccessibilityLabel");
  [(SBSystemApertureSceneElementAccessoryView *)v16 setAccessibilityLabel:v17];

  uint64_t v18 = objc_msgSend(v4, "SBUISA_minimalViewRenderingId");
  minimalView = self->_minimalView;
  objc_msgSend(v4, "SBUISA_preferredMinimalViewSize");
  -[SBSystemApertureSceneElementAccessoryView setPreferredSize:](minimalView, "setPreferredSize:");
  [(SBSystemApertureSceneElementAccessoryView *)self->_minimalView setSourceLayerRenderingId:v18 contextId:v9];
  uint64_t v20 = self->_minimalView;
  __int16 v21 = objc_msgSend(v4, "SBUISA_minimalViewAccessibilityLabel");
  [(SBSystemApertureSceneElementAccessoryView *)v20 setAccessibilityLabel:v21];

  uint64_t v22 = objc_msgSend(v4, "SBUISA_detachedMinimalViewRenderingId");
  if (v22 && !self->_detachedMinimalView)
  {
    id v23 = (SBSystemApertureSceneElementAccessoryView *)objc_alloc_init(MEMORY[0x1E4FA7988]);
    detachedMinimalView = self->_detachedMinimalView;
    self->_detachedMinimalView = v23;
  }
  uint64_t v25 = self->_detachedMinimalView;
  objc_msgSend(v4, "SBUISA_preferredDetachedMinimalViewSize");
  -[SBSystemApertureSceneElementAccessoryView setPreferredSize:](v25, "setPreferredSize:");
  [(SBSystemApertureSceneElementAccessoryView *)self->_detachedMinimalView setSourceLayerRenderingId:v22 contextId:v9];
  id v26 = self->_detachedMinimalView;
  id v27 = objc_msgSend(v4, "SBUISA_detachedMinimalViewAccessibilityLabel");
  [(SBSystemApertureSceneElementAccessoryView *)v26 setAccessibilityLabel:v27];
}

BOOL __50__SBSystemApertureSceneElement__updatePortalViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 type] == 1 && objc_msgSend(v3, "contextID") == *(_DWORD *)(a1 + 32);

  return v4;
}

- (BOOL)_tryMovingToPlaceholderElementWithClientSettingsDiff:(id)a3 forScene:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_postSceneActivationPlaceholderTest)
  {
    uint64_t v14 = [(id)objc_opt_class() activePlaceholderElementPassingTest:self->_postSceneActivationPlaceholderTest];
    id postSceneActivationPlaceholderTest = self->_postSceneActivationPlaceholderTest;
    self->_id postSceneActivationPlaceholderTest = 0;

    if (self->_postSceneActivationPlaceholderElementFoundHandler)
    {
      uint64_t v16 = (void (**)(void, void))MEMORY[0x1D948C7A0]();
      id postSceneActivationPlaceholderElementFoundHandler = self->_postSceneActivationPlaceholderElementFoundHandler;
      self->_id postSceneActivationPlaceholderElementFoundHandler = 0;

      BOOL v18 = v14 != 0;
      if (v14)
      {
        id readyHandler = self->_readyHandler;
        self->_id readyHandler = 0;

        self->_BOOL invalidatingForMoveToPlaceholderElement = 1;
        ((void (**)(void, void *))v16)[2](v16, v14);
        [v14 scene:v11 didUpdateClientSettingsWithDiff:v10 oldClientSettings:v12 transitionContext:v13];
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 clientSettings];
  uint64_t v15 = objc_msgSend(v14, "SBUI_systemApertureDescriptionOfDiffFromSettings:", v12);

  if (!v15)
  {
    BOOL v18 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
    goto LABEL_7;
  }
  uint64_t v16 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v17 = [(SBSystemApertureSceneElement *)self succinctDescription];
    *(_DWORD *)buf = 138543618;
    v154 = v17;
    __int16 v155 = 2114;
    v156 = v15;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ received clientSettings update with changes: %{public}@", buf, 0x16u);
  }
  BOOL v18 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  if (![(SBSystemApertureSceneElement *)self _tryMovingToPlaceholderElementWithClientSettingsDiff:v11 forScene:v10 oldClientSettings:v12 transitionContext:v13])
  {
LABEL_7:
    v140 = v15;
    id v141 = v11;
    v145 = v13;
    id v142 = v10;
    int64_t v19 = [(SBSystemApertureSceneElement *)self layoutMode];
    [(SBSystemApertureSceneElement *)self _updatePortalViews];
    [(SBSystemApertureSceneElement *)self _updateReadyForPresentationIfNeeded];
    uint64_t v20 = [(SBSystemApertureSceneElement *)self layoutHost];
    uint64_t v21 = objc_msgSend(v12, "SBUISA_preferredLayoutMode");
    uint64_t v22 = objc_msgSend(v18, "SBUISA_preferredLayoutMode");
    BOOL v23 = v21 != v22;
    if (([(SBSystemApertureSceneElement *)self layoutMode] & 0x8000000000000000) == 0)
    {
      int64_t v24 = [(SBSystemApertureSceneElement *)self maximumSupportedLayoutMode];
      int64_t v25 = [(SBSystemApertureSceneElement *)self layoutMode];
      BOOL v23 = v21 != v22 || v24 < v25;
    }
    id v27 = objc_msgSend(v12, "SBUISA_associatedAppBundleIdentifier");
    id v28 = objc_msgSend(v18, "SBUISA_associatedAppBundleIdentifier");
    int v29 = BSEqualStrings();

    char v30 = objc_msgSend(v12, "SBUISA_associatedScenePersistenceIdentifier");
    int v31 = objc_msgSend(v18, "SBUISA_associatedScenePersistenceIdentifier");
    int v137 = BSEqualStrings();

    LODWORD(v30) = objc_msgSend(v12, "SBUISA_presentationBehaviors");
    if (((objc_msgSend(v18, "SBUISA_presentationBehaviors") ^ v30) & 0x40ELL) != 0) {
      BOOL v23 = 1;
    }
    if ((v29 & 1) == 0) {
      [(SBSystemApertureSceneElement *)self _updateActiveElementsAndAssociatedApplication];
    }
    objc_msgSend(v12, "SBUISA_customLayoutPreferredOutsetsFromUnsafeArea");
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    objc_msgSend(v18, "SBUISA_customLayoutPreferredOutsetsFromUnsafeArea");
    BOOL v43 = v35 != v42;
    if (v33 != v44) {
      BOOL v43 = 1;
    }
    if (v39 != v41) {
      BOOL v43 = 1;
    }
    int v45 = v37 != v40 || v43;
    uint64_t v46 = objc_msgSend(v12, "SBUISA_preferredCustomLayout");
    uint64_t v47 = objc_msgSend(v18, "SBUISA_preferredCustomLayout");
    int v138 = v29;
    BOOL v139 = v23;
    if (v47 == 3)
    {
      [(SBSystemApertureSceneElement *)self setWantsSpecialFlowerBoundsResizingAnimationForWallet:1];
      BOOL v48 = v46 != 3;
      int64_t v49 = 3;
      goto LABEL_41;
    }
    BOOL v50 = v46 == v47;
    BOOL v48 = v46 != v47;
    if (!v47 && v50)
    {
      objc_msgSend(v12, "SBUISA_preferredCustomAspectRatio");
      double v52 = v51;
      double v54 = v53;
      objc_msgSend(v18, "SBUISA_preferredCustomAspectRatio");
      int64_t v49 = 0;
      BOOL v48 = v54 != v56 || v52 != v55;
      if (v55 == 1.0 && v56 == 1.0) {
        goto LABEL_38;
      }
    }
    else if (v47 == 2)
    {
      int64_t v49 = 2;
    }
    else
    {
      if (v47 == 1)
      {
LABEL_38:
        int64_t v49 = 1;
        goto LABEL_41;
      }
      int64_t v49 = 0;
    }
LABEL_41:
    self->_systemApertureCustomLayout = v49;
    objc_msgSend(v12, "SBUISA_preferredLeadingViewSize");
    double v143 = v57;
    double v136 = v58;
    objc_msgSend(v18, "SBUISA_preferredLeadingViewSize");
    double v60 = v59;
    double v62 = v61;
    objc_msgSend(v12, "SBUISA_preferredTrailingViewSize");
    double v64 = v63;
    double v66 = v65;
    objc_msgSend(v18, "SBUISA_preferredTrailingViewSize");
    double v68 = v67;
    double v70 = v69;
    objc_msgSend(v12, "SBUISA_preferredMinimalViewSize");
    double v72 = v71;
    double v74 = v73;
    objc_msgSend(v18, "SBUISA_preferredMinimalViewSize");
    double v134 = v75;
    double v132 = v76;
    double v77 = v136;
    BOOL v78 = v136 == v62 && v143 == v60;
    double v135 = v64;
    BOOL v79 = v64 == v68;
    double v80 = v70;
    BOOL v81 = v66 == v70 && v79;
    double v133 = v74;
    BOOL v82 = v74 != v76 || v72 != v75;
    if (v19 != 3 || ((v45 | v48) & 1) == 0)
    {
      if ([(SBSystemApertureSceneElement *)self layoutMode] == 2)
      {
        objc_msgSend(v12, "SBUISA_preferredPaddingForCompactLayout");
        double v130 = v84;
        double v131 = v83;
        double v86 = v85;
        double v88 = v87;
        objc_msgSend(v18, "SBUISA_preferredPaddingForCompactLayout");
        BOOL v50 = v86 == v76;
        double v80 = v70;
        if (v50)
        {
          double v76 = v131;
          if (v131 == v75)
          {
            double v75 = v130;
            if (v130 == v89 && v78 && v81 && v88 == v77)
            {
LABEL_65:
              int v91 = objc_msgSend(v12, "SBUISA_contextId");
              v144 = v20;
              BOOL v93 = v91 != objc_msgSend(v18, "SBUISA_contextId")
                 && objc_msgSend(v12, "SBUISA_contextId") == 0;
              if (self->_leadingWrapperView)
              {
                v94 = (double *)MEMORY[0x1E4F1DB30];
                BOOL v95 = !v78 && v136 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v143 == *MEMORY[0x1E4F1DB30];
                uint64_t v96 = objc_msgSend(v12, "SBUISA_leadingViewRenderingId");
                BOOL v97 = v96 != objc_msgSend(v18, "SBUISA_leadingViewRenderingId")
                   && objc_msgSend(v12, "SBUISA_leadingViewRenderingId") == 0;
                if (v95 || v97 || v93)
                {
                  double v92 = *v94;
                  double v98 = v60;
                  if (v60 != *v94 || (double v92 = v94[1], v98 = v62, v62 != v92))
                  {
                    if (objc_msgSend(v18, "SBUISA_leadingViewRenderingId", v92, v98)
                      && objc_msgSend(v18, "SBUISA_contextId"))
                    {
                      [(SBSystemApertureSceneElementPlaceholderWrapperView *)self->_leadingWrapperView setContentView:self->_leadingView];
                    }
                  }
                }
              }
              v99 = v144;
              if (self->_trailingWrapperView)
              {
                BOOL v100 = !v81 && v66 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v135 == *MEMORY[0x1E4F1DB30];
                uint64_t v101 = objc_msgSend(v12, "SBUISA_trailingViewRenderingId");
                BOOL v102 = v101 != objc_msgSend(v18, "SBUISA_trailingViewRenderingId")
                    && objc_msgSend(v12, "SBUISA_trailingViewRenderingId") == 0;
                if (v100 || v102 || v93)
                {
                  if (v68 != *MEMORY[0x1E4F1DB30] || (double v92 = *(double *)(MEMORY[0x1E4F1DB30] + 8), v80 != v92))
                  {
                    if (objc_msgSend(v18, "SBUISA_trailingViewRenderingId")
                      && objc_msgSend(v18, "SBUISA_contextId"))
                    {
                      [(SBSystemApertureSceneElementPlaceholderWrapperView *)self->_trailingWrapperView setContentView:self->_trailingView];
                    }
                  }
                }
              }
              if (self->_minimalWrapperView)
              {
                if (v82)
                {
                  double v92 = v133;
                  BOOL v103 = v133 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v72 == *MEMORY[0x1E4F1DB30];
                }
                else
                {
                  BOOL v103 = 0;
                }
                uint64_t v104 = objc_msgSend(v12, "SBUISA_minimalViewRenderingId", v92);
                BOOL v105 = v104 != objc_msgSend(v18, "SBUISA_minimalViewRenderingId")
                    && objc_msgSend(v12, "SBUISA_minimalViewRenderingId") == 0;
                if (v103 || v105 || v93)
                {
                  double v106 = *MEMORY[0x1E4F1DB30];
                  double v107 = v134;
                  if (v134 != *MEMORY[0x1E4F1DB30]
                    || (double v106 = *(double *)(MEMORY[0x1E4F1DB30] + 8), v107 = v132, v132 != v106))
                  {
                    if (objc_msgSend(v18, "SBUISA_minimalViewRenderingId", v106, v107)
                      && objc_msgSend(v18, "SBUISA_contextId"))
                    {
                      [(SBSystemApertureSceneElementPlaceholderWrapperView *)self->_minimalWrapperView setContentView:self->_minimalView];
                    }
                  }
                }
              }
              v108 = objc_msgSend(v12, "SBUISA_backgroundActivitiesToSuppress");
              v109 = objc_msgSend(v18, "SBUISA_backgroundActivitiesToSuppress");
              char v110 = BSEqualSets();

              if ((v110 & 1) == 0) {
                [(SBSystemApertureSceneElement *)self _acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded];
              }
              int v111 = objc_msgSend(v12, "SBUISA_hasMenuPresentation");
              if (v111 != -[SBSystemApertureSceneElement isRequestingMenuPresentation](self, "isRequestingMenuPresentation"))[v144 menuPresentationRequestDidChangeForLayoutSpecifier:self]; {
              int v112 = objc_msgSend(v12, "SBUISA_preventsAutomaticDismissal");
              }
              id v13 = v145;
              if (v112 != objc_msgSend(v18, "SBUISA_preventsAutomaticDismissal")) {
                [(SBSystemApertureSceneElement *)self _updateAlertAssertionIfNecessary];
              }
              v113 = objc_msgSend(v12, "SBUISA_keyColor");
              v114 = objc_msgSend(v18, "SBUISA_keyColor");
              char v115 = BSEqualObjects();

              if ((v115 & 1) == 0)
              {
                v116 = [MEMORY[0x1E4F28EB8] defaultCenter];
                v151 = @"SBSystemApertureNotificationUserInfoElementKey";
                v152 = self;
                v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
                [v116 postNotificationName:@"SBSystemApertureElementKeyColorDidInvalidateNotification" object:0 userInfo:v117];
              }
              int v118 = v139 | v138 & v137 ^ 1;
              v119 = [v145 actions];
              uint64_t v120 = [v119 count];

              if (v120)
              {
                long long v148 = 0u;
                long long v149 = 0u;
                long long v146 = 0u;
                long long v147 = 0u;
                v121 = [v145 actions];
                uint64_t v122 = [v121 countByEnumeratingWithState:&v146 objects:v150 count:16];
                if (v122)
                {
                  uint64_t v123 = v122;
                  v124 = 0;
                  uint64_t v125 = *(void *)v147;
                  do
                  {
                    for (uint64_t i = 0; i != v123; ++i)
                    {
                      if (*(void *)v147 != v125) {
                        objc_enumerationMutation(v121);
                      }
                      uint64_t v127 = *(void *)(*((void *)&v146 + 1) + 8 * i);
                      if ([(SBSystemApertureSceneElement *)self _handleAction:v127])
                      {
                        if (v124)
                        {
                          [v124 addObject:v127];
                        }
                        else
                        {
                          v124 = [MEMORY[0x1E4F1CA80] setWithObject:v127];
                        }
                      }
                    }
                    uint64_t v123 = [v121 countByEnumeratingWithState:&v146 objects:v150 count:16];
                  }
                  while (v123);
                }
                else
                {
                  v124 = 0;
                }

                v99 = v144;
                id v13 = v145;
                int v118 = v139 | v138 & v137 ^ 1;
                if ([v124 count])
                {
                  v128 = [v145 actions];
                  v129 = (void *)[v128 mutableCopy];

                  [v129 minusSet:v124];
                  [v145 setActions:v129];
                }
              }
              if ((v118 | -[SBSystemApertureSceneElement _updateRequiresSuppressionFromSystemAperture](self, "_updateRequiresSuppressionFromSystemAperture")) == 1)[v99 preferredLayoutModeDidInvalidateForLayoutSpecifier:self]; {

              }
              id v11 = v141;
              id v10 = v142;
              uint64_t v15 = v140;
              goto LABEL_141;
            }
          }
        }
      }
      else if ([(SBSystemApertureSceneElement *)self layoutMode] != 1 || !v82)
      {
        goto LABEL_65;
      }
    }
    objc_msgSend(v20, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self, v75, v76, v77);
    goto LABEL_65;
  }
LABEL_141:
}

- (void)sceneContentStateDidChange:(id)a3
{
  [(SBSystemApertureSceneElement *)self _updateReadyForPresentationIfNeeded];
  [(SBSystemApertureSceneElement *)self _updatePortalViews];
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v5 = [(SBSystemApertureSceneElement *)self sceneInvalidationHandler];
  [(SBSystemApertureSceneElement *)self setSceneInvalidationHandler:0];
  BOOL v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, SBSystemApertureSceneElement *))(v5 + 16))(v5, self);
    BOOL v4 = (void *)v5;
  }
}

- (BOOL)_supportsMenuPresentations
{
  id v2 = [(FBScene *)self->_scene clientHandle];
  id v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.InCallService"];

  return v4;
}

- (BOOL)_handleAction:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      int v7 = v6;
    }
    else {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [(SBSystemApertureSceneElement *)self layoutHost];
  id v10 = [(SBSystemApertureSceneElement *)self elementHost];
  if (v8)
  {
    id v11 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(SBSystemApertureSceneElement *)self succinctDescription];
      id v13 = [v8 description];
      int v29 = 138543618;
      char v30 = v12;
      __int16 v31 = 2114;
      double v32 = v13;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ received command %{public}@", (uint8_t *)&v29, 0x16u);
    }
    switch([v8 command])
    {
      case 1:
        int64_t v14 = [(SBSystemApertureSceneElement *)self preferredLayoutMode];
        int64_t v15 = [(SBSystemApertureSceneElement *)self layoutMode];
        BOOL v16 = [(SBSystemApertureSceneElement *)self _hasActivationAttribute:1];
        BOOL v17 = 0;
        if (v14 != v15 && !v16) {
          BOOL v17 = self->_initialPreferredLayoutMode != 0;
        }
        if (v14 != v15 && !v17)
        {
          if ([(SAAutomaticallyInvalidatable *)self->_alertingActivityAssertion isValid]) {
            [(SAAutomaticallyInvalidatable *)self->_alertingActivityAssertion invalidateWithReason:@"requestTransitionToPreferredLayoutMode"];
          }
          else {
            [v9 preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
          }
        }
        break;
      case 2:
        [v10 elementRequestsNegativeResponse:self];
        break;
      case 3:
        id WeakRetained = [(SBSystemApertureSceneElement *)self clientInvalidationRequestHandler];
        [(SBSystemApertureSceneElement *)self setClientInvalidationRequestHandler:0];
        if (WeakRetained)
        {
          ((void (**)(void, SBSystemApertureSceneElement *))WeakRetained)[2](WeakRetained, self);
          goto LABEL_36;
        }
        BOOL v23 = SBLogSystemApertureHosting();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[SBSystemApertureSceneElement _handleAction:](v23);
        }
        goto LABEL_35;
      case 4:
        if ([(SBSystemApertureSceneElement *)self layoutMode] != 3
          || (objc_opt_respondsToSelector() & 1) == 0)
        {
          break;
        }
        [v10 elementRequestsSignificantUpdateTransition:self];
        [v9 preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
        id WeakRetained = (void (**)(void, void))[objc_alloc(MEMORY[0x1E4FA7D90]) initWithCommand:5];
        [(SBSystemApertureSceneElement *)self _handleAction:WeakRetained];
        goto LABEL_36;
      case 5:
        id WeakRetained = (void (**)(void, void))objc_loadWeakRetained((id *)&self->_gestureHandler);
        if (objc_opt_respondsToSelector())
        {
          int64_t v19 = SBLogSystemApertureHosting();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = [(SBSystemApertureSceneElement *)self succinctDescription];
            int v29 = 138543362;
            char v30 = v20;
            _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Requesting cancellation of resize gesture for %{public}@.", (uint8_t *)&v29, 0xCu);
          }
          [WeakRetained elementRequestsCancellingResizeGesture:self];
        }
        goto LABEL_36;
      case 6:
        if (![(SBSystemApertureSceneElement *)self _isValidAlertingSource:2]) {
          break;
        }
        uint64_t v21 = self;
        uint64_t v22 = 0;
        goto LABEL_31;
      case 7:
        if (![(SBSystemApertureSceneElement *)self _isValidAlertingSource:2]) {
          break;
        }
        uint64_t v21 = self;
        uint64_t v22 = 1;
LABEL_31:
        [(SBSystemApertureSceneElement *)v21 _handleAlertingAssertionRequestForReason:@"Scene Element - Client SBUISystemApertureCommandRequest" implicitlyDismissable:v22];
        break;
      case 8:
        id WeakRetained = [(SBSystemApertureSceneElement *)self _existingAlertingAssertion];
        BOOL v23 = [(SBSystemApertureSceneElement *)self clientIdentifier];
        int64_t v24 = @"client requests disable automatic invalidation";
        int64_t v25 = WeakRetained;
        uint64_t v26 = 0;
        goto LABEL_34;
      case 9:
        id WeakRetained = [(SBSystemApertureSceneElement *)self _existingAlertingAssertion];
        BOOL v23 = [(SBSystemApertureSceneElement *)self clientIdentifier];
        int64_t v24 = @"client requests enable automatic invalidation";
        int64_t v25 = WeakRetained;
        uint64_t v26 = 1;
LABEL_34:
        [v25 setAutomaticallyInvalidatable:v26 lockingWithKey:v23 reason:v24];
LABEL_35:

LABEL_36:
        break;
      case 10:
        id v28 = [(SBSystemApertureSceneElement *)self _existingAlertingAssertion];
        [v28 resetAutomaticInvalidationTimer];

        break;
      default:
        break;
    }
  }

  return v8 != 0;
}

- (BOOL)_ownsScene
{
  id v2 = [(SBSystemApertureSceneElement *)self scene];
  id v3 = [v2 workspaceIdentifier];
  id v4 = [(id)objc_opt_class() sceneWorkspaceIdentifier];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (CGRect)_obstructedAreaFrame
{
  id v3 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
  [v3 sensorRegionSize];

  [(SBSystemApertureSceneElementScenePresenterView *)self->_sceneView bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  SBRectWithSize();
  UIRectCenteredXInRect();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  BOOL v18 = [(SBSystemApertureSceneElementScenePresenterView *)self->_sceneView window];
  int64_t v19 = [v18 screen];
  uint64_t v20 = [v19 coordinateSpace];
  objc_msgSend(v20, "convertRect:fromCoordinateSpace:", self->_sceneView, v5, v7, v9, v11);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  int64_t v29 = [(SBSystemApertureSceneElement *)self systemApertureCustomLayout];
  if ((v29 | 2) == 3)
  {
    int64_t v30 = v29;
    __int16 v31 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
    [v31 minimumScreenEdgeInsets];
    double v33 = v32;
    v71.origin.x = v22;
    v71.origin.y = v24;
    v71.size.width = v26;
    v71.size.height = v28;
    double v34 = v33 - CGRectGetMinY(v71);

    double v35 = fmax(v34, 0.0);
    if (v30 == 1
      && (![(SBSystemApertureSceneElement *)self obstructionEdge]
       || [(SBSystemApertureSceneElement *)self obstructionEdge] == 2))
    {
      double v36 = [(SBSystemApertureSceneElementScenePresenterView *)self->_sceneView superview];
      double v37 = [(SBSystemApertureSceneElementScenePresenterView *)self->_sceneView superview];
      [v37 bounds];
      objc_msgSend(v36, "convertRect:toView:", self->_sceneView);
      CGFloat rect_24 = v39;
      CGFloat v69 = v38;
      CGFloat rect_8 = v41;
      CGFloat rect_16 = v40;

      double v42 = [(SBSystemApertureSceneElementScenePresenterView *)self->_sceneView superview];
      BOOL v43 = [(SBSystemApertureSceneElementScenePresenterView *)self->_sceneView superview];
      [v43 bounds];
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v52 = [(SBSystemApertureSceneElementScenePresenterView *)self->_sceneView window];
      objc_msgSend(v42, "convertRect:toView:", v52, v45, v47, v49, v51);
      CGFloat rect = v53;
      CGFloat v55 = v54;
      CGFloat v57 = v56;
      CGFloat v59 = v58;

      if ([(SBSystemApertureSceneElement *)self obstructionEdge])
      {
        v72.origin.y = rect_24;
        v72.origin.x = v69;
        v72.size.height = rect_8;
        v72.size.width = rect_16;
        CGRectGetMaxX(v72);
        v73.origin.x = v13;
        v73.origin.y = v35;
        v73.size.width = v15;
        v73.size.height = v17;
        CGRectGetMinY(v73);
        v74.origin.x = v13;
        v74.origin.y = v35;
        v74.size.width = v17;
        v74.size.height = v15;
        CGRectGetWidth(v74);
      }
      else
      {
        v76.origin.y = rect_24;
        v76.origin.x = v69;
        v76.size.height = rect_8;
        v76.size.width = rect_16;
        CGRectGetMinX(v76);
      }
      double v60 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
      [v60 interSensorRegionInWindowSpace];
      v75.origin.x = rect;
      v75.origin.y = v55;
      v75.size.width = v57;
      v75.size.height = v59;
      CGRectGetMinY(v75);

      v77.origin.y = rect_24;
      v77.origin.x = v69;
      v77.size.height = rect_8;
      v77.size.width = rect_16;
      CGRectGetMidY(v77);
      v78.origin.x = v13;
      v78.origin.y = v35;
      v78.size.width = v15;
      v78.size.height = v17;
      CGRectGetWidth(v78);
    }
  }
  UIRectRoundToScale();
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (BOOL)hasAlertBehavior
{
  id v3 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  uint64_t v4 = objc_msgSend(v3, "SBUISA_contentRole");

  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    uint64_t v4 = [WeakRetained contentRole];
  }
  return v4 == 1;
}

- (void)setAlertHost:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHost);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_alertHost, v4);
    if (v4)
    {
      objc_initWeak(&location, self);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      CGFloat v13 = __45__SBSystemApertureSceneElement_setAlertHost___block_invoke;
      double v14 = &unk_1E6AF4B10;
      objc_copyWeak(&v15, &location);
      double v6 = (void (**)(void))MEMORY[0x1D948C7A0](&v11);
      double v7 = v6;
      if (self->_scene)
      {
        v6[2](v6);
      }
      else
      {
        deferredSceneActions = self->_deferredSceneActions;
        double v9 = objc_msgSend(v6, "copy", v11, v12, v13, v14);
        double v10 = (void *)MEMORY[0x1D948C7A0]();
        [(NSMutableArray *)deferredSceneActions addObject:v10];
      }
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __45__SBSystemApertureSceneElement_setAlertHost___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[17];
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = WeakRetained;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA7D90]) initWithCommand:12];
    double v5 = [v3 setWithObject:v4];
    [v2 sendActions:v5];

    [v6 _updateAlertAssertionIfNecessary];
    id WeakRetained = v6;
  }
}

- (BOOL)hasActivityBehavior
{
  id v3 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  uint64_t v4 = objc_msgSend(v3, "SBUISA_contentRole");

  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    uint64_t v4 = [WeakRetained contentRole];
  }
  return v4 == 2;
}

- (void)setActivityHost:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_activityHost, v4);
    if (v4)
    {
      objc_initWeak(&location, self);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      CGFloat v13 = __48__SBSystemApertureSceneElement_setActivityHost___block_invoke;
      double v14 = &unk_1E6AF4B10;
      objc_copyWeak(&v15, &location);
      id v6 = (void (**)(void))MEMORY[0x1D948C7A0](&v11);
      double v7 = v6;
      if (self->_scene)
      {
        v6[2](v6);
      }
      else
      {
        deferredSceneActions = self->_deferredSceneActions;
        double v9 = objc_msgSend(v6, "copy", v11, v12, v13, v14);
        double v10 = (void *)MEMORY[0x1D948C7A0]();
        [(NSMutableArray *)deferredSceneActions addObject:v10];
      }
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __48__SBSystemApertureSceneElement_setActivityHost___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[17];
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = WeakRetained;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA7D90]) initWithCommand:12];
    double v5 = [v3 setWithObject:v4];
    [v2 sendActions:v5];

    [v6 _updateAlertAssertionIfNecessary];
    id WeakRetained = v6;
  }
}

- (CGRect)_frameInSceneContainerForView:(id)a3
{
  id v4 = (SBSystemApertureSceneElementAccessoryView *)a3;
  [(SBSystemApertureSceneElementAccessoryView *)v4 bounds];
  -[SBSystemApertureSceneElementScenePresenterView convertRect:fromView:](self->_sceneView, "convertRect:fromView:", v4);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v13 = [(SBSystemApertureSceneElement *)self leadingView];
  if (v13 == v4 || self->_minimalView == v4 && [(SBSystemApertureSceneElement *)self layoutAxis] == 1)
  {

LABEL_6:
    [(SBSystemApertureSceneElement *)self _obstructedAreaFrame];
    UIRectGetCenter();
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    CGRectGetHeight(v20);
    UIRoundToViewScale();
    CGFloat v8 = v15;
    goto LABEL_7;
  }
  double v14 = [(SBSystemApertureSceneElement *)self trailingView];

  if (v14 == v4) {
    goto LABEL_6;
  }
LABEL_7:

  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  self->_wantsLayoutPassForClientUpdate = 0;
  double v9 = [(SBSystemApertureSceneElement *)self sceneSettings];
  BOOL v10 = objc_msgSend(v9, "SBUISA_layoutMode") > 1 || -[SBSystemApertureSceneElement layoutMode](self, "layoutMode") < 1;

  BOOL v11 = [(SBSystemApertureSceneElement *)self _hasPresentationBehavior:64];
  if (!v10 && v11)
  {
    CGFloat v12 = +[SBLockScreenManager sharedInstance];
    CGFloat v13 = v12;
    if (self->_clientIdentifier) {
      clientIdentifier = (__CFString *)self->_clientIdentifier;
    }
    else {
      clientIdentifier = @"<unknown client ID>";
    }
    [v12 requestUserAttentionScreenWakeFromSource:35 reason:clientIdentifier];
  }
  double v15 = (void *)MEMORY[0x1E4F42FF0];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
  v41[3] = &unk_1E6AF5290;
  v41[4] = self;
  id v16 = v7;
  id v42 = v16;
  [v15 _performWithoutRetargetingAnimations:v41];
  [(SBSystemApertureSceneElement *)self _frameInSceneContainerForView:v16];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  if ([(SBSystemApertureSceneElement *)self wantsSpecialFlowerBoundsResizingAnimationForWallet])
  {
    double v25 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
    BOOL v26 = objc_msgSend(v25, "SBUISA_appliedLayoutMode") == 4;
  }
  else
  {
    BOOL v26 = 0;
  }
  double v27 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  if (objc_msgSend(v27, "SBUISA_appliedLayoutMode") == 3)
  {
    CGFloat v28 = [(SBSystemApertureSceneElement *)self sceneSettings];
    BOOL v29 = objc_msgSend(v28, "SBUISA_layoutMode") == 3
       && [(SBSystemApertureSceneElement *)self layoutMode] == 2;
  }
  else
  {
    BOOL v29 = 0;
  }

  BOOL v30 = [(SBSystemApertureSceneElement *)self hasCompletedInitialPresentation];
  if (objc_opt_respondsToSelector()) {
    char v31 = [v8 isPerformingSystemApertureCustomContentTransition] ^ 1 | (v26 || v30 && v29);
  }
  else {
    char v31 = 1;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2;
  v34[3] = &unk_1E6B0C8D0;
  v34[4] = self;
  id v35 = v16;
  char v40 = v31;
  uint64_t v36 = v18;
  uint64_t v37 = v20;
  uint64_t v38 = v22;
  uint64_t v39 = v24;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_238;
  v33[3] = &unk_1E6AF53F8;
  v33[4] = self;
  id v32 = v16;
  [v8 animateAlongsideTransition:v34 completion:v33];
}

uint64_t __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupSceneViewInContainerView:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _layoutSceneViewInContainerView:v3];
}

void __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  v35[2] = *(id *)MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _layoutSceneViewInContainerView:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _frameInSceneContainerForView:*(void *)(a1 + 40)];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  unint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_clientLayoutModeForLayoutMode:", objc_msgSend(*(id *)(a1 + 32), "layoutMode"))
      + 1;
  if (v10 > 5) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_1D8FD3228[v10];
  }
  CGFloat v12 = objc_msgSend(*(id *)(a1 + 32), "_proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:", v11, *(unsigned __int8 *)(a1 + 80), v3, v5, v7, v9);
  int8x8_t v13 = (int8x8_t)[*(id *)(a1 + 32) _updateReasonsForTransitionWithProposedParameters:v12 excludingReasons:v11];
  double v14 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = [*(id *)(a1 + 32) succinctDescription];
    long long v16 = *(_OWORD *)(a1 + 64);
    v31[0] = *(_OWORD *)(a1 + 48);
    v31[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F29238] valueWithBytes:v31 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    *(double *)BOOL v30 = v3;
    *(double *)&v30[1] = v5;
    *(double *)&v30[2] = v7;
    *(double *)&v30[3] = v9;
    uint64_t v18 = [MEMORY[0x1E4F29238] valueWithBytes:v30 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    uint64_t v19 = (void *)v18;
    if (v13)
    {
      double v27 = (void *)v18;
      CGFloat v28 = v17;
      BOOL v29 = v15;
      uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __SBSystemApertureSceneUpdateReasonsDescription_block_invoke;
      double v34 = &unk_1E6AF5510;
      id v21 = v20;
      v35[0] = v21;
      uint64_t v22 = buf;
      char v32 = 0;
      uint8x8_t v23 = (uint8x8_t)vcnt_s8(v13);
      v23.i16[0] = vaddlv_u8(v23);
      int v24 = v23.i32[0];
      if (v23.i32[0])
      {
        unint64_t v25 = 0;
        do
        {
          if (((1 << v25) & *(void *)&v13) != 0)
          {
            (*(void (**)(unsigned char *))&buf[16])(v22);
            if (v32) {
              break;
            }
            --v24;
          }
          if (v25 > 0x3E) {
            break;
          }
          ++v25;
        }
        while (v24 > 0);
      }

      BOOL v26 = [v21 componentsJoinedByString:@", "];

      uint64_t v17 = v28;
      double v15 = v29;
      uint64_t v19 = v27;
    }
    else
    {
      BOOL v26 = @"none";
    }
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    double v34 = v19;
    LOWORD(v35[0]) = 2112;
    *(id *)((char *)v35 + 2) = v26;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Transition from %@ to %@ -- Applying because parameters needed updates for reason %@", buf, 0x2Au);
  }
  [*(id *)(a1 + 32) _applyTransitionParameters:v12];
}

void __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_238(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) scene];
  double v3 = [v2 clientSettings];
  uint64_t v4 = objc_msgSend(v3, "SBUISA_appliedLayoutMode");

  if (v4 >= 2)
  {
    double v5 = *(void **)(a1 + 32);
    [v5 setHasCompletedInitialPresentation:1];
  }
}

- (void)_setupSceneViewInContainerView:(id)a3
{
  id v4 = a3;
  if (!self->_sceneView)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA7990]);
    [(SBSystemApertureSceneElement *)self _frameForSceneViewInContainerView:v4];
    double v6 = (SBSystemApertureSceneElementScenePresenterView *)objc_msgSend(v5, "initWithFrame:");
    sceneView = self->_sceneView;
    self->_sceneView = v6;

    objc_initWeak(&location, self);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    double v15 = __63__SBSystemApertureSceneElement__setupSceneViewInContainerView___block_invoke;
    long long v16 = &unk_1E6AF4B10;
    objc_copyWeak(&v17, &location);
    double v8 = (void (**)(void))MEMORY[0x1D948C7A0](&v13);
    double v9 = [(SBSystemApertureSceneElement *)self scene];

    if (v9)
    {
      v8[2](v8);
    }
    else
    {
      deferredSceneActions = self->_deferredSceneActions;
      uint64_t v11 = (void *)[v8 copy];
      CGFloat v12 = (void *)MEMORY[0x1D948C7A0]();
      [(NSMutableArray *)deferredSceneActions addObject:v12];
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  if (v4
    && ([(SBSystemApertureSceneElementScenePresenterView *)self->_sceneView isDescendantOfView:v4] & 1) == 0)
  {
    [v4 insertSubview:self->_sceneView atIndex:0];
  }
}

void __63__SBSystemApertureSceneElement__setupSceneViewInContainerView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = (void *)WeakRetained[26];
    id v4 = WeakRetained;
    double v3 = [WeakRetained scene];
    [v2 setScene:v3];

    id WeakRetained = v4;
  }
}

- (void)_layoutSceneViewInContainerView:(id)a3
{
  id v4 = a3;
  id v13 = [(SBSystemApertureSceneElement *)self sceneView];
  [(SBSystemApertureSceneElement *)self _frameForSceneViewInContainerView:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
}

- (CGRect)_frameForSceneViewInContainerView:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(SBSystemApertureSceneElement *)self _sizeForSceneView];
  double v8 = v7;
  double v10 = v9;
  if (v4)
  {
    [v4 bounds];
    UIRectCenteredIntegralRectScale();
    double v5 = v11;
    double v8 = v12;
    double v10 = v13;
    double v6 = 0.0;
  }

  double v14 = v5;
  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGSize)_sizeForSceneView
{
  double v3 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
  if ([(SBSystemApertureSceneElement *)self _supportsMenuPresentations]) {
    [v3 maximumPossibleSizeWhilePresentingMenu];
  }
  else {
    [v3 maximumExpandedSize];
  }
  double v6 = v4;
  double v7 = v5;
  if (![(SBSystemApertureSceneElement *)self _supportsMenuPresentations]) {
    double v7 = v7 * 1.2;
  }
  configuration = self->_configuration;
  if (configuration)
  {
    [(SBSystemApertureSceneElementConfiguration *)configuration maximumHeight];
    if (v9 != *MEMORY[0x1E4F43ED8])
    {
      [(SBSystemApertureSceneElementConfiguration *)self->_configuration maximumHeight];
      double v7 = v10;
    }
  }

  double v11 = v6;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unint64_t)_updateReasonsForTransitionWithProposedParameters:(id)a3
{
  return [(SBSystemApertureSceneElement *)self _updateReasonsForTransitionWithProposedParameters:a3 excludingReasons:0];
}

- (unint64_t)_updateReasonsForTransitionWithProposedParameters:(id)a3 excludingReasons:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  double v8 = [(SBSystemApertureSceneElement *)self sceneSettings];
  double v9 = [v7 otherSystemApertureSceneSettingsToApply];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __99__SBSystemApertureSceneElement__updateReasonsForTransitionWithProposedParameters_excludingReasons___block_invoke;
  v34[3] = &unk_1E6B0C8F8;
  v34[4] = &v35;
  double v10 = (void *)MEMORY[0x1D948C7A0](v34);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __99__SBSystemApertureSceneElement__updateReasonsForTransitionWithProposedParameters_excludingReasons___block_invoke_2;
  v30[3] = &unk_1E6B0C920;
  id v11 = v10;
  id v33 = v11;
  id v12 = v9;
  id v31 = v12;
  id v13 = v8;
  id v32 = v13;
  double v14 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v30);
  (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 128, [v13 isForeground] ^ objc_msgSend(v7, "wantsForeground"));
  double v15 = [v12 objectForSetting:3213016];
  if (v15)
  {
    double v4 = [v12 objectForSetting:3213016];
    uint64_t v16 = [v4 unsignedIntegerValue];
    BOOL v17 = v16 != objc_msgSend(v13, "SBUISA_minimalViewLayoutAxis");
  }
  else
  {
    BOOL v17 = 0;
  }
  (*((void (**)(id, uint64_t, BOOL))v11 + 2))(v11, 256, v17);
  if (v15) {

  }
  v14[2](v14, 2, 3213010);
  if (a4)
  {
    BOOL v24 = 0;
  }
  else
  {
    [(SBSystemApertureSceneElement *)self _sizeForSceneView];
    double v19 = v18;
    double v21 = v20;
    self = [(SBSystemApertureSceneElement *)self scene];
    double v15 = [(SBSystemApertureSceneElement *)self settings];
    [v15 frame];
    BOOL v24 = v21 != v23 || v19 != v22;
  }
  (*((void (**)(id, uint64_t, BOOL))v11 + 2))(v11, 1, v24);
  if ((a4 & 1) == 0)
  {
  }
  v14[2](v14, 4, 3213012);
  v14[2](v14, 8, 3213011);
  v14[2](v14, 16, 3213013);
  v14[2](v14, 512, 3213014);
  v14[2](v14, 32, 3213015);
  unint64_t v25 = [v12 objectForSetting:3213009];
  if (v25)
  {
    uint64_t v26 = objc_msgSend(v13, "SBUISA_layoutMode");
    BOOL v27 = v26 != objc_msgSend(v12, "SBUISA_layoutModeforSetting:", 3213009);
  }
  else
  {
    BOOL v27 = 0;
  }
  (*((void (**)(id, uint64_t, BOOL))v11 + 2))(v11, 64, v27);

  unint64_t v28 = v36[3] & ~a4;
  _Block_object_dispose(&v35, 8);

  return v28;
}

uint64_t __99__SBSystemApertureSceneElement__updateReasonsForTransitionWithProposedParameters_excludingReasons___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (a3) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) |= a2;
  }
  return result;
}

void __99__SBSystemApertureSceneElement__updateReasonsForTransitionWithProposedParameters_excludingReasons___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "objectForSetting:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "SBUISA_CGRectforSetting:", a3);
    id v7 = [*(id *)(a1 + 40) otherSettings];
    objc_msgSend(v7, "SBUISA_CGRectforSetting:", a3);
    int v8 = SBFRectApproximatelyEqualToRect();
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, a2, v8 ^ 1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, a2, 0);
  }
}

- (id)_proposeTransitionParametersForTransitionToFrameInSceneView:(CGRect)a3 excludingParametersAssociatedWithReasons:(unint64_t)a4 usingCurrentAnimationParameters:(BOOL)a5
{
  __int16 v6 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = objc_alloc_init(SBSystemApertureSceneElementTransitionParameters);
  if ((v6 & 0x40) != 0)
  {
    if ((v6 & 0x80) != 0) {
      goto LABEL_9;
    }
    BOOL v16 = 0;
    goto LABEL_7;
  }
  int64_t v13 = [(SBSystemApertureSceneElement *)self _clientLayoutModeForLayoutMode:[(SBSystemApertureSceneElement *)self layoutMode]];
  double v14 = [(SBSystemApertureSceneElement *)self sceneSettings];
  uint64_t v15 = objc_msgSend(v14, "SBUISA_layoutMode");
  BOOL v16 = v13 != v15;

  if ((v6 & 0x80) == 0)
  {
LABEL_7:
    BOOL v18 = [(SBSystemApertureSceneElement *)self _requiresForegroundScene];
    double v19 = [(SBSystemApertureSceneElement *)self sceneSettings];
    char v20 = v18 ^ [v19 isForeground];

    if (v16 || (v20 & 1) != 0)
    {
      __int16 v17 = v6 & 0xFF1E;
      if (v20) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
LABEL_9:
    __int16 v17 = v6;
    goto LABEL_13;
  }
  if (v13 == v15) {
    goto LABEL_9;
  }
  __int16 v17 = v6 & 0xFF1E;
LABEL_11:
  if ([(SBSystemApertureSceneElement *)self _requiresForegroundScene]) {
    __int16 v17 = v6 & 0xFB1E;
  }
LABEL_13:
  if ((v17 & 0x40) != 0 || !a5)
  {
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FA7D48]) initWithFluidBehaviorSettings:0 tracking:0 retargeted:0];
  }
  else
  {
    uint64_t v21 = +[SBSystemApertureFluidAnimator currentAnimationParameters];
  }
  double v22 = (void *)v21;
  if ((v17 & 0x400) != 0)
  {
    double v23 = 0;
  }
  else
  {
    double v23 = [MEMORY[0x1E4F42790] transitionContext];
  }
  BOOL v24 = [(SBSystemApertureSceneElement *)self sceneSettings];
  if (objc_msgSend(v24, "SBUISA_layoutMode") == 4)
  {
    uint64_t v25 = [(SBSystemApertureSceneElement *)self _clientLayoutModeForLayoutMode:[(SBSystemApertureSceneElement *)self layoutMode]];

    if ((v17 & 0x400) != 0 || a5 || v25 > 3) {
      goto LABEL_26;
    }
    BOOL v24 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
    [v23 setAnimationFence:v24];
  }

LABEL_26:
  if ([(SBSystemApertureSceneElement *)self mostRecentLayoutModeChangeReason] == 3) {
    [MEMORY[0x1E4FA7D98] userInitiatedSceneResizeActionWithAnimationParameters:v22];
  }
  else {
  uint64_t v26 = [MEMORY[0x1E4FA7D98] sceneResizeActionWithAnimationParameters:v22];
  }
  BOOL v27 = [MEMORY[0x1E4F1CAD0] setWithObject:v26];
  [v23 setActions:v27];

  [(SBSystemApertureSceneElementTransitionParameters *)v12 setTransitionContext:v23];
  id v28 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  if ((v17 & 0x40) != 0)
  {
    if ((v17 & 0x10) != 0) {
      goto LABEL_31;
    }
  }
  else
  {
    objc_msgSend(v28, "SBUISA_setLayoutMode:forSetting:", -[SBSystemApertureSceneElement _clientLayoutModeForLayoutMode:](self, "_clientLayoutModeForLayoutMode:", -[SBSystemApertureSceneElement layoutMode](self, "layoutMode")), 3213009);
    if ((v17 & 0x10) != 0)
    {
LABEL_31:
      if ((v17 & 0x200) != 0) {
        goto LABEL_32;
      }
      goto LABEL_45;
    }
  }
  [(SBSystemApertureSceneElement *)self _frameInSceneContainerForView:self->_minimalView];
  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213013);
  if ((v17 & 0x200) != 0)
  {
LABEL_32:
    if ((v17 & 8) != 0) {
      goto LABEL_33;
    }
    goto LABEL_46;
  }
LABEL_45:
  [(SBSystemApertureSceneElement *)self _frameInSceneContainerForView:self->_detachedMinimalView];
  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213014);
  if ((v17 & 8) != 0)
  {
LABEL_33:
    if ((v17 & 4) != 0) {
      goto LABEL_34;
    }
    goto LABEL_47;
  }
LABEL_46:
  id v31 = [(SBSystemApertureSceneElement *)self leadingView];
  [(SBSystemApertureSceneElement *)self _frameInSceneContainerForView:v31];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213011, v33, v35, v37, v39);
  if ((v17 & 4) != 0)
  {
LABEL_34:
    if ((v17 & 2) != 0) {
      goto LABEL_35;
    }
    goto LABEL_48;
  }
LABEL_47:
  char v40 = [(SBSystemApertureSceneElement *)self trailingView];
  [(SBSystemApertureSceneElement *)self _frameInSceneContainerForView:v40];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;

  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213012, v42, v44, v46, v48);
  if ((v17 & 2) != 0)
  {
LABEL_35:
    if (v17) {
      goto LABEL_36;
    }
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213010, x, y, width, height);
  if (v17)
  {
LABEL_36:
    if ((v17 & 0x80) != 0) {
      goto LABEL_37;
    }
    goto LABEL_50;
  }
LABEL_49:
  double v49 = [(SBSystemApertureSceneElement *)self sceneView];
  [v49 frame];
  double v51 = v50;
  double v53 = v52;

  -[SBSystemApertureSceneElementTransitionParameters setSceneSize:](v12, "setSceneSize:", v51, v53);
  if ((v17 & 0x80) != 0)
  {
LABEL_37:
    if ((v17 & 0x20) != 0) {
      goto LABEL_38;
    }
    goto LABEL_51;
  }
LABEL_50:
  [(SBSystemApertureSceneElementTransitionParameters *)v12 setWantsForeground:[(SBSystemApertureSceneElement *)self _requiresForegroundScene]];
  [(SBSystemApertureSceneElementTransitionParameters *)v12 setShouldSetForeground:1];
  if ((v17 & 0x20) != 0)
  {
LABEL_38:
    if ((v17 & 0x100) != 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_51:
  [(SBSystemApertureSceneElement *)self _obstructedAreaFrame];
  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213015);
  if ((v17 & 0x100) == 0)
  {
LABEL_39:
    BOOL v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBSystemApertureSceneElement layoutAxis](self, "layoutAxis"));
    [v28 setObject:v29 forSetting:3213016];
  }
LABEL_40:
  [(SBSystemApertureSceneElementTransitionParameters *)v12 setOtherSystemApertureSceneSettingsToApply:v28];

  return v12;
}

- (void)_applyTransitionParameters:(id)a3
{
  id transitionRequestHandler = (void (**)(id, SBSystemApertureSceneElement *, id))self->_transitionRequestHandler;
  if (transitionRequestHandler) {
    transitionRequestHandler[2](transitionRequestHandler, self, a3);
  }
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double trailing = a4.trailing;
  CGFloat bottom = a4.bottom;
  double leading = a4.leading;
  CGFloat top = a4.top;
  id v11 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  id v12 = v11;
  if (a3 == 3)
  {
    objc_msgSend(v11, "SBUISA_customLayoutPreferredOutsetsFromUnsafeArea");
    CGFloat top = v24;
    double leading = v25;
    CGFloat bottom = v26;
    double trailing = v27;
  }
  else if (a3 == 2)
  {
    int64_t v13 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
    int v14 = objc_msgSend(v13, "SBUISA_specifiesPreferredPaddingForCompactLayout");

    if (v14)
    {
      uint64_t v15 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
      objc_msgSend(v15, "SBUISA_preferredPaddingForCompactLayout");
      double v17 = v16;
      double v19 = v18;

      objc_msgSend(v12, "SBUISA_preferredLeadingViewSize");
      double v21 = v17 + v20;
      objc_msgSend(v12, "SBUISA_preferredTrailingViewSize");
      double v23 = v19 + v22;
      double leading = -v21;
      double trailing = -v23;
    }
  }

  double v28 = top;
  double v29 = leading;
  double v30 = bottom;
  double v31 = trailing;
  result.double trailing = v31;
  result.CGFloat bottom = v30;
  result.double leading = v29;
  result.CGFloat top = v28;
  return result;
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = (SBSystemApertureSceneElementAccessoryView *)a4;
  double v10 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  if (a5 != 1 || self->_minimalView != v9)
  {
    id v12 = [(SBSystemApertureSceneElement *)self leadingView];

    if (v12 == v9)
    {
      double v16 = [WeakRetained leadingView];
      if (v16 != v9)
      {
        objc_msgSend(v10, "SBUISA_preferredLeadingViewSize");
LABEL_13:
        double v14 = v17;
        double v15 = v18;

        goto LABEL_16;
      }
    }
    else
    {
      int64_t v13 = [(SBSystemApertureSceneElement *)self trailingView];

      if (v13 != v9)
      {
        if (self->_detachedMinimalView != v9)
        {
          double v14 = *MEMORY[0x1E4F1DB30];
          double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          goto LABEL_16;
        }
        objc_msgSend(v10, "SBUISA_preferredDetachedMinimalViewSize");
        goto LABEL_15;
      }
      double v16 = [WeakRetained trailingView];
      if (v16 != v9)
      {
        objc_msgSend(v10, "SBUISA_preferredTrailingViewSize");
        goto LABEL_13;
      }
    }
    -[SBSystemApertureSceneElementAccessoryView sizeThatFits:](v9, "sizeThatFits:", width, height);
    goto LABEL_13;
  }
  objc_msgSend(v10, "SBUISA_preferredMinimalViewSize");
LABEL_15:
  double v14 = v19;
  double v15 = v20;
LABEL_16:
  double v21 = fmax(v14, 0.0);
  double v22 = fmax(v15, 0.0);
  if (v21 < width) {
    double width = v21;
  }
  if (v22 < height) {
    double height = v22;
  }

  double v23 = width;
  double v24 = height;
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (void)_updateSceneWithTransitionParameters:(id)a3
{
  id v4 = a3;
  scene = self->_scene;
  if ([v4 wantsForeground]) {
    uint64_t v6 = [v4 shouldSetForeground];
  }
  else {
    uint64_t v6 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__SBSystemApertureSceneElement__updateSceneWithTransitionParameters___block_invoke;
  v8[3] = &unk_1E6B0C948;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SBSystemApertureSceneElement *)self _updateScene:scene activatingIfNeeded:v6 settingsWithTransitionBlock:v8];
}

uint64_t __69__SBSystemApertureSceneElement__updateSceneWithTransitionParameters___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _updateMutableSceneSettings:a2 withParameters:*(void *)(a1 + 40)];
  double v3 = *(void **)(a1 + 40);
  return [v3 transitionContext];
}

- (void)_updateScene:(id)a3 activatingIfNeeded:(BOOL)a4 settingsWithTransitionBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(SBSystemApertureSceneElementConfiguration *)self->_configuration allowsSceneReactivation];
  int v11 = [v8 isActive];
  char v12 = v11;
  if (!v10)
  {
    if (!v11) {
      goto LABEL_10;
    }
LABEL_9:
    [v8 updateSettingsWithTransitionBlock:v9];
    goto LABEL_13;
  }
  if ([v8 isActive]) {
    goto LABEL_9;
  }
  if ((v12 & 1) == 0 && v6)
  {
    int64_t v13 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = [(SBSystemApertureSceneElement *)self succinctDescription];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Activating scene because it's foreground and isn't active and client allows it", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x3032000000;
    double v25 = __Block_byref_object_copy__117;
    double v26 = __Block_byref_object_dispose__118;
    id v27 = 0;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    double v19 = __92__SBSystemApertureSceneElement__updateScene_activatingIfNeeded_settingsWithTransitionBlock___block_invoke;
    double v20 = &unk_1E6B0C998;
    p_long long buf = &buf;
    id v21 = v9;
    [v8 configureParameters:&v17];
    objc_msgSend(v8, "activateWithTransitionContext:", *(void *)(*((void *)&buf + 1) + 40), v17, v18, v19, v20);

    _Block_object_dispose(&buf, 8);
    goto LABEL_13;
  }
LABEL_10:
  double v15 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = [(SBSystemApertureSceneElement *)self succinctDescription];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping scene settings update because it's not active and client doesn't allow us to", (uint8_t *)&buf, 0xCu);
  }
LABEL_13:
}

void __92__SBSystemApertureSceneElement__updateScene_activatingIfNeeded_settingsWithTransitionBlock___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__SBSystemApertureSceneElement__updateScene_activatingIfNeeded_settingsWithTransitionBlock___block_invoke_2;
  v5[3] = &unk_1E6B0C970;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 updateSettingsWithBlock:v5];
}

void __92__SBSystemApertureSceneElement__updateScene_activatingIfNeeded_settingsWithTransitionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_updateMutableSceneSettings:(id)a3 withParameters:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  if ([v5 shouldSetForeground])
  {
    objc_msgSend(v16, "setForeground:", objc_msgSend(v5, "wantsForeground"));
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v5 sceneSize];
    objc_msgSend(v16, "setFrame:", v6, v7, v8, v9);
    [v16 setInterfaceOrientation:1];
  }
  BOOL v10 = [v16 otherSettings];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      int64_t v13 = v12;
    }
    else {
      int64_t v13 = 0;
    }
  }
  else
  {
    int64_t v13 = 0;
  }
  id v14 = v13;

  double v15 = [v5 otherSystemApertureSceneSettingsToApply];
  [v14 applySettings:v15];
}

- (void)_updateReadyForPresentationIfNeeded
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "*** Client SPI Misuse: Invalid attempt to post two elements in jindo with the same elementIdentifier, << %{public}@ >> ***", (uint8_t *)&v2, 0xCu);
}

uint64_t __67__SBSystemApertureSceneElement__updateReadyForPresentationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _hasActivationAttribute:16] && (objc_msgSend(v3, "isDeactivating") & 1) == 0)
  {
    id v5 = [v3 placeholderContentProvider];
    double v6 = [*(id *)(a1 + 32) placeholderContentProvider];
    if (v5 == v6) {
      uint64_t v4 = SAElementIdentityEqualToIdentity();
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldSuppressBackgroundActivities
{
  if ([(SBSystemApertureSceneElement *)self isSuppressedByProximityReader])
  {
    id v3 = [(SBSystemApertureSceneElement *)self elementIdentifier];
    int v4 = [v3 isEqual:*MEMORY[0x1E4FA7EF8]] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  if (![(SBSystemApertureSceneElement *)self isActivated]) {
    return 0;
  }
  id v5 = [(SBSystemApertureSceneElement *)self layoutHost];
  if (v5) {
    BOOL v6 = v4;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded
{
  if ([(SBSystemApertureSceneElement *)self _shouldSuppressBackgroundActivities])
  {
    id v3 = [(SBSystemApertureSceneElement *)self representedBackgroundActivityIdentifiers];
  }
  else
  {
    id v3 = 0;
  }
  id v11 = v3;
  if ([v3 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarBackgroundActivitiesSuppresser);
    id v5 = NSString;
    BOOL v6 = [(FBScene *)self->_scene clientHandle];
    double v7 = [v6 bundleIdentifier];
    double v8 = [v5 stringWithFormat:@"%@", v7];
    double v9 = [WeakRetained acquireSuppressionAssertionForBackgroundActivities:v11 reason:v8];
  }
  else
  {
    double v9 = 0;
  }
  BOOL v10 = [(SBSystemApertureSceneElement *)self statusBarStyleOverridesSuppressionAssertion];
  [v10 invalidate];

  [(SBSystemApertureSceneElement *)self setStatusBarStyleOverridesSuppressionAssertion:v9];
}

- (void)_updateAlertAssertionIfNecessary
{
  if ([(SBSystemApertureSceneElement *)self hasAlertBehavior])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHost);
    [WeakRetained alertAssertion];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
    [WeakRetained alertingActivityAssertion];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  int v4 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  int v5 = objc_msgSend(v4, "SBUISA_preventsAutomaticDismissal");

  if (v5)
  {
    BOOL v6 = [(SBSystemApertureSceneElement *)self clientIdentifier];
    [v7 setAutomaticallyInvalidatable:0 lockingWithKey:v6 reason:@"client prevents automatic dismissal"];
  }
}

- (void)_updateActiveElementsAndAssociatedApplication
{
  if ([(SBSystemApertureSceneElement *)self isActivated]
    && [(SBSystemApertureSceneElement *)self isReadyForPresentation]
    && ([(SBSystemApertureSceneElement *)self _requiresForegroundScene]
     || [(SBSystemApertureSceneElement *)self preferredLayoutMode] >= 1))
  {
    +[SBSystemApertureSceneElement addActiveElement:self];
    int v3 = 1;
  }
  else
  {
    +[SBSystemApertureSceneElement removeActiveElement:self];
    int v3 = 0;
  }
  int v4 = [(SBSystemApertureSceneElement *)self sceneClientSettings];
  int v5 = objc_msgSend(v4, "SBUISA_associatedAppBundleIdentifier");
  BOOL v6 = v5;
  if (v5)
  {
    id v24 = v5;
  }
  else
  {
    id v7 = [(SBApplicationSceneHandle *)self->_associatedApplicationSceneHandle application];
    double v8 = [v7 bundleIdentifier];
    double v9 = v8;
    if (v8)
    {
      id v24 = v8;
    }
    else
    {
      BOOL v10 = [(FBScene *)self->_scene clientHandle];
      id v24 = [v10 bundleIdentifier];
    }
  }

  id v11 = [(SBSystemApertureSceneElement *)self associatedApplication];
  id v12 = [v11 bundleIdentifier];
  int v13 = BSEqualStrings();

  if ((v13 & 1) == 0)
  {
    id v14 = +[SBApplicationController sharedInstanceIfExists];
    double v15 = [v14 applicationWithBundleIdentifier:v24];
    associatedApplication = self->_associatedApplication;
    self->_associatedApplication = v15;
  }
  uint64_t v17 = self->_associatedApplication;
  if (!v3)
  {
    if (v17) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  if (v17) {
    int v18 = v13;
  }
  else {
    int v18 = 0;
  }
  if (v18 == 1)
  {
    if (self->_activeApplicationElementAssertion) {
      goto LABEL_29;
    }
    double v19 = 0;
    goto LABEL_26;
  }
  if (!v17)
  {
LABEL_27:
    [(BSInvalidatable *)self->_activeApplicationElementAssertion invalidate];
    activeApplicationElementAssertion = self->_activeApplicationElementAssertion;
    self->_activeApplicationElementAssertion = 0;
    goto LABEL_28;
  }
  double v19 = self->_activeApplicationElementAssertion;
LABEL_26:
  [(BSInvalidatable *)v19 invalidate];
  double v20 = self->_activeApplicationElementAssertion;
  self->_activeApplicationElementAssertion = 0;

  activeApplicationElementAssertion = objc_loadWeakRetained((id *)&self->_statusBarBackgroundActivitiesSuppresser);
  double v22 = [activeApplicationElementAssertion acquireActiveElementAssertionForApplication:self->_associatedApplication reason:@"scene element request"];
  double v23 = self->_activeApplicationElementAssertion;
  self->_activeApplicationElementAssertion = v22;

LABEL_28:
LABEL_29:
}

- (SBSystemApertureSceneElementAccessoryView)leadingView
{
  leadingWrapperView = self->_leadingWrapperView;
  if (!leadingWrapperView) {
    leadingWrapperView = self->_leadingView;
  }
  return (SBSystemApertureSceneElementAccessoryView *)leadingWrapperView;
}

- (SBSystemApertureSceneElementAccessoryView)trailingView
{
  trailingWrapperView = self->_trailingWrapperView;
  if (!trailingWrapperView) {
    trailingWrapperView = self->_trailingView;
  }
  return (SBSystemApertureSceneElementAccessoryView *)trailingWrapperView;
}

- (SBSystemApertureSceneElementAccessoryView)minimalView
{
  minimalWrapperView = self->_minimalWrapperView;
  if (!minimalWrapperView) {
    minimalWrapperView = self->_minimalView;
  }
  return (SBSystemApertureSceneElementAccessoryView *)minimalWrapperView;
}

- (void)addElementLayoutSpecifierObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    layoutObservers = self->__layoutObservers;
    id v8 = v4;
    if (!layoutObservers)
    {
      BOOL v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->__layoutObservers;
      self->__layoutObservers = v6;

      layoutObservers = self->__layoutObservers;
    }
    [(NSHashTable *)layoutObservers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeElementLayoutSpecifierObserver:(id)a3
{
  id v4 = a3;
  layoutObservers = self->__layoutObservers;
  id v7 = v4;
  if (v4 && layoutObservers)
  {
    [(NSHashTable *)layoutObservers removeObject:v4];
    layoutObservers = self->__layoutObservers;
  }
  if (![(NSHashTable *)layoutObservers count])
  {
    BOOL v6 = self->__layoutObservers;
    self->__layoutObservers = 0;
  }
}

- (void)element:(id)a3 visibilityWillChange:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 3;
  }
  [(SBSystemApertureSceneElement *)self setElementAppearState:v4];
}

- (void)element:(id)a3 visibilityDidChange:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  [(SBSystemApertureSceneElement *)self setElementAppearState:v4];
}

- (void)setElementAppearState:(int)a3
{
  if (self->_elementAppearState != a3)
  {
    self->_elementAppearState = a3;
    [(SBSystemApertureSceneElement *)self _updateSceneBackgroundStateIfNeeded];
    [(SBSystemApertureSceneElement *)self _updateActiveElementsAndAssociatedApplication];
  }
}

- (void)placeholderWrapperViewDidChangeContentView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
}

- (NSString)description
{
  return (NSString *)[(SBSystemApertureSceneElement *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  int v3 = [(SBSystemApertureSceneElement *)self succinctDescriptionBuilder];
  uint64_t v4 = [(FBScene *)self->_scene clientHandle];
  int v5 = [v4 bundleIdentifier];
  [v3 appendString:v5 withName:@"client"];

  BOOL v6 = [v3 build];

  return v6;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(SBSystemApertureSceneElement *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  int v5 = [(SBSystemApertureSceneElement *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SBSystemApertureSceneElement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __70__SBSystemApertureSceneElement_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  int v3 = [*(id *)(*(void *)(a1 + 40) + 136) identifier];
  [v2 appendString:v3 withName:@"sceneIdentifier"];

  id v4 = *(void **)(a1 + 32);
  int v5 = [*(id *)(a1 + 40) elementIdentifier];
  [v4 appendString:v5 withName:@"elementIdentifier"];

  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isReadyForPresentation"), @"isReadyForPresentation");
  id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isActivated"), @"isActivated");
  id v8 = *(void **)(a1 + 32);
  double v9 = [*(id *)(*(void *)(a1 + 40) + 32) description];
  [v8 appendString:v9 withName:@"configuration" skipIfEmpty:1];

  id v10 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) layoutMode];
  id v11 = SAUIStringFromElementViewLayoutMode();
  [v10 appendString:v11 withName:@"layoutMode"];

  id v12 = *(void **)(a1 + 32);
  int v13 = [*(id *)(a1 + 40) scene];
  id v14 = [v13 clientHandle];
  double v15 = [v14 bundleIdentifier];
  [v12 appendString:v15 withName:@"clientBundleIdentifier" skipIfEmpty:1];

  id v16 = *(void **)(a1 + 32);
  uint64_t v17 = [*(id *)(a1 + 40) sceneClientSettings];
  int v18 = objc_msgSend(v17, "SBUISA_associatedAppBundleIdentifier");
  [v16 appendString:v18 withName:@"associatedAppBundleIdentifier" skipIfEmpty:1];

  double v19 = *(void **)(a1 + 32);
  id v21 = [*(id *)(a1 + 40) sceneClientSettings];
  double v20 = objc_msgSend(v21, "SBUISA_associatedScenePersistenceIdentifier");
  [v19 appendString:v20 withName:@"associatedScenePersistenceIdentifier" skipIfEmpty:1];
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (SBSystemAperturePlatformElementHosting)platformElementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformElementHost);
  return (SBSystemAperturePlatformElementHosting *)WeakRetained;
}

- (void)setPlatformElementHost:(id)a3
{
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (BOOL)isUrgent
{
  return self->_urgent;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (unint64_t)obstructionEdge
{
  return self->_obstructionEdge;
}

- (void)setObstructionEdge:(unint64_t)a3
{
  self->_obstructionEdge = a3;
}

- (int64_t)systemApertureCustomLayout
{
  return self->_systemApertureCustomLayout;
}

- (SBSystemApertureGestureHandling)gestureHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureHandler);
  return (SBSystemApertureGestureHandling *)WeakRetained;
}

- (void)setGestureHandler:(id)a3
{
}

- (SAAlertHosting)alertHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHost);
  return (SAAlertHosting *)WeakRetained;
}

- (SAActivityHosting)activityHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
  return (SAActivityHosting *)WeakRetained;
}

- (SAUILayoutHosting)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return (SAUILayoutHosting *)WeakRetained;
}

- (SAElementHosting)elementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementHost);
  return (SAElementHosting *)WeakRetained;
}

- (void)setElementHost:(id)a3
{
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void)setLayoutAxis:(unint64_t)a3
{
  self->_layoutAxis = a3;
}

- (BOOL)isReadyForPresentation
{
  return self->_readyForPresentation;
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (void)setPresentable:(id)a3
{
}

- (id)clientInvalidationRequestHandler
{
  return self->_clientInvalidationRequestHandler;
}

- (void)setClientInvalidationRequestHandler:(id)a3
{
}

- (id)sceneInvalidationHandler
{
  return self->_sceneInvalidationHandler;
}

- (void)setSceneInvalidationHandler:(id)a3
{
}

- (SBSystemApertureSceneElementLaunchActionHandling)launchActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchActionHandler);
  return (SBSystemApertureSceneElementLaunchActionHandling *)WeakRetained;
}

- (void)setLaunchActionHandler:(id)a3
{
}

- (SBApplication)associatedApplication
{
  return self->_associatedApplication;
}

- (void)setAssociatedApplication:(id)a3
{
}

- (BOOL)alwaysAllowTapToAppForBodyTaps
{
  return self->_alwaysAllowTapToAppForBodyTaps;
}

- (void)setAlwaysAllowTapToAppForBodyTaps:(BOOL)a3
{
  self->_alwaysAllowTapToAppForBodyTaps = a3;
}

- (SBDeviceApplicationSceneHandle)associatedApplicationSceneHandle
{
  return self->_associatedApplicationSceneHandle;
}

- (void)setAssociatedApplicationSceneHandle:(id)a3
{
}

- (SBSystemApertureSceneElementPlaceholderContentProviding)placeholderContentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  return (SBSystemApertureSceneElementPlaceholderContentProviding *)WeakRetained;
}

- (void)setPlaceholderContentProvider:(id)a3
{
}

- (SBSystemApertureBackgroundActivitiesSuppressing)statusBarBackgroundActivitiesSuppresser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarBackgroundActivitiesSuppresser);
  return (SBSystemApertureBackgroundActivitiesSuppressing *)WeakRetained;
}

- (void)setStatusBarBackgroundActivitiesSuppresser:(id)a3
{
}

- (SBSystemApertureSceneElementScenePresenterView)sceneView
{
  return self->_sceneView;
}

- (void)setSceneView:(id)a3
{
}

- (void)setLeadingView:(id)a3
{
}

- (void)setTrailingView:(id)a3
{
}

- (void)setMinimalView:(id)a3
{
}

- (SBSystemApertureSceneElementAccessoryView)detachedMinimalView
{
  return self->_detachedMinimalView;
}

- (void)setDetachedMinimalView:(id)a3
{
}

- (SBSystemApertureSceneElementPlaceholderWrapperView)leadingWrapperView
{
  return self->_leadingWrapperView;
}

- (void)setLeadingWrapperView:(id)a3
{
}

- (SBSystemApertureSceneElementPlaceholderWrapperView)trailingWrapperView
{
  return self->_trailingWrapperView;
}

- (void)setTrailingWrapperView:(id)a3
{
}

- (SBSystemApertureSceneElementPlaceholderWrapperView)minimalWrapperView
{
  return self->_minimalWrapperView;
}

- (void)setMinimalWrapperView:(id)a3
{
}

- (NSMutableArray)deferredSceneActions
{
  return self->_deferredSceneActions;
}

- (void)setDeferredSceneActions:(id)a3
{
}

- (id)postSceneActivationPlaceholderTest
{
  return self->_postSceneActivationPlaceholderTest;
}

- (void)setPostSceneActivationPlaceholderTest:(id)a3
{
}

- (id)postSceneActivationPlaceholderElementFoundHandler
{
  return self->_postSceneActivationPlaceholderElementFoundHandler;
}

- (void)setPostSceneActivationPlaceholderElementFoundHandler:(id)a3
{
}

- (BOOL)invalidatingForMoveToPlaceholderElement
{
  return self->_invalidatingForMoveToPlaceholderElement;
}

- (void)setInvalidatingForMoveToPlaceholderElement:(BOOL)a3
{
  self->_BOOL invalidatingForMoveToPlaceholderElement = a3;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (BOOL)requiresSuppressionFromSystemAperture
{
  return self->_requiresSuppressionFromSystemAperture;
}

- (void)setRequiresSuppressionFromSystemAperture:(BOOL)a3
{
  self->_requiresSuppressionFromSystemAperture = a3;
}

- (id)readyHandler
{
  return self->_readyHandler;
}

- (id)deactivationHandler
{
  return self->_deactivationHandler;
}

- (void)setDeactivationHandler:(id)a3
{
}

- (id)transitionRequestHandler
{
  return self->_transitionRequestHandler;
}

- (NSHashTable)_layoutObservers
{
  return self->__layoutObservers;
}

- (SAAutomaticallyInvalidatable)_alertingActivityAssertion
{
  return self->_alertingActivityAssertion;
}

- (int64_t)alertingSource
{
  return self->_alertingSource;
}

- (SAAutomaticallyInvalidatable)_sessionMonitorAssertion
{
  return self->_sessionMonitorAssertion;
}

- (SBUISystemApertureAlertingAction)_alertingAction
{
  return self->_alertingAction;
}

- (void)_setAlertingAction:(id)a3
{
}

- (SBSystemActionElementPreviewingCoordinator)previewingCoordinator
{
  return self->_previewingCoordinator;
}

- (BOOL)wantsLayoutPassForClientUpdate
{
  return self->_wantsLayoutPassForClientUpdate;
}

- (void)setWantsLayoutPassForClientUpdate:(BOOL)a3
{
  self->_wantsLayoutPassForClientUpdate = a3;
}

- (int64_t)mostRecentLayoutModeChangeReason
{
  return self->_mostRecentLayoutModeChangeReason;
}

- (void)setMostRecentLayoutModeChangeReason:(int64_t)a3
{
  self->_mostRecentLayoutModeChangeReason = a3;
}

- (unint64_t)activationAttributes
{
  return self->_activationAttributes;
}

- (BSInvalidatable)statusBarStyleOverridesSuppressionAssertion
{
  return self->_statusBarStyleOverridesSuppressionAssertion;
}

- (void)setStatusBarStyleOverridesSuppressionAssertion:(id)a3
{
}

- (BSInvalidatable)activeApplicationElementAssertion
{
  return self->_activeApplicationElementAssertion;
}

- (void)setActiveApplicationElementAssertion:(id)a3
{
}

- (BOOL)wantsSpecialFlowerBoundsResizingAnimationForWallet
{
  return self->_wantsSpecialFlowerBoundsResizingAnimationForWallet;
}

- (void)setWantsSpecialFlowerBoundsResizingAnimationForWallet:(BOOL)a3
{
  self->_wantsSpecialFlowerBoundsResizingAnimationForWallet = a3;
}

- (SBSystemApertureSettings)settings
{
  return self->_settings;
}

- (SAAssertion)elementHostPrefersSuppressionAssertion
{
  return self->_elementHostPrefersSuppressionAssertion;
}

- (void)setElementHostPrefersSuppressionAssertion:(id)a3
{
}

- (int)elementAppearState
{
  return self->_elementAppearState;
}

- (BOOL)hasHandledLaunchAction
{
  return self->_hasHandledLaunchAction;
}

- (void)setHasHandledLaunchAction:(BOOL)a3
{
  self->_hasHandledLaunchAction = a3;
}

- (BOOL)hasCompletedInitialPresentation
{
  return self->_hasCompletedInitialPresentation;
}

- (void)setHasCompletedInitialPresentation:(BOOL)a3
{
  self->_hasCompletedInitialPresentation = a3;
}

- (BOOL)hasBeenRemoved
{
  return self->_hasBeenRemoved;
}

- (BOOL)backlightIsOrWillBecomeActive
{
  return self->_backlightIsOrWillBecomeActive;
}

- (int64_t)initialPreferredLayoutMode
{
  return self->_initialPreferredLayoutMode;
}

- (void)setInitialPreferredLayoutMode:(int64_t)a3
{
  self->_initialPreferredLayoutMode = a3;
}

- (BOOL)isSuppressedByProximityReader
{
  return self->_suppressedByProximityReader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementHostPrefersSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_activeApplicationElementAssertion, 0);
  objc_storeStrong((id *)&self->_statusBarStyleOverridesSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_previewingCoordinator, 0);
  objc_storeStrong((id *)&self->_alertingAction, 0);
  objc_storeStrong((id *)&self->_sessionMonitorAssertion, 0);
  objc_storeStrong((id *)&self->_alertingActivityAssertion, 0);
  objc_storeStrong((id *)&self->__layoutObservers, 0);
  objc_storeStrong(&self->_transitionRequestHandler, 0);
  objc_storeStrong(&self->_deactivationHandler, 0);
  objc_storeStrong(&self->_readyHandler, 0);
  objc_storeStrong(&self->_postSceneActivationPlaceholderElementFoundHandler, 0);
  objc_storeStrong(&self->_postSceneActivationPlaceholderTest, 0);
  objc_storeStrong((id *)&self->_deferredSceneActions, 0);
  objc_storeStrong((id *)&self->_minimalWrapperView, 0);
  objc_storeStrong((id *)&self->_trailingWrapperView, 0);
  objc_storeStrong((id *)&self->_leadingWrapperView, 0);
  objc_storeStrong((id *)&self->_detachedMinimalView, 0);
  objc_storeStrong((id *)&self->_minimalView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_destroyWeak((id *)&self->_statusBarBackgroundActivitiesSuppresser);
  objc_destroyWeak((id *)&self->_placeholderContentProvider);
  objc_storeStrong((id *)&self->_associatedApplicationSceneHandle, 0);
  objc_storeStrong((id *)&self->_associatedApplication, 0);
  objc_destroyWeak((id *)&self->_launchActionHandler);
  objc_storeStrong(&self->_sceneInvalidationHandler, 0);
  objc_storeStrong(&self->_clientInvalidationRequestHandler, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_elementHost);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_destroyWeak((id *)&self->_activityHost);
  objc_destroyWeak((id *)&self->_alertHost);
  objc_destroyWeak((id *)&self->_gestureHandler);
  objc_destroyWeak((id *)&self->_platformElementHost);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)_isValidAlertingSource:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  double v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  double v15 = @"SBSystemApertureSceneElement.m";
  __int16 v16 = 1024;
  int v17 = 640;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)_handleAction:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Client requested invalidation, but no clientInvalidationRequestHandler exists.", v1, 2u);
}

@end