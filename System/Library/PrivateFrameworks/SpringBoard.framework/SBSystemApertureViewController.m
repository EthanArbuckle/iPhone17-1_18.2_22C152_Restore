@interface SBSystemApertureViewController
- (BOOL)_axZoomActiveAndEnabled;
- (BOOL)_canShowWhileLocked;
- (BOOL)_collapseExpandedElementIfPossible;
- (BOOL)_doesElementHaveValidUrgencyAssertion:(id)a3;
- (BOOL)_handleButtonEventWithTest:(id)a3 handler:(id)a4;
- (BOOL)_handleCalloutBlockAction:(id)a3;
- (BOOL)_handleContainerPressAction:(id)a3;
- (BOOL)_handleContainerResizeAction:(id)a3;
- (BOOL)_handleContainerTapAction:(id)a3;
- (BOOL)_handleImpactFeedbackAction:(id)a3;
- (BOOL)_handlePreferencesDidChangeAction:(id)a3;
- (BOOL)_isAnyGestureRecognizerActive;
- (BOOL)_isBlobEnabled;
- (BOOL)_isIndicatorElementViewController:(id)a3;
- (BOOL)_isInteractionLongPressGestureActive;
- (BOOL)_isInteractiveHidingSupportedByElement:(id)a3;
- (BOOL)_isProperty:(id)a3 ofObject:(id)a4 equalToDescription:(id)a5;
- (BOOL)_isResizePanGestureActive;
- (BOOL)_isSystemGesture:(id)a3;
- (BOOL)_longPressGestureInhibitedByElement;
- (BOOL)_panGestureInhibitedByElement;
- (BOOL)_shouldPerformTransitionOfProperty:(id)a3 ofObject:(id)a4 withDescription:(id)a5 fromPreferences:(id)a6 context:(id)a7;
- (BOOL)_shouldSuppressElement:(id)a3 allowsSuppressionForSystemChromeSuppression:(BOOL)a4 reason:(int64_t *)a5;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)isRequestingMenuPresentationForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (BOOL)isTransitionTargetForSceneIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)systemApertureApertureElementAuthority:(id)a3 isActivityElementAlerting:(id)a4;
- (BOOL)systemApertureApertureElementAuthority:(id)a3 isElementExpandedDueToUserInteraction:(id)a4;
- (BOOL)systemApertureApertureElementAuthority:(id)a3 isElementRequiredToRemainVisible:(id)a4;
- (BOOL)systemApertureApertureElementAuthority:(id)a3 isElementUrgentlyVisible:(id)a4;
- (BOOL)systemApertureManagerShouldUseOrderedElementViewControllers:(id)a3;
- (BOOL)systemApertureProximityBacklightPolicy:(id)a3 isSystemApertureElementVisibleAtPoint:(CGPoint)a4;
- (BOOL)systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:(id)a3;
- (BOOL)systemApertureProximityBacklightPolicyShouldDisableGracePeriod:(id)a3;
- (BOOL)viewProviderShouldMakeSensorShadowVisible:(id)a3;
- (CGPoint)containerParentCenter;
- (CGRect)_boundsForAdjunctContainerViewWithPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a3 layoutDirection:(int64_t)a4;
- (CGRect)_frameForSensorRegionInBounds:(CGRect)a3;
- (CGRect)_indicatorContainerViewFrameInBounds:(CGRect)a3;
- (CGRect)_portraitFrameForPrimaryContainerViewInBounds:(CGRect)a3 withPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a4 layoutDirection:(int64_t)a5;
- (CGRect)interSensorRegionInContentView:(id)a3;
- (CGRect)minimumSensorRegionFrame;
- (CGRect)sensorRegionInContentView:(id)a3 fromViewProvider:(id)a4;
- (CGRect)sensorRegionObstructingViewProvider:(id)a3 inContentView:(id)a4;
- (CGRect)systemApertureContainerView:(id)a3 hitRectForBounds:(CGRect)a4 debugColor:(id *)a5;
- (CGSize)_adjunctContainerMinimalViewSize;
- (CGSize)_preferredMinSizeForCustomLayout:(int64_t)a3 elementInterfaceOrientation:(int64_t)a4;
- (CGSize)maximumAvailableSizeForProvidedLeadingView:(id)a3 fromViewProvider:(id)a4;
- (CGSize)maximumAvailableSizeForProvidedMinimalView:(id)a3 fromViewProvider:(id)a4;
- (CGSize)maximumAvailableSizeForProvidedTrailingView:(id)a3 fromViewProvider:(id)a4;
- (MTMaterialView)variableBlurView;
- (NSArray)stateDump;
- (NSDirectionalEdgeInsets)_applySymmetryToPreferredLayoutOutsets:(NSDirectionalEdgeInsets)a3;
- (NSDirectionalEdgeInsets)_hostSuggestedOutsetsForElement:(id)a3;
- (NSDirectionalEdgeInsets)_maximumContainerViewOutsetsInBounds:(CGRect)a3 inLayoutMode:(int64_t)a4;
- (NSDirectionalEdgeInsets)_validatedEdgeOutsetsForPreferredOutsets:(NSDirectionalEdgeInsets)a3 maximumOutsets:(NSDirectionalEdgeInsets)a4;
- (NSDirectionalEdgeInsets)edgeOutsetsForSize:(CGSize)a3;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7;
- (NSMutableArray)systemApertureModelStateDump;
- (NSMutableDictionary)animationFrameRecordings;
- (SBSystemApertureBacklightSessionAggregator)backlightSessionAggregator;
- (SBSystemApertureCurtainViewHoster)curtainViewHoster;
- (SBSystemApertureViewController)initWithActiveWindowScene:(id)a3;
- (SBSystemApertureViewControllerVisibilityDelegate)visibilityDelegate;
- (SBSystemApertureWindowScene)activeWindowScene;
- (double)_yOffsetForCustomLayout:(int64_t)a3;
- (double)alertingDurationForHost:(id)a3;
- (double)concentricPaddingForProvidedView:(id)a3 fromViewProvider:(id)a4;
- (double)viewProviderSensorShadowOpacityFactor:(id)a3;
- (id)_activeSnapshotAssertionForElementIdentity:(id)a3;
- (id)_animatablePropertyWithProgressMilestones:(id)a3 block:(id)a4;
- (id)_associatedWindowScene;
- (id)_childElementViewControllerWithIdentity:(id)a3;
- (id)_containerViewForGesture:(id)a3 initialLocationInContainerView:(CGPoint *)a4;
- (id)_containerViewForLayoutSpecifier:(id)a3;
- (id)_containerViewForScrollEvent:(id)a3 ofGestureRecognizer:(id)a4 initialLocation:(CGPoint *)a5;
- (id)_containerViewForTouch:(id)a3 ofGestureRecognizer:(id)a4 initialLocation:(CGPoint *)a5;
- (id)_containerViewForViewController:(id)a3;
- (id)_containerViewForViewController:(id)a3 includingOutgoing:(BOOL)a4;
- (id)_containerViewWithInterfaceElementIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4;
- (id)_containerViewWithRank:(unint64_t)a3;
- (id)_containerViewWithRank:(unint64_t)a3 creatingIfNecessary:(BOOL)a4;
- (id)_contextWithOrderedElementViewControllers:(id)a3;
- (id)_currentFirstElement;
- (id)_defaultsContextForDefaults;
- (id)_elementContextsForOrderedElementViewControllers:(id)a3;
- (id)_elementForContainerView:(id)a3;
- (id)_elementViewControllerForLayoutSpecifyingOverrider:(id)a3;
- (id)_elementViewControllerForSizeTransitionWithDescription:(id)a3 fromPreferences:(id)a4;
- (id)_feedbackGeneratorForStyle:(int64_t)a3;
- (id)_floatAnimatablePropertyForTransitionIdentifier:(id)a3;
- (id)_flushActiveRequests;
- (id)_flushElapsedTimerDescriptions;
- (id)_flushPendingInteractionResults;
- (id)_flushPendingTransitionResults;
- (id)_flushSignificantUpdateTransitionAssertions;
- (id)_gestureRecognizerForDescription:(id)a3;
- (id)_keyPathForProperty:(id)a3;
- (id)_layoutAssertionWithMaximumPermittedLayoutMode:(int64_t)a3 reason:(id)a4 creatingIfNecessary:(BOOL)a5;
- (id)_layoutMetrics;
- (id)_layoutSpecifyingOverriderForContainerView:(id)a3;
- (id)_newContainerViewWithInterfaceElementIdentifier:(id)a3;
- (id)_persistentAssertionForElement:(id)a3 withType:(int64_t)a4;
- (id)_platformMetricsContext;
- (id)_popActiveGestureDescriptions;
- (id)_primaryContainerView;
- (id)_propertyUpdateBlockArrayForPropertyIdentity:(id)a3 ofObject:(id)a4 withDescription:(id)a5 withTransitionDescription:(id)a6 forceSingle:(BOOL)a7 behaviorSettingsArray:(id *)a8 updateDescriptionsArray:(id *)a9;
- (id)_valueForProperty:(id)a3 ofDescription:(id)a4;
- (id)applyPersistentAnimationStyle:(int64_t)a3 toElement:(id)a4;
- (id)element:(id)a3 requestsPersistentAnimationOfType:(int64_t)a4;
- (id)keyLineColorValidatorForSystemApertureContainerView:(id)a3;
- (id)layoutModePreferenceForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (id)overrideContainerRenderingStyleAssertion:(int64_t)a3;
- (id)parentViewForBackgroundForSystemApertureContainerView:(id)a3;
- (id)parentViewForSubBackgroundForSystemApertureContainerView:(id)a3;
- (id)registerElement:(id)a3;
- (id)requireHeavyShadowAssertionForTransition;
- (id)requireKeyLineAssertionForTransition;
- (id)restrictSystemApertureToDefaultLayoutWithReason:(id)a3;
- (id)restrictSystemApertureToInertWithReason:(id)a3;
- (id)scenesForBacklightSession;
- (id)systemApertureDebuggingUtilityOrderedContainerViews:(id)a3;
- (id)systemApertureRepresentationSuppressionAssertionForCoversheetVisibility;
- (id)systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility;
- (id)systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility;
- (id)systemApertureRepresentationSuppressionAssertionForSystemChromeSuppression;
- (int64_t)_activeElementInterfaceOrientation;
- (int64_t)_effectiveOverrideRenderingStyle;
- (int64_t)_mostRestrictiveLayoutModeFromActiveLayoutAssertions;
- (int64_t)behaviorOverridingRole;
- (int64_t)cloningStyle;
- (int64_t)systemApertureApertureElementAuthority:(id)a3 preferredLayoutModeForElement:(id)a4;
- (unint64_t)_maximumNumberOfSimultaneouslyVisibleElements;
- (unint64_t)_systemGestureTypeForGesture:(id)a3 systemGestureManager:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)systemApertureApertureElementAuthorityMaximumNumberOfSimultaneouslyVisibleElements:(id)a3;
- (void)_activeElementInterfaceOrientation;
- (void)_addActiveRequest:(id)a3;
- (void)_addActiveSnapshotAssertion:(id)a3;
- (void)_addFloatAnimatablePropertyForTransitionDescriptionIfNecessary:(id)a3 propertyIdentity:(id)a4 milestones:(id)a5;
- (void)_addMitosisBlobEffects;
- (void)_addPendingTransitionResult:(id)a3;
- (void)_addRunLoopObserverIfNecessary;
- (void)_addTimerIfNecessaryForDescription:(id)a3;
- (void)_addZoomAnimationAssertion;
- (void)_animatedTransitionDidReachMilestone:(double)a3 description:(id)a4 propertyIdentity:(id)a5 finished:(BOOL)a6 retargeted:(BOOL)a7;
- (void)_axLayoutSpecifierRequestsDiminishment:(id)a3;
- (void)_axRegisterForZoomUpdatesIfNecessary;
- (void)_axRevealHiddenElementIfPossible;
- (void)_axZoomLevelOrStandbyModeChanged;
- (void)_beginRequiringBacklightAssertionForReason:(id)a3;
- (void)_cancelExternalGesturesForReason:(id)a3;
- (void)_cleanupIndicatorContainerIfNecessary;
- (void)_cleanupViewController:(id)a3;
- (void)_configureGesturesIfNecessary;
- (void)_configureIndicatorContainerView;
- (void)_configureInteractionLongPressIfNecessary;
- (void)_configureLongPressGestureIfNecessary;
- (void)_configurePreferencesStackIfNecessary;
- (void)_configureResizeGestureIfNecessary;
- (void)_configureVariableBlur;
- (void)_elementKeyColorWasInvalidated:(id)a3;
- (void)_endRequiringBacklightAssertionForReason:(id)a3;
- (void)_handleActionsFromPreferences:(id)a3;
- (void)_handleAnyContentsDidChangePreferences:(id)a3 context:(id)a4;
- (void)_handleBackgroundUpdatesFromPreferences:(id)a3 context:(id)a4;
- (void)_handleContainerAndElementUpdatesFromPreferences:(id)a3 orderedElementViewControllers:(id)a4 context:(id)a5;
- (void)_handleContainerDefaultPressGesture:(id)a3;
- (void)_handleContainerParentUpdatesFromPreferences:(id)a3 context:(id)a4;
- (void)_handleContainerResizeGesture:(id)a3;
- (void)_handleCurtainUpdatesFromPreferences:(id)a3;
- (void)_handleDebuggingUtilityWithPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6;
- (void)_handleGestureUpdatesFromPreferences:(id)a3;
- (void)_handleHitTestingUpdatesWithContext:(id)a3;
- (void)_handleInteractionLongPress:(id)a3;
- (void)_handleMitosisBlobUpdatesFromPreferences:(id)a3;
- (void)_handleResizePan:(id)a3;
- (void)_handleResizeResult:(int64_t)a3 withContainerView:(id)a4;
- (void)_handleTelemetryLoggingFromContext:(id)a3;
- (void)_handleTimerUpdatesFromPreferences:(id)a3;
- (void)_invalidateAndRemoveFloatAnimatableProperty:(id)a3 forTransitionIdentifier:(id)a4;
- (void)_invalidatePreferencesForReason:(unsigned int)a3;
- (void)_invertColorsChanged:(id)a3;
- (void)_moveSystemGestureRecognizerIfNecessary:(id)a3 withSystemGestureType:(unint64_t)a4 fromSystemGestureManager:(id)a5 toSystemGestureManager:(id)a6;
- (void)_popActiveGestureDescriptions;
- (void)_postLayoutDidChangeNotificationIfNecessary;
- (void)_promote:(BOOL)a3 gestureRecognizer:(id)a4 toSystemGestureWithManager:(id)a5 type:(unint64_t)a6;
- (void)_pushGestureDescription:(id)a3;
- (void)_pushPendingInteractionResultForElementIdentity:(id)a3 interactionSource:(unint64_t)a4 viewInteractionResult:(int64_t)a5;
- (void)_reduceTransparencyDidChange:(id)a3;
- (void)_reevaluateElementSuppression;
- (void)_removeActiveSnapshotAssertion:(id)a3;
- (void)_removeContainerViewsExceptingThoseWithDescriptions:(id)a3;
- (void)_removeElementViewControllersExceptingThoseWithDescriptions:(id)a3;
- (void)_removeIndicatorViewControllerIfNecessary;
- (void)_removeLayoutAssertionAndReevaluate:(id)a3;
- (void)_removeMitosisBlobEffects;
- (void)_setBlobEnabled:(BOOL)a3;
- (void)_updateAndLayoutIndicatorIfNecessary;
- (void)_updateContainerViewRanks;
- (void)_updateElementOrientationTo:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)_updateObject:(id)a3 withDescription:(id)a4 fromPreferences:(id)a5 conditionalAnimations:(id)a6 conditionalCompletion:(id)a7 context:(id)a8;
- (void)_updatePreferencesForReasonAccessibility:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonActiveDisplayChanged:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonAnimatedPropertyUpdateBegin:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonAnimatedPropertyUpdateEnd:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonCloningOrRenderingStyle:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonDynamicsAnimation:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonElementRequested:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonGestures:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonInitOrDefaults:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonLumaSampling:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonMilestoneReached:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonOrientation:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonReachabilityChanged:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonStackInitiated:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonSystemApertureManager:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonTimerExpired:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesForReasonTransitionEffectAssertion:(unsigned int)a3 updates:(id)a4;
- (void)_updatePreferencesIfNecessary;
- (void)_updatePreferredContentSizeCategoryForAllElements:(id)a3;
- (void)_updatePreferredContentSizeCategoryForElementViewController:(id)a3;
- (void)_updateProperty:(id)a3 ofObject:(id)a4 withDescription:(id)a5 fromPreferences:(id)a6 conditionalAnimations:(id)a7 conditionalCompletion:(id)a8 context:(id)a9;
- (void)_updateStatusBarAvoidanceFrameWithAnimationSettings:(id)a3;
- (void)_updateWithPreferencesFromStack;
- (void)animateDiscreteAnimationStyle:(int64_t)a3 toElement:(id)a4;
- (void)animateTransitionAcceptanceBounceWithVelocityVector:(CGPoint)a3 triggeredBlock:(id)a4;
- (void)animateTransitionEjectionStretchWithVelocityVector:(CGPoint)a3;
- (void)dealloc;
- (void)element:(id)a3 requestsDiscreteAnimationOfType:(int64_t)a4;
- (void)elementRequestsCancellingResizeGesture:(id)a3;
- (void)elementRequestsNegativeResponse:(id)a3;
- (void)elementRequestsSignificantUpdateTransition:(id)a3;
- (void)elementViewControllingDidAppear:(id)a3;
- (void)elementViewControllingDidDisappear:(id)a3;
- (void)elementViewControllingWillAppear:(id)a3;
- (void)elementViewControllingWillDisappear:(id)a3;
- (void)handleReachabilityModeActivated;
- (void)handleReachabilityModeDeactivated;
- (void)hostOrientationDidChangeTo:(int64_t)a3 withPreviousOrientation:(int64_t)a4 context:(id)a5;
- (void)invalidateElementUrgencyPreferences;
- (void)menuPresentationRequestDidChangeForLayoutSpecifier:(id)a3;
- (void)preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:(id)a3;
- (void)preferredLayoutModeDidInvalidateForLayoutSpecifier:(id)a3;
- (void)setActiveWindowScene:(id)a3;
- (void)setBacklightSessionAggregator:(id)a3;
- (void)setCloningStyle:(int64_t)a3;
- (void)setContainerParentCenter:(CGPoint)a3;
- (void)setCurtainViewHoster:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5;
- (void)setSystemApertureAnimationFrameRecording:(BOOL)a3;
- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3;
- (void)setVariableBlurView:(id)a3;
- (void)setVisibilityDelegate:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider:(id)a3;
- (void)systemApertureContainerView:(id)a3 sampledLuminanceLevelChangedTo:(int64_t)a4;
- (void)systemApertureDebuggingUtility:(id)a3 shouldCreateDebuggingLabel:(BOOL)a4;
- (void)systemApertureDebuggingUtility:(id)a3 updateUIForConnectionState:(int)a4;
- (void)systemApertureManagerRequestsHostNeedsLayout:(id)a3;
- (void)systemApertureProximityBacklightPolicy:(id)a3 embedProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5;
- (void)systemApertureProximityBacklightPolicy:(id)a3 removeProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBSystemApertureViewController

- (BOOL)_shouldPerformTransitionOfProperty:(id)a3 ofObject:(id)a4 withDescription:(id)a5 fromPreferences:(id)a6 context:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  int v16 = ![(SBSystemApertureViewController *)self _isProperty:v12 ofObject:v13 equalToDescription:a5];
  if ((v16 & 1) == 0)
  {
    uint64_t v17 = objc_opt_class();
    id v18 = v13;
    if (v17)
    {
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
    id v21 = v19;

    if (!v21)
    {
      LOBYTE(v20) = 0;
LABEL_30:

      goto LABEL_31;
    }
    v22 = v15;
    uint64_t v23 = [v14 effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:v12];
    v37 = [(NSMutableDictionary *)self->_lastAppliedPropertyIdentitiesToTransitionDescriptions objectForKey:v12];
    v24 = [v37 behaviorSettings];
    v38 = (void *)v23;
    v25 = [(id)v23 behaviorSettings];
    LOBYTE(v23) = BSEqualObjects();

    if (v23)
    {
      id v15 = v22;
      if (v16)
      {
LABEL_11:
        LOBYTE(v20) = 1;
        v26 = v38;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      v27 = [(SBSystemApertureViewController *)self _keyPathForProperty:v12];
      uint64_t v28 = objc_opt_class();
      id v29 = v12;
      if (v28)
      {
        if (objc_opt_isKindOfClass()) {
          v30 = v29;
        }
        else {
          v30 = 0;
        }
      }
      else
      {
        v30 = 0;
      }
      id v15 = v22;
      id v31 = v30;

      int v32 = [v31 isContentBoundsProperty];
      if (v32)
      {
        v33 = SBLogSystemAperturePreferencesStack();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349570;
          uint64_t v44 = [v22 queryIteration];
          __int16 v45 = 2112;
          v46 = v27;
          __int16 v47 = 2112;
          id v48 = v21;
          _os_log_debug_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_DEBUG, "[%{public}lu] [NOTE]: Performing transition due to updated behavior settings for UNSUPPORTED '%@' keypath of view '%@'", buf, 0x20u);
        }
      }
      if (objc_msgSend(v21, "sbsa_isPropertyActivelyC2AnimatingForKeyPath:", v27))
      {
        v34 = (void *)MEMORY[0x1E4F42FF0];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __118__SBSystemApertureViewController__shouldPerformTransitionOfProperty_ofObject_withDescription_fromPreferences_context___block_invoke;
        v39[3] = &unk_1E6AF4E00;
        id v40 = v21;
        id v41 = v27;
        id v42 = v22;
        [v34 performWithoutAnimation:v39];

        int v16 = 1;
      }

      if (v16) {
        goto LABEL_11;
      }
    }
    v26 = v38;
    v35 = [v38 milestones];
    v20 = [v35 count];

    if (v20)
    {
      v20 = SBLogSystemAperturePreferencesStack();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[SBSystemApertureViewController _shouldPerformTransitionOfProperty:ofObject:withDescription:fromPreferences:context:]();
      }

      LOBYTE(v20) = 1;
    }
    goto LABEL_29;
  }
  LOBYTE(v20) = 1;
LABEL_31:

  return (char)v20;
}

uint64_t __132__SBSystemApertureViewController__updateObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  int v10 = [v9 isContentBoundsProperty];
  if (v10
    && ((v11 = objc_opt_class(), id v12 = v5, !v11)
      ? (id v13 = 0)
      : (objc_opt_isKindOfClass() & 1) == 0
      ? (id v13 = 0)
      : (id v13 = v12),
        id v14 = v13,
        v12,
        int v15 = [v14 isContentBoundsProperty],
        v14,
        !v15))
  {
    uint64_t v21 = 1;
  }
  else
  {
    uint64_t v16 = objc_opt_class();
    id v17 = v7;
    if (v16)
    {
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }
    id v19 = v18;

    char v20 = [v19 isContentBoundsProperty];
    if (v20)
    {
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v22 = objc_opt_class();
      id v23 = v5;
      if (v22)
      {
        if (objc_opt_isKindOfClass()) {
          v24 = v23;
        }
        else {
          v24 = 0;
        }
      }
      else
      {
        v24 = 0;
      }
      id v25 = v24;

      uint64_t v26 = [v25 isContentBoundsProperty];
      uint64_t v21 = v26 << 63 >> 63;
    }
  }

  return v21;
}

- (BOOL)_isProperty:(id)a3 ofObject:(id)a4 equalToDescription:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v10 interfaceElementProperty];
  id v12 = [(SBSystemApertureViewController *)self _keyPathForProperty:v10];
  id v13 = [(SBSystemApertureViewController *)self _valueForProperty:v10 ofDescription:v9];

  if ((BSEqualStrings() & 1) != 0 || (BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    id v14 = [v8 valueForKeyPath:v12];
    [v14 CGRectValue];
    [v13 CGRectValue];
    char v15 = SBSARectApproximatelyEqualToRect();
  }
  else if ((BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    id v14 = [v8 valueForKeyPath:v12];
    [v14 CGPointValue];
    [v13 CGPointValue];
    char v15 = SBSAPointApproximatelyEqualToPoint();
  }
  else
  {
    id v14 = [v8 valueForKeyPath:v12];
    char v15 = BSEqualObjects();
  }
  BOOL v16 = v15;

  return v16;
}

- (id)_keyPathForProperty:(id)a3
{
  id v3 = a3;
  id v4 = [v3 interfaceElementProperty];
  if (BSEqualStrings())
  {
    id v5 = v4;
    id v4 = @"IDCornerRadius";
  }
  else if (BSEqualStrings())
  {
    id v5 = v4;
    id v4 = @"transform";
  }
  else if (BSEqualStrings())
  {
    id v5 = v4;
    id v4 = @"scalingContentView.transform";
  }
  else if (BSEqualStrings())
  {
    id v5 = v4;
    id v4 = @"scalingContentView.center";
  }
  else if (BSEqualStrings())
  {
    id v5 = v4;
    id v4 = @"scalingContentView.bounds";
  }
  else if (BSEqualStrings())
  {
    id v5 = v4;
    id v4 = @"variableBlurView.hidden";
  }
  else if (BSEqualStrings())
  {
    id v5 = v4;
    id v4 = @"variableBlurView.frame";
  }
  else
  {
    id v5 = [v3 associatedInterfaceElementIdentifier];
    if (BSEqualObjects())
    {
      int v6 = BSEqualStrings();

      if (!v6) {
        goto LABEL_19;
      }
      id v5 = v4;
      id v4 = @"containerParentCenter";
    }
  }

LABEL_19:
  return v4;
}

- (id)_valueForProperty:(id)a3 ofDescription:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 interfaceElementProperty];
  id v8 = [v5 valueForKey:v7];

  id v9 = [v6 interfaceElementProperty];

  if ((BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    [v8 CGSizeValue];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    SBSAAffineTransformFromContentScale((uint64_t)&v15, v10, v11);
    v14[0] = v15;
    v14[1] = v16;
    v14[2] = v17;
    uint64_t v12 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:v14];

    id v8 = (void *)v12;
  }

  return v8;
}

void __64__SBSystemApertureViewController__addRunLoopObserverIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePreferencesIfNecessary];
}

- (void)_updatePreferencesIfNecessary
{
  v1 = SBSAStringFromPreferencesInvalidationReason(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "Updating preferences for reason(s): %@", v4, v5, v6, v7, v8);
}

- (void)_updatePreferencesForReasonSystemApertureManager:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFFF7;
  uint8_t v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      CGFloat v10 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonCloningOrRenderingStyle:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFFEF;
  uint8_t v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      CGFloat v10 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (MTMaterialView)variableBlurView
{
  return self->_variableBlurView;
}

- (void)_updateObject:(id)a3 withDescription:(id)a4 fromPreferences:(id)a5 conditionalAnimations:(id)a6 conditionalCompletion:(id)a7 context:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v13 = a4;
  id v14 = a5;
  id v29 = a6;
  id v28 = a7;
  id v15 = a8;
  v30 = v14;
  long long v16 = [v14 propertiesWithAnimatedTransitionDescriptions];
  long long v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_491];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v24 = [v23 associatedInterfaceElementIdentifier];
        id v25 = [v13 interfaceElementIdentifier];
        int v26 = BSEqualObjects();

        if (v26) {
          [(SBSystemApertureViewController *)self _updateProperty:v23 ofObject:v31 withDescription:v13 fromPreferences:v30 conditionalAnimations:v29 conditionalCompletion:v28 context:v15];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v20);
  }
}

- (void)_updateProperty:(id)a3 ofObject:(id)a4 withDescription:(id)a5 fromPreferences:(id)a6 conditionalAnimations:(id)a7 conditionalCompletion:(id)a8 context:(id)a9
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v86 = a4;
  id v85 = a5;
  id v84 = a6;
  id v90 = a7;
  id v81 = a8;
  id v82 = a9;
  v91 = v14;
  if (v14
    && v86
    && v85
    && v84
    && [(SBSystemApertureViewController *)self _shouldPerformTransitionOfProperty:v14 ofObject:v86 withDescription:v85 fromPreferences:v84 context:v82])
  {
    v80 = [v84 effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:v14];
    if (v80
      && ((uint64_t v15 = objc_opt_class(), v16 = v14, !v15)
        ? (long long v17 = 0)
        : (objc_opt_isKindOfClass() & 1) == 0
        ? (long long v17 = 0)
        : (long long v17 = v16),
          id v18 = v17,
          v16,
          int v19 = [v18 isContentBoundsProperty],
          v18,
          v19))
    {
      uint64_t v20 = [(SBSystemApertureViewController *)self _elementViewControllerForSizeTransitionWithDescription:v85 fromPreferences:v84];
    }
    else
    {
      uint64_t v20 = 0;
    }
    v77 = (void *)v20;
    id v132 = 0;
    id v131 = 0;
    v79 = -[SBSystemApertureViewController _propertyUpdateBlockArrayForPropertyIdentity:ofObject:withDescription:withTransitionDescription:forceSingle:behaviorSettingsArray:updateDescriptionsArray:](self, "_propertyUpdateBlockArrayForPropertyIdentity:ofObject:withDescription:withTransitionDescription:forceSingle:behaviorSettingsArray:updateDescriptionsArray:", v14, v86, v85, &v131);
    id v76 = v132;
    id v75 = v131;
    if (v80)
    {
      uint64_t v21 = [v80 behaviorSettings];
      char v22 = [v21 isUnanimated];

      if ((v22 & 1) == 0)
      {
        lastAppliedPropertyIdentitiesToTransitionDescriptions = self->_lastAppliedPropertyIdentitiesToTransitionDescriptions;
        if (!lastAppliedPropertyIdentitiesToTransitionDescriptions)
        {
          long long v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v34 = self->_lastAppliedPropertyIdentitiesToTransitionDescriptions;
          self->_lastAppliedPropertyIdentitiesToTransitionDescriptions = v33;

          lastAppliedPropertyIdentitiesToTransitionDescriptions = self->_lastAppliedPropertyIdentitiesToTransitionDescriptions;
        }
        [(NSMutableDictionary *)lastAppliedPropertyIdentitiesToTransitionDescriptions setObject:v80 forKey:v14];
        long long v35 = [v80 milestones];
        if ([v35 containsObject:0x1F3348CE8])
        {
          objc_initWeak(&location, self);
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke;
          v126[3] = &unk_1E6B034D0;
          objc_copyWeak(&v129, &location);
          id v127 = v80;
          id v128 = v14;
          v73 = (void *)MEMORY[0x1D948C7A0](v126);
          v36 = (void *)[v35 mutableCopy];
          [v36 removeObject:0x1F3348CE8];

          objc_destroyWeak(&v129);
          objc_destroyWeak(&location);
          uint64_t v37 = v36;
        }
        else
        {
          v73 = 0;
          uint64_t v37 = v35;
        }
        v78 = v37;
        -[SBSystemApertureViewController _addFloatAnimatablePropertyForTransitionDescriptionIfNecessary:propertyIdentity:milestones:](self, "_addFloatAnimatablePropertyForTransitionDescriptionIfNecessary:propertyIdentity:milestones:", v80, v14);
        v38 = [v80 animatedTransitionIdentifier];
        v88 = [(SBSystemApertureViewController *)self _floatAnimatablePropertyForTransitionIdentifier:v38];

        v39 = [v14 interfaceElementProperty];
        id v40 = [v86 _independentlyAnimatableMemberKeyPathsForProperty:v39];
        BOOL v87 = (unint64_t)[v40 count] > 1;

        id v41 = [MEMORY[0x1E4F1CA48] array];
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        id v42 = v79;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v122 objects:v133 count:16];
        if (v43)
        {
          uint64_t v44 = *(void *)v123;
          do
          {
            for (uint64_t i = 0; i != v43; ++i)
            {
              if (*(void *)v123 != v44) {
                objc_enumerationMutation(v42);
              }
              uint64_t v46 = *(void *)(*((void *)&v122 + 1) + 8 * i);
              if ([v41 count])
              {
                v115[0] = MEMORY[0x1E4F143A8];
                v115[1] = 3221225472;
                v115[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_4;
                v115[3] = &unk_1E6AF5300;
                v115[4] = v46;
                __int16 v47 = (void *)MEMORY[0x1D948C7A0](v115);
                [v41 addObject:v47];
              }
              else
              {
                v116[0] = MEMORY[0x1E4F143A8];
                v116[1] = 3221225472;
                v116[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_2;
                v116[3] = &unk_1E6B03520;
                BOOL v121 = v87;
                id v117 = v88;
                uint64_t v119 = v46;
                id v120 = v90;
                id v118 = v91;
                id v48 = (void *)MEMORY[0x1D948C7A0](v116);
                [v41 addObject:v48];
              }
            }
            uint64_t v43 = [v42 countByEnumeratingWithState:&v122 objects:v133 count:16];
          }
          while (v43);
        }

        objc_initWeak(&location, self);
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_6;
        v112[3] = &unk_1E6AF5AF0;
        objc_copyWeak(&v114, &location);
        id v72 = v88;
        id v113 = v72;
        uint64_t v49 = (void *)MEMORY[0x1D948C7A0](v112);
        v108[0] = MEMORY[0x1E4F143A8];
        v108[1] = 3221225472;
        v108[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_7;
        v108[3] = &unk_1E6AFB8D8;
        objc_copyWeak(&v111, &location);
        id v50 = v91;
        id v109 = v50;
        id v51 = v80;
        id v110 = v51;
        v52 = (void *)MEMORY[0x1D948C7A0](v108);
        v53 = NSString;
        v54 = [v50 associatedInterfaceElementIdentifier];
        v55 = [v54 UUIDString];
        v56 = [v50 interfaceElementProperty];
        v57 = [v53 stringWithFormat:@"animated property update: %@ - %@", v55, v56];

        [(SBSystemApertureViewController *)self _beginRequiringBacklightAssertionForReason:v57];
        v100[0] = MEMORY[0x1E4F143A8];
        v100[1] = 3221225472;
        v100[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_8;
        v100[3] = &unk_1E6B03548;
        id v70 = v49;
        id v103 = v70;
        id v71 = v52;
        id v104 = v71;
        id v28 = v73;
        id v105 = v28;
        id v106 = v81;
        id v58 = v50;
        id v101 = v58;
        objc_copyWeak(&v107, &location);
        id v74 = v57;
        id v102 = v74;
        v89 = (void *)MEMORY[0x1D948C7A0](v100);
        if (v77)
        {
          v59 = [SBSystemApertureFluidAnimator alloc];
          v60 = [v51 behaviorSettings];
          v61 = [(SBSystemApertureFluidAnimator *)v59 initWithSettings:v60];

          id v62 = objc_alloc_init(MEMORY[0x1E4F433A0]);
          [v62 _setIsAnimated:1];
          [v62 _setContainerView:self->_containerParent];
          [v62 _setAnimator:v61];
          v63 = [v62 _transitionCoordinator];
          if [v84 isCollisionImminent] && (objc_opt_respondsToSelector()) {
            [v63 setPerformingSystemApertureInertTransition:1];
          }
          v98[0] = MEMORY[0x1E4F143A8];
          v98[1] = 3221225472;
          v98[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_9;
          v98[3] = &unk_1E6AF53F8;
          id v99 = v41;
          v96[0] = MEMORY[0x1E4F143A8];
          v96[1] = 3221225472;
          v96[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_10;
          v96[3] = &unk_1E6B03570;
          id v97 = v89;
          [v63 animateAlongsideTransition:v98 completion:v96];
          v64 = [(SBSystemApertureViewController *)self _valueForProperty:v58 ofDescription:v85];
          [v64 CGRectValue];
          objc_msgSend(v77, "viewWillTransitionToSize:withTransitionCoordinator:", v63, v65, v66);

          [(SBSystemApertureAnimator *)v61 animateTransition:v62];
        }
        else if ((unint64_t)[v41 count] < 2)
        {
          v68 = (void *)MEMORY[0x1E4F42FF0];
          v61 = [v76 objectAtIndexedSubscript:0];
          v69 = [v41 objectAtIndexedSubscript:0];
          objc_msgSend(v68, "sb_animateWithSettings:mode:animations:completion:", v61, 3, v69, v89);
        }
        else
        {
          v67 = (void *)MEMORY[0x1E4FA5E48];
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_11;
          v92[3] = &unk_1E6B03598;
          v93 = v41;
          id v94 = v76;
          id v95 = v75;
          [v67 perform:v92 finalCompletion:v89];

          v61 = v93;
        }

        objc_destroyWeak(&v107);
        objc_destroyWeak(&v111);

        objc_destroyWeak(&v114);
        objc_destroyWeak(&location);

        goto LABEL_47;
      }
      id v23 = [v80 behaviorSettings];
      int v24 = [v23 isUnanimated];

      if (v24)
      {
        id v25 = [v80 milestones];
        uint64_t v26 = [v25 count];

        if (v26) {
          [(SBSystemApertureViewController *)self _animatedTransitionDidReachMilestone:v80 description:v14 propertyIdentity:1 finished:0 retargeted:1.79769313e308];
        }
      }
    }
    v27 = [(NSMutableDictionary *)self->_lastAppliedPropertyIdentitiesToTransitionDescriptions objectForKey:v14];
    id v28 = v27;
    if (v27)
    {
      id v29 = [v27 animatedTransitionIdentifier];
      v30 = [(SBSystemApertureViewController *)self _floatAnimatablePropertyForTransitionIdentifier:v29];

      [(SBSystemApertureViewController *)self _animatedTransitionDidReachMilestone:v28 description:v14 propertyIdentity:1 finished:1 retargeted:1.79769313e308];
      [(SBSystemApertureViewController *)self _invalidateAndRemoveFloatAnimatableProperty:v30 forTransitionIdentifier:0];
      [(NSMutableDictionary *)self->_lastAppliedPropertyIdentitiesToTransitionDescriptions removeObjectForKey:v14];
    }
    id v31 = (void *)MEMORY[0x1E4F42FF0];
    v78 = objc_msgSend(v79, "sbsa_onlyObjectOrNilAssert");
    [v31 _performWithoutRetargetingAnimations:v78];
LABEL_47:
  }
}

void __76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = self;
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

    if (v7) {
      goto LABEL_10;
    }
    uint8_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[4];
    Class v11 = NSClassFromString(&cfstr_Sbsacontextmut.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSystemApertureViewController.m", 1700, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v7 = 0;
LABEL_10:

  id v14 = [(id)a1[4] _defaultsContextForDefaults];
  [v7 setDefaultsContext:v14];

  uint64_t v15 = [(id)a1[4] traitCollection];
  [v15 displayScale];
  objc_msgSend(v7, "setDisplayScale:");

  [v7 setMinimumNumberOfContainers:1];
  objc_msgSend(v7, "setMaximumNumberOfElements:", objc_msgSend((id)a1[4], "_maximumNumberOfSimultaneouslyVisibleElements"));
  [(id)a1[4] minimumSensorRegionFrame];
  objc_msgSend(v7, "setInertContainerFrame:");
  [*(id *)(a1[4] + 1016) bounds];
  objc_msgSend(v7, "setSystemContainerBounds:");
  id v16 = [(id)a1[4] _platformMetricsContext];
  [v7 setPlatformMetrics:v16];

  long long v17 = [(id)a1[4] traitCollection];
  objc_msgSend(v7, "setLayoutDirection:", objc_msgSend(v17, "layoutDirection"));

  objc_msgSend(v7, "setLandscapeScreenEdgeInsets:", 24.0, 21.0, 24.0, 21.0);
  objc_msgSend(v7, "setAccessibilityZoomActiveAndEnabled:", objc_msgSend((id)a1[4], "_axZoomActiveAndEnabled"));
  [v7 setReduceTransparencyEnabled:SBReduceTransparency()];
  objc_msgSend(v7, "setOverrideRenderingStyle:", objc_msgSend((id)a1[4], "_effectiveOverrideRenderingStyle"));
  [v7 setCloningStyle:*(void *)(a1[4] + 1232)];
  id v18 = [*(id *)(a1[4] + 1072) indicatorElementViewController];
  [v7 setIndicatorVisible:v18 != 0];

  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1464));
  uint64_t v20 = [WeakRetained associatedWindowScene];
  objc_msgSend(v7, "setActiveDisplay:", objc_msgSend(v20, "isMainDisplayWindowScene") ^ 1);

  uint64_t v21 = [*(id *)(a1[4] + 1152) anyObject];
  [v7 setAnimatedTransitionInProgress:v21 != 0];

  objc_msgSend(v7, "setHeavyShadowRequiredForTransition:", objc_msgSend(*(id *)(a1[4] + 1200), "count") != 0);
  objc_msgSend(v7, "setKeyLineRequiredForTransition:", objc_msgSend(*(id *)(a1[4] + 1208), "count") != 0);
  char v22 = +[SBReachabilityManager sharedInstance];
  uint64_t v23 = [v22 reachabilityModeActive];

  [v7 setReachabilityActive:v23];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke_2;
  v38[3] = &unk_1E6AF53A0;
  uint64_t v24 = a1[6];
  v38[4] = a1[4];
  v38[5] = v24;
  id v25 = +[SBSAViewDescription instanceWithBlock:v38];
  [v7 setContainerParentViewDescription:v25];

  uint64_t v26 = [(id)a1[4] _elementContextsForOrderedElementViewControllers:a1[5]];
  [v7 setElementContexts:v26];

  v27 = [(id)a1[4] _flushPendingInteractionResults];
  [v7 setElementInteractionResults:v27];

  id v28 = [*(id *)(a1[4] + 1416) allObjects];
  id v29 = objc_msgSend(v28, "bs_mapNoNulls:", &__block_literal_global_553);
  [v7 setElementSnapshotContexts:v29];

  v30 = [(id)a1[4] _flushPendingTransitionResults];
  [v7 setAnimatedTransitionResults:v30];

  id v31 = [(id)a1[4] _flushElapsedTimerDescriptions];
  [v7 setElapsedTimerDescriptions:v31];

  long long v32 = [(id)a1[4] _popActiveGestureDescriptions];
  [v7 setGestureDescriptions:v32];

  long long v33 = objc_msgSend(*(id *)(a1[4] + 1064), "bs_mapNoNulls:", &__block_literal_global_557);
  [v7 setContainerViewDescriptions:v33];

  long long v34 = [(id)a1[4] _flushSignificantUpdateTransitionAssertions];
  if (v34)
  {
    long long v35 = (void *)a1[4];
    v36 = objc_alloc_init(SBSACollisionRequest);
    [v35 _addActiveRequest:v36];

    [v34 invalidateWithReason:@"Added to context"];
  }
  uint64_t v37 = [(id)a1[4] _flushActiveRequests];
  [v7 setRequests:v37];
}

- (unint64_t)_maximumNumberOfSimultaneouslyVisibleElements
{
  if ((unint64_t)(self->_activeElementInterfaceOrientation - 3) < 2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)_popActiveGestureDescriptions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_longPressGestureUpdateQueue count]
    || [(NSMutableArray *)self->_resizeGestureUpdateQueue count])
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    resizeGestureUpdateQueue = self->_resizeGestureUpdateQueue;
    v19[0] = self->_longPressGestureUpdateQueue;
    v19[1] = resizeGestureUpdateQueue;
    id v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 2, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          Class v11 = [v10 firstObject];
          if (v11)
          {
            [v3 addObject:v11];
            [v10 removeObjectAtIndex:0];
          }
          if ([v10 count]) {
            [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:1024];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v7);
    }

    id v12 = v3;
    id v13 = SBLogSystemAperturePreferencesStackGestures();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SBSystemApertureViewController _popActiveGestureDescriptions]();
    }
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

- (id)_platformMetricsContext
{
  uint64_t v4 = objc_alloc_init(SBSAPlatformMetricsContext);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SBSystemApertureViewController__platformMetricsContext__block_invoke;
  v7[3] = &unk_1E6AF53A0;
  v7[4] = self;
  v7[5] = a2;
  id v5 = [(SBSAPlatformMetricsContext *)v4 copyWithBlock:v7];

  return v5;
}

- (id)_flushSignificantUpdateTransitionAssertions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(NSPointerArray *)self->_significantUpdateTransitionAssertions sa_compact];
  id v3 = [(SBSystemApertureViewController *)self _primaryContainerView];
  uint64_t v4 = [v3 elementViewController];
  id v5 = [v4 elementViewProvider];
  uint64_t v6 = [v5 element];

  uint64_t v7 = SAUILayoutSpecifyingOverriderForElement();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v22 = 1248;
  uint64_t v23 = self;
  uint64_t v8 = self->_significantUpdateTransitionAssertions;
  uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    Class v11 = 0;
    uint64_t v12 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v14, "isValid", v22, v23, (void)v24))
        {
          long long v15 = [v14 element];

          if (v15 == v6)
          {
            if ([v7 layoutMode] == 3)
            {
              id v18 = v14;

              Class v11 = v18;
              continue;
            }
            long long v16 = v14;
            long long v17 = @"element not in custom layout mode";
          }
          else
          {
            long long v16 = v14;
            long long v17 = @"element not in primary container";
          }
          [v16 invalidateWithReason:v17];
        }
      }
      uint64_t v10 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v10) {
        goto LABEL_17;
      }
    }
  }
  Class v11 = 0;
LABEL_17:

  int v19 = *(Class *)((char *)&v23->super.super.super.super.isa + v22);
  *(Class *)((char *)&v23->super.super.super.super.isa + v22) = 0;

  id v20 = v11;
  return v20;
}

- (id)_primaryContainerView
{
  return (id)[(NSMutableArray *)self->_orderedContainerViews firstObject];
}

- (id)_flushPendingTransitionResults
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_pendingTransitionResults;
  pendingTransitionResults = v2->_pendingTransitionResults;
  v2->_pendingTransitionResults = 0;

  objc_sync_exit(v2);
  return v3;
}

- (id)_flushPendingInteractionResults
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSMutableArray *)v2->_pendingInteractionResults copy];
  [(NSMutableArray *)v2->_pendingInteractionResults removeAllObjects];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    uint64_t v4 = v3;
  }
  id v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (id)_flushElapsedTimerDescriptions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (void *)[(NSMutableDictionary *)v2->_timerIdentifiersToDescriptionRecords copy];
  id v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [(NSMutableDictionary *)v2->_timerIdentifiersToDescriptionRecords objectForKey:v8];
        if ([v9 isTimerDescriptionElapsed])
        {
          if (!v4) {
            id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          uint64_t v10 = [v9 timerDescription];
          [v4 addObject:v10];

          [(NSMutableDictionary *)v2->_timerIdentifiersToDescriptionRecords removeObjectForKey:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v4;
}

- (id)_flushActiveRequests
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_activeRequests;
  activeRequests = v2->_activeRequests;
  v2->_activeRequests = 0;

  objc_sync_exit(v2);
  return v3;
}

- (id)_elementContextsForOrderedElementViewControllers:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v6 = [(SBSystemApertureViewController *)self viewIfLoaded];
    [v6 bounds];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;

    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __83__SBSystemApertureViewController__elementContextsForOrderedElementViewControllers___block_invoke;
    v19[3] = &unk_1E6B03658;
    id v16 = v15;
    uint64_t v21 = self;
    SEL v22 = a2;
    id v20 = v16;
    uint64_t v23 = v8;
    uint64_t v24 = v10;
    uint64_t v25 = v12;
    uint64_t v26 = v14;
    [v5 enumerateObjectsUsingBlock:v19];
    id v17 = v16;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (int64_t)_effectiveOverrideRenderingStyle
{
  uint64_t v2 = [(NSCountedSet *)self->_overrideRenderingStyleRequests allObjects];
  id v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  id v4 = [v3 firstObject];
  if (v4)
  {
    id v5 = [v3 firstObject];
    int64_t v6 = [v5 integerValue];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (BOOL)_axZoomActiveAndEnabled
{
  if (_AXSZoomTouchEnabled()
    || (uint64_t v3 = [(NSMutableArray *)self->_zoomAnimationAssertions count]) != 0)
  {
    LOBYTE(v3) = self->_zoomServicesReportedAXisZooming;
  }
  return v3;
}

void __76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v18 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v18;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      int64_t v6 = v5;
    }
    else {
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = 0;
  }
  id v7 = v6;

  id v3 = v18;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    Class v11 = NSClassFromString(&cfstr_Sbsaviewdescri.isa);
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSystemApertureViewController.m", 1722, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v18;
LABEL_9:
    id v7 = 0;
  }

  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 1320);
  if (!v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 1320);
    *(void *)(v16 + 1320) = v15;

    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 1320);
  }
  [v7 setInterfaceElementIdentifier:v14];
  [*(id *)(a1 + 32) containerParentCenter];
  objc_msgSend(v7, "setCenter:");
}

- (CGPoint)containerParentCenter
{
  [(SBFTouchPassThroughView *)self->_containerParent center];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_handleCurtainUpdatesFromPreferences:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  magiciansCurtainView = self->_magiciansCurtainView;
  if (v4)
  {
    [v4 curtainRenderingConfiguration];
    [(SBSystemApertureGainMapBackedRendering *)magiciansCurtainView setRenderingConfiguration:v9];
    highLevelMagiciansCurtainView = self->_highLevelMagiciansCurtainView;
    [v5 highLevelCurtainRenderingConfiguration];
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    [(SBSystemApertureGainMapBackedRendering *)magiciansCurtainView setRenderingConfiguration:v9];
    highLevelMagiciansCurtainView = self->_highLevelMagiciansCurtainView;
    memset(v8, 0, sizeof(v8));
  }
  [(SBSystemApertureGainMapBackedRendering *)highLevelMagiciansCurtainView setRenderingConfiguration:v8];
}

- (id)_defaultsContextForDefaults
{
  double v3 = objc_alloc_init(SBSADefaultsContext);
  id v4 = [(SBSADefaultsContext *)v3 copyBySettingSuppressDynamicIslandCompletely:[(SBSystemApertureDefaults *)self->_systemApertureDefaults suppressDynamicIslandCompletely]];

  BOOL v5 = ([(SBSystemApertureDefaults *)self->_systemApertureDefaults alwaysShowSystemApertureInSnapshots] & 1) != 0|| [(SBSystemApertureSettings *)self->_settings suppressHidingInSnapshotsWhileEmpty];
  int64_t v6 = (void *)[v4 copyBySettingAlwaysShowSystemApertureInSnapshots:v5];

  id v7 = objc_msgSend(v6, "copyBySettingNeverRenderSystemApertureFillOnGPU:", -[SBSystemApertureDefaults neverRenderSystemApertureFillOnGPU](self->_systemApertureDefaults, "neverRenderSystemApertureFillOnGPU"));
  uint64_t v8 = objc_msgSend(v7, "copyBySettingAlwaysRenderSystemApertureFillOnGPU:", -[SBSystemApertureDefaults alwaysRenderSystemApertureFillOnGPU](self->_systemApertureDefaults, "alwaysRenderSystemApertureFillOnGPU"));

  BOOL v9 = ([(SBSystemApertureDefaults *)self->_systemApertureDefaults alwaysShowSystemApertureOnClonedDisplays] & 1) != 0|| [(SBSystemApertureSettings *)self->_settings suppressHidingOnClonedDisplayWhileEmpty];
  uint64_t v10 = (void *)[v8 copyBySettingAlwaysShowSystemApertureOnClonedDisplays:v9];

  return v10;
}

void __70__SBSystemApertureViewController__updateAndLayoutIndicatorIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [*(id *)(*(void *)(a1 + 40) + 1032) bounds];
  objc_msgSend(v2, "setFrame:");
  [v2 layoutIfNeeded];
}

uint64_t __76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 containerViewDescription];
}

uint64_t __59__SBSystemApertureViewController__updateContainerViewRanks__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRank:");
}

- (void)systemApertureManagerRequestsHostNeedsLayout:(id)a3
{
}

void __57__SBSystemApertureViewController__platformMetricsContext__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  if (v15)
  {
    double v3 = self;
    id v4 = v15;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        BOOL v5 = v4;
      }
      else {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    Class v10 = NSClassFromString(&cfstr_Sbsaplatformme.isa);
    Class v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSystemApertureViewController.m", 1687, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  uint64_t v13 = [*(id *)(a1 + 32) _layoutMetrics];
  [v13 maximumContinuousCornerRadius];
  objc_msgSend(v6, "setMaximumCornerRadius:");

  [v6 setCustomLayoutSquareCornerRadius:39.0];
  uint64_t v14 = [*(id *)(a1 + 32) _layoutMetrics];
  [v14 maximumContinuousCornerRadius];
  objc_msgSend(v6, "setCustomLayoutSquareLargeCornerRadius:");

  [v6 setCustomLayoutOvalCornerRadius:90.0];
  [*(id *)(*(void *)(a1 + 32) + 1112) tallRectCornerRadius];
  objc_msgSend(v6, "setCustomLayoutTallRectCornerRadius:");
  [v6 setMinimumEdgePadding:4.0];
}

- (CGRect)_indicatorContainerViewFrameInBounds:(CGRect)a3
{
  id v4 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v4 sensorRegionSize];
  BSRectWithSize();

  BOOL v5 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v5 minimumScreenEdgeInsets];

  id v6 = [(SBSystemApertureViewController *)self traitCollection];
  [v6 displayScale];
  UIRectCenteredXInRectScale();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)minimumSensorRegionFrame
{
  double v3 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v3 sensorRegionSize];

  SBRectWithSize();
  id v4 = [(SBSystemApertureViewController *)self view];
  [v4 bounds];
  BOOL v5 = [(SBSystemApertureViewController *)self traitCollection];
  [v5 displayScale];
  uint64_t v20 = v6;
  UIRectCenteredXInRectScale();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v13 minimumScreenEdgeInsets];
  double v15 = v14;

  double v16 = v8;
  double v17 = v15;
  double v18 = v10;
  double v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_layoutMetrics
{
  return (id)[MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (int64_t)behaviorOverridingRole
{
  return 3;
}

- (void)_cleanupViewController:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "bs_endAppearanceTransition");
  [v5 willMoveToParentViewController:0];
  id v4 = [v5 view];
  [v4 removeFromSuperview];

  [v5 removeFromParentViewController];
  if (objc_opt_respondsToSelector()) {
    [v5 removeElementViewControllingObserver:self];
  }
}

- (void)_handleMitosisBlobUpdatesFromPreferences:(id)a3
{
  uint64_t v4 = [a3 isBlobEnabled];
  [(SBSystemApertureViewController *)self _setBlobEnabled:v4];
}

- (void)elementViewControllingWillAppear:(id)a3
{
  double v3 = [a3 elementViewProvider];
  id v4 = [v3 element];

  if (objc_opt_respondsToSelector()) {
    [v4 element:v4 visibilityWillChange:1];
  }
}

- (void)elementViewControllingDidAppear:(id)a3
{
  double v3 = [a3 elementViewProvider];
  id v4 = [v3 element];

  if (objc_opt_respondsToSelector()) {
    [v4 element:v4 visibilityDidChange:1];
  }
}

- (id)registerElement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewProvider];
  uint64_t v6 = [v5 systemApertureLayoutSpecifyingOverrider];
  [v6 addBehaviorOverridingParticipant:self];

  double v7 = [(SAUISystemApertureManager *)self->_systemApertureManager registerElement:v4];
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      [v4 setGestureHandler:self];
    }
    if (objc_opt_respondsToSelector())
    {
      double v8 = [[SBSystemAperturePlatformElementHost alloc] initWithElement:v4 delegate:self];
      [v4 setPlatformElementHost:v8];
      objc_setAssociatedObject(v4, "com.apple.SpringBoard.SystemApertureViewController.platformElementHost", v8, (void *)1);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __50__SBSystemApertureViewController_registerElement___block_invoke;
      v13[3] = &unk_1E6AFB540;
      id v14 = v4;
      [v7 addInvalidationBlock:v13];
    }
    if (objc_opt_respondsToSelector())
    {
      [v4 systemApertureElementAssertionAcquired];
      objc_initWeak(&location, v4);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __50__SBSystemApertureViewController_registerElement___block_invoke_2;
      v10[3] = &unk_1E6AFFF18;
      objc_copyWeak(&v11, &location);
      [v7 addInvalidationBlock:v10];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

void __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _valueForProperty:*(void *)(a1 + 40) ofDescription:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) _keyPathForProperty:*(void *)(a1 + 40)];
  [*(id *)(a1 + 56) setValue:v8 forKeyPath:v2];
  double v3 = *(void **)(a1 + 56);
  id v4 = self;
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

  [v7 layoutIfNeeded];
}

- (void)_configureIndicatorContainerView
{
  double v3 = objc_alloc_init(_SBSystemApertureIndicatorContainerView);
  indicatorContainerView = self->_indicatorContainerView;
  self->_indicatorContainerView = v3;

  [(SBFTouchPassThroughView *)self->_containerParent insertSubview:self->_indicatorContainerView atIndex:0];
  indicatorContainerPortalView = self->_indicatorContainerPortalView;
  if (!indicatorContainerPortalView)
  {
    uint64_t v6 = (_UIPortalView *)objc_alloc_init(MEMORY[0x1E4F43298]);
    id v7 = self->_indicatorContainerPortalView;
    self->_indicatorContainerPortalView = v6;

    [(SBFTouchPassThroughView *)self->_containerParent addSubview:self->_indicatorContainerPortalView];
    objc_initWeak(&location, self);
    id v8 = (void *)SBApp;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __66__SBSystemApertureViewController__configureIndicatorContainerView__block_invoke;
    double v12 = &unk_1E6AF4B10;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v8, "sb_performBlockAfterCATransactionSynchronizedCommit:", &v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    indicatorContainerPortalView = self->_indicatorContainerPortalView;
  }
  -[_UIPortalView setSourceView:](indicatorContainerPortalView, "setSourceView:", self->_indicatorContainerView, v9, v10, v11, v12);
}

void __66__SBSystemApertureViewController__configureIndicatorContainerView__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    [WeakRetained[128] setIndicatorSourceView:WeakRetained[130]];
    id v2 = v3;
  }
}

- (void)_cleanupIndicatorContainerIfNecessary
{
  double v3 = [(_SBSystemApertureIndicatorContainerView *)self->_indicatorContainerView elementViewController];

  if (!v3)
  {
    [(SBSystemApertureCurtainViewHoster *)self->_curtainViewHoster setIndicatorSourceView:0];
    [(_UIPortalView *)self->_indicatorContainerPortalView setSourceView:0];
    [(_UIPortalView *)self->_indicatorContainerPortalView removeFromSuperview];
    indicatorContainerPortalView = self->_indicatorContainerPortalView;
    self->_indicatorContainerPortalView = 0;

    [(_SBSystemApertureIndicatorContainerView *)self->_indicatorContainerView removeFromSuperview];
    indicatorContainerView = self->_indicatorContainerView;
    self->_indicatorContainerView = 0;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v7 = (UIPanGestureRecognizer *)a3;
  id v8 = a4;
  if (self->_resizePanGesture == v7 || (UIPanGestureRecognizer *)self->_interactionLongPressGesture == v7)
  {
    long long v28 = *MEMORY[0x1E4F1DAD8];
    uint64_t v9 = [(SBSystemApertureViewController *)self _containerViewForTouch:v8 ofGestureRecognizer:v7 initialLocation:&v28];
    if (v9)
    {
      uint64_t v10 = v9;
      if ((UIPanGestureRecognizer *)self->_interactionLongPressGesture == v7)
      {
        uint64_t v11 = 1384;
        activeContainerDefaultPressGestureDescription = self->_activeContainerDefaultPressGestureDescription;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveTouch___block_invoke;
        v26[3] = &unk_1E6AF9DA0;
        v27[1] = a2;
        v26[4] = self;
        id v13 = (id *)v27;
        v27[0] = v9;
        id v14 = v26;
      }
      else
      {
        if (self->_resizePanGesture != v7)
        {
LABEL_12:

          BOOL v15 = 1;
          goto LABEL_13;
        }
        uint64_t v11 = 1392;
        activeContainerDefaultPressGestureDescription = self->_activeContainerResizeGestureDescription;
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        uint64_t v21 = __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveTouch___block_invoke_2;
        SEL v22 = &unk_1E6B037E8;
        v24[1] = a2;
        uint64_t v23 = self;
        id v13 = (id *)v24;
        v24[0] = v9;
        long long v25 = v28;
        id v14 = &v19;
      }
      double v16 = (objc_class *)objc_msgSend(activeContainerDefaultPressGestureDescription, "copyWithBlock:", v14, v19, v20, v21, v22, v23, v24[0]);
      double v17 = *(Class *)((char *)&self->super.super.super.super.isa + v11);
      *(Class *)((char *)&self->super.super.super.super.isa + v11) = v16;

      goto LABEL_12;
    }
  }
  if (!-[NSIndexSet containsIndex:](self->_mostRecentTouchIdentifiersHitTestedToAXOverlayChrome, "containsIndex:", [v8 _touchIdentifier]))-[SBSystemApertureViewController _collapseExpandedElementIfPossible](self, "_collapseExpandedElementIfPossible"); {
  BOOL v15 = 0;
  }
LABEL_13:

  return v15;
}

- (id)_containerViewForTouch:(id)a3 ofGestureRecognizer:(id)a4 initialLocation:(CGPoint *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = self->_orderedContainerViews;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v29 = a5;
    uint64_t v13 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        BOOL v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([(SBSystemApertureViewController *)self _isSystemGesture:v9])
        {
          _UISystemGestureLocationForTouchInView();
          double v17 = v16;
          double v19 = v18;
          uint64_t v20 = +[SBReachabilityManager sharedInstance];
          [v20 effectiveReachabilityYOffset];
          double v22 = v19 - v21;
        }
        else
        {
          [v8 locationInView:v15];
          double v17 = v23;
          double v22 = v24;
        }
        if (objc_msgSend(v15, "pointInside:withEvent:", 0, v17, v22))
        {
          id v25 = v15;
          if (v29)
          {
            v29->x = v17;
            v29->y = v22;
          }
          goto LABEL_15;
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  id v25 = 0;
LABEL_15:

  if ([v25 _isInAWindow]) {
    uint64_t v26 = v25;
  }
  else {
    uint64_t v26 = 0;
  }
  id v27 = v26;

  return v27;
}

- (BOOL)_isSystemGesture:(id)a3
{
  id v4 = (UILongPressGestureRecognizer *)a3;
  id v5 = v4;
  if ((UILongPressGestureRecognizer *)self->_resizePanGesture == v4)
  {
    char v6 = 1;
  }
  else if (self->_interactionLongPressGesture == v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
    id v8 = [WeakRetained associatedWindowScene];
    id v9 = [v8 systemGestureManager];
    char v6 = [v9 isSystemGestureRecognizer:self->_interactionLongPressGesture];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_promote:(BOOL)a3 gestureRecognizer:(id)a4 toSystemGestureWithManager:(id)a5 type:(unint64_t)a6
{
  BOOL v8 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v10)
  {
    int v13 = [v11 isSystemGestureRecognizer:v10];
    if (v12 && a6 && v8 && (v13 & 1) == 0)
    {
      id v14 = SBLogSystemApertureController();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        id v19 = v10;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizer priority to system: gestureRecognizer: %{public}@", (uint8_t *)&v18, 0xCu);
      }

      BOOL v15 = [v10 view];
      [v15 removeGestureRecognizer:v10];

      [v12 addGestureRecognizer:v10 withType:a6];
    }
    else if (!v8 && ((v13 ^ 1) & 1) == 0)
    {
      double v16 = SBLogSystemApertureController();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        id v19 = v10;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizer priority to default: gestureRecognizer: %{public}@", (uint8_t *)&v18, 0xCu);
      }

      [v12 removeGestureRecognizer:v10];
      double v17 = [(SBSystemApertureViewController *)self view];
      [v17 addGestureRecognizer:v10];
    }
  }
}

- (void)_postLayoutDidChangeNotificationIfNecessary
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  [(SBSystemApertureViewController *)self minimumSensorRegionFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  memset(&v53, 0, sizeof(v53));
  id v11 = [(SBSystemApertureViewController *)self view];
  uint64_t v12 = [v11 window];
  int v13 = v12;
  if (v12) {
    [v12 transform];
  }
  else {
    memset(&v53, 0, sizeof(v53));
  }

  id v14 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  BOOL v15 = self->_orderedContainerViews;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v50 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        double v21 = [v20 window];
        [v20 bounds];
        objc_msgSend(v21, "convertRect:fromView:", v20);
        CGFloat x = v22;
        CGFloat y = v24;
        CGFloat width = v26;
        CGFloat height = v28;

        v58.origin.CGFloat x = x;
        v58.origin.CGFloat y = y;
        v58.size.CGFloat width = width;
        v58.size.CGFloat height = height;
        if (!CGRectIsEmpty(v58))
        {
          CGAffineTransform v48 = v53;
          if (!CGAffineTransformIsIdentity(&v48))
          {
            CGAffineTransform v48 = v53;
            v59.origin.CGFloat x = x;
            v59.origin.CGFloat y = y;
            v59.size.CGFloat width = width;
            v59.size.CGFloat height = height;
            CGRect v60 = CGRectApplyAffineTransform(v59, &v48);
            CGFloat x = v60.origin.x;
            CGFloat y = v60.origin.y;
            CGFloat width = v60.size.width;
            CGFloat height = v60.size.height;
          }
          *(CGFloat *)__int16 v47 = x;
          *(CGFloat *)&v47[1] = y;
          *(CGFloat *)&v47[2] = width;
          *(CGFloat *)&v47[3] = height;
          long long v30 = [MEMORY[0x1E4F29238] valueWithBytes:v47 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          [v14 addObject:v30];

          v61.origin.CGFloat x = v4;
          v61.origin.CGFloat y = v6;
          v61.size.CGFloat width = v8;
          v61.size.CGFloat height = v10;
          v65.origin.CGFloat x = x;
          v65.origin.CGFloat y = y;
          v65.size.CGFloat width = width;
          v65.size.CGFloat height = height;
          CGRect v62 = CGRectUnion(v61, v65);
          CGFloat v4 = v62.origin.x;
          CGFloat v6 = v62.origin.y;
          CGFloat v8 = v62.size.width;
          CGFloat v10 = v62.size.height;
        }
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v17);
  }

  if (![v14 count])
  {
    *(CGFloat *)uint64_t v46 = v4;
    *(CGFloat *)&v46[1] = v6;
    *(CGFloat *)&v46[2] = v8;
    *(CGFloat *)&v46[3] = v10;
    long long v31 = [MEMORY[0x1E4F29238] valueWithBytes:v46 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [v14 addObject:v31];
  }
  v63.origin.CGFloat x = v4;
  v63.origin.CGFloat y = v6;
  v63.size.CGFloat width = v8;
  v63.size.CGFloat height = v10;
  double MaxY = 0.0;
  if (!CGRectIsNull(v63))
  {
    v64.origin.CGFloat x = v4;
    v64.origin.CGFloat y = v6;
    v64.size.CGFloat width = v8;
    v64.size.CGFloat height = v10;
    double MaxY = CGRectGetMaxY(v64);
  }
  long long v33 = [(SAUISystemApertureManager *)self->_systemApertureManager orderedElementViewControllers];
  long long v34 = objc_msgSend(v33, "bs_map:", &__block_literal_global_588);

  uint64_t v35 = (void *)MEMORY[0x1E4F1CA60];
  v54[0] = @"SBSystemApertureEdgeInsets";
  v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", MaxY, 0.0, 0.0, 0.0);
  v55[0] = v36;
  v54[1] = @"SBSystemApertureFrames";
  uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithArray:v14];
  v55[1] = v37;
  v55[2] = v34;
  v54[2] = @"SBSystemApertureVisibleElementIdentifiers";
  v54[3] = @"SBSystemApertureCanRegisterRecordingIndicator";
  v38 = [NSNumber numberWithBool:1];
  v55[3] = v38;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:4];
  id v40 = [v35 dictionaryWithDictionary:v39];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  id v42 = [WeakRetained associatedWindowScene];
  uint64_t v43 = [v42 _sbDisplayConfiguration];
  uint64_t v44 = [v43 identity];

  if (v44) {
    [v40 setObject:v44 forKey:@"SBSystemApertureOriginatingDisplayIdentity"];
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cachedLayoutDidChangeUserInfo, v40);
    __int16 v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v45 postNotificationName:@"SBSystemApertureLayoutDidChangeNotification" object:self userInfo:self->_cachedLayoutDidChangeUserInfo];
  }
}

uint64_t __63__SBSystemApertureViewController__updatePreferencesIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAndLayoutIndicatorIfNecessary];
  [*(id *)(a1 + 32) _updateWithPreferencesFromStack];
  [*(id *)(a1 + 32) _removeIndicatorViewControllerIfNecessary];
  id v2 = *(void **)(a1 + 32);
  return [v2 _postLayoutDidChangeNotificationIfNecessary];
}

- (void)_updateWithPreferencesFromStack
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] BEGIN QUERY ITERATION", v3, v4, v5, v6, v7);
}

- (BOOL)_collapseExpandedElementIfPossible
{
  uint64_t v2 = [(SAUISystemApertureManager *)self->_systemApertureManager orderedElementViewControllers];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = SAUILayoutSpecifyingOverriderForElementViewController();

  if (v4 && ([v4 isRequestingMenuPresentation] & 1) == 0)
  {
    uint64_t v6 = [v4 preferredLayoutModeAssertion];
    if ([v6 preferredLayoutMode] == 3
      && [v6 layoutModePreferenceMayBeImplicitlyInvalidated])
    {
      [v6 invalidateWithReason:@"dimming view user interaction"];
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateAndLayoutIndicatorIfNecessary
{
  uint64_t v3 = [(SBSystemApertureViewController *)self view];
  [v3 bounds];
  -[SBSystemApertureViewController _indicatorContainerViewFrameInBounds:](self, "_indicatorContainerViewFrameInBounds:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(SAUISystemApertureManager *)self->_systemApertureManager indicatorElementViewController];
  int v13 = [v12 elementViewProvider];
  id v14 = [v13 element];

  uint64_t v34 = 0;
  if ([(SBSystemApertureViewController *)self _shouldSuppressElement:v14 allowsSuppressionForSystemChromeSuppression:0 reason:&v34])
  {

    if (objc_opt_respondsToSelector())
    {
      [v14 suppressForReason:v34];
    }
    else if (objc_opt_respondsToSelector())
    {
      char v15 = 1;
      [v14 setSuppressed:1];
      uint64_t v12 = 0;
      goto LABEL_14;
    }
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  if (objc_opt_respondsToSelector()) {
    [v14 setSuppressed:0];
  }
  if (!v12)
  {
LABEL_13:
    char v15 = 1;
    goto LABEL_14;
  }
  if (!self->_indicatorContainerView)
  {
    [(SBSystemApertureViewController *)self _configureIndicatorContainerView];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __70__SBSystemApertureViewController__updateAndLayoutIndicatorIfNecessary__block_invoke;
    v33[3] = &unk_1E6AF8568;
    v33[4] = self;
    *(double *)&v33[5] = v5;
    *(double *)&v33[6] = v7;
    *(double *)&v33[7] = v9;
    *(double *)&v33[8] = v11;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v33];
  }
  char v15 = 0;
LABEL_14:
  uint64_t v16 = [(_SBSystemApertureIndicatorContainerView *)self->_indicatorContainerView elementViewController];
  uint64_t v17 = v16;
  if (v16 != v12)
  {
    objc_msgSend(v16, "bs_beginAppearanceTransition:animated:", 0, 1);
    [(_SBSystemApertureIndicatorContainerView *)self->_indicatorContainerView setElementViewController:v12];
  }
  if ((v15 & 1) == 0)
  {
    uint64_t v18 = [v12 parentViewController];

    if (v18 == self)
    {
      double v21 = [v12 view];
      indicatorContainerView = self->_indicatorContainerView;
      double v23 = [v21 superview];

      if (indicatorContainerView == v23)
      {
LABEL_24:

        goto LABEL_25;
      }
      [(_SBSystemApertureIndicatorContainerView *)self->_indicatorContainerView addSubview:v21];
    }
    else
    {
      [(SBSystemApertureViewController *)self addChildViewController:v12];
      if (objc_opt_respondsToSelector()) {
        [v12 addElementViewControllingObserver:self];
      }
      id v19 = self->_indicatorContainerView;
      uint64_t v20 = [v12 view];
      [(_SBSystemApertureIndicatorContainerView *)v19 addSubview:v20];

      [v12 didMoveToParentViewController:self];
    }
    double v24 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __70__SBSystemApertureViewController__updateAndLayoutIndicatorIfNecessary__block_invoke_2;
    long long v30 = &unk_1E6AF5290;
    id v25 = v12;
    id v31 = v25;
    long long v32 = self;
    [v24 performWithoutAnimation:&v27];
    objc_msgSend(v25, "bs_beginAppearanceTransition:animated:", 1, 1, v27, v28, v29, v30);
    objc_msgSend(v25, "bs_endAppearanceTransition");
    double v21 = v31;
    goto LABEL_24;
  }
LABEL_25:
  -[_SBSystemApertureIndicatorContainerView setFrame:](self->_indicatorContainerView, "setFrame:", v5, v7, v9, v11);
  [(_SBSystemApertureIndicatorContainerView *)self->_indicatorContainerView layoutIfNeeded];
  -[_UIPortalView setFrame:](self->_indicatorContainerPortalView, "setFrame:", v5, v7, v9, v11);
  double v26 = [v12 view];
  [(_SBSystemApertureIndicatorContainerView *)self->_indicatorContainerView bounds];
  objc_msgSend(v26, "setFrame:");
  [v26 layoutIfNeeded];
}

- (BOOL)_shouldSuppressElement:(id)a3 allowsSuppressionForSystemChromeSuppression:(BOOL)a4 reason:(int64_t *)a5
{
  BOOL v6 = a4;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (objc_opt_respondsToSelector())
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    double v9 = self->_sceneIDsPreferringSuppression;
    uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v66;
      while (2)
      {
        int v13 = a5;
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v66 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([v8 shouldSuppressElementWhilePresentingSceneWithIdentifier:*(void *)(*((void *)&v65 + 1) + 8 * i)])
          {

            int64_t v21 = 1;
            LOBYTE(v22) = 1;
LABEL_24:
            a5 = v13;
            goto LABEL_25;
          }
        }
        uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v65 objects:v72 count:16];
        a5 = v13;
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  BOOL v51 = v6;
  if (objc_opt_respondsToSelector())
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    char v15 = self->_bundleIDsPreferringSuppression;
    uint64_t v16 = [(NSSet *)v15 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      int v13 = a5;
      char v18 = 0;
      uint64_t v19 = *(void *)v62;
      while (2)
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v62 != v19) {
            objc_enumerationMutation(v15);
          }
          if (v18)
          {

            LOBYTE(v22) = 1;
            int64_t v21 = 2;
            goto LABEL_24;
          }
          char v18 = [v8 shouldSuppressElementWhilePresentingAppWithBundleId:*(void *)(*((void *)&v61 + 1) + 8 * j)];
        }
        uint64_t v17 = [(NSSet *)v15 countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (v17) {
          continue;
        }
        break;
      }

      a5 = v13;
      if (v18)
      {
        int64_t v21 = 0;
        LOBYTE(v22) = 1;
        goto LABEL_25;
      }
    }
    else
    {
    }
  }
  if ([(NSSet *)self->_sceneIDsPreferringSuppression count]
    || [(NSSet *)self->_bundleIDsPreferringSuppression count]
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v8 shouldSuppressElementWhilePresentingNoAppsOrScenes] & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v8 shouldSuppressElementWhileOtherElementsPresent])
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      double v24 = [(SAUISystemApertureManager *)self->_systemApertureManager orderedElementViewControllers];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v57 objects:v70 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        obuint64_t j = v24;
        long long v49 = self;
        long long v50 = a5;
        uint64_t v27 = 0;
        uint64_t v28 = *(void *)v58;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v58 != v28) {
              objc_enumerationMutation(obj);
            }
            long long v30 = *(void **)(*((void *)&v57 + 1) + 8 * k);
            id v31 = objc_msgSend(v30, "elementViewProvider", v49, v50);
            uint64_t v32 = [v31 element];
            if ((id)v32 == v8)
            {
            }
            else
            {
              long long v33 = (void *)v32;
              uint64_t v34 = [v30 elementViewProvider];
              [v34 systemApertureLayoutSpecifyingOverrider];
              v36 = id v35 = v8;
              uint64_t v37 = [v36 layoutMode];

              id v8 = v35;
              if (v37 > 0) {
                ++v27;
              }
            }
          }
          uint64_t v26 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
        }
        while (v26);

        self = v49;
        a5 = v50;
        if (v27)
        {
          LOBYTE(v22) = 1;
          int64_t v21 = 4;
          goto LABEL_25;
        }
      }
      else
      {
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v8 shouldSuppressElementWhileOnCoversheet]
      && self->_prefersSuppressionOfElementsDueToCoversheetVisibility)
    {
      LOBYTE(v22) = 1;
      int64_t v21 = 5;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 {
           && [v8 shouldSuppressElementWhileOverLiquidDetectionCriticalUI]
    }
           && self->_prefersSuppressionOfElementsDueToLiquidDetectionVisibility)
    {
      LOBYTE(v22) = 1;
      int64_t v21 = 6;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 {
           && [v8 shouldSuppressElementWhileProximityReaderPresent]
    }
           && self->_prefersSuppressionOfElementsDueToProximityReaderVisibility)
    {
      LOBYTE(v22) = 1;
      int64_t v21 = 7;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v8 shouldIgnoreSystemChromeSuppression] & 1) != 0
        || (objc_opt_respondsToSelector() & 1) != 0
        && ([v8 shouldIgnoreSystemChromeSuppression] & 1) != 0)
      {
        goto LABEL_84;
      }
      if (objc_opt_respondsToSelector())
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v38 = self->_bundleIDsPreferringSuppression;
        uint64_t v39 = [(NSSet *)v38 countByEnumeratingWithState:&v53 objects:v69 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          id v41 = self;
          id v42 = a5;
          uint64_t v43 = *(void *)v54;
          while (2)
          {
            for (uint64_t m = 0; m != v40; ++m)
            {
              if (*(void *)v54 != v43) {
                objc_enumerationMutation(v38);
              }
              if ([v8 shouldIgnoreSystemChromeSuppressionWhilePresentingAppWithBundleId:*(void *)(*((void *)&v53 + 1) + 8 * m)])
              {
                int v45 = 1;
                goto LABEL_77;
              }
            }
            uint64_t v40 = [(NSSet *)v38 countByEnumeratingWithState:&v53 objects:v69 count:16];
            if (v40) {
              continue;
            }
            break;
          }
          int v45 = 0;
LABEL_77:
          a5 = v42;
          self = v41;
        }
        else
        {
          int v45 = 0;
        }
      }
      else
      {
        int v45 = 0;
      }
      if (v45 || !v51 || !self->_suppressForSystemChromeSuppressionAssertion)
      {
LABEL_84:
        if (objc_opt_respondsToSelector())
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
          __int16 v47 = [WeakRetained associatedWindowScene];
          if ([v47 isContinuityDisplayWindowScene])
          {
            char v48 = [v8 shouldSuppressElementWhileOnContinuityDisplay];

            if (v48)
            {
              LOBYTE(v22) = 1;
              int64_t v21 = 10;
              goto LABEL_25;
            }
          }
          else
          {
          }
        }
        if (objc_opt_respondsToSelector())
        {
          int v22 = [v8 requiresSuppressionFromSystemAperture];
          int64_t v21 = 9;
          if (!v22) {
            int64_t v21 = 0;
          }
        }
        else
        {
          int64_t v21 = 0;
          LOBYTE(v22) = 0;
        }
      }
      else
      {
        LOBYTE(v22) = 1;
        int64_t v21 = 8;
      }
    }
  }
  else
  {
    LOBYTE(v22) = 1;
    int64_t v21 = 3;
  }
LABEL_25:
  *a5 = v21;

  return v22;
}

- (void)_setBlobEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBSystemApertureViewController *)self _isBlobEnabled];
  if (v3)
  {
    if (!v5)
    {
      [(SBSystemApertureViewController *)self _addMitosisBlobEffects];
    }
  }
  else if (v5)
  {
    [(SBSystemApertureViewController *)self _removeMitosisBlobEffects];
  }
}

- (void)_removeIndicatorViewControllerIfNecessary
{
  BOOL v3 = [(_SBSystemApertureIndicatorContainerView *)self->_indicatorContainerView elementViewController];

  if (!v3)
  {
    double v4 = [(SBSystemApertureViewController *)self childViewControllers];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__SBSystemApertureViewController__removeIndicatorViewControllerIfNecessary__block_invoke;
    v6[3] = &unk_1E6B03608;
    v6[4] = self;
    BOOL v5 = objc_msgSend(v4, "bs_firstObjectPassingTest:", v6);

    [(SBSystemApertureViewController *)self _cleanupViewController:v5];
    [(SBSystemApertureViewController *)self _cleanupIndicatorContainerIfNecessary];
  }
}

- (BOOL)_isBlobEnabled
{
  uint64_t v2 = [(UIView *)self->_containerBackgroundParent layer];
  BOOL v3 = [v2 filters];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_handleTimerUpdatesFromPreferences:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = objc_msgSend(a3, "timerDescriptions", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBSystemApertureViewController *)self _addTimerIfNecessaryForDescription:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_handleTelemetryLoggingFromContext:(id)a3
{
}

- (void)_handleHitTestingUpdatesWithContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 elementContexts];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 layoutMode];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->_orderedContainerViews;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v11), "layer", (void)v17);
        [v12 setAllowsHitTesting:v6 > 0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  interactionLongPressGesture = self->_interactionLongPressGesture;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  char v15 = [WeakRetained associatedWindowScene];
  uint64_t v16 = [v15 systemGestureManager];
  [(SBSystemApertureViewController *)self _promote:v6 < 1 gestureRecognizer:interactionLongPressGesture toSystemGestureWithManager:v16 type:133];
}

- (void)_handleGestureUpdatesFromPreferences:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [a3 gestureDescriptions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v6 = 138412290;
    long long v13 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "gestureRecognizerState", v13) == 4)
        {
          uint64_t v11 = [(SBSystemApertureViewController *)self _gestureRecognizerForDescription:v10];
          if ([v11 state] >= 1)
          {
            long long v12 = SBLogSystemAperturePreferencesStackGestures();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v13;
              long long v19 = v11;
              _os_log_debug_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEBUG, "Cancelling guesture from stack request: %@", buf, 0xCu);
            }

            objc_msgSend(v11, "sb_cancel");
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)_handleDebuggingUtilityWithPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6
{
  [(SBSystemApertureDebuggingUtility *)self->_debuggingUtility updatedPreferences:a3 context:a4 withStackDepiction:a5 andQueryIteration:self->_queryIteration];
  uint64_t v8 = [(SAUISystemApertureManager *)self->_systemApertureManager registeredElements];
  uint64_t v9 = [v8 count];

  if (!v9) {
    [(SBSystemApertureDebuggingUtility *)self->_debuggingUtility clearBufferEntries];
  }
  queryIterationLabel = self->_queryIterationLabel;
  if (queryIterationLabel)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"System Aperture Query Iteration: %li", a6);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [(UILabel *)queryIterationLabel setText:v11];
  }
}

- (void)_handleContainerParentUpdatesFromPreferences:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 containerParentViewDescription];
  [(SBSystemApertureViewController *)self _updateObject:self withDescription:v8 fromPreferences:v7 conditionalAnimations:0 conditionalCompletion:0 context:v6];
}

- (void)_handleContainerAndElementUpdatesFromPreferences:(id)a3 orderedElementViewControllers:(id)a4 context:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v63 = a4;
  id v64 = a5;
  uint64_t v9 = [v8 elementDescriptions];
  [(SBSystemApertureViewController *)self _removeElementViewControllersExceptingThoseWithDescriptions:v9];
  long long v59 = v9;
  long long v57 = (void *)[v9 mutableCopy];
  long long v65 = v8;
  uint64_t v10 = v8;
  id v11 = self;
  long long v12 = [v10 containerViewDescriptions];
  [(SBSystemApertureViewController *)self _removeContainerViewsExceptingThoseWithDescriptions:v12];
  [(SBSystemApertureViewController *)self _updateContainerViewRanks];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  obuint64_t j = v12;
  long long v66 = self;
  uint64_t v61 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v61)
  {
    uint64_t v60 = *(void *)v82;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v82 != v60) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v81 + 1) + 8 * v13);
        long long v15 = objc_msgSend(v14, "interfaceElementIdentifier", v56);
        long long v16 = [(SBSystemApertureViewController *)v11 _containerViewWithInterfaceElementIdentifier:v15 creatingIfNecessary:1];

        long long v17 = [v14 associatedSystemApertureElementIdentity];
        long long v18 = v17;
        if (v17
          && (v79[0] = MEMORY[0x1E4F143A8],
              v79[1] = 3221225472,
              v79[2] = __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke,
              v79[3] = &unk_1E6B036C0,
              id v80 = v17,
              objc_msgSend(v63, "bs_firstObjectPassingTest:", v79),
              (id v19 = (id)objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v20 = v19;
          long long v62 = v14;
          [v16 setElementViewController:v19];
          int v21 = 1;
          uint64_t v22 = v20;
        }
        else
        {
          double v23 = [v16 elementViewController];
          double v24 = [v23 elementViewProvider];
          uint64_t v25 = [v24 element];
          int v26 = SAElementIdentityEqualToIdentity();

          if (v26) {
            id v20 = v23;
          }
          else {
            id v20 = 0;
          }

          [v16 setElementViewController:0];
          uint64_t v22 = 0;
          id v11 = v66;
          if (!v18)
          {
            uint64_t v29 = 0;
            uint64_t v28 = 0;
            goto LABEL_41;
          }
          long long v62 = v14;
          int v21 = 0;
        }
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_2;
        v77[3] = &unk_1E6AF9440;
        id v78 = v18;
        uint64_t v27 = objc_msgSend(v59, "bs_firstObjectPassingTest:", v77);
        uint64_t v28 = v27;
        uint64_t v29 = 0;
        if (v20 && v27)
        {
          long long v30 = [v27 snapshotReason];
          if (v30 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            uint64_t v29 = [v20 beginRequiringSnapshotForReason:v30];
            if (v29)
            {
              uint64_t v31 = [v28 associatedSystemApertureElementIdentity];
              uint64_t v32 = v11;
              long long v33 = (void *)v31;
              long long v56 = [(SBSystemApertureViewController *)v32 _activeSnapshotAssertionForElementIdentity:v31];

              if (v29 == v56)
              {

                uint64_t v29 = 0;
                id v11 = v66;
              }
              else
              {
                id v11 = v66;
                [(SBSystemApertureViewController *)v66 _removeActiveSnapshotAssertion:v56];
                [(SBSystemApertureViewController *)v66 _addActiveSnapshotAssertion:v29];
              }
            }
          }
          else
          {
            uint64_t v29 = 0;
          }
        }
        if (v28) {
          int v34 = v21;
        }
        else {
          int v34 = 0;
        }
        if (v34 == 1)
        {
          [v57 removeObject:v28];
          id v35 = [v22 parentViewController];

          if (v35 != v11)
          {
            [(SBSystemApertureViewController *)v11 addChildViewController:v22];
            if (objc_opt_respondsToSelector()) {
              [v22 addElementViewControllingObserver:v11];
            }
            objc_msgSend(v22, "didMoveToParentViewController:", v11, v56);
          }
          v36 = objc_msgSend(v22, "view", v56);
          uint64_t v37 = [v36 superview];
          char v38 = [v37 isDescendantOfView:v16];

          if ((v38 & 1) == 0)
          {
            uint64_t v39 = [v22 view];
            [v16 addContentSubview:v39];
          }
          int v40 = [v28 appearState];
          id v11 = v66;
          long long v14 = v62;
          if (v40 == 3) {
            goto LABEL_39;
          }
          if (v40 != 2)
          {
            if (v40 != 1) {
              goto LABEL_41;
            }
LABEL_39:
            objc_msgSend(v22, "bs_beginAppearanceTransition:animated:", v40 == 1, 1);
            goto LABEL_41;
          }
          objc_msgSend(v22, "bs_endAppearanceTransition");
        }
        else
        {
          long long v14 = v62;
        }
LABEL_41:
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_3;
        v75[3] = &unk_1E6B036E8;
        v75[4] = v11;
        id v41 = v65;
        id v76 = v41;
        [(SBSystemApertureViewController *)v11 _updateObject:v16 withDescription:v14 fromPreferences:v41 conditionalAnimations:v75 conditionalCompletion:0 context:v64];
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_4;
        v73[3] = &unk_1E6B03710;
        id v74 = v29;
        id v42 = v29;
        [(SBSystemApertureViewController *)v11 _updateObject:v20 withDescription:v28 fromPreferences:v41 conditionalAnimations:0 conditionalCompletion:v73 context:v64];

        if (v18)
        {

          uint64_t v22 = v80;
        }
        else
        {
        }
        ++v13;
      }
      while (v61 != v13);
      uint64_t v43 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
      uint64_t v61 = v43;
    }
    while (v43);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v44 = v57;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v69 objects:v85 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v70 != v47) {
          objc_enumerationMutation(v44);
        }
        long long v49 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        long long v50 = objc_msgSend(v49, "associatedSystemApertureElementIdentity", v56);
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_5;
        v67[3] = &unk_1E6B036C0;
        id v51 = v50;
        id v68 = v51;
        long long v52 = objc_msgSend(v63, "bs_firstObjectPassingTest:", v67);
        long long v53 = v52;
        if (v52)
        {
          id v54 = v52;
        }
        else
        {
          id v54 = [(SBSystemApertureViewController *)v66 _childElementViewControllerWithIdentity:v51];
        }
        long long v55 = v54;

        if ([v49 appearState] == 3) {
          objc_msgSend(v55, "bs_beginAppearanceTransition:animated:", 0, 1);
        }
        [(SBSystemApertureViewController *)v66 _updateObject:v55 withDescription:v49 fromPreferences:v65 conditionalAnimations:0 conditionalCompletion:0 context:v64];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v69 objects:v85 count:16];
    }
    while (v46);
  }
}

- (void)_updateContainerViewRanks
{
}

- (void)_removeElementViewControllersExceptingThoseWithDescriptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = [(SBSystemApertureViewController *)self childViewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (![(SBSystemApertureViewController *)self _isIndicatorElementViewController:v9]&& (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v10 = v9;
          id v11 = [v10 elementViewProvider];
          long long v12 = [v11 element];

          if (v12)
          {
            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            v15[2] = __94__SBSystemApertureViewController__removeElementViewControllersExceptingThoseWithDescriptions___block_invoke;
            v15[3] = &unk_1E6AF9440;
            id v16 = v12;
            if ((objc_msgSend(v14, "bs_containsObjectPassingTest:", v15) & 1) == 0)
            {
              [(SBSystemApertureViewController *)self _cleanupViewController:v10];
              uint64_t v13 = [(SBSystemApertureViewController *)self _containerViewForViewController:v10];
              [v13 setElementViewController:0];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)_removeContainerViewsExceptingThoseWithDescriptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = (id *)&v5->super.super.super.super.isa;
  uint64_t v6 = (void *)[(NSMutableArray *)v5->_orderedContainerViews copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __86__SBSystemApertureViewController__removeContainerViewsExceptingThoseWithDescriptions___block_invoke;
        v12[3] = &unk_1E6AFBBB8;
        v12[4] = v10;
        if ((objc_msgSend(v4, "bs_containsObjectPassingTest:", v12) & 1) == 0)
        {
          [v10 removeFromSuperview];
          [obj[133] removeObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  objc_sync_exit(obj);
}

- (void)_handleBackgroundUpdatesFromPreferences:(id)a3 context:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [v8 backgroundBlurDescription];
  if (v7) {
    [(SBSystemApertureViewController *)self _updateObject:self withDescription:v7 fromPreferences:v8 conditionalAnimations:0 conditionalCompletion:0 context:v6];
  }
}

- (void)_handleAnyContentsDidChangePreferences:(id)a3 context:(id)a4
{
  BOOL v5 = SBSAContextAndPreferencesRepresentAnyContentVisible(a4, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityDelegate);
  if (self->_systemApertureContainsAnyContent != v5)
  {
    self->_systemApertureContainsAnyContent = v5;
    id v7 = WeakRetained;
    [WeakRetained systemApertureViewController:self containsAnyContent:v5];
    id WeakRetained = v7;
  }
}

- (void)_handleActionsFromPreferences:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = objc_msgSend(a3, "actions", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * v8);
        uint64_t v10 = objc_opt_class();
        id v11 = v9;
        if (v10)
        {
          if (objc_opt_isKindOfClass()) {
            long long v12 = v11;
          }
          else {
            long long v12 = 0;
          }
        }
        else
        {
          long long v12 = 0;
        }
        id v13 = v12;

        BOOL v14 = [(SBSystemApertureViewController *)self _handlePreferencesDidChangeAction:v13];
        if (!v14)
        {
          uint64_t v15 = objc_opt_class();
          id v16 = v11;
          if (v15) {
            id v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v16 : 0;
          }
          else {
            id v17 = 0;
          }
          id v18 = v17;

          BOOL v19 = [(SBSystemApertureViewController *)self _handleContainerTapAction:v18];
          if (!v19)
          {
            uint64_t v20 = objc_opt_class();
            id v21 = v16;
            if (v20) {
              id v22 = (objc_opt_isKindOfClass() & 1) != 0 ? v21 : 0;
            }
            else {
              id v22 = 0;
            }
            id v23 = v22;

            BOOL v24 = [(SBSystemApertureViewController *)self _handleContainerPressAction:v23];
            if (!v24)
            {
              uint64_t v25 = objc_opt_class();
              id v26 = v21;
              if (v25) {
                id v27 = (objc_opt_isKindOfClass() & 1) != 0 ? v26 : 0;
              }
              else {
                id v27 = 0;
              }
              id v28 = v27;

              BOOL v29 = [(SBSystemApertureViewController *)self _handleImpactFeedbackAction:v28];
              if (!v29)
              {
                uint64_t v30 = objc_opt_class();
                id v31 = v26;
                if (v30) {
                  id v32 = (objc_opt_isKindOfClass() & 1) != 0 ? v31 : 0;
                }
                else {
                  id v32 = 0;
                }
                id v33 = v32;

                BOOL v34 = [(SBSystemApertureViewController *)self _handleContainerResizeAction:v33];
                if (!v34)
                {
                  uint64_t v35 = objc_opt_class();
                  id v36 = v31;
                  if (v35)
                  {
                    if (objc_opt_isKindOfClass()) {
                      uint64_t v37 = v36;
                    }
                    else {
                      uint64_t v37 = 0;
                    }
                  }
                  else
                  {
                    uint64_t v37 = 0;
                  }
                  id v38 = v37;

                  [(SBSystemApertureViewController *)self _handleCalloutBlockAction:v38];
                }
              }
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v6);
  }
}

- (id)_contextWithOrderedElementViewControllers:(id)a3
{
  id v5 = a3;
  unint64_t queryIteration = self->_queryIteration;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke;
  v10[3] = &unk_1E6AF9DA0;
  id v11 = v5;
  SEL v12 = a2;
  void v10[4] = self;
  id v7 = v5;
  uint64_t v8 = +[SBSAContext instanceWithQueryIteration:queryIteration block:v10];

  return v8;
}

- (id)_containerViewWithInterfaceElementIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    orderedContainerViews = v7->_orderedContainerViews;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__SBSystemApertureViewController__containerViewWithInterfaceElementIdentifier_creatingIfNecessary___block_invoke;
    v16[3] = &unk_1E6B035E0;
    id v9 = v6;
    id v17 = v9;
    id v10 = [(NSMutableArray *)orderedContainerViews bs_firstObjectPassingTest:v16];
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = !v4;
    }
    if (!v11)
    {
      id v10 = [(SBSystemApertureViewController *)v7 _newContainerViewWithInterfaceElementIdentifier:v9];
      SEL v12 = v7->_orderedContainerViews;
      if (!v12)
      {
        id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        BOOL v14 = v7->_orderedContainerViews;
        v7->_orderedContainerViews = v13;

        SEL v12 = v7->_orderedContainerViews;
      }
      [(NSMutableArray *)v12 addObject:v10];
      [(SBFTouchPassThroughView *)v7->_containerParent insertSubview:v10 belowSubview:v7->_magiciansCurtainView];
    }

    objc_sync_exit(v7);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __86__SBSystemApertureViewController__removeContainerViewsExceptingThoseWithDescriptions___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 interfaceElementIdentifier];
  BOOL v4 = [*(id *)(a1 + 32) interfaceElementIdentifier];
  uint64_t v5 = BSEqualObjects();

  return v5;
}

- (void)zStackParticipantDidChange:(id)a3
{
  int v4 = [a3 systemApertureSuppressedForSystemChromeSuppression];
  suppressForSystemChromeSuppressionAssertion = self->_suppressForSystemChromeSuppressionAssertion;
  if (v4)
  {
    if (suppressForSystemChromeSuppressionAssertion) {
      goto LABEL_6;
    }
    id v6 = [(SBSystemApertureViewController *)self systemApertureRepresentationSuppressionAssertionForSystemChromeSuppression];
    id v7 = self->_suppressForSystemChromeSuppressionAssertion;
    self->_suppressForSystemChromeSuppressionAssertion = v6;
  }
  else
  {
    self->_suppressForSystemChromeSuppressionAssertion = 0;
    id v7 = suppressForSystemChromeSuppressionAssertion;

    [(BSInvalidatable *)v7 invalidate];
  }

LABEL_6:
  [(SBSystemApertureViewController *)self _reevaluateElementSuppression];
}

- (id)systemApertureRepresentationSuppressionAssertionForSystemChromeSuppression
{
  BOOL v3 = [_SBSystemApertureRepresentationSuppressionAssertion alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __108__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForSystemChromeSuppression__block_invoke;
  v6[3] = &unk_1E6B033C0;
  v6[4] = self;
  int v4 = [(_SBSystemApertureRepresentationSuppressionAssertion *)v3 initWithCoverSheetVisible:0 liquidDetectionVisible:0 proximityReaderVisible:0 suppressForSystemChromeSuppression:1 invalidationBlock:v6];
  [(NSMutableSet *)self->_systemApertureSuppressionAssertions addObject:v4];
  [(SBSystemApertureViewController *)self _reevaluateElementSuppression];
  return v4;
}

- (void)_reevaluateElementSuppression
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  BOOL v3 = self->_systemApertureSuppressionAssertions;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v3);
        }
        SEL v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v9 |= [v12 isCoverSheetVisible];
        v6 |= [v12 isLiquidDetectionVisible];
        v7 |= [v12 isProximityReaderVisible];
        v8 |= [v12 suppressForSystemChromeSuppression];
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v34 objects:v50 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
    LOBYTE(v7) = 0;
    LOBYTE(v8) = 0;
    LOBYTE(v9) = 0;
  }

  id v13 = [(SBFZStackParticipant *)self->_zStackParticipant associatedSceneIdentifiersToSuppressInSystemAperture];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    id v16 = [(SBFZStackParticipant *)self->_zStackParticipant associatedSceneIdentifiersToSuppressInSystemAperture];
    [v15 unionSet:v16];
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v17 = [(SBFZStackParticipant *)self->_zStackParticipant associatedBundleIdentifiersToSuppressInSystemAperture];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    BOOL v19 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v20 = [(SBFZStackParticipant *)self->_zStackParticipant associatedBundleIdentifiersToSuppressInSystemAperture];
    [v19 unionSet:v20];
  }
  else
  {
    BOOL v19 = 0;
  }
  int v32 = BSEqualSets();
  int v21 = BSEqualSets();
  prefersSuppressionOfElementsDueToCoversheetVisibilitCGFloat y = self->_prefersSuppressionOfElementsDueToCoversheetVisibility;
  prefersSuppressionOfElementsDueToLiquidDetectionVisibilitCGFloat y = self->_prefersSuppressionOfElementsDueToLiquidDetectionVisibility;
  int v31 = v21;
  int prefersSuppressionOfElementsDueToSystemChromeSuppression = self->_prefersSuppressionOfElementsDueToSystemChromeSuppression;
  prefersSuppressionOfElementsDueToProximityReaderVisibilitCGFloat y = self->_prefersSuppressionOfElementsDueToProximityReaderVisibility;
  int v22 = v8 & 1;
  id v23 = (NSSet *)[v15 copy];
  sceneIDsPreferringSuppression = self->_sceneIDsPreferringSuppression;
  self->_sceneIDsPreferringSuppression = v23;

  uint64_t v25 = (NSSet *)[v19 copy];
  bundleIDsPreferringSuppression = self->_bundleIDsPreferringSuppression;
  self->_bundleIDsPreferringSuppression = v25;

  self->_prefersSuppressionOfElementsDueToCoversheetVisibilitCGFloat y = v9 & 1;
  self->_prefersSuppressionOfElementsDueToLiquidDetectionVisibilitCGFloat y = v6 & 1;
  self->_prefersSuppressionOfElementsDueToProximityReaderVisibilitCGFloat y = v7 & 1;
  self->_int prefersSuppressionOfElementsDueToSystemChromeSuppression = v22;
  if (prefersSuppressionOfElementsDueToCoversheetVisibility != (v9 & 1)
    || !v32
    || !v31
    || prefersSuppressionOfElementsDueToLiquidDetectionVisibility != (v6 & 1)
    || prefersSuppressionOfElementsDueToProximityReaderVisibility != (v7 & 1)
    || prefersSuppressionOfElementsDueToSystemChromeSuppression != v22)
  {
    id v27 = SBLogSystemApertureController();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110402;
      int v39 = v9 & 1;
      __int16 v40 = 1024;
      int v41 = v6 & 1;
      __int16 v42 = 1024;
      int v43 = v7 & 1;
      __int16 v44 = 1024;
      int v45 = v22;
      __int16 v46 = 2114;
      uint64_t v47 = v19;
      __int16 v48 = 2114;
      long long v49 = v15;
      _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "Invalidating promoted elements with coversheet suppression %{BOOL}u liquid detection suppression %{BOOL}u proximity reader suppression %{BOOL}u system chrome suppression %{BOOL}u bundleIDs %{public}@ sceneIds %{public}@", buf, 0x2Eu);
    }

    [(SAUISystemApertureManager *)self->_systemApertureManager invalidatePromotedElements];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  int v7 = (UIPanGestureRecognizer *)a3;
  id v8 = a4;
  int v9 = v8;
  if (self->_resizePanGesture != v7 && (UIPanGestureRecognizer *)self->_interactionLongPressGesture != v7) {
    goto LABEL_12;
  }
  uint64_t v10 = [v8 type];
  if (!v10)
  {
    BOOL v16 = 1;
    SBHIDEventTouchIdentifiersForHitTestCategory([v9 _hidEvent], 1);
    id v17 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    mostRecentTouchIdentifiersHitTestedToAXOverlayChrome = self->_mostRecentTouchIdentifiersHitTestedToAXOverlayChrome;
    self->_mostRecentTouchIdentifiersHitTestedToAXOverlayChrome = v17;

    goto LABEL_13;
  }
  if (v10 != 10)
  {
LABEL_12:
    BOOL v16 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (long long v24 = *MEMORY[0x1E4F1DAD8],
        [(SBSystemApertureViewController *)self _containerViewForScrollEvent:v9 ofGestureRecognizer:v7 initialLocation:&v24], (BOOL v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    [(SBSystemApertureViewController *)self _collapseExpandedElementIfPossible];
    goto LABEL_12;
  }
  SEL v12 = v11;
  if (self->_resizePanGesture == v7)
  {
    activeContainerResizeGestureDescription = self->_activeContainerResizeGestureDescription;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveEvent___block_invoke;
    v20[3] = &unk_1E6B037E8;
    SEL v22 = a2;
    v20[4] = self;
    id v21 = v11;
    long long v23 = v24;
    uint64_t v14 = [(SBSAGestureDescription *)activeContainerResizeGestureDescription copyWithBlock:v20];
    uint64_t v15 = self->_activeContainerResizeGestureDescription;
    self->_activeContainerResizeGestureDescription = v14;
  }
  BOOL v16 = 1;
LABEL_13:

  return v16;
}

BOOL __99__SBSystemApertureViewController__containerViewWithInterfaceElementIdentifier_creatingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 interfaceElementIdentifier];
  if (BSEqualObjects())
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [v2 interfaceElementIdentifier];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (void)element:(id)a3 requestsDiscreteAnimationOfType:(int64_t)a4
{
  id v7 = a3;
  id v18 = v7;
  switch(a4)
  {
    case 1:
      if (!v7)
      {
        id v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2, self, @"SBSystemApertureViewController.m", 2949, @"Invalid parameter not satisfying: %@", @"element != nil" object file lineNumber description];
      }
      id v8 = [SBSAShakeRequest alloc];
      int v9 = [[SBSAElementIdentification alloc] initWithElementIdentification:v18];
      uint64_t v10 = [(SBSAShakeRequest *)v8 initWithParticipantIdentifier:v9];
      goto LABEL_6;
    case 2:
      BOOL v11 = [SBSAPulseRequest alloc];
      int v9 = [[SBSAElementIdentification alloc] initWithElementIdentification:v18];
      uint64_t v10 = [(SBSAPulseRequest *)v11 initWithParticipantIdentifier:v9 pulseStyle:0];
LABEL_6:
      SEL v12 = (void *)v10;
      [(SBSystemApertureViewController *)self _addActiveRequest:v10];

      goto LABEL_10;
    case 3:
      if (![(SBSystemApertureSettings *)self->_settings pulseIndicatorEnabled]) {
        goto LABEL_11;
      }

      id v13 = [SBSAPulseRequest alloc];
      uint64_t v14 = [[SBSAElementIdentification alloc] initWithElementIdentification:0];
      uint64_t v15 = [(SBSAPulseRequest *)v13 initWithParticipantIdentifier:v14 pulseStyle:1];
      [(SBSystemApertureViewController *)self _addActiveRequest:v15];

      [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:256];
      id v7 = 0;
      break;
    case 4:
      BOOL v16 = objc_alloc_init(SBSAEjectRequest);
      [(SBSystemApertureViewController *)self _addActiveRequest:v16];

LABEL_10:
      [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:256];
LABEL_11:
      id v7 = v18;
      break;
    default:
      break;
  }
}

- (BOOL)_isIndicatorElementViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(_SBSystemApertureIndicatorContainerView *)self->_indicatorContainerView elementViewController];
    int v6 = (void *)v5;
    if (v5)
    {
      char v7 = v5 == (void)v4;
    }
    else
    {
      id v8 = [v4 viewIfLoaded];
      char v7 = [v8 isDescendantOfView:self->_indicatorContainerView];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_invalidatePreferencesForReason:(unsigned int)a3
{
  self->_preferencesInvalidationReasons |= a3;
}

- (void)setCloningStyle:(int64_t)a3
{
  if (self->_cloningStyle != a3)
  {
    self->_cloningStyle = a3;
    [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:16];
  }
}

- (CGRect)interSensorRegionInContentView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v5 interSensorRegionInWindowSpace];
  objc_msgSend(v4, "convertRect:fromView:", 0);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

uint64_t __70__SBSystemApertureViewController__updateAndLayoutIndicatorIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1032), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(*(void *)(a1 + 32) + 1040);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

- (id)_propertyUpdateBlockArrayForPropertyIdentity:(id)a3 ofObject:(id)a4 withDescription:(id)a5 withTransitionDescription:(id)a6 forceSingle:(BOOL)a7 behaviorSettingsArray:(id *)a8 updateDescriptionsArray:(id *)a9
{
  BOOL v9 = a7;
  double v13 = a9;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  long long v70 = [MEMORY[0x1E4F1CA48] array];
  long long v69 = [MEMORY[0x1E4F1CA48] array];
  long long v65 = [MEMORY[0x1E4F1CA48] array];
  id v18 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v19 = [v17 keyPathsWithAuxillaryBehaviorSettings];
  uint64_t v20 = [v18 setWithArray:v19];

  id v64 = v20;
  if (![v20 count]) {
    goto LABEL_13;
  }
  id v21 = self;
  id v22 = v15;
  if (v21) {
    id v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
  }
  else {
    id v23 = 0;
  }

  if (!v23) {
    goto LABEL_13;
  }
  long long v24 = [v14 interfaceElementProperty];
  uint64_t v25 = [v22 _independentlyAnimatableMemberKeyPathsForProperty:v24];
  int v26 = [v25 intersectsSet:v64];

  if (v26 && !v9)
  {
    id v60 = v15;
    id v27 = [(SBSystemApertureViewController *)self _keyPathForProperty:v14];
    id v28 = [v22 _independentlyAnimatableMemberKeyPathsForProperty:v27];
    BOOL v29 = [v17 keyPathsWithAuxillaryBehaviorSettings];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_2;
    v87[3] = &unk_1E6B006C8;
    id v30 = v28;
    id v88 = v30;
    int v31 = objc_msgSend(v29, "bs_filter:", v87);
    int v32 = (void *)[v31 mutableCopy];

    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_3;
    v85[3] = &unk_1E6AF4A20;
    id v33 = v32;
    id v86 = v33;
    long long v34 = objc_msgSend(v30, "bs_filter:", v85);
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_4;
    v79[3] = &unk_1E6B00308;
    void v79[4] = self;
    id v61 = v14;
    id v35 = v14;
    id v80 = v35;
    id v59 = v16;
    id v66 = v16;
    id v81 = v66;
    long long v36 = v17;
    id v37 = v22;
    id v82 = v37;
    id v58 = v34;
    id v83 = v58;
    id v38 = v27;
    id v84 = v38;
    int v39 = (void *)MEMORY[0x1D948C7A0](v79);
    [v70 addObject:v39];

    long long v67 = v36;
    __int16 v40 = [v36 behaviorSettings];
    [v69 addObject:v40];

    [v65 addObject:@"Base"];
    if ([v33 count])
    {
      do
      {
        int v41 = objc_msgSend(v33, "lastObject", v58);
        [v33 removeLastObject];
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_5;
        v77[3] = &unk_1E6AF4A20;
        id v42 = v33;
        id v78 = v42;
        int v43 = objc_msgSend(v30, "bs_filter:", v77);
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_6;
        v71[3] = &unk_1E6B00308;
        v71[4] = self;
        id v72 = v35;
        id v73 = v66;
        id v74 = v37;
        id v75 = v43;
        id v76 = v38;
        id v44 = v43;
        id v45 = v37;
        id v46 = v35;
        id v47 = v38;
        __int16 v48 = (void *)MEMORY[0x1D948C7A0](v71);
        [v70 addObject:v48];

        long long v49 = [v67 auxillaryBehaviorSettingsForKeyPath:v41];
        [v69 addObject:v49];

        id v38 = v47;
        id v35 = v46;
        id v37 = v45;
        [v65 addObject:v41];
      }
      while ([v42 count]);
    }

    id v15 = v60;
    id v14 = v61;
    double v13 = a9;
    id v16 = v59;
    id v17 = v67;
    uint64_t v51 = v69;
    long long v50 = v70;
  }
  else
  {
LABEL_13:
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke;
    v89[3] = &unk_1E6AF59B8;
    v89[4] = self;
    id v90 = v14;
    id v91 = v16;
    id v92 = v15;
    long long v52 = (void *)MEMORY[0x1D948C7A0](v89);
    long long v50 = v70;
    [v70 addObject:v52];

    uint64_t v51 = v69;
    if (v17)
    {
      long long v53 = [v17 behaviorSettings];
      [v69 addObject:v53];
    }
    [v65 addObject:@"Only update block"];
  }
  if (a8)
  {
    uint64_t v54 = [v51 count];
    if (v54 != [v50 count] && (unint64_t)objc_msgSend(v50, "count") >= 2)
    {
      long long v57 = [MEMORY[0x1E4F28B00] currentHandler];
      [v57 handleFailureInMethod:a2 object:self file:@"SBSystemApertureViewController.m" lineNumber:1125 description:@"Only allowed to have missing behavior settings if [propertyUpdateBlocks count] == 1"];
    }
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v51, v58);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v13)
  {
    *double v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v65];
  }
  long long v55 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v50, v58);

  return v55;
}

- (void)_configureInteractionLongPressIfNecessary
{
  if (!self->_interactionLongPressGesture)
  {
    double v3 = [[SBSystemApertureLongPressGestureRecognizer alloc] initWithTarget:self action:sel__handleInteractionLongPress_];
    interactionLongPressGesture = self->_interactionLongPressGesture;
    self->_interactionLongPressGesture = &v3->super;

    [(UILongPressGestureRecognizer *)self->_interactionLongPressGesture setName:@"longPressSystemAperture"];
    [(UILongPressGestureRecognizer *)self->_interactionLongPressGesture setMinimumPressDuration:0.0];
    [(UILongPressGestureRecognizer *)self->_interactionLongPressGesture setCancelsTouchesInView:0];
    [(UILongPressGestureRecognizer *)self->_interactionLongPressGesture setDelaysTouchesBegan:0];
    [(UILongPressGestureRecognizer *)self->_interactionLongPressGesture setDelaysTouchesEnded:0];
    [(UILongPressGestureRecognizer *)self->_interactionLongPressGesture setDelegate:self];
    id v5 = [(SBSystemApertureViewController *)self view];
    [v5 addGestureRecognizer:self->_interactionLongPressGesture];
  }
}

- (SBSystemApertureViewController)initWithActiveWindowScene:(id)a3
{
  v61[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)SBSystemApertureViewController;
  id v5 = [(SBSystemApertureViewController *)&v59 initWithNibName:0 bundle:0];
  if (v5)
  {
    double v6 = +[SBDefaults localDefaults];
    uint64_t v7 = [v6 systemApertureDefaults];
    systemApertureDefaults = v5->_systemApertureDefaults;
    v5->_systemApertureDefaults = (SBSystemApertureDefaults *)v7;

    objc_initWeak(&location, v5);
    BOOL v9 = v5->_systemApertureDefaults;
    double v10 = [NSString stringWithUTF8String:"alwaysRenderSystemApertureFillOnGPU"];
    v61[0] = v10;
    double v11 = [NSString stringWithUTF8String:"neverRenderSystemApertureFillOnGPU"];
    v61[1] = v11;
    double v12 = [NSString stringWithUTF8String:"suppressDynamicIslandCompletely"];
    v61[2] = v12;
    double v13 = [NSString stringWithUTF8String:"alwaysShowSystemApertureOnClonedDisplays"];
    v61[3] = v13;
    id v14 = [NSString stringWithUTF8String:"alwaysShowSystemApertureInSnapshots"];
    v61[4] = v14;
    id v15 = [NSString stringWithUTF8String:"enableSystemApertureStateCollection"];
    v61[5] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:6];
    id v17 = MEMORY[0x1E4F14428];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __60__SBSystemApertureViewController_initWithActiveWindowScene___block_invoke;
    v56[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v57, &location);
    id v18 = (id)[(SBSystemApertureDefaults *)v9 observeDefaults:v16 onQueue:MEMORY[0x1E4F14428] withBlock:v56];

    uint64_t v19 = [MEMORY[0x1E4F28BD0] set];
    backlightAssertionRequiringReasons = v5->_backlightAssertionRequiringReasons;
    v5->_backlightAssertionRequiringReasons = (NSCountedSet *)v19;

    uint64_t v21 = [MEMORY[0x1E4F28BD0] set];
    overrideRenderingStyleRequests = v5->_overrideRenderingStyleRequests;
    v5->_overrideRenderingStyleRequests = (NSCountedSet *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA80] set];
    transitionShadowAssertions = v5->_transitionShadowAssertions;
    v5->_transitionShadowAssertions = (NSMutableSet *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA80] set];
    transitionKeyLineAssertions = v5->_transitionKeyLineAssertions;
    v5->_transitionKeyLineAssertions = (NSMutableSet *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA80] set];
    dynamicPersistentAnimationAssertions = v5->_dynamicPersistentAnimationAssertions;
    v5->_dynamicPersistentAnimationAssertions = (NSMutableSet *)v27;

    BOOL v29 = [[SBSystemApertureResizeGestureRecognizer alloc] initWithTarget:v5 action:sel__handleResizePan_];
    resizePanGesture = v5->_resizePanGesture;
    v5->_resizePanGesture = &v29->super;

    [(UIPanGestureRecognizer *)v5->_resizePanGesture setName:@"resizeSystemAperture"];
    [(UIPanGestureRecognizer *)v5->_resizePanGesture setCancelsTouchesInView:0];
    [(UIPanGestureRecognizer *)v5->_resizePanGesture setAllowedScrollTypesMask:3];
    [(UIPanGestureRecognizer *)v5->_resizePanGesture setDelegate:v5];
    uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
    longPressGestureUpdateQueue = v5->_longPressGestureUpdateQueue;
    v5->_longPressGestureUpdateQueue = (NSMutableArray *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
    resizeGestureUpdateQueue = v5->_resizeGestureUpdateQueue;
    v5->_resizeGestureUpdateQueue = (NSMutableArray *)v33;

    id v35 = [v4 associatedWindowScene];
    long long v36 = [v35 systemGestureManager];
    [v36 addGestureRecognizer:v5->_resizePanGesture withType:132];
    id v37 = [v35 zStackResolver];
    uint64_t v38 = [v37 acquireParticipantWithIdentifier:27 delegate:v5];
    zStackParticipant = v5->_zStackParticipant;
    v5->_zStackParticipant = (SBFZStackParticipant *)v38;

    __int16 v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 addObserver:v5 selector:sel__elementKeyColorWasInvalidated_ name:@"SBSystemApertureElementKeyColorDidInvalidateNotification" object:0];

    v5->_zoomServicesReportedAXisZooming = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_SBSystemApertureZoomPreferencesDidChange, (CFStringRef)*MEMORY[0x1E4FB93C0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    zoomAnimationAssertions = v5->_zoomAnimationAssertions;
    v5->_zoomAnimationAssertions = v42;

    [(SBSystemApertureViewController *)v5 _axRegisterForZoomUpdatesIfNecessary];
    id v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v44 addObserver:v5 selector:sel__reduceTransparencyDidChange_ name:*MEMORY[0x1E4F43480] object:0];

    id v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v45 addObserver:v5 selector:sel__invertColorsChanged_ name:*MEMORY[0x1E4F43440] object:0];

    id v46 = objc_alloc_init(SBSystemApertureKeyLineColorValidator);
    colorValidator = v5->_colorValidator;
    v5->_colorValidator = v46;

    __int16 v48 = self;
    id v60 = v48;
    long long v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    uint64_t v50 = [(SBSystemApertureViewController *)v5 registerForTraitChanges:v49 withTarget:v5 action:sel__updatePreferredContentSizeCategoryForAllElements_];
    contentSizeCategoryTraitChangeRegistration = v5->_contentSizeCategoryTraitChangeRegistration;
    v5->_contentSizeCategoryTraitChangeRegistration = (UITraitChangeRegistration *)v50;

    long long v52 = [[SBSystemApertureDebuggingUtility alloc] initWithDelegate:v5];
    debuggingUtilitCGFloat y = v5->_debuggingUtility;
    v5->_debuggingUtilitCGFloat y = v52;

    uint64_t v54 = +[SBReachabilityManager sharedInstance];
    [v54 addObserver:v5];

    [(SBSystemApertureViewController *)v5 setActiveWindowScene:v4];
    objc_destroyWeak(&v57);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __60__SBSystemApertureViewController_initWithActiveWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidatePreferencesForReason:2];
}

- (void)dealloc
{
  [(SBSystemApertureViewController *)self unregisterForTraitChanges:self->_contentSizeCategoryTraitChangeRegistration];
  if (self->_zoomRegistrationIdentifier)
  {
    double v3 = [MEMORY[0x1E4FB7D90] sharedInstance];
    [v3 removeZoomAttributesChangedHandler:self->_zoomRegistrationIdentifier];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4FB93C0], 0);
  [(BSInvalidatable *)self->_suppressTouchCancellationAssertion invalidate];
  id v5 = +[SBReachabilityManager sharedInstance];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SBSystemApertureViewController;
  [(SBSystemApertureViewController *)&v6 dealloc];
}

- (void)setCurtainViewHoster:(id)a3
{
  id v5 = a3;
  [(SBSystemApertureCurtainViewHoster *)self->_curtainViewHoster setCurtainView:0];
  [(SBSystemApertureCurtainViewHoster *)self->_curtainViewHoster setIndicatorSourceView:0];
  objc_storeStrong((id *)&self->_curtainViewHoster, a3);
  curtainViewHoster = self->_curtainViewHoster;
  if (curtainViewHoster)
  {
    if (self->_highLevelMagiciansCurtainView) {
      -[SBSystemApertureCurtainViewHoster setCurtainView:](curtainViewHoster, "setCurtainView:");
    }
    if (self->_indicatorContainerPortalView)
    {
      objc_initWeak(&location, self);
      uint64_t v7 = (void *)SBApp;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __55__SBSystemApertureViewController_setCurtainViewHoster___block_invoke;
      void v8[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v9, &location);
      objc_msgSend(v7, "sb_performBlockAfterCATransactionSynchronizedCommit:", v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __55__SBSystemApertureViewController_setCurtainViewHoster___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    [WeakRetained[128] setIndicatorSourceView:WeakRetained[130]];
    id v2 = v3;
  }
}

- (SBSystemApertureCurtainViewHoster)curtainViewHoster
{
  return self->_curtainViewHoster;
}

- (void)setVisibilityDelegate:(id)a3
{
}

- (SBSystemApertureViewControllerVisibilityDelegate)visibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityDelegate);
  return (SBSystemApertureViewControllerVisibilityDelegate *)WeakRetained;
}

- (BOOL)isTransitionTargetForSceneIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v8 = [(SAUISystemApertureManager *)self->_systemApertureManager registeredElements];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        double v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v13 = SAUILayoutSpecifyingOverriderForElement();
        if ([v13 preferredLayoutMode] >= 1
          && (objc_opt_respondsToSelector() & 1) != 0
          && [v12 acceptsFullScreenTransitionFromSceneWithIdentifier:v6 ofBundleId:v7])
        {

          LOBYTE(v9) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v9;
}

- (void)animateTransitionAcceptanceBounceWithVelocityVector:(CGPoint)a3 triggeredBlock:(id)a4
{
  double x = a3.x;
  settings = self->_settings;
  id v7 = a4;
  [(SBSystemApertureSettings *)settings acceptanceSideBounceXVelocityThreshold];
  if (x >= -v8)
  {
    if (x > v8) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }
  uint64_t v10 = [[SBSABounceRequest alloc] initWithStyle:v9 triggeredBlock:v7];

  [(SBSystemApertureViewController *)self _addActiveRequest:v10];
  [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:256];
}

- (void)animateTransitionEjectionStretchWithVelocityVector:(CGPoint)a3
{
  id v4 = [(SBSystemApertureViewController *)self _currentFirstElement];
  [(SBSystemApertureViewController *)self animateDiscreteAnimationStyle:4 toElement:v4];
}

- (id)overrideContainerRenderingStyleAssertion:(int64_t)a3
{
  if (a3 < 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSystemApertureViewController.m", 576, @"Invalid parameter not satisfying: %@", @"overrideRenderingStyle > SBSystemApertureContainerRenderingStyleUnspecified" object file lineNumber description];
  }
  overrideRenderingStyleRequests = self->_overrideRenderingStyleRequests;
  id v7 = [NSNumber numberWithInteger:a3];
  [(NSCountedSet *)overrideRenderingStyleRequests addObject:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4FA92F0]);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__SBSystemApertureViewController_overrideContainerRenderingStyleAssertion___block_invoke;
  v11[3] = &unk_1E6B03398;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  v12[2] = (id)a2;
  v11[4] = self;
  [v8 addInvalidationBlock:v11];
  [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:16];
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v8;
}

void __75__SBSystemApertureViewController_overrideContainerRenderingStyleAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  if (![WeakRetained[145] countForObject:v2])
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"SBSystemApertureViewController.m" lineNumber:583 description:@"Trying to decrement nonexistant rendering request"];
  }
  id v3 = WeakRetained[145];
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v3 removeObject:v4];

  [WeakRetained _invalidatePreferencesForReason:16];
}

- (int64_t)cloningStyle
{
  return self->_cloningStyle;
}

- (id)systemApertureRepresentationSuppressionAssertionForCoversheetVisibility
{
  id v3 = [_SBSystemApertureRepresentationSuppressionAssertion alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __105__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForCoversheetVisibility__block_invoke;
  v6[3] = &unk_1E6B033C0;
  v6[4] = self;
  id v4 = [(_SBSystemApertureRepresentationSuppressionAssertion *)v3 initWithCoverSheetVisible:1 liquidDetectionVisible:0 proximityReaderVisible:0 suppressForSystemChromeSuppression:0 invalidationBlock:v6];
  [(NSMutableSet *)self->_systemApertureSuppressionAssertions addObject:v4];
  [(SBSystemApertureViewController *)self _reevaluateElementSuppression];
  return v4;
}

uint64_t __105__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForCoversheetVisibility__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 1120) removeObject:a2];
  id v3 = *(void **)(a1 + 32);
  return [v3 _reevaluateElementSuppression];
}

- (id)systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility
{
  id v3 = [_SBSystemApertureRepresentationSuppressionAssertion alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __110__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility__block_invoke;
  v6[3] = &unk_1E6B033C0;
  v6[4] = self;
  id v4 = [(_SBSystemApertureRepresentationSuppressionAssertion *)v3 initWithCoverSheetVisible:0 liquidDetectionVisible:1 proximityReaderVisible:0 suppressForSystemChromeSuppression:0 invalidationBlock:v6];
  [(NSMutableSet *)self->_systemApertureSuppressionAssertions addObject:v4];
  [(SBSystemApertureViewController *)self _reevaluateElementSuppression];
  return v4;
}

uint64_t __110__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 1120) removeObject:a2];
  id v3 = *(void **)(a1 + 32);
  return [v3 _reevaluateElementSuppression];
}

- (id)systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility
{
  id v3 = [_SBSystemApertureRepresentationSuppressionAssertion alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __110__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility__block_invoke;
  v6[3] = &unk_1E6B033C0;
  v6[4] = self;
  id v4 = [(_SBSystemApertureRepresentationSuppressionAssertion *)v3 initWithCoverSheetVisible:0 liquidDetectionVisible:0 proximityReaderVisible:1 suppressForSystemChromeSuppression:0 invalidationBlock:v6];
  [(NSMutableSet *)self->_systemApertureSuppressionAssertions addObject:v4];
  [(SBSystemApertureViewController *)self _reevaluateElementSuppression];
  return v4;
}

uint64_t __110__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 1120) removeObject:a2];
  id v3 = *(void **)(a1 + 32);
  return [v3 _reevaluateElementSuppression];
}

uint64_t __108__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForSystemChromeSuppression__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 1120) removeObject:a2];
  id v3 = *(void **)(a1 + 32);
  return [v3 _reevaluateElementSuppression];
}

- (id)restrictSystemApertureToDefaultLayoutWithReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBSystemApertureViewController *)self _primaryContainerView];
  id v5 = [(SBSystemApertureViewController *)self _layoutSpecifyingOverriderForContainerView:v4];

  if (v5)
  {
    id v6 = [v5 preferredLayoutModeAssertion];
    if ([v6 preferredLayoutMode] == 3 && objc_msgSend(v6, "layoutModeChangeReason") != 2) {
      [v6 invalidateWithReason:@"collapse to compact layout"];
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4FA92F0]);
  id v8 = SBLogSystemApertureController();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Acquired empty restrict to default layout assertion: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  [v7 addInvalidationBlock:&__block_literal_global_185];
  return v7;
}

void __82__SBSystemApertureViewController_restrictSystemApertureToDefaultLayoutWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogSystemApertureController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Invalidated empty restrict to default layout assertion: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)restrictSystemApertureToInertWithReason:(id)a3
{
  return [(SBSystemApertureViewController *)self _layoutAssertionWithMaximumPermittedLayoutMode:0 reason:a3 creatingIfNecessary:1];
}

- (id)requireHeavyShadowAssertionForTransition
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4FA92F0]);
  objc_initWeak(&from, v3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__SBSystemApertureViewController_requireHeavyShadowAssertionForTransition__block_invoke;
  v5[3] = &unk_1E6B03408;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  v5[4] = self;
  [v3 addInvalidationBlock:v5];
  [(NSMutableSet *)self->_transitionShadowAssertions addObject:v3];
  [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:512];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v3;
}

void __74__SBSystemApertureViewController_requireHeavyShadowAssertionForTransition__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v2 = (void *)WeakRetained[150];
  id v3 = objc_loadWeakRetained(a1 + 6);
  [v2 removeObject:v3];

  [a1[4] _invalidatePreferencesForReason:512];
}

- (id)requireKeyLineAssertionForTransition
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4FA92F0]);
  objc_initWeak(&from, v3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SBSystemApertureViewController_requireKeyLineAssertionForTransition__block_invoke;
  v5[3] = &unk_1E6B03408;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  v5[4] = self;
  [v3 addInvalidationBlock:v5];
  [(NSMutableSet *)self->_transitionKeyLineAssertions addObject:v3];
  [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:512];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v3;
}

void __70__SBSystemApertureViewController_requireKeyLineAssertionForTransition__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v2 = (void *)WeakRetained[151];
  id v3 = objc_loadWeakRetained(a1 + 6);
  [v2 removeObject:v3];

  [a1[4] _invalidatePreferencesForReason:512];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)SBSystemApertureViewController;
  [(SBSystemApertureViewController *)&v39 viewDidLoad];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  systemApertureSuppressionAssertions = self->_systemApertureSuppressionAssertions;
  self->_systemApertureSuppressionAssertions = v3;

  id v5 = +[SBSystemApertureDomain rootSettings];
  settings = self->_settings;
  self->_settings = v5;

  [(PTSettings *)self->_settings addKeyObserver:self];
  id v7 = [(SBSystemApertureViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  long long v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v11, v13, v15);
  containerSubBackgroundParent = self->_containerSubBackgroundParent;
  self->_containerSubBackgroundParent = v16;

  [(UIView *)self->_containerSubBackgroundParent setUserInteractionEnabled:0];
  long long v18 = [(UIView *)self->_containerSubBackgroundParent layer];
  [v18 setDisableUpdateMask:32];

  uint64_t v19 = [(SBSystemApertureViewController *)self view];
  [v19 addSubview:self->_containerSubBackgroundParent];

  uint64_t v20 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v11, v13, v15);
  containerBackgroundParent = self->_containerBackgroundParent;
  self->_containerBackgroundParent = v20;

  [(UIView *)self->_containerBackgroundParent setUserInteractionEnabled:0];
  id v22 = [(SBSystemApertureViewController *)self view];
  [v22 addSubview:self->_containerBackgroundParent];

  uint64_t v23 = (SBFTouchPassThroughView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v9, v11, v13, v15);
  containerParent = self->_containerParent;
  self->_containerParent = v23;

  uint64_t v25 = [(SBSystemApertureViewController *)self view];
  [v25 addSubview:self->_containerParent];

  SBCreateSystemApertureMagiciansView();
  int v26 = (SBSystemApertureGainMapBackedRendering *)objc_claimAutoreleasedReturnValue();
  magiciansCurtainView = self->_magiciansCurtainView;
  self->_magiciansCurtainView = v26;

  SBCreateSystemApertureMagiciansView();
  id v28 = (SBSystemApertureGainMapBackedRendering *)objc_claimAutoreleasedReturnValue();
  highLevelMagiciansCurtainView = self->_highLevelMagiciansCurtainView;
  self->_highLevelMagiciansCurtainView = v28;

  [(UIView *)self->_containerBackgroundParent addSubview:self->_magiciansCurtainView];
  [(SBSystemApertureCurtainViewHoster *)self->_curtainViewHoster setCurtainView:self->_highLevelMagiciansCurtainView];
  id v30 = objc_alloc_init(SBSystemApertureElementAuthority);
  elementAuthoritCGFloat y = self->_elementAuthority;
  self->_elementAuthoritCGFloat y = v30;

  [(SBSystemApertureElementAuthority *)self->_elementAuthority setElementAuthorityDelegate:self];
  int v32 = (SAUISystemApertureManager *)[objc_alloc(MEMORY[0x1E4FA9308]) initWithElementAuthority:self->_elementAuthority];
  systemApertureManager = self->_systemApertureManager;
  self->_systemApertureManager = v32;

  [(SAUISystemApertureManager *)self->_systemApertureManager setDelegate:self];
  [(SBSystemApertureViewController *)self _configureVariableBlur];
  [(SBSystemApertureViewController *)self _configurePreferencesStackIfNecessary];
  [(SBSystemApertureViewController *)self _configureGesturesIfNecessary];
  objc_initWeak(&location, self);
  v40[0] = objc_opt_class();
  long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __45__SBSystemApertureViewController_viewDidLoad__block_invoke;
  v36[3] = &unk_1E6B03430;
  objc_copyWeak(&v37, &location);
  id v35 = (id)[(SBSystemApertureViewController *)self registerForTraitChanges:v34 withHandler:v36];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __45__SBSystemApertureViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v8 = [v5 traitCollection];
    uint64_t v9 = [v8 _backlightLuminance];
    uint64_t v10 = [v6 _backlightLuminance];

    if (v9 != v10)
    {
      double v11 = [v5 traitCollection];
      uint64_t v12 = [v11 _backlightLuminance];

      if (v12 == 1)
      {
        dispatch_time_t v13 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__SBSystemApertureViewController_viewDidLoad__block_invoke_2;
        block[3] = &unk_1E6AF4AC0;
        block[4] = WeakRetained;
        dispatch_after(v13, MEMORY[0x1E4F14428], block);
      }
      else
      {
        double v14 = [WeakRetained backlightSessionAggregator];
        [v14 hostedScenesDidChange];
      }
    }
  }
}

void __45__SBSystemApertureViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) backlightSessionAggregator];
  [v1 hostedScenesDidChange];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBSystemApertureViewController;
  [(SBSystemApertureViewController *)&v15 viewIsAppearing:a3];
  int v4 = [(SBSystemApertureViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[UIView setFrame:](self->_containerSubBackgroundParent, "setFrame:", v6, v8, v10, v12);
  -[UIView setFrame:](self->_containerBackgroundParent, "setFrame:", v6, v8, v10, v12);
  -[SBFTouchPassThroughView setFrame:](self->_containerParent, "setFrame:", v6, v8, v10, v12);
  dispatch_time_t v13 = [(SBSystemApertureViewController *)self view];
  [v13 setNeedsLayout];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__SBSystemApertureViewController_viewIsAppearing___block_invoke;
  _OWORD v14[3] = &unk_1E6AF4AC0;
  v14[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v14];
}

void __50__SBSystemApertureViewController_viewIsAppearing___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)setActiveWindowScene:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  if (WeakRetained != obj)
  {
    double v5 = [WeakRetained associatedWindowScene];
    double v6 = [v5 systemGestureManager];

    [(SBFZStackParticipant *)self->_zStackParticipant invalidate];
    objc_storeWeak((id *)&self->_activeWindowScene, obj);
    double v7 = [obj associatedWindowScene];
    double v8 = [v7 systemGestureManager];

    [(SBSystemApertureViewController *)self _moveSystemGestureRecognizerIfNecessary:self->_interactionLongPressGesture withSystemGestureType:133 fromSystemGestureManager:v6 toSystemGestureManager:v8];
    [(SBSystemApertureViewController *)self _moveSystemGestureRecognizerIfNecessary:self->_resizePanGesture withSystemGestureType:132 fromSystemGestureManager:v6 toSystemGestureManager:v8];
    double v9 = [obj associatedWindowScene];
    double v10 = [v9 zStackResolver];
    double v11 = [v10 acquireParticipantWithIdentifier:27 delegate:self];
    zStackParticipant = self->_zStackParticipant;
    self->_zStackParticipant = v11;

    [(SBSystemApertureViewController *)self zStackParticipantDidChange:self->_zStackParticipant];
    [(SAUISystemApertureManager *)self->_systemApertureManager invalidatePromotedElements];
    [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:0x8000];
  }
}

- (void)_moveSystemGestureRecognizerIfNecessary:(id)a3 withSystemGestureType:(unint64_t)a4 fromSystemGestureManager:(id)a5 toSystemGestureManager:(id)a6
{
  id v11 = a3;
  id v9 = a5;
  id v10 = a6;
  if ([v9 isSystemGestureRecognizer:v11])
  {
    [v9 removeGestureRecognizer:v11];
    [v10 addGestureRecognizer:v11 withType:a4];
  }
}

- (void)_addRunLoopObserverIfNecessary
{
  if (!self->_beforeCARunLoopObserver)
  {
    objc_initWeak(&location, self);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__SBSystemApertureViewController__addRunLoopObserverIfNecessary__block_invoke;
    v5[3] = &unk_1E6B03458;
    objc_copyWeak(&v6, &location);
    self->_beforeCARunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 1u, 1999000, v5);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, self->_beforeCARunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_configurePreferencesStackIfNecessary
{
  if (!self->_rootPreferencesProvider)
  {
    CFAllocatorRef v3 = objc_alloc_init(SBSARootPreferencesProvider);
    rootPreferencesProvider = self->_rootPreferencesProvider;
    self->_rootPreferencesProvider = v3;

    [(SBSystemApertureViewController *)self _addRunLoopObserverIfNecessary];
    [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:2];
  }
}

- (void)_addPendingTransitionResult:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    double v5 = self;
    objc_sync_enter(v5);
    pendingTransitionResults = v5->_pendingTransitionResults;
    if (!pendingTransitionResults)
    {
      double v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v8 = v5->_pendingTransitionResults;
      v5->_pendingTransitionResults = v7;

      pendingTransitionResults = v5->_pendingTransitionResults;
    }
    [(NSMutableArray *)pendingTransitionResults addObject:v9];
    objc_sync_exit(v5);

    id v4 = v9;
  }
}

- (void)_addTimerIfNecessaryForDescription:(id)a3
{
  id v4 = a3;
  double v5 = self;
  objc_sync_enter(v5);
  timerIdentifiersToDescriptionRecords = v5->_timerIdentifiersToDescriptionRecords;
  double v7 = [v4 timerDescriptionIdentifier];
  double v8 = [(NSMutableDictionary *)timerIdentifiersToDescriptionRecords objectForKey:v7];

  if (!v8)
  {
    objc_initWeak(&location, v5);
    if (!v5->_timerIdentifiersToDescriptionRecords)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = v5->_timerIdentifiersToDescriptionRecords;
      v5->_timerIdentifiersToDescriptionRecords = v9;
    }
    id v11 = [[_SBSATimerAndDescriptionRecord alloc] initWithTimerDescription:v4];
    double v12 = v5->_timerIdentifiersToDescriptionRecords;
    dispatch_time_t v13 = [v4 timerDescriptionIdentifier];
    [(NSMutableDictionary *)v12 setObject:v11 forKey:v13];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__SBSystemApertureViewController__addTimerIfNecessaryForDescription___block_invoke;
    _OWORD v14[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v15, &location);
    [(_SBSATimerAndDescriptionRecord *)v11 schedule:v14];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  objc_sync_exit(v5);
}

void __69__SBSystemApertureViewController__addTimerIfNecessaryForDescription___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _invalidatePreferencesForReason:32];
    id WeakRetained = v2;
  }
}

- (void)_pushPendingInteractionResultForElementIdentity:(id)a3 interactionSource:(unint64_t)a4 viewInteractionResult:(int64_t)a5
{
  id v13 = a3;
  double v8 = self;
  objc_sync_enter(v8);
  pendingInteractionResults = v8->_pendingInteractionResults;
  if (!pendingInteractionResults)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    id v11 = v8->_pendingInteractionResults;
    v8->_pendingInteractionResults = (NSMutableArray *)v10;

    pendingInteractionResults = v8->_pendingInteractionResults;
  }
  double v12 = [[SBSAElementViewInteractionResult alloc] initWithIdentity:v13 interactionSource:a4 viewInteractionResult:a5];
  [(NSMutableArray *)pendingInteractionResults addObject:v12];

  objc_sync_exit(v8);
}

- (id)_floatAnimatablePropertyForTransitionIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMutableDictionary *)v5->_transitionIdentifiersToFloatAnimatableProperties objectForKey:v4];
    objc_sync_exit(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_invalidateAndRemoveFloatAnimatableProperty:(id)a3 forTransitionIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (uint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (!(v6 | v7))
  {
    double v8 = 0;
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  double v8 = (void *)v7;
  if (v6
    || ([(SBSystemApertureViewController *)self _floatAnimatablePropertyForTransitionIdentifier:v7], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (([(id)v6 isInvalidated] & 1) == 0) {
      [(id)v6 invalidate];
    }
    id v9 = self;
    objc_sync_enter(v9);
    if (!v8)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v10 = [(NSMutableDictionary *)v9->_transitionIdentifiersToFloatAnimatableProperties allKeys];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v11)
      {

        double v8 = 0;
        goto LABEL_8;
      }
      double v8 = 0;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          double v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v15 = [(NSMutableDictionary *)v9->_transitionIdentifiersToFloatAnimatableProperties objectForKey:v14];
          if (v15 == (void *)v6)
          {
            id v16 = v14;

            double v8 = v16;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);

      if (!v8) {
        goto LABEL_8;
      }
    }
    [(NSMutableDictionary *)v9->_transitionIdentifiersToFloatAnimatableProperties removeObjectForKey:v8];
LABEL_8:
    objc_sync_exit(v9);
  }
LABEL_10:
}

- (void)_animatedTransitionDidReachMilestone:(double)a3 description:(id)a4 propertyIdentity:(id)a5 finished:(BOOL)a6 retargeted:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = self;
  objc_sync_enter(v15);
  id v16 = [v13 animatedTransitionIdentifier];
  if (a3 != 1.79769313e308)
  {
    long long v17 = [(NSMutableDictionary *)v15->_transitionIdentifiersToFloatAnimatableProperties objectForKey:v16];

    if (!v17)
    {
      long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v15, @"SBSystemApertureViewController.m", 941, @"Unknown transition: %@", v13 object file lineNumber description];
    }
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __120__SBSystemApertureViewController__animatedTransitionDidReachMilestone_description_propertyIdentity_finished_retargeted___block_invoke;
  v22[3] = &unk_1E6B03480;
  SEL v25 = a2;
  v22[4] = v15;
  id v19 = v16;
  id v23 = v19;
  id v20 = v14;
  id v24 = v20;
  double v26 = a3;
  BOOL v27 = a6;
  BOOL v28 = a7;
  uint64_t v21 = +[SBSAAnimatedTransitionResultDescription instanceWithBlock:v22];
  [(SBSystemApertureViewController *)v15 _addPendingTransitionResult:v21];

  [(SBSystemApertureViewController *)v15 _invalidatePreferencesForReason:64];
  objc_sync_exit(v15);
}

void __120__SBSystemApertureViewController__animatedTransitionDidReachMilestone_description_propertyIdentity_finished_retargeted___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    CFAllocatorRef v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        double v5 = v4;
      }
      else {
        double v5 = 0;
      }
    }
    else
    {
      double v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsaanimatedtr_0.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSystemApertureViewController.m", 943, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setAnimatedTransitionIdentifier:*(void *)(a1 + 40)];
  [v6 setAssociatedInterfaceElementPropertyIdentity:*(void *)(a1 + 48)];
  [v6 setTargetedMilestone:*(double *)(a1 + 64)];
  [v6 setTransitionEndTargeted:*(double *)(a1 + 64) == 1.79769313e308];
  [v6 setFinished:*(unsigned __int8 *)(a1 + 72)];
  [v6 setRetargeted:*(unsigned __int8 *)(a1 + 73)];
}

- (void)_addFloatAnimatablePropertyForTransitionDescriptionIfNecessary:(id)a3 propertyIdentity:(id)a4 milestones:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8 && v9 && [v10 count])
  {
    uint64_t v12 = self;
    objc_sync_enter(v12);
    id v13 = [v8 animatedTransitionIdentifier];
    id v14 = [(NSMutableDictionary *)v12->_transitionIdentifiersToFloatAnimatableProperties objectForKey:v13];

    if (!v14)
    {
      objc_initWeak(&location, v12);
      id v15 = (void *)MEMORY[0x1E4F43000];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __125__SBSystemApertureViewController__addFloatAnimatablePropertyForTransitionDescriptionIfNecessary_propertyIdentity_milestones___block_invoke;
      id v23 = &unk_1E6B034A8;
      objc_copyWeak(&v26, &location);
      id v24 = v8;
      id v25 = v9;
      id v16 = objc_msgSend(v15, "sbf_animatablePropertyWithProgressMilestones:block:", v11, &v20);
      transitionIdentifiersToFloatAnimatableProperties = v12->_transitionIdentifiersToFloatAnimatableProperties;
      if (!transitionIdentifiersToFloatAnimatableProperties)
      {
        long long v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v19 = v12->_transitionIdentifiersToFloatAnimatableProperties;
        v12->_transitionIdentifiersToFloatAnimatableProperties = v18;

        transitionIdentifiersToFloatAnimatableProperties = v12->_transitionIdentifiersToFloatAnimatableProperties;
      }
      -[NSMutableDictionary setObject:forKey:](transitionIdentifiersToFloatAnimatableProperties, "setObject:forKey:", v16, v13, v20, v21, v22, v23);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }

    objc_sync_exit(v12);
  }
}

void __125__SBSystemApertureViewController__addFloatAnimatablePropertyForTransitionDescriptionIfNecessary_propertyIdentity_milestones___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _animatedTransitionDidReachMilestone:*(void *)(a1 + 32) description:*(void *)(a1 + 40) propertyIdentity:1 finished:0 retargeted:a2];
}

- (id)_elementViewControllerForSizeTransitionWithDescription:(id)a3 fromPreferences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isCollisionImminent])
  {
    id v8 = [v7 elementLayoutTransition];
    id v9 = [v8 initialElementContexts];
    unint64_t v10 = [v9 count];

    if (v10 > 1) {
      goto LABEL_5;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:
    id v13 = 0;
  }
  else
  {
    uint64_t v11 = [v6 interfaceElementIdentifier];
    uint64_t v12 = [(SBSystemApertureViewController *)self _containerViewWithInterfaceElementIdentifier:v11 creatingIfNecessary:0];
    id v13 = [v12 elementViewController];
  }
  return v13;
}

void __118__SBSystemApertureViewController__shouldPerformTransitionOfProperty_ofObject_withDescription_fromPreferences_context___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "sbsa_presentationModifierValueForKeyPath:", *(void *)(a1 + 40));
  CFAllocatorRef v3 = SBLogSystemAperturePreferencesStack();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [*(id *)(a1 + 48) queryIteration];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 134349826;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v2;
    _os_log_debug_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEBUG, "[%{public}lu] Updating '%@' keypath of view '%@' to presentation value '%@' in order to retarget animation parameters of in-progress animation", (uint8_t *)&v7, 0x2Au);
  }

  [*(id *)(a1 + 32) setValue:v2 forKeyPath:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_4(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _valueForProperty:*(void *)(a1 + 40) ofDescription:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 56), "_setValue:byUpdatingMemberKeypaths:forKeyPath:");
  id v2 = *(void **)(a1 + 56);
  CFAllocatorRef v3 = self;
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  [v6 layoutIfNeeded];
}

uint64_t __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_6(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _valueForProperty:*(void *)(a1 + 40) ofDescription:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 56), "_setValue:byUpdatingMemberKeypaths:forKeyPath:");
  id v2 = *(void **)(a1 + 56);
  CFAllocatorRef v3 = self;
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  [v6 layoutIfNeeded];
}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _animatedTransitionDidReachMilestone:*(void *)(a1 + 32) description:*(void *)(a1 + 40) propertyIdentity:a2 finished:a3 retargeted:1.79769313e308];
}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_3;
  v7[3] = &unk_1E6B034F8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v8 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v9 = *(id *)(a1 + 40);
  [v2 _modifyAnimationsByDecomposingGeometricTypes:v3 animations:v7];
}

uint64_t __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setValue:1.0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_5;
  v2[3] = &unk_1E6AF5300;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F42FF0] _modifyAnimationsByDecomposingGeometricTypes:1 animations:v2];
}

uint64_t __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateAndRemoveFloatAnimatableProperty:*(void *)(a1 + 32) forTransitionIdentifier:0];
}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_7(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    uint64_t v3 = [WeakRetained[166] objectForKey:*(void *)(a1 + 32)];
    id v4 = [v3 animatedTransitionIdentifier];
    uint64_t v5 = [*(id *)(a1 + 40) animatedTransitionIdentifier];
    int v6 = BSEqualObjects();

    id WeakRetained = v7;
    if (v6)
    {
      [v7[166] removeObjectForKey:*(void *)(a1 + 32)];
      id WeakRetained = v7;
    }
  }
}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3);
  }
  uint64_t v7 = *(void *)(a1 + 72);
  if (v7) {
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 16))(v7, *(void *)(a1 + 32), a2, a3);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [WeakRetained _endRequiringBacklightAssertionForReason:*(void *)(a1 + 40)];
}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_9(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) firstObject];
  v1[2]();
}

uint64_t __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 isCancelled] ^ 1;
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16);
  return v4(v2, v3, 0);
}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_11(id *a1, void *a2)
{
  id v9 = a2;
  if ([a1[4] count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = (void *)MEMORY[0x1E4F42FF0];
      uint64_t v5 = [a1[5] objectAtIndexedSubscript:v3];
      uint64_t v6 = [a1[4] objectAtIndexedSubscript:v3];
      uint64_t v7 = [a1[6] objectAtIndexedSubscript:v3];
      id v8 = v9[2](v9, v7);
      objc_msgSend(v4, "sb_animateWithSettings:mode:animations:completion:", v5, 3, v6, v8);

      ++v3;
    }
    while (v3 < [a1[4] count]);
  }
}

- (id)_childElementViewControllerWithIdentity:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(SBSystemApertureViewController *)self childViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v11 = v10;
          uint64_t v12 = [v11 elementViewProvider];
          __int16 v13 = [v12 element];
          char v14 = SAElementIdentityEqualToIdentity();

          if (v14) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

uint64_t __94__SBSystemApertureViewController__removeElementViewControllersExceptingThoseWithDescriptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 associatedSystemApertureElementIdentity];
  uint64_t v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

uint64_t __75__SBSystemApertureViewController__removeIndicatorViewControllerIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isIndicatorElementViewController:a2];
}

- (void)_addActiveSnapshotAssertion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    snapshotAssertions = v5->_snapshotAssertions;
    if (!snapshotAssertions)
    {
      uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v8 = v5->_snapshotAssertions;
      v5->_snapshotAssertions = (NSHashTable *)v7;

      snapshotAssertions = v5->_snapshotAssertions;
    }
    [(NSHashTable *)snapshotAssertions addObject:v9];
    objc_sync_exit(v5);

    id v4 = v9;
  }
}

- (void)_removeActiveSnapshotAssertion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    [(NSHashTable *)v5->_snapshotAssertions removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (id)_activeSnapshotAssertionForElementIdentity:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5->_snapshotAssertions;
    id v7 = (id)[(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (SAElementIdentityEqualToIdentity())
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __83__SBSystemApertureViewController__elementContextsForOrderedElementViewControllers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__SBSystemApertureViewController__elementContextsForOrderedElementViewControllers___block_invoke_2;
  v10[3] = &unk_1E6B03630;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v4;
  void v10[4] = v5;
  long long v7 = *(_OWORD *)(a1 + 72);
  long long v13 = *(_OWORD *)(a1 + 56);
  long long v14 = v7;
  id v8 = v3;
  id v9 = +[SBSAElementContext instanceWithBlock:v10];
  [v6 addObject:v9];
}

void __83__SBSystemApertureViewController__elementContextsForOrderedElementViewControllers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v108 = a1;
  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v4 = self;
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

  a1 = v108;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(v108 + 48);
    uint64_t v10 = *(void *)(v108 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsaelementcon_0.isa);
    uint64_t v12 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v12);
    uint64_t v14 = v9;
    a1 = v108;
    [v8 handleFailureInMethod:v14, v10, @"SBSystemApertureViewController.m", 1405, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }
  id v103 = v3;

  long long v15 = [*(id *)(a1 + 40) elementViewProvider];
  long long v16 = [v15 element];
  uint64_t v17 = [SBSAElementIdentification alloc];
  long long v18 = [v16 clientIdentifier];
  long long v19 = [v16 elementIdentifier];
  uint64_t v20 = [(SBSAElementIdentification *)v17 initWithClientIdentifier:v18 elementIdentifier:v19];

  uint64_t v21 = [v16 clientIdentifier];
  [v7 setClientIdentifier:v21];

  uint64_t v22 = [v16 elementIdentifier];
  [v7 setElementIdentifier:v22];

  id v23 = SAUILayoutSpecifyingOverriderForElement();
  uint64_t v24 = [v23 layoutMode];
  [v7 setLayoutMode:v24];
  objc_msgSend(*(id *)(a1 + 32), "_maximumContainerViewOutsetsInBounds:inLayoutMode:", v24, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v102 = v16;
  [*(id *)(a1 + 32) _hostSuggestedOutsetsForElement:v16];
  uint64_t v100 = v24;
  id v101 = v23;
  objc_msgSend(v23, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:", v24);
  objc_msgSend(v7, "setPreferredEdgeOutsets:");
  id v25 = *(void **)(*(void *)(a1 + 32) + 1072);
  id v26 = [*(id *)(a1 + 40) elementViewProvider];
  BOOL v27 = [v26 element];
  BOOL v28 = [v25 elementViewControllerForElement:v27];
  LOBYTE(v24) = SBSAIsElementViewControllerFixedInOrientation(v28);

  if (v24) {
    uint64_t v29 = 1;
  }
  else {
    uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 1176);
  }
  [v7 setInterfaceOrientation:v29];
  if (objc_opt_respondsToSelector()) {
    uint64_t v30 = [v15 systemApertureCustomLayout];
  }
  else {
    uint64_t v30 = 0;
  }
  [v7 setSystemApertureCustomLayout:v30];
  if (objc_opt_respondsToSelector()) {
    uint64_t v31 = [v15 customLayoutRequestingSpecialFlowerBoundsResizingAnimation];
  }
  else {
    uint64_t v31 = 0;
  }
  [v7 setSystemApertureCustomLayoutCustomAnimationStyle:v31];
  if (objc_opt_respondsToSelector()) {
    uint64_t v32 = [v15 systemApertureLayoutCustomizingOptions];
  }
  else {
    uint64_t v32 = 0;
  }
  [v7 setSystemApertureLayoutCustomizingOptions:v32];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v33 = *(id *)(*(void *)(a1 + 32) + 1216);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v109 objects:v113 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v110 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        objc_super v39 = [v38 elementIdentity];
        int v40 = SAElementIdentityEqualToIdentity();

        if (v40) {
          objc_msgSend(v7, "setActiveDynamicAnimation:", objc_msgSend(v38, "animationType"));
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v109 objects:v113 count:16];
    }
    while (v35);
  }

  if (objc_opt_respondsToSelector())
  {
    int v41 = [v102 keyColor];
    [v7 setKeyColor:v41];
  }
  double v42 = *MEMORY[0x1E4F1DB28];
  double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v46 = v15;
  id v47 = [v46 systemApertureLayoutSpecifyingOverrider];
  char v48 = objc_opt_respondsToSelector();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    double v106 = v43;
    double v107 = v42;
    double v104 = v45;
    double v105 = v44;
    double v61 = v45;
    double v62 = v44;
    double v63 = v43;
    double v64 = v42;
    uint64_t v49 = v108;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_43;
    }
    double v104 = v45;
    double v105 = v44;
    double v106 = v43;
    double v107 = v42;
    if (v48) {
      goto LABEL_39;
    }
LABEL_41:
    id v66 = [v46 trailingView];
    [v66 bounds];
    double v64 = v81;
    double v63 = v82;
    double v62 = v83;
    double v61 = v84;
    goto LABEL_42;
  }
  uint64_t v49 = v108;
  if ((v48 & 1) == 0)
  {
    id v76 = [v46 leadingView];
    [v76 bounds];
    double v106 = v78;
    double v107 = v77;
    double v104 = v80;
    double v105 = v79;

    double v61 = v45;
    double v62 = v44;
    double v63 = v43;
    double v64 = v42;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
  uint64_t v50 = *(void **)(v108 + 32);
  uint64_t v51 = [v46 leadingView];
  [v50 maximumAvailableSizeForProvidedLeadingView:v51 fromViewProvider:v46];
  double v53 = v52;
  double v55 = v54;
  long long v56 = [v46 leadingView];
  objc_msgSend(v47, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v56, v100, v53, v55);
  BSRectWithSize();
  double v106 = v58;
  double v107 = v57;
  double v104 = v60;
  double v105 = v59;

  double v61 = v45;
  double v62 = v44;
  double v63 = v43;
  double v64 = v42;
  if (objc_opt_respondsToSelector())
  {
LABEL_39:
    long long v65 = *(void **)(v49 + 32);
    id v66 = [v46 trailingView];
    [v65 maximumAvailableSizeForProvidedTrailingView:v66 fromViewProvider:v46];
    double v68 = v67;
    double v70 = v69;
    long long v71 = [v46 leadingView];
    objc_msgSend(v47, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v71, v100, v68, v70);
    BSRectWithSize();
    double v64 = v72;
    double v63 = v73;
    double v62 = v74;
    double v61 = v75;

LABEL_42:
  }
LABEL_43:
  if (objc_opt_respondsToSelector())
  {
    if (v48)
    {
      id v85 = *(void **)(v49 + 32);
      id v86 = [v46 minimalView];
      [v85 maximumAvailableSizeForProvidedMinimalView:v86 fromViewProvider:v46];
      double v88 = v87;
      double v90 = v89;
      id v91 = [v46 leadingView];
      objc_msgSend(v47, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v91, v100, v88, v90);
      BSRectWithSize();
      double v42 = v92;
      double v43 = v93;
      double v44 = v94;
      double v45 = v95;
    }
    else
    {
      id v86 = [v46 minimalView];
      [v86 bounds];
      double v42 = v96;
      double v43 = v97;
      double v44 = v98;
      double v45 = v99;
    }
  }
  objc_msgSend(v7, "setPreferredLeadingBounds:", v107, v106, v105, v104);
  objc_msgSend(v7, "setPreferredTrailingBounds:", v64, v63, v62, v61);
  objc_msgSend(v7, "setPreferredMinimalBounds:", v42, v43, v44, v45);
}

- (BOOL)_handlePreferencesDidChangeAction:(id)a3
{
  if (a3) {
    [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:1];
  }
  return a3 != 0;
}

- (BOOL)_handleContainerTapAction:(id)a3
{
  if (a3)
  {
    id v5 = [a3 associatedInterfaceElementIdentifier];
    id v6 = [(SBSystemApertureViewController *)self _containerViewWithInterfaceElementIdentifier:v5 creatingIfNecessary:0];
    id v7 = [v6 elementViewController];

    id v8 = [v7 elementViewProvider];
    uint64_t v9 = [v8 element];

    uint64_t v10 = [v7 handleElementTap:self->_interactionLongPressGesture];
    [(SBSystemApertureViewController *)self _pushPendingInteractionResultForElementIdentity:v9 interactionSource:1 viewInteractionResult:v10];
    Class v11 = [v9 clientIdentifier];
    uint64_t v12 = [v9 elementIdentifier];
    +[SBSystemApertureTelemetryEmitter logTelemetryForInteractionTap:v10 != 0 clientIdentifier:v11 elementIdentifier:v12];
  }
  return a3 != 0;
}

- (BOOL)_handleContainerPressAction:(id)a3
{
  if (a3)
  {
    id v5 = [a3 associatedInterfaceElementIdentifier];
    id v6 = [(SBSystemApertureViewController *)self _containerViewWithInterfaceElementIdentifier:v5 creatingIfNecessary:0];
    id v7 = [v6 elementViewController];

    id v8 = [v7 elementViewProvider];
    uint64_t v9 = [v8 element];

    uint64_t v10 = [v7 handleElementLongPress:self->_interactionLongPressGesture];
    [(SBSystemApertureViewController *)self _pushPendingInteractionResultForElementIdentity:v9 interactionSource:2 viewInteractionResult:v10];
    Class v11 = [v9 clientIdentifier];
    uint64_t v12 = [v9 elementIdentifier];
    +[SBSystemApertureTelemetryEmitter logTelemetryForInteractionLongPress:v10 != 0 clientIdentifier:v11 elementIdentifier:v12];
  }
  return a3 != 0;
}

- (id)_feedbackGeneratorForStyle:(int64_t)a3
{
  impactFeedbackStylesToGenerators = self->_impactFeedbackStylesToGenerators;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)impactFeedbackStylesToGenerators objectForKey:v6];

  if (!v7)
  {
    if (a3 == 2)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:2];
      id v8 = self->_impactFeedbackStylesToGenerators;
      if (!v8)
      {
        uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v10 = self->_impactFeedbackStylesToGenerators;
        self->_impactFeedbackStylesToGenerators = v9;

        id v8 = self->_impactFeedbackStylesToGenerators;
      }
      Class v11 = [NSNumber numberWithInteger:2];
      [(NSMutableDictionary *)v8 setObject:v7 forKey:v11];
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (BOOL)_handleImpactFeedbackAction:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = -[SBSystemApertureViewController _feedbackGeneratorForStyle:](self, "_feedbackGeneratorForStyle:", [v4 impactFeedbackStyle]);
    if (v6)
    {
      if ([v5 prepareOnly]) {
        [v6 prepare];
      }
      else {
        [v6 impactOccurred];
      }
    }
  }
  return v5 != 0;
}

- (BOOL)_handleContainerResizeAction:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    uint64_t v6 = [v5 resizeActionResult];
    id v7 = [v5 associatedInterfaceElementIdentifier];

    id v8 = [(SBSystemApertureViewController *)self _containerViewWithInterfaceElementIdentifier:v7 creatingIfNecessary:0];
    [(SBSystemApertureViewController *)self _handleResizeResult:v6 withContainerView:v8];
  }
  return a3 != 0;
}

- (BOOL)_handleCalloutBlockAction:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 calloutBlock];
    id v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }
  }
  return a3 != 0;
}

- (void)_handleContainerDefaultPressGesture:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  activeContainerDefaultPressGestureDescription = self->_activeContainerDefaultPressGestureDescription;
  if (activeContainerDefaultPressGestureDescription)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__SBSystemApertureViewController__handleContainerDefaultPressGesture___block_invoke;
    v10[3] = &unk_1E6AF9DA0;
    SEL v12 = a2;
    void v10[4] = self;
    id v11 = v5;
    id v8 = [(SBSAGestureDescription *)activeContainerDefaultPressGestureDescription copyWithBlock:v10];
    uint64_t v9 = self->_activeContainerDefaultPressGestureDescription;
    self->_activeContainerDefaultPressGestureDescription = v8;

    [(SBSystemApertureViewController *)self _pushGestureDescription:self->_activeContainerDefaultPressGestureDescription];
    [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:1024];
  }
}

void __70__SBSystemApertureViewController__handleContainerDefaultPressGesture___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
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

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsacontainerl.isa);
    id v11 = (objc_class *)objc_opt_class();
    SEL v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSystemApertureViewController.m", 1593, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  objc_msgSend(v6, "setGestureRecognizerState:", objc_msgSend(*(id *)(a1 + 40), "state"));
}

- (void)_handleContainerResizeGesture:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  activeContainerResizeGestureDescription = self->_activeContainerResizeGestureDescription;
  if (activeContainerResizeGestureDescription)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__SBSystemApertureViewController__handleContainerResizeGesture___block_invoke;
    v10[3] = &unk_1E6AF9DA0;
    SEL v12 = a2;
    void v10[4] = self;
    id v11 = v5;
    uint64_t v8 = [(SBSAGestureDescription *)activeContainerResizeGestureDescription copyWithBlock:v10];
    uint64_t v9 = self->_activeContainerResizeGestureDescription;
    self->_activeContainerResizeGestureDescription = v8;

    [(SBSystemApertureViewController *)self _pushGestureDescription:self->_activeContainerResizeGestureDescription];
    [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:1024];
  }
}

void __64__SBSystemApertureViewController__handleContainerResizeGesture___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    id v3 = self;
    id v4 = v14;
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

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsacontainerp_0.isa);
    id v11 = (objc_class *)objc_opt_class();
    SEL v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSystemApertureViewController.m", 1604, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  objc_msgSend(v6, "setGestureRecognizerState:", objc_msgSend(*(id *)(a1 + 40), "state"));
  id v13 = [*(id *)(a1 + 32) view];
  _UISystemGestureTranslationInView();
  objc_msgSend(v6, "setTranslation:");
}

- (void)_pushGestureDescription:(id)a3
{
  id v4 = a3;
  id v5 = SBLogSystemAperturePreferencesStackGestures();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBSystemApertureViewController _pushGestureDescription:]();
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = &OBJC_IVAR___SBSystemApertureViewController__longPressGestureUpdateQueue;
LABEL_7:
    id v7 = *(id *)((char *)&self->super.super.super.super.isa + *v6);
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = &OBJC_IVAR___SBSystemApertureViewController__resizeGestureUpdateQueue;
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_9:
  uint64_t v8 = [v7 lastObject];
  char v9 = BSEqualObjects();

  if ((v9 & 1) == 0) {
    [v7 addObject:v4];
  }
}

- (void)_configureLongPressGestureIfNecessary
{
  if (!self->_activeContainerDefaultPressGestureDescription)
  {
    [(SBSystemApertureViewController *)self _configureInteractionLongPressIfNecessary];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__SBSystemApertureViewController__configureLongPressGestureIfNecessary__block_invoke;
    v6[3] = &unk_1E6AF53A0;
    v6[4] = self;
    void v6[5] = a2;
    id v4 = +[SBSAGestureDescription instanceWithBlock:v6];
    activeContainerDefaultPressGestureDescription = self->_activeContainerDefaultPressGestureDescription;
    self->_activeContainerDefaultPressGestureDescription = v4;
  }
}

void __71__SBSystemApertureViewController__configureLongPressGestureIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  if (v15)
  {
    id v3 = self;
    id v4 = v15;
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

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = a1 + 32;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v10 + 8);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerl.isa);
    SEL v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v7 handleFailureInMethod:v9, v8, @"SBSystemApertureViewController.m", 1654, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  id v14 = [MEMORY[0x1E4F29128] UUID];
  [v6 setGestureIdentifier:v14];
}

- (void)_configureResizeGestureIfNecessary
{
  if (!self->_activeContainerResizeGestureDescription)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__SBSystemApertureViewController__configureResizeGestureIfNecessary__block_invoke;
    v5[3] = &unk_1E6AF53A0;
    void v5[4] = self;
    void v5[5] = a2;
    id v3 = +[SBSAGestureDescription instanceWithBlock:v5];
    activeContainerResizeGestureDescription = self->_activeContainerResizeGestureDescription;
    self->_activeContainerResizeGestureDescription = v3;
  }
}

void __68__SBSystemApertureViewController__configureResizeGestureIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  if (v15)
  {
    id v3 = self;
    id v4 = v15;
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

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = a1 + 32;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v10 + 8);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerp_0.isa);
    SEL v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v7 handleFailureInMethod:v9, v8, @"SBSystemApertureViewController.m", 1663, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  id v14 = [MEMORY[0x1E4F29128] UUID];
  [v6 setGestureIdentifier:v14];
}

- (void)_configureGesturesIfNecessary
{
  [(SBSystemApertureViewController *)self _configureLongPressGestureIfNecessary];
  [(SBSystemApertureViewController *)self _configureResizeGestureIfNecessary];
}

SBSAElementSnapshotContext *__76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SBSAElementSnapshotContext alloc] initWithSnapshotIdentity:v2];

  return v3;
}

- (void)_addActiveRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    activeRequests = v5->_activeRequests;
    if (!activeRequests)
    {
      id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = v5->_activeRequests;
      v5->_activeRequests = v7;

      activeRequests = v5->_activeRequests;
    }
    [(NSMutableArray *)activeRequests addObject:v9];
    objc_sync_exit(v5);

    id v4 = v9;
  }
}

- (void)setContainerParentCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[UIView setCenter:](self->_containerSubBackgroundParent, "setCenter:");
  -[UIView setCenter:](self->_containerBackgroundParent, "setCenter:", x, y);
  containerParent = self->_containerParent;
  -[SBFTouchPassThroughView setCenter:](containerParent, "setCenter:", x, y);
}

uint64_t __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 elementViewProvider];
  id v3 = [v2 element];
  uint64_t v4 = SAElementIdentityEqualToIdentity();

  return v4;
}

uint64_t __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 associatedSystemApertureElementIdentity];
  uint64_t v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

void __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 interfaceElementProperty];
  int v4 = BSEqualStrings();

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:v8];
    id v7 = [v6 behaviorSettings];
    [v5 _updateStatusBarAvoidanceFrameWithAnimationSettings:v7];
  }
}

uint64_t __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 elementViewProvider];
  uint64_t v3 = [v2 element];
  uint64_t v4 = SAElementIdentityEqualToIdentity();

  return v4;
}

- (id)_gestureRecognizerForDescription:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = &OBJC_IVAR___SBSystemApertureViewController__interactionLongPressGesture;
LABEL_5:
    id v6 = *(id *)((char *)&self->super.super.super.super.isa + *v5);
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = &OBJC_IVAR___SBSystemApertureViewController__resizePanGesture;
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
}

- (void)handleReachabilityModeActivated
{
}

- (void)handleReachabilityModeDeactivated
{
}

- (void)_invertColorsChanged:(id)a3
{
}

- (void)_reduceTransparencyDidChange:(id)a3
{
}

- (void)_elementKeyColorWasInvalidated:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"SBSystemApertureNotificationUserInfoElementKey"];

  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_orderedContainerViews;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          Class v11 = -[SBSystemApertureViewController _elementForContainerView:](self, "_elementForContainerView:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
          char v12 = [v5 isEqual:v11];

          if (v12)
          {

            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
LABEL_12:
    [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:0x2000];
  }
}

- (void)viewWillLayoutSubviews
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)SBSystemApertureViewController;
  [(SBSystemApertureViewController *)&v44 viewWillLayoutSubviews];
  uint64_t v3 = [(SBSystemApertureViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  containerBackgroundParent = self->_containerBackgroundParent;
  v45[0] = self->_containerSubBackgroundParent;
  v45[1] = containerBackgroundParent;
  v45[2] = self->_containerParent;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "setBounds:", v5, v7, v9, v11);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [(SBSystemApertureViewController *)self traitCollection];
  [v18 displayScale];
  uint64_t v20 = v19;

  [(SAUISystemApertureManager *)self->_systemApertureManager hostWillPerformLayout];
  [(SBSystemApertureViewController *)self minimumSensorRegionFrame];
  double v39 = v21;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  magiciansCurtainView = self->_magiciansCurtainView;
  -[SBSystemApertureGainMapBackedRendering sizeThatFits:](magiciansCurtainView, "sizeThatFits:", v24, v26);
  BSRectWithSize();
  [(SBSystemApertureViewController *)self minimumSensorRegionFrame];
  UIRectCenteredIntegralRectScale();
  [(SBSystemApertureGainMapBackedRendering *)magiciansCurtainView setFrame:v20];
  uint64_t v29 = [(SBSystemApertureGainMapBackedRendering *)self->_highLevelMagiciansCurtainView superview];
  uint64_t v30 = [(SBSystemApertureViewController *)self view];
  objc_msgSend(v29, "convertRect:fromView:", v30, v39, v23, v25, v27);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  -[SBSystemApertureGainMapBackedRendering setFrame:](self->_highLevelMagiciansCurtainView, "setFrame:", v32, v34, v36, v38);
}

id __77__SBSystemApertureViewController__postLayoutDidChangeNotificationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 elementViewProvider];
  uint64_t v3 = [v2 element];
  double v4 = [v3 elementIdentifier];

  return v4;
}

- (id)_elementForContainerView:(id)a3
{
  uint64_t v3 = [a3 elementViewController];
  double v4 = [v3 elementViewProvider];
  double v5 = [v4 element];

  return v5;
}

- (id)_elementViewControllerForLayoutSpecifyingOverrider:(id)a3
{
  systemApertureManager = self->_systemApertureManager;
  double v4 = SATargetElementFromBehaviorOverrider();
  double v5 = [(SAUISystemApertureManager *)systemApertureManager elementViewControllerForElement:v4];

  return v5;
}

- (id)_layoutSpecifyingOverriderForContainerView:(id)a3
{
  uint64_t v3 = [a3 elementViewController];
  double v4 = SAUILayoutSpecifyingOverriderForElementViewController();

  return v4;
}

- (id)_containerViewForViewController:(id)a3 includingOutgoing:(BOOL)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    orderedContainerViews = self->_orderedContainerViews;
    if (self->_indicatorContainerView)
    {
      if (orderedContainerViews)
      {
        -[NSMutableArray arrayByAddingObject:](orderedContainerViews, "arrayByAddingObject:");
        double v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15[0] = self->_indicatorContainerView;
        double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      }
    }
    else
    {
      double v8 = orderedContainerViews;
    }
    double v10 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__SBSystemApertureViewController__containerViewForViewController_includingOutgoing___block_invoke;
    id v12[3] = &unk_1E6B03758;
    id v13 = v6;
    BOOL v14 = a4;
    double v9 = [(NSMutableArray *)v10 bs_firstObjectPassingTest:v12];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

BOOL __84__SBSystemApertureViewController__containerViewForViewController_includingOutgoing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 elementViewController];
  if (v4 == *(void **)(a1 + 32))
  {
    BOOL v6 = 1;
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    double v5 = [v3 outgoingElementViewController];
    BOOL v6 = v5 == *(void **)(a1 + 32);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_containerViewForViewController:(id)a3
{
  return [(SBSystemApertureViewController *)self _containerViewForViewController:a3 includingOutgoing:0];
}

- (id)_animatablePropertyWithProgressMilestones:(id)a3 block:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  id v8 = 0;
  if (v6 && v7)
  {
    double v9 = (void *)[v5 mutableCopy];
    id v8 = objc_alloc_init(MEMORY[0x1E4F43000]);
    [v8 setValue:0.0];
    objc_initWeak(&location, v8);
    double v10 = (void *)MEMORY[0x1E4F42FF0];
    v23[0] = v8;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __82__SBSystemApertureViewController__animatablePropertyWithProgressMilestones_block___block_invoke;
    uint64_t v18 = &unk_1E6AF6A20;
    objc_copyWeak(&v21, &location);
    id v12 = v9;
    id v19 = v12;
    id v13 = v6;
    id v20 = v13;
    [v10 _createTransformerWithInputAnimatableProperties:v11 presentationValueChangedCallback:&v15];

    if (objc_msgSend(v12, "containsObject:", &unk_1F3348BF8, v15, v16, v17, v18))
    {
      (*((void (**)(id, id, double))v13 + 2))(v13, v8, 0.0);
      [v12 removeObject:&unk_1F3348BF8];
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __82__SBSystemApertureViewController__animatablePropertyWithProgressMilestones_block___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = [WeakRetained isInvalidated];
    [v3 presentationValue];
    double v6 = v5;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_msgSend(v13, "bs_CGFloatValue");
          if ((v4 & 1) == 0 && BSFloatLessThanOrEqualToFloat())
          {
            (*(void (**)(double))(*(void *)(a1 + 40) + 16))(v6);
            if (!v10) {
              id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            [v10 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (NSDirectionalEdgeInsets)_maximumContainerViewOutsetsInBounds:(CGRect)a3 inLayoutMode:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v10 sensorRegionSize];
  double v12 = v11;
  double v26 = v13;

  id v14 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v14 minimumScreenEdgeInsets];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double v21 = v18 + (v12 - CGRectGetWidth(v27)) * 0.5;
  if (a4 < 2)
  {
    double v23 = *MEMORY[0x1E4F424F0];
    double v22 = *(double *)(MEMORY[0x1E4F424F0] + 16);
    double v24 = *(double *)(MEMORY[0x1E4F424F0] + 24);
  }
  else
  {
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double v22 = v26 + v20 - CGRectGetHeight(v28);
    double v23 = -v16;
    double v24 = v21;
  }
  double v25 = v21;
  result.trailing = v24;
  result.bottouint64_t m = v22;
  result.leading = v25;
  result.top = v23;
  return result;
}

- (NSDirectionalEdgeInsets)_validatedEdgeOutsetsForPreferredOutsets:(NSDirectionalEdgeInsets)a3 maximumOutsets:(NSDirectionalEdgeInsets)a4
{
  if (a4.top >= a3.top) {
    a3.top = a4.top;
  }
  double v4 = fmin(a3.top, 0.0);
  if (a4.leading >= a3.leading) {
    a3.leading = a4.leading;
  }
  double v5 = fmin(a3.leading, 0.0);
  if (a4.bottom >= a3.bottom) {
    a3.bottouint64_t m = a4.bottom;
  }
  double v6 = fmin(a3.bottom, 0.0);
  if (a4.trailing >= a3.trailing) {
    a3.trailing = a4.trailing;
  }
  double v7 = fmin(a3.trailing, 0.0);
  result.trailing = v7;
  result.bottouint64_t m = v6;
  result.leading = v5;
  result.top = v4;
  return result;
}

- (CGSize)_adjunctContainerMinimalViewSize
{
  id v2 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v2 sensorRegionSize];
  double v4 = v3;

  double v5 = v4;
  double v6 = v4;
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (CGRect)_frameForSensorRegionInBounds:(CGRect)a3
{
  double v4 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v4 sensorRegionSize];
  BSRectWithSize();

  double v5 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v5 minimumScreenEdgeInsets];

  double v6 = [(SBSystemApertureViewController *)self traitCollection];
  [v6 displayScale];
  UIRectCenteredXInRectScale();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)_portraitFrameForPrimaryContainerViewInBounds:(CGRect)a3 withPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a4 layoutDirection:(int64_t)a5
{
  -[SBSystemApertureViewController _frameForSensorRegionInBounds:](self, "_frameForSensorRegionInBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = [(SBSystemApertureViewController *)self traitCollection];
  [v6 displayScale];
  UIRectRoundToScale();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)_boundsForAdjunctContainerViewWithPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a3 layoutDirection:(int64_t)a4
{
  [(SBSystemApertureViewController *)self _adjunctContainerMinimalViewSize];
  BSRectWithSize();
  double v5 = [(SBSystemApertureViewController *)self traitCollection];
  [v5 displayScale];
  UIRectRoundToScale();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)_configureVariableBlur
{
  double v3 = (void *)MEMORY[0x1E4F743C8];
  double v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = [v3 materialViewWithRecipeNamed:@"systemApertureBackgroundVariableBlur-D73" inBundle:v4 options:0 initialWeighting:0 scaleAdjustment:1.0];

  double v5 = [(SBSystemApertureViewController *)self view];
  [v5 bounds];
  objc_msgSend(v8, "setFrame:", 0.0, -360.0, CGRectGetWidth(v10), 360.0);

  objc_msgSend(v8, "bs_setHitTestingDisabled:", 1);
  [v8 setAutoresizingMask:2];
  [v8 setHidden:1];
  double v6 = [v8 layer];
  [v6 setDisableUpdateMask:32];

  [(SBSystemApertureViewController *)self setVariableBlurView:v8];
  double v7 = [(SBSystemApertureViewController *)self view];
  [v7 insertSubview:v8 belowSubview:self->_containerSubBackgroundParent];
}

- (void)_addMitosisBlobEffects
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v3 setValue:&unk_1F3348C08 forKey:@"inputRadius"];
  double v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F39FC8]];
  id v5 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(v5, "CGColor"), @"inputColor");

  [v4 setValue:0 forKey:@"inputAmount"];
  double v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A030]];
  [v6 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputReversed"];
  double v7 = [(UIView *)self->_containerBackgroundParent layer];
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  [v7 setFilters:v8];
}

- (void)_removeMitosisBlobEffects
{
  id v2 = [(UIView *)self->_containerBackgroundParent layer];
  [v2 setFilters:MEMORY[0x1E4F1CBF0]];
}

- (void)_updatePreferredContentSizeCategoryForAllElements:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = [(SAUISystemApertureManager *)self->_systemApertureManager orderedElementViewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBSystemApertureViewController *)self _updatePreferredContentSizeCategoryForElementViewController:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updatePreferredContentSizeCategoryForElementViewController:(id)a3
{
  id v3 = a3;
  double v4 = SAUILayoutSpecifyingOverriderForElementViewController();
  uint64_t v5 = [v4 layoutMode];

  id v6 = [v3 viewIfLoaded];

  objc_msgSend(v6, "sbui_systemApertureApplyMinimumAndMaximumContentSizeCategoryForCustomLayoutMode:", v5 == 3);
}

- (void)_beginRequiringBacklightAssertionForReason:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSystemApertureViewController.m", 2385, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  [(NSCountedSet *)self->_backlightAssertionRequiringReasons addObject:v5];
  if (!self->_liveUpdatingAssertion)
  {
    id v6 = [(SBSystemApertureViewController *)self view];
    uint64_t v7 = [v6 window];
    uint64_t v8 = [v7 windowScene];

    if (v8)
    {
      long long v9 = [NSString stringWithFormat:@"System Aperture inactive content update: <%@>", v5];
      long long v10 = (void *)MEMORY[0x1E4F4F4C0];
      long long v11 = [MEMORY[0x1E4F4F528] requestLiveUpdatingForScene:v8];
      v18[0] = v11;
      long long v12 = [MEMORY[0x1E4F4F530] requestUnrestrictedFramerateForScene:v8];
      v18[1] = v12;
      double v13 = [MEMORY[0x1E4F4F540] ignoreWhenBacklightInactivates];
      v18[2] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
      double v15 = [v10 acquireWithExplanation:v9 observer:0 attributes:v14];
      liveUpdatingAssertion = self->_liveUpdatingAssertion;
      self->_liveUpdatingAssertion = v15;

      [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:2048];
    }
  }
}

- (void)_endRequiringBacklightAssertionForReason:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSystemApertureViewController.m", 2403, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  [(NSCountedSet *)self->_backlightAssertionRequiringReasons removeObject:v5];
  id v6 = [(NSCountedSet *)self->_backlightAssertionRequiringReasons anyObject];

  uint64_t v7 = v11;
  if (!v6)
  {
    if (self->_liveUpdatingAssertion)
    {
      [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:4096];
      liveUpdatingAssertion = self->_liveUpdatingAssertion;
    }
    else
    {
      liveUpdatingAssertion = 0;
    }
    [(BSInvalidatable *)liveUpdatingAssertion invalidate];
    long long v9 = self->_liveUpdatingAssertion;
    self->_liveUpdatingAssertion = 0;

    uint64_t v7 = v11;
  }
}

- (id)scenesForBacklightSession
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  id v5 = [WeakRetained associatedWindowScene];
  if ([v5 isMainDisplayWindowScene])
  {
    id v6 = [(SBSystemApertureViewController *)self traitCollection];
    uint64_t v7 = [v6 _backlightLuminance];

    if (v7 == 1)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v8 = self->_orderedContainerViews;
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            uint64_t v14 = -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", v13, (void)v19);
            if ([v14 layoutMode] >= 1)
            {
              double v15 = [(SBSystemApertureViewController *)self _elementForContainerView:v13];
              if (objc_opt_respondsToSelector())
              {
                double v16 = [v15 scene];
                if (v16) {
                  [v3 addObject:v16];
                }
              }
            }
          }
          uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v10);
      }

      double v17 = +[SBSystemApertureSceneElement scenesForBacklightSession];
      [v3 unionSet:v17];
    }
  }
  else
  {
  }
  return v3;
}

void __50__SBSystemApertureViewController_registerElement___block_invoke(uint64_t a1)
{
}

void __50__SBSystemApertureViewController_registerElement___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained systemApertureElementAssertionInvalidated];
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  id v23 = a5;
  uint64_t v8 = [v23 layoutMode];
  uint64_t v9 = [v23 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_setLayoutMode_reason_forTargetWithOverrider_];
  [v9 setLayoutMode:a3 reason:a4 forTargetWithOverrider:v23];

  uint64_t v10 = [v23 layoutMode];
  if (v8 != v10)
  {
    uint64_t v11 = v10;
    long long v12 = [(SBSystemApertureViewController *)self _elementViewControllerForLayoutSpecifyingOverrider:v23];
    if (v12) {
      [(SBSystemApertureViewController *)self _updatePreferredContentSizeCategoryForElementViewController:v12];
    }
    uint64_t v13 = SATargetElementFromBehaviorOverrider();
    if SAHasAlertBehavior() && (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v12 alertAssertion];
    }
    else
    {
      if (!SAHasActivityBehavior() || (objc_opt_respondsToSelector() & 1) == 0)
      {
        double v15 = 0;
LABEL_12:
        if (![v15 isValid])
        {
LABEL_26:

          goto LABEL_27;
        }
        if (SAHasAlertBehavior())
        {
          if (!v11)
          {
LABEL_25:
            [v15 setAutomaticallyInvalidatable:v11];
            goto LABEL_26;
          }
          double v16 = [v23 layoutSpecifyingOverridingParticipantSubordinateToParticipant:v12 thatRespondsToSelector:sel_layoutModePreferenceForTargetWithOverrider_isDefaultValue_];
          double v17 = [v16 layoutModePreferenceForTargetWithOverrider:v23 isDefaultValue:0];

          if (v11 <= [v17 preferredLayoutMode])
          {
            uint64_t v11 = 1;
          }
          else
          {
            double v18 = [v23 preferredLayoutModeAssertion];
            uint64_t v11 = [v18 layoutModeChangeReason] != 3;
          }
        }
        else
        {
          uint64_t v19 = objc_opt_class();
          id v20 = v15;
          if (v19)
          {
            if (objc_opt_isKindOfClass()) {
              long long v21 = v20;
            }
            else {
              long long v21 = 0;
            }
          }
          else
          {
            long long v21 = 0;
          }
          id v22 = v21;

          double v17 = [v22 preferredLayoutModeAssertion];

          uint64_t v11 = v11 == [v17 preferredLayoutMode];
        }

        goto LABEL_25;
      }
      uint64_t v14 = [v12 alertingActivityAssertion];
    }
    double v15 = (void *)v14;
    goto LABEL_12;
  }
LABEL_27:
  MEMORY[0x1F4181820]();
}

- (id)layoutModePreferenceForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v5 = a3;
  id v6 = SATargetElementFromBehaviorOverrider();
  int v7 = SAHasAlertBehavior();
  uint64_t v8 = [(SAUISystemApertureManager *)self->_systemApertureManager elementViewControllerForElement:v6];
  if SAHasActivityBehavior() && (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 temporallyOrderedAlertingActivityAssertions];
    int v10 = objc_msgSend(v9, "bs_containsObjectPassingTest:", &__block_literal_global_680);

    int v11 = v10 ^ 1;
  }
  else
  {
    int v11 = 1;
  }
  long long v12 = [v5 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_layoutModePreferenceForTargetWithOverrider_isDefaultValue_];
  uint64_t v13 = [v12 layoutModePreferenceForTargetWithOverrider:v5 isDefaultValue:0];
  uint64_t v14 = [v13 preferredLayoutMode];
  BOOL v15 = [(SBSystemApertureViewController *)self _doesElementHaveValidUrgencyAssertion:v6];
  uint64_t v16 = 0;
  uint64_t v26 = 0;
  BOOL v17 = v14 > 0 && v15;
  if (v14 != 3 && !v17) {
    uint64_t v16 = v11 & ~v7;
  }
  if ([(SBSystemApertureViewController *)self _shouldSuppressElement:v6 allowsSuppressionForSystemChromeSuppression:v16 reason:&v26])
  {
    if (objc_opt_respondsToSelector())
    {
      [v6 suppressForReason:v26];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v6 setSuppressed:1];
    }
    int64_t v21 = 0;
    uint64_t v22 = 4;
  }
  else
  {
    uint64_t v18 = [v13 layoutModeChangeReason];
    int64_t v19 = v14;
    if (v14 <= 2)
    {
      if ((unint64_t)([(SBSystemApertureViewController *)self _activeElementInterfaceOrientation]- 3) > 1)
      {
        uint64_t v20 = 3;
      }
      else if (objc_opt_respondsToSelector())
      {
        uint64_t v20 = [v5 isMinimalPresentationPossible];
      }
      else
      {
        uint64_t v20 = 0;
      }
      if (v14 >= v20) {
        int64_t v19 = v20;
      }
      else {
        int64_t v19 = v14;
      }
    }
    int64_t v23 = [(SBSystemApertureViewController *)self _mostRestrictiveLayoutModeFromActiveLayoutAssertions];
    if (v19 >= v23) {
      int64_t v21 = v23;
    }
    else {
      int64_t v21 = v19;
    }
    if (v21 == v14) {
      uint64_t v22 = v18;
    }
    else {
      uint64_t v22 = 4;
    }
    if (objc_opt_respondsToSelector()) {
      [v6 setSuppressed:0];
    }
  }
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4FA9300]) initWithPreferredLayoutMode:v21 reason:v22];

  return v24;
}

uint64_t __92__SBSystemApertureViewController_layoutModePreferenceForTargetWithOverrider_isDefaultValue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isValid];
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7
{
  double trailing = a5.trailing;
  bottouint64_t m = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  double v12 = a4.trailing;
  double v13 = a4.bottom;
  double v14 = a4.leading;
  double v15 = a4.top;
  id v18 = a6;
  int64_t v19 = [v18 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_forTargetWithOverrider_isDefaultValue_];
  objc_msgSend(v19, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:forTargetWithOverrider:isDefaultValue:", a3, v18, a7, v15, v14, v13, v12, top, leading, bottom, trailing);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  CGRect v28 = [(SBSystemApertureViewController *)self view];
  [v28 bounds];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  -[SBSystemApertureViewController _maximumContainerViewOutsetsInBounds:inLayoutMode:](self, "_maximumContainerViewOutsetsInBounds:inLayoutMode:", a3, v30, v32, v34, v36);
  -[SBSystemApertureViewController _validatedEdgeOutsetsForPreferredOutsets:maximumOutsets:](self, "_validatedEdgeOutsetsForPreferredOutsets:maximumOutsets:", v21, v23, v25, v27, v37, v38, v39, v40);
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  if (a3 == 1)
  {
    if ((unint64_t)([(SBSystemApertureViewController *)self _activeElementInterfaceOrientation]- 3) < 2)goto LABEL_9; {
    double v58 = [(SBSystemApertureViewController *)self _elementViewControllerForLayoutSpecifyingOverrider:v18];
    }
    double v59 = [(SBSystemApertureViewController *)self _containerViewForViewController:v58];
    double v60 = [(SBSystemApertureViewController *)self _primaryContainerView];

    if (v59 != v60)
    {
LABEL_9:
      [(SBSystemApertureViewController *)self _adjunctContainerMinimalViewSize];
      if (v44 > -v61) {
        double v44 = -v61;
      }
      goto LABEL_24;
    }
LABEL_12:
    -[SBSystemApertureViewController _applySymmetryToPreferredLayoutOutsets:](self, "_applySymmetryToPreferredLayoutOutsets:", v42, v44, v46, v48);
    double v42 = v62;
    double v44 = v63;
    double v46 = v64;
    double v48 = v65;
    goto LABEL_24;
  }
  if (a3 == 2) {
    goto LABEL_12;
  }
  if (a3 != 3) {
    goto LABEL_24;
  }
  uint64_t v49 = SBSACustomLayoutForBehaviorOverrider();
  if (!SBSAIsCustomLayout(v49)) {
    goto LABEL_24;
  }
  double v80 = v48;
  [(SBSystemApertureViewController *)self _preferredMinSizeForCustomLayout:v49 elementInterfaceOrientation:[(SBSystemApertureViewController *)self _activeElementInterfaceOrientation]];
  double v51 = v50;
  double v82 = v52;
  [(SBSystemApertureViewController *)self _yOffsetForCustomLayout:v49];
  double v81 = v53;
  double v79 = v51;
  -[SBSystemApertureViewController edgeOutsetsForSize:](self, "edgeOutsetsForSize:", v51, v82);
  if (v46 <= v56)
  {
    id v66 = [(SBSystemApertureViewController *)self traitCollection];
    double v48 = v80;
    -[SBSystemApertureViewController _portraitFrameForPrimaryContainerViewInBounds:withPreferredEdgeOutsets:layoutDirection:](self, "_portraitFrameForPrimaryContainerViewInBounds:withPreferredEdgeOutsets:layoutDirection:", [v66 layoutDirection], v30, v32, v34, v36, v42, v44, v46, v80);
    double v68 = v67;

    if (v49 == 4)
    {
LABEL_22:
      double v74 = v81;
      double v42 = v42 - v81;
      goto LABEL_23;
    }
    -[SBSystemApertureViewController edgeOutsetsForSize:](self, "edgeOutsetsForSize:", v68, v82 / v79 * v68);
    double v42 = v69;
    double v44 = v70;
    double v46 = v71;
    double v48 = v72;
  }
  else
  {
    double v42 = v54;
    double v44 = v55;
    double v48 = v57;
    double v46 = v56;
  }
  switch(v49)
  {
    case 4:
      goto LABEL_22;
    case 3:
      goto LABEL_21;
    case 1:
      double v73 = -v44;
      if (v44 >= 0.0) {
        double v73 = v44;
      }
      if (v73 < 39.0)
      {
LABEL_21:
        double v74 = v81;
        double v42 = -v81;
LABEL_23:
        double v46 = v74 + v46;
      }
      break;
  }
LABEL_24:

  double v75 = v42;
  double v76 = v44;
  double v77 = v46;
  double v78 = v48;
  result.double trailing = v78;
  result.bottouint64_t m = v77;
  result.double leading = v76;
  result.double top = v75;
  return result;
}

- (BOOL)isRequestingMenuPresentationForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_isRequestingMenuPresentationForTargetWithOverrider_isDefaultValue_];
  LODWORD(a4) = [v7 isRequestingMenuPresentationForTargetWithOverrider:v6 isDefaultValue:a4];

  if (a4)
  {
    if ([v6 layoutMode] == 3)
    {
      uint64_t v8 = SATargetElementFromBehaviorOverrider();
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v9 = self->_orderedContainerViews;
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
          double v15 = -[SBSystemApertureViewController _elementForContainerView:](self, "_elementForContainerView:", v14, (void)v20);

          if (v15 == v8) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v17 = v14;

        if (!v17) {
          goto LABEL_18;
        }
        BOOL v16 = 1;
      }
      else
      {
LABEL_11:

LABEL_18:
        id v18 = SBLogSystemApertureController();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[SBSystemApertureViewController isRequestingMenuPresentationForTargetWithOverrider:isDefaultValue:]();
        }

        id v17 = 0;
        BOOL v16 = 0;
      }
    }
    else
    {
      uint64_t v8 = SBLogSystemApertureController();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SBSystemApertureViewController isRequestingMenuPresentationForTargetWithOverrider:isDefaultValue:]();
      }
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (NSDirectionalEdgeInsets)_hostSuggestedOutsetsForElement:(id)a3
{
  double v3 = *MEMORY[0x1E4F424F0];
  double v4 = *(double *)(MEMORY[0x1E4F424F0] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F424F0] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F424F0] + 24);
  result.double trailing = v6;
  result.bottouint64_t m = v5;
  result.double leading = v4;
  result.double top = v3;
  return result;
}

- (void)preferredLayoutModeDidInvalidateForLayoutSpecifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:0x2000];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v4 = self->_orderedContainerViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setNeedsLayout", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:0x2000];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v4 = self->_orderedContainerViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setNeedsLayout", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)menuPresentationRequestDidChangeForLayoutSpecifier:(id)a3
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    int v4 = [v6 isRequestingMenuPresentation];
    uint64_t v5 = [(SBSystemApertureViewController *)self _containerViewForLayoutSpecifier:v6];
    [v5 setContentClippingEnabled:v4 ^ 1u];
  }
}

- (NSDirectionalEdgeInsets)edgeOutsetsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *MEMORY[0x1E4F424F0];
  if (a3.width == 0.0 && a3.height == 0.0)
  {
    double v7 = *(double *)(MEMORY[0x1E4F424F0] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F424F0] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F424F0] + 24);
  }
  else
  {
    long long v10 = [(SBSystemApertureViewController *)self view];
    [v10 bounds];
    double v29 = v11;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    id v18 = [(SBSystemApertureViewController *)self _layoutMetrics];
    [v18 sensorRegionSize];
    double v20 = v19;
    double v22 = v21;

    -[SBSystemApertureViewController _maximumContainerViewOutsetsInBounds:inLayoutMode:](self, "_maximumContainerViewOutsetsInBounds:inLayoutMode:", 3, v29, v13, v15, v17);
    -[SBSystemApertureViewController _validatedEdgeOutsetsForPreferredOutsets:maximumOutsets:](self, "_validatedEdgeOutsetsForPreferredOutsets:maximumOutsets:", v6, (v20 - width) * 0.5, v22 - height, (v20 - width) * 0.5, v23, v24, v25, v26);
    double v6 = v27;
  }
  double v28 = v6;
  result.double trailing = v9;
  result.bottouint64_t m = v8;
  result.double leading = v7;
  result.double top = v28;
  return result;
}

- (double)concentricPaddingForProvidedView:(id)a3 fromViewProvider:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  double v8 = self->_orderedContainerViews;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v43 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = *(void **)(*((void *)&v42 + 1) + 8 * v12);
      double v14 = objc_msgSend(v13, "elementViewController", (void)v42);
      id v15 = [v14 elementViewProvider];

      if (v15 == v7) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    double v16 = v13;

    if (!v16) {
      goto LABEL_28;
    }
    double v17 = [v7 systemApertureLayoutSpecifyingOverrider];
    uint64_t v18 = [v17 layoutMode];
    double v19 = [v17 behaviorOverridingTarget];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v19 overridesConcentricPaddingForView:v6 inLayoutMode:v18])
    {
      [v19 concentricPaddingOverrideForView:v6 inLayoutMode:v18];
    }
    else
    {
      double v20 = [(SBSystemApertureViewController *)self _primaryContainerView];

      if (v16 == v20 || v18 == 3)
      {
        if (v18 != 3)
        {
          double v27 = [(SBSystemApertureViewController *)self traitCollection];
          [v27 displayScale];
        }
        [v6 bounds];
        CGFloat x = v48.origin.x;
        CGFloat y = v48.origin.y;
        CGFloat width = v48.size.width;
        CGFloat height = v48.size.height;
        if (CGRectIsEmpty(v48))
        {
          [(NSMutableArray *)v16 bounds];
          objc_msgSend(v6, "sizeThatFits:", v32, v33);
          BSRectWithSize();
          CGFloat x = v34;
          CGFloat y = v35;
          CGFloat width = v36;
          CGFloat height = v37;
        }
        v49.origin.CGFloat x = x;
        v49.origin.CGFloat y = y;
        v49.size.CGFloat width = width;
        v49.size.CGFloat height = height;
        CGRectGetMidX(v49);
      }
      else
      {
        [(SBSystemApertureViewController *)self _adjunctContainerMinimalViewSize];
        double v22 = v21;
        double v24 = v23;
        objc_msgSend(v17, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v6, v18);
        if (v26 == 0.0 && v25 == 0.0) {
          objc_msgSend(v6, "sizeThatFits:", v22, v24);
        }
      }
    }
  }
  else
  {
LABEL_9:
    double v16 = v8;
  }

LABEL_28:
  double v38 = [(SBSystemApertureViewController *)self traitCollection];
  [v38 displayScale];
  UIRoundToScale();
  double v40 = v39;

  return v40;
}

- (CGRect)sensorRegionObstructingViewProvider:(id)a3 inContentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if ((unint64_t)([(SBSystemApertureViewController *)self _activeElementInterfaceOrientation]- 1) <= 1)
  {
    uint64_t v12 = [(SAUISystemApertureManager *)self->_systemApertureManager orderedElementViewControllers];
    double v13 = [v12 firstObject];
    uint64_t v14 = [v13 elementViewProvider];
    if ((id)v14 == v6)
    {
    }
    else
    {
      id v15 = (void *)v14;
      double v16 = [(NSMutableArray *)self->_orderedContainerViews firstObject];
      int v17 = [v7 isDescendantOfView:v16];

      if (!v17) {
        goto LABEL_7;
      }
    }
    [(SBSystemApertureViewController *)self sensorRegionInContentView:v7 fromViewProvider:v6];
    double v8 = v18;
    double v9 = v19;
    double v10 = v20;
    double v11 = v21;
  }
LABEL_7:

  double v22 = v8;
  double v23 = v9;
  double v24 = v10;
  double v25 = v11;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)sensorRegionInContentView:(id)a3 fromViewProvider:(id)a4
{
  id v6 = self->_containerParent;
  id v7 = a3;
  [(SBFTouchPassThroughView *)v6 bounds];
  -[SBSystemApertureViewController _frameForSensorRegionInBounds:](self, "_frameForSensorRegionInBounds:");
  objc_msgSend(v7, "convertRect:fromView:", v6);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGSize)maximumAvailableSizeForProvidedMinimalView:(id)a3 fromViewProvider:(id)a4
{
  int v4 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v4 maximumHorizontalMinimalViewSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (CGSize)maximumAvailableSizeForProvidedLeadingView:(id)a3 fromViewProvider:(id)a4
{
  int v4 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v4 maximumLeadingTrailingViewSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (CGSize)maximumAvailableSizeForProvidedTrailingView:(id)a3 fromViewProvider:(id)a4
{
  int v4 = [(SBSystemApertureViewController *)self _layoutMetrics];
  [v4 maximumLeadingTrailingViewSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (BOOL)viewProviderShouldMakeSensorShadowVisible:(id)a3
{
  return [(SBSystemApertureSettings *)self->_settings isSensorShadowVisible];
}

- (double)viewProviderSensorShadowOpacityFactor:(id)a3
{
  [(SBSystemApertureSettings *)self->_settings sensorShadowOpacityFactor];
  return result;
}

- (NSDirectionalEdgeInsets)_applySymmetryToPreferredLayoutOutsets:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  bottouint64_t m = a3.bottom;
  double leading = a3.leading;
  CGFloat top = a3.top;
  double v7 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
  [v7 sensorRegionSize];
  BSRectWithSize();
  double v8 = [(SBSystemApertureViewController *)self view];
  [v8 bounds];
  UIRectCenteredXInRectScale();
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v28.origin.CGFloat x = v10;
  v28.origin.CGFloat y = v12;
  v28.size.CGFloat width = v14;
  v28.size.CGFloat height = v16;
  double MinX = CGRectGetMinX(v28);
  v29.origin.CGFloat x = v10;
  v29.origin.CGFloat y = v12;
  v29.size.CGFloat width = v14;
  v29.size.CGFloat height = v16;
  double v18 = CGRectGetMinX(v29);
  [(SBSystemApertureSettings *)self->_settings paddingFromScreenEdgeRequiringSymmetricLayout];
  double v20 = v19;
  [(SBSystemApertureSettings *)self->_settings minimumRequiredSymmetryInCompactLayoutMode];
  if (leading >= trailing || leading + MinX <= v20)
  {
    if (trailing >= leading || trailing + v18 <= v20)
    {
      if (trailing < leading) {
        double leading = trailing;
      }
      double trailing = leading;
    }
    else
    {
      UIRoundToScale();
      double leading = v22;
    }
  }
  else
  {
    UIRoundToScale();
    double trailing = v21;
  }
  double v23 = top;
  double v24 = leading;
  double v25 = bottom;
  double v26 = trailing;
  result.double trailing = v26;
  result.bottouint64_t m = v25;
  result.double leading = v24;
  result.CGFloat top = v23;
  return result;
}

- (double)alertingDurationForHost:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  double v5 = [v4 elementViewProvider];
  double v6 = [v5 element];
  double v7 = [v6 elementIdentifier];
  if ([v7 isEqualToString:*MEMORY[0x1E4FA7F58]]) {
    double v8 = 7.0;
  }
  else {
    double v8 = 3.0;
  }

  if (objc_opt_respondsToSelector())
  {
    [v5 preferredAlertingDuration:v8];
    double v8 = v9;
  }

  return v8;
}

- (void)elementRequestsNegativeResponse:(id)a3
{
}

- (void)elementRequestsSignificantUpdateTransition:(id)a3
{
  id v4 = a3;
  double v8 = [[_SBSystemApertureSignificantUpdateTransitionAssertion alloc] initWithElement:v4];

  significantUpdateTransitionAssertions = self->_significantUpdateTransitionAssertions;
  if (!significantUpdateTransitionAssertions)
  {
    double v6 = (NSPointerArray *)objc_alloc_init(MEMORY[0x1E4F28F50]);
    double v7 = self->_significantUpdateTransitionAssertions;
    self->_significantUpdateTransitionAssertions = v6;

    significantUpdateTransitionAssertions = self->_significantUpdateTransitionAssertions;
  }
  [(NSPointerArray *)significantUpdateTransitionAssertions addPointer:v8];
  [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:0x2000];
}

- (void)elementRequestsCancellingResizeGesture:(id)a3
{
  [(UIPanGestureRecognizer *)self->_resizePanGesture sb_cancel];
  interactionLongPressGesture = self->_interactionLongPressGesture;
  [(UILongPressGestureRecognizer *)interactionLongPressGesture sb_cancel];
}

- (BOOL)_panGestureInhibitedByElement
{
  id v2 = [(SBSystemApertureViewController *)self _currentFirstElement];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 inhibitSystemPanGesture];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_longPressGestureInhibitedByElement
{
  id v2 = [(SBSystemApertureViewController *)self _currentFirstElement];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 inhibitSystemLongPressGesture];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)element:(id)a3 requestsPersistentAnimationOfType:(int64_t)a4
{
  id v7 = a3;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (!a4)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SBSystemApertureViewController.m" lineNumber:2979 description:@"Can't request No-OP animation"];
    }
    double v8 = 0;
  }
  else
  {
    double v8 = [(SBSystemApertureViewController *)self _persistentAssertionForElement:v7 withType:a4];
    [(NSMutableSet *)self->_dynamicPersistentAnimationAssertions addObject:v8];
  }
  [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:256];

  return v8;
}

- (id)_persistentAssertionForElement:(id)a3 withType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [SBSAElementIdentification alloc];
  double v8 = [v6 clientIdentifier];
  double v9 = [v6 elementIdentifier];
  CGFloat v10 = [(SBSAElementIdentification *)v7 initWithClientIdentifier:v8 elementIdentifier:v9];

  double v11 = [[_SBSADynamicPersistentAnimationAssertion alloc] initWithElementIdentity:v10 animation:a4];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__SBSystemApertureViewController__persistentAssertionForElement_withType___block_invoke;
  v13[3] = &unk_1E6B037A0;
  objc_copyWeak(&v14, &location);
  [(SAAssertion *)v11 addInvalidationBlock:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

void __74__SBSystemApertureViewController__persistentAssertionForElement_withType___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[152] removeObject:v5];
    [v4 _invalidatePreferencesForReason:256];
  }
}

- (void)invalidateElementUrgencyPreferences
{
}

- (id)_containerViewWithRank:(unint64_t)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(NSMutableArray *)self->_orderedContainerViews count];
  if (v7 <= a3)
  {
    if (v4)
    {
      unint64_t v9 = v7;
      if (!self->_orderedContainerViews)
      {
        CGFloat v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        orderedContainerViews = self->_orderedContainerViews;
        self->_orderedContainerViews = v10;
      }
      double v8 = 0;
      do
      {
        CGFloat v12 = [MEMORY[0x1E4F29128] UUID];
        id v13 = [(SBSystemApertureViewController *)self _newContainerViewWithInterfaceElementIdentifier:v12];

        [(NSMutableArray *)self->_orderedContainerViews setObject:v13 atIndexedSubscript:v9];
        if (a3 == v9)
        {
          id v14 = v13;

          double v8 = v14;
        }

        ++v9;
      }
      while (v9 <= a3);
      [(SBSystemApertureViewController *)self _updateContainerViewRanks];
    }
    else
    {
      double v8 = 0;
    }
  }
  else
  {
    double v8 = [(NSMutableArray *)self->_orderedContainerViews objectAtIndexedSubscript:a3];
  }
  return v8;
}

- (id)_containerViewWithRank:(unint64_t)a3
{
  return [(SBSystemApertureViewController *)self _containerViewWithRank:a3 creatingIfNecessary:0];
}

- (BOOL)systemApertureManagerShouldUseOrderedElementViewControllers:(id)a3
{
  if (systemApertureManagerShouldUseOrderedElementViewControllers__onceToken != -1) {
    dispatch_once(&systemApertureManagerShouldUseOrderedElementViewControllers__onceToken, &__block_literal_global_717);
  }
  return 1;
}

void __94__SBSystemApertureViewController_systemApertureManagerShouldUseOrderedElementViewControllers___block_invoke()
{
  v0 = SBLogSystemApertureController();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEFAULT, "**Using ordered element view controllers**", v1, 2u);
  }
}

- (id)systemApertureDebuggingUtilityOrderedContainerViews:(id)a3
{
  return self->_orderedContainerViews;
}

- (void)systemApertureDebuggingUtility:(id)a3 updateUIForConnectionState:(int)a4
{
  id v5 = [(SBSystemApertureViewController *)self view];
  id v9 = [v5 layer];

  switch(a4)
  {
    case 0:
    case 4:
      id v6 = [MEMORY[0x1E4F428B8] systemYellowColor];
      goto LABEL_5;
    case 1:
    case 5:
      id v6 = [MEMORY[0x1E4F428B8] clearColor];
      double v7 = 0.0;
      goto LABEL_6;
    case 2:
      id v6 = [MEMORY[0x1E4F428B8] systemGreenColor];
LABEL_5:
      double v7 = 5.0;
LABEL_6:
      id v8 = v6;
      objc_msgSend(v9, "setBorderColor:", objc_msgSend(v8, "CGColor"));

      [v9 setBorderWidth:v7];
      break;
    default:
      break;
  }
}

- (void)systemApertureDebuggingUtility:(id)a3 shouldCreateDebuggingLabel:(BOOL)a4
{
  BOOL v4 = a4;
  v30[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  queryIterationLabel = self->_queryIterationLabel;
  if (v4)
  {
    if (!queryIterationLabel)
    {
      id v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
      id v9 = self->_queryIterationLabel;
      self->_queryIterationLabel = v8;

      [(UILabel *)self->_queryIterationLabel setText:@"System Aperture Query Iteration: "];
      CGFloat v10 = [(UILabel *)self->_queryIterationLabel layer];
      [v10 setAllowsHitTesting:0];

      [(UILabel *)self->_queryIterationLabel setNumberOfLines:1];
      [(UILabel *)self->_queryIterationLabel setTextAlignment:1];
      [(UILabel *)self->_queryIterationLabel setUserInteractionEnabled:0];
      double v11 = self->_queryIterationLabel;
      CGFloat v12 = (void *)MEMORY[0x1E4F42A30];
      [MEMORY[0x1E4F42A30] labelFontSize];
      id v13 = objc_msgSend(v12, "systemFontOfSize:");
      [(UILabel *)v11 setFont:v13];

      id v14 = self->_queryIterationLabel;
      double v15 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      [(UILabel *)v14 setTextColor:v15];

      CGFloat v16 = self->_queryIterationLabel;
      double v17 = [MEMORY[0x1E4F428B8] systemBlackColor];
      [(UILabel *)v16 setBackgroundColor:v17];

      double v18 = [(SBSystemApertureViewController *)self view];
      [v18 addSubview:self->_queryIterationLabel];

      [(UILabel *)self->_queryIterationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      double v19 = [(UILabel *)self->_queryIterationLabel centerXAnchor];
      double v20 = [(SBSystemApertureViewController *)self view];
      double v21 = [v20 centerXAnchor];
      double v22 = [v19 constraintEqualToAnchor:v21];

      double v23 = [(UILabel *)self->_queryIterationLabel centerYAnchor];
      double v24 = [(SBSystemApertureViewController *)self view];
      double v25 = [v24 centerYAnchor];
      double v26 = [v23 constraintEqualToAnchor:v25];

      double v27 = (void *)MEMORY[0x1E4F28DC8];
      v30[0] = v22;
      v30[1] = v26;
      CGRect v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
      [v27 activateConstraints:v28];
    }
  }
  else if (queryIterationLabel)
  {
    [(UILabel *)queryIterationLabel removeFromSuperview];
    CGRect v29 = self->_queryIterationLabel;
    self->_queryIterationLabel = 0;
  }
}

- (void)elementViewControllingWillDisappear:(id)a3
{
  char v3 = [a3 elementViewProvider];
  id v4 = [v3 element];

  if (objc_opt_respondsToSelector()) {
    [v4 element:v4 visibilityWillChange:0];
  }
}

- (void)elementViewControllingDidDisappear:(id)a3
{
  char v3 = [a3 elementViewProvider];
  id v4 = [v3 element];

  if (objc_opt_respondsToSelector()) {
    [v4 element:v4 visibilityDidChange:0];
  }
}

- (id)parentViewForSubBackgroundForSystemApertureContainerView:(id)a3
{
  return self->_containerSubBackgroundParent;
}

- (id)parentViewForBackgroundForSystemApertureContainerView:(id)a3
{
  return self->_containerBackgroundParent;
}

- (void)systemApertureContainerView:(id)a3 sampledLuminanceLevelChangedTo:(int64_t)a4
{
}

- (CGRect)systemApertureContainerView:(id)a3 hitRectForBounds:(CGRect)a4 debugColor:(id *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  CGFloat v12 = [MEMORY[0x1E4F428B8] systemYellowColor];
  id v13 = [v12 colorWithAlphaComponent:0.5];

  id v14 = [(SBSystemApertureViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [v14 safeAreaInsets];
  UIRectInset();
  CGFloat v100 = v23;
  CGFloat v101 = v24;
  CGFloat v98 = v26;
  CGFloat v99 = v25;
  objc_msgSend(v11, "convertRect:toView:", v14, x, y, width, height);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  CGFloat v34 = v33;
  if ((unint64_t)([(SBSystemApertureViewController *)self _activeElementInterfaceOrientation]- 1) >= 2)
  {
    double v56 = v13;
  }
  else
  {
    double v91 = v22;
    double v92 = v16;
    CGFloat rect = v30;
    [(SBSystemApertureSettings *)self->_settings containerHitRectTopMarginDefault];
    CGFloat v36 = v35;
    v103.origin.double x = v100;
    v103.origin.double y = v101;
    v103.size.double width = v99;
    v103.size.double height = v98;
    double v37 = v32;
    double MinY = CGRectGetMinY(v103);
    v104.origin.double x = v28;
    v104.origin.double y = v36;
    v104.size.double width = v37;
    v104.size.double height = v34;
    double MaxY = CGRectGetMaxY(v104);
    [(SBSystemApertureSettings *)self->_settings containerHitRectTopMarginDefault];
    double v41 = MaxY + v40;
    if (MinY >= v41) {
      double v42 = MinY;
    }
    else {
      double v42 = v41;
    }
    v105.origin.double x = v28;
    v105.origin.double y = v36;
    v105.size.double width = v37;
    double v93 = v34;
    v105.size.double height = v34;
    v106.size.double height = v42 - CGRectGetMinY(v105);
    v106.origin.double x = v28;
    CGFloat v94 = v36;
    v106.origin.double y = v36;
    v106.size.double width = v37;
    double v97 = v106.size.height;
    double MinX = CGRectGetMinX(v106);
    v107.origin.double y = v101;
    v107.origin.double x = v100;
    v107.size.double width = v99;
    v107.size.double height = v98;
    double v44 = MinX - CGRectGetMinX(v107);
    [(SBSystemApertureSettings *)self->_settings containerHitRectHorizontalMarginLimit];
    settings = self->_settings;
    CGFloat v90 = v28;
    if (v44 >= v46)
    {
      [(SBSystemApertureSettings *)settings containerHitRectHorizontalMargin];
      double v96 = v28 - v57;
      [(SBSystemApertureSettings *)self->_settings containerHitRectHorizontalMargin];
      double v58 = v37;
      double v102 = v37 + v59 * 2.0;
      double v50 = v92;
      CGFloat v49 = v93;
      double v51 = v18;
      double v52 = v20;
      double v53 = v91;
      CGFloat v60 = v28;
      CGFloat v61 = v58;
    }
    else
    {
      double v88 = v42;
      double v89 = v37;
      [(SBSystemApertureSettings *)settings containerHitRectHorizontalLimit];
      BOOL v48 = v44 < v47;
      double v50 = v92;
      CGFloat v49 = v93;
      double v51 = v18;
      double v52 = v20;
      double v53 = v91;
      if (v48)
      {
        v108.origin.double x = v100;
        v108.origin.double y = v101;
        v108.size.double width = v99;
        v108.size.double height = v98;
        double v96 = CGRectGetMinX(v108);
        v109.origin.double x = v100;
        v109.origin.double y = v101;
        CGFloat v49 = v93;
        v109.size.double width = v99;
        v109.size.double height = v98;
        CGFloat v54 = CGRectGetWidth(v109);
        [(SBSystemApertureSettings *)self->_settings containerHitRectTopMarginWide];
        v110.origin.double y = v55;
        v110.origin.double x = v96;
        v110.size.double height = v97;
        CGFloat v94 = v110.origin.y;
        double v102 = v54;
        v110.size.double width = v54;
        CGFloat v61 = v37;
        double v97 = v88 - CGRectGetMinY(v110);
        CGFloat v60 = v90;
      }
      else
      {
        CGFloat v61 = v37;
        CGFloat v60 = v90;
        double v96 = v90;
        double v102 = v89;
      }
    }
    -[SBSystemApertureViewController _frameForSensorRegionInBounds:](self, "_frameForSensorRegionInBounds:", v50, v51, v52, v53);
    CGFloat v63 = v62;
    CGFloat v65 = v64;
    CGFloat v67 = v66;
    CGFloat v69 = v68;
    v111.origin.double x = v60;
    v111.origin.double y = rect;
    v111.size.double width = v61;
    v111.size.double height = v49;
    v118.origin.double x = v63;
    v118.origin.double y = v65;
    v118.size.double width = v67;
    v118.size.double height = v69;
    if (CGRectIntersectsRect(v111, v118))
    {
      double v56 = v13;
    }
    else
    {
      double v70 = [MEMORY[0x1E4F428B8] systemGreenColor];
      double v56 = [v70 colorWithAlphaComponent:0.5];

      v112.origin.double x = v63;
      v112.origin.double y = v65;
      v112.size.double width = v67;
      v112.size.double height = v69;
      CGFloat v71 = v49;
      double MaxX = CGRectGetMaxX(v112);
      v113.origin.double x = v60;
      v113.origin.double y = rect;
      v113.size.double width = v61;
      v113.size.double height = v71;
      double v73 = CGRectGetMinX(v113);
      v114.origin.double x = v96;
      v114.origin.double y = v94;
      v114.size.double width = v102;
      v114.size.double height = v97;
      CGRectGetMaxX(v114);
      if (MaxX < v73)
      {
        v115.origin.double x = v90;
        v115.origin.double y = rect;
        v115.size.double width = v61;
        v115.size.double height = v71;
        v116.origin.double x = CGRectGetMinX(v115) + -4.0;
        v116.origin.double y = v94;
        v116.size.double width = v102;
        v116.size.double height = v97;
        CGRectGetMinX(v116);
      }
    }
  }
  BOOL v74 = [(SBSystemApertureSettings *)self->_settings isContainerHitRectVisible];
  if (a5 && v74) {
    *a5 = v56;
  }
  double v75 = [(SBSystemApertureViewController *)self traitCollection];
  [v75 displayScale];
  UIRectRoundToScale();
  objc_msgSend(v14, "convertRect:toView:", v11);
  double v77 = v76;
  double v79 = v78;
  double v81 = v80;
  double v83 = v82;

  double v84 = v77;
  double v85 = v79;
  double v86 = v81;
  double v87 = v83;
  result.size.double height = v87;
  result.size.double width = v86;
  result.origin.double y = v85;
  result.origin.double x = v84;
  return result;
}

- (id)keyLineColorValidatorForSystemApertureContainerView:(id)a3
{
  return self->_colorValidator;
}

- (unint64_t)systemApertureApertureElementAuthorityMaximumNumberOfSimultaneouslyVisibleElements:(id)a3
{
  return 2;
}

- (int64_t)systemApertureApertureElementAuthority:(id)a3 preferredLayoutModeForElement:(id)a4
{
  id v4 = SAUILayoutSpecifyingOverriderForElement();
  int64_t v5 = [v4 preferredLayoutMode];

  return v5;
}

- (BOOL)systemApertureApertureElementAuthority:(id)a3 isActivityElementAlerting:(id)a4
{
  id v5 = a4;
  if (SAHasActivityBehavior())
  {
    id v6 = [(SAUISystemApertureManager *)self->_systemApertureManager elementViewControllerForElement:v5];
    if (objc_opt_respondsToSelector())
    {
      double v7 = [v6 temporallyOrderedAlertingActivityAssertions];
      char v8 = objc_msgSend(v7, "bs_containsObjectPassingTest:", &__block_literal_global_729);
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

uint64_t __99__SBSystemApertureViewController_systemApertureApertureElementAuthority_isActivityElementAlerting___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isValid];
}

- (BOOL)systemApertureApertureElementAuthority:(id)a3 isElementExpandedDueToUserInteraction:(id)a4
{
  id v4 = SAUILayoutSpecifyingOverriderForElement();
  id v5 = [v4 preferredLayoutModeAssertion];
  BOOL v6 = [v5 layoutModeChangeReason] == 3;

  return v6;
}

- (BOOL)systemApertureApertureElementAuthority:(id)a3 isElementRequiredToRemainVisible:(id)a4
{
  return ![(SBSystemApertureViewController *)self _isInteractiveHidingSupportedByElement:a4];
}

- (BOOL)_doesElementHaveValidUrgencyAssertion:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 platformElementHost];
    id v5 = [v4 urgentAndImportantAssertion];
    char v6 = [v5 isValid];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)systemApertureApertureElementAuthority:(id)a3 isElementUrgentlyVisible:(id)a4
{
  id v5 = a4;
  if ([(SBSystemApertureViewController *)self _doesElementHaveValidUrgencyAssertion:v5])
  {
    char v6 = SAUILayoutSpecifyingOverriderForElement();
    BOOL v7 = [v6 preferredLayoutMode] > 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_containerViewForGesture:(id)a3 initialLocationInContainerView:(CGPoint *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v7 = self->_orderedContainerViews;
  id v8 = (id)[(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        _UISystemGestureLocationInView();
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        if ([v11 pointInside:0 withEvent:(void)v17])
        {
          id v8 = v11;
          if (a4)
          {
            a4->double x = v13;
            a4->double y = v15;
          }
          goto LABEL_12;
        }
      }
      id v8 = (id)[(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v8;
}

- (id)_containerViewForScrollEvent:(id)a3 ofGestureRecognizer:(id)a4 initialLocation:(CGPoint *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  CGFloat v10 = self->_orderedContainerViews;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    double v29 = a5;
    uint64_t v13 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        CGFloat v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([(SBSystemApertureViewController *)self _isSystemGesture:v9])
        {
          _UISystemGestureLocationForScrollEventInView();
          double v17 = v16;
          double v19 = v18;
          long long v20 = +[SBReachabilityManager sharedInstance];
          [v20 effectiveReachabilityYOffset];
          double v22 = v19 - v21;
        }
        else
        {
          [v8 locationInView:v15];
          double v17 = v23;
          double v22 = v24;
        }
        if (objc_msgSend(v15, "pointInside:withEvent:", 0, v17, v22))
        {
          id v25 = v15;
          if (v29)
          {
            v29->double x = v17;
            v29->double y = v22;
          }
          goto LABEL_15;
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  id v25 = 0;
LABEL_15:

  if ([v25 _isInAWindow]) {
    double v26 = v25;
  }
  else {
    double v26 = 0;
  }
  id v27 = v26;

  return v27;
}

void __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveEvent___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    id v3 = self;
    id v4 = v14;
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

    if (v6) {
      goto LABEL_10;
    }
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsacontainerp_0.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSystemApertureViewController.m", 3407, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  uint64_t v13 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  [v6 setAssociatedInterfaceElementIdentifier:v13];

  objc_msgSend(v6, "setInitialLocation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    id v3 = self;
    id v4 = v14;
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

    if (v6) {
      goto LABEL_10;
    }
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsacontainerl.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSystemApertureViewController.m", 3441, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  uint64_t v13 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  [v6 setAssociatedInterfaceElementIdentifier:v13];
}

void __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveTouch___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    id v3 = self;
    id v4 = v14;
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

    if (v6) {
      goto LABEL_10;
    }
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsacontainerp_0.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSystemApertureViewController.m", 3446, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  uint64_t v13 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  [v6 setAssociatedInterfaceElementIdentifier:v13];

  objc_msgSend(v6, "setInitialLocation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UIPanGestureRecognizer *)a3;
  id v5 = v4;
  if ((UIPanGestureRecognizer *)self->_interactionLongPressGesture == v4
    && self->_activeContainerDefaultPressGestureDescription)
  {
    BOOL v7 = [(UIPanGestureRecognizer *)v4 view];
    [(UIPanGestureRecognizer *)v5 locationInView:v7];
    uint64_t v8 = objc_msgSend(v7, "hitTest:withEvent:", 0);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      LOBYTE(v6) = 0;
    }
    else {
      BOOL v6 = ![(SBSystemApertureViewController *)self _longPressGestureInhibitedByElement];
    }
  }
  else if (self->_resizePanGesture == v4 && self->_activeContainerResizeGestureDescription)
  {
    BOOL v6 = ![(SBSystemApertureViewController *)self _panGestureInhibitedByElement];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unint64_t)_systemGestureTypeForGesture:(id)a3 systemGestureManager:(id)a4
{
  BOOL v6 = (UILongPressGestureRecognizer *)a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if ((UILongPressGestureRecognizer *)self->_resizePanGesture == v6)
  {
    unint64_t v9 = 132;
  }
  else if (self->_interactionLongPressGesture == v6)
  {
    unint64_t v9 = 133;
  }
  else
  {
    unint64_t v9 = [v7 typeOfSystemGesture:v6];
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_activeWindowScene = &self->_activeWindowScene;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_activeWindowScene);
  Class v10 = [WeakRetained associatedWindowScene];
  uint64_t v11 = [v10 systemGestureManager];

  uint64_t v12 = [(SBSystemApertureViewController *)self _systemGestureTypeForGesture:v8 systemGestureManager:v11];
  uint64_t v13 = [(SBSystemApertureViewController *)self _systemGestureTypeForGesture:v7 systemGestureManager:v11];

  if ((unint64_t)(v12 - 132) >= 2 && v12 != 45 || (BOOL v14 = 1, (unint64_t)(v13 - 132) >= 2) && v13 != 45)
  {
    CGFloat v15 = SBLogSystemGesture();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = SBSystemGestureTypeDebugName(v12);
      double v17 = SBSystemGestureTypeDebugName(v13);
      int v19 = 138543618;
      long long v20 = v16;
      __int16 v21 = 2114;
      double v22 = v17;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "disallowing simultaneous (%{public}@) and (%{public}@)", (uint8_t *)&v19, 0x16u);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_isResizePanGestureActive
{
  return (unint64_t)([(UIPanGestureRecognizer *)self->_resizePanGesture state] - 1) < 2;
}

- (BOOL)_isInteractionLongPressGestureActive
{
  return (unint64_t)([(UILongPressGestureRecognizer *)self->_interactionLongPressGesture state] - 1) < 2;
}

- (BOOL)_isAnyGestureRecognizerActive
{
  if ([(SBSystemApertureViewController *)self _isResizePanGestureActive]) {
    return 1;
  }
  return [(SBSystemApertureViewController *)self _isInteractionLongPressGestureActive];
}

- (void)_cancelExternalGesturesForReason:(id)a3
{
  p_activeWindowScene = &self->_activeWindowScene;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_activeWindowScene);
  BOOL v6 = [WeakRetained associatedWindowScene];
  id v7 = [v6 systemGestureManager];

  [v7 cancelGestureRecognizerOfType:1 reason:v4];
  [v7 cancelGestureRecognizerOfType:7 reason:v4];
  [v7 cancelGestureRecognizerOfType:45 reason:v4];
}

- (void)_handleResizePan:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1) {
    [(SBSystemApertureViewController *)self _cancelExternalGesturesForReason:@"SAResizePan"];
  }
  [(SBSystemApertureViewController *)self _handleContainerResizeGesture:v4];
}

- (void)_handleResizeResult:(int64_t)a3 withContainerView:(id)a4
{
  id v7 = a4;
  id v8 = [(SBSystemApertureViewController *)self _layoutSpecifyingOverriderForContainerView:v7];
  unint64_t v9 = [v7 elementViewController];

  uint64_t v10 = [v8 layoutMode];
  uint64_t v11 = v10;
  if (a3 != 1)
  {
    if (a3 != -1) {
      goto LABEL_42;
    }
    uint64_t v12 = [v8 minimumSupportedLayoutMode];
    uint64_t v13 = [v9 elementViewProvider];
    BOOL v14 = [v13 element];
    BOOL v15 = [(SBSystemApertureViewController *)self _isInteractiveHidingSupportedByElement:v14];

    uint64_t v16 = 2;
    if (v12 > 2) {
      uint64_t v16 = v12;
    }
    if (!v15) {
      uint64_t v16 = v12;
    }
    if (v11 - 1 <= v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = v11 - 1;
    }
    if (v11 <= v16)
    {
      if (objc_opt_respondsToSelector() & 1) != 0 && ([v8 isInteractiveDismissalEnabled])
      {
        uint64_t v17 = -1;
      }
      else if (v15)
      {
        uint64_t v17 = 0;
      }
    }
    goto LABEL_29;
  }
  if (v10 <= 2) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = v10;
  }
  uint64_t v18 = v10 + 1;
  uint64_t v19 = [v8 maximumSupportedLayoutMode];
  if (v18 < v19) {
    uint64_t v20 = v11 + 1;
  }
  else {
    uint64_t v20 = v19;
  }
  if (v20 < v17) {
    uint64_t v17 = v20;
  }
  if (v11 != v17)
  {
LABEL_29:
    if (v11 != v17)
    {
      double v29 = [v9 elementViewProvider];
      long long v30 = [v29 element];

      if (v17 == -1)
      {
        long long v31 = [(SAUISystemApertureManager *)self->_systemApertureManager elementAssertionForElement:v30];
        long long v32 = v31;
        if (v31 && [v31 isValid])
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            double v37 = [MEMORY[0x1E4F28B00] currentHandler];
          }
          [v32 invalidateWithReason:@"removed via pan gesture" layoutModeChangeReason:3];
        }
        else
        {
          long long v33 = SBLogSystemApertureController();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[SBSystemApertureViewController _handleResizeResult:withContainerView:]();
          }
        }
      }
      else
      {
        [v8 setPreferredLayoutMode:v17 reason:3];
      }
      CGFloat v34 = [v30 clientIdentifier];
      uint64_t v35 = [v30 elementIdentifier];
      +[SBSystemApertureTelemetryEmitter logTelemetryForInteractionPanGesture:v17 handled:1 clientIdentifier:v34 elementIdentifier:v35];

      CGFloat v36 = [(SBSystemApertureViewController *)self view];
      [v36 setNeedsLayout];
    }
    goto LABEL_42;
  }
  __int16 v21 = [(SAUISystemApertureManager *)self->_systemApertureManager registeredElements];
  double v22 = objc_msgSend(v21, "bs_compactMap:", &__block_literal_global_741);

  if ([v22 count])
  {
    uint64_t v23 = [v22 firstObject];
    double v24 = objc_msgSend(v22, "bs_reduce:block:", v23, &__block_literal_global_744_0);

    if (v24)
    {
      [v24 invalidateWithReason:@"User Unhide"];
      id v25 = [v24 representedElement];
      double v26 = [v25 clientIdentifier];
      id v27 = [v25 elementIdentifier];
      +[SBSystemApertureTelemetryEmitter logTelemetryForInteractionPanGesture:2 handled:1 clientIdentifier:v26 elementIdentifier:v27];

      double v28 = [(SBSystemApertureViewController *)self view];
      [v28 setNeedsLayout];
    }
  }

LABEL_42:
}

id __72__SBSystemApertureViewController__handleResizeResult_withContainerView___block_invoke()
{
  v0 = SAUILayoutSpecifyingOverriderForElement();
  id v1 = [v0 preferredLayoutModeAssertion];
  if ([v1 layoutModeChangeReason] == 3)
  {
    if ([v1 preferredLayoutMode]) {
      id v2 = 0;
    }
    else {
      id v2 = v1;
    }
  }
  else
  {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

id __72__SBSystemApertureViewController__handleResizeResult_withContainerView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  BOOL v6 = [v5 creationDate];
  id v7 = [v4 creationDate];
  if ([v6 compare:v7] == -1) {
    id v8 = v4;
  }
  else {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

- (BOOL)_isInteractiveHidingSupportedByElement:(id)a3
{
  id v3 = a3;
  if (!SAHasActivityBehavior()) {
    goto LABEL_4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  [MEMORY[0x1E4F42E40] getStyleOverrides];
  id v4 = STUIBackgroundActivityIdentifiersForStyleOverrides();
  id v5 = [v3 representedBackgroundActivityIdentifiers];
  char v6 = [v4 intersectsSet:v5];

  if (v6)
  {
LABEL_4:
    LOBYTE(v7) = 0;
  }
  else
  {
LABEL_5:
    if (objc_opt_respondsToSelector()) {
      int v7 = [v3 preventsSwipeToHide] ^ 1;
    }
    else {
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (void)_handleInteractionLongPress:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1) {
    [(SBSystemApertureViewController *)self _cancelExternalGesturesForReason:@"SAInteractionLongPress"];
  }
  [(SBSystemApertureViewController *)self _handleContainerDefaultPressGesture:v4];
}

- (BOOL)_handleButtonEventWithTest:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v7 = (unsigned int (**)(id, void))a3;
  id v8 = a4;
  id v9 = (uint64_t (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSystemApertureViewController.m", 3640, @"Invalid parameter not satisfying: %@", @"test" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBSystemApertureViewController.m", 3641, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [(SAUISystemApertureManager *)self->_systemApertureManager registeredElements];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v7[2](v7, v14) && (v9[2](v9, v14) & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v11;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SBSystemApertureViewController_handleHeadsetButtonPress___block_invoke_2;
  v4[3] = &__block_descriptor_33_e21_B16__0___SAElement__8l;
  BOOL v5 = a3;
  return [(SBSystemApertureViewController *)self _handleButtonEventWithTest:&__block_literal_global_772 handler:v4];
}

uint64_t __59__SBSystemApertureViewController_handleHeadsetButtonPress___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __59__SBSystemApertureViewController_handleHeadsetButtonPress___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleHeadsetButtonPress:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)handleHomeButtonPress
{
  return [(SBSystemApertureViewController *)self _handleButtonEventWithTest:&__block_literal_global_777 handler:&__block_literal_global_781];
}

uint64_t __55__SBSystemApertureViewController_handleHomeButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __55__SBSystemApertureViewController_handleHomeButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleHomeButtonPress];
}

- (BOOL)handleHomeButtonDoublePress
{
  return [(SBSystemApertureViewController *)self _handleButtonEventWithTest:&__block_literal_global_783 handler:&__block_literal_global_787];
}

uint64_t __61__SBSystemApertureViewController_handleHomeButtonDoublePress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __61__SBSystemApertureViewController_handleHomeButtonDoublePress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleHomeButtonDoublePress];
}

- (BOOL)handleHomeButtonLongPress
{
  return [(SBSystemApertureViewController *)self _handleButtonEventWithTest:&__block_literal_global_789 handler:&__block_literal_global_793_0];
}

uint64_t __59__SBSystemApertureViewController_handleHomeButtonLongPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __59__SBSystemApertureViewController_handleHomeButtonLongPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleHomeButtonLongPress];
}

- (BOOL)handleLockButtonPress
{
  return [(SBSystemApertureViewController *)self _handleButtonEventWithTest:&__block_literal_global_795 handler:&__block_literal_global_799];
}

uint64_t __55__SBSystemApertureViewController_handleLockButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __55__SBSystemApertureViewController_handleLockButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleLockButtonPress];
}

- (BOOL)handleVoiceCommandButtonPress
{
  return [(SBSystemApertureViewController *)self _handleButtonEventWithTest:&__block_literal_global_801 handler:&__block_literal_global_805];
}

uint64_t __63__SBSystemApertureViewController_handleVoiceCommandButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __63__SBSystemApertureViewController_handleVoiceCommandButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleVoiceCommandButtonPress];
}

- (BOOL)handleVolumeUpButtonPress
{
  return [(SBSystemApertureViewController *)self _handleButtonEventWithTest:&__block_literal_global_807 handler:&__block_literal_global_811];
}

uint64_t __59__SBSystemApertureViewController_handleVolumeUpButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __59__SBSystemApertureViewController_handleVolumeUpButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleVolumeUpButtonPress];
}

- (BOOL)handleVolumeDownButtonPress
{
  return [(SBSystemApertureViewController *)self _handleButtonEventWithTest:&__block_literal_global_813 handler:&__block_literal_global_817_0];
}

uint64_t __61__SBSystemApertureViewController_handleVolumeDownButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __61__SBSystemApertureViewController_handleVolumeDownButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleVolumeDownButtonPress];
}

- (void)_axRegisterForZoomUpdatesIfNecessary
{
  id v12[3] = *MEMORY[0x1E4F143B8];
  if (self->_zoomRegistrationIdentifier || !_AXSZoomTouchEnabled())
  {
    [(SBSystemApertureViewController *)self _axZoomLevelOrStandbyModeChanged];
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB7D90] sharedInstance];
    [v3 registerInterestInZoomAttributes];

    objc_initWeak(&location, self);
    id v4 = [MEMORY[0x1E4FB7D90] sharedInstance];
    uint64_t v5 = *MEMORY[0x1E4FB7D98];
    v12[0] = *MEMORY[0x1E4FB7DA8];
    v12[1] = v5;
    v12[2] = *MEMORY[0x1E4FB7DA0];
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__SBSystemApertureViewController__axRegisterForZoomUpdatesIfNecessary__block_invoke;
    void v9[3] = &unk_1E6B03890;
    objc_copyWeak(&v10, &location);
    void v9[4] = self;
    int v7 = [v4 registerForZoomAttributes:v6 onDisplay:0 updatesImmediatelyWithChangedHandler:v9];
    zoomRegistrationIdentifier = self->_zoomRegistrationIdentifier;
    self->_zoomRegistrationIdentifier = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __70__SBSystemApertureViewController__axRegisterForZoomUpdatesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = [v9 objectForKey:*MEMORY[0x1E4FB7DA8]];
    objc_msgSend(v4, "bs_CGFloatValue");

    uint64_t v5 = [v9 objectForKey:*MEMORY[0x1E4FB7D98]];
    [v5 BOOLValue];

    char v6 = [v9 objectForKey:*MEMORY[0x1E4FB7DA0]];
    int v7 = [v6 BOOLValue];

    if (v7)
    {
      [*(id *)(a1 + 32) _addZoomAnimationAssertion];
      int v8 = 1;
    }
    else
    {
      int v8 = BSFloatEqualToFloat() ^ 1;
    }
    if (WeakRetained[1288] != v8)
    {
      WeakRetained[1288] = v8;
      [WeakRetained _axZoomLevelOrStandbyModeChanged];
    }
  }
}

- (void)_addZoomAnimationAssertion
{
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__SBSystemApertureViewController__addZoomAnimationAssertion__block_invoke;
  id v12[3] = &unk_1E6AF4FB8;
  objc_copyWeak(&v13, &location);
  char v6 = (void *)[v3 initWithIdentifier:v5 forReason:@"Zoom Animating" invalidationBlock:v12];

  [(NSMutableArray *)self->_zoomAnimationAssertions addObject:v6];
  dispatch_time_t v7 = dispatch_time(0, 200000000);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SBSystemApertureViewController__addZoomAnimationAssertion__block_invoke_2;
  void v9[3] = &unk_1E6AF5290;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __60__SBSystemApertureViewController__addZoomAnimationAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && [WeakRetained[158] count]) {
    [v4[158] removeObject:v5];
  }
}

uint64_t __60__SBSystemApertureViewController__addZoomAnimationAssertion__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 1264) count];
  if (!result)
  {
    id v3 = *(void **)(a1 + 40);
    return [v3 _axZoomLevelOrStandbyModeChanged];
  }
  return result;
}

- (void)_axZoomLevelOrStandbyModeChanged
{
}

- (void)_axRevealHiddenElementIfPossible
{
  id v3 = [(SBSystemApertureViewController *)self _primaryContainerView];
  [(SBSystemApertureViewController *)self _handleResizeResult:1 withContainerView:v3];
}

- (void)_axLayoutSpecifierRequestsDiminishment:(id)a3
{
  id v4 = [(SBSystemApertureViewController *)self _containerViewForLayoutSpecifier:a3];
  [(SBSystemApertureViewController *)self _handleResizeResult:-1 withContainerView:v4];
}

- (id)_newContainerViewWithInterfaceElementIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[SBSystemApertureContainerView alloc] initWithInterfaceElementIdentifier:v4];

  [(SBSystemApertureContainerView *)v5 setDelegate:self];
  [(SBSystemApertureContainerView *)v5 setElementOrientationAuthority:self];
  return v5;
}

- (id)_containerViewForLayoutSpecifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self->_orderedContainerViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", v10, (void)v19);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          id v17 = v10;
          uint64_t v12 = v4;
LABEL_17:

          goto LABEL_18;
        }
        uint64_t v12 = v11;
        uint64_t v13 = [v11 behaviorOverridingParticipantSubordinateToParticipant:self];
        if (v13)
        {
          id v14 = (id)v13;
          while (v14 != v4)
          {
            uint64_t v15 = [v12 behaviorOverridingParticipantSubordinateToParticipant:v14];

            id v14 = (id)v15;
            if (!v15) {
              goto LABEL_13;
            }
          }
          id v16 = v10;

          if (v16) {
            goto LABEL_17;
          }
        }
LABEL_13:
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_18:

  return v10;
}

- (void)_updateStatusBarAvoidanceFrameWithAnimationSettings:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 BSAnimationSettings];
  id v5 = [(SBSystemApertureViewController *)self _associatedWindowScene];
  uint64_t v6 = [v5 statusBarManager];

  [(SBSystemApertureViewController *)self minimumSensorRegionFrame];
  double x = v7;
  double y = v9;
  double width = v11;
  double height = v13;
  if ((unint64_t)([(SBSystemApertureViewController *)self _activeElementInterfaceOrientation]- 1) <= 1)
  {
    long long v33 = v6;
    CGFloat v34 = v4;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v15 = self->_orderedContainerViews;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v35 + 1) + 8 * v19);
          long long v21 = -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", v20, v33, v34, (void)v35);
          if ([v21 layoutMode] > 0
            || ![(UILongPressGestureRecognizer *)self->_interactionLongPressGesture state]
            || [(UIPanGestureRecognizer *)self->_resizePanGesture state] >= 1)
          {
            long long v22 = [v20 window];
            [v20 bounds];
            objc_msgSend(v22, "convertRect:fromView:", v20);
            CGFloat v24 = v23;
            CGFloat v26 = v25;
            CGFloat v28 = v27;
            CGFloat v30 = v29;

            v41.origin.double x = v24;
            v41.origin.double y = v26;
            v41.size.double width = v28;
            v41.size.double height = v30;
            if (!CGRectIsEmpty(v41))
            {
              v42.origin.double x = x;
              v42.origin.double y = y;
              v42.size.double width = width;
              v42.size.double height = height;
              v44.origin.double x = v24;
              v44.origin.double y = v26;
              v44.size.double width = v28;
              v44.size.double height = v30;
              CGRect v43 = CGRectUnion(v42, v44);
              double x = v43.origin.x;
              double y = v43.origin.y;
              double width = v43.size.width;
              double height = v43.size.height;
            }
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v31 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
        uint64_t v17 = v31;
      }
      while (v31);
    }

    uint64_t v6 = v33;
    id v4 = v34;
  }
  if ([(SBSystemApertureViewController *)self _isAnyGestureRecognizerActive]) {
    uint64_t v32 = 3;
  }
  else {
    uint64_t v32 = 2;
  }
  objc_msgSend(v6, "setAvoidanceFrame:reason:statusBar:animationSettings:options:", @"SBSystemApertureViewController", 0, v4, v32, x, y, width, height);
}

- (int64_t)_mostRestrictiveLayoutModeFromActiveLayoutAssertions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v2->_reasonsToLayoutAssertions;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    int64_t v6 = 3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMapTable objectForKey:](v2->_reasonsToLayoutAssertions, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        uint64_t v9 = [v8 maximumPermittedLayoutMode];

        if (v9 < v6) {
          int64_t v6 = v9;
        }
      }
      uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v6 = 3;
  }

  objc_sync_exit(v2);
  return v6;
}

- (void)_removeLayoutAssertionAndReevaluate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    int64_t v6 = [v9 reason];
    double v7 = [(NSMapTable *)v5->_reasonsToLayoutAssertions objectForKey:v6];

    if (!v7
      || (uint64_t v8 = [(SBSystemApertureViewController *)v5 _mostRestrictiveLayoutModeFromActiveLayoutAssertions], [(NSMapTable *)v5->_reasonsToLayoutAssertions removeObjectForKey:v6], [(SBSystemApertureViewController *)v5 _mostRestrictiveLayoutModeFromActiveLayoutAssertions] != v8))
    {
      [(SAUISystemApertureManager *)v5->_systemApertureManager invalidatePromotedElements];
    }

    objc_sync_exit(v5);
    id v4 = v9;
  }
}

- (id)_layoutAssertionWithMaximumPermittedLayoutMode:(int64_t)a3 reason:(id)a4 creatingIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if ([v8 length])
  {
    id v9 = self;
    objc_sync_enter(v9);
    id v10 = [(NSMapTable *)v9->_reasonsToLayoutAssertions objectForKey:v8];
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = !v5;
    }
    if (!v11)
    {
      objc_initWeak(&location, v9);
      long long v12 = [SBSystemApertureLayoutAssertion alloc];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      double v23 = __108__SBSystemApertureViewController__layoutAssertionWithMaximumPermittedLayoutMode_reason_creatingIfNecessary___block_invoke;
      CGFloat v24 = &unk_1E6B038B8;
      objc_copyWeak(&v25, &location);
      id v10 = [(SBSystemApertureLayoutAssertion *)v12 initWithMaximumPermittedLayoutMode:a3 reason:v8 invalidationHandler:&v21];
      if (!v9->_reasonsToLayoutAssertions)
      {
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28E10], "strongToWeakObjectsMapTable", v21, v22, v23, v24);
        reasonsToLayoutAssertions = v9->_reasonsToLayoutAssertions;
        v9->_reasonsToLayoutAssertions = (NSMapTable *)v13;
      }
      uint64_t v15 = [(SBSystemApertureViewController *)v9 _mostRestrictiveLayoutModeFromActiveLayoutAssertions];
      [(NSMapTable *)v9->_reasonsToLayoutAssertions setObject:v10 forKey:v8];
      uint64_t v16 = [(SBSystemApertureViewController *)v9 _mostRestrictiveLayoutModeFromActiveLayoutAssertions];
      if (v16 != v15)
      {
        uint64_t v17 = [(SBSystemApertureViewController *)v9 _primaryContainerView];
        uint64_t v18 = [(SBSystemApertureViewController *)v9 _layoutSpecifyingOverriderForContainerView:v17];

        uint64_t v19 = [v18 preferredLayoutModeAssertion];
        if ([v19 preferredLayoutMode] > v16 && objc_msgSend(v19, "layoutModeChangeReason") == 3) {
          [v19 invalidateWithReason:@"more restrictive layout assertion"];
        }
        [(SAUISystemApertureManager *)v9->_systemApertureManager invalidatePromotedElements];
      }
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __108__SBSystemApertureViewController__layoutAssertionWithMaximumPermittedLayoutMode_reason_creatingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _removeLayoutAssertionAndReevaluate:v3];
}

- (int64_t)_activeElementInterfaceOrientation
{
  int64_t result = self->_activeElementInterfaceOrientation;
  if (!result)
  {
    id v4 = SBLogSystemApertureOrientation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SBSystemApertureViewController _activeElementInterfaceOrientation](v4);
    }

    return self->_activeElementInterfaceOrientation;
  }
  return result;
}

- (id)_associatedWindowScene
{
  id v2 = [(SBSystemApertureViewController *)self view];
  id v3 = [v2 window];
  id v4 = [v3 windowScene];

  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 associatedWindowScene];

  return v9;
}

- (CGSize)_preferredMinSizeForCustomLayout:(int64_t)a3 elementInterfaceOrientation:(int64_t)a4
{
  switch(a3)
  {
    case 1:
      BOOL v6 = (unint64_t)(a4 - 3) >= 2;
      double v7 = 143.666667;
      double v8 = 144.666667;
      goto LABEL_5;
    case 2:
      id v10 = [(SBSystemApertureViewController *)self _layoutMetrics];
      [v10 minimumScreenEdgeInsets];
      double v12 = v11;
      double v14 = v13;

      uint64_t v15 = [(SBSystemApertureViewController *)self view];
      [v15 bounds];
      double v17 = v16;

      double v9 = v17 - v12 - v14;
      if (BSSizeEqualToSize())
      {
        double v8 = 465.0;
      }
      else if (BSSizeEqualToSize())
      {
        double v8 = 432.0;
      }
      else
      {
        int v18 = BSSizeEqualToSize();
        double v8 = 467.0;
        if (!v18) {
          double v8 = 423.0;
        }
      }
      break;
    case 3:
      double v9 = 250.0;
      double v8 = 180.0;
      break;
    case 4:
      [(SBSystemApertureSettings *)self->_settings tallRectWidth];
      BOOL v6 = (unint64_t)(a4 - 3) >= 2;
      double v8 = 220.0;
LABEL_5:
      if (v6) {
        double v9 = v7;
      }
      else {
        double v9 = v8;
      }
      if (!v6) {
        double v8 = v7;
      }
      break;
    default:
      double v9 = *MEMORY[0x1E4F1DB30];
      double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
  }
  double v19 = v9;
  result.double height = v8;
  result.double width = v19;
  return result;
}

- (double)_yOffsetForCustomLayout:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 3) {
    return dbl_1D8FD1AA0[a3 - 1];
  }
  return result;
}

- (SBSystemApertureWindowScene)activeWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  return (SBSystemApertureWindowScene *)WeakRetained;
}

- (SBSystemApertureBacklightSessionAggregator)backlightSessionAggregator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backlightSessionAggregator);
  return (SBSystemApertureBacklightSessionAggregator *)WeakRetained;
}

- (void)setBacklightSessionAggregator:(id)a3
{
}

- (void)setVariableBlurView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backlightSessionAggregator);
  objc_destroyWeak((id *)&self->_activeWindowScene);
  objc_storeStrong((id *)&self->_mostRecentTouchIdentifiersHitTestedToAXOverlayChrome, 0);
  objc_storeStrong((id *)&self->_queryIterationLabel, 0);
  objc_storeStrong((id *)&self->_debuggingUtility, 0);
  objc_storeStrong((id *)&self->_snapshotAssertions, 0);
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_impactFeedbackStylesToGenerators, 0);
  objc_storeStrong((id *)&self->_activeContainerResizeGestureDescription, 0);
  objc_storeStrong((id *)&self->_activeContainerDefaultPressGestureDescription, 0);
  objc_storeStrong((id *)&self->_resizeGestureUpdateQueue, 0);
  objc_storeStrong((id *)&self->_longPressGestureUpdateQueue, 0);
  objc_storeStrong((id *)&self->_pendingInteractionResults, 0);
  objc_storeStrong((id *)&self->_pendingTransitionResults, 0);
  objc_storeStrong((id *)&self->_timerIdentifiersToDescriptionRecords, 0);
  objc_storeStrong((id *)&self->_transitionIdentifiersToFloatAnimatableProperties, 0);
  objc_storeStrong((id *)&self->_lastAppliedPropertyIdentitiesToTransitionDescriptions, 0);
  objc_storeStrong((id *)&self->_containerParentIdentifier, 0);
  objc_storeStrong((id *)&self->_rootPreferencesProvider, 0);
  objc_storeStrong((id *)&self->_contentSizeCategoryTraitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_cachedLayoutDidChangeUserInfo, 0);
  objc_storeStrong((id *)&self->_zoomAnimationAssertions, 0);
  objc_storeStrong((id *)&self->_systemApertureDefaults, 0);
  objc_storeStrong((id *)&self->_significantUpdateTransitionAssertions, 0);
  objc_storeStrong((id *)&self->_colorValidator, 0);
  objc_storeStrong((id *)&self->_zoomRegistrationIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicPersistentAnimationAssertions, 0);
  objc_storeStrong((id *)&self->_transitionKeyLineAssertions, 0);
  objc_storeStrong((id *)&self->_transitionShadowAssertions, 0);
  objc_storeStrong((id *)&self->_suppressForSystemChromeSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_liveUpdatingAssertion, 0);
  objc_storeStrong((id *)&self->_overrideRenderingStyleRequests, 0);
  objc_storeStrong((id *)&self->_backlightAssertionRequiringReasons, 0);
  objc_storeStrong((id *)&self->_reasonsToLayoutAssertions, 0);
  objc_storeStrong((id *)&self->_bundleIDsPreferringSuppression, 0);
  objc_storeStrong((id *)&self->_sceneIDsPreferringSuppression, 0);
  objc_storeStrong((id *)&self->_systemApertureSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_suppressTouchCancellationAssertion, 0);
  objc_storeStrong((id *)&self->_interactionLongPressGesture, 0);
  objc_storeStrong((id *)&self->_resizePanGesture, 0);
  objc_storeStrong((id *)&self->_elementAuthority, 0);
  objc_storeStrong((id *)&self->_systemApertureManager, 0);
  objc_storeStrong((id *)&self->_orderedContainerViews, 0);
  objc_storeStrong((id *)&self->_highLevelMagiciansCurtainView, 0);
  objc_storeStrong((id *)&self->_magiciansCurtainView, 0);
  objc_storeStrong((id *)&self->_indicatorContainerPortalView, 0);
  objc_storeStrong((id *)&self->_indicatorContainerView, 0);
  objc_storeStrong((id *)&self->_curtainViewHoster, 0);
  objc_storeStrong((id *)&self->_containerParent, 0);
  objc_storeStrong((id *)&self->_variableBlurView, 0);
  objc_storeStrong((id *)&self->_containerBackgroundParent, 0);
  objc_storeStrong((id *)&self->_containerSubBackgroundParent, 0);
  objc_destroyWeak((id *)&self->_visibilityDelegate);
  objc_destroyWeak((id *)&self->_embeddedDisplayWindowScene);
}

- (NSArray)stateDump
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s", *MEMORY[0x1E4FA78A8]);
  long long v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s", *MEMORY[0x1E4FA78B0]);
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s", *MEMORY[0x1E4FA78B8]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(SAUISystemApertureManager *)self->_systemApertureManager orderedElementViewControllers];
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        double v9 = SAUILayoutSpecifyingOverriderForElementViewController();
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        double v11 = [v8 elementViewProvider];
        double v12 = [v11 element];
        double v13 = [v12 clientIdentifier];
        [v10 setValue:v13 forKey:v21];

        double v14 = [v8 elementViewProvider];
        uint64_t v15 = [v14 element];
        double v16 = [v15 elementIdentifier];
        [v10 setValue:v16 forKey:v20];

        [v9 layoutMode];
        double v17 = SAUIStringFromElementViewLayoutMode();
        [v10 setValue:v17 forKey:v3];

        [v22 addObject:v10];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  return (NSArray *)v22;
}

- (NSMutableArray)systemApertureModelStateDump
{
  return [(SBSystemApertureDebuggingUtility *)self->_debuggingUtility systemApertureModelStateDump];
}

- (void)setSystemApertureAnimationFrameRecording:(BOOL)a3
{
}

- (NSMutableDictionary)animationFrameRecordings
{
  return [(SBSystemApertureDebuggingUtility *)self->_debuggingUtility animationFrameRecordings];
}

- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3
{
}

- (void)hostOrientationDidChangeTo:(int64_t)a3 withPreviousOrientation:(int64_t)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  int64_t activeElementInterfaceOrientation = self->_activeElementInterfaceOrientation;
  double v11 = SBLogSystemApertureOrientation();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = BSInterfaceOrientationDescription();
    int v27 = 138412290;
    uint64_t v28 = v12;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "System Aperture Orientation settings did change to: %@", (uint8_t *)&v27, 0xCu);
  }
  if (activeElementInterfaceOrientation) {
    BOOL v13 = activeElementInterfaceOrientation == a4;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (!a3) {
      goto LABEL_17;
    }
LABEL_9:
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  double v17 = SBLogSystemApertureOrientation();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SBSystemApertureViewController(Private) hostOrientationDidChangeTo:withPreviousOrientation:context:]();
  }

  if (a3) {
    goto LABEL_9;
  }
LABEL_17:
  double v19 = SBLogSystemApertureOrientation();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[SBSystemApertureViewController(Private) hostOrientationDidChangeTo:withPreviousOrientation:context:](v19);
  }

  if (!v9)
  {
LABEL_20:
    long long v20 = [MEMORY[0x1E4FA5F08] unanimatedBehaviorSettings];
    double v14 = [v20 BSAnimationSettings];

    if (v14) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_10:
  double v14 = +[SBAnimationUtilities animationSettingsForRotationFromOrientation:activeElementInterfaceOrientation toOrientation:a3 withContext:v9];
  if (v14) {
    goto LABEL_11;
  }
LABEL_21:
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2 object:self file:@"SBSystemApertureViewController.m" lineNumber:4120 description:@"Failed to compute animation settings"];

LABEL_11:
  if (activeElementInterfaceOrientation == a3)
  {
    SBLogSystemApertureOrientation();
    uint64_t v15 = (SBSystemApertureAnimator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = BSInterfaceOrientationDescription();
      int v27 = 138412290;
      uint64_t v28 = v16;
      _os_log_impl(&dword_1D85BA000, &v15->super, OS_LOG_TYPE_DEFAULT, "Not applying orientation update to SBSystemApertureViewController because new orientation:(%@) matches current orientation", (uint8_t *)&v27, 0xCu);
    }
  }
  else
  {
    uint64_t v15 = [[SBSystemApertureAnimator alloc] initWithSettings:v14];
    id v22 = [[SBSystemApertureViewControllerRotationTransitionContext alloc] initWithTargetOrientation:a3];
    [(_UIViewControllerTransitionContext *)v22 _setIsAnimated:1];
    [(_UIViewControllerTransitionContext *)v22 _setAnimator:v15];
    long long v23 = [(_UIViewControllerTransitionContext *)v22 _transitionCoordinator];
    [(SBSystemApertureViewController *)self _updateElementOrientationTo:a3 withTransitionCoordinator:v23];

    long long v24 = [(SBSystemApertureViewController *)self view];
    long long v25 = [v24 window];
    long long v26 = [v25 windowScene];
    [v26 _synchronizeDrawing];

    [(SBSystemApertureAnimator *)v15 animateTransition:v22];
  }
}

- (void)_updateElementOrientationTo:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = NSString;
  double v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];
  id v10 = SBSAStringFromUIInterfaceOrientation(a3);
  double v11 = [v7 stringWithFormat:@"[%@] begin rotation to %@", v9, v10];
  double v12 = [(SBSystemApertureViewController *)self _layoutAssertionWithMaximumPermittedLayoutMode:1 reason:v11 creatingIfNecessary:1];

  BOOL v13 = [(SBSystemApertureViewController *)self view];
  [v13 layoutIfNeeded];

  if (self->_activeElementInterfaceOrientation != a3)
  {
    self->_int64_t activeElementInterfaceOrientation = a3;
    [(SBSystemApertureViewController *)self _invalidatePreferencesForReason:0x4000];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v14 = self->_orderedContainerViews;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) elementOrientationDidChangeWithTransitionCoordinator:v6];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __97__SBSystemApertureViewController_Private___updateElementOrientationTo_withTransitionCoordinator___block_invoke;
  v22[3] = &unk_1E6AF53F8;
  v22[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __97__SBSystemApertureViewController_Private___updateElementOrientationTo_withTransitionCoordinator___block_invoke_2;
  v19[3] = &unk_1E6B038E0;
  id v18 = v12;
  id v20 = v18;
  v21[1] = (id)a3;
  objc_copyWeak(v21, &location);
  [v6 animateAlongsideTransition:v22 completion:v19];
  objc_destroyWeak(v21);

  objc_destroyWeak(&location);
}

void __97__SBSystemApertureViewController_Private___updateElementOrientationTo_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 1064);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "layoutIfNeeded", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __97__SBSystemApertureViewController_Private___updateElementOrientationTo_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSString;
  uint64_t v4 = SBSAStringFromUIInterfaceOrientation(*(void *)(a1 + 48));
  uint64_t v5 = [v3 stringWithFormat:@"end rotation to %@", v4];
  [v2 invalidateWithReason:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v6 = [WeakRetained view];
  [v6 layoutIfNeeded];
}

- (void)animateDiscreteAnimationStyle:(int64_t)a3 toElement:(id)a4
{
}

- (id)applyPersistentAnimationStyle:(int64_t)a3 toElement:(id)a4
{
  return [(SBSystemApertureViewController *)self element:a4 requestsPersistentAnimationOfType:a3];
}

- (id)_currentFirstElement
{
  uint64_t v3 = [(NSMutableArray *)self->_orderedContainerViews firstObject];
  uint64_t v4 = [(SBSystemApertureViewController *)self _elementForContainerView:v3];

  return v4;
}

- (BOOL)systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_orderedContainerViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        uint64_t v10 = [v9 layoutMode];

        if (v10 > 0)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)systemApertureProximityBacklightPolicy:(id)a3 isSystemApertureElementVisibleAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = self->_orderedContainerViews;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v13 = -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", v12, (void)v21);
        if ([v13 layoutMode] >= 1)
        {
          long long v14 = [(SBSystemApertureViewController *)self view];
          objc_msgSend(v14, "convertPoint:toView:", v12, x, y);
          double v16 = v15;
          double v18 = v17;

          if (objc_msgSend(v12, "pointInside:withEvent:", 0, v16, v18))
          {

            BOOL v19 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 0;
LABEL_12:

  return v19;
}

- (void)systemApertureProximityBacklightPolicy:(id)a3 embedProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SBSystemApertureViewController *)self view];
  [v9 bounds];
  objc_msgSend(v8, "setFrame:");
  [v9 bounds];
  objc_msgSend(v7, "setFrame:");
  [v8 setAutoresizingMask:18];
  [v7 setAutoresizingMask:18];
  [v9 insertSubview:v7 atIndex:0];

  [v9 addSubview:v8];
  [(UILongPressGestureRecognizer *)self->_interactionLongPressGesture sb_cancel];
  [(UIPanGestureRecognizer *)self->_resizePanGesture sb_cancel];
}

- (void)systemApertureProximityBacklightPolicy:(id)a3 removeProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5
{
  id v6 = a5;
  [a4 removeFromSuperview];
  [v6 removeFromSuperview];
}

- (BOOL)systemApertureProximityBacklightPolicyShouldDisableGracePeriod:(id)a3
{
  return 0;
}

- (void)statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider:(id)a3
{
}

- (void)_updatePreferencesForReasonStackInitiated:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFFFE;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonInitOrDefaults:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFFFD;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonLumaSampling:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFFFB;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonTimerExpired:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFFDF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonMilestoneReached:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFFBF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonAccessibility:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFF7F;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonDynamicsAnimation:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFEFF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonTransitionEffectAssertion:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFDFF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonGestures:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFFBFF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonAnimatedPropertyUpdateBegin:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFF7FF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonAnimatedPropertyUpdateEnd:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFEFFF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonElementRequested:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFDFFF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonOrientation:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFFBFFF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonActiveDisplayChanged:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFF7FFF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x10000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonReachabilityChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_updatePreferencesForReasonReachabilityChanged:(unsigned int)a3 updates:(id)a4
{
  id v6 = a4;
  uint64_t v7 = a3 & 0xFFFEFFFF;
  id v8 = self;
  id v9 = v6;
  id v12 = v9;
  if (v7)
  {
    if (v7)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonStackInitiated:v7 updates:v9];
    }
    else if ((v7 & 2) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonInitOrDefaults:v7 updates:v9];
    }
    else if ((v7 & 4) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonLumaSampling:v7 updates:v9];
    }
    else if ((v7 & 8) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonSystemApertureManager:v7 updates:v9];
    }
    else if ((v7 & 0x10) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonCloningOrRenderingStyle:v7 updates:v9];
    }
    else if ((v7 & 0x20) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTimerExpired:v7 updates:v9];
    }
    else if ((v7 & 0x40) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonMilestoneReached:v7 updates:v9];
    }
    else if ((v7 & 0x80) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAccessibility:v7 updates:v9];
    }
    else if ((v7 & 0x100) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonDynamicsAnimation:v7 updates:v9];
    }
    else if ((v7 & 0x200) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonTransitionEffectAssertion:v7 updates:v9];
    }
    else if ((v7 & 0x400) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonGestures:v7 updates:v9];
    }
    else if ((v7 & 0x800) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateBegin:v7 updates:v9];
    }
    else if ((v7 & 0x1000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonAnimatedPropertyUpdateEnd:v7 updates:v9];
    }
    else if ((v7 & 0x2000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonElementRequested:v7 updates:v9];
    }
    else if ((v7 & 0x4000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonOrientation:v7 updates:v9];
    }
    else if ((v7 & 0x8000) != 0)
    {
      [(SBSystemApertureViewController *)v8 _updatePreferencesForReasonActiveDisplayChanged:v7 updates:v9];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"SBSystemApertureViewController+PreferencesValidationTracing.h" lineNumber:105 description:@"Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."];
    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_shouldPerformTransitionOfProperty:ofObject:withDescription:fromPreferences:context:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  [v0 queryIteration];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "[%{public}lu] A transition description is requesting a milestone, but this transition would otherwise not be performed: %@", v3, v4, v5, v6, v7);
}

- (void)_pushGestureDescription:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "Gesture Updated: %@", v1, 0xCu);
}

- (void)_popActiveGestureDescriptions
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "Sending Gesture Update to Stack: %@", v1, 0xCu);
}

- (void)isRequestingMenuPresentationForTargetWithOverrider:isDefaultValue:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "Overrider requesting menu presentation isn't associated with an existing container view – denying: %{public}@", v1, 0xCu);
}

- (void)isRequestingMenuPresentationForTargetWithOverrider:isDefaultValue:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "Overrider requesting menu presentation isn't in custom layout mode – denying: %{public}@", v1, 0xCu);
}

- (void)_handleResizeResult:withContainerView:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  os_log_t v0 = MEMORY[0x1D948A070]();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v1, v2, "Attempting to remove element via pan gesture, but no valid assertion was found: element: %@; assertion: %@",
    v3,
    v4,
    v5,
    v6,
    v7);
}

- (void)_activeElementInterfaceOrientation
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Use of interface orientation attempted (in layout?) before being set by traits arbiter", v1, 2u);
}

@end