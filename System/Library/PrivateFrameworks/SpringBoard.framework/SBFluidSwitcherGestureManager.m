@interface SBFluidSwitcherGestureManager
- (BOOL)_areContinuousExposeStripsAvailableWithReason:(id *)a3;
- (BOOL)_areContinuousExposeStripsOccludedOrHiddenWithOutReason:(id *)a3;
- (BOOL)_edgeLocationIsOutsideFloatingApplicationGrabberFreeRegion:(double)a3;
- (BOOL)_hasActiveModalFloatingApplication;
- (BOOL)_isBannerOccludingRegionAtReferencePoint:(CGPoint)a3;
- (BOOL)_isEdgeLocationInHomeAffordanceRegion:(double)a3;
- (BOOL)_isHomeAffordanceHitTestRectForAppLayoutRelevant:(id)a3;
- (BOOL)_isHomeAffordanceSingleTapGatingEnabled;
- (BOOL)_isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled;
- (BOOL)_isTransactionRunningForGestureRecognizer:(id)a3;
- (BOOL)_isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:(CGPoint)a3;
- (BOOL)_shouldAllowDeckBottomEdgeGestureToRecognizeFromEdges:(unint64_t)a3;
- (BOOL)_shouldAllowFloatingApplicationGesture:(id)a3 gestureType:(unint64_t)a4 failureReason:(id *)a5;
- (BOOL)_shouldBeginBottomEdgePanGesture:(id)a3;
- (BOOL)_shouldBeginBringItemContainerForwardGesture:(id)a3 type:(unint64_t)a4;
- (BOOL)_shouldBeginClickAndDragHomeGesture:(id)a3;
- (BOOL)_shouldBeginClickDownToBringItemContainerForwardGesture:(id)a3;
- (BOOL)_shouldBeginContinuousExposeStripOverflowGesture:(id)a3;
- (BOOL)_shouldBeginContinuousExposeStripOverflowPanGesture:(id)a3;
- (BOOL)_shouldBeginContinuousExposeStripRevealGesture:(id)a3;
- (BOOL)_shouldBeginDeckInSwitcherPanGesture:(id)a3;
- (BOOL)_shouldBeginFloatingApplicationMoveGesture:(id)a3;
- (BOOL)_shouldBeginFloatingApplicationPinGesture:(id)a3;
- (BOOL)_shouldBeginFloatingApplicationPresentGesture:(id)a3;
- (BOOL)_shouldBeginFloatingApplicationSwipeUpGesture:(id)a3;
- (BOOL)_shouldBeginFluidScrunchGesture:(id)a3;
- (BOOL)_shouldBeginHoverGesture:(id)a3;
- (BOOL)_shouldBeginIndirectFloatingAppScrunchGesture:(id)a3;
- (BOOL)_shouldBeginIndirectHomePanGesture:(id)a3;
- (BOOL)_shouldBeginLiveWindowResizeGesture:(id)a3;
- (BOOL)_shouldBeginSplitViewApplicationUnpinGesture:(id)a3;
- (BOOL)_shouldBeginTapToBringItemContainerForwardGesture:(id)a3;
- (BOOL)_shouldBringItemContainerForwardGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldClickAndDragHomeGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldClickDownToBringItemContainerForward:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldContinuousExposeStripOverflowPanGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldDeckInSwitcherPanGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldFloatingApplicationMoveGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldFloatingApplicationPinGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldFloatingApplicationSwipeUpGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldIndirectFloatingAppScrunchGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldLiveResizeGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldLiveResizeItemContainerGestureWithPointer:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldLiveResizeItemContainerGestureWithTouch:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldProtectEdgeLocation:(double)a3 edge:(unint64_t)a4;
- (BOOL)_shouldSceneResizeGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldSplitViewApplicationUnpinGesture:(id)a3 receiveTouch:(id)a4;
- (BOOL)_shouldSuppressEdgeProtect;
- (BOOL)_shouldSuppressEdgeProtectToAllowSwipesImmediatelyAfterTransition;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)grabberTongue:(id)a3 shouldAllowSecondSwipeWithEdgeLocation:(double)a4;
- (BOOL)grabberTongue:(id)a3 shouldDismissTongueOnSecondSwipeWithEdgeLocation:(double)a4;
- (BOOL)grabberTongue:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)grabberTongue:(id)a3 shouldShowTongueOnFirstSwipeWithEdgeLocation:(double)a4;
- (BOOL)grabberTongueOrPullEnabled:(id)a3 forGestureRecognizer:(id)a4;
- (BOOL)interactivelyPresentingTongue;
- (BOOL)isDragAndDropTransactionRunning;
- (BOOL)isSwitcherForegroundActive;
- (BOOL)multitaskingGesturesRequireEducation;
- (BOOL)multitaskingGesturesUserPreferenceIsOff;
- (BOOL)playedEdgeProtectHaptic;
- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3;
- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3;
- (BOOL)shouldRubberbandGrabberViewForReduceMotion;
- (BOOL)shouldSuppressTongueViewForGrabberTongue:(id)a3;
- (BOOL)usesHomeAffordanceRulesForGrabberTongue;
- (CGRect)_edgeSwipeHitTestRectForItemContainer:(id)a3 forPointerTouch:(BOOL)a4;
- (CGRect)_floatingApplicationBounds;
- (CGRect)_paddedHitTestRectForItemContainer:(id)a3 forPointerTouch:(BOOL)a4;
- (CGRect)homeAffordanceFrameForHomeAffordanceInteraction:(id)a3;
- (Class)_fluidSwitcherGestureTransactionClassForGestureType:(int64_t)a3;
- (NSHashTable)currentHomeGrabberViews;
- (NSHashTable)presentedSceneBackedBanners;
- (NSMutableSet)suppressionAssertions;
- (NSString)description;
- (NSTimer)delayedHomeGrabberUpdateTimer;
- (SBAppSwitcherDefaults)appSwitcherDefaults;
- (SBAppSwitcherSettings)appSwitcherSettings;
- (SBAudioCategoryZStackPolicyAssistant)zStackAudioCategoryPolicyAssistant;
- (SBDisplayItemLayoutAttributesCalculator)displayItemLayoutAttributesCalculator;
- (SBDragAndDropWorkspaceTransaction)dragAndDropWorkspaceTransaction;
- (SBFHomeAffordanceInteraction)homeAffordanceInteraction;
- (SBFHomeGrabberSettings)homeGrabberSettings;
- (SBFZStackParticipant)zStackParticipant;
- (SBFluidScrunchGestureRecognizer)fluidScrunchGestureRecognizer;
- (SBFluidScrunchGestureRecognizer)indirectFloatingAppScrunchGestureRecognizer;
- (SBFluidSwitcherDragAndDropManager)fluidDragAndDropManager;
- (SBFluidSwitcherGestureManager)initWithSwitcherController:(id)a3 delegate:(id)a4;
- (SBFluidSwitcherGestureManagerDelegate)delegate;
- (SBFluidSwitcherGestureWorkspaceTransaction)activeGestureTransaction;
- (SBFluidSwitcherPanGestureRecognizer)clickAndDragHomeGestureRecognizer;
- (SBFluidSwitcherPanGestureRecognizer)deckInSwitcherPanGestureRecognizer;
- (SBFluidSwitcherPanGestureRecognizer)dragContinuousExposeStripOverflowGestureRecognizer;
- (SBFluidSwitcherPanGestureRecognizer)liveWindowResizeGestureRecognizer;
- (SBFluidSwitcherPanGestureRecognizer)moveFloatingApplicationGestureRecognizer;
- (SBFluidSwitcherPanGestureRecognizer)pinFloatingApplicationGestureRecognizer;
- (SBFluidSwitcherPanGestureRecognizer)swipeUpFloatingAppGestureRecognizer;
- (SBFluidSwitcherPanGestureRecognizer)unpinSplitViewApplicationGestureRecognizer;
- (SBFluidSwitcherViewController)switcherContentController;
- (SBGrabberTongue)continuousExposeStripRevealGrabberTongue;
- (SBGrabberTongue)deckGrabberTongue;
- (SBGrabberTongue)leftEdgeFloatingAppGrabberTongue;
- (SBGrabberTongue)rightEdgeFloatingAppGrabberTongue;
- (SBHomeGestureSettings)homeGestureSettings;
- (SBIndirectPanGestureRecognizer)indirectBottomEdgePanGestureRecognizer;
- (SBIndirectPanGestureRecognizer)indirectContinuousExposeStripOverflowGestureRecognizer;
- (SBIndirectPanGestureRecognizer)indirectDismissFloatingApplicationGestureRecognizer;
- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator;
- (SBPanSystemGestureRecognizer)sceneResizePanGestureRecognizer;
- (SBPhysicalButtonZStackPolicyAssistant)zStackPhysicalButtonPolicyAssistant;
- (SBSwitcherContentViewControlling)contentViewController;
- (SBSwitcherController)switcherController;
- (SBSystemApertureZStackPolicyAssistant)zStackSystemAperturePolicyAssistant;
- (UIGestureRecognizer)windowMoveClientGateRelationshipGestureRecognizer;
- (UIHoverGestureRecognizer)hoverGestureRecognizer;
- (UILongPressGestureRecognizer)clickDownToBringItemContainerForwardGestureRecognizer;
- (UINotificationFeedbackGenerator)edgeProtectFeedbackGenerator;
- (UIView)exclusionTrapezoidDebugView;
- (_UIPassthroughTapGestureRecognizer)tapToBringItemContainerForwardGestureRecognizer;
- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3;
- (id)_appLayoutForHomeGrabberView:(id)a3;
- (id)_currentFloatingAppLayout;
- (id)_currentLayoutState;
- (id)_deviceApplicationSceneEntityForFloatingApplicationGrabberTongue;
- (id)_firstFloatingAppLayout;
- (id)_grabberTongueForGestureRecognizer:(id)a3;
- (id)_hitTestStageItemContainerForUnpinGestureWithTouch:(id)a3 atGestureLocation:(CGPoint)a4;
- (id)_indirectPresentFloatingAppGestureRecognizerForEdge:(unint64_t)a3;
- (id)_scenesForAppLayout:(id)a3;
- (id)_scenesForHomeGrabberView:(id)a3;
- (id)acquireSystemApertureSuppressionAssertionForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4;
- (id)customGestureRecognizerForGrabberTongue:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)dragAndDropManager:(id)a3 displayItemForDraggingWindowWithGestureRecognizer:(id)a4;
- (id)dragAndDropManager:(id)a3 sourceViewProviderForDraggingWindowWithGestureRecognizer:(id)a4;
- (id)homeGestureBottomEdgeRecognizer;
- (id)indirectPanGestureRecognizerForGrabberTongue:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (int64_t)_currentUnlockedEnvironmentMode;
- (int64_t)_floatingConfigurationForActivatedEdge:(unint64_t)a3;
- (int64_t)_gestureTypeForGestureRecognizer:(id)a3;
- (unint64_t)_continuousExposeStripEdge;
- (unint64_t)indirectPanSystemGestureTypeForGrabberTongue:(id)a3;
- (void)_clearAudioCategoryZStackPolicyAssistant;
- (void)_clearPhysicalButtonZStackPolicyAssistant;
- (void)_clearSystemApertureZStackPolicyAssistantSuppression;
- (void)_configureTransitionRequest:(id)a3 forGestureBegin:(id)a4;
- (void)_handleClickDownToBringItemContainerForward:(id)a3;
- (void)_handleContinuousExposeStripRevealGesture:(id)a3;
- (void)_handleDeckSwitcherPanGesture:(id)a3;
- (void)_handleFloatingAppPresentGesture:(id)a3;
- (void)_handleFluidGesture:(id)a3;
- (void)_handleHoverGesture:(id)a3;
- (void)_handleScrunchGesture:(id)a3;
- (void)_handleSwitcherGestureBegan:(id)a3;
- (void)_handleSwitcherPanGestureBegan:(id)a3;
- (void)_handleSwitcherPanGestureChanged:(id)a3;
- (void)_handleSwitcherPanGestureEnded:(id)a3;
- (void)_handleTapToBringItemContainerForward:(id)a3;
- (void)_handleWindowDragGestureRecognizer:(id)a3;
- (void)_hideGrabberAnimated:(BOOL)a3;
- (void)_setUpChamoisGestureRecognizers;
- (void)_setUpFloatingApplicationGestureRecognizers;
- (void)_setUpGestureRecognizers;
- (void)_setUpScrunchGestureRecognizerIfNeeded;
- (void)_startFluidSwitcherTransactionForGestureRecognizer:(id)a3;
- (void)_tearDownChamoisGestureRecognizers;
- (void)_tearDownFloatingApplicationGestureRecognizers;
- (void)_updateChamoisGestureRecognizerPresenceForWindowManagementStyle:(unint64_t)a3;
- (void)_updateCurrentHomeGrabberViews;
- (void)_updateDeckSwitcherInSwitcherGesturePresence;
- (void)_updateExclusionTrapezoidDebugView;
- (void)_updateFloatingApplicationGestureRecognizerPresenceForWindowManagementStyle:(unint64_t)a3;
- (void)_updateFluidDragAndDropManagerPresenceForWindowManagementStyle:(unint64_t)a3;
- (void)_updateGestureDefaults;
- (void)_updateHomeAffordanceHitTestRects;
- (void)_updateHomeAffordanceInteraction;
- (void)_updateHomeGrabberViewsWithAnimationMode:(int64_t)a3;
- (void)_updateIndirectBottomEdgePanGesturePresence;
- (void)_updateSwitcherBottomEdgeGesturePresence;
- (void)_updateZStackParticipantWithReason:(id)a3;
- (void)_updateZStackPolicyAssistantsWithLayoutState:(id)a3;
- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5;
- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5;
- (void)dealloc;
- (void)dragAndDropManager:(id)a3 didBeginDraggingWindowWithSceneIdentifier:(id)a4;
- (void)dragAndDropManager:(id)a3 didBeginGesture:(id)a4;
- (void)dragAndDropManager:(id)a3 didEndGesture:(id)a4;
- (void)dragAndDropManager:(id)a3 didPlatterizeWindowDragWithSceneIdentifier:(id)a4;
- (void)dragAndDropManager:(id)a3 didUpdateGesture:(id)a4;
- (void)dragAndDropManager:(id)a3 willEndDraggingWindowWithSceneIdentifier:(id)a4;
- (void)failMultitaskingGesturesForReason:(id)a3;
- (void)fluidSwitcherGestureTransaction:(id)a3 didBeginGesture:(id)a4;
- (void)fluidSwitcherGestureTransaction:(id)a3 didEndGesture:(id)a4;
- (void)fluidSwitcherGestureTransaction:(id)a3 didUpdateGesture:(id)a4;
- (void)grabberTongueBeganPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueCanceledPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueDidPresentInteractively:(id)a3 withDistance:(double)a4 andVelocity:(double)a5;
- (void)grabberTongueEndedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueUpdatedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueWillDismiss:(id)a3;
- (void)grabberTongueWillPresent:(id)a3;
- (void)grabberTongueWillPresentInteractively:(id)a3 withDistance:(double)a4 andVelocity:(double)a5;
- (void)handleTransitionRequestForGestureComplete:(id)a3;
- (void)handleTransitionRequestForGestureUpdate:(id)a3;
- (void)homeGrabberViewDidFailToRecognizeDoubleTap:(id)a3;
- (void)homeGrabberViewDidReceiveClick:(id)a3;
- (void)homeGrabberViewDidRecognizeDoubleTap:(id)a3;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)presentContinuousExposeStripRevealGrabberTongueImmediately;
- (void)relinquishHiddenAssertionForHomeGrabber:(id)a3;
- (void)setActiveGestureTransaction:(id)a3;
- (void)setAppSwitcherDefaults:(id)a3;
- (void)setAppSwitcherSettings:(id)a3;
- (void)setClickAndDragHomeGestureRecognizer:(id)a3;
- (void)setClickDownToBringItemContainerForwardGestureRecognizer:(id)a3;
- (void)setContinuousExposeStripRevealGrabberTongue:(id)a3;
- (void)setCurrentHomeGrabberViews:(id)a3;
- (void)setDeckGrabberTongue:(id)a3;
- (void)setDeckInSwitcherPanGestureRecognizer:(id)a3;
- (void)setDelayedHomeGrabberUpdateTimer:(id)a3;
- (void)setDisplayItemLayoutAttributesCalculator:(id)a3;
- (void)setDragContinuousExposeStripOverflowGestureRecognizer:(id)a3;
- (void)setEdgeProtectFeedbackGenerator:(id)a3;
- (void)setExclusionTrapezoidDebugView:(id)a3;
- (void)setFluidDragAndDropManager:(id)a3;
- (void)setFluidScrunchGestureRecognizer:(id)a3;
- (void)setHomeAffordanceInteraction:(id)a3;
- (void)setHomeGestureSettings:(id)a3;
- (void)setHomeGrabberSettings:(id)a3;
- (void)setHoverGestureRecognizer:(id)a3;
- (void)setIndirectBottomEdgePanGestureRecognizer:(id)a3;
- (void)setIndirectContinuousExposeStripOverflowGestureRecognizer:(id)a3;
- (void)setIndirectDismissFloatingApplicationGestureRecognizer:(id)a3;
- (void)setIndirectFloatingAppScrunchGestureRecognizer:(id)a3;
- (void)setInteractivelyPresentingTongue:(BOOL)a3;
- (void)setLayoutStateTransitionCoordinator:(id)a3;
- (void)setLeftEdgeFloatingAppGrabberTongue:(id)a3;
- (void)setLiveWindowResizeGestureRecognizer:(id)a3;
- (void)setMoveFloatingApplicationGestureRecognizer:(id)a3;
- (void)setMultitaskingGesturesRequireEducation:(BOOL)a3;
- (void)setMultitaskingGesturesUserPreferenceIsOff:(BOOL)a3;
- (void)setPinFloatingApplicationGestureRecognizer:(id)a3;
- (void)setPlayedEdgeProtectHaptic:(BOOL)a3;
- (void)setPresentedSceneBackedBanners:(id)a3;
- (void)setRightEdgeFloatingAppGrabberTongue:(id)a3;
- (void)setSceneResizePanGestureRecognizer:(id)a3;
- (void)setShouldRubberbandGrabberViewForReduceMotion:(BOOL)a3;
- (void)setSuppressionAssertions:(id)a3;
- (void)setSwipeUpFloatingAppGestureRecognizer:(id)a3;
- (void)setSwitcherContentController:(id)a3;
- (void)setTapToBringItemContainerForwardGestureRecognizer:(id)a3;
- (void)setUnpinSplitViewApplicationGestureRecognizer:(id)a3;
- (void)setUsesHomeAffordanceRulesForGrabberTongue:(BOOL)a3;
- (void)setWindowMoveClientGateRelationshipGestureRecognizer:(id)a3;
- (void)setZStackAudioCategoryPolicyAssistant:(id)a3;
- (void)setZStackParticipant:(id)a3;
- (void)setZStackPhysicalButtonPolicyAssistant:(id)a3;
- (void)setZStackSystemAperturePolicyAssistant:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)takeHiddenAssertionForHomeGrabber:(id)a3;
- (void)tickleContinuousExposeStripRevealGrabberTongueIfVisible;
- (void)updateForWindowManagementStyle:(unint64_t)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBFluidSwitcherGestureManager

- (SBFluidSwitcherGestureWorkspaceTransaction)activeGestureTransaction
{
  return self->_activeGestureTransaction;
}

- (BOOL)isSwitcherForegroundActive
{
  return [(SBFZStackParticipant *)self->_zStackParticipant activationState] == 0;
}

- (CGRect)homeAffordanceFrameForHomeAffordanceInteraction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  v4 = [WeakRetained view];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v13 = [MEMORY[0x1E4F743B8] sharedInstance];
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat rect = *MEMORY[0x1E4F1DB28];
  v15 = objc_opt_class();
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  [v15 suggestedSizeForContentWidth:v13 withSettings:CGRectGetWidth(v35)];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v36.origin.x = v6;
  v36.origin.y = v8;
  v36.size.width = v10;
  v36.size.height = v12;
  double Width = CGRectGetWidth(v36);
  v37.origin.x = rect;
  v37.origin.y = v14;
  v37.size.width = v17;
  v37.size.height = v19;
  CGFloat v21 = (Width - CGRectGetWidth(v37)) * 0.5;
  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = v12;
  CGRectGetHeight(v38);
  v39.origin.x = v21;
  v39.origin.y = v14;
  v39.size.width = v17;
  v39.size.height = v19;
  CGRectGetHeight(v39);
  [v13 edgeSpacing];
  SBScreenScale();
  BSRectRoundForScale();
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (BOOL)_isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  v3 = [WeakRetained windowScene];
  v4 = [v3 assistantController];
  char v5 = [v4 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  return v5;
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  id v4 = a3;
  if (self->_interactivelyPresentingTongue || self->_shouldRubberbandGrabberViewForReduceMotion)
  {
    [(SBGrabberTongue *)self->_deckGrabberTongue distanceFromEdge];
    [v4 suggestedEdgeSpacing];
    BSUIConstrainValueWithRubberBand();
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  double v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 unlockedEnvironmentMode];
    switch(v8)
    {
      case 0:
      case 3:
        uint64_t v37 = v8;
        uint64_t v9 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];
        if (v9)
        {
          CGFloat v10 = (void *)v9;
          double v11 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];
          int v12 = [v11 isComplete];

          uint64_t v13 = 0;
          if (v12) {
            uint64_t v14 = 2;
          }
          else {
            uint64_t v14 = 1;
          }
        }
        else
        {
          uint64_t v13 = 0;
          uint64_t v14 = 2;
        }
        goto LABEL_10;
      case 1:
        goto LABEL_7;
      case 2:
        uint64_t v14 = 1;
        uint64_t v15 = 2;
        goto LABEL_9;
      default:
        uint64_t v14 = 0;
        uint64_t v13 = 0;
        objc_msgSend(v5, "setHomeGestureConsumption:", 1, v8);
        break;
    }
  }
  else
  {
LABEL_7:
    uint64_t v14 = 0;
    uint64_t v15 = 1;
LABEL_9:
    uint64_t v37 = v15;
    uint64_t v13 = 1;
LABEL_10:
    objc_msgSend(v5, "setHomeGestureConsumption:", 1, v37);
  }
  CGRect v39 = v7;
  if ([v7 isFloatingSwitcherVisible]) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v13;
  }
  [v5 setHomeAffordanceDrawingSuppression:v16];
  [v5 setActivationPolicyForParticipantsBelow:v14];
  [v5 setSuppressSystemApertureForSystemChromeSuppression:-[SBSystemApertureZStackPolicyAssistant suppressSystemApertureForSystemChromeSuppression]((BOOL)self->_zStackSystemAperturePolicyAssistant)];
  CGFloat v17 = (void *)MEMORY[0x1E4F1CA80];
  double v18 = -[SBCameraHardwareButton foregroundCameraShutterButtonPIDs]((uint64_t)self->_zStackSystemAperturePolicyAssistant);
  CGFloat v19 = [v17 setWithSet:v18];

  v20 = (void *)MEMORY[0x1E4F1CA80];
  CGFloat v21 = -[SBCameraHardwareButton allCameraShutterButtonPIDs]((uint64_t)self->_zStackSystemAperturePolicyAssistant);
  double v22 = [v20 setWithSet:v21];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  double v23 = self->_suppressionAssertions;
  uint64_t v24 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        double v28 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        double v29 = [v28 sceneID];
        double v30 = [v28 bundleID];
        if (v29) {
          [v19 addObject:v29];
        }
        if (v30) {
          [v22 addObject:v30];
        }
      }
      uint64_t v25 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v25);
  }

  [v5 setAssociatedSceneIdentifiersToSuppressInSystemAperture:v19];
  [v5 setAssociatedBundleIdentifiersToSuppressInSystemAperture:v22];
  double v31 = -[SBPhysicalButtonZStackPolicyAssistant physicalButtonSceneTargets]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant);
  [v5 setPhysicalButtonSceneTargets:v31];

  double v32 = -[SBPhysicalButtonZStackPolicyAssistant captureButtonFullFidelityEventRequestingScenes]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant);
  [v5 setCaptureButtonFullFidelityEventRequestingScenes:v32];

  double v33 = -[SBPhysicalButtonZStackPolicyAssistant foregroundCaptureSceneTargets]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant);
  [v5 setForegroundCaptureSceneTargets:v33];

  v34 = -[SBAudioCategoryZStackPolicyAssistant audioCategoriesDisablingVolumeHUD]((uint64_t)self->_zStackAudioCategoryPolicyAssistant);
  [v5 setAudioCategoriesDisablingVolumeHUD:v34];

  if (v38 == 3)
  {
    CGRect v35 = v39;
    if ([(SBAppSwitcherSettings *)self->_appSwitcherSettings effectiveSwitcherStyle] == 2)
    {
      uint64_t v36 = 1;
    }
    else if ((unint64_t)([v39 interfaceOrientation] - 3) < 2)
    {
      uint64_t v36 = 1;
    }
    else
    {
      uint64_t v36 = 2;
    }
  }
  else
  {
    uint64_t v36 = 0;
    CGRect v35 = v39;
  }
  [v5 setAllowsDimmingWhenForegroundInactive:v36];
}

- (void)_updateCurrentHomeGrabberViews
{
  uint64_t v3 = [(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture];
  id v10 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  id v4 = [v10 appLayout];
  id v5 = [v10 floatingAppLayout];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  double v7 = [WeakRetained homeGrabberViewForAppLayout:v4];
  uint64_t v8 = [WeakRetained homeGrabberViewForAppLayout:v5];
  uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  if (v7)
  {
    [v7 setHomeAffordanceInteractionEnabled:v3];
    [v9 addObject:v7];
  }
  if (v8)
  {
    [v8 setHomeAffordanceInteractionEnabled:v3];
    [v9 addObject:v8];
  }
  [(SBFluidSwitcherGestureManager *)self setCurrentHomeGrabberViews:v9];
}

- (id)_currentLayoutState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  uint64_t v3 = [WeakRetained layoutState];

  return v3;
}

- (void)setCurrentHomeGrabberViews:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SBFluidSwitcherGestureManager *)self _isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  double v7 = self->_currentHomeGrabberViews;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        if (([v4 containsObject:v12] & 1) == 0) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v9);
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * j);
        if (![(NSHashTable *)self->_currentHomeGrabberViews containsObject:v19]) {
          [v13 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v16);
  }

  objc_storeStrong((id *)&self->_currentHomeGrabberViews, a3);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = v6;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * k);
        if (([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture] & 1) == 0)
        {
          [(SBFluidSwitcherGestureManager *)self relinquishHiddenAssertionForHomeGrabber:v25];
          [(SBFluidSwitcherGestureManager *)self takeHiddenAssertionForHomeGrabber:v25];
        }
        [v25 setDelegate:0];
        [v25 setPointerClickDelegate:0];
        if (v5) {
          [v25 removeObserver:self];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v22);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = v13;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        double v31 = *(void **)(*((void *)&v33 + 1) + 8 * m);
        [v31 setDelegate:self];
        [v31 setPointerClickDelegate:self];
        if (v5) {
          [v31 addObserver:self];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v28);
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v14 = a4;
  [(NSTimer *)self->_delayedHomeGrabberUpdateTimer invalidate];
  delayedHomeGrabberUpdateTimer = self->_delayedHomeGrabberUpdateTimer;
  self->_delayedHomeGrabberUpdateTimer = 0;

  [(SBFluidSwitcherGestureManager *)self _updateHomeAffordanceInteraction];
  [(SBFluidSwitcherGestureManager *)self _updateHomeAffordanceHitTestRects];
  [(SBFluidSwitcherGestureManager *)self _updateExclusionTrapezoidDebugView];
  id v6 = [v14 toLayoutState];
  double v7 = [v6 elements];
  unint64_t v8 = [v7 count];

  if (v8 >= 2) {
    _UIInitializeDraggingSystem();
  }
  uint64_t v9 = [v14 toLayoutState];
  uint64_t v10 = self;
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  [(SBFluidSwitcherGestureManager *)self _updateZStackPolicyAssistantsWithLayoutState:v13];
  [(SBFluidSwitcherGestureManager *)self _updateZStackParticipantWithReason:@"layout state transition did begin"];
}

- (void)_updateZStackPolicyAssistantsWithLayoutState:(id)a3
{
  id v5 = a3;
  id v6 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];

  if (!v5 && v6)
  {
    [(SBFluidSwitcherGestureManager *)self _clearAudioCategoryZStackPolicyAssistant];
    [(SBFluidSwitcherGestureManager *)self _clearSystemApertureZStackPolicyAssistantSuppression];
    [(SBFluidSwitcherGestureManager *)self _clearPhysicalButtonZStackPolicyAssistant];
    goto LABEL_20;
  }
  SEL v22 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  unint64_t v8 = [WeakRetained dataSource];
  uint64_t v9 = [v5 unlockedEnvironmentMode];
  uint64_t v10 = [v5 appLayout];
  id v11 = v10;
  if (self->_zStackSystemAperturePolicyAssistant)
  {
    uint64_t v12 = [v10 itemForLayoutRole:1];
    id v13 = [v5 elements];
    if ([v13 count] == 1 && v12)
    {
      uint64_t v14 = [v12 type];

      uint64_t v15 = 0;
      uint64_t v16 = 0;
      if (v9 != 3 || v14) {
        goto LABEL_15;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = [v8 switcherContentController:WeakRetained deviceApplicationSceneHandleForDisplayItem:v12];
        if (v15)
        {
          uint64_t v16 = [WeakRetained homeGrabberViewForAppLayout:v11];
LABEL_15:
          -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_zStackSystemAperturePolicyAssistant, v15, v16);

          goto LABEL_16;
        }
LABEL_14:
        uint64_t v16 = 0;
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v15 = 0;
    goto LABEL_14;
  }
LABEL_16:
  id v17 = objc_loadWeakRetained((id *)&self->_switcherController);
  uint64_t v18 = [v17 windowManagementStyle];
  uint64_t v29 = 0;
  double v30 = &v29;
  uint64_t v31 = 0x3032000000;
  double v32 = __Block_byref_object_copy__110;
  long long v33 = __Block_byref_object_dispose__110;
  id v34 = 0;
  if (v9 == 3)
  {
    uint64_t v19 = v18;
    if (objc_opt_respondsToSelector())
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __78__SBFluidSwitcherGestureManager__updateZStackPolicyAssistantsWithLayoutState___block_invoke;
      v23[3] = &unk_1E6B0C068;
      BOOL v28 = v19 == 2;
      SEL v27 = v22;
      v23[4] = self;
      id v24 = v8;
      id v25 = WeakRetained;
      id v26 = &v29;
      id v20 = (void (**)(void, void))MEMORY[0x1D948C7A0](v23);
      uint64_t v21 = [v5 floatingAppLayout];
      ((void (**)(void, void *))v20)[2](v20, v21);

      ((void (**)(void, void *))v20)[2](v20, v11);
    }
  }
  [(SBZStackForegroundSceneOrderedPolicyAssistant *)self->_zStackAudioCategoryPolicyAssistant setForegroundScenes:v30[5]];
  [(SBZStackForegroundSceneOrderedPolicyAssistant *)self->_zStackPhysicalButtonPolicyAssistant setForegroundScenes:v30[5]];
  _Block_object_dispose(&v29, 8);

LABEL_20:
}

- (void)_updateHomeAffordanceHitTestRects
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if ([(SBFluidSwitcherGestureManager *)self _isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled])
  {
    if ([MEMORY[0x1E4F43178] instancesRespondToSelector:sel_setHomeAffordanceScreenFixedFrame_])
    {
      long long v69 = 0uLL;
      long long v70 = 0uLL;
      long long v67 = 0uLL;
      long long v68 = 0uLL;
      obuint64_t j = [(SBFluidSwitcherGestureManager *)self currentHomeGrabberViews];
      uint64_t v3 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v68;
        double v6 = *MEMORY[0x1E4F1DB28];
        double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        do
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v68 != v5) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            uint64_t v12 = [(SBFluidSwitcherGestureManager *)self _appLayoutForHomeGrabberView:v11];
            double v13 = v9;
            double v14 = v8;
            double v15 = v7;
            double v16 = v6;
            if ([(SBFluidSwitcherGestureManager *)self _isHomeAffordanceHitTestRectForAppLayoutRelevant:v12])
            {
              id v17 = [v11 _screen];
              uint64_t v18 = [v17 fixedCoordinateSpace];

              [v11 grabberHitTestRect];
              objc_msgSend(v11, "convertRect:toCoordinateSpace:", v18);
              double v16 = v19;
              double v15 = v20;
              double v14 = v21;
              double v13 = v22;
            }
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            uint64_t v23 = [(SBFluidSwitcherGestureManager *)self _scenesForAppLayout:v12];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v63 objects:v73 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v64;
              do
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v64 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  BOOL v28 = [*(id *)(*((void *)&v63 + 1) + 8 * j) _homeAffordanceHostSceneComponent];
                  objc_msgSend(v28, "setHomeAffordanceScreenFixedFrame:", v16, v15, v14, v13);
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v63 objects:v73 count:16];
              }
              while (v25);
            }
          }
          uint64_t v4 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
        }
        while (v4);
      }
    }
    else
    {
      long long v61 = 0uLL;
      long long v62 = 0uLL;
      long long v59 = 0uLL;
      long long v60 = 0uLL;
      obuint64_t j = [(SBFluidSwitcherGestureManager *)self currentHomeGrabberViews];
      uint64_t v29 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v60;
        double v32 = *MEMORY[0x1E4F1DB28];
        double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v60 != v31) {
              objc_enumerationMutation(obj);
            }
            long long v37 = *(void **)(*((void *)&v59 + 1) + 8 * k);
            long long v38 = [(SBFluidSwitcherGestureManager *)self _appLayoutForHomeGrabberView:v37];
            double v39 = v35;
            double v40 = v34;
            double v41 = v33;
            double v42 = v32;
            if ([(SBFluidSwitcherGestureManager *)self _isHomeAffordanceHitTestRectForAppLayoutRelevant:v38])
            {
              long long v43 = [v37 window];
              [v37 grabberHitTestRect];
              objc_msgSend(v37, "convertRect:toView:", v43);
              objc_msgSend(v43, "_convertRectToSceneReferenceSpace:");
              double v42 = v44;
              double v41 = v45;
              double v40 = v46;
              double v39 = v47;
            }
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v48 = [(SBFluidSwitcherGestureManager *)self _scenesForAppLayout:v38];
            uint64_t v49 = [v48 countByEnumeratingWithState:&v55 objects:v71 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              uint64_t v51 = *(void *)v56;
              do
              {
                for (uint64_t m = 0; m != v50; ++m)
                {
                  if (*(void *)v56 != v51) {
                    objc_enumerationMutation(v48);
                  }
                  uint64_t v53 = [*(id *)(*((void *)&v55 + 1) + 8 * m) _homeAffordanceHostSceneComponent];
                  objc_msgSend(v53, "setHomeAffordanceSceneReferenceFrame:", v42, v41, v40, v39);
                }
                uint64_t v50 = [v48 countByEnumeratingWithState:&v55 objects:v71 count:16];
              }
              while (v50);
            }
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
        }
        while (v30);
      }
    }
  }
}

- (void)_updateExclusionTrapezoidDebugView
{
  exclusionTrapezoidDebugView = self->_exclusionTrapezoidDebugView;
  uint64_t v4 = (void *)MEMORY[0x1E4F43AC0];
  uint64_t v5 = (void *)MEMORY[0x1E4F43AC8];
  if (exclusionTrapezoidDebugView)
  {
    [(UIView *)exclusionTrapezoidDebugView removeFromSuperview];
    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:*v4 object:0];

    double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:*v5 object:0];
  }
  double v8 = [(SBHomeGestureSettings *)self->_homeGestureSettings exclusionTrapezoidSettings];
  int v9 = [v8 showExclusionTrapezoidDebugView];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:self selector:sel__updateExclusionTrapezoidDebugView name:*v4 object:0];

    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:self selector:sel__updateExclusionTrapezoidDebugView name:*v5 object:0];

    uint64_t v12 = objc_opt_class();
    double v13 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
    SBSafeCast(v12, v13);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    [v20 _touchInterfaceOrientation];
    double v14 = [v20 _currentExclusionShapeForEdge:_screenRegionGivenInterfaceOrientedRegion()];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    double v16 = [WeakRetained view];

    id v17 = [v14 debugView];
    uint64_t v18 = self->_exclusionTrapezoidDebugView;
    self->_exclusionTrapezoidDebugView = v17;

    double v19 = self->_exclusionTrapezoidDebugView;
    [v16 bounds];
    -[UIView setFrame:](v19, "setFrame:");
    [(UIView *)self->_exclusionTrapezoidDebugView setAutoresizingMask:18];
    [v16 addSubview:self->_exclusionTrapezoidDebugView];
  }
}

void __78__SBFluidSwitcherGestureManager__updateZStackPolicyAssistantsWithLayoutState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      id v5 = [v3 zOrderedItems];
    }
    else
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v6 = [v4 itemForLayoutRole:4];
      objc_msgSend(v5, "bs_safeAddObject:", v6);

      double v7 = [v4 itemForLayoutRole:1];
      objc_msgSend(v5, "bs_safeAddObject:", v7);

      double v8 = [v4 itemForLayoutRole:2];
      objc_msgSend(v5, "bs_safeAddObject:", v8);

      uint64_t v9 = [v5 count];
      uint64_t v10 = [v4 allItems];
      uint64_t v11 = [v10 count];

      if (v9 != v11)
      {
        id v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"SBFluidSwitcherGestureManager.m" lineNumber:3113 description:@"Item counts should match"];
      }
    }
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __78__SBFluidSwitcherGestureManager__updateZStackPolicyAssistantsWithLayoutState___block_invoke_2;
    double v21 = &unk_1E6B0C040;
    id v22 = *(id *)(a1 + 40);
    id v23 = *(id *)(a1 + 48);
    uint64_t v12 = objc_msgSend(v5, "bs_compactMap:", &v18);
    if (objc_msgSend(v12, "count", v18, v19, v20, v21))
    {
      double v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (!v13)
      {
        uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
        double v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        double v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      }
      [v13 addObjectsFromArray:v12];
    }
  }
}

- (void)_updateZStackParticipantWithReason:(id)a3
{
}

id __78__SBFluidSwitcherGestureManager__updateZStackPolicyAssistantsWithLayoutState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) switcherContentController:*(void *)(a1 + 40) deviceApplicationSceneHandleForDisplayItem:v3];
  }

  return v4;
}

- (BOOL)grabberTongue:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (SBGrabberTongue *)a3;
  id v7 = a4;
  if (self->_deckGrabberTongue == v6)
  {
    if (![(SBGrabberTongue *)v6 isVisible] && self->_usesHomeAffordanceRulesForGrabberTongue)
    {
      [(SBGrabberTongue *)v6 edgeLocationForTouch:v7];
      double v13 = v12;
      if ([(SBFluidSwitcherGestureManager *)self _shouldProtectEdgeLocation:[(SBGrabberTongue *)v6 screenEdge] edge:v12])
      {
        BOOL v10 = [(SBFluidSwitcherGestureManager *)self _isEdgeLocationInHomeAffordanceRegion:v13];
        goto LABEL_8;
      }
    }
LABEL_13:
    BOOL v11 = 1;
    goto LABEL_14;
  }
  if (self->_leftEdgeFloatingAppGrabberTongue != v6)
  {
    if (self->_continuousExposeStripRevealGrabberTongue != v6) {
      goto LABEL_13;
    }
    if (![(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture]
      || ([(SBFluidSwitcherGestureManager *)self _currentLayoutState],
          double v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 unlockedEnvironmentMode],
          v8,
          v9 != 3))
    {
      BOOL v11 = 0;
      goto LABEL_14;
    }
    if (![(SBGrabberTongue *)v6 isVisible]) {
      goto LABEL_13;
    }
  }
  [(SBGrabberTongue *)v6 edgeLocationForTouch:v7];
  BOOL v10 = -[SBGrabberTongue isEdgeLocationInGrabberRegion:](v6, "isEdgeLocationInGrabberRegion:");
LABEL_8:
  BOOL v11 = v10;
LABEL_14:

  return v11;
}

- (BOOL)_shouldProtectEdgeLocation:(double)a3 edge:(unint64_t)a4
{
  if ([(SBFluidSwitcherGestureManager *)self _shouldSuppressEdgeProtect]) {
    return 0;
  }
  [(SBFHomeGrabberSettings *)self->_homeGrabberSettings edgeProtectOverride];
  if (BSSettingFlagIsYes()) {
    return 1;
  }
  if (BSSettingFlagIsExplicitNo()) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  char v9 = [WeakRetained isEdgeProtectedForHomeGestureAtEdgeLocation:a4 edge:a3];

  return v9;
}

- (BOOL)_shouldSuppressEdgeProtect
{
  id v3 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];

  if (v3) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v5 = [WeakRetained layoutContext];
  double v6 = [v5 activeTransitionContext];

  if (v6) {
    return 1;
  }
  char v9 = +[SBWorkspace mainWorkspace];
  BOOL v10 = [v9 transientOverlayPresentationManager];

  BOOL v7 = ([v10 hasActivePresentation] & 1) != 0
    || [(SBFluidSwitcherGestureManager *)self _shouldSuppressEdgeProtectToAllowSwipesImmediatelyAfterTransition];

  return v7;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 toLayoutState];
  if (([v7 isInterrupted] & 1) == 0)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    char v9 = self->_currentHomeGrabberViews;
    uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v29;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * v12++) updateStyle];
        }
        while (v10 != v12);
        uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v10);
    }

    if ([(SBFluidSwitcherGestureManager *)self _shouldSuppressEdgeProtectToAllowSwipesImmediatelyAfterTransition])
    {
      objc_initWeak(&location, self);
      double v13 = (void *)MEMORY[0x1E4F1CB00];
      [(SBHomeGestureSettings *)self->_homeGestureSettings secondsToAllowMultipleEdges];
      double v15 = v14;
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      uint64_t v24 = __104__SBFluidSwitcherGestureManager_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
      uint64_t v25 = &unk_1E6AF61A0;
      objc_copyWeak(&v26, &location);
      double v16 = [v13 scheduledTimerWithTimeInterval:0 repeats:&v22 block:v15];
      delayedHomeGrabberUpdateTimer = self->_delayedHomeGrabberUpdateTimer;
      self->_delayedHomeGrabberUpdateTimer = v16;

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    uint64_t v18 = self;
    id v19 = v8;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }
    }
    else
    {
      id v20 = 0;
    }
    id v21 = v20;

    [(SBFluidSwitcherGestureManager *)self _updateZStackPolicyAssistantsWithLayoutState:v21];
  }
  [(SBFluidSwitcherGestureManager *)self _updateHomeAffordanceInteraction];
  [(SBFluidSwitcherGestureManager *)self _updateHomeAffordanceHitTestRects];
  [(SBFluidSwitcherGestureManager *)self _updateExclusionTrapezoidDebugView];
}

- (BOOL)_shouldSuppressEdgeProtectToAllowSwipesImmediatelyAfterTransition
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  uint64_t v4 = [WeakRetained layoutContext];

  [v4 secondsSinceLastTransitionCompletion];
  double v6 = v5;
  [(SBHomeGestureSettings *)v2->_homeGestureSettings secondsToAllowMultipleEdges];
  LOBYTE(v2) = v6 < v7;

  return (char)v2;
}

- (void)_updateHomeAffordanceInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  uint64_t v4 = [WeakRetained windowManagementStyle];

  if (v4 == 2)
  {
    double v5 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
    uint64_t v6 = [v5 unlockedEnvironmentMode];
    double v7 = [v5 appLayout];
    uint64_t v8 = 0;
    if ([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture] && v6 == 3)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_switcherContentController);
      uint64_t v8 = [v9 appLayoutContainsAnUnoccludedMaximizedDisplayItem:v7] ^ 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(SBFHomeAffordanceInteraction *)self->_homeAffordanceInteraction setEnabled:v8];
  homeAffordanceInteraction = self->_homeAffordanceInteraction;
  [(SBFHomeAffordanceInteraction *)homeAffordanceInteraction setNeedsUpdate];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v6 = (SBFluidSwitcherPanGestureRecognizer *)a3;
  id v7 = a4;
  if (self->_deckInSwitcherPanGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldDeckInSwitcherPanGesture:v6 receiveTouch:v7];
LABEL_26:
    BOOL v8 = v9;
    goto LABEL_27;
  }
  if (self->_swipeUpFloatingAppGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldFloatingApplicationSwipeUpGesture:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  if (self->_moveFloatingApplicationGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldFloatingApplicationMoveGesture:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  if (self->_pinFloatingApplicationGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldFloatingApplicationPinGesture:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  if (self->_unpinSplitViewApplicationGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldSplitViewApplicationUnpinGesture:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  if ((SBFluidSwitcherPanGestureRecognizer *)self->_sceneResizePanGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldSceneResizeGesture:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectFloatingAppScrunchGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldIndirectFloatingAppScrunchGesture:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  if (self->_clickAndDragHomeGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldClickAndDragHomeGesture:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  if (self->_liveWindowResizeGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldLiveResizeGesture:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  if ((SBFluidSwitcherPanGestureRecognizer *)self->_tapToBringItemContainerForwardGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldTapToBringItemContainerForward:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  if ((SBFluidSwitcherPanGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldClickDownToBringItemContainerForward:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  if (self->_dragContinuousExposeStripOverflowGestureRecognizer == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldContinuousExposeStripOverflowPanGesture:v6 receiveTouch:v7];
    goto LABEL_26;
  }
  BOOL v8 = 1;
LABEL_27:

  return v8;
}

- (BOOL)_shouldClickAndDragHomeGesture:(id)a3 receiveTouch:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a4, "_isPointerTouch", a3))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    uint64_t v6 = [WeakRetained windowScene];
    id v7 = [v6 systemPointerInteractionManager];
    BOOL v8 = [v7 activePointerRegionView];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v9 = self->_currentHomeGrabberViews;
    uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if (*(void **)(*((void *)&v14 + 1) + 8 * i) == v8)
          {
            LOBYTE(v10) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (void)zStackParticipantDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_currentHomeGrabberViews;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        if ([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture])[(SBFluidSwitcherGestureManager *)self relinquishHiddenAssertionForHomeGrabber:v9]; {
        else
        }
          [(SBFluidSwitcherGestureManager *)self takeHiddenAssertionForHomeGrabber:v9];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  [WeakRetained zStackActivationStateUpdated];

  [(SBFluidSwitcherGestureManager *)self _updateHomeAffordanceInteraction];
}

- (void)relinquishHiddenAssertionForHomeGrabber:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FA5F28];
  id v4 = a3;
  id v7 = [v3 rootSettings];
  uint64_t v5 = [v7 unhideForHomeGestureOwnershipAnimationSettings];
  uint64_t v6 = [v5 BSAnimationSettings];

  [v4 setHomeAffordanceInteractionEnabled:1];
  [v4 setHidden:0 forReason:@"SBFluidSwitcherHomeGestureNotOwnedGrabberHiddenReason" withAnimationSettings:v6];
}

- (SBFluidSwitcherGestureManager)initWithSwitcherController:(id)a3 delegate:(id)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  obuint64_t j = a3;
  id v45 = a4;
  v52.receiver = self;
  v52.super_class = (Class)SBFluidSwitcherGestureManager;
  uint64_t v6 = [(SBFluidSwitcherGestureManager *)&v52 init];
  if (v6)
  {
    long long v43 = [obj windowScene];
    id v7 = [obj contentViewController];
    uint64_t v8 = objc_opt_class();
    id v9 = v7;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v44 = v10;

    objc_storeWeak((id *)&v6->_switcherController, obj);
    objc_storeWeak((id *)&v6->_switcherContentController, v44);
    objc_storeWeak((id *)&v6->_delegate, v45);
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    currentHomeGrabberViews = v6->_currentHomeGrabberViews;
    v6->_currentHomeGrabberViews = (NSHashTable *)v11;

    long long v13 = [v43 homeAffordanceInteractionManager];
    uint64_t v14 = [v13 newHomeAffordanceInteraction];
    homeAffordanceInteraction = v6->_homeAffordanceInteraction;
    v6->_homeAffordanceInteraction = (SBFHomeAffordanceInteraction *)v14;

    [(SBFHomeAffordanceInteraction *)v6->_homeAffordanceInteraction setDelegate:v6];
    uint64_t v16 = [v44 view];
    [v16 addInteraction:v6->_homeAffordanceInteraction];

    uint64_t v17 = [v43 layoutStateTransitionCoordinator];
    layoutStateTransitionCoordinator = v6->_layoutStateTransitionCoordinator;
    v6->_layoutStateTransitionCoordinator = (SBLayoutStateTransitionCoordinator *)v17;

    [(SBLayoutStateTransitionCoordinator *)v6->_layoutStateTransitionCoordinator addObserver:v6];
    uint64_t v19 = +[SBAppSwitcherDomain rootSettings];
    appSwitcherSettings = v6->_appSwitcherSettings;
    v6->_appSwitcherSettings = (SBAppSwitcherSettings *)v19;

    uint64_t v21 = +[SBHomeGestureDomain rootSettings];
    homeGestureSettings = v6->_homeGestureSettings;
    v6->_homeGestureSettings = (SBHomeGestureSettings *)v21;

    [(PTSettings *)v6->_homeGestureSettings addKeyObserver:v6];
    uint64_t v23 = [MEMORY[0x1E4FA5F28] rootSettings];
    homeGrabberSettings = v6->_homeGrabberSettings;
    v6->_homeGrabberSettings = (SBFHomeGrabberSettings *)v23;

    objc_initWeak(&location, v6);
    uint64_t v25 = +[SBDefaults localDefaults];
    uint64_t v26 = [v25 appSwitcherDefaults];
    appSwitcherDefaults = v6->_appSwitcherDefaults;
    v6->_appSwitcherDefaults = (SBAppSwitcherDefaults *)v26;

    long long v28 = v6->_appSwitcherDefaults;
    long long v29 = [NSString stringWithUTF8String:"trackpadSwitcherGesturesEnabled"];
    v54[0] = v29;
    long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    id v31 = MEMORY[0x1E4F14428];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __69__SBFluidSwitcherGestureManager_initWithSwitcherController_delegate___block_invoke;
    v49[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v50, &location);
    id v32 = (id)[(SBAppSwitcherDefaults *)v28 observeDefaults:v30 onQueue:MEMORY[0x1E4F14428] withBlock:v49];

    uint64_t v33 = +[SBDefaults localDefaults];
    double v34 = [v33 gestureDefaults];

    double v35 = [NSString stringWithUTF8String:"multitaskingGesturesRequireEducation"];
    v53[0] = v35;
    long long v36 = [NSString stringWithUTF8String:"systemGesturesAllowed"];
    v53[1] = v36;
    long long v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __69__SBFluidSwitcherGestureManager_initWithSwitcherController_delegate___block_invoke_2;
    v47[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v48, &location);
    id v38 = (id)[v34 observeDefaults:v37 onQueue:MEMORY[0x1E4F14428] withBlock:v47];

    [(SBFluidSwitcherGestureManager *)v6 _updateGestureDefaults];
    double v39 = objc_alloc_init(SBDisplayItemLayoutAttributesCalculator);
    displayItemLayoutAttributesCalculator = v6->_displayItemLayoutAttributesCalculator;
    v6->_displayItemLayoutAttributesCalculator = v39;

    if (SBFIsChamoisWindowingUIAvailable())
    {
      double v41 = [(id)SBApp bannerManager];
      [v41 addTransitionObserver:v6];
    }
    [(SBFluidSwitcherGestureManager *)v6 _setUpGestureRecognizers];
    [(SBFluidSwitcherGestureManager *)v6 _updateZStackParticipantWithReason:@"init"];
    objc_destroyWeak(&v48);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __69__SBFluidSwitcherGestureManager_initWithSwitcherController_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIndirectBottomEdgePanGesturePresence];
}

void __69__SBFluidSwitcherGestureManager_initWithSwitcherController_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestureDefaults];
}

- (void)dealloc
{
  [(SBFluidSwitcherGestureManager *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherGestureManager;
  [(SBFluidSwitcherGestureManager *)&v3 dealloc];
}

- (void)_setUpGestureRecognizers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_super v3 = [WeakRetained windowScene];
  id v4 = [v3 zStackResolver];
  uint64_t v5 = [v4 acquireParticipantWithIdentifier:1 delegate:self];
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = v5;

  id v7 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBAudioCategoryZStackPolicyAssistant alloc] initWithParticipant:self->_zStackParticipant];
  zStackAudioCategoryPolicyAssistant = self->_zStackAudioCategoryPolicyAssistant;
  self->_zStackAudioCategoryPolicyAssistant = v7;

  id v9 = (SBSystemApertureZStackPolicyAssistant *)-[SBSystemApertureZStackPolicyAssistant initWithParticipant:]((id *)[SBSystemApertureZStackPolicyAssistant alloc], self->_zStackParticipant);
  zStackSystemAperturePolicyAssistant = self->_zStackSystemAperturePolicyAssistant;
  self->_zStackSystemAperturePolicyAssistant = v9;

  uint64_t v11 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBPhysicalButtonZStackPolicyAssistant alloc] initWithParticipant:self->_zStackParticipant];
  zStackPhysicalButtonPolicyAssistant = self->_zStackPhysicalButtonPolicyAssistant;
  self->_zStackPhysicalButtonPolicyAssistant = v11;

  long long v13 = [MEMORY[0x1E4F1CA80] set];
  suppressionAssertions = self->_suppressionAssertions;
  self->_suppressionAssertions = v13;

  [(SBFluidSwitcherGestureManager *)self _updateSwitcherBottomEdgeGesturePresence];
  [(SBFluidSwitcherGestureManager *)self _updateDeckSwitcherInSwitcherGesturePresence];
  [(SBFluidSwitcherGestureManager *)self _setUpScrunchGestureRecognizerIfNeeded];
  [(SBFluidSwitcherGestureManager *)self _updateIndirectBottomEdgePanGesturePresence];
  -[SBFluidSwitcherGestureManager updateForWindowManagementStyle:](self, "updateForWindowManagementStyle:", [WeakRetained windowManagementStyle]);
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = (SBFluidSwitcherPanGestureRecognizer *)a3;
  uint64_t v8 = +[SBControlCenterController sharedInstance];
  id v9 = [v8 _presentGestureRecognizers];
  char v10 = [v9 containsObject:v6];

  uint64_t v11 = +[SBCoverSheetPresentationManager sharedInstance];
  long long v12 = [v11 coverSheetSlidingViewController];
  long long v13 = [v12 systemGesturesDelegate];
  uint64_t v14 = [v13 presentGestureRecognizer];
  char v15 = [v6 isEqual:v14];

  unpinSplitViewApplicationGestureRecognizer = self->_unpinSplitViewApplicationGestureRecognizer;
  if (unpinSplitViewApplicationGestureRecognizer == v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    int v17 = [WeakRetained isChamoisWindowingUIEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v17) = 0;
  }
  return v17 & (v10 | v15);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = (SBIndirectPanGestureRecognizer *)a3;
  id v7 = (UIGestureRecognizer *)a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  id v9 = [WeakRetained windowScene];
  char v10 = [v9 floatingDockController];

  uint64_t v11 = [v10 presentFloatingDockIndirectPanGestureRecognizer];
  long long v12 = +[SBControlCenterController sharedInstance];
  long long v13 = [v12 _presentGestureRecognizers];
  int v63 = [v13 containsObject:v7];

  uint64_t v14 = +[SBCoverSheetPresentationManager sharedInstance];
  char v15 = [v14 coverSheetSlidingViewController];
  uint64_t v16 = [v15 systemGesturesDelegate];
  int v17 = [v16 presentGestureRecognizer];
  int v62 = [(UIGestureRecognizer *)v7 isEqual:v17];

  liveWindowResizeGestureRecognizer = self->_liveWindowResizeGestureRecognizer;
  if (self->_indirectBottomEdgePanGestureRecognizer == v6 && v11 == v7
    || (SBIndirectPanGestureRecognizer *)self->_hoverGestureRecognizer == v6)
  {
LABEL_36:
    char v46 = 1;
    goto LABEL_37;
  }
  if ((SBIndirectPanGestureRecognizer *)self->_moveFloatingApplicationGestureRecognizer == v6
    || (SBIndirectPanGestureRecognizer *)self->_pinFloatingApplicationGestureRecognizer == v6)
  {
    char v46 = v63 | v62;
  }
  else
  {
    if ((SBIndirectPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer == v6)
    {
      if (self->_windowMoveClientGateRelationshipGestureRecognizer == v7)
      {
        id v19 = objc_loadWeakRetained((id *)&self->_switcherContentController);
        uint64_t v20 = [v19 view];

        long long v60 = [(SBIndirectPanGestureRecognizer *)v6 _activeEventOfType:0];
        uint64_t v21 = [v60 touchesForGestureRecognizer:v6];
        uint64_t v22 = [v21 anyObject];

        long long v61 = (void *)v20;
        _UISystemGestureLocationForTouchInView();
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        SEL v27 = -[SBFluidSwitcherGestureManager _hitTestStageItemContainerForUnpinGestureWithTouch:atGestureLocation:](self, "_hitTestStageItemContainerForUnpinGestureWithTouch:atGestureLocation:", v22);
        if (v27)
        {
          uint64_t v28 = [v22 _isPointerTouch];
          [(SBFluidSwitcherGestureManager *)self _paddedHitTestRectForItemContainer:v27 forPointerTouch:v28];
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          CGFloat v57 = v33;
          CGFloat v58 = v34;
          [(SBFluidSwitcherGestureManager *)self _edgeSwipeHitTestRectForItemContainer:v27 forPointerTouch:v28];
          CGFloat v36 = v35;
          CGFloat v38 = v37;
          CGFloat v40 = v39;
          CGFloat v42 = v41;
          LOBYTE(v28) = SBRectContainsPoint();
          long long v43 = SBLogSystemGestureAppSwitcher();
          BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
          if ((v28 & 1) == 0)
          {
            if (v44)
            {
              v73.x = v24;
              v73.y = v26;
              NSStringFromCGPoint(v73);
              long long v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v76.origin.x = v30;
              v76.origin.y = v32;
              v76.size.width = v57;
              v76.size.height = v58;
              uint64_t v53 = NSStringFromCGRect(v76);
              v77.origin.x = v36;
              v77.origin.y = v38;
              v77.size.width = v40;
              v77.size.height = v42;
              NSStringFromCGRect(v77);
              *(_DWORD *)buf = 138412802;
              long long v66 = v64;
              __int16 v67 = 2112;
              long long v68 = v53;
              v70 = __int16 v69 = 2112;
              v54 = (void *)v70;
              _os_log_impl(&dword_1D85BA000, v43, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer requiring failure of _windowMoveClientGateRelationshipGestureRecognizer: touch (%@) hit-tested to item container (%@) and was outside edge swipe hit test rect (%@)", buf, 0x20u);
            }
            goto LABEL_36;
          }
          if (v44)
          {
            v72.x = v24;
            v72.y = v26;
            NSStringFromCGPoint(v72);
            long long v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v74.origin.x = v30;
            v74.origin.y = v32;
            v74.size.width = v57;
            v74.size.height = v58;
            long long v59 = NSStringFromCGRect(v74);
            v75.origin.x = v36;
            v75.origin.y = v38;
            v75.size.width = v40;
            v75.size.height = v42;
            NSStringFromCGRect(v75);
            *(_DWORD *)buf = 138412802;
            long long v66 = v56;
            __int16 v67 = 2112;
            long long v68 = v59;
            v70 = __int16 v69 = 2112;
            id v45 = (void *)v70;
            _os_log_impl(&dword_1D85BA000, v43, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer not requiring failure of _windowMoveClientGateRelationshipGestureRecognizer: touch (%@) hit-tested to item container (%@) but was inside edge swipe hit test rect (%@)", buf, 0x20u);
          }
        }
        else
        {
          long long v43 = SBLogSystemGestureAppSwitcher();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v43, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer not requiring failure of _windowMoveClientGateRelationshipGestureRecognizer: did not hit-test to item container", buf, 2u);
          }
        }
      }
      int v47 = [WeakRetained isChamoisWindowingUIEnabled];
      int v48 = liveWindowResizeGestureRecognizer == (SBFluidSwitcherPanGestureRecognizer *)v7 ? 1 : v62;
      int v49 = v47 ^ 1 | v63 ? v47 : v48;
      if (v49 == 1)
      {
        id v50 = @"(unexpected gesture recognizer)";
        if (liveWindowResizeGestureRecognizer == (SBFluidSwitcherPanGestureRecognizer *)v7) {
          id v50 = @"_liveWindowResizeGestureRecognizer";
        }
        if (v62) {
          id v50 = @"(Cover Sheet presentation gesture recognizer)";
        }
        if (v63) {
          id v50 = @"(some Control Center presentation gesture recognizer)";
        }
        uint64_t v51 = v50;
        objc_super v52 = SBLogSystemGestureAppSwitcher();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          long long v66 = v51;
          _os_log_impl(&dword_1D85BA000, v52, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer requiring failure of %{public}@", buf, 0xCu);
        }

        goto LABEL_36;
      }
    }
    char v46 = 0;
  }
LABEL_37:

  return v46;
}

- (void)_setUpScrunchGestureRecognizerIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  id v9 = [WeakRetained windowScene];

  id v4 = [v9 systemGestureManager];
  if ([(SBAppSwitcherSettings *)self->_appSwitcherSettings effectiveSwitcherStyle] == 2)
  {
    uint64_t v5 = [SBFluidScrunchGestureRecognizer alloc];
    id v6 = [v9 _fbsDisplayConfiguration];
    id v7 = [(SBFluidScrunchGestureRecognizer *)v5 initWithTarget:self action:sel__handleScrunchGesture_ displayConfiguration:v6];
    fluidScrunchGestureRecognizer = self->_fluidScrunchGestureRecognizer;
    self->_fluidScrunchGestureRecognizer = v7;

    [(SBFluidScrunchGestureRecognizer *)self->_fluidScrunchGestureRecognizer setName:@"fluidScrunch"];
    [(SBFluidScrunchGestureRecognizer *)self->_fluidScrunchGestureRecognizer setDelegate:self];
    [(SBFluidScrunchGestureRecognizer *)self->_fluidScrunchGestureRecognizer setAllowedTouchTypes:&unk_1F3348678];
    [v4 addGestureRecognizer:self->_fluidScrunchGestureRecognizer withType:18];
  }
}

- (void)_updateFluidDragAndDropManagerPresenceForWindowManagementStyle:(unint64_t)a3
{
  fluidDragAndDropManager = self->_fluidDragAndDropManager;
  if (!a3 || fluidDragAndDropManager)
  {
    if (a3 || !fluidDragAndDropManager) {
      return;
    }
    self->_fluidDragAndDropManager = 0;
  }
  else
  {
    uint64_t v5 = [SBFluidSwitcherDragAndDropManager alloc];
    id WeakRetained = (SBFluidSwitcherDragAndDropManager *)objc_loadWeakRetained((id *)&self->_switcherController);
    id v6 = [(SBFluidSwitcherDragAndDropManager *)v5 initWithSwitcherController:WeakRetained delegate:self];
    id v7 = self->_fluidDragAndDropManager;
    self->_fluidDragAndDropManager = v6;

    fluidDragAndDropManager = WeakRetained;
  }
}

- (void)_updateIndirectBottomEdgePanGesturePresence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  id v4 = [WeakRetained windowScene];
  id v10 = [v4 systemGestureManager];

  int v5 = [(SBAppSwitcherDefaults *)self->_appSwitcherDefaults areTrackpadSwitcherGesturesEnabled];
  indirectBottomEdgePanGestureRecognizer = self->_indirectBottomEdgePanGestureRecognizer;
  if (v5)
  {
    if (!indirectBottomEdgePanGestureRecognizer)
    {
      id v7 = [[SBIndirectPanGestureRecognizer alloc] initWithTarget:self action:sel__handleFluidGesture_ edges:4];
      uint64_t v8 = self->_indirectBottomEdgePanGestureRecognizer;
      self->_indirectBottomEdgePanGestureRecognizer = v7;

      [(SBIndirectPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer setName:@"indirectHomePanGestureRecognizer"];
      [(SBIndirectPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer setShouldInvertYAxis:1];
      [(SBIndirectPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer setDelegate:self];
      [(SBIndirectPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer setShouldRequireGestureToStartAtEdge:1];
      [(SBIndirectPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer setHysteresis:0 forInputType:10.0];
      [(SBIndirectPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer setHysteresis:1 forInputType:10.0];
      [(SBIndirectPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer setTranslationAdjustmentBlock:&__block_literal_global_365];
      [v10 addGestureRecognizer:self->_indirectBottomEdgePanGestureRecognizer withType:41];
    }
  }
  else if (indirectBottomEdgePanGestureRecognizer)
  {
    objc_msgSend(v10, "removeGestureRecognizer:");
    [(SBIndirectPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer setDelegate:0];
    id v9 = self->_indirectBottomEdgePanGestureRecognizer;
    self->_indirectBottomEdgePanGestureRecognizer = 0;
  }
}

double __76__SBFluidSwitcherGestureManager__updateIndirectBottomEdgePanGesturePresence__block_invoke(double result, double a2, double a3, double a4)
{
  double v4 = a2 - fabs(result);
  if (a4 == 0.0 && v4 < 0.0) {
    return *MEMORY[0x1E4F1DAD8];
  }
  return result;
}

- (void)_updateFloatingApplicationGestureRecognizerPresenceForWindowManagementStyle:(unint64_t)a3
{
  unpinSplitViewApplicationGestureRecognizer = self->_unpinSplitViewApplicationGestureRecognizer;
  if (!a3 || unpinSplitViewApplicationGestureRecognizer)
  {
    if (!a3)
    {
      if (unpinSplitViewApplicationGestureRecognizer) {
        [(SBFluidSwitcherGestureManager *)self _tearDownFloatingApplicationGestureRecognizers];
      }
    }
  }
  else
  {
    [(SBFluidSwitcherGestureManager *)self _setUpFloatingApplicationGestureRecognizers];
  }
}

- (void)_setUpFloatingApplicationGestureRecognizers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_super v3 = [WeakRetained windowScene];
  id v4 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  int v5 = [v3 systemGestureManager];
  id v6 = [SBGrabberTongue alloc];
  id v7 = (id *)MEMORY[0x1E4F43630];
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 8;
  }
  id v9 = [(SBGrabberTongue *)v6 initWithDelegate:self edge:v8 type:25 windowScene:v3];
  rightEdgeFloatingAppGrabberTongue = self->_rightEdgeFloatingAppGrabberTongue;
  self->_rightEdgeFloatingAppGrabberTongue = v9;

  [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue setName:@"RightEdgeFloatingAppGrabberTongue"];
  uint64_t v11 = self->_rightEdgeFloatingAppGrabberTongue;
  long long v12 = [v4 view];
  [(SBGrabberTongue *)v11 installInView:v12 withColorStyle:0];

  long long v13 = [SBGrabberTongue alloc];
  if ([*v7 userInterfaceLayoutDirection] == 1) {
    uint64_t v14 = 8;
  }
  else {
    uint64_t v14 = 2;
  }
  char v15 = [(SBGrabberTongue *)v13 initWithDelegate:self edge:v14 type:26 windowScene:v3];
  leftEdgeFloatingAppGrabberTongue = self->_leftEdgeFloatingAppGrabberTongue;
  self->_leftEdgeFloatingAppGrabberTongue = v15;

  [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue setName:@"LeftEdgeFloatingAppGrabberTongue"];
  int v17 = self->_leftEdgeFloatingAppGrabberTongue;
  uint64_t v18 = [v4 view];
  [(SBGrabberTongue *)v17 installInView:v18 withColorStyle:0];

  id v19 = [[SBFluidSwitcherPanGestureRecognizer alloc] initWithTarget:self action:sel__handleFluidGesture_];
  [(SBFluidSwitcherPanGestureRecognizer *)v19 setSwitcherViewController:v4];
  [(SBFluidSwitcherPanGestureRecognizer *)v19 setInstalledAsSystemGesture:1];
  [(SBFluidSwitcherPanGestureRecognizer *)v19 setDelegate:self];
  [(SBFluidSwitcherPanGestureRecognizer *)v19 setName:@"_swipeUpFloatingAppGestureRecognizer"];
  swipeUpFloatingAppGestureRecognizer = self->_swipeUpFloatingAppGestureRecognizer;
  self->_swipeUpFloatingAppGestureRecognizer = v19;
  uint64_t v21 = v19;

  [v5 addGestureRecognizer:self->_swipeUpFloatingAppGestureRecognizer withType:32];
  uint64_t v22 = [[SBFluidSwitcherPanGestureRecognizer alloc] initWithTarget:self action:sel__handleFluidGesture_];
  [(SBFluidSwitcherPanGestureRecognizer *)v22 setSwitcherViewController:v4];
  [(SBFluidSwitcherPanGestureRecognizer *)v22 setInstalledAsSystemGesture:1];
  [(SBFluidSwitcherPanGestureRecognizer *)v22 setDelegate:self];
  [(SBFluidSwitcherPanGestureRecognizer *)v22 setName:@"_moveFloatingApplicationGestureRecognizer"];
  [(SBPanSystemGestureRecognizer *)v22 setFailsPastMaximumPressDurationWithoutHysteresis:1];
  [(SBFluidSwitcherPanGestureRecognizer *)v22 setMaximumNumberOfTouches:1];
  _UIDragInteractionDefaultLiftDelay();
  -[SBPanSystemGestureRecognizer setMaximumPressDuration:](v22, "setMaximumPressDuration:");
  moveFloatingApplicationGestureRecognizer = self->_moveFloatingApplicationGestureRecognizer;
  self->_moveFloatingApplicationGestureRecognizer = v22;
  CGFloat v24 = v22;

  [v5 addGestureRecognizer:self->_moveFloatingApplicationGestureRecognizer withType:29];
  double v25 = [[SBFluidSwitcherPanGestureRecognizer alloc] initWithTarget:self action:sel__handleWindowDragGestureRecognizer_];
  pinFloatingApplicationGestureRecognizer = self->_pinFloatingApplicationGestureRecognizer;
  self->_pinFloatingApplicationGestureRecognizer = v25;

  [(SBFluidSwitcherPanGestureRecognizer *)self->_pinFloatingApplicationGestureRecognizer setInstalledAsSystemGesture:1];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_pinFloatingApplicationGestureRecognizer setSwitcherViewController:v4];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_pinFloatingApplicationGestureRecognizer _setHysteresis:10.0];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_pinFloatingApplicationGestureRecognizer setDelegate:self];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_pinFloatingApplicationGestureRecognizer setMaximumNumberOfTouches:1];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_pinFloatingApplicationGestureRecognizer setName:@"_pinFloatingApplicationGestureRecognizer"];
  [v5 addGestureRecognizer:self->_pinFloatingApplicationGestureRecognizer withType:30];
  SEL v27 = [[SBFluidSwitcherPanGestureRecognizer alloc] initWithTarget:self action:sel__handleWindowDragGestureRecognizer_];
  unpinSplitViewApplicationGestureRecognizer = self->_unpinSplitViewApplicationGestureRecognizer;
  self->_unpinSplitViewApplicationGestureRecognizer = v27;

  [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer setInstalledAsSystemGesture:1];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer setSwitcherViewController:v4];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer _setHysteresis:10.0];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer setDelegate:self];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer setMaximumNumberOfTouches:1];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer setName:@"_unpinSplitViewApplicationGestureRecognizer"];
  [v5 addGestureRecognizer:self->_unpinSplitViewApplicationGestureRecognizer withType:24];
  double v29 = [[SBPanSystemGestureRecognizer alloc] initWithTarget:self action:sel__handleFluidGesture_];
  sceneResizePanGestureRecognizer = self->_sceneResizePanGestureRecognizer;
  self->_sceneResizePanGestureRecognizer = v29;

  [(SBPanSystemGestureRecognizer *)self->_sceneResizePanGestureRecognizer _setHysteresis:10.0];
  [(SBPanSystemGestureRecognizer *)self->_sceneResizePanGestureRecognizer setAllowedTouchTypes:&unk_1F3348690];
  [(SBPanSystemGestureRecognizer *)self->_sceneResizePanGestureRecognizer sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
  [(SBPanSystemGestureRecognizer *)self->_sceneResizePanGestureRecognizer setDelegate:self];
  [(SBPanSystemGestureRecognizer *)self->_sceneResizePanGestureRecognizer setMaximumNumberOfTouches:1];
  double v31 = self->_sceneResizePanGestureRecognizer;
  _UIDragInteractionDefaultLiftDelay();
  -[SBPanSystemGestureRecognizer setMaximumPressDuration:](v31, "setMaximumPressDuration:");
  [(SBPanSystemGestureRecognizer *)self->_sceneResizePanGestureRecognizer setName:@"_sceneResizePanGestureRecognizer"];
  [v5 addGestureRecognizer:self->_sceneResizePanGestureRecognizer withType:22];
  CGFloat v32 = [[SBFluidScrunchGestureRecognizer alloc] initWithTarget:self action:sel__handleFluidGesture_];
  indirectFloatingAppScrunchGestureRecognizer = self->_indirectFloatingAppScrunchGestureRecognizer;
  self->_indirectFloatingAppScrunchGestureRecognizer = v32;

  [(SBFluidScrunchGestureRecognizer *)self->_indirectFloatingAppScrunchGestureRecognizer setName:@"floatingApplicationScrunchGestureRecognizer"];
  [(SBFluidScrunchGestureRecognizer *)self->_indirectFloatingAppScrunchGestureRecognizer setDelegate:self];
  [(SBFluidScrunchGestureRecognizer *)self->_indirectFloatingAppScrunchGestureRecognizer setAllowedTouchTypes:&unk_1F33486A8];
  [v5 addGestureRecognizer:self->_indirectFloatingAppScrunchGestureRecognizer withType:19];
  double v34 = [[SBIndirectPanGestureRecognizer alloc] initWithTarget:self action:sel__handleFluidGesture_ edges:10];
  indirectDismissFloatingApplicationGestureRecognizer = self->_indirectDismissFloatingApplicationGestureRecognizer;
  self->_indirectDismissFloatingApplicationGestureRecognizer = v34;

  [(SBIndirectPanGestureRecognizer *)self->_indirectDismissFloatingApplicationGestureRecognizer setName:@"indirectDismissFloatingApplicationGestureRecognizer"];
  [(SBIndirectPanGestureRecognizer *)self->_indirectDismissFloatingApplicationGestureRecognizer setDelegate:self];
  [(SBIndirectPanGestureRecognizer *)self->_indirectDismissFloatingApplicationGestureRecognizer setShouldRequireGestureToStartAtEdge:1];
  [(SBIndirectPanGestureRecognizer *)self->_indirectDismissFloatingApplicationGestureRecognizer setHysteresis:0 forInputType:30.0];
  [(SBIndirectPanGestureRecognizer *)self->_indirectDismissFloatingApplicationGestureRecognizer setHysteresis:1 forInputType:10.0];
  [(SBIndirectPanGestureRecognizer *)self->_indirectDismissFloatingApplicationGestureRecognizer setTranslationAdjustmentBlock:&__block_literal_global_100_2];
  [v5 addGestureRecognizer:self->_indirectDismissFloatingApplicationGestureRecognizer withType:44];
  CGFloat v36 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
  [v36 requireGestureRecognizerToFail:self->_swipeUpFloatingAppGestureRecognizer];

  double v37 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
  [v5 gestureRecognizerOfType:120 shouldBeRequiredToFailByGestureRecognizer:v37];

  CGFloat v38 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
  [v5 gestureRecognizerOfType:119 shouldBeRequiredToFailByGestureRecognizer:v38];

  double v39 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
  [v5 gestureRecognizerOfType:105 shouldBeRequiredToFailByGestureRecognizer:v39];

  CGFloat v40 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
  [v5 gestureRecognizerOfType:104 shouldBeRequiredToFailByGestureRecognizer:v40];

  double v41 = self->_moveFloatingApplicationGestureRecognizer;
  CGFloat v42 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)v41 requireGestureRecognizerToFail:v42];

  [(SBFluidSwitcherPanGestureRecognizer *)self->_moveFloatingApplicationGestureRecognizer requireGestureRecognizerToFail:self->_swipeUpFloatingAppGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_moveFloatingApplicationGestureRecognizer requireGestureRecognizerToFail:self->_pinFloatingApplicationGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_moveFloatingApplicationGestureRecognizer requireGestureRecognizerToFail:self->_unpinSplitViewApplicationGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer requireGestureRecognizerToFail:self->_pinFloatingApplicationGestureRecognizer];
  long long v43 = self->_unpinSplitViewApplicationGestureRecognizer;
  BOOL v44 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)v43 requireGestureRecognizerToFail:v44];

  [(SBFluidScrunchGestureRecognizer *)self->_fluidScrunchGestureRecognizer requireGestureRecognizerToFail:self->_indirectFloatingAppScrunchGestureRecognizer];
}

uint64_t __76__SBFluidSwitcherGestureManager__setUpFloatingApplicationGestureRecognizers__block_invoke()
{
  return [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
}

- (void)_tearDownFloatingApplicationGestureRecognizers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_super v3 = [WeakRetained windowScene];
  id v4 = [v3 systemGestureManager];
  [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue uninstall];
  [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue invalidate];
  rightEdgeFloatingAppGrabberTongue = self->_rightEdgeFloatingAppGrabberTongue;
  self->_rightEdgeFloatingAppGrabberTongue = 0;

  [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue uninstall];
  [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue invalidate];
  leftEdgeFloatingAppGrabberTongue = self->_leftEdgeFloatingAppGrabberTongue;
  self->_leftEdgeFloatingAppGrabberTongue = 0;

  [v4 removeGestureRecognizer:self->_swipeUpFloatingAppGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_swipeUpFloatingAppGestureRecognizer setDelegate:0];
  swipeUpFloatingAppGestureRecognizer = self->_swipeUpFloatingAppGestureRecognizer;
  self->_swipeUpFloatingAppGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_moveFloatingApplicationGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_moveFloatingApplicationGestureRecognizer setDelegate:0];
  moveFloatingApplicationGestureRecognizer = self->_moveFloatingApplicationGestureRecognizer;
  self->_moveFloatingApplicationGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_pinFloatingApplicationGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_pinFloatingApplicationGestureRecognizer setDelegate:0];
  pinFloatingApplicationGestureRecognizer = self->_pinFloatingApplicationGestureRecognizer;
  self->_pinFloatingApplicationGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_unpinSplitViewApplicationGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer setDelegate:0];
  unpinSplitViewApplicationGestureRecognizer = self->_unpinSplitViewApplicationGestureRecognizer;
  self->_unpinSplitViewApplicationGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_sceneResizePanGestureRecognizer];
  [(SBPanSystemGestureRecognizer *)self->_sceneResizePanGestureRecognizer setDelegate:0];
  sceneResizePanGestureRecognizer = self->_sceneResizePanGestureRecognizer;
  self->_sceneResizePanGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_indirectFloatingAppScrunchGestureRecognizer];
  [(SBFluidScrunchGestureRecognizer *)self->_indirectFloatingAppScrunchGestureRecognizer setDelegate:0];
  indirectFloatingAppScrunchGestureRecognizer = self->_indirectFloatingAppScrunchGestureRecognizer;
  self->_indirectFloatingAppScrunchGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_indirectDismissFloatingApplicationGestureRecognizer];
  [(SBIndirectPanGestureRecognizer *)self->_indirectDismissFloatingApplicationGestureRecognizer setDelegate:0];
  indirectDismissFloatingApplicationGestureRecognizer = self->_indirectDismissFloatingApplicationGestureRecognizer;
  self->_indirectDismissFloatingApplicationGestureRecognizer = 0;
}

- (void)_updateChamoisGestureRecognizerPresenceForWindowManagementStyle:(unint64_t)a3
{
  liveWindowResizeGestureRecognizer = self->_liveWindowResizeGestureRecognizer;
  if (a3 != 2 || liveWindowResizeGestureRecognizer)
  {
    if (a3 != 2)
    {
      if (liveWindowResizeGestureRecognizer) {
        [(SBFluidSwitcherGestureManager *)self _tearDownChamoisGestureRecognizers];
      }
    }
  }
  else
  {
    [(SBFluidSwitcherGestureManager *)self _setUpChamoisGestureRecognizers];
  }
}

- (void)_setUpChamoisGestureRecognizers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  id v4 = [WeakRetained windowScene];
  int v5 = [v4 systemGestureManager];
  id v6 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v7 = [[SBFluidSwitcherPanGestureRecognizer alloc] initWithTarget:self action:sel__handleFluidGesture_];
  liveWindowResizeGestureRecognizer = self->_liveWindowResizeGestureRecognizer;
  self->_liveWindowResizeGestureRecognizer = v7;

  [(SBFluidSwitcherPanGestureRecognizer *)self->_liveWindowResizeGestureRecognizer _setHysteresis:0.0];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_liveWindowResizeGestureRecognizer setDelegate:self];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_liveWindowResizeGestureRecognizer setMaximumNumberOfTouches:1];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_liveWindowResizeGestureRecognizer setName:@"_liveWindowResizeGestureRecognizer"];
  id v9 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
  [v9 requireGestureRecognizerToFail:self->_liveWindowResizeGestureRecognizer];

  [(SBFluidSwitcherPanGestureRecognizer *)self->_deckInSwitcherPanGestureRecognizer requireGestureRecognizerToFail:self->_liveWindowResizeGestureRecognizer];
  [v5 addGestureRecognizer:self->_liveWindowResizeGestureRecognizer withType:37];
  id v10 = (UIHoverGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:self action:sel__handleHoverGesture_];
  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  self->_hoverGestureRecognizer = v10;

  [(UIHoverGestureRecognizer *)self->_hoverGestureRecognizer setCancelsTouchesInView:0];
  [(UIHoverGestureRecognizer *)self->_hoverGestureRecognizer setDelegate:self];
  [v5 addGestureRecognizer:self->_hoverGestureRecognizer withType:53];
  unint64_t v12 = [(SBFluidSwitcherGestureManager *)self _continuousExposeStripEdge];
  long long v13 = [[SBGrabberTongue alloc] initWithDelegate:self edge:v12 type:57 windowScene:v4];
  continuousExposeStripRevealGrabberTongue = self->_continuousExposeStripRevealGrabberTongue;
  self->_continuousExposeStripRevealGrabberTongue = v13;

  [(SBGrabberTongue *)self->_continuousExposeStripRevealGrabberTongue setName:@"ContinuousExposeStripRevealGrabberTongue"];
  char v15 = self->_continuousExposeStripRevealGrabberTongue;
  uint64_t v16 = [v6 view];
  [(SBGrabberTongue *)v15 installInView:v16 withColorStyle:0];

  int v17 = [[SBIndirectPanGestureRecognizer alloc] initWithTarget:self action:sel__handleFluidGesture_ edges:v12];
  indirectContinuousExposeStripOverflowGestureRecognizer = self->_indirectContinuousExposeStripOverflowGestureRecognizer;
  self->_indirectContinuousExposeStripOverflowGestureRecognizer = v17;

  [(SBIndirectPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer setShouldRequireGestureToStartAtEdge:1];
  [(SBIndirectPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer setPausedUntilTouchedUpOrMovedAwayFromEdge:1];
  [(SBIndirectPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer setName:@"_indirectContinuousExposeStripOverflowGestureRecognizer"];
  [(SBIndirectPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer setDelegate:self];
  [(SBIndirectPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer setHysteresis:0 forInputType:30.0];
  [(SBIndirectPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer setHysteresis:1 forInputType:10.0];
  objc_initWeak(&location, v6);
  id v19 = self->_indirectContinuousExposeStripOverflowGestureRecognizer;
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  CGFloat v32 = __64__SBFluidSwitcherGestureManager__setUpChamoisGestureRecognizers__block_invoke;
  double v33 = &unk_1E6B0BFF0;
  objc_copyWeak(&v34, &location);
  [(SBIndirectPanGestureRecognizer *)v19 setTranslationAdjustmentBlock:&v30];
  uint64_t v20 = self->_indirectContinuousExposeStripOverflowGestureRecognizer;
  uint64_t v21 = [(SBGrabberTongue *)self->_continuousExposeStripRevealGrabberTongue indirectEdgePullGestureRecognizer];
  [(SBIndirectPanGestureRecognizer *)v20 requireGestureRecognizerToFail:v21];

  [v5 addGestureRecognizer:self->_indirectContinuousExposeStripOverflowGestureRecognizer withType:55];
  uint64_t v22 = [[SBFluidSwitcherPanGestureRecognizer alloc] initWithTarget:self action:sel__handleFluidGesture_];
  dragContinuousExposeStripOverflowGestureRecognizer = self->_dragContinuousExposeStripOverflowGestureRecognizer;
  self->_dragContinuousExposeStripOverflowGestureRecognizer = v22;

  [(SBFluidSwitcherPanGestureRecognizer *)self->_dragContinuousExposeStripOverflowGestureRecognizer setInstalledAsSystemGesture:1];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_dragContinuousExposeStripOverflowGestureRecognizer setSwitcherViewController:v6];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_dragContinuousExposeStripOverflowGestureRecognizer _setHysteresis:10.0];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_dragContinuousExposeStripOverflowGestureRecognizer setDelegate:self];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_dragContinuousExposeStripOverflowGestureRecognizer setMaximumNumberOfTouches:1];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_dragContinuousExposeStripOverflowGestureRecognizer setName:@"_dragContinuousExposeStripOverflowGestureRecognizer"];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_dragContinuousExposeStripOverflowGestureRecognizer requireGestureRecognizerToFail:self->_liveWindowResizeGestureRecognizer];
  [v5 addGestureRecognizer:self->_dragContinuousExposeStripOverflowGestureRecognizer withType:56];
  CGFloat v24 = (_UIPassthroughTapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F43280]) initWithTarget:self action:sel__handleTapToBringItemContainerForward_];
  tapToBringItemContainerForwardGestureRecognizer = self->_tapToBringItemContainerForwardGestureRecognizer;
  self->_tapToBringItemContainerForwardGestureRecognizer = v24;

  [(_UIPassthroughTapGestureRecognizer *)self->_tapToBringItemContainerForwardGestureRecognizer setDelegate:self];
  [(_UIPassthroughTapGestureRecognizer *)self->_tapToBringItemContainerForwardGestureRecognizer setAllowedTouchTypes:&unk_1F33486C0];
  [(_UIPassthroughTapGestureRecognizer *)self->_tapToBringItemContainerForwardGestureRecognizer setName:@"tapToBringItemContainerForwardGestureRecognizer"];
  [v5 addGestureRecognizer:self->_tapToBringItemContainerForwardGestureRecognizer withType:20];
  CGFloat v26 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__handleClickDownToBringItemContainerForward_];
  clickDownToBringItemContainerForwardGestureRecognizer = self->_clickDownToBringItemContainerForwardGestureRecognizer;
  self->_clickDownToBringItemContainerForwardGestureRecognizer = v26;

  [(UILongPressGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer setDelegate:self];
  [(UILongPressGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer setMinimumPressDuration:0.0];
  [(UILongPressGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer setAllowedTouchTypes:&unk_1F33486D8];
  [(UILongPressGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
  [(UILongPressGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer setName:@"clickDownToBringItemContainerForwardGestureRecognizer"];
  [v5 addGestureRecognizer:self->_clickDownToBringItemContainerForwardGestureRecognizer withType:21];
  uint64_t v28 = [MEMORY[0x1E4F430F8] hostGestureRecognizerForFailureRelationshipsWithIdentifier:*MEMORY[0x1E4F44250]];
  windowMoveClientGateRelationshipGestureRecognizer = self->_windowMoveClientGateRelationshipGestureRecognizer;
  self->_windowMoveClientGateRelationshipGestureRecognizer = v28;

  [(UIGestureRecognizer *)self->_windowMoveClientGateRelationshipGestureRecognizer setName:@"_windowMoveClientGateRelationshipGestureRecognizer"];
  [v5 addGestureRecognizer:self->_windowMoveClientGateRelationshipGestureRecognizer withType:31];
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

double __64__SBFluidSwitcherGestureManager__setUpChamoisGestureRecognizers__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = [WeakRetained view];
    [v11 bounds];
    double v13 = v12;

    double v14 = a2 - fabs(a3);
    if (a6 >= v13 * 0.5)
    {
      a2 = fmax(v14, 0.0);
    }
    else if (v14 <= 0.0)
    {
      a2 = v14;
    }
    else
    {
      a2 = 0.0;
    }
  }

  return a2;
}

- (void)_tearDownChamoisGestureRecognizers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_super v3 = [WeakRetained windowScene];
  id v4 = [v3 systemGestureManager];
  [v4 removeGestureRecognizer:self->_liveWindowResizeGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_liveWindowResizeGestureRecognizer setDelegate:0];
  liveWindowResizeGestureRecognizer = self->_liveWindowResizeGestureRecognizer;
  self->_liveWindowResizeGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_hoverGestureRecognizer];
  [(UIHoverGestureRecognizer *)self->_hoverGestureRecognizer setDelegate:0];
  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  self->_hoverGestureRecognizer = 0;

  [(SBGrabberTongue *)self->_continuousExposeStripRevealGrabberTongue uninstall];
  [(SBGrabberTongue *)self->_continuousExposeStripRevealGrabberTongue invalidate];
  continuousExposeStripRevealGrabberTongue = self->_continuousExposeStripRevealGrabberTongue;
  self->_continuousExposeStripRevealGrabberTongue = 0;

  [v4 removeGestureRecognizer:self->_indirectContinuousExposeStripOverflowGestureRecognizer];
  [(SBIndirectPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer setDelegate:0];
  indirectContinuousExposeStripOverflowGestureRecognizer = self->_indirectContinuousExposeStripOverflowGestureRecognizer;
  self->_indirectContinuousExposeStripOverflowGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_dragContinuousExposeStripOverflowGestureRecognizer];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_dragContinuousExposeStripOverflowGestureRecognizer setDelegate:0];
  dragContinuousExposeStripOverflowGestureRecognizer = self->_dragContinuousExposeStripOverflowGestureRecognizer;
  self->_dragContinuousExposeStripOverflowGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_tapToBringItemContainerForwardGestureRecognizer];
  [(_UIPassthroughTapGestureRecognizer *)self->_tapToBringItemContainerForwardGestureRecognizer setDelegate:0];
  tapToBringItemContainerForwardGestureRecognizer = self->_tapToBringItemContainerForwardGestureRecognizer;
  self->_tapToBringItemContainerForwardGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_clickDownToBringItemContainerForwardGestureRecognizer];
  [(UILongPressGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer setDelegate:0];
  clickDownToBringItemContainerForwardGestureRecognizer = self->_clickDownToBringItemContainerForwardGestureRecognizer;
  self->_clickDownToBringItemContainerForwardGestureRecognizer = 0;

  [v4 removeGestureRecognizer:self->_windowMoveClientGateRelationshipGestureRecognizer];
  windowMoveClientGateRelationshipGestureRecognizer = self->_windowMoveClientGateRelationshipGestureRecognizer;
  self->_windowMoveClientGateRelationshipGestureRecognizer = 0;
}

- (void)_updateDeckSwitcherInSwitcherGesturePresence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  if ([(SBHomeGestureSettings *)self->_homeGestureSettings isHomeGestureEnabled]
    && [(SBAppSwitcherSettings *)self->_appSwitcherSettings effectiveSwitcherStyle] == 1)
  {
    if (self->_deckInSwitcherPanGestureRecognizer) {
      goto LABEL_8;
    }
    objc_super v3 = [[SBFluidSwitcherPanGestureRecognizer alloc] initWithTarget:self action:sel__handleDeckSwitcherPanGesture_];
    deckInSwitcherPanGestureRecognizer = self->_deckInSwitcherPanGestureRecognizer;
    self->_deckInSwitcherPanGestureRecognizer = v3;

    [(SBFluidSwitcherPanGestureRecognizer *)self->_deckInSwitcherPanGestureRecognizer setName:@"deckInSwitcherPan"];
    [(SBFluidSwitcherPanGestureRecognizer *)self->_deckInSwitcherPanGestureRecognizer setSwitcherViewController:WeakRetained];
    [(SBFluidSwitcherPanGestureRecognizer *)self->_deckInSwitcherPanGestureRecognizer setDelegate:self];
    int v5 = [WeakRetained view];
    [v5 addGestureRecognizer:self->_deckInSwitcherPanGestureRecognizer];

    [(SBFluidSwitcherPanGestureRecognizer *)self->_deckInSwitcherPanGestureRecognizer _setRequiresSystemGesturesToFail:0];
    id v6 = [WeakRetained scrollView];
    id v7 = [v6 panGestureRecognizer];
    [v7 requireGestureRecognizerToFail:self->_deckInSwitcherPanGestureRecognizer];
  }
  else
  {
    if (!self->_deckInSwitcherPanGestureRecognizer) {
      goto LABEL_8;
    }
    uint64_t v8 = [WeakRetained view];
    [v8 removeGestureRecognizer:self->_deckInSwitcherPanGestureRecognizer];

    id v6 = self->_deckInSwitcherPanGestureRecognizer;
    self->_deckInSwitcherPanGestureRecognizer = 0;
  }

LABEL_8:
}

- (void)_updateSwitcherBottomEdgeGesturePresence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v3 = objc_loadWeakRetained((id *)&self->_switcherController);
  id v4 = [v3 windowScene];

  int v5 = [v4 systemGestureManager];
  BOOL v6 = [(SBHomeGestureSettings *)self->_homeGestureSettings isHomeGestureEnabled];
  deckGrabberTongue = self->_deckGrabberTongue;
  if (v6)
  {
    if (!deckGrabberTongue)
    {
      self->_usesHomeAffordanceRulesForGrabberTongue = SBFEffectiveHomeButtonType() == 2;
      uint64_t v8 = [[SBGrabberTongue alloc] initWithDelegate:self edge:4 type:45 windowScene:v4];
      id v9 = self->_deckGrabberTongue;
      self->_deckGrabberTongue = v8;

      [(SBGrabberTongue *)self->_deckGrabberTongue setName:@"DeckGrabberTongue"];
      id v10 = self->_deckGrabberTongue;
      uint64_t v11 = [WeakRetained view];
      [(SBGrabberTongue *)v10 installInView:v11 withColorStyle:0];

      double v12 = [[SBFluidSwitcherPanGestureRecognizer alloc] initWithTarget:self action:sel__handleClickAndDragHomeGesture_];
      clickAndDragHomeGestureRecognizer = self->_clickAndDragHomeGestureRecognizer;
      self->_clickAndDragHomeGestureRecognizer = v12;

      [(SBFluidSwitcherPanGestureRecognizer *)self->_clickAndDragHomeGestureRecognizer setSwitcherViewController:WeakRetained];
      [(SBFluidSwitcherPanGestureRecognizer *)self->_clickAndDragHomeGestureRecognizer setInstalledAsSystemGesture:1];
      [(SBFluidSwitcherPanGestureRecognizer *)self->_clickAndDragHomeGestureRecognizer setDelegate:self];
      [(SBFluidSwitcherPanGestureRecognizer *)self->_clickAndDragHomeGestureRecognizer setAllowedTouchTypes:&unk_1F33486F0];
      [v5 addGestureRecognizer:self->_clickAndDragHomeGestureRecognizer withType:48];
    }
  }
  else
  {
    if (deckGrabberTongue)
    {
      [(SBGrabberTongue *)deckGrabberTongue invalidate];
      double v14 = self->_deckGrabberTongue;
      self->_deckGrabberTongue = 0;
    }
    if (self->_clickAndDragHomeGestureRecognizer)
    {
      objc_msgSend(v5, "removeGestureRecognizer:");
      char v15 = self->_clickAndDragHomeGestureRecognizer;
      self->_clickAndDragHomeGestureRecognizer = 0;
    }
  }
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v4 = [WeakRetained view];
  [v4 removeInteraction:self->_homeAffordanceInteraction];

  [(SBLayoutStateTransitionCoordinator *)self->_layoutStateTransitionCoordinator removeObserver:self];
  [(SBFZStackParticipant *)self->_zStackParticipant invalidate];
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = 0;

  [(SBGrabberTongue *)self->_deckGrabberTongue invalidate];
  id v6 = objc_loadWeakRetained((id *)&self->_switcherController);
  id v7 = [v6 windowScene];
  id v10 = [v7 systemGestureManager];

  [v10 removeGestureRecognizer:self->_fluidScrunchGestureRecognizer];
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x1E4F43430] object:0];

  [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue invalidate];
  [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue invalidate];
  [(SBGrabberTongue *)self->_deckGrabberTongue invalidate];
  [(SBGrabberTongue *)self->_continuousExposeStripRevealGrabberTongue invalidate];
  id v9 = [(id)SBApp bannerManager];
  [v9 removeTransitionObserver:self];
}

- (void)failMultitaskingGesturesForReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogSystemGesture();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Failing multitasking gestures for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(SBFluidScrunchGestureRecognizer *)self->_fluidScrunchGestureRecognizer setEnabled:0];
  [(SBFluidScrunchGestureRecognizer *)self->_fluidScrunchGestureRecognizer setEnabled:1];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer setEnabled:0];
  [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer setEnabled:1];
}

- (void)setActiveGestureTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = (SBFluidSwitcherGestureWorkspaceTransaction *)a3;
  if (self->_activeGestureTransaction != v5)
  {
    objc_storeStrong((id *)&self->_activeGestureTransaction, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int v6 = self->_currentHomeGrabberViews;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "updateStyle", (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)handleTransitionRequestForGestureUpdate:(id)a3
{
}

- (void)handleTransitionRequestForGestureComplete:(id)a3
{
  id v7 = a3;
  id v4 = [v7 appLayout];
  int v5 = +[SBAppLayout homeScreenAppLayout];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    [(SBFluidSwitcherGestureManager *)self _clearSystemApertureZStackPolicyAssistantSuppression];
  }
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self->_activeGestureTransaction handleTransitionRequestForGestureComplete:v7 fromGestureManager:self];
}

void __104__SBFluidSwitcherGestureManager_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "currentHomeGrabberViews", 0);

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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) updateStyle];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_handleDeckSwitcherPanGesture:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    [(SBFluidSwitcherGestureManager *)self _handleSwitcherPanGestureEnded:v7];
LABEL_8:
    uint64_t v6 = v7;
    goto LABEL_9;
  }
  if (v4 == 2)
  {
    [(SBFluidSwitcherGestureManager *)self _handleSwitcherPanGestureChanged:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == 1;
  uint64_t v6 = v7;
  if (v5)
  {
    [(SBFluidSwitcherGestureManager *)self _handleSwitcherPanGestureBegan:v7];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_handleSwitcherPanGestureBegan:(id)a3
{
  id v4 = a3;
  BOOL v5 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureBegan:](v4, self);
  }

  kdebug_trace();
  uint64_t v6 = +[SBReachabilityManager sharedInstance];
  id v7 = [v6 reachabilityGestureRecognizer];

  [v7 setEnabled:0];
  [v7 setEnabled:1];
  if ([(SBFluidSwitcherGestureManager *)self _isTransactionRunningForGestureRecognizer:v4])
  {
    long long v8 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];

    if (v8)
    {
      long long v9 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];
      long long v10 = [v9 transitionRequest];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
      [WeakRetained _configureTransitionRequestForGestureBegin:v10];
    }
  }
  else
  {
    [(SBFluidSwitcherGestureManager *)self _handleSwitcherGestureBegan:v4];
  }
  if ([(SBFluidSwitcherGestureManager *)self _isTransactionRunningForGestureRecognizer:v4])
  {
    uint64_t v12 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];
    [v12 systemGestureStateChanged:v4];
  }
}

- (void)_handleSwitcherPanGestureChanged:(id)a3
{
  id v6 = a3;
  if (-[SBFluidSwitcherGestureManager _isTransactionRunningForGestureRecognizer:](self, "_isTransactionRunningForGestureRecognizer:"))
  {
    id v4 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];
    if (!self->_shouldRubberbandGrabberViewForReduceMotion)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
      self->_shouldRubberbandGrabberViewForReduceMotion = [WeakRetained shouldRubberbandFullScreenHomeGrabberView];
    }
    [v4 systemGestureStateChanged:v6];
  }
  if (self->_shouldRubberbandGrabberViewForReduceMotion) {
    [(SBFluidSwitcherGestureManager *)self _updateHomeGrabberViewsWithAnimationMode:5];
  }
}

- (void)_handleSwitcherPanGestureEnded:(id)a3
{
  id v4 = a3;
  BOOL v5 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureEnded:](v4, self);
  }

  if ([v4 state] == 3) {
    kdebug_trace();
  }
  if ([(SBFluidSwitcherGestureManager *)self _isTransactionRunningForGestureRecognizer:v4])
  {
    id v6 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];
    [v6 systemGestureStateChanged:v4];
  }
  else
  {
    if ([v4 state] == 4) {
      goto LABEL_10;
    }
    [v4 setEnabled:0];
    [v4 setEnabled:1];
    id v7 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__SBFluidSwitcherGestureManager__handleSwitcherPanGestureEnded___block_invoke;
    v8[3] = &unk_1E6AF8148;
    id v9 = v4;
    [v7 logBlock:v8];

    id v6 = v9;
  }

LABEL_10:
  if (self->_shouldRubberbandGrabberViewForReduceMotion)
  {
    self->_shouldRubberbandGrabberViewForReduceMotion = 0;
    [(SBFluidSwitcherGestureManager *)self _updateHomeGrabberViewsWithAnimationMode:5];
  }
}

id __64__SBFluidSwitcherGestureManager__handleSwitcherPanGestureEnded___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  long long v11 = @"[SBFluidSwitcherGestureManager _handleSwitcherPanGestureEnded:]";
  v9[0] = @"address";
  v2 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v10[0] = v2;
  v9[1] = @"name";
  uint64_t v3 = [*(id *)(a1 + 32) name];
  id v4 = (void *)v3;
  BOOL v5 = &stru_1F3084718;
  if (v3) {
    BOOL v5 = (__CFString *)v3;
  }
  v9[2] = @"failureReason";
  v10[1] = v5;
  v10[2] = @"GestureCancelledByOverlappingExistingTransaction";
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  v12[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  return v7;
}

- (void)_handleScrunchGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] != 1)
  {
    if ([v4 state] == 3) {
      kdebug_trace();
    }
    goto LABEL_7;
  }
  kdebug_trace();
  if ([v4 recognizedTouchType]) {
    goto LABEL_7;
  }
  if (self->_multitaskingGesturesRequireEducation)
  {
    BOOL v5 = @"requires education";
    goto LABEL_11;
  }
  if (!self->_multitaskingGesturesUserPreferenceIsOff)
  {
LABEL_7:
    [(SBFluidSwitcherGestureManager *)self _handleFluidGesture:v4];
    goto LABEL_8;
  }
  BOOL v5 = @"user preference off";
LABEL_11:
  [(SBFluidSwitcherGestureManager *)self failMultitaskingGesturesForReason:v5];
  if (self->_multitaskingGesturesRequireEducation)
  {
    id v6 = SBLogSystemGesture();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v8 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Suggesting education for multitasking gesture instead of actually performing it", v8, 2u);
    }

    id v7 = [(id)SBApp productivityGestureEducationController];
    [v7 gestureActivatedForType:6];
  }
LABEL_8:
}

- (void)_handleFloatingAppPresentGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherGestureManager *)self _grabberTongueForGestureRecognizer:v4];
  [v5 dismissWithStyle:0 animated:1];
  [(SBFluidSwitcherGestureManager *)self _handleFluidGesture:v4];
}

- (void)_handleTapToBringItemContainerForward:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 tapWasCommandModified];
    id v7 = @"NO";
    if (v6) {
      id v7 = @"YES";
    }
    int v9 = 138412290;
    long long v10 = v7;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Tap was command modified:%@", (uint8_t *)&v9, 0xCu);
  }

  if (([v4 tapWasCommandModified] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    [WeakRetained handleTapToBringItemContainerForward:v4];
  }
}

- (void)_handleClickDownToBringItemContainerForward:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    [WeakRetained handleClickDownToBringItemContainerForward:v5];

    [v5 setEnabled:0];
    [v5 setEnabled:1];
  }
}

- (void)_handleHoverGesture:(id)a3
{
  p_switcherContentController = &self->_switcherContentController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  [WeakRetained handleContinuousExposeHoverGesture:v4];
}

- (void)_handleContinuousExposeStripRevealGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherGestureManager *)self _grabberTongueForGestureRecognizer:v4];
  [v5 dismissWithStyle:0 animated:1];
  [(SBFluidSwitcherGestureManager *)self _handleFluidGesture:v4];
}

- (void)_handleWindowDragGestureRecognizer:(id)a3
{
  id v4 = (SBFluidSwitcherPanGestureRecognizer *)a3;
  id v7 = v4;
  if (self->_unpinSplitViewApplicationGestureRecognizer == v4)
  {
    clickDownToBringItemContainerForwardGestureRecognizer = self->_clickDownToBringItemContainerForwardGestureRecognizer;
    if (clickDownToBringItemContainerForwardGestureRecognizer)
    {
      uint64_t v6 = [(UILongPressGestureRecognizer *)clickDownToBringItemContainerForwardGestureRecognizer isEnabled];
      [(UILongPressGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer setEnabled:0];
      [(UILongPressGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer setEnabled:v6];
      id v4 = v7;
    }
  }
  [(SBFluidSwitcherGestureManager *)self _handleFluidGesture:v4];
}

- (BOOL)isDragAndDropTransactionRunning
{
  return [(SBFluidSwitcherDragAndDropManager *)self->_fluidDragAndDropManager isDragAndDropTransactionRunning];
}

- (BOOL)_shouldSceneResizeGesture:(id)a3 receiveTouch:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  long long v10 = [WeakRetained view];
  _UISystemGestureLocationForTouchInView();
  double v12 = v11;
  double v14 = v13;

  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && ([(SBFZStackParticipant *)zStackParticipant ownsHomeGesture] & 1) == 0)
  {
    uint64_t v18 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v19 = "Preventing the switcher resize gesture because the switcher doesn't own the home gesture.";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if ([(SBFluidSwitcherGestureManager *)self _currentUnlockedEnvironmentMode] != 3)
  {
    uint64_t v20 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v43 = [(SBFluidSwitcherGestureManager *)self _currentUnlockedEnvironmentMode];
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "Preventing the switcher resize gesture because the switcher's unlocked environment mode is: %li", buf, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v16 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  int v17 = [v16 isFloatingSwitcherVisible];

  if (v17)
  {
    uint64_t v18 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v19 = "Preventing the switcher resize gesture because the floating switcher is visible.";
LABEL_18:
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (([v8 layoutContainsRole:2] & 1) == 0)
  {
    uint64_t v18 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v19 = "Preventing the switcher resize gesture because there isn't a side app.";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if ([(SBFluidSwitcherGestureManager *)self _hasActiveModalFloatingApplication])
  {
    uint64_t v18 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v19 = "Preventing the switcher resize gesture because there is an modal floating application presented.";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  double v23 = [v8 appLayout];
  uint64_t v20 = [v23 leafAppLayoutForRole:1];

  CGFloat v24 = [v8 appLayout];
  double v25 = [v24 leafAppLayoutForRole:2];

  CGFloat v26 = [WeakRetained visibleItemContainers];
  SEL v27 = (id *)MEMORY[0x1E4F43630];
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    uint64_t v28 = v20;
  }
  else {
    uint64_t v28 = v25;
  }
  double v29 = [v26 objectForKey:v28];

  uint64_t v30 = [WeakRetained visibleItemContainers];
  if ([*v27 userInterfaceLayoutDirection] == 1) {
    uint64_t v31 = v25;
  }
  else {
    uint64_t v31 = v20;
  }
  CGFloat v32 = [v30 objectForKey:v31];

  [v32 frame];
  CGRectGetMaxX(v47);
  [v29 frame];
  CGRectGetMinX(v48);
  +[SBSeparatorView nubHitTestSize];
  SBRectWithSize();
  double v33 = [(SBFluidSwitcherGestureManager *)self switcherContentController];
  [v33 keyboardHeight];

  [v32 frame];
  CGRectGetMaxX(v49);
  [v32 frame];
  [v32 frame];
  UIRectCenteredAboutPoint();
  v46.x = v12;
  v46.y = v14;
  if (!CGRectContainsPoint(v50, v46))
  {
    double v37 = NSString;
    v45.x = v12;
    v45.y = v14;
    CGFloat v38 = NSStringFromPoint(v45);
    double v39 = [v37 stringWithFormat:@"didn't find a SBSeparatorView at location %@", v38];

    CGFloat v40 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v43 = (int64_t)v39;
      _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "Preventing the switcher resize gesture because %@", buf, 0xCu);
    }

    goto LABEL_9;
  }

  if (![v8 layoutContainsRole:3]
    || (objc_msgSend(WeakRetained, "_itemContainerAtLocation:environment:", 2, v12, v14),
        (uint64_t v34 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (![v8 layoutContainsRole:4]
      || (objc_msgSend(WeakRetained, "_itemContainerAtLocation:environment:", 3, v12, v14),
          (uint64_t v41 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[SBPanSystemGestureRecognizer setFailsPastMaximumPressDurationWithoutHysteresis:](self->_sceneResizePanGestureRecognizer, "setFailsPastMaximumPressDurationWithoutHysteresis:", [v6 _isPointerTouch] ^ 1);
      BOOL v21 = 1;
      goto LABEL_21;
    }
    uint64_t v20 = v41;
    double v35 = SBLogSystemGestureAppSwitcher();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    CGFloat v36 = "Preventing the switcher resize gesture because the separator nub is occluded by a center window application.";
    goto LABEL_40;
  }
  uint64_t v20 = v34;
  double v35 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    CGFloat v36 = "Preventing the switcher resize gesture because the separator nub is occluded by a floating application.";
LABEL_40:
    _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 2u);
  }
LABEL_41:

LABEL_9:
LABEL_20:
  BOOL v21 = 0;
LABEL_21:

  return v21;
}

- (BOOL)_hasActiveModalFloatingApplication
{
  v2 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  if ([v2 layoutContainsRole:3])
  {
    uint64_t v3 = +[SBPlatformController sharedInstance];
    uint64_t v4 = [v3 medusaCapabilities];

    BOOL v5 = v4 == 1 && SBSpaceConfigurationIsSplitView([v2 spaceConfiguration]);
    id v7 = [v2 elementWithRole:1];
    long long v8 = v7;
    if (v7 && ([v7 layoutAttributes] & 2) != 0) {
      BOOL v5 = 1;
    }

    BOOL v6 = v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)dragAndDropManager:(id)a3 displayItemForDraggingWindowWithGestureRecognizer:(id)a4
{
  BOOL v5 = (SBFluidSwitcherPanGestureRecognizer *)a4;
  if (self->_pinFloatingApplicationGestureRecognizer == v5)
  {
    id WeakRetained = [(SBFluidSwitcherGestureManager *)self _currentFloatingAppLayout];
    double v13 = [WeakRetained itemForLayoutRole:1];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    id v7 = [WeakRetained view];
    [(SBFluidSwitcherPanGestureRecognizer *)v5 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    double v12 = objc_msgSend(WeakRetained, "_leafAppLayoutForItemContainerAtLocation:environment:", 1, v9, v11);
    double v13 = [v12 itemForLayoutRole:1];
  }
  return v13;
}

- (id)dragAndDropManager:(id)a3 sourceViewProviderForDraggingWindowWithGestureRecognizer:(id)a4
{
  BOOL v5 = (SBFluidSwitcherPanGestureRecognizer *)a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v7 = WeakRetained;
  if (self->_pinFloatingApplicationGestureRecognizer != v5)
  {
    double v8 = [WeakRetained view];
    [(SBFluidSwitcherPanGestureRecognizer *)v5 locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    double v13 = objc_msgSend(v7, "_leafAppLayoutForItemContainerAtLocation:environment:", 1, v10, v12);
LABEL_4:
    double v14 = [v7 visibleItemContainers];
    char v15 = [v14 objectForKey:v13];

    goto LABEL_5;
  }
  double v13 = [(SBFluidSwitcherGestureManager *)self _currentFloatingAppLayout];
  if (v13) {
    goto LABEL_4;
  }
  char v15 = 0;
LABEL_5:

  return v15;
}

- (void)dragAndDropManager:(id)a3 didBeginDraggingWindowWithSceneIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFluidSwitcherGestureManager *)self delegate];
  [v6 fluidSwitcherGestureManager:self didBeginDraggingWindowWithSceneIdentifier:v5];
}

- (void)dragAndDropManager:(id)a3 didPlatterizeWindowDragWithSceneIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFluidSwitcherGestureManager *)self delegate];
  [v6 fluidSwitcherGestureManager:self didPlatterizeWindowDragWithSceneIdentifier:v5];
}

- (void)dragAndDropManager:(id)a3 willEndDraggingWindowWithSceneIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFluidSwitcherGestureManager *)self delegate];
  [v6 fluidSwitcherGestureManager:self willEndDraggingWindowWithSceneIdentifier:v5];
}

- (void)dragAndDropManager:(id)a3 didBeginGesture:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFluidSwitcherGestureManager *)self delegate];
  [v6 fluidSwitcherGestureManager:self didBeginGesture:v5];
}

- (void)dragAndDropManager:(id)a3 didUpdateGesture:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFluidSwitcherGestureManager *)self delegate];
  [v6 fluidSwitcherGestureManager:self didUpdateGesture:v5];
}

- (void)dragAndDropManager:(id)a3 didEndGesture:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFluidSwitcherGestureManager *)self delegate];
  [v6 fluidSwitcherGestureManager:self didEndGesture:v5];
}

- (void)_handleFluidGesture:(id)a3
{
  id v5 = a3;
  if (!-[SBFluidSwitcherGestureManager _isTransactionRunningForGestureRecognizer:](self, "_isTransactionRunningForGestureRecognizer:"))[(SBFluidSwitcherGestureManager *)self _handleSwitcherGestureBegan:v5]; {
  if ([(SBFluidSwitcherGestureManager *)self _isTransactionRunningForGestureRecognizer:v5])
  }
  {
    uint64_t v4 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];
    [v4 systemGestureStateChanged:v5];
  }
}

- (void)_handleSwitcherGestureBegan:(id)a3
{
  id v4 = a3;
  [(SBFluidSwitcherGestureManager *)self _hideGrabberAnimated:1];
  [(SBFluidSwitcherGestureManager *)self _startFluidSwitcherTransactionForGestureRecognizer:v4];
}

- (void)_startFluidSwitcherTransactionForGestureRecognizer:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBFluidSwitcherGestureManager *)self _isTransactionRunningForGestureRecognizer:v4])
  {
    id v5 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];
    id v6 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      double v8 = NSStringFromClass(v7);
      double v9 = SBSystemGestureRecognizerStateDescription([v4 state]);
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v8;
      __int16 v23 = 2050;
      id v24 = v4;
      __int16 v25 = 2114;
      CGFloat v26 = v9;
      __int16 v27 = 2114;
      uint64_t v28 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Requesting fluid switcher gesture transaction for gesture recognizer: <%{public}@:%{public}p> (%{public}@), active gesture transaction:%{public}@", buf, 0x2Au);
    }
    if (v5)
    {
      id v10 = [v5 gestureRecognizer];

      if (v10 == v4) {
        [v5 setShouldCancelGestureUponInterruption:0];
      }
    }
    double v11 = [MEMORY[0x1E4F624E0] sharedInstance];
    [v11 cancelEventsWithName:@"SBFluidSwitcherGesture"];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    double v13 = [WeakRetained windowScene];
    double v14 = [v13 _fbsDisplayConfiguration];

    char v15 = +[SBWorkspace mainWorkspace];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke;
    v19[3] = &unk_1E6AF67B0;
    v19[4] = self;
    id v20 = v4;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke_2;
    v16[3] = &unk_1E6AFF260;
    id v17 = v20;
    uint64_t v18 = self;
    [v15 requestTransitionWithOptions:0 displayConfiguration:v14 builder:v19 validator:v16];
  }
}

void __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:11];
  [v3 setEventLabel:@"SBFluidSwitcherGesture"];
  [*(id *)(a1 + 32) _configureTransitionRequest:v3 forGestureBegin:*(void *)(a1 + 40)];
}

BOOL __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) state];
  unint64_t v5 = v4 - 1;
  if ((unint64_t)(v4 - 1) > 1)
  {
    unint64_t v7 = v4;
    double v8 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      uint64_t v11 = *(void *)(a1 + 32);
      double v12 = SBSystemGestureRecognizerStateDescription(v7);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v10;
      __int16 v19 = 2050;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      uint64_t v22 = v12;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "No longer creating transaction for gesture recognizer since it has ended since the request was enqueued: <%{public}@:%{public}p> (%{public}@)", buf, 0x20u);
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke_3;
    v15[3] = &unk_1E6AFF610;
    int8x16_t v14 = *(int8x16_t *)(a1 + 32);
    id v6 = (id)v14.i64[0];
    int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
    [v3 setTransactionProvider:v15];
  }
  return v5 < 2;
}

id __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = (objc_class *)objc_msgSend(*(id *)(a1 + 32), "_fluidSwitcherGestureTransactionClassForGestureType:", objc_msgSend(v3, "_gestureTypeForGestureRecognizer:", v4));
  unint64_t v7 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = NSStringFromClass(v6);
    double v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    uint64_t v11 = *(void **)(a1 + 40);
    double v12 = SBSystemGestureRecognizerStateDescription([v11 state]);
    int v19 = 138544130;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = v10;
    __int16 v23 = 2050;
    id v24 = v11;
    __int16 v25 = 2114;
    CGFloat v26 = v12;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Creating %{public}@ for gesture recognizer: <%{public}@:%{public}p> (%{public}@)", (uint8_t *)&v19, 0x2Au);
  }
  id v13 = [v6 alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v15 = (void *)[v13 initWithTransitionRequest:v5 switcherController:WeakRetained delegate:*(void *)(a1 + 32)];

  [v15 setGestureRecognizer:*(void *)(a1 + 40)];
  int8x16_t v16 = [*(id *)(a1 + 32) switcherController];
  id v17 = [v16 switcherCoordinator];
  [v17 setActiveGestureTransaction:v15];

  return v15;
}

- (void)_configureTransitionRequest:(id)a3 forGestureBegin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  [WeakRetained _configureTransitionRequestForGestureBegin:v6];

  uint64_t v9 = [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue edgePullGestureRecognizer];
  id v10 = v7;
  if ((id)v9 == v7) {
    goto LABEL_8;
  }
  uint64_t v11 = (void *)v9;
  uint64_t v12 = [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];
  id v13 = v7;
  if ((id)v12 == v7)
  {
LABEL_7:

    id v10 = v11;
LABEL_8:

LABEL_9:
    uint64_t v18 = [(SBFluidSwitcherGestureManager *)self _firstFloatingAppLayout];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__SBFluidSwitcherGestureManager__configureTransitionRequest_forGestureBegin___block_invoke;
    v20[3] = &unk_1E6AF5638;
    id v21 = v18;
    uint64_t v22 = self;
    id v19 = v18;
    [v6 modifyApplicationContext:v20];

    goto LABEL_10;
  }
  int8x16_t v14 = (void *)v12;
  uint64_t v15 = [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue edgePullGestureRecognizer];
  if ((id)v15 == v7)
  {

    id v13 = v14;
    goto LABEL_7;
  }
  int8x16_t v16 = (void *)v15;
  id v17 = [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];

  if (v17 == v7) {
    goto LABEL_9;
  }
LABEL_10:
}

void __77__SBFluidSwitcherGestureManager__configureTransitionRequest_forGestureBegin___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  id v5 = [*(id *)(a1 + 32) itemForLayoutRole:1];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  id v7 = [v4 _entityForDisplayItem:v5 switcherController:WeakRetained];

  [v3 setEntity:v7 forLayoutRole:3];
}

- (void)fluidSwitcherGestureTransaction:(id)a3 didBeginGesture:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained fluidSwitcherGestureManager:self didBeginGesture:v6];
}

- (void)fluidSwitcherGestureTransaction:(id)a3 didUpdateGesture:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained fluidSwitcherGestureManager:self didUpdateGesture:v6];
}

- (void)fluidSwitcherGestureTransaction:(id)a3 didEndGesture:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained fluidSwitcherGestureManager:self didEndGesture:v6];
}

- (BOOL)_shouldDeckInSwitcherPanGesture:(id)a3 receiveTouch:(id)a4
{
  p_switcherContentController = &self->_switcherContentController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  uint64_t v9 = [WeakRetained view];
  _UISystemGestureLocationForTouchInView();
  double v11 = v10;
  double v13 = v12;

  int8x16_t v14 = objc_msgSend(WeakRetained, "_itemContainerAtLocation:environment:", 1, v11, v13);

  if (v14)
  {
    uint64_t v15 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "Preventing the in switcher gesture because the touch is on top of an item container.", v17, 2u);
    }
  }
  return v14 == 0;
}

- (BOOL)_shouldFloatingApplicationSwipeUpGesture:(id)a3 receiveTouch:(id)a4
{
  p_switcherContentController = &self->_switcherContentController;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  double v10 = [WeakRetained view];

  _UISystemGestureLocationForTouchInView();
  double v12 = v11;
  double v14 = v13;

  [(SBFluidSwitcherGestureManager *)self _floatingApplicationBounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  __int16 v23 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_floatingApplicationDisplayEdgeInfo");
  v32.origin.x = v16;
  v32.origin.y = v18;
  v32.size.width = v20;
  v32.size.height = v22;
  double MaxY = CGRectGetMaxY(v32);
  uint64_t v25 = [v23 safeAreaInsetsPortrait];
  [(id)v25 bottomInset];
  double v27 = MaxY - v26;
  BOOL v28 = v14 > v27;

  uint64_t v29 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  LOBYTE(v25) = [v29 isFloatingSwitcherVisible];

  if ((v25 & 1) == 0)
  {
    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.width = v20;
    v33.size.height = v22;
    if (v12 >= CGRectGetMinX(v33))
    {
      v34.origin.x = v16;
      v34.origin.y = v18;
      v34.size.width = v20;
      v34.size.height = v22;
      BOOL v30 = v12 < CGRectGetMaxX(v34);
      BOOL v28 = v14 > v27 && v30;
    }
    else
    {
      BOOL v28 = 0;
    }
  }

  return v28;
}

- (BOOL)_shouldFloatingApplicationMoveGesture:(id)a3 receiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 _isPointerTouch])
  {
    BOOL v8 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    double v10 = [WeakRetained view];

    _UISystemGestureLocationForTouchInView();
    uint64_t v12 = v11;
    [(SBFluidSwitcherGestureManager *)self _floatingApplicationBounds];
    CGFloat v14 = v13;
    double v16 = v15;
    CGFloat v18 = v17;
    double v20 = v19;
    double v21 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
    [v7 locationInView:0];
    double v23 = v22;
    double v25 = v24;
    id v26 = objc_loadWeakRetained((id *)&self->_switcherController);
    double v27 = [v26 windowScene];

    BOOL v28 = [v27 systemGestureManager];
    int v29 = objc_msgSend(v28, "shouldSystemGestureReceiveTouchWithLocation:", v23, v25);
    BOOL v30 = SBIsSystemGestureAllowed(v27, 29);
    int v31 = [v21 layoutContainsRole:3];
    BOOL v8 = 0;
    if (v29 && v30)
    {
      uint64_t v32 = 0;
      if (v31)
      {
        +[SBNubView height];
        UIRectInset();
        CGFloat v46 = v16;
        CGFloat v47 = v20;
        UIRectInset();
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        if (SBRectContainsPoint() && (SBRectContainsPoint() & 1) == 0)
        {
          uint64_t v41 = [v21 floatingConfiguration];
          uint64_t v42 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
          uint64_t v43 = 1;
          if (v42 == 1) {
            uint64_t v43 = 2;
          }
          uint64_t v45 = v12;
          if (v41 == v43)
          {
            v48.size.width = v38;
            v48.origin.x = v34;
            v48.origin.y = v36;
            v48.size.height = v40;
            CGRectGetMaxX(v48);
          }
          v49.origin.x = v14;
          v49.origin.y = v46;
          v49.size.width = v18;
          v49.size.height = v47;
          CGRectGetMaxX(v49);
          if ((SBRectContainsPoint() & 1) != 0
            || (SBRectContainsPoint() & 1) != 0
            || SBRectContainsPoint())
          {
            BOOL v8 = 1;
            uint64_t v32 = 1;
          }
          else
          {
            uint64_t v32 = 0;
            BOOL v8 = 1;
          }
        }
        else
        {
          BOOL v8 = 0;
          uint64_t v32 = 0;
        }
      }
    }
    else
    {
      uint64_t v32 = 0;
    }
    -[SBPanSystemGestureRecognizer setFailsPastMaximumPressDurationWithoutHysteresis:](self->_moveFloatingApplicationGestureRecognizer, "setFailsPastMaximumPressDurationWithoutHysteresis:", v32, v45);
  }
  return v8;
}

- (BOOL)_shouldFloatingApplicationPinGesture:(id)a3 receiveTouch:(id)a4
{
  p_switcherContentController = &self->_switcherContentController;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  double v10 = [WeakRetained view];

  _UISystemGestureLocationForTouchInView();
  [(SBFluidSwitcherGestureManager *)self _floatingApplicationBounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v19 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  [v7 locationInView:0];
  double v21 = v20;
  double v23 = v22;

  id v24 = objc_loadWeakRetained((id *)&self->_switcherController);
  double v25 = [v24 windowScene];

  id v26 = [v25 systemGestureManager];
  int v27 = objc_msgSend(v26, "shouldSystemGestureReceiveTouchWithLocation:", v21, v23);
  BOOL v28 = SBIsSystemGestureAllowed(v25, 30);
  int v29 = [v19 layoutContainsRole:3];
  BOOL v30 = -[SBFluidSwitcherGestureManager _isBannerOccludingRegionAtReferencePoint:](self, "_isBannerOccludingRegionAtReferencePoint:", v21, v23);
  char v31 = 0;
  if (v27 && v28 && v29 && !v30)
  {
    uint64_t v32 = +[SBMedusaDomain rootSettings];
    [v32 narrowEdgeSwipeHitTestWidth];

    +[SBNubView height];
    v34.origin.x = v12;
    v34.origin.y = v14;
    v34.size.width = v16;
    v34.size.height = v18;
    CGRectGetMidX(v34);
    char v31 = SBRectContainsPoint();
  }

  return v31;
}

- (BOOL)_shouldSplitViewApplicationUnpinGesture:(id)a3 receiveTouch:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v7 locationInView:0];
  if (!-[SBFluidSwitcherGestureManager _isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:](self, "_isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:"))
  {
    BOOL v18 = 0;
    goto LABEL_21;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  id v9 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  double v10 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  CGRect v50 = [v10 appLayout];

  double v11 = [v9 view];
  _UISystemGestureLocationForTouchInView();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  uint64_t v16 = -[SBFluidSwitcherGestureManager _hitTestStageItemContainerForUnpinGestureWithTouch:atGestureLocation:](self, "_hitTestStageItemContainerForUnpinGestureWithTouch:atGestureLocation:", v7);
  CGRect v49 = v11;
  if (!v16) {
    goto LABEL_8;
  }
  double v17 = (void *)v16;
  if (!self->_windowMoveClientGateRelationshipGestureRecognizer)
  {
    -[SBFluidSwitcherGestureManager _edgeSwipeHitTestRectForItemContainer:forPointerTouch:](self, "_edgeSwipeHitTestRectForItemContainer:forPointerTouch:", v16, [v7 _isPointerTouch]);
    if ((SBRectContainsPoint() & 1) == 0)
    {

LABEL_8:
      if ([WeakRetained isChamoisWindowingUIEnabled])
      {
        double v19 = [v9 visibleItemContainers];
        double v20 = [v19 allValues];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __86__SBFluidSwitcherGestureManager__shouldSplitViewApplicationUnpinGesture_receiveTouch___block_invoke;
        v51[3] = &unk_1E6B0C018;
        id v52 = v50;
        id v53 = v11;
        CGFloat v54 = v13;
        CGFloat v55 = v15;
        double v17 = objc_msgSend(v20, "bs_firstObjectPassingTest:", v51);
      }
      else
      {
        double v17 = 0;
      }
      goto LABEL_11;
    }
  }
  [WeakRetained isChamoisWindowingUIEnabled];
LABEL_11:
  double v21 = [v17 appLayout];
  [v6 setInitialTouchLeafAppLayout:v21];

  BOOL v18 = v17 != 0;
  if (v17)
  {
    id v47 = v9;
    uint64_t v22 = [v7 _isPointerTouch];
    id v48 = WeakRetained;
    int v23 = [WeakRetained isChamoisWindowingUIEnabled];
    [(SBFluidSwitcherGestureManager *)self _edgeSwipeHitTestRectForItemContainer:v17 forPointerTouch:v22];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    int v32 = SBRectContainsPoint();
    double v33 = [v17 appLayout];
    int v34 = [v50 isOrContainsAppLayout:v33];

    if ((v23 & v34 & (v22 | v32)) != 0) {
      double v35 = 0.0;
    }
    else {
      double v35 = 10.0;
    }
    [(SBFluidSwitcherPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer _setHysteresis:v35];
    CGFloat v36 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v73.x = v13;
      v73.y = v15;
      CGFloat v46 = NSStringFromCGPoint(v73);
      [(SBFluidSwitcherGestureManager *)self _paddedHitTestRectForItemContainer:v17 forPointerTouch:v22];
      NSStringFromCGRect(v75);
      double v37 = v45 = v6;
      CGFloat v38 = NSStringFromBOOL();
      double v39 = NSStringFromBOOL();
      CGFloat v40 = NSStringFromBOOL();
      uint64_t v41 = NSStringFromBOOL();
      v76.origin.x = v25;
      v76.origin.y = v27;
      v76.size.width = v29;
      v76.size.height = v31;
      uint64_t v42 = NSStringFromCGRect(v76);
      *(_DWORD *)buf = 138414082;
      CGFloat v57 = v46;
      __int16 v58 = 2112;
      long long v59 = v37;
      __int16 v60 = 2112;
      long long v61 = v38;
      __int16 v62 = 2112;
      int v63 = v39;
      __int16 v64 = 2112;
      long long v65 = v40;
      __int16 v66 = 2112;
      __int16 v67 = v41;
      __int16 v68 = 2112;
      __int16 v69 = v42;
      __int16 v70 = 2048;
      double v71 = v35;
      _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer receiving touch (%@): hit-tested to item container (%@); isChamoisWi"
        "ndowingUIEnabled: %@; isSelectedAppLayoutOnStage: %@; isPointerTouch: %@; isTouchWithinEdgeSwipeHitTestRect: %@ "
        "(%@); hysteresis: %f",
        buf,
        0x52u);

      id v6 = v45;
    }
    id v9 = v47;
    id WeakRetained = v48;
  }
  else
  {
    CGFloat v36 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v74.x = v13;
      v74.y = v15;
      uint64_t v43 = NSStringFromCGPoint(v74);
      *(_DWORD *)buf = 138412290;
      CGFloat v57 = v43;
      _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer not receiving touch (%@): did not hit-test to item container", buf, 0xCu);
    }
  }

LABEL_21:
  return v18;
}

BOOL __86__SBFluidSwitcherGestureManager__shouldSplitViewApplicationUnpinGesture_receiveTouch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 appLayout];
  id v6 = [v5 itemForLayoutRole:1];
  uint64_t v7 = [v4 layoutRoleForItem:v6];

  BOOL v10 = 0;
  if (!v7)
  {
    id v8 = objc_msgSend(*(id *)(a1 + 40), "hitTest:withEvent:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
    uint64_t v9 = [v8 isDescendantOfView:v3];

    if (v9) {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (BOOL)_shouldIndirectFloatingAppScrunchGesture:(id)a3 receiveTouch:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v6 = [WeakRetained view];
  [(SBFluidSwitcherGestureManager *)self _floatingApplicationBounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v15 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  char v16 = [v15 isFloatingSwitcherVisible];

  if (v16)
  {
    BOOL v17 = 1;
  }
  else
  {
    id v18 = objc_loadWeakRetained((id *)&self->_switcherController);
    double v19 = [v18 windowScene];
    double v20 = [v19 systemGestureManager];
    double v21 = [v20 indirectTouchLifecycleMonitor];
    [v21 systemGestureHoverLocationInView:v6];
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    v28.origin.x = v8;
    v28.origin.y = v10;
    v28.size.width = v12;
    v28.size.height = v14;
    v27.x = v23;
    v27.y = v25;
    BOOL v17 = CGRectContainsPoint(v28, v27);
  }

  return v17;
}

- (BOOL)_shouldLiveResizeItemContainerGestureWithTouch:(id)a3 receiveTouch:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  p_switcherContentController = &self->_switcherContentController;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  CGFloat v10 = [WeakRetained view];
  _UISystemGestureLocationForTouchInView();
  double v12 = v11;
  double v14 = v13;

  CGFloat v15 = objc_msgSend(WeakRetained, "_itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:", 1, 1, v12, v14);
  char v16 = v15;
  if (v15)
  {
    BOOL v17 = [v15 appLayout];
    id v18 = [WeakRetained adjustedAppLayoutForLeafAppLayout:v17];
    double v19 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
    double v20 = [v19 appLayout];
    char v21 = [v20 isOrContainsAppLayout:v17];

    if ((v21 & 1) == 0)
    {
      int v32 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
        CGFloat v46 = [v45 appLayout];
        *(_DWORD *)buf = 138412546;
        id v53 = v46;
        __int16 v54 = 2112;
        CGFloat v55 = v17;
        _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize touch gesture because current layout state doesn't contain leaf app layout. %@ %@", buf, 0x16u);
      }
      goto LABEL_24;
    }
    double v22 = +[SBApplicationController sharedInstance];
    char v23 = [v22 _appLayoutContainsOnlyResizableApps:v18];

    if ((v23 & 1) == 0)
    {
      int v32 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v18;
        _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize touch gesture because app layout doesn't contain only resizable apps. %@", buf, 0xCu);
      }
      goto LABEL_24;
    }
    [v16 frame];
    uint64_t v50 = v24;
    uint64_t v51 = v25;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    char v30 = [v16 allowedTouchResizeCorners];
    CGFloat v31 = [v17 layoutAttributesForItemInRole:1];
    [v31 sizingPolicy];

    int v32 = [WeakRetained chamoisLayoutAttributes];
    [v32 screenEdgePadding];
    SBRectWithSize();
    uint64_t v48 = v29;
    uint64_t v49 = v27;
    if ((v30 & 8) != 0)
    {
      uint64_t v34 = v50;
      UIRectCenteredAboutPoint();
      v61.x = v12;
      v61.y = v14;
      BOOL v33 = CGRectContainsPoint(v65, v61);
      if (v33)
      {
        uint64_t v35 = v51;
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v33 = 0;
      uint64_t v34 = v50;
    }
    uint64_t v35 = v51;
    if ((v30 & 4) != 0)
    {
      UIRectCenteredAboutPoint();
      v58.x = v12;
      v58.y = v14;
      BOOL v33 = CGRectContainsPoint(v62, v58);
    }
    if (!v33 && (v30 & 2) != 0)
    {
      UIRectCenteredAboutPoint();
      v59.x = v12;
      v59.y = v14;
      BOOL v33 = CGRectContainsPoint(v63, v59);
    }
LABEL_11:
    if (v33 || (v30 & 1) == 0)
    {
      if (!v33) {
        goto LABEL_14;
      }
    }
    else
    {
      UIRectCenteredAboutPoint();
      v60.x = v12;
      v60.y = v14;
      if (!CGRectContainsPoint(v64, v60))
      {
LABEL_14:
        CGFloat v36 = SBLogSystemGestureAppSwitcher();
        BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
        uint64_t v39 = v48;
        uint64_t v38 = v49;
        if (v37)
        {
          uint64_t v40 = v34;
          uint64_t v41 = v35;
          uint64_t v42 = NSStringFromCGRect(*(CGRect *)(&v38 - 2));
          v57.x = v12;
          v57.y = v14;
          uint64_t v43 = NSStringFromCGPoint(v57);
          *(_DWORD *)buf = 138412546;
          id v53 = v42;
          __int16 v54 = 2112;
          CGFloat v55 = v43;
          _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize touch gesture because didn't hit test. %@ %@", buf, 0x16u);
        }
LABEL_24:
        BOOL v44 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    BOOL v44 = 1;
    goto LABEL_25;
  }
  BOOL v17 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize touch gesture because no item container.", buf, 2u);
  }
  BOOL v44 = 0;
LABEL_26:

  return v44;
}

- (BOOL)_shouldLiveResizeItemContainerGestureWithPointer:(id)a3 receiveTouch:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a4, "_isPointerTouch", a3))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    id v6 = [WeakRetained itemContainerToResizeUsingPointer];
    id v7 = v6;
    if (!v6)
    {
      id v8 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize pointer gesture because no item container.", (uint8_t *)&v20, 2u);
      }
      BOOL v15 = 0;
      goto LABEL_16;
    }
    id v8 = [v6 appLayout];
    double v9 = [WeakRetained adjustedAppLayoutForLeafAppLayout:v8];
    CGFloat v10 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
    double v11 = [v10 appLayout];
    char v12 = [v11 isOrContainsAppLayout:v8];

    if (v12)
    {
      double v13 = +[SBApplicationController sharedInstance];
      char v14 = [v13 _appLayoutContainsOnlyResizableApps:v9];

      if (v14)
      {
        BOOL v15 = 1;
LABEL_15:

LABEL_16:
        return v15;
      }
      char v16 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        char v21 = v9;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize pointer gesture because app layout doesn't contain only resizable apps. %@", (uint8_t *)&v20, 0xCu);
      }
    }
    else
    {
      char v16 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v17 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
        id v18 = [v17 appLayout];
        int v20 = 138412546;
        char v21 = v18;
        __int16 v22 = 2112;
        char v23 = v8;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize pointer gesture because current layout state doesn't contain leaf app layout. %@ %@", (uint8_t *)&v20, 0x16u);
      }
    }

    BOOL v15 = 0;
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)_shouldLiveResizeGesture:(id)a3 receiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  double v9 = [WeakRetained windowScene];
  CGFloat v10 = [v9 systemGestureManager];
  double v11 = [v9 floatingDockController];
  char v12 = [v9 screen];
  double v13 = [v12 fixedCoordinateSpace];

  [v7 locationInView:0];
  int v14 = objc_msgSend(v11, "containsPoint:fromCoordinateSpace:", v13);
  if ([WeakRetained windowManagementStyle] != 2)
  {
    BOOL v15 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v48 = 0;
      char v16 = "Preventing the switcher live resize gesture because Stage Manager isn't enabled.";
      BOOL v17 = (uint8_t *)&v48;
      goto LABEL_13;
    }
LABEL_14:

LABEL_15:
    BOOL v18 = 0;
    goto LABEL_16;
  }
  [v7 locationInView:0];
  if ((objc_msgSend(v10, "shouldSystemGestureReceiveTouchWithLocation:") & 1) == 0)
  {
    BOOL v15 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v47 = 0;
      char v16 = "Preventing the switcher live resize gesture because covered by keyboard or PiP.";
      BOOL v17 = (uint8_t *)&v47;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (([v10 isGestureWithTypeAllowed:37] & 1) == 0)
  {
    BOOL v15 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      char v16 = "Preventing the switcher live resize gesture because not allowed.";
      BOOL v17 = buf;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (v14)
  {
    BOOL v15 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v45 = 0;
      char v16 = "Preventing the switcher live resize gesture because touch is inside floating dock.";
      BOOL v17 = (uint8_t *)&v45;
LABEL_13:
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  id v20 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  char v21 = [v20 itemContainerToResizeUsingPointer];
  if (!v21)
  {
    __int16 v22 = [v20 view];
    _UISystemGestureLocationInView();
    double v24 = v23;
    double v26 = v25;

    char v21 = objc_msgSend(v20, "_itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:", 1, 1, v24, v26);
    if (!v21)
    {
      CGFloat v36 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v44 = 0;
        _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize gesture because no item container.", v44, 2u);
      }

      goto LABEL_15;
    }
  }
  id v40 = v6;
  uint64_t v41 = v21;
  uint64_t v27 = [v21 appLayout];
  uint64_t v38 = v20;
  uint64_t v39 = [v20 adjustedAppLayoutForLeafAppLayout:v27];
  uint64_t v28 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  uint64_t v29 = [v28 appLayout];
  BOOL v37 = (void *)v27;
  LOBYTE(v27) = [v29 isOrContainsAppLayout:v27];

  if ((v27 & 1) == 0)
  {
    int v32 = v39;
    BOOL v33 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v43 = 0;
      uint64_t v34 = "Preventing the switcher live resize gesture because item container isn't on stage.";
      uint64_t v35 = (uint8_t *)&v43;
LABEL_27:
      _os_log_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_DEFAULT, v34, v35, 2u);
    }
LABEL_28:

    BOOL v18 = 0;
    id v6 = v40;
    goto LABEL_16;
  }
  char v30 = +[SBApplicationController sharedInstance];
  char v31 = [v30 _appLayoutContainsOnlyResizableApps:v39];

  if ((v31 & 1) == 0)
  {
    int v32 = v39;
    BOOL v33 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v42 = 0;
      uint64_t v34 = "Preventing the switcher live resize gesture because app layout contains non resizable items.";
      uint64_t v35 = v42;
      goto LABEL_27;
    }
    goto LABEL_28;
  }

  id v6 = v40;
  BOOL v18 = [(SBFluidSwitcherGestureManager *)self _shouldLiveResizeItemContainerGestureWithPointer:v40 receiveTouch:v7]|| [(SBFluidSwitcherGestureManager *)self _shouldLiveResizeItemContainerGestureWithTouch:v40 receiveTouch:v7];
LABEL_16:

  return v18;
}

- (BOOL)_shouldClickDownToBringItemContainerForward:(id)a3 receiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v10 = [v7 _isPointerTouch]
     && ([(SBAppSwitcherSettings *)self->_appSwitcherSettings chamoisSettings],
         id v8 = objc_claimAutoreleasedReturnValue(),
         int v9 = [v8 changeFocusOnClickDown],
         v8,
         v9)
     && [(SBFluidSwitcherGestureManager *)self _shouldBringItemContainerForwardGesture:v6 receiveTouch:v7];

  return v10;
}

- (BOOL)_shouldBringItemContainerForwardGesture:(id)a3 receiveTouch:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v65 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  if ([WeakRetained isChamoisWindowingUIEnabled])
  {
    id v7 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    [v65 locationInView:0];
    double v9 = v8;
    double v11 = v10;
    char v12 = [WeakRetained windowScene];
    double v13 = [v12 systemGestureManager];
    int v55 = objc_msgSend(v13, "shouldSystemGestureReceiveTouchWithLocation:", v9, v11);

    int v14 = [v7 view];
    _UISystemGestureLocationForTouchInView();
    double v16 = v15;
    double v18 = v17;

    double v19 = objc_msgSend(v7, "_itemContainerAtLocation:environment:", 1, v16, v18);
    id v20 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
    uint64_t v21 = [v19 appLayout];
    CGRect v62 = [v7 adjustedAppLayoutForLeafAppLayout:v21];
    __int16 v22 = [v7 liveContentOverlays];
    CGRect v63 = (void *)v21;
    double v23 = [v22 objectForKey:v21];

    CGPoint v58 = v23;
    [v23 touchBehavior];
    double v24 = [v19 appLayout];
    uint64_t v25 = [v24 itemForLayoutRole:1];

    CGPoint v60 = v20;
    double v26 = [v20 appLayout];
    uint64_t v27 = [v26 zOrderedItems];
    uint64_t v28 = [v27 firstObject];

    NSUInteger v51 = [(NSHashTable *)self->_presentedSceneBackedBanners count];
    uint64_t v29 = [v12 screen];
    char v30 = [v29 fixedCoordinateSpace];

    CGPoint v57 = v12;
    char v31 = [v12 floatingDockController];
    char v53 = objc_msgSend(v31, "containsPoint:fromCoordinateSpace:", v30, v9, v11);
    CGPoint v59 = v19;
    CGPoint v61 = (void *)v25;
    if (v19)
    {
      char v32 = 0;
      if ((BSEqualObjects() & 1) == 0 && ((v55 ^ 1) & 1) == 0)
      {
        BOOL v33 = [v60 appLayout];
        if ([v33 isOrContainsAppLayout:v63])
        {
          +[SBApplicationController sharedInstance];
          uint64_t v35 = v34 = v31;
          char v36 = [v35 _appLayoutContainsOnlyResizableApps:v62];
          char v37 = v53 ^ 1;
          if (v51) {
            char v37 = 0;
          }
          char v32 = v36 & v37;

          char v31 = v34;
        }
        else
        {
          char v32 = 0;
        }
      }
    }
    else
    {
      char v32 = 0;
    }
    uint64_t v38 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = NSStringFromBOOL();
      __int16 v48 = NSStringFromBOOL();
      NSStringFromBOOL();
      id v40 = v49 = v32;
      uint64_t v41 = [v62 succinctDescription];
      [v63 succinctDescription];
      uint64_t v42 = v50 = v31;
      NSStringFromBKSSceneHostTouchBehavior();
      id v56 = WeakRetained;
      __int16 v43 = v28;
      BOOL v44 = v52 = v30;
      __int16 v45 = NSStringFromBOOL();
      NSStringFromBOOL();
      CGFloat v46 = v54 = v7;
      *(_DWORD *)buf = 138414082;
      __int16 v67 = v39;
      __int16 v68 = 2112;
      __int16 v69 = v48;
      __int16 v70 = 2112;
      double v71 = v40;
      __int16 v72 = 2112;
      CGPoint v73 = v41;
      __int16 v74 = 2112;
      CGRect v75 = v42;
      __int16 v76 = 2112;
      CGRect v77 = v44;
      __int16 v78 = 2112;
      v79 = v45;
      __int16 v80 = 2112;
      v81 = v46;
      _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_DEFAULT, "Should bring item container forward:%@ TouchAllowedAtLocation:%@ SceneBackedBannersPresented:%@ AppLayout:%@ LeafAppLayoutToBringForward:%@ TouchBehavior:%@ ItemAlreadyOnTop:%@ TouchInsideDock:%@", buf, 0x52u);

      id v7 = v54;
      char v30 = v52;
      uint64_t v28 = v43;
      id WeakRetained = v56;

      char v31 = v50;
      char v32 = v49;
    }
  }
  else
  {
    char v32 = 0;
  }

  return v32;
}

- (BOOL)_shouldContinuousExposeStripOverflowPanGesture:(id)a3 receiveTouch:(id)a4
{
  id v42 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  id v41 = v6;
  [v6 locationInView:0];
  double v9 = v8;
  double v11 = v10;
  char v12 = [WeakRetained windowScene];
  double v13 = [v12 systemGestureManager];
  int v14 = objc_msgSend(v13, "shouldSystemGestureReceiveTouchWithLocation:", v9, v11);
  double v15 = v13;
  int v16 = [v13 isGestureWithTypeAllowed:56];
  double v17 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  uint64_t v18 = [v17 unlockedEnvironmentMode];
  double v19 = v17;
  uint64_t v20 = [v17 peekConfiguration];
  uint64_t v21 = WeakRetained;
  int v22 = [WeakRetained isChamoisWindowingUIEnabled];
  BOOL v23 = 0;
  if (!v22 || !v14 || !v16)
  {
    double v26 = v41;
    uint64_t v25 = v42;
    uint64_t v27 = v15;
    goto LABEL_15;
  }
  BOOL v24 = v18 == 3;
  double v26 = v41;
  uint64_t v25 = v42;
  uint64_t v27 = v15;
  if (!v24) {
    goto LABEL_15;
  }
  if (!SBPeekConfigurationIsValid(v20))
  {
    id v28 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    uint64_t v29 = [v28 view];
    _UISystemGestureLocationForTouchInView();
    double v31 = v30;
    double v33 = v32;

    uint64_t v34 = [v28 chamoisLayoutAttributes];
    [v34 stripWidth];
    double v36 = v35;
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      char v37 = [v28 view];
      [v37 frame];
      CGFloat v38 = CGRectGetMaxX(v43) - v36;

      if (v31 < v38)
      {
LABEL_11:
        BOOL v23 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    else if (v31 > v36)
    {
      goto LABEL_11;
    }
    uint64_t v39 = objc_msgSend(v28, "_itemContainerAtLocation:environment:", 0, v31, v33);
    BOOL v23 = v39 == 0;

    goto LABEL_14;
  }
  BOOL v23 = 0;
LABEL_15:

  return v23;
}

- (CGRect)_paddedHitTestRectForItemContainer:(id)a3 forPointerTouch:(BOOL)a4
{
  id v5 = a3;
  [v5 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  char v15 = [WeakRetained isChamoisWindowingUIEnabled];

  int v16 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  double v17 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  uint64_t v18 = [v17 appLayout];

  double v19 = [v5 appLayout];

  uint64_t v20 = [v19 itemForLayoutRole:1];
  uint64_t v21 = [v18 layoutRoleForItem:v20];

  int v22 = +[SBMedusaDomain rootSettings];
  double v23 = v11;
  if ((v15 & 1) == 0)
  {
    if (v21 == 4)
    {
      BOOL v24 = +[SBMedusaDomain rootSettings];
      [v24 wideEdgeSwipeHitTestWidth];
      double v23 = v25;
    }
    else
    {
      uint64_t v26 = [v18 configuration];
      double v23 = 0.0;
      double v27 = 0.0;
      switch(v26)
      {
        case 0:
        case 1:
        case 3:
          goto LABEL_5;
        case 2:
          if (v21 == 1) {
            goto LABEL_9;
          }
          goto LABEL_5;
        case 4:
          if (v21 == 1) {
LABEL_5:
          }
            [v22 wideEdgeSwipeHitTestWidth];
          else {
LABEL_9:
          }
            [v22 narrowEdgeSwipeHitTestWidth];
          double v27 = v28;
          break;
        default:
          break;
      }
      uint64_t v29 = [v16 floatingConfiguration];
      double v30 = (id *)MEMORY[0x1E4F43630];
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
        uint64_t v31 = 2;
      }
      else {
        uint64_t v31 = 1;
      }
      if (v26 == 1 || v21 != v31 || v29 != 1)
      {
        if ([*v30 userInterfaceLayoutDirection] == 1) {
          uint64_t v32 = 1;
        }
        else {
          uint64_t v32 = 2;
        }
        if (v29 != 2 || v21 != v32 || v26 == 1) {
          double v23 = v27;
        }
        else {
          double v23 = 0.0;
        }
      }
    }
  }
  v40.origin.x = v7;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.height = v13;
  CGFloat v35 = CGRectGetMidX(v40) + v23 * -0.5;

  double v36 = v35;
  double v37 = v9;
  double v38 = v23;
  double v39 = v13;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (CGRect)_edgeSwipeHitTestRectForItemContainer:(id)a3 forPointerTouch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 frame];
  double v8 = v7;
  +[SBNubView height];
  double v10 = v9;
  CGFloat v11 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  double v12 = [v11 appLayout];

  CGFloat v13 = [v6 appLayout];
  int v14 = [v13 itemForLayoutRole:1];
  uint64_t v15 = [v12 layoutRoleForItem:v14];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  int v17 = [WeakRetained isChamoisWindowingUIEnabled];

  [(SBFluidSwitcherGestureManager *)self _paddedHitTestRectForItemContainer:v6 forPointerTouch:v4];
  double v19 = v18;
  double v21 = v20;

  if (v15 == 4)
  {
    double v22 = v10 + v10;
    double v8 = v8 - v10;
  }
  else if (v17)
  {
    if (v4) {
      double v22 = v10;
    }
    else {
      double v22 = v10 + v10;
    }
    if (!v4) {
      double v8 = v8 - v10;
    }
  }
  else
  {
    double v22 = v10;
  }

  double v23 = v19;
  double v24 = v8;
  double v25 = v21;
  double v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (BOOL)_isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v14 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  id v6 = [WeakRetained windowScene];
  double v7 = [v6 systemGestureManager];
  double v8 = [(SBFluidSwitcherGestureManager *)v14 _currentLayoutState];
  int v9 = objc_msgSend(v7, "shouldSystemGestureReceiveTouchWithLocation:", x, y);
  BOOL v10 = SBIsSystemGestureAllowed(v6, 24);
  BOOL v11 = -[SBFluidSwitcherGestureManager _isBannerOccludingRegionAtReferencePoint:](v14, "_isBannerOccludingRegionAtReferencePoint:", x, y);
  uint64_t v12 = [v8 unlockedEnvironmentMode];
  uint64_t v13 = [v8 peekConfiguration];
  LOBYTE(v14) = 0;
  if (v9 && v10 && !v11 && v12 == 3) {
    LODWORD(v14) = !SBPeekConfigurationIsValid(v13);
  }

  return (char)v14;
}

- (id)_hitTestStageItemContainerForUnpinGestureWithTouch:(id)a3 atGestureLocation:(CGPoint)a4
{
  double x = a4.x;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  double v8 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  int v9 = [v8 appLayout];
  __int16 v47 = v6;
  [v6 locationInView:0];
  double v11 = v10;
  double v13 = v12;
  int v14 = [WeakRetained isChamoisWindowingUIEnabled];
  uint64_t v15 = 0;
  if (-[SBFluidSwitcherGestureManager _isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:](self, "_isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:", v11, v13))
  {
    id v52 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    int v16 = [v9 zOrderedItems];
    uint64_t v17 = [v9 centerItem];
    if (v17) {
      char v18 = v14;
    }
    else {
      char v18 = 1;
    }
    int v50 = v14;
    CGFloat v46 = (void *)v17;
    if ((v18 & 1) == 0)
    {
      uint64_t v19 = v17;
      double v20 = [v16 firstObject];
      char v21 = BSEqualObjects();

      if ((v21 & 1) == 0)
      {
        double v22 = (void *)[v16 mutableCopy];
        [v22 removeObject:v19];
        [v22 insertObject:v19 atIndex:0];

        int v16 = v22;
      }
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = v16;
    uint64_t v23 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      __int16 v45 = v8;
      CFTypeRef v49 = 0;
      uint64_t v51 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v55 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          double v27 = [v52 visibleItemContainers];
          double v28 = [v27 allValues];
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          void v53[2] = __102__SBFluidSwitcherGestureManager__hitTestStageItemContainerForUnpinGestureWithTouch_atGestureLocation___block_invoke;
          v53[3] = &unk_1E6AF4EF8;
          v53[4] = v26;
          uint64_t v15 = objc_msgSend(v28, "bs_firstObjectPassingTest:", v53);

          [v15 frame];
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          CGFloat v34 = v33;
          CGFloat v36 = v35;
          double v37 = [v15 appLayout];
          double v38 = [v37 itemForLayoutRole:1];
          double v39 = v9;
          uint64_t v40 = [v9 layoutRoleForItem:v38];

          if (v40)
          {
            v61.origin.double x = v30;
            v61.origin.double y = v32;
            v61.size.width = v34;
            v61.size.height = v36;
            int v9 = v39;
            if (x >= CGRectGetMinX(v61))
            {
              v62.origin.double x = v30;
              v62.origin.double y = v32;
              v62.size.width = v34;
              v62.size.height = v36;
              if (x <= CGRectGetMaxX(v62))
              {
                -[SBFluidSwitcherGestureManager _paddedHitTestRectForItemContainer:forPointerTouch:](self, "_paddedHitTestRectForItemContainer:forPointerTouch:", v15, [v47 _isPointerTouch]);
                int v41 = SBRectContainsPoint();
                if ((v41 & v50) == 1 && v49)
                {
                  if ((CGRegionContainsPoint() & 1) == 0) {
                    goto LABEL_29;
                  }
                }
                else if (v41)
                {
                  goto LABEL_29;
                }
              }
            }
            if (v50)
            {
              CFTypeRef v42 = SBSafeAutoreleasedRegionFromCGRect();
              if (v49)
              {
                UnionWithRegion = (const void *)CGRegionCreateUnionWithRegion();
                CFTypeRef v49 = CFAutorelease(UnionWithRegion);
              }
              else
              {
                CFTypeRef v49 = v42;
              }
            }
          }
          else
          {
            int v9 = v39;
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v24);
      uint64_t v15 = 0;
LABEL_29:
      double v8 = v45;
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  return v15;
}

uint64_t __102__SBFluidSwitcherGestureManager__hitTestStageItemContainerForUnpinGestureWithTouch_atGestureLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 appLayout];
  uint64_t v4 = [v3 containsItem:*(void *)(a1 + 32)];

  return v4;
}

- (CGRect)_floatingApplicationBounds
{
  id v3 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  uint64_t v4 = [v3 interfaceOrientation];
  uint64_t v5 = [v3 floatingConfiguration];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  double v7 = [WeakRetained dataSource];
  if (objc_opt_respondsToSelector())
  {
    [v7 switcherContentController:WeakRetained frameForFloatingAppLayoutInInterfaceOrientation:v4 floatingConfiguration:v5];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v4 = (SBFluidSwitcherPanGestureRecognizer *)a3;
  uint64_t v5 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];
  id v6 = [v5 gestureRecognizer];
  uint64_t v7 = [v6 state];
  if (!v5 || !v6 || (unint64_t)(v7 - 1) > 1)
  {
    double v10 = [(id)SBApp multiDisplayUserInteractionCoordinator];
    double v11 = [v10 activeTouchDownOriginatedWindowScene];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v11)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
        double v13 = [WeakRetained windowScene];
        int v14 = [v13 isEqual:v11];

        if (!v14) {
          goto LABEL_28;
        }
      }
    }
    double v15 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];

    if (v15 == v4)
    {
      BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginBottomEdgePanGesture:v4];
    }
    else if (self->_deckInSwitcherPanGestureRecognizer == v4)
    {
      BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginDeckInSwitcherPanGesture:v4];
    }
    else if ((SBFluidSwitcherPanGestureRecognizer *)self->_fluidScrunchGestureRecognizer == v4)
    {
      BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginFluidScrunchGesture:v4];
    }
    else if (self->_swipeUpFloatingAppGestureRecognizer == v4)
    {
      BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginFloatingApplicationSwipeUpGesture:v4];
    }
    else
    {
      if (self->_moveFloatingApplicationGestureRecognizer == v4) {
        goto LABEL_33;
      }
      if (self->_pinFloatingApplicationGestureRecognizer == v4)
      {
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginFloatingApplicationPinGesture:v4];
        goto LABEL_46;
      }
      if (self->_unpinSplitViewApplicationGestureRecognizer == v4)
      {
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginSplitViewApplicationUnpinGesture:v4];
        goto LABEL_46;
      }
      if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer == v4)
      {
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginIndirectHomePanGesture:v4];
        goto LABEL_46;
      }
      if ((SBFluidSwitcherPanGestureRecognizer *)self->_sceneResizePanGestureRecognizer == v4)
      {
        BOOL v9 = 1;
        goto LABEL_47;
      }
      if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectFloatingAppScrunchGestureRecognizer == v4)
      {
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginIndirectFloatingAppScrunchGesture:v4];
        goto LABEL_46;
      }
      if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectDismissFloatingApplicationGestureRecognizer == v4)
      {
LABEL_33:
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginFloatingApplicationMoveGesture:v4];
      }
      else if (self->_clickAndDragHomeGestureRecognizer == v4)
      {
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginClickAndDragHomeGesture:v4];
      }
      else if (self->_liveWindowResizeGestureRecognizer == v4)
      {
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginLiveWindowResizeGesture:v4];
      }
      else if ((SBFluidSwitcherPanGestureRecognizer *)self->_hoverGestureRecognizer == v4)
      {
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginHoverGesture:v4];
      }
      else if ((SBFluidSwitcherPanGestureRecognizer *)self->_tapToBringItemContainerForwardGestureRecognizer == v4)
      {
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginTapToBringItemContainerForwardGesture:v4];
      }
      else if ((SBFluidSwitcherPanGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer == v4)
      {
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginClickDownToBringItemContainerForwardGesture:v4];
      }
      else if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer == v4)
      {
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginContinuousExposeStripOverflowGesture:v4];
      }
      else
      {
        if (self->_dragContinuousExposeStripOverflowGestureRecognizer != v4)
        {
LABEL_28:
          BOOL v9 = 0;
LABEL_47:

          goto LABEL_48;
        }
        BOOL v16 = [(SBFluidSwitcherGestureManager *)self _shouldBeginContinuousExposeStripOverflowPanGesture:v4];
      }
    }
LABEL_46:
    BOOL v9 = v16;
    goto LABEL_47;
  }
  double v8 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(SBFluidSwitcherGestureManager *)v4 gestureRecognizerShouldBegin:v8];
  }

  BOOL v9 = 0;
LABEL_48:

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = (_UIPassthroughTapGestureRecognizer *)a3;
  uint64_t v7 = (UILongPressGestureRecognizer *)a4;
  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  BOOL v9 = hoverGestureRecognizer == (UIHoverGestureRecognizer *)v6
    || hoverGestureRecognizer == (UIHoverGestureRecognizer *)v7;
  BOOL v10 = v9
     || (self->_tapToBringItemContainerForwardGestureRecognizer == v6
      || (_UIPassthroughTapGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer == v6)
     && (UILongPressGestureRecognizer *)self->_windowMoveClientGateRelationshipGestureRecognizer == v7
     || (_UIPassthroughTapGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer == v6
     && self->_clickDownToBringItemContainerForwardGestureRecognizer == v7;

  return v10;
}

- (BOOL)_shouldBeginBottomEdgePanGesture:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(SBFluidSwitcherGestureManager *)self _currentUnlockedEnvironmentMode];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
  double v8 = SBSafeCast(v6, v7);

  uint64_t v9 = [v8 touchedEdges];
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && ([(SBFZStackParticipant *)zStackParticipant ownsHomeGesture] & 1) == 0)
  {
    double v15 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Preventing the switcher bottom edge gesture because switcher doesn't own the home gesture.", buf, 2u);
    }
    BOOL v16 = @"DeckSwitcherBottomEdgeGestureNotOwned";
  }
  else if ([(SBFluidSwitcherGestureManager *)self _shouldAllowDeckBottomEdgeGestureToRecognizeFromEdges:v9])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    double v12 = [WeakRetained windowScene];
    double v13 = [v12 systemGestureManager];
    char v14 = [v13 isGestureWithTypeAllowed:45];

    if (v14)
    {
      if (v5 != 2 || !SBReduceMotion())
      {
        BOOL v16 = 0;
        BOOL v17 = 1;
        goto LABEL_20;
      }
      double v15 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Preventing the switcher bottom edge gesture because we're in the app switcher in Reduce Motion.", buf, 2u);
      }
      BOOL v16 = @"SwitcherBottomEdgeGesturePreventedInAppSwitcherInReduceMotion";
    }
    else
    {
      double v15 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Preventing the switcher bottom edge gesture because it's not allowed by the system gesture manager.", buf, 2u);
      }
      BOOL v16 = @"SwitcherBottomEdgeGestureNotAllowedBySystemGestureManager";
    }
  }
  else
  {
    double v15 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = v9;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Preventing the switcher bottom edge gesture because the recognized edges (%ld) aren't supported.", buf, 0xCu);
    }
    BOOL v16 = @"DeckSwitcherRecognizedEdgesNotSupported";
  }

  BOOL v17 = 0;
LABEL_20:
  double v18 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__SBFluidSwitcherGestureManager__shouldBeginBottomEdgePanGesture___block_invoke;
  v21[3] = &unk_1E6B02608;
  BOOL v24 = v17;
  id v22 = v4;
  uint64_t v23 = v16;
  id v19 = v4;
  [v18 logBlock:v21];

  return v17;
}

id __66__SBFluidSwitcherGestureManager__shouldBeginBottomEdgePanGesture___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  double v13 = @"[SBFluidSwitcherGestureManager _shouldBeginBottomEdgePanGesture:]";
  v11[0] = @"shouldBegin";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v12[0] = v2;
  v11[1] = @"address";
  id v3 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v12[1] = v3;
  v11[2] = @"name";
  uint64_t v4 = [*(id *)(a1 + 32) name];
  int64_t v5 = (void *)v4;
  uint64_t v6 = &stru_1F3084718;
  if (v4) {
    uint64_t v7 = (__CFString *)v4;
  }
  else {
    uint64_t v7 = &stru_1F3084718;
  }
  v11[3] = @"failureReason";
  if (*(void *)(a1 + 40)) {
    uint64_t v6 = *(__CFString **)(a1 + 40);
  }
  void v12[2] = v7;
  v12[3] = v6;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v14[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  return v9;
}

- (BOOL)_shouldBeginDeckInSwitcherPanGesture:(id)a3
{
  if (SBReduceMotion())
  {
    uint64_t v4 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = 0;
      int64_t v5 = "Preventing the in switcher gesture because reduce motion is enabled.";
      uint64_t v6 = (uint8_t *)&v17;
LABEL_11:
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }
  else if ([(SBFluidSwitcherGestureManager *)self _currentUnlockedEnvironmentMode] == 2)
  {
    deckInSwitcherPanGestureRecognizer = self->_deckInSwitcherPanGestureRecognizer;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    uint64_t v9 = [WeakRetained view];
    [(SBFluidSwitcherPanGestureRecognizer *)deckInSwitcherPanGestureRecognizer velocityInView:v9];
    double v11 = v10;
    double v13 = v12;

    if (fabs(v13) > fabs(v11)) {
      return 1;
    }
    uint64_t v4 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      int64_t v5 = "Preventing the in switcher gesture because we're scrolling horizontally.";
      uint64_t v6 = buf;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v4 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = 0;
      int64_t v5 = "Preventing the in switcher gesture because we're not in in the app switcher.";
      uint64_t v6 = (uint8_t *)&v15;
      goto LABEL_11;
    }
  }

  return 0;
}

- (BOOL)_shouldBeginClickAndDragHomeGesture:(id)a3
{
  id v4 = a3;
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && ([(SBFZStackParticipant *)zStackParticipant ownsHomeGesture] & 1) == 0)
  {
    double v11 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      double v12 = "Preventing the click and drag home gesture because switcher doesn't own the home gesture.";
      double v13 = buf;
      goto LABEL_9;
    }
LABEL_10:

    BOOL v10 = 0;
    goto LABEL_11;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  uint64_t v7 = [WeakRetained windowScene];
  double v8 = [v7 systemGestureManager];
  char v9 = [v8 isGestureWithTypeAllowed:48];

  if ((v9 & 1) == 0)
  {
    double v11 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = 0;
      double v12 = "Preventing the click and drag home gesture because it's not allowed by the system gesture manager.";
      double v13 = (uint8_t *)&v15;
LABEL_9:
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)_shouldBeginLiveWindowResizeGesture:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  if (([WeakRetained isChamoisWindowingUIEnabled] & 1) == 0)
  {
    BOOL v10 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = 0;
      double v13 = "Preventing the live window resize gesture because Chamois isn't enabled.";
      char v14 = (uint8_t *)&v25;
LABEL_13:
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, v13, v14, 2u);
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && ([(SBFZStackParticipant *)zStackParticipant ownsHomeGesture] & 1) == 0)
  {
    BOOL v10 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      double v13 = "Preventing the live window resize gesture because switcher doesn't own the home gesture.";
      char v14 = buf;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v7 = [WeakRetained windowScene];
  double v8 = [v7 systemGestureManager];
  char v9 = [v8 isGestureWithTypeAllowed:48];

  if ((v9 & 1) == 0)
  {
    BOOL v10 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = 0;
      double v13 = "Preventing the live window resize gesture because it's not allowed by the system gesture manager.";
      char v14 = (uint8_t *)&v23;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  BOOL v10 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  double v11 = [v10 itemContainerToResizeUsingPointer];
  if (v11)
  {
    BOOL v12 = 1;
  }
  else
  {
    BOOL v16 = [v10 view];
    _UISystemGestureLocationInView();
    double v18 = v17;
    double v20 = v19;

    BOOL v12 = 1;
    double v11 = -[NSObject _itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:](v10, "_itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:", 1, 1, v18, v20);
    if (!v11)
    {
      char v21 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v22 = 0;
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_INFO, "Preventing the live window resize gesture because no item container.", v22, 2u);
      }

      BOOL v12 = 0;
      double v11 = 0;
    }
  }

LABEL_15:
  return v12;
}

- (BOOL)_shouldBeginTapToBringItemContainerForwardGesture:(id)a3
{
  return [(SBFluidSwitcherGestureManager *)self _shouldBeginBringItemContainerForwardGesture:a3 type:20];
}

- (BOOL)_shouldBeginClickDownToBringItemContainerForwardGesture:(id)a3
{
  id v4 = a3;
  if (![(SBFluidSwitcherGestureManager *)self _shouldBeginBringItemContainerForwardGesture:v4 type:21])
  {
LABEL_7:
    BOOL v5 = 0;
    goto LABEL_8;
  }
  if (([v4 modifierFlags] & 0x100000) != 0)
  {
    uint64_t v6 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Preventing the click down to bring item container forward gesture because the command key is pressed.", v8, 2u);
    }

    goto LABEL_7;
  }
  BOOL v5 = 1;
LABEL_8:

  return v5;
}

- (BOOL)_shouldBeginBringItemContainerForwardGesture:(id)a3 type:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  uint64_t v7 = [WeakRetained windowScene];
  double v8 = [v7 homeScreenController];
  if (([WeakRetained isChamoisWindowingUIEnabled] & 1) == 0)
  {
    BOOL v12 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      double v13 = "Preventing the bring item container forward gesture because Chamois isn't enabled.";
      goto LABEL_15;
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && ([(SBFZStackParticipant *)zStackParticipant ownsHomeGesture] & 1) == 0)
  {
    BOOL v12 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      double v13 = "Preventing the bring item container forward gesture because switcher doesn't own the home gesture.";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  BOOL v10 = [v7 systemGestureManager];
  char v11 = [v10 isGestureWithTypeAllowed:a4];

  if ((v11 & 1) == 0)
  {
    BOOL v12 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      double v13 = "Preventing the bring item container forward gesture because it's not allowed by the system gesture manager.";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v8)
  {
    if ([v8 areAnyIconViewContextMenusShowing]) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v16 = +[SBIconController sharedInstance];
    char v17 = [v16 areAnyIconViewContextMenusShowing];

    if (v17)
    {
LABEL_7:
      BOOL v12 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        double v13 = "Preventing the bring item container forward gesture because icon is showing context menu.";
LABEL_15:
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v21, 2u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  double v18 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  uint64_t v19 = [v18 unlockedEnvironmentMode];
  BOOL v14 = v19 == 3;

  BOOL v12 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v20 = @"NO";
    if (v19 == 3) {
      double v20 = @"YES";
    }
    int v21 = 138412290;
    id v22 = v20;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Should begin bring item container forward:%@", (uint8_t *)&v21, 0xCu);
  }
LABEL_17:

  return v14;
}

- (BOOL)_shouldBeginHoverGesture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  if (([WeakRetained isChamoisWindowingUIEnabled] & 1) == 0)
  {
    char v11 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = 0;
      BOOL v12 = "Preventing the hover gesture because Chamois isn't enabled.";
      double v13 = (uint8_t *)&v17;
LABEL_12:
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
    }
LABEL_13:

    BOOL v10 = 0;
    goto LABEL_14;
  }
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && ([(SBFZStackParticipant *)zStackParticipant ownsHomeGesture] & 1) == 0)
  {
    char v11 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      BOOL v12 = "Preventing the hover gesture because switcher doesn't own the home gesture.";
      double v13 = buf;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v6 = [WeakRetained windowScene];
  uint64_t v7 = [v6 systemGestureManager];
  char v8 = [v7 isGestureWithTypeAllowed:53];

  if ((v8 & 1) == 0)
  {
    char v11 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = 0;
      BOOL v12 = "Preventing the hover gesture because it's not allowed by the system gesture manager.";
      double v13 = (uint8_t *)&v15;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  char v9 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  BOOL v10 = [v9 unlockedEnvironmentMode] == 3;

LABEL_14:
  return v10;
}

- (BOOL)_shouldBeginIndirectHomePanGesture:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  uint64_t v6 = [WeakRetained windowScene];

  uint64_t v7 = [v6 floatingDockController];
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && ([(SBFZStackParticipant *)zStackParticipant ownsHomeGesture] & 1) == 0)
  {
    BOOL v14 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      __int16 v15 = "Preventing the indirect home pan gesture because switcher doesn't own the home gesture.";
      BOOL v16 = buf;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  char v9 = [v6 systemGestureManager];
  char v10 = [v9 isGestureWithTypeAllowed:41];

  if (v10)
  {
    char v11 = +[SBSetupManager sharedInstance];
    if ([v11 isInSetupMode])
    {
      BOOL v12 = +[SBSetupManager sharedInstance];
      char v13 = [v12 isInSetupModeReadyToExit];

      if ((v13 & 1) == 0)
      {
        BOOL v14 = SBLogSystemGestureAppSwitcher();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          __int16 v38 = 0;
          __int16 v15 = "Preventing the indirect home pan gesture because Buddy is not ready to exit.";
          BOOL v16 = (uint8_t *)&v38;
LABEL_12:
          _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, v15, v16, 2u);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else
    {
    }
    if (([v7 isFloatingDockFullyPresented] & 1) == 0)
    {
      uint64_t v19 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
      if ([v19 isFloatingSwitcherVisible])
      {
      }
      else
      {
        double v20 = +[SBSetupManager sharedInstance];
        char v21 = [v20 isInSetupMode];

        if ((v21 & 1) == 0)
        {
          BOOL v14 = SBLogSystemGestureAppSwitcher();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
            goto LABEL_13;
          }
          __int16 v37 = 0;
          __int16 v15 = "Preventing the indirect home pan gesture because the floating dock is not fully presented.";
          BOOL v16 = (uint8_t *)&v37;
          goto LABEL_12;
        }
      }
    }
    if ([v4 currentInputType] != 1)
    {
      BOOL v17 = 1;
      goto LABEL_15;
    }
    BOOL v14 = [v7 presentFloatingDockIndirectPanGestureRecognizer];
    BSContinuousMachTimeNow();
    double v23 = v22;
    [v14 lastMouseActivationTimestamp];
    double v25 = v23 - v24;
    uint64_t v26 = +[SBCoverSheetPresentationManager sharedInstance];
    uint64_t v27 = [v26 coverSheetSlidingViewController];
    double v28 = [v27 indirectDismissGestureRecognizer];

    BSContinuousMachTimeNow();
    double v30 = v29;
    [v28 lastMouseActivationTimestamp];
    if (v25 >= 0.25)
    {
      if (v30 - v31 >= 0.5)
      {
        BOOL v17 = 1;
        goto LABEL_34;
      }
      CGFloat v32 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        __int16 v35 = 0;
        double v33 = "Preventing the indirect home pan gesture because the dismiss cover sheet gesture was recently activated by a mouse.";
        CGFloat v34 = (uint8_t *)&v35;
        goto LABEL_29;
      }
    }
    else
    {
      CGFloat v32 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        __int16 v36 = 0;
        double v33 = "Preventing the indirect home pan gesture because the dock gesture was recently activated by a mouse.";
        CGFloat v34 = (uint8_t *)&v36;
LABEL_29:
        _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_INFO, v33, v34, 2u);
      }
    }

    BOOL v17 = 0;
LABEL_34:

    goto LABEL_14;
  }
  BOOL v14 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v39 = 0;
    __int16 v15 = "Preventing the indirect home pan gesture because it's not allowed by the system gesture manager.";
    BOOL v16 = (uint8_t *)&v39;
    goto LABEL_12;
  }
LABEL_13:
  BOOL v17 = 0;
LABEL_14:

LABEL_15:
  return v17;
}

- (BOOL)_shouldBeginIndirectFloatingAppScrunchGesture:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  BOOL v4 = [(SBFluidSwitcherGestureManager *)self _shouldAllowFloatingApplicationGesture:a3 gestureType:19 failureReason:&v16];
  id v5 = v16;
  if (!v4)
  {
    char v11 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      BOOL v12 = "Preventing the floating app scrunch gesture because: %@.";
      char v13 = v11;
      uint32_t v14 = 12;
LABEL_8:
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
    }
LABEL_9:

    BOOL v10 = 0;
    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  uint64_t v7 = [WeakRetained windowScene];
  char v8 = [v7 systemGestureManager];
  char v9 = [v8 isGestureWithTypeAllowed:19];

  if ((v9 & 1) == 0)
  {
    char v11 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      BOOL v12 = "Preventing the floating app scrunch gesture because it's not allowed by the system gesture manager.";
      char v13 = v11;
      uint32_t v14 = 2;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v10 = 1;
LABEL_10:

  return v10;
}

- (BOOL)_shouldBeginFluidScrunchGesture:(id)a3
{
  id v4 = a3;
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && ([(SBFZStackParticipant *)zStackParticipant ownsHomeGesture] & 1) == 0)
  {
    BOOL v10 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      char v11 = "Preventing the scrunch gesture because switcher doesn't own the home gesture.";
      BOOL v12 = buf;
      goto LABEL_11;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    uint64_t v7 = [WeakRetained windowScene];
    char v8 = [v7 systemGestureManager];
    char v9 = [v8 isGestureWithTypeAllowed:18];

    if (v9)
    {
      if (![(id)SBApp isTypingActive])
      {
        BOOL v13 = 1;
        goto LABEL_13;
      }
      BOOL v10 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = 0;
        char v11 = "Preventing the scrunch gesture because typing is active.";
        BOOL v12 = (uint8_t *)&v15;
LABEL_11:
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
      }
    }
    else
    {
      BOOL v10 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = 0;
        char v11 = "Preventing the scrunch gesture because it's not allowed by the system gesture manager.";
        BOOL v12 = (uint8_t *)&v16;
        goto LABEL_11;
      }
    }
  }

  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)_shouldAllowFloatingApplicationGesture:(id)a3 gestureType:(unint64_t)a4 failureReason:(id *)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  int v8 = [WeakRetained isChamoisWindowingUIEnabled];

  if (!v8)
  {
    BOOL v10 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
    char v11 = [(SBFluidSwitcherGestureManager *)self _firstFloatingAppLayout];

    if (v11)
    {
      if ([v10 unlockedEnvironmentMode] == 3)
      {
        if (SBPeekConfigurationIsValid([v10 peekConfiguration]))
        {
          BOOL v9 = 0;
          BOOL v12 = @"InPeekState";
          if (!a5) {
            goto LABEL_17;
          }
        }
        else
        {
          zStackParticipant = self->_zStackParticipant;
          if (zStackParticipant)
          {
            uint64_t v14 = [(SBFZStackParticipant *)zStackParticipant activationState];
            BOOL v9 = v14 == 0;
            BOOL v12 = @"NotForegroundActiveInZStack";
            if (!v14) {
              BOOL v12 = 0;
            }
            if (!a5) {
              goto LABEL_17;
            }
          }
          else
          {
            BOOL v12 = 0;
            BOOL v9 = 1;
            if (!a5) {
              goto LABEL_17;
            }
          }
        }
      }
      else
      {
        BOOL v9 = 0;
        BOOL v12 = @"NotInApplication";
        if (!a5) {
          goto LABEL_17;
        }
      }
    }
    else
    {
      BOOL v9 = 0;
      BOOL v12 = @"NoFloatingAppLayouts";
      if (!a5) {
        goto LABEL_17;
      }
    }
    *a5 = v12;
LABEL_17:

    return v9;
  }
  BOOL v9 = 0;
  *a5 = @"chamois is enabled";
  return v9;
}

- (BOOL)_shouldBeginFloatingApplicationSwipeUpGesture:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v24 = 0;
  BOOL v5 = [(SBFluidSwitcherGestureManager *)self _shouldAllowFloatingApplicationGesture:v4 gestureType:32 failureReason:&v24];
  id v6 = v24;
  if (!v5)
  {
    BOOL v12 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      BOOL v13 = "Preventing the floating app swipe up gesture because: %@.";
      uint64_t v14 = v12;
      uint32_t v15 = 12;
LABEL_8:
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
    }
LABEL_9:

    BOOL v11 = 0;
    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  int v8 = [WeakRetained windowScene];
  BOOL v9 = [v8 systemGestureManager];
  char v10 = [v9 isGestureWithTypeAllowed:32];

  if ((v10 & 1) == 0)
  {
    BOOL v12 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      BOOL v13 = "Preventing the floating app swipe up gesture because it's not allowed by the system gesture manager.";
      uint64_t v14 = v12;
      uint32_t v15 = 2;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_10:
  __int16 v16 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationSwipeUpGesture___block_invoke;
  v20[3] = &unk_1E6B02608;
  BOOL v23 = v11;
  id v21 = v4;
  id v22 = v6;
  id v17 = v6;
  id v18 = v4;
  [v16 logBlock:v20];

  return v11;
}

id __79__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationSwipeUpGesture___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL v13 = @"[SBFluidSwitcherGestureManager _shouldBeginFloatingApplicationSwipeUpGesture:]";
  v11[0] = @"shouldBegin";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v12[0] = v2;
  v11[1] = @"address";
  id v3 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v12[1] = v3;
  v11[2] = @"name";
  uint64_t v4 = [*(id *)(a1 + 32) name];
  BOOL v5 = (void *)v4;
  id v6 = &stru_1F3084718;
  if (v4) {
    uint64_t v7 = (__CFString *)v4;
  }
  else {
    uint64_t v7 = &stru_1F3084718;
  }
  v11[3] = @"failureReason";
  if (*(void *)(a1 + 40)) {
    id v6 = *(__CFString **)(a1 + 40);
  }
  void v12[2] = v7;
  v12[3] = v6;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v14[0] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  return v9;
}

- (BOOL)_shouldBeginFloatingApplicationPresentGesture:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];

  if (v5 == v4) {
    uint64_t v6 = 42;
  }
  else {
    uint64_t v6 = 25;
  }
  id v52 = 0;
  BOOL v7 = [(SBFluidSwitcherGestureManager *)self _shouldAllowFloatingApplicationGesture:v4 gestureType:v6 failureReason:&v52];
  id v8 = v52;
  if (!v7)
  {
    BOOL v9 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v8;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Preventing the right floating app present gesture because: %@.", buf, 0xCu);
    }
  }
  id v10 = [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];

  if (!v7)
  {
    int v20 = 0;
    id v13 = v8;
    goto LABEL_22;
  }
  if (v10 == v4) {
    uint64_t v11 = 43;
  }
  else {
    uint64_t v11 = 26;
  }
  id v51 = v8;
  BOOL v12 = [(SBFluidSwitcherGestureManager *)self _shouldAllowFloatingApplicationGesture:v4 gestureType:v11 failureReason:&v51];
  id v13 = v51;

  if (!v12)
  {
    __int16 v16 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v13;
      id v17 = "Preventing the left floating app present gesture because: %@.";
      id v18 = v16;
      uint32_t v19 = 12;
      goto LABEL_19;
    }
LABEL_20:

    int v20 = 0;
    goto LABEL_22;
  }
  uint64_t v14 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  int v15 = [v14 isFloatingSwitcherVisible];

  if (v15)
  {
    __int16 v16 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v17 = "Preventing the floating app present gesture because the floating switcher is presented.";
      id v18 = v16;
      uint32_t v19 = 2;
LABEL_19:
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  int v20 = 1;
LABEL_22:
  id v21 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  uint64_t v22 = [v21 floatingConfiguration];

  if (v20)
  {
    if (!SBFloatingConfigurationIsStashed(v22) && v22)
    {
      BOOL v23 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v24 = "Preventing the floating app present gesture because the floating app is not stashed / undefined.";
LABEL_38:
        _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_INFO, v24, buf, 2u);
        goto LABEL_39;
      }
      goto LABEL_39;
    }
    if (v10 == v4
      || ([(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue edgePullGestureRecognizer], id v26 = (id)objc_claimAutoreleasedReturnValue(), v27 = v26 == v4, v26, v27))
    {
      if (v22 != 3)
      {
        BOOL v23 = SBLogSystemGestureAppSwitcher();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v24 = "Preventing the floating app present gesture from the left edge because the floating app is not stashed on the left.";
          goto LABEL_38;
        }
LABEL_39:
        LOBYTE(v25) = 0;
        goto LABEL_40;
      }
    }
    if (v5 == v4
      || ([(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue edgePullGestureRecognizer], id v28 = (id)objc_claimAutoreleasedReturnValue(), v29 = v28 == v4, v28, v29))
    {
      if ((v22 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        BOOL v23 = SBLogSystemGestureAppSwitcher();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v24 = "Preventing the floating app present gesture from the right edge because the floating app is not stashed on the right.";
          goto LABEL_38;
        }
        goto LABEL_39;
      }
    }
    if (v5 != v4)
    {
      LOBYTE(v25) = 1;
LABEL_51:
      if (v10 != v4) {
        goto LABEL_41;
      }
      BOOL v23 = [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];
      if ([v23 currentInputType] != 1)
      {
        LOBYTE(v25) = 1;
        goto LABEL_40;
      }
      int v41 = self->_indirectDismissFloatingApplicationGestureRecognizer;
      BSContinuousMachTimeNow();
      double v43 = v42;
      [(SBIndirectPanGestureRecognizer *)v41 lastMouseActivationTimestamp];
      double v45 = v44;

      LOBYTE(v25) = v43 - v45 >= 0.75;
      if (v43 - v45 >= 0.75)
      {
LABEL_40:

        goto LABEL_41;
      }
      CGFloat v46 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v46, OS_LOG_TYPE_INFO, "Preventing the left indirect floating app present gesture because the dismiss gesture was very recently activated with a mouse.", buf, 2u);
      }

      goto LABEL_39;
    }
    CGFloat v34 = [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];
    if ([v34 currentInputType] == 1
      && (__int16 v35 = self->_indirectDismissFloatingApplicationGestureRecognizer,
          BSContinuousMachTimeNow(),
          double v37 = v36,
          [(SBIndirectPanGestureRecognizer *)v35 lastMouseActivationTimestamp],
          double v39 = v38,
          v35,
          v37 - v39 < 0.75))
    {
      uint64_t v40 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_INFO, "Preventing the right indirect floating app present gesture because the dismiss gesture was very recently activated with a mouse.", buf, 2u);
      }

      BOOL v25 = 0;
    }
    else
    {
      BOOL v25 = 1;
    }

    if (v25) {
      goto LABEL_51;
    }
  }
  else
  {
    LOBYTE(v25) = 0;
  }
LABEL_41:
  double v30 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __79__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationPresentGesture___block_invoke;
  v47[3] = &unk_1E6B02608;
  BOOL v50 = v25;
  id v48 = v4;
  id v49 = v13;
  id v31 = v13;
  id v32 = v4;
  [v30 logBlock:v47];

  return v25;
}

id __79__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationPresentGesture___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v13 = @"[SBFluidSwitcherGestureManager _shouldBeginFloatingApplicationPresentGesture:]";
  v11[0] = @"shouldBegin";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v12[0] = v2;
  v11[1] = @"address";
  id v3 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v12[1] = v3;
  v11[2] = @"name";
  uint64_t v4 = [*(id *)(a1 + 32) name];
  id v5 = (void *)v4;
  uint64_t v6 = &stru_1F3084718;
  if (v4) {
    BOOL v7 = (__CFString *)v4;
  }
  else {
    BOOL v7 = &stru_1F3084718;
  }
  v11[3] = @"failureReason";
  if (*(void *)(a1 + 40)) {
    uint64_t v6 = *(__CFString **)(a1 + 40);
  }
  void v12[2] = v7;
  v12[3] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v14[0] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  return v9;
}

- (BOOL)_shouldBeginFloatingApplicationMoveGesture:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (SBIndirectPanGestureRecognizer *)a3;
  id v32 = 0;
  BOOL v5 = [(SBFluidSwitcherGestureManager *)self _shouldAllowFloatingApplicationGesture:v4 gestureType:29 failureReason:&v32];
  id v6 = v32;
  if (v5)
  {
    BOOL v7 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
    if (![v7 isFloatingSwitcherVisible])
    {
      BOOL v10 = 1;
      goto LABEL_11;
    }
    id v8 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Preventing the floating app present move because the floating switcher is presented.", buf, 2u);
    }
  }
  else
  {
    BOOL v9 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Preventing the floating app move gesture because: %@.", buf, 0xCu);
    }

    BOOL v7 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  }
  BOOL v10 = 0;
LABEL_11:
  uint64_t v11 = [v7 elementWithRole:3];
  BOOL v12 = (void *)v11;
  if (!v10 || v11)
  {
    if (v10)
    {
      if (self->_indirectDismissFloatingApplicationGestureRecognizer == v4)
      {
        if ([(SBIndirectPanGestureRecognizer *)v4 currentInputType] == 1)
        {
          uint64_t v14 = [(SBFluidSwitcherGestureManager *)self _indirectPresentFloatingAppGestureRecognizerForEdge:[(SBIndirectPanGestureRecognizer *)self->_indirectDismissFloatingApplicationGestureRecognizer activatedEdge]];
          BSContinuousMachTimeNow();
          double v16 = v15;
          [v14 lastMouseActivationTimestamp];
          double v18 = v16 - v17;
          BOOL v10 = v18 >= 0.75;
          if (v18 < 0.75)
          {
            uint32_t v19 = SBLogSystemGestureAppSwitcher();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, "Preventing the indirect floating app dismiss gesture because the present gesture was very recently activated with a mouse.", buf, 2u);
            }
          }
        }
        else
        {
          BOOL v10 = 1;
        }
        uint64_t v20 = objc_opt_class();
        id v21 = SBSafeCast(v20, v4);
        uint64_t v22 = v21;
        if (v10 && v21)
        {
          uint64_t v23 = -[SBFluidSwitcherGestureManager _floatingConfigurationForActivatedEdge:](self, "_floatingConfigurationForActivatedEdge:", [v21 activatedEdge]);
          uint64_t v24 = [v7 floatingConfiguration];
          if (SBFloatingConfigurationIsValid(v23) && v24 == v23)
          {
            LOBYTE(v10) = 1;
          }
          else
          {
            BOOL v25 = SBLogSystemGestureAppSwitcher();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_INFO, "Preventing the indirect floating app dismiss gesture because it is at the opposite end of the visible SlideOver.", buf, 2u);
            }

            LOBYTE(v10) = 0;
          }
        }
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
    id v26 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __76__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationMoveGesture___block_invoke;
    v28[3] = &unk_1E6B02608;
    BOOL v31 = v10;
    BOOL v29 = v4;
    id v30 = v6;
    [v26 logBlock:v28];

    p_super = &v29->super.super;
  }
  else
  {
    p_super = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, p_super, OS_LOG_TYPE_INFO, "Preventing the floating app move gesture because there's no floating app.", buf, 2u);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

id __76__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationMoveGesture___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v13 = @"[SBFluidSwitcherGestureManager _shouldBeginFloatingApplicationMoveGesture:]";
  v11[0] = @"shouldBegin";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v12[0] = v2;
  v11[1] = @"address";
  id v3 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v12[1] = v3;
  v11[2] = @"name";
  uint64_t v4 = [*(id *)(a1 + 32) name];
  BOOL v5 = (void *)v4;
  id v6 = &stru_1F3084718;
  if (v4) {
    BOOL v7 = (__CFString *)v4;
  }
  else {
    BOOL v7 = &stru_1F3084718;
  }
  v11[3] = @"failureReason";
  if (*(void *)(a1 + 40)) {
    id v6 = *(__CFString **)(a1 + 40);
  }
  void v12[2] = v7;
  v12[3] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v14[0] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  return v9;
}

- (int64_t)_floatingConfigurationForActivatedEdge:(unint64_t)a3
{
  if (a3 == 8)
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else if (a3 == 2)
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else
  {
    return 0;
  }
}

- (BOOL)_shouldBeginFloatingApplicationPinGesture:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  BOOL v4 = [(SBFluidSwitcherGestureManager *)self _shouldAllowFloatingApplicationGesture:a3 gestureType:30 failureReason:&v14];
  id v5 = v14;
  if (!v4)
  {
    id v8 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      BOOL v9 = "Preventing the floating app pin gesture because: %@.";
      BOOL v10 = v8;
      uint32_t v11 = 12;
LABEL_12:
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v6 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  int v7 = [v6 isFloatingSwitcherVisible];

  if (v7)
  {
    id v8 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      BOOL v9 = "Preventing the floating app pin gesture because the floating switcher is presented.";
LABEL_11:
      BOOL v10 = v8;
      uint32_t v11 = 2;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (![(SBFluidSwitcherDragAndDropManager *)self->_fluidDragAndDropManager shouldBeginWindowDragGesture])
  {
    id v8 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      BOOL v9 = "Preventing the floating app pin gesture because the drag and drop interaction manager prevents it.";
      goto LABEL_11;
    }
LABEL_13:

    BOOL v12 = 0;
    goto LABEL_14;
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)_shouldBeginSplitViewApplicationUnpinGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  int v7 = [v4 initialTouchLeafAppLayout];

  id v8 = [WeakRetained adjustedAppLayoutForLeafAppLayout:v7];
  BOOL v9 = 0;
  if (v7 && v8)
  {
    id v32 = v8;
    BOOL v10 = [v7 itemForLayoutRole:1];
    uint32_t v11 = +[SBApplicationController sharedInstance];
    BOOL v12 = [v10 bundleIdentifier];
    id v13 = [v11 applicationWithBundleIdentifier:v12];

    double v33 = v10;
    id v14 = [v10 uniqueIdentifier];
    double v15 = [v5 elementWithIdentifier:v14];

    BOOL v31 = v15;
    id v16 = [v15 workspaceEntity];
    uint64_t v17 = [v16 deviceApplicationSceneEntity];

    id v30 = v17;
    double v18 = [v17 sceneHandle];
    id v19 = objc_loadWeakRetained((id *)&self->_switcherController);
    uint64_t v20 = [v5 appLayout];
    id v28 = [v19 windowScene];
    BOOL v29 = (void *)v20;
    -[SBDisplayItemLayoutAttributesCalculator frameForLayoutRole:inAppLayout:containerOrientation:windowScene:](self->_displayItemLayoutAttributesCalculator, "frameForLayoutRole:inAppLayout:containerOrientation:windowScene:", 1, v20, [v5 interfaceOrientation], v28);
    id v21 = [WeakRetained view];
    [v21 bounds];

    int v22 = BSSizeEqualToSize();
    int v23 = [v19 isChamoisWindowingUIEnabled];
    uint64_t v24 = [v19 windowManagementStyle];
    BOOL v25 = [v19 displayIdentity];
    LODWORD(v24) = [v13 supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:v24 displayIdentity:v25];

    if (!v24
      || ([v18 screenEdgesDeferringSystemGestures] & 1) != 0 && ((v23 ^ 1 | v22) & 1) != 0
      || SBGuidedAccessIsActive())
    {
      id v26 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_INFO, "Preventing the split view unpin gesture because the drag and drop interaction manager prevents it.", buf, 2u);
      }

      BOOL v9 = 0;
    }
    else
    {
      BOOL v9 = 1;
    }

    id v8 = v32;
  }

  return v9;
}

- (BOOL)_shouldBeginContinuousExposeStripRevealGesture:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  BOOL v4 = [(SBFluidSwitcherGestureManager *)self _areContinuousExposeStripsAvailableWithReason:&v12];
  id v5 = v12;
  if (v4)
  {
    id v11 = 0;
    BOOL v6 = [(SBFluidSwitcherGestureManager *)self _areContinuousExposeStripsOccludedOrHiddenWithOutReason:&v11];
    int v7 = v11;
    id v8 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543618;
      id v14 = v9;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Begin continuous expose strip reveal gesture '%{public}@' because '%{public}@'", buf, 0x16u);
    }
  }
  else
  {
    int v7 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Won't begin continuous expose strip reveal gesture because '%{public}@'", buf, 0xCu);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldBeginContinuousExposeStripOverflowGesture:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  BOOL v4 = [(SBFluidSwitcherGestureManager *)self _areContinuousExposeStripsAvailableWithReason:&v13];
  id v5 = v13;
  if (v4)
  {
    id v12 = 0;
    BOOL v6 = [(SBFluidSwitcherGestureManager *)self _areContinuousExposeStripsOccludedOrHiddenWithOutReason:&v12];
    int v7 = v12;
    BOOL v8 = !v6;
    BOOL v9 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543618;
      id v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Begin continuous expose strip overflow gesture '%{public}@' because '%{public}@'", buf, 0x16u);
    }
  }
  else
  {
    int v7 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v5;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Won't begin continuous expose strip overflow gesture because '%{public}@'", buf, 0xCu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldBeginContinuousExposeStripOverflowPanGesture:(id)a3
{
  id v3 = self;
  p_switcherContentController = &self->_switcherContentController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  int v7 = [WeakRetained view];

  [v5 velocityInView:v7];
  double v9 = v8;
  double v11 = v10;
  [v5 locationInView:v7];
  [v7 size];
  int v12 = BSFloatLessThanOrEqualToFloat();
  LOBYTE(v3) = [(SBFluidSwitcherGestureManager *)v3 _shouldBeginContinuousExposeStripOverflowGesture:v5];

  if (v3)
  {
    if (v9 < 0.0) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    if (v9 <= 0.0) {
      int v14 = 1;
    }
    else {
      int v14 = v12;
    }
    BOOL v15 = v13 == 1 || v14 == 0;
    double v16 = fabs(v11);
    double v17 = fabs(v9);
    if (!v15 && v16 <= v17)
    {
      BOOL v22 = 1;
      goto LABEL_21;
    }
    id v19 = SBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v24 = 0;
      uint64_t v20 = "Preventing the reveal overflow pan gesture because we're moving out or vertically.";
      id v21 = (uint8_t *)&v24;
LABEL_19:
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, v20, v21, 2u);
    }
  }
  else
  {
    id v19 = SBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = "Preventing the reveal overflow pan gesture because the reveal overflow gesture is disabled.";
      id v21 = buf;
      goto LABEL_19;
    }
  }

  BOOL v22 = 0;
LABEL_21:

  return v22;
}

- (int64_t)_gestureTypeForGestureRecognizer:(id)a3
{
  id v5 = (SBFluidSwitcherPanGestureRecognizer *)a3;
  BOOL v6 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
  if (v6 == v5
    || self->_deckInSwitcherPanGestureRecognizer == v5
    || (SBFluidSwitcherPanGestureRecognizer *)self->_fluidScrunchGestureRecognizer == v5
    || (SBFluidSwitcherPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer == v5)
  {
  }
  else
  {
    clickAndDragHomeGestureRecognizer = self->_clickAndDragHomeGestureRecognizer;

    if (clickAndDragHomeGestureRecognizer != v5)
    {
      if (self->_swipeUpFloatingAppGestureRecognizer == v5
        || (SBFluidSwitcherPanGestureRecognizer *)self->_indirectFloatingAppScrunchGestureRecognizer == v5)
      {
        int v23 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
        int v24 = [v23 isFloatingSwitcherVisible];

        if (v24) {
          int64_t v19 = 5;
        }
        else {
          int64_t v19 = 3;
        }
        goto LABEL_30;
      }
      uint64_t v8 = [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue edgePullGestureRecognizer];
      if ((SBFluidSwitcherPanGestureRecognizer *)v8 != v5)
      {
        double v9 = (void *)v8;
        double v10 = [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue edgePullGestureRecognizer];
        if (v10 != v5 && self->_moveFloatingApplicationGestureRecognizer != v5)
        {
          uint64_t v11 = [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];
          if ((SBFluidSwitcherPanGestureRecognizer *)v11 == v5)
          {
          }
          else
          {
            int v12 = (void *)v11;
            int v13 = [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];
            if (v13 != v5)
            {
              indirectDismissFloatingApplicationGestureRecognizer = self->_indirectDismissFloatingApplicationGestureRecognizer;

              if (indirectDismissFloatingApplicationGestureRecognizer != (SBIndirectPanGestureRecognizer *)v5)
              {
                if ((SBFluidSwitcherPanGestureRecognizer *)self->_sceneResizePanGestureRecognizer == v5)
                {
                  int64_t v19 = 7;
                  goto LABEL_30;
                }
                if (self->_unpinSplitViewApplicationGestureRecognizer == v5
                  || self->_pinFloatingApplicationGestureRecognizer == v5)
                {
                  int64_t v19 = 8;
                  goto LABEL_30;
                }
                if (self->_liveWindowResizeGestureRecognizer == v5)
                {
                  int64_t v19 = 9;
                  goto LABEL_30;
                }
                uint64_t v15 = [(SBGrabberTongue *)self->_continuousExposeStripRevealGrabberTongue edgePullGestureRecognizer];
                if ((SBFluidSwitcherPanGestureRecognizer *)v15 == v5)
                {
                }
                else
                {
                  double v16 = (void *)v15;
                  double v17 = [(SBGrabberTongue *)self->_continuousExposeStripRevealGrabberTongue indirectEdgePullGestureRecognizer];

                  if (v17 != v5)
                  {
                    if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer == v5
                      || self->_dragContinuousExposeStripOverflowGestureRecognizer == v5)
                    {
                      int64_t v19 = 11;
                    }
                    else
                    {
                      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
                      [v18 handleFailureInMethod:a2, self, @"SBFluidSwitcherGestureManager.m", 2726, @"Gesture recognizer (%@) doesn't correspond to a valid SBFluidSwitcherGestureType.", v5 object file lineNumber description];

                      int64_t v19 = 0;
                    }
                    goto LABEL_30;
                  }
                }
                int64_t v19 = 10;
                goto LABEL_30;
              }
LABEL_38:
              int64_t v19 = 4;
              goto LABEL_30;
            }
          }
        }

        goto LABEL_38;
      }

      goto LABEL_38;
    }
  }
  if ([(SBFluidSwitcherGestureManager *)self _currentUnlockedEnvironmentMode] == 2
    && [(SBAppSwitcherSettings *)self->_appSwitcherSettings effectiveSwitcherStyle] == 2)
  {
    int64_t v19 = 2;
  }
  else
  {
    uint64_t v20 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
    int v21 = [v20 isFloatingSwitcherVisible];

    if (v21) {
      int64_t v19 = 5;
    }
    else {
      int64_t v19 = 1;
    }
  }
LABEL_30:

  return v19;
}

- (Class)_fluidSwitcherGestureTransactionClassForGestureType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      BOOL v4 = objc_opt_class();
      goto LABEL_7;
    case 6:
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherGestureManager.m" lineNumber:2750 description:@"SBFluidSwitcherGestureTypeDragAndDrop is handled by the SBFluidSwitcherDragAndDropManager."];

      BOOL v4 = 0;
LABEL_7:
      break;
    default:
      BOOL v4 = 0;
      break;
  }
  return (Class)v4;
}

- (BOOL)_isTransactionRunningForGestureRecognizer:(id)a3
{
  id v4 = a3;
  [(SBFluidSwitcherGestureManager *)self _fluidSwitcherGestureTransactionClassForGestureType:[(SBFluidSwitcherGestureManager *)self _gestureTypeForGestureRecognizer:v4]];
  id v5 = [(SBFluidSwitcherGestureManager *)self activeGestureTransaction];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = [v5 gestureRecognizer];
    if (v7 == v4) {
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_hideGrabberAnimated:(BOOL)a3
{
}

- (BOOL)_isEdgeLocationInHomeAffordanceRegion:(double)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = self->_currentHomeGrabberViews;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    p_switcherContentController = &self->_switcherContentController;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
        objc_msgSend(WeakRetained, "containerViewBoundsForHomeGrabberView:", v11, (void)v28);
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;

        v34.origin.double x = v14;
        v34.origin.double y = v16;
        v34.size.width = v18;
        v34.size.height = v20;
        double Width = CGRectGetWidth(v34);
        objc_msgSend(v11, "suggestedSizeForContentWidth:");
        double v23 = (Width - v22) * 0.5;
        double v24 = (Width + v22) * 0.5;
        if (v23 <= a3 && v24 >= a3)
        {
          BOOL v26 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16, v24);
    }
    while (v7);
  }
  BOOL v26 = 0;
LABEL_14:

  return v26;
}

- (id)_deviceApplicationSceneEntityForFloatingApplicationGrabberTongue
{
  v2 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  BOOL IsSplitView = SBSpaceConfigurationIsSplitView([v2 spaceConfiguration]);
  id v4 = &SBLayoutRoleSide;
  if (!IsSplitView) {
    id v4 = &SBLayoutRolePrimary;
  }
  id v5 = [v2 elementWithRole:*v4];
  uint64_t v6 = [v5 workspaceEntity];
  uint64_t v7 = [v6 deviceApplicationSceneEntity];

  return v7;
}

- (BOOL)_edgeLocationIsOutsideFloatingApplicationGrabberFreeRegion:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v5 = [WeakRetained view];
  [v5 bounds];
  double MidY = CGRectGetMidY(v8);

  return MidY + 125.0 < a3 || MidY + -125.0 > a3;
}

- (BOOL)_shouldAllowDeckBottomEdgeGestureToRecognizeFromEdges:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  if ((a3 & 4) != 0)
  {
    BOOL v6 = 1;
    char v27 = 1;
  }
  else if (a3)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v5 = [(SBFluidSwitcherGestureManager *)self _currentFloatingAppLayout];
    if (v5 && (v5, (v3 & 0xA) != 0))
    {
      BOOL v6 = 0;
      *((unsigned char *)v25 + 24) = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
      CGRect v8 = [WeakRetained layoutContext];
      int8x8_t v9 = (int8x8_t)[v8 supportedOrientationsForGesture];

      uint64_t v10 = objc_opt_class();
      uint64_t v11 = [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
      int v12 = SBSafeCast(v10, v11);

      [v12 _touchInterfaceOrientation];
      uint64_t v13 = _screenRegionGivenInterfaceOrientedRegion();
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      CGFloat v20 = (void (*)(void *))__87__SBFluidSwitcherGestureManager__shouldAllowDeckBottomEdgeGestureToRecognizeFromEdges___block_invoke;
      int v21 = &unk_1E6AF94C0;
      double v22 = &v24;
      uint64_t v23 = v13;
      CGFloat v14 = v19;
      if (v9)
      {
        char v28 = 0;
        uint8x8_t v15 = (uint8x8_t)vcnt_s8(v9);
        v15.i16[0] = vaddlv_u8(v15);
        int v16 = v15.i32[0];
        if (v15.i32[0])
        {
          unint64_t v17 = 0;
          do
          {
            if (((1 << v17) & *(void *)&v9) != 0)
            {
              v20(v14);
              if (v28) {
                break;
              }
              --v16;
            }
            if (v17 > 0x3E) {
              break;
            }
            ++v17;
          }
          while (v16 > 0);
        }
      }

      if (!*((unsigned char *)v25 + 24)
        && [WeakRetained homeAffordanceOrientationIfMismatchedFromCurrentLayoutState])
      {
        *((unsigned char *)v25 + 24) = (_interfaceOrientedRegionGivenScreenRegion() & 4) != 0;
      }

      BOOL v6 = *((unsigned char *)v25 + 24) != 0;
    }
  }
  _Block_object_dispose(&v24, 8);
  return v6;
}

uint64_t __87__SBFluidSwitcherGestureManager__shouldAllowDeckBottomEdgeGestureToRecognizeFromEdges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = _interfaceOrientedRegionGivenScreenRegion();
  if ((result & 4) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)takeHiddenAssertionForHomeGrabber:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4FA5F28];
  id v4 = a3;
  id v7 = [v3 rootSettings];
  id v5 = [v7 hideForHomeGestureOwnershipAnimationSettings];
  BOOL v6 = [v5 BSAnimationSettings];

  [v4 setHomeAffordanceInteractionEnabled:0];
  [v4 setHidden:1 forReason:@"SBFluidSwitcherHomeGestureNotOwnedGrabberHiddenReason" withAnimationSettings:v6];
}

- (void)_clearAudioCategoryZStackPolicyAssistant
{
}

- (void)_clearSystemApertureZStackPolicyAssistantSuppression
{
}

- (void)_clearPhysicalButtonZStackPolicyAssistant
{
}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  id v4 = a3;
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && ([(SBFZStackParticipant *)zStackParticipant ownsHomeGesture] & 1) == 0)
  {
    id v7 = SBLogSystemGesture();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CGRect v8 = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Preventing the switcher from dismissing due to a home grabber click because it doesn't own the home gesture.", v8, 2u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained fluidSwitcherGestureManager:self clickReceivedForHomeGrabberView:v4];
  }
}

- (BOOL)grabberTongueOrPullEnabled:(id)a3 forGestureRecognizer:(id)a4
{
  BOOL v6 = (SBGrabberTongue *)a3;
  id v7 = a4;
  if (self->_deckGrabberTongue == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldBeginBottomEdgePanGesture:v7];
    goto LABEL_9;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v6 || self->_leftEdgeFloatingAppGrabberTongue == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldBeginFloatingApplicationPresentGesture:v7];
LABEL_9:
    BOOL v8 = v9;
    goto LABEL_10;
  }
  if (self->_continuousExposeStripRevealGrabberTongue == v6)
  {
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _shouldBeginContinuousExposeStripRevealGesture:v7];
    goto LABEL_9;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)grabberTongue:(id)a3 shouldShowTongueOnFirstSwipeWithEdgeLocation:(double)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (SBGrabberTongue *)a3;
  id v7 = v6;
  if (self->_deckGrabberTongue == v6)
  {
    BOOL v20 = [(SBFluidSwitcherGestureManager *)self _shouldProtectEdgeLocation:[(SBGrabberTongue *)v6 screenEdge] edge:a4];
    goto LABEL_31;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v6 || self->_leftEdgeFloatingAppGrabberTongue == v6)
  {
    int v21 = [(SBFluidSwitcherGestureManager *)self _deviceApplicationSceneEntityForFloatingApplicationGrabberTongue];
    double v22 = v21;
    if (!v21) {
      goto LABEL_22;
    }
    uint64_t v23 = [v21 sceneHandle];
    uint64_t v24 = [v23 screenEdgesDeferringSystemGestures];

    if (self->_rightEdgeFloatingAppGrabberTongue == v7)
    {
      uint64_t v28 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      uint64_t v29 = 8;
      if (v28 == 1) {
        uint64_t v29 = 2;
      }
      if ((v29 & v24) != 0)
      {
        BOOL v20 = 1;
        goto LABEL_30;
      }
    }
    BOOL v25 = [v22 application];
    uint64_t v26 = [v25 info];
    char v27 = [v26 isTigrisLinked];

    if ((v27 & 1) == 0) {
      BOOL v20 = [(SBFluidSwitcherGestureManager *)self _edgeLocationIsOutsideFloatingApplicationGrabberFreeRegion:a4];
    }
    else {
LABEL_22:
    }
      BOOL v20 = 0;
LABEL_30:

    goto LABEL_31;
  }
  if (self->_continuousExposeStripRevealGrabberTongue == v6
    && [(SBFluidSwitcherGestureManager *)self _edgeLocationIsOutsideFloatingApplicationGrabberFreeRegion:a4])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    unint64_t v8 = [(SBFluidSwitcherGestureManager *)self _continuousExposeStripEdge];
    BOOL v9 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
    uint64_t v10 = [v9 appLayout];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = [v10 leafAppLayouts];
    uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      double v38 = v10;
      double v39 = v9;
      uint64_t v13 = *(void *)v43;
LABEL_8:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(obj);
        }
        uint8x8_t v15 = *(void **)(*((void *)&v42 + 1) + 8 * v14);
        int v16 = objc_msgSend(WeakRetained, "visibleItemContainers", v38);
        unint64_t v17 = [v16 objectForKey:v15];

        if (v8 == 8)
        {
          [v17 frame];
          CGFloat v18 = [WeakRetained view];
          [v18 frame];
          char v19 = BSFloatEqualToFloat();

          if (v19) {
            goto LABEL_32;
          }
        }
        else if (v8 == 2)
        {
          [v17 frame];
          if (BSFloatIsZero())
          {
LABEL_32:
            long long v31 = [v15 itemForLayoutRole:1];
            uint64_t v10 = v38;
            uint64_t v32 = [v38 layoutRoleForItem:v31];

            BOOL v9 = v39;
            uint64_t v33 = [v39 elementWithRole:v32];
            CGRect v34 = [v33 workspaceEntity];
            uint64_t v35 = [v34 deviceApplicationSceneEntity];

            if (v35)
            {
              double v36 = [v35 sceneHandle];
              uint64_t v37 = [v36 screenEdgesDeferringSystemGestures];

              BOOL v20 = ([(SBFluidSwitcherGestureManager *)self _continuousExposeStripEdge] & v37) != 0;
              goto LABEL_36;
            }
            BOOL v20 = 0;
            goto LABEL_38;
          }
        }

        if (v12 == ++v14)
        {
          uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v12) {
            goto LABEL_8;
          }
          BOOL v20 = 0;
          uint64_t v10 = v38;
          BOOL v9 = v39;
          goto LABEL_35;
        }
      }
    }
    BOOL v20 = 0;
LABEL_35:
    uint64_t v35 = obj;
LABEL_36:

LABEL_38:
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_31:

  return v20;
}

- (BOOL)grabberTongue:(id)a3 shouldAllowSecondSwipeWithEdgeLocation:(double)a4
{
  BOOL v6 = (SBGrabberTongue *)a3;
  id v7 = v6;
  if (self->_deckGrabberTongue == v6)
  {
    if (self->_usesHomeAffordanceRulesForGrabberTongue) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v6)
  {
LABEL_8:
    if ([(SBFluidSwitcherGestureManager *)self _shouldProtectEdgeLocation:[(SBGrabberTongue *)v6 screenEdge] edge:a4])
    {
      goto LABEL_9;
    }
LABEL_10:
    char v8 = 1;
    goto LABEL_11;
  }
  if (self->_leftEdgeFloatingAppGrabberTongue != v6
    && self->_continuousExposeStripRevealGrabberTongue == v6
    && ![(SBFluidSwitcherGestureManager *)self _shouldProtectEdgeLocation:[(SBGrabberTongue *)v6 screenEdge] edge:a4])
  {
    goto LABEL_10;
  }
LABEL_9:
  char v8 = [(SBGrabberTongue *)v7 isEdgeLocationInGrabberRegion:a4];
LABEL_11:

  return v8;
}

- (BOOL)grabberTongue:(id)a3 shouldDismissTongueOnSecondSwipeWithEdgeLocation:(double)a4
{
  return self->_leftEdgeFloatingAppGrabberTongue != a3;
}

- (void)grabberTongueBeganPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  uint64_t v10 = (SBGrabberTongue *)a3;
  id v8 = a6;
  if (self->_deckGrabberTongue == v10)
  {
    BOOL v9 = [(SBGrabberTongue *)v10 edgePullGestureRecognizer];
    [(SBFluidSwitcherGestureManager *)self _handleSwitcherPanGestureBegan:v9];
  }
  else
  {
    if (self->_rightEdgeFloatingAppGrabberTongue == v10 || self->_leftEdgeFloatingAppGrabberTongue == v10)
    {
      [(SBFluidSwitcherGestureManager *)self _handleFloatingAppPresentGesture:v8];
      goto LABEL_9;
    }
    if (self->_continuousExposeStripRevealGrabberTongue != v10) {
      goto LABEL_9;
    }
    BOOL v9 = [(SBGrabberTongue *)v10 edgePullGestureRecognizer];
    [(SBFluidSwitcherGestureManager *)self _handleContinuousExposeStripRevealGesture:v9];
  }

LABEL_9:
}

- (void)grabberTongueUpdatedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  uint64_t v11 = (SBGrabberTongue *)a3;
  id v8 = a6;
  if (self->_deckGrabberTongue == v11)
  {
    uint64_t v10 = [(SBGrabberTongue *)v11 edgePullGestureRecognizer];
    [(SBFluidSwitcherGestureManager *)self _handleSwitcherPanGestureChanged:v10];
LABEL_11:

    goto LABEL_12;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v11 || self->_leftEdgeFloatingAppGrabberTongue == v11)
  {
    [(SBFluidSwitcherGestureManager *)self _handleFloatingAppPresentGesture:v8];
    goto LABEL_12;
  }
  if (self->_continuousExposeStripRevealGrabberTongue == v11)
  {
    uint64_t v10 = [(SBGrabberTongue *)v11 edgePullGestureRecognizer];
    [(SBFluidSwitcherGestureManager *)self _handleContinuousExposeStripRevealGesture:v10];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)grabberTongueEndedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  uint64_t v10 = (SBGrabberTongue *)a3;
  id v8 = a6;
  if (self->_deckGrabberTongue == v10)
  {
    BOOL v9 = [(SBGrabberTongue *)v10 edgePullGestureRecognizer];
    [(SBFluidSwitcherGestureManager *)self _handleSwitcherPanGestureEnded:v9];
  }
  else
  {
    if (self->_rightEdgeFloatingAppGrabberTongue == v10 || self->_leftEdgeFloatingAppGrabberTongue == v10)
    {
      [(SBFluidSwitcherGestureManager *)self _handleFloatingAppPresentGesture:v8];
      goto LABEL_9;
    }
    if (self->_continuousExposeStripRevealGrabberTongue != v10) {
      goto LABEL_9;
    }
    BOOL v9 = [(SBGrabberTongue *)v10 edgePullGestureRecognizer];
    [(SBFluidSwitcherGestureManager *)self _handleContinuousExposeStripRevealGesture:v9];
  }

LABEL_9:
}

- (void)grabberTongueCanceledPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  uint64_t v10 = (SBGrabberTongue *)a3;
  id v8 = a6;
  if (self->_deckGrabberTongue == v10)
  {
    BOOL v9 = [(SBGrabberTongue *)v10 edgePullGestureRecognizer];
    [(SBFluidSwitcherGestureManager *)self _handleSwitcherPanGestureEnded:v9];
  }
  else
  {
    if (self->_rightEdgeFloatingAppGrabberTongue == v10 || self->_leftEdgeFloatingAppGrabberTongue == v10)
    {
      [(SBFluidSwitcherGestureManager *)self _handleFloatingAppPresentGesture:v8];
      goto LABEL_9;
    }
    if (self->_continuousExposeStripRevealGrabberTongue != v10) {
      goto LABEL_9;
    }
    BOOL v9 = [(SBGrabberTongue *)v10 edgePullGestureRecognizer];
    [(SBFluidSwitcherGestureManager *)self _handleContinuousExposeStripRevealGesture:v9];
  }

LABEL_9:
}

- (id)customGestureRecognizerForGrabberTongue:(id)a3
{
  id v4 = (SBGrabberTongue *)a3;
  unsigned int v5 = _os_feature_enabled_impl();
  if (self->_deckGrabberTongue == v4)
  {
    unsigned int v7 = v5;
    id v8 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    uint64_t v9 = [v8 homeButtonType];

    if (v9 == 2) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = 3;
    }
    BOOL v6 = [(SBHomeGesturePanGestureRecognizer *)[SBFluidSwitcherScreenEdgePanGestureRecognizer alloc] initWithTarget:0 action:0 type:v10 options:v7];
    [(SBHomeGesturePanGestureRecognizer *)v6 setPreventHorizontalSwipesOutsideTrapezoid:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    [(SBFluidSwitcherScreenEdgePanGestureRecognizer *)v6 setSwitcherViewController:WeakRetained];

    [(UIScreenEdgePanGestureRecognizer *)v6 setEdges:15];
    [(SBHomeGestureSettings *)self->_homeGestureSettings edgeAngleWindow];
    -[UIScreenEdgePanGestureRecognizer _setBottomEdgeAngleWindow:](v6, "_setBottomEdgeAngleWindow:");
    goto LABEL_17;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v4)
  {
    BOOL v6 = [[SBScreenEdgePanGestureRecognizer alloc] initWithTarget:0 action:0];
    BOOL v12 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
    uint64_t v13 = 8;
    uint64_t v14 = 2;
LABEL_12:
    if (v12) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = v13;
    }
    [(UIScreenEdgePanGestureRecognizer *)v6 setEdges:v15];
    goto LABEL_17;
  }
  if (self->_leftEdgeFloatingAppGrabberTongue == v4)
  {
    BOOL v6 = [[SBScreenEdgePanGestureRecognizer alloc] initWithTarget:0 action:0];
    BOOL v12 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
    uint64_t v13 = 2;
    uint64_t v14 = 8;
    goto LABEL_12;
  }
  if (self->_continuousExposeStripRevealGrabberTongue == v4)
  {
    BOOL v6 = [[SBScreenEdgePanGestureRecognizer alloc] initWithTarget:0 action:0];
    [(UIScreenEdgePanGestureRecognizer *)v6 setEdges:[(SBFluidSwitcherGestureManager *)self _continuousExposeStripEdge]];
    [(SBFluidSwitcherScreenEdgePanGestureRecognizer *)v6 setName:@"revealContinuousExposeStripsGestureRecognizer"];
  }
  else
  {
    BOOL v6 = 0;
  }
LABEL_17:

  return v6;
}

- (id)indirectPanGestureRecognizerForGrabberTongue:(id)a3
{
  id v4 = (SBGrabberTongue *)a3;
  unsigned int v5 = v4;
  if (self->_rightEdgeFloatingAppGrabberTongue == v4)
  {
    BOOL v7 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
    uint64_t v8 = 8;
    uint64_t v9 = 2;
LABEL_7:
    if (v7) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v8;
    }
    if (self->_rightEdgeFloatingAppGrabberTongue == v5) {
      uint64_t v11 = @"rightIndirectFloatingAppGrabberTongueGestureRecognizer";
    }
    else {
      uint64_t v11 = @"leftIndirectFloatingAppGrabberTongueGestureRecognizer";
    }
    BOOL v12 = v11;
    BOOL v6 = [[SBIndirectPanGestureRecognizer alloc] initWithTarget:0 action:0 edges:v10];
    [(SBIndirectPanGestureRecognizer *)v6 setName:v12];

    [(SBIndirectPanGestureRecognizer *)v6 setDelegate:self];
    [(SBIndirectPanGestureRecognizer *)v6 setShouldInvertXAxis:1];
    [(SBIndirectPanGestureRecognizer *)v6 setActivationRecognitionDistance:80.0];
    [(SBIndirectPanGestureRecognizer *)v6 setShouldRequireGestureToStartAtEdge:1];
    [(SBIndirectPanGestureRecognizer *)v6 setHysteresis:0 forInputType:30.0];
    [(SBIndirectPanGestureRecognizer *)v6 setHysteresis:1 forInputType:10.0];
    [(SBIndirectPanGestureRecognizer *)v6 setTranslationAdjustmentBlock:&__block_literal_global_307_0];
    goto LABEL_14;
  }
  if (self->_leftEdgeFloatingAppGrabberTongue == v4)
  {
    BOOL v7 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
    uint64_t v8 = 2;
    uint64_t v9 = 8;
    goto LABEL_7;
  }
  if (self->_continuousExposeStripRevealGrabberTongue == v4)
  {
    BOOL v6 = [[SBIndirectPanGestureRecognizer alloc] initWithTarget:self action:sel__handleContinuousExposeStripRevealGesture_ edges:[(SBFluidSwitcherGestureManager *)self _continuousExposeStripEdge]];
    [(SBIndirectPanGestureRecognizer *)v6 setName:@"indirectRevealContinuousExposeStripsGestureRecognizer"];
    [(SBIndirectPanGestureRecognizer *)v6 setDelegate:self];
    [(SBIndirectPanGestureRecognizer *)v6 setShouldRequireGestureToStartAtEdge:1];
    [(SBIndirectPanGestureRecognizer *)v6 setHysteresis:0 forInputType:30.0];
    [(SBIndirectPanGestureRecognizer *)v6 setHysteresis:1 forInputType:10.0];
    objc_copyWeak(&to, (id *)&self->_switcherContentController);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __78__SBFluidSwitcherGestureManager_indirectPanGestureRecognizerForGrabberTongue___block_invoke_2;
    v14[3] = &unk_1E6B0BFF0;
    objc_copyWeak(&v15, &to);
    [(SBIndirectPanGestureRecognizer *)v6 setTranslationAdjustmentBlock:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&to);
  }
  else
  {
    BOOL v6 = 0;
  }
LABEL_14:

  return v6;
}

double __78__SBFluidSwitcherGestureManager_indirectPanGestureRecognizerForGrabberTongue___block_invoke(double a1, double a2)
{
  return a1 - fabs(a2);
}

double __78__SBFluidSwitcherGestureManager_indirectPanGestureRecognizerForGrabberTongue___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = [WeakRetained view];
    [v11 bounds];
    double v13 = v12;

    double v14 = a2 - fabs(a3);
    if (a6 >= v13 * 0.5)
    {
      a2 = fmax(v14, 0.0);
    }
    else if (v14 <= 0.0)
    {
      a2 = v14;
    }
    else
    {
      a2 = 0.0;
    }
  }

  return a2;
}

- (unint64_t)indirectPanSystemGestureTypeForGrabberTongue:(id)a3
{
  id v4 = (SBGrabberTongue *)a3;
  if (self->_rightEdgeFloatingAppGrabberTongue == v4)
  {
    unint64_t v5 = 42;
  }
  else if (self->_leftEdgeFloatingAppGrabberTongue == v4)
  {
    unint64_t v5 = 43;
  }
  else if (self->_continuousExposeStripRevealGrabberTongue == v4)
  {
    unint64_t v5 = 54;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)shouldSuppressTongueViewForGrabberTongue:(id)a3
{
  id v4 = (SBGrabberTongue *)a3;
  if (self->_deckGrabberTongue == v4) {
    BOOL usesHomeAffordanceRulesForGrabberTongue = self->_usesHomeAffordanceRulesForGrabberTongue;
  }
  else {
    BOOL usesHomeAffordanceRulesForGrabberTongue = self->_leftEdgeFloatingAppGrabberTongue == v4
  }
                                           || self->_rightEdgeFloatingAppGrabberTongue == v4
                                           || self->_continuousExposeStripRevealGrabberTongue == v4;

  return usesHomeAffordanceRulesForGrabberTongue;
}

- (void)grabberTongueWillPresent:(id)a3
{
  uint64_t v8 = (SBGrabberTongue *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  if (self->_deckGrabberTongue == v8)
  {
    unint64_t v5 = [(SBFluidSwitcherGestureManager *)self edgeProtectFeedbackGenerator];
    [v5 activateWithCompletionBlock:0];

    goto LABEL_10;
  }
  if (self->_leftEdgeFloatingAppGrabberTongue == v8)
  {
    BOOL v6 = WeakRetained;
    uint64_t v7 = 2;
LABEL_9:
    [v6 presentSlideOverEdgeProtectTongueOnEdge:v7];
    goto LABEL_10;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v8)
  {
    BOOL v6 = WeakRetained;
    uint64_t v7 = 8;
    goto LABEL_9;
  }
  if (self->_continuousExposeStripRevealGrabberTongue == v8) {
    [WeakRetained presentContinuousExposeStripEdgeProtectTongue];
  }
LABEL_10:
}

- (void)grabberTongueWillPresentInteractively:(id)a3 withDistance:(double)a4 andVelocity:(double)a5
{
  uint64_t v7 = (SBGrabberTongue *)a3;
  if (self->_deckGrabberTongue == v7)
  {
    self->_interactivelyPresentingTongue = 1;
    if (self->_usesHomeAffordanceRulesForGrabberTongue)
    {
      uint64_t v9 = v7;
      if (a4 <= 200.0)
      {
        [(SBGrabberTongue *)v7 dismissWithStyle:0 animated:0];
      }
      else
      {
        [(SBGrabberTongue *)v7 presentAnimated:0];
        if (!self->_playedEdgeProtectHaptic)
        {
          uint64_t v8 = [(SBFluidSwitcherGestureManager *)self edgeProtectFeedbackGenerator];
          [v8 _privateNotificationOccurred:1010];

          self->_playedEdgeProtectHaptic = 1;
        }
      }
      [(SBFluidSwitcherGestureManager *)self _updateHomeGrabberViewsWithAnimationMode:5];
      uint64_t v7 = v9;
    }
  }
}

- (void)grabberTongueDidPresentInteractively:(id)a3 withDistance:(double)a4 andVelocity:(double)a5
{
  uint64_t v8 = (SBGrabberTongue *)a3;
  if (self->_deckGrabberTongue == v8)
  {
    self->_interactivelyPresentingTongue = 0;
    if (self->_usesHomeAffordanceRulesForGrabberTongue)
    {
      uint64_t v11 = v8;
      if (a4 > 200.0 || a5 > 150.0)
      {
        [(SBGrabberTongue *)v8 presentAnimated:0];
        if (!self->_playedEdgeProtectHaptic)
        {
          uint64_t v9 = [(SBFluidSwitcherGestureManager *)self edgeProtectFeedbackGenerator];
          [v9 _privateNotificationOccurred:1010];

          self->_playedEdgeProtectHaptic = 1;
        }
      }
      else
      {
        [(SBGrabberTongue *)v8 dismissWithStyle:0 animated:0];
      }
      uint64_t v10 = [(SBFluidSwitcherGestureManager *)self edgeProtectFeedbackGenerator];
      [v10 deactivate];

      [(SBFluidSwitcherGestureManager *)self _updateHomeGrabberViewsWithAnimationMode:3];
      self->_playedEdgeProtectHaptic = 0;
      uint64_t v8 = v11;
    }
  }
}

- (void)grabberTongueWillDismiss:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (SBGrabberTongue *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  BOOL v6 = WeakRetained;
  if (self->_deckGrabberTongue != v4)
  {
    if (self->_leftEdgeFloatingAppGrabberTongue == v4)
    {
      uint64_t v14 = 2;
    }
    else
    {
      if (self->_rightEdgeFloatingAppGrabberTongue != v4)
      {
        if (self->_continuousExposeStripRevealGrabberTongue == v4) {
          [WeakRetained dismissContinuousExposeStripEdgeProtectTongue];
        }
        goto LABEL_19;
      }
      uint64_t v14 = 8;
    }
    [WeakRetained dismissSlideOverEdgeProtectTongueOnEdge:v14];
    goto LABEL_19;
  }
  if (self->_usesHomeAffordanceRulesForGrabberTongue && !self->_interactivelyPresentingTongue)
  {
    uint64_t v7 = [(SBFHomeGrabberSettings *)self->_homeGrabberSettings forcedProminentToThinAnimationSettings];
    uint64_t v8 = [v7 BSAnimationSettings];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = self->_currentHomeGrabberViews;
    uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "updateStyleWithAnimationSettings:", v8, (void)v15);
        }
        uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
LABEL_19:
}

- (UINotificationFeedbackGenerator)edgeProtectFeedbackGenerator
{
  edgeProtectFeedbackGenerator = self->_edgeProtectFeedbackGenerator;
  if (!edgeProtectFeedbackGenerator)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42C10]);
    unint64_t v5 = (void *)MEMORY[0x1E4F43268];
    BOOL v6 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F334B480];
    uint64_t v7 = [v5 privateConfigurationForTypes:v6];
    uint64_t v8 = (UINotificationFeedbackGenerator *)[v4 initWithConfiguration:v7];
    uint64_t v9 = self->_edgeProtectFeedbackGenerator;
    self->_edgeProtectFeedbackGenerator = v8;

    edgeProtectFeedbackGenerator = self->_edgeProtectFeedbackGenerator;
  }
  return edgeProtectFeedbackGenerator;
}

- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3
{
  if ([(SBGrabberTongue *)self->_deckGrabberTongue isVisible]) {
    return 0;
  }
  else {
    return ![(SBFluidSwitcherGestureManager *)self _shouldSuppressEdgeProtect];
  }
}

- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3
{
  return self->_activeGestureTransaction == 0;
}

- (void)_updateHomeGrabberViewsWithAnimationMode:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(SBFHomeGrabberSettings *)self->_homeGrabberSettings edgeProtectAnimationSettings];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = self->_currentHomeGrabberViews;
  uint64_t v6 = [(NSHashTable *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        void v12[2] = __74__SBFluidSwitcherGestureManager__updateHomeGrabberViewsWithAnimationMode___block_invoke;
        v12[3] = &unk_1E6AF4AC0;
        void v12[4] = v10;
        objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v5, a3, v12, 0);
        [v10 updateStyle];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

uint64_t __74__SBFluidSwitcherGestureManager__updateHomeGrabberViewsWithAnimationMode___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)homeGrabberViewDidRecognizeDoubleTap:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBFluidSwitcherGestureManager *)self _isHomeAffordanceSingleTapGatingEnabled])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    unint64_t v5 = -[SBFluidSwitcherGestureManager _scenesForHomeGrabberView:](self, "_scenesForHomeGrabberView:", v4, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) _homeAffordanceHostSceneComponent];
          [v10 doubleTapGestureDidSucceed:1];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)homeGrabberViewDidFailToRecognizeDoubleTap:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBFluidSwitcherGestureManager *)self _isHomeAffordanceSingleTapGatingEnabled])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    unint64_t v5 = -[SBFluidSwitcherGestureManager _scenesForHomeGrabberView:](self, "_scenesForHomeGrabberView:", v4, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) _homeAffordanceHostSceneComponent];
          [v10 doubleTapGestureDidSucceed:0];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v15 = a4;
  uint64_t v6 = [(id)SBApp bannerManager];
  uint64_t v7 = [v6 windowSceneForPresentable:v15];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  uint64_t v9 = [WeakRetained windowScene];
  if ([v7 isEqual:v9])
  {
    char v10 = objc_opt_respondsToSelector();

    long long v11 = v15;
    if ((v10 & 1) == 0) {
      goto LABEL_8;
    }
    presentedSceneBackedBanners = self->_presentedSceneBackedBanners;
    if (!presentedSceneBackedBanners)
    {
      long long v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      long long v14 = self->_presentedSceneBackedBanners;
      self->_presentedSceneBackedBanners = v13;

      presentedSceneBackedBanners = self->_presentedSceneBackedBanners;
    }
    [(NSHashTable *)presentedSceneBackedBanners addObject:v15];
  }
  else
  {
  }
  long long v11 = v15;
LABEL_8:
}

- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  [(NSHashTable *)self->_presentedSceneBackedBanners removeObject:a4];
  if (![(NSHashTable *)self->_presentedSceneBackedBanners count])
  {
    presentedSceneBackedBanners = self->_presentedSceneBackedBanners;
    self->_presentedSceneBackedBanners = 0;
  }
}

- (id)_currentFloatingAppLayout
{
  v2 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  char v3 = [v2 floatingAppLayout];

  return v3;
}

- (int64_t)_currentUnlockedEnvironmentMode
{
  v2 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  int64_t v3 = [v2 unlockedEnvironmentMode];

  return v3;
}

- (id)_firstFloatingAppLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  int64_t v3 = [WeakRetained appLayouts];
  id v4 = objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_323);

  return v4;
}

BOOL __56__SBFluidSwitcherGestureManager__firstFloatingAppLayout__block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment] == 2;
}

- (id)_indirectPresentFloatingAppGestureRecognizerForEdge:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v5 = 232;
LABEL_5:
    uint64_t v6 = objc_msgSend(*(id *)((char *)&self->super.isa + v5), "indirectEdgePullGestureRecognizer", v3);
    return v6;
  }
  if (a3 == 8)
  {
    uint64_t v5 = 224;
    goto LABEL_5;
  }
  uint64_t v6 = 0;
  return v6;
}

- (id)_grabberTongueForGestureRecognizer:(id)a3
{
  id v4 = a3;
  p_rightEdgeFloatingAppGrabberTongue = &self->_rightEdgeFloatingAppGrabberTongue;
  uint64_t v6 = [(SBGrabberTongue *)self->_rightEdgeFloatingAppGrabberTongue edgePullGestureRecognizer];
  if ((id)v6 == v4) {
    goto LABEL_8;
  }
  uint64_t v7 = (void *)v6;
  id v8 = [(SBGrabberTongue *)*p_rightEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];

  if (v8 == v4) {
    goto LABEL_9;
  }
  p_rightEdgeFloatingAppGrabberTongue = &self->_leftEdgeFloatingAppGrabberTongue;
  uint64_t v9 = [(SBGrabberTongue *)self->_leftEdgeFloatingAppGrabberTongue edgePullGestureRecognizer];
  if ((id)v9 == v4) {
    goto LABEL_8;
  }
  char v10 = (void *)v9;
  id v11 = [(SBGrabberTongue *)*p_rightEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];

  if (v11 == v4) {
    goto LABEL_9;
  }
  p_rightEdgeFloatingAppGrabberTongue = &self->_continuousExposeStripRevealGrabberTongue;
  uint64_t v12 = [(SBGrabberTongue *)self->_continuousExposeStripRevealGrabberTongue edgePullGestureRecognizer];
  if ((id)v12 == v4)
  {
LABEL_8:

    goto LABEL_9;
  }
  long long v13 = (void *)v12;
  id v14 = [(SBGrabberTongue *)*p_rightEdgeFloatingAppGrabberTongue indirectEdgePullGestureRecognizer];

  if (v14 != v4)
  {
    id v15 = 0;
    goto LABEL_10;
  }
LABEL_9:
  id v15 = *p_rightEdgeFloatingAppGrabberTongue;
LABEL_10:

  return v15;
}

- (BOOL)_isBannerOccludingRegionAtReferencePoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v5 = [(id)SBApp notificationDispatcher];
  uint64_t v6 = [v5 bannerDestination];

  if ([v6 isPresentingBanner])
  {
    if ([v6 isPresentingBannerInLongLook])
    {
      BOOL v7 = 1;
    }
    else
    {
      [v6 presentedBannerScreenFrame];
      CGRect v11 = CGRectInset(v10, -30.0, -30.0);
      v9.CGFloat x = x;
      v9.CGFloat y = y;
      BOOL v7 = CGRectContainsPoint(v11, v9);
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_areContinuousExposeStripsAvailableWithReason:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v6 = objc_loadWeakRetained((id *)&self->_switcherController);
  BOOL v7 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  if ([v6 isChamoisWindowingUIEnabled])
  {
    if ([WeakRetained prefersStripHiddenAndDisabled])
    {
      char v8 = 0;
      CGPoint v9 = @"PrefersStripHiddenAndDisabled";
    }
    else if ([v7 unlockedEnvironmentMode] == 3)
    {
      if ([v7 isFloatingSwitcherVisible])
      {
        char v8 = 0;
        CGPoint v9 = @"FloatingSwitcherVisible";
      }
      else
      {
        zStackParticipant = self->_zStackParticipant;
        if (zStackParticipant && [(SBFZStackParticipant *)zStackParticipant activationState])
        {
          char v8 = 0;
          CGPoint v9 = @"NotForegroundActiveInZStack";
        }
        else if ([v6 isChamoisWindowingUIEnabled])
        {
          uint64_t v12 = [v7 appLayout];
          long long v13 = [v12 itemForLayoutRole:1];

          id v14 = [v13 bundleIdentifier];
          if (v14)
          {
            id v15 = +[SBApplicationController sharedInstance];
            uint64_t v16 = [v15 applicationWithBundleIdentifier:v14];

            CGPoint v9 = @"Available";
            if (v16)
            {
              int v17 = [v16 alwaysMaximizedInChamois];
              if (v17) {
                CGPoint v9 = @"ApplicationAlwaysMaximized";
              }
              char v8 = v17 ^ 1;
            }
            else
            {
              char v8 = 1;
            }
          }
          else
          {
            char v8 = 1;
            CGPoint v9 = @"Available";
          }
        }
        else
        {
          char v8 = 0;
          CGPoint v9 = @"ChamoisNotEnabled";
        }
      }
    }
    else
    {
      char v8 = 0;
      CGPoint v9 = @"NotInApplication";
    }
  }
  else
  {
    char v8 = 0;
    CGPoint v9 = @"FeatureNotEnabled";
  }
  if (a3) {
    *a3 = v9;
  }

  return v8;
}

- (BOOL)_areContinuousExposeStripsOccludedOrHiddenWithOutReason:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v6 = objc_loadWeakRetained((id *)&self->_switcherController);
  if ([v6 isChamoisWindowingUIEnabled])
  {
    if ([WeakRetained prefersStripHiddenAndDisabled])
    {
      LOBYTE(v7) = 0;
      char v8 = @"PrefersStripHiddenAndDisabled";
    }
    else if ([WeakRetained _areContinuousExposeStripsUnoccluded])
    {
      LOBYTE(v7) = 0;
      char v8 = @"StripsManuallyUnoccluded";
    }
    else if ([WeakRetained prefersStripHidden] {
           && ![WeakRetained prefersStripHiddenAndDisabled])
    }
    {
      LOBYTE(v7) = 1;
      char v8 = @"PrefersStripHidden";
    }
    else
    {
      long long v30 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
      uint64_t v29 = [v30 appLayout];
      CGRect v10 = [WeakRetained view];
      [v10 bounds];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;

      char v19 = [WeakRetained chamoisLayoutAttributes];
      uint64_t v20 = [v6 windowScene];
      uint64_t v28 = [v30 interfaceOrientation];
      displayItemLayoutAttributesCalculator = self->_displayItemLayoutAttributesCalculator;
      double v22 = [v20 floatingDockController];
      [v22 floatingDockHeight];
      double v24 = v23;
      BOOL v25 = [v20 screen];
      [v25 scale];
      char v27 = -[SBDisplayItemLayoutAttributesCalculator autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:](displayItemLayoutAttributesCalculator, "autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:", v29, v28, v19, [WeakRetained prefersStripHidden], objc_msgSend(WeakRetained, "prefersDockHidden"), v24, v26, v12, v14, v16, v18);

      int v7 = [v27 isStripVisible] ^ 1;
      char v8 = @"StripVisible";
    }
  }
  else
  {
    LOBYTE(v7) = 0;
    char v8 = @"FeatureNotEnabled";
  }
  if (a3) {
    *a3 = v8;
  }

  return v7;
}

- (unint64_t)_continuousExposeStripEdge
{
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    return 8;
  }
  else {
    return 2;
  }
}

- (void)_updateGestureDefaults
{
  uint64_t v3 = +[SBDefaults localDefaults];
  id v4 = [v3 gestureDefaults];

  self->_multitaskingGesturesRequireEducation = [v4 multitaskingGesturesRequireEducation];
  self->_multitaskingGesturesUserPreferenceIsOff = [v4 isSystemGesturesAllowed] ^ 1;
}

- (id)_scenesForHomeGrabberView:(id)a3
{
  id v4 = [(SBFluidSwitcherGestureManager *)self _appLayoutForHomeGrabberView:a3];
  if (v4)
  {
    id v5 = [(SBFluidSwitcherGestureManager *)self _scenesForAppLayout:v4];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  id v6 = v5;

  return v6;
}

- (id)_appLayoutForHomeGrabberView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherGestureManager *)self _currentLayoutState];
  id v6 = [v5 appLayout];
  int v7 = [v5 floatingAppLayout];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  CGPoint v9 = WeakRetained;
  if (!v6)
  {
    CGRect v10 = 0;
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    double v11 = 0;
    goto LABEL_6;
  }
  CGRect v10 = [WeakRetained homeGrabberViewForAppLayout:v6];
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  double v11 = [v9 homeGrabberViewForAppLayout:v7];
LABEL_6:
  char v12 = [v4 isEqual:v10];
  double v13 = v6;
  if ((v12 & 1) != 0 || (int v14 = [v4 isEqual:v11], v13 = v7, v14)) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }

  return v15;
}

- (id)_scenesForAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  int v7 = [WeakRetained dataSource];
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__SBFluidSwitcherGestureManager__scenesForAppLayout___block_invoke;
    void v9[3] = &unk_1E6AFA810;
    id v10 = v7;
    id v11 = WeakRetained;
    id v12 = v5;
    [v4 enumerate:v9];
  }
  return v5;
}

void __53__SBFluidSwitcherGestureManager__scenesForAppLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) switcherContentController:*(void *)(a1 + 40) deviceApplicationSceneHandleForDisplayItem:a3];
  id v4 = [v5 sceneIfExists];
  objc_msgSend(*(id *)(a1 + 48), "bs_safeAddObject:", v4);
}

- (BOOL)_isHomeAffordanceSingleTapGatingEnabled
{
  int v3 = _UIHomeAffordanceSingleTapGatingEnabled();
  if (v3)
  {
    homeGrabberSettings = self->_homeGrabberSettings;
    LOBYTE(v3) = [(SBFHomeGrabberSettings *)homeGrabberSettings isSingleTapGatingEnabled];
  }
  return v3;
}

- (BOOL)_isHomeAffordanceHitTestRectForAppLayoutRelevant:(id)a3
{
  id v4 = a3;
  if ([(SBFluidSwitcherGestureManager *)self _currentUnlockedEnvironmentMode] == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    if ([WeakRetained _windowManagementStyle] == 2) {
      char v6 = [WeakRetained appLayoutContainsAnUnoccludedMaximizedDisplayItem:v4];
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(SBFluidSwitcherGestureManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFluidSwitcherGestureManager *)self succinctDescriptionBuilder];
  int v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(SBFluidSwitcherGestureManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherGestureManager *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SBFluidSwitcherGestureManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  void v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __71__SBFluidSwitcherGestureManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 360) withName:@"activeGestureTransaction"];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_homeGestureSettings == a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SBFluidSwitcherGestureManager_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __61__SBFluidSwitcherGestureManager_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSwitcherBottomEdgeGesturePresence];
  [*(id *)(a1 + 32) _updateDeckSwitcherInSwitcherGesturePresence];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateExclusionTrapezoidDebugView];
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v4 = [WeakRetained view];

  return v4;
}

- (SBSwitcherContentViewControlling)contentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  int v3 = [WeakRetained contentViewController];

  return (SBSwitcherContentViewControlling *)v3;
}

- (id)acquireSystemApertureSuppressionAssertionForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  char v8 = [_SBFluidSwitcherSystemApertureSuppressionAssertion alloc];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  int v14 = __110__SBFluidSwitcherGestureManager_acquireSystemApertureSuppressionAssertionForBundleIdentifier_sceneIdentifier___block_invoke;
  id v15 = &unk_1E6B0C090;
  objc_copyWeak(&v16, &location);
  CGPoint v9 = [(_SBFluidSwitcherSystemApertureSuppressionAssertion *)v8 initWithSceneID:v7 bundleID:v6 invalidationBlock:&v12];
  -[NSMutableSet addObject:](self->_suppressionAssertions, "addObject:", v9, v12, v13, v14, v15);
  [(SBFluidSwitcherGestureManager *)self _updateZStackParticipantWithReason:@"fluid switcher gesture manager system aperture suppression assertion creation"];
  id v10 = SBLogSystemApertureController();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349570;
    char v19 = v9;
    __int16 v20 = 2114;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_debug_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEBUG, "Adding System Aperture Transition Suppression Assertion <%{public}lx> for %{public}@, %{public}@", buf, 0x20u);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v9;
}

void __110__SBFluidSwitcherGestureManager_acquireSystemApertureSuppressionAssertionForBundleIdentifier_sceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[16] removeObject:v3];
    [v5 _updateZStackParticipantWithReason:@"fluid switcher gesture manager system aperture suppression assertion invalidation"];
    id v6 = SBLogSystemApertureController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __110__SBFluidSwitcherGestureManager_acquireSystemApertureSuppressionAssertionForBundleIdentifier_sceneIdentifier___block_invoke_cold_1(v3, v6);
    }
  }
}

- (id)homeGestureBottomEdgeRecognizer
{
  return [(SBGrabberTongue *)self->_deckGrabberTongue edgePullGestureRecognizer];
}

- (void)updateForWindowManagementStyle:(unint64_t)a3
{
  -[SBFluidSwitcherGestureManager _updateFluidDragAndDropManagerPresenceForWindowManagementStyle:](self, "_updateFluidDragAndDropManagerPresenceForWindowManagementStyle:");
  [(SBFluidSwitcherGestureManager *)self _updateFloatingApplicationGestureRecognizerPresenceForWindowManagementStyle:a3];
  [(SBFluidSwitcherGestureManager *)self _updateChamoisGestureRecognizerPresenceForWindowManagementStyle:a3];
}

- (void)presentContinuousExposeStripRevealGrabberTongueImmediately
{
}

- (void)tickleContinuousExposeStripRevealGrabberTongueIfVisible
{
  if ([(SBGrabberTongue *)self->_continuousExposeStripRevealGrabberTongue isVisible])
  {
    continuousExposeStripRevealGrabberTongue = self->_continuousExposeStripRevealGrabberTongue;
    [(SBGrabberTongue *)continuousExposeStripRevealGrabberTongue presentAnimated:1 autoDismiss:1];
  }
}

- (SBSwitcherController)switcherController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  return (SBSwitcherController *)WeakRetained;
}

- (SBFluidSwitcherGestureManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherGestureManagerDelegate *)WeakRetained;
}

- (SBFluidSwitcherViewController)switcherContentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  return (SBFluidSwitcherViewController *)WeakRetained;
}

- (void)setSwitcherContentController:(id)a3
{
}

- (NSHashTable)currentHomeGrabberViews
{
  return self->_currentHomeGrabberViews;
}

- (SBFHomeAffordanceInteraction)homeAffordanceInteraction
{
  return self->_homeAffordanceInteraction;
}

- (void)setHomeAffordanceInteraction:(id)a3
{
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  return self->_layoutStateTransitionCoordinator;
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
}

- (SBAppSwitcherDefaults)appSwitcherDefaults
{
  return self->_appSwitcherDefaults;
}

- (void)setAppSwitcherDefaults:(id)a3
{
}

- (SBAppSwitcherSettings)appSwitcherSettings
{
  return self->_appSwitcherSettings;
}

- (void)setAppSwitcherSettings:(id)a3
{
}

- (SBHomeGestureSettings)homeGestureSettings
{
  return self->_homeGestureSettings;
}

- (void)setHomeGestureSettings:(id)a3
{
}

- (SBFHomeGrabberSettings)homeGrabberSettings
{
  return self->_homeGrabberSettings;
}

- (void)setHomeGrabberSettings:(id)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (SBAudioCategoryZStackPolicyAssistant)zStackAudioCategoryPolicyAssistant
{
  return self->_zStackAudioCategoryPolicyAssistant;
}

- (void)setZStackAudioCategoryPolicyAssistant:(id)a3
{
}

- (SBSystemApertureZStackPolicyAssistant)zStackSystemAperturePolicyAssistant
{
  return self->_zStackSystemAperturePolicyAssistant;
}

- (void)setZStackSystemAperturePolicyAssistant:(id)a3
{
}

- (SBPhysicalButtonZStackPolicyAssistant)zStackPhysicalButtonPolicyAssistant
{
  return self->_zStackPhysicalButtonPolicyAssistant;
}

- (void)setZStackPhysicalButtonPolicyAssistant:(id)a3
{
}

- (NSMutableSet)suppressionAssertions
{
  return self->_suppressionAssertions;
}

- (void)setSuppressionAssertions:(id)a3
{
}

- (SBFluidSwitcherPanGestureRecognizer)deckInSwitcherPanGestureRecognizer
{
  return self->_deckInSwitcherPanGestureRecognizer;
}

- (void)setDeckInSwitcherPanGestureRecognizer:(id)a3
{
}

- (SBIndirectPanGestureRecognizer)indirectBottomEdgePanGestureRecognizer
{
  return self->_indirectBottomEdgePanGestureRecognizer;
}

- (void)setIndirectBottomEdgePanGestureRecognizer:(id)a3
{
}

- (SBGrabberTongue)deckGrabberTongue
{
  return self->_deckGrabberTongue;
}

- (void)setDeckGrabberTongue:(id)a3
{
}

- (BOOL)usesHomeAffordanceRulesForGrabberTongue
{
  return self->_usesHomeAffordanceRulesForGrabberTongue;
}

- (void)setUsesHomeAffordanceRulesForGrabberTongue:(BOOL)a3
{
  self->_BOOL usesHomeAffordanceRulesForGrabberTongue = a3;
}

- (BOOL)interactivelyPresentingTongue
{
  return self->_interactivelyPresentingTongue;
}

- (void)setInteractivelyPresentingTongue:(BOOL)a3
{
  self->_interactivelyPresentingTongue = a3;
}

- (BOOL)playedEdgeProtectHaptic
{
  return self->_playedEdgeProtectHaptic;
}

- (void)setPlayedEdgeProtectHaptic:(BOOL)a3
{
  self->_playedEdgeProtectHaptic = a3;
}

- (void)setEdgeProtectFeedbackGenerator:(id)a3
{
}

- (NSTimer)delayedHomeGrabberUpdateTimer
{
  return self->_delayedHomeGrabberUpdateTimer;
}

- (void)setDelayedHomeGrabberUpdateTimer:(id)a3
{
}

- (UIView)exclusionTrapezoidDebugView
{
  return self->_exclusionTrapezoidDebugView;
}

- (void)setExclusionTrapezoidDebugView:(id)a3
{
}

- (BOOL)shouldRubberbandGrabberViewForReduceMotion
{
  return self->_shouldRubberbandGrabberViewForReduceMotion;
}

- (void)setShouldRubberbandGrabberViewForReduceMotion:(BOOL)a3
{
  self->_shouldRubberbandGrabberViewForReduceMotion = a3;
}

- (SBFluidScrunchGestureRecognizer)fluidScrunchGestureRecognizer
{
  return self->_fluidScrunchGestureRecognizer;
}

- (void)setFluidScrunchGestureRecognizer:(id)a3
{
}

- (SBFluidSwitcherPanGestureRecognizer)clickAndDragHomeGestureRecognizer
{
  return self->_clickAndDragHomeGestureRecognizer;
}

- (void)setClickAndDragHomeGestureRecognizer:(id)a3
{
}

- (_UIPassthroughTapGestureRecognizer)tapToBringItemContainerForwardGestureRecognizer
{
  return self->_tapToBringItemContainerForwardGestureRecognizer;
}

- (void)setTapToBringItemContainerForwardGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)clickDownToBringItemContainerForwardGestureRecognizer
{
  return self->_clickDownToBringItemContainerForwardGestureRecognizer;
}

- (void)setClickDownToBringItemContainerForwardGestureRecognizer:(id)a3
{
}

- (BOOL)multitaskingGesturesRequireEducation
{
  return self->_multitaskingGesturesRequireEducation;
}

- (void)setMultitaskingGesturesRequireEducation:(BOOL)a3
{
  self->_multitaskingGesturesRequireEducation = a3;
}

- (BOOL)multitaskingGesturesUserPreferenceIsOff
{
  return self->_multitaskingGesturesUserPreferenceIsOff;
}

- (void)setMultitaskingGesturesUserPreferenceIsOff:(BOOL)a3
{
  self->_multitaskingGesturesUserPreferenceIsOff = a3;
}

- (NSHashTable)presentedSceneBackedBanners
{
  return self->_presentedSceneBackedBanners;
}

- (void)setPresentedSceneBackedBanners:(id)a3
{
}

- (SBGrabberTongue)rightEdgeFloatingAppGrabberTongue
{
  return self->_rightEdgeFloatingAppGrabberTongue;
}

- (void)setRightEdgeFloatingAppGrabberTongue:(id)a3
{
}

- (SBGrabberTongue)leftEdgeFloatingAppGrabberTongue
{
  return self->_leftEdgeFloatingAppGrabberTongue;
}

- (void)setLeftEdgeFloatingAppGrabberTongue:(id)a3
{
}

- (SBFluidSwitcherPanGestureRecognizer)swipeUpFloatingAppGestureRecognizer
{
  return self->_swipeUpFloatingAppGestureRecognizer;
}

- (void)setSwipeUpFloatingAppGestureRecognizer:(id)a3
{
}

- (SBFluidSwitcherPanGestureRecognizer)moveFloatingApplicationGestureRecognizer
{
  return self->_moveFloatingApplicationGestureRecognizer;
}

- (void)setMoveFloatingApplicationGestureRecognizer:(id)a3
{
}

- (SBIndirectPanGestureRecognizer)indirectDismissFloatingApplicationGestureRecognizer
{
  return self->_indirectDismissFloatingApplicationGestureRecognizer;
}

- (void)setIndirectDismissFloatingApplicationGestureRecognizer:(id)a3
{
}

- (SBFluidScrunchGestureRecognizer)indirectFloatingAppScrunchGestureRecognizer
{
  return self->_indirectFloatingAppScrunchGestureRecognizer;
}

- (void)setIndirectFloatingAppScrunchGestureRecognizer:(id)a3
{
}

- (SBFluidSwitcherPanGestureRecognizer)pinFloatingApplicationGestureRecognizer
{
  return self->_pinFloatingApplicationGestureRecognizer;
}

- (void)setPinFloatingApplicationGestureRecognizer:(id)a3
{
}

- (SBFluidSwitcherPanGestureRecognizer)unpinSplitViewApplicationGestureRecognizer
{
  return self->_unpinSplitViewApplicationGestureRecognizer;
}

- (void)setUnpinSplitViewApplicationGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)windowMoveClientGateRelationshipGestureRecognizer
{
  return self->_windowMoveClientGateRelationshipGestureRecognizer;
}

- (void)setWindowMoveClientGateRelationshipGestureRecognizer:(id)a3
{
}

- (SBPanSystemGestureRecognizer)sceneResizePanGestureRecognizer
{
  return self->_sceneResizePanGestureRecognizer;
}

- (void)setSceneResizePanGestureRecognizer:(id)a3
{
}

- (SBFluidSwitcherDragAndDropManager)fluidDragAndDropManager
{
  return self->_fluidDragAndDropManager;
}

- (void)setFluidDragAndDropManager:(id)a3
{
}

- (SBFluidSwitcherPanGestureRecognizer)liveWindowResizeGestureRecognizer
{
  return self->_liveWindowResizeGestureRecognizer;
}

- (void)setLiveWindowResizeGestureRecognizer:(id)a3
{
}

- (SBDisplayItemLayoutAttributesCalculator)displayItemLayoutAttributesCalculator
{
  return self->_displayItemLayoutAttributesCalculator;
}

- (void)setDisplayItemLayoutAttributesCalculator:(id)a3
{
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (void)setHoverGestureRecognizer:(id)a3
{
}

- (SBGrabberTongue)continuousExposeStripRevealGrabberTongue
{
  return self->_continuousExposeStripRevealGrabberTongue;
}

- (void)setContinuousExposeStripRevealGrabberTongue:(id)a3
{
}

- (SBIndirectPanGestureRecognizer)indirectContinuousExposeStripOverflowGestureRecognizer
{
  return self->_indirectContinuousExposeStripOverflowGestureRecognizer;
}

- (void)setIndirectContinuousExposeStripOverflowGestureRecognizer:(id)a3
{
}

- (SBFluidSwitcherPanGestureRecognizer)dragContinuousExposeStripOverflowGestureRecognizer
{
  return self->_dragContinuousExposeStripOverflowGestureRecognizer;
}

- (void)setDragContinuousExposeStripOverflowGestureRecognizer:(id)a3
{
}

- (SBDragAndDropWorkspaceTransaction)dragAndDropWorkspaceTransaction
{
  return self->_dragAndDropWorkspaceTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragAndDropWorkspaceTransaction, 0);
  objc_storeStrong((id *)&self->_activeGestureTransaction, 0);
  objc_storeStrong((id *)&self->_dragContinuousExposeStripOverflowGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectContinuousExposeStripOverflowGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_continuousExposeStripRevealGrabberTongue, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_displayItemLayoutAttributesCalculator, 0);
  objc_storeStrong((id *)&self->_liveWindowResizeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_fluidDragAndDropManager, 0);
  objc_storeStrong((id *)&self->_sceneResizePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_windowMoveClientGateRelationshipGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_unpinSplitViewApplicationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinFloatingApplicationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectFloatingAppScrunchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectDismissFloatingApplicationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_moveFloatingApplicationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_swipeUpFloatingAppGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_leftEdgeFloatingAppGrabberTongue, 0);
  objc_storeStrong((id *)&self->_rightEdgeFloatingAppGrabberTongue, 0);
  objc_storeStrong((id *)&self->_presentedSceneBackedBanners, 0);
  objc_storeStrong((id *)&self->_clickDownToBringItemContainerForwardGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToBringItemContainerForwardGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_clickAndDragHomeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_fluidScrunchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_exclusionTrapezoidDebugView, 0);
  objc_storeStrong((id *)&self->_delayedHomeGrabberUpdateTimer, 0);
  objc_storeStrong((id *)&self->_edgeProtectFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_deckGrabberTongue, 0);
  objc_storeStrong((id *)&self->_indirectBottomEdgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_deckInSwitcherPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_suppressionAssertions, 0);
  objc_storeStrong((id *)&self->_zStackPhysicalButtonPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackSystemAperturePolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackAudioCategoryPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_storeStrong((id *)&self->_appSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_homeAffordanceInteraction, 0);
  objc_storeStrong((id *)&self->_currentHomeGrabberViews, 0);
  objc_destroyWeak((id *)&self->_switcherContentController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_switcherController);
}

- (void)_handleSwitcherPanGestureBegan:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = SBSystemGestureRecognizerStateDescription([a1 state]);
  id v7 = [a2 activeGestureTransaction];
  OUTLINED_FUNCTION_0_22();
  OUTLINED_FUNCTION_1_32(&dword_1D85BA000, v8, v9, "Switcher gesture recognizer did begin: <%{public}@:%{public}p> (%{public}@), active gesture transaction:%{public}@", v10, v11, v12, v13, v14);
}

- (void)_handleSwitcherPanGestureEnded:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = SBSystemGestureRecognizerStateDescription([a1 state]);
  id v7 = [a2 activeGestureTransaction];
  OUTLINED_FUNCTION_0_22();
  OUTLINED_FUNCTION_1_32(&dword_1D85BA000, v8, v9, "Switcher gesture recognizer did end: <%{public}@:%{public}p> (%{public}@), active gesture transaction:%{public}@", v10, v11, v12, v13, v14);
}

- (void)gestureRecognizerShouldBegin:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = [a1 name];
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  uint64_t v11 = [a2 name];
  int v12 = 138544642;
  uint64_t v13 = v7;
  __int16 v14 = 2050;
  id v15 = a1;
  __int16 v16 = 2114;
  double v17 = v8;
  __int16 v18 = 2114;
  char v19 = v10;
  __int16 v20 = 2050;
  id v21 = a2;
  __int16 v22 = 2114;
  id v23 = v11;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "Preventing the gesture <%{public}@:%{public}p> (%{public}@) because we have a transaction responding to a gesture already: <%{public}@:%{public}p> (%{public}@)", (uint8_t *)&v12, 0x3Eu);
}

void __110__SBFluidSwitcherGestureManager_acquireSystemApertureSuppressionAssertionForBundleIdentifier_sceneIdentifier___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 bundleID];
  id v5 = [a1 sceneID];
  int v6 = 134349570;
  id v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Removing System Aperture Transition Suppression Assertion <%{public}lx> for %{public}@, %@", (uint8_t *)&v6, 0x20u);
}

@end