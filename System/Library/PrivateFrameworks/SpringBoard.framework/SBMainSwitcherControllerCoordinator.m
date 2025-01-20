@interface SBMainSwitcherControllerCoordinator
+ (SBMainSwitcherControllerCoordinator)sharedInstance;
+ (id)_shim_activeSwitcherController;
+ (id)sharedInstanceIfExists;
- (BOOL)_contentControllerIsEmbeddedDisplayContentController:(id)a3;
- (BOOL)_hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:(id)a3;
- (BOOL)_hasAppLayoutContainingDisplayItem:(id)a3;
- (BOOL)_isBestAppSuggestionEligibleForSwitcher:(id)a3;
- (BOOL)_isPerformingModelTransitionForReplacementAppLayout:(id)a3;
- (BOOL)_keyboardIsSuppressedForMedusaKeyboardScene;
- (BOOL)_shouldAddAppLayoutToFront:(id)a3;
- (BOOL)_shouldMorphFromPIPForTransitionContext:(id)a3 outForLayoutRole:(int64_t *)a4;
- (BOOL)_shouldMorphToPIPForTransitionContext:(id)a3 outForLayoutRole:(int64_t *)a4;
- (BOOL)_shouldPrioritizeSortOrderForAppLayout:(id)a3;
- (BOOL)_shouldReverseLayoutDirection;
- (BOOL)_shouldTakeKeyboardHomeAffordanceAssertion;
- (BOOL)_shouldTakeStatusBarAssertionForSwitcherController:(id)a3;
- (BOOL)_shouldZoomFromSystemApertureForTransitionContext:(id)a3;
- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4 windowScene:(id)a5;
- (BOOL)deleteAppLayoutForDisplayItem:(id)a3;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hasAppLayoutForDisplayItem:(id)a3;
- (BOOL)hasAppLayoutForTransientOverlayViewController:(id)a3 windowScene:(id)a4;
- (BOOL)hasTransientOverlayAppLayoutsForWindowScene:(id)a3;
- (BOOL)isAcquiredTransientOverlayViewController:(id)a3 windowScene:(id)a4;
- (BOOL)isAnySwitcherVisible;
- (BOOL)isDisplayEmbeddedForSwitcherContentController:(id)a3;
- (BOOL)isInAppStatusBarRequestedHiddenForSwitcherContentController:(id)a3;
- (BOOL)isSwitcherContentControllerEphemeral:(id)a3;
- (BOOL)liveContentOverlayUpdatesSuspended;
- (BOOL)shouldPerformPreTransitionInsertionOfAppLayout:(id)a3 forTransitionWithContext:(id)a4;
- (BOOL)switcherContentController:(id)a3 displayItemSupportsCenterRole:(id)a4;
- (BOOL)switcherContentController:(id)a3 shouldMorphFromPIPForTransitionContext:(id)a4;
- (BOOL)switcherContentController:(id)a3 shouldMorphToPIPForTransitionContext:(id)a4;
- (BOOL)switcherContentController:(id)a3 shouldResignActiveForStartOfTransition:(id)a4;
- (BOOL)switcherContentController:(id)a3 supportsKillingOfAppLayout:(id)a4;
- (BOOL)switcherContentController:(id)a3 supportsTitleItemsForAppLayout:(id)a4;
- (BOOL)switcherContentControllerControlsHomeScreenContents:(id)a3;
- (BOOL)switcherContentControllerControlsWallpaper:(id)a3;
- (BOOL)switcherContentControllerIsKeyboardHomeAffordanceAssertionCurrentlyBeingTaken:(id)a3;
- (BSInvalidatable)suspendWallpaperAnimationAssertion;
- (CGAffineTransform)switcherContentController:(SEL)a3 transformForCardUnderSheetForBoundsSize:(id)a4;
- (CGRect)switcherContentController:(id)a3 frameForCenterItemWithConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5;
- (CGRect)switcherContentController:(id)a3 frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a4 floatingConfiguration:(int64_t)a5;
- (CGRect)switcherContentController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6;
- (id)_activeDisplaySwitcherController;
- (id)_appLayoutContainingDisplayItem:(id)a3;
- (id)_appLayoutFromPrimaryLayoutItem:(id)a3 sideLayoutElement:(id)a4 configuration:(int64_t)a5;
- (id)_centerWindowSheetMetricsCache;
- (id)_defaultSwitcherController;
- (id)_embeddedDisplaySwitcherController;
- (id)_entityForDisplayItem:(id)a3 displayIdentity:(id)a4;
- (id)_entityForDisplayItem:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5;
- (id)_entityForDisplayItem:(id)a3 switcherController:(id)a4;
- (id)_homeScreenAppearanceControllerForSwitcherContentController:(id)a3;
- (id)_init;
- (id)_medusaKeyboardSceneHandle;
- (id)_modelRemovalRequestForDisplayItemResolutionResults:(id)a3;
- (id)_nonHiddenAppLayoutsForDisplayItem:(id)a3;
- (id)_persistenceIdentifiersForBundleIdentifier:(id)a3 onlyIncludeLaunchableIdentifiers:(BOOL)a4;
- (id)_recentAppLayoutsController;
- (id)_resultsForDisplayItemRemovalResolutionRequest:(id)a3 preferredAppLayoutForRemovalAnimationIfAny:(id)a4;
- (id)_switcherControllerForContentViewController:(id)a3;
- (id)_switcherControllerForDisplayItem:(id)a3;
- (id)_switcherControllerForTransitionRequest:(id)a3;
- (id)_switcherControllerPassingTest:(id)a3;
- (id)_switcherModelRemovalResultsForDisplayItemRemovalResolutionRequest:(id)a3;
- (id)_switcherModelRemovalResultsForRequest:(id)a3 forReason:(int64_t)a4;
- (id)_transientOverlayPresentationManager;
- (id)acquireAllowHiddenAppAssertionForBundleIdentifier:(id)a3 reason:(id)a4;
- (id)activeGestureTransaction;
- (id)activeTransientOverlayPresentedAppLayoutForSwitcherContentController:(id)a3;
- (id)activeTransientOverlayPresentedAppLayoutForWindowScene:(id)a3;
- (id)animationControllerForTransitionRequest:(id)a3;
- (id)animationControllerForTransitionRequest:(id)a3 ancillaryTransitionRequests:(id)a4;
- (id)appLayoutForWorkspaceTransientOverlay:(id)a3 windowScene:(id)a4;
- (id)appLayoutsForSwitcherContentController:(id)a3;
- (id)appLayoutsForSwitcherController:(id)a3;
- (id)appSwitcherModel:(id)a3 willAddAppLayout:(id)a4 replacingAppLayouts:(id)a5 removingAppLayouts:(id)a6;
- (id)appSwitcherModel:(id)a3 willReplaceAppLayout:(id)a4 proposedReplacementAppLayout:(id)a5;
- (id)convertAppLayout:(id)a3 fromSwitcherController:(id)a4 toSwitcherController:(id)a5;
- (id)coordinatedSwitcherControllers;
- (id)createWorkspaceTransientOverlayForAppLayout:(id)a3;
- (id)currentCoordinatedLayoutStateTransitionContext;
- (id)draggingAppLayouts;
- (id)draggingAppLayoutsForWindowDragForSwitcherContentController:(id)a3;
- (id)matchingIconViewForIconView:(id)a3;
- (id)proposedAppLayoutsForWindowDragForSwitcherContentController:(id)a3;
- (id)recentAppLayouts;
- (id)switcherContentController:(id)a3 deviceApplicationSceneHandleForDisplayItem:(id)a4;
- (id)switcherContentController:(id)a3 hiddenAppLayoutsForBundleIdentifier:(id)a4;
- (id)switcherContentController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7;
- (id)switcherContentController:(id)a3 visibleAppLayoutsForBundleIdentifier:(id)a4;
- (id)switcherContentController:(id)a3 visibleDisplayItemsForBundleIdentifier:(id)a4;
- (id)switcherControllerForAppLayout:(id)a3;
- (id)switcherControllerForDisplayItem:(id)a3;
- (id)switcherControllerForWindowScene:(id)a3;
- (id)switcherGestureManagerForSwitcherContentController:(id)a3;
- (id)transitionEventForContext:(id)a3 identifier:(id)a4 phase:(unint64_t)a5 animated:(BOOL)a6;
- (id)viewControllerForTransientOverlayAppLayout:(id)a3;
- (id)windowSceneForSwitcherContentController:(id)a3;
- (int64_t)_overrideWindowActiveInterfaceOrientation;
- (int64_t)_switcherDisplayItemRemovalIntentTypeForEntity:(id)a3 removalContext:(id)a4;
- (int64_t)activeInterfaceOrientationForSwitcherContentController:(id)a3;
- (int64_t)homeScreenInterfaceOrientationForContentController:(id)a3;
- (int64_t)nextDisplayItemInteractionTimeForSwitcherContentController:(id)a3;
- (int64_t)switcherInterfaceOrientationForSwitcherContentController:(id)a3;
- (unint64_t)windowManagementStyleForSwitcherContentController:(id)a3;
- (void)_acquireAssertion:(id)a3;
- (void)_activateBetaLaunchHandlesIfNeededWithAppInfo:(id)a3 processHandle:(id)a4;
- (void)_activateHomeScreenForProtectedHiddenAppOnUILock;
- (void)_activateNeighboringAppLayoutRequiringActiveAppLayout:(BOOL)a3 appLayoutEnvironment:(int64_t)a4 inForwardDirection:(BOOL)a5 windowScene:(id)a6 eventLabel:(id)a7;
- (void)_addAppLayoutToFront:(id)a3;
- (void)_addAppLayoutToFront:(id)a3 removeAppLayout:(id)a4;
- (void)_applicationDidExit:(id)a3;
- (void)_asyncOnStoreAppLaunchUIActivationQueue:(id)a3;
- (void)_beginDisplayLayoutTransitionForSwitcherController:(id)a3 reason:(id)a4;
- (void)_buildAppLayoutCache;
- (void)_cancelPIPForDisplayItem:(id)a3;
- (void)_chamoisWindowingUIEverEnabledDefaultChangeHandler;
- (void)_clearLayoutStateSnapshotForWindowScene:(id)a3;
- (void)_configureRequest:(id)a3 forSwitcherTransitionRequest:(id)a4 withEventLabel:(id)a5;
- (void)_deleteAppLayoutsMatchingBundleIdentifier:(id)a3;
- (void)_endDisplayLayoutTransitionForSwitcherController:(id)a3;
- (void)_focusNewlyAddedApplicationIfNeededTransitioningFromLayoutState:(id)a3 toLayoutState:(id)a4 windowScene:(id)a5;
- (void)_handleFocusedIconSwitcherShortcutAction:(int64_t)a3 bundleIdentifier:(id)a4 windowScene:(id)a5;
- (void)_insertAppLayout:(id)a3 atIndex:(unint64_t)a4 contentViewController:(id)a5 modelMutationBlock:(id)a6 completion:(id)a7;
- (void)_insertAppLayouts:(id)a3 atIndexes:(id)a4 contentViewController:(id)a5 modelMutationBlock:(id)a6 completion:(id)a7;
- (void)_insertCardForDisplayIdentifier:(id)a3 atIndex:(unint64_t)a4;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_lockKeyboardFocusForSwitcherController:(id)a3;
- (void)_modifyModelWithDropContext:(id)a3;
- (void)_noteUIWillLock;
- (void)_notifySwitcherControllersAppLayoutsDidChange;
- (void)_notifySwitcherControllersCoordinatedSwitcherControllersDidChange;
- (void)_performSceneDestructionForModelRemovalResults:(id)a3;
- (void)_presentStoreKitSheetIfNeededWithAppInfo:(id)a3 processHandle:(id)a4;
- (void)_purgeHiddenAppLayoutsForUILock;
- (void)_rebuildAppListCache;
- (void)_rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary;
- (void)_releaseKeyboardFocus;
- (void)_removeAcquiredTransientOverlayViewController:(id)a3 windowScene:(id)a4;
- (void)_removeAppLayout:(id)a3 forReason:(int64_t)a4;
- (void)_removeCardForDisplayIdentifier:(id)a3;
- (void)_removeDisplayItem:(id)a3 forReason:(int64_t)a4;
- (void)_removeDisplayItem:(id)a3 forReason:(int64_t)a4 preferredAppLayoutForRemovalAnimationIfAny:(id)a5;
- (void)_reqlinquishAssertion:(id)a3;
- (void)_requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo:(id)a3 processHandle:(id)a4;
- (void)_restoreLayoutStateSnapshotForWindowScene:(id)a3 completion:(id)a4;
- (void)_setAsynchronousRenderingEnabled:(BOOL)a3 withMinificationFilter:(BOOL)a4 forLayerTarget:(id)a5 presentationManager:(id)a6;
- (void)_setContainerStatusBarHidden:(BOOL)a3 animationDuration:(double)a4 usingAssertion:(id *)a5 reason:(id)a6 windowScene:(id)a7;
- (void)_setInterfaceOrientationFromUserResizingIfSupported:(int64_t)a3 forSceneHandle:(id)a4;
- (void)_setStatusBarPartsHidden:(unint64_t)a3 animated:(BOOL)a4 windowScene:(id)a5;
- (void)_switcherModelChanged:(id)a3;
- (void)_switcherServiceAdded:(id)a3;
- (void)_switcherServiceRemoved:(id)a3;
- (void)_takeLayoutStateSnapshotForWindowScene:(id)a3 withPreviousLayoutState:(id)a4;
- (void)_updateAssertion:(id)a3;
- (void)_updateBestAppSuggestion;
- (void)_updateHomeScreenDisplayLayoutElementForLayoutState:(id)a3 switcherController:(id)a4;
- (void)_updateKeyboardHomeAffordanceAssertion;
- (void)_warmAppInfoForAppsInList;
- (void)addAcquiredTransientOverlayViewController:(id)a3 forAppLayout:(id)a4 windowScene:(id)a5;
- (void)addAppLayoutForDisplayItem:(id)a3 windowScene:(id)a4 completion:(id)a5;
- (void)addAppLayoutForTransientOverlayViewController:(id)a3 windowScene:(id)a4;
- (void)addCenterRoleAppLayoutForDisplayItem:(id)a3 windowScene:(id)a4 completion:(id)a5;
- (void)appSwitcherModel:(id)a3 didRemoveAppLayoutForFallingOffList:(id)a4;
- (void)beginCoordinatingSwitcherController:(id)a3;
- (void)beginCoordinatingSwitcherController:(id)a3 options:(unint64_t)a4;
- (void)betaLaunchHandle:(id)a3 activateIfNeededEndedWithResult:(BOOL)a4;
- (void)cancelActiveGestureForSwitcherContentController:(id)a3;
- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3;
- (void)configureSwitcherStateForAccidentalActivationMitigationSession:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)endCoordinatingSwitcherController:(id)a3;
- (void)endCoordinatingSwitcherController:(id)a3 options:(unint64_t)a4;
- (void)enumerateSwitcherControllersWithBlock:(id)a3;
- (void)enumerateTransientOverlayViewControllersUsingBlock:(id)a3 windowScene:(id)a4;
- (void)eventSource:(id)a3 userDeletedWebBookmark:(id)a4;
- (void)eventSource:(id)a3 userTouchedApplication:(id)a4;
- (void)failMultitaskingGesturesForReason:(id)a3;
- (void)fluidSwitcherGestureManager:(id)a3 clickReceivedForHomeGrabberView:(id)a4;
- (void)fluidSwitcherGestureManager:(id)a3 didBeginDraggingWindowWithSceneIdentifier:(id)a4;
- (void)fluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4;
- (void)fluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4;
- (void)fluidSwitcherGestureManager:(id)a3 didPlatterizeWindowDragWithSceneIdentifier:(id)a4;
- (void)fluidSwitcherGestureManager:(id)a3 didUpdateGesture:(id)a4;
- (void)fluidSwitcherGestureManager:(id)a3 tapReceivedForGrabberTongueAtEdge:(unint64_t)a4;
- (void)fluidSwitcherGestureManager:(id)a3 willEndDraggingWindowWithSceneIdentifier:(id)a4;
- (void)handleApplicationSceneEntityDestructionIntent:(id)a3 forEntities:(id)a4;
- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)noteKeyboardIsForMedusaWithOwningScene:(id)a3;
- (void)noteKeyboardIsNotForMedusa;
- (void)performKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4 windowScene:(id)a5;
- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3;
- (void)presentContinuousExposeStripRevealGrabberTongueImmediatelyForSwitcherContentController:(id)a3;
- (void)programmaticSwitchAppGestureMoveToLeft;
- (void)programmaticSwitchAppGestureMoveToRight;
- (void)removeAppLayoutForDisplayItem:(id)a3 shouldDestroyScene:(BOOL)a4;
- (void)removeAppLayoutTransientOverlayViewController:(id)a3 windowScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5;
- (void)setActiveGestureTransaction:(id)a3;
- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3;
- (void)setSuspendWallpaperAnimationAssertion:(id)a3;
- (void)startObservingLayoutStateTransitionCoordinatorForStartupTransition:(id)a3;
- (void)stopObservingLayoutStateTransitionCoordinatorForStartupTransition:(id)a3;
- (void)switcherContentController:(id)a3 activatedBestAppSuggestion:(id)a4;
- (void)switcherContentController:(id)a3 bringAppLayoutToFront:(id)a4;
- (void)switcherContentController:(id)a3 deletedDisplayItem:(id)a4 inAppLayout:(id)a5 forReason:(int64_t)a6;
- (void)switcherContentController:(id)a3 layoutStateTransitionDidEndWithTransitionContext:(id)a4;
- (void)switcherContentController:(id)a3 performTransitionWithRequest:(id)a4 gestureInitiated:(BOOL)a5;
- (void)switcherContentController:(id)a3 reopenHiddenAppLayoutsWithBundleIdentifier:(id)a4;
- (void)switcherContentController:(id)a3 requestNewWindowForBundleIdentifier:(id)a4;
- (void)switcherContentController:(id)a3 setCacheAsynchronousRenderingSurfaces:(BOOL)a4;
- (void)switcherContentController:(id)a3 setContainerStatusBarHidden:(BOOL)a4 partsHidden:(unint64_t)a5 animationDuration:(double)a6;
- (void)switcherContentController:(id)a3 setHomeScreenAlpha:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6;
- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurMaterialRecipeName:(id)a4 withAnimationMode:(int64_t)a5 completion:(id)a6;
- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurProgress:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6;
- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurType:(int64_t)a4;
- (void)switcherContentController:(id)a3 setHomeScreenDimmingAlpha:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6;
- (void)switcherContentController:(id)a3 setHomeScreenScale:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6;
- (void)switcherContentController:(id)a3 setInterfaceOrientation:(int64_t)a4;
- (void)switcherContentController:(id)a3 setInterfaceOrientationFromUserResizing:(int64_t)a4 forDisplayItem:(id)a5;
- (void)switcherContentController:(id)a3 setPointerInteractionsEnabled:(BOOL)a4;
- (void)switcherContentController:(id)a3 setWallpaperScale:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6;
- (void)switcherContentController:(id)a3 setWallpaperStyle:(int64_t)a4;
- (void)switcherContentControllerDidUpdateVisibleHomeAffordances:(id)a3;
- (void)switcherControllerViewWillAppear:(id)a3 animated:(BOOL)a4;
- (void)switcherControllerWillUpdateWindowManagementStyle:(id)a3;
- (void)switcherDemoFilteringControllerDidChangeHiddenApplicationBundleIDs:(id)a3;
- (void)tickleContinuousExposeStripRevealGrabberTongueIfVisibleForSwitcherContentController:(id)a3;
- (void)transactionDidComplete:(id)a3;
- (void)updateUserInteractionEnabledForSwitcherContentController:(id)a3;
- (void)updateWindowVisibilityForSwitcherContentController:(id)a3;
- (void)watchdog:(id)a3 requestsTerminationOf:(id)a4 forReason:(id)a5;
- (void)windowSceneDidConnect:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBMainSwitcherControllerCoordinator

- (id)_switcherControllerForContentViewController:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__SBMainSwitcherControllerCoordinator__switcherControllerForContentViewController___block_invoke;
  v8[3] = &unk_1E6AFC3C8;
  id v9 = v4;
  id v5 = v4;
  v6 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerPassingTest:v8];

  return v6;
}

- (id)_switcherControllerPassingTest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_switcherControllersByWindowScene;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = -[NSMapTable objectForKey:](self->_switcherControllersByWindowScene, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
      if (v4[2](v4, v10)) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

uint64_t __83__SBMainSwitcherControllerCoordinator__switcherControllerForContentViewController___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 contentViewController];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

BOOL __73__SBMainSwitcherControllerCoordinator__switcherControllerForDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F62A60];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 uniqueIdentifier];
  uint64_t v6 = [v2 identityForIdentifier:v5];

  uint64_t v7 = [v4 windowScene];

  uint64_t v8 = [v7 sceneManager];
  uint64_t v9 = [v8 existingSceneHandleForSceneIdentity:v6];
  BOOL v10 = v9 != 0;

  return v10;
}

- (id)_homeScreenAppearanceControllerForSwitcherContentController:(id)a3
{
  v3 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  id v4 = [v3 windowScene];

  id v5 = [v4 homeScreenController];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[SBUIController sharedInstance];
  }
  uint64_t v8 = v7;

  return v8;
}

- (unint64_t)windowManagementStyleForSwitcherContentController:(id)a3
{
  v3 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  unint64_t v4 = [v3 windowManagementStyle];

  return v4;
}

uint64_t __72__SBMainSwitcherControllerCoordinator_switcherControllerForWindowScene___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 windowScene];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)windowSceneForSwitcherContentController:(id)a3
{
  v3 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  uint64_t v4 = [v3 windowScene];

  return v4;
}

- (BOOL)_shouldPrioritizeSortOrderForAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allItems];
  uint64_t v6 = [v4 type];

  if (v6) {
    goto LABEL_5;
  }
  if ([v5 count] != 1) {
    goto LABEL_5;
  }
  id v7 = [v5 firstObject];
  uint64_t v8 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForDisplayItem:v7];
  uint64_t v9 = [v8 _deviceApplicationSceneHandleForDisplayItem:v7];

  if (v9)
  {
    char v10 = [v9 shouldPrioritizeForSwitcherOrdering];
  }
  else
  {
LABEL_5:
    char v10 = 0;
  }

  return v10;
}

- (id)_switcherControllerForDisplayItem:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SBMainSwitcherControllerCoordinator__switcherControllerForDisplayItem___block_invoke;
  v8[3] = &unk_1E6AFC3C8;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerPassingTest:v8];

  return v6;
}

- (BOOL)switcherContentController:(id)a3 supportsKillingOfAppLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:v6];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__SBMainSwitcherControllerCoordinator_switcherContentController_supportsKillingOfAppLayout___block_invoke;
  v12[3] = &unk_1E6AFD168;
  id v9 = v8;
  id v13 = v9;
  long long v14 = &v15;
  [v7 enumerate:v12];
  char v10 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)switcherGestureManagerForSwitcherContentController:(id)a3
{
  v3 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  id v4 = [v3 gestureManager];

  return v4;
}

- (void)switcherContentControllerDidUpdateVisibleHomeAffordances:(id)a3
{
  id v4 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  v3 = [v4 gestureManager];
  [v3 noteVisibleHomeAffordancesChanged];
}

- (id)transitionEventForContext:(id)a3 identifier:(id)a4 phase:(unint64_t)a5 animated:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v123 = a4;
  uint64_t v10 = objc_opt_class();
  v11 = [v9 previousLayoutState];
  long long v12 = SBSafeCast(v10, v11);

  uint64_t v120 = [v12 unlockedEnvironmentMode];
  uint64_t v13 = objc_opt_class();
  long long v14 = [v9 layoutState];
  uint64_t v15 = SBSafeCast(v13, v14);

  uint64_t v125 = [v15 unlockedEnvironmentMode];
  v16 = [v9 request];
  uint64_t v17 = [v16 transientOverlayContext];
  char v18 = [(id)SBApp windowSceneManager];
  v19 = [v16 displayIdentity];
  v20 = [v18 windowSceneForDisplayIdentity:v19];

  v21 = v12;
  v117 = v20;
  v122 = [v20 switcherController];
  int v116 = [v122 isChamoisWindowingUIEnabled];
  v128 = [v12 appLayout];
  v119 = [v12 floatingAppLayout];
  [v15 invalidateAppLayout];
  [v15 invalidateFloatingAppLayout];
  v130 = [v15 appLayout];
  v124 = v15;
  v129 = [v15 floatingAppLayout];
  v127 = self;
  v118 = v17;
  if (v17)
  {
    unsigned int v111 = v6;
    v22 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForTransitionRequest:v16];
    v23 = [v22 windowScene];
    uint64_t v24 = [v17 transitionType];
    v25 = v17;
    uint64_t v26 = v24;
    v27 = [v25 transientOverlay];
    v28 = [(SBMainSwitcherControllerCoordinator *)self appLayoutForWorkspaceTransientOverlay:v27 windowScene:v23];

    if (v28)
    {
      BOOL v29 = v26 == 0;
      uint64_t v30 = v120;
      if (v26) {
        uint64_t v30 = 3;
      }
      uint64_t v120 = v30;
      uint64_t v31 = v125;
      if (!v26) {
        uint64_t v31 = 3;
      }
      uint64_t v125 = v31;
      if (v26) {
        v32 = v28;
      }
      else {
        v32 = v128;
      }
      id v33 = v9;
      if (v29) {
        v34 = v28;
      }
      else {
        v34 = v130;
      }
      v35 = v21;
      if (v29) {
        v36 = v130;
      }
      else {
        v36 = v128;
      }
      id v37 = v28;

      v21 = v35;
      v130 = v34;
      id v9 = v33;
      v128 = v32;
    }

    unint64_t v38 = a5;
    uint64_t v6 = v111;
  }
  else
  {
    unint64_t v38 = a5;
  }
  v39 = [[SBTransitionSwitcherModifierEvent alloc] initWithTransitionID:v123 phase:v38 animated:v6];
  [(SBTransitionSwitcherModifierEvent *)v39 setFromAppLayout:v128];
  [(SBTransitionSwitcherModifierEvent *)v39 setFromEnvironmentMode:v120];
  -[SBTransitionSwitcherModifierEvent setFromInterfaceOrientation:](v39, "setFromInterfaceOrientation:", [v21 interfaceOrientation]);
  v40 = [v21 elementWithRole:1];
  -[SBTransitionSwitcherModifierEvent setFromAppLayoutWantsExclusiveForeground:](v39, "setFromAppLayoutWantsExclusiveForeground:", [v40 hasLayoutAttributes:2]);

  v41 = [v21 bundleIDShowingAppExpose];
  [(SBTransitionSwitcherModifierEvent *)v39 setFromAppExposeBundleID:v41];

  v42 = [v9 activatingEntity];
  uint64_t v43 = [v42 applicationSceneEntity];
  if (v43)
  {
    v44 = (void *)v43;

    v45 = v127;
  }
  else
  {
    v46 = [v9 entityForLayoutRole:1];
    v44 = [v46 applicationSceneEntity];

    v45 = v127;
    if (!v44)
    {
      v121 = 0;
      goto LABEL_25;
    }
  }
  v47 = [(SBMainSwitcherControllerCoordinator *)v45 _recentAppLayoutsController];
  int v48 = [v47 _transitionContextRepresentsAmbiguousLaunch:v9 forApplicationSceneEntity:v44];

  v121 = v44;
  if (v48)
  {
    v49 = [v44 application];
    v50 = [v49 bundleIdentifier];
    [(SBTransitionSwitcherModifierEvent *)v39 setAmbiguouslyLaunchedBundleIDIfAny:v50];
  }
LABEL_25:
  [(SBTransitionSwitcherModifierEvent *)v39 setToAppLayout:v130];
  [(SBTransitionSwitcherModifierEvent *)v39 setToEnvironmentMode:v125];
  -[SBTransitionSwitcherModifierEvent setToInterfaceOrientation:](v39, "setToInterfaceOrientation:", [v124 interfaceOrientation]);
  v51 = [v124 elementWithRole:1];
  -[SBTransitionSwitcherModifierEvent setToAppLayoutWantsExclusiveForeground:](v39, "setToAppLayoutWantsExclusiveForeground:", [v51 hasLayoutAttributes:2]);

  v52 = [v124 bundleIDShowingAppExpose];
  [(SBTransitionSwitcherModifierEvent *)v39 setToAppExposeBundleID:v52];

  v53 = [v21 floatingAppLayout];
  [(SBTransitionSwitcherModifierEvent *)v39 setFromFloatingAppLayout:v53];

  -[SBTransitionSwitcherModifierEvent setFromFloatingConfiguration:](v39, "setFromFloatingConfiguration:", [v21 floatingConfiguration]);
  -[SBTransitionSwitcherModifierEvent setFromFloatingSwitcherVisible:](v39, "setFromFloatingSwitcherVisible:", [v21 isFloatingSwitcherVisible]);
  -[SBTransitionSwitcherModifierEvent setToFloatingSwitcherVisible:](v39, "setToFloatingSwitcherVisible:", [v124 isFloatingSwitcherVisible]);
  [(SBTransitionSwitcherModifierEvent *)v39 setToFloatingAppLayout:v129];
  -[SBTransitionSwitcherModifierEvent setToFloatingConfiguration:](v39, "setToFloatingConfiguration:", [v124 floatingConfiguration]);
  -[SBTransitionSwitcherModifierEvent setFromPeekConfiguration:](v39, "setFromPeekConfiguration:", [v21 peekConfiguration]);
  -[SBTransitionSwitcherModifierEvent setToPeekConfiguration:](v39, "setToPeekConfiguration:", [v124 peekConfiguration]);
  -[SBTransitionSwitcherModifierEvent setFromSpaceConfiguration:](v39, "setFromSpaceConfiguration:", [v21 spaceConfiguration]);
  -[SBTransitionSwitcherModifierEvent setToSpaceConfiguration:](v39, "setToSpaceConfiguration:", [v124 spaceConfiguration]);
  -[SBTransitionSwitcherModifierEvent setFromWindowPickerRole:](v39, "setFromWindowPickerRole:", [v21 windowPickerRole]);
  -[SBTransitionSwitcherModifierEvent setToWindowPickerRole:](v39, "setToWindowPickerRole:", [v124 windowPickerRole]);
  liveDisplayItemsBeingTerminated = v45->_liveDisplayItemsBeingTerminated;
  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __91__SBMainSwitcherControllerCoordinator_transitionEventForContext_identifier_phase_animated___block_invoke;
  v138[3] = &unk_1E6AF4B38;
  v55 = v39;
  v139 = v55;
  v56 = [(NSMutableSet *)liveDisplayItemsBeingTerminated bs_filter:v138];
  [(SBTransitionSwitcherModifierEvent *)v55 setFromDisplayItemsPendingTermination:v56];

  v57 = [v16 bannerUnfurlSourceContextProvider];
  v58 = [v57 bannerUnfurlSourceContextForTransitionRequest:v16];
  [(SBTransitionSwitcherModifierEvent *)v55 setBannerUnfurlSourceContext:v58];

  -[SBTransitionSwitcherModifierEvent setPrefersCrossfadeTransition:](v55, "setPrefersCrossfadeTransition:", [v9 prefersCrossfadeTransition]);
  -[SBTransitionSwitcherModifierEvent setPrefersCenterZoomTransition:](v55, "setPrefersCenterZoomTransition:", [v9 prefersCenterZoomTransition]);
  v59 = [v9 preludeAnimationTokenWrapper];
  int v60 = [v59 isTokenAvailable];

  if (v38 == 1 && v60)
  {
    v61 = [v9 preludeAnimationTokenWrapper];
    v62 = [v61 consumeToken];

    v63 = +[SBConsumableTokenWrapper consumableTokenWrapperWithToken:v62];
    [(SBTransitionSwitcherModifierEvent *)v55 setZoomFromHardwareButtonPreludeTokenWrapper:v63];
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  v64 = [v9 applicationSceneEntities];
  uint64_t v65 = [v64 countByEnumeratingWithState:&v134 objects:v140 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v135;
    v113 = v21;
LABEL_30:
    id v68 = v9;
    uint64_t v69 = 0;
    while (1)
    {
      if (*(void *)v135 != v67) {
        objc_enumerationMutation(v64);
      }
      v70 = *(void **)(*((void *)&v134 + 1) + 8 * v69);
      v71 = [v70 activationSettings];
      v72 = [v71 objectForActivationSetting:46];
      if (v72 || [v71 flagForActivationSetting:56] == 1)
      {
      }
      else if ([v71 flagForActivationSetting:11] != 1)
      {
        goto LABEL_39;
      }
      v73 = [v70 displayItemRepresentation];
      if ([v130 containsItem:v73])
      {
        v76 = v130;
        goto LABEL_47;
      }
      if ([v129 containsItem:v73])
      {
        v76 = v129;
LABEL_47:
        v77 = objc_msgSend(v76, "leafAppLayoutForRole:", objc_msgSend(v76, "layoutRoleForItem:", v73));

        id v9 = v68;
        v21 = v113;
        p_isa = (id *)&v127->super.isa;
        if (v77) {
          goto LABEL_58;
        }
        goto LABEL_48;
      }

LABEL_39:
      if (v66 == ++v69)
      {
        uint64_t v74 = [v64 countByEnumeratingWithState:&v134 objects:v140 count:16];
        uint64_t v66 = v74;
        id v9 = v68;
        v21 = v113;
        if (v74) {
          goto LABEL_30;
        }
        break;
      }
    }
  }

  p_isa = (id *)&v127->super.isa;
LABEL_48:
  v77 = 0;
  if ([v16 source] == 52 && v128 == v130 && v119 == v129)
  {
    uint64_t v78 = [v9 requestedWindowPickerRole];
    if (v78)
    {
      uint64_t v80 = v78;
      if (v78 == 3)
      {
        v81 = v119;
        uint64_t v80 = 1;
      }
      else
      {
        v81 = v130;
      }
      id v79 = [v81 leafAppLayoutForRole:v80];
    }
    else
    {
      id v79 = v130;
    }
    v77 = v79;
  }
LABEL_58:
  [(SBTransitionSwitcherModifierEvent *)v55 setActivatingAppLayout:v77];
  BOOL v82 = [v16 source] == 11 || objc_msgSend(v16, "source") == 27;
  [(SBTransitionSwitcherModifierEvent *)v55 setGestureInitiated:v82];
  BOOL v83 = [v16 source] == 51 || objc_msgSend(v16, "source") == 12;
  [(SBTransitionSwitcherModifierEvent *)v55 setKeyboardShortcutInitiated:v83];
  -[SBTransitionSwitcherModifierEvent setTopAffordanceInitiated:](v55, "setTopAffordanceInitiated:", [v16 source] == 50);
  -[SBTransitionSwitcherModifierEvent setDragAndDropTransition:](v55, "setDragAndDropTransition:", [v16 source] == 27);
  -[SBTransitionSwitcherModifierEvent setBreadcrumbTransition:](v55, "setBreadcrumbTransition:", [v16 source] == 15);
  uint64_t v133 = 0;
  if ([p_isa _shouldMorphFromPIPForTransitionContext:v9 outForLayoutRole:&v133]) {
    [(SBTransitionSwitcherModifierEvent *)v55 setMorphFromPIPTransition:1];
  }
  else {
    -[SBTransitionSwitcherModifierEvent setMorphToPIPTransition:](v55, "setMorphToPIPTransition:", [p_isa _shouldMorphToPIPForTransitionContext:v9 outForLayoutRole:&v133]);
  }
  [(SBTransitionSwitcherModifierEvent *)v55 setMorphingPIPLayoutRole:v133];
  -[SBTransitionSwitcherModifierEvent setZoomFromSystemApertureTransition:](v55, "setZoomFromSystemApertureTransition:", [p_isa _shouldZoomFromSystemApertureForTransitionContext:v9]);
  -[SBTransitionSwitcherModifierEvent setContinuityTransition:](v55, "setContinuityTransition:", [v16 source] == 10);
  -[SBTransitionSwitcherModifierEvent setBannerUnfurlTransition:](v55, "setBannerUnfurlTransition:", [v16 source] == 37);
  -[SBTransitionSwitcherModifierEvent setSpotlightTransition:](v55, "setSpotlightTransition:", [v16 source] == 2);
  -[SBTransitionSwitcherModifierEvent setShelfTransition:](v55, "setShelfTransition:", [v16 source] == 52);
  -[SBTransitionSwitcherModifierEvent setShelfRequestTransition:](v55, "setShelfRequestTransition:", [v16 source] == 54);
  -[SBTransitionSwitcherModifierEvent setMorphFromInAppView:](v55, "setMorphFromInAppView:", [v16 source] == 55);
  -[SBTransitionSwitcherModifierEvent setQuickActionTransition:](v55, "setQuickActionTransition:", [v16 source] == 33);
  -[SBTransitionSwitcherModifierEvent setNewSceneTransition:](v55, "setNewSceneTransition:", [v16 source] == 35);
  if ([v16 isCrossingDisplays]) {
    uint64_t v84 = [p_isa[16] hasTransitioningDisplayItemsForSwitcherController:v122];
  }
  else {
    uint64_t v84 = 0;
  }
  [(SBTransitionSwitcherModifierEvent *)v55 setMoveDisplaysTransition:v84];
  -[SBTransitionSwitcherModifierEvent setContinuousExposeConfigurationChangeEvent:](v55, "setContinuousExposeConfigurationChangeEvent:", [v16 source] == 65);
  -[SBTransitionSwitcherModifierEvent setiPadOSWindowingModeChangeEvent:](v55, "setiPadOSWindowingModeChangeEvent:", [v16 source] == 64);
  -[SBTransitionSwitcherModifierEvent setCommandTabTransition:](v55, "setCommandTabTransition:", [v16 source] == 16);
  BOOL v85 = [v16 source] == 24 || objc_msgSend(v16, "source") == 25;
  [(SBTransitionSwitcherModifierEvent *)v55 setLaunchingFromDockTransition:v85];
  -[SBTransitionSwitcherModifierEvent setAppLaunchDuringWindowDragGestureTransition:](v55, "setAppLaunchDuringWindowDragGestureTransition:", [v16 source] == 68);
  uint64_t v86 = [v9 isTransitioningToLessRecentSpace];
  uint64_t v87 = v86 != 0x7FFFFFFFFFFFFFFFLL;
  if (v86 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (BSSettingFlagIsYes()) {
      uint64_t v88 = 2;
    }
    else {
      uint64_t v88 = 1;
    }
    [(SBTransitionSwitcherModifierEvent *)v55 setDosidoTransitionDirection:v88];
  }
  activeTransitionModelRemovalAppLayoutToRemovalContext = v127->_activeTransitionModelRemovalAppLayoutToRemovalContext;
  v131[0] = MEMORY[0x1E4F143A8];
  v131[1] = 3221225472;
  v131[2] = __91__SBMainSwitcherControllerCoordinator_transitionEventForContext_identifier_phase_animated___block_invoke_2;
  v131[3] = &unk_1E6B042E0;
  v90 = v55;
  v132 = v90;
  [(NSDictionary *)activeTransitionModelRemovalAppLayoutToRemovalContext enumerateKeysAndObjectsUsingBlock:v131];
  if (v86 == 0x7FFFFFFFFFFFFFFFLL && v128 && v125 == 1 && ![v128 type])
  {
    v91 = [v21 elementWithRole:1];
    v92 = [v91 workspaceEntity];

    v93 = [v9 removalContextForEntity:v92];

    if (v92)
    {
      if (![v92 isDeviceApplicationSceneEntity] || v93)
      {
        uint64_t v87 = [v92 isAppClipPlaceholderEntity];
      }
      else
      {
        v94 = [v92 application];
        v95 = v94;
        if (v94
          && ([v94 info],
              v96 = objc_claimAutoreleasedReturnValue(),
              char v97 = [v96 isAppClip],
              v96,
              (v97 & 1) != 0))
        {
          uint64_t v87 = 1;
        }
        else
        {
          v98 = [(id)SBApp windowSceneManager];
          v99 = [v16 displayIdentity];
          uint64_t v100 = [v98 windowSceneForDisplayIdentity:v99];

          v126 = (void *)v100;
          v115 = [(SBMainSwitcherControllerCoordinator *)v127 switcherControllerForWindowScene:v100];
          v101 = [v115 contentViewController];
          v102 = [v101 iconForAppLayout:v128];
          if ([v102 isBookmarkIcon])
          {
            v110 = [v102 bookmark];
            [v110 webClip];
            v103 = v112 = v95;
            uint64_t v87 = [v103 isAppClip];

            v95 = v112;
          }
          else
          {
            uint64_t v87 = 0;
          }
        }
      }
    }
    else
    {
      uint64_t v87 = 0;
    }
  }
  [(SBTransitionSwitcherModifierEvent *)v90 setIconZoomDisabled:v87];
  if (v116)
  {
    v104 = [v21 displayItemLayoutAttributesMap];
    [(SBTransitionSwitcherModifierEvent *)v90 setFromDisplayItemLayoutAttributesMap:v104];

    v105 = [v124 displayItemLayoutAttributesMap];
    [(SBTransitionSwitcherModifierEvent *)v90 setToDisplayItemLayoutAttributesMap:v105];
  }
  if ([(SBTransitionSwitcherModifierEvent *)v90 isMoveDisplaysTransition])
  {
    v106 = +[SBTransitionSwitcherModifierMoveDisplaysContext moveDisplaysContextWithCoordinatedLayoutStateTransitionContext:v127->_currentCoordinatedLayoutStateTransitionContext relativeToSwitcherController:v122];
    [(SBTransitionSwitcherModifierEvent *)v90 setMoveDisplaysContext:v106];
  }
  v107 = v132;
  v108 = v90;

  return v108;
}

- (BOOL)_shouldZoomFromSystemApertureForTransitionContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = 0;
  if (!SBReduceMotion())
  {
    uint64_t v5 = SBFEffectiveArtworkSubtype();
    if (v5 <= 2795)
    {
      if (v5 != 2556 && v5 != 2622) {
        goto LABEL_11;
      }
LABEL_8:
      uint64_t v6 = [v3 request];
      uint64_t v7 = [v6 source];

      if ((unint64_t)(v7 - 22) <= 0x2D) {
        BOOL v4 = (0x208000000001uLL >> (v7 - 22)) & 1;
      }
      else {
        BOOL v4 = 0;
      }
      goto LABEL_11;
    }
    if (v5 == 2868 || v5 == 2796) {
      goto LABEL_8;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_shouldMorphToPIPForTransitionContext:(id)a3 outForLayoutRole:(int64_t *)a4
{
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  if (SBReduceMotion())
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [v5 previousLayoutState];
    id v9 = SBSafeCast(v7, v8);

    uint64_t v10 = objc_opt_class();
    v11 = [v5 layoutState];
    long long v12 = SBSafeCast(v10, v11);

    uint64_t v30 = v9;
    uint64_t v13 = [v9 unlockedEnvironmentMode];
    BOOL v29 = v12;
    uint64_t v14 = [v12 unlockedEnvironmentMode];
    uint64_t v15 = [v5 request];
    v16 = [v15 transientOverlayContext];
    uint64_t v17 = [v15 source];
    BOOL v18 = (v13 & 0xFFFFFFFFFFFFFFFELL) == 2;
    if (v13 == 1)
    {
      if (v16) {
        BOOL v18 = [v16 transitionType] == 1;
      }
      else {
        BOOL v18 = 0;
      }
    }
    v19 = [v5 previousLayoutState];
    uint64_t v20 = [v19 interfaceOrientation];

    v21 = [v5 layoutState];
    unint64_t v22 = [v21 interfaceOrientation];

    BOOL v6 = 0;
    BOOL v24 = v22 < 2 || v20 == v22 || v17 == 11;
    if (v24 && v18 && v14 == 1)
    {
      id v31 = 0;
      uint64_t v32 = 0;
      BOOL v25 = +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:v15 foundEntity:&v31 transitionStyle:&v32];
      id v26 = v31;
      v27 = v26;
      if (v25 && v26 && v32 == 3)
      {
        if (a4) {
          *a4 = [v26 layoutRole];
        }
        BOOL v6 = 1;
      }
      else
      {
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

- (BOOL)_shouldMorphFromPIPForTransitionContext:(id)a3 outForLayoutRole:(int64_t *)a4
{
  id v5 = a3;
  BOOL v6 = [v5 request];
  uint64_t v7 = [v6 source];

  if (a4)
  {
    if (v7 == 45)
    {
      uint64_t v8 = [v5 requestedActivatingWorkspaceEntity];
      *a4 = [v8 layoutRole];
    }
    else
    {
      *a4 = 0;
    }
  }

  return v7 == 45;
}

- (id)_recentAppLayoutsController
{
  return [(SBAppSwitcherModel *)self->_mainSwitcherModel _recentAppLayoutsController];
}

- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurMaterialRecipeName:(id)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = [(SBMainSwitcherControllerCoordinator *)self _homeScreenAppearanceControllerForSwitcherContentController:a3];
  [v12 setHomeScreenBackdropBlurMaterialRecipeName:v11 behaviorMode:a5 completion:v10];
}

- (void)switcherContentController:(id)a3 setWallpaperScale:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v9 = (void *)MEMORY[0x1E4F42FF0];
  settings = self->_settings;
  id v11 = a6;
  id v12 = [(SBAppSwitcherSettings *)settings animationSettings];
  uint64_t v13 = [v12 wallpaperScaleSettings];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __112__SBMainSwitcherControllerCoordinator_switcherContentController_setWallpaperScale_withAnimationMode_completion___block_invoke;
  v14[3] = &unk_1E6AF4A70;
  *(double *)&v14[5] = a4;
  v14[4] = self;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v13, a5, v14, v11);
}

- (void)switcherContentController:(id)a3 setHomeScreenScale:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [(SBMainSwitcherControllerCoordinator *)self _homeScreenAppearanceControllerForSwitcherContentController:a3];
  [v11 setHomeScreenScale:a5 behaviorMode:v10 completion:a4];
}

- (void)switcherContentController:(id)a3 setHomeScreenDimmingAlpha:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [(SBMainSwitcherControllerCoordinator *)self _homeScreenAppearanceControllerForSwitcherContentController:a3];
  [v11 setHomeScreenDimmingAlpha:a5 behaviorMode:v10 completion:a4];
}

- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurProgress:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [(SBMainSwitcherControllerCoordinator *)self _homeScreenAppearanceControllerForSwitcherContentController:a3];
  [v11 setHomeScreenBlurProgress:a5 behaviorMode:v10 completion:a4];
}

- (void)switcherContentController:(id)a3 setHomeScreenAlpha:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [(SBMainSwitcherControllerCoordinator *)self _homeScreenAppearanceControllerForSwitcherContentController:a3];
  [v11 setHomeScreenAlpha:a5 behaviorMode:v10 completion:a4];
}

uint64_t __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 type]
    || ([*(id *)(a1 + 32) _shouldPrioritizeSortOrderForAppLayout:v6] & 1) != 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
    *a4 = 1;
  }

  return v7;
}

void __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 environment] == 2
    && [v5 containsAnyItemFromSet:*(void *)(a1 + 32)]
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    || [v5 environment] == 1
    && [v5 containsAnyItemFromSet:*(void *)(a1 + 48)]
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    goto LABEL_20;
  }
  if ([*(id *)(a1 + 56) _shouldPrioritizeSortOrderForAppLayout:v5])
  {
    [*(id *)(a1 + 40) addIndex:a3];
    [*(id *)(a1 + 64) addObject:v5];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 56) + 88);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([v5 containsItemWithUniqueIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * i)])
        {
          [*(id *)(a1 + 40) addIndex:a3];
          goto LABEL_19;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  if ([*(id *)(*(void *)(a1 + 56) + 240) containsObject:v5]) {
LABEL_20:
  }
    [*(id *)(a1 + 40) addIndex:a3];
  if (+[SBApplicationAppProtectionAssistant areAnyApplicationsHidden](SBApplicationAppProtectionAssistant, "areAnyApplicationsHidden")&& ([*(id *)(a1 + 40) containsIndex:a3] & 1) == 0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_3;
    v11[3] = &unk_1E6AFA8B0;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = a3;
    [v5 enumerate:v11];
  }
}

- (BOOL)isInAppStatusBarRequestedHiddenForSwitcherContentController:(id)a3
{
  id v4 = a3;
  id v5 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:v4];
  char v6 = [v5 isInAppStatusBarRequestedHiddenForSwitcherContentController:v4];

  return v6;
}

- (void)switcherContentController:(id)a3 setPointerInteractionsEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[SBUIController sharedInstance];
  [v5 setPointerInteractionsEnabled:v4];
}

- (id)draggingAppLayoutsForWindowDragForSwitcherContentController:(id)a3
{
  return self->_draggingAppLayouts;
}

- (BOOL)switcherContentControllerControlsHomeScreenContents:(id)a3
{
  id v3 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  BOOL v4 = [v3 windowScene];

  if ([v4 isMainDisplayWindowScene]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isContinuityDisplayWindowScene];
  }

  return v5;
}

- (void)switcherContentController:(id)a3 setContainerStatusBarHidden:(BOOL)a4 partsHidden:(unint64_t)a5 animationDuration:(double)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  BOOL v11 = [(SBMainSwitcherControllerCoordinator *)self _contentControllerIsEmbeddedDisplayContentController:v10];
  if (v11) {
    id v12 = @"kSBMainAppSwitcherStatusBarReason";
  }
  else {
    id v12 = @"kSBFloatingAppSwitcherStatusBarReason";
  }
  uint64_t v13 = 288;
  if (v11) {
    uint64_t v13 = 280;
  }
  long long v14 = (char *)self + v13;
  uint64_t v15 = *(uint64_t *)((char *)&self->super.isa + v13);
  id v19 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:v10];

  long long v16 = [v19 windowScene];
  [(SBMainSwitcherControllerCoordinator *)self _setContainerStatusBarHidden:v8 animationDuration:v14 usingAssertion:v12 reason:v16 windowScene:a6];
  if (!v8)
  {
    BOOL v18 = a6 > 0.0 && v15 == 0;
    [(SBMainSwitcherControllerCoordinator *)self _setStatusBarPartsHidden:a5 animated:v18 windowScene:v16];
  }
}

- (void)_setContainerStatusBarHidden:(BOOL)a3 animationDuration:(double)a4 usingAssertion:(id *)a5 reason:(id)a6 windowScene:(id)a7
{
  BOOL v10 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = *a5;
  uint64_t v15 = [v13 switcherController];
  BOOL v16 = [(SBMainSwitcherControllerCoordinator *)self _shouldTakeStatusBarAssertionForSwitcherController:v15];

  if (v14)
  {
    long long v17 = [v14 settings];
    BOOL v18 = [v17 alpha];
    [v18 doubleValue];
    BOOL v20 = v19 == 0.0;
  }
  else
  {
    BOOL v20 = 0;
  }
  if ((((v14 != 0) ^ v16) & 1) != 0 || v20 != v10)
  {
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [v21 setDuration:a4];
    if (v16)
    {
      if (v14)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __120__SBMainSwitcherControllerCoordinator__setContainerStatusBarHidden_animationDuration_usingAssertion_reason_windowScene___block_invoke;
        v25[3] = &__block_descriptor_33_e36_v16__0__SBMutableStatusBarSettings_8l;
        BOOL v26 = v10;
        [v14 modifySettingsWithBlock:v25 animationParameters:v21];
      }
      else
      {
        unint64_t v22 = [v13 statusBarManager];
        v23 = [v22 assertionManager];

        id v14 = (id)[v23 newSettingsAssertionWithStatusBarHidden:v10 atLevel:6 reason:v12];
        [v14 acquireWithAnimationParameters:v21];
      }
    }
    else
    {
      [v14 invalidateWithAnimationParameters:v21];

      id v14 = 0;
    }
  }
  id v24 = *a5;
  *a5 = v14;
}

- (BOOL)_shouldTakeStatusBarAssertionForSwitcherController:(id)a3
{
  id v3 = [a3 layoutState];
  BOOL v4 = ([v3 unlockedEnvironmentMode] & 0xFFFFFFFFFFFFFFFELL) == 2;

  return v4;
}

- (BOOL)_contentControllerIsEmbeddedDisplayContentController:(id)a3
{
  id v4 = a3;
  char v5 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  id v6 = [v5 contentViewController];

  return v6 == v4;
}

- (void)_setStatusBarPartsHidden:(unint64_t)a3 animated:(BOOL)a4 windowScene:(id)a5
{
  BOOL v5 = a4;
  id v14 = a5;
  containerStatusBarContentAssertion = self->_containerStatusBarContentAssertion;
  if ((a3 & 0xA) != 0 && !containerStatusBarContentAssertion)
  {
    uint64_t v9 = [SBStatusBarPartVisibilityAssertion alloc];
    BOOL v10 = [v14 statusBarManager];
    BOOL v11 = [v10 statusBar];
    id v12 = [(SBStatusBarPartVisibilityAssertion *)v9 initWithIdentifier:@"SBMainSwitcherCoordinator" statusBar:v11 forReason:@"Home Screen Peek"];
    id v13 = self->_containerStatusBarContentAssertion;
    self->_containerStatusBarContentAssertion = v12;

LABEL_7:
    containerStatusBarContentAssertion = self->_containerStatusBarContentAssertion;
    goto LABEL_8;
  }
  if ((a3 & 0xA) == 0 && containerStatusBarContentAssertion)
  {
    [(BSSimpleAssertion *)containerStatusBarContentAssertion invalidate];
    BOOL v10 = self->_containerStatusBarContentAssertion;
    self->_containerStatusBarContentAssertion = 0;
    goto LABEL_7;
  }
LABEL_8:
  if (containerStatusBarContentAssertion)
  {
    [(SBStatusBarPartVisibilityAssertion *)containerStatusBarContentAssertion setStatusBarPartWithIdentifier:*MEMORY[0x1E4F441B8] hidden:(a3 >> 1) & 1 animated:v5];
    [(SBStatusBarPartVisibilityAssertion *)self->_containerStatusBarContentAssertion setStatusBarPartWithIdentifier:*MEMORY[0x1E4F441C8] hidden:(a3 >> 3) & 1 animated:v5];
  }
}

- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurType:(int64_t)a4
{
  unint64_t v5 = a4 & 0xFFFFFFFFFFFFFFFELL;
  id v6 = [(SBMainSwitcherControllerCoordinator *)self _homeScreenAppearanceControllerForSwitcherContentController:a3];
  id v8 = v6;
  if (v5 == 2)
  {
    [v6 beginRequiringBackdropViewForReason:@"SBAppSwitcherBackdropRequiringReason"];
    uint64_t v7 = v8;
    if (a4 == 3)
    {
      [v8 beginRequiringLiveBackdropViewForReason:@"SBAppSwitcherBackdropRequiringReason"];
      goto LABEL_6;
    }
  }
  else
  {
    [v6 endRequiringBackdropViewForReason:@"SBAppSwitcherBackdropRequiringReason"];
    uint64_t v7 = v8;
  }
  [v7 endRequiringLiveBackdropViewForReason:@"SBAppSwitcherBackdropRequiringReason"];
LABEL_6:
}

- (BOOL)switcherContentControllerControlsWallpaper:(id)a3
{
  id v3 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  id v4 = [v3 windowScene];

  LOBYTE(v3) = [v4 isMainDisplayWindowScene];
  return (char)v3;
}

void __112__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  if ([v10 isDeviceApplicationSceneEntity])
  {
    unint64_t v5 = [v10 deviceApplicationSceneEntity];
    id v6 = [v5 sceneHandle];
    char v7 = [v6 isTranslucent];

    if (v7) {
      goto LABEL_5;
    }
  }
  if ([v10 isDeviceApplicationSceneEntity])
  {
    id v8 = [v10 sceneHandle];
    int v9 = [v8 wantsEnhancedWindowingEnabled];

    if (v9)
    {
LABEL_5:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

- (int64_t)homeScreenInterfaceOrientationForContentController:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:v4];
  id v6 = [v5 windowScene];
  if (([v6 isMainDisplayWindowScene] & 1) != 0
    || [v6 isContinuityDisplayWindowScene])
  {
    char v7 = [(SBMainSwitcherControllerCoordinator *)self _homeScreenAppearanceControllerForSwitcherContentController:v4];
    id v8 = [v7 window];
    int64_t v9 = [v8 interfaceOrientation];
  }
  else
  {
    int64_t v9 = [(SBMainSwitcherControllerCoordinator *)self switcherInterfaceOrientationForSwitcherContentController:v4];
  }

  return v9;
}

- (id)animationControllerForTransitionRequest:(id)a3 ancillaryTransitionRequests:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v5 = a4;
  id v6 = [(id)SBApp windowSceneManager];
  char v7 = [v31 displayIdentity];
  v28 = [v6 windowSceneForDisplayIdentity:v7];

  uint64_t v30 = [v28 switcherController];
  BOOL v29 = [v30 contentViewController];
  v27 = [v29 animationControllerForTransitionRequest:v31];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v9 = v8;
  if (v27) {
    objc_msgSend(v8, "addObject:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v15 = [(id)SBApp windowSceneManager];
        BOOL v16 = [v14 displayIdentity];
        long long v17 = [v15 windowSceneForDisplayIdentity:v16];

        BOOL v18 = [v17 switcherController];
        double v19 = [v18 contentViewController];

        BOOL v20 = [v19 animationControllerForTransitionRequest:v14];
        if (v20) {
          [v9 addObject:v20];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v11);
  }

  objc_initWeak(&location, self);
  v21 = [SBUISwitcherAnimationController alloc];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke;
  v32[3] = &unk_1E6B040E0;
  objc_copyWeak(&v36, &location);
  id v22 = v29;
  id v33 = v22;
  v34 = self;
  id v23 = v30;
  id v35 = v23;
  id v24 = [(SBUISwitcherAnimationController *)v21 initWithWorkspaceTransitionRequest:v31 contentViewController:v22 childAnimationControllers:v9 animationBlock:v32];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

  return v24;
}

- (id)switcherContentController:(id)a3 visibleDisplayItemsForBundleIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(SBAppSwitcherModel *)self->_mainSwitcherModel recentDisplayItemsForBundleIdentifier:a4 includingHiddenAppLayouts:0];
  if ([(NSMapTable *)self->_switcherControllersByWindowScene count] == 1)
  {
    id v8 = v7;
  }
  else
  {
    int64_t v9 = [MEMORY[0x1E4F1CA80] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = -[SBMainSwitcherControllerCoordinator appLayoutsForSwitcherContentController:](self, "appLayoutsForSwitcherContentController:", v6, 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) allItems];
          [v9 addObjectsFromArray:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    id v8 = (id)[v7 mutableCopy];
    [v8 intersectSet:v9];
  }
  return v8;
}

- (id)_persistenceIdentifiersForBundleIdentifier:(id)a3 onlyIncludeLaunchableIdentifiers:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v8 = (void *)MEMORY[0x1E4F1CA70];
  int64_t v9 = [(SBAppSwitcherModel *)self->_mainSwitcherModel _recentAppLayoutsController];
  uint64_t v10 = [v9 recentsForBundleIdentifier:v6 includingHiddenAppLayouts:0];
  uint64_t v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v13 = [v8 orderedSetWithArray:v12];

  v44 = self;
  [v13 addObjectsFromArray:self->_appLayouts];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v13;
  uint64_t v49 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v49)
  {
    uint64_t v47 = *(void *)v66;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v66 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = v14;
        uint64_t v15 = *(void **)(*((void *)&v65 + 1) + 8 * v14);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        BOOL v16 = [v15 allItems];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v62 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              uint64_t v22 = [v21 uniqueIdentifier];
              if (v22 && ![v21 type])
              {
                id v23 = +[SBApplicationController sharedInstance];
                id v24 = [v23 applicationForDisplayItem:v21];

                BOOL v25 = +[SBApplicationSceneHandle lookupOrCreatePersistenceIDFromApplication:v24 sceneID:v22];
                [v7 addObject:v25];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v61 objects:v71 count:16];
          }
          while (v18);
        }

        uint64_t v14 = v51 + 1;
      }
      while (v51 + 1 != v49);
      uint64_t v49 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    }
    while (v49);
  }

  BOOL v26 = [(SBAppSwitcherModel *)v44->_mainSwitcherModel _recentAppLayoutsController];
  v27 = [v26 recentsForBundleIdentifier:v6 includingHiddenAppLayouts:1];
  v28 = objc_msgSend(v27, "bs_filter:", &__block_literal_global_314);

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v45 = v28;
  uint64_t v50 = [v45 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v58;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v58 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v52 = v29;
        uint64_t v30 = *(void **)(*((void *)&v57 + 1) + 8 * v29);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v31 = [v30 allItems];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v69 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v54;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v54 != v34) {
                objc_enumerationMutation(v31);
              }
              id v36 = *(void **)(*((void *)&v53 + 1) + 8 * j);
              id v37 = [v36 uniqueIdentifier];
              if (v37 && ![v36 type] && (!v4 || !objc_msgSend(v7, "count")))
              {
                long long v38 = +[SBApplicationController sharedInstance];
                long long v39 = [v38 applicationForDisplayItem:v36];

                long long v40 = +[SBApplicationSceneHandle lookupOrCreatePersistenceIDFromApplication:v39 sceneID:v37];
                [v7 addObject:v40];
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v53 objects:v69 count:16];
          }
          while (v33);
        }

        uint64_t v29 = v52 + 1;
      }
      while (v52 + 1 != v50);
      uint64_t v50 = [v45 countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v50);
  }

  if ([v7 count]) {
    long long v41 = v7;
  }
  else {
    long long v41 = 0;
  }
  id v42 = v41;

  return v42;
}

- (id)switcherContentController:(id)a3 visibleAppLayoutsForBundleIdentifier:(id)a4
{
  id v6 = a3;
  char v7 = [(SBAppSwitcherModel *)self->_mainSwitcherModel appLayoutsForBundleIdentifier:a4 includingHiddenAppLayouts:0];
  if ([(NSMapTable *)self->_switcherControllersByWindowScene count] == 1)
  {
    id v8 = v7;
  }
  else
  {
    int64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = [(SBMainSwitcherControllerCoordinator *)self appLayoutsForSwitcherContentController:v6];
    uint64_t v11 = [v9 setWithArray:v10];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __102__SBMainSwitcherControllerCoordinator_switcherContentController_visibleAppLayoutsForBundleIdentifier___block_invoke;
    v14[3] = &unk_1E6AF4B60;
    id v15 = v11;
    id v12 = v11;
    objc_msgSend(v7, "bs_filter:", v14);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

void __96__SBMainSwitcherControllerCoordinator_switcherContentController_supportsTitleItemsForAppLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_deviceApplicationSceneHandleForDisplayItem:");
  if (v6)
  {
    char v7 = v6;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 prefersHeaderHiddenInSwitcher];
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)switcherContentController:(id)a3 shouldResignActiveForStartOfTransition:(id)a4
{
  id v11 = a4;
  BOOL v4 = [v11 applicationTransitionContext];
  id v5 = [v4 request];
  id v6 = [v11 toLayoutState];
  char v7 = [v11 fromLayoutState];

  uint64_t v8 = [v6 unlockedEnvironmentMode];
  uint64_t v9 = [v5 source];
  uint64_t v10 = [v5 source];
  LOBYTE(v11) = 0;
  if (([v4 animationDisabled] & 1) == 0 && v9 != 11 && v10 != 27 && v8 == 3)
  {
    id v12 = [v7 elements];
    uint64_t v13 = [v6 elements];
    LODWORD(v11) = [v12 isEqualToSet:v13] ^ 1;
  }
  return (char)v11;
}

void __112__SBMainSwitcherControllerCoordinator_switcherContentController_setWallpaperScale_withAnimationMode_completion___block_invoke(uint64_t a1)
{
  v2 = +[SBWallpaperController sharedInstance];
  uint64_t v3 = [v2 setHomescreenWallpaperScale:0 withAnimationFactory:*(double *)(a1 + 40)];

  [*(id *)(*(void *)(a1 + 32) + 192) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = v3;
}

- (id)switcherContentController:(id)a3 deviceApplicationSceneHandleForDisplayItem:(id)a4
{
  id v6 = a4;
  char v7 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  uint64_t v8 = [v7 _deviceApplicationSceneHandleForDisplayItem:v6];

  return v8;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v115 = a3;
  id v5 = a4;
  char v6 = [v5 isInterrupted];
  v118 = v5;
  char v7 = [v5 toLayoutState];
  v119 = [v118 fromLayoutState];
  v117 = [v115 windowScene];
  int v116 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v117];
  uint64_t v8 = [v118 error];

  if (v8)
  {
    id v121 = v119;

    uint64_t v9 = [v117 layoutStateProvider];
    [v9 setLayoutState:v121];

    uint64_t v10 = [v117 layoutStateProvider];
    [v10 setPreviousLayoutState:v121];
  }
  else
  {
    id v121 = v7;
  }
  uint64_t v120 = [v118 applicationTransitionContext];
  v114 = [v120 request];
  uint64_t v111 = [v114 source];
  id v11 = [v120 previousLayoutState];
  v113 = [v11 appLayout];

  id v12 = [v120 previousLayoutState];
  v112 = [v12 floatingAppLayout];

  uint64_t v13 = [v120 layoutState];
  v127 = [v13 appLayout];

  uint64_t v14 = [v120 layoutState];
  v126 = [v14 floatingAppLayout];

  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id v15 = [v113 allItems];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v160 objects:v169 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v161;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v161 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v160 + 1) + 8 * i);
        if (([v127 containsItem:v19] & 1) == 0
          && [(NSMutableSet *)self->_liveDisplayItemsBeingTerminated containsObject:v19])
        {
          [(NSMutableSet *)self->_liveDisplayItemsBeingTerminated removeObject:v19];
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v160 objects:v169 count:16];
    }
    while (v16);
  }

  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v20 = [v112 allItems];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v156 objects:v168 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v157;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v157 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void *)(*((void *)&v156 + 1) + 8 * j);
        if (([v126 containsItem:v24] & 1) == 0
          && [(NSMutableSet *)self->_liveDisplayItemsBeingTerminated containsObject:v24])
        {
          [(NSMutableSet *)self->_liveDisplayItemsBeingTerminated removeObject:v24];
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v156 objects:v168 count:16];
    }
    while (v21);
  }

  if ((v6 & 1) == 0)
  {
    uint64_t v25 = [v119 unlockedEnvironmentMode];
    int v26 = [v119 isFloatingSwitcherVisible];
    uint64_t v27 = [v121 unlockedEnvironmentMode];
    char v28 = [v121 isFloatingSwitcherVisible];
    uint64_t v29 = [v119 bundleIDShowingAppExpose];
    if (v29)
    {
      BOOL v30 = 0;
    }
    else
    {
      id v31 = [v121 bundleIDShowingAppExpose];
      BOOL v30 = v31 != 0;
    }
    uint64_t v125 = [v120 request];
    uint64_t v32 = [v119 peekConfiguration];
    BOOL IsValid = SBPeekConfigurationIsValid([v121 peekConfiguration]);
    BOOL v34 = IsValid;
    BOOL v35 = IsValid && !SBPeekConfigurationIsValid(v32);
    if (v27 == 2) {
      char v36 = 1;
    }
    else {
      char v36 = v28;
    }
    if (v36)
    {
      if (v27 == 2)
      {
        id v37 = (void *)[(NSMutableArray *)self->_servicesRemovedWhileAwayFromSwitcher copy];
        [(NSMutableArray *)self->_servicesRemovedWhileAwayFromSwitcher removeAllObjects];
        long long v154 = 0u;
        long long v155 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        id v38 = v37;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v152 objects:v167 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v153;
          do
          {
            for (uint64_t k = 0; k != v39; ++k)
            {
              if (*(void *)v153 != v40) {
                objc_enumerationMutation(v38);
              }
              id v42 = [*(id *)(*((void *)&v152 + 1) + 8 * k) bundleIdentifier];
              uint64_t v43 = +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:v42];

              v44 = [(SBMainSwitcherControllerCoordinator *)self _appLayoutFromPrimaryLayoutItem:v43 sideLayoutElement:0 configuration:1];
              id v45 = objc_alloc_init(SBSwitcherModelRemovalRequest);
              v46 = +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction];
              [(SBSwitcherModelRemovalRequest *)v45 setAction:v46 forAppLayout:v44];

              uint64_t v47 = [(SBMainSwitcherControllerCoordinator *)self _switcherModelRemovalResultsForRequest:v45 forReason:0];
              [(SBMainSwitcherControllerCoordinator *)self _performSceneDestructionForModelRemovalResults:v47];
            }
            uint64_t v39 = [v38 countByEnumeratingWithState:&v152 objects:v167 count:16];
          }
          while (v39);
        }

        pid_hibernate();
        uint64_t v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v48 postNotificationName:@"SBUIAppSwitcherRevealedNotification" object:0];

        goto LABEL_61;
      }
    }
    else
    {
      if ((!v30 || v111 != 33 && v111 != 51) && !v34)
      {
        [(SBMainSwitcherControllerCoordinator *)self _releaseKeyboardFocus];
        [(SBMainSwitcherControllerCoordinator *)self _focusNewlyAddedApplicationIfNeededTransitioningFromLayoutState:v119 toLayoutState:v121 windowScene:v117];
      }
      if (v35)
      {
        uint64_t v49 = [v117 homeScreenController];
        uint64_t v50 = v49;
        if (v49)
        {
          id v51 = v49;
        }
        else
        {
          id v51 = +[SBUIController sharedInstance];
        }
        uint64_t v52 = v51;
        long long v53 = [v51 window];
        [v53 makeKeyWindow];
      }
      if (v25 == 2) {
        int v54 = 1;
      }
      else {
        int v54 = v26;
      }
      if (v54 == 1)
      {
        long long v55 = [(SBAppSwitcherModel *)self->_mainSwitcherModel _recentAppLayoutsController];
        [v55 _persistSoon];
      }
      long long v56 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v117];
      objc_msgSend(v56, "_updateContentViewInterfaceOrientation:", objc_msgSend(v121, "interfaceOrientation"));
    }
    id v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 postNotificationName:@"SBUIAppSwitcherObscuredNotification" object:0];
LABEL_61:

    if ([v121 unlockedEnvironmentMode] == 3)
    {
      long long v57 = [v121 appLayout];
      long long v58 = [v117 switcherController];
      long long v59 = [v58 contentViewController];

      if (v57)
      {
        if ([v59 shouldAddAppLayoutToFront:v57 forTransitionWithContext:v120 transitionCompleted:1])
        {
          if ([v57 environment] == 1)
          {
            appLayouts = self->_appLayouts;
            v150[0] = MEMORY[0x1E4F143A8];
            v150[1] = 3221225472;
            v150[2] = __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
            v150[3] = &unk_1E6AF4B60;
            id v151 = v57;
            long long v61 = [(NSArray *)appLayouts bs_firstObjectPassingTest:v150];
          }
          else
          {
            long long v61 = 0;
          }
          [(SBMainSwitcherControllerCoordinator *)self _addAppLayoutToFront:v57 removeAppLayout:v61];
        }
        long long v62 = [v121 elements];
        BOOL v63 = [v62 count] == 0;

        if (!v63)
        {
          [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
          if (![(NSArray *)self->_appLayouts containsObject:v57])
          {
            v110 = [MEMORY[0x1E4F28B00] currentHandler];
            [v110 handleFailureInMethod:a2 object:self file:@"SBMainSwitcherControllerCoordinator.m" lineNumber:1001 description:@"The appLayouts array MUST contain the app layout we're transitioning to."];
          }
        }
      }
      long long v64 = [v121 floatingAppLayout];
      if (v64
        && ([v121 isFloatingSwitcherVisible] & 1) == 0
        && [v59 shouldAddAppLayoutToFront:v64 forTransitionWithContext:v120 transitionCompleted:1])
      {
        [(SBMainSwitcherControllerCoordinator *)self _addAppLayoutToFront:v64];
      }
    }
    long long v65 = [MEMORY[0x1E4F1CA80] set];
    if ([v121 unlockedEnvironmentMode] == 3 || objc_msgSend(v121, "unlockedEnvironmentMode") == 2)
    {
      long long v66 = [v121 appLayout];
      v147[0] = MEMORY[0x1E4F143A8];
      v147[1] = 3221225472;
      v147[2] = __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2;
      v147[3] = &unk_1E6AFA810;
      v147[4] = self;
      id v67 = v116;
      id v148 = v67;
      id v68 = v65;
      id v149 = v68;
      [v66 enumerate:v147];

      uint64_t v69 = [v121 floatingAppLayout];
      v144[0] = MEMORY[0x1E4F143A8];
      v144[1] = 3221225472;
      v144[2] = __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_3;
      v144[3] = &unk_1E6AFA810;
      v144[4] = self;
      id v145 = v67;
      id v146 = v68;
      [v69 enumerate:v144];
    }
    v70 = [MEMORY[0x1E4F1CA80] set];
    v71 = [MEMORY[0x1E4F1CA80] set];
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    obuint64_t j = v65;
    uint64_t v72 = [obj countByEnumeratingWithState:&v140 objects:v166 count:16];
    if (v72)
    {
      uint64_t v124 = *(void *)v141;
      do
      {
        for (uint64_t m = 0; m != v72; ++m)
        {
          if (*(void *)v141 != v124) {
            objc_enumerationMutation(obj);
          }
          uint64_t v74 = *(void *)(*((void *)&v140 + 1) + 8 * m);
          long long v136 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          v75 = [v125 applicationContext];
          v76 = [v75 entities];

          uint64_t v77 = [v76 countByEnumeratingWithState:&v136 objects:v165 count:16];
          if (v77)
          {
            uint64_t v78 = *(void *)v137;
            do
            {
              for (uint64_t n = 0; n != v77; ++n)
              {
                if (*(void *)v137 != v78) {
                  objc_enumerationMutation(v76);
                }
                uint64_t v80 = *(void **)(*((void *)&v136 + 1) + 8 * n);
                if ([v80 isAnalogousToEntity:v74])
                {
                  [v70 addObject:v74];
                  [v71 addObject:v80];
                }
              }
              uint64_t v77 = [v76 countByEnumeratingWithState:&v136 objects:v165 count:16];
            }
            while (v77);
          }
        }
        uint64_t v72 = [obj countByEnumeratingWithState:&v140 objects:v166 count:16];
      }
      while (v72);
    }

    [obj minusSet:v70];
    [obj unionSet:v71];
    [(SBSwitcherCaptureApplicationActivationWatchdog *)self->_captureApplicationWatchdog foregroundWorkspaceEntitiesUpdatedTo:obj];
  }
  [(SBMainSwitcherControllerCoordinator *)self _evaluateAsynchronousRenderingEnablement];
  v81 = [v118 error];
  if (v81)
  {
  }
  else
  {
    BOOL v82 = [v119 elements];
    BOOL v83 = [v121 elements];
    char v84 = [v82 isEqualToSet:v83];

    if ((v84 & 1) == 0)
    {
      BOOL v85 = self;
      if (!self->_preventSupplementalSnapshotsAssertion)
      {
        uint64_t v86 = [v117 sceneManager];
        uint64_t v87 = (objc_class *)objc_opt_class();
        uint64_t v88 = NSStringFromClass(v87);
        v89 = [v86 preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:v88];
        preventSupplementalSnapshotsAssertiouint64_t n = self->_preventSupplementalSnapshotsAssertion;
        self->_preventSupplementalSnapshotsAssertiouint64_t n = v89;

        BOOL v85 = self;
      }
      objc_initWeak(&location, v85);
      [(BSAbsoluteMachTimer *)self->_preventSupplementalSnapshotsInvalidationTimer invalidate];
      v91 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBMainSwitcherCoordinator.preventSupplementalSnapshotsInvalidationTimer"];
      preventSupplementalSnapshotsInvalidationTimer = self->_preventSupplementalSnapshotsInvalidationTimer;
      self->_preventSupplementalSnapshotsInvalidationTimer = v91;

      v93 = self->_preventSupplementalSnapshotsInvalidationTimer;
      [(SBAppSwitcherSettings *)self->_settings preventMedusaSnapshotsAfterTransitionDuration];
      double v95 = v94;
      id v96 = MEMORY[0x1E4F14428];
      v133[0] = MEMORY[0x1E4F143A8];
      v133[1] = 3221225472;
      v133[2] = __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_4;
      v133[3] = &unk_1E6AF5838;
      objc_copyWeak(&v134, &location);
      [(BSAbsoluteMachTimer *)v93 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v133 queue:v95 handler:0.0];

      objc_destroyWeak(&v134);
      objc_destroyWeak(&location);
    }
  }
  [(UIApplicationSceneDeactivationAssertion *)self->_deactivatingScenesResignActiveAssertion relinquish];
  deactivatingScenesResignActiveAssertiouint64_t n = self->_deactivatingScenesResignActiveAssertion;
  self->_deactivatingScenesResignActiveAssertiouint64_t n = 0;

  if ([v121 unlockedEnvironmentMode] == 1
    && [v119 unlockedEnvironmentMode] == 3
    && v111 != 71)
  {
    v98 = [v119 appLayout];
    if (v98)
    {
      v99 = [(SBSwitcherModelRemovalResults *)self->_activeTransitionModelRemovalResults appLayouts];
      char v100 = [v99 containsObject:v98];

      if ((v100 & 1) == 0 && !SBPeekConfigurationIsValid([v121 peekConfiguration]))
      {
        [v98 allItems];
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        id v101 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v102 = [v101 countByEnumeratingWithState:&v129 objects:v164 count:16];
        if (v102)
        {
          uint64_t v103 = *(void *)v130;
          while (2)
          {
            for (iuint64_t i = 0; ii != v102; ++ii)
            {
              if (*(void *)v130 != v103) {
                objc_enumerationMutation(v101);
              }
              v105 = [(SBAppSwitcherModel *)self->_mainSwitcherModel appLayoutContainingDisplayItem:*(void *)(*((void *)&v129 + 1) + 8 * ii) includingHiddenAppLayouts:0];
              uint64_t v106 = [v105 preferredDisplayOrdinal];
              LODWORD(v106) = v106 == [v98 preferredDisplayOrdinal];

              if (!v106)
              {

                goto LABEL_118;
              }
            }
            uint64_t v102 = [v101 countByEnumeratingWithState:&v129 objects:v164 count:16];
            if (v102) {
              continue;
            }
            break;
          }
        }

        [(SBMainSwitcherControllerCoordinator *)self _addAppLayoutToFront:v98];
      }
    }
LABEL_118:
    v107 = [v119 floatingAppLayout];
    if (v107)
    {
      v108 = [(SBSwitcherModelRemovalResults *)self->_activeTransitionModelRemovalResults appLayouts];
      char v109 = [v108 containsObject:v107];

      if ((v109 & 1) == 0) {
        [(SBMainSwitcherControllerCoordinator *)self _addAppLayoutToFront:v107];
      }
    }
  }
  if ([v116 windowManagementStyle]) {
    [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
  }
  [(SBMainSwitcherControllerCoordinator *)self _updateHomeScreenDisplayLayoutElementForLayoutState:v121 switcherController:v116];
  [(SBMainSwitcherControllerCoordinator *)self _endDisplayLayoutTransitionForSwitcherController:v116];
}

- (id)_embeddedDisplaySwitcherController
{
  uint64_t v3 = [(id)SBApp windowSceneManager];
  uint64_t v4 = [v3 embeddedDisplayWindowScene];

  id v5 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v4];

  return v5;
}

- (id)switcherControllerForWindowScene:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__SBMainSwitcherControllerCoordinator_switcherControllerForWindowScene___block_invoke;
  v8[3] = &unk_1E6AFC3C8;
  id v9 = v4;
  id v5 = v4;
  char v6 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerPassingTest:v8];

  return v6;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v103 = a3;
  id v105 = a4;
  v110 = [v105 toLayoutState];
  char v109 = [v105 fromLayoutState];
  v107 = [v103 windowScene];
  v108 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v107];
  if ([v110 isMeaningfullyDifferentFromLayoutState:v109]) {
    [(NSMapTable *)self->_lastMeaningfullyDifferentLayoutStatesByWindowScene setObject:v109 forKey:v107];
  }
  id v115 = [v105 applicationTransitionContext];
  uint64_t v106 = [v115 request];
  char v100 = [v109 appLayout];
  id v101 = [v110 appLayout];
  uint64_t v104 = [v106 source];
  uint64_t v99 = [v110 unlockedEnvironmentMode];
  id v5 = [v110 elements];
  if ([v5 count]) {
    BOOL v6 = v99 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v97 = v6;

  int v98 = [v110 isFloatingSwitcherVisible];
  BOOL v7 = [v109 unlockedEnvironmentMode] != 2;
  uint64_t v8 = [v109 elements];
  if ([v8 count]) {
    BOOL v9 = v7;
  }
  else {
    BOOL v9 = 0;
  }
  BOOL v94 = v9;

  uint64_t v10 = [v109 elements];
  if ([v10 count]) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v7;
  }
  BOOL v95 = v11;

  uint64_t v93 = [v106 source];
  id v12 = [v109 bundleIDShowingAppExpose];
  if (v12)
  {
    BOOL v96 = 0;
  }
  else
  {
    uint64_t v13 = [v110 bundleIDShowingAppExpose];
    BOOL v96 = v13 != 0;
  }
  uint64_t v102 = SBMainWorkspaceMapInternalTransitionSourceToExternalTransitionSource([v106 source]);
  [(SBMainSwitcherControllerCoordinator *)self _beginDisplayLayoutTransitionForSwitcherController:v108 reason:v102];
  if (v104 == 70)
  {
    [(SBAppSwitcherModel *)self->_mainSwitcherModel takeAppLayoutsSnapshot];
    [(SBMainSwitcherControllerCoordinator *)self _takeLayoutStateSnapshotForWindowScene:v107 withPreviousLayoutState:v109];
  }
  else if (!self->_outstandingAccidentalActivationMitigationTransitionCount)
  {
    [(SBAppSwitcherModel *)self->_mainSwitcherModel clearAppLayoutsSnapshot];
    [(SBMainSwitcherControllerCoordinator *)self _clearLayoutStateSnapshotForWindowScene:v107];
  }
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  obuint64_t j = [v115 entitiesWithRemovalContexts];
  uint64_t v14 = [obj countByEnumeratingWithState:&v146 objects:v155 count:16];
  if (v14)
  {
    int v116 = 0;
    id v117 = 0;
    uint64_t v15 = *(void *)v147;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v147 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        uint64_t v18 = [v115 removalContextForEntity:v17];
        uint64_t v19 = [v17 displayItemRepresentation];
        int64_t v20 = [(SBMainSwitcherControllerCoordinator *)self _switcherDisplayItemRemovalIntentTypeForEntity:v17 removalContext:v18];
        if (v20)
        {
          uint64_t v21 = v116;
          if (!v116) {
            uint64_t v21 = objc_alloc_init(SBSwitcherDisplayItemRemovalResolutionRequest);
          }
          int v116 = v21;
          [(SBSwitcherDisplayItemRemovalResolutionRequest *)v21 setRemovalIntentType:v20 forDisplayItem:v19];
          uint64_t v22 = v117;
          if (!v117)
          {
            uint64_t v22 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          }
          id v117 = v22;
          [v22 setObject:v19 forKey:v17];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v146 objects:v155 count:16];
    }
    while (v14);

    if (!v116)
    {
      int v116 = 0;
      goto LABEL_67;
    }
    obuint64_t j = [(SBMainSwitcherControllerCoordinator *)self _resultsForDisplayItemRemovalResolutionRequest:v116 preferredAppLayoutForRemovalAnimationIfAny:0];
    id v23 = [(SBMainSwitcherControllerCoordinator *)self _switcherModelRemovalResultsForDisplayItemRemovalResolutionRequest:v116];
    activeTransitionModelRemovalResults = self->_activeTransitionModelRemovalResults;
    self->_activeTransitionModelRemovalResults = v23;

    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    uint64_t v25 = [(SBSwitcherModelRemovalResults *)self->_activeTransitionModelRemovalResults appLayouts];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v142 objects:v154 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v143;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v143 != v27) {
            objc_enumerationMutation(v25);
          }
          [(SBSwitcherModelRemovalResults *)self->_activeTransitionModelRemovalResults executeActionForAppLayout:*(void *)(*((void *)&v142 + 1) + 8 * j)];
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v142 objects:v154 count:16];
      }
      while (v26);
    }

    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v117 = v117;
    uint64_t v112 = [v117 countByEnumeratingWithState:&v138 objects:v153 count:16];
    if (v112)
    {
      id v29 = 0;
      uint64_t v111 = *(void *)v139;
      BOOL v30 = v117;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v139 != v111)
          {
            uint64_t v32 = v31;
            objc_enumerationMutation(v30);
            BOOL v30 = v117;
            uint64_t v31 = v32;
          }
          uint64_t v113 = v31;
          uint64_t v33 = *(void *)(*((void *)&v138 + 1) + 8 * v31);
          BOOL v34 = [v30 objectForKey:v33];
          BOOL v35 = [v115 removalContextForEntity:v33];
          char v36 = [obj actionsForDisplayItem:v34];
          long long v136 = 0u;
          long long v137 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          id v37 = v36;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v134 objects:v152 count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v135;
            do
            {
              for (uint64_t k = 0; k != v38; ++k)
              {
                if (*(void *)v135 != v39) {
                  objc_enumerationMutation(v37);
                }
                long long v41 = [*(id *)(*((void *)&v134 + 1) + 8 * k) appLayout];
                id v42 = [(SBSwitcherModelRemovalResults *)self->_activeTransitionModelRemovalResults appLayouts];
                int v43 = [v42 containsObject:v41];

                if (v43)
                {
                  uint64_t v44 = [v35 animationStyle];
                  if ((unint64_t)(v44 - 1) >= 3) {
                    uint64_t v45 = 0;
                  }
                  else {
                    uint64_t v45 = v44;
                  }
                  v46 = [[SBTransitionSwitcherModifierRemovalContext alloc] initWithAnimationStyle:v45 displayItem:v34];
                  if (!v29) {
                    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  }
                  [v29 setObject:v46 forKey:v41];
                }
              }
              uint64_t v38 = [v37 countByEnumeratingWithState:&v134 objects:v152 count:16];
            }
            while (v38);
          }

          uint64_t v31 = v113 + 1;
          BOOL v30 = v117;
        }
        while (v113 + 1 != v112);
        uint64_t v112 = [v117 countByEnumeratingWithState:&v138 objects:v153 count:16];
        BOOL v30 = v117;
      }
      while (v112);
    }
    else
    {
      id v29 = 0;
      BOOL v30 = v117;
    }

    objc_storeStrong((id *)&self->_activeTransitionModelRemovalAppLayoutToRemovalContext, v29);
  }
  else
  {
    int v116 = 0;
    id v117 = 0;
  }

LABEL_67:
  if (v99 == 2) {
    int v47 = 1;
  }
  else {
    int v47 = v98;
  }
  if (v47 != 1)
  {
    BOOL v53 = SBPeekConfigurationIsValid([v109 peekConfiguration])
       && !SBPeekConfigurationIsValid([v110 peekConfiguration]);
    if (!v97)
    {
      if (v104 != 11 && v104 != 12 && v104 != 27 && v94)
      {
        int v54 = [v110 elements];
        long long v55 = [v109 elements];
        if ([v54 isEqual:v55] & 1 | (v93 == 15)
          || ((v53 | [(SBMainSwitcherControllerCoordinator *)self _isPerformingModelTransitionForReplacementAppLayout:v101]) & 1) != 0|| v104 == 52|| v104 == 35)
        {
        }
        else
        {
          v91 = [(SBSwitcherModelRemovalResults *)self->_activeTransitionModelRemovalResults appLayouts];
          char v92 = [v91 containsObject:v100];

          if ((v92 & 1) == 0 && v104 != 63 && v104 != 71) {
            [(SBMainSwitcherControllerCoordinator *)self _addAppLayoutToFront:v100];
          }
        }
      }
      if ([v101 type] != 4)
      {
        long long v56 = [v108 contentViewController];
        long long v57 = [v56 bestAppSuggestion];
        if (v57)
        {
          long long v58 = +[SBAppSuggestionManager sharedInstance];
          [v58 noteNotActivatingForAppSuggestion:v57 fromSource:1];
        }
      }
    }
    uint64_t v59 = [v109 peekConfiguration];
    BOOL v60 = SBPeekConfigurationIsValid([v110 peekConfiguration]) && !SBPeekConfigurationIsValid(v59);
    if (v96 && (v104 == 33 || v104 == 51))
    {
      [(SBMainSwitcherControllerCoordinator *)self _lockKeyboardFocusForSwitcherController:v108];
      if (!v60) {
        goto LABEL_108;
      }
    }
    else
    {
      if (!v60)
      {
LABEL_108:
        int v65 = 0;
        BOOL v62 = 0;
        goto LABEL_109;
      }
      [(SBMainSwitcherControllerCoordinator *)self _lockKeyboardFocusForSwitcherController:v108];
    }
    long long v61 = [v101 itemForLayoutRole:1];
    BOOL v62 = v61 != 0;

    BOOL v63 = [v101 itemForLayoutRole:1];
    if (v63) {
      BOOL v64 = 1;
    }
    else {
      BOOL v64 = v100 == 0;
    }
    int v65 = !v64;

LABEL_109:
    long long v66 = +[SBDefaults localDefaults];
    id v67 = [v66 appSwitcherDefaults];

    if (v62)
    {
      if ([v67 shouldShowSplitPeekEducation])
      {
        [v67 setShouldShowSplitPeekEducation:0];
        [v108 setIdleTouchAwarenessClientEnabled:0];
        [v108 _presentMedusaEducationBanner];
LABEL_119:
        id v68 = [(SBMainSwitcherControllerCoordinator *)self suspendWallpaperAnimationAssertion];
        [v68 invalidate];

        [(SBMainSwitcherControllerCoordinator *)self setSuspendWallpaperAnimationAssertion:0];
        goto LABEL_120;
      }
      if ((v65 & 1) == 0)
      {
LABEL_118:
        [v108 setIdleTouchAwarenessClientEnabled:1];
        goto LABEL_119;
      }
    }
    else if (!v65)
    {
      if (v53) {
        [v108 _invalidateMedusaEducationBannerTimer];
      }
      goto LABEL_119;
    }
    if ([v67 shouldShowSlideOverPeekEducation])
    {
      [v67 setShouldShowSlideOverPeekEducation:0];
      [v108 setIdleTouchAwarenessClientEnabled:0];
      [v108 _presentMedusaEducationBanner];
      goto LABEL_119;
    }
    goto LABEL_118;
  }
  if (v99 == 2)
  {
    uint64_t v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v48 postNotificationName:@"SBUIAppSwitcherWillRevealNotification" object:0];
  }
  uint64_t v49 = +[SBReachabilityManager sharedInstance];
  [v49 deactivateReachability];

  [(SBMainSwitcherControllerCoordinator *)self _lockKeyboardFocusForSwitcherController:v108];
  uint64_t v50 = [(SBMainSwitcherControllerCoordinator *)self suspendWallpaperAnimationAssertion];
  [v50 invalidate];

  id v51 = +[SBWallpaperController sharedInstance];
  uint64_t v52 = [v51 suspendWallpaperAnimationForReason:@"kSBAppSwitcherWallpaperAnimationDisablingReason"];
  [(SBMainSwitcherControllerCoordinator *)self setSuspendWallpaperAnimationAssertion:v52];

  [(SBMainSwitcherControllerCoordinator *)self _updateBestAppSuggestion];
LABEL_120:
  if (([v115 animationDisabled] & 1) == 0)
  {
    uint64_t v69 = [MEMORY[0x1E4F1CA80] set];
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    v70 = [v109 elements];
    uint64_t v71 = [v70 countByEnumeratingWithState:&v130 objects:v151 count:16];
    if (v71)
    {
      uint64_t v72 = *(void *)v131;
      do
      {
        for (uint64_t m = 0; m != v71; ++m)
        {
          if (*(void *)v131 != v72) {
            objc_enumerationMutation(v70);
          }
          uint64_t v74 = [*(id *)(*((void *)&v130 + 1) + 8 * m) uniqueIdentifier];
          [v69 addObject:v74];
        }
        uint64_t v71 = [v70 countByEnumeratingWithState:&v130 objects:v151 count:16];
      }
      while (v71);
    }

    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    v75 = [v110 elements];
    uint64_t v76 = [v75 countByEnumeratingWithState:&v126 objects:v150 count:16];
    if (v76)
    {
      uint64_t v77 = *(void *)v127;
      do
      {
        for (uint64_t n = 0; n != v76; ++n)
        {
          if (*(void *)v127 != v77) {
            objc_enumerationMutation(v75);
          }
          id v79 = [*(id *)(*((void *)&v126 + 1) + 8 * n) uniqueIdentifier];
          [v69 removeObject:v79];
        }
        uint64_t v76 = [v75 countByEnumeratingWithState:&v126 objects:v150 count:16];
      }
      while (v76);
    }

    if ([v69 count])
    {
      if (v104 == 11) {
        uint64_t v80 = 0;
      }
      else {
        uint64_t v80 = 5;
      }
      v81 = +[SBSceneManagerCoordinator sharedInstance];
      BOOL v82 = [v81 sceneDeactivationManager];
      BOOL v83 = (UIApplicationSceneDeactivationAssertion *)[v82 newAssertionWithReason:v80];
      deactivatingScenesResignActiveAssertiouint64_t n = self->_deactivatingScenesResignActiveAssertion;
      self->_deactivatingScenesResignActiveAssertiouint64_t n = v83;

      BOOL v85 = self->_deactivatingScenesResignActiveAssertion;
      v124[0] = MEMORY[0x1E4F143A8];
      v124[1] = 3221225472;
      v124[2] = __112__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke;
      v124[3] = &unk_1E6AF9A10;
      id v125 = v69;
      [(UIApplicationSceneDeactivationAssertion *)v85 acquireWithPredicate:v124 transitionContext:0];
    }
  }
  [v108 _updateDisplayLayoutElementForLayoutState:v110];
  if (v104 != 11 && (v95 || v94 && !v97 && v100 != v101)) {
    objc_msgSend(v108, "_updateContentViewInterfaceOrientation:", objc_msgSend(v110, "interfaceOrientation"));
  }
  uint64_t v120 = 0;
  id v121 = &v120;
  uint64_t v122 = 0x2020000000;
  char v123 = 0;
  uint64_t v86 = [v115 applicationSceneEntities];
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __112__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke_2;
  v119[3] = &unk_1E6AF5B90;
  v119[4] = &v120;
  [v86 enumerateObjectsUsingBlock:v119];

  if (*((unsigned char *)v121 + 24))
  {
    uint64_t v87 = +[SBWallpaperController sharedInstance];
    [v87 activateOrientationSource:1];
  }
  else
  {
    uint64_t v87 = +[SBWallpaperController sharedInstance];
    [v87 deactivateOrientationSource:1];
  }

  [(SBMainSwitcherControllerCoordinator *)self _evaluateAsynchronousRenderingEnablement];
  uint64_t v88 = [MEMORY[0x1E4F42B00] sharedHUDService];
  [v88 dismissOrCancelHUDPresentationIfNeeded];

  v89 = [v107 layoutStateProvider];
  [v89 setLayoutState:v110];

  v90 = [v107 layoutStateProvider];
  [v90 setPreviousLayoutState:v109];

  [(SBMainSwitcherControllerCoordinator *)self _updateHomeScreenDisplayLayoutElementForLayoutState:v110 switcherController:v108];
  _Block_object_dispose(&v120, 8);
}

- (void)_updateHomeScreenDisplayLayoutElementForLayoutState:(id)a3 switcherController:(id)a4
{
  id v12 = a4;
  homeScreenDisplayLayoutElementAssertionsBySwitcherController = self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController;
  id v7 = a3;
  uint64_t v8 = [(NSMapTable *)homeScreenDisplayLayoutElementAssertionsBySwitcherController objectForKey:v12];
  BOOL v9 = [v12 windowScene];
  int v10 = [v7 effectivelyRepresentsHomeScreen];

  if (v10)
  {
    if (!v8)
    {
      BOOL v11 = [v9 displayLayoutPublisher];
      uint64_t v8 = [v11 addElement:self->_homeScreenDisplayLayoutElement];

      [(NSMapTable *)self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController setObject:v8 forKey:v12];
    }
  }
  else
  {
    [v8 invalidate];
    [(NSMapTable *)self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController removeObjectForKey:v12];
  }
}

- (void)switcherContentController:(id)a3 setCacheAsynchronousRenderingSurfaces:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  asynchronousRenderingCachedSurfacesReasons = self->_asynchronousRenderingCachedSurfacesReasons;
  if (!asynchronousRenderingCachedSurfacesReasons)
  {
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    BOOL v9 = self->_asynchronousRenderingCachedSurfacesReasons;
    self->_asynchronousRenderingCachedSurfacesReasons = v8;

    asynchronousRenderingCachedSurfacesReasons = self->_asynchronousRenderingCachedSurfacesReasons;
  }
  uint64_t v10 = [(NSHashTable *)asynchronousRenderingCachedSurfacesReasons count];
  BOOL v11 = self->_asynchronousRenderingCachedSurfacesReasons;
  if (v4) {
    [(NSHashTable *)v11 addObject:v6];
  }
  else {
    [(NSHashTable *)v11 removeObject:v6];
  }
  NSUInteger v12 = [(NSHashTable *)self->_asynchronousRenderingCachedSurfacesReasons count];
  uint64_t v13 = +[SBDefaults localDefaults];
  uint64_t v14 = [v13 miscellaneousDefaults];
  int v15 = [v14 disableAsyncRenderingSurfaceRetention];

  if (v15)
  {
    uint64_t v16 = SBLogAppSwitcher();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "disableAsyncRenderingSurfaceRetention default is set, not allowing async surface retention.", (uint8_t *)buf, 2u);
    }

    if (!v10) {
      goto LABEL_17;
    }
LABEL_16:
    objc_initWeak(buf, self);
    [(BSAbsoluteMachTimer *)self->_disableCachingAsynchronousRenderingSurfacesTimer invalidate];
    disableCachingAsynchronousRenderingSurfacesTimer = self->_disableCachingAsynchronousRenderingSurfacesTimer;
    self->_disableCachingAsynchronousRenderingSurfacesTimer = 0;

    int64_t v20 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBMainSwitcherCoordinator.disableCachingAsynchronousRenderingSurfacesTimer"];
    uint64_t v21 = self->_disableCachingAsynchronousRenderingSurfacesTimer;
    self->_disableCachingAsynchronousRenderingSurfacesTimer = v20;

    uint64_t v22 = self->_disableCachingAsynchronousRenderingSurfacesTimer;
    [(SBAppSwitcherSettings *)self->_settings asynchronousRenderingDisableSurfaceCacheDelayDuration];
    double v24 = v23;
    uint64_t v25 = MEMORY[0x1E4F14428];
    id v26 = MEMORY[0x1E4F14428];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __103__SBMainSwitcherControllerCoordinator_switcherContentController_setCacheAsynchronousRenderingSurfaces___block_invoke;
    v27[3] = &unk_1E6AF5838;
    objc_copyWeak(&v28, buf);
    [(BSAbsoluteMachTimer *)v22 scheduleWithFireInterval:v25 leewayInterval:v27 queue:v24 handler:0.0];

    objc_destroyWeak(&v28);
    objc_destroyWeak(buf);
    goto LABEL_17;
  }
  if ((v10 == 0) != (v12 != 0)) {
    goto LABEL_17;
  }
  if (!v12) {
    goto LABEL_16;
  }
  [(BSAbsoluteMachTimer *)self->_disableCachingAsynchronousRenderingSurfacesTimer invalidate];
  uint64_t v17 = self->_disableCachingAsynchronousRenderingSurfacesTimer;
  self->_disableCachingAsynchronousRenderingSurfacesTimer = 0;

  uint64_t v18 = SBLogAppSwitcher();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "Enabled caching asynchronous rendering surfaces.", (uint8_t *)buf, 2u);
  }

  CARenderServerSetCacheAsynchronousSurfaces();
LABEL_17:
}

- (BSInvalidatable)suspendWallpaperAnimationAssertion
{
  return self->_suspendWallpaperAnimationAssertion;
}

- (void)setSuspendWallpaperAnimationAssertion:(id)a3
{
}

- (void)_clearLayoutStateSnapshotForWindowScene:(id)a3
{
  [(NSMapTable *)self->_previousLayoutStatesByWindowScene removeObjectForKey:a3];
  if (![(NSMapTable *)self->_previousLayoutStatesByWindowScene count])
  {
    previousLayoutStatesByWindowScene = self->_previousLayoutStatesByWindowScene;
    self->_previousLayoutStatesByWindowScene = 0;
  }
}

- (void)_beginDisplayLayoutTransitionForSwitcherController:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 windowScene];
  BOOL v9 = [v8 displayLayoutPublisher];
  uint64_t v10 = [v9 transitionAssertionWithReason:v7];

  BOOL v11 = [(NSMapTable *)self->_displayLayoutTransitionsBySwitcherController objectForKey:v6];
  if (v11)
  {
    NSUInteger v12 = SBLogAppSwitcher();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBMainSwitcherControllerCoordinator _beginDisplayLayoutTransitionForSwitcherController:reason:]((uint64_t)self, (uint64_t)v7, v12);
    }

    [v11 invalidate];
  }
  [(NSMapTable *)self->_displayLayoutTransitionsBySwitcherController setObject:v10 forKey:v6];
}

- (void)_endDisplayLayoutTransitionForSwitcherController:(id)a3
{
  displayLayoutTransitionsBySwitcherController = self->_displayLayoutTransitionsBySwitcherController;
  id v5 = a3;
  id v6 = [(NSMapTable *)displayLayoutTransitionsBySwitcherController objectForKey:v5];
  [(NSMapTable *)self->_displayLayoutTransitionsBySwitcherController removeObjectForKey:v5];

  [v6 invalidate];
}

- (void)_releaseKeyboardFocus
{
  [(BSInvalidatable *)self->_lockKeyboardFocusAssertion invalidate];
  lockKeyboardFocusAssertiouint64_t n = self->_lockKeyboardFocusAssertion;
  self->_lockKeyboardFocusAssertiouint64_t n = 0;
}

- (void)_focusNewlyAddedApplicationIfNeededTransitioningFromLayoutState:(id)a3 toLayoutState:(id)a4 windowScene:(id)a5
{
  id v60 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v60 elementWithRole:3];
  BOOL v11 = [v60 elementWithRole:4];
  NSUInteger v12 = [v8 elementWithRole:3];
  uint64_t v13 = [v8 elementWithRole:4];
  char v14 = BSEqualObjects();
  int v15 = BSEqualObjects();
  if (!v15 || (v14 & 1) == 0)
  {
    if (v15) {
      BOOL v30 = v12;
    }
    else {
      BOOL v30 = v13;
    }
    uint64_t v31 = [v30 workspaceEntity];
    uint64_t v18 = [v31 applicationSceneEntity];

    uint64_t v32 = [v18 sceneHandle];
    uint64_t v19 = [v32 sceneIfExists];

    uint64_t v33 = [v19 settings];
    int v34 = [v33 isForeground];

    if (!v34) {
      goto LABEL_31;
    }
    int64_t v20 = +[SBWorkspace mainWorkspace];
    BOOL v35 = [v20 keyboardFocusController];
    [v35 userFocusRequestForScene:v19 reason:@"floating or center app is foreground" completion:0];
    goto LABEL_29;
  }
  uint64_t v16 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v9];
  int v17 = [v16 isChamoisWindowingUIEnabled];

  if (!v17) {
    goto LABEL_32;
  }
  uint64_t v18 = [v60 appLayout];
  uint64_t v19 = [v8 appLayout];
  int64_t v20 = [v19 allItems];
  if (![v20 count]) {
    goto LABEL_30;
  }
  uint64_t v59 = v9;
  uint64_t v21 = [v18 allItems];
  uint64_t v22 = objc_msgSend(v20, "sb_arrayByRemovingObjects:", v21);

  long long v57 = v22;
  long long v58 = v20;
  if ([v22 count] != 1)
  {
    if ([v22 count])
    {
      char v36 = [v19 zOrderedItems];
      id v28 = [v36 firstObject];

      id v29 = v28;
      if (v28)
      {
        if (!SBLayoutRoleIsValidForSplitView([v19 layoutRoleForItem:v28]))
        {
          int v54 = 0;
          id v28 = 0;
          goto LABEL_25;
        }
        uint64_t v45 = [v59 sceneManager];
        id v51 = (void *)MEMORY[0x1E4F62A60];
        long long v55 = [v28 uniqueIdentifier];
        id v37 = [v51 identityForIdentifier:v55];
        uint64_t v48 = [v45 existingSceneHandleForSceneIdentity:v37];

        id v29 = v28;
        id v28 = [v48 sceneIfExists];
        uint64_t v27 = v48;
        uint64_t v38 = @"added multiple apps to stage";
        goto LABEL_21;
      }
    }
    else
    {
      if (![v19 isEqual:v18])
      {
        int v54 = 0;
        id v28 = 0;
        goto LABEL_26;
      }
      uint64_t v39 = [v19 zOrderedItems];
      id v28 = [v39 firstObject];

      id v29 = v28;
      if (v28)
      {
        v46 = [v59 sceneManager];
        uint64_t v52 = (void *)MEMORY[0x1E4F62A60];
        long long v56 = [v28 uniqueIdentifier];
        uint64_t v40 = [v52 identityForIdentifier:v56];
        uint64_t v49 = [v46 existingSceneHandleForSceneIdentity:v40];

        id v29 = v28;
        id v28 = [v49 sceneIfExists];
        uint64_t v27 = v49;
        uint64_t v38 = @"update top most app on existing stage";
LABEL_21:
        int v54 = v38;
        goto LABEL_22;
      }
    }
    int v54 = 0;
    goto LABEL_25;
  }
  uint64_t v50 = [v22 firstObject];
  uint64_t v23 = objc_msgSend(v19, "layoutRoleForItem:");
  if (SBLayoutRoleIsValidForSplitView(v23))
  {
    BOOL v53 = [v8 elementWithRole:v23];
    double v24 = [v53 workspaceEntity];
    uint64_t v25 = [v24 applicationSceneEntity];

    id v26 = [v25 sceneHandle];
    uint64_t v47 = [v26 sceneIfExists];

    uint64_t v27 = v25;
    int v54 = @"added single app to stage";
    id v28 = (void *)v47;
    id v29 = (void *)v50;
LABEL_22:

    goto LABEL_25;
  }
  int v54 = 0;
  id v28 = 0;
  id v29 = (void *)v50;
LABEL_25:

LABEL_26:
  long long v41 = [v28 settings];
  int v42 = [v41 isForeground];

  if (v42)
  {
    int v43 = +[SBWorkspace mainWorkspace];
    uint64_t v44 = [v43 keyboardFocusController];
    [v44 userFocusRequestForScene:v28 reason:v54 completion:0];
  }
  BOOL v35 = v57;
  int64_t v20 = v58;
  id v9 = v59;
LABEL_29:

LABEL_30:
LABEL_31:

LABEL_32:
}

- (void)updateWindowVisibilityForSwitcherContentController:(id)a3
{
  id v4 = a3;
  id v5 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:v4];
  [v5 updateWindowVisibilityForSwitcherContentController:v4];
}

- (void)updateUserInteractionEnabledForSwitcherContentController:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isUserInteractionEnabled];
  id v7 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:v4];

  id v6 = [v7 switcherWindow];
  objc_msgSend(v6, "bs_setHitTestingDisabled:", v5 ^ 1u);
}

- (id)currentCoordinatedLayoutStateTransitionContext
{
  return self->_currentCoordinatedLayoutStateTransitionContext;
}

- (id)switcherContentController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7
{
  return [(SBMainSwitcherControllerCoordinator *)self transitionEventForContext:a4 identifier:a5 phase:a6 animated:a7];
}

- (id)appLayoutsForSwitcherContentController:(id)a3
{
  id v4 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  int v5 = [(SBMainSwitcherControllerCoordinator *)self appLayoutsForSwitcherController:v4];

  return v5;
}

- (id)appLayoutsForSwitcherController:(id)a3
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = self->_appLayouts;
  char v92 = self;
  if (SBFIsChamoisWindowingUIAvailable())
  {
    currentWindowingModeCompatibleAppLayoutsByWindowScene = self->_currentWindowingModeCompatibleAppLayoutsByWindowScene;
    id v7 = [v4 windowScene];
    id v8 = [(NSMapTable *)currentWindowingModeCompatibleAppLayoutsByWindowScene objectForKey:v7];

    if (v8)
    {
      id v9 = v8;

      int v5 = v9;
    }
  }
  if ([(NSMapTable *)self->_switcherControllersByWindowScene count] == 1)
  {
    BOOL v95 = v5;
  }
  else
  {
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    uint64_t v10 = self->_switcherControllersByWindowScene;
    uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v127 objects:v138 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v128;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v128 != v13) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v127 + 1) + 8 * i) isContinuityDisplayWindowScene])
          {
            int v15 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v12 = [(NSMapTable *)v10 countByEnumeratingWithState:&v127 objects:v138 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    int v15 = 0;
LABEL_17:

    uint64_t v16 = [v4 windowScene];
    int v17 = v16;
    if (v15
      && (([v16 isMainDisplayWindowScene] & 1) != 0
       || [v17 isContinuityDisplayWindowScene]))
    {
      BOOL v95 = v5;
    }
    else
    {
      v89 = v17;
      if ([v17 isMainDisplayWindowScene])
      {
        uint64_t v18 = [(NSMapTable *)v92->_switcherControllersByWindowScene keyEnumerator];
        uint64_t v19 = [v18 allObjects];
        int64_t v20 = objc_msgSend(v19, "bs_filter:", &__block_literal_global_348);

        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v123 objects:v137 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v124;
          uint64_t v25 = -1;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v124 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v27 = [*(id *)(*((void *)&v123 + 1) + 8 * j) layoutStateProvider];
              id v28 = [v27 layoutState];
              v25 &= ~(1 << [v28 displayOrdinal]);
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v123 objects:v137 count:16];
          }
          while (v23);
        }
        else
        {
          uint64_t v25 = -1;
        }
      }
      else
      {
        id v21 = [v4 layoutState];
        uint64_t v25 = 1 << [v21 displayOrdinal];
      }

      BOOL v95 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v29 = v5;
      uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v119 objects:v136 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v120;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v120 != v32) {
              objc_enumerationMutation(v29);
            }
            int v34 = *(void **)(*((void *)&v119 + 1) + 8 * k);
            if (((1 << [v34 preferredDisplayOrdinal]) & (unint64_t)~v25) == 0) {
              [(NSArray *)v95 addObject:v34];
            }
          }
          uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v119 objects:v136 count:16];
        }
        while (v31);
      }
      v90 = v5;
      v91 = v4;

      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      obuint64_t j = v92->_draggingAppLayouts;
      uint64_t v35 = [(NSCountedSet *)obj countByEnumeratingWithState:&v115 objects:v135 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v116;
        do
        {
          uint64_t v38 = 0;
          uint64_t v93 = v36;
          do
          {
            if (*(void *)v116 != v37) {
              objc_enumerationMutation(obj);
            }
            uint64_t v39 = *(void **)(*((void *)&v115 + 1) + 8 * v38);
            uint64_t v40 = [v39 itemForLayoutRole:1];
            v113[0] = MEMORY[0x1E4F143A8];
            v113[1] = 3221225472;
            v113[2] = __71__SBMainSwitcherControllerCoordinator_appLayoutsForSwitcherController___block_invoke_2;
            v113[3] = &unk_1E6B006C8;
            id v41 = v40;
            id v114 = v41;
            if (([(NSArray *)v95 bs_containsObjectPassingTest:v113] & 1) == 0)
            {
              int v42 = [(NSMapTable *)v92->_switcherControllersByWindowScene objectEnumerator];
              int v43 = [v42 allObjects];
              v112[0] = MEMORY[0x1E4F143A8];
              v112[1] = 3221225472;
              v112[2] = __71__SBMainSwitcherControllerCoordinator_appLayoutsForSwitcherController___block_invoke_3;
              v112[3] = &unk_1E6AFC3C8;
              v112[4] = v39;
              objc_msgSend(v43, "bs_firstObjectPassingTest:", v112);
              uint64_t v45 = v44 = v37;

              v46 = [(SBMainSwitcherControllerCoordinator *)v92 convertAppLayout:v39 fromSwitcherController:v45 toSwitcherController:v91];
              [(NSArray *)v95 addObject:v46];

              uint64_t v36 = v93;
              uint64_t v37 = v44;
            }

            ++v38;
          }
          while (v36 != v38);
          uint64_t v36 = [(NSCountedSet *)obj countByEnumeratingWithState:&v115 objects:v135 count:16];
        }
        while (v36);
      }

      uint64_t v47 = v92;
      currentCoordinatedLayoutStateTransitionContext = v92->_currentCoordinatedLayoutStateTransitionContext;
      if (currentCoordinatedLayoutStateTransitionContext)
      {
        uint64_t v49 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)currentCoordinatedLayoutStateTransitionContext fromSwitcherController];
        id v4 = v91;
        int v50 = [v91 isEqual:v49];

        int v5 = v90;
        if (v50)
        {
          id v51 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)v92->_currentCoordinatedLayoutStateTransitionContext displayItems];
          uint64_t v52 = (void *)[v51 mutableCopy];

          long long v110 = 0u;
          long long v111 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          BOOL v53 = v95;
          uint64_t v54 = [(NSArray *)v53 countByEnumeratingWithState:&v108 objects:v134 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v109;
            do
            {
              for (uint64_t m = 0; m != v55; ++m)
              {
                if (*(void *)v109 != v56) {
                  objc_enumerationMutation(v53);
                }
                long long v58 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v59 = [*(id *)(*((void *)&v108 + 1) + 8 * m) allItems];
                id v60 = [v58 setWithArray:v59];
                [v52 minusSet:v60];
              }
              uint64_t v55 = [(NSArray *)v53 countByEnumeratingWithState:&v108 objects:v134 count:16];
            }
            while (v55);
          }

          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          id v61 = v52;
          uint64_t v62 = [v61 countByEnumeratingWithState:&v104 objects:v133 count:16];
          uint64_t v47 = v92;
          if (v62)
          {
            uint64_t v63 = v62;
            uint64_t v64 = *(void *)v105;
            do
            {
              for (uint64_t n = 0; n != v63; ++n)
              {
                if (*(void *)v105 != v64) {
                  objc_enumerationMutation(v61);
                }
                uint64_t v66 = *(void *)(*((void *)&v104 + 1) + 8 * n);
                id v67 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)v92->_currentCoordinatedLayoutStateTransitionContext fromAppLayout];
                id v68 = [v67 leafAppLayoutForItem:v66];
                [(NSArray *)v53 addObject:v68];
              }
              uint64_t v63 = [v61 countByEnumeratingWithState:&v104 objects:v133 count:16];
            }
            while (v63);
          }
        }
        uint64_t v69 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)v47->_currentCoordinatedLayoutStateTransitionContext toSwitcherController];
        int v70 = [v91 isEqual:v69];

        if (v70)
        {
          uint64_t v71 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)v47->_currentCoordinatedLayoutStateTransitionContext displayItems];
          uint64_t v72 = (void *)[v71 mutableCopy];

          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          BOOL v95 = v95;
          uint64_t v73 = [(NSArray *)v95 countByEnumeratingWithState:&v100 objects:v132 count:16];
          if (v73)
          {
            uint64_t v74 = v73;
            uint64_t v75 = *(void *)v101;
            do
            {
              for (iuint64_t i = 0; ii != v74; ++ii)
              {
                if (*(void *)v101 != v75) {
                  objc_enumerationMutation(v95);
                }
                uint64_t v77 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v78 = [*(id *)(*((void *)&v100 + 1) + 8 * ii) allItems];
                id v79 = [v77 setWithArray:v78];
                [v72 minusSet:v79];
              }
              uint64_t v74 = [(NSArray *)v95 countByEnumeratingWithState:&v100 objects:v132 count:16];
            }
            while (v74);
          }

          long long v98 = 0u;
          long long v99 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          id v80 = v72;
          uint64_t v81 = [v80 countByEnumeratingWithState:&v96 objects:v131 count:16];
          if (v81)
          {
            uint64_t v82 = v81;
            uint64_t v83 = *(void *)v97;
            do
            {
              for (juint64_t j = 0; jj != v82; ++jj)
              {
                if (*(void *)v97 != v83) {
                  objc_enumerationMutation(v80);
                }
                uint64_t v85 = *(void *)(*((void *)&v96 + 1) + 8 * jj);
                uint64_t v86 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)v92->_currentCoordinatedLayoutStateTransitionContext toAppLayout];
                uint64_t v87 = [v86 leafAppLayoutForItem:v85];
                [(NSArray *)v95 addObject:v87];
              }
              uint64_t v82 = [v80 countByEnumeratingWithState:&v96 objects:v131 count:16];
            }
            while (v82);
          }
        }
      }
      else
      {
        id v4 = v91;
        int v5 = v90;
      }
      int v17 = v89;
    }
  }
  return v95;
}

uint64_t __115__SBMainSwitcherControllerCoordinator__persistenceIdentifiersForBundleIdentifier_onlyIncludeLaunchableIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden];
}

+ (SBMainSwitcherControllerCoordinator)sharedInstance
{
  if ([MEMORY[0x1E4F73138] inUserSessionLoginUI])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__SBMainSwitcherControllerCoordinator_sharedInstance__block_invoke;
    block[3] = &unk_1E6AF56B0;
    block[4] = &v7;
    if (sharedInstance_onceToken_26 != -1) {
      dispatch_once(&sharedInstance_onceToken_26, block);
    }
    if (*((unsigned char *)v8 + 24))
    {
      id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 postNotificationName:@"SBMainSwitcherSwitcherSharedInstanceCreatedNotification" object:a1];
    }
    id v3 = (id)__sharedInstance_2;
    _Block_object_dispose(&v7, 8);
  }
  return (SBMainSwitcherControllerCoordinator *)v3;
}

- (id)recentAppLayouts
{
  return [(SBAppSwitcherModel *)self->_mainSwitcherModel appLayoutsIncludingHiddenAppLayouts:0];
}

- (void)noteKeyboardIsNotForMedusa
{
  id v3 = [(SBMainSwitcherControllerCoordinator *)self _medusaKeyboardSceneHandle];
  [v3 removeObserver:self];

  medusaKeyboardScene = self->_medusaKeyboardScene;
  self->_medusaKeyboardScene = 0;

  [(SBMainSwitcherControllerCoordinator *)self _updateKeyboardHomeAffordanceAssertion];
}

- (id)_medusaKeyboardSceneHandle
{
  id v3 = [(id)SBApp windowSceneManager];
  id v4 = [v3 activeDisplayWindowScene];

  int v5 = [v4 sceneManager];
  id v6 = v5;
  if (self->_medusaKeyboardScene)
  {
    uint64_t v7 = objc_msgSend(v5, "existingSceneHandleForScene:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_updateKeyboardHomeAffordanceAssertion
{
  BOOL v3 = [(SBMainSwitcherControllerCoordinator *)self _shouldTakeKeyboardHomeAffordanceAssertion];
  keyboardHomeAffordanceAssertiouint64_t n = self->_keyboardHomeAffordanceAssertion;
  if (v3)
  {
    if (keyboardHomeAffordanceAssertion) {
      return;
    }
    int v5 = [(id)SBApp windowSceneManager];
    uint64_t v11 = [v5 activeDisplayWindowScene];

    id v6 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v11];
    uint64_t v7 = [v6 switcherWindow];
    id v8 = +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:v7];
    uint64_t v9 = self->_keyboardHomeAffordanceAssertion;
    self->_keyboardHomeAffordanceAssertiouint64_t n = v8;

    char v10 = (SBKeyboardHomeAffordanceAssertion *)v11;
  }
  else
  {
    if (!keyboardHomeAffordanceAssertion) {
      return;
    }
    [(SBKeyboardHomeAffordanceAssertion *)keyboardHomeAffordanceAssertion invalidate];
    char v10 = self->_keyboardHomeAffordanceAssertion;
    self->_keyboardHomeAffordanceAssertiouint64_t n = 0;
  }
}

- (BOOL)_shouldTakeKeyboardHomeAffordanceAssertion
{
  uint64_t v3 = SBFEffectiveHomeButtonType();
  int v4 = [(SBFHomeGrabberSettings *)self->_homeGrabberSettings isEnabled];
  BOOL result = 0;
  if (v3 == 2 && v4)
  {
    if (self->_isKeyboardShowing && self->_medusaKeyboardScene) {
      return ![(SBMainSwitcherControllerCoordinator *)self _keyboardIsSuppressedForMedusaKeyboardScene];
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__SBMainSwitcherControllerCoordinator_keyboardFocusController_externalSceneDidAcquireFocus___block_invoke;
  v7[3] = &unk_1E6B04240;
  id v8 = v5;
  id v6 = v5;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v7];
}

- (void)_buildAppLayoutCache
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  v2 = [(SBAppSwitcherModel *)self->_mainSwitcherModel appLayoutsIncludingHiddenAppLayouts:0];
  uint64_t v71 = (NSArray *)[v2 mutableCopy];

  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  int v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v101 = 0;
  long long v102 = &v101;
  uint64_t v103 = 0x2020000000;
  char v104 = 0;
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke;
  v95[3] = &unk_1E6B04410;
  id v62 = v4;
  id v96 = v62;
  id v8 = v6;
  id v97 = v8;
  id v59 = v5;
  id v98 = v59;
  id v9 = v7;
  id v99 = v9;
  long long v100 = &v101;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v95];
  char v10 = [MEMORY[0x1E4F28E60] indexSet];
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_2;
  v88[3] = &unk_1E6B04438;
  id v56 = v8;
  id v89 = v56;
  BOOL v94 = &v101;
  id v11 = v10;
  id v90 = v11;
  id v57 = v9;
  id v91 = v57;
  char v92 = self;
  id v67 = v3;
  id v93 = v67;
  [(NSArray *)v71 enumerateObjectsUsingBlock:v88];
  [(NSArray *)v71 removeObjectsAtIndexes:v11];
  long long v58 = v11;
  uint64_t v12 = [(SBMainSwitcherControllerCoordinator *)self activeGestureTransaction];
  id v60 = [v12 layoutTransaction];

  uint64_t v13 = objc_opt_class();
  char v14 = [v60 transitionRequest];
  id v61 = SBSafeCast(v13, v14);

  if ([v61 isCrossingDisplays])
  {
    int v15 = [v61 applicationContext];
    uint64_t v16 = [v15 layoutState];
    uint64_t v69 = [v16 appLayout];
  }
  else
  {
    uint64_t v69 = [(NSArray *)v71 firstObject];
  }
  if ([v62 containsObject:v69])
  {
    int v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v62, "count"));
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v18 = v62;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v84 objects:v107 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v85 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          if (([v22 isEqual:v69] & 1) != 0
            || ![v22 containsAnyItemFromAppLayout:v69])
          {
            [v17 addObject:v22];
          }
          else
          {
            v82[0] = MEMORY[0x1E4F143A8];
            v82[1] = 3221225472;
            v82[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_4;
            v82[3] = &unk_1E6AF4B38;
            id v83 = v69;
            uint64_t v23 = [v22 appLayoutWithItemsPassingTest:v82];
            if (v23) {
              [v17 addObject:v23];
            }
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v84 objects:v107 count:16];
      }
      while (v19);
    }

    id v24 = v17;
  }
  else
  {
    id v24 = v62;
  }
  objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v59, v24);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [obj countByEnumeratingWithState:&v78 objects:v106 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v79 != v26) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(void **)(*((void *)&v78 + 1) + 8 * j);
        int v29 = [v28 containsAnyItemFromSet:self->_liveDisplayItemsBeingTerminated];
        if ((([(NSArray *)v71 containsObject:v28] | v29) & 1) == 0
          && !*((unsigned char *)v102 + 24)
          && ([v67 containsObject:v28] & 1) == 0)
        {
          if ([v28 environment] == 1)
          {
            v77[0] = MEMORY[0x1E4F143A8];
            v77[1] = 3221225472;
            v77[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_5;
            v77[3] = &unk_1E6AF9F18;
            v77[4] = v28;
            uint64_t v30 = [(NSArray *)v71 bs_compactMap:v77];
            uint64_t v31 = [v30 mutableCopy];

            uint64_t v32 = (NSArray *)v31;
          }
          else
          {
            uint64_t v32 = v71;
          }
          uint64_t v71 = v32;
          [(NSArray *)v32 insertObject:v28 atIndex:0];
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v78 objects:v106 count:16];
    }
    while (v25);
  }

  uint64_t v33 = +[SBAppSwitcherServiceManager sharedInstance];
  int v34 = [v33 registeredServicesSnapshot];
  switcherServices = self->_switcherServices;
  self->_switcherServices = v34;

  unint64_t v63 = [(SBAppSwitcherServiceSet *)self->_switcherServices count];
  if (v63)
  {
    uint64_t v36 = 0;
    do
    {
      uint64_t v64 = v36;
      uint64_t v37 = -[SBAppSwitcherServiceSet serviceAtIndex:](self->_switcherServices, "serviceAtIndex:");
      uint64_t v38 = [v37 bundleIdentifier];
      int v65 = +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:v38];

      uint64_t v66 = [(SBMainSwitcherControllerCoordinator *)self _appLayoutFromPrimaryLayoutItem:v65 sideLayoutElement:0 configuration:1];
      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      uint64_t v40 = self->_servicesRemovedWhileAwayFromSwitcher;
      uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v73 objects:v105 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v74;
        do
        {
          for (uint64_t k = 0; k != v41; ++k)
          {
            if (*(void *)v74 != v42) {
              objc_enumerationMutation(v40);
            }
            uint64_t v44 = *(void **)(*((void *)&v73 + 1) + 8 * k);
            uint64_t v45 = [v44 bundleIdentifier];
            v46 = [v37 bundleIdentifier];
            int v47 = [v45 isEqualToString:v46];

            if (v47) {
              [v39 addObject:v44];
            }
          }
          uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v73 objects:v105 count:16];
        }
        while (v41);
      }

      [(NSMutableArray *)self->_servicesRemovedWhileAwayFromSwitcher removeObjectsInArray:v39];
      if (v66 && ![(NSArray *)v71 containsObject:v66]) {
        [(NSArray *)v71 insertObject:v66 atIndex:0];
      }

      uint64_t v36 = v64 + 1;
    }
    while (v64 + 1 != v63);
  }
  if (self->_testItemForInsertion)
  {
    unint64_t testItemInsertionIndex = self->_testItemInsertionIndex;
    if (testItemInsertionIndex <= [(NSArray *)v71 count])
    {
      [(NSArray *)v71 removeObject:self->_testItemForInsertion];
      [(NSArray *)v71 insertObject:self->_testItemForInsertion atIndex:self->_testItemInsertionIndex];
    }
  }
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_7;
  v72[3] = &unk_1E6AFA000;
  v72[4] = self;
  uint64_t v49 = [(NSArray *)v71 indexOfObjectPassingTest:v72];
  if (v49 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v49 = [(NSArray *)v71 count];
  }
  int v50 = [(NSMutableDictionary *)self->_appLayoutToEligibleTransientOverlayViewController allKeys];
  id v51 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v49, objc_msgSend(v50, "count"));
  [(NSArray *)v71 insertObjects:v50 atIndexes:v51];

  uint64_t v52 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v49, objc_msgSend(v67, "count"));
  [(NSArray *)v71 insertObjects:v67 atIndexes:v52];

  appLayouts = self->_appLayouts;
  self->_appLayouts = v71;
  uint64_t v54 = v71;

  _Block_object_dispose(&v101, 8);
}

- (void)enumerateSwitcherControllersWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void *, unsigned char *))a3;
  unsigned __int8 v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_switcherControllersByWindowScene;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      char v10 = -[NSMapTable objectForKey:](self->_switcherControllersByWindowScene, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
      v4[2](v4, v10, &v16);
      int v11 = v16;

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __84__SBMainSwitcherControllerCoordinator__notifySwitcherControllersAppLayoutsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 contentViewController];
  [v2 noteAppLayoutsDidChange];
}

- (id)activeGestureTransaction
{
  return self->_activeGestureTransaction;
}

void __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 _currentMainAppLayout];
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    int v4 = *(void **)(a1 + 40);
    id v5 = [v3 allItems];
    [v4 addObjectsFromArray:v5];
  }
  uint64_t v6 = [v10 _currentFloatingAppLayout];
  if (v6)
  {
    [*(id *)(a1 + 48) addObject:v6];
    uint64_t v7 = *(void **)(a1 + 56);
    uint64_t v8 = [v6 allItems];
    [v7 addObjectsFromArray:v8];
  }
  if ([v10 isMainSwitcherVisible])
  {
    uint64_t v9 = [v10 gestureManager];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [v9 isDragAndDropTransactionRunning];
  }
}

void __92__SBMainSwitcherControllerCoordinator_keyboardFocusController_externalSceneDidAcquireFocus___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 contentViewController];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  [v4 noteKeyboardFocusDidChangeToSceneID:v3];
}

void __63__SBMainSwitcherControllerCoordinator__updateBestAppSuggestion__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 contentViewController];
  [v3 setBestAppSuggestion:*(void *)(a1 + 32)];
}

- (id)matchingIconViewForIconView:(id)a3
{
  id v3 = [a3 matchingIconZoomingViewOverlay];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)switcherContentController:(id)a3 supportsTitleItemsForAppLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:v6];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __96__SBMainSwitcherControllerCoordinator_switcherContentController_supportsTitleItemsForAppLayout___block_invoke;
  unsigned __int8 v16 = &unk_1E6AFD168;
  id v9 = v8;
  id v17 = v9;
  uint64_t v18 = &v19;
  [v7 enumerate:&v13];
  if (*((unsigned char *)v20 + 24))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    unint64_t v11 = objc_msgSend(v7, "type", v13, v14, v15, v16);
    if (v11 >= 5) {
      LOBYTE(v10) = 0;
    }
    else {
      unsigned int v10 = (0x19u >> v11) & 1;
    }
  }

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke(id *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = [v3 layoutState];
    uint64_t v7 = [v6 appLayout];
    if (v7) {
      [v5 addObject:v7];
    }
    id v24 = (void *)v7;
    uint64_t v25 = v6;
    uint64_t v8 = [v6 floatingAppLayout];
    if (v8) {
      [v5 addObject:v8];
    }
    uint64_t v23 = (void *)v8;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (objc_msgSend(a1[4], "shouldAddAppLayoutToFront:forTransitionWithContext:transitionCompleted:", v14, v3, 0, v23)&& (objc_msgSend(a1[5], "_isPerformingModelTransitionForReplacementAppLayout:", v14) & 1) == 0)
          {
            if ([a1[6] isChamoisWindowingUIEnabled]
              && [v14 environment] == 1)
            {
              long long v15 = (void *)WeakRetained[6];
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke_2;
              v31[3] = &unk_1E6AF4B60;
              v31[4] = v14;
              unsigned __int8 v16 = objc_msgSend(v15, "bs_firstObjectPassingTest:", v31);
            }
            else
            {
              unsigned __int8 v16 = 0;
            }
            if ([WeakRetained shouldPerformPreTransitionInsertionOfAppLayout:v14 forTransitionWithContext:v3])
            {
              id v17 = a1[4];
              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              v27[2] = __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke_3;
              v27[3] = &unk_1E6AF4E00;
              id v18 = v3;
              id v19 = v9;
              uint64_t v20 = WeakRetained;
              id v28 = v20;
              int v29 = v14;
              id v30 = v16;
              uint64_t v21 = v20;
              id v9 = v19;
              id v3 = v18;
              id v22 = v17;
              uint64_t v12 = v26;
              [v21 _insertAppLayout:v14 atIndex:0 contentViewController:v22 modelMutationBlock:v27 completion:0];
            }
            else
            {
              [WeakRetained _addAppLayoutToFront:v14 removeAppLayout:v16];
            }
          }
          else
          {
            [WeakRetained _rebuildAppListCache];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v11);
    }
  }
}

- (void)switcherControllerViewWillAppear:(id)a3 animated:(BOOL)a4
{
  [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
  [(SBMainSwitcherControllerCoordinator *)self _updateBestAppSuggestion];
}

- (void)_addAppLayoutToFront:(id)a3 removeAppLayout:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(SBMainSwitcherControllerCoordinator *)self _shouldAddAppLayoutToFront:v6]) {
    goto LABEL_21;
  }
  if (!-[SBAppSwitcherSettings shouldDisableSwitcherModelUpdatesForDemo](self->_settings, "shouldDisableSwitcherModelUpdatesForDemo")|| [v6 environment] != 1)
  {
    goto LABEL_18;
  }
  id v19 = v7;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = self->_appLayouts;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v9)
  {
LABEL_12:

LABEL_17:
    id v7 = v19;
    if ([(NSArray *)self->_appLayouts containsObject:v6]) {
      goto LABEL_21;
    }
LABEL_18:
    self->_ignoreModelUpdates = 1;
    if (v7) {
      [(SBAppSwitcherModel *)self->_mainSwitcherModel remove:v7];
    }
    [(SBAppSwitcherModel *)self->_mainSwitcherModel addToFront:v6];
    [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
    self->_ignoreModelUpdates = 0;
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v21;
LABEL_6:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v21 != v11) {
      objc_enumerationMutation(v8);
    }
    uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    long long v15 = [v6 allItems];
    unsigned __int8 v16 = [v14 setWithArray:v15];
    char v17 = [v13 containsAnyItemFromSet:v16];

    if (v17) {
      break;
    }
    if (v10 == ++v12)
    {
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  id v18 = v13;

  if (!v18) {
    goto LABEL_17;
  }
  self->_ignoreModelUpdates = 1;
  id v7 = v19;
  if (v19) {
    [(SBAppSwitcherModel *)self->_mainSwitcherModel remove:v19];
  }
  [(SBAppSwitcherModel *)self->_mainSwitcherModel replaceAppLayout:v18 withAppLayout:v6];
  [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
  self->_ignoreModelUpdates = 0;

LABEL_21:
}

- (void)_rebuildAppListCache
{
  [(SBMainSwitcherControllerCoordinator *)self _buildAppLayoutCache];
  [(SBMainSwitcherControllerCoordinator *)self _rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary];
  [(SBMainSwitcherControllerCoordinator *)self _notifySwitcherControllersAppLayoutsDidChange];
}

- (void)_rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary
{
  if (SBFIsChamoisWindowingUIAvailable())
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__62;
    void v8[4] = __Block_byref_object_dispose__62;
    id v9 = 0;
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3032000000;
    v6[3] = __Block_byref_object_copy__62;
    v6[4] = __Block_byref_object_dispose__62;
    id v7 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __98__SBMainSwitcherControllerCoordinator__rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary__block_invoke;
    v5[3] = &unk_1E6B04460;
    v5[4] = self;
    v5[5] = v6;
    v5[6] = v8;
    [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v5];
    currentWindowingModeCompatibleAppLayoutsByWindowScene = self->_currentWindowingModeCompatibleAppLayoutsByWindowScene;
    if (currentWindowingModeCompatibleAppLayoutsByWindowScene)
    {
      if (![(NSMapTable *)currentWindowingModeCompatibleAppLayoutsByWindowScene count])
      {
        uint64_t v4 = self->_currentWindowingModeCompatibleAppLayoutsByWindowScene;
        self->_currentWindowingModeCompatibleAppLayoutsByWindowScene = 0;
      }
    }
    _Block_object_dispose(v6, 8);

    _Block_object_dispose(v8, 8);
  }
}

- (BOOL)_shouldAddAppLayoutToFront:(id)a3
{
  return [a3 type] == 0;
}

- (void)_notifySwitcherControllersAppLayoutsDidChange
{
}

- (BOOL)shouldPerformPreTransitionInsertionOfAppLayout:(id)a3 forTransitionWithContext:(id)a4
{
  id v6 = a4;
  id v7 = [v6 request];
  unint64_t v8 = [v7 source];
  int64_t v9 = [(SBAppSwitcherSettings *)self->_settings effectiveSwitcherStyle];
  if (v8 == 10 && v9 == 1)
  {
    BOOL v12 = 0;
  }
  else
  {
    if (v8 > 0x33 || ((1 << v8) & 0xC002008000800) == 0)
    {
      uint64_t v4 = [v6 layoutState];
      BOOL v12 = [v4 unlockedEnvironmentMode] == 2;
    }
    else
    {
      BOOL v12 = 0;
    }
    if (v8 > 0x33 || ((1 << v8) & 0xC002008000800) == 0) {
  }
    }
  return v12;
}

- (BOOL)_isPerformingModelTransitionForReplacementAppLayout:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(SBSwitcherModelRemovalResults *)self->_activeTransitionModelRemovalResults appLayouts];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(SBSwitcherModelRemovalResults *)self->_activeTransitionModelRemovalResults replacementAppLayoutForAppLayout:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

void __114__SBMainSwitcherControllerCoordinator_switcherContentController_layoutStateTransitionDidEndWithTransitionContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[SBApplicationController sharedInstance];
  uint64_t v6 = [v4 bundleIdentifier];

  id v12 = [v5 applicationWithBundleIdentifier:v6];

  uint64_t v7 = [MEMORY[0x1E4F62448] sharedInstance];
  uint64_t v8 = [v12 processState];
  int64_t v9 = objc_msgSend(v7, "processForPID:", objc_msgSend(v8, "pid"));

  if ([v9 isRunning])
  {
    uint64_t v10 = [v12 info];
    char v11 = [v9 handle];
    [*(id *)(a1 + 32) _activateBetaLaunchHandlesIfNeededWithAppInfo:v10 processHandle:v11];
    [*(id *)(a1 + 32) _presentStoreKitSheetIfNeededWithAppInfo:v10 processHandle:v11];
    [*(id *)(a1 + 32) _requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo:v10 processHandle:v11];
  }
}

- (void)_requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo:(id)a3 processHandle:(id)a4
{
  id v6 = a4;
  if ([a3 requiresAuthorizationForAutoUpdates])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke;
    v7[3] = &unk_1E6AF4AC0;
    id v8 = v6;
    [(SBMainSwitcherControllerCoordinator *)self _asyncOnStoreAppLaunchUIActivationQueue:v7];
  }
}

- (void)_presentStoreKitSheetIfNeededWithAppInfo:(id)a3 processHandle:(id)a4
{
  id v6 = a4;
  if ([a3 triggersStoreKitMessaging])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __94__SBMainSwitcherControllerCoordinator__presentStoreKitSheetIfNeededWithAppInfo_processHandle___block_invoke;
    v7[3] = &unk_1E6AF4AC0;
    id v8 = v6;
    [(SBMainSwitcherControllerCoordinator *)self _asyncOnStoreAppLaunchUIActivationQueue:v7];
  }
}

- (void)_activateBetaLaunchHandlesIfNeededWithAppInfo:(id)a3 processHandle:(id)a4
{
  id v6 = a4;
  if ([a3 isBeta])
  {
    if (!self->_activeBetaLaunchHandles)
    {
      uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      activeBetaLaunchHandles = self->_activeBetaLaunchHandles;
      self->_activeBetaLaunchHandles = v7;
    }
    int64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FAE1C8]) initWithProcessHandle:v6];
    [v9 setActivationDelegate:self];
    [(NSMutableSet *)self->_activeBetaLaunchHandles addObject:v9];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __99__SBMainSwitcherControllerCoordinator__activateBetaLaunchHandlesIfNeededWithAppInfo_processHandle___block_invoke;
    v11[3] = &unk_1E6AF4AC0;
    id v12 = v9;
    id v10 = v9;
    [(SBMainSwitcherControllerCoordinator *)self _asyncOnStoreAppLaunchUIActivationQueue:v11];
  }
}

void __92__SBMainSwitcherControllerCoordinator_switcherContentController_supportsKillingOfAppLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_deviceApplicationSceneHandleForDisplayItem:");
  if (v6)
  {
    id v8 = v6;
    char v7 = [v6 prefersKillingInSwitcherDisabled] ^ 1;
    id v6 = v8;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

void __120__SBMainSwitcherControllerCoordinator__setContainerStatusBarHidden_animationDuration_usingAssertion_reason_windowScene___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  BOOL v3 = *(unsigned char *)(a1 + 32) == 0;
  id v4 = a2;
  id v5 = [v2 numberWithInt:v3];
  [v4 setAlpha:v5];
}

- (int64_t)switcherInterfaceOrientationForSwitcherContentController:(id)a3
{
  BOOL v3 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  int64_t v4 = [v3 interfaceOrientation];

  return v4;
}

+ (id)_shim_activeSwitcherController
{
  id v2 = [a1 sharedInstanceIfExists];
  BOOL v3 = [v2 _activeDisplaySwitcherController];

  return v3;
}

+ (id)sharedInstanceIfExists
{
  return (id)__sharedInstance_2;
}

- (void)switcherContentController:(id)a3 setWallpaperStyle:(int64_t)a4
{
  switch(a4)
  {
    case 1:
      id v5 = +[SBWallpaperController sharedInstance];
      [v5 removeWallpaperStyleForPriority:3 forVariant:1 withAnimationFactory:0];
      goto LABEL_8;
    case 2:
      uint64_t v4 = 20;
      goto LABEL_7;
    case 3:
      uint64_t v4 = 13;
      goto LABEL_7;
    case 4:
      uint64_t v4 = 2;
      goto LABEL_7;
    default:
      uint64_t v4 = 0;
LABEL_7:
      id v5 = +[SBWallpaperController sharedInstance];
      [v5 setWallpaperStyle:v4 forPriority:3 forVariant:1 withAnimationFactory:0];
LABEL_8:

      return;
  }
}

- (void)switcherContentController:(id)a3 layoutStateTransitionDidEndWithTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_activeTransitionModelRemovalResults)
  {
    -[SBMainSwitcherControllerCoordinator _performSceneDestructionForModelRemovalResults:](self, "_performSceneDestructionForModelRemovalResults:");
    activeTransitionModelRemovalResults = self->_activeTransitionModelRemovalResults;
    self->_activeTransitionModelRemovalResults = 0;
  }
  activeTransitionModelRemovalAppLayoutToRemovalContext = self->_activeTransitionModelRemovalAppLayoutToRemovalContext;
  self->_activeTransitionModelRemovalAppLayoutToRemovalContext = 0;

  uint64_t v10 = objc_opt_class();
  char v11 = [v7 toLayoutState];
  id v12 = SBSafeCast(v10, v11);

  uint64_t v13 = [v7 fromLayoutState];
  if (([v7 isInterrupted] & 1) == 0
    && ([v13 isEqual:v12] & 1) == 0
    && [v12 unlockedEnvironmentMode] == 3)
  {
    long long v14 = [v12 appLayout];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __114__SBMainSwitcherControllerCoordinator_switcherContentController_layoutStateTransitionDidEndWithTransitionContext___block_invoke;
    v16[3] = &unk_1E6AF9EF0;
    v16[4] = self;
    [v14 enumerate:v16];
  }
  long long v15 = [v12 appLayout];
  if (v15) {
    -[SBAppSwitcherModel noteDisplayItemLayoutAttributesMapChangedForAppLayout:displayOrdinal:](self->_mainSwitcherModel, "noteDisplayItemLayoutAttributesMapChangedForAppLayout:displayOrdinal:", v15, [v12 displayOrdinal]);
  }
}

- (void)_updateBestAppSuggestion
{
  BOOL v3 = +[SBAppSuggestionManager sharedInstance];
  uint64_t v4 = [v3 currentSuggestedApp];

  id v5 = [v4 bundleIdentifier];
  if ([(SBMainSwitcherControllerCoordinator *)self _isBestAppSuggestionEligibleForSwitcher:v4])
  {
    id v6 = +[SBApplicationController sharedInstance];
    id v7 = [v6 applicationWithBundleIdentifier:v5];
    if (v7) {
      int v8 = 1;
    }
    else {
      int v8 = [v5 isEqualToString:@"com.apple.Siri"];
    }
  }
  else
  {
    int v8 = 0;
  }
  if (v4) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__SBMainSwitcherControllerCoordinator__updateBestAppSuggestion__block_invoke;
    v10[3] = &unk_1E6B04240;
    id v11 = v4;
    [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v10];
  }
}

- (BOOL)_isBestAppSuggestionEligibleForSwitcher:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v3 = [a3 bundleIdentifier];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)_switcherModelChanged:(id)a3
{
  if (!self->_ignoreModelUpdates) {
    [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
  }
}

uint64_t __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 environment] == 2)
  {
    BOOL v4 = [v3 allItems];
    id v5 = [*(id *)(a1 + 32) allItems];
    uint64_t v6 = [v4 isEqual:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v4 = [*(id *)(a1 + 32) _entityForDisplayItem:a3 switcherController:*(void *)(a1 + 40)];
  if (v4)
  {
    id v5 = v4;
    [*(id *)(a1 + 48) addObject:v4];
    BOOL v4 = v5;
  }
}

- (id)_entityForDisplayItem:(id)a3 switcherController:(id)a4
{
  id v6 = a3;
  id v7 = [a4 windowScene];
  int v8 = [v7 sceneManager];

  BOOL v9 = [v8 displayIdentity];
  uint64_t v10 = [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v6 sceneHandleProvider:v8 displayIdentity:v9];

  return v10;
}

- (id)_entityForDisplayItem:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 bundleIdentifier];
  if (![v9 type] || objc_msgSend(v9, "type") == 5)
  {
    uint64_t v13 = +[SBApplicationController sharedInstance];
    long long v14 = [v13 applicationForDisplayItem:v9];

    long long v15 = [v14 bundleIdentifier];
    BOOL v16 = +[SBAppClipPlaceholderWorkspaceEntity isAppClipUpdateAvailableForBundleIdentifier:v15];

    if (!v14 || v16)
    {
      long long v20 = +[SBApplicationPlaceholderController sharedInstance];
      id v18 = [v20 placeholderForDisplayID:v12];

      if ([v18 isAppClip] | v16)
      {
        long long v21 = [SBAppClipPlaceholderWorkspaceEntity alloc];
        long long v22 = [v9 uniqueIdentifier];
        uint64_t v19 = [(SBAppClipPlaceholderWorkspaceEntity *)v21 initWithBundleIdentifier:v12 futureSceneIdentifier:v22 needsUpdate:v16];
      }
      else
      {
        uint64_t v19 = 0;
      }
    }
    else
    {
      long long v17 = [SBDeviceApplicationSceneEntity alloc];
      id v18 = [v9 uniqueIdentifier];
      uint64_t v19 = [(SBDeviceApplicationSceneEntity *)v17 initWithApplication:v14 uniqueIdentifier:v18 sceneHandleProvider:v10 displayIdentity:v11];
    }

    goto LABEL_13;
  }
  if ([v9 type] == 4)
  {
    long long v14 = [v9 appSuggestion];
    if ([v12 isEqual:@"com.apple.Siri"])
    {
      uint64_t v23 = +[SBWorkspaceEntity entity];
LABEL_26:
      uint64_t v19 = (SBAppClipPlaceholderWorkspaceEntity *)v23;
LABEL_13:

      goto LABEL_14;
    }
    if (![v14 isCallContinuitySuggestion])
    {
      int v29 = +[SBApplicationController sharedInstance];
      uint64_t v27 = [v29 applicationWithBundleIdentifier:v12];

      id v30 = [SBDeviceApplicationSceneEntity alloc];
      uint64_t v31 = [v9 uniqueIdentifier];
      uint64_t v19 = [(SBDeviceApplicationSceneEntity *)v30 initWithApplication:v27 uniqueIdentifier:v31 sceneHandleProvider:v10 displayIdentity:v11];

      goto LABEL_35;
    }
    uint64_t v27 = [(SBMainSwitcherControllerCoordinator *)self _appLayoutContainingDisplayItem:v9];
    if (!v27)
    {
      uint64_t v19 = 0;
      goto LABEL_35;
    }
    uint64_t v28 = [(SBMainSwitcherControllerCoordinator *)self createWorkspaceTransientOverlayForAppLayout:v27];
LABEL_22:
    uint64_t v19 = (SBAppClipPlaceholderWorkspaceEntity *)v28;
LABEL_35:

    goto LABEL_13;
  }
  if ([v9 type] == 3)
  {
    uint64_t v25 = +[SBApplicationController sharedInstance];
    long long v14 = [v25 applicationWithBundleIdentifier:v12];

    uint64_t v26 = [SBDeviceApplicationSceneEntity alloc];
    uint64_t v27 = [v9 uniqueIdentifier];
    uint64_t v28 = [(SBDeviceApplicationSceneEntity *)v26 initWithApplication:v14 uniqueIdentifier:v27 sceneHandleProvider:v10 displayIdentity:v11];
    goto LABEL_22;
  }
  if ([v9 type] == 2)
  {
    long long v14 = [(SBMainSwitcherControllerCoordinator *)self _appLayoutContainingDisplayItem:v9];
    if (v14)
    {
      uint64_t v23 = [(SBMainSwitcherControllerCoordinator *)self createWorkspaceTransientOverlayForAppLayout:v14];
      goto LABEL_26;
    }
LABEL_33:
    uint64_t v19 = 0;
    goto LABEL_13;
  }
  if ([v9 type] == 1)
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 0;
    if ([v9 type] != 7 && v9)
    {
      long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"SBMainSwitcherControllerCoordinator.m" lineNumber:2381 description:@"Unhandled display item type"];
      goto LABEL_33;
    }
  }
LABEL_14:

  return v19;
}

- (id)appSwitcherModel:(id)a3 willAddAppLayout:(id)a4 replacingAppLayouts:(id)a5 removingAppLayouts:(id)a6
{
  id v6 = a4;
  return v6;
}

- (id)switcherControllerForAppLayout:(id)a3
{
  id v4 = a3;
  if ([(NSMapTable *)self->_switcherControllersByWindowScene count] == 1)
  {
    id v5 = [(NSMapTable *)self->_switcherControllersByWindowScene objectEnumerator];
    id v6 = [v5 nextObject];
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__62;
    long long v15 = __Block_byref_object_dispose__62;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__SBMainSwitcherControllerCoordinator_switcherControllerForAppLayout___block_invoke;
    v8[3] = &unk_1E6B04588;
    void v8[4] = self;
    id v9 = v4;
    id v10 = &v11;
    [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void __53__SBMainSwitcherControllerCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  id v2 = [[SBMainSwitcherControllerCoordinator alloc] _init];
  id v3 = (void *)__sharedInstance_2;
  __sharedInstance_2 = (uint64_t)v2;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (id)_init
{
  v57.receiver = self;
  v57.super_class = (Class)SBMainSwitcherControllerCoordinator;
  id v2 = [(SBMainSwitcherControllerCoordinator *)&v57 init];
  if (v2)
  {
    id v3 = objc_alloc_init(SBAppSwitcherModel);
    mainSwitcherModel = v2->_mainSwitcherModel;
    v2->_mainSwitcherModel = v3;

    [(SBAppSwitcherModel *)v2->_mainSwitcherModel setDelegate:v2];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    servicesRemovedWhileAwayFromSwitcher = v2->_servicesRemovedWhileAwayFromSwitcher;
    v2->_servicesRemovedWhileAwayFromSwitcher = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    liveDisplayItemsBeingTerminated = v2->_liveDisplayItemsBeingTerminated;
    v2->_liveDisplayItemsBeingTerminated = (NSMutableSet *)v7;

    uint64_t v9 = +[SBAppSwitcherDomain rootSettings];
    settings = v2->_settings;
    v2->_settings = (SBAppSwitcherSettings *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    coordinatedSwitcherControllers = v2->_coordinatedSwitcherControllers;
    v2->_coordinatedSwitcherControllers = (NSPointerArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    switcherControllersByWindowScene = v2->_switcherControllersByWindowScene;
    v2->_switcherControllersByWindowScene = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    lastMeaningfullyDifferentLayoutStatesByWindowScene = v2->_lastMeaningfullyDifferentLayoutStatesByWindowScene;
    v2->_lastMeaningfullyDifferentLayoutStatesByWindowScene = (NSMapTable *)v15;

    long long v17 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    draggingAppLayouts = v2->_draggingAppLayouts;
    v2->_draggingAppLayouts = v17;

    uint64_t v19 = objc_alloc_init(SBSwitcherDemoFilteringController);
    demoFilteringController = v2->_demoFilteringController;
    v2->_demoFilteringController = v19;

    [(SBSwitcherDemoFilteringController *)v2->_demoFilteringController addObserver:v2];
    long long v21 = [SBSwitcherDemoCommandsServer alloc];
    long long v22 = [(SBAppSwitcherModel *)v2->_mainSwitcherModel _recentAppLayoutsController];
    uint64_t v23 = [(SBSwitcherDemoCommandsServer *)v21 initWithRecentAppLayouts:v22 demoFilteringController:v2->_demoFilteringController];
    demoCommandsServer = v2->_demoCommandsServer;
    v2->_demoCommandsServer = (SBSwitcherDemoCommandsServer *)v23;

    uint64_t v25 = objc_alloc_init(SBApplicationUserQuitMonitorServer);
    userQuitMonitorServer = v2->_userQuitMonitorServer;
    v2->_userQuitMonitorServer = v25;

    [(SBMainSwitcherControllerCoordinator *)v2 _warmAppInfoForAppsInList];
    uint64_t v27 = +[SBWorkspace mainWorkspace];
    uint64_t v28 = [v27 keyboardFocusController];
    keyboardFocusController = v2->_keyboardFocusController;
    v2->_keyboardFocusController = (SBKeyboardFocusControlling *)v28;

    uint64_t v30 = [(SBKeyboardFocusControlling *)v2->_keyboardFocusController addKeyboardFocusObserver:v2];
    keyboardFocusObserver = v2->_keyboardFocusObserver;
    v2->_keyboardFocusObserver = (BSInvalidatable *)v30;

    long long v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recentSwipeUpToKillTimestampsForAppLayouts = v2->_recentSwipeUpToKillTimestampsForAppLayouts;
    v2->_recentSwipeUpToKillTimestampsForAppLayouts = v32;

    long long v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v2 selector:sel__applicationDidExit_ name:@"SBApplicationDidExitNotification" object:0];
    [v34 addObserver:v2 selector:sel__noteUIWillLock name:@"SBLockScreenUIWillLockNotification" object:0];
    [v34 addObserver:v2 selector:sel__noteUIWillLock name:@"SBRestartManagerWillRebootNotification" object:0];
    [v34 addObserver:v2 selector:sel__switcherServiceAdded_ name:@"AppSwitcherServiceAdded" object:0];
    [v34 addObserver:v2 selector:sel__switcherServiceRemoved_ name:@"AppSwitcherServiceRemoved" object:0];
    [v34 addObserver:v2 selector:sel__continuityAppSuggestionChanged_ name:@"SBSuggestedAppChangedNotification" object:0];
    [v34 addObserver:v2 selector:sel__switcherModelChanged_ name:@"SBAppSwitcherModelDidChangeNotification" object:0];
    [v34 addObserver:v2 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];
    [v34 addObserver:v2 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];
    [v34 addObserver:v2 selector:sel__appProtectionHiddenAppsDidChange_ name:@"SBAppProtectionCoordinatorHiddenAppsDidChange" object:0];
    uint64_t v35 = [MEMORY[0x1E4FA5F28] rootSettings];
    homeGrabberSettings = v2->_homeGrabberSettings;
    v2->_homeGrabberSettings = (SBFHomeGrabberSettings *)v35;

    uint64_t v37 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    displayLayoutTransitionsBySwitcherController = v2->_displayLayoutTransitionsBySwitcherController;
    v2->_displayLayoutTransitionsBySwitcherController = (NSMapTable *)v37;

    uint64_t v39 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    homeScreenDisplayLayoutElementAssertionsBySwitcherController = v2->_homeScreenDisplayLayoutElementAssertionsBySwitcherController;
    v2->_homeScreenDisplayLayoutElementAssertionsBySwitcherController = (NSMapTable *)v39;

    id v41 = objc_alloc(MEMORY[0x1E4FA6A68]);
    uint64_t v42 = [v41 initWithIdentifier:*MEMORY[0x1E4FA6F40]];
    homeScreenDisplayLayoutElement = v2->_homeScreenDisplayLayoutElement;
    v2->_homeScreenDisplayLayoutElement = (SBSDisplayLayoutElement *)v42;

    [(SBSDisplayLayoutElement *)v2->_homeScreenDisplayLayoutElement setLayoutRole:1];
    [(SBSDisplayLayoutElement *)v2->_homeScreenDisplayLayoutElement setLevel:0];
    [(SBSDisplayLayoutElement *)v2->_homeScreenDisplayLayoutElement setFillsDisplayBounds:1];
    if (SBFIsChamoisWindowingUIAvailable())
    {
      objc_initWeak(&location, v2);
      uint64_t v44 = +[SBDefaults localDefaults];
      uint64_t v45 = [v44 appSwitcherDefaults];

      v46 = [NSString stringWithUTF8String:"chamoisEverEnabled"];
      uint64_t v47 = MEMORY[0x1E4F14428];
      id v48 = MEMORY[0x1E4F14428];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __44__SBMainSwitcherControllerCoordinator__init__block_invoke;
      v54[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v55, &location);
      uint64_t v49 = [v45 observeDefault:v46 onQueue:v47 withBlock:v54];
      chamoisWindowingUIEverEnabledObserver = v2->_chamoisWindowingUIEverEnabledObserver;
      v2->_chamoisWindowingUIEverEnabledObserver = (BSDefaultObserver *)v49;

      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);
    }
    id v51 = [[SBSwitcherCaptureApplicationActivationWatchdog alloc] initWithDelegate:v2];
    captureApplicationWatchdog = v2->_captureApplicationWatchdog;
    v2->_captureApplicationWatchdog = v51;

    v2->_outstandingAccidentalActivationMitigationTransitionCount = 0;
  }
  return v2;
}

void __44__SBMainSwitcherControllerCoordinator__init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _chamoisWindowingUIEverEnabledDefaultChangeHandler];
}

- (void)dealloc
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(BSDefaultObserver *)self->_chamoisWindowingUIEverEnabledObserver invalidate];
  [(SBSwitcherDemoFilteringController *)self->_demoFilteringController removeObserver:self];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = [(id)SBApp windowSceneManager];
  uint64_t v5 = [v4 connectedWindowScenes];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v32 + 1) + 8 * v9) appInteractionEventSource];
        [v10 removeObserver:self];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController;
  uint64_t v12 = [(NSMapTable *)v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [(NSMapTable *)self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * v15)];
        [v16 invalidate];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMapTable *)v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v13);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v17 = self->_displayLayoutTransitionsBySwitcherController;
  uint64_t v18 = [(NSMapTable *)v17 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = [(NSMapTable *)self->_displayLayoutTransitionsBySwitcherController objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * v21)];
        [v22 invalidate];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMapTable *)v17 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v19);
  }

  [(BSInvalidatable *)self->_keyboardFocusObserver invalidate];
  [(SBKeyboardHomeAffordanceAssertion *)self->_keyboardHomeAffordanceAssertion invalidate];
  [(BSAbsoluteMachTimer *)self->_preventSupplementalSnapshotsInvalidationTimer invalidate];
  [(BSAbsoluteMachTimer *)self->_disableCachingAsynchronousRenderingSurfacesTimer invalidate];
  v23.receiver = self;
  v23.super_class = (Class)SBMainSwitcherControllerCoordinator;
  [(SBMainSwitcherControllerCoordinator *)&v23 dealloc];
}

- (BOOL)isAnySwitcherVisible
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SBMainSwitcherControllerCoordinator_isAnySwitcherVisible__block_invoke;
  v4[3] = &unk_1E6B04090;
  v4[4] = &v5;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __59__SBMainSwitcherControllerCoordinator_isAnySwitcherVisible__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isAnySwitcherVisible];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v4 = [a3 appInteractionEventSource];
  [v4 addObserver:self];
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4 = [a3 appInteractionEventSource];
  [v4 removeObserver:self];
}

- (void)startObservingLayoutStateTransitionCoordinatorForStartupTransition:(id)a3
{
}

- (void)stopObservingLayoutStateTransitionCoordinatorForStartupTransition:(id)a3
{
}

uint64_t __112__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __99__SBMainSwitcherControllerCoordinator__activateBetaLaunchHandlesIfNeededWithAppInfo_processHandle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateIfNeeded];
}

void __94__SBMainSwitcherControllerCoordinator__presentStoreKitSheetIfNeededWithAppInfo_processHandle___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F4BCE0] sharedInstance];
  [v2 presentSheetIfNeededForProcessHandle:*(void *)(a1 + 32) completion:&__block_literal_global_193];
}

void __94__SBMainSwitcherControllerCoordinator__presentStoreKitSheetIfNeededWithAppInfo_processHandle___block_invoke_2(uint64_t a1, char a2)
{
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __94__SBMainSwitcherControllerCoordinator__presentStoreKitSheetIfNeededWithAppInfo_processHandle___block_invoke_2_cold_1(a2, v3);
  }
}

void __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F4BD00] defaultService];
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke_2;
  v4[3] = &unk_1E6AFC6D0;
  id v5 = v3;
  [v2 requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:v5 completion:v4];
}

void __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (void)_asyncOnStoreAppLaunchUIActivationQueue:(id)a3
{
  id v7 = a3;
  if (!self->_storeAppLaunchUIActivationQueue)
  {
    uint64_t v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.springboard.activateStoreAppLaunchUI", 0);
    storeAppLaunchUIActivationQueue = self->_storeAppLaunchUIActivationQueue;
    self->_storeAppLaunchUIActivationQueue = v4;
  }
  uint64_t v6 = (void *)BSDispatchBlockCreateWithQualityOfService();
  dispatch_async((dispatch_queue_t)self->_storeAppLaunchUIActivationQueue, v6);
}

- (CGAffineTransform)switcherContentController:(SEL)a3 transformForCardUnderSheetForBoundsSize:(id)a4
{
  double height = a5.height;
  double width = a5.width;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  char v8 = [(SBMainSwitcherControllerCoordinator *)self _centerWindowSheetMetricsCache];
  if (v8)
  {
    id v10 = v8;
    objc_msgSend(v8, "transformForCardUnderSheetForBoundsSize:", width, height);
    char v8 = v10;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (id)_centerWindowSheetMetricsCache
{
  sheetMetricsCache = self->_sheetMetricsCache;
  if (!sheetMetricsCache)
  {
    uint64_t v4 = objc_alloc_init(SBFluidSwitcherSheetMetricsCache);
    id v5 = self->_sheetMetricsCache;
    self->_sheetMetricsCache = v4;

    sheetMetricsCache = self->_sheetMetricsCache;
  }
  return sheetMetricsCache;
}

void __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) _entityForDisplayItem:a3 switcherController:*(void *)(a1 + 40)];
  if (v4)
  {
    id v5 = v4;
    [*(id *)(a1 + 48) addObject:v4];
    uint64_t v4 = v5;
  }
}

void __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    [WeakRetained[39] invalidate];
    id v2 = v4[39];
    v4[39] = 0;

    [v4[38] invalidate];
    id v3 = v4[38];
    v4[38] = 0;

    id WeakRetained = v4;
  }
}

- (void)watchdog:(id)a3 requestsTerminationOf:(id)a4 forReason:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [v11 applicationSceneEntity];

  uint64_t v13 = [v12 sceneHandle];
  uint64_t v14 = [v13 sceneIfExists];
  uint64_t v15 = [v14 clientHandle];

  if (v15)
  {
    id v16 = [v15 processHandle];
    if (v16)
    {
      long long v17 = [MEMORY[0x1E4F96430] predicateMatchingIdentifier:v16];
      id v18 = objc_alloc(MEMORY[0x1E4F96488]);
      uint64_t v19 = [NSString stringWithFormat:@"Capture Application Requirements Unmet: \"%@\"", v7];
      uint64_t v20 = (void *)[v18 initWithExplanation:v19];

      [v20 setReportType:1];
      [v20 setMaximumTerminationResistance:40];
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F96490]) initWithPredicate:v17 context:v20];
      long long v22 = SBLogCaptureApplication();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v23 = [v16 bundle];
        long long v24 = [v23 identifier];
        *(_DWORD *)buf = 138543618;
        id v32 = v24;
        __int16 v33 = 2114;
        id v34 = v7;
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Unlocked capture watchdog requesting termination of \"%{public}@\" for reason: \"%{public}@\"", buf, 0x16u);
      }
      id v30 = 0;
      char v25 = [v21 execute:&v30];
      id v26 = v30;
      if ((v25 & 1) == 0)
      {
        long long v27 = SBLogCaptureApplication();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v26;
          _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "Unlocked capture watchdog failed to terminate the process: \"%@\"", buf, 0xCu);
        }
      }
      long long v28 = +[SBCaptureApplicationCenter sharedInstance];
      long long v29 = [v16 name];
      [v28 promptLaunchTerminationAlertIfNecessaryForProcess:v29 afterDelay:v7 reason:1.0];
    }
  }
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_preventSupplementalSnapshotsAssertion)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    uint64_t v8 = [(SBMainSwitcherControllerCoordinator *)self _activeDisplaySwitcherController];
    id v9 = [v8 layoutState];

    id v10 = [v9 elements];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __74__SBMainSwitcherControllerCoordinator_eventSource_userTouchedApplication___block_invoke;
    id v16 = &unk_1E6B040B8;
    id v17 = v7;
    id v18 = &v19;
    [v10 enumerateObjectsUsingBlock:&v13];

    if (*((unsigned char *)v20 + 24))
    {
      [(BSSimpleAssertion *)self->_preventSupplementalSnapshotsAssertion invalidate];
      preventSupplementalSnapshotsAssertiouint64_t n = self->_preventSupplementalSnapshotsAssertion;
      self->_preventSupplementalSnapshotsAssertiouint64_t n = 0;

      [(BSAbsoluteMachTimer *)self->_preventSupplementalSnapshotsInvalidationTimer invalidate];
      preventSupplementalSnapshotsInvalidationTimer = self->_preventSupplementalSnapshotsInvalidationTimer;
      self->_preventSupplementalSnapshotsInvalidationTimer = 0;
    }
    _Block_object_dispose(&v19, 8);
  }
}

void __74__SBMainSwitcherControllerCoordinator_eventSource_userTouchedApplication___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 workspaceEntity];
  id v6 = [v5 applicationSceneEntity];
  id v7 = [v6 application];
  uint64_t v8 = [v7 bundleIdentifier];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)eventSource:(id)a3 userDeletedWebBookmark:(id)a4
{
  id v10 = a4;
  id v5 = [v10 webClip];
  if ([v5 isAppClip])
  {
    id v6 = [v10 webClip];
    id v7 = [v6 applicationBundleIdentifier];

    [(SBMainSwitcherControllerCoordinator *)self _deleteAppLayoutsMatchingBundleIdentifier:v7];
  }
  else
  {
    uint64_t v8 = [v5 identifier];
    int v9 = +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:v8];
    id v7 = +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:v9];

    [(SBMainSwitcherControllerCoordinator *)self deleteAppLayoutForDisplayItem:v7];
  }
}

- (id)animationControllerForTransitionRequest:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 set];
  id v7 = [(SBMainSwitcherControllerCoordinator *)self animationControllerForTransitionRequest:v5 ancillaryTransitionRequests:v6];

  return v7;
}

uint64_t __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 environment] == 2)
  {
    uint64_t v4 = [v3 allItems];
    id v5 = [*(id *)(a1 + 32) allItems];
    uint64_t v6 = [v4 isEqual:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addAppLayoutToFront:*(void *)(a1 + 40) removeAppLayout:*(void *)(a1 + 48)];
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4 windowScene:(id)a5
{
  id v8 = a4;
  int v9 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:a5];
  id v10 = [v9 contentViewController];
  uint64_t v11 = [v9 windowManagementStyle];
  int v12 = [v10 canPerformKeyboardShortcutAction:a3 forBundleIdentifier:v8];

  switch(a3)
  {
    case 4:
    case 5:
    case 6:
    case 9:
    case 10:
    case 15:
    case 16:
      if (v12)
      {
        uint64_t v13 = +[SBWorkspace mainWorkspace];
        LOBYTE(v12) = [v13 isMedusaCapable];
      }
      break;
    case 11:
    case 13:
    case 14:
      BOOL v14 = v11 == 1;
      goto LABEL_6;
    case 18:
      BOOL v14 = v11 == 2;
LABEL_6:
      if (v14) {
        char v15 = v12;
      }
      else {
        char v15 = 0;
      }
      if (v8) {
        LOBYTE(v12) = v15;
      }
      break;
    default:
      break;
  }

  return v12;
}

- (void)performKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4 windowScene:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  int v9 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v8];
  id v10 = [v9 contentViewController];
  uint64_t v11 = v10;
  switch(a3)
  {
    case 0:
      [v9 toggleMainSwitcherWithSource:51 animated:1];
      break;
    case 1:
      int v12 = @"KeyboardShortcutActivateNextSwitcherSpace";
      uint64_t v13 = self;
      uint64_t v14 = 0;
      uint64_t v15 = 1;
      goto LABEL_9;
    case 2:
      int v12 = @"KeyboardShortcutActivateNextSwitcherSpace";
      uint64_t v13 = self;
      uint64_t v14 = 1;
      uint64_t v15 = 1;
      goto LABEL_11;
    case 3:
    case 11:
    case 13:
    case 14:
    case 18:
      if (!v17) {
        goto LABEL_2;
      }
      [(SBMainSwitcherControllerCoordinator *)self _handleFocusedIconSwitcherShortcutAction:a3 bundleIdentifier:v17 windowScene:v8];
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 12:
    case 15:
    case 16:
    case 17:
    case 19:
    case 20:
LABEL_2:
      [v10 performKeyboardShortcutAction:a3];
      break;
    case 9:
      int v12 = @"KeyboardShortcutActivateNextFloatingApp";
      uint64_t v13 = self;
      uint64_t v14 = 1;
      uint64_t v15 = 2;
LABEL_9:
      uint64_t v16 = 1;
      goto LABEL_12;
    case 10:
      int v12 = @"KeyboardShortcutActivatePreviousFloatingApp";
      uint64_t v13 = self;
      uint64_t v14 = 1;
      uint64_t v15 = 2;
LABEL_11:
      uint64_t v16 = 0;
LABEL_12:
      [(SBMainSwitcherControllerCoordinator *)v13 _activateNeighboringAppLayoutRequiringActiveAppLayout:v14 appLayoutEnvironment:v15 inForwardDirection:v16 windowScene:v8 eventLabel:v12];
      break;
    default:
      break;
  }
}

- (void)_handleFocusedIconSwitcherShortcutAction:(int64_t)a3 bundleIdentifier:(id)a4 windowScene:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v50 = [v9 sceneManager];
  id v10 = +[SBApplicationController sharedInstance];
  uint64_t v11 = [v10 applicationWithBundleIdentifier:v8];

  int v12 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v9];
  uint64_t v13 = v12;
  uint64_t v14 = 0;
  id v48 = v8;
  uint64_t v49 = v11;
  if (a3 <= 12)
  {
    id v17 = v12;
    if (a3 == 3)
    {
      id v23 = v8;
      uint64_t v14 = 0;
      uint64_t v18 = 0;
      char v22 = 0;
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v18 = 0;
      id v23 = 0;
      char v22 = 0;
      uint64_t v21 = 0;
      if (a3 == 11)
      {
        long long v24 = [SBDeviceApplicationSceneEntity alloc];
        char v25 = [v50 displayIdentity];
        uint64_t v21 = [(SBDeviceApplicationSceneEntity *)v24 initWithApplication:v49 sceneHandleProvider:v50 displayIdentity:v25];

        char v22 = +[SBWorkspaceEntity entity];
        uint64_t v14 = 0;
        uint64_t v18 = 0;
LABEL_34:
        id v23 = 0;
      }
    }
  }
  else
  {
    if ((unint64_t)(a3 - 13) < 2)
    {
      uint64_t v15 = [v12 _currentLayoutState];
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
        uint64_t v16 = 14;
      }
      else {
        uint64_t v16 = 13;
      }
      if ([v15 unlockedEnvironmentMode] == 1)
      {
        id v17 = v13;
        if (v16 == a3) {
          uint64_t v18 = 2;
        }
        else {
          uint64_t v18 = 3;
        }
        uint64_t v19 = [SBDeviceApplicationSceneEntity alloc];
        uint64_t v20 = [v50 displayIdentity];
        uint64_t v21 = [(SBDeviceApplicationSceneEntity *)v19 initWithApplication:v11 sceneHandleProvider:v50 displayIdentity:v20];

        char v22 = +[SBWorkspaceEntity entity];
        uint64_t v14 = 0;
      }
      else
      {
        v46 = v15;
        long long v28 = [v13 activeAndVisibleSceneIdentifiersForApplication:v11];
        long long v29 = [v11 info];
        id v30 = v11;
        int v31 = [v29 supportsMultiwindow];

        if (v31) {
          [v50 sceneIdentityForApplication:v30 targetContentIdentifier:0 allowCanMatches:0 preferNewScene:1 visibleIdentifiers:v28];
        }
        else {
        uint64_t v21 = [v50 sceneIdentityForApplication:v30 excludingIdentifiers:v28];
        }
        uint64_t v47 = v21;
        if (v21)
        {
          uint64_t v44 = v28;
          uint64_t v45 = v13;
          id v32 = [v13 layoutState];
          __int16 v33 = [SBDeviceApplicationSceneEntity alloc];
          id v34 = [(SBDeviceApplicationSceneEntity *)v21 identifier];
          uint64_t v35 = [v50 displayIdentity];
          uint64_t v21 = [(SBDeviceApplicationSceneEntity *)v33 initWithApplication:v30 uniqueIdentifier:v34 sceneHandleProvider:v50 displayIdentity:v35];

          if (v16 == a3)
          {
            uint64_t v36 = [v32 elementWithRole:2];

            uint64_t v15 = v46;
            if (v36)
            {
              char v22 = +[SBWorkspaceEntity entity];
              uint64_t v14 = 0;
            }
            else
            {
              char v22 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:1];
              uint64_t v14 = 3;
            }
            long long v28 = v44;
            uint64_t v13 = v45;
          }
          else
          {
            uint64_t v37 = +[SBWorkspaceEntity entity];
            uint64_t v38 = [v32 elementWithRole:2];

            if (v38) {
              uint64_t v14 = 0;
            }
            else {
              uint64_t v14 = 3;
            }
            char v22 = v21;
            uint64_t v21 = (SBDeviceApplicationSceneEntity *)v37;
            uint64_t v13 = v45;
            uint64_t v15 = v46;
            long long v28 = v44;
          }
        }
        else
        {
          uint64_t v14 = 0;
          char v22 = 0;
          uint64_t v15 = v46;
        }
        id v17 = v13;

        uint64_t v18 = 0;
      }

      goto LABEL_34;
    }
    id v17 = v12;
    uint64_t v18 = 0;
    id v23 = 0;
    char v22 = 0;
    uint64_t v21 = 0;
    if (a3 == 18)
    {
      id v26 = [SBDeviceApplicationSceneEntity alloc];
      long long v27 = [v50 displayIdentity];
      uint64_t v21 = [(SBDeviceApplicationSceneEntity *)v26 initWithApplication:v49 sceneHandleProvider:v50 displayIdentity:v27];

      uint64_t v14 = 0;
      uint64_t v18 = 0;
      id v23 = 0;
      char v22 = 0;
    }
  }
  uint64_t v39 = +[SBWorkspace mainWorkspace];
  uint64_t v40 = [v9 _fbsDisplayConfiguration];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __109__SBMainSwitcherControllerCoordinator__handleFocusedIconSwitcherShortcutAction_bundleIdentifier_windowScene___block_invoke;
  v51[3] = &unk_1E6B04130;
  uint64_t v52 = v21;
  id v53 = v22;
  id v54 = v23;
  int64_t v55 = a3;
  uint64_t v56 = v18;
  uint64_t v57 = v14;
  id v41 = v23;
  id v42 = v22;
  int v43 = v21;
  [v39 requestTransitionWithOptions:0 displayConfiguration:v40 builder:v51];
}

void __109__SBMainSwitcherControllerCoordinator__handleFocusedIconSwitcherShortcutAction_bundleIdentifier_windowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:51];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __109__SBMainSwitcherControllerCoordinator__handleFocusedIconSwitcherShortcutAction_bundleIdentifier_windowScene___block_invoke_2;
  v4[3] = &unk_1E6B04108;
  uint64_t v8 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 64);
  [v3 modifyApplicationContext:v4];
}

void __109__SBMainSwitcherControllerCoordinator__handleFocusedIconSwitcherShortcutAction_bundleIdentifier_windowScene___block_invoke_2(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1[7] == 18)
  {
    uint64_t v10 = a1[4];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a2;
    id v6 = [v4 arrayWithObjects:&v10 count:1];
    id v7 = +[SBWorkspaceEntity entity];
    uint64_t v8 = +[SBWorkspaceEntity entity];
    [v5 setEntities:v6 withPolicy:1 centerEntity:v7 floatingEntity:v8];

    [v5 _setRequestedFrontmostEntity:a1[4]];
  }
  else
  {
    id v9 = a2;
    [v9 setRequestedUnlockedEnvironmentMode:3];
    [v9 setEntity:a1[4] forLayoutRole:1];
    [v9 setEntity:a1[5] forLayoutRole:2];
    [v9 setRequestedAppExposeBundleID:a1[6]];
    [v9 setRequestedPeekConfiguration:a1[8]];
    [v9 setRequestedSpaceConfiguration:a1[9]];
  }
}

- (void)handleApplicationSceneEntityDestructionIntent:(id)a3 forEntities:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v13 = [(id)SBApp windowSceneManager];
        uint64_t v14 = [v12 sceneHandle];
        uint64_t v15 = [v13 windowSceneForSceneHandle:v14];

        id v16 = [v7 objectForKey:v15];
        if (!v16)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [v7 setObject:v16 forKey:v15];
        }
        [v16 addObject:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v9);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v31 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        char v22 = [v21 _fbsDisplayConfiguration];
        id v23 = [v17 objectForKey:v21];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke;
        v41[3] = &unk_1E6AF67B0;
        id v42 = v23;
        id v43 = v32;
        id v24 = v23;
        char v25 = (void *)MEMORY[0x1D948C7A0](v41);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_3;
        v38[3] = &unk_1E6B041A0;
        id v39 = obj;
        uint64_t v40 = self;
        id v26 = (void *)MEMORY[0x1D948C7A0](v38);
        long long v27 = +[SBWorkspace mainWorkspace];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_9;
        v34[3] = &unk_1E6B04218;
        v34[4] = self;
        v34[5] = v21;
        id v35 = v22;
        id v36 = v26;
        id v37 = v25;
        id v28 = v25;
        id v29 = v22;
        id v30 = v26;
        [v27 requestTransitionWithOptions:0 displayConfiguration:v29 builder:v28 validator:v34];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v19);
  }
}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:34];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_2;
  v4[3] = &unk_1E6AF5638;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 modifyApplicationContext:v4];
}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        unint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "animation", (void)v13);
        if (v10 < 3) {
          unint64_t v11 = v10 + 1;
        }
        else {
          unint64_t v11 = 0;
        }
        int v12 = [[SBWorkspaceEntityRemovalContext alloc] initWithAnimationStyle:v11 removalActionType:1];
        [v3 setRemovalContext:v12 forEntity:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_4;
  v11[3] = &unk_1E6AFB048;
  id v12 = v5;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  [v10 modifyApplicationContext:v11];
}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_4(id *a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)SBApp windowSceneManager];
  id v5 = [a1[4] displayIdentity];
  id v6 = [v4 windowSceneForDisplayIdentity:v5];

  id v7 = [v6 switcherController];
  if (![v7 isChamoisWindowingUIEnabled])
  {
    id v17 = [a1[7] activatingEntity];

    if (v17)
    {
      uint64_t v18 = [a1[7] activatingEntity];
      [v3 setActivatingEntity:v18];
    }
    if ([a1[7] requestedUnlockedEnvironmentMode]) {
      objc_msgSend(v3, "setRequestedUnlockedEnvironmentMode:", objc_msgSend(a1[7], "requestedUnlockedEnvironmentMode"));
    }
    uint64_t v19 = [a1[4] applicationContext];
    uint64_t v8 = [v19 previousLayoutState];

    uint64_t v20 = [a1[4] applicationContext];
    uint64_t v21 = [v20 entitiesWithRemovalContexts];

    char v22 = [v8 elementWithRole:3];
    id v23 = v22;
    if (v22)
    {
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_7;
      v56[3] = &unk_1E6B04178;
      id v24 = v22;
      id v57 = v24;
      if (objc_msgSend(v21, "bs_containsObjectPassingTest:", v56))
      {
        long long v51 = v21;
        id v53 = v6;
        char v25 = (void *)*((void *)a1[6] + 6);
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_8;
        v54[3] = &unk_1E6AF4B60;
        id v55 = v24;
        id v26 = objc_msgSend(v25, "bs_firstObjectPassingTest:", v54);
        long long v27 = v26;
        if (v26)
        {
          id v28 = a1[6];
          id v29 = [v26 itemForLayoutRole:1];
          id v30 = [v53 _fbsDisplayIdentity];
          uint64_t v31 = [v28 _entityForDisplayItem:v29 displayIdentity:v30];
          [v3 setEntity:v31 forLayoutRole:3];
        }
        else
        {
          long long v48 = +[SBWorkspaceEntity entity];
          [v3 setEntity:v48 forLayoutRole:3];
        }
        long long v49 = +[SBWorkspaceEntity entity];
        [v3 setEntity:v49 forLayoutRole:1];

        long long v50 = +[SBWorkspaceEntity entity];
        [v3 setEntity:v50 forLayoutRole:2];

        id v36 = v57;
        uint64_t v21 = v51;
        id v6 = v53;
LABEL_35:

        goto LABEL_36;
      }
    }
    id v32 = [a1[7] sideElement];

    __int16 v33 = [a1[7] primaryElement];
    id v34 = v33;
    if (v32)
    {
      id v35 = [v33 workspaceEntity];
      [v3 setEntity:v35 forLayoutRole:1];

      id v36 = [a1[7] sideElement];
      id v37 = [v36 workspaceEntity];
      [v3 setEntity:v37 forLayoutRole:2];
    }
    else
    {

      if (v34)
      {
        uint64_t v38 = [a1[7] primaryElement];
        id v39 = [v38 workspaceEntity];
        [v3 setEntity:v39 forLayoutRole:1];
      }
      else
      {
        uint64_t v38 = +[SBWorkspaceEntity entity];
        [v3 setEntity:v38 forLayoutRole:1];
      }

      id v36 = +[SBWorkspaceEntity entity];
      [v3 setEntity:v36 forLayoutRole:2];
    }
    goto LABEL_35;
  }
  uint64_t v52 = v6;
  uint64_t v8 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v9 = [v3 previousLayoutState];
  id v10 = [v9 elements];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v61 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v60 + 1) + 8 * i) workspaceEntity];
        long long v16 = [v15 applicationSceneEntity];

        if (([a1[5] containsObject:v16] & 1) == 0) {
          [v8 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v12);
  }

  if (![v8 count])
  {
    id v6 = v52;
    if ([v7 isAdditiveModelEnabled])
    {
      [v3 setEntities:MEMORY[0x1E4F1CBF0] withPolicy:0 centerEntity:0 floatingEntity:0];
      goto LABEL_37;
    }
    uint64_t v21 = [a1[6] appLayoutsForSwitcherController:v7];
    unint64_t v40 = [v21 count];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_6;
    v58[3] = &unk_1E6AFA000;
    id v59 = a1[5];
    uint64_t v41 = [v21 indexOfObjectPassingTest:v58];
    if (v40 < 2 || v41 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v3 setEntities:MEMORY[0x1E4F1CBF0] withPolicy:0 centerEntity:0 floatingEntity:0];
    }
    else
    {
      id v42 = [v21 objectAtIndex:(v40 + v41 + 1) % v40];
      id v43 = [v42 zOrderedItems];
      long long v44 = [v43 firstObject];

      id v45 = a1[6];
      long long v46 = [a1[4] displayIdentity];
      long long v47 = [v45 _entityForDisplayItem:v44 displayIdentity:v46];

      [v3 setActivatingEntity:v47];
    }

LABEL_36:
    goto LABEL_37;
  }
  [v8 sortUsingComparator:&__block_literal_global_172];
  [v3 setEntities:v8 withPolicy:0 centerEntity:0 floatingEntity:0];
  id v6 = v52;
LABEL_37:
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "layoutRole"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 layoutRole];

  id v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "uniqueIdentifier", (void)v11);
        char v9 = [v3 containsItemWithUniqueIdentifier:v8];

        if (v9)
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = BSEqualStrings();

  return v5;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 environment] == 2)
  {
    id v4 = [v3 itemForLayoutRole:1];
    uint64_t v5 = [v4 uniqueIdentifier];
    uint64_t v6 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v7 = BSEqualStrings() ^ 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_9(id *a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 applicationContext];
  uint64_t v5 = [v4 entitiesWithRemovalContexts];

  uint64_t v6 = [v3 applicationContext];
  uint64_t v7 = [v6 previousLayoutState];

  uint64_t v8 = [v7 elements];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_10;
    v62[3] = &unk_1E6B04178;
    id v10 = v7;
    id v63 = v10;
    if (objc_msgSend(v5, "bs_containsObjectPassingTest:", v62))
    {
      long long v11 = [v10 elements];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_11;
      v52[3] = &unk_1E6AF8260;
      long long v12 = v5;
      id v53 = v12;
      long long v13 = objc_msgSend(v11, "bs_filter:", v52);

      long long v14 = [*((id *)a1[4] + 3) objectForKey:a1[5]];
      id v15 = [a1[4] _recentAppLayoutsController];
      uint64_t v16 = +[SBSwitcherWindowReplacementResult windowReplacementResultByRemovingLayoutElements:v12 fromLayoutState:v10 withPrecedingLayoutState:v14 recentAppLayouts:v15];

      if (([v10 isFloatingSwitcherVisible] & 1) != 0
        || [v10 unlockedEnvironmentMode] == 2)
      {
        [v3 setSource:3];
        [v3 setEventLabel:@"PreparationForDisplayItemRemovalRequestWithExpressedIntent"];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_13;
        v49[3] = &unk_1E6AF5638;
        id v50 = v13;
        long long v51 = v12;
        [v3 modifyApplicationContext:v49];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_14;
        v44[3] = &unk_1E6B041F0;
        id v45 = a1[6];
        id v47 = a1[8];
        id v48 = a1[7];
        id v46 = v16;
        id v17 = (id)[v3 addCompletionHandler:v44];
        uint64_t v18 = [a1[5] alertItemsController];
        uint64_t v19 = [a1[5] assistantController];
        if ([v19 isVisible] & 1) != 0 || (objc_msgSend(v18, "hasVisibleSuperModalAlert")) {
          uint64_t v20 = 0;
        }
        else {
          uint64_t v20 = [v18 hasVisibleAlert] ^ 1;
        }
      }
      else
      {
        (*((void (**)(void))a1[7] + 2))();
        uint64_t v20 = 1;
      }

      id v26 = v53;
    }
    else
    {
      id v42 = v7;
      id v43 = v5;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v23 = v5;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v58 objects:v65 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        id v26 = 0;
        uint64_t v27 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v59 != v27) {
              objc_enumerationMutation(v23);
            }
            id v29 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            id v30 = [v3 applicationContext];
            uint64_t v31 = [v30 removalContextForEntity:v29];

            id v32 = [v29 displayItemRepresentation];
            uint64_t v33 = [a1[4] _switcherDisplayItemRemovalIntentTypeForEntity:v29 removalContext:v31];
            if (v33)
            {
              uint64_t v34 = v33;
              if (!v26) {
                id v26 = objc_alloc_init(SBSwitcherDisplayItemRemovalResolutionRequest);
              }
              [(SBSwitcherDisplayItemRemovalResolutionRequest *)v26 setRemovalIntentType:v34 forDisplayItem:v32];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v58 objects:v65 count:16];
        }
        while (v25);
      }
      else
      {
        id v26 = 0;
      }

      id v35 = [a1[4] _switcherModelRemovalResultsForDisplayItemRemovalResolutionRequest:v26];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v36 = [v35 appLayouts];
      uint64_t v37 = [v36 countByEnumeratingWithState:&v54 objects:v64 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v55 != v39) {
              objc_enumerationMutation(v36);
            }
            [v35 executeActionForAppLayout:*(void *)(*((void *)&v54 + 1) + 8 * j)];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v64 count:16];
        }
        while (v38);
      }

      uint64_t v20 = 0;
      uint64_t v7 = v42;
      uint64_t v5 = v43;
    }
  }
  else
  {
    uint64_t v21 = (void (**)(id, id, void *))a1[7];
    char v22 = +[SBSwitcherWindowReplacementResult defaultWindowReplacementResult];
    v21[2](v21, v3, v22);

    uint64_t v20 = 1;
  }

  return v20;
}

BOOL __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  id v4 = [v2 elementWithIdentifier:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_12;
  v8[3] = &unk_1E6B04178;
  id v9 = v3;
  id v5 = v3;
  LODWORD(v4) = objc_msgSend(v4, "bs_containsObjectPassingTest:", v8);
  uint64_t v6 = SBLayoutRoleIsValidForSplitView([v5 layoutRole]) & (v4 ^ 1);

  return v6;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) representsSameLayoutElementAsDescriptor:a2];
}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [v9 workspaceEntity];
        objc_msgSend(v3, "setEntity:forLayoutRole:", v10, objc_msgSend(v9, "layoutRole"));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  [v3 setRequestedUnlockedEnvironmentMode:3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v3, "setRemovalContext:forEntity:", 0, *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_14(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = +[SBWorkspace mainWorkspace];
    uint64_t v4 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_15;
    v6[3] = &unk_1E6B041C8;
    uint64_t v5 = *(void *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 40);
    [v3 requestTransitionWithOptions:0 displayConfiguration:v4 builder:v5 validator:v6];
  }
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)failMultitaskingGesturesForReason:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__SBMainSwitcherControllerCoordinator_failMultitaskingGesturesForReason___block_invoke;
  v6[3] = &unk_1E6B04240;
  id v7 = v4;
  id v5 = v4;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v6];
}

void __73__SBMainSwitcherControllerCoordinator_failMultitaskingGesturesForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 gestureManager];
  [v3 failMultitaskingGesturesForReason:*(void *)(a1 + 32)];
}

- (void)programmaticSwitchAppGestureMoveToLeft
{
  id v4 = [(id)SBApp windowSceneManager];
  id v3 = [v4 activeDisplayWindowScene];
  [(SBMainSwitcherControllerCoordinator *)self _activateNeighboringAppLayoutRequiringActiveAppLayout:1 appLayoutEnvironment:1 inForwardDirection:0 windowScene:v3 eventLabel:@"ProgrammaticSwitchAppGestureMoveToRight"];
}

- (void)programmaticSwitchAppGestureMoveToRight
{
  id v4 = [(id)SBApp windowSceneManager];
  id v3 = [v4 activeDisplayWindowScene];
  [(SBMainSwitcherControllerCoordinator *)self _activateNeighboringAppLayoutRequiringActiveAppLayout:1 appLayoutEnvironment:1 inForwardDirection:1 windowScene:v3 eventLabel:@"ProgrammaticSwitchAppGestureMoveToRight"];
}

- (void)_activateNeighboringAppLayoutRequiringActiveAppLayout:(BOOL)a3 appLayoutEnvironment:(int64_t)a4 inForwardDirection:(BOOL)a5 windowScene:(id)a6 eventLabel:(id)a7
{
  BOOL v8 = a5;
  BOOL v10 = a3;
  id v13 = a6;
  id v32 = a7;
  uint64_t v33 = v13;
  uint64_t v14 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v13];
  id v15 = [(SBMainSwitcherControllerCoordinator *)self appLayoutsForSwitcherController:v14];
  if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBMainSwitcherControllerCoordinator.m" lineNumber:1696 description:@"The desired AppLayoutEnvironment for going to next/previous layout can only be Main or Floating"];
  }
  else if (a4 == 2)
  {
    uint64_t v16 = [v14 _currentFloatingAppLayout];
    goto LABEL_6;
  }
  uint64_t v16 = [v14 _currentMainAppLayout];
LABEL_6:
  uint64_t v31 = self;
  uint64_t v34 = (void *)v16;
  if (v16)
  {
    if (([v15 containsObject:v16] & 1) == 0 && v10) {
      goto LABEL_37;
    }
    uint64_t v18 = [v15 count];
    uint64_t v19 = [v15 indexOfObject:v34];
  }
  else
  {
    if (v10) {
      goto LABEL_37;
    }
    uint64_t v18 = objc_msgSend(v15, "count", 0);
    uint64_t v19 = -1;
  }
  if (a4 == 2) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = v18 - 1;
  }
  if (a4 == 2) {
    uint64_t v21 = -1;
  }
  else {
    uint64_t v21 = 0;
  }
  BOOL v22 = v19 >= v20;
  BOOL v23 = v19 <= v21;
  BOOL v24 = !v8;
  if (v8) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = -1;
  }
  while (1)
  {
    if (v24) {
      BOOL v22 = v23;
    }
    if (v22) {
      break;
    }
    v19 += v25;
    if (a4 == 2)
    {
      if (v8 && v19 >= v18) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = v19;
      }
      if (v8)
      {
        uint64_t v19 = v26;
      }
      else if (v19 <= v21)
      {
        uint64_t v19 = v18 - 1;
      }
    }
    uint64_t v27 = [v15 objectAtIndex:v19];
    if ([v27 environment] == a4)
    {
      if (v27)
      {
        id v28 = +[SBWorkspace mainWorkspace];
        id v29 = [v33 _fbsDisplayConfiguration];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __156__SBMainSwitcherControllerCoordinator__activateNeighboringAppLayoutRequiringActiveAppLayout_appLayoutEnvironment_inForwardDirection_windowScene_eventLabel___block_invoke;
        v35[3] = &unk_1E6B04268;
        v35[4] = v31;
        id v36 = v27;
        id v37 = v32;
        BOOL v38 = v8;
        id v30 = v27;
        [v28 requestTransitionWithOptions:0 displayConfiguration:v29 builder:v35];
      }
      break;
    }

    BOOL v22 = v19 >= v20;
    BOOL v23 = v19 <= v21;
    BOOL v24 = !v8;
  }
LABEL_37:
}

void __156__SBMainSwitcherControllerCoordinator__activateNeighboringAppLayoutRequiringActiveAppLayout_appLayoutEnvironment_inForwardDirection_windowScene_eventLabel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v4];
  [v3 _configureRequest:v5 forSwitcherTransitionRequest:v6 withEventLabel:*(void *)(a1 + 48)];

  [v5 setSource:12];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __156__SBMainSwitcherControllerCoordinator__activateNeighboringAppLayoutRequiringActiveAppLayout_appLayoutEnvironment_inForwardDirection_windowScene_eventLabel___block_invoke_2;
  v7[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  char v8 = *(unsigned char *)(a1 + 56);
  [v5 modifyApplicationContext:v7];
}

void __156__SBMainSwitcherControllerCoordinator__activateNeighboringAppLayoutRequiringActiveAppLayout_appLayoutEnvironment_inForwardDirection_windowScene_eventLabel___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTransitioningToLessRecentSpace:BSSettingFlagForBool()];
}

- (id)activeTransientOverlayPresentedAppLayoutForWindowScene:(id)a3
{
  uint64_t v4 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:a3];
  id v5 = [v4 contentViewController];
  uint64_t v6 = [(SBMainSwitcherControllerCoordinator *)self activeTransientOverlayPresentedAppLayoutForSwitcherContentController:v5];

  return v6;
}

- (void)addAppLayoutForTransientOverlayViewController:(id)a3 windowScene:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  appLayoutToEligibleTransientOverlayViewController = self->_appLayoutToEligibleTransientOverlayViewController;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __97__SBMainSwitcherControllerCoordinator_addAppLayoutForTransientOverlayViewController_windowScene___block_invoke;
  v26[3] = &unk_1E6B04290;
  id v9 = v6;
  id v27 = v9;
  id v28 = &v29;
  [(NSMutableDictionary *)appLayoutToEligibleTransientOverlayViewController enumerateKeysAndObjectsUsingBlock:v26];
  if (!*((unsigned char *)v30 + 24))
  {
    BOOL v10 = [v9 representedDisplayItem];
    if (v10)
    {
      id v11 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v7];
      uint64_t v12 = [SBAppLayout alloc];
      id v13 = [NSNumber numberWithInteger:1];
      uint64_t v33 = v13;
      v34[0] = v10;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      id v15 = [v11 layoutState];
      uint64_t v16 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v12, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v14, 1, 1, [v15 displayOrdinal]);

      long long v17 = self->_appLayoutToEligibleTransientOverlayViewController;
      if (!v17)
      {
        uint64_t v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v19 = self->_appLayoutToEligibleTransientOverlayViewController;
        self->_appLayoutToEligibleTransientOverlayViewController = v18;

        long long v17 = self->_appLayoutToEligibleTransientOverlayViewController;
      }
      [(NSMutableDictionary *)v17 setObject:v9 forKey:v16];
      uint64_t v20 = [v11 _currentLayoutState];
      uint64_t v21 = [v20 unlockedEnvironmentMode];

      BOOL v22 = [v11 contentViewController];
      if ((v21 & 0xFFFFFFFFFFFFFFFELL) != 2
        && ([(SBMainSwitcherControllerCoordinator *)self activeTransientOverlayPresentedAppLayoutForSwitcherContentController:v22], v23 = objc_claimAutoreleasedReturnValue(), BOOL v24 = v23 == 0, v23, v24))
      {
        [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __97__SBMainSwitcherControllerCoordinator_addAppLayoutForTransientOverlayViewController_windowScene___block_invoke_2;
        v25[3] = &unk_1E6AF4AC0;
        void v25[4] = self;
        [(SBMainSwitcherControllerCoordinator *)self _insertAppLayout:v16 atIndex:0 contentViewController:v22 modelMutationBlock:v25 completion:0];
      }
    }
  }

  _Block_object_dispose(&v29, 8);
}

uint64_t __97__SBMainSwitcherControllerCoordinator_addAppLayoutForTransientOverlayViewController_windowScene___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_addAppLayoutForTransientOverlayViewController_windowScene___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rebuildAppListCache];
}

- (BOOL)_hasAppLayoutContainingDisplayItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mainSwitcherModel = self->_mainSwitcherModel;
  id v6 = objc_msgSend(v4, "bundleIdentifier", 0);
  id v7 = [(SBAppSwitcherModel *)mainSwitcherModel appLayoutsForBundleIdentifier:v6 includingHiddenAppLayouts:0];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) containsItem:v4])
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)addAppLayoutForDisplayItem:(id)a3 windowScene:(id)a4 completion:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, uint64_t, void))a5;
  if ([(SBMainSwitcherControllerCoordinator *)self _hasAppLayoutContainingDisplayItem:v8])
  {
    if (v10) {
      v10[2](v10, 1, 0);
    }
  }
  else
  {
    id v11 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v9];
    long long v12 = [v11 contentViewController];
    long long v13 = [SBAppLayout alloc];
    uint64_t v20 = &unk_1F334A598;
    v21[0] = v8;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    long long v15 = [v11 layoutState];
    uint64_t v16 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v13, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v14, 1, 1, [v15 displayOrdinal]);

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__SBMainSwitcherControllerCoordinator_addAppLayoutForDisplayItem_windowScene_completion___block_invoke;
    v18[3] = &unk_1E6AF5290;
    v18[4] = self;
    uint64_t v19 = v16;
    uint64_t v17 = v16;
    [(SBMainSwitcherControllerCoordinator *)self _insertAppLayout:v17 atIndex:0 contentViewController:v12 modelMutationBlock:v18 completion:v10];
  }
}

uint64_t __89__SBMainSwitcherControllerCoordinator_addAppLayoutForDisplayItem_windowScene_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) addToFront:*(void *)(a1 + 40)];
}

- (void)removeAppLayoutForDisplayItem:(id)a3 shouldDestroyScene:(BOOL)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(SBMainSwitcherControllerCoordinator *)self _appLayoutContainingDisplayItem:v7];
  if (v8)
  {
    if (a4)
    {
      [(SBMainSwitcherControllerCoordinator *)self deleteAppLayoutForDisplayItem:v7];
    }
    else
    {
      if ([(SBMainSwitcherControllerCoordinator *)self isAnySwitcherVisible])
      {
        id v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"SBMainSwitcherControllerCoordinator.m", 1803, @"Tried to remove app layout %@ without destroying scene while a switcher was visible. This is not supported.", v8 object file lineNumber description];
      }
      mainSwitcherModel = self->_mainSwitcherModel;
      v12[0] = v8;
      BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [(SBAppSwitcherModel *)mainSwitcherModel removeAppLayouts:v10];

      [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
    }
  }
}

- (void)addCenterRoleAppLayoutForDisplayItem:(id)a3 windowScene:(id)a4 completion:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, uint64_t, void))a5;
  if ([(SBMainSwitcherControllerCoordinator *)self _hasAppLayoutContainingDisplayItem:v8])
  {
    if (v10) {
      v10[2](v10, 1, 0);
    }
  }
  else
  {
    id v11 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v9];
    long long v12 = [v11 contentViewController];
    long long v13 = [SBAppLayout alloc];
    long long v14 = [NSNumber numberWithInteger:1];
    uint64_t v21 = v14;
    v22[0] = v8;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v16 = [v11 layoutState];
    uint64_t v17 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v13, "initWithItemsForLayoutRoles:configuration:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v15, 1, 1, 3, 0, [v16 displayOrdinal]);

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__SBMainSwitcherControllerCoordinator_addCenterRoleAppLayoutForDisplayItem_windowScene_completion___block_invoke;
    v19[3] = &unk_1E6AF5290;
    v19[4] = self;
    uint64_t v20 = v17;
    uint64_t v18 = v17;
    [(SBMainSwitcherControllerCoordinator *)self _insertAppLayout:v18 atIndex:0 contentViewController:v12 modelMutationBlock:v19 completion:v10];
  }
}

uint64_t __99__SBMainSwitcherControllerCoordinator_addCenterRoleAppLayoutForDisplayItem_windowScene_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) addToFront:*(void *)(a1 + 40)];
}

- (BOOL)hasAppLayoutForDisplayItem:(id)a3
{
  id v3 = [(SBMainSwitcherControllerCoordinator *)self _appLayoutContainingDisplayItem:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)deleteAppLayoutForDisplayItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SBSwitcherDisplayItemRemovalResolutionRequest);
  [(SBSwitcherDisplayItemRemovalResolutionRequest *)v5 setRemovalIntentType:1 forDisplayItem:v4];

  id v6 = [(SBMainSwitcherControllerCoordinator *)self _resultsForDisplayItemRemovalResolutionRequest:v5 preferredAppLayoutForRemovalAnimationIfAny:0];
  if (v6)
  {
    id v7 = [(SBMainSwitcherControllerCoordinator *)self _modelRemovalRequestForDisplayItemResolutionResults:v6];
    id v8 = [(SBMainSwitcherControllerCoordinator *)self _switcherModelRemovalResultsForRequest:v7 forReason:0];
    id v9 = [v8 appLayouts];
    uint64_t v10 = [v9 count];
    BOOL v11 = v10 != 0;

    if (v10) {
      [(SBMainSwitcherControllerCoordinator *)self _performSceneDestructionForModelRemovalResults:v8];
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)acquireAllowHiddenAppAssertionForBundleIdentifier:(id)a3 reason:(id)a4
{
  mainSwitcherModel = self->_mainSwitcherModel;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBAppSwitcherModel *)mainSwitcherModel _recentAppLayoutsController];
  id v9 = [v8 _acquireAllowHiddenAppAssertionForBundleIdentifier:v7 reason:v6];

  return v9;
}

- (BOOL)hasAppLayoutForTransientOverlayViewController:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__62;
  uint64_t v18 = __Block_byref_object_dispose__62;
  id v19 = 0;
  appLayoutToEligibleTransientOverlayViewController = self->_appLayoutToEligibleTransientOverlayViewController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__SBMainSwitcherControllerCoordinator_hasAppLayoutForTransientOverlayViewController_windowScene___block_invoke;
  v11[3] = &unk_1E6B04290;
  id v9 = v6;
  id v12 = v9;
  long long v13 = &v14;
  [(NSMutableDictionary *)appLayoutToEligibleTransientOverlayViewController enumerateKeysAndObjectsUsingBlock:v11];
  LOBYTE(v6) = v15[5] != 0;

  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

void __97__SBMainSwitcherControllerCoordinator_hasAppLayoutForTransientOverlayViewController_windowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (BOOL)hasTransientOverlayAppLayoutsForWindowScene:(id)a3
{
  return [(NSMutableDictionary *)self->_appLayoutToEligibleTransientOverlayViewController count] != 0;
}

- (void)removeAppLayoutTransientOverlayViewController:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  BOOL v23 = __Block_byref_object_copy__62;
  BOOL v24 = __Block_byref_object_dispose__62;
  id v25 = 0;
  appLayoutToEligibleTransientOverlayViewController = self->_appLayoutToEligibleTransientOverlayViewController;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __97__SBMainSwitcherControllerCoordinator_removeAppLayoutTransientOverlayViewController_windowScene___block_invoke;
  uint64_t v17 = &unk_1E6B04290;
  id v9 = v6;
  id v18 = v9;
  id v19 = &v20;
  [(NSMutableDictionary *)appLayoutToEligibleTransientOverlayViewController enumerateKeysAndObjectsUsingBlock:&v14];
  if (v21[5])
  {
    -[NSMutableDictionary removeObjectForKey:](self->_appLayoutToEligibleTransientOverlayViewController, "removeObjectForKey:", v14, v15, v16, v17);
    if (![(NSMutableDictionary *)self->_appLayoutToEligibleTransientOverlayViewController count])
    {
      uint64_t v10 = self->_appLayoutToEligibleTransientOverlayViewController;
      self->_appLayoutToEligibleTransientOverlayViewController = 0;
    }
    BOOL v11 = objc_alloc_init(SBSwitcherModelRemovalRequest);
    id v12 = +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction];
    [(SBSwitcherModelRemovalRequest *)v11 setAction:v12 forAppLayout:v21[5]];

    long long v13 = [(SBMainSwitcherControllerCoordinator *)self _switcherModelRemovalResultsForRequest:v11 forReason:0];
    [(SBMainSwitcherControllerCoordinator *)self _performSceneDestructionForModelRemovalResults:v13];
  }
  -[SBMainSwitcherControllerCoordinator _removeAcquiredTransientOverlayViewController:windowScene:](self, "_removeAcquiredTransientOverlayViewController:windowScene:", v9, v7, v14, v15, v16, v17);

  _Block_object_dispose(&v20, 8);
}

void __97__SBMainSwitcherControllerCoordinator_removeAppLayoutTransientOverlayViewController_windowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (void)configureSwitcherStateForAccidentalActivationMitigationSession:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  uint64_t v7 = [a3 state];
  if (v7 == 3)
  {
    uint64_t v17 = v6;
    id v9 = dispatch_group_create();
    self->_outstandingAccidentalActivationMitigationTransitionCount = [(NSMapTable *)self->_previousLayoutStatesByWindowScene count];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = (void *)[(NSMapTable *)self->_previousLayoutStatesByWindowScene copy];
    BOOL v11 = [v10 keyEnumerator];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
          dispatch_group_enter(v9);
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __113__SBMainSwitcherControllerCoordinator_configureSwitcherStateForAccidentalActivationMitigationSession_completion___block_invoke;
          v20[3] = &unk_1E6AF5290;
          v20[4] = self;
          uint64_t v21 = v9;
          [(SBMainSwitcherControllerCoordinator *)self _restoreLayoutStateSnapshotForWindowScene:v16 completion:v20];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__SBMainSwitcherControllerCoordinator_configureSwitcherStateForAccidentalActivationMitigationSession_completion___block_invoke_2;
    block[3] = &unk_1E6AF5300;
    id v6 = v17;
    id v19 = v17;
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);
  }
  else if (v7 == 2)
  {
    [(SBAppSwitcherModel *)self->_mainSwitcherModel clearAppLayoutsSnapshot];
    previousLayoutStatesByWindowScene = self->_previousLayoutStatesByWindowScene;
    self->_previousLayoutStatesByWindowScene = 0;

    v6[2](v6);
  }
}

void __113__SBMainSwitcherControllerCoordinator_configureSwitcherStateForAccidentalActivationMitigationSession_completion___block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 440);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 440))
  {
    [*(id *)(v2 + 216) restoreAppLayoutsSnapshot];
    [*(id *)(*(void *)(a1 + 32) + 216) clearAppLayoutsSnapshot];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  id v5 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v5);
}

uint64_t __113__SBMainSwitcherControllerCoordinator_configureSwitcherStateForAccidentalActivationMitigationSession_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_takeLayoutStateSnapshotForWindowScene:(id)a3 withPreviousLayoutState:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  previousLayoutStatesByWindowScene = self->_previousLayoutStatesByWindowScene;
  if (!previousLayoutStatesByWindowScene)
  {
    id v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    id v9 = self->_previousLayoutStatesByWindowScene;
    self->_previousLayoutStatesByWindowScene = v8;

    previousLayoutStatesByWindowScene = self->_previousLayoutStatesByWindowScene;
  }
  [(NSMapTable *)previousLayoutStatesByWindowScene setObject:v6 forKey:v10];
}

- (void)_restoreLayoutStateSnapshotForWindowScene:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMapTable *)self->_previousLayoutStatesByWindowScene objectForKey:v6];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = [v8 elements];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v36 + 1) + 8 * i) entityGenerator];
        uint64_t v16 = v15[2]();

        [v9 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v12);
  }

  uint64_t v17 = [v8 elementWithRole:4];
  id v18 = v17;
  if (v17)
  {
    id v19 = [v17 entityGenerator];
    uint64_t v20 = v19[2]();
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v21 = [v8 elementWithRole:3];
  long long v22 = v21;
  if (v21)
  {
    long long v23 = [v21 entityGenerator];
    long long v24 = v23[2]();
  }
  else
  {
    long long v24 = 0;
  }
  long long v25 = +[SBWorkspace mainWorkspace];
  uint64_t v26 = [v6 _fbsDisplayConfiguration];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke;
  v31[3] = &unk_1E6AF5F80;
  id v32 = v9;
  id v33 = v20;
  id v34 = v24;
  id v35 = v7;
  id v27 = v7;
  id v28 = v24;
  id v29 = v20;
  id v30 = v9;
  [v25 requestTransitionWithOptions:0 displayConfiguration:v26 builder:v31];
}

void __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:71];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke_2;
  v4[3] = &unk_1E6B042B8;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  [v3 modifyApplicationContext:v4];
}

void __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAnimationDisabled:1];
  [v3 setEntities:*(void *)(a1 + 32) withPolicy:0 centerEntity:*(void *)(a1 + 40) floatingEntity:*(void *)(a1 + 48)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke_3;
  v4[3] = &unk_1E6AF5DA8;
  id v5 = *(id *)(a1 + 56);
  [v3 setResultBlock:v4];
}

uint64_t __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addAcquiredTransientOverlayViewController:(id)a3 forAppLayout:(id)a4 windowScene:(id)a5
{
  id v17 = a3;
  appLayoutToAcquiredTransientOverlayViewController = self->_appLayoutToAcquiredTransientOverlayViewController;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(NSMutableDictionary *)appLayoutToAcquiredTransientOverlayViewController allValues];
  LOBYTE(appLayoutToAcquiredTransientOverlayViewController) = [v11 containsObject:v17];

  if ((appLayoutToAcquiredTransientOverlayViewController & 1) == 0) {
    [v17 beginIgnoringContentOverlayInsetUpdates];
  }
  uint64_t v12 = self->_appLayoutToAcquiredTransientOverlayViewController;
  if (!v12)
  {
    uint64_t v13 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    uint64_t v14 = self->_appLayoutToAcquiredTransientOverlayViewController;
    self->_appLayoutToAcquiredTransientOverlayViewController = v13;

    uint64_t v12 = self->_appLayoutToAcquiredTransientOverlayViewController;
  }
  [(NSMutableDictionary *)v12 setObject:v17 forKey:v10];
  uint64_t v15 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v9];

  uint64_t v16 = [v15 contentViewController];
  [v16 acquiredViewController:v17 forTransientOverlayAppLayout:v10];
}

- (BOOL)isAcquiredTransientOverlayViewController:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  appLayoutToAcquiredTransientOverlayViewController = self->_appLayoutToAcquiredTransientOverlayViewController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__SBMainSwitcherControllerCoordinator_isAcquiredTransientOverlayViewController_windowScene___block_invoke;
  v11[3] = &unk_1E6B04290;
  id v9 = v6;
  id v12 = v9;
  uint64_t v13 = &v14;
  [(NSMutableDictionary *)appLayoutToAcquiredTransientOverlayViewController enumerateKeysAndObjectsUsingBlock:v11];
  LOBYTE(v6) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

uint64_t __92__SBMainSwitcherControllerCoordinator_isAcquiredTransientOverlayViewController_windowScene___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateTransientOverlayViewControllersUsingBlock:(id)a3 windowScene:(id)a4
{
}

- (void)_removeAcquiredTransientOverlayViewController:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__62;
  long long v25 = __Block_byref_object_dispose__62;
  id v26 = 0;
  appLayoutToAcquiredTransientOverlayViewController = self->_appLayoutToAcquiredTransientOverlayViewController;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  char v17 = __97__SBMainSwitcherControllerCoordinator__removeAcquiredTransientOverlayViewController_windowScene___block_invoke;
  id v18 = &unk_1E6B04290;
  id v9 = v6;
  id v19 = v9;
  uint64_t v20 = &v21;
  [(NSMutableDictionary *)appLayoutToAcquiredTransientOverlayViewController enumerateKeysAndObjectsUsingBlock:&v15];
  if (v22[5])
  {
    -[NSMutableDictionary removeObjectForKey:](self->_appLayoutToAcquiredTransientOverlayViewController, "removeObjectForKey:", v15, v16, v17, v18);
    if (![(NSMutableDictionary *)self->_appLayoutToAcquiredTransientOverlayViewController count])
    {
      id v10 = self->_appLayoutToAcquiredTransientOverlayViewController;
      self->_appLayoutToAcquiredTransientOverlayViewController = 0;
    }
    uint64_t v11 = [(NSMutableDictionary *)self->_appLayoutToAcquiredTransientOverlayViewController allValues];
    char v12 = [v11 containsObject:v9];

    if ((v12 & 1) == 0) {
      [v9 endIgnoringContentOverlayInsetUpdates];
    }
    uint64_t v13 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v7];
    uint64_t v14 = [v13 contentViewController];
    [v14 relinquishTransientOverlayViewController:v9];
  }
  _Block_object_dispose(&v21, 8);
}

void __97__SBMainSwitcherControllerCoordinator__removeAcquiredTransientOverlayViewController_windowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (void)_configureRequest:(id)a3 forSwitcherTransitionRequest:(id)a4 withEventLabel:(id)a5
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v114 = a5;
  id v10 = [(id)SBApp windowSceneManager];
  uint64_t v11 = [v8 displayIdentity];
  uint64_t v12 = [v10 windowSceneForDisplayIdentity:v11];

  long long v115 = (void *)v12;
  uint64_t v13 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v12];
  long long v119 = [v13 contentViewController];
  uint64_t v14 = [v9 appLayout];
  long long v118 = v13;
  if ([v13 windowManagementStyle] == 1 || objc_msgSend(v14, "environment") != 2)
  {
    long long v129 = v14;
  }
  else
  {
    uint64_t v15 = [v14 appLayoutByModifyingEnvironment:1];

    long long v129 = (void *)v15;
  }
  uint64_t v16 = [v9 appLayoutEnvironment];
  uint64_t v17 = [v9 unlockedEnvironmentMode];
  uint64_t v18 = [v9 floatingConfiguration];
  uint64_t v19 = [v9 floatingSwitcherVisible];
  uint64_t v20 = [v9 peekConfiguration];
  uint64_t v21 = [v9 bundleIdentifierForAppExpose];
  long long v121 = [v8 displayIdentity];
  long long v124 = [v9 activatingDisplayItem];
  long long v128 = objc_msgSend(v129, "itemForLayoutRole:");
  long long v117 = [v129 itemForLayoutRole:4];
  long long v116 = objc_msgSend(v129, "itemForLayoutRole:");
  uint64_t v122 = v16;
  if (!v16) {
    uint64_t v122 = [v129 environment];
  }
  long long v22 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
  [v8 setApplicationContext:v22];
  long long v126 = objc_alloc_init(SBWorkspaceTransientOverlayTransitionContext);
  uint64_t v127 = v17;
  [(SBWorkspaceApplicationSceneTransitionContext *)v22 setRequestedUnlockedEnvironmentMode:v17];
  [(SBWorkspaceApplicationSceneTransitionContext *)v22 setRequestedFloatingConfiguration:v18];
  [(SBWorkspaceApplicationSceneTransitionContext *)v22 setRequestedFloatingSwitcherVisible:v19];
  [v9 animationDisabled];
  [(SBWorkspaceTransitionContext *)v22 setAnimationDisabled:BSSettingFlagIsYes()];
  [(SBWorkspaceApplicationSceneTransitionContext *)v22 setRequestedPeekConfiguration:v20];
  long long v125 = (void *)v21;
  [(SBWorkspaceApplicationSceneTransitionContext *)v22 setRequestedAppExposeBundleID:v21];
  [v9 autoPIPDisabled];
  [(SBWorkspaceApplicationSceneTransitionContext *)v22 setDisablesAutoPIP:BSSettingFlagIsYes()];
  -[SBWorkspaceApplicationSceneTransitionContext setFencesAnimations:](v22, "setFencesAnimations:", [v9 fenceSceneUpdate]);
  -[SBWorkspaceApplicationSceneTransitionContext setRetainsSiri:](v22, "setRetainsSiri:", [v9 retainsSiri]);
  uint64_t v23 = [v9 animationSettings];
  long long v24 = v23;
  if (v23)
  {
    uint64_t v146 = 0;
    uint64_t v147 = 0;
    [v23 dampingRatio];
    [v24 response];
    convertDampingRatioAndResponseToTensionAndFriction();
    long long v25 = [MEMORY[0x1E4F4F840] settingsWithMass:1.0 stiffness:0.0 damping:0.0];
    [(SBWorkspaceTransitionContext *)v22 setAnimationSettings:v25];
  }
  uint64_t v113 = v24;
  id v26 = &off_1E6AEC000;
  id v27 = v129;
  if (v127 == 2)
  {
    int v28 = 1;
  }
  else
  {
    int IsYes = BSSettingFlagIsYes();
    if (v127 == 1)
    {
LABEL_16:
      id v33 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v22 setActivatingEntity:v33];
      goto LABEL_17;
    }
    int v28 = IsYes;
    id v26 = &off_1E6AEC000;
  }
  id v30 = [v26[441] homeScreenAppLayout];
  if ([v129 isEqual:v30])
  {

    goto LABEL_16;
  }
  uint64_t v31 = +[SBDisplayItem homeScreenDisplayItem];
  int v32 = [v124 isEqual:v31];

  id v27 = v129;
  if (v32) {
    goto LABEL_16;
  }
  if (v28)
  {
    id v33 = [(SBMainSwitcherControllerCoordinator *)self activeTransientOverlayPresentedAppLayoutForSwitcherContentController:v119];
    if (v33)
    {
      uint64_t v41 = [(SBMainSwitcherControllerCoordinator *)self createWorkspaceTransientOverlayForAppLayout:v33];
      BOOL v34 = v41 != 0;
      if (v41)
      {
        [(SBWorkspaceTransientOverlayTransitionContext *)v126 setTransientOverlay:v41];
        [(SBWorkspaceTransientOverlayTransitionContext *)v126 setTransitionType:1];
      }

      goto LABEL_18;
    }
LABEL_17:
    BOOL v34 = 0;
LABEL_18:

    goto LABEL_19;
  }
  BOOL v34 = 0;
  if (v124 && v129)
  {
    if ([v129 containsItem:v124])
    {
      id v33 = [v115 sceneManager];
      id v48 = [v33 displayIdentity];
      long long v49 = [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v124 sceneHandleProvider:v33 displayIdentity:v48];

      [(SBWorkspaceApplicationSceneTransitionContext *)v22 setActivatingEntity:v49];
      v144[0] = MEMORY[0x1E4F143A8];
      v144[1] = 3221225472;
      v144[2] = __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke;
      v144[3] = &unk_1E6AF5350;
      id v145 = v49;
      id v50 = v49;
      id v51 = (id)[v8 addCompletionHandler:v144];

      goto LABEL_17;
    }
    BOOL v34 = 0;
  }
LABEL_19:
  if (!v128) {
    goto LABEL_38;
  }
  if ([v128 type] != 2)
  {
    if ([v128 type] == 4)
    {
      id v35 = [v128 appSuggestion];
      if ([v35 isSiriSuggestion])
      {
        int v39 = v34;
        unint64_t v40 = +[SBWorkspaceEntity entity];
        [(SBWorkspaceApplicationSceneTransitionContext *)v22 setEntity:v40 forLayoutRole:1];
        long long v37 = v125;
      }
      else
      {
        long long v37 = v125;
        if ([v35 isCallContinuitySuggestion]
          && !+[SBInCallPresentationManager isSpecializedAPISupported])
        {
          unint64_t v40 = [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v128 displayIdentity:v121];
          [(SBWorkspaceTransientOverlayTransitionContext *)v126 setTransientOverlay:v40];
          [(SBWorkspaceTransientOverlayTransitionContext *)v126 setTransitionType:0];
          v142[0] = MEMORY[0x1E4F143A8];
          v142[1] = 3221225472;
          v142[2] = __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_2;
          v142[3] = &unk_1E6AF5350;
          id v143 = v35;
          id v65 = (id)[v8 addCompletionHandler:v142];

          int v39 = 1;
        }
        else
        {
          int v39 = v34;
          if ([v35 isCallContinuitySuggestion])
          {
            unint64_t v40 = +[SBWorkspace mainWorkspace];
            uint64_t v52 = [v40 inCallPresentationManager];
            id v53 = [v35 uniqueIdentifier];
            [v52 handlePresentationForActivityContinuationIdentifier:v53];

            long long v37 = v125;
          }
          else
          {
            unint64_t v40 = [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v128 displayIdentity:v121];
            long long v59 = [v35 launchURL];

            long long v60 = &off_1E6AEC000;
            if (v59)
            {
              long long v61 = [v35 launchURL];
              if ([v35 launchURLRequiresInboxCopy])
              {
                long long v62 = [v40 application];
                id v63 = [v62 info];
                uint64_t v64 = [v63 documentInboxURL];
                uint64_t v110 = [v35 makeInboxCopyOfLaunchURLToInboxURL:v64];

                id v27 = v129;
                long long v60 = &off_1E6AEC000;

                long long v37 = v125;
                long long v61 = (void *)v110;
              }
              [v40 setObject:v61 forActivationSetting:5];
            }
            else
            {
              id v70 = objc_alloc(MEMORY[0x1E4F42700]);
              uint64_t v71 = [v35 uniqueIdentifier];
              uint64_t v72 = [v71 UUIDString];
              long long v73 = [v35 activityType];
              long long v61 = (void *)[v70 initWithIdentifier:v72 activityTypeIdentifier:v73 appSuggestion:v35];

              id v27 = v129;
              long long v60 = &off_1E6AEC000;

              long long v74 = [MEMORY[0x1E4F1CAD0] setWithObject:v61];
              [v40 addActions:v74];

              long long v75 = +[SBAppSuggestionManager sharedInstance];
              [v75 startFetchingPayloadForAppSuggestion:v35];

              long long v37 = v125;
            }

            long long v76 = [v60[454] sharedInstance];
            [v76 noteActivatingForAppSuggestion:v35 fromSource:1];

            [(SBWorkspaceApplicationSceneTransitionContext *)v22 setEntity:v40 forLayoutRole:1];
          }
        }
      }

      uint64_t v77 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v22 setEntity:v77 forLayoutRole:2];

      int v36 = 0;
      uint64_t v38 = v122;
      BOOL v34 = v39;
      goto LABEL_71;
    }
    if (![v128 type] || objc_msgSend(v128, "type") == 5 || objc_msgSend(v128, "type") == 3)
    {
      id v42 = [v8 displayIdentity];
      id v35 = [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v128 displayIdentity:v42];

      uint64_t v38 = v122;
      switch(v122)
      {
        case 3:
          v134[0] = MEMORY[0x1E4F143A8];
          v134[1] = 3221225472;
          v134[2] = __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_5;
          v134[3] = &unk_1E6AF8788;
          long long v54 = v22;
          long long v135 = v54;
          SBLayoutRoleEnumerateAppLayoutRoles(v134);
          [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v128 displayIdentity:v121];
          v56 = BOOL v55 = v34;
          [(SBWorkspaceApplicationSceneTransitionContext *)v54 setEntity:v56 forLayoutRole:4];
          uint64_t v57 = SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration([v27 centerConfiguration]);
          long long v58 = v54;
          uint64_t v38 = 3;
          [(SBWorkspaceApplicationSceneTransitionContext *)v58 setRequestedCenterConfiguration:v57];

          BOOL v34 = v55;
          int v36 = 0;
          long long v44 = v135;
          break;
        case 2:
          [(SBWorkspaceApplicationSceneTransitionContext *)v22 setEntity:v35 forLayoutRole:3];
          v136[0] = MEMORY[0x1E4F143A8];
          v136[1] = 3221225472;
          v136[2] = __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_4;
          v136[3] = &unk_1E6AF8788;
          long long v137 = v22;
          SBLayoutRoleEnumerateAppLayoutRoles(v136);
          int v36 = 0;
          long long v44 = v137;
          break;
        case 1:
          id v43 = objc_opt_new();
          v138[0] = MEMORY[0x1E4F143A8];
          v138[1] = 3221225472;
          v138[2] = __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_3;
          v138[3] = &unk_1E6AFA810;
          long long v44 = v43;
          uint64_t v139 = v44;
          long long v140 = self;
          id v45 = v27;
          id v46 = v121;
          id v141 = v46;
          [v45 enumerate:v138];
          -[SBWorkspaceApplicationSceneTransitionContext setRequestedSpaceConfiguration:](v22, "setRequestedSpaceConfiguration:", SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration([v45 configuration]));
          if (v117)
          {
            id v47 = [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v117 displayIdentity:v46];
            -[SBWorkspaceApplicationSceneTransitionContext setRequestedCenterConfiguration:](v22, "setRequestedCenterConfiguration:", SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration([v45 centerConfiguration]));
          }
          else
          {
            id v47 = 0;
          }
          BOOL v111 = v34;
          if (v116) {
            [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v116 displayIdentity:v46];
          }
          else {
          uint64_t v66 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:3];
          }
          id v27 = v129;
          uint64_t v67 = [v9 entityInsertionPolicy];
          [(SBWorkspaceApplicationSceneTransitionContext *)v22 setEntities:v44 withPolicy:v67 centerEntity:v47 floatingEntity:v66];
          int v68 = [v118 isChamoisWindowingUIEnabled];
          if (v67 == 1) {
            int v36 = v68;
          }
          else {
            int v36 = 0;
          }
          if (v36 == 1)
          {
            uint64_t v69 = [(SBWorkspaceApplicationSceneTransitionContext *)v44 firstObject];
            [(SBWorkspaceApplicationSceneTransitionContext *)v22 _setRequestedFrontmostEntity:v69];
          }
          uint64_t v38 = 1;
          BOOL v34 = v111;
          break;
        default:
          int v36 = 0;
LABEL_67:
          long long v37 = v125;
          goto LABEL_71;
      }

      goto LABEL_67;
    }
LABEL_38:
    int v36 = 0;
    long long v37 = v125;
    uint64_t v38 = v122;
    goto LABEL_72;
  }
  id v35 = [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v128 displayIdentity:v121];
  [(SBWorkspaceTransientOverlayTransitionContext *)v126 setTransientOverlay:v35];
  [(SBWorkspaceTransientOverlayTransitionContext *)v126 setTransitionType:0];
  int v36 = 0;
  BOOL v34 = 1;
  long long v37 = v125;
  uint64_t v38 = v122;
LABEL_71:

LABEL_72:
  if (v38 == 1)
  {
    BOOL v112 = v34;
    id v109 = v9;
    id v123 = v8;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v78 = [v27 itemsToLayoutAttributesMap];
    uint64_t v79 = [v78 countByEnumeratingWithState:&v130 objects:v150 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v131;
      do
      {
        for (uint64_t i = 0; i != v80; ++i)
        {
          if (*(void *)v131 != v81) {
            objc_enumerationMutation(v78);
          }
          uint64_t v83 = *(void *)(*((void *)&v130 + 1) + 8 * i);
          long long v84 = [v27 itemsToLayoutAttributesMap];
          long long v85 = [v84 objectForKey:v83];

          long long v86 = -[SBWorkspaceApplicationSceneTransitionContext entityForLayoutRole:](v22, "entityForLayoutRole:", [v27 layoutRoleForItem:v83]);
          if (v86)
          {
            if (v36)
            {
              long long v87 = [(SBWorkspaceApplicationSceneTransitionContext *)v22 requestedLayoutAttributesForEntity:v86];
              uint64_t v88 = objc_msgSend(v85, "attributesByModifyingLastInteractionTime:", objc_msgSend(v87, "lastInteractionTime"));

              long long v85 = (void *)v88;
              id v27 = v129;
            }
            [(SBWorkspaceApplicationSceneTransitionContext *)v22 setRequestedLayoutAttributes:v85 forEntity:v86];
          }
        }
        uint64_t v80 = [v78 countByEnumeratingWithState:&v130 objects:v150 count:16];
      }
      while (v80);
    }

    id v8 = v123;
    id v9 = v109;
    long long v37 = v125;
    BOOL v34 = v112;
  }
  uint64_t v89 = [v9 source];
  if (v89)
  {
    uint64_t v90 = v89;
    [v8 setSource:v89];
    uint64_t v91 = v127;
    if (v90 == 51)
    {
      char v92 = [v8 applicationContext];
      id v93 = [v92 activatingEntity];
      [v93 setFlag:1 forActivationSetting:62];
    }
  }
  else
  {
    uint64_t v91 = v127;
    if ([v27 type] == 4) {
      uint64_t v94 = 10;
    }
    else {
      uint64_t v94 = 3;
    }
    [v8 setSource:v94];
  }
  BOOL v95 = v91 == 2;
  unsigned int v96 = !v34;
  if (v95) {
    uint64_t v97 = 0;
  }
  else {
    uint64_t v97 = v96;
  }
  [(SBWorkspaceApplicationSceneTransitionContext *)v22 setWaitsForSceneUpdates:v97];
  if ((v96 & 1) == 0)
  {
    [v8 setTransientOverlayContext:v126];
    id v98 = +[SBWorkspaceEntity entity];
    [(SBWorkspaceApplicationSceneTransitionContext *)v22 setEntity:v98 forLayoutRole:1];

    id v99 = +[SBWorkspaceEntity entity];
    [(SBWorkspaceApplicationSceneTransitionContext *)v22 setEntity:v99 forLayoutRole:2];
  }
  if ([v114 length]) {
    [v8 setEventLabel:v114];
  }
  long long v100 = +[SBAppLayout homeScreenAppLayout];
  char v101 = [v27 isEqual:v100];

  if (v101)
  {
    uint64_t v102 = -1;
  }
  else
  {
    NSUInteger v103 = [(NSArray *)self->_appLayouts indexOfObject:v27];
    if (v103 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v102 = -1;
    }
    else {
      uint64_t v102 = v103;
    }
  }
  v148[0] = *MEMORY[0x1E4FA7690];
  char v104 = [NSNumber numberWithInteger:v102];
  v148[1] = *MEMORY[0x1E4FA7698];
  v149[0] = v104;
  v149[1] = &unk_1F334A5B0;
  long long v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v149 forKeys:v148 count:2];
  long long v106 = (void *)MEMORY[0x1E4FA5E78];
  id v107 = v105;
  uint64_t v108 = [v106 sharedInstance];
  [v108 emitEvent:14 withPayload:v107];
}

void __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) applicationSceneEntity];
    id v3 = [v2 sceneHandle];
    id v6 = [v3 sceneIfExists];

    if (v6)
    {
      id v4 = +[SBWorkspace mainWorkspace];
      id v5 = [v4 keyboardFocusController];
      [v5 userFocusRequestForScene:v6 reason:@"SwitcherTransitionRequest" completion:0];
    }
  }
}

void __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v5 = +[SBWorkspace mainWorkspace];
    id v3 = [v5 inCallTransientOverlayManager];
    id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    [v3 presentTransientOverlayForActivityContinuationWithActivityIdentifier:v4];
  }
}

void __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (SBLayoutRoleIsValidForSplitView(a2))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) _entityForDisplayItem:v7 displayIdentity:*(void *)(a1 + 48)];
    [v5 addObject:v6];
  }
}

void __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:a2];
  [v3 setEntity:v4 forLayoutRole:a2];
}

void __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:a2];
  [v3 setEntity:v4 forLayoutRole:a2];
}

- (id)_appLayoutFromPrimaryLayoutItem:(id)a3 sideLayoutElement:(id)a4 configuration:(int64_t)a5
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  id v9 = +[SBDisplayItem homeScreenDisplayItem];
  int v10 = [(id)v7 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = +[SBAppLayout homeScreenAppLayout];
  }
  else if (v7 | v8)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v7)
    {
      uint64_t v13 = [NSNumber numberWithInteger:1];
      [v12 setObject:v7 forKeyedSubscript:v13];

      uint64_t v14 = [NSNumber numberWithInteger:2];
      [v12 setObject:v8 forKeyedSubscript:v14];
    }
    int64_t v15 = 4;
    if (!v8) {
      int64_t v15 = 1;
    }
    if (!a5) {
      a5 = v15;
    }
    uint64_t v11 = [[SBAppLayout alloc] initWithItemsForLayoutRoles:v12 configuration:a5 environment:1 preferredDisplayOrdinal:0];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_appLayoutContainingDisplayItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_appLayouts;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsItem:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_entityForDisplayItem:(id)a3 displayIdentity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = +[SBSceneManagerCoordinator sharedInstance];
  id v9 = [v8 sceneManagerForDisplayIdentity:v6];

  int v10 = [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v7 sceneHandleProvider:v9 displayIdentity:v6];

  return v10;
}

- (BOOL)isDisplayEmbeddedForSwitcherContentController:(id)a3
{
  id v3 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  id v4 = [v3 windowScene];
  char v5 = [v4 isExtendedDisplayWindowScene] ^ 1;

  return v5;
}

- (id)proposedAppLayoutsForWindowDragForSwitcherContentController:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__SBMainSwitcherControllerCoordinator_proposedAppLayoutsForWindowDragForSwitcherContentController___block_invoke;
  v7[3] = &unk_1E6B04240;
  id v5 = v4;
  id v8 = v5;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v7];

  return v5;
}

void __99__SBMainSwitcherControllerCoordinator_proposedAppLayoutsForWindowDragForSwitcherContentController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 contentViewController];
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
  id v7 = v6;

  id v9 = [v7 _proposedAppLayoutForWindowDrag];

  id v8 = v9;
  if (v9)
  {
    [*(id *)(a1 + 32) addObject:v9];
    id v8 = v9;
  }
}

- (int64_t)nextDisplayItemInteractionTimeForSwitcherContentController:(id)a3
{
  id v3 = [(SBAppSwitcherModel *)self->_mainSwitcherModel _recentAppLayoutsController];
  int64_t v4 = [v3 _nextInteractionTime];

  return v4;
}

- (id)activeTransientOverlayPresentedAppLayoutForSwitcherContentController:(id)a3
{
  id v4 = a3;
  id v5 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:v4];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__62;
  uint64_t v19 = __Block_byref_object_dispose__62;
  id v20 = 0;
  id v6 = [v5 windowScene];
  id v7 = [v6 transientOverlayPresenter];

  appLayoutToEligibleTransientOverlayViewController = self->_appLayoutToEligibleTransientOverlayViewController;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __108__SBMainSwitcherControllerCoordinator_activeTransientOverlayPresentedAppLayoutForSwitcherContentController___block_invoke;
  v12[3] = &unk_1E6B04290;
  id v9 = v7;
  id v13 = v9;
  long long v14 = &v15;
  [(NSMutableDictionary *)appLayoutToEligibleTransientOverlayViewController enumerateKeysAndObjectsUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __108__SBMainSwitcherControllerCoordinator_activeTransientOverlayPresentedAppLayoutForSwitcherContentController___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) isTopmostPresentedViewController:a3])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)appLayoutForWorkspaceTransientOverlay:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 viewController];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__62;
  id v20 = __Block_byref_object_dispose__62;
  id v21 = 0;
  appLayoutToEligibleTransientOverlayViewController = self->_appLayoutToEligibleTransientOverlayViewController;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__SBMainSwitcherControllerCoordinator_appLayoutForWorkspaceTransientOverlay_windowScene___block_invoke;
  v13[3] = &unk_1E6B04290;
  id v10 = v8;
  id v14 = v10;
  uint64_t v15 = &v16;
  [(NSMutableDictionary *)appLayoutToEligibleTransientOverlayViewController enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __89__SBMainSwitcherControllerCoordinator_appLayoutForWorkspaceTransientOverlay_windowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (id)viewControllerForTransientOverlayAppLayout:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_appLayoutToAcquiredTransientOverlayViewController objectForKey:a3];
}

- (id)createWorkspaceTransientOverlayForAppLayout:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_appLayoutToEligibleTransientOverlayViewController objectForKey:a3];
  if (v3) {
    id v4 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
}

- (CGRect)switcherContentController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6
{
  id v10 = a5;
  id v11 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  [v11 frameForItemWithRole:a4 inMainAppLayout:v10 interfaceOrientation:a6];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)switcherContentController:(id)a3 frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a4 floatingConfiguration:(int64_t)a5
{
  id v7 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  [v7 frameForFloatingAppLayoutInInterfaceOrientation:a4 floatingConfiguration:a5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)switcherContentController:(id)a3 frameForCenterItemWithConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  id v7 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  [v7 frameForCenterItemWithConfiguration:a4 interfaceOrientation:a5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

uint64_t __91__SBMainSwitcherControllerCoordinator_transitionEventForContext_identifier_phase_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) fromAppLayout];
  if ([v4 containsItem:v3])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) fromFloatingAppLayout];
    uint64_t v5 = [v6 containsItem:v3];
  }
  return v5;
}

uint64_t __91__SBMainSwitcherControllerCoordinator_transitionEventForContext_identifier_phase_animated___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setRemovalContext:a3 forAppLayout:a2];
}

- (BOOL)switcherContentController:(id)a3 shouldMorphToPIPForTransitionContext:(id)a4
{
  return [(SBMainSwitcherControllerCoordinator *)self _shouldMorphToPIPForTransitionContext:a4 outForLayoutRole:0];
}

- (BOOL)switcherContentController:(id)a3 shouldMorphFromPIPForTransitionContext:(id)a4
{
  return [(SBMainSwitcherControllerCoordinator *)self _shouldMorphFromPIPForTransitionContext:a4 outForLayoutRole:0];
}

- (int64_t)activeInterfaceOrientationForSwitcherContentController:(id)a3
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation", a3);
}

uint64_t __102__SBMainSwitcherControllerCoordinator_switcherContentController_visibleAppLayoutsForBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)switcherContentController:(id)a3 hiddenAppLayoutsForBundleIdentifier:(id)a4
{
  id v4 = [(SBAppSwitcherModel *)self->_mainSwitcherModel appLayoutsForBundleIdentifier:a4 includingHiddenAppLayouts:1];
  uint64_t v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_225);

  return v5;
}

uint64_t __101__SBMainSwitcherControllerCoordinator_switcherContentController_hiddenAppLayoutsForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden];
}

- (BOOL)switcherContentController:(id)a3 displayItemSupportsCenterRole:(id)a4
{
  id v6 = a4;
  id v7 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  double v8 = [v7 _deviceApplicationSceneHandleForDisplayItem:v6];

  if (v8) {
    char v9 = [v8 supportsCenterWindow];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)switcherContentControllerIsKeyboardHomeAffordanceAssertionCurrentlyBeingTaken:(id)a3
{
  return self->_keyboardHomeAffordanceAssertion != 0;
}

- (BOOL)isSwitcherContentControllerEphemeral:(id)a3
{
  return 0;
}

- (void)switcherContentController:(id)a3 performTransitionWithRequest:(id)a4 gestureInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  char v9 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  double v10 = v9;
  if (v5)
  {
    double v11 = [v9 gestureManager];
    if ([v8 sceneUpdatesOnly]) {
      [v11 handleTransitionRequestForGestureUpdate:v8];
    }
    else {
      [v11 handleTransitionRequestForGestureComplete:v8];
    }
  }
  else
  {
    double v12 = [v9 windowScene];
    double v13 = [v12 _fbsDisplayConfiguration];

    double v14 = +[SBWorkspace mainWorkspace];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __111__SBMainSwitcherControllerCoordinator_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke;
    v19[3] = &unk_1E6AF57E8;
    id v20 = v8;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __111__SBMainSwitcherControllerCoordinator_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke_2;
    v16[3] = &unk_1E6AF8300;
    v16[4] = self;
    id v17 = v20;
    id v18 = v10;
    id v15 = v10;
    [v14 requestTransitionWithOptions:0 displayConfiguration:v13 builder:v19 validator:v16];
  }
}

void __111__SBMainSwitcherControllerCoordinator_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isAppLaunchDuringWindowDragGesture])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 32), "appLayout", 0);
    BOOL v5 = [v4 allItems];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
          double v11 = +[SBApplicationController sharedInstance];
          uint64_t v12 = [v10 bundleIdentifier];
          double v13 = [v11 applicationWithBundleIdentifier:v12];

          LOBYTE(v12) = [v13 alwaysMaximizedInChamois];
          if (v12)
          {

            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    [v3 setSource:68];
  }
LABEL_12:
}

uint64_t __111__SBMainSwitcherControllerCoordinator_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke_2(void *a1, void *a2)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v5 = a2;
  uint64_t v6 = [v4 dismissSwitcherEventName];
  [v2 _configureRequest:v5 forSwitcherTransitionRequest:v3 withEventLabel:v6];

  return 1;
}

- (void)switcherContentController:(id)a3 deletedDisplayItem:(id)a4 inAppLayout:(id)a5 forReason:(int64_t)a6
{
  id v15 = a4;
  id v9 = a5;
  if (a6 == 1)
  {
    double v10 = [(NSArray *)self->_appLayouts firstObject];
    if ([v9 isEqual:v10])
    {
    }
    else
    {
      double v11 = [(SBMainSwitcherControllerCoordinator *)self recentAppLayouts];
      uint64_t v12 = [v11 firstObject];
      int v13 = [v9 isEqual:v12];

      if (!v13) {
        goto LABEL_6;
      }
    }
    long long v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"SBUserSwipedToKillRecentAppLayoutNotification" object:self];
  }
LABEL_6:
  [(SBMainSwitcherControllerCoordinator *)self _removeDisplayItem:v15 forReason:a6 preferredAppLayoutForRemovalAnimationIfAny:v9];
}

- (void)switcherContentController:(id)a3 activatedBestAppSuggestion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 bundleIdentifier];
  id v11 = +[SBContinuityDisplayItem continuityAppDisplayItemWithBundleIdentifier:v8 appSuggestion:v6];

  id v9 = [(SBMainSwitcherControllerCoordinator *)self _appLayoutFromPrimaryLayoutItem:v11 sideLayoutElement:0 configuration:1];
  double v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  [(SBSwitcherTransitionRequest *)v10 setAppLayout:v9];
  [(SBSwitcherTransitionRequest *)v10 setSource:10];
  [(SBMainSwitcherControllerCoordinator *)self switcherContentController:v7 performTransitionWithRequest:v10 gestureInitiated:0];
}

- (void)switcherContentController:(id)a3 bringAppLayoutToFront:(id)a4
{
}

- (void)switcherContentController:(id)a3 requestNewWindowForBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  uint64_t v8 = [v7 windowScene];
  id v9 = [v8 _fbsDisplayConfiguration];
  double v10 = +[SBApplicationController sharedInstance];
  id v11 = [v10 applicationWithBundleIdentifier:v6];

  uint64_t v12 = [v8 sceneManager];
  int v13 = [v8 _fbsDisplayIdentity];
  id v14 = +[SBDeviceApplicationSceneEntity newEntityWithApplication:v11 sceneHandleProvider:v12 displayIdentity:v13];
  id v15 = +[SBWorkspace mainWorkspace];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__SBMainSwitcherControllerCoordinator_switcherContentController_requestNewWindowForBundleIdentifier___block_invoke;
  v17[3] = &unk_1E6AF57E8;
  id v18 = v14;
  id v16 = v14;
  [v15 requestTransitionWithOptions:0 displayConfiguration:v9 builder:v17];
}

void __101__SBMainSwitcherControllerCoordinator_switcherContentController_requestNewWindowForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:35];
  [v3 setEventLabel:@"NewWindowRequest"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __101__SBMainSwitcherControllerCoordinator_switcherContentController_requestNewWindowForBundleIdentifier___block_invoke_2;
  v4[3] = &unk_1E6AF57C0;
  id v5 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
}

uint64_t __101__SBMainSwitcherControllerCoordinator_switcherContentController_requestNewWindowForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setActivatingEntity:*(void *)(a1 + 32)];
}

void __103__SBMainSwitcherControllerCoordinator_switcherContentController_setCacheAsynchronousRenderingSurfaces___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[42] invalidate];
    id v3 = v2[42];
    v2[42] = 0;

    if (![v2[41] count])
    {
      id v4 = SBLogAppSwitcher();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5[0] = 0;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Disabled caching asynchronous rendering surfaces.", (uint8_t *)v5, 2u);
      }

      CARenderServerSetCacheAsynchronousSurfaces();
    }
  }
}

- (void)cancelActiveGestureForSwitcherContentController:(id)a3
{
  id v6 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  id v3 = [v6 gestureManager];
  id v4 = [v3 activeGestureTransaction];
  id v5 = [v4 gestureRecognizer];

  if ((unint64_t)[v5 state] <= 2)
  {
    [v5 setEnabled:0];
    [v5 setEnabled:1];
  }
}

- (void)switcherContentController:(id)a3 reopenHiddenAppLayoutsWithBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:v6];
  id v9 = [(SBAppSwitcherModel *)self->_mainSwitcherModel appLayoutsForBundleIdentifier:v7 includingHiddenAppLayouts:1];
  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v11 = objc_msgSend(v9, "bs_filter:", &__block_literal_global_246);
  uint64_t v12 = (void *)[v10 initWithArray:v11];

  if ([v12 count] == 1)
  {
    int v13 = [v12 firstObject];
    if ([v13 environment] != 2)
    {
LABEL_5:

      goto LABEL_6;
    }
    id v14 = [v8 _currentMainAppLayout];

    if (!v14)
    {
      id v26 = [v12 firstObject];
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_2;
      v38[3] = &unk_1E6AF9EF0;
      id v39 = v15;
      id v16 = v15;
      [v26 enumerate:v38];
      long long v17 = [SBAppLayout alloc];
      id v18 = [v8 layoutState];
      uint64_t v19 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v17, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v16, 1, 1, [v18 displayOrdinal]);

      int v13 = v26;
      [v12 removeObject:v26];
      [v12 addObject:v19];

      goto LABEL_5;
    }
  }
LABEL_6:
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_3;
  v35[3] = &unk_1E6AFA1E0;
  id v22 = v20;
  id v36 = v22;
  id v23 = v21;
  id v37 = v23;
  [v12 enumerateObjectsUsingBlock:v35];
  objc_initWeak(&location, v8);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_251;
  v31[3] = &unk_1E6AF4E00;
  void v31[4] = self;
  id v24 = v12;
  id v32 = v24;
  id v33 = v23;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_2_252;
  v27[3] = &unk_1E6B04328;
  id v25 = v33;
  id v28 = v25;
  objc_copyWeak(&v30, &location);
  id v29 = self;
  [(SBMainSwitcherControllerCoordinator *)self _insertAppLayouts:v25 atIndexes:v22 contentViewController:v6 modelMutationBlock:v31 completion:v27];
  objc_destroyWeak(&v30);

  objc_destroyWeak(&location);
}

uint64_t __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden];
}

void __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithInteger:a2];
  id v9 = v7;
  v10[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v4 addEntriesFromDictionary:v8];
}

void __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:&unk_1F334A5C8];
  id v5 = *(void **)(a1 + 40);
  id v6 = [v4 appLayoutByModifyingHiddenState:0];

  [v5 addObject:v6];
}

uint64_t __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_251(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 168);
  *(unsigned char *)(v2 + 168) = 1;
  if ([*(id *)(a1 + 40) count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [*(id *)(a1 + 40) objectAtIndex:v4];
      [*(id *)(*(void *)(a1 + 32) + 216) remove:v5];
      id v6 = [*(id *)(a1 + 48) objectAtIndex:v4];
      [*(id *)(*(void *)(a1 + 32) + 216) addToFront:v6];

      ++v4;
    }
    while (v4 < [*(id *)(a1 + 40) count]);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 168) = v3;
  id v7 = *(void **)(a1 + 32);
  return [v7 _rebuildAppListCache];
}

void __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_2_252(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    char v3 = [WeakRetained windowScene];
    unint64_t v4 = [v3 _fbsDisplayConfiguration];

    id v5 = [*(id *)(a1 + 32) firstObject];
    id v6 = +[SBWorkspace mainWorkspace];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_3_253;
    v9[3] = &unk_1E6AF8300;
    v9[4] = *(void *)(a1 + 40);
    id v10 = v5;
    id v11 = WeakRetained;
    id v7 = WeakRetained;
    id v8 = v5;
    [v6 requestTransitionWithOptions:0 displayConfiguration:v4 builder:0 validator:v9];
  }
}

uint64_t __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_3_253(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v4];
  id v7 = [*(id *)(a1 + 48) dismissSwitcherEventName];
  [v3 _configureRequest:v5 forSwitcherTransitionRequest:v6 withEventLabel:v7];

  return 1;
}

- (void)switcherContentController:(id)a3 setInterfaceOrientation:(int64_t)a4
{
  id v5 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  [v5 _updateContentViewInterfaceOrientation:a4];
}

- (void)switcherContentController:(id)a3 setInterfaceOrientationFromUserResizing:(int64_t)a4 forDisplayItem:(id)a5
{
  id v13 = a3;
  id v9 = a5;
  if (v13)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBMainSwitcherControllerCoordinator.m", 3248, @"Invalid parameter not satisfying: %@", @"controller" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"SBMainSwitcherControllerCoordinator.m", 3249, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];

LABEL_3:
  id v10 = [(SBMainSwitcherControllerCoordinator *)self switcherContentController:v13 deviceApplicationSceneHandleForDisplayItem:v9];
  if (v10) {
    [(SBMainSwitcherControllerCoordinator *)self _setInterfaceOrientationFromUserResizingIfSupported:a4 forSceneHandle:v10];
  }
}

- (void)presentContinuousExposeStripRevealGrabberTongueImmediatelyForSwitcherContentController:(id)a3
{
  id v4 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  char v3 = [v4 gestureManager];
  [v3 presentContinuousExposeStripRevealGrabberTongueImmediately];
}

- (void)tickleContinuousExposeStripRevealGrabberTongueIfVisibleForSwitcherContentController:(id)a3
{
  id v4 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForContentViewController:a3];
  char v3 = [v4 gestureManager];
  [v3 tickleContinuousExposeStripRevealGrabberTongueIfVisible];
}

- (void)fluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 switcherController];
  if ([v7 type] == 8 && objc_msgSend(v8, "windowManagementStyle") == 2)
  {
    draggingAppLayouts = self->_draggingAppLayouts;
    id v10 = [v7 selectedAppLayout];
    [(NSCountedSet *)draggingAppLayouts addObject:v10];

    [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didBeginGesture___block_invoke;
  v14[3] = &unk_1E6AFBD50;
  id v15 = v8;
  id v16 = v7;
  id v17 = v6;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v14];
}

void __83__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didBeginGesture___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isEqual:*(void *)(a1 + 32)] & 1) != 0
    || [*(id *)(a1 + 40) type] == 8
    && (uint64_t v3 = [v4 windowManagementStyle], v3 == objc_msgSend(*(id *)(a1 + 32), "windowManagementStyle")))
  {
    [v4 fluidSwitcherGestureManager:*(void *)(a1 + 48) didBeginGesture:*(void *)(a1 + 40)];
  }
}

- (void)fluidSwitcherGestureManager:(id)a3 didUpdateGesture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 switcherController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __84__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didUpdateGesture___block_invoke;
  v12[3] = &unk_1E6AFBD50;
  id v13 = v8;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v12];
}

void __84__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didUpdateGesture___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isEqual:*(void *)(a1 + 32)] & 1) != 0
    || [*(id *)(a1 + 40) type] == 8
    && (uint64_t v3 = [v4 windowManagementStyle], v3 == objc_msgSend(*(id *)(a1 + 32), "windowManagementStyle")))
  {
    [v4 fluidSwitcherGestureManager:*(void *)(a1 + 48) didUpdateGesture:*(void *)(a1 + 40)];
  }
}

- (void)fluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 switcherController];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didEndGesture___block_invoke;
  v14[3] = &unk_1E6AFBD50;
  id v9 = v8;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  id v11 = v6;
  id v17 = v11;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v14];
  if ([v10 type] == 8 && objc_msgSend(v9, "windowManagementStyle") == 2)
  {
    draggingAppLayouts = self->_draggingAppLayouts;
    id v13 = [v10 selectedAppLayout];
    [(NSCountedSet *)draggingAppLayouts removeObject:v13];

    [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
  }
}

void __81__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didEndGesture___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isEqual:*(void *)(a1 + 32)] & 1) != 0
    || [*(id *)(a1 + 40) type] == 8
    && (uint64_t v3 = [v4 windowManagementStyle], v3 == objc_msgSend(*(id *)(a1 + 32), "windowManagementStyle")))
  {
    [v4 fluidSwitcherGestureManager:*(void *)(a1 + 48) didEndGesture:*(void *)(a1 + 40)];
  }
}

- (void)fluidSwitcherGestureManager:(id)a3 didBeginDraggingWindowWithSceneIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBMainSwitcherControllerCoordinator.m", 3402, @"Invalid parameter not satisfying: %@", @"sceneIdentifier" object file lineNumber description];
  }
  windowDragSceneIdentifiers = self->_windowDragSceneIdentifiers;
  if (!windowDragSceneIdentifiers)
  {
    id v10 = [MEMORY[0x1E4F1CA80] set];
    id v11 = self->_windowDragSceneIdentifiers;
    self->_windowDragSceneIdentifiers = v10;

    windowDragSceneIdentifiers = self->_windowDragSceneIdentifiers;
  }
  [(NSMutableSet *)windowDragSceneIdentifiers addObject:v8];
  [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __109__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didBeginDraggingWindowWithSceneIdentifier___block_invoke;
  v15[3] = &unk_1E6B04350;
  id v16 = v7;
  id v17 = v8;
  id v12 = v8;
  id v13 = v7;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v15];
}

uint64_t __109__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didBeginDraggingWindowWithSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fluidSwitcherGestureManager:*(void *)(a1 + 32) didBeginDraggingWindowWithSceneIdentifier:*(void *)(a1 + 40)];
}

- (void)fluidSwitcherGestureManager:(id)a3 didPlatterizeWindowDragWithSceneIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->_windowDragSceneIdentifiers containsObject:v7]) {
    [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __110__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didPlatterizeWindowDragWithSceneIdentifier___block_invoke;
  v10[3] = &unk_1E6B04350;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v10];
}

uint64_t __110__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didPlatterizeWindowDragWithSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fluidSwitcherGestureManager:*(void *)(a1 + 32) didPlatterizeWindowDragWithSceneIdentifier:*(void *)(a1 + 40)];
}

- (void)fluidSwitcherGestureManager:(id)a3 willEndDraggingWindowWithSceneIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBMainSwitcherControllerCoordinator.m", 3427, @"Invalid parameter not satisfying: %@", @"sceneIdentifier" object file lineNumber description];
  }
  if ([(NSMutableSet *)self->_windowDragSceneIdentifiers containsObject:v8])
  {
    [(NSMutableSet *)self->_windowDragSceneIdentifiers removeObject:v8];
    [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __108__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_willEndDraggingWindowWithSceneIdentifier___block_invoke;
  v12[3] = &unk_1E6B04350;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v12];
}

uint64_t __108__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_willEndDraggingWindowWithSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fluidSwitcherGestureManager:*(void *)(a1 + 32) willEndDraggingWindowWithSceneIdentifier:*(void *)(a1 + 40)];
}

- (void)fluidSwitcherGestureManager:(id)a3 clickReceivedForHomeGrabberView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __99__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_clickReceivedForHomeGrabberView___block_invoke;
  v10[3] = &unk_1E6B04350;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v10];
}

uint64_t __99__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_clickReceivedForHomeGrabberView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fluidSwitcherGestureManager:*(void *)(a1 + 32) clickReceivedForHomeGrabberView:*(void *)(a1 + 40)];
}

- (void)fluidSwitcherGestureManager:(id)a3 tapReceivedForGrabberTongueAtEdge:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __101__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_tapReceivedForGrabberTongueAtEdge___block_invoke;
  v8[3] = &unk_1E6B04378;
  id v9 = v6;
  unint64_t v10 = a4;
  id v7 = v6;
  [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v8];
}

uint64_t __101__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_tapReceivedForGrabberTongueAtEdge___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fluidSwitcherGestureManager:*(void *)(a1 + 32) tapReceivedForGrabberTongueAtEdge:*(void *)(a1 + 40)];
}

- (void)switcherDemoFilteringControllerDidChangeHiddenApplicationBundleIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__62;
  id v24 = __Block_byref_object_dispose__62;
  id v25 = 0;
  id v12 = a3;
  [v12 hiddenApplicationBundleIDs];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        appLayouts = self->_appLayouts;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __106__SBMainSwitcherControllerCoordinator_switcherDemoFilteringControllerDidChangeHiddenApplicationBundleIDs___block_invoke;
        v13[3] = &unk_1E6B043A0;
        id v15 = &v20;
        void v13[4] = v8;
        id v10 = v4;
        id v14 = v10;
        [(NSArray *)appLayouts enumerateObjectsUsingBlock:v13];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v10 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v5);
  }

  demoFilteringHiddenAppLayouts = self->_demoFilteringHiddenAppLayouts;
  if (demoFilteringHiddenAppLayouts != (NSArray *)v21[5]
    && (-[NSArray isEqual:](demoFilteringHiddenAppLayouts, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_demoFilteringHiddenAppLayouts, (id)v21[5]);
    [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
  }

  _Block_object_dispose(&v20, 8);
}

void __106__SBMainSwitcherControllerCoordinator_switcherDemoFilteringControllerDidChangeHiddenApplicationBundleIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "containsObject:") & 1) == 0
    && [v10 containsItemWithBundleIdentifier:*(void *)(a1 + 32)])
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v6 addObject:v10];
    *a4 = 1;
  }
}

- (void)_lockKeyboardFocusForSwitcherController:(id)a3
{
  if (!self->_lockKeyboardFocusAssertion)
  {
    keyboardFocusController = self->_keyboardFocusController;
    id v8 = [a3 windowScene];
    uint64_t v5 = +[SBKeyboardFocusLockReason appSwitcher];
    uint64_t v6 = [(SBKeyboardFocusControlling *)keyboardFocusController focusLockSpringBoardWindowScene:v8 forReason:v5];
    lockKeyboardFocusAssertiouint64_t n = self->_lockKeyboardFocusAssertion;
    self->_lockKeyboardFocusAssertiouint64_t n = v6;
  }
}

- (void)_warmAppInfoForAppsInList
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = -[SBAppSwitcherModel appLayoutsIncludingHiddenAppLayouts:](self->_mainSwitcherModel, "appLayoutsIncludingHiddenAppLayouts:", 0, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) enumerate:&__block_literal_global_270_0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __64__SBMainSwitcherControllerCoordinator__warmAppInfoForAppsInList__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (![v6 type])
  {
    uint64_t v3 = +[SBApplicationController sharedInstance];
    uint64_t v4 = [v6 bundleIdentifier];
    uint64_t v5 = [v3 applicationWithBundleIdentifier:v4];

    [v5 isClassic];
  }
}

- (void)_applicationDidExit:(id)a3
{
  uint64_t v4 = [a3 object];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 lastExitContext];
    uint64_t v7 = [v6 terminationReason];

    if (v7 != 1)
    {
      long long v8 = (void *)MEMORY[0x1E4F624D8];
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __59__SBMainSwitcherControllerCoordinator__applicationDidExit___block_invoke;
      id v15 = &unk_1E6AF5290;
      id v16 = v5;
      long long v17 = self;
      long long v9 = [v8 eventWithName:@"SBMainSwitcherCoordinatorFloatingExitSanityCheck" handler:&v12];
      long long v10 = +[SBWorkspace mainWorkspace];
      id v11 = [v10 eventQueue];
      [v11 executeOrAppendEvent:v9];
    }
  }
}

void __59__SBMainSwitcherControllerCoordinator__applicationDidExit___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) failedLaunchCount];
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "bs_firstObjectPassingTest:", &__block_literal_global_276);
  uint64_t v4 = [v3 itemForLayoutRole:1];
  uint64_t v5 = [v4 bundleIdentifier];
  if (v5) {
    BOOL v6 = v2 >= 2;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) bundleIdentifier];
    int v8 = [v5 isEqual:v7];

    if (v8)
    {
      [*(id *)(*(void *)(a1 + 40) + 216) remove:v3];
      long long v9 = [SBAppLayout alloc];
      long long v10 = [NSNumber numberWithInteger:1];
      id v14 = v10;
      v15[0] = v4;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      uint64_t v12 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v9, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v11, 1, 1, [v3 preferredDisplayOrdinal]);

      [*(id *)(a1 + 40) _addAppLayoutToFront:v12];
    }
  }
  uint64_t v13 = *(void **)(a1 + 32);
  if (v13 && v2 >= 2) {
    [v13 setLastWindowLayoutAttributes:0];
  }
}

BOOL __59__SBMainSwitcherControllerCoordinator__applicationDidExit___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 environment] == 2;
}

- (void)_addAppLayoutToFront:(id)a3
{
}

- (id)_transientOverlayPresentationManager
{
  unint64_t v2 = +[SBWorkspace mainWorkspace];
  uint64_t v3 = [v2 transientOverlayPresentationManager];

  return v3;
}

- (void)_setInterfaceOrientationFromUserResizingIfSupported:(int64_t)a3 forSceneHandle:(id)a4
{
  id v14 = a4;
  uint64_t v5 = [v14 application];
  char v6 = [v5 isMedusaCapable];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [v14 application];
    char v8 = [v7 classicAppPhoneAppRunningOnPad];

    if ((v8 & 1) == 0)
    {
      long long v9 = [v14 _windowScene];
      if (([v9 isExternalDisplayWindowScene] & 1) == 0)
      {
        uint64_t v10 = objc_opt_class();
        id v11 = [v9 switcherController];
        uint64_t v12 = [v11 contentViewController];
        uint64_t v13 = SBSafeCast(v10, v12);

        if (v13)
        {
          if ([v13 contentOrientation] == a3) {
            a3 = 0;
          }
        }
        else
        {
          a3 = 0;
        }
      }
    }
    [v14 _setInterfaceOrientationFromUserResizing:a3];
  }
}

- (void)_keyboardWillShow:(id)a3
{
  if (!self->_isKeyboardShowing)
  {
    self->_isKeyboardShowing = 1;
    [(SBMainSwitcherControllerCoordinator *)self _updateKeyboardHomeAffordanceAssertion];
  }
}

- (void)_keyboardWillHide:(id)a3
{
  if (self->_isKeyboardShowing)
  {
    self->_isKeyboardShowing = 0;
    [(SBMainSwitcherControllerCoordinator *)self _updateKeyboardHomeAffordanceAssertion];
  }
}

- (void)noteKeyboardIsForMedusaWithOwningScene:(id)a3
{
  uint64_t v5 = (FBScene *)a3;
  if (self->_medusaKeyboardScene != v5)
  {
    char v8 = v5;
    char v6 = [(SBMainSwitcherControllerCoordinator *)self _medusaKeyboardSceneHandle];
    [v6 removeObserver:self];

    objc_storeStrong((id *)&self->_medusaKeyboardScene, a3);
    uint64_t v7 = [(SBMainSwitcherControllerCoordinator *)self _medusaKeyboardSceneHandle];
    [v7 addObserver:self];

    [(SBMainSwitcherControllerCoordinator *)self _updateKeyboardHomeAffordanceAssertion];
    uint64_t v5 = v8;
  }
}

- (BOOL)_keyboardIsSuppressedForMedusaKeyboardScene
{
  unint64_t v2 = [(FBScene *)self->_medusaKeyboardScene settings];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = ((unint64_t)[v2 deactivationReasons] >> 8) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)_chamoisWindowingUIEverEnabledDefaultChangeHandler
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[SBDefaults localDefaults];
  uint64_t v5 = [v4 appSwitcherDefaults];

  if ([v5 chamoisEverEnabled])
  {
    char v6 = +[SBControlCenterController sharedInstanceIfExists];
    [v6 dismissAnimated:1];

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.SpringBoardEducation" viewControllerClassName:@"SBERemoteViewController"];
    id v8 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
    long long v9 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v7 configurationContext:v8];
    id v10 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
    id v24 = @"SBEducationRemoteViewControllerEducationTypeKey";
    v25[0] = &unk_1F334A5E0;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [v10 setUserInfo:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F4F668]);
    uint64_t v13 = (void *)MEMORY[0x1E4F4F670];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    long long v19 = __89__SBMainSwitcherControllerCoordinator__chamoisWindowingUIEverEnabledDefaultChangeHandler__block_invoke;
    uint64_t v20 = &unk_1E6B043E8;
    id v21 = v5;
    uint64_t v22 = self;
    SEL v23 = a2;
    id v14 = [v13 responderWithHandler:&v17];
    id v15 = objc_msgSend(v12, "initWithInfo:responder:", 0, v14, v17, v18, v19, v20);

    id v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
    [v10 setActions:v16];

    [v9 activateWithContext:v10];
  }
}

void __89__SBMainSwitcherControllerCoordinator__chamoisWindowingUIEverEnabledDefaultChangeHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];
  if (v4)
  {
    uint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __89__SBMainSwitcherControllerCoordinator__chamoisWindowingUIEverEnabledDefaultChangeHandler__block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }
  }
  else
  {
    char v6 = [v3 info];
    BOOL v7 = [v6 flagForSetting:0] != 0;

    [*(id *)(a1 + 32) setChamoisWindowingEnabled:v7];
  }
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  char v6 = [a3 scene];
  medusaKeyboardScene = self->_medusaKeyboardScene;

  if (v6 == medusaKeyboardScene)
  {
    [(SBMainSwitcherControllerCoordinator *)self _updateKeyboardHomeAffordanceAssertion];
  }
}

- (void)_switcherServiceAdded:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"AppSwitcherService"];

  char v6 = [v5 bundleIdentifier];
  BOOL v7 = +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:v6];
  id v8 = [(SBMainSwitcherControllerCoordinator *)self _appLayoutFromPrimaryLayoutItem:v7 sideLayoutElement:0 configuration:1];
  long long v9 = [(id)SBApp windowSceneManager];
  id v10 = [v9 activeDisplayWindowScene];

  id v11 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v10];
  id v12 = [v11 contentViewController];
  NSUInteger v13 = [(NSArray *)self->_appLayouts indexOfObject:v8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__SBMainSwitcherControllerCoordinator__switcherServiceAdded___block_invoke;
  v14[3] = &unk_1E6AF4AC0;
  void v14[4] = self;
  [(SBMainSwitcherControllerCoordinator *)self _insertAppLayout:v8 atIndex:v13 contentViewController:v12 modelMutationBlock:v14 completion:0];
}

uint64_t __61__SBMainSwitcherControllerCoordinator__switcherServiceAdded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rebuildAppListCache];
}

- (void)_switcherServiceRemoved:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBMainSwitcherControllerCoordinator *)self isAnySwitcherVisible];
  char v6 = [v4 userInfo];

  id v13 = [v6 objectForKey:@"AppSwitcherService"];

  if (v5)
  {
    BOOL v7 = [v13 bundleIdentifier];
    id v8 = +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:v7];

    long long v9 = [(SBMainSwitcherControllerCoordinator *)self _appLayoutFromPrimaryLayoutItem:v8 sideLayoutElement:0 configuration:1];
    id v10 = objc_alloc_init(SBSwitcherModelRemovalRequest);
    id v11 = +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction];
    [(SBSwitcherModelRemovalRequest *)v10 setAction:v11 forAppLayout:v9];

    id v12 = [(SBMainSwitcherControllerCoordinator *)self _switcherModelRemovalResultsForRequest:v10 forReason:0];
    [(SBMainSwitcherControllerCoordinator *)self _performSceneDestructionForModelRemovalResults:v12];
  }
  else
  {
    [(NSMutableArray *)self->_servicesRemovedWhileAwayFromSwitcher addObject:v13];
  }
}

void __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  char v6 = [a3 bundleIdentifier];
  if (v6)
  {
    id v8 = v6;
    BOOL v7 = +[SBApplicationAppProtectionAssistant shouldHideApplicationWithBundleIdentifier:v6];
    char v6 = v8;
    if (v7)
    {
      [*(id *)(a1 + 32) addIndex:*(void *)(a1 + 40)];
      char v6 = v8;
      *a4 = 1;
    }
  }
}

uint64_t __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsItem:a2] ^ 1;
}

id __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_5(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_6;
  v4[3] = &unk_1E6AF4B38;
  void v4[4] = *(void *)(a1 + 32);
  unint64_t v2 = [a2 appLayoutWithItemsPassingTest:v4];
  return v2;
}

uint64_t __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsItem:a2] ^ 1;
}

void __98__SBMainSwitcherControllerCoordinator__rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary__block_invoke(void *a1, void *a2)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 windowScene];
  if ([v3 windowManagementStyle] == 2)
  {
    uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 40);
    if (v5) {
      goto LABEL_15;
    }
    char v6 = v4;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v7 = *(id *)(a1[4] + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v56 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          id v13 = [v12 appLayoutByAdjustingCenterWindowItemsForChamois];
          if (([v13 isEqual:v12] & 1) == 0)
          {
            id v14 = *(void **)(*(void *)(a1[5] + 8) + 40);
            if (!v14)
            {
              uint64_t v15 = [*(id *)(a1[4] + 48) mutableCopy];
              uint64_t v16 = *(void *)(a1[5] + 8);
              uint64_t v17 = *(void **)(v16 + 40);
              *(void *)(v16 + 40) = v15;

              id v14 = *(void **)(*(void *)(a1[5] + 8) + 40);
            }
            objc_msgSend(v14, "replaceObjectAtIndex:withObject:", objc_msgSend(v14, "indexOfObject:", v12), v13);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v9);
    }

    uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 40);
    id v4 = v6;
    if (v5)
    {
LABEL_15:
      uint64_t v18 = *(void **)(a1[4] + 32);
      if (!v18)
      {
        uint64_t v19 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        uint64_t v20 = a1[4];
        id v21 = *(void **)(v20 + 32);
        *(void *)(v20 + 32) = v19;

        uint64_t v18 = *(void **)(a1[4] + 32);
        uint64_t v22 = *(void *)(a1[5] + 8);
LABEL_41:
        uint64_t v5 = *(void *)(v22 + 40);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    goto LABEL_44;
  }
  if ([v3 windowManagementStyle] == 1 || !objc_msgSend(v3, "windowManagementStyle"))
  {
    uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
    if (v5) {
      goto LABEL_39;
    }
    id v43 = v4;
    id v44 = v3;
    uint64_t v46 = [v3 windowManagementStyle];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    obuint64_t j = *(id *)(a1[4] + 48);
    uint64_t v23 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v52 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          id v28 = +[SBApplicationController sharedInstance];
          id v29 = [v27 appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:v28 multitaskingSupported:v46 == 1];

          if (v29)
          {
            id v30 = *(void **)(*(void *)(a1[6] + 8) + 40);
            if (!v30)
            {
              uint64_t v31 = [*(id *)(a1[4] + 48) mutableCopy];
              uint64_t v32 = *(void *)(a1[6] + 8);
              id v33 = *(void **)(v32 + 40);
              *(void *)(v32 + 40) = v31;

              id v30 = *(void **)(*(void *)(a1[6] + 8) + 40);
            }
            uint64_t v34 = [v30 indexOfObject:v27];
            [*(id *)(*(void *)(a1[6] + 8) + 40) removeObject:v27];
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v35 = v29;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v47 objects:v59 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v48;
              do
              {
                for (uint64_t k = 0; k != v37; ++k)
                {
                  if (*(void *)v48 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  [*(id *)(*(void *)(a1[6] + 8) + 40) insertObject:*(void *)(*((void *)&v47 + 1) + 8 * k) atIndex:v34 + k];
                }
                uint64_t v37 = [v35 countByEnumeratingWithState:&v47 objects:v59 count:16];
                v34 += k;
              }
              while (v37);
            }
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v24);
    }

    uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
    id v4 = v43;
    id v3 = v44;
    if (v5)
    {
LABEL_39:
      uint64_t v18 = *(void **)(a1[4] + 32);
      if (!v18)
      {
        uint64_t v40 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        uint64_t v41 = a1[4];
        id v42 = *(void **)(v41 + 32);
        *(void *)(v41 + 32) = v40;

        uint64_t v18 = *(void **)(a1[4] + 32);
        uint64_t v22 = *(void *)(a1[6] + 8);
        goto LABEL_41;
      }
LABEL_42:
      [v18 setObject:v5 forKey:v4];
      goto LABEL_43;
    }
LABEL_44:
    [*(id *)(a1[4] + 32) removeObjectForKey:v4];
  }
LABEL_43:
}

- (void)_notifySwitcherControllersCoordinatedSwitcherControllersDidChange
{
}

void __104__SBMainSwitcherControllerCoordinator__notifySwitcherControllersCoordinatedSwitcherControllersDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 contentViewController];
  [v2 noteCoordinatedSwitcherControllersDidChange];
}

- (void)_insertAppLayout:(id)a3 atIndex:(unint64_t)a4 contentViewController:(id)a5 modelMutationBlock:(id)a6 completion:(id)a7
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v21[0] = a3;
  id v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  uint64_t v17 = [v12 arrayWithObjects:v21 count:1];
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v20 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];

  [(SBMainSwitcherControllerCoordinator *)self _insertAppLayouts:v17 atIndexes:v19 contentViewController:v15 modelMutationBlock:v14 completion:v13];
}

- (void)_insertAppLayouts:(id)a3 atIndexes:(id)a4 contentViewController:(id)a5 modelMutationBlock:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(void))a6;
  id v15 = (void (**)(id, uint64_t, void))a7;
  if ([v13 shouldAnimateInsertionOfAppLayouts:v11 atIndexes:v12])
  {
    [v13 prepareAnimatedInsertionOfAppLayouts:v11 atIndexes:v12];
    v14[2](v14);
    [v13 noteModelDidMutateForInsertionOfAppLayouts:v11 atIndexes:v12 willAnimate:1];
    id v16 = (void *)MEMORY[0x1E4FA5E48];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __119__SBMainSwitcherControllerCoordinator__insertAppLayouts_atIndexes_contentViewController_modelMutationBlock_completion___block_invoke;
    v17[3] = &unk_1E6B03598;
    id v18 = v13;
    id v19 = v11;
    id v20 = v12;
    [v16 perform:v17 finalCompletion:v15];
  }
  else
  {
    v14[2](v14);
    [v13 noteModelDidMutateForInsertionOfAppLayouts:v11 atIndexes:v12 willAnimate:0];
    if (v15) {
      v15[2](v15, 1, 0);
    }
  }
}

void __119__SBMainSwitcherControllerCoordinator__insertAppLayouts_atIndexes_contentViewController_modelMutationBlock_completion___block_invoke(void *a1, uint64_t a2)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  (*(void (**)(uint64_t, __CFString *))(a2 + 16))(a2, @"insert main app layouts");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 performAnimatedInsertionOfAppLayouts:v3 atIndexes:v4 completion:v5];
}

- (void)_cancelPIPForDisplayItem:(id)a3
{
  id v4 = a3;
  id v12 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerForDisplayItem:v4];
  id v5 = [v12 _deviceApplicationSceneHandleForDisplayItem:v4];

  if (v5)
  {
    char v6 = +[SBWorkspace mainWorkspace];
    id v7 = [v6 pipControllerForType:0];

    uint64_t v8 = [v5 application];
    uint64_t v9 = [v8 processState];
    uint64_t v10 = [v9 pid];
    id v11 = [v5 persistenceIdentifier];
    [v7 cancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:v10 scenePersistenceIdentifier:v11];
  }
}

- (void)_deleteAppLayoutsMatchingBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBAppSwitcherModel *)self->_mainSwitcherModel _recentAppLayoutsController];
  char v6 = [v5 recentDisplayItemsForBundleIdentifier:v4 includingHiddenAppLayouts:1];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
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
        -[SBMainSwitcherControllerCoordinator deleteAppLayoutForDisplayItem:](self, "deleteAppLayoutForDisplayItem:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)_hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__SBMainSwitcherControllerCoordinator__hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene___block_invoke;
  v6[3] = &unk_1E6AFD168;
  void v6[4] = self;
  void v6[5] = &v7;
  [v4 enumerate:v6];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

void __98__SBMainSwitcherControllerCoordinator__hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 344), "objectForKey:");
  if (v2)
  {
    id v8 = v2;
    BOOL v3 = (unint64_t)[v2 count] >= 2;
    id v2 = v8;
    if (v3)
    {
      id v4 = [v8 lastObject];
      [v4 doubleValue];

      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      char v5 = BSFloatLessThanOrEqualToFloat();
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v6 + 24)) {
        char v7 = 1;
      }
      else {
        char v7 = v5;
      }
      id v2 = v8;
      *(unsigned char *)(v6 + 24) = v7;
    }
  }
}

- (void)_noteUIWillLock
{
  [(SBMainSwitcherControllerCoordinator *)self _purgeHiddenAppLayoutsForUILock];
  [(SBMainSwitcherControllerCoordinator *)self _activateHomeScreenForProtectedHiddenAppOnUILock];
  recentSwipeUpToKillTimestampsForAppLayouts = self->_recentSwipeUpToKillTimestampsForAppLayouts;
  [(NSMutableDictionary *)recentSwipeUpToKillTimestampsForAppLayouts removeAllObjects];
}

- (void)_activateHomeScreenForProtectedHiddenAppOnUILock
{
}

void __87__SBMainSwitcherControllerCoordinator__activateHomeScreenForProtectedHiddenAppOnUILock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isAnyProtectedHiddenApplicationVisible]) {
    [v2 activateHomeScreenWithSource:7 animated:0];
  }
}

- (void)_purgeHiddenAppLayoutsForUILock
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(SBAppSwitcherModel *)self->_mainSwitcherModel appLayoutsIncludingHiddenAppLayouts:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v70 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        long long v12 = [v11 allItems];
        [v5 addObjectsFromArray:v12];

        if ([v11 isHidden]) {
          [v3 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v8);
  }
  long long v48 = v3;
  long long v49 = v6;

  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v65 objects:v77 count:16];
  long long v52 = v13;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v66;
    uint64_t v51 = *(void *)v66;
    do
    {
      uint64_t v17 = 0;
      uint64_t v55 = v15;
      do
      {
        if (*(void *)v66 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v65 + 1) + 8 * v17);
        mainSwitcherModel = self->_mainSwitcherModel;
        id v20 = objc_msgSend(v18, "bundleIdentifier", v48);
        id v21 = [(SBAppSwitcherModel *)mainSwitcherModel appLayoutsForBundleIdentifier:v20 includingHiddenAppLayouts:1];

        uint64_t v22 = self->_mainSwitcherModel;
        uint64_t v23 = [v18 bundleIdentifier];
        uint64_t v24 = [(SBAppSwitcherModel *)v22 appLayoutsForBundleIdentifier:v23 includingHiddenAppLayouts:0];

        if (![v24 count] && objc_msgSend(v21, "count"))
        {
          uint64_t v25 = [v21 firstObject];
          id v26 = [v25 allItems];
          unint64_t v27 = [v26 count];

          if (v27 < 2)
          {
            [v53 addObject:v25];
          }
          else
          {
            id v28 = [v25 itemForLayoutRole:1];
            id v29 = [v25 itemForLayoutRole:2];
            long long v54 = v28;
            id v30 = [v28 bundleIdentifier];
            uint64_t v31 = [v29 bundleIdentifier];
            char v32 = [v30 isEqualToString:v31];

            if ((v32 & 1) == 0)
            {
              id v33 = [SBAppLayout alloc];
              uint64_t v34 = [NSNumber numberWithInteger:1];
              long long v75 = v34;
              long long v76 = v18;
              id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
              uint64_t v36 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:hidden:preferredDisplayOrdinal:](v33, "initWithItemsForLayoutRoles:configuration:environment:hidden:preferredDisplayOrdinal:", v35, 1, [v25 environment], 1, objc_msgSend(v25, "preferredDisplayOrdinal"));

              [v50 addObject:v36];
            }

            uint64_t v16 = v51;
            id v13 = v52;
          }

          uint64_t v15 = v55;
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v15);
  }

  [v48 removeObjectsInArray:v53];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v37 = v48;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v62 != v40) {
          objc_enumerationMutation(v37);
        }
        id v42 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __70__SBMainSwitcherControllerCoordinator__purgeHiddenAppLayoutsForUILock__block_invoke;
        v60[3] = &unk_1E6AF4F20;
        v60[4] = self;
        v60[5] = v42;
        objc_msgSend(v42, "enumerate:", v60, v48);
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v39);
  }

  [(SBAppSwitcherModel *)self->_mainSwitcherModel removeAppLayouts:v37];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v43 = v50;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v56 objects:v73 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v57;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v57 != v46) {
          objc_enumerationMutation(v43);
        }
        -[SBAppSwitcherModel addToFront:](self->_mainSwitcherModel, "addToFront:", *(void *)(*((void *)&v56 + 1) + 8 * k), v48);
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v56 objects:v73 count:16];
    }
    while (v45);
  }
}

void __70__SBMainSwitcherControllerCoordinator__purgeHiddenAppLayoutsForUILock__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a3;
  id v6 = [v4 preferredDisplayIdentity];
  id v7 = [v3 _entityForDisplayItem:v5 displayIdentity:v6];

  SBWorkspaceDestroyApplicationEntity(v7);
}

- (void)_performSceneDestructionForModelRemovalResults:(id)a3
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v93 = a3;
  obuint64_t j = [v93 appLayouts];
  uint64_t v85 = [obj countByEnumeratingWithState:&v140 objects:v155 count:16];
  if (v85)
  {
    uint64_t v84 = *(void *)v141;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v141 != v84) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v140 + 1) + 8 * v3);
        id v5 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForAppLayout:v4];
        uint64_t v97 = [v5 _currentMainAppLayout];
        long long v87 = v5;
        unsigned int v96 = [v5 _currentFloatingAppLayout];
        id v6 = [v93 replacementAppLayoutForAppLayout:v4];
        id v7 = [v4 allItems];
        uint64_t v88 = v3;
        if (v6)
        {
          uint64_t v8 = [v4 allItems];
          uint64_t v9 = (void *)[v8 mutableCopy];

          char v10 = [v6 allItems];
          [v9 removeObjectsInArray:v10];

          id v7 = v9;
        }
        uint64_t v90 = objc_opt_new();
        uint64_t v89 = objc_opt_new();
        uint64_t v11 = objc_opt_new();
        long long v136 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        id v12 = v7;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v136 objects:v154 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v137;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v137 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v136 + 1) + 8 * i);
              id v18 = [v4 preferredDisplayIdentity];
              id v19 = [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v17 displayIdentity:v18];

              if (v19)
              {
                uint64_t v152 = v17;
                long long v153 = v19;
                id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
                [v11 addEntriesFromDictionary:v20];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v136 objects:v154 count:16];
          }
          while (v14);
        }

        char v92 = objc_opt_new();
        uint64_t v91 = objc_opt_new();
        id v21 = +[SBSceneManagerCoordinator sharedInstance];
        uint64_t v22 = [v21 sceneDeactivationManager];
        uint64_t v23 = (void *)[v22 newAssertionWithReason:3];

        v134[0] = MEMORY[0x1E4F143A8];
        v134[1] = 3221225472;
        v134[2] = __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke;
        v134[3] = &unk_1E6AF9A10;
        id v102 = v11;
        id v135 = v102;
        long long v86 = v23;
        [v23 acquireWithPredicate:v134 transitionContext:0];
        [v93 executeActionForAppLayout:v4];
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        id v98 = v12;
        BOOL v95 = v6;
        uint64_t v103 = [v98 countByEnumeratingWithState:&v130 objects:v151 count:16];
        if (v103)
        {
          uint64_t v24 = *(void *)v131;
          uint64_t v94 = *(void *)v131;
          long long v100 = v4;
          do
          {
            for (uint64_t j = 0; j != v103; ++j)
            {
              if (*(void *)v131 != v24) {
                objc_enumerationMutation(v98);
              }
              id v26 = *(void **)(*((void *)&v130 + 1) + 8 * j);
              unint64_t v27 = [v26 bundleIdentifier];
              if (v27)
              {
                id v28 = [v102 objectForKey:v26];
                if ([v28 isDeviceApplicationSceneEntity])
                {
                  id v29 = [v28 deviceApplicationSceneEntity];
                  id v30 = [v29 sceneHandle];

                  if (v30)
                  {
                    int v31 = [v30 prefersKillingInSwitcherDisabled];
                    if (v6)
                    {
LABEL_26:
                      char v32 = [v26 bundleIdentifier];
                      int v33 = [v6 containsItemWithBundleIdentifier:v32];

                      if (v33) {
                        int v31 = 1;
                      }
                    }
                  }
                  else
                  {
                    int v31 = 0;
                    if (v6) {
                      goto LABEL_26;
                    }
                  }
                  if ([v93 willHideDisplayItem:v26]) {
                    uint64_t v34 = v92;
                  }
                  else {
                    uint64_t v34 = v91;
                  }
                  [v34 addObject:v28];
                  if (!v31)
                  {
LABEL_33:
                    id v35 = [(SBAppSwitcherModel *)self->_mainSwitcherModel appLayoutsForBundleIdentifier:v27 includingHiddenAppLayouts:0];
                    uint64_t v36 = v35;
                    if (v35) {
                      BOOL v37 = [v35 count] == 0;
                    }
                    else {
                      BOOL v37 = 1;
                    }
                    int v38 = [v97 isEqual:v100];
                    if ([v96 isEqual:v100]) {
                      int v39 = [v97 containsItemWithBundleIdentifier:v27] ^ 1;
                    }
                    else {
                      int v39 = 0;
                    }
                    uint64_t v24 = v94;
                    id v6 = v95;
                    if (((v37 | v38) & 1) != 0 || v39)
                    {
                      uint64_t v40 = +[SBApplicationController sharedInstance];
                      uint64_t v41 = [v40 applicationForDisplayItem:v26];

                      if (v41)
                      {
                        id v42 = [(NSMutableDictionary *)self->_appLayoutToEligibleTransientOverlayViewController objectForKey:v100];
                        if (v42)
                        {
                        }
                        else
                        {
                          id v43 = [v41 processState];
                          int v44 = [v43 isRunning];

                          if (v44)
                          {
                            [v90 addObject:v41];
                            if (v30) {
                              [v89 addObject:v30];
                            }
                          }
                        }
                      }
                    }
                  }

                  goto LABEL_52;
                }
                id v30 = 0;
                goto LABEL_33;
              }
LABEL_52:
            }
            uint64_t v103 = [v98 countByEnumeratingWithState:&v130 objects:v151 count:16];
          }
          while (v103);
        }

        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        id v45 = v89;
        uint64_t v46 = [v45 countByEnumeratingWithState:&v126 objects:v150 count:16];
        long long v47 = v97;
        if (v46)
        {
          uint64_t v48 = v46;
          uint64_t v49 = *(void *)v127;
          do
          {
            for (uint64_t k = 0; k != v48; ++k)
            {
              if (*(void *)v127 != v49) {
                objc_enumerationMutation(v45);
              }
              uint64_t v51 = [*(id *)(*((void *)&v126 + 1) + 8 * k) sceneIfExists];
              [v51 updateSettingsWithBlock:&__block_literal_global_319];
            }
            uint64_t v48 = [v45 countByEnumeratingWithState:&v126 objects:v150 count:16];
          }
          while (v48);
        }

        long long v52 = objc_msgSend(v92, "bs_compactMap:", &__block_literal_global_322);
        id v53 = SBApplicationSceneEntityDestructionMakeIntent(1, 0);
        long long v54 = [MEMORY[0x1E4F1CAD0] setWithArray:v52];
        char v104 = v53;
        SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v54, v53, &__block_literal_global_325);

        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        id v55 = v91;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v122 objects:v149 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v123;
          do
          {
            for (uint64_t m = 0; m != v57; ++m)
            {
              if (*(void *)v123 != v58) {
                objc_enumerationMutation(v55);
              }
              SBWorkspaceDestroyApplicationEntity(*(void **)(*((void *)&v122 + 1) + 8 * m));
            }
            uint64_t v57 = [v55 countByEnumeratingWithState:&v122 objects:v149 count:16];
          }
          while (v57);
        }

        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        long long v60 = [v102 allValues];
        uint64_t v61 = [v60 countByEnumeratingWithState:&v118 objects:v148 count:16];
        if (v61)
        {
          uint64_t v62 = v61;
          uint64_t v63 = *(void *)v119;
          do
          {
            for (uint64_t n = 0; n != v62; ++n)
            {
              if (*(void *)v119 != v63) {
                objc_enumerationMutation(v60);
              }
              long long v65 = *(void **)(*((void *)&v118 + 1) + 8 * n);
              if ([v65 isApplicationSceneEntity]) {
                SBWorkspaceNoteApplicationEntityWasRemovedFromAppSwitcher(v65);
              }
            }
            uint64_t v62 = [v60 countByEnumeratingWithState:&v118 objects:v148 count:16];
          }
          while (v62);
        }

        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v66 = v98;
        uint64_t v67 = [v66 countByEnumeratingWithState:&v114 objects:v147 count:16];
        if (v67)
        {
          uint64_t v68 = v67;
          uint64_t v69 = *(void *)v115;
          do
          {
            for (iuint64_t i = 0; ii != v68; ++ii)
            {
              if (*(void *)v115 != v69) {
                objc_enumerationMutation(v66);
              }
              [(SBMainSwitcherControllerCoordinator *)self _cancelPIPForDisplayItem:*(void *)(*((void *)&v114 + 1) + 8 * ii)];
            }
            uint64_t v68 = [v66 countByEnumeratingWithState:&v114 objects:v147 count:16];
          }
          while (v68);
        }

        long long v71 = v90;
        if ([v90 count])
        {
          id v99 = v52;
          id v101 = v45;
          long long v72 = dispatch_group_create();
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          id v73 = v90;
          uint64_t v74 = [v73 countByEnumeratingWithState:&v110 objects:v146 count:16];
          if (v74)
          {
            uint64_t v75 = v74;
            uint64_t v76 = *(void *)v111;
            do
            {
              for (juint64_t j = 0; jj != v75; ++jj)
              {
                if (*(void *)v111 != v76) {
                  objc_enumerationMutation(v73);
                }
                long long v78 = *(void **)(*((void *)&v110 + 1) + 8 * jj);
                dispatch_group_enter(v72);
                uint64_t v79 = [v78 bundleIdentifier];
                v108[0] = MEMORY[0x1E4F143A8];
                v108[1] = 3221225472;
                v108[2] = __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_329;
                v108[3] = &unk_1E6AF5350;
                id v109 = v72;
                SBWorkspaceKillApplication(v78, 1, @"killed from app switcher", v108);
                uint64_t v80 = [MEMORY[0x1E4F28EB8] defaultCenter];
                long long v144 = @"SBAppSwitcherQuitAppBundleIdentifierKey";
                id v145 = v79;
                uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
                [v80 postNotificationName:@"SBAppSwitcherQuitAppNotification" object:0 userInfo:v81];

                [(SBApplicationUserQuitMonitorServer *)self->_userQuitMonitorServer userClosedLastSceneOfApplicationWithBundleID:v79];
              }
              uint64_t v75 = [v73 countByEnumeratingWithState:&v110 objects:v146 count:16];
            }
            while (v75);
          }

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_2_330;
          block[3] = &unk_1E6AF4AC0;
          uint64_t v82 = v86;
          id v107 = v86;
          dispatch_group_notify(v72, MEMORY[0x1E4F14428], block);

          long long v47 = v97;
          long long v52 = v99;
          long long v71 = v90;
          id v45 = v101;
        }
        else
        {
          uint64_t v82 = v86;
          [v86 relinquish];
        }

        uint64_t v3 = v88 + 1;
      }
      while (v88 + 1 != v85);
      uint64_t v85 = [obj countByEnumeratingWithState:&v140 objects:v155 count:16];
    }
    while (v85);
  }
}

uint64_t __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) applicationSceneEntity];
        if (v8)
        {
          uint64_t v9 = v8;
          char v10 = [v8 sceneHandle];
          uint64_t v11 = [v10 sceneIdentifier];
          id v12 = [v3 identifier];
          char v13 = [v11 isEqualToString:v12];

          if (v13)
          {
            uint64_t v5 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

uint64_t __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

uint64_t __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 sceneHandle];
}

void __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = SBLogAppSwitcher();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_4_cold_1((uint64_t)v3, v4);
    }
  }
}

void __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_329(uint64_t a1)
{
}

uint64_t __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_2_330(uint64_t a1)
{
  return [*(id *)(a1 + 32) relinquish];
}

- (id)_resultsForDisplayItemRemovalResolutionRequest:(id)a3 preferredAppLayoutForRemovalAnimationIfAny:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v35 = a4;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  int v38 = v5;
  obuint64_t j = [v5 displayItems];
  uint64_t v41 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v41)
  {
    int v39 = 0;
    uint64_t v40 = *(void *)v58;
    while (1)
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v58 != v40) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if (![v7 type] || objc_msgSend(v7, "type") == 5)
        {
          uint64_t v8 = [v38 removalIntentTypeForDisplayItem:v7];
          uint64_t v9 = [(SBMainSwitcherControllerCoordinator *)self _nonHiddenAppLayoutsForDisplayItem:v7];
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __129__SBMainSwitcherControllerCoordinator__resultsForDisplayItemRemovalResolutionRequest_preferredAppLayoutForRemovalAnimationIfAny___block_invoke;
          v56[3] = &unk_1E6AF4B60;
          void v56[4] = v7;
          char v10 = objc_msgSend(v9, "bs_filter:", v56);
          int v44 = v9;
          uint64_t v45 = i;
          if ((unint64_t)[v10 count] < 2)
          {
            id v12 = 0;
          }
          else
          {
            if (v35)
            {
              id v11 = v35;
            }
            else
            {
              id v11 = [v10 firstObject];
            }
            char v13 = v11;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v14 = v10;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v62 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              id v12 = 0;
              uint64_t v17 = *(void *)v53;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v53 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  id v19 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                  if (v19 != v13
                    && [v13 containsAllItemsFromAppLayout:*(void *)(*((void *)&v52 + 1) + 8 * j)])
                  {
                    if (!v12) {
                      id v12 = objc_opt_new();
                    }
                    [v12 addObject:v19];
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v52 objects:v62 count:16];
              }
              while (v16);
            }
            else
            {
              id v12 = 0;
            }
          }
          id v43 = v12;
          uint64_t v20 = objc_msgSend(v10, "sb_arrayByRemovingObjects:", v12);

          id v42 = v7;
          id v21 = [v7 uniqueIdentifier];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v22 = v20;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v61 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            id v25 = 0;
            uint64_t v26 = *(void *)v49;
            while (1)
            {
              uint64_t v27 = 0;
              do
              {
                if (*(void *)v49 != v26) {
                  objc_enumerationMutation(v22);
                }
                id v28 = *(void **)(*((void *)&v48 + 1) + 8 * v27);
                if (v8 != 2) {
                  goto LABEL_37;
                }
                v46[0] = MEMORY[0x1E4F143A8];
                v46[1] = 3221225472;
                v46[2] = __129__SBMainSwitcherControllerCoordinator__resultsForDisplayItemRemovalResolutionRequest_preferredAppLayoutForRemovalAnimationIfAny___block_invoke_2;
                v46[3] = &unk_1E6AF4B38;
                id v47 = v21;
                id v29 = [v28 appLayoutWithItemsPassingTest:v46];
                id v30 = v29;
                if (!v29 || [v29 type] == 1)
                {

LABEL_37:
                  int v31 = +[SBSwitcherDisplayItemRemovalResolutionResultAction defaultRemovalPolicyActionWithAppLayout:v28];
                  goto LABEL_38;
                }
                int v31 = +[SBSwitcherDisplayItemRemovalResolutionResultAction replacementActionWithAppLayout:v28 replacementAppLayout:v30];

                if (!v31) {
                  goto LABEL_37;
                }
LABEL_38:
                if (!v25) {
                  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                [v25 addObject:v31];

                ++v27;
              }
              while (v24 != v27);
              uint64_t v32 = [v22 countByEnumeratingWithState:&v48 objects:v61 count:16];
              uint64_t v24 = v32;
              if (!v32) {
                goto LABEL_47;
              }
            }
          }
          id v25 = 0;
LABEL_47:

          if (v25)
          {
            int v33 = v39;
            uint64_t i = v45;
            if (!v39) {
              int v33 = objc_alloc_init(SBSwitcherDisplayItemRemovalResolutionResults);
            }
            int v39 = v33;
            [(SBSwitcherDisplayItemRemovalResolutionResults *)v33 setActions:v25 forDisplayItem:v42];
          }
          else
          {
            uint64_t i = v45;
          }
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (!v41) {
        goto LABEL_56;
      }
    }
  }
  int v39 = 0;
LABEL_56:

  return v39;
}

uint64_t __129__SBMainSwitcherControllerCoordinator__resultsForDisplayItemRemovalResolutionRequest_preferredAppLayoutForRemovalAnimationIfAny___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

uint64_t __129__SBMainSwitcherControllerCoordinator__resultsForDisplayItemRemovalResolutionRequest_preferredAppLayoutForRemovalAnimationIfAny___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (id)_nonHiddenAppLayoutsForDisplayItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  mainSwitcherModel = self->_mainSwitcherModel;
  uint64_t v6 = [v4 bundleIdentifier];
  id v7 = [(SBAppSwitcherModel *)mainSwitcherModel appLayoutsForBundleIdentifier:v6 includingHiddenAppLayouts:0];

  if (!v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = self->_appLayouts;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v14, "containsItem:", v4, (void)v16))
          {
            if (v11)
            {
              [v11 addObject:v14];
            }
            else
            {
              id v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];
            }
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    else
    {
      id v11 = 0;
    }

    id v7 = (void *)[v11 copy];
  }

  return v7;
}

- (id)_switcherModelRemovalResultsForRequest:(id)a3 forReason:(int64_t)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v38 = objc_alloc_init(SBSwitcherModelRemovalResults);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v32 = v5;
  obuint64_t j = [v5 appLayouts];
  uint64_t v33 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v62;
    int64_t v36 = a4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v62 != v31) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v61 + 1) + 8 * v6);
        uint64_t v8 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForAppLayout:v7];
        uint64_t v40 = [v8 _currentMainAppLayout];
        uint64_t v41 = v8;
        int v39 = [v8 _currentFloatingAppLayout];
        uint64_t v34 = [v32 actionForAppLayout:v7];
        uint64_t v9 = [v34 replacementAppLayout];
        if (v9) {
          [(SBSwitcherModelRemovalResults *)v38 setReplacementAppLayout:v9 forAppLayout:v7];
        }
        uint64_t v35 = v6;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v37 = [v7 allItems];
        uint64_t v45 = [v37 countByEnumeratingWithState:&v57 objects:v65 count:16];
        uint64_t v10 = 0;
        if (v45)
        {
          id v43 = v7;
          uint64_t v44 = *(void *)v58;
          id v42 = v9;
          do
          {
            for (uint64_t i = 0; i != v45; ++i)
            {
              if (*(void *)v58 != v44) {
                objc_enumerationMutation(v37);
              }
              uint64_t v12 = *(void *)(*((void *)&v57 + 1) + 8 * i);
              if (!v9 || ([v9 containsItem:*(void *)(*((void *)&v57 + 1) + 8 * i)] & 1) == 0)
              {
                uint64_t v46 = v10;
                char v13 = [v7 preferredDisplayIdentity];
                id v14 = [(SBMainSwitcherControllerCoordinator *)self _entityForDisplayItem:v12 displayIdentity:v13];
                uint64_t v15 = [v14 deviceApplicationSceneEntity];

                if (v15)
                {
                  long long v16 = [v15 application];
                  long long v17 = [v16 info];
                  int v18 = [v17 supportsMultiwindow];
                  uint64_t v19 = 0;
                  if (a4 == 1 && v18)
                  {
                    uint64_t v20 = [v15 sceneHandle];
                    uint64_t v21 = [v20 sceneIfExists];
                    id v22 = [v21 uiClientSettings];
                    uint64_t v19 = [v22 discardSessionOnUserDisconnect] ^ 1;

                    uint64_t v9 = v42;
                    a4 = v36;

                    id v7 = v43;
                  }
                }
                else
                {
                  uint64_t v19 = 0;
                }
                [(SBSwitcherModelRemovalResults *)v38 setHide:v19 forDisplayItem:v12];
                uint64_t v23 = (void *)MEMORY[0x1D948C7A0](v46);
                v48[0] = MEMORY[0x1E4F143A8];
                v48[1] = 3221225472;
                v48[2] = __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke;
                v48[3] = &unk_1E6B044F0;
                id v24 = v23;
                id v54 = v24;
                int64_t v55 = a4;
                v48[4] = self;
                v48[5] = v12;
                id v49 = v40;
                id v50 = v39;
                long long v51 = v7;
                id v25 = v41;
                id v52 = v25;
                id v53 = v9;
                char v56 = v19;
                uint64_t v26 = MEMORY[0x1D948C7A0](v48);

                uint64_t v27 = [v25 activeAppLayoutWhenActivatingMainSwitcher];
                int v28 = [v27 isOrContainsAppLayout:v7];

                if (v28) {
                  [v25 setActiveAppLayoutWhenActivatingMainSwitcher:0];
                }

                uint64_t v10 = (void *)v26;
                uint64_t v9 = v42;
                id v7 = v43;
              }
            }
            uint64_t v45 = [v37 countByEnumeratingWithState:&v57 objects:v65 count:16];
          }
          while (v45);
        }

        [(SBSwitcherModelRemovalResults *)v38 setAction:v10 forAppLayout:v7];
        uint64_t v6 = v35 + 1;
      }
      while (v35 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v33);
  }

  return v38;
}

void __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(void *)(a1 + 96) == 1)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 344) objectForKey:*(void *)(a1 + 40)];
    if (!v3)
    {
      id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      [*(id *)(*(void *)(a1 + 32) + 344) setObject:v3 forKey:*(void *)(a1 + 40)];
    }
    if ([v3 count] == 2) {
      [v3 removeObjectAtIndex:1];
    }
    id v4 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    id v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 insertObject:v5 atIndex:0];
  }
  if (([*(id *)(a1 + 48) containsItem:*(void *)(a1 + 40)] & 1) != 0
    || [*(id *)(a1 + 56) containsItem:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 160) addObject:*(void *)(a1 + 40)];
  }
  uint64_t v6 = [*(id *)(a1 + 64) layoutRoleForItem:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 72) contentViewController];
  uint64_t v8 = *(void *)(a1 + 64);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke_2;
  v11[3] = &unk_1E6B044C8;
  void v11[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 64);
  id v12 = v9;
  uint64_t v13 = v10;
  char v15 = *(unsigned char *)(a1 + 104);
  uint64_t v14 = *(void *)(a1 + 40);
  [v7 removeLayoutRole:v6 inSpace:v8 mutationBlock:v11 reason:*(void *)(a1 + 96)];
}

uint64_t __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 168);
  *(unsigned char *)(v2 + 168) = 1;
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "replaceAppLayout:withAppLayout:", *(void *)(a1 + 48));
    if (*(unsigned char *)(a1 + 64))
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke_3;
      v10[3] = &unk_1E6AF4B38;
      id v4 = *(void **)(a1 + 48);
      void v10[4] = *(void *)(a1 + 56);
      id v5 = [v4 appLayoutWithItemsPassingTest:v10];
      uint64_t v6 = [v5 appLayoutByModifyingHiddenState:1];
      [*(id *)(*(void *)(a1 + 32) + 216) addToFront:v6];
    }
  }
  else
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 216);
    uint64_t v8 = *(void *)(a1 + 48);
    if (*(unsigned char *)(a1 + 64)) {
      [v7 hide:v8];
    }
    else {
      [v7 remove:v8];
    }
  }
  uint64_t result = [*(id *)(a1 + 32) _rebuildAppListCache];
  *(unsigned char *)(*(void *)(a1 + 32) + 168) = v3;
  return result;
}

BOOL __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (id)_modelRemovalRequestForDisplayItemResolutionResults:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = a3;
  obuint64_t j = [v18 displayItems];
  uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  char v3 = 0;
  if (v19)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v4;
        id v5 = [v18 actionsForDisplayItem:*(void *)(*((void *)&v25 + 1) + 8 * v4)];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v22 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              uint64_t v11 = [v10 actionType];
              if (v11 == 2)
              {
                uint64_t v13 = [v10 replacementAppLayout];
                id v12 = +[SBSwitcherModelRemovalRequestAction replacementActionWithAppLayout:v13];

                if (!v12) {
                  continue;
                }
              }
              else
              {
                if (v11 != 1) {
                  continue;
                }
                id v12 = +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction];
                if (!v12) {
                  continue;
                }
              }
              if (!v3) {
                char v3 = objc_alloc_init(SBSwitcherModelRemovalRequest);
              }
              uint64_t v14 = [v10 appLayout];
              [(SBSwitcherModelRemovalRequest *)v3 setAction:v12 forAppLayout:v14];
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }

  return v3;
}

- (int64_t)_switcherDisplayItemRemovalIntentTypeForEntity:(id)a3 removalContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 displayItemRepresentation];
  if (v6)
  {
    uint64_t v7 = [v5 removalActionType];
    if (v7 == 2) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = 2 * (v7 == 1);
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)_switcherModelRemovalResultsForDisplayItemRemovalResolutionRequest:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [(SBMainSwitcherControllerCoordinator *)self _resultsForDisplayItemRemovalResolutionRequest:a3 preferredAppLayoutForRemovalAnimationIfAny:0];
    id v5 = [(SBMainSwitcherControllerCoordinator *)self _modelRemovalRequestForDisplayItemResolutionResults:v4];
    uint64_t v6 = [(SBMainSwitcherControllerCoordinator *)self _switcherModelRemovalResultsForRequest:v5 forReason:3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)_removeAppLayout:(id)a3 forReason:(int64_t)a4
{
  id v6 = a3;
  id v9 = objc_alloc_init(SBSwitcherModelRemovalRequest);
  uint64_t v7 = +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction];
  [(SBSwitcherModelRemovalRequest *)v9 setAction:v7 forAppLayout:v6];

  int64_t v8 = [(SBMainSwitcherControllerCoordinator *)self _switcherModelRemovalResultsForRequest:v9 forReason:a4];
  [(SBMainSwitcherControllerCoordinator *)self _performSceneDestructionForModelRemovalResults:v8];
}

- (void)_removeDisplayItem:(id)a3 forReason:(int64_t)a4
{
}

- (void)_removeDisplayItem:(id)a3 forReason:(int64_t)a4 preferredAppLayoutForRemovalAnimationIfAny:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v13 = objc_alloc_init(SBSwitcherDisplayItemRemovalResolutionRequest);
  [(SBSwitcherDisplayItemRemovalResolutionRequest *)v13 setRemovalIntentType:2 forDisplayItem:v9];

  uint64_t v10 = [(SBMainSwitcherControllerCoordinator *)self _resultsForDisplayItemRemovalResolutionRequest:v13 preferredAppLayoutForRemovalAnimationIfAny:v8];

  uint64_t v11 = [(SBMainSwitcherControllerCoordinator *)self _modelRemovalRequestForDisplayItemResolutionResults:v10];
  id v12 = [(SBMainSwitcherControllerCoordinator *)self _switcherModelRemovalResultsForRequest:v11 forReason:a4];
  [(SBMainSwitcherControllerCoordinator *)self _performSceneDestructionForModelRemovalResults:v12];
}

- (void)_modifyModelWithDropContext:(id)a3
{
  BOOL ignoreModelUpdates = self->_ignoreModelUpdates;
  self->_BOOL ignoreModelUpdates = 1;
  [(SBAppSwitcherModel *)self->_mainSwitcherModel modifyWithDropContext:a3];
  self->_BOOL ignoreModelUpdates = ignoreModelUpdates;
  [(SBMainSwitcherControllerCoordinator *)self _rebuildAppListCache];
}

- (void)appSwitcherModel:(id)a3 didRemoveAppLayoutForFallingOffList:(id)a4
{
  id v5 = a4;
  if ([v5 isHidden])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __92__SBMainSwitcherControllerCoordinator_appSwitcherModel_didRemoveAppLayoutForFallingOffList___block_invoke;
    v6[3] = &unk_1E6AF4F20;
    void v6[4] = self;
    id v7 = v5;
    [v7 enumerate:v6];
  }
}

void __92__SBMainSwitcherControllerCoordinator_appSwitcherModel_didRemoveAppLayoutForFallingOffList___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a3;
  id v6 = [v4 preferredDisplayIdentity];
  id v7 = [v3 _entityForDisplayItem:v5 displayIdentity:v6];

  SBWorkspaceDestroyApplicationEntity(v7);
}

- (id)appSwitcherModel:(id)a3 willReplaceAppLayout:(id)a4 proposedReplacementAppLayout:(id)a5
{
  id v5 = a5;
  return v5;
}

- (BOOL)handleHomeButtonPress
{
  uint64_t v2 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  char v3 = [v2 handleHomeButtonPress];

  return v3;
}

- (BOOL)handleHomeButtonDoublePress
{
  uint64_t v2 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  char v3 = [v2 handleHomeButtonDoublePress];

  return v3;
}

- (BOOL)handleHomeButtonLongPress
{
  uint64_t v2 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  char v3 = [v2 handleHomeButtonLongPress];

  return v3;
}

- (BOOL)handleLockButtonPress
{
  uint64_t v2 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  char v3 = [v2 handleLockButtonPress];

  return v3;
}

- (BOOL)handleVoiceCommandButtonPress
{
  uint64_t v2 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  char v3 = [v2 handleVoiceCommandButtonPress];

  return v3;
}

- (BOOL)handleVolumeUpButtonPress
{
  uint64_t v2 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  char v3 = [v2 handleVolumeUpButtonPress];

  return v3;
}

- (BOOL)handleVolumeDownButtonPress
{
  uint64_t v2 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  char v3 = [v2 handleVolumeDownButtonPress];

  return v3;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  LOBYTE(v3) = [v4 handleHeadsetButtonPress:v3];

  return v3;
}

- (void)betaLaunchHandle:(id)a3 activateIfNeededEndedWithResult:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  BSDispatchMain();
}

void __88__SBMainSwitcherControllerCoordinator_betaLaunchHandle_activateIfNeededEndedWithResult___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 384) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 384) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 384);
    *(void *)(v2 + 384) = 0;
  }
}

- (int64_t)_overrideWindowActiveInterfaceOrientation
{
  uint64_t v3 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  id v4 = [v3 contentViewController];

  int64_t v5 = [(SBMainSwitcherControllerCoordinator *)self switcherInterfaceOrientationForSwitcherContentController:v4];
  return v5;
}

- (void)_insertCardForDisplayIdentifier:(id)a3 atIndex:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:a3 sceneIdentifier:@"_SB_TEST_"];
  id v7 = [SBAppLayout alloc];
  id v8 = [NSNumber numberWithInteger:1];
  long long v16 = v8;
  v17[0] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v10 = [(SBAppLayout *)v7 initWithItemsForLayoutRoles:v9 configuration:1 environment:1 preferredDisplayOrdinal:0];

  testItemForInsertiouint64_t n = self->_testItemForInsertion;
  self->_testItemForInsertiouint64_t n = v10;
  id v12 = v10;

  self->_unint64_t testItemInsertionIndex = a4;
  uint64_t v13 = [(SBMainSwitcherControllerCoordinator *)self _embeddedDisplaySwitcherController];
  uint64_t v14 = [v13 contentViewController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __79__SBMainSwitcherControllerCoordinator__insertCardForDisplayIdentifier_atIndex___block_invoke;
  v15[3] = &unk_1E6AF4AC0;
  void v15[4] = self;
  [(SBMainSwitcherControllerCoordinator *)self _insertAppLayout:v12 atIndex:a4 contentViewController:v14 modelMutationBlock:v15 completion:0];
}

uint64_t __79__SBMainSwitcherControllerCoordinator__insertCardForDisplayIdentifier_atIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rebuildAppListCache];
}

- (void)_removeCardForDisplayIdentifier:(id)a3
{
  id v11 = +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:a3 sceneIdentifier:@"_SB_TEST_"];
  id v4 = [(SBAppLayout *)self->_testItemForInsertion itemForLayoutRole:1];
  int v5 = [v11 isEqual:v4];

  if (v5)
  {
    testItemForInsertiouint64_t n = self->_testItemForInsertion;
    self->_testItemForInsertiouint64_t n = 0;
    id v7 = testItemForInsertion;

    id v8 = objc_alloc_init(SBSwitcherModelRemovalRequest);
    id v9 = +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction];
    [(SBSwitcherModelRemovalRequest *)v8 setAction:v9 forAppLayout:v7];

    uint64_t v10 = [(SBMainSwitcherControllerCoordinator *)self _switcherModelRemovalResultsForRequest:v8 forReason:0];
    [(SBMainSwitcherControllerCoordinator *)self _performSceneDestructionForModelRemovalResults:v10];
  }
}

- (void)_acquireAssertion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  asynchronousRenderingAssertions = self->_asynchronousRenderingAssertions;
  if (!asynchronousRenderingAssertions)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = self->_asynchronousRenderingAssertions;
    self->_asynchronousRenderingAssertions = v6;

    asynchronousRenderingAssertions = self->_asynchronousRenderingAssertions;
  }
  [(NSMutableSet *)asynchronousRenderingAssertions addObject:v4];
  id v8 = SBLogAppSwitcher();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 reason];
    uint64_t v10 = [(NSMutableSet *)self->_asynchronousRenderingAssertions count];
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2048;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Acquiring asynchronous rendering assertion: %{public}@, assertion count: %lu", (uint8_t *)&v11, 0x16u);
  }
  [(SBMainSwitcherControllerCoordinator *)self _evaluateAsynchronousRenderingEnablement];
}

- (void)_updateAssertion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogAppSwitcher();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 reason];
    uint64_t v7 = [(NSMutableSet *)self->_asynchronousRenderingAssertions count];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Updating asynchronous rendering assertion: %{public}@, assertion count: %lu", (uint8_t *)&v8, 0x16u);
  }
  [(SBMainSwitcherControllerCoordinator *)self _evaluateAsynchronousRenderingEnablement];
}

- (void)_reqlinquishAssertion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_asynchronousRenderingAssertions removeObject:v4];
  int v5 = SBLogAppSwitcher();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 reason];
    uint64_t v7 = [(NSMutableSet *)self->_asynchronousRenderingAssertions count];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Relinquishing asynchronous rendering assertion: %{public}@, assertion count: %lu", (uint8_t *)&v8, 0x16u);
  }
  [(SBMainSwitcherControllerCoordinator *)self _evaluateAsynchronousRenderingEnablement];
}

- (void)_setAsynchronousRenderingEnabled:(BOOL)a3 withMinificationFilter:(BOOL)a4 forLayerTarget:(id)a5 presentationManager:(id)a6
{
  id v9 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __130__SBMainSwitcherControllerCoordinator__setAsynchronousRenderingEnabled_withMinificationFilter_forLayerTarget_presentationManager___block_invoke;
  v11[3] = &unk_1E6B04538;
  id v12 = v9;
  BOOL v13 = a3;
  BOOL v14 = a4;
  id v10 = v9;
  [a6 modifyDefaultPresentationContext:v11];
}

uint64_t __130__SBMainSwitcherControllerCoordinator__setAsynchronousRenderingEnabled_withMinificationFilter_forLayerTarget_presentationManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __130__SBMainSwitcherControllerCoordinator__setAsynchronousRenderingEnabled_withMinificationFilter_forLayerTarget_presentationManager___block_invoke_2;
  v4[3] = &__block_descriptor_34_e48_v16__0__UIMutableSceneLayerPresentationContext_8l;
  __int16 v5 = *(_WORD *)(a1 + 40);
  return [a2 modifyLayerPresentationOverrideContextForLayerTarget:v2 block:v4];
}

void __130__SBMainSwitcherControllerCoordinator__setAsynchronousRenderingEnabled_withMinificationFilter_forLayerTarget_presentationManager___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v5 = a2;
  [v5 setRenderingMode:v3];
  if (*(unsigned char *)(a1 + 33)) {
    uint64_t v4 = *MEMORY[0x1E4F39FE0];
  }
  else {
    uint64_t v4 = 0;
  }
  [v5 _setMinificationFilterName:v4];
}

- (void)transactionDidComplete:(id)a3
{
  if (self->_activeGestureTransaction == a3) {
    [(SBMainSwitcherControllerCoordinator *)self setActiveGestureTransaction:0];
  }
}

- (id)coordinatedSwitcherControllers
{
  return [(NSPointerArray *)self->_coordinatedSwitcherControllers allObjects];
}

- (void)beginCoordinatingSwitcherController:(id)a3
{
}

- (void)beginCoordinatingSwitcherController:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 windowScene];
  [v6 willBeginCoordinationWithCoordinator:self];
  NSUInteger v8 = [(NSPointerArray *)self->_coordinatedSwitcherControllers count];
  if (!v8) {
    goto LABEL_7;
  }
  NSUInteger v9 = v8;
  uint64_t v10 = 0;
  while (1)
  {
    id v11 = [(NSPointerArray *)self->_coordinatedSwitcherControllers pointerAtIndex:v10];

    if (v11 == v6) {
      break;
    }
    if (v9 == ++v10) {
      goto LABEL_7;
    }
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    [(NSPointerArray *)self->_coordinatedSwitcherControllers addPointer:v6];
    [(NSPointerArray *)self->_coordinatedSwitcherControllers compact];
  }
  [(NSMapTable *)self->_switcherControllersByWindowScene setObject:v6 forKey:v7];
  [(SBMainSwitcherControllerCoordinator *)self _rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary];
  id v12 = [v7 layoutStateProvider];
  uint64_t v13 = [v12 layoutState];
  [(SBMainSwitcherControllerCoordinator *)self _updateHomeScreenDisplayLayoutElementForLayoutState:v13 switcherController:v6];

  BOOL v14 = [(SBMainSwitcherControllerCoordinator *)self _defaultSwitcherController];
  LOBYTE(v13) = [v6 isEqual:v14];

  if ((v13 & 1) == 0)
  {
    char v27 = v4;
    long long v28 = v7;
    uint64_t v15 = [v6 layoutState];
    uint64_t v16 = [v15 displayOrdinal];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v17 = [(SBMainSwitcherControllerCoordinator *)self appLayoutsForSwitcherController:v6];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v23 = [(SBAppSwitcherModel *)self->_mainSwitcherModel bestLastDisplayItemLayoutAttributesMapForAppLayout:v22 displayOrdinal:v16];
          long long v24 = [v22 appLayoutByModifyingLayoutAttributesForItems:v23];
          [(SBAppSwitcherModel *)self->_mainSwitcherModel replaceAppLayout:v22 withAppLayout:v24];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v19);
    }

    char v4 = v27;
    uint64_t v7 = v28;
  }
  [v6 didBeginCoordinationWithCoordinator:self];
  [(SBMainSwitcherControllerCoordinator *)self _notifySwitcherControllersAppLayoutsDidChange];
  [(SBMainSwitcherControllerCoordinator *)self _notifySwitcherControllersCoordinatedSwitcherControllersDidChange];
  if (v4)
  {
    long long v25 = +[SBWorkspace mainWorkspace];
    long long v26 = [v7 _fbsDisplayConfiguration];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __83__SBMainSwitcherControllerCoordinator_beginCoordinatingSwitcherController_options___block_invoke;
    v29[3] = &unk_1E6AF57E8;
    v29[4] = self;
    [v25 requestTransitionWithOptions:0 displayConfiguration:v26 builder:v29];
  }
}

void __83__SBMainSwitcherControllerCoordinator_beginCoordinatingSwitcherController_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _defaultSwitcherController];
  id v6 = [v5 _currentMainAppLayout];
  id v7 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v6];

  [v7 setAnimationDisabled:1];
  [*(id *)(a1 + 32) _configureRequest:v4 forSwitcherTransitionRequest:v7 withEventLabel:@"ContinuityScreenConnect"];
}

- (void)endCoordinatingSwitcherController:(id)a3
{
}

- (void)endCoordinatingSwitcherController:(id)a3 options:(unint64_t)a4
{
  char v35 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  [v36 willEndCoordinationWithCoordinator:self];
  val = self;
  id v5 = [(SBMainSwitcherControllerCoordinator *)self _defaultSwitcherController];
  id v6 = v36;
  char v7 = [v36 isEqual:v5];

  if ((v7 & 1) == 0)
  {
    objc_initWeak(&location, val);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke;
    v57[3] = &unk_1E6AF7920;
    objc_copyWeak(&v59, &location);
    id v8 = v36;
    id v58 = v8;
    long long v33 = (void (**)(void, void))MEMORY[0x1D948C7A0](v57);
    uint64_t v34 = [(SBMainSwitcherControllerCoordinator *)val _defaultSwitcherController];
    long long v32 = [v34 windowScene];
    NSUInteger v9 = [v32 sceneManager];
    uint64_t v10 = [v34 layoutState];
    uint64_t v39 = [v10 displayOrdinal];

    id v11 = v8;
    long long v31 = [v11 windowScene];
    id v12 = [v31 sceneManager];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v13 = [(SBMainSwitcherControllerCoordinator *)val appLayoutsForSwitcherController:v11];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v14)
    {
      uint64_t v40 = v14;
      char v15 = 0;
      obuint64_t j = v13;
      uint64_t v38 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          id v42 = [(SBAppSwitcherModel *)val->_mainSwitcherModel bestLastDisplayItemLayoutAttributesMapForAppLayout:v16 displayOrdinal:v39];
          uint64_t v17 = objc_msgSend(v16, "appLayoutByModifyingLayoutAttributesForItems:");
          [(SBAppSwitcherModel *)val->_mainSwitcherModel replaceAppLayout:v16 withAppLayout:v17];
          uint64_t v41 = (void *)v17;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          uint64_t v18 = [v16 allItems];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v61 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v50;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v50 != v20) {
                  objc_enumerationMutation(v18);
                }
                long long v22 = [v11 _deviceApplicationSceneHandleForDisplayItem:*(void *)(*((void *)&v49 + 1) + 8 * j)];
                long long v23 = v22;
                if (v22)
                {
                  uint64_t v24 = [v22 _sceneIdentity];
                  [v12 transferOwnershipOfSceneWithIdentity:v24 toSceneManager:v9];

                  long long v25 = [v23 sceneIfExists];
                  LOBYTE(v24) = v25 != 0;

                  v15 |= v24;
                }
              }
              uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v61 count:16];
            }
            while (v19);
          }
        }
        uint64_t v40 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v40);

      if ((v35 & 1) == 0)
      {
        if (v15)
        {
          long long v26 = +[SBWorkspace mainWorkspace];
          char v27 = [v32 _fbsDisplayConfiguration];
          long long v28 = v45;
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_3;
          v45[3] = &unk_1E6AF7128;
          v45[4] = v32;
          uint64_t v46 = v33;
          [v26 requestTransitionWithOptions:0 displayConfiguration:v27 builder:v45];

LABEL_24:
          goto LABEL_25;
        }
LABEL_22:
        v33[2](v33, 1);
LABEL_25:

        objc_destroyWeak(&v59);
        objc_destroyWeak(&location);
        id v6 = v36;
        goto LABEL_26;
      }
    }
    else
    {

      if ((v35 & 1) == 0) {
        goto LABEL_22;
      }
    }
    id v29 = +[SBWorkspace mainWorkspace];
    long long v30 = [v32 _fbsDisplayConfiguration];
    long long v28 = v47;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_2;
    v47[3] = &unk_1E6B04560;
    v47[4] = v11;
    v47[5] = val;
    long long v48 = v33;
    [v29 requestTransitionWithOptions:0 displayConfiguration:v30 builder:v47];

    goto LABEL_24;
  }
LABEL_26:
}

void __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) windowScene];
    id v4 = [v11[51] objectForKey:*(void *)(a1 + 32)];
    [v4 invalidate];
    [v11[51] removeObjectForKey:*(void *)(a1 + 32)];
    id v5 = [v11[52] objectForKey:*(void *)(a1 + 32)];
    [v5 invalidate];
    [v11[52] removeObjectForKey:*(void *)(a1 + 32)];
    [v11[4] removeObjectForKey:v3];
    [v11[2] removeObjectForKey:v3];
    uint64_t v6 = [v11[1] count];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      while (1)
      {
        NSUInteger v9 = [v11[1] pointerAtIndex:v8];
        uint64_t v10 = *(void **)(a1 + 32);

        if (v10 == v9) {
          break;
        }
        if (v7 == ++v8) {
          goto LABEL_9;
        }
      }
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [v11[1] removePointerAtIndex:v8];
        [v11[1] compact];
      }
    }
LABEL_9:
    [*(id *)(a1 + 32) didEndCoordinationWithCoordinator:v11];
    [v11 _notifySwitcherControllersAppLayoutsDidChange];
    [v11 _notifySwitcherControllersCoordinatedSwitcherControllersDidChange];

    id WeakRetained = v11;
  }
}

void __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _currentMainAppLayout];
  id v5 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v4];

  [v5 setAnimationDisabled:1];
  [*(id *)(a1 + 40) _configureRequest:v3 forSwitcherTransitionRequest:v5 withEventLabel:@"ContinuityScreenDisconnect"];
  [v3 setShouldPreventDismissalOfUnrelatedTransientOverlays:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = objc_msgSend(v3, "applicationContext", 0);
  uint64_t v7 = [v6 applicationSceneEntities];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v11++) setFlag:1 forActivationSetting:41];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  id v12 = (id)[v3 addCompletionHandler:*(void *)(a1 + 48)];
}

void __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:17];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_4;
  v5[3] = &unk_1E6AF57C0;
  id v6 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v5];
  id v4 = (id)[v3 addCompletionHandler:*(void *)(a1 + 40)];
}

void __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) layoutStateProvider];
  id v4 = [v3 layoutState];

  if (SBLayoutRoleIsValid([v4 windowPickerRole])) {
    objc_msgSend(v5, "setRequestedWindowPickerRole:", objc_msgSend(v4, "windowPickerRole"));
  }
  if ([v4 unlockedEnvironmentMode] == 2) {
    [v5 setRequestedUnlockedEnvironmentMode:2];
  }
}

uint64_t __71__SBMainSwitcherControllerCoordinator_appLayoutsForSwitcherController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainDisplayWindowScene] ^ 1;
}

uint64_t __71__SBMainSwitcherControllerCoordinator_appLayoutsForSwitcherController___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

BOOL __71__SBMainSwitcherControllerCoordinator_appLayoutsForSwitcherController___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 layoutState];
  uint64_t v4 = [v3 displayOrdinal];
  BOOL v5 = v4 == [*(id *)(a1 + 32) preferredDisplayOrdinal];

  return v5;
}

void __70__SBMainSwitcherControllerCoordinator_switcherControllerForAppLayout___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) appLayoutsForSwitcherController:v6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__SBMainSwitcherControllerCoordinator_switcherControllerForAppLayout___block_invoke_2;
  v8[3] = &unk_1E6AF4B60;
  id v9 = *(id *)(a1 + 40);
  if (objc_msgSend(v7, "bs_containsObjectPassingTest:", v8))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }
}

uint64_t __70__SBMainSwitcherControllerCoordinator_switcherControllerForAppLayout___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isOrContainsAppLayout:*(void *)(a1 + 32)];
}

- (id)switcherControllerForDisplayItem:(id)a3
{
  id v4 = a3;
  if ([(NSMapTable *)self->_switcherControllersByWindowScene count] == 1)
  {
    BOOL v5 = [(NSMapTable *)self->_switcherControllersByWindowScene objectEnumerator];
    id v6 = [v5 nextObject];
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__62;
    long long v15 = __Block_byref_object_dispose__62;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__SBMainSwitcherControllerCoordinator_switcherControllerForDisplayItem___block_invoke;
    v8[3] = &unk_1E6AFC258;
    id v9 = v4;
    uint64_t v10 = &v11;
    [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void __72__SBMainSwitcherControllerCoordinator_switcherControllerForDisplayItem___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 _currentMainAppLayout];
  int v7 = [v6 containsItem:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)convertAppLayout:(id)a3 fromSwitcherController:(id)a4 toSwitcherController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 isEqual:v9])
  {
    id v10 = v7;
  }
  else
  {
    uint64_t v11 = [v9 layoutState];
    objc_msgSend(v7, "appLayoutByModifyingPreferredDisplayOrdinal:", objc_msgSend(v11, "displayOrdinal"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    if ([v8 windowManagementStyle] != 2 && objc_msgSend(v9, "windowManagementStyle") == 2)
    {
      uint64_t v12 = [v10 appLayoutByAdjustingCenterWindowItemsForChamois];

      id v10 = (id)v12;
    }
  }

  return v10;
}

- (void)switcherControllerWillUpdateWindowManagementStyle:(id)a3
{
}

- (void)setActiveGestureTransaction:(id)a3
{
  BOOL v5 = (SBFluidSwitcherGestureWorkspaceTransaction *)a3;
  activeGestureTransactiouint64_t n = self->_activeGestureTransaction;
  if (activeGestureTransaction != v5)
  {
    [(SBFluidSwitcherGestureWorkspaceTransaction *)activeGestureTransaction removeObserver:self];
    objc_storeStrong((id *)&self->_activeGestureTransaction, a3);
    [(SBFluidSwitcherGestureWorkspaceTransaction *)self->_activeGestureTransaction addObserver:self];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__SBMainSwitcherControllerCoordinator_setActiveGestureTransaction___block_invoke;
    v7[3] = &unk_1E6B04240;
    id v8 = v5;
    [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v7];
  }
}

void __67__SBMainSwitcherControllerCoordinator_setActiveGestureTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 gestureManager];
  [v3 setActiveGestureTransaction:*(void *)(a1 + 32)];
}

- (BOOL)liveContentOverlayUpdatesSuspended
{
  return self->_liveContentOverlayUpdatesSuspended;
}

- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3
{
  if (self->_liveContentOverlayUpdatesSuspended != a3)
  {
    self->_liveContentOverlayUpdatesSuspended = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __77__SBMainSwitcherControllerCoordinator_setLiveContentOverlayUpdatesSuspended___block_invoke;
    v3[3] = &__block_descriptor_33_e34_v24__0__SBSwitcherController_8_B16l;
    BOOL v4 = a3;
    [(SBMainSwitcherControllerCoordinator *)self enumerateSwitcherControllersWithBlock:v3];
  }
}

void __77__SBMainSwitcherControllerCoordinator_setLiveContentOverlayUpdatesSuspended___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 contentViewController];
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
  id v7 = v6;

  [v7 setLiveContentOverlayUpdatesSuspended:*(unsigned __int8 *)(a1 + 32)];
}

- (id)draggingAppLayouts
{
  uint64_t v2 = (void *)[(NSCountedSet *)self->_draggingAppLayouts copy];
  return v2;
}

- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentCoordinatedLayoutStateTransitionContext, a3);
  id v5 = a3;
  id v6 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_currentCoordinatedLayoutStateTransitionContext fromSwitcherController];
  [v6 prepareForCoordinatedLayoutStateTransitionWithContext:self->_currentCoordinatedLayoutStateTransitionContext];

  id v7 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_currentCoordinatedLayoutStateTransitionContext toSwitcherController];
  [v7 prepareForCoordinatedLayoutStateTransitionWithContext:self->_currentCoordinatedLayoutStateTransitionContext];
}

- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  uint64_t v4 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_currentCoordinatedLayoutStateTransitionContext fromSwitcherController];
  [v4 cleanUpAfterCoordinatedLayoutStateTransitionWithContext:self->_currentCoordinatedLayoutStateTransitionContext];

  id v5 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_currentCoordinatedLayoutStateTransitionContext toSwitcherController];
  [v5 cleanUpAfterCoordinatedLayoutStateTransitionWithContext:self->_currentCoordinatedLayoutStateTransitionContext];

  currentCoordinatedLayoutStateTransitionContext = self->_currentCoordinatedLayoutStateTransitionContext;
  self->_currentCoordinatedLayoutStateTransitionContext = 0;
}

- (id)_switcherControllerForTransitionRequest:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__SBMainSwitcherControllerCoordinator__switcherControllerForTransitionRequest___block_invoke;
  v8[3] = &unk_1E6AFC3C8;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(SBMainSwitcherControllerCoordinator *)self _switcherControllerPassingTest:v8];

  return v6;
}

uint64_t __79__SBMainSwitcherControllerCoordinator__switcherControllerForTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 windowScene];
  id v4 = [v3 _fbsDisplayIdentity];

  id v5 = [*(id *)(a1 + 32) displayIdentity];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (id)_activeDisplaySwitcherController
{
  id v3 = [(id)SBApp windowSceneManager];
  id v4 = [v3 activeDisplayWindowScene];

  id v5 = [(SBMainSwitcherControllerCoordinator *)self switcherControllerForWindowScene:v4];

  return v5;
}

- (id)_defaultSwitcherController
{
  id v3 = [(NSPointerArray *)self->_coordinatedSwitcherControllers count];
  if (v3)
  {
    id v3 = [(NSPointerArray *)self->_coordinatedSwitcherControllers pointerAtIndex:0];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_captureApplicationWatchdog, 0);
  objc_storeStrong((id *)&self->_chamoisWindowingUIEverEnabledObserver, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransitionsBySwitcherController, 0);
  objc_storeStrong((id *)&self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController, 0);
  objc_storeStrong((id *)&self->_homeScreenDisplayLayoutElement, 0);
  objc_storeStrong((id *)&self->_storeAppLaunchUIActivationQueue, 0);
  objc_storeStrong((id *)&self->_activeBetaLaunchHandles, 0);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertion, 0);
  objc_storeStrong((id *)&self->_medusaKeyboardScene, 0);
  objc_storeStrong((id *)&self->_recentSwipeUpToKillTimestampsForAppLayouts, 0);
  objc_storeStrong((id *)&self->_disableCachingAsynchronousRenderingSurfacesTimer, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingCachedSurfacesReasons, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertions, 0);
  objc_storeStrong((id *)&self->_preventSupplementalSnapshotsInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_preventSupplementalSnapshotsAssertion, 0);
  objc_storeStrong((id *)&self->_containerStatusBarContentAssertion, 0);
  objc_storeStrong((id *)&self->_floatingStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_mainStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_deactivatingScenesResignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardFocusObserver, 0);
  objc_storeStrong((id *)&self->_keyboardFocusController, 0);
  objc_storeStrong((id *)&self->_userQuitMonitorServer, 0);
  objc_storeStrong((id *)&self->_demoFilteringHiddenAppLayouts, 0);
  objc_storeStrong((id *)&self->_demoFilteringController, 0);
  objc_storeStrong((id *)&self->_demoCommandsServer, 0);
  objc_storeStrong((id *)&self->_mainSwitcherModel, 0);
  objc_storeStrong((id *)&self->_testItemForInsertion, 0);
  objc_storeStrong((id *)&self->_wallpaperScaleAssertion, 0);
  objc_storeStrong((id *)&self->_lockKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_deferRotationForAppSwitcherAssertion, 0);
  objc_storeStrong((id *)&self->_liveDisplayItemsBeingTerminated, 0);
  objc_storeStrong((id *)&self->_servicesRemovedWhileAwayFromSwitcher, 0);
  objc_storeStrong((id *)&self->_sheetMetricsCache, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_currentCoordinatedLayoutStateTransitionContext, 0);
  objc_storeStrong((id *)&self->_activeTransitionModelRemovalAppLayoutToRemovalContext, 0);
  objc_storeStrong((id *)&self->_activeTransitionModelRemovalResults, 0);
  objc_storeStrong((id *)&self->_activeGestureTransaction, 0);
  objc_storeStrong((id *)&self->_windowDragSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_draggingAppLayouts, 0);
  objc_storeStrong((id *)&self->_appLayoutToEligibleTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_appLayoutToAcquiredTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_switcherServices, 0);
  objc_storeStrong((id *)&self->_appLayouts, 0);
  objc_storeStrong((id *)&self->_previousLayoutStatesByWindowScene, 0);
  objc_storeStrong((id *)&self->_currentWindowingModeCompatibleAppLayoutsByWindowScene, 0);
  objc_storeStrong((id *)&self->_lastMeaningfullyDifferentLayoutStatesByWindowScene, 0);
  objc_storeStrong((id *)&self->_switcherControllersByWindowScene, 0);
  objc_storeStrong((id *)&self->_coordinatedSwitcherControllers, 0);
}

void __94__SBMainSwitcherControllerCoordinator__presentStoreKitSheetIfNeededWithAppInfo_processHandle___block_invoke_2_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "StoreKit sheet preflight result: %d", (uint8_t *)v2, 8u);
}

void __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Error acquiring automatic update authorization for %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_beginDisplayLayoutTransitionForSwitcherController:(os_log_t)log reason:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SwitcherController %p asked to being displayLayoutTransition reason: %@ without ending previous one, forcibly ending the previous", (uint8_t *)&v3, 0x16u);
}

void __89__SBMainSwitcherControllerCoordinator__chamoisWindowingUIEverEnabledDefaultChangeHandler__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  __int16 v5 = _SBFLoggingMethodProem();
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ received error back from education service: %{public}@", (uint8_t *)&v6, 0x16u);
}

void __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Error while attempting to disconnect scene: %@", (uint8_t *)&v2, 0xCu);
}

@end