@interface UIScrollView
+ (SEL)_panGestureAction;
+ (SEL)_pinchGestureAction;
+ (id)_implicitAnimationCulprits;
+ (unint64_t)_defaultEdgesScrollingContentIntoSafeArea;
- (BOOL)__canScrollWithoutBouncingYIncludingAdditionalContentInsetAmount:(double)a3;
- (BOOL)__isKindOfUIScrollView;
- (BOOL)_adjustsContentInsetWhenScrollDisabled;
- (BOOL)_adjustsTargetsOnContentOffsetChanges;
- (BOOL)_allowsAsyncScrollEvent;
- (BOOL)_allowsKeyboardEventsToScroll;
- (BOOL)_alwaysAppliesKeyboardBottomInsetAdjustment;
- (BOOL)_applicationHasExplicitlySetBounces;
- (BOOL)_applyVerticalSafeAreaInsetsToNonscrollingContent;
- (BOOL)_avoidsJumpOnInterruptedBounce;
- (BOOL)_beginTrackingWithEvent:(id)a3;
- (BOOL)_bounceForCarPlayIfNecessary;
- (BOOL)_canCancelContentTouches:(id)a3;
- (BOOL)_canHandleAsyncScrollEvent;
- (BOOL)_canPerformAsyncScrollDecelerationReturningEvent:(id *)a3;
- (BOOL)_canScrollFromEdge:(unint64_t)a3;
- (BOOL)_canScrollIgnoringAncestorPermissionX;
- (BOOL)_canScrollIgnoringAncestorPermissionY;
- (BOOL)_canScrollWithoutBouncingIncludingRevealableContentPaddingTopY;
- (BOOL)_canScrollWithoutBouncingX;
- (BOOL)_canScrollWithoutBouncingY;
- (BOOL)_canScrollX;
- (BOOL)_canScrollY;
- (BOOL)_canScrubWithTouch:(id)a3;
- (BOOL)_canSkipTraitsAndOverlayUpdatesForViewControllerToNotifyOnLayoutResetState:(BOOL)a3;
- (BOOL)_clipsGlyphPathFrame:(CGRect)a3 shouldContinueSuperviewTraversal:(BOOL *)a4;
- (BOOL)_configureForObservingByTVSearchController;
- (BOOL)_constraintAffectsContentSize:(id)a3;
- (BOOL)_contentOffsetIsAtPagingBoundary:(CGPoint)a3;
- (BOOL)_contentOffsetRoundingEnabled;
- (BOOL)_contentScrollsAlongXAxis;
- (BOOL)_contentScrollsAlongYAxis;
- (BOOL)_delegateShouldPanGestureTryToBegin;
- (BOOL)_effectiveShouldPreventFocusScrollPastContentSize;
- (BOOL)_effectiveShowsHorizontalScrollIndicator;
- (BOOL)_effectiveShowsVerticalScrollIndicator;
- (BOOL)_evaluateWantsConstrainedContentSize;
- (BOOL)_focusCanScrollX;
- (BOOL)_focusCanScrollY;
- (BOOL)_focusFastScrollingDisabled;
- (BOOL)_focusIsScrollableContainer;
- (BOOL)_forwardsToParentScroller;
- (BOOL)_forwardsTouchesUpResponderChain;
- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)_getBouncingDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 lastUpdateOffset:(double)a5 min:(double)a6 max:(double)a7 decelerationFactor:(double)a8 decelerationLnFactor:(double)a9 velocity:(double *)a10;
- (BOOL)_getPagingDecelerationOffset:(CGPoint *)a3 forTimeInterval:(double)a4;
- (BOOL)_hasContentForBarInteractions;
- (BOOL)_hasScrollViewWillEndDraggingInvocationsToPerform;
- (BOOL)_isAnimatingScrollTest;
- (BOOL)_isAutoScrollEnabled;
- (BOOL)_isAutomaticContentOffsetAdjustmentEnabled;
- (BOOL)_isAutoscrolling;
- (BOOL)_isBouncing;
- (BOOL)_isFirstResponderKeyboardAvoidanceEnabled;
- (BOOL)_isFocusFastScrolling;
- (BOOL)_isHorizontalBouncing;
- (BOOL)_isInSetContentOffset;
- (BOOL)_isInterruptingDeceleration;
- (BOOL)_isPoint:(CGPoint)a3 inExpandedIndicatorForAxis:(unint64_t)a4;
- (BOOL)_isPoint:(CGPoint)a3 inExpandedIndicatorForAxis:(unint64_t)a4 containerRect:(CGRect)a5;
- (BOOL)_isRectFullyVisible:(CGRect)a3;
- (BOOL)_isScrollViewScrollObserver:(id)a3;
- (BOOL)_isScrollingToTop;
- (BOOL)_isScrubbing;
- (BOOL)_isTransientScrollView;
- (BOOL)_isVerticalBouncing;
- (BOOL)_needsLayoutOnVisibleBoundsChange;
- (BOOL)_ownsAnimationForKey:(id)a3 ofView:(id)a4;
- (BOOL)_pagingDown;
- (BOOL)_pagingLeft;
- (BOOL)_pagingRight;
- (BOOL)_pagingUp;
- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginHorizontallyWithEvent:(id)a4;
- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginVerticallyWithEvent:(id)a4;
- (BOOL)_platformUsesGestureRecognizersForKeyboardScrolling;
- (BOOL)_prefersFocusContainment;
- (BOOL)_requiresExplicitLayoutMarginsGuideForAttribute:(int64_t)a3 getAttributeForGuide:(int *)a4;
- (BOOL)_resetsBoundingPathForSubtree;
- (BOOL)_scrollToTopIfPossible:(BOOL)a3;
- (BOOL)_scrollViewWillEndDraggingWithDeceleration:(BOOL)a3;
- (BOOL)_scrollsToMakeFirstResponderVisible;
- (BOOL)_shouldAdjustLayoutToCollapseTopSpacing;
- (BOOL)_shouldAdjustLayoutToDrawTopSeparator;
- (BOOL)_shouldAutoScroll;
- (BOOL)_shouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange;
- (BOOL)_shouldContentOffsetMaintainRelativeDistanceFromSafeArea;
- (BOOL)_shouldPreventFocusScrollPastContentSize;
- (BOOL)_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis;
- (BOOL)_shouldScrollAncestors;
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (BOOL)_shouldTrackImmediatelyWhileDecelerating;
- (BOOL)_shouldUpdateFocusInContext:(id)a3;
- (BOOL)_shouldUseStaticScrollBar;
- (BOOL)_showsBackgroundShadow;
- (BOOL)_skipsContentOffsetAdjustmentsIfScrolling;
- (BOOL)_smoothScrollApplyPendingAsyncCompletionResultWithUpdateTime:(uint64_t)a1 outFinishedDecelerating:(unsigned char *)a2;
- (BOOL)_startBeingDraggedByChild:(id)a3;
- (BOOL)_staysCenteredDuringPinch;
- (BOOL)_stopBeingDraggedByChild:(id)a3;
- (BOOL)_subclassHandlesAsyncScrollEvent;
- (BOOL)_subviewPreventsSkipLayout:(id)a3;
- (BOOL)_supportsContentDimensionVariables;
- (BOOL)_supportsPointerDragScrolling;
- (BOOL)_topScrollIndicatorFollowsContentOffset;
- (BOOL)_touchMayChangeSelection;
- (BOOL)_transfersScrollToContainer;
- (BOOL)_useContentDimensionVariablesForConstraintLowering;
- (BOOL)_usesLowFidelityPanning;
- (BOOL)_verticalScrollIndicatorUsesAlternativeTopSafeAreaInset;
- (BOOL)_viewIsInsideNavigationController;
- (BOOL)_wantsConstrainedContentSize;
- (BOOL)allowsKeyboardScrolling;
- (BOOL)allowsMultipleFingers;
- (BOOL)alwaysBounceHorizontal;
- (BOOL)alwaysBounceVertical;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)automaticallyAdjustsScrollIndicatorInsets;
- (BOOL)bounces;
- (BOOL)bouncesHorizontally;
- (BOOL)bouncesVertically;
- (BOOL)bouncesZoom;
- (BOOL)canCancelContentTouches;
- (BOOL)cancelTouchTracking;
- (BOOL)delaysContentTouches;
- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isAutomaticContentOffsetAdjustmentsAnimated;
- (BOOL)isDecelerating;
- (BOOL)isDirectionalLockEnabled;
- (BOOL)isDragging;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isPagingEnabled;
- (BOOL)isProgrammaticScrollEnabled;
- (BOOL)isScrollAnimating;
- (BOOL)isScrollEnabled;
- (BOOL)isTracking;
- (BOOL)isZoomAnimating;
- (BOOL)isZoomBouncing;
- (BOOL)isZoomEnabled;
- (BOOL)isZooming;
- (BOOL)preservesCenterDuringRotation;
- (BOOL)pressGestureRecognizer:(id)a3 shouldAllowPress:(id)a4;
- (BOOL)scrollsToTop;
- (BOOL)showsHorizontalScrollIndicator;
- (BOOL)showsVerticalScrollIndicator;
- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view;
- (BOOL)touchesShouldCancelInContentView:(UIView *)view;
- (BOOL)tracksImmediatelyWhileDecelerating;
- (BOOL)transfersHorizontalScrollingToParent;
- (BOOL)transfersVerticalScrollingToParent;
- (BOOL)updateInsetBottomDuringKeyboardDismiss;
- (CGFloat)maximumZoomScale;
- (CGFloat)minimumZoomScale;
- (CGFloat)zoomScale;
- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3;
- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3 contentSize:(CGSize)a4 skipsAdjustmentIfScrolling:(BOOL)a5;
- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3 skipsAdjustmentIfScrolling:(BOOL)a4;
- (CGPoint)_animatedOriginalOffset;
- (CGPoint)_animatedTargetOffset;
- (CGPoint)_animationTargetContentOffset;
- (CGPoint)_centeredZoomAnchorPointInScene;
- (CGPoint)_clampScrollOffsetToBounds:(CGPoint)a3;
- (CGPoint)_contentOffsetForLowFidelityScrollInDirection:(CGPoint)a3 duration:(double *)a4;
- (CGPoint)_contentOffsetForScrollingToRect:(CGRect)a3;
- (CGPoint)_contentOffsetForScrollingToTop;
- (CGPoint)_contentOffsetOrDeferredContentOffset;
- (CGPoint)_focusTargetOffset;
- (CGPoint)_maximumContentOffset;
- (CGPoint)_maximumContentOffsetForContentSize:(CGSize)a3;
- (CGPoint)_maximumContentPoint;
- (CGPoint)_minimumContentOffset;
- (CGPoint)_newScrollOffsetForScrubReturningAnimated:(BOOL *)a3;
- (CGPoint)_offsetToScrollToForArrowPressType:(int64_t)a3;
- (CGPoint)_pageDecelerationTarget;
- (CGPoint)_pagingOrigin;
- (CGPoint)_roundedProposedContentOffset:(CGPoint)result;
- (CGPoint)_rubberBandContentOffsetForOffset:(CGPoint)a3 outsideX:(BOOL *)a4 outsideY:(BOOL *)a5;
- (CGPoint)_rubberBandingReversalOffsetForOriginalOffset:(CGPoint)a3 velocity:(CGPoint)a4 currentPanTranslation:(CGPoint)a5;
- (CGPoint)_velocityForAnimatedScrollFromOffset:(CGPoint)a3 toOffset:(CGPoint)a4 duration:(double)a5;
- (CGPoint)_zoomAnchorPoint;
- (CGPoint)contentAlignmentPoint;
- (CGPoint)indexBarAccessoryView:(id)a3 contentOffsetForEntry:(id)a4 atIndex:(int64_t)a5;
- (CGRect)_focusScrollableContentBounds;
- (CGRect)_intelligenceVisibleBounds;
- (CGRect)_layoutGuide:(id)a3 adjustedLayoutFrameForFrame:(CGRect)a4;
- (CGRect)_layoutVerticalScrollIndicatorWithBounds:(CGRect)a3 effectiveInset:(UIEdgeInsets)a4 contentOffset:(CGPoint)a5 fraction:(double)a6 additionalInset:(double)a7 cornerAdjust:(double)a8 needsIndicator:(BOOL)a9 showing:(BOOL)a10 recalcSize:(BOOL)a11;
- (CGRect)_rectForPageContainingRect:(CGRect)a3;
- (CGRect)_rectForPageContainingView:(id)a3;
- (CGRect)_scrollIndicatorContainerRect;
- (CGRect)contentFrameForView:(id)a3;
- (CGRect)visibleBounds;
- (CGSize)_contentSizeOrDeferredContentSize;
- (CGSize)_interpageSpacing;
- (CGSize)_nsis_contentSize;
- (CGSize)contentSize;
- (CGSize)visibleSize;
- (NSArray)_allowedTouchTypesForScrolling;
- (NSArray)_automaticContentConstraints;
- (NSDirectionalEdgeInsets)_directionalAccessoryEdgeInsets;
- (NSISVariable)_contentHeightVariable;
- (NSISVariable)_contentWidthVariable;
- (NSISVariable)_contentXOffsetVariable;
- (NSISVariable)_contentYOffsetVariable;
- (NSMutableDictionary)accessoryViews;
- (NSString)description;
- (UIEdgeInsets)_autoScrollTouchInsets;
- (UIEdgeInsets)_baseInsetsForAccessoryOnEdge:(int64_t)a3 hasCustomClientInsets:(BOOL)a4 accessorySize:(double)a5 additionalInsetFromEdge:(double)a6;
- (UIEdgeInsets)_cachedHorizontalScrollIndicatorBaseInsets;
- (UIEdgeInsets)_cachedVerticalScrollIndicatorBaseInsets;
- (UIEdgeInsets)_collapsableContentPadding;
- (UIEdgeInsets)_computeBaseInsetsForHorizontalScrollIndicatorWithClientInsets:(UIEdgeInsets)a3;
- (UIEdgeInsets)_computeBaseInsetsForVerticalScrollIndicatorWithClientInsets:(UIEdgeInsets)a3;
- (UIEdgeInsets)_contentInsetForAccessories;
- (UIEdgeInsets)_contentInsetIncludingDecorations;
- (UIEdgeInsets)_contentScrollInset;
- (UIEdgeInsets)_effectiveGradientMaskLengths;
- (UIEdgeInsets)_effectiveHorizontalScrollIndicatorInsets;
- (UIEdgeInsets)_effectiveVerticalScrollIndicatorInsets;
- (UIEdgeInsets)_focusScrollableAreaInsets;
- (UIEdgeInsets)_gradientMaskEdgeInsets;
- (UIEdgeInsets)_gradientMaskLengths;
- (UIEdgeInsets)_revealableContentPadding;
- (UIEdgeInsets)_revealableContentPaddingIncludingContentWithCollapsedAffinity:(BOOL)a3;
- (UIEdgeInsets)_safeAreaInsetsConsultingAlternativeTopInsetIfApplicable;
- (UIEdgeInsets)_systemContentInset;
- (UIEdgeInsets)_systemContentInsetIncludingAccessories:(BOOL)a3;
- (UIEdgeInsets)accessoryInsets;
- (UIEdgeInsets)adjustedContentInset;
- (UIEdgeInsets)contentInset;
- (UIEdgeInsets)horizontalScrollIndicatorInsets;
- (UIEdgeInsets)scrollIndicatorInsets;
- (UIEdgeInsets)verticalScrollIndicatorInsets;
- (UIGestureRecognizer)directionalPressGestureRecognizer;
- (UILayoutGuide)contentLayoutGuide;
- (UILayoutGuide)frameLayoutGuide;
- (UIOffset)_firstPageOffset;
- (UIOffset)_offsetForCenterOfPossibleZoomView:(id)a3 withIncomingBoundsSize:(CGSize)a4;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UIRefreshControl)_refreshControl;
- (UIRefreshControl)refreshControl;
- (UIScrollView)_temporaryCoordinatingReplacement;
- (UIScrollView)initWithCoder:(id)a3;
- (UIScrollView)initWithFrame:(CGRect)a3;
- (UIScrollViewContentInsetAdjustmentBehavior)contentInsetAdjustmentBehavior;
- (UIScrollViewDecelerationRate)decelerationRate;
- (UIScrollViewIndexDisplayMode)indexDisplayMode;
- (UIScrollViewIndicatorStyle)indicatorStyle;
- (UIScrollViewKeyboardDismissMode)keyboardDismissMode;
- (UIScrollViewMonitor)_scrollViewMonitor;
- (UIView)_horizontalScrollIndicator;
- (UIView)_verticalScrollIndicator;
- (_UIAutoScrollAssistant)_autoScrollAssistant;
- (_UIScrollViewScrollingAnimator)_scrollingAnimator;
- (_UIStaticScrollBar)_staticScrollBar;
- (double)_adjustedHorizontalOffsetPinnedToScrollableBounds:(double)a3;
- (double)_adjustedVerticalOffsetPinnedToScrollableBounds:(double)a3;
- (double)_allowedNavigationOverlapAmount;
- (double)_alternativeVerticalScrollIndicatorTopSafeAreaInset;
- (double)_clampedZoomScale:(double)a3 allowRubberbanding:(BOOL)a4;
- (double)_contentBottomForScrollObservation;
- (double)_contentFitCanScrollThreshold;
- (double)_contentOffsetAnimationDuration;
- (double)_currentRubberBandCoefficient;
- (double)_defaultPagingFriction;
- (double)_horizontalScrollIndicatorHeight;
- (double)_horizontalVelocity;
- (double)_iOS_frameForLayoutHorizontalScrollIndicatorWithBounds:(CGFloat)a3 effectiveInset:(CGFloat)a4 indicatorInsets:(CGFloat)a5 contentOffset:(double)a6 fraction:(double)a7 additionalInset:(double)a8 cornerAdjust:(double)a9 needsIndicator:(uint64_t)a10 showing:(uint64_t)a11 recalcSize:(uint64_t)a12 verticalIndicatorFrame:(char)a13;
- (double)_iOS_frameForLayoutVerticalScrollIndicatorWithBounds:(double)a3 effectiveInset:(double)a4 indicatorInsets:(double)a5 contentOffset:(double)a6 fraction:(double)a7 additionalInset:(double)a8 cornerAdjust:(uint64_t)a9 needsIndicator:(uint64_t)a10 showing:(uint64_t)a11 recalcSize:(char)a12;
- (double)_intervalBetweenPanGestures;
- (double)_maxTopOffset;
- (double)_maxTopOffsetAdjustedForRevealableContentPadding:(double)a3;
- (double)_offsetForRubberBandOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6;
- (double)_offsetWithoutDecorationForRubberBandOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6;
- (double)_pagingFriction;
- (double)_rubberBandOffsetForOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6 outside:(BOOL *)a7;
- (double)_rubberBandOffsetWithoutDecorationForOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6 outside:(BOOL *)a7;
- (double)_rubberBandingReversalOffsetForOriginalOffset:(double)a3 contentMin:(double)a4 contentMax:(double)a5 contentOffset:(double)a6 velocity:(double)a7 currentDelta:(double)a8 rubberBandingCoefficient:(double)a9;
- (double)_scrollHysteresis;
- (double)_scrollIndicatorAdditionalInset;
- (double)_shadowHeightOffset;
- (double)_systemInsetAdjustmentForAdjustmentTypeIdentifier:(id)a3;
- (double)_systemInsetAdjustmentSum;
- (double)_topLayoutInsetForSidebar;
- (double)_touchDelayForScrollDetection;
- (double)_velocityScaleFactor;
- (double)_verticalScrollIndicatorWidth;
- (double)_verticalVelocity;
- (double)_zoomRubberBandScaleForScale:(double)result;
- (double)_zoomScaleForRubberBandScale:(double)result;
- (double)_zoomScaleFromPresentationLayer:(BOOL)a3;
- (double)horizontalScrollDecelerationFactor;
- (double)keyboardBottomInsetAdjustmentDelta;
- (double)verticalScrollDecelerationFactor;
- (float)_zoomAnimationDurationForScale:(double)a3;
- (id)_actingParentScrollView;
- (id)_assertionController;
- (id)_asyncDeliveryTargetForScrollEvent:(id)a3;
- (id)_backgroundShadowForSlideAnimation;
- (id)_boundingPathForSubtree;
- (id)_constraintsFromContentSize;
- (id)_contentLayoutGuideIfExists;
- (id)_contentMarginsGuideIfExists;
- (id)_createStaticScrollBar;
- (id)_effectiveInteractionActivityTrackingBaseName;
- (id)_enclosingViewController;
- (id)_focusFastScrollingIndexBarEntries;
- (id)_focusScrollBoundaryMetricsForItem:(id)a3;
- (id)_focusTuple;
- (id)_frameLayoutGuideIfExists;
- (id)_getDelegateZoomView;
- (id)_indexBarEntries;
- (id)_layoutGuideOfType:(int64_t)a3 createIfNecessary:(BOOL)a4;
- (id)_layoutObserver;
- (id)_layoutVariablesWithAmbiguousValue;
- (id)_observerImplementingWillEndDraggingMethod;
- (id)_panGestureRecognizer;
- (id)_parentScrollView;
- (id)_relativePanView;
- (id)_scrollDetentOffsets;
- (id)_scrollTestExtraResults;
- (id)_scrollViewTouchDelayGesture;
- (id)_swipeGestureRecognizer;
- (id)_takeScrollAnimatingAssertionWithReason:(id)a3;
- (id)_touchesDelayedGestureRecognizer;
- (id)_uili_existingObservationEligibleLayoutVariables;
- (id)_zoomFeedbackGenerator;
- (id)accessoryViewAtEdge:(int64_t)a3;
- (id)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)interactionActivityTrackingBaseName;
- (id)nsli_contentHeightVariable;
- (id)nsli_contentWidthVariable;
- (id)nsli_contentXOffsetVariable;
- (id)nsli_contentYOffsetVariable;
- (id)nsli_layoutMarginsItem;
- (id)scrollTestParameters;
- (int64_t)_compatibleContentInsetAdjustmentBehavior;
- (int64_t)_effectiveIndicatorStyle;
- (int64_t)_indicatorInsetAdjustmentBehavior;
- (int64_t)_scrubbingForPoint:(CGPoint)a3 touch:(id)a4;
- (int64_t)_scrubbingForPoint:(CGPoint)a3 touchType:(int64_t)a4;
- (uint64_t)_layoutHorizontalScrollIndicatorWithBounds:(double)a3 effectiveInset:(double)a4 contentOffset:(double)a5 fraction:(double)a6 additionalInset:(double)a7 cornerAdjust:(double)a8 needsIndicator:(double)a9 showing:(uint64_t)a10 recalcSize:(uint64_t)a11 verticalIndicatorFrame:(uint64_t)a12;
- (unint64_t)_abuttedEdgesForContentOffset:(CGPoint)a3;
- (unint64_t)_abuttedPagingEdges;
- (unint64_t)_allowedFocusBounceEdges;
- (unint64_t)_contentScrollableAxes;
- (unint64_t)_currentlyAbuttedContentEdges;
- (unint64_t)_edgesAllowingScrollAccessoriesExtendedToBoundingPath;
- (unint64_t)_edgesApplyingBaseInsetsToScrollIndicatorInsets;
- (unint64_t)_edgesApplyingSafeAreaInsetsToContentInset;
- (unint64_t)_edgesApplyingSafeAreaInsetsToContentInsetForContentSize:(CGSize)a3;
- (unint64_t)_edgesApplyingSafeAreaInsetsToScrollAccessoryInsets;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (unint64_t)_edgesScrollingContentIntoSafeArea;
- (unint64_t)_focusScrollOffsetResolverForFocusMovement:(id)a3;
- (void)_accumulateViewConstraintsIntoArray:(id)a3;
- (void)_activateZoomFeedback;
- (void)_addContentSubview:(id)a3 atBack:(BOOL)a4;
- (void)_addRefreshInset:(double)a3;
- (void)_addScrollViewScrollObserver:(id)a3;
- (void)_adjustBackgroundShadowsForContentSizeForcedVisible:(BOOL)a3;
- (void)_adjustBackgroundShadowsForContentSizeForcedVisible:(BOOL)a3 withOffset:(double)a4;
- (void)_adjustContentOffsetIfNecessary;
- (void)_adjustContentSizeForView:(id)a3 atScale:(double)a4;
- (void)_adjustCrossingConstraintsIfNecessaryForOldContentInset:(UIEdgeInsets)a3;
- (void)_adjustForAutomaticKeyboardInfo:(id)a3 animated:(BOOL)a4 lastAdjustment:(double *)a5;
- (void)_adjustScrollIndicatorsIfNeeded:(int)a3 forceRebuild:;
- (void)_adjustScrollerIndicators:(BOOL)a3 alwaysShowingThem:(BOOL)a4;
- (void)_adjustShadowsIfNecessary;
- (void)_adjustShadowsIfNecessaryForOffset:(double)a3;
- (void)_adjustStartOffsetForGrabbedBouncingScrollView;
- (void)_allowsKeyboardScrollingDidUpdate;
- (void)_animateScrollToContentOffset:(CGPoint)a3 animationCurve:(int)a4 animationAdjustsForContentOffsetDelta:(BOOL)a5 animation:(id)a6;
- (void)_animateScrollToContentOffset:(CGPoint)a3 animationCurve:(int)a4 animationAdjustsForContentOffsetDelta:(BOOL)a5 animation:(id)a6 animationConfigurator:(id)a7;
- (void)_applyAutomaticAdjustedContentOffset:(CGPoint)a3;
- (void)_applyConstrainedContentSizeIfNecessary;
- (void)_asynchronouslyDeliverScrollEvent:(id)a3 completion:(id)a4;
- (void)_attemptToDragParent:(id)a3 forNewBounds:(CGRect)a4 oldBounds:(CGRect)a5;
- (void)_autoScrollAssistantUpdateContentOffset:(CGPoint)a3;
- (void)_beginActivityTrackingIfNeededForReason:(int64_t)a3;
- (void)_beginDeferredContentOffsetTransitionToOffset:(CGPoint)a3 contentSize:(CGSize)a4;
- (void)_beginDirectManipulationIfNecessaryWithGestureRecognizer:(id)a3;
- (void)_beginRefreshing;
- (void)_beginScrollingCursorOverrideIfNecessary;
- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4;
- (void)_bumpTrackingWatchdogTimer;
- (void)_cancelDeferredContentOffsetTransition;
- (void)_centerContentIfNecessary;
- (void)_centerContentIfNecessaryAdjustingContentOffset:(BOOL)a3;
- (void)_clearContentOffsetAnimation;
- (void)_clearContentOffsetAnimation:(id)a3;
- (void)_clearParentAdjustment;
- (void)_clearScrollBounceStatisticsTrackingState;
- (void)_commitDeferredContentOffsetTransition;
- (void)_commitScrollBounceStatisticsTrackingState;
- (void)_createGestureRecognizersForCurrentTouchLevel;
- (void)_delegateScrollViewAnimationEnded;
- (void)_didAddDependentConstraint:(id)a3;
- (void)_didBeginDirectManipulationWithScrubbingDirection:(int64_t)a3;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_didEndDirectManipulationWithScrubbingDirection:(int64_t)a3;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_didRemoveDependentConstraint:(id)a3;
- (void)_didSetBounces;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_enableOnlyGestureRecognizersForCurrentTouchLevel;
- (void)_endActivityTrackingIfNeededForReason:(int64_t)a3;
- (void)_endPanNormal:(BOOL)a3;
- (void)_endRefreshingAnimated:(BOOL)a3;
- (void)_endScrollingCursorOverrideIfNecessary;
- (void)_enumerateAllScrollObserversWithBlock:(uint64_t)a1;
- (void)_faultInContentOffsetGuide;
- (void)_findScrollableAncestorIfNeededWithEvent:(id)a3;
- (void)_flashScrollIndicatorsForAxes:(unint64_t)a3 persistingPreviousFlashes:(BOOL)a4;
- (void)_flashScrollIndicatorsPersistingPreviousFlashes;
- (void)_forceDelegateScrollViewDidZoom:(BOOL)a3;
- (void)_forcePanGestureToEndImmediately;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_getGradientMaskBounds:(CGRect *)a3 startInsets:(UIEdgeInsets *)a4 endInsets:(UIEdgeInsets *)a5 intensities:(UIEdgeInsets *)a6;
- (void)_getStandardDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 min:(double)a5 max:(double)a6 decelerationFactor:(double)a7 decelerationLnFactor:(double)a8 velocity:(double *)a9;
- (void)_handleAutoScroll:(id)a3;
- (void)_handleDirectionalPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4;
- (void)_handleDirectionalPress:(id)a3;
- (void)_handleDirectionalScrollToOffset:(CGPoint)a3 clampingToBounds:(BOOL)a4;
- (void)_handleDirectionalScrollToOffset:(CGPoint)a3 clampingToBounds:(BOOL)a4 duration:(double)a5;
- (void)_handleKeyboardScrollingPressGesture:(id)a3;
- (void)_handleKnobHoverGesture:(id)a3;
- (void)_handleKnobLongPressGesture:(id)a3;
- (void)_handleLowFidelitySwipe:(id)a3;
- (void)_handlePanFailure;
- (void)_handleSwipe:(id)a3;
- (void)_hideScrollIndicator:(id)a3 afterDelay:(double)a4 animated:(BOOL)a5;
- (void)_hideScrollIndicators;
- (void)_hideScrollIndicatorsIfNeededForNewContentSize:(CGSize)a3 animated:(BOOL)a4;
- (void)_incrementForScrollTest:(id)a3;
- (void)_lowFidelityScrollInDirection:(CGPoint)a3;
- (void)_markScrollViewAnimationForKey:(id)a3 ofView:(id)a4;
- (void)_notifyAdjustedContentInsetDidChange;
- (void)_notifyAlignedContentMarginChanged;
- (void)_notifyDidScroll;
- (void)_old_updateAutomaticContentSizeConstraintsIfNecessaryWithContentSize:(CGSize)a3;
- (void)_performDirectionalBounceFromOffset:(CGPoint)a3 toTargetOffset:(CGPoint)a4;
- (void)_performDirectionalScrollAnimationToTargetOffset:(CGPoint)a3;
- (void)_performDirectionalScrollAnimationToTargetOffset:(CGPoint)a3 duration:(double)contentOffsetAnimationDuration;
- (void)_performFullScreenScrollTest:(id)a3 iterations:(int)a4 scrollAxis:(unint64_t)a5;
- (void)_performNaturalScrollTest:(id)a3 completionHandler:(id)a4;
- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5;
- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6;
- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6 scrollAxis:(unint64_t)a7;
- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6 scrollAxis:(unint64_t)a7 extraResultsBlock:(id)a8;
- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6 scrollAxis:(unint64_t)a7 extraResultsBlock:(id)a8 completionBlock:(id)a9;
- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 scrollAxis:(unint64_t)a6;
- (void)_performScrollTestWithParameters:(id)a3 completionBlock:(id)a4;
- (void)_performScrollViewWillEndDraggingInvocationsWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4 unclampedOriginalTarget:(CGPoint)a5;
- (void)_pinContentOffsetToClosestPageBoundary;
- (void)_popTrackingRunLoopModeIfNecessaryForReason:(id)a3;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4;
- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4 nudgingBoundsWithVelocity:(BOOL)a5;
- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4 nudgingBoundsWithVelocity:(BOOL)a5 performExtraPageIfPastPagingBoundary:(BOOL)a6;
- (void)_pushTrackingRunLoopModeIfNecessaryForReason:(id)a3;
- (void)_reenableImplicitAnimationsAfterScrollTest;
- (void)_registerAsScrollToTopViewIfPossible;
- (void)_registerForRotation:(BOOL)a3 ofWindow:(id)a4;
- (void)_registerForSpringBoardBlankedScreenNotification;
- (void)_removeRefreshInset:(double)a3;
- (void)_removeScrollViewScrollObserver:(id)a3;
- (void)_resetContentScrollableAxes;
- (void)_resetDiscreteFastScroll;
- (void)_resetScrollableAncestor;
- (void)_resetScrollingWithUIEvent:(id)a3;
- (void)_resizeWithOldSuperviewSize:(CGSize)a3;
- (void)_runLoopModePopped:(id)a3;
- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4;
- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4;
- (void)_scrollViewDidEndDecelerating;
- (void)_scrollViewDidEndDeceleratingForDelegate;
- (void)_scrollViewDidEndDraggingForDelegateWithDeceleration:(BOOL)a3;
- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3;
- (void)_scrollViewDidEndZooming;
- (void)_scrollViewDidLayoutSubviews;
- (void)_scrollViewWillBeginDragging;
- (void)_scrollViewWillBeginZooming;
- (void)_sendAsynchronouslyHandleScrollEvent:(id)a3 completion:(id)a4;
- (void)_sendDelayedTouchesIfNecessary;
- (void)_sendGeometryAffectingContentBottomChangedToScrollObservers;
- (void)_setAbsoluteContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)_setAdjustsContentInsetWhenScrollDisabled:(BOOL)a3;
- (void)_setAdjustsTargetsOnContentOffsetChanges:(BOOL)a3;
- (void)_setAllowedFocusBounceEdges:(unint64_t)a3;
- (void)_setAllowedNavigationOverlapAmount:(double)a3;
- (void)_setAllowedTouchTypesForScrolling:(id)a3;
- (void)_setAllowsAsyncScrollEvent:(BOOL)a3;
- (void)_setAlternativeVerticalScrollIndicatorTopSafeAreaInset:(double)a3;
- (void)_setAlwaysAppliesKeyboardBottomInsetAdjustment:(BOOL)a3;
- (void)_setAlwaysBounceVertical:(BOOL)a3;
- (void)_setApplyVerticalSafeAreaInsetsToNonscrollingContent:(BOOL)a3;
- (void)_setAutoScrollEnabled:(BOOL)a3;
- (void)_setAutoScrollTouchInsets:(UIEdgeInsets)a3;
- (void)_setAutomaticContentConstraints:(id)a3;
- (void)_setAutomaticContentOffsetAdjustmentEnabled:(BOOL)a3;
- (void)_setAutoscrolling:(BOOL)a3;
- (void)_setAvoidsJumpOnInterruptedBounce:(BOOL)a3;
- (void)_setCachedHorizontalScrollIndicatorBaseInsets:(UIEdgeInsets)a3;
- (void)_setCachedVerticalScrollIndicatorBaseInsets:(UIEdgeInsets)a3;
- (void)_setConfigureForObservingByTVSearchController:(BOOL)a3;
- (void)_setContentMarginsGuide:(id)a3;
- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5;
- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5 animationAdjustsForContentOffsetDelta:(BOOL)a6;
- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5 animationAdjustsForContentOffsetDelta:(BOOL)a6 animation:(id)a7;
- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5 animationAdjustsForContentOffsetDelta:(BOOL)a6 animation:(id)a7 animationConfigurator:(id)a8;
- (void)_setContentOffset:(CGPoint)a3 animation:(id)a4;
- (void)_setContentOffset:(CGPoint)a3 duration:(double)a4 animationCurve:(int)a5;
- (void)_setContentOffset:(CGPoint)a3 duration:(double)a4 animationCurve:(int)a5 animationConfigurator:(id)a6;
- (void)_setContentOffsetAnimationDuration:(double)a3;
- (void)_setContentOffsetPinned:(CGPoint)a3;
- (void)_setContentOffsetPinned:(CGPoint)a3 animated:(BOOL)a4;
- (void)_setContentOffsetRoundingEnabled:(BOOL)a3;
- (void)_setContentOffsetWithDecelerationAnimation:(CGPoint)a3;
- (void)_setContentScrollInset:(UIEdgeInsets)a3;
- (void)_setContentScrollsAlongXAxis:(BOOL)a3;
- (void)_setContentScrollsAlongYAxis:(BOOL)a3;
- (void)_setDefaultShowsHorizontalScrollIndicator:(BOOL)a3;
- (void)_setDefaultShowsVerticalScrollIndicator:(BOOL)a3;
- (void)_setEdgesAllowingScrollAccessoriesExtendedToBoundingPath:(unint64_t)a3;
- (void)_setEdgesScrollingContentIntoSafeArea:(unint64_t)a3;
- (void)_setFirstPageOffset:(UIOffset)a3;
- (void)_setFirstResponderKeyboardAvoidanceEnabled:(BOOL)a3;
- (void)_setFlipsHorizontalAxis:(BOOL)a3;
- (void)_setFocusFastScrollingDisabled:(BOOL)a3;
- (void)_setForwardsTouchesUpResponderChain:(BOOL)a3;
- (void)_setGradientMaskEdgeInsets:(UIEdgeInsets)a3;
- (void)_setGradientMaskLengths:(UIEdgeInsets)a3;
- (void)_setIndicatorInsetAdjustmentBehavior:(int64_t)a3;
- (void)_setInterpageSpacing:(CGSize)a3;
- (void)_setIsTransientScrollView:(BOOL)a3;
- (void)_setKnobInteractionGestureDelayed:(BOOL)a3;
- (void)_setLayoutObserver:(id)a3;
- (void)_setMaskView:(id)a3;
- (void)_setNeedsLayoutOnVisibleBoundsChange:(BOOL)a3;
- (void)_setNeedsUsesStaticScrollBarUpdate;
- (void)_setPageDecelerationTarget:(CGPoint)a3;
- (void)_setPagingFriction:(double)a3;
- (void)_setPagingOrigin:(CGPoint)a3;
- (void)_setPanGestureRecognizer:(id)a3;
- (void)_setPinchGestureRecognizer:(id)a3;
- (void)_setRefreshControl:(id)a3;
- (void)_setRelativePanView:(id)a3;
- (void)_setResetsBoundingPathForSubtree:(BOOL)a3;
- (void)_setShouldAdjustLayoutToCollapseTopSpacing:(BOOL)a3;
- (void)_setShouldAdjustLayoutToDrawTopSeparator:(BOOL)a3;
- (void)_setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:(BOOL)a3;
- (void)_setShouldPreventFocusScrollPastContentSize:(BOOL)a3;
- (void)_setShouldScrollAncestors:(BOOL)a3;
- (void)_setShowsBackgroundShadow:(BOOL)a3;
- (void)_setShowsHorizontalScrollIndicator:(void *)a1;
- (void)_setShowsHorizontalScrollIndicatorFlag:(BOOL)a3;
- (void)_setShowsVerticalScrollIndicator:(void *)a1;
- (void)_setShowsVerticalScrollIndicatorFlag:(BOOL)a3;
- (void)_setSkipsContentOffsetAdjustmentsIfScrolling:(BOOL)a3;
- (void)_setStaysCenteredDuringPinch:(BOOL)a3;
- (void)_setSubviewWantsAutolayoutTripWantsAutolayout:(BOOL)a3;
- (void)_setSupportsPointerDragScrolling:(BOOL)a3;
- (void)_setSystemInsetAdjustment:(double)a3 forAdjustmentTypeIdentifier:(id)a4;
- (void)_setTemporaryCoordinatingReplacement:(id)a3;
- (void)_setTopLayoutInsetForSidebar:(double)a3;
- (void)_setTopScrollIndicatorFollowsContentOffset:(BOOL)a3;
- (void)_setTransfersScrollToContainer:(BOOL)a3;
- (void)_setUpGradientMaskViewIfNecessary;
- (void)_setUpdateRequestRecord:(const _UIUpdateRequestRecord *)a3;
- (void)_setUseContentDimensionVariablesForConstraintLowering:(BOOL)a3;
- (void)_setUsesStaticScrollBar:(BOOL)a3;
- (void)_setVelocityScaleFactor:(double)a3;
- (void)_setVerticalScrollIndicatorUsesAlternativeTopSafeAreaInset:(BOOL)a3;
- (void)_setWantsConstrainedContentSize:(BOOL)a3;
- (void)_setZoomAnchorPoint:(CGPoint)a3;
- (void)_setZoomFeedbackGenerator:(id)a3;
- (void)_simulateGestureWithDuration:(double)a3 begin:(id)a4 update:(id)a5 end:(id)a6;
- (void)_simulateScrollWithTranslation:(CGPoint)a3 duration:(double)a4 willBeginDragging:(id)a5 didEndDragging:(id)a6 willBeginDecelerating:(id)a7 didEndDecelerating:(id)a8;
- (void)_simulateZoomByScaleFactor:(double)a3 duration:(double)a4 willBeginZooming:(id)a5 didEndZooming:(id)a6;
- (void)_skipNextStartOffsetAdjustment;
- (void)_smoothScrollAsyncWithUpdateTime:(double)a3 state:(id)a4;
- (void)_smoothScrollDisplayLink:(id)a3;
- (void)_smoothScrollSyncWithUpdateTime:(double)a3;
- (void)_smoothScrollWithUpdateTime:(double)a3;
- (void)_springBoardBlankedScreenNotification:(id)a3;
- (void)_startDraggingParent:(id)a3;
- (void)_startTimer:(BOOL)a3;
- (void)_stopAutoScrollAssistant;
- (void)_stopDraggingParent:(id)a3;
- (void)_stopScrollDecelerationNotify:(BOOL)a3;
- (void)_stopScrollingAndZoomingAnimationsPinningToContentViewport:(BOOL)a3;
- (void)_stopScrollingAndZoomingAnimationsPinningToContentViewport:(BOOL)a3 tramplingAnimationDependentFlags:(BOOL)a4;
- (void)_stopScrollingNotify:(BOOL)a3 pin:(BOOL)a4;
- (void)_stopScrollingNotify:(BOOL)a3 pin:(BOOL)a4 tramplingAnimationDependentFlags:(BOOL)a5;
- (void)_suppressImplicitAnimationsForScrollTest;
- (void)_switchToLayoutEngine:(id)a3;
- (void)_trackingDidBegin;
- (void)_trackingDidEnd;
- (void)_trackpadInterruptScroll:(id)a3;
- (void)_traitCollectionDidChangeInternal:(const _UITraitCollectionChangeDescription *)a3;
- (void)_unregisterForSpringBoardBlankedScreenNotification;
- (void)_updateAccessories;
- (void)_updateAccessoriesInset;
- (void)_updateContentFitDisableScrolling;
- (void)_updateDecelerationLastOffsetScrollViewPoint:(CGPoint)a3;
- (void)_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:(UIEdgeInsets)a3 oldEdgesPropagatingSafeAreaInsets:(unint64_t)a4 adjustContentOffsetIfNecessary:(BOOL)a5;
- (void)_updateForChangedScrollIndicatorRelatedInsets;
- (void)_updateForChangedScrollRelatedInsets;
- (void)_updateGradientMaskView;
- (void)_updateLayoutMarginsGuideConstraintsIfNecessary;
- (void)_updatePagingGestures;
- (void)_updatePagingSwipeGesture;
- (void)_updatePanGesture;
- (void)_updatePanGestureConfiguration;
- (void)_updatePinchGesture;
- (void)_updatePinchGestureForState:(int64_t)a3;
- (void)_updateRubberbandingStatisticTrackingState;
- (void)_updateScrollAnimationForChangedTargetOffset:(CGPoint)a3;
- (void)_updateScrollGestureRecognizersEnabled;
- (void)_updateUsesStaticScrollBar;
- (void)_updateZoomGestureRecognizersEnabled;
- (void)_viewDidMoveFromScreen:(id)a3 toScreen:(id)a4;
- (void)_webCustomViewWillBeRemovedFromSuperview;
- (void)_willMoveToWindow:(id)a3;
- (void)_zoomAnimationDidStop;
- (void)_zoomToCenter:(CGPoint)a3 scale:(double)a4 duration:(double)a5;
- (void)_zoomToCenter:(CGPoint)a3 scale:(double)a4 duration:(double)a5 force:(BOOL)a6;
- (void)_zoomToCenterInternal:(CGPoint)a3 scale:(double)a4 duration:(double)a5 allowRubberbanding:(BOOL)a6 force:(BOOL)a7;
- (void)accessoryInsetsDidChange:(UIEdgeInsets)a3;
- (void)animator:(id)a3 startAnimation:(id)a4;
- (void)animator:(id)a3 stopAnimation:(id)a4 fraction:(float)a5;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)flashScrollIndicators;
- (void)handlePan:(id)a3;
- (void)handlePinch:(id)a3;
- (void)layoutSubviews;
- (void)nsis_valueOfVariable:(id)a3 didChangeInEngine:(id)a4;
- (void)performWhileAnimatingAutomaticContentOffsetAdjustments:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)removeFromSuperview;
- (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;
- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4;
- (void)setAccessoryViews:(id)a3;
- (void)setAllowsKeyboardScrolling:(BOOL)allowsKeyboardScrolling;
- (void)setAllowsMultipleFingers:(BOOL)a3;
- (void)setAlwaysBounceHorizontal:(BOOL)alwaysBounceHorizontal;
- (void)setAlwaysBounceVertical:(BOOL)alwaysBounceVertical;
- (void)setAutomaticallyAdjustsScrollIndicatorInsets:(BOOL)automaticallyAdjustsScrollIndicatorInsets;
- (void)setBounces:(BOOL)bounces;
- (void)setBouncesHorizontally:(BOOL)a3;
- (void)setBouncesVertically:(BOOL)a3;
- (void)setBouncesZoom:(BOOL)bouncesZoom;
- (void)setBounds:(CGRect)a3;
- (void)setCanCancelContentTouches:(BOOL)canCancelContentTouches;
- (void)setCenter:(CGPoint)a3;
- (void)setContentAlignmentPoint:(CGPoint)a3;
- (void)setContentInset:(UIEdgeInsets)contentInset;
- (void)setContentInsetAdjustmentBehavior:(UIScrollViewContentInsetAdjustmentBehavior)contentInsetAdjustmentBehavior;
- (void)setContentOffset:(CGPoint)contentOffset;
- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;
- (void)setContentSize:(CGSize)contentSize;
- (void)setDecelerationRate:(UIScrollViewDecelerationRate)decelerationRate;
- (void)setDelaysContentTouches:(BOOL)delaysContentTouches;
- (void)setDelegate:(id)delegate;
- (void)setDirectionalLockEnabled:(BOOL)directionalLockEnabled;
- (void)setFrame:(CGRect)a3;
- (void)setHorizontalScrollDecelerationFactor:(double)a3;
- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)horizontalScrollIndicatorInsets;
- (void)setIndexDisplayMode:(UIScrollViewIndexDisplayMode)indexDisplayMode;
- (void)setIndicatorStyle:(UIScrollViewIndicatorStyle)indicatorStyle;
- (void)setInteractionActivityTrackingBaseName:(id)a3;
- (void)setKeyboardDismissMode:(UIScrollViewKeyboardDismissMode)keyboardDismissMode;
- (void)setMaximumZoomScale:(CGFloat)maximumZoomScale;
- (void)setMinimumZoomScale:(CGFloat)minimumZoomScale;
- (void)setNeedsLayout;
- (void)setPagingEnabled:(BOOL)pagingEnabled;
- (void)setPreservesCenterDuringRotation:(BOOL)a3;
- (void)setProgrammaticScrollEnabled:(BOOL)a3;
- (void)setRefreshControl:(UIRefreshControl *)refreshControl;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setScrollEnabled:(BOOL)scrollEnabled;
- (void)setScrollIndicatorInsets:(UIEdgeInsets)scrollIndicatorInsets;
- (void)setScrollTestParameters:(id)a3;
- (void)setScrollsToTop:(BOOL)scrollsToTop;
- (void)setShowsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator;
- (void)setShowsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator;
- (void)setTracksImmediatelyWhileDecelerating:(BOOL)a3;
- (void)setTransfersHorizontalScrollingToParent:(BOOL)a3;
- (void)setTransfersVerticalScrollingToParent:(BOOL)a3;
- (void)setUpdateInsetBottomDuringKeyboardDismiss:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setVerticalScrollDecelerationFactor:(double)a3;
- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)verticalScrollIndicatorInsets;
- (void)setZoomEnabled:(BOOL)a3;
- (void)setZoomScale:(CGFloat)scale animated:(BOOL)animated;
- (void)setZoomScale:(CGFloat)zoomScale;
- (void)setZoomScale:(double)a3 withAnchorPoint:(CGPoint)a4 allowRubberbanding:(BOOL)a5 animated:(BOOL)a6 duration:(double)a7 notifyDelegate:(BOOL)a8;
- (void)setZoomScale:(double)a3 withAnchorPoint:(CGPoint)a4 allowRubberbanding:(BOOL)a5 animated:(BOOL)a6 duration:(double)a7 notifyDelegate:(BOOL)a8 force:(BOOL)a9;
- (void)set_scrollViewMonitor:(id)a3;
- (void)startScrollViewMonitoring;
- (void)stopScrollViewMonitoring;
- (void)stopScrollingAndZooming;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)willAnimateRotationToInterfaceOrientation:(id)a3;
- (void)willRotateToInterfaceOrientation:(id)a3;
- (void)withScrollIndicatorsShownForContentOffsetChanges:(id)a3;
- (void)zoomToRect:(CGRect)rect animated:(BOOL)animated;
@end

@implementation UIScrollView

uint64_t __72__UIScrollView__flashScrollIndicatorsForAxes_persistingPreviousFlashes___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 56)) {
    result = [*(id *)(*(void *)(result + 32) + 1528) setAlpha:*(double *)(result + 40)];
  }
  if (*(unsigned char *)(v1 + 57))
  {
    double v2 = *(double *)(v1 + 48);
    v3 = *(void **)(*(void *)(v1 + 32) + 1520);
    return [v3 setAlpha:v2];
  }
  return result;
}

- (id)nsli_contentWidthVariable
{
  contentWidthVariable = self->_contentWidthVariable;
  if (!contentWidthVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, 1, 0);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentWidthVariable;
    self->_contentWidthVariable = v4;

    contentWidthVariable = self->_contentWidthVariable;
  }
  return contentWidthVariable;
}

- (id)nsli_contentHeightVariable
{
  contentHeightVariable = self->_contentHeightVariable;
  if (!contentHeightVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, 1, 0);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentHeightVariable;
    self->_contentHeightVariable = v4;

    contentHeightVariable = self->_contentHeightVariable;
  }
  return contentHeightVariable;
}

- (void)_traitCollectionDidChangeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  if (a3->var4.var0)
  {
    [a3->var1 displayScale];
    if (v5 != 0.0) {
      self->_accuracy = v5;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  [(UIView *)&v6 _traitCollectionDidChangeInternal:a3];
}

- (void)_viewDidMoveFromScreen:(id)a3 toScreen:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)UIScrollView;
  [(UIView *)&v4 _viewDidMoveFromScreen:a3 toScreen:a4];
}

- (void)_switchToLayoutEngine:(id)a3
{
  id v4 = a3;
  double v5 = [(UIView *)self _layoutEngine];

  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  [(UIView *)&v6 _switchToLayoutEngine:v4];

  if (v4
    && !v5
    && (*(void *)&self->super._viewFlags & 0x800000000000000) != 0
    && (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20000000000) == 0)
  {
    if (dyld_program_sdk_at_least()) {
      [(UIView *)self _setNeedsUpdateConstraints];
    }
  }
}

- (void)_accumulateViewConstraintsIntoArray:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIScrollView;
  -[UIView _accumulateViewConstraintsIntoArray:](&v7, sel__accumulateViewConstraintsIntoArray_);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    double v5 = [(UIScrollView *)self _automaticContentConstraints];

    if (v5)
    {
      objc_super v6 = [(UIScrollView *)self _automaticContentConstraints];
      [a3 addObjectsFromArray:v6];
    }
  }
}

- (UIScrollView)_temporaryCoordinatingReplacement
{
  return self->_temporaryCoordinatingReplacement;
}

- (BOOL)_canSkipTraitsAndOverlayUpdatesForViewControllerToNotifyOnLayoutResetState:(BOOL)a3
{
  unint64_t v3 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if (a3)
  {
    int v4 = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(void *)((char *)&self->_scrollViewFlags + 12) = v3 | 0x80000000000000;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v4;
  }
  return (v3 >> 55) & 1;
}

- (void)_resizeWithOldSuperviewSize:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  -[UIView _resizeWithOldSuperviewSize:](&v6, sel__resizeWithOldSuperviewSize_, a3.width, a3.height);
  if ((dyld_program_sdk_at_least() & 1) == 0
    && (*(void *)&self->super._viewFlags & 0x800000000000000) != 0
    && [(UIScrollView *)self _wantsConstrainedContentSize])
  {
    uint64_t v4 = [(UIView *)self superview];
    double v5 = (void *)v4;
    if (!v4 || (*(void *)(v4 + 96) & 0x1000000000000000) != 0)
    {
      [(UIScrollView *)self _nsis_contentSize];
      -[UIScrollView setContentSize:](self, "setContentSize:");
    }
  }
}

- (void)_setSubviewWantsAutolayoutTripWantsAutolayout:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIScrollView;
  [(UIView *)&v5 _setSubviewWantsAutolayoutTripWantsAutolayout:a3];
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v4 = [(UIScrollView *)self _automaticContentConstraints];
    if (!v4)
    {
      if ([(UIScrollView *)self _wantsConstrainedContentSize]) {
        return;
      }
      uint64_t v4 = [(UIScrollView *)self _constraintsFromContentSize];
      [(UIScrollView *)self _setAutomaticContentConstraints:v4];
    }
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self center];
  double v7 = v6;
  v8.receiver = self;
  v8.super_class = (Class)UIScrollView;
  -[UIView setCenter:](&v8, sel_setCenter_, x, y);
  if (v7 != y) {
    [(UIScrollView *)self _sendGeometryAffectingContentBottomChangedToScrollObservers];
  }
}

- (BOOL)_requiresExplicitLayoutMarginsGuideForAttribute:(int64_t)a3 getAttributeForGuide:(int *)a4
{
  int v8 = 0;
  v7.receiver = self;
  v7.super_class = (Class)UIScrollView;
  BOOL result = [(UIView *)&v7 _requiresExplicitLayoutMarginsGuideForAttribute:a3 getAttributeForGuide:&v8];
  int v6 = v8;
  if (a4) {
    *a4 = v8;
  }
  if ((v6 - 9) < 2) {
    return 1;
  }
  return result;
}

- (NSISVariable)_contentXOffsetVariable
{
  return self->_contentXOffsetVariable;
}

- (NSISVariable)_contentYOffsetVariable
{
  return self->_contentYOffsetVariable;
}

- (UIEdgeInsets)_contentInsetIncludingDecorations
{
  [(UIScrollView *)self _effectiveContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UIScrollView *)self _refreshControl];
  if ([v11 _areInsetsBeingApplied]
    && ([v11 _hostAdjustsContentOffset] & 1) == 0)
  {
    [v11 _appliedInsets];
    double v4 = v4 - v12;
    double v8 = v8 - v13;
    double v10 = v10 - v14;
    double v6 = v6 - v15;
  }

  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  BOOL v8 = [(UIScrollView *)self _shouldContentOffsetMaintainRelativeDistanceFromSafeArea];
  BOOL v9 = [(UIScrollView *)self _isAutomaticContentOffsetAdjustmentEnabled];
  if (v8) {
    [(UIScrollView *)self _setAutomaticContentOffsetAdjustmentEnabled:0];
  }
  [(UIView *)self safeAreaInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v51.receiver = self;
  v51.super_class = (Class)UIScrollView;
  -[UIView setSafeAreaInsets:](&v51, sel_setSafeAreaInsets_, top, left, bottom, right);
  if (v8) {
    [(UIScrollView *)self _setAutomaticContentOffsetAdjustmentEnabled:v9];
  }
  char v18 = [(UIScrollView *)self _edgesApplyingSafeAreaInsetsToContentInset];
  double v49 = v11 + 0.0;
  if (v18) {
    double v19 = v11 + 0.0;
  }
  else {
    double v19 = 0.0;
  }
  double v46 = top + 0.0;
  if (v18) {
    double v20 = top + 0.0;
  }
  else {
    double v20 = 0.0;
  }
  double v48 = v13 + 0.0;
  if ((v18 & 2) != 0) {
    double v21 = v13 + 0.0;
  }
  else {
    double v21 = 0.0;
  }
  double v44 = left + 0.0;
  if ((v18 & 2) != 0) {
    double v22 = left + 0.0;
  }
  else {
    double v22 = 0.0;
  }
  double v47 = v15 + 0.0;
  if ((v18 & 4) != 0) {
    double v23 = v15 + 0.0;
  }
  else {
    double v23 = 0.0;
  }
  double v43 = bottom + 0.0;
  if ((v18 & 4) != 0) {
    double v24 = bottom + 0.0;
  }
  else {
    double v24 = 0.0;
  }
  double v45 = v17 + 0.0;
  if ((v18 & 8) != 0) {
    double v25 = v17 + 0.0;
  }
  else {
    double v25 = 0.0;
  }
  double v50 = v20;
  if ((v18 & 8) != 0) {
    double v26 = right + 0.0;
  }
  else {
    double v26 = 0.0;
  }
  double v27 = v19;
  _UIScrollViewAdjustForOverlayInsetsChangeIfNecessary(self, 0, v20, v22, v24, v26, v19, v21, v23, v25);
  if (v21 == v22 && v27 == v50 && v25 == v26 && v23 == v24)
  {
    char v31 = [(UIScrollView *)self _edgesApplyingBaseInsetsToScrollIndicatorInsets];
    double v33 = v48;
    double v32 = v49;
    if ((v31 & 1) == 0) {
      double v32 = 0.0;
    }
    double v34 = v46;
    double v35 = v47;
    if ((v31 & 1) == 0) {
      double v34 = 0.0;
    }
    if ((v31 & 2) == 0) {
      double v33 = 0.0;
    }
    double v37 = v43;
    double v36 = v44;
    if ((v31 & 2) == 0) {
      double v36 = 0.0;
    }
    if ((v31 & 4) == 0)
    {
      double v35 = 0.0;
      double v37 = 0.0;
    }
    double v38 = v45;
    if ((v31 & 8) == 0) {
      double v38 = 0.0;
    }
    double v39 = right + 0.0;
    if ((v31 & 8) == 0) {
      double v39 = 0.0;
    }
    if (v33 != v36 || v32 != v34 || v38 != v39 || v35 != v37) {
      [(UIScrollView *)self _updateForChangedScrollIndicatorRelatedInsets];
    }
  }
}

- (void)_setAutomaticContentOffsetAdjustmentEnabled:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)_isAutomaticContentOffsetAdjustmentEnabled
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20000) == 0;
}

- (unint64_t)_edgesApplyingBaseInsetsToScrollIndicatorInsets
{
  int v2 = (*((_DWORD *)&self->_scrollViewFlags + 5) >> 7) & 3;
  if (v2 == 1) {
    return 15;
  }
  if (v2 == 2) {
    return 0;
  }
  return [(UIScrollView *)self _edgesApplyingSafeAreaInsetsToScrollAccessoryInsets];
}

- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3 contentSize:(CGSize)a4 skipsAdjustmentIfScrolling:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self bounds];
  double v63 = v12;
  double v64 = v11;
  [(UIScrollView *)self _effectiveContentInset];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  BOOL v21 = [(UIScrollView *)self isTracking]
     || [(UIScrollView *)self isDecelerating]
     || [(UIScrollView *)self isScrollAnimating];
  accuracdouble y = self->_accuracy;
  p_firstPageOffset = &self->_firstPageOffset;
  double v24 = self->_firstPageOffset.vertical - v14;
  if (accuracy == 1.0)
  {
    if (y >= round(v24))
    {
      double v28 = round(p_firstPageOffset->horizontal - v16);
      goto LABEL_11;
    }
LABEL_9:
    BOOL v29 = 1;
    goto LABEL_12;
  }
  double v25 = floor(v24);
  if (y < v25 + round(accuracy * (v24 - v25)) / accuracy) {
    goto LABEL_9;
  }
  double v26 = p_firstPageOffset->horizontal - v16;
  double v27 = floor(v26);
  double v28 = v27 + round(accuracy * (v26 - v27)) / accuracy;
LABEL_11:
  BOOL v29 = x < v28;
LABEL_12:
  p_scrollViewFlags = &self->_scrollViewFlags;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20000) != 0)
  {
    [(UIScrollView *)self contentAlignmentPoint];
    BOOL v31 = v32 == *MEMORY[0x1E4F1DAD8];
    if (v33 != *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
      BOOL v31 = 0;
    }
  }
  else
  {
    BOOL v31 = 0;
  }
  if ((*(void *)p_scrollViewFlags & 0x80) == 0
    && (*(void *)p_scrollViewFlags >> 30) & 1 | (v31 || v5 && v21 && v29))
  {
    double v34 = x;
    goto LABEL_51;
  }
  uint64_t v35 = *(uint64_t *)&self->_accuracy;
  if (*(double *)&v35 == 1.0)
  {
    if (round(v64) < round(v20 + width + v16))
    {
      double v34 = round(p_firstPageOffset->horizontal - v16);
      double v43 = v63;
      if (x >= v34)
      {
        double v42 = round(width + v20);
        double v34 = x;
        if (x + v64 > v42)
        {
LABEL_27:
          double v34 = v42 - v64;
          goto LABEL_38;
        }
      }
      goto LABEL_42;
    }
  }
  else
  {
    v36.f64[0] = v64;
    v36.f64[1] = v20 + width + v16;
    float64x2_t v37 = vrndmq_f64(v36);
    float64x2_t v38 = vaddq_f64(v37, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v36, v37), *(double *)&v35)), (float64x2_t)vdupq_lane_s64(v35, 0)));
    if (vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vcgeq_f64(v38, (float64x2_t)vdupq_laneq_s64((int64x2_t)v38, 1)))).u32[0])
    {
      double v39 = p_firstPageOffset->horizontal - v16;
      double v40 = floor(v39);
      double v34 = v40 + round(*(double *)&v35 * (v39 - v40)) / *(double *)&v35;
      if (x >= v34)
      {
        double v41 = floor(width + v20);
        double v42 = v41 + round((width + v20 - v41) * *(double *)&v35) / *(double *)&v35;
        double v43 = v63;
        if (x + v64 <= v42)
        {
          double v34 = x;
          goto LABEL_38;
        }
        goto LABEL_27;
      }
      goto LABEL_34;
    }
  }
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0
    || (v44 = [(UIScrollView *)self _shouldScrollToContentBeginningInRightToLeft], uint64_t v35 = *(uint64_t *)&self->_accuracy, !v44))
  {
    double v50 = p_firstPageOffset->horizontal - v16;
    if (*(double *)&v35 != 1.0)
    {
      double v51 = floor(v50);
      double v34 = v51 + round(*(double *)&v35 * (v50 - v51)) / *(double *)&v35;
LABEL_34:
      double v43 = v63;
      goto LABEL_38;
    }
    double v34 = round(v50);
    double v43 = v63;
LABEL_42:
    double v60 = round(self->_firstPageOffset.vertical - v14);
    if (round(v43) >= round(v18 + height + v14) || y < v60)
    {
      double y = v60;
      goto LABEL_51;
    }
    double v57 = y + v43;
    double v59 = round(height + v18);
    goto LABEL_48;
  }
  double v45 = v20 + width + v16;
  if (*(double *)&v35 == 1.0)
  {
    double v47 = round(v45);
    double v49 = round(v64);
  }
  else
  {
    double v46 = floor(v45);
    double v47 = v46 + round((v45 - v46) * *(double *)&v35) / *(double *)&v35;
    double v48 = floor(v64);
    double v49 = v48 + round((v64 - v48) * *(double *)&v35) / *(double *)&v35;
  }
  double v43 = v63;
  double v34 = v47 - v49;
LABEL_38:
  if (*(double *)&v35 == 1.0) {
    goto LABEL_42;
  }
  v52.f64[0] = v43;
  v52.f64[1] = v18 + height + v14;
  float64x2_t v53 = vrndmq_f64(v52);
  float64x2_t v54 = vaddq_f64(v53, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v52, v53), *(double *)&v35)), (float64x2_t)vdupq_lane_s64(v35, 0)));
  unsigned __int8 v55 = vmovn_s64(vcgeq_f64(v54, (float64x2_t)vdupq_laneq_s64((int64x2_t)v54, 1))).u8[0];
  v54.f64[0] = self->_firstPageOffset.vertical - v14;
  v52.f64[0] = floor(v54.f64[0]);
  double v56 = v52.f64[0] + round(*(double *)&v35 * (v54.f64[0] - v52.f64[0])) / *(double *)&v35;
  if ((v55 & 1) != 0 || y < v56)
  {
    double y = v56;
    goto LABEL_51;
  }
  double v57 = y + v43;
  double v58 = floor(height + v18);
  double v59 = v58 + round((height + v18 - v58) * *(double *)&v35) / *(double *)&v35;
LABEL_48:
  if (v57 > v59) {
    double y = v59 - v43;
  }
LABEL_51:
  double v62 = y;
  result.double y = v62;
  result.double x = v34;
  return result;
}

- (BOOL)_shouldContentOffsetMaintainRelativeDistanceFromSafeArea
{
  if ([(UIScrollView *)self _shouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange])
  {
    return 0;
  }
  if ([(UIScrollView *)self isTracking]
    || [(UIScrollView *)self isDecelerating]
    || [(UIScrollView *)self isScrollAnimating])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v4 = ![(UIScrollView *)self _isScrollingToTop];
  }
  BOOL deferredUpdateTargetIsValid = self->_deferredUpdateTargetIsValid;
  if ([(_UIScrollViewScrollableAncestor *)self->_scrollableAncestor _descendentScrollViewShouldMaintainRelativeDistanceFromSafeArea:self])return 1; {
  if (deferredUpdateTargetIsValid)
  }
    return 0;
  return v4;
}

- (BOOL)isScrollAnimating
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  if (WeakRetained) {
    BOOL scrollAnimatingViaAssertion = 1;
  }
  else {
    BOOL scrollAnimatingViaAssertion = self->_scrollAnimatingViaAssertion;
  }

  return scrollAnimatingViaAssertion;
}

- (BOOL)isTracking
{
  return *(_DWORD *)&self->_scrollViewFlags & 1;
}

- (BOOL)_shouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 26) & 1;
}

- (BOOL)_isScrollingToTop
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 13) & 1;
}

- (void)_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:(UIEdgeInsets)a3 oldEdgesPropagatingSafeAreaInsets:(unint64_t)a4 adjustContentOffsetIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(UIScrollView *)self _systemContentInset];
  BOOL v15 = left == v12 && top == v11;
  if (!v15 || right != v14 || bottom != v13)
  {
    if (v5)
    {
      _UIScrollViewAdjustForOverlayInsetsChangeIfNecessary(self, 0, v11, v12, v13, v14, top, left, bottom, right);
    }
    else
    {
      [(UIScrollView *)self _updateForChangedScrollRelatedInsets];
      [(UIScrollView *)self _updateForChangedScrollIndicatorRelatedInsets];
    }
    verticalScrollIndicator = self->_verticalScrollIndicator;
    BOOL v15 = verticalScrollIndicator == 0;
    BOOL v19 = verticalScrollIndicator != 0;
    uint64_t v20 = 1;
    if (!v15) {
      uint64_t v20 = 2;
    }
    if (self->_horizontalScrollIndicator) {
      unint64_t v21 = v20;
    }
    else {
      unint64_t v21 = v19;
    }
    id v23 = [(UIView *)self subviews];
    if ([v23 count] <= v21)
    {
    }
    else
    {
      BOOL v22 = [(UIView *)self _isInLayoutSubviews];

      if (!v22)
      {
        [(UIScrollView *)self setNeedsLayout];
      }
    }
  }
}

- (UIEdgeInsets)adjustedContentInset
{
  p_contentInset = &self->_contentInset;
  [(UIScrollView *)self _systemContentInset];
  double v4 = p_contentInset->top + v3;
  double v6 = v5 + p_contentInset->left;
  double v8 = v7 + p_contentInset->bottom;
  double v10 = v9 + p_contentInset->right;
  result.double right = v10;
  result.double bottom = v8;
  result.double left = v6;
  result.double top = v4;
  return result;
}

- (UIEdgeInsets)_systemContentInset
{
  [(UIScrollView *)self _systemContentInsetIncludingAccessories:1];
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  if ((*(void *)&self->_scrollViewFlags & 0x300000) == 0x100000) {
    return 15;
  }
  else {
    return ~[(UIScrollView *)self _edgesApplyingSafeAreaInsetsToContentInset] & 0xF;
  }
}

- (UIEdgeInsets)_systemContentInsetIncludingAccessories:(BOOL)a3
{
  BOOL v3 = a3;
  p_contentScrollInset = &self->_contentScrollInset;
  [(UIView *)self safeAreaInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  char v14 = [(UIScrollView *)self _edgesApplyingSafeAreaInsetsToContentInset];
  double left = p_contentScrollInset->left;
  double right = p_contentScrollInset->right;
  if (v14) {
    double v17 = v7;
  }
  else {
    double v17 = -0.0;
  }
  double v18 = p_contentScrollInset->top + v17;
  if ((v14 & 2) == 0) {
    double v9 = -0.0;
  }
  if ((v14 & 4) != 0) {
    double v19 = v11;
  }
  else {
    double v19 = -0.0;
  }
  double v20 = p_contentScrollInset->bottom + v19;
  if ((v14 & 8) == 0) {
    double v13 = -0.0;
  }
  if (!dyld_program_sdk_at_least()
    || self->_contentInsetAdjustmentBehavior != 2
    || (*((_DWORD *)&self->_scrollViewFlags + 5) & 0x8000) != 0)
  {
    double v20 = v20 + self->_keyboardBottomInsetAdjustment;
  }
  double v21 = left + v9;
  double v22 = v13 + right;
  [(UIScrollView *)self _systemInsetAdjustmentSum];
  double v24 = v18 + v23 + self->_refreshControlContentInsetHeight;
  if (v3)
  {
    if ([(UIScrollView *)self _contentScrollsAlongXAxis])
    {
      [(UIScrollView *)self accessoryInsets];
      double v21 = v21 + v25;
      double v22 = v22 + v26;
    }
    if ([(UIScrollView *)self _contentScrollsAlongYAxis])
    {
      [(UIScrollView *)self accessoryInsets];
      double v24 = v24 + v27;
      double v20 = v20 + v28;
    }
  }
  [(UIView *)self bounds];
  double v30 = v29 - (v21 + self->_contentInset.left + v22 + self->_contentInset.right);
  double v32 = v31 - (v24 + self->_contentInset.top + v20 + self->_contentInset.bottom);
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  [(UIScrollView *)self contentAlignmentPoint];
  double v37 = (v30 - width) * v36;
  if (width >= v30) {
    double v37 = -0.0;
  }
  double v38 = v21 + v37;
  double v39 = (v32 - height) * v35;
  if (height >= v32) {
    double v39 = -0.0;
  }
  double v40 = v24 + v39;
  double v41 = v38;
  double v42 = v20;
  double v43 = v22;
  result.double right = v43;
  result.double bottom = v42;
  result.double left = v41;
  result.double top = v40;
  return result;
}

- (BOOL)_contentScrollsAlongYAxis
{
  uint64_t v2 = (uint64_t)(int)(*((_DWORD *)&self->_scrollViewFlags + 5) << 25) >> 30;
  if (v2 == -1) {
    return [(UIScrollView *)self alwaysBounceVertical];
  }
  else {
    return v2 == 1;
  }
}

- (unint64_t)_edgesApplyingSafeAreaInsetsToContentInsetForContentSize:(CGSize)a3
{
  unint64_t contentInsetAdjustmentBehavior = self->_contentInsetAdjustmentBehavior;
  if (contentInsetAdjustmentBehavior >= 2)
  {
    if (contentInsetAdjustmentBehavior == 3) {
      return 15;
    }
    else {
      return 0;
    }
  }
  else
  {
    if ((*(void *)&self->_scrollViewFlags & 0x300000) == 0x100000)
    {
      unint64_t v5 = 0;
    }
    else
    {
      double height = a3.height;
      double width = a3.width;
      [(UIView *)self bounds];
      CGFloat x = v13.origin.x;
      CGFloat y = v13.origin.y;
      CGFloat v10 = v13.size.width;
      CGFloat v11 = v13.size.height;
      if (width <= CGRectGetWidth(v13))
      {
        if ([(UIScrollView *)self _contentScrollsAlongXAxis]) {
          unint64_t v5 = 15;
        }
        else {
          unint64_t v5 = 5;
        }
      }
      else
      {
        unint64_t v5 = 15;
      }
      v14.origin.CGFloat x = x;
      v14.origin.CGFloat y = y;
      v14.size.double width = v10;
      v14.size.double height = v11;
      a3.double width = CGRectGetHeight(v14);
      if (height <= a3.width && ![(UIScrollView *)self _contentScrollsAlongYAxis]) {
        v5 &= 0xAAAAAAAAAAAAAAAALL;
      }
    }
    if ([(UIScrollView *)self _applyVerticalSafeAreaInsetsToNonscrollingContent]&& !self->_contentInsetAdjustmentBehavior)
    {
      v5 |= 5uLL;
    }
  }
  return v5;
}

- (BOOL)_contentScrollsAlongXAxis
{
  uint64_t v2 = (uint64_t)(int)(*((_DWORD *)&self->_scrollViewFlags + 5) << 27) >> 30;
  if (v2 == -1) {
    return [(UIScrollView *)self alwaysBounceHorizontal];
  }
  else {
    return v2 == 1;
  }
}

- (unint64_t)_edgesApplyingSafeAreaInsetsToContentInset
{
  return -[UIScrollView _edgesApplyingSafeAreaInsetsToContentInsetForContentSize:](self, "_edgesApplyingSafeAreaInsetsToContentInsetForContentSize:", self->_contentSize.width, self->_contentSize.height);
}

- (BOOL)_applyVerticalSafeAreaInsetsToNonscrollingContent
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 60) & 1;
}

- (UIEdgeInsets)accessoryInsets
{
  double top = self->_accessoryInsets.top;
  double left = self->_accessoryInsets.left;
  double bottom = self->_accessoryInsets.bottom;
  double right = self->_accessoryInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGPoint)contentAlignmentPoint
{
  double x = self->_contentAlignmentPoint.x;
  double y = self->_contentAlignmentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)_systemInsetAdjustmentSum
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v3 = dyld_program_sdk_at_least();
  double result = 0.0;
  if (v3)
  {
    if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x8000000000000000) == 0)
    {
      contentInsetAdjustments = self->_contentInsetAdjustments;
      if (contentInsetAdjustments)
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        double v6 = contentInsetAdjustments;
        uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v15;
          double v10 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v15 != v9) {
                objc_enumerationMutation(v6);
              }
              double v12 = -[NSMutableDictionary objectForKey:](self->_contentInsetAdjustments, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
              [v12 doubleValue];
              double v10 = v10 + v13;
            }
            uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v8);
        }
        else
        {
          double v10 = 0.0;
        }

        self->_contentInsetAdjustmentsSum = v10;
        *(void *)((char *)&self->_scrollViewFlags + 12) |= 0x8000000000000000;
      }
    }
    return self->_contentInsetAdjustmentsSum;
  }
  return result;
}

- (BOOL)alwaysBounceHorizontal
{
  return *((unsigned char *)&self->_scrollViewFlags + 1) & 1;
}

- (BOOL)alwaysBounceVertical
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 1) >> 1) & 1;
}

- (BOOL)__canScrollWithoutBouncingYIncludingAdditionalContentInsetAmount:(double)a3
{
  [(UIScrollView *)self _contentFitCanScrollThreshold];
  double v6 = v5;
  [(UIScrollView *)self _effectiveContentInset];
  double v9 = v8 + v7 + self->_contentSize.height + a3;
  [(UIView *)self bounds];
  return v9 > v6 + v10 + 0.0001;
}

- (BOOL)_shouldUseStaticScrollBar
{
  [(UIView *)self bounds];
  double v18 = v3;
  [(UIScrollView *)self _effectiveContentInset];
  uint64_t v4 = *(uint64_t *)&self->_accuracy;
  v6.f64[0] = v5 + v6.f64[0] + self->_contentSize.height;
  if (*(double *)&v4 == 1.0)
  {
    v6.f64[0] = round(v6.f64[0]);
    double v8 = round(v18);
  }
  else
  {
    v6.f64[1] = v18;
    float64x2_t v7 = vrndmq_f64(v6);
    float64x2_t v6 = vaddq_f64(v7, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v6, v7), *(double *)&v4)), (float64x2_t)vdupq_lane_s64(v4, 0)));
    double v8 = v6.f64[1];
  }
  if (v6.f64[0] <= v8)
  {
    BOOL v10 = 1;
  }
  else
  {
    float v9 = v8 / v6.f64[0];
    BOOL v10 = v9 > 0.99;
  }
  CGFloat v11 = [(UIView *)self traitCollection];
  if ([v11 userInterfaceIdiom] == 3 && !-[UIScrollView isPagingEnabled](self, "isPagingEnabled"))
  {
    double v13 = [(UIView *)self window];
    long long v14 = [v13 _screen];
    long long v15 = [v14 _capabilityForKey:@"UIScreenCapabilityTouchLevelsKey"];
    char v16 = [v15 integerValue] == 2 || v10;
    BOOL v12 = (v16 & 1) == 0 && [(UIScrollView *)self isScrollEnabled];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_canScrollWithoutBouncingX
{
  [(UIScrollView *)self _contentFitCanScrollThreshold];
  double v4 = v3;
  [(UIScrollView *)self _effectiveContentInset];
  double v7 = v6 + v5 + self->_contentSize.width;
  [(UIView *)self bounds];
  return v7 > v4 + v8 + 0.0001;
}

- (double)_contentFitCanScrollThreshold
{
  return 0.0;
}

- (BOOL)isDecelerating
{
  if (self->_scrollHeartbeat) {
    return 1;
  }
  double v4 = +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:self];
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 scrollManager];
    char v2 = [v6 isScrollingScrollableContainer:self];
  }
  else
  {
    char v2 = 0;
  }

  return v2;
}

- (CGRect)visibleBounds
{
  v23.receiver = self;
  v23.super_class = (Class)UIScrollView;
  [(UIView *)&v23 visibleBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x1000000) != 0)
  {
    id v11 = [(UIView *)self _window];
    if (!v11) {
      goto LABEL_4;
    }
    BOOL v12 = v11;
    [v11 bounds];
    objc_msgSend(v12, "convertRect:toView:", self);
    v27.origin.CGFloat x = v13;
    v27.origin.CGFloat y = v14;
    v27.size.CGFloat width = v15;
    v27.size.CGFloat height = v16;
    v24.origin.CGFloat x = v4;
    v24.origin.CGFloat y = v6;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    CGRect v25 = CGRectIntersection(v24, v27);
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
    if (!CGRectIsEmpty(v25))
    {
      CGFloat v6 = y;
      CGFloat v4 = x;
    }
    else
    {
LABEL_4:
      CGFloat width = *MEMORY[0x1E4F1DB30];
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  double v19 = v4;
  double v20 = v6;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)performWhileAnimatingAutomaticContentOffsetAdjustments:(id)a3
{
  p_scrollViewFlags = &self->_scrollViewFlags;
  unint64_t v4 = *(void *)((char *)&self->_scrollViewFlags + 12);
  *(void *)((char *)&self->_scrollViewFlags + 12) = v4 | 0x40000;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFFBFFFFLL | (((v4 >> 18) & 1) << 18);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)UIScrollView;
  double v5 = -[UIView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if (!v5) {
    goto LABEL_9;
  }
  if (self->_lastScrollInterruptionByPointerEventTime != 0.0)
  {
    CGFloat v6 = (void *)UIApp;
    double v7 = [(UIView *)self _window];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __34__UIScrollView_hitTest_withEvent___block_invoke;
    v17[3] = &unk_1E530F430;
    v17[4] = self;
    LODWORD(v6) = [v6 _eatCurrentTouchForWindow:v7 ifPredicate:v17];

    if (v6) {
      goto LABEL_14;
    }
  }
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x100000000000) == 0)
  {
LABEL_9:
    BOOL v12 = v5;
    double v5 = v12;
    goto LABEL_15;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_draggingChildScrollView);
  char HasDescendant = _ViewHasDescendant(self, WeakRetained);

  if (HasDescendant)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_draggingChildScrollView);
    if (([v5 isDescendantOfView:v10] & 1) == 0)
    {
      id v11 = v10;

      double v5 = v11;
    }

    goto LABEL_9;
  }
  if (os_variant_has_internal_diagnostics())
  {
    CGFloat v16 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v20 = self;
      _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "Scroll view %@ thinks it's being dragged by a child that no longer exists. Please file a bug against UIKit | ScrollView", buf, 0xCu);
    }
  }
  else
  {
    CGFloat v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &hitTest_withEvent____s_category_0) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v20 = self;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Scroll view %@ thinks it's being dragged by a child that no longer exists. Please file a bug against UIKit | ScrollView", buf, 0xCu);
    }
  }
  objc_storeWeak((id *)&self->_draggingChildScrollView, 0);
  *(void *)((char *)&self->_scrollViewFlags + 12) &= ~0x100000000000uLL;
LABEL_14:
  BOOL v12 = self;
LABEL_15:
  CGFloat v14 = v12;

  return v14;
}

- (void)_updateForChangedScrollIndicatorRelatedInsets
{
  -[UIScrollView _setCachedVerticalScrollIndicatorBaseInsets:](self, "_setCachedVerticalScrollIndicatorBaseInsets:", 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
  -[UIScrollView _setCachedHorizontalScrollIndicatorBaseInsets:](self, "_setCachedHorizontalScrollIndicatorBaseInsets:", 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
  if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)self)
    || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self))
  {
    [(UIScrollView *)self _adjustScrollerIndicators:1 alwaysShowingThem:0];
  }
  [(UIScrollView *)self _updateAccessories];
}

- (UIEdgeInsets)scrollIndicatorInsets
{
  if (dyld_program_sdk_at_least())
  {
    [(UIScrollView *)self verticalScrollIndicatorInsets];
    double top = v3;
    double left = v5;
    double bottom = v7;
    double right = v9;
    [(UIScrollView *)self horizontalScrollIndicatorInsets];
    if (left != v14 || top != v11 || right != v13 || bottom != v12)
    {
      double left = 0.0;
      double top = 0.0;
      double bottom = 0.0;
      double right = 0.0;
    }
  }
  else
  {
    double top = self->_scrollIndicatorInset.top;
    double left = self->_scrollIndicatorInset.left;
    double bottom = self->_scrollIndicatorInset.bottom;
    double right = self->_scrollIndicatorInset.right;
  }
  double v18 = top;
  double v19 = left;
  double v20 = bottom;
  double v21 = right;
  result.double right = v21;
  result.double bottom = v20;
  result.double left = v19;
  result.double top = v18;
  return result;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if (a4 && (*((_DWORD *)&self->_scrollViewFlags + 5) & 0x1000000) != 0)
  {
    [(UIScrollView *)self visibleBounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    p_lastVisibleBounds = &self->_lastVisibleBounds;
    v14.origin.CGFloat x = v5;
    v14.origin.CGFloat y = v7;
    v14.size.CGFloat width = v9;
    v14.size.CGFloat height = v11;
    if (!CGRectEqualToRect(self->_lastVisibleBounds, v14))
    {
      -[UIScrollView _invalidateLayoutForVisibleBounds:oldVisibleBounds:](self, "_invalidateLayoutForVisibleBounds:oldVisibleBounds:", v6, v8, v10, v12, p_lastVisibleBounds->origin.x, self->_lastVisibleBounds.origin.y, self->_lastVisibleBounds.size.width, self->_lastVisibleBounds.size.height);
      p_lastVisibleBounds->origin.CGFloat x = v6;
      self->_lastVisibleBounds.origin.CGFloat y = v8;
      self->_lastVisibleBounds.size.CGFloat width = v10;
      self->_lastVisibleBounds.size.CGFloat height = v12;
    }
  }
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  id v20 = a3;
  if (!a4)
  {
    -[UIScrollView _setCachedVerticalScrollIndicatorBaseInsets:](self, "_setCachedVerticalScrollIndicatorBaseInsets:", 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
    -[UIScrollView _setCachedHorizontalScrollIndicatorBaseInsets:](self, "_setCachedHorizontalScrollIndicatorBaseInsets:", 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
  }
  double v6 = objc_getAssociatedObject(self, &_UIScrollViewBoundingPathForSubtreeKey);
  CGFloat v7 = v6;
  if (v6)
  {
    [v6 boundingRect];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(UIView *)self bounds];
    v23.origin.CGFloat x = v16;
    v23.origin.CGFloat y = v17;
    v23.size.CGFloat width = v18;
    v23.size.CGFloat height = v19;
    v22.origin.CGFloat x = v9;
    v22.origin.CGFloat y = v11;
    v22.size.CGFloat width = v13;
    v22.size.CGFloat height = v15;
    if (!CGRectEqualToRect(v22, v23)) {
      objc_setAssociatedObject(self, &_UIScrollViewBoundingPathForSubtreeKey, 0, (void *)1);
    }
  }
}

- (void)_setCachedVerticalScrollIndicatorBaseInsets:(UIEdgeInsets)a3
{
  self->_cachedVerticalScrollIndicatorBaseInsets = a3;
}

- (void)_setCachedHorizontalScrollIndicatorBaseInsets:(UIEdgeInsets)a3
{
  self->_cachedHorizontalScrollIndicatorBaseInsets = a3;
}

- (BOOL)_isScrollViewScrollObserver:(id)a3
{
  return a3 && -[NSHashTable containsObject:](self->_scrollNotificationObservers, "containsObject:");
}

- (void)_setVerticalScrollIndicatorUsesAlternativeTopSafeAreaInset:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (void)_setTopScrollIndicatorFollowsContentOffset:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (void)_setAlternativeVerticalScrollIndicatorTopSafeAreaInset:(double)a3
{
  self->__alternativeVerticalScrollIndicatorTopSafeAreaInset = a3;
}

- (void)_setShouldAdjustLayoutToDrawTopSeparator:(BOOL)a3
{
  int v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
  if (((((*(void *)&v3 & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    unsigned int v4 = v3 & 0xFFFDFFFF;
    if (a3) {
      int v5 = 0x20000;
    }
    else {
      int v5 = 0;
    }
    *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12);
    *((_DWORD *)&self->_scrollViewFlags + 5) = v4 | v5;
    [(UIScrollView *)self _layoutAdjustmentsDidChange];
  }
}

- (void)_setShouldAdjustLayoutToCollapseTopSpacing:(BOOL)a3
{
  int v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
  if (((((*(void *)&v3 & 0x10000) == 0) ^ a3) & 1) == 0)
  {
    unsigned int v4 = v3 & 0xFFFEFFFF;
    if (a3) {
      int v5 = 0x10000;
    }
    else {
      int v5 = 0;
    }
    *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12);
    *((_DWORD *)&self->_scrollViewFlags + 5) = v4 | v5;
    [(UIScrollView *)self _layoutAdjustmentsDidChange];
  }
}

- (BOOL)_isTransientScrollView
{
  return self->__isTransientScrollView;
}

- (double)_contentBottomForScrollObservation
{
  return self->_contentSize.height;
}

- (void)_addScrollViewScrollObserver:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_16;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(UIScrollView *)self _observerImplementingWillEndDraggingMethod];
    double v6 = (void *)v5;
    if (!v5 || (id)v5 == v4) {
      goto LABEL_11;
    }
    if (os_variant_has_internal_diagnostics())
    {
      double v8 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      CGFloat v9 = NSStringFromSelector(sel__observeScrollView_willEndDraggingWithVelocity_targetContentOffset_unclampedOriginalTarget_);
      int v13 = 138413058;
      double v14 = v9;
      __int16 v15 = 2112;
      CGFloat v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "UIScrollView does not support multiple observers implementing %@. Scroll view %@, new observer %@, removing old observer %@", (uint8_t *)&v13, 0x2Au);
    }
    else
    {
      CGFloat v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_addScrollViewScrollObserver____s_category) + 8);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        [(UIScrollView *)self _removeScrollViewScrollObserver:v6];
LABEL_11:

        goto LABEL_12;
      }
      double v8 = v7;
      CGFloat v9 = NSStringFromSelector(sel__observeScrollView_willEndDraggingWithVelocity_targetContentOffset_unclampedOriginalTarget_);
      int v13 = 138413058;
      double v14 = v9;
      __int16 v15 = 2112;
      CGFloat v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "UIScrollView does not support multiple observers implementing %@. Scroll view %@, new observer %@, removing old observer %@", (uint8_t *)&v13, 0x2Au);
    }

LABEL_9:
    goto LABEL_10;
  }
LABEL_12:
  scrollNotificationObservers = self->_scrollNotificationObservers;
  if (scrollNotificationObservers)
  {
    CGFloat v11 = (NSHashTable *)[(NSHashTable *)scrollNotificationObservers copy];
  }
  else
  {
    CGFloat v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  }
  double v12 = self->_scrollNotificationObservers;
  self->_scrollNotificationObservers = v11;

  [(NSHashTable *)self->_scrollNotificationObservers addObject:v4];
LABEL_16:
}

- (id)_observerImplementingWillEndDraggingMethod
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x3032000000;
  double v8 = __Block_byref_object_copy__237;
  CGFloat v9 = __Block_byref_object_dispose__237;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__UIScrollView__observerImplementingWillEndDraggingMethod__block_invoke;
  v4[3] = &unk_1E530F518;
  v4[4] = &v5;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)stopScrollingAndZooming
{
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  keyboardScrollingGestureRecognizer = self->_keyboardScrollingGestureRecognizer;
  int v7 = [a4 _isGestureType:17];
  if (keyboardScrollingGestureRecognizer != a3 || v7 == 0) {
    return 0;
  }
  return _UIFocusEnvironmentIsFocusedOrContainsFocus(self);
}

- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  keyboardScrollingGestureRecognizer = self->_keyboardScrollingGestureRecognizer;
  int v7 = [a4 _isGestureType:17];
  if (keyboardScrollingGestureRecognizer != a3 || v7 == 0)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    int v9 = [(UIView *)self isFirstResponder];
    if (v9) {
      LOBYTE(v9) = _UIFocusEnvironmentIsFocusedOrContainsFocus(self) ^ 1;
    }
  }
  return v9;
}

- (BOOL)_supportsContentDimensionVariables
{
  return 1;
}

- (id)_enclosingViewController
{
  id v2 = self;
  if (v2)
  {
    int v3 = v2;
    while (1)
    {
      uint64_t v4 = +[UIViewController viewControllerForView:v3];
      if (v4) {
        break;
      }
      uint64_t v5 = [(UIView *)v3 superview];

      int v3 = v5;
      if (!v5) {
        goto LABEL_8;
      }
    }
    uint64_t v5 = (UIScrollView *)v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_8:
  return v5;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  double v6 = (UIScrollViewPinchGestureRecognizer *)a4;
  BOOL v7 = self->_pan == a3
    && (self->_pinch == v6
     || (UIScrollViewPinchGestureRecognizer *)self->_knobLongPressGestureRecognizer == v6
     || self->_knobPointerLongPressGestureRecognizer == (UIScrollViewKnobLongPressGestureRecognizer *)v6);

  return v7;
}

- (UIRefreshControl)_refreshControl
{
  id v2 = [(UIScrollView *)self refreshControl];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (UIRefreshControl *)v3;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (id)_actingParentScrollView
{
  id v3 = [(UIScrollView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(UIScrollView *)self delegate];
    double v6 = [v5 _actingParentScrollViewForScrollView:self];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  char v4 = (UIScrollViewKnobLongPressGestureRecognizer *)a3;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0 && self->_swipe == v4)
  {
    double v41 = v4;
    BOOL v5 = [(UIGestureRecognizer *)self->_pan state] <= UIGestureRecognizerStateChanged;
    char v4 = v41;
    if (v5)
    {
      pan = self->_pan;
      if (pan && (unint64_t)(pan->super.super._state - 1) <= 2) {
        -[UIPanGestureRecognizer setTranslation:inView:](pan, "setTranslation:inView:", self, 0.0, 0.0);
      }
      BOOL v7 = (void *)UIApp;
      double v8 = [(UIView *)self window];
      id v9 = (id)[v7 _touchesEventForWindow:v8];

      id v10 = [(UIGestureRecognizer *)self->_pan _activeTouchesForEvent:v9];
      if ([v10 count]) {
        [(UIScrollView *)self _beginTrackingWithEvent:v9];
      }

      goto LABEL_32;
    }
  }
  if ((UIScrollViewKnobLongPressGestureRecognizer *)self->_pan != v4)
  {
    if (self->_knobLongPressGestureRecognizer != v4) {
      goto LABEL_33;
    }
    double v41 = v4;
    [(UIScrollView *)self _sendDelayedTouchesIfNecessary];
    goto LABEL_32;
  }
  double v41 = v4;
  swipe = self->_swipe;
  if (!swipe || (unint64_t)(swipe[9] - 1) >= 3) {
    [(UIScrollView *)self _handlePanFailure];
  }
  [(UIScrollView *)self _sendDelayedTouchesIfNecessary];
  [(UIView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  [(UIScrollView *)self contentOffset];
  double v17 = v16;
  double v19 = v18;
  [(UIScrollView *)self _effectiveContentInset];
  uint64_t v24 = *(void *)((char *)&self->_scrollViewFlags + 12);
  char v4 = v41;
  if ((v24 & 0x100000000000) == 0)
  {
    accuracCGFloat y = self->_accuracy;
    double v26 = self->_firstPageOffset.horizontal - v21;
    if (accuracy == 1.0)
    {
      double v38 = round(v26);
      if (v17 >= v38)
      {
        double v31 = round(self->_firstPageOffset.vertical - v20);
        if (v19 >= v31)
        {
          double v39 = round(v23 + self->_contentSize.width) - v13;
          if (v38 < v39) {
            double v38 = v39;
          }
          if (v17 <= v38)
          {
            double v37 = round(v22 + self->_contentSize.height);
LABEL_37:
            double v40 = v37 - v15;
            if (v31 < v40) {
              double v31 = v40;
            }
            if ((v24 & 0x10000000000) == 0 || v19 <= v31) {
              goto LABEL_33;
            }
            goto LABEL_31;
          }
        }
      }
    }
    else
    {
      double v27 = floor(v26);
      double v28 = v27 + round(accuracy * (v26 - v27)) / accuracy;
      if (v17 >= v28)
      {
        double v29 = self->_firstPageOffset.vertical - v20;
        double v30 = floor(v29);
        double v31 = v30 + round(accuracy * (v29 - v30)) / accuracy;
        if (v19 >= v31)
        {
          double v32 = v23 + self->_contentSize.width;
          double v33 = floor(v32);
          double v34 = v33 + round(accuracy * (v32 - v33)) / accuracy - v13;
          if (v28 < v34) {
            double v28 = v34;
          }
          if (v17 <= v28)
          {
            double v35 = v22 + self->_contentSize.height;
            double v36 = floor(v35);
            double v37 = v36 + round(accuracy * (v35 - v36)) / accuracy;
            goto LABEL_37;
          }
        }
      }
    }
    if ((v24 & 0x10000000000) == 0) {
      goto LABEL_33;
    }
LABEL_31:
    [(UIScrollView *)self _pushTrackingRunLoopModeIfNecessaryForReason:@"Pan failed while rubber-banding"];
    -[UIScrollView _updateDecelerationLastOffsetScrollViewPoint:](self, "_updateDecelerationLastOffsetScrollViewPoint:", v17, v19);
    [(UIScrollView *)self _startTimer:1];
LABEL_32:
    char v4 = v41;
  }
LABEL_33:
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (UIScrollViewPanGestureRecognizer *)a3;
  id v7 = a4;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0
    || self->_pan != v6
    || (*(unsigned char *)&self->_scrollViewFlags & 1) != 0)
  {
    if (self->_lowFidelitySwipeGestureRecognizers[0])
    {
      uint64_t v11 = 0;
      double v12 = 0;
      while (1)
      {
        double v13 = self->_lowFidelitySwipeGestureRecognizers[v11];

        if (v13 == (UISwipeGestureRecognizer *)v6) {
          break;
        }
        ++v11;
        double v12 = v13;
        if (v11 == 4) {
          goto LABEL_9;
        }
      }
      uint64_t v14 = [(UIScrollViewPanGestureRecognizer *)v6 direction];
      if ((unint64_t)(v14 - 1) >= 2)
      {
        if (v14 != 8)
        {
          double v13 = (UISwipeGestureRecognizer *)v6;
          if (v14 != 4)
          {
LABEL_9:

            goto LABEL_16;
          }
        }
        BOOL v15 = [(UIScrollView *)self _canScrollY];
      }
      else
      {
        BOOL v15 = [(UIScrollView *)self _canScrollX];
      }
      BOOL v16 = v15;

      if (!v16) {
        goto LABEL_27;
      }
    }
  }
  else
  {
    double v8 = (void *)UIApp;
    id v9 = [(UIView *)self window];
    id v10 = (id)[v8 _touchesEventForWindow:v9];

    [(UIScrollView *)self _beginTrackingWithEvent:v10];
  }
LABEL_16:
  if ((UIScrollViewPanGestureRecognizer *)self->_knobLongPressGestureRecognizer == v6
    || (UIScrollViewPanGestureRecognizer *)self->_knobPointerLongPressGestureRecognizer == v6)
  {
    [v7 locationInView:self];
    double v18 = v17;
    double v20 = v19;
    if ((unint64_t)(-[UIScrollView _scrubbingForPoint:touch:](self, "_scrubbingForPoint:touch:", v7) - 1) <= 3)
    {
      knobFeedbackGenerator = self->_knobFeedbackGenerator;
      if (!knobFeedbackGenerator)
      {
        double v22 = [(UIView *)self traitCollection];
        double v23 = +[_UIScrollViewScrollIndicator visualStyleForTraitCollection:v22];

        if (objc_opt_respondsToSelector())
        {
          uint64_t v24 = [v23 feedbackGeneratorWithView:self];
          CGRect v25 = self->_knobFeedbackGenerator;
          self->_knobFeedbackGenerator = v24;
        }
        if (!self->_knobFeedbackGenerator)
        {
          if (os_variant_has_internal_diagnostics())
          {
            double v29 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1853B0000, v29, OS_LOG_TYPE_FAULT, "_UIScrollViewScrollIndicatorVisualStyle should provide a feedback generator.", buf, 2u);
            }
          }
          else
          {
            double v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_gestureRecognizer_shouldReceiveTouch____s_category)+ 8);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)double v30 = 0;
              _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "_UIScrollViewScrollIndicatorVisualStyle should provide a feedback generator.", v30, 2u);
            }
          }
        }

        knobFeedbackGenerator = self->_knobFeedbackGenerator;
      }
      if (([(UIFeedbackGeneratorUserInteractionDriven *)knobFeedbackGenerator isActive] & 1) == 0) {
        -[UIFeedbackGeneratorUserInteractionDriven userInteractionStartedAtLocation:](self->_knobFeedbackGenerator, "userInteractionStartedAtLocation:", v18, v20);
      }
      goto LABEL_26;
    }
LABEL_27:
    BOOL v26 = 0;
    goto LABEL_28;
  }
LABEL_26:
  BOOL v26 = 1;
LABEL_28:

  return v26;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (void)_sendDelayedTouchesIfNecessary
{
  char v4 = [(UIScrollView *)self _scrollViewTouchDelayGesture];
  uint64_t v2 = [v4 state];
  id v3 = v4;
  if (v4 && !v2 && (v4[1] & 0x200000000) != 0)
  {
    [v4 sendDelayedTouches];
    id v3 = v4;
  }
}

- (void)_trackingDidEnd
{
  *(void *)&self->_scrollViewFlags &= ~1uLL;
}

- (double)horizontalScrollDecelerationFactor
{
  return self->_decelerationFactor.width;
}

- (void)_updateScrollGestureRecognizersEnabled
{
  BOOL v3 = [(UIScrollView *)self _usesLowFidelityPanning];
  unsigned int v4 = !v3;
  if ((*(void *)&self->_scrollViewFlags & 0x100000) != 0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  [(UIGestureRecognizer *)self->_pan setEnabled:v5];
  if ((*(void *)&self->_scrollViewFlags & 0x100000) != 0) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v4;
  }
  [self->_swipe setEnabled:v6];
  for (uint64_t i = 0; i != 4; ++i)
  {
    BOOL v8 = (*(void *)&self->_scrollViewFlags & 0x100000) == 0 && v3;
    [(UIGestureRecognizer *)self->_lowFidelitySwipeGestureRecognizers[i] setEnabled:v8];
  }
}

- (BOOL)_usesLowFidelityPanning
{
  if ([(UIView *)self _userInterfaceIdiom] == 3 && self->_touchLevel == 1) {
    return ![(UIScrollView *)self isPagingEnabled];
  }
  else {
    return 0;
  }
}

- (void)setProgrammaticScrollEnabled:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)_hasContentForBarInteractions
{
  [(UIScrollView *)self contentSize];
  return v3 > 0.0 && v2 > 0.0;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)_compatibleContentInsetAdjustmentBehavior
{
  return self->_contentInsetAdjustmentBehavior;
}

- (CGPoint)_contentOffsetOrDeferredContentOffset
{
  if (self->_deferredUpdateTargetIsValid)
  {
    double x = self->_deferredUpdateTargetContentOffset.x;
    double y = self->_deferredUpdateTargetContentOffset.y;
  }
  else
  {
    [(UIScrollView *)self contentOffset];
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)_allowedNavigationOverlapAmount
{
  return self->_allowedNavigationOverlapAmount;
}

- (void)_createGestureRecognizersForCurrentTouchLevel
{
  if (self->_touchLevel != 2)
  {
    if (!self->_touchDelayGestureRecognizer)
    {
      double v3 = [(UIGestureRecognizer *)[UIScrollViewDelayedTouchesBeganGestureRecognizer alloc] initWithTarget:self action:sel_delayed_];
      touchDelayGestureRecognizer = self->_touchDelayGestureRecognizer;
      self->_touchDelayGestureRecognizer = v3;

      [(UIGestureRecognizer *)self->_touchDelayGestureRecognizer setDelegate:self];
      [(UIGestureRecognizer *)self->_touchDelayGestureRecognizer setDelaysTouchesBegan:1];
      [(UIGestureRecognizer *)self->_touchDelayGestureRecognizer setEnabled:(*(void *)&self->_scrollViewFlags & 0x100000) == 0];
      [(UIGestureRecognizer *)self->_touchDelayGestureRecognizer setAllowedTouchTypes:self->__allowedTouchTypesForScrolling];
      [(UIGestureRecognizer *)self->_touchDelayGestureRecognizer _setRequiresSystemGesturesToFail:1];
      [(UIView *)self addGestureRecognizer:self->_touchDelayGestureRecognizer];
    }
    if (!self->_pan)
    {
      uint64_t v5 = -[UIScrollViewPanGestureRecognizer initWithTarget:action:]([UIScrollViewPanGestureRecognizer alloc], "initWithTarget:action:", self, [(id)objc_opt_class() _panGestureAction]);
      pan = self->_pan;
      self->_pan = v5;

      [(UIScrollViewPanGestureRecognizer *)self->_pan setScrollView:self];
      [(UIScrollView *)self _updateScrollGestureRecognizersEnabled];
      [(UIScrollViewPanGestureRecognizer *)self->_pan setDelegate:self];
      [(UIGestureRecognizer *)self->_pan setDelaysTouchesEnded:0];
      [(UIScrollViewPanGestureRecognizer *)self->_pan setAllowedTouchTypes:self->__allowedTouchTypesForScrolling];
      [(UIView *)self addGestureRecognizer:self->_pan];
      [(UIScrollView *)self _updatePinchGesture];
      [(UIScrollView *)self _updatePagingGestures];
    }
    if (!self->_knobLongPressGestureRecognizer)
    {
      id v7 = [[UIScrollViewKnobLongPressGestureRecognizer alloc] initWithTarget:self action:sel__handleKnobLongPressGesture_];
      knobLongPressGestureRecognizer = self->_knobLongPressGestureRecognizer;
      self->_knobLongPressGestureRecognizer = v7;

      [(UILongPressGestureRecognizer *)self->_knobLongPressGestureRecognizer setMinimumPressDuration:0.1];
      [(UIGestureRecognizer *)self->_knobLongPressGestureRecognizer setDelegate:self];
      [(UIGestureRecognizer *)self->_knobLongPressGestureRecognizer setAllowedTouchTypes:self->__allowedTouchTypesForScrolling];
      [(UIView *)self addGestureRecognizer:self->_knobLongPressGestureRecognizer];
    }
    if (!self->_knobPointerLongPressGestureRecognizer)
    {
      id v9 = [[UIScrollViewKnobLongPressGestureRecognizer alloc] initWithTarget:self action:sel__handleKnobLongPressGesture_];
      knobPointerLongPressGestureRecognizer = self->_knobPointerLongPressGestureRecognizer;
      self->_knobPointerLongPressGestureRecognizer = v9;

      [(UIScrollViewKnobLongPressGestureRecognizer *)self->_knobPointerLongPressGestureRecognizer setForPointer:1];
      [(UILongPressGestureRecognizer *)self->_knobPointerLongPressGestureRecognizer setMinimumPressDuration:0.0];
      [(UIGestureRecognizer *)self->_knobPointerLongPressGestureRecognizer setDelegate:self];
      [(UIGestureRecognizer *)self->_knobPointerLongPressGestureRecognizer setAllowedTouchTypes:self->__allowedTouchTypesForScrolling];
      [(UIView *)self addGestureRecognizer:self->_knobPointerLongPressGestureRecognizer];
    }
    if (!self->_knobHoverGestureRecognizer)
    {
      uint64_t v11 = [[UIHoverGestureRecognizer alloc] initWithTarget:self action:sel__handleKnobHoverGesture_];
      knobHoverGestureRecognizer = self->_knobHoverGestureRecognizer;
      self->_knobHoverGestureRecognizer = v11;

      [(UIView *)self addGestureRecognizer:self->_knobHoverGestureRecognizer];
    }
  }
  if ([(UIScrollView *)self _usesLowFidelityPanning]
    && !self->_lowFidelitySwipeGestureRecognizers[0])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__UIScrollView__createGestureRecognizersForCurrentTouchLevel__block_invoke;
    aBlock[3] = &unk_1E52EBCD8;
    aBlock[4] = self;
    double v13 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v13[2](v13, 2);
    v13[2](v13, 1);
    v13[2](v13, 4);
    v13[2](v13, 8);
    [(UIScrollView *)self _updateScrollGestureRecognizersEnabled];
  }
  if (!self->_dragAutoScrollGestureRecognizer)
  {
    uint64_t v14 = [(UIDragGestureRecognizer *)[_UIDragAutoScrollGestureRecognizer alloc] initWithTarget:self action:sel__handleAutoScroll_];
    dragAutoScrollGestureRecognizer = self->_dragAutoScrollGestureRecognizer;
    self->_dragAutoScrollGestureRecognizer = v14;

    [(UIView *)self addGestureRecognizer:self->_dragAutoScrollGestureRecognizer];
  }
  if ([(UIScrollView *)self _platformUsesGestureRecognizersForKeyboardScrolling])
  {
    if (!self->_keyboardScrollingGestureRecognizer)
    {
      BOOL v16 = [(UIGestureRecognizer *)[_UIPressGestureRecognizer alloc] initWithTarget:self action:sel__handleKeyboardScrollingPressGesture_];
      keyboardScrollingGestureRecognizer = self->_keyboardScrollingGestureRecognizer;
      self->_keyboardScrollingGestureRecognizer = v16;

      [(_UIPressGestureRecognizer *)self->_keyboardScrollingGestureRecognizer setDelegate:self];
      [(UIView *)self addGestureRecognizer:self->_keyboardScrollingGestureRecognizer];
    }
  }
}

- (BOOL)_platformUsesGestureRecognizersForKeyboardScrolling
{
  return 1;
}

- (void)_updatePagingGestures
{
  [(UIScrollView *)self _updatePagingSwipeGesture];
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    [(UIScrollView *)self _updateScrollGestureRecognizersEnabled];
  }
}

- (void)_updatePagingSwipeGesture
{
  id swipe = self->_swipe;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    if (swipe) {
      return;
    }
    uint64_t v5 = [(UIGestureRecognizer *)[UIScrollViewPagingSwipeGestureRecognizer alloc] initWithTarget:self action:sel__handleSwipe_];
    id v6 = self->_swipe;
    self->_id swipe = v5;
    id v7 = v5;

    [(UIScrollViewPagingSwipeGestureRecognizer *)v7 setScrollView:self];
    [(UIGestureRecognizer *)v7 setDelegate:self];
    [(UIGestureRecognizer *)v7 setAllowedTouchTypes:self->__allowedTouchTypesForScrolling];
    [(UIView *)self addGestureRecognizer:self->_swipe];
    [(UIGestureRecognizer *)self->_pan requireGestureRecognizerToFail:self->_swipe];
    id v4 = v7;
  }
  else
  {
    if (!swipe) {
      return;
    }
    -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    id v4 = self->_swipe;
    self->_id swipe = 0;
  }
}

- (void)_updatePinchGesture
{
  pinch = self->_pinch;
  if (self->_minimumZoomScale == self->_maximumZoomScale)
  {
    if (pinch)
    {
      -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:");
      BOOL v8 = self->_pinch;
      self->_pinch = 0;
    }
  }
  else if (!pinch)
  {
    id v4 = -[UIScrollViewPinchGestureRecognizer initWithTarget:action:]([UIScrollViewPinchGestureRecognizer alloc], "initWithTarget:action:", self, [(id)objc_opt_class() _pinchGestureAction]);
    uint64_t v5 = self->_pinch;
    self->_pinch = v4;

    [(UIScrollViewPinchGestureRecognizer *)self->_pinch setScrollView:self];
    [(UIScrollViewPinchGestureRecognizer *)self->_pinch setDelegate:self];
    [(UIGestureRecognizer *)self->_pinch setDelaysTouchesEnded:0];
    id v6 = self->_pinch;
    if ([(id)UIApp _supportsIndirectInputEvents]) {
      id v7 = &unk_1ED3F1858;
    }
    else {
      id v7 = &unk_1ED3F1840;
    }
    [(UIGestureRecognizer *)v6 setAllowedTouchTypes:v7];
    -[UIView _addGestureRecognizer:atEnd:]((uint64_t)self, self->_pinch, 0);
  }
  [(UIScrollView *)self _updatePanGestureConfiguration];
}

- (void)_setAllowedTouchTypesForScrolling:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  allowedTouchTypesForScrolling = self->__allowedTouchTypesForScrolling;
  self->__allowedTouchTypesForScrolling = v4;

  [(UIScrollViewPanGestureRecognizer *)self->_pan setAllowedTouchTypes:self->__allowedTouchTypesForScrolling];
  [(UIGestureRecognizer *)self->_touchDelayGestureRecognizer setAllowedTouchTypes:self->__allowedTouchTypesForScrolling];
  [self->_swipe setAllowedTouchTypes:self->__allowedTouchTypesForScrolling];
  if (self->_lowFidelitySwipeGestureRecognizers[0])
  {
    for (uint64_t i = 0; i != 4; ++i)
      [(UIGestureRecognizer *)self->_lowFidelitySwipeGestureRecognizers[i] setAllowedTouchTypes:self->__allowedTouchTypesForScrolling];
  }
}

+ (SEL)_panGestureAction
{
  return sel_handlePan_;
}

+ (SEL)_pinchGestureAction
{
  return sel_handlePinch_;
}

- (void)_setApplyVerticalSafeAreaInsetsToNonscrollingContent:(BOOL)a3
{
  p_scrollViewFlags = &self->_scrollViewFlags;
  if (((((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x1000000000000000) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    [(UIScrollView *)self _systemContentInset];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    unint64_t v14 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
    uint64_t v15 = 0x1000000000000000;
    if (!v4) {
      uint64_t v15 = 0;
    }
    *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xEFFFFFFFFFFFFFFFLL | v15;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v14, 0, v7, v9, v11, v13);
  }
}

- (BOOL)_isAnimatingScrollTest
{
  double v2 = [(UIScrollView *)self scrollTestParameters];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)scrollTestParameters
{
  return self->_scrollTestParameters;
}

- (void)_updateForChangedScrollRelatedInsets
{
  [(UIScrollView *)self _adjustContentOffsetIfNecessary];
  [(UIScrollView *)self _updateUsesStaticScrollBar];
  [(UIScrollView *)self _effectiveContentInset];
  double v5 = v4;
  double v7 = v6;
  double v8 = v3;
  double x = self->_pageDecelerationTarget.x;
  accuracdouble y = self->_accuracy;
  double v12 = self->_firstPageOffset.horizontal - v11;
  if (accuracy == 1.0)
  {
    double v14 = round(v12);
    if (x < v14) {
      goto LABEL_11;
    }
    double v17 = round(v3 + self->_contentSize.width);
  }
  else
  {
    double v13 = floor(v12);
    double v14 = v13 + round(accuracy * (v12 - v13)) / accuracy;
    if (x < v14) {
      goto LABEL_11;
    }
    double v15 = v3 + self->_contentSize.width;
    double v16 = floor(v15);
    double v17 = v16 + round(accuracy * (v15 - v16)) / accuracy;
  }
  [(UIView *)self bounds];
  if (x <= v17 - v18) {
    goto LABEL_12;
  }
  double v19 = self->_accuracy;
  double v20 = v8 + self->_contentSize.width;
  if (v19 == 1.0)
  {
    double v22 = round(v20);
  }
  else
  {
    double v21 = floor(v20);
    double v22 = v21 + round(v19 * (v20 - v21)) / v19;
  }
  [(UIView *)self bounds];
  double v14 = v22 - v23;
LABEL_11:
  self->_pageDecelerationTarget.double x = v14;
LABEL_12:
  double y = self->_pageDecelerationTarget.y;
  double v25 = self->_accuracy;
  double v26 = self->_firstPageOffset.vertical - v5;
  if (v25 == 1.0)
  {
    double v28 = round(v26);
    if (y < v28) {
      goto LABEL_22;
    }
    double v31 = round(v7 + self->_contentSize.height);
  }
  else
  {
    double v27 = floor(v26);
    double v28 = v27 + round(v25 * (v26 - v27)) / v25;
    if (y < v28) {
      goto LABEL_22;
    }
    double v29 = v7 + self->_contentSize.height;
    double v30 = floor(v29);
    double v31 = v30 + round(v25 * (v29 - v30)) / v25;
  }
  [(UIView *)self bounds];
  if (y <= v31 - v32) {
    goto LABEL_23;
  }
  double v33 = self->_accuracy;
  double v34 = v7 + self->_contentSize.height;
  if (v33 == 1.0)
  {
    double v36 = round(v34);
  }
  else
  {
    double v35 = floor(v34);
    double v36 = v35 + round(v33 * (v34 - v35)) / v33;
  }
  [(UIView *)self bounds];
  double v28 = v36 - v37;
LABEL_22:
  self->_pageDecelerationTarget.double y = v28;
LABEL_23:
  [(UIScrollView *)self _notifyAdjustedContentInsetDidChange];
}

- (void)setContentSize:(CGSize)contentSize
{
  double height = contentSize.height;
  double width = contentSize.width;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  p_contentSize = &self->_contentSize;
  double v7 = self->_contentSize.width;
  double v6 = self->_contentSize.height;
  if (width == v7 && height == v6) {
    return;
  }
  BOOL v10 = v6 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v7 == *MEMORY[0x1E4F1DB30];
  p_scrollViewFlags = &self->_scrollViewFlags;
  if ((*(unsigned char *)&self->_scrollViewFlags & 1) == 0) {
    goto LABEL_41;
  }
  [(UIScrollView *)self _effectiveContentInset];
  double v13 = v12;
  double v15 = v14;
  double v89 = v16;
  double v18 = v17;
  [(UIView *)self bounds];
  double v20 = v19;
  double v90 = v21;
  [(UIScrollView *)self contentOffset];
  double v24 = v23;
  double v25 = p_contentSize->width;
  if (width != p_contentSize->width)
  {
    double v26 = v22;
    accuracdouble y = self->_accuracy;
    double v28 = self->_firstPageOffset.horizontal - v15;
    if (accuracy == 1.0)
    {
      double v30 = round(v28);
      if (v26 >= v30)
      {
        double v36 = round(v18 + v25) - v20;
        if (v30 >= v36) {
          double v36 = v30;
        }
        if (v26 > v36)
        {
          double v35 = round(width + v18);
          goto LABEL_21;
        }
      }
    }
    else
    {
      double v29 = floor(v28);
      double v30 = v29 + round(accuracy * (v28 - v29)) / accuracy;
      if (v26 >= v30)
      {
        double v31 = v18 + v25;
        double v32 = floor(v31);
        double v33 = v32 + round((v31 - v32) * accuracy) / accuracy - v20;
        if (v30 >= v33) {
          double v33 = v30;
        }
        if (v26 > v33)
        {
          double v34 = floor(width + v18);
          double v35 = v34 + round((width + v18 - v34) * accuracy) / accuracy;
LABEL_21:
          double v37 = v35 - v20;
          if (v30 < v37) {
            double v30 = v37;
          }
          if (v26 <= v30)
          {
            [(UIScrollViewPanGestureRecognizer *)self->_pan translationInView:self];
            self->_startOffsetX = v26 + v38;
          }
        }
      }
    }
  }
  double v39 = p_contentSize->height;
  if (height != v39)
  {
    double v40 = self->_accuracy;
    double v41 = self->_firstPageOffset.vertical - v13;
    if (v40 == 1.0)
    {
      double v43 = round(v41);
      if (v24 < v43) {
        goto LABEL_41;
      }
      double v49 = round(v89 + v39) - v90;
      if (v43 >= v49) {
        double v49 = v43;
      }
      if (v24 <= v49) {
        goto LABEL_41;
      }
      double v48 = round(height + v89);
    }
    else
    {
      double v42 = floor(v41);
      double v43 = v42 + round(v40 * (v41 - v42)) / v40;
      if (v24 < v43) {
        goto LABEL_41;
      }
      double v44 = v89 + v39;
      double v45 = floor(v44);
      double v46 = v45 + round((v44 - v45) * v40) / v40 - v90;
      if (v43 >= v46) {
        double v46 = v43;
      }
      if (v24 <= v46) {
        goto LABEL_41;
      }
      double v47 = floor(height + v89);
      double v48 = v47 + round((height + v89 - v47) * v40) / v40;
    }
    double v50 = v48 - v90;
    if (v43 < v50) {
      double v43 = v50;
    }
    if (v24 <= v43)
    {
      [(UIScrollViewPanGestureRecognizer *)self->_pan translationInView:self];
      self->_startOffsetY = v24 + v51;
    }
  }
LABEL_41:
  if ([(UIScrollView *)self _effectiveShouldPreventFocusScrollPastContentSize])
  {
    float64x2_t v52 = [(UIView *)self _focusSystem];
    if (v52)
    {
      float64x2_t v53 = +[_UIFocusSystemSceneComponent sceneComponentForFocusSystem:v52];
      float64x2_t v54 = [v53 scrollManager];
      if ([v54 isScrollingScrollableContainer:self])
      {
        [v54 targetContentOffsetForScrollableContainer:self];
        double v56 = v55;
        double v58 = v57;
        -[UIScrollView _maximumContentOffsetForContentSize:](self, "_maximumContentOffsetForContentSize:", width, height);
        if (v60 < v56 || v59 < v58) {
          [v54 cancelScrollingForScrollableContainer:self];
        }
      }
    }
  }
  [(UIScrollView *)self _systemContentInset];
  double v63 = v62;
  double v65 = v64;
  double v67 = v66;
  double v69 = v68;
  unint64_t v70 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
  double v72 = p_contentSize->width;
  double v71 = p_contentSize->height;
  p_contentSize->double width = width;
  p_contentSize->double height = height;
  [(UIScrollView *)self _adjustContentOffsetIfNecessary];
  [(UIScrollView *)self _setNeedsUsesStaticScrollBarUpdate];
  [(UIScrollView *)self _updateGradientMaskView];
  if (v10)
  {
    if (self->_verticalScrollIndicator) {
      -[UIView bringSubviewToFront:](self, "bringSubviewToFront:");
    }
    if (self->_horizontalScrollIndicator) {
      -[UIView bringSubviewToFront:](self, "bringSubviewToFront:");
    }
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v73 = [(NSMutableDictionary *)self->_accessoryViews objectEnumerator];
    uint64_t v74 = [v73 countByEnumeratingWithState:&v91 objects:v95 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v75; ++i)
        {
          if (*(void *)v92 != v76) {
            objc_enumerationMutation(v73);
          }
          [(UIView *)self bringSubviewToFront:*(void *)(*((void *)&v91 + 1) + 8 * i)];
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v91 objects:v95 count:16];
      }
      while (v75);
    }

    if (self->_shadows)
    {
      for (uint64_t j = 0; j != 10; ++j)
        [(UIView *)self sendSubviewToBack:self->_shadows[j]];
    }
  }
  -[UIScrollView _old_updateAutomaticContentSizeConstraintsIfNecessaryWithContentSize:](self, "_old_updateAutomaticContentSizeConstraintsIfNecessaryWithContentSize:", width, height);
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
  {
    if ([(UIScrollView *)self _shouldScrollToContentBeginningInRightToLeft])
    {
      if ((*(void *)((char *)p_scrollViewFlags + 12) & 0x200000000000000) == 0
        || ([(UIScrollView *)self contentOffset],
            double v80 = v79,
            [(UIView *)self frame],
            v80 == v72 - v81))
      {
        double v82 = p_contentSize->width;
        [(UIView *)self frame];
        double v84 = v82 - v83;
        [(UIScrollView *)self contentOffset];
        double v86 = v85;
        if (dyld_program_sdk_at_least())
        {
          [(UIScrollView *)self _effectiveContentInset];
          double v84 = v84 + v87;
        }
        -[UIScrollView setContentOffset:](self, "setContentOffset:", v84, v86);
      }
    }
  }
  -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v70, 1, v63, v65, v67, v69);
  if ((*(void *)((char *)p_scrollViewFlags + 12) & 0x800000) != 0)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained scrollViewDidChangeContentSize:self];
  }
  if (v71 != p_contentSize->height) {
    [(UIScrollView *)self _sendGeometryAffectingContentBottomChangedToScrollObservers];
  }
  *(void *)((char *)p_scrollViewFlags + 12) |= 0x200000000000000uLL;
  [(UIScrollView *)self _updateLayoutMarginsGuideConstraintsIfNecessary];
}

- (void)_setAdjustsTargetsOnContentOffsetChanges:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (void)_updateLayoutMarginsGuideConstraintsIfNecessary
{
  v17.receiver = self;
  v17.super_class = (Class)UIScrollView;
  [(UIView *)&v17 _updateLayoutMarginsGuideConstraintsIfNecessary];
  uint64_t v3 = [(UIScrollView *)self _contentMarginsGuideIfExists];
  if (v3)
  {
    [(UIView *)self layoutMargins];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = [v3 _systemConstraints];
    double v13 = [v12 objectAtIndexedSubscript:0];
    [v13 setConstant:v5];

    double v14 = [v12 objectAtIndexedSubscript:1];
    [v14 setConstant:v7];

    double v15 = [v12 objectAtIndexedSubscript:2];
    [v15 setConstant:v9];

    double v16 = [v12 objectAtIndexedSubscript:3];
    [v16 setConstant:v11];
  }
}

- (id)_contentMarginsGuideIfExists
{
  return self->_contentMarginsGuide;
}

- (void)_scrollViewDidLayoutSubviews
{
  if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x2000000) != 0) {
    [(UIScrollView *)self _updateUsesStaticScrollBar];
  }
  [(UIScrollView *)self _updateGradientMaskView];
  layoutObserver = self->_layoutObserver;
  [(_UIScrollViewLayoutObserver *)layoutObserver _scrollViewDidLayoutSubviews:self];
}

- (void)_updateGradientMaskView
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x2000000000000) != 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v4 = 0u;
    long long v5 = 0u;
    [(UIScrollView *)self _getGradientMaskBounds:&v4 startInsets:&v10 endInsets:&v8 intensities:&v6];
    uint64_t v3 = -[UIView _safeMaskView](self);
    objc_msgSend(v3, "updateWithFrame:gradientStartInsets:gradientEndInsets:gradientIntensities:", v4, v5, v10, v11, v8, v9, v6, v7);
  }
}

- (void)_stopScrollingNotify:(BOOL)a3 pin:(BOOL)a4 tramplingAnimationDependentFlags:(BOOL)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  self->_verticalVelocitdouble y = 0.0;
  self->_horizontalVelocitdouble y = 0.0;
  if (a5)
  {
    p_scrollViewFlags = &self->_scrollViewFlags;
    *(void *)&self->_scrollViewFlags &= 0xFFFFFFFFFF7FFFFDLL;
    [(UIScrollView *)self _didEndDirectManipulationWithScrubbingDirection:((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 11) & 0xF];
    unsigned int v9 = *((_DWORD *)p_scrollViewFlags + 5) & 0xFFFF87FF;
    *(void *)((char *)p_scrollViewFlags + 12) &= 0xFFFFFFFFFFFFFC3FLL;
    *((_DWORD *)p_scrollViewFlags + 5) = v9;
  }
  *(void *)&self->_scrollViewFlags &= 0xFFFFFFFFFFFFFFCFLL;
  self->_fastScrollCount = 0;
  self->_fastScrollMultiplier = 1.0;
  [(UIScrollView *)self _commitScrollBounceStatisticsTrackingState];
  [(UIScrollView *)self _clearScrollBounceStatisticsTrackingState];
  if (v5)
  {
    if ([(UIScrollView *)self isPagingEnabled])
    {
      [(UIView *)self bounds];
      if (!-[UIScrollView _contentOffsetIsAtPagingBoundary:](self, "_contentOffsetIsAtPagingBoundary:"))
      {
        if (!self->_scrollHeartbeat) {
          [(UIScrollView *)self _prepareToPageWithHorizontalVelocity:0.0 verticalVelocity:0.0];
        }
        -[UIScrollView setContentOffset:](self, "setContentOffset:", self->_pageDecelerationTarget.x, self->_pageDecelerationTarget.y);
      }
    }
    [(UIScrollView *)self _adjustContentOffsetIfNecessary];
    *(void *)((char *)&self->_scrollViewFlags + 12) &= ~0x10000000000uLL;
  }
  if (self->_scrollHeartbeat)
  {
    [(UIScrollView *)self _stopScrollDecelerationNotify:v6];
  }
  else
  {
    [(UIScrollView *)self _popTrackingRunLoopModeIfNecessaryForReason:@"stopScrollingNotify called without timer"];
  }
}

- (void)setScrollEnabled:(BOOL)scrollEnabled
{
  BOOL v3 = scrollEnabled;
  BOOL v5 = [(UIScrollView *)self _scrollViewTouchDelayGesture];
  [v5 setEnabled:v3];

  [(UIScrollView *)self _systemContentInset];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  unint64_t v14 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
  uint64_t v15 = 0x100000;
  if (v3) {
    uint64_t v15 = 0;
  }
  *(void *)&self->_scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFEFFFFFLL | v15;
  [(UIScrollView *)self _updateScrollGestureRecognizersEnabled];
  [(UIScrollView *)self _updateUsesStaticScrollBar];
  -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v14, 0, v7, v9, v11, v13);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(UIScrollView *)self _systemContentInset];
  double v41 = v17;
  double v42 = v16;
  double v39 = v19;
  double v40 = v18;
  unint64_t v20 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
  v43.receiver = self;
  v43.super_class = (Class)UIScrollView;
  -[UIView setFrame:](&v43, sel_setFrame_, x, y, width, height);
  if (v13 != width || v15 != height)
  {
    double v37 = v11;
    double v38 = v9;
    if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x400000) != 0)
    {
      [(UIScrollView *)self contentSize];
      double v35 = v22;
      double v36 = v23;
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      [(UIScrollView *)self zoomScale];
      objc_msgSend(WeakRetained, "scrollView:contentSizeForZoomScale:withProposedSize:", self);
      double v26 = v25;
      double v28 = v27;

      if (v35 != v26 || v36 != v28) {
        -[UIScrollView setContentSize:](self, "setContentSize:", v26, v28);
      }
    }
    [(UIView *)self bounds];
    double v31 = v30 * -0.000000184659091 + 0.000359090909;
    if (v30 > 1024.0) {
      double v31 = 0.00017;
    }
    self->_pagingSpringPull = v31;
    [(UIView *)self bounds];
    double v33 = v32 * 0.00000994318182 + 0.966818182;
    if (v32 > 1024.0) {
      double v33 = 0.977;
    }
    self->_pagingFriction = v33;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v20, 0, v42, v41, v40, v39);
    CGFloat v11 = v37;
    CGFloat v9 = v38;
  }
  [(UIScrollView *)self _adjustContentOffsetIfNecessary];
  [(UIScrollView *)self _updateUsesStaticScrollBar];
  v44.origin.double x = v9;
  v44.origin.double y = v11;
  v44.size.double width = v13;
  v44.size.double height = v15;
  double MaxY = CGRectGetMaxY(v44);
  v45.origin.double x = x;
  v45.origin.double y = y;
  v45.size.double width = width;
  v45.size.double height = height;
  if (MaxY != CGRectGetMaxY(v45)) {
    [(UIScrollView *)self _sendGeometryAffectingContentBottomChangedToScrollObservers];
  }
}

- (void)_updateContentFitDisableScrolling
{
  if ([(UIScrollView *)self _canScrollX])
  {
    unsigned int v3 = 0;
  }
  else if ([(UIScrollView *)self _canScrollY])
  {
    unsigned int v3 = 0;
  }
  else
  {
    unsigned int v3 = ~(*(_DWORD *)&self->_scrollViewFlags >> 26) & 0x10;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)_canScrollX
{
  if ([(UIScrollView *)self _canScrollIgnoringAncestorPermissionX]) {
    LOBYTE(v3) = 1;
  }
  else {
    return (*((unsigned __int8 *)&self->_scrollViewFlags + 1) >> 4) & 1;
  }
  return v3;
}

- (BOOL)_canScrollIgnoringAncestorPermissionX
{
  if ([(UIScrollView *)self _canScrollWithoutBouncingX])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(UIScrollView *)self alwaysBounceHorizontal];
    if (v3) {
      return (*(unsigned char *)&self->_scrollViewFlags >> 3) & 1;
    }
  }
  return v3;
}

- (void)_setUsesStaticScrollBar:(BOOL)a3
{
  staticScrollBar = self->_staticScrollBar;
  if (a3)
  {
    if (staticScrollBar) {
      return;
    }
    BOOL v5 = [(UIScrollView *)self _createStaticScrollBar];
    double v6 = self->_staticScrollBar;
    self->_staticScrollBar = v5;

    [(UIScrollView *)self setAccessoryView:self->_staticScrollBar atEdge:[(_UIStaticScrollBar *)self->_staticScrollBar desiredAccessoryEdge]];
  }
  else
  {
    if (!staticScrollBar) {
      return;
    }
    [(UIScrollView *)self setAccessoryView:0 atEdge:[(_UIStaticScrollBar *)staticScrollBar edge]];
    double v7 = self->_staticScrollBar;
    self->_staticScrollBar = 0;
  }
  -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](self, 3, 0);
}

- (void)_updateUsesStaticScrollBar
{
  *((_DWORD *)&self->_scrollViewFlags + 5) &= ~0x2000000u;
  BOOL v3 = [(UIScrollView *)self _shouldUseStaticScrollBar];
  [(UIScrollView *)self _setUsesStaticScrollBar:v3];
}

- (BOOL)_canScrollY
{
  if ([(UIScrollView *)self _canScrollIgnoringAncestorPermissionY]) {
    LOBYTE(v3) = 1;
  }
  else {
    return (*((unsigned __int8 *)&self->_scrollViewFlags + 1) >> 5) & 1;
  }
  return v3;
}

- (BOOL)_canScrollIgnoringAncestorPermissionY
{
  if ([(UIScrollView *)self _canScrollWithoutBouncingY])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(UIScrollView *)self alwaysBounceVertical];
    if (v3) {
      return (*(unsigned char *)&self->_scrollViewFlags >> 2) & 1;
    }
  }
  return v3;
}

- (BOOL)_canScrollWithoutBouncingY
{
  return [(UIScrollView *)self __canScrollWithoutBouncingYIncludingAdditionalContentInsetAmount:0.0];
}

- (id)_scrollViewTouchDelayGesture
{
  return self->_touchDelayGestureRecognizer;
}

- (BOOL)isPagingEnabled
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 5) & 1;
}

- (void)_commitScrollBounceStatisticsTrackingState
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x100000000000000) != 0)
  {
    id v2 = +[_UIStatistics scrollBounceCount];
    [v2 incrementValueBy:1];
  }
}

- (void)_clearScrollBounceStatisticsTrackingState
{
  *(void *)((char *)&self->_scrollViewFlags + 12) &= ~0x100000000000000uLL;
}

- (void)_didEndDirectManipulationWithScrubbingDirection:(int64_t)a3
{
  unint64_t v4 = a3 - 1;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    BOOL v5 = &OBJC_IVAR___UIScrollView__horizontalScrollIndicator;
    double startOffsetX = self->_startOffsetX;
    [(UIScrollView *)self contentOffset];
    double v8 = vabdd_f64(startOffsetX, v10);
    if (v4 > 1) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v5 = &OBJC_IVAR___UIScrollView__verticalScrollIndicator;
  double startOffsetY = self->_startOffsetY;
  [(UIScrollView *)self contentOffset];
  double v8 = vabdd_f64(startOffsetY, v7);
  if (v4 < 2) {
LABEL_5:
  }
    [*(id *)((char *)&self->super.super.super.isa + *v5) setExpandedForDirectManipulation:0];
LABEL_6:
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (v11 - self->_knobInteractionBeginTime < 0.1 && v8 < 10.0) {
    [(UIScrollView *)self _setKnobInteractionGestureDelayed:1];
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) &= 0xFFFF87FF;
  if ([(UIFeedbackGeneratorUserInteractionDriven *)self->_knobFeedbackGenerator isActive])
  {
    knobFeedbackGenerator = self->_knobFeedbackGenerator;
    [(UIFeedbackGeneratorUserInteractionDriven *)knobFeedbackGenerator userInteractionEnded];
  }
}

- (BOOL)_adjustsTargetsOnContentOffsetChanges
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 45) & 1;
}

- (void)_old_updateAutomaticContentSizeConstraintsIfNecessaryWithContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v6 = [(UIView *)self superview];
    double v7 = (void *)v6;
    if (v6)
    {
      if ((*(void *)(v6 + 96) & 0x1000000000000000) == 0
        && (*(void *)&self->super._viewFlags & 0x800000000000000) != 0)
      {
        double v13 = (void *)v6;
        BOOL v8 = [(UIScrollView *)self _wantsConstrainedContentSize];
        double v7 = v13;
        if (!v8)
        {
          CGFloat v9 = [(UIScrollView *)self _automaticContentConstraints];
          double v10 = v9;
          if (v9)
          {
            double v11 = [v9 objectAtIndex:0];
            double v12 = [v10 objectAtIndex:1];
            [v11 setConstant:width];
            [v12 setConstant:height];
          }
          else
          {
            double v11 = [(UIScrollView *)self _constraintsFromContentSize];
            [(UIScrollView *)self _setAutomaticContentConstraints:v11];
          }

          double v7 = v13;
        }
      }
    }
  }
}

- (void)_setNeedsUsesStaticScrollBarUpdate
{
  BOOL v3 = self->_staticScrollBar == 0;
  if (((v3 ^ [(UIScrollView *)self _shouldUseStaticScrollBar]) & 1) == 0)
  {
    *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x2000000u;
    [(UIScrollView *)self setNeedsLayout];
  }
}

- (BOOL)_effectiveShouldPreventFocusScrollPastContentSize
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x4000000000000 | *((_DWORD *)&self->_scrollViewFlags + 5) & 0x8000000) != 0;
}

- (void)_notifyAlignedContentMarginChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__UIScrollView__notifyAlignedContentMarginChanged__block_invoke;
  v2[3] = &unk_1E530F458;
  v2[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v2);
}

- (void)_sendGeometryAffectingContentBottomChangedToScrollObservers
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __75__UIScrollView__sendGeometryAffectingContentBottomChangedToScrollObservers__block_invoke;
  v2[3] = &unk_1E530F458;
  v2[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v2);
}

- (void)_enumerateAllScrollObserversWithBlock:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = *(id *)(a1 + 928);
    char v13 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(uint64_t, void, char *))(a2 + 16))(a2, *(void *)(*((void *)&v9 + 1) + 8 * v8), &v13);
        if (v13) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

uint64_t __50__UIScrollView__notifyAlignedContentMarginChanged__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 _observeScrollViewAlignedContentMarginDidChange:v5];
  }
  return result;
}

uint64_t __75__UIScrollView__sendGeometryAffectingContentBottomChangedToScrollObservers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 _observeScrollViewGeometryAffectingContentBottomDidChange:v5];
  }
  return result;
}

void __32__UIScrollView__notifyDidScroll__block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    [a2 _observeScrollViewDidScroll:*(void *)(a1 + 32)];
  }
  id v4 = a2;
  if (objc_opt_respondsToSelector()) {
    [v4 _didScroll];
  }
}

void __58__UIScrollView__observerImplementingWillEndDraggingMethod__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if (objc_opt_respondsToSelector())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

double __79__UIScrollView__revealableContentPaddingIncludingContentWithCollapsedAffinity___block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector())
  {
    [a2 _revealableContentPaddingForObservedScrollView:*(void *)(a1 + 32) includeContentWithCollapsedAffinity:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v5 = *(double **)(*(void *)(a1 + 40) + 8);
    double result = v6 + v5[4];
    double v8 = v7 + v5[5];
    double v10 = v9 + v5[6];
    double v12 = v11 + v5[7];
    v5[4] = result;
    v5[5] = v8;
    v5[6] = v10;
    v5[7] = v12;
  }
  return result;
}

- (void)flashScrollIndicators
{
}

- (void)_flashScrollIndicatorsForAxes:(unint64_t)a3 persistingPreviousFlashes:(BOOL)a4
{
  unsigned int v5 = a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  int v7 = a3 & -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self);
  int v8 = -[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)self) & (v5 >> 1);
  if (((v7 & 1) != 0 || v8) && (*((unsigned char *)&self->_scrollViewFlags + 2) & 0x10) == 0)
  {
    double v9 = [(UIView *)self superview];
    if (v9)
    {
      while (1)
      {
        id v16 = v9;
        if (![v9 _shouldEnclosedScrollViewFlashIndicators:self]) {
          break;
        }
        uint64_t v10 = [v16 superview];

        double v9 = (void *)v10;
        if (!v10) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__hideScrollIndicators object:0];
      *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFFFCLL | (*(void *)((char *)&self->_scrollViewFlags + 12) | v5) & 3;
      [(UIScrollView *)self _adjustScrollerIndicators:1 alwaysShowingThem:0];
      double v11 = 1.0;
      double v12 = 1.0;
      if (!a4)
      {
        [(UIView *)self->_horizontalScrollIndicator alpha];
        double v12 = v13;
        [(UIView *)self->_verticalScrollIndicator alpha];
        double v11 = v14;
        if (v7) {
          [(UIView *)self->_horizontalScrollIndicator setAlpha:0.0];
        }
        if (v8) {
          [(UIView *)self->_verticalScrollIndicator setAlpha:0.0];
        }
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__UIScrollView__flashScrollIndicatorsForAxes_persistingPreviousFlashes___block_invoke;
      v17[3] = &unk_1E530F408;
      char v18 = v7;
      v17[4] = self;
      char v19 = v8;
      *(double *)&void v17[5] = v12;
      *(double *)&v17[6] = v11;
      +[UIView animateWithDuration:v17 animations:0.5];
      v20[0] = *MEMORY[0x1E4F1C4B0];
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [(UIScrollView *)self performSelector:sel__hideScrollIndicators withObject:0 afterDelay:v15 inModes:1.0];

      *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x400000u;
    }
  }
}

- (void)_adjustContentOffsetIfNecessary
{
  [(UIScrollView *)self contentOffset];
  -[UIScrollView _adjustedContentOffsetForContentOffset:skipsAdjustmentIfScrolling:](self, "_adjustedContentOffsetForContentOffset:skipsAdjustmentIfScrolling:", [(UIScrollView *)self _skipsContentOffsetAdjustmentsIfScrolling], v3, v4);
  -[UIScrollView _applyAutomaticAdjustedContentOffset:](self, "_applyAutomaticAdjustedContentOffset:");
  [(UIScrollView *)self _adjustShadowsIfNecessary];
  [(UIScrollView *)self _updateContentFitDisableScrolling];
}

- (void)setContentOffset:(CGPoint)contentOffset
{
  double y = contentOffset.y;
  double x = contentOffset.x;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  p_scrollViewFlags = &self->_scrollViewFlags;
  uint64_t v7 = *(void *)((char *)&self->_scrollViewFlags + 12);
  *(void *)((char *)&self->_scrollViewFlags + 12) = v7 | 0x40000000000000;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  -[UIScrollView _roundedProposedContentOffset:](self, "_roundedProposedContentOffset:", x, y);
  if ((*((unsigned char *)p_scrollViewFlags + 2) & 8) == 0)
  {
    CGFloat v18 = v16;
    CGFloat v19 = v17;
    if (v9 != v16 || v11 != v17)
    {
      double v59 = v9;
      double v60 = v11;
      double v21 = vabdd_f64(v16, v9);
      double v22 = vabdd_f64(v17, v11);
      double v23 = self;
      if (v21 >= 2.22044605e-16 || v22 >= 2.22044605e-16)
      {
        double v25 = _UIMainBundleIdentifier();
        if (v25)
        {
          CFTimeInterval v26 = CACurrentMediaTime();
          double telemetryOffsetChangeTime = v23->_telemetryOffsetChangeTime;
          v23->_double telemetryOffsetChangeTime = v26;
          ++v23->_telemetryOffsetChangeCount;
          double v28 = v26 - telemetryOffsetChangeTime;
          CGFloat v29 = v22 + v23->_telemetryOffsetChange.height;
          v23->_telemetryOffsetChange.double width = v21 + v23->_telemetryOffsetChange.width;
          v23->_telemetryOffsetChange.double height = v29;
          if (v28 < 0.018) {
            v23->_telemetryOffsetChangeHighRateDuration = v28 + v23->_telemetryOffsetChangeHighRateDuration;
          }
          double v57 = v28;
          if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ScrollViewOffsetChangeLogging, @"ScrollViewOffsetChangeLogging", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1EB2579F4)
          {
            v65[0] = MEMORY[0x1E4F143A8];
            v65[1] = 3221225472;
            double v66 = ___telemetryReportOffsetChange_block_invoke;
            double v67 = &unk_1E5307FB8;
            double v68 = v23;
            double v69 = v25;
            double v70 = v57;
            double v71 = v21;
            double v72 = v22;
            double v31 = v65;
            uint32_t v32 = _telemetryDownsample_sample;
            if (!_telemetryDownsample_sample) {
              uint32_t v32 = arc4random_uniform(0x80u) + 1;
            }
            _telemetryDownsample_sample = v32 + 1;
            if (v32 >= 0x80)
            {
              ((void (*)(void *))v66)(v31);
              _telemetryDownsample_sample = 1;
            }
          }
          else
          {
            id v30 = _telemetryOffsetChangeEvent(v23, v25, 1, v57, v21, v22);
          }
        }
      }
      double v33 = (void *)MEMORY[0x18C108260]();
      v23->_lastSetContentOffsetUnrounded.double x = x;
      v23->_lastSetContentOffsetUnrounded.double y = y;
      double v34 = [(UIView *)v23 layer];
      double v35 = [v34 superlayer];

      uint64_t v36 = [v35 needsLayoutOnGeometryChange];
      [v35 setNeedsLayoutOnGeometryChange:0];
      -[_UIScrollViewVFD updateBounds:scale:]((unint64_t)v23->_vfd, v18, v19, v13, v15, v23->_accuracy);
      -[UIScrollView setBounds:](v23, "setBounds:", v18, v19, v13, v15);
      double v37 = [(UIScrollView *)v23 _layoutGuideOfType:2 createIfNecessary:0];
      double v38 = v37;
      if (v37)
      {
        unsigned int v54 = v36;
        double v56 = v35;
        uint64_t v58 = v7;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        double v55 = v37;
        double v39 = [v37 _systemConstraints];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v62 != v42) {
                objc_enumerationMutation(v39);
              }
              CGRect v44 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              CGRect v45 = [v44 identifier];
              double v46 = v45;
              double v47 = v18;
              if (v45 == @"UIScrollView-contentOffsetLayoutGuide-xOffset"
                || (double v47 = v19, v45 == @"UIScrollView-contentOffsetLayoutGuide-yOffset"))
              {
                [v44 setConstant:v47];
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v61 objects:v73 count:16];
          }
          while (v41);
        }

        uint64_t v7 = v58;
        double v38 = v55;
        double v35 = v56;
        uint64_t v36 = v54;
      }
      [v35 setNeedsLayoutOnGeometryChange:v36];
      [(UIScrollView *)v23 _notifyDidScroll];
      [(_UIScrollViewScrollingAnimator *)v23->_keyboardScrollingAnimator cancelInteractiveScroll];
      unint64_t v48 = *(void *)((char *)p_scrollViewFlags + 12);
      if ((v48 & 0x10000) != 0
        || -[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)v23)
        || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)v23))
      {
        [(UIScrollView *)v23 _adjustScrollerIndicators:1 alwaysShowingThem:(v48 >> 16) & 1];
      }
      if (p_scrollViewFlags->shouldRevealScrollIndicators)
      {
        if (v19 == v60) {
          uint64_t v49 = v18 != v59;
        }
        else {
          uint64_t v49 = (v18 != v59) | 2;
        }
        [(UIScrollView *)v23 _flashScrollIndicatorsForAxes:v49 persistingPreviousFlashes:1];
      }
      [(UIScrollView *)v23 _updateAccessories];
      if (v23->_shadows) {
        [(UIScrollView *)v23 _adjustBackgroundShadowsForContentSizeForcedVisible:0];
      }
      double v50 = [(UIView *)v23 _focusSystem];
      if (v50)
      {
        double v51 = [(UIView *)v23 _window];
        char v52 = [v51 _isTextEffectsWindow];

        if ((v52 & 1) == 0)
        {
          float64x2_t v53 = [v50 _focusMovementCache];
          [v53 scrollableContainerDidScroll:v23];
        }
      }
    }
  }
  *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFBFFFFFFFF7FFFFLL | v7 & 0x40000000000000;
}

- (CGPoint)_roundedProposedContentOffset:(CGPoint)result
{
  CGFloat x = result.x;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x3000000000) == 0)
  {
    uint64_t v4 = *(uint64_t *)&self->_accuracy;
    if (fabs(*(double *)&v4) >= 2.22044605e-16)
    {
      if (*(double *)&v4 == 1.0)
      {
        *(CGPoint *)&result.double y = (CGPoint)vrndaq_f64(*(float64x2_t *)&result.y);
      }
      else
      {
        float64x2_t v5 = vrndmq_f64(*(float64x2_t *)&result.y);
        *(CGPoint *)&result.double y = (CGPoint)vaddq_f64(v5, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(*(float64x2_t *)&result.y, v5), *(double *)&v4)), (float64x2_t)vdupq_lane_s64(v4, 0)));
      }
    }
  }
  double v7 = v6;
  result.CGFloat x = v7;
  return result;
}

- (void)_applyAutomaticAdjustedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(UIScrollView *)self isAutomaticContentOffsetAdjustmentsAnimated])
  {
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, x, y);
  }
  else
  {
    -[UIScrollView setContentOffset:](self, "setContentOffset:", x, y);
  }
}

- (BOOL)isAutomaticContentOffsetAdjustmentsAnimated
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 18) & 1;
}

- (BOOL)_skipsContentOffsetAdjustmentsIfScrolling
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 46) & 1;
}

- (void)_adjustShadowsIfNecessary
{
  if (self->_shadows) {
    [(UIScrollView *)self _adjustBackgroundShadowsForContentSizeForcedVisible:0];
  }
}

- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3 skipsAdjustmentIfScrolling:(BOOL)a4
{
  -[UIScrollView _adjustedContentOffsetForContentOffset:contentSize:skipsAdjustmentIfScrolling:](self, "_adjustedContentOffsetForContentOffset:contentSize:skipsAdjustmentIfScrolling:", a4, a3.x, a3.y, self->_contentSize.width, self->_contentSize.height);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (BOOL)_subviewPreventsSkipLayout:(id)a3
{
  double v4 = (_UIScrollViewScrollIndicator *)a3;
  double v5 = v4;
  if (self->_horizontalScrollIndicator == v4 || self->_verticalScrollIndicator == v4)
  {
    BOOL v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIScrollView;
    BOOL v6 = [(UIView *)&v8 _subviewPreventsSkipLayout:v4];
  }

  return v6;
}

- (UIView)_verticalScrollIndicator
{
  return (UIView *)self->_verticalScrollIndicator;
}

- (UIView)_horizontalScrollIndicator
{
  return (UIView *)self->_horizontalScrollIndicator;
}

- (UIScrollView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)UIScrollView;
  double v3 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    _UIScrollViewSharedInit(v3);
    [(UIView *)v4 setClipsToBounds:1];
    *(void *)&v4->_scrollViewFlags |= 0x4CuLL;
    double v5 = +[UIDevice currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    uint64_t v7 = 0x2000000;
    if (v6 == 2 || v6 == 4) {
      uint64_t v7 = 0;
    }
    uint64_t v8 = 393216;
    if (v6 != 2 && v6 != 4) {
      uint64_t v8 = 17170432;
    }
    *(void *)&v4->_scrollViewFlags = v8 | v7 | *(void *)&v4->_scrollViewFlags & 0xFFFFFFFFF0F9FFFFLL;
    if (![(id)objc_opt_class() _defaultEdgesScrollingContentIntoSafeArea]) {
      v4->_unint64_t contentInsetAdjustmentBehavior = 101;
    }
    v4->_contentOffsetAnimationDuration = 0.3;
    [(UIView *)v4 setMultipleTouchEnabled:1];
    v4->_minimumZoomScale = 1.0;
    v4->_maximumZoomScale = 1.0;
    v4->_decelerationFactor = (CGSize)vdupq_n_s64(0x3FEFEF9DB22D0E56uLL);
    v4->_fastScrollMultiplier = 1.0;
    [(UIView *)v4 bounds];
    double v10 = v9 * -0.000000184659091 + 0.000359090909;
    if (v9 > 1024.0) {
      double v10 = 0.00017;
    }
    v4->_pagingSpringPull = v10;
    [(UIView *)v4 bounds];
    double v12 = v11 * 0.00000994318182 + 0.966818182;
    if (v11 > 1024.0) {
      double v12 = 0.977;
    }
    v4->_pagingFriction = v12;
    [(UIView *)v4 _currentScreenScale];
    v4->_accuracdouble y = v13;
    v4->_savedKeyboardAdjustmentDelta = 0.0;
    [(UIScrollView *)v4 _createGestureRecognizersForCurrentTouchLevel];
  }
  return v4;
}

+ (unint64_t)_defaultEdgesScrollingContentIntoSafeArea
{
  if (_scrollViewConvertSafeAreaToContentInset_onceToken != -1) {
    dispatch_once(&_scrollViewConvertSafeAreaToContentInset_onceToken, &__block_literal_global_1897_0);
  }
  if (_scrollViewConvertSafeAreaToContentInset_convert) {
    return 15;
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldAdjustLayoutToCollapseTopSpacing
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 16) & 1;
}

- (id)_relativePanView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relativePanView);
  return WeakRetained;
}

- (double)_horizontalScrollIndicatorHeight
{
  id v2 = [(UIView *)self traitCollection];
  double v3 = +[_UIScrollViewScrollIndicator visualStyleForTraitCollection:v2];
  [v3 staticDimensionSize];
  double v5 = v4;

  return v5;
}

- (double)_verticalScrollIndicatorWidth
{
  id v2 = [(UIView *)self traitCollection];
  double v3 = +[_UIScrollViewScrollIndicator visualStyleForTraitCollection:v2];
  [v3 staticDimensionSize];
  double v5 = v4;

  return v5;
}

- (int64_t)_effectiveIndicatorStyle
{
  int64_t v2 = (*(void *)&self->_scrollViewFlags >> 28) & 3;
  if (!v2)
  {
    double v3 = [(UIView *)self traitCollection];
    BOOL v4 = [v3 userInterfaceStyle] == 2;

    return 2 * v4;
  }
  return v2;
}

- (void)setNeedsLayout
{
  uint64_t v2 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if ((v2 & 0x40000000000000) == 0)
  {
    int v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(void *)((char *)&self->_scrollViewFlags + 12) = v2 & 0xFF7FFFFFFFFFFFFFLL;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v3;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIScrollView;
  [(UIView *)&v4 setNeedsLayout];
}

- (void)_faultInContentOffsetGuide
{
  id v2 = [(UIScrollView *)self _layoutGuideOfType:2 createIfNecessary:1];
}

- (void)nsis_valueOfVariable:(id)a3 didChangeInEngine:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!dyld_program_sdk_at_least()) {
    goto LABEL_4;
  }
  uint64_t v8 = [(UIScrollView *)self _contentHeightVariable];
  if ((id)v8 == v6)
  {
  }
  else
  {
    double v9 = (void *)v8;
    id v10 = [(UIScrollView *)self _contentWidthVariable];

    if (v10 != v6)
    {
LABEL_4:
      v15.receiver = self;
      v15.super_class = (Class)UIScrollView;
      [(UIView *)&v15 nsis_valueOfVariable:v6 didChangeInEngine:v7];
      double v11 = [(UIScrollView *)self _frameLayoutGuideIfExists];
      [v11 _invalidateLayoutFrame];

      goto LABEL_11;
    }
  }
  id v12 = [(UIView *)self _layoutEngine];
  if (v12 == v7)
  {
    BOOL v13 = [(UIScrollView *)self _evaluateWantsConstrainedContentSize];

    if (v13)
    {
      *(void *)((char *)&self->_scrollViewFlags + 12) |= 0x40000000000uLL;
      double v14 = [(UIScrollView *)self _contentLayoutGuideIfExists];
      [v14 _invalidateLayoutFrame];

      if ((*(void *)&self->super._viewFlags & 0x8000000000000000) == 0) {
        [(UIScrollView *)self setNeedsLayout];
      }
    }
  }
  else
  {
  }
LABEL_11:
}

- (CGRect)_layoutGuide:(id)a3 adjustedLayoutFrameForFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  uint64_t v10 = [(UIScrollView *)self _contentLayoutGuideIfExists];
  if ((id)v10 == v9)
  {
  }
  else
  {
    double v11 = (void *)v10;
    id v12 = [(UIScrollView *)self _contentMarginsGuideIfExists];

    if (v12 != v9)
    {
      [(UIScrollView *)self contentOffset];
      double x = x + v13;
      double y = y + v14;
    }
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)_layoutGuideOfType:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = self;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 2)
  {
    id v7 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    id v7 = off_1E530F6F8[a3];
    id v8 = *(id *)((char *)&self->super.super.super.isa + *off_1E530F6C8[a3]);
    uint64_t v9 = objc_opt_class();
    if (v8) {
      goto LABEL_36;
    }
    uint64_t v10 = (objc_class *)v9;
  }
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  long long v62 = __53__UIScrollView__layoutGuideOfType_createIfNecessary___block_invoke;
  long long v63 = &unk_1E530F590;
  long long v64 = v6;
  double v65 = v7;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  double v11 = [(UIView *)v6 layoutGuides];
  id v8 = (id)[v11 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v8)
  {
    double v50 = v10;
    BOOL v51 = v4;
    char v52 = v6;
    uint64_t v12 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v58 != v12) {
          objc_enumerationMutation(v11);
        }
        double v14 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        double v15 = [v14 identifier];
        int v16 = [v15 isEqualToString:v7];

        if (v16)
        {
          id v17 = v14;
          id v8 = v17;
          if (!a3)
          {
            double v18 = [v17 _systemConstraints];
            uint64_t v19 = [v18 count];

            if (!v19)
            {
              unint64_t v20 = v62((uint64_t)v61, v8);
              [v8 _setSystemConstraints:v20];
            }
          }
          double v21 = (void *)MEMORY[0x1E4F5B268];
          double v22 = [v8 _systemConstraints];
          [v21 activateConstraints:v22];

          goto LABEL_18;
        }
      }
      id v8 = (id)[v11 countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v8) {
        continue;
      }
      break;
    }
LABEL_18:
    id v6 = v52;
    BOOL v4 = v51;
    uint64_t v10 = v50;
  }

  if (!v8 && v4)
  {
    id v8 = objc_alloc_init(v10);
    [(UIView *)v6 addLayoutGuide:v8];
    [v8 setIdentifier:v7];
    [v8 _setLockedToOwningView:1];
    switch(a3)
    {
      case 2:
        [v8 _setShouldBeArchived:0];
        uint64_t v41 = [v8 widthAnchor];
        [(UIScrollView *)v6 contentOffset];
        double v23 = objc_msgSend(v41, "constraintEqualToConstant:");

        uint64_t v42 = [v8 heightAnchor];
        [(UIScrollView *)v6 contentOffset];
        contentLayoutGuide = [v42 constraintEqualToConstant:v43];

        [v23 setIdentifier:@"UIScrollView-contentOffsetLayoutGuide-xOffset"];
        [contentLayoutGuide setIdentifier:@"UIScrollView-contentOffsetLayoutGuide-yOffset"];
        v67[0] = v23;
        v67[1] = contentLayoutGuide;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v45 = [v44 countByEnumeratingWithState:&v53 objects:v66 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v54;
          do
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v54 != v47) {
                objc_enumerationMutation(v44);
              }
              [*(id *)(*((void *)&v53 + 1) + 8 * j) setShouldBeArchived:0];
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v53 objects:v66 count:16];
          }
          while (v46);
        }

        [v8 _setSystemConstraints:v44];
        [MEMORY[0x1E4F5B268] activateConstraints:v44];
        objc_storeStrong((id *)&v6->_contentOffsetLayoutGuide, v8);

        goto LABEL_34;
      case 1:
        CFTimeInterval v26 = [v8 leftAnchor];
        double v27 = [(UIView *)v6 leftAnchor];
        double v23 = [v26 constraintEqualToAnchor:v27];

        double v28 = [v8 topAnchor];
        CGFloat v29 = [(UIView *)v6 topAnchor];
        contentLayoutGuide = [v28 constraintEqualToAnchor:v29];

        id v30 = [v8 widthAnchor];
        double v31 = [(UIView *)v6 widthAnchor];
        uint32_t v32 = [v30 constraintEqualToAnchor:v31];

        double v33 = [v8 heightAnchor];
        double v34 = [(UIView *)v6 heightAnchor];
        double v35 = [v33 constraintEqualToAnchor:v34];

        uint64_t v36 = [(__CFString *)v7 stringByAppendingString:@"-minX"];
        [v23 setIdentifier:v36];

        double v37 = [(__CFString *)v7 stringByAppendingString:@"-minY"];
        [contentLayoutGuide setIdentifier:v37];

        double v38 = [(__CFString *)v7 stringByAppendingString:@"-width"];
        [v32 setIdentifier:v38];

        double v39 = [(__CFString *)v7 stringByAppendingString:@"-height"];
        [v35 setIdentifier:v39];

        v68[0] = v23;
        v68[1] = contentLayoutGuide;
        v68[2] = v32;
        v68[3] = v35;
        uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:4];
        [v8 _setSystemConstraints:v40];
        [MEMORY[0x1E4F5B268] activateConstraints:v40];
        objc_storeStrong((id *)&v6->_frameLayoutGuide, v8);

        goto LABEL_34;
      case 0:
        double v23 = v62((uint64_t)v61, v8);
        [v8 _setSystemConstraints:v23];
        [MEMORY[0x1E4F5B268] activateConstraints:v23];
        double v24 = (UILayoutGuide *)v8;
        contentLayoutGuide = v6->_contentLayoutGuide;
        v6->_contentLayoutGuide = v24;
LABEL_34:

        break;
    }
  }

LABEL_36:
  return v8;
}

- (id)_contentLayoutGuideIfExists
{
  return [(UIScrollView *)self _layoutGuideOfType:0 createIfNecessary:0];
}

- (NSISVariable)_contentWidthVariable
{
  return self->_contentWidthVariable;
}

- (NSISVariable)_contentHeightVariable
{
  return self->_contentHeightVariable;
}

- (id)_frameLayoutGuideIfExists
{
  return [(UIScrollView *)self _layoutGuideOfType:1 createIfNecessary:0];
}

- (BOOL)_canScrubWithTouch:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  int64_t v5 = -[UIScrollView _scrubbingForPoint:touch:](self, "_scrubbingForPoint:touch:", v4);
  BOOL v6 = v5 != 0;
  char v7 = [v4 _isPointerTouch];

  if ((v7 & 1) == 0)
  {
    UIGestureRecognizerState v8 = [(UIGestureRecognizer *)self->_knobLongPressGestureRecognizer state];
    if (v5) {
      BOOL v9 = v8 <= UIGestureRecognizerStatePossible;
    }
    else {
      BOOL v9 = 1;
    }
    return !v9;
  }
  return v6;
}

- (int64_t)_scrubbingForPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double knobLastFadeTime = self->_knobLastFadeTime;
  BOOL v10 = v9 - knobLastFadeTime < 0.4 && knobLastFadeTime > 0.0;
  if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)self))
  {
    if (!v10)
    {
      [(UIView *)self->_verticalScrollIndicator alpha];
      if (v11 <= 0.0)
      {
        if (!-[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self)) {
          return 0;
        }
        BOOL v13 = 0;
        goto LABEL_16;
      }
    }
    verticalScrollIndicator = self->_verticalScrollIndicator;
    if (a4 == 3)
    {
      BOOL v13 = [(_UIScrollViewScrollIndicator *)verticalScrollIndicator hasPointer];
    }
    else
    {
      [(UIView *)verticalScrollIndicator frame];
      UIDistanceBetweenPointAndRect(x, y, v14, v15, v16, v17);
      BOOL v13 = v18 < 20.0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  if (!-[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self)) {
    goto LABEL_20;
  }
  if (!v10)
  {
LABEL_16:
    [(UIView *)self->_horizontalScrollIndicator alpha];
    if (v19 > 0.0) {
      goto LABEL_17;
    }
LABEL_20:
    if (a4 == 3) {
      int64_t v22 = 3;
    }
    else {
      int64_t v22 = 1;
    }
    if (v13) {
      return v22;
    }
    return 0;
  }
LABEL_17:
  horizontalScrollIndicator = self->_horizontalScrollIndicator;
  if (a4 == 3)
  {
    BOOL v21 = [(_UIScrollViewScrollIndicator *)horizontalScrollIndicator hasPointer];
    int64_t v22 = 3;
    if (v21)
    {
      int64_t result = 4;
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  [(UIView *)horizontalScrollIndicator frame];
  UIDistanceBetweenPointAndRect(x, y, v24, v25, v26, v27);
  int64_t v22 = 1;
  if (v28 >= 20.0)
  {
LABEL_29:
    if (v13) {
      return v22;
    }
    return 0;
  }
  int64_t result = 2;
LABEL_27:
  if (v13) {
    return v22;
  }
  return result;
}

- (int64_t)_scrubbingForPoint:(CGPoint)a3 touch:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [v7 type];
  int v9 = [v7 _isPointerTouch];

  if (v9) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = v8;
  }
  return -[UIScrollView _scrubbingForPoint:touchType:](self, "_scrubbingForPoint:touchType:", v10, x, y);
}

- (void)_updatePanGestureConfiguration
{
  if (self->_minimumZoomScale == self->_maximumZoomScale)
  {
    uint64_t v5 = 1;
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  else
  {
    BOOL v3 = [(UIGestureRecognizer *)self->_pinch isEnabled];
    uint64_t v4 = 0xFFFFFFFFLL;
    if (v3) {
      uint64_t v4 = 2;
    }
    uint64_t v5 = !v3;
  }
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x8000) != 0) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v4;
  }
  [(UIPanGestureRecognizer *)self->_pan setMaximumNumberOfTouches:v6];
  pan = self->_pan;
  [(UIPanGestureRecognizer *)pan _setIgnoresStationaryTouches:v5];
}

- (void)_skipNextStartOffsetAdjustment
{
  *(void *)((char *)&self->_scrollViewFlags + 12) |= 0x80000uLL;
}

- (BOOL)_showsBackgroundShadow
{
  return self->_shadows != 0;
}

- (BOOL)_isBouncing
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x10000000000) == 0) {
    return 0;
  }
  [(UIScrollView *)self contentOffset];
  double v5 = v4;
  double v7 = v6;
  [(UIScrollView *)self _effectiveContentInset];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = v8;
  accuracdouble y = self->_accuracy;
  double v17 = self->_firstPageOffset.horizontal - v11;
  if (accuracy == 1.0)
  {
    if (v5 < round(v17)) {
      return 1;
    }
    double v32 = round(v8 + self->_contentSize.width);
    [(UIView *)self bounds];
    double v34 = self->_accuracy;
    double v35 = v15 + v12 + self->_contentSize.width;
    if (v34 == 1.0)
    {
      double v37 = round(v35);
    }
    else
    {
      double v36 = floor(v35);
      double v37 = v36 + round(v34 * (v35 - v36)) / v34;
    }
    if (v33 < v37) {
      double v37 = v33;
    }
    double v43 = round(v32 - v37);
  }
  else
  {
    double v18 = floor(v17);
    if (v5 < v18 + round(accuracy * (v17 - v18)) / accuracy) {
      return 1;
    }
    double v19 = v8 + self->_contentSize.width;
    double v20 = floor(v19);
    double v21 = v20 + round(accuracy * (v19 - v20)) / accuracy;
    [(UIView *)self bounds];
    double v23 = self->_accuracy;
    double width = self->_contentSize.width;
    double v25 = v15 + v12 + width;
    if (v23 == 1.0)
    {
      double v38 = round(v25);
      if (v22 < v38) {
        double v38 = v22;
      }
      double v28 = floor(v21 - v38);
      double v31 = round(v15 + width);
    }
    else
    {
      double v26 = floor(v25);
      double v27 = v26 + round(v23 * (v25 - v26)) / v23;
      if (v22 >= v27) {
        double v22 = v27;
      }
      double v28 = floor(v21 - v22);
      double v29 = v15 + width;
      double v30 = floor(v29);
      double v31 = v30 + round(v23 * (v29 - v30)) / v23;
    }
    [(UIView *)self bounds];
    double v34 = self->_accuracy;
    double v40 = v15 + v12 + self->_contentSize.width;
    if (v34 == 1.0)
    {
      double v42 = round(v40);
    }
    else
    {
      double v41 = floor(v40);
      double v42 = v41 + round(v34 * (v40 - v41)) / v34;
    }
    if (v39 < v42) {
      double v42 = v39;
    }
    double v43 = v28 + round(v34 * (v31 - v42 - v28)) / v34;
  }
  if (v5 > v43) {
    return 1;
  }
  double v44 = self->_firstPageOffset.vertical - v10;
  if (v34 == 1.0)
  {
    if (v7 >= round(v44))
    {
      double v59 = round(v14 + self->_contentSize.height);
      [(UIView *)self bounds];
      double v61 = self->_accuracy;
      double v62 = v14 + v10 + self->_contentSize.height;
      if (v61 == 1.0)
      {
        double v64 = round(v62);
      }
      else
      {
        double v63 = floor(v62);
        double v64 = v63 + round(v61 * (v62 - v63)) / v61;
      }
      if (v60 < v64) {
        double v64 = v60;
      }
      double v71 = round(v59 - v64);
      return v7 > v71;
    }
    return 1;
  }
  double v45 = floor(v44);
  if (v7 < v45 + round(v34 * (v44 - v45)) / v34) {
    return 1;
  }
  double v46 = v14 + self->_contentSize.height;
  double v47 = floor(v46);
  double v48 = v47 + round(v34 * (v46 - v47)) / v34;
  [(UIView *)self bounds];
  double v50 = self->_accuracy;
  double height = self->_contentSize.height;
  double v52 = v14 + v10 + height;
  if (v50 == 1.0)
  {
    double v65 = round(v52);
    if (v49 < v65) {
      double v65 = v49;
    }
    double v55 = floor(v48 - v65);
    double v58 = round(v14 + height);
  }
  else
  {
    double v53 = floor(v52);
    double v54 = v53 + round(v50 * (v52 - v53)) / v50;
    if (v49 < v54) {
      double v54 = v49;
    }
    double v55 = floor(v48 - v54);
    double v56 = v14 + height;
    double v57 = floor(v56);
    double v58 = v57 + round(v50 * (v56 - v57)) / v50;
  }
  [(UIView *)self bounds];
  double v67 = self->_accuracy;
  double v68 = v14 + v10 + self->_contentSize.height;
  if (v67 == 1.0)
  {
    double v70 = round(v68);
  }
  else
  {
    double v69 = floor(v68);
    double v70 = v69 + round(v67 * (v68 - v69)) / v67;
  }
  if (v66 < v70) {
    double v70 = v66;
  }
  double v71 = v55 + round(v67 * (v58 - v70 - v55)) / v67;
  return v7 > v71;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v13 = v8;
  double v15 = v14;
  BOOL v16 = v14 == height && v8 == width;
  v54.origin.double x = x;
  v54.origin.double y = y;
  v54.size.double width = width;
  v54.size.double height = height;
  v57.origin.double x = v10;
  v57.origin.double y = v12;
  v57.size.double width = v13;
  v57.size.double height = v15;
  if (!CGRectEqualToRect(v54, v57))
  {
    [(UIScrollView *)self _systemContentInset];
    double v51 = v18;
    double v52 = v17;
    double v49 = v20;
    double v50 = v19;
    unint64_t v21 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
    if (!v16)
    {
      double v47 = v10;
      if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x400000) != 0)
      {
        [(UIScrollView *)self contentSize];
        double v44 = v22;
        double v45 = v12;
        double v24 = v23;
        id WeakRetained = objc_loadWeakRetained(&self->_delegate);
        [(UIScrollView *)self zoomScale];
        objc_msgSend(WeakRetained, "scrollView:contentSizeForZoomScale:withProposedSize:", self);
        double v43 = v26;
        double v28 = v27;

        BOOL v29 = v44 == v43 && v24 == v28;
        double v12 = v45;
        if (!v29) {
          -[UIScrollView setContentSize:](self, "setContentSize:", v43, v28, v44);
        }
      }
      [(UIView *)self bounds];
      double v31 = v30 * -0.000000184659091 + 0.000359090909;
      if (v30 > 1024.0) {
        double v31 = 0.00017;
      }
      self->_pagingSpringPull = v31;
      [(UIView *)self bounds];
      double v33 = v32 * 0.00000994318182 + 0.966818182;
      if (v32 > 1024.0) {
        double v33 = 0.977;
      }
      self->_pagingFriction = v33;
      double v10 = v47;
    }
    double v34 = [(UIView *)self _containingScrollView];
    -[UIScrollView _attemptToDragParent:forNewBounds:oldBounds:](self, "_attemptToDragParent:forNewBounds:oldBounds:", v34, x, y, width, height, v10, v12, v13, v15);
    unint64_t v35 = (unint64_t)objc_loadWeakRetained((id *)&self->_animation);
    double v36 = (void *)v35;
    if (((*((unsigned char *)&self->_scrollViewFlags + 2) & 0x80) != 0 || (unint64_t)self->_scrollHeartbeat | v35)
      && (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x200000080000) == 0x200000000000
      && (-[_UIScrollViewScrollableAncestor _descendentScrollView:shouldPreserveStartOffset:](self->_scrollableAncestor, "_descendentScrollView:shouldPreserveStartOffset:", self, self->_startOffsetX, self->_startOffsetY) & 1) == 0)
    {
      double v37 = v12;
      double v38 = x - v10;
      double v46 = v37;
      double v39 = y - v37;
      self->_double startOffsetX = x - v10 + self->_startOffsetX;
      self->_double startOffsetY = v39 + self->_startOffsetY;
      CGFloat v40 = v39 + self->_pageDecelerationTarget.y;
      self->_pageDecelerationTarget.double x = x - v10 + self->_pageDecelerationTarget.x;
      self->_pageDecelerationTarget.double y = v40;
      double v48 = v39;
      [v36 adjustForContentOffsetDelta:x - v10];
      uint64_t v41 = *(void *)((char *)&self->_scrollViewFlags + 12);
      if ((v41 & 0x4000000000) != 0)
      {
        self->_adjustedDecelerationTarget.double x = v38 + self->_adjustedDecelerationTarget.x;
        uint64_t v41 = *(void *)((char *)&self->_scrollViewFlags + 12);
      }
      if ((v41 & 0x8000000000) != 0) {
        self->_adjustedDecelerationTarget.double y = v48 + self->_adjustedDecelerationTarget.y;
      }
      self->_lastUpdateOffsetX = v38 + self->_lastUpdateOffsetX;
      self->_lastUpdateOffsetY = v48 + self->_lastUpdateOffsetY;
      double v12 = v46;
    }
    *(void *)((char *)&self->_scrollViewFlags + 12) &= ~0x80000uLL;
    kdebug_trace();
    v53.receiver = self;
    v53.super_class = (Class)UIScrollView;
    -[UIView setBounds:](&v53, sel_setBounds_, x, y, width, height);
    if (!v16)
    {
      if ((((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 11) & 0xF) - 1 <= 3) {
        [(UIScrollView *)self _forcePanGestureToEndImmediately];
      }
      [(UIScrollView *)self _adjustContentOffsetIfNecessary];
      [(UIScrollView *)self _updateUsesStaticScrollBar];
      -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v21, 0, v52, v51, v50, v49);
      v55.origin.double x = v10;
      v55.origin.double y = v12;
      v55.size.double width = v13;
      v55.size.double height = v15;
      double v42 = CGRectGetHeight(v55);
      v56.origin.double x = x;
      v56.origin.double y = y;
      v56.size.double width = width;
      v56.size.double height = height;
      if (v42 != CGRectGetHeight(v56)) {
        [(UIScrollView *)self _sendGeometryAffectingContentBottomChangedToScrollObservers];
      }
    }
  }
}

- (id)_parentScrollView
{
  id v2 = [(UIView *)self superview];
  if (v2)
  {
    BOOL v3 = v2;
    while (!objc_msgSend(v3, "__isKindOfUIScrollView"))
    {
      id v2 = (id)[v3 superview];
      BOOL v3 = v2;
      if (!v2) {
        goto LABEL_7;
      }
    }
    id v2 = v3;
  }
LABEL_7:
  return v2;
}

- (BOOL)__isKindOfUIScrollView
{
  return 1;
}

- (void)_attemptToDragParent:(id)a3 forNewBounds:(CGRect)a4 oldBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v7 = a4.origin.y;
  double v8 = a4.origin.x;
  id v10 = a3;
  if (![v10 isPagingEnabled]
    || ![v10 isScrollEnabled]
    || ![(UIScrollView *)self _transfersScrollToContainer])
  {
    goto LABEL_71;
  }
  [v10 contentOffset];
  double v13 = v12;
  double v14 = v11;
  uint64_t scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x800000) != 0)
  {
    if ((scrollViewFlags & 0x40000080) != 0) {
      goto LABEL_68;
    }
  }
  else if ((scrollViewFlags & 0x40000080) != 0 || self->_scrollHeartbeat == 0)
  {
    goto LABEL_68;
  }
  double v61 = v11;
  [(UIScrollView *)self _effectiveContentInset];
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = *(uint64_t *)&self->_accuracy;
  v24.f64[0] = self->_firstPageOffset.horizontal - v21;
  v24.f64[1] = self->_firstPageOffset.vertical - v20;
  double v60 = v13;
  if (*(double *)&v23 == 1.0)
  {
    float64x2_t v27 = vrndaq_f64(v24);
    v18.f64[1] = v17;
    float64x2_t v30 = vrndaq_f64(vaddq_f64(v18, (float64x2_t)self->_contentSize));
  }
  else
  {
    float64x2_t v25 = vrndmq_f64(v24);
    float64x2_t v26 = (float64x2_t)vdupq_lane_s64(v23, 0);
    float64x2_t v27 = vaddq_f64(v25, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v24, v25), *(double *)&v23)), v26));
    v18.f64[1] = v17;
    float64x2_t v28 = vaddq_f64(v18, (float64x2_t)self->_contentSize);
    float64x2_t v29 = vrndmq_f64(v28);
    float64x2_t v30 = vaddq_f64(v29, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v28, v29), *(double *)&v23)), v26));
  }
  v31.f64[0] = width;
  v31.f64[1] = height;
  float64x2_t v32 = vsubq_f64(v30, v31);
  int8x16_t v33 = vbslq_s8((int8x16_t)vcgtq_f64(v32, v27), (int8x16_t)v32, (int8x16_t)v27);
  double v34 = v8 - x;
  if (v8 >= v27.f64[0] || v34 + self->_parentAdjustment.x > 0.0)
  {
    double v35 = 0.0;
    if (v8 <= *(double *)v33.i64 || v34 + self->_parentAdjustment.x < 0.0)
    {
      int v36 = 1;
      double v13 = v60;
      goto LABEL_39;
    }
  }
  int8x16_t v64 = v33;
  int v37 = objc_msgSend(v10, "_canScrollX", *(void *)&v60);
  uint64_t v23 = *(uint64_t *)&self->_accuracy;
  if (v37)
  {
    double v38 = self->_firstPageOffset.horizontal - v22;
    if (*(double *)&v23 == 1.0)
    {
      double v40 = round(v38);
    }
    else
    {
      double v39 = floor(v38);
      double v40 = v39 + round(*(double *)&v23 * (v38 - v39)) / *(double *)&v23;
    }
    if (v8 >= v40 || x <= v40)
    {
      if (v8 <= *(double *)v64.i64 || x >= *(double *)v64.i64) {
        goto LABEL_37;
      }
      double v43 = x - *(double *)v64.i64;
    }
    else
    {
      double v43 = x - v40;
    }
    double v34 = v34 + v43;
LABEL_37:
    [v10 _adjustedHorizontalOffsetPinnedToScrollableBounds:v34];
    double v35 = v44;
    int v36 = 0;
    self->_parentAdjustment.double x = v44 + self->_parentAdjustment.x;
    uint64_t v23 = *(uint64_t *)&self->_accuracy;
    goto LABEL_38;
  }
  int v36 = 1;
  double v35 = 0.0;
LABEL_38:
  double v13 = v60;
  v33.i64[1] = v64.i64[1];
LABEL_39:
  double v45 = self->_firstPageOffset.vertical - v20;
  if (*(double *)&v23 == 1.0)
  {
    double v47 = round(v45);
  }
  else
  {
    double v46 = floor(v45);
    double v47 = v46 + round(*(double *)&v23 * (v45 - v46)) / *(double *)&v23;
  }
  double v48 = v7 - y;
  if (v7 < v47 && v48 + self->_parentAdjustment.y <= 0.0
    || (double v49 = 0.0, v7 > *(double *)&v33.i64[1]) && v48 + self->_parentAdjustment.y >= 0.0)
  {
    double v65 = *(double *)&v33.i64[1];
    int v50 = objc_msgSend(v10, "_canScrollY", *(void *)&v60);
    double v49 = 0.0;
    if (v50)
    {
      accuracdouble y = self->_accuracy;
      double v52 = self->_firstPageOffset.vertical - v20;
      if (accuracy == 1.0)
      {
        double v54 = round(v52);
      }
      else
      {
        double v53 = floor(v52);
        double v54 = v53 + round(accuracy * (v52 - v53)) / accuracy;
      }
      BOOL v55 = v7 >= v54 || y <= v54;
      if (!v55 || ((double v54 = v65, v7 > v65) ? (v56 = y < v65) : (v56 = 0), v56)) {
        double v48 = v48 + y - v54;
      }
      [v10 _adjustedVerticalOffsetPinnedToScrollableBounds:v48];
      int v36 = 0;
      self->_parentAdjustment.double y = v49 + self->_parentAdjustment.y;
    }
  }
  double v14 = v61;
  if (v35 == 0.0 && v49 == 0.0)
  {
LABEL_67:
    if (!v36) {
      goto LABEL_71;
    }
    goto LABEL_68;
  }
  objc_msgSend(v10, "setContentOffset:", v13 + v35, v61 + v49, *(void *)&v60);
  CGRect v57 = [(UIView *)self layer];
  CATransform3DMakeTranslation(&v66, self->_parentAdjustment.x, self->_parentAdjustment.y, 0.0);
  [v57 setSublayerTransform:&v66];

  double v58 = self->_parentAdjustment.x;
  if (v58 != 0.0 || (double v58 = self->_parentAdjustment.y, v58 != 0.0))
  {
    -[UIScrollView _startDraggingParent:](self, "_startDraggingParent:", v10, v58);
    goto LABEL_67;
  }
  [(UIScrollView *)self _stopDraggingParent:v10];
  if (!v36) {
    goto LABEL_71;
  }
LABEL_68:
  double v59 = self->_parentAdjustment.y;
  if (self->_parentAdjustment.x != 0.0 || v59 != 0.0)
  {
    objc_msgSend(v10, "setContentOffset:", v13 - self->_parentAdjustment.x, v14 - v59, *(void *)&v60);
    [(UIScrollView *)self _stopDraggingParent:v10];
  }
LABEL_71:
}

- (BOOL)_forwardsToParentScroller
{
  return 0;
}

- (void)_resetScrollableAncestor
{
  scrollableAncestor = self->_scrollableAncestor;
  self->_scrollableAncestor = 0;

  *(void *)&self->_scrollViewFlags &= ~0x4000uLL;
}

- (BOOL)_transfersScrollToContainer
{
  return (*((unsigned char *)&self->_scrollViewFlags + 2) & 1) == 0;
}

- (unint64_t)_currentlyAbuttedContentEdges
{
  [(UIView *)self bounds];
  return -[UIScrollView _abuttedEdgesForContentOffset:](self, "_abuttedEdgesForContentOffset:");
}

- (unint64_t)_abuttedEdgesForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  [(UIScrollView *)self _contentInsetIncludingDecorations];
  if (x + v7 >= floor(v13 + self->_contentSize.width)) {
    uint64_t v14 = (2 * (x <= -v11)) | 8;
  }
  else {
    uint64_t v14 = 2 * (x <= -v11);
  }
  unint64_t v15 = v14 | (y <= -v10);
  if (y + v9 >= floor(v12 + self->_contentSize.height)) {
    return v15 | 4;
  }
  else {
    return v15;
  }
}

- (NSDirectionalEdgeInsets)_directionalAccessoryEdgeInsets
{
  BOOL v3 = [(UIScrollView *)self _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis];
  double top = self->_accessoryInsets.top;
  double left = self->_accessoryInsets.left;
  double bottom = self->_accessoryInsets.bottom;
  if (v3) {
    double right = self->_accessoryInsets.right;
  }
  else {
    double right = self->_accessoryInsets.left;
  }
  if (!v3) {
    double left = self->_accessoryInsets.right;
  }
  result.trailing = left;
  result.double bottom = bottom;
  result.leading = right;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)_computeBaseInsetsForVerticalScrollIndicatorWithClientInsets:(UIEdgeInsets)a3
{
  BOOL v4 = a3.bottom != 0.0;
  if (a3.right != 0.0) {
    BOOL v4 = 1;
  }
  if (a3.top != 0.0) {
    BOOL v4 = 1;
  }
  uint64_t v5 = a3.left != 0.0 || v4;
  [(UIScrollView *)self _verticalScrollIndicatorWidth];
  double v7 = v6;
  [(UIScrollView *)self _scrollIndicatorAdditionalInset];
  [(UIScrollView *)self _baseInsetsForAccessoryOnEdge:1 hasCustomClientInsets:v5 accessorySize:v7 additionalInsetFromEdge:v8];
  result.double right = v12;
  result.double bottom = v11;
  result.double left = v10;
  result.double top = v9;
  return result;
}

- (void)_adjustScrollerIndicators:(BOOL)a3 alwaysShowingThem:(BOOL)a4
{
  if (self->_staticScrollBar) {
    return;
  }
  BOOL v5 = a3;
  double v7 = [(UIView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 3) {
    return;
  }
  if (!self->_horizontalScrollIndicator && -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self))
  {
    CreateScrollIndicator(self, 0);
    double v9 = (_UIScrollViewScrollIndicator *)objc_claimAutoreleasedReturnValue();
    horizontalScrollIndicator = self->_horizontalScrollIndicator;
    self->_horizontalScrollIndicator = v9;

    [(UIView *)self->_horizontalScrollIndicator setAutoresizingMask:8];
    BOOL v5 = 1;
  }
  if (!self->_verticalScrollIndicator && -[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)self))
  {
    BOOL v5 = 1;
    CreateScrollIndicator(self, 1u);
    double v11 = (_UIScrollViewScrollIndicator *)objc_claimAutoreleasedReturnValue();
    verticalScrollIndicator = self->_verticalScrollIndicator;
    self->_verticalScrollIndicator = v11;

    if ([(UIScrollView *)self _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis])
    {
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 1;
    }
    [(UIView *)self->_verticalScrollIndicator setAutoresizingMask:v13];
  }
  [(NSTimer *)self->_verticalScrollIndicatorHideDelayTimer invalidate];
  verticalScrollIndicatorHideDelayTimer = self->_verticalScrollIndicatorHideDelayTimer;
  self->_verticalScrollIndicatorHideDelayTimer = 0;

  [(NSTimer *)self->_horizontalScrollIndicatorHideDelayTimer invalidate];
  horizontalScrollIndicatorHideDelayTimer = self->_horizontalScrollIndicatorHideDelayTimer;
  self->_horizontalScrollIndicatorHideDelayTimer = 0;

  [(UIView *)self bounds];
  double v70 = v17;
  double v71 = v16;
  double v19 = v18;
  double v72 = v20;
  [(UIScrollView *)self contentOffset];
  uint64_t v66 = v22;
  uint64_t v67 = v21;
  [(UIScrollView *)self _effectiveContentInset];
  v27.f64[0] = v72;
  double v28 = v25;
  double v29 = v26;
  uint64_t v30 = *(uint64_t *)&self->_accuracy;
  double v68 = v24;
  double v69 = v23;
  if (*(double *)&v30 == 1.0)
  {
    double v33 = fmin(round(v72) / round(v25 + v23 + self->_contentSize.height), 1.0);
    double v35 = round(v19);
    double v37 = round(v26 + v24 + self->_contentSize.width);
  }
  else
  {
    v27.f64[1] = v25 + v23 + self->_contentSize.height;
    float64x2_t v31 = vrndmq_f64(v27);
    float64x2_t v32 = vaddq_f64(v31, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v27, v31), *(double *)&v30)), (float64x2_t)vdupq_lane_s64(v30, 0)));
    double v33 = fmin(vdivq_f64(v32, (float64x2_t)vdupq_laneq_s64((int64x2_t)v32, 1)).f64[0], 1.0);
    double v34 = floor(v19);
    double v35 = v34 + round((v19 - v34) * *(double *)&v30) / *(double *)&v30;
    v32.f64[0] = v26 + v24 + self->_contentSize.width;
    double v36 = floor(v32.f64[0]);
    double v37 = v36 + round(*(double *)&v30 * (v32.f64[0] - v36)) / *(double *)&v30;
  }
  double v38 = v35 / v37;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  uint64_t scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  BOOL v41 = (scrollViewFlags & 0x40000080) != 0 && (int)scrollViewFlags < 0;
  unsigned int v42 = [(_UIScrollViewScrollableAncestor *)self->_scrollableAncestor _descendentScrollViewShouldScrollVertically:self];
  int v43 = [(_UIScrollViewScrollableAncestor *)self->_scrollableAncestor _descendentScrollViewShouldScrollHorizontally:self];
  if ((~*(_DWORD *)&self->_scrollViewFlags & 0x800003) == 0)
  {
    int v44 = 1;
LABEL_31:
    int v45 = 1;
    goto LABEL_32;
  }
  int v44 = 1;
  if (self->_scrollHeartbeat) {
    goto LABEL_31;
  }
  int v45 = 1;
  unsigned int v46 = 1;
  if (a4) {
    goto LABEL_33;
  }
  uint64_t v47 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if ((v47 & 0x2000) != 0) {
    goto LABEL_33;
  }
  if ((v47 & 2) == 0)
  {
    int v44 = [WeakRetained revealsVerticalScrollIndicator];
    uint64_t v47 = *(void *)((char *)&self->_scrollViewFlags + 12);
  }
  if ((v47 & 1) == 0)
  {
    unsigned int v46 = [WeakRetained revealsHorizontalScrollIndicator];
    int v45 = 0;
    goto LABEL_33;
  }
  int v45 = 0;
LABEL_32:
  unsigned int v46 = 1;
LABEL_33:
  double v48 = fmin(v38, 1.0);
  if (v33 <= 0.99) {
    uint64_t v49 = v44 & ~(v41 | v42);
  }
  else {
    uint64_t v49 = 0;
  }
  if (((v41 | v43) & 1) == 0)
  {
    if (v48 <= 0.99) {
      uint64_t v50 = v46;
    }
    else {
      uint64_t v50 = 0;
    }
    if (!v41) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  uint64_t v50 = 0;
  if (v41)
  {
LABEL_43:
    double v51 = [(UIView *)self->_horizontalScrollIndicator layer];
    [v51 removeAnimationForKey:@"opacity"];

    double v52 = [(UIView *)self->_verticalScrollIndicator layer];
    [v52 removeAnimationForKey:@"opacity"];
  }
LABEL_44:
  if (v45 && (*(void *)((char *)&self->_scrollViewFlags + 12) & 3) != 0)
  {
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__hideScrollIndicators object:0];
    unsigned int v53 = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFBFFFFF;
    *(void *)((char *)&self->_scrollViewFlags + 12) &= 0xFFFFFFFFFFFFFFFCLL;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v53;
  }
  [(UIScrollView *)self _scrollIndicatorAdditionalInset];
  double v55 = v54;
  BOOL v56 = v48 > 0.99 || v33 > 0.99;
  double v57 = 0.0;
  if (!v56) {
    double v57 = 6.5 - v54;
  }
  accuracdouble y = self->_accuracy;
  if (accuracy == 1.0)
  {
    double v60 = round(v57);
  }
  else
  {
    double v59 = floor(v57);
    double v60 = v59 + round(accuracy * (v57 - v59)) / accuracy;
  }
  -[UIScrollView _layoutVerticalScrollIndicatorWithBounds:effectiveInset:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:](self, "_layoutVerticalScrollIndicatorWithBounds:effectiveInset:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:", v33 <= 0.99, v49, v5, v71, v70, v19, v72, v69, v68, v28, v29, v67, v66, *(void *)&v33, *(void *)&v55, *(void *)&v60);
  if (v33 > 0.99)
  {
    uint64_t v61 = *MEMORY[0x1E4F1DB20];
    uint64_t v62 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
    uint64_t v63 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
    uint64_t v64 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  }
  -[UIScrollView _layoutHorizontalScrollIndicatorWithBounds:effectiveInset:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:verticalIndicatorFrame:](self, "_layoutHorizontalScrollIndicatorWithBounds:effectiveInset:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:verticalIndicatorFrame:", v48 <= 0.99, v50, v5, v71, v70, v19, v72, v69, v68, v28, v29, v67, v66, *(void *)&v48, *(void *)&v55, *(void *)&v60,
    v61,
    v62,
    v63,
    v64);
}

- (double)_scrollIndicatorAdditionalInset
{
  int64_t v3 = [(UIView *)self _userInterfaceIdiom];
  double v4 = 3.0;
  if (v3 == 3) {
    UIRoundToViewScale(self);
  }
  accuracdouble y = self->_accuracy;
  if (accuracy == 1.0) {
    return round(v4);
  }
  double v6 = floor(v4);
  return v6 + round((v4 - v6) * accuracy) / accuracy;
}

- (CGRect)_layoutVerticalScrollIndicatorWithBounds:(CGRect)a3 effectiveInset:(UIEdgeInsets)a4 contentOffset:(CGPoint)a5 fraction:(double)a6 additionalInset:(double)a7 cornerAdjust:(double)a8 needsIndicator:(BOOL)a9 showing:(BOOL)a10 recalcSize:(BOOL)a11
{
  BOOL v11 = a9;
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v20 = a3.origin.y;
  CGFloat v21 = a3.origin.x;
  if (LOBYTE(a5.y)) {
    goto LABEL_10;
  }
  [(UIView *)self->_verticalScrollIndicator alpha];
  if (v23 > 0.05)
  {
    if (LODWORD(x))
    {
      BOOL v24 = *(_DWORD *)&self->_scrollViewFlags >= 0;
      double v25 = 1.0;
      double v26 = self;
    }
    else
    {
      double v25 = 0.0;
      double v26 = self;
      BOOL v24 = 0;
    }
    [(UIScrollView *)v26 _hideScrollIndicator:self->_verticalScrollIndicator afterDelay:v24 animated:v25];
  }
  if (v11 || (*(void *)((char *)&self->_scrollViewFlags + 12) & 4) != 0)
  {
LABEL_10:
    double v51 = v21;
    double v52 = v20;
    double v53 = width;
    double v54 = height;
    double v55 = top;
    double v56 = left;
    double v57 = bottom;
    double v58 = right;
    float64x2_t v31 = [(UIView *)self layer];
    uint64_t v32 = [v31 flipsHorizontalAxis];
    double v33 = [(UIView *)self->_verticalScrollIndicator layer];
    [v33 setFlipsHorizontalAxis:v32];

    [(UIScrollView *)self _effectiveVerticalScrollIndicatorInsets];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v27 = *MEMORY[0x1E4F1DB20];
    double v28 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v29 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v30 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    v61.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB20];
    v61.origin.CGFloat y = v28;
    v61.size.CGFloat width = v29;
    v61.size.CGFloat height = v30;
    if (CGRectIsNull(v61))
    {
      -[UIScrollView _iOS_frameForLayoutVerticalScrollIndicatorWithBounds:effectiveInset:indicatorInsets:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:](self, "_iOS_frameForLayoutVerticalScrollIndicatorWithBounds:effectiveInset:indicatorInsets:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:", *(void *)&x, *(void *)&y, v11, v51, v52, v53, v54, v55, v56, v57, v58, v35 + v59, v37 + v59, v39 + v59, v41 + v59, *(void *)&a6,
        *(void *)&a7,
        *(void *)&a8,
        *(void *)&v59,
        v60);
      double v27 = v42;
      double v28 = v43;
      double v29 = v44;
      double v30 = v45;
    }
    -[UIView setFrame:](self->_verticalScrollIndicator, "setFrame:", v27, v28, v29, v30);
    if (LODWORD(y))
    {
      [(UIView *)self->_verticalScrollIndicator alpha];
      if (v46 < 1.0)
      {
        [(UIView *)self bringSubviewToFront:self->_verticalScrollIndicator];
        [(UIView *)self->_verticalScrollIndicator setAlpha:1.0];
      }
    }
  }
  else
  {
    double v27 = *MEMORY[0x1E4F1DB20];
    double v28 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v29 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v30 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v47 = v27;
  double v48 = v28;
  double v49 = v29;
  double v50 = v30;
  result.size.CGFloat height = v50;
  result.size.CGFloat width = v49;
  result.origin.CGFloat y = v48;
  result.origin.CGFloat x = v47;
  return result;
}

- (uint64_t)_layoutHorizontalScrollIndicatorWithBounds:(double)a3 effectiveInset:(double)a4 contentOffset:(double)a5 fraction:(double)a6 additionalInset:(double)a7 cornerAdjust:(double)a8 needsIndicator:(double)a9 showing:(uint64_t)a10 recalcSize:(uint64_t)a11 verticalIndicatorFrame:(uint64_t)a12
{
  if (a12) {
    goto LABEL_9;
  }
  uint64_t result = [*(id *)(a1 + 1528) alpha];
  if (v38 > 0.05)
  {
    if (a11)
    {
      BOOL v39 = *(_DWORD *)(a1 + 1760) >= 0;
      double v40 = 1.0;
      double v41 = (void *)a1;
    }
    else
    {
      double v40 = 0.0;
      double v41 = (void *)a1;
      BOOL v39 = 0;
    }
    uint64_t result = [v41 _hideScrollIndicator:*(void *)(a1 + 1528) afterDelay:v39 animated:v40];
  }
  if ((a13 & 1) != 0 || (*(void *)(a1 + 1772) & 8) != 0)
  {
LABEL_9:
    double v63 = a2;
    double v64 = a3;
    double v65 = a4;
    double v66 = a5;
    double v67 = a6;
    double v68 = a7;
    double v69 = a8;
    double v70 = a9;
    double v42 = [(id)a1 layer];
    uint64_t v43 = [v42 flipsHorizontalAxis];
    double v44 = [*(id *)(a1 + 1528) layer];
    [v44 setFlipsHorizontalAxis:v43];

    [(id)a1 _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis];
    [(id)a1 _effectiveHorizontalScrollIndicatorInsets];
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v53 = *MEMORY[0x1E4F1DB20];
    double v54 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v55 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v56 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    v72.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB20];
    v72.origin.CGFloat y = v54;
    v72.size.CGFloat width = v55;
    v72.size.CGFloat height = v56;
    if (CGRectIsNull(v72))
    {
      objc_msgSend((id)a1, "_iOS_frameForLayoutHorizontalScrollIndicatorWithBounds:effectiveInset:indicatorInsets:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:verticalIndicatorFrame:", a11, a12, a13, v63, v64, v65, v66, v67, v68, v69, v70, v46 + a20, v48 + a20, v50 + a20, v52 + a20, a17,
        a18,
        a19,
        *(void *)&a20,
        a21,
        a22,
        a23,
        a24,
        a25);
      double v53 = v57;
      double v54 = v58;
      double v55 = v59;
      double v56 = v60;
    }
    uint64_t result = objc_msgSend(*(id *)(a1 + 1528), "setFrame:", v53, v54, v55, v56);
    if (a12)
    {
      uint64_t result = [*(id *)(a1 + 1528) alpha];
      if (v61 < 1.0)
      {
        [(id)a1 bringSubviewToFront:*(void *)(a1 + 1528)];
        uint64_t v62 = *(void **)(a1 + 1528);
        return [v62 setAlpha:1.0];
      }
    }
  }
  return result;
}

- (double)_iOS_frameForLayoutVerticalScrollIndicatorWithBounds:(double)a3 effectiveInset:(double)a4 indicatorInsets:(double)a5 contentOffset:(double)a6 fraction:(double)a7 additionalInset:(double)a8 cornerAdjust:(uint64_t)a9 needsIndicator:(uint64_t)a10 showing:(uint64_t)a11 recalcSize:(char)a12
{
  int v28 = [(id)a1 _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis];
  int v29 = dyld_program_sdk_at_least() | v28 ^ 1;
  if (v29) {
    double v30 = a15;
  }
  else {
    double v30 = a17;
  }
  if (v29) {
    double v31 = a17;
  }
  else {
    double v31 = a15;
  }
  double v53 = v31;
  double v32 = v30 + v31;
  [*(id *)(a1 + 1520) frame];
  [(id)a1 _verticalScrollIndicatorWidth];
  if ((a12 & 1) != 0 || (*(void *)(a1 + 1772) & 4) != 0)
  {
    double v34 = *(double *)(a1 + 1200);
    double v35 = a6;
    double v36 = a5;
    double v37 = a3;
  }
  else
  {
    double v34 = *(double *)(a1 + 1200);
    double v35 = a6;
    double v36 = a5;
    double v37 = a3;
  }
  double v38 = a2 + v30;
  double v39 = a4 - v32;
  double v40 = *(double *)(a1 + 1296) - v35;
  if (v34 != 1.0)
  {
    double v41 = floor(v40);
    double v42 = v41 + round(v34 * (v40 - v41)) / v34;
    double v43 = v38 + v39 - v33 + a22;
    if (v28) {
      double v43 = v38 - a22;
    }
    if (v37 >= v42)
    {
      double v44 = v37 + v36;
      double v45 = a8 + *(double *)(a1 + 424);
      double v46 = floor(v45);
      double v47 = v46 + round(v34 * (v45 - v46)) / v34;
      goto LABEL_21;
    }
LABEL_19:
    double v49 = v53;
LABEL_22:
    int v50 = *(_DWORD *)(a1 + 1780);
    unint64_t v51 = *(void *)(a1 + 1772) | 4;
    goto LABEL_24;
  }
  double v48 = round(v40);
  double v43 = v38 + v39 - v33 + a22;
  if (v28) {
    double v43 = v38 - a22;
  }
  if (v37 < v48) {
    goto LABEL_19;
  }
  double v44 = v37 + v36;
  double v47 = round(a8 + *(double *)(a1 + 424));
LABEL_21:
  double v49 = v53;
  if (v44 > v47) {
    goto LABEL_22;
  }
  int v50 = *(_DWORD *)(a1 + 1780);
  unint64_t v51 = *(void *)(a1 + 1772) & 0xFFFFFFFFFFFFFFFBLL;
LABEL_24:
  *(void *)(a1 + 1772) = v51;
  *(_DWORD *)(a1 + 1780) = v50;
  if (v43 < v38) {
    double v43 = a2 + v30;
  }
  if (v43 >= a2 + a4 - v33 - v49) {
    double v43 = a2 + a4 - v33 - v49;
  }
  return v43 - *(double *)(a1 + 1080);
}

- (BOOL)_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis
{
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
  {
    int64_t v3 = [(UIView *)self layer];
    int v2 = [v3 flipsHorizontalAxis] ^ 1;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (UIEdgeInsets)_effectiveVerticalScrollIndicatorInsets
{
  [(UIScrollView *)self verticalScrollIndicatorInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self _cachedVerticalScrollIndicatorBaseInsets];
  if (v14 == 1.79769313e308 && v11 == 1.79769313e308 && v13 == 1.79769313e308 && v12 == 1.79769313e308)
  {
    -[UIScrollView _computeBaseInsetsForVerticalScrollIndicatorWithClientInsets:](self, "_computeBaseInsetsForVerticalScrollIndicatorWithClientInsets:", v4, v6, v8, v10);
    double v19 = v26;
    double v21 = v27;
    double v23 = v28;
    double v25 = v29;
    -[UIScrollView _setCachedVerticalScrollIndicatorBaseInsets:](self, "_setCachedVerticalScrollIndicatorBaseInsets:");
  }
  else
  {
    [(UIScrollView *)self _cachedVerticalScrollIndicatorBaseInsets];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
  }
  char v30 = [(UIScrollView *)self _edgesApplyingBaseInsetsToScrollIndicatorInsets];
  double v31 = -0.0;
  if (v30) {
    double v32 = v19;
  }
  else {
    double v32 = -0.0;
  }
  double v33 = v4 + v32;
  if ((v30 & 2) != 0) {
    double v34 = v21;
  }
  else {
    double v34 = -0.0;
  }
  double v35 = v6 + v34;
  if ((v30 & 4) != 0) {
    double v36 = v23;
  }
  else {
    double v36 = -0.0;
  }
  double v37 = v8 + v36;
  if ((v30 & 8) != 0) {
    double v31 = v25;
  }
  double v38 = v10 + v31;
  double v39 = [(UIView *)self layer];
  int v40 = [v39 flipsHorizontalAxis];
  if (v40) {
    double v41 = v35;
  }
  else {
    double v41 = v38;
  }
  if (v40) {
    double v35 = v38;
  }

  double v42 = v33;
  double v43 = v35;
  double v44 = v37;
  double v45 = v41;
  result.CGFloat right = v45;
  result.CGFloat bottom = v44;
  result.CGFloat left = v43;
  result.CGFloat top = v42;
  return result;
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  p_verticalScrollIndicatorInsets = &self->_verticalScrollIndicatorInsets;
  float64x2_t v3 = *(float64x2_t *)&self->_verticalScrollIndicatorInsets.top;
  float64x2_t v4 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v3, v4), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_verticalScrollIndicatorInsets.bottom, v4))))) & 1) == 0)
  {
    p_verticalScrollIndicatorInsets = &self->_scrollIndicatorInset;
    v3.f64[0] = self->_scrollIndicatorInset.top;
  }
  double bottom = p_verticalScrollIndicatorInsets->bottom;
  double right = p_verticalScrollIndicatorInsets->right;
  double left = p_verticalScrollIndicatorInsets->left;
  result.CGFloat top = v3.f64[0];
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  return result;
}

- (UIEdgeInsets)_cachedVerticalScrollIndicatorBaseInsets
{
  double top = self->_cachedVerticalScrollIndicatorBaseInsets.top;
  double left = self->_cachedVerticalScrollIndicatorBaseInsets.left;
  double bottom = self->_cachedVerticalScrollIndicatorBaseInsets.bottom;
  double right = self->_cachedVerticalScrollIndicatorBaseInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)_iOS_frameForLayoutHorizontalScrollIndicatorWithBounds:(CGFloat)a3 effectiveInset:(CGFloat)a4 indicatorInsets:(CGFloat)a5 contentOffset:(double)a6 fraction:(double)a7 additionalInset:(double)a8 cornerAdjust:(double)a9 needsIndicator:(uint64_t)a10 showing:(uint64_t)a11 recalcSize:(uint64_t)a12 verticalIndicatorFrame:(char)a13
{
  double rect_16 = a17;
  double rect_24 = a15;
  int v32 = [(id)a1 _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis];
  v80.origin.CGFloat x = a23;
  v80.origin.CGFloat y = a24;
  v80.size.CGFloat width = a25;
  v80.size.CGFloat height = a26;
  if (!CGRectIsNull(v80))
  {
    if (v32)
    {
      v81.origin.CGFloat x = a23;
      v81.origin.CGFloat y = a24;
      v81.size.CGFloat width = a25;
      v81.size.CGFloat height = a26;
      double MaxX = CGRectGetMaxX(v81);
      v82.origin.CGFloat x = a2;
      v82.origin.CGFloat y = a3;
      v82.size.CGFloat width = a4;
      v82.size.CGFloat height = a5;
      double v34 = MaxX - CGRectGetMinX(v82);
      double v35 = a15;
      if (a15 < v34) {
        double v35 = v34;
      }
      double rect_24 = v35;
    }
    else
    {
      v83.origin.CGFloat x = a2;
      v83.origin.CGFloat y = a3;
      v83.size.CGFloat width = a4;
      v83.size.CGFloat height = a5;
      double v36 = CGRectGetMaxX(v83);
      v84.origin.CGFloat x = a23;
      v84.origin.CGFloat y = a24;
      v84.size.CGFloat width = a25;
      v84.size.CGFloat height = a26;
      double v37 = v36 - CGRectGetMinX(v84);
      double v38 = a17;
      if (a17 < v37) {
        double v38 = v37;
      }
      double rect_16 = v38;
    }
  }
  int v39 = dyld_program_sdk_at_least() | v32 ^ 1;
  if (v39) {
    double v40 = rect_24;
  }
  else {
    double v40 = rect_16;
  }
  if (v39) {
    double v41 = rect_16;
  }
  else {
    double v41 = rect_24;
  }
  [*(id *)(a1 + 1528) frame];
  double v43 = v42;
  [(id)a1 _horizontalScrollIndicatorHeight];
  if ((a13 & 1) != 0 || (*(void *)(a1 + 1772) & 8) != 0)
  {
    uint64_t v44 = *(uint64_t *)(a1 + 1200);
    double v47 = a4 - (v40 + v41);
    double v48 = v47 * a20;
    double v45 = a7;
    double v46 = a2;
    if (*(double *)&v44 == 1.0)
    {
      double v50 = round(v48);
    }
    else
    {
      double v49 = floor(v48);
      double v50 = v49 + round((v48 - v49) * *(double *)&v44) / *(double *)&v44;
    }
    if (v50 >= 36.0) {
      double v43 = v50;
    }
    else {
      double v43 = 36.0;
    }
  }
  else
  {
    uint64_t v44 = *(uint64_t *)(a1 + 1200);
    double v45 = a7;
    double v46 = a2;
    double v47 = a4 - (v40 + v41);
  }
  double v51 = v46 + v40;
  double v52 = v47 - v43;
  double v53 = *(double *)(a1 + 1288) - v45;
  if (*(double *)&v44 != 1.0)
  {
    double v54 = floor(v53);
    double v55 = v54 + round(*(double *)&v44 * (v53 - v54)) / *(double *)&v44;
    double v56 = *(double *)(a1 + 416);
    v57.f64[0] = a9 + v45 + v56;
    double v58 = a4;
    v57.f64[1] = a4;
    float64x2_t v59 = vrndmq_f64(v57);
    float64x2_t v60 = vaddq_f64(v59, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v57, v59), *(double *)&v44)), (float64x2_t)vdupq_lane_s64(v44, 0)));
    double v61 = v51 + v52 * ((a18 - v55) / vsubq_f64(v60, (float64x2_t)vdupq_laneq_s64((int64x2_t)v60, 1)).f64[0]);
    double v62 = floor(v61);
    double v63 = v62 + round(*(double *)&v44 * (v61 - v62)) / *(double *)&v44;
    if (v46 >= v55)
    {
      double v64 = v46 + a4;
      double v65 = a9 + v56;
      double v66 = floor(v65);
      double v67 = v66 + round(*(double *)&v44 * (v65 - v66)) / *(double *)&v44;
      goto LABEL_32;
    }
LABEL_28:
    if (v43 - (v55 - v46) >= 7.0) {
      double v43 = v43 - (v55 - v46);
    }
    else {
      double v43 = 7.0;
    }
    goto LABEL_36;
  }
  double v55 = round(v53);
  double v68 = *(double *)(a1 + 416);
  double v58 = a4;
  double v63 = round(v51 + v52 * ((a18 - v55) / (round(a9 + v45 + v68) - round(a4))));
  if (v46 < v55) {
    goto LABEL_28;
  }
  double v64 = v46 + a4;
  double v67 = round(a9 + v68);
LABEL_32:
  if (v64 > v67)
  {
    double v69 = v64 - v67;
    double v63 = v63 + v69;
    if (v43 - v69 >= 7.0) {
      double v43 = v43 - v69;
    }
    else {
      double v43 = 7.0;
    }
LABEL_36:
    int v70 = *(_DWORD *)(a1 + 1780);
    unint64_t v71 = *(void *)(a1 + 1772) | 8;
    goto LABEL_38;
  }
  int v70 = *(_DWORD *)(a1 + 1780);
  unint64_t v71 = *(void *)(a1 + 1772) & 0xFFFFFFFFFFFFFFF7;
LABEL_38:
  *(void *)(a1 + 1772) = v71;
  *(_DWORD *)(a1 + 1780) = v70;
  if (v63 < v51) {
    double v63 = v51;
  }
  if (v63 >= v46 + v58 - v43 - v41 - a22) {
    double v63 = v46 + v58 - v43 - v41 - a22;
  }
  return v63 - *(double *)(a1 + 1080);
}

- (UIEdgeInsets)_effectiveHorizontalScrollIndicatorInsets
{
  [(UIScrollView *)self horizontalScrollIndicatorInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self _cachedHorizontalScrollIndicatorBaseInsets];
  if (v14 == 1.79769313e308 && v11 == 1.79769313e308 && v13 == 1.79769313e308 && v12 == 1.79769313e308)
  {
    -[UIScrollView _computeBaseInsetsForHorizontalScrollIndicatorWithClientInsets:](self, "_computeBaseInsetsForHorizontalScrollIndicatorWithClientInsets:", v4, v6, v8, v10);
    double v19 = v26;
    double v21 = v27;
    double v23 = v28;
    double v25 = v29;
    -[UIScrollView _setCachedHorizontalScrollIndicatorBaseInsets:](self, "_setCachedHorizontalScrollIndicatorBaseInsets:");
  }
  else
  {
    [(UIScrollView *)self _cachedHorizontalScrollIndicatorBaseInsets];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
  }
  char v30 = [(UIScrollView *)self _edgesApplyingBaseInsetsToScrollIndicatorInsets];
  double v31 = -0.0;
  if (v30) {
    double v32 = v19;
  }
  else {
    double v32 = -0.0;
  }
  double v33 = v4 + v32;
  if ((v30 & 2) != 0) {
    double v34 = v21;
  }
  else {
    double v34 = -0.0;
  }
  double v35 = v6 + v34;
  if ((v30 & 4) != 0) {
    double v36 = v23;
  }
  else {
    double v36 = -0.0;
  }
  double v37 = v8 + v36;
  if ((v30 & 8) != 0) {
    double v31 = v25;
  }
  double v38 = v10 + v31;
  int v39 = [(UIView *)self layer];
  int v40 = [v39 flipsHorizontalAxis];
  if (v40) {
    double v41 = v35;
  }
  else {
    double v41 = v38;
  }
  if (v40) {
    double v35 = v38;
  }

  double v42 = v33;
  double v43 = v35;
  double v44 = v37;
  double v45 = v41;
  result.double right = v45;
  result.double bottom = v44;
  result.double left = v43;
  result.double top = v42;
  return result;
}

- (UIEdgeInsets)_baseInsetsForAccessoryOnEdge:(int64_t)a3 hasCustomClientInsets:(BOOL)a4 accessorySize:(double)a5 additionalInsetFromEdge:(double)a6
{
  if (a3 == 1) {
    [(UIScrollView *)self _safeAreaInsetsConsultingAlternativeTopInsetIfApplicable];
  }
  else {
    [(UIView *)self safeAreaInsets];
  }
  double v16 = v12;
  double v17 = v13;
  double v18 = v15;
  double v19 = v14 + self->_keyboardBottomInsetAdjustment;
  if (!a4 && (v13 != 0.0 || v12 != 0.0 || v15 != 0.0 || v19 != 0.0))
  {
    double v20 = [(UIView *)self window];
    [v20 _sceneSafeAreaInsetsIncludingStatusBar:0];
    if (v20
      && (v22 != 0.0 || v21 != 0.0 || v24 != 0.0 || v23 != 0.0)
      && (*((_DWORD *)&self->_scrollViewFlags + 5) & 0x200) != 0)
    {
      double v84 = v22;
      double v86 = v24;
      double v88 = v21;
      double v90 = v23;
      [(UIView *)self _currentScreenScale];
      double v94 = v25;
      if (v25 <= 0.0)
      {
        CGRect v81 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIScrollView.m", 14944, @"Invalid screen scale: %f", *(void *)&v94);
      }
      [(UIView *)self bounds];
      double v27 = v26;
      double v91 = v29;
      double v92 = v28;
      double v31 = v30;
      CGFloat v82 = v30;
      CGFloat v83 = v26;
      if ([v20 _isHostedInAnotherProcess])
      {
        -[UIView convertRect:toView:](self, "convertRect:toView:", v20, v27, v92, v31, v91);
        double v106 = v32;
        CGFloat v108 = v34;
        CGFloat v111 = v33;
        CGFloat v104 = v35;
        [v20 bounds];
      }
      else
      {
        double v106 = __UIViewConvertRectInViewToSceneSpace(self, v20, v27, v92, v31, v91);
        CGFloat v108 = v41;
        CGFloat v111 = v40;
        CGFloat v104 = v42;
        [v20 _sceneBounds];
      }
      double v93 = 1.0 / v94;
      CGFloat v43 = v36;
      CGFloat v95 = v37;
      CGFloat v98 = v39;
      CGFloat rect = v38;
      CGRect v114 = CGRectInset(*(CGRect *)&v36, -(1.0 / v94), -(1.0 / v94));
      v135.size.CGFloat height = v104;
      v135.origin.double x = v106;
      v135.size.CGFloat width = v108;
      v135.origin.CGFloat y = v111;
      if (CGRectContainsRect(v114, v135))
      {
        v115.origin.double x = v43;
        v115.origin.CGFloat y = v95;
        v115.size.CGFloat height = v98;
        v115.size.CGFloat width = rect;
        double v85 = v84 + CGRectGetMinX(v115);
        v116.origin.double x = v106;
        v116.size.CGFloat width = v108;
        v116.origin.CGFloat y = v111;
        v116.size.CGFloat height = v104;
        BOOL v44 = vabdd_f64(v85, v17 + CGRectGetMinX(v116)) < v93;
        v117.origin.double x = v43;
        v117.origin.CGFloat y = v95;
        v117.size.CGFloat height = v98;
        v117.size.CGFloat width = rect;
        double v87 = CGRectGetMaxX(v117) - v86;
        v118.size.CGFloat height = v104;
        v118.origin.double x = v106;
        v118.origin.CGFloat y = v111;
        v118.size.CGFloat width = v108;
        if (vabdd_f64(v87, CGRectGetMaxX(v118) - v18) >= v93) {
          uint64_t v45 = 2 * v44;
        }
        else {
          uint64_t v45 = (2 * v44) | 8;
        }
        v119.origin.double x = v43;
        v119.origin.CGFloat y = v95;
        v119.size.CGFloat height = v98;
        v119.size.CGFloat width = rect;
        double v89 = v88 + CGRectGetMinY(v119);
        v120.origin.CGFloat y = v111;
        v120.size.CGFloat width = v108;
        v120.origin.double x = v106;
        v120.size.CGFloat height = v104;
        uint64_t v46 = v45 | (vabdd_f64(v89, v16 + CGRectGetMinY(v120)) < v93);
        v121.origin.double x = v43;
        v121.origin.CGFloat y = v95;
        v121.size.CGFloat height = v98;
        v121.size.CGFloat width = rect;
        double v47 = CGRectGetMaxY(v121) - v90;
        v122.origin.double x = v106;
        v122.size.CGFloat width = v108;
        v122.origin.CGFloat y = v111;
        v122.size.CGFloat height = v104;
        if (vabdd_f64(v47, CGRectGetMaxY(v122) - v19) < v93) {
          v46 |= 4uLL;
        }
        unint64_t v48 = [(UIScrollView *)self _edgesAllowingScrollAccessoriesExtendedToBoundingPath];
        char v49 = v46 & v48;
        if ((v46 & v48) != 0)
        {
          -[UIView _rectTuckedAgainstBoundingPathEdge:withSize:cornerRadii:minimumPadding:](self, "_rectTuckedAgainstBoundingPathEdge:withSize:cornerRadii:minimumPadding:", _edgeForScrollAccessoryEdge(a3, (*((_DWORD *)&self->super._viewFlags + 4) >> 19) & 1), a5, a5 * 0.5, a5 * 0.5, a5 * 0.5, a5 * 0.5, a6);
          double x = v123.origin.x;
          CGFloat width = v123.size.width;
          CGFloat height = v123.size.height;
          CGFloat y = v123.origin.y;
          if (!CGRectIsNull(v123))
          {
            double v53 = [(UIView *)self layer];
            int v54 = [v53 flipsHorizontalAxis];

            if (v54)
            {
              [(UIView *)self bounds];
              double MaxX = CGRectGetMaxX(v124);
              v125.origin.double x = x;
              v125.origin.CGFloat y = y;
              v125.size.CGFloat width = width;
              v125.size.CGFloat height = height;
              CGFloat v55 = CGRectGetMaxX(v125);
              CGFloat v56 = y;
              double x = MaxX - v55;
            }
            else
            {
              CGFloat v56 = y;
            }
            double v57 = x;
            CGFloat v58 = width;
            CGFloat v59 = height;
            CGRect v126 = CGRectInset(*(CGRect *)(&v56 - 1), -a6, -a6);
            CGFloat v110 = v126.origin.y;
            CGFloat v113 = v126.origin.x;
            CGFloat v105 = v126.size.height;
            CGFloat v107 = v126.size.width;
            double rectb = CGRectGetMinX(v126);
            v127.origin.double x = v83;
            v127.origin.CGFloat y = v92;
            v127.size.CGFloat width = v82;
            v127.size.CGFloat height = v91;
            CGFloat MinX = CGRectGetMinX(v127);
            UIRoundToScale(rectb - MinX, v94);
            double recta = v61;
            v128.origin.double x = v83;
            v128.origin.CGFloat y = v92;
            v128.size.CGFloat width = v82;
            v128.size.CGFloat height = v91;
            double v99 = CGRectGetMaxX(v128);
            v129.origin.double x = v113;
            v129.origin.CGFloat y = v110;
            v129.size.CGFloat width = v107;
            v129.size.CGFloat height = v105;
            CGFloat v62 = CGRectGetMaxX(v129);
            UIRoundToScale(v99 - v62, v94);
            double v100 = v63;
            v130.origin.double x = v113;
            v130.origin.CGFloat y = v110;
            v130.size.CGFloat width = v107;
            v130.size.CGFloat height = v105;
            double MinY = CGRectGetMinY(v130);
            v131.origin.double x = v83;
            v131.origin.CGFloat y = v92;
            v131.size.CGFloat width = v82;
            v131.size.CGFloat height = v91;
            CGFloat v64 = CGRectGetMinY(v131);
            UIRoundToScale(MinY - v64, v94);
            double v97 = v65;
            v132.origin.double x = v83;
            v132.origin.CGFloat y = v92;
            v132.size.CGFloat width = v82;
            v132.size.CGFloat height = v91;
            double MaxY = CGRectGetMaxY(v132);
            v133.origin.CGFloat y = v110;
            v133.origin.double x = v113;
            v133.size.CGFloat height = v105;
            v133.size.CGFloat width = v107;
            CGFloat v67 = CGRectGetMaxY(v133);
            UIRoundToScale(MaxY - v67, v94);
            double v69 = v68;
            if (v49) {
              double v70 = v97;
            }
            else {
              double v70 = v16;
            }
            if ((v49 & 2) != 0) {
              double v71 = recta;
            }
            else {
              double v71 = v17;
            }
            if ((v49 & 4) != 0) {
              double v72 = v69;
            }
            else {
              double v72 = v19;
            }
            if ((v49 & 8) != 0) {
              double v73 = v100;
            }
            else {
              double v73 = v18;
            }
            double v16 = UIEdgeInsetsMax(~v49, v70, v71, v72, v73, v97);
            double v17 = v74;
            double v19 = v75;
            double v18 = v76;
          }
        }
      }
    }
  }
  double v77 = v16;
  double v78 = v17;
  double v79 = v19;
  double v80 = v18;
  result.double right = v80;
  result.double bottom = v79;
  result.double left = v78;
  result.double top = v77;
  return result;
}

- (UIEdgeInsets)_cachedHorizontalScrollIndicatorBaseInsets
{
  double top = self->_cachedHorizontalScrollIndicatorBaseInsets.top;
  double left = self->_cachedHorizontalScrollIndicatorBaseInsets.left;
  double bottom = self->_cachedHorizontalScrollIndicatorBaseInsets.bottom;
  double right = self->_cachedHorizontalScrollIndicatorBaseInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  p_horizontalScrollIndicatorInsets = &self->_horizontalScrollIndicatorInsets;
  float64x2_t v3 = *(float64x2_t *)&self->_horizontalScrollIndicatorInsets.top;
  float64x2_t v4 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v3, v4), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_horizontalScrollIndicatorInsets.bottom, v4))))) & 1) == 0)
  {
    p_horizontalScrollIndicatorInsets = &self->_scrollIndicatorInset;
    v3.f64[0] = self->_scrollIndicatorInset.top;
  }
  double bottom = p_horizontalScrollIndicatorInsets->bottom;
  double right = p_horizontalScrollIndicatorInsets->right;
  double left = p_horizontalScrollIndicatorInsets->left;
  result.double top = v3.f64[0];
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  return result;
}

- (UIEdgeInsets)_safeAreaInsetsConsultingAlternativeTopInsetIfApplicable
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(UIView *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x4000000000000000) != 0)
  {
    double v11 = [(UIView *)self _viewControllerForAncestor];
    double v12 = [v11 navigationController];
    double v13 = [v12 _outermostNavigationController];

    if (!v13)
    {
      double v14 = [v11 presentingViewController];
      double v15 = [v14 navigationController];
      double v13 = [v15 _outermostNavigationController];
    }
    double v16 = [(UIView *)self superview];
    if (v16 && v13 && [(UIScrollView *)self _isScrollViewScrollObserver:v13])
    {
      int v17 = [v13 isViewLoaded];

      if (v17)
      {
        double v18 = [(UIView *)self superview];
        [(UIView *)self frame];
        double v20 = v19;
        double v22 = v21;
        double v23 = [v13 _existingView];
        objc_msgSend(v18, "convertPoint:toView:", v23, v20, v22);
        double v25 = v24;

        [(UIScrollView *)self _alternativeVerticalScrollIndicatorTopSafeAreaInset];
        double v4 = fmax(fmin(v26 - v25, v26), 0.0);
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
    }
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &_safeAreaInsetsConsultingAlternativeTopInsetIfApplicable___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      double v32 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        int v33 = 138412290;
        double v34 = self;
        _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "%@ abandoned with _scrollViewFlags.verticalScrollIndicatorUsesAlternativeTopSafeAreaInset on. Turning it off now.", (uint8_t *)&v33, 0xCu);
      }
    }
    *(void *)((char *)&self->_scrollViewFlags + 12) &= ~0x4000000000000000uLL;
    goto LABEL_12;
  }
LABEL_13:
  double v28 = v4;
  double v29 = v6;
  double v30 = v8;
  double v31 = v10;
  result.double right = v31;
  result.double bottom = v30;
  result.double left = v29;
  result.double top = v28;
  return result;
}

- (UIEdgeInsets)_computeBaseInsetsForHorizontalScrollIndicatorWithClientInsets:(UIEdgeInsets)a3
{
  BOOL v4 = a3.bottom != 0.0;
  if (a3.right != 0.0) {
    BOOL v4 = 1;
  }
  if (a3.top != 0.0) {
    BOOL v4 = 1;
  }
  uint64_t v5 = a3.left != 0.0 || v4;
  [(UIScrollView *)self _horizontalScrollIndicatorHeight];
  double v7 = v6;
  [(UIScrollView *)self _scrollIndicatorAdditionalInset];
  [(UIScrollView *)self _baseInsetsForAccessoryOnEdge:4 hasCustomClientInsets:v5 accessorySize:v7 additionalInsetFromEdge:v8];
  result.double right = v12;
  result.double bottom = v11;
  result.double left = v10;
  result.double top = v9;
  return result;
}

- (void)_endPanNormal:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ((double v5 = CACurrentMediaTime() - self->_lastUpdateTime,
         [(UIView *)self _screen],
         double v6 = objc_claimAutoreleasedReturnValue(),
         double v7 = 1.0 / (double)[v6 _maximumFramesPerSecond] * 0.8,
         v6,
         v5 > v7)
      ? (BOOL v8 = v5 < v7 * 3.0)
      : (BOOL v8 = 0),
        v8))
  {
    kdebug_trace();
    int v9 = 0;
  }
  else
  {
    int v9 = 1;
  }
  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  [(UIScrollView *)self contentOffset];
  double v15 = v14;
  double v17 = v16;
  -[UIScrollView _updateDecelerationLastOffsetScrollViewPoint:](self, "_updateDecelerationLastOffsetScrollViewPoint:");
  p_uint64_t scrollViewFlags = &self->_scrollViewFlags;
  uint64_t scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x800000) == 0) {
    goto LABEL_62;
  }
  double v102 = v13;
  double v100 = v17;
  [(UIScrollView *)self contentOffset];
  double v21 = v20;
  double v23 = v22;
  [(UIScrollView *)self _effectiveContentInset];
  accuracCGFloat y = self->_accuracy;
  double v29 = self->_firstPageOffset.horizontal - v28;
  double v101 = v15;
  if (accuracy == 1.0)
  {
    double v31 = round(v29);
    double v32 = v24;
    double v35 = round(self->_firstPageOffset.vertical - v24);
    double v38 = round(v26 + self->_contentSize.width);
    double v39 = v25;
    double v42 = round(v25 + self->_contentSize.height);
  }
  else
  {
    double v30 = floor(v29);
    double v31 = v30 + round(accuracy * (v29 - v30)) / accuracy;
    double v32 = v24;
    double v33 = self->_firstPageOffset.vertical - v24;
    double v34 = floor(v33);
    double v35 = v34 + round(accuracy * (v33 - v34)) / accuracy;
    double v36 = v26 + self->_contentSize.width;
    double v37 = floor(v36);
    double v38 = v37 + round(accuracy * (v36 - v37)) / accuracy;
    double v39 = v25;
    double v40 = v25 + self->_contentSize.height;
    double v41 = floor(v40);
    double v42 = v41 + round(accuracy * (v40 - v41)) / accuracy;
  }
  double v43 = v38 - v11;
  double v44 = v42 - v102;
  if (v31 >= v43) {
    double v45 = v31;
  }
  else {
    double v45 = v43;
  }
  if (v35 >= v44) {
    double v46 = v35;
  }
  else {
    double v46 = v44;
  }
  [(UIScrollViewPanGestureRecognizer *)self->_pan velocityInView:self];
  if (v48 == *MEMORY[0x1E4F1DAD8] && v47 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    self->_verticalVelocitCGFloat y = 0.0;
    self->_horizontalVelocitCGFloat y = 0.0;
  }
  uint64_t v50 = *(void *)p_scrollViewFlags;
  BOOL v53 = v21 >= v31 && v23 >= v35 && v21 <= v45 && v23 <= v46;
  double v54 = v39;
  uint64_t v99 = 416;
  if (!v53)
  {
    BOOL v55 = v3;
    int v56 = v9;
    *(void *)p_uint64_t scrollViewFlags = v50 & 0xFFFFFFFFFF7FFFFFLL;
    self->_fastScrollCount = 0;
    self->_fastScrollMultiplier = 1.0;
    BOOL v57 = (*((unsigned char *)&self->_scrollViewFlags + 3) & 0x40) == 0;
    double v17 = v100;
    double v15 = v101;
    double v58 = v32;
    goto LABEL_42;
  }
  double v15 = v101;
  double v58 = v32;
  if ((v50 & 2) == 0)
  {
    BOOL v55 = v3;
    int v56 = v9;
    BOOL v57 = 0;
    self->_verticalVelocitCGFloat y = 0.0;
    uint64_t v59 = 736;
LABEL_40:
    *(Class *)((char *)&self->super.super.super.isa + v59) = 0;
    *(void *)p_scrollViewFlags &= ~0x800000uLL;
    self->_fastScrollCount = 0;
    self->_fastScrollMultiplier = 1.0;
LABEL_41:
    double v17 = v100;
    goto LABEL_42;
  }
  if (self->_currentScrollDeviceCategory == 6
    || (double v60 = self->_horizontalVelocity * self->_horizontalVelocity + self->_verticalVelocity * self->_verticalVelocity,
        v60 < 0.0625))
  {
    BOOL v55 = v3;
    int v56 = v9;
    BOOL v57 = 0;
    self->_verticalVelocitCGFloat y = 0.0;
    self->_horizontalVelocitCGFloat y = 0.0;
    self->_previousVerticalVelocitCGFloat y = 0.0;
    uint64_t v59 = 752;
    goto LABEL_40;
  }
  if (v60 < 0.36)
  {
    BOOL v55 = v3;
    int v56 = v9;
    self->_fastScrollCount = 0;
    self->_fastScrollMultiplier = 1.0;
LABEL_110:
    BOOL v57 = 1;
    goto LABEL_41;
  }
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    BOOL v55 = v3;
    int v56 = v9;
    goto LABEL_110;
  }
  double v94 = v39;
  BOOL v55 = v3;
  int v56 = v9;
  ++self->_fastScrollCount;
  CGFloat v95 = [(UIGestureRecognizer *)self->_pan _activeEventOfType:10];
  if (!v95)
  {
    CGFloat v95 = [(UIGestureRecognizer *)self->_pan _activeEventOfType:0];
    if (!v95)
    {
      uint64_t v96 = (void *)UIApp;
      double v97 = [(UIView *)self window];
      CGFloat v95 = [v96 _touchesEventForWindow:v97];
    }
  }
  objc_msgSend(v95, "timestamp", 416);
  self->_fastScrollEndTime = v98;

  BOOL v57 = 1;
  double v17 = v100;
  double v54 = v94;
LABEL_42:
  unint64_t v61 = *((unsigned int *)&self->_scrollViewFlags + 5);
  uint64_t v62 = (v61 >> 11) & 0xF;
  if ((unint64_t)(v62 - 1) > 3)
  {
    int v9 = v56;
    BOOL v3 = v55;
  }
  else
  {
    if (!v57)
    {
      knobFeedbackGenerator = self->_knobFeedbackGenerator;
      double v64 = v54;
      [(UIPanGestureRecognizer *)self->_pan locationInView:self];
      -[UIFeedbackGeneratorUserInteractionDriven pressedUpAtLocation:](knobFeedbackGenerator, "pressedUpAtLocation:");
      double v54 = v64;
    }
    unint64_t v65 = v61 >> 11;
    double v66 = self->_accuracy;
    if (v66 == 1.0)
    {
      double v68 = round(v102);
    }
    else
    {
      double v67 = floor(v102);
      double v68 = v67 + round((v102 - v67) * v66) / v66;
    }
    int v9 = v56;
    BOOL v3 = v55;
    if ((v65 & 0xD) == 1)
    {
      double v69 = &OBJC_IVAR___UIScrollView__verticalVelocity;
    }
    else
    {
      double v69 = &OBJC_IVAR___UIScrollView__horizontalVelocity;
      if (v62 != 4 && v62 != 2)
      {
        BOOL v57 = 0;
        goto LABEL_57;
      }
    }
    double v70 = (v54 + v58 + *(double *)((char *)&self->super.super._responderFlags + (int)v99)) / v68;
    *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x40000u;
    uint64_t v71 = *v69;
    double v72 = *(double *)((char *)&self->super.super.super.isa + v71);
    if (v72 > 3.0) {
      double v72 = 3.0;
    }
    *(double *)((char *)&self->super.super.super.isa + v71) = v70 * -0.66 * fmax(v72, -3.0);
    self->_previousVerticalVelocitCGFloat y = 0.0;
    self->_previousHorizontalVelocitCGFloat y = 0.0;
    BOOL v57 = 1;
  }
LABEL_57:
  UIScrollViewKeyboardDismissMode v73 = [(UIScrollView *)self keyboardDismissMode];
  if (v73 == UIScrollViewKeyboardDismissModeInteractiveWithAccessory
    || v73 == UIScrollViewKeyboardDismissModeInteractive)
  {
    double v74 = +[UIPeripheralHost sharedInstance];
    [v74 scrollView:self didFinishPanGesture:self->_pan];
  }
  if (v57)
  {
    BOOL v75 = 1;
    goto LABEL_70;
  }
LABEL_62:
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    if (-[UIScrollView _contentOffsetIsAtPagingBoundary:](self, "_contentOffsetIsAtPagingBoundary:", v15, v17))
    {
LABEL_65:
      BOOL v75 = 0;
      goto LABEL_70;
    }
  }
  else if (![(UIScrollView *)self _isBouncing] || (*((unsigned char *)&self->_scrollViewFlags + 3) & 0x40) != 0)
  {
    goto LABEL_65;
  }
  uint64_t v76 = *(void *)((char *)&self->_scrollViewFlags + 12);
  BOOL v75 = (v76 & 0x100000000000) == 0;
  if ((v76 & 0x100000000000) == 0 && !v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
    BOOL v75 = WeakRetained == 0;
  }
LABEL_70:
  previousHorizontalVelocitCGFloat y = self->_previousHorizontalVelocity;
  if (previousHorizontalVelocity != 0.0 || self->_previousVerticalVelocity != 0.0)
  {
    self->_horizontalVelocitCGFloat y = previousHorizontalVelocity * 0.75 + self->_horizontalVelocity * 0.25;
    self->_verticalVelocitCGFloat y = self->_verticalVelocity * 0.25 + self->_previousVerticalVelocity * 0.75;
  }
  CGSize v79 = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_adjustedDecelerationFactor = (CGSize)*MEMORY[0x1E4F1DB30];
  *(void *)((char *)&self->_scrollViewFlags + 12) &= 0xFFFFFF3FFFFFFFFFLL;
  CGSize v103 = v79;
  if ((scrollViewFlags & 0x800000) != 0)
  {
    BOOL v83 = [(UIScrollView *)self _scrollViewWillEndDraggingWithDeceleration:v75];
    [(UIScrollView *)self _scrollViewDidEndDraggingForDelegateWithDeceleration:v83];
    if (!v83) {
      goto LABEL_75;
    }
LABEL_85:
    if (v3) {
      double v84 = @"endPanNormal:YES will smooth scroll";
    }
    else {
      double v84 = @"endPanNormal:NO will smooth scroll";
    }
    [(UIScrollView *)self _pushTrackingRunLoopModeIfNecessaryForReason:v84];
    int v82 = 1;
    [(UIScrollView *)self _startTimer:1];
    goto LABEL_89;
  }
  [(_UIScrollViewScrollableAncestor *)self->_scrollableAncestor _descendentScrollViewDidCancelDragging:self];
  if (v75) {
    goto LABEL_85;
  }
LABEL_75:
  if (self->_scrollHeartbeat)
  {
    self->_telemetryOffsetChangeHighRateDuration = 0.0;
    self->_telemetryOffsetChangeCount = 0;
    self->_telemetryOffsetChange = v103;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &_endPanNormal____s_category);
    CGRect v81 = *(id *)(CategoryCachedImpl + 8);
    if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
      && os_signpost_enabled(v81))
    {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    [(CADisplayLink *)self->_scrollHeartbeat setPaused:0];
  }
  *(void *)p_scrollViewFlags &= ~0x800000uLL;
  if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)self)
    || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self))
  {
    [(UIScrollView *)self _adjustScrollerIndicators:0 alwaysShowingThem:0];
  }
  int v82 = 0;
LABEL_89:
  [(UIScrollView *)self _updateAccessories];
  if (!self->_scrollHeartbeat)
  {
    if (v3) {
      double v85 = @"endPanNormal:YES has no timer";
    }
    else {
      double v85 = @"endPanNormal:NO has no timer";
    }
    [(UIScrollView *)self _popTrackingRunLoopModeIfNecessaryForReason:v85];
  }
  if (((v9 | v82 ^ 1) & 1) == 0 && self->_scrollHeartbeat)
  {
    double v86 = [(UIView *)self _screen];
    double v87 = -1.0 / (double)[v86 _maximumFramesPerSecond];

    double v88 = CACurrentMediaTime();
    self->_lastUpdateTime = v88 + v87;
    asyncScrollDecelerationState = self->_asyncScrollDecelerationState;
    if (asyncScrollDecelerationState) {
      asyncScrollDecelerationState->_lastUpdateTime = v88 + v87;
    }
    [(UIScrollView *)self _trackingDidEnd];
    [(UIScrollView *)self _smoothScrollWithUpdateTime:v88];
  }
  if ((v82 & 1) == 0) {
    [(UIScrollView *)self _setKnobInteractionGestureDelayed:0];
  }
  double v90 = (void *)UIApp;
  double v91 = [(UIView *)self window];
  id v92 = (id)[v90 _touchesEventForWindow:v91];

  [v92 timestamp];
  self->_lastPanGestureEndTime = v93;
}

- (void)_updateAccessories
{
  if ([(NSMutableDictionary *)self->_accessoryViews count])
  {
    [(UIScrollView *)self _contentInsetForAccessories];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(UIView *)self bounds];
    accessoryViews = self->_accessoryViews;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __34__UIScrollView__updateAccessories__block_invoke;
    v16[3] = &unk_1E530F480;
    v16[4] = self;
    *(double *)&v16[5] = v6 + v12;
    *(double *)&v16[6] = v4 + v13;
    *(double *)&v16[7] = v14 - (v6 + v10);
    *(double *)&v16[8] = v15 - (v4 + v8);
    [(NSMutableDictionary *)accessoryViews enumerateKeysAndObjectsUsingBlock:v16];
  }
  [(UIScrollView *)self _updateAccessoriesInset];
}

- (void)_stopScrollingAndZoomingAnimationsPinningToContentViewport:(BOOL)a3 tramplingAnimationDependentFlags:(BOOL)a4
{
  BOOL v4 = a3;
  [(UIScrollView *)self _stopScrollingNotify:0 pin:a3 tramplingAnimationDependentFlags:a4];
  if ([(UIScrollView *)self isScrollAnimating])
  {
    double v6 = +[UIAnimator sharedAnimator];
    [v6 removeAnimationsForTarget:self ofKind:objc_opt_class()];

    [(UIScrollView *)self _clearContentOffsetAnimation];
  }
  if ([(UIScrollView *)self isZoomAnimating])
  {
    id v17 = [(UIScrollView *)self _getDelegateZoomView];
    id zoomAnimation = self->_zoomAnimation;
    self->_id zoomAnimation = 0;

    if ([(UIScrollView *)self _ownsAnimationForKey:@"transform" ofView:v17])
    {
      double v8 = [v17 layer];
      [v8 removeAnimationForKey:@"transform"];
    }
    if ([(UIScrollView *)self _ownsAnimationForKey:@"position" ofView:v17])
    {
      double v9 = [v17 layer];
      [v9 removeAnimationForKey:@"position"];
    }
    if ([(UIScrollView *)self _ownsAnimationForKey:@"bounds" ofView:self])
    {
      double v10 = [(UIView *)self layer];
      [v10 removeAnimationForKey:@"bounds"];
    }
    if ([(UIScrollView *)self _ownsAnimationForKey:@"bounds.origin" ofView:self])
    {
      double v11 = [(UIView *)self layer];
      [v11 removeAnimationForKey:@"bounds.origin"];
    }
    if ([(UIScrollView *)self _ownsAnimationForKey:@"bounds.size" ofView:self])
    {
      double v12 = [(UIView *)self layer];
      [v12 removeAnimationForKey:@"bounds.size"];
    }
    [(UIViewAnimationState *)self->_zoomAnimationState sendDelegateDidStopManually:1];
    if (v4)
    {
      [(UIScrollView *)self zoomScale];
      double v14 = v13;
      [(UIScrollView *)self _zoomAnchorPoint];
      -[UIScrollView setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:](self, "setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:", 0, 0, 0, v14, v15, v16, 0.0);
    }
  }
}

- (void)_popTrackingRunLoopModeIfNecessaryForReason:(id)a3
{
  id v13 = a3;
  uint64_t scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x100000000) != 0)
  {
    *(void *)&self->_uint64_t scrollViewFlags = scrollViewFlags & 0xFFFFFFFEFFFFFFFFLL;
    if ([(id)UIApp _isSpringBoard])
    {
      trackingWatchdogTimer = self->_trackingWatchdogTimer;
      if (trackingWatchdogTimer)
      {
        [(NSTimer *)trackingWatchdogTimer invalidate];
        double v6 = self->_trackingWatchdogTimer;
        self->_trackingWatchdogTimer = 0;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystemHoldingLock);
    [WeakRetained _unlockEnvironment:self];

    objc_storeWeak((id *)&self->_focusSystemHoldingLock, 0);
    objc_storeStrong((id *)&GScrollerPoppingRunLoopMode, self);
    [(id)UIApp _popRunLoopMode:@"UITrackingRunLoopMode" requester:self reason:v13];
    double v8 = (void *)GScrollerPoppingRunLoopMode;
    GScrollerPoppingRunLoopMode = 0;

    id v9 = objc_loadWeakRetained((id *)&self->_animation);
    if (!v9
      || (double v10 = v9,
          double v11 = (unsigned __int8 *)objc_loadWeakRetained((id *)&self->_animation),
          int v12 = v11[152],
          v11,
          v10,
          !v12))
    {
      [(UIScrollView *)self _endScrollingCursorOverrideIfNecessary];
    }
  }
}

- (BOOL)isZoomAnimating
{
  return self->_zoomAnimation != 0;
}

- (void)_adjustScrollIndicatorsIfNeeded:(int)a3 forceRebuild:
{
  if (!a1) {
    return;
  }
  if ((a2 & 2) != 0)
  {
    BOOL v6 = -[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)a1);
    double v7 = (void *)a1[190];
    if (v7) {
      BOOL v8 = (!v6 | a3) == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      [v7 removeFromSuperview];
      id v9 = (void *)a1[190];
      a1[190] = 0;
    }
    if ((a2 & 1) == 0)
    {
      if (!v6) {
        return;
      }
      goto LABEL_19;
    }
  }
  else
  {
    if ((a2 & 1) == 0) {
      return;
    }
    BOOL v6 = 0;
  }
  BOOL v10 = -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)a1);
  double v11 = (void *)a1[191];
  if (v11) {
    BOOL v12 = (!v10 | a3) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    [v11 removeFromSuperview];
    id v13 = (void *)a1[191];
    a1[191] = 0;
  }
  if (v6 || v10)
  {
LABEL_19:
    [a1 _adjustScrollerIndicators:1 alwaysShowingThem:0];
  }
}

- (BOOL)_effectiveShowsVerticalScrollIndicator
{
  if (result)
  {
    if ((*(unsigned char *)(result + 1763) & 2) != 0 && !*(void *)(result + 504))
    {
      id v1 = *(id *)(result + 1912);
      if ([v1 count])
      {
        int v2 = [v1 objectForKeyedSubscript:&unk_1ED3F73F8];
        if (v2)
        {
          BOOL v3 = 1;
        }
        else
        {
          BOOL v4 = [v1 objectForKeyedSubscript:&unk_1ED3F7410];
          if (v4)
          {
            BOOL v3 = 1;
          }
          else
          {
            double v5 = [v1 objectForKeyedSubscript:&unk_1ED3F7428];
            if (v5)
            {
              BOOL v3 = 1;
            }
            else
            {
              BOOL v6 = [v1 objectForKeyedSubscript:&unk_1ED3F7440];
              BOOL v3 = v6 != 0;
            }
          }
        }
      }
      else
      {
        BOOL v3 = 0;
      }

      return !v3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)_effectiveShowsHorizontalScrollIndicator
{
  if (result)
  {
    if ((*(unsigned char *)(result + 1763) & 1) != 0 && !*(void *)(result + 504))
    {
      id v1 = *(id *)(result + 1912);
      if ([v1 count])
      {
        int v2 = [v1 objectForKeyedSubscript:&unk_1ED3F73C8];
        if (v2)
        {
          BOOL v3 = 1;
        }
        else
        {
          BOOL v4 = [v1 objectForKeyedSubscript:&unk_1ED3F73E0];
          BOOL v3 = v4 != 0;
        }
      }
      else
      {
        BOOL v3 = 0;
      }

      return !v3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_updateDecelerationLastOffsetScrollViewPoint:(CGPoint)a3
{
  *(CGPoint *)&self->_lastUpdateOffsetX = a3;
  self->_lastUpdateTime = CACurrentMediaTime();
}

- (void)_setKnobInteractionGestureDelayed:(BOOL)a3
{
  knobLongPressGestureRecognizer = self->_knobLongPressGestureRecognizer;
  double v4 = 0.1;
  if (a3) {
    double v4 = 0.25;
  }
  [(UILongPressGestureRecognizer *)knobLongPressGestureRecognizer setMinimumPressDuration:v4];
}

- (void)_handlePanFailure
{
  *(void *)((char *)&self->_scrollViewFlags + 12) &= 0xFFFFFFFFFFFFFC3FLL;
  [(UIScrollView *)self _prepareToPageWithHorizontalVelocity:0.0 verticalVelocity:0.0];
  [(UIScrollView *)self _endPanNormal:0];
  [(UIScrollView *)self _trackingDidEnd];
}

- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4 nudgingBoundsWithVelocity:(BOOL)a5 performExtraPageIfPastPagingBoundary:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  [(UIView *)self bounds];
  double v14 = v13;
  double v16 = v15;
  double v17 = -0.0;
  if (v7) {
    double v18 = a4;
  }
  else {
    double v18 = -0.0;
  }
  if (v7) {
    double v17 = a3;
  }
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    double v95 = v18 + v12;
    double v19 = v17 + v11;
    [(UIScrollView *)self _interpageSpacing];
    double v21 = v14 + v20;
    double v94 = v16;
    double v96 = v16 + v22;
    [(UIScrollView *)self _pagingOrigin];
    double v24 = v23;
    double v97 = v25;
    [(UIScrollView *)self _effectiveContentInset];
    double v91 = v27;
    double v92 = v26;
    double v93 = v28;
    double v30 = v29;
    double v31 = v19 - v24;
    double v32 = fmod(v19 - v24, v21);
    if (v21 <= 0.0 || v32 == 0.0)
    {
      self->_pageDecelerationTarget.double x = v19;
      double v35 = v95;
      goto LABEL_59;
    }
    if (a3 > 0.3)
    {
      if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x80) != 0)
      {
        double v34 = v21 + self->_pageDecelerationTarget.x;
        double v33 = v91;
      }
      else
      {
        self->_pageDecelerationTarget.double x = v19;
        if (!v6)
        {
          double v33 = v91;
          goto LABEL_22;
        }
        double v33 = v91;
        if (v32 / v21 <= 0.5)
        {
LABEL_22:
          double v39 = ceil(v31 / v21);
LABEL_31:
          double v35 = v95;
LABEL_35:
          double v45 = v24 + v21 * v39;
          double horizontal = self->_firstPageOffset.horizontal;
          BOOL v58 = v39 == 0.0;
          double v47 = 0.0;
          if (v58) {
            double v47 = self->_firstPageOffset.horizontal;
          }
          double v48 = v45 + v47;
          self->_pageDecelerationTarget.double x = v48;
          accuracdouble y = self->_accuracy;
          double v50 = horizontal - v33;
          if (accuracy == 1.0)
          {
            double v52 = round(v50);
            double v55 = round(v30 + self->_contentSize.width);
          }
          else
          {
            double v51 = floor(v50);
            double v52 = v51 + round(accuracy * (v50 - v51)) / accuracy;
            double v53 = v30 + self->_contentSize.width;
            double v54 = floor(v53);
            double v55 = v54 + round(accuracy * (v53 - v54)) / accuracy;
          }
          double v56 = v55 - v14;
          if (v56 < v48) {
            double v48 = v56;
          }
          if (v52 >= v48) {
            double v48 = v52;
          }
          self->_pageDecelerationTarget.double x = v48;
          if (a3 <= 0.3)
          {
            if (a3 >= -0.3)
            {
              BOOL v58 = v48 < v19 + v24 || a3 == 0.0;
              char v59 = v58;
              uint64_t v60 = 128;
              if (v59) {
                uint64_t v60 = 0;
              }
              unint64_t v57 = v60 | ((unint64_t)(v48 < v19 + v24) << 6) | *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFF3FLL;
            }
            else
            {
              unint64_t v57 = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFF3FLL | 0x40;
            }
          }
          else
          {
            unint64_t v57 = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFF3FLL | 0x80;
          }
          *(void *)((char *)&self->_scrollViewFlags + 12) = v57;
LABEL_59:
          double v61 = v35 - v97;
          double v62 = fmod(v35 - v97, v96);
          if (v96 <= 0.0 || v62 == 0.0)
          {
            self->_pageDecelerationTarget.double y = v35;
            return;
          }
          if (a4 > 0.3)
          {
            if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x200) != 0)
            {
              double v65 = v96 + self->_pageDecelerationTarget.y;
              double v64 = v92;
              double v63 = v93;
            }
            else
            {
              self->_pageDecelerationTarget.double y = v35;
              if (!v6)
              {
                double v64 = v92;
                double v63 = v93;
                goto LABEL_74;
              }
              double v64 = v92;
              double v63 = v93;
              if (v62 / v96 <= 0.5)
              {
LABEL_74:
                double v68 = ceil(v61 / v96);
LABEL_86:
                double v75 = v97 + v96 * v68;
                double vertical = self->_firstPageOffset.vertical;
                BOOL v58 = v68 == 0.0;
                double v77 = 0.0;
                if (v58) {
                  double v77 = self->_firstPageOffset.vertical;
                }
                double v78 = v75 + v77;
                self->_pageDecelerationTarget.double y = v78;
                double v79 = self->_accuracy;
                double v80 = vertical - v64;
                if (v79 == 1.0)
                {
                  double v82 = round(v80);
                  double v85 = round(v63 + self->_contentSize.height);
                }
                else
                {
                  double v81 = floor(v80);
                  double v82 = v81 + round(v79 * (v80 - v81)) / v79;
                  double v83 = v63 + self->_contentSize.height;
                  double v84 = floor(v83);
                  double v85 = v84 + round(v79 * (v83 - v84)) / v79;
                }
                double v86 = v85 - v94;
                if (v86 < v78) {
                  double v78 = v86;
                }
                if (v82 >= v78) {
                  double v78 = v82;
                }
                self->_pageDecelerationTarget.double y = v78;
                if (a4 <= 0.3)
                {
                  if (a4 >= -0.3)
                  {
                    BOOL v89 = v78 < v35 + v97 || a4 == 0.0;
                    uint64_t v90 = 512;
                    if (v89) {
                      uint64_t v90 = 0;
                    }
                    unint64_t v87 = v90 | ((unint64_t)(v78 < v35 + v97) << 8) | *(void *)((char *)&self->_scrollViewFlags
                                                                                       + 12) & 0xFFFFFFFFFFFFFCFFLL;
                  }
                  else
                  {
                    unint64_t v87 = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFCFFLL | 0x100;
                  }
                }
                else
                {
                  unint64_t v87 = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFCFFLL | 0x200;
                }
                *(void *)((char *)&self->_scrollViewFlags + 12) = v87;
                return;
              }
              double v65 = v35 + v96;
            }
            self->_pageDecelerationTarget.double y = v65;
            double v61 = v65 - v97;
            goto LABEL_74;
          }
          if (a4 >= -0.3)
          {
            self->_pageDecelerationTarget.double y = v35;
            int v69 = dyld_program_sdk_at_least();
            double v63 = v93;
            if (!v69) {
              goto LABEL_79;
            }
            double v70 = self->_accuracy;
            double v71 = v93 + self->_contentSize.height;
            BOOL v58 = v70 == 1.0;
            double v72 = round(v71);
            double v73 = floor(v71);
            double v74 = v73 + round(v70 * (v71 - v73)) / v70;
            if (v58) {
              double v74 = v72;
            }
            if (v35 >= v74 - v94) {
              double v68 = ceil((self->_pageDecelerationTarget.y - v97) / v96);
            }
            else {
LABEL_79:
            }
              double v68 = floor((self->_pageDecelerationTarget.y - v97) / v96 + 0.5);
            double v64 = v92;
            goto LABEL_86;
          }
          if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x100) != 0)
          {
            double y = self->_pageDecelerationTarget.y;
            double v64 = v92;
            double v63 = v93;
          }
          else
          {
            if (!v6)
            {
              double v67 = v35;
              double v64 = v92;
              double v63 = v93;
              goto LABEL_82;
            }
            BOOL v36 = v62 / v96 < 0.5;
            double y = v35;
            double v67 = v35;
            double v64 = v92;
            double v63 = v93;
            if (!v36) {
              goto LABEL_82;
            }
          }
          double v67 = y - v96;
          double v61 = y - v96 - v97;
LABEL_82:
          self->_pageDecelerationTarget.double y = v67;
          double v68 = floor(v61 / v96);
          goto LABEL_86;
        }
        double v34 = v19 + v21;
      }
      self->_pageDecelerationTarget.double x = v34;
      double v31 = v34 - v24;
      goto LABEL_22;
    }
    if (a3 >= -0.3)
    {
      self->_pageDecelerationTarget.double x = v19;
      if (!dyld_program_sdk_at_least()) {
        goto LABEL_27;
      }
      double v40 = self->_accuracy;
      double v41 = v30 + self->_contentSize.width;
      BOOL v58 = v40 == 1.0;
      double v42 = round(v41);
      double v43 = floor(v41);
      double v44 = v43 + round(v40 * (v41 - v43)) / v40;
      if (v58) {
        double v44 = v42;
      }
      if (v19 >= v44 - v14) {
        double v39 = ceil((self->_pageDecelerationTarget.x - v24) / v21);
      }
      else {
LABEL_27:
      }
        double v39 = floor((self->_pageDecelerationTarget.x - v24) / v21 + 0.5);
      double v35 = v95;
      double v33 = v91;
      goto LABEL_35;
    }
    if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x40) != 0)
    {
      double x = self->_pageDecelerationTarget.x;
      double v33 = v91;
    }
    else
    {
      if (!v6)
      {
        double v38 = v19;
        double v33 = v91;
        goto LABEL_30;
      }
      BOOL v36 = v32 / v21 < 0.5;
      double x = v19;
      double v38 = v19;
      double v33 = v91;
      if (!v36) {
        goto LABEL_30;
      }
    }
    double v38 = x - v21;
    double v31 = x - v21 - v24;
LABEL_30:
    self->_pageDecelerationTarget.double x = v38;
    double v39 = floor(v31 / v21);
    goto LABEL_31;
  }
}

- (BOOL)_contentOffsetIsAtPagingBoundary:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  [(UIScrollView *)self _interpageSpacing];
  double v11 = v10;
  long double v13 = v7 + v12;
  [(UIScrollView *)self _pagingOrigin];
  double v15 = v14;
  return fabs(fmod(x - v16, v13)) <= 0.00000011920929 && fabs(fmod(y - v15, v9 + v11)) <= 0.00000011920929;
}

- (CGSize)_interpageSpacing
{
  double width = self->_interpageSpacing.width;
  double height = self->_interpageSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)_pagingOrigin
{
  double x = self->_pagingOrigin.x;
  double y = self->_pagingOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4 nudgingBoundsWithVelocity:(BOOL)a5
{
}

- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4
{
}

- (unint64_t)_edgesAllowingScrollAccessoriesExtendedToBoundingPath
{
  return self->_edgesAllowingScrollAccessoriesExtendedToBoundingPath;
}

- (double)_alternativeVerticalScrollIndicatorTopSafeAreaInset
{
  return self->__alternativeVerticalScrollIndicatorTopSafeAreaInset;
}

- (void)_setSkipsContentOffsetAdjustmentsIfScrolling:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)_shouldAdjustLayoutToDrawTopSeparator
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 17) & 1;
}

- (BOOL)_adjustsContentInsetWhenScrollDisabled
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 2) >> 5) & 1;
}

- (BOOL)isZoomBouncing
{
  return *(unsigned char *)&self->_scrollViewFlags >> 7;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x800000000000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIScrollView;
    [(UIResponder *)&v4 touchesCancelled:a3 withEvent:a4];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x800000000000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIScrollView;
    [(UIResponder *)&v4 touchesBegan:a3 withEvent:a4];
  }
}

- (BOOL)isDragging
{
  return *((unsigned __int8 *)&self->_scrollViewFlags + 2) >> 7;
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator
{
  *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x40000000u;
  -[UIScrollView _setShowsHorizontalScrollIndicator:](self, showsHorizontalScrollIndicator);
}

- (void)_setShowsHorizontalScrollIndicator:(void *)a1
{
  if (a1 && ((((a1[220] & 0x1000000) == 0) ^ a2) & 1) == 0)
  {
    uint64_t v2 = 0x1000000;
    if (!a2) {
      uint64_t v2 = 0;
    }
    a1[220] = a1[220] & 0xFFFFFFFFFEFFFFFFLL | v2;
    -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](a1, 1, 0);
  }
}

- (void)_setShowsVerticalScrollIndicator:(void *)a1
{
  if (a1 && ((((a1[220] & 0x2000000) == 0) ^ a2) & 1) == 0)
  {
    uint64_t v2 = 0x2000000;
    if (!a2) {
      uint64_t v2 = 0;
    }
    a1[220] = a1[220] & 0xFFFFFFFFFDFFFFFFLL | v2;
    -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](a1, 2, 0);
  }
}

- (void)_setDefaultShowsVerticalScrollIndicator:(BOOL)a3
{
  if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x20000000) == 0) {
    -[UIScrollView _setShowsVerticalScrollIndicator:](self, a3);
  }
}

- (void)_hideScrollIndicatorsIfNeededForNewContentSize:(CGSize)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  if (![(UIScrollView *)self _isAutomaticContentOffsetAdjustmentEnabled])
  {
    -[UIScrollView _maximumContentOffsetForContentSize:](self, "_maximumContentOffsetForContentSize:", width, height);
    double v9 = v8;
    double v11 = v10;
    [(UIScrollView *)self contentOffset];
    if (v12 > v11) {
      [(UIScrollView *)self _hideScrollIndicator:self->_verticalScrollIndicator afterDelay:v4 animated:0.0];
    }
    [(UIScrollView *)self contentOffset];
    if (v13 > v9)
    {
      horizontalScrollIndicator = self->_horizontalScrollIndicator;
      [(UIScrollView *)self _hideScrollIndicator:horizontalScrollIndicator afterDelay:v4 animated:0.0];
    }
  }
}

- (CGPoint)_maximumContentOffsetForContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  [(UIScrollView *)self _minimumContentOffset];
  double v11 = v10;
  double v13 = v12;
  [(UIScrollView *)self _effectiveContentInset];
  accuracdouble y = self->_accuracy;
  double v17 = width + v16;
  if (accuracy == 1.0)
  {
    double v19 = round(v17);
    double v22 = round(height + v14);
  }
  else
  {
    double v18 = floor(v17);
    double v19 = v18 + round(accuracy * (v17 - v18)) / accuracy;
    double v20 = height + v14;
    double v21 = floor(v20);
    double v22 = v21 + round(accuracy * (v20 - v21)) / accuracy;
  }
  double v23 = v19 - v7;
  if (v11 >= v23) {
    double v23 = v11;
  }
  double v24 = v22 - v9;
  if (v13 >= v24) {
    double v24 = v13;
  }
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (CGPoint)_minimumContentOffset
{
  [(UIScrollView *)self _effectiveContentInset];
  accuracdouble y = self->_accuracy;
  double v6 = self->_firstPageOffset.horizontal - v5;
  if (accuracy == 1.0)
  {
    double v8 = round(v6);
    double v11 = round(self->_firstPageOffset.vertical - v3);
  }
  else
  {
    double v7 = floor(v6);
    double v8 = v7 + round(accuracy * (v6 - v7)) / accuracy;
    double v9 = self->_firstPageOffset.vertical - v3;
    double v10 = floor(v9);
    double v11 = v10 + round(accuracy * (v9 - v10)) / accuracy;
  }
  double v12 = v8;
  result.double y = v11;
  result.double x = v12;
  return result;
}

- (UIScrollViewContentInsetAdjustmentBehavior)contentInsetAdjustmentBehavior
{
  UIScrollViewContentInsetAdjustmentBehavior result = self->_contentInsetAdjustmentBehavior;
  if (result == 101) {
    return 2;
  }
  if (result == 102) {
    return 0;
  }
  return result;
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  if (!v4)
  {
LABEL_7:
    double v6 = 0;
    goto LABEL_8;
  }
  char v5 = dyld_program_sdk_at_least();
  double v6 = v4;
  if ((v5 & 1) == 0)
  {
    unsigned __int8 v7 = objc_msgSend(v4, sel_allowsWeakReference);
    double v6 = v4;
    if ((v7 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__UIScrollView_setDelegate___block_invoke;
      block[3] = &unk_1E52D9F98;
      id v37 = v4;
      double v38 = self;
      if (setDelegate__once_3 != -1) {
        dispatch_once(&setDelegate__once_3, block);
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  id v8 = v6;

  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  double v10 = WeakRetained;
  if (v8 != WeakRetained || !v8 && (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x2000000) != 0)
  {
    if (WeakRetained) {
      objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 1, 0, (void *)1);
    }
    objc_storeWeak(&self->_delegate, v8);
    id v11 = v8;
    id v12 = [(UIScrollView *)self delegate];
    if (v11 == v12)
    {
      unsigned int v14 = [(UIScrollView *)self allowsWeakReference];

      unint64_t v13 = (unint64_t)(v11 != 0) << 25;
      if (v11 && v14)
      {
        objc_initWeak(&location, self);
        double v15 = [_UIWeakHelper alloc];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __28__UIScrollView_setDelegate___block_invoke_176;
        v33[3] = &unk_1E52DC308;
        objc_copyWeak(&v34, &location);
        double v16 = [(_UIWeakHelper *)v15 initWithDeallocationBlock:v33];
        objc_setAssociatedObject(v11, (char *)&self->super.super.super.isa + 1, v16, (void *)1);

        objc_destroyWeak(&v34);
        objc_destroyWeak(&location);
        unint64_t v13 = 0x2000000;
      }
    }
    else
    {

      unint64_t v13 = (unint64_t)(v11 != 0) << 25;
    }

    p_uint64_t scrollViewFlags = &self->_scrollViewFlags;
    unint64_t v18 = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFDFFFFFFLL | v13;
    *((_DWORD *)p_scrollViewFlags + 5) = *((_DWORD *)p_scrollViewFlags + 5);
    *(void *)((char *)p_scrollViewFlags + 12) = v18;
    char v19 = objc_opt_respondsToSelector();
    uint64_t v20 = 0x100000;
    if ((v19 & 1) == 0) {
      uint64_t v20 = 0;
    }
    *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFEFFFFFLL | v20;
    char v21 = objc_opt_respondsToSelector();
    uint64_t v22 = 0x200000;
    if ((v21 & 1) == 0) {
      uint64_t v22 = 0;
    }
    *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFDFFFFFLL | v22;
    char v23 = objc_opt_respondsToSelector();
    uint64_t v24 = 0x400000;
    if ((v23 & 1) == 0) {
      uint64_t v24 = 0;
    }
    *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFBFFFFFLL | v24;
    char v25 = objc_opt_respondsToSelector();
    uint64_t v26 = 0x800000;
    if ((v25 & 1) == 0) {
      uint64_t v26 = 0;
    }
    *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFF7FFFFFLL | v26;
    char v27 = objc_opt_respondsToSelector();
    uint64_t v28 = 0x1000000;
    if ((v27 & 1) == 0) {
      uint64_t v28 = 0;
    }
    *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFEFFFFFFLL | v28;
    char v29 = objc_opt_respondsToSelector();
    uint64_t v30 = 0x10000000000000;
    if ((v29 & 1) == 0) {
      uint64_t v30 = 0;
    }
    *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFEFFFFFFFFFFFFFLL | v30;
    char v31 = objc_opt_respondsToSelector();
    uint64_t v32 = 0x20000000000000;
    if ((v31 & 1) == 0) {
      uint64_t v32 = 0;
    }
    *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFDFFFFFFFFFFFFFLL | v32;
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

void __28__UIScrollView_setDelegate___block_invoke_176(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained delegate];
    if (!v2) {
      [v3 setDelegate:0];
    }

    id WeakRetained = v3;
  }
}

- (void)_setFirstPageOffset:(UIOffset)a3
{
  self->_firstPageOffset = a3;
}

- (void)dealloc
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x18C108260](self, a2);
  [(UIScrollView *)self setDelegate:0];
  [(UIScrollView *)self _stopScrollingAndZoomingAnimationsPinningToContentViewport:0];
  [(UIScrollView *)self setScrollTestParameters:0];
  shadows = self->_shadows;
  if (shadows) {
    free(shadows);
  }
  char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"_UIScrollViewSpringBoardBlankedScreenNotification" object:0];

  [(UIScrollViewPanGestureRecognizer *)self->_pan setScrollView:0];
  [(UIScrollViewPinchGestureRecognizer *)self->_pinch setScrollView:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v6 = [(UIView *)self gestureRecognizers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) removeTarget:self action:0];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  pan = self->_pan;
  self->_pan = 0;

  pinch = self->_pinch;
  self->_pinch = 0;

  touchDelayGestureRecognizer = self->_touchDelayGestureRecognizer;
  self->_touchDelayGestureRecognizer = 0;

  knobLongPressGestureRecognizer = self->_knobLongPressGestureRecognizer;
  self->_knobLongPressGestureRecognizer = 0;

  knobPointerLongPressGestureRecognizer = self->_knobPointerLongPressGestureRecognizer;
  self->_knobPointerLongPressGestureRecognizer = 0;

  knobHoverGestureRecognizer = self->_knobHoverGestureRecognizer;
  self->_knobHoverGestureRecognizer = 0;

  dragAutoScrollGestureRecognizer = self->_dragAutoScrollGestureRecognizer;
  self->_dragAutoScrollGestureRecognizer = 0;

  autoScrollAssistant = self->_autoScrollAssistant;
  self->_autoScrollAssistant = 0;

  lowFidelitySwipeGestureRecognizers = self->_lowFidelitySwipeGestureRecognizers;
  if (self->_lowFidelitySwipeGestureRecognizers[0])
  {
    for (uint64_t j = 0; j != 4; ++j)
    {
      char v21 = lowFidelitySwipeGestureRecognizers[j];
      if (v21)
      {
        lowFidelitySwipeGestureRecognizers[j] = 0;
      }
    }
  }
  [(NSISVariable *)self->_contentWidthVariable setDelegate:0];
  contentWidthVariable = self->_contentWidthVariable;
  self->_contentWidthVariable = 0;

  [(NSISVariable *)self->_contentHeightVariable setDelegate:0];
  contentHeightVariable = self->_contentHeightVariable;
  self->_contentHeightVariable = 0;

  [(NSISVariable *)self->_contentXOffsetVariable setDelegate:0];
  contentXOffsetVariable = self->_contentXOffsetVariable;
  self->_contentXOffsetVariable = 0;

  [(NSISVariable *)self->_contentYOffsetVariable setDelegate:0];
  contentYOffsetVariable = self->_contentYOffsetVariable;
  self->_contentYOffsetVariable = 0;

  automaticContentConstraints = self->_automaticContentConstraints;
  self->_automaticContentConstraints = 0;

  v27.receiver = self;
  v27.super_class = (Class)UIScrollView;
  [(UIView *)&v27 dealloc];
}

- (void)_stopScrollingAndZoomingAnimationsPinningToContentViewport:(BOOL)a3
{
}

- (void)setScrollTestParameters:(id)a3
{
}

void __44__UIScrollView__didMoveFromWindow_toWindow___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = v3;
    if (WeakRetained) {
      [v3 startScrollViewMonitoring];
    }
    else {
      [v3 stopScrollViewMonitoring];
    }
  }
}

- (void)layoutSubviews
{
  if (dyld_program_sdk_at_least()) {
    [(UIScrollView *)self _applyConstrainedContentSizeIfNecessary];
  }
  v3.receiver = self;
  v3.super_class = (Class)UIScrollView;
  [(UIView *)&v3 layoutSubviews];
  [(UIScrollView *)self _applyConstrainedContentSizeIfNecessary];
  [(UIScrollView *)self _centerContentIfNecessary];
  [(UIScrollView *)self _scrollViewDidLayoutSubviews];
}

- (void)_applyConstrainedContentSizeIfNecessary
{
  if (dyld_program_sdk_at_least()
    && (*(void *)&self->super._viewFlags & 0x800000000000000) != 0
    && (~*(void *)((char *)&self->_scrollViewFlags + 12) & 0x60000000000) == 0)
  {
    [(UIScrollView *)self _nsis_contentSize];
    -[UIScrollView setContentSize:](self, "setContentSize:");
    *(void *)((char *)&self->_scrollViewFlags + 12) &= ~0x40000000000uLL;
  }
}

- (void)_centerContentIfNecessaryAdjustingContentOffset:(BOOL)a3
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x4000000) != 0)
  {
    BOOL v3 = a3;
    char v5 = [(UIScrollView *)self _getDelegateZoomView];
    if (v5)
    {
      id v36 = v5;
      [v5 frame];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      [(UIView *)self bounds];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [(UIScrollView *)self _contentInsetIncludingDecorations];
      double v24 = v23 + v13 + v22;
      double v27 = v26 + v25 + self->_contentSize.width;
      double v28 = v23 + v22 + self->_contentSize.height;
      double v29 = v26 + v11 + v25;
      if (v27 >= v19) {
        double width = self->_contentSize.width;
      }
      else {
        double width = v19;
      }
      if (v27 >= v19) {
        double v29 = v11;
      }
      double v31 = width * 0.5 - v29 * 0.5;
      BOOL v32 = v28 < v21;
      if (v28 >= v21) {
        double height = self->_contentSize.height;
      }
      else {
        double height = v21;
      }
      if (v32) {
        double v34 = v24;
      }
      else {
        double v34 = v13;
      }
      double v35 = height * 0.5 - v34 * 0.5;
      if (v3 && [(UIScrollView *)self isZooming]) {
        -[UIScrollView setContentOffset:](self, "setContentOffset:", v15 + v31 - v7, v17 + v35 - v9);
      }
      objc_msgSend(v36, "setFrame:", v31, v35, v11, v13);
      char v5 = v36;
    }
  }
}

- (void)_centerContentIfNecessary
{
}

- (void)_addContentSubview:(id)a3 atBack:(BOOL)a4
{
  BOOL v4 = a4;
  id v22 = a3;
  if (v4)
  {
    shadows = self->_shadows;
    if (!shadows || (double v7 = (_UIScrollViewScrollIndicator *)*shadows) == 0)
    {
      double v13 = [(UIView *)self layer];
      double v8 = [v13 sublayers];

      if (![(_UIScrollViewScrollIndicator *)v8 count]
        || ([(_UIScrollViewScrollIndicator *)v8 objectAtIndex:0],
            double v14 = objc_claimAutoreleasedReturnValue(),
            [v22 layer],
            double v15 = objc_claimAutoreleasedReturnValue(),
            v15,
            v14,
            v14 != v15))
      {
        [(UIView *)self insertSubview:v22 atIndex:0];
      }
      goto LABEL_13;
    }
    double v8 = v7;
    double v9 = self;
    id v10 = v22;
    uint64_t v11 = -2;
LABEL_9:
    [(UIView *)v9 _addSubview:v10 positioned:v11 relativeTo:v8];
LABEL_13:

LABEL_14:
    double v16 = v22;
    goto LABEL_15;
  }
  verticalScrollIndicator = self->_verticalScrollIndicator;
  if (verticalScrollIndicator || (verticalScrollIndicator = self->_horizontalScrollIndicator) != 0)
  {
    double v8 = verticalScrollIndicator;
LABEL_8:
    double v9 = self;
    id v10 = v22;
    uint64_t v11 = -3;
    goto LABEL_9;
  }
  double v17 = [(NSMutableDictionary *)self->_accessoryViews allValues];
  double v8 = [v17 firstObject];

  if (v8) {
    goto LABEL_8;
  }
  double v18 = [(UIView *)self layer];
  double v19 = [v18 sublayers];
  double v20 = [v19 lastObject];
  double v21 = [v22 layer];

  double v16 = v22;
  if (v20 != v21)
  {
    [(UIView *)self addSubview:v22];
    goto LABEL_14;
  }
LABEL_15:
}

- (id)_indexBarEntries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (_UIStaticScrollBar)_staticScrollBar
{
  return self->_staticScrollBar;
}

- (void)_adjustForAutomaticKeyboardInfo:(id)a3 animated:(BOOL)a4 lastAdjustment:(double *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([(UIScrollView *)self _isFirstResponderKeyboardAvoidanceEnabled])
  {
    double v9 = *a5;
    id v10 = [(UIView *)self keyboardSceneDelegate];
    [v10 verticalOverlapForView:self usingKeyboardInfo:v8];
    double v12 = v11;

    if (([(UIScrollView *)self _edgesApplyingSafeAreaInsetsToContentInset] & 4) != 0)
    {
      [(UIView *)self safeAreaInsets];
      double v12 = fmax(v12 - v13, 0.0);
    }
    if (v9 != v12)
    {
      *a5 = v12;
      self->_savedKeyboardAdjustmentDelta = v12 - v9 + self->_savedKeyboardAdjustmentDelta;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __72__UIScrollView__adjustForAutomaticKeyboardInfo_animated_lastAdjustment___block_invoke_2;
      v14[3] = &unk_1E52DD178;
      v14[4] = self;
      *(double *)&v14[5] = v12;
      *(double *)&v14[6] = v12 - v9;
      +[UIView conditionallyAnimate:v6 withAnimation:&__block_literal_global_656 layout:v14 completion:0];
    }
  }
}

- (BOOL)_isFirstResponderKeyboardAvoidanceEnabled
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x1000000000000) == 0;
}

- (BOOL)isScrollEnabled
{
  return (*((unsigned char *)&self->_scrollViewFlags + 2) & 0x10) == 0;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIScrollView;
  [(UIView *)&v5 setUserInteractionEnabled:a3];
  if ([(UIView *)self isUserInteractionEnabled])
  {
    [(UIScrollView *)self _registerAsScrollToTopViewIfPossible];
  }
  else
  {
    BOOL v4 = [(UIView *)self window];
    [v4 _unregisterScrollToTopView:self];
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)UIScrollView;
  [(UIView *)&v20 _didMoveFromWindow:v6 toWindow:v7];
  if (!v7) {
    [(UIScrollView *)self _stopScrollingNotify:0 pin:1];
  }
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x1000) == 0)
  {
    [v6 _unregisterScrollToTopView:self];
    [(UIScrollView *)self _registerAsScrollToTopViewIfPossible];
  }
  if (v7)
  {
    [(UIView *)self _currentScreenScale];
    self->_accuracdouble y = v8;
    if (dyld_program_sdk_at_least())
    {
      double v9 = [(UIScrollView *)self _enclosingViewController];
      [v9 _viewSubtreeDidGainScrollView:self enclosingViewController:v9];
    }
    if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x200) == 0)
    {
      id v10 = [v7 screen];
      BOOL v11 = -[UIView _shouldSkipObservingBoundingPathChangesForScreen:]((BOOL)self, v10);

      if (!v11)
      {
        *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x200u;
        [(UIView *)self _addBoundingPathChangeObserver:self];
      }
    }
  }
  else
  {
    dyld_program_sdk_at_least();
  }
  if (objc_opt_class())
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    double v12 = (void *)MEMORY[0x1E4F9A6A8];
    double v13 = [MEMORY[0x1E4F28B50] mainBundle];
    double v14 = [v13 bundleIdentifier];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__UIScrollView__didMoveFromWindow_toWindow___block_invoke;
    v15[3] = &unk_1E530F4D0;
    objc_copyWeak(&v16, &from);
    objc_copyWeak(&v17, &location);
    [v12 isMediaEventsCollectionEnabledFor:v14 completionHandler:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)_registerAsScrollToTopViewIfPossible
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x1000) == 0
    && [(UIView *)self isUserInteractionEnabled])
  {
    id v3 = [(UIView *)self window];
    [v3 _registerScrollToTopView:self];
  }
}

void __44__UIScrollView__didMoveFromWindow_toWindow___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__UIScrollView__didMoveFromWindow_toWindow___block_invoke_2;
  block[3] = &unk_1E530F4A8;
  char v6 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
}

- (void)removeFromSuperview
{
  [(UIScrollView *)self _stopScrollingNotify:0 pin:1];
  v3.receiver = self;
  v3.super_class = (Class)UIScrollView;
  [(UIView *)&v3 removeFromSuperview];
}

- (void)_stopScrollingNotify:(BOOL)a3 pin:(BOOL)a4
{
}

- (void)_removeScrollViewScrollObserver:(id)a3
{
  scrollNotificationObservers = self->_scrollNotificationObservers;
  if (scrollNotificationObservers)
  {
    id v7 = a3;
    id v5 = (NSHashTable *)[(NSHashTable *)scrollNotificationObservers copy];
    char v6 = self->_scrollNotificationObservers;
    self->_scrollNotificationObservers = v5;

    [(NSHashTable *)self->_scrollNotificationObservers removeObject:v7];
  }
}

- (double)_topLayoutInsetForSidebar
{
  return self->_topLayoutInsetForSidebar;
}

- (CGPoint)_contentOffsetForScrollingToTop
{
  [(UIScrollView *)self _effectiveContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(UIScrollView *)self _revealableContentPadding];
  double v10 = v9;
  accuracdouble y = self->_accuracy;
  double v12 = v8 + self->_contentSize.width;
  if (accuracy == 1.0)
  {
    double v14 = round(v12);
  }
  else
  {
    double v13 = floor(v12);
    double v14 = v13 + round(accuracy * (v12 - v13)) / accuracy;
  }
  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v30);
  double v16 = self->_accuracy;
  double v17 = self->_firstPageOffset.horizontal - v6;
  if (v16 == 1.0)
  {
    double v19 = round(v17);
  }
  else
  {
    double v18 = floor(v17);
    double v19 = v18 + round(v16 * (v17 - v18)) / v16;
  }
  double v20 = self->_contentSize.width;
  [(UIScrollView *)self contentOffset];
  double v22 = self->_accuracy;
  double v23 = self->_firstPageOffset.vertical - v4;
  if (v22 == 1.0)
  {
    double v25 = round(v23);
  }
  else
  {
    double v24 = floor(v23);
    double v25 = v24 + round(v22 * (v23 - v24)) / v22;
  }
  if (Width <= v20) {
    double v26 = Width;
  }
  else {
    double v26 = v20;
  }
  double v27 = v14 - v26;
  if (v19 >= v21) {
    double v21 = v19;
  }
  if (v27 <= v21) {
    double v21 = v27;
  }
  double v28 = v25 - v10;
  result.double y = v28;
  result.double x = v21;
  return result;
}

- (BOOL)_scrollToTopIfPossible:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIScrollView *)self _revealableContentPadding];
  double v6 = v5;
  [(UIScrollView *)self _effectiveContentInset];
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x1000) != 0) {
    return 0;
  }
  double v8 = v7;
  if (![(UIView *)self isUserInteractionEnabled]
    || (*((unsigned char *)&self->_scrollViewFlags + 2) & 0x10) != 0
    || (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x10) != 0)
  {
    return 0;
  }
  [(UIScrollView *)self contentOffset];
  accuracdouble y = self->_accuracy;
  double v11 = self->_firstPageOffset.vertical - v8;
  if (accuracy == 1.0)
  {
    double v13 = round(v11);
  }
  else
  {
    double v12 = floor(v11);
    double v13 = v12 + round(accuracy * (v11 - v12)) / accuracy;
  }
  if (v9 == v13 - v6 || [(UIScrollView *)self isTracking] || [(UIScrollView *)self isZooming]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained
    && (objc_opt_respondsToSelector() & 1) != 0
    && ![WeakRetained scrollViewShouldScrollToTop:self])
  {
    BOOL v14 = 0;
  }
  else
  {
    double v17 = +[UIAnimator sharedAnimator];
    [v17 removeAnimationsForTarget:self ofKind:objc_opt_class()];

    *(void *)((char *)&self->_scrollViewFlags + 12) |= 0x2000uLL;
    [(UIScrollView *)self _contentOffsetForScrollingToTop];
    double v19 = v18;
    double v21 = v20;
    double v22 = _smoothDecelerationAnimation();
    -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", v3, 3, 0, v22, v19, v21);

    if (!v3) {
      *(void *)((char *)&self->_scrollViewFlags + 12) &= ~0x2000uLL;
    }
    BOOL v14 = 1;
    [(UIScrollView *)self _adjustScrollerIndicators:0 alwaysShowingThem:1];
    [(UIScrollView *)self _updateAccessories];
  }

  return v14;
}

- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5 animationAdjustsForContentOffsetDelta:(BOOL)a6 animation:(id)a7 animationConfigurator:(id)a8
{
  BOOL v9 = a6;
  uint64_t v10 = *(void *)&a5;
  BOOL v11 = a4;
  double y = a3.y;
  double x = a3.x;
  id v28 = a7;
  id v15 = a8;
  if ((*((unsigned char *)&self->_scrollViewFlags + 2) & 8) == 0)
  {
    if (self->_scrollHeartbeat) {
      [(UIScrollView *)self _stopScrollingNotify:1 pin:0];
    }
    double v16 = +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:self];
    double v17 = [v16 scrollManager];
    [v17 cancelScrollingForScrollableContainer:self];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
    if (WeakRetained) {
      [(UIScrollView *)self _stopScrollingAndZoomingAnimationsPinningToContentViewport:0 tramplingAnimationDependentFlags:0];
    }
    if (dyld_program_sdk_at_least())
    {
      -[UIScrollView _roundedProposedContentOffset:](self, "_roundedProposedContentOffset:", x, y);
      double v20 = v19;
      double v22 = v21;
    }
    else
    {
      double v22 = y;
      double v20 = x;
    }
    [(UIScrollView *)self contentOffset];
    if (v20 != v24 || v22 != v23)
    {
      double v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v26 = v25;
      if (v11)
      {
        double v27 = [(UIView *)self window];

        if (v27)
        {
          -[UIScrollView _animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:](self, "_animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:", v10, v9, v28, v15, x, y);
        }
        else
        {
          [v26 postNotificationName:@"UITextSelectionWillScroll" object:self];
          -[UIScrollView setContentOffset:](self, "setContentOffset:", x, y);
          [(UIScrollView *)self _scrollViewAnimationEnded:0 finished:1];
        }
      }
      else
      {
        [v25 postNotificationName:@"UITextSelectionWillScroll" object:self];
        -[UIScrollView setContentOffset:](self, "setContentOffset:", x, y);
        [v26 postNotificationName:@"UITextSelectionDidScroll" object:self];
      }
    }
  }
}

- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5 animationAdjustsForContentOffsetDelta:(BOOL)a6 animation:(id)a7
{
}

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated
{
}

- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5 animationAdjustsForContentOffsetDelta:(BOOL)a6
{
}

- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5
{
}

- (BOOL)_beginTrackingWithEvent:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = [v4 _scrollDeviceCategory];
  }
  else {
    unint64_t v5 = 0;
  }
  self->_currentScrollDeviceCategordouble y = v5;
  p_uint64_t scrollViewFlags = &self->_scrollViewFlags;
  uint64_t scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x100000) != 0 || (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x10) != 0)
  {
    LOBYTE(WeakRetained) = 0;
LABEL_17:
    *(void *)p_uint64_t scrollViewFlags = scrollViewFlags & 0xFFFFFFFFFF7FFFFFLL;
    goto LABEL_18;
  }
  double v8 = +[UIAnimator sharedAnimator];
  [v8 removeAnimationsForTarget:self ofKind:objc_opt_class()];

  [(UIScrollView *)self _trackingDidBegin];
  *(void *)p_scrollViewFlags &= 0xFFFFFFFFBFFFFFCDLL;
  self->_previousVerticalVelocitdouble y = 0.0;
  self->_previousHorizontalVelocitdouble y = 0.0;
  if (self->_horizontalVelocity == 0.0 && self->_verticalVelocity == 0.0) {
    *(void *)p_scrollViewFlags &= ~0x800000uLL;
  }
  [(UIView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  [(UIScrollView *)self contentOffset];
  double v14 = v13;
  double v16 = v15;
  [(UIScrollView *)self _effectiveContentInset];
  accuracdouble y = self->_accuracy;
  double v22 = self->_firstPageOffset.horizontal - v21;
  if (accuracy == 1.0)
  {
    double v43 = round(v22);
    if (v14 >= v43)
    {
      double v27 = round(self->_firstPageOffset.vertical - v17);
      if (v16 >= v27)
      {
        double v44 = round(v19 + self->_contentSize.width) - v10;
        if (v43 < v44) {
          double v43 = v44;
        }
        if (v14 <= v43)
        {
          double v33 = round(v18 + self->_contentSize.height);
          goto LABEL_47;
        }
      }
    }
LABEL_33:
    LODWORD(WeakRetained) = 1;
    goto LABEL_34;
  }
  double v23 = floor(v22);
  double v24 = v23 + round(accuracy * (v22 - v23)) / accuracy;
  if (v14 < v24) {
    goto LABEL_33;
  }
  double v25 = self->_firstPageOffset.vertical - v17;
  double v26 = floor(v25);
  double v27 = v26 + round(accuracy * (v25 - v26)) / accuracy;
  if (v16 < v27) {
    goto LABEL_33;
  }
  double v28 = v19 + self->_contentSize.width;
  double v29 = floor(v28);
  double v30 = v29 + round(accuracy * (v28 - v29)) / accuracy - v10;
  if (v24 < v30) {
    double v24 = v30;
  }
  if (v14 > v24) {
    goto LABEL_33;
  }
  double v31 = v18 + self->_contentSize.height;
  double v32 = floor(v31);
  double v33 = v32 + round(accuracy * (v31 - v32)) / accuracy;
LABEL_47:
  double v51 = v33 - v12;
  if (v27 < v51) {
    double v27 = v51;
  }
  LODWORD(WeakRetained) = v16 > v27;
LABEL_34:
  if (!self->_scrollHeartbeat) {
    goto LABEL_18;
  }
  if (WeakRetained)
  {
    LOBYTE(WeakRetained) = 1;
    [(UIScrollView *)self _stopScrollingNotify:1 pin:0];
    uint64_t scrollViewFlags = *(void *)p_scrollViewFlags;
    goto LABEL_17;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) |= 0x8000000000000uLL;
  asyncScrollDecelerationState = self->_asyncScrollDecelerationState;
  self->_asyncScrollDecelerationState = 0;

  [v4 timestamp];
  self->_lastScrollInterruptionByPointerEventTime = v46;
  [(CADisplayLink *)self->_scrollHeartbeat setPaused:1];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25A538);
  double v48 = *(id *)(CategoryCachedImpl + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v48))
  {
    *(_DWORD *)double v52 = 134350081;
    *(void *)&v52[4] = self->_telemetryOffsetChangeCount;
    *(_WORD *)&v52[12] = 2050;
    *(double *)&v52[14] = self->_telemetryOffsetChangeHighRateDuration;
    *(_WORD *)&v52[22] = 2050;
    CGFloat width = self->_telemetryOffsetChange.width;
    *(_WORD *)double v54 = 2050;
    *(CGFloat *)&v54[2] = self->_telemetryOffsetChange.height;
    *(_WORD *)&v54[10] = 2049;
    *(void *)&v54[12] = self;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  unint64_t v49 = __UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25A540);
  double v50 = *(id *)(v49 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v49 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v50))
  {
    *(_DWORD *)double v52 = 134350081;
    *(void *)&v52[4] = self->_telemetryOffsetChangeCount;
    *(_WORD *)&v52[12] = 2050;
    *(double *)&v52[14] = self->_telemetryOffsetChangeHighRateDuration;
    *(_WORD *)&v52[22] = 2050;
    CGFloat width = self->_telemetryOffsetChange.width;
    *(_WORD *)double v54 = 2050;
    *(CGFloat *)&v54[2] = self->_telemetryOffsetChange.height;
    *(_WORD *)&v54[10] = 2049;
    *(void *)&v54[12] = self;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  self->_telemetryOffsetChangeHighRateDuration = 0.0;
  self->_telemetryOffsetChangeCount = 0;
  self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E4F1DB30];
  kdebug_trace();
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _scrollViewDidInterruptDecelerating:self];
  }
  kdebug_trace();
  -[_UIScrollViewVFD deactivateSubreason:]((uint64_t)self->_vfd, 3);
  _UIQOSManagedCommitsEnd(self, @"Deceleration");
  [(UIScrollView *)self _endActivityTrackingIfNeededForReason:0];

  LOBYTE(WeakRetained) = 0;
LABEL_18:
  -[UIScrollView _resetScrollingWithUIEvent:](self, "_resetScrollingWithUIEvent:", v4, *(_OWORD *)v52, *(void *)&v52[16], *(void *)&width, *(_OWORD *)v54, *(void *)&v54[16], v55);
  if ((*((unsigned char *)&self->_scrollViewFlags + 2) & 0x80) != 0
    && ([v4 timestamp], v35 <= self->_fastScrollEndTime + 1.0))
  {
    double fastScrollMultiplier = self->_fastScrollMultiplier;
  }
  else
  {
    self->_double fastScrollMultiplier = 1.0;
    self->_fastScrollCount = 0;
    double fastScrollMultiplier = 1.0;
  }
  self->_fastScrollStartMultiplier = fastScrollMultiplier;
  if (self->_discreteFastScrollEndTime == 0.0) {
    goto LABEL_26;
  }
  [v4 timestamp];
  double v38 = v37;
  double discreteFastScrollEndTime = self->_discreteFastScrollEndTime;
  int v40 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DiscreteFastScrollTimeout, @"DiscreteFastScrollTimeout", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v41 = *(double *)&qword_1E8FD55D0;
  if (v40) {
    double v41 = 1.5;
  }
  if (v38 > discreteFastScrollEndTime + v41) {
LABEL_26:
  }
    [(UIScrollView *)self _resetDiscreteFastScroll];
  self->_discreteFastScrollStartMultiplier = self->_discreteFastScrollMultiplier;

  return (char)WeakRetained;
}

- (void)_trackingDidBegin
{
  *(void *)&self->_scrollViewFlags |= 1uLL;
}

- (void)_resetScrollingWithUIEvent:(id)a3
{
  [(UIScrollView *)self contentOffset];
  self->_double startOffsetX = v4;
  [(UIScrollView *)self contentOffset];
  self->_double startOffsetY = v5;
}

- (void)_resetDiscreteFastScroll
{
  self->_discreteFastScrollCount = 0;
  self->_discreteFastScrollMultiplier = 1.0;
  self->_double discreteFastScrollEndTime = 0.0;
}

- (UIEdgeInsets)_revealableContentPadding
{
  [(UIScrollView *)self _revealableContentPaddingIncludingContentWithCollapsedAffinity:1];
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (UIEdgeInsets)_revealableContentPaddingIncludingContentWithCollapsedAffinity:(BOOL)a3
{
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  double v16 = &unk_186D7DBA7;
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__UIScrollView__revealableContentPaddingIncludingContentWithCollapsedAffinity___block_invoke;
  v11[3] = &unk_1E530F540;
  BOOL v12 = a3;
  v11[4] = self;
  v11[5] = &v13;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v11);
  double v3 = v14[4];
  double v4 = v14[5];
  double v5 = v14[6];
  double v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.double right = v10;
  result.double bottom = v9;
  result.double left = v8;
  result.double top = v7;
  return result;
}

- (void)_setIsTransientScrollView:(BOOL)a3
{
  if (self->__isTransientScrollView != a3)
  {
    self->__isTransientScrollView = a3;
    if (!a3) {
      [(UIScrollView *)self _notifyDidScroll];
    }
  }
}

- (BOOL)_isScrubbing
{
  return (*((_DWORD *)&self->_scrollViewFlags + 5) & 0x7800) != 0;
}

- (void)_setAlwaysBounceVertical:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (void)setInteractionActivityTrackingBaseName:(id)a3
{
  double v4 = (NSString *)[a3 copy];
  interactionActivityTrackingBaseName = self->_interactionActivityTrackingBaseName;
  self->_interactionActivityTrackingBaseName = v4;
}

- (CGFloat)maximumZoomScale
{
  return self->_maximumZoomScale;
}

- (void)_setMaskView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIScrollView;
  [(UIView *)&v7 _setMaskView:a3];
  double v4 = -[UIView _safeMaskView](self);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v6 = 0x2000000000000;
  if ((isKindOfClass & 1) == 0) {
    uint64_t v6 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFDFFFFFFFFFFFFLL | v6;
}

- (void)_notifyDidScroll
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x100000) != 0)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained scrollViewDidScroll:self];
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__UIScrollView__notifyDidScroll__block_invoke;
  v4[3] = &unk_1E530F458;
  v4[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v4);
}

- (double)_verticalVelocity
{
  return self->_verticalVelocity;
}

- (UIEdgeInsets)_autoScrollTouchInsets
{
  double v2 = [(UIScrollView *)self _autoScrollAssistant];
  [v2 touchInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v12;
  result.double top = v11;
  return result;
}

- (void)_setTemporaryCoordinatingReplacement:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v5 = (UIScrollView *)a3;
  double v6 = self->_temporaryCoordinatingReplacement;
  if (v6 != v5)
  {
    objc_storeStrong((id *)&self->_temporaryCoordinatingReplacement, a3);
    scrollNotificationObservers = self->_scrollNotificationObservers;
    if (scrollNotificationObservers)
    {
      double v8 = scrollNotificationObservers;
    }
    else
    {
      double v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    }
    double v9 = v8;
    if (v6 && v6->_scrollNotificationObservers) {
      -[NSHashTable unionHashTable:](v8, "unionHashTable:");
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v10 = v9;
    uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v15, "_observeScrollView:temporaryCoordinatingReplacementDidChange:", self, v5, (void)v16);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)setKeyboardDismissMode:(UIScrollViewKeyboardDismissMode)keyboardDismissMode
{
  self->_keyboardDismissMode = keyboardDismissMode;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return &self->_pan->super;
}

- (UIScrollViewKeyboardDismissMode)keyboardDismissMode
{
  return self->_keyboardDismissMode;
}

- (void)setRefreshControl:(UIRefreshControl *)refreshControl
{
  double v4 = refreshControl;
  if (v4) {
    [(UIScrollView *)self setAlwaysBounceVertical:1];
  }
  [(UIScrollView *)self _setRefreshControl:v4];
}

- (void)_setRefreshControl:(id)a3
{
  double v5 = (UIRefreshControl *)a3;
  p_refreshControl = &self->_refreshControl;
  refreshControl = self->_refreshControl;
  uint64_t v13 = v5;
  if (refreshControl)
  {
    uint64_t v8 = [(UIRefreshControl *)refreshControl refreshControlState];
    double v5 = v13;
    if (v8)
    {
      if (_setRefreshControl__once[0] != -1)
      {
        dispatch_once(_setRefreshControl__once, &__block_literal_global_612);
        double v5 = v13;
      }
    }
  }
  if (*p_refreshControl != v5)
  {
    if ([(UIRefreshControl *)*p_refreshControl _areInsetsBeingApplied]
      && ![(UIRefreshControl *)*p_refreshControl _hostAdjustsContentOffset])
    {
      [(UIRefreshControl *)*p_refreshControl _removeInsets];
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
    }
    [(UIView *)*p_refreshControl removeFromSuperview];
    objc_storeStrong((id *)&self->_refreshControl, a3);
    if (*p_refreshControl)
    {
      [(UIView *)*p_refreshControl setAutoresizingMask:2];
      [(UIRefreshControl *)*p_refreshControl _update];
      [(UIScrollView *)self _addContentSubview:*p_refreshControl atBack:1];
    }
    if (v9) {
      [(UIRefreshControl *)*p_refreshControl _addInsets];
    }
    double v10 = [(UIView *)self _viewControllerForAncestor];
    uint64_t v11 = [v10 navigationController];
    [v11 _setUpHostedRefreshControlForScrollView:self];
    uint64_t v12 = [v11 navigationBar];
    [v12 layoutSubviews];

    double v5 = v13;
  }
}

- (void)setContentInsetAdjustmentBehavior:(UIScrollViewContentInsetAdjustmentBehavior)contentInsetAdjustmentBehavior
{
  if (self->_contentInsetAdjustmentBehavior != contentInsetAdjustmentBehavior)
  {
    [(UIScrollView *)self _systemContentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    unint64_t v13 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
    self->_unint64_t contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
  }
}

- (void)setDelaysContentTouches:(BOOL)delaysContentTouches
{
  uint64_t v3 = 0x40000;
  if (!delaysContentTouches) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (void)_setAutoScrollTouchInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(UIScrollView *)self _autoScrollAssistant];
  objc_msgSend(v7, "setTouchInsets:", top, left, bottom, right);
}

- (void)setPagingEnabled:(BOOL)pagingEnabled
{
  uint64_t v3 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if (((((v3 & 0x20) == 0) ^ pagingEnabled) & 1) == 0)
  {
    BOOL v4 = pagingEnabled;
    uint64_t v6 = 32;
    if (!pagingEnabled) {
      uint64_t v6 = 0;
    }
    *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(void *)((char *)&self->_scrollViewFlags + 12) = v3 & 0xFFFFFFFFFFFFFFDFLL | v6;
    [(UIScrollView *)self _updatePagingGestures];
    if (v4)
    {
      [(UIScrollView *)self _prepareToPageWithHorizontalVelocity:0.0 verticalVelocity:0.0];
    }
  }
}

- (void)_setPagingOrigin:(CGPoint)a3
{
  if (a3.x != self->_pagingOrigin.x || a3.y != self->_pagingOrigin.y)
  {
    self->_pagingOrigin = a3;
    [(UIScrollView *)self _prepareToPageWithHorizontalVelocity:0.0 verticalVelocity:0.0];
  }
}

- (void)_setInterpageSpacing:(CGSize)a3
{
  self->_interpageSpacing = a3;
}

- (void)setDecelerationRate:(UIScrollViewDecelerationRate)decelerationRate
{
  CGFloat v3 = dbl_186B9E1C0[decelerationRate < 0.994];
  self->_decelerationFactor.CGFloat width = v3;
  self->_decelerationFactor.double height = v3;
}

- (void)_setContentScrollsAlongXAxis:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIScrollView *)self _systemContentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
  if (v3) {
    int v14 = 8;
  }
  else {
    int v14 = 0;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFFFFE7 | v14;
  -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
}

- (void)_setContentScrollsAlongYAxis:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIScrollView *)self _systemContentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
  if (v3) {
    int v14 = 32;
  }
  else {
    int v14 = 0;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFFFF9F | v14;
  -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
}

- (void)setAlwaysBounceHorizontal:(BOOL)alwaysBounceHorizontal
{
  if (((((*((unsigned char *)&self->_scrollViewFlags + 1) & 1) == 0) ^ alwaysBounceHorizontal) & 1) == 0)
  {
    BOOL v3 = alwaysBounceHorizontal;
    [(UIScrollView *)self _systemContentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    unint64_t v13 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
    uint64_t v14 = 256;
    if (!v3) {
      uint64_t v14 = 0;
    }
    *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFEFFLL | v14;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
    [(UIScrollView *)self _adjustContentOffsetIfNecessary];
  }
}

- (void)setAlwaysBounceVertical:(BOOL)alwaysBounceVertical
{
  if (((((*((unsigned char *)&self->_scrollViewFlags + 1) & 2) == 0) ^ alwaysBounceVertical) & 1) == 0)
  {
    BOOL v3 = alwaysBounceVertical;
    [(UIScrollView *)self _systemContentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    unint64_t v13 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
    uint64_t v14 = 512;
    if (!v3) {
      uint64_t v14 = 0;
    }
    *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFDFFLL | v14;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
    [(UIScrollView *)self _adjustContentOffsetIfNecessary];
  }
}

- (void)_didSetBounces
{
  *(void *)((char *)&self->_scrollViewFlags + 12) |= 0x800000000000000uLL;
  [(UIScrollView *)self _updateContentFitDisableScrolling];
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  if (contentInset.left != left
    || contentInset.top != top
    || contentInset.right != right
    || contentInset.bottom != bottom)
  {
    self->_contentInset = contentInset;
    [(UIScrollView *)self _updateForChangedScrollRelatedInsets];
    id v13 = [(UIView *)self _layoutEngine];
    double v11 = [v13 delegate];
    if (dyld_program_sdk_at_least())
    {
    }
    else
    {
      if (v11)
      {
        char v12 = [v11 _forceLayoutEngineSolutionInRationalEdges];

        if (v12) {
          return;
        }
      }
      else
      {
      }
      -[UIScrollView _adjustCrossingConstraintsIfNecessaryForOldContentInset:](self, "_adjustCrossingConstraintsIfNecessaryForOldContentInset:", top, left, bottom, right);
    }
  }
}

- (void)_notifyAdjustedContentInsetDidChange
{
  [(UIScrollView *)self adjustedContentInsetDidChange];
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x1000000) != 0)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained scrollViewDidChangeAdjustedContentInset:self];
  }
}

- (void)setBounces:(BOOL)bounces
{
  uint64_t v3 = 12;
  if (!bounces) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFFF3 | v3;
  [(UIScrollView *)self _didSetBounces];
}

- (void)setShowsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator
{
  *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x20000000u;
  -[UIScrollView _setShowsVerticalScrollIndicator:](self, showsVerticalScrollIndicator);
}

- (_UIAutoScrollAssistant)_autoScrollAssistant
{
  autoScrollAssistant = self->_autoScrollAssistant;
  if (!autoScrollAssistant)
  {
    BOOL v4 = [[_UIAutoScrollAssistant alloc] initWithScrollView:self];
    double v5 = self->_autoScrollAssistant;
    self->_autoScrollAssistant = v4;

    autoScrollAssistant = self->_autoScrollAssistant;
  }
  return autoScrollAssistant;
}

- (BOOL)_shouldPreventFocusScrollPastContentSize
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 27) & 1;
}

- (void)_setShouldPreventFocusScrollPastContentSize:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xF7FFFFFF | v3;
}

- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)horizontalScrollIndicatorInsets
{
  if (horizontalScrollIndicatorInsets.left != self->_horizontalScrollIndicatorInsets.left
    || horizontalScrollIndicatorInsets.top != self->_horizontalScrollIndicatorInsets.top
    || horizontalScrollIndicatorInsets.right != self->_horizontalScrollIndicatorInsets.right
    || horizontalScrollIndicatorInsets.bottom != self->_horizontalScrollIndicatorInsets.bottom)
  {
    self->_horizontalScrollIndicatorInsets = horizontalScrollIndicatorInsets;
    [(UIScrollView *)self _updateForChangedScrollIndicatorRelatedInsets];
  }
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)verticalScrollIndicatorInsets
{
  if (verticalScrollIndicatorInsets.left != self->_verticalScrollIndicatorInsets.left
    || verticalScrollIndicatorInsets.top != self->_verticalScrollIndicatorInsets.top
    || verticalScrollIndicatorInsets.right != self->_verticalScrollIndicatorInsets.right
    || verticalScrollIndicatorInsets.bottom != self->_verticalScrollIndicatorInsets.bottom)
  {
    self->_verticalScrollIndicatorInsets = verticalScrollIndicatorInsets;
    [(UIScrollView *)self _updateForChangedScrollIndicatorRelatedInsets];
  }
}

- (BOOL)showsVerticalScrollIndicator
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 3) >> 1) & 1;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return *((unsigned char *)&self->_scrollViewFlags + 3) & 1;
}

- (void)setScrollsToTop:(BOOL)scrollsToTop
{
  unint64_t v3 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if (((v3 >> 12) & 1) == scrollsToTop)
  {
    uint64_t v5 = 4096;
    if (scrollsToTop) {
      uint64_t v5 = 0;
    }
    *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(void *)((char *)&self->_scrollViewFlags + 12) = v3 & 0xFFFFFFFFFFFFEFFFLL | v5;
    if (scrollsToTop)
    {
      [(UIScrollView *)self _registerAsScrollToTopViewIfPossible];
    }
    else
    {
      id v6 = [(UIView *)self window];
      [v6 _unregisterScrollToTopView:self];
    }
  }
}

- (void)_setZoomFeedbackGenerator:(id)a3
{
  uint64_t v5 = (_UIZoomEdgeFeedbackGenerator *)a3;
  if ([(UIFeedbackGenerator *)self->_zoomFeedbackGenerator isActive])
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIScrollView.m" lineNumber:9082 description:@"Zoom feedback behavior should not be changed while active."];
  }
  zoomFeedbackGenerator = self->_zoomFeedbackGenerator;
  self->_zoomFeedbackGenerator = v5;
}

void __34__UIScrollView__updateAccessories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v29 = a3;
  unint64_t v5 = [a2 integerValue];
  uint64_t v6 = v5;
  if (v5 <= 1)
  {
    if ((v5 == 1) != [*(id *)(a1 + 32) _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis])uint64_t v6 = 5; {
    else
    }
      uint64_t v6 = 3;
  }
  [v29 setEdge:v6];
  double v7 = [*(id *)(a1 + 32) layer];
  uint64_t v8 = [v7 flipsHorizontalAxis];

  double v9 = [v29 layer];
  int v10 = [v9 flipsHorizontalAxis];

  if (v8 != v10)
  {
    double v11 = [v29 layer];
    [v11 setFlipsHorizontalAxis:v8];
  }
  double v13 = *(double *)(a1 + 40);
  double v12 = *(double *)(a1 + 48);
  objc_msgSend(v29, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v15 = v14;
  double v17 = v16;
  if (v8)
  {
    if (v5 == 3)
    {
LABEL_13:
      double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 40));
      v33.origin.double x = v13;
      v33.origin.double y = v12;
      v33.size.CGFloat width = v15;
      v33.size.double height = v17;
      double v13 = MaxX - CGRectGetWidth(v33);
      double MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
      double Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
      v34.origin.double x = v13;
      v34.origin.double y = v12;
      v34.size.CGFloat width = v15;
      v34.size.double height = v17;
      double v12 = MinY + (Height - CGRectGetHeight(v34)) * 0.5;
      uint64_t v20 = 17;
      goto LABEL_16;
    }
    if (v5 == 5)
    {
LABEL_12:
      double v21 = CGRectGetMinY(*(CGRect *)(a1 + 40));
      double v22 = CGRectGetHeight(*(CGRect *)(a1 + 40));
      v32.origin.double x = v13;
      v32.origin.double y = v12;
      v32.size.CGFloat width = v15;
      v32.size.double height = v17;
      double v12 = v21 + (v22 - CGRectGetHeight(v32)) * 0.5;
      uint64_t v20 = 20;
      goto LABEL_16;
    }
  }
  switch(v6)
  {
    case 2:
      double MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
      double Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
      v31.origin.double x = v13;
      v31.origin.double y = v12;
      v31.size.CGFloat width = v15;
      v31.size.double height = v17;
      double v13 = MinX + (Width - CGRectGetWidth(v31)) * 0.5;
      uint64_t v20 = 34;
      break;
    case 3:
      goto LABEL_12;
    case 4:
      double v26 = CGRectGetMinX(*(CGRect *)(a1 + 40));
      double v27 = CGRectGetWidth(*(CGRect *)(a1 + 40));
      v35.origin.double x = v13;
      v35.origin.double y = v12;
      v35.size.CGFloat width = v15;
      v35.size.double height = v17;
      double v13 = v26 + (v27 - CGRectGetWidth(v35)) * 0.5;
      double MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 40));
      v36.origin.double x = v13;
      v36.origin.double y = v12;
      v36.size.CGFloat width = v15;
      v36.size.double height = v17;
      double v12 = MaxY - CGRectGetHeight(v36);
      uint64_t v20 = 10;
      break;
    case 5:
      goto LABEL_13;
    default:
      uint64_t v20 = 0;
      break;
  }
LABEL_16:
  objc_msgSend(v29, "setFrame:", v13, v12, v15, v17);
  [v29 setAutoresizingMask:v20];
  [v29 update];
}

- (id)_uili_existingObservationEligibleLayoutVariables
{
  v7.receiver = self;
  v7.super_class = (Class)UIScrollView;
  uint64_t v3 = [(UIView *)&v7 _uili_existingObservationEligibleLayoutVariables];
  BOOL v4 = (void *)v3;
  contentWidthVariable = self->_contentWidthVariable;
  if (!contentWidthVariable && !self->_contentHeightVariable) {
    goto LABEL_8;
  }
  if (v3)
  {
    if (!contentWidthVariable) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v4 = [MEMORY[0x1E4F1CA48] array];
  if (self->_contentWidthVariable) {
LABEL_5:
  }
    objc_msgSend(v4, "addObject:");
LABEL_6:
  if (self->_contentHeightVariable) {
    objc_msgSend(v4, "addObject:");
  }
LABEL_8:
  return v4;
}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
  return 1;
}

- (BOOL)delaysContentTouches
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 2) >> 2) & 1;
}

- (BOOL)_pagingUp
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 8) & 1;
}

- (BOOL)_pagingRight
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 7) & 1;
}

- (BOOL)_pagingLeft
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 6) & 1;
}

- (BOOL)_pagingDown
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 9) & 1;
}

- (void)setAutomaticallyAdjustsScrollIndicatorInsets:(BOOL)automaticallyAdjustsScrollIndicatorInsets
{
  if (automaticallyAdjustsScrollIndicatorInsets) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(UIScrollView *)self _setIndicatorInsetAdjustmentBehavior:v3];
}

- (void)setIndicatorStyle:(UIScrollViewIndicatorStyle)indicatorStyle
{
  unint64_t scrollViewFlags = (unint64_t)self->_scrollViewFlags;
  if (((scrollViewFlags >> 28) & 3) != indicatorStyle)
  {
    *(void *)&self->_unint64_t scrollViewFlags = scrollViewFlags & 0xFFFFFFFFCFFFFFFFLL | ((unint64_t)(indicatorStyle & 3) << 28);
    -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](self, 3, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allowedTouchTypesForScrolling, 0);
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->__scrollViewMonitor, 0);
  objc_storeStrong((id *)&self->_automaticContentConstraints, 0);
  objc_storeStrong((id *)&self->_contentYOffsetVariable, 0);
  objc_storeStrong((id *)&self->_contentXOffsetVariable, 0);
  objc_storeStrong((id *)&self->_contentHeightVariable, 0);
  objc_storeStrong((id *)&self->_contentWidthVariable, 0);
  objc_storeStrong((id *)&self->_temporaryCoordinatingReplacement, 0);
  objc_storeStrong(&self->_scrollTestParameters, 0);
  objc_storeStrong((id *)&self->_asyncScrollDecelerationState, 0);
  objc_storeStrong((id *)&self->_scrollingPointerRegion, 0);
  objc_storeStrong((id *)&self->_trackingWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_contentInsetAdjustments, 0);
  objc_destroyWeak((id *)&self->_focusSystemHoldingLock);
  objc_storeStrong((id *)&self->_keyboardScrollingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_keyboardScrollingAnimator, 0);
  objc_storeStrong((id *)&self->_vfd, 0);
  objc_storeStrong((id *)&self->_trackpadScrollInterruptionDelayedAction, 0);
  objc_storeStrong((id *)&self->_knobHoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_knobPointerLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_knobLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_knobFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_horizontalScrollIndicator, 0);
  objc_storeStrong((id *)&self->_verticalScrollIndicator, 0);
  objc_storeStrong((id *)&self->_horizontalScrollIndicatorHideDelayTimer, 0);
  objc_storeStrong((id *)&self->_verticalScrollIndicatorHideDelayTimer, 0);
  objc_storeStrong((id *)&self->_contentOffsetLayoutGuide, 0);
  objc_storeStrong((id *)&self->_frameLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentMarginsGuide, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_scrollableAncestor, 0);
  objc_storeStrong((id *)&self->_zoomFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_layoutObserver, 0);
  objc_destroyWeak((id *)&self->_relativePanView);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_destroyWeak((id *)&self->_draggingChildScrollView);
  objc_storeStrong((id *)&self->_autoScrollAssistant, 0);
  objc_storeStrong((id *)&self->_dragAutoScrollGestureRecognizer, 0);
  for (uint64_t i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_lowFidelitySwipeGestureRecognizers[i], 0);
  objc_storeStrong((id *)&self->_directionalPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchDelayGestureRecognizer, 0);
  objc_storeStrong(&self->_swipe, 0);
  objc_storeStrong((id *)&self->_pan, 0);
  objc_storeStrong((id *)&self->_pinch, 0);
  objc_storeStrong((id *)&self->_zoomAnimationState, 0);
  objc_storeStrong(&self->_zoomAnimation, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_destroyWeak((id *)&self->_animation);
  objc_storeStrong((id *)&self->_scrollNotificationObservers, 0);
  for (uint64_t j = 1; j != -1; --j)
    objc_storeStrong((id *)&self->_activityTrackingTokens[j], 0);
  objc_storeStrong((id *)&self->_interactionActivityTrackingBaseName, 0);
  objc_storeStrong((id *)&self->_scrollHeartbeat, 0);
  objc_storeStrong((id *)&self->_zoomView, 0);
  objc_storeStrong((id *)&self->_staticScrollBar, 0);
  objc_destroyWeak(&self->_delegate);
}

- (void)_willMoveToWindow:(id)a3
{
  id v4 = a3;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x4000000) != 0)
  {
    unint64_t v5 = [(UIView *)self window];
    [(UIScrollView *)self _registerForRotation:0 ofWindow:v5];

    [(UIScrollView *)self _registerForRotation:1 ofWindow:v4];
  }
  if (!v4 && (*((_DWORD *)&self->_scrollViewFlags + 5) & 0x200) != 0)
  {
    [(UIView *)self _removeBoundingPathChangeObserver:self];
    *((_DWORD *)&self->_scrollViewFlags + 5) &= ~0x200u;
  }
  -[_UIScrollViewVFD reset]((unint64_t)self->_vfd);
  _UIQOSManagedCommitsEnd(self, 0);
  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  [(UIView *)&v6 _willMoveToWindow:v4];
}

- (void)_setContentOffsetPinned:(CGPoint)a3
{
  -[UIScrollView setContentOffset:](self, "setContentOffset:", a3.x, a3.y);
  [(UIScrollView *)self _adjustContentOffsetIfNecessary];
}

- (void)_setZoomAnchorPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v6 = [(UIScrollView *)self _getDelegateZoomView];
  if (v6)
  {
    id v10 = v6;
    [v6 bounds];
    double v9 = x / v8;
    if (v8 == 0.0) {
      double v9 = 0.0;
    }
    self->_zoomAnchorPoint.double x = v9;
    if (v7 == 0.0) {
      self->_zoomAnchorPoint.double y = 0.0;
    }
    else {
      self->_zoomAnchorPoint.double y = y / v7;
    }
    objc_super v6 = v10;
  }
  else
  {
    self->_zoomAnchorPoint.double x = 0.0;
    self->_zoomAnchorPoint.double y = 0.0;
  }
}

- (CGPoint)_zoomAnchorPoint
{
  uint64_t v3 = [(UIScrollView *)self _getDelegateZoomView];
  id v4 = v3;
  if (v3)
  {
    [v3 bounds];
    double v6 = self->_zoomAnchorPoint.x * v5;
    double v8 = v7 * self->_zoomAnchorPoint.y;
  }
  else
  {
    double v6 = 0.0;
    double v8 = 0.0;
  }

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)_zoomToCenterInternal:(CGPoint)a3 scale:(double)a4 duration:(double)a5 allowRubberbanding:(BOOL)a6 force:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double y = a3.y;
  double x = a3.x;
  double v14 = [(UIScrollView *)self _getDelegateZoomView];
  if (v14)
  {
    id v18 = v14;
    CGPoint zoomAnchorPoint = self->_zoomAnchorPoint;
    -[UIScrollView _setZoomAnchorPoint:](self, "_setZoomAnchorPoint:", x, y);
    BOOL v15 = a5 == -1.0 || a5 > 0.0;
    [(UIScrollView *)self _centeredZoomAnchorPointInScene];
    -[UIScrollView setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:force:](self, "setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:force:", v8, v15, 1, v7, a4, v16, v17, a5);
    if ((*((unsigned char *)&self->_scrollViewFlags + 3) & 0x40) != 0)
    {
      self->_CGPoint zoomAnchorPoint = zoomAnchorPoint;
      [(UIPinchGestureRecognizer *)self->_pinch setScale:a4];
    }
    double v14 = v18;
  }
}

- (void)setZoomScale:(double)a3 withAnchorPoint:(CGPoint)a4 allowRubberbanding:(BOOL)a5 animated:(BOOL)a6 duration:(double)a7 notifyDelegate:(BOOL)a8 force:(BOOL)a9
{
  BOOL v10 = a8;
  BOOL v12 = a6;
  BOOL v13 = a5;
  double y = a4.y;
  double x = a4.x;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v18 = [(UIScrollView *)self _getDelegateZoomView];
  [(UIScrollView *)self _clampedZoomScale:v13 allowRubberbanding:a3];
  double v20 = v19;
  double v21 = fabs(v19);
  if (v21 < INFINITY || v21 > INFINITY)
  {
    if (v18)
    {
      if (!a9 && ([(UIScrollView *)self zoomScale], v20 == v23))
      {
        double v50 = @"UITextSelectionZoomScaleDidChange";
        CGRect v34 = NSNumber;
        [(UIScrollView *)self zoomScale];
        CGRect v36 = [v34 numberWithInt:v35 != v20];
        double v51 = v36;
        double v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];

        double v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v38 postNotificationName:@"UITextSelectionWillZoom" object:self userInfo:v37];
        [(UIScrollView *)self _adjustContentSizeForView:v18 atScale:v20];
        [v38 postNotificationName:@"UITextSelectionDidZoom" object:self userInfo:v37];
      }
      else
      {
        if (self->_scrollHeartbeat) {
          [(UIScrollView *)self _stopScrollingNotify:1 pin:1];
        }
        id WeakRetained = objc_loadWeakRetained(&self->_delegate);
        if (v12 && (*(unsigned char *)&self->_scrollViewFlags & 0x80) == 0)
        {
          [(UIScrollView *)self _scrollViewWillBeginZooming];
          if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
            [WeakRetained scrollViewWillBeginZooming:self withView:v18];
          }
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v53 = 0x3032000000;
        double v54 = __Block_byref_object_copy__237;
        uint64_t v55 = __Block_byref_object_dispose__237;
        id v56 = 0;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke;
        v49[3] = &unk_1E530F5B8;
        v49[4] = self;
        *(double *)&v49[5] = a7;
        *(double *)&v49[6] = v20;
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_3;
        v41[3] = &unk_1E530F5E0;
        BOOL v48 = v12;
        v41[4] = self;
        p_long long buf = &buf;
        id v25 = v18;
        id v42 = v25;
        double v45 = v20;
        double v46 = x;
        double v47 = y;
        id v26 = WeakRetained;
        id v43 = v26;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_4;
        v39[3] = &unk_1E52E0478;
        BOOL v40 = v12;
        v39[4] = self;
        +[UIView conditionallyAnimate:v12 withAnimation:v49 layout:v41 completion:v39];
        if (v12)
        {
          [(UIScrollView *)self _markScrollViewAnimationForKey:@"transform" ofView:v25];
          [(UIScrollView *)self _markScrollViewAnimationForKey:@"position" ofView:v25];
          [(UIScrollView *)self _markScrollViewAnimationForKey:@"bounds" ofView:self];
          [(UIScrollView *)self _markScrollViewAnimationForKey:@"bounds.origin" ofView:self];
          [(UIScrollView *)self _markScrollViewAnimationForKey:@"bounds.size" ofView:self];
          double v27 = [v25 layer];
          double v28 = [v27 animationForKey:@"transform"];
          id zoomAnimation = self->_zoomAnimation;
          self->_id zoomAnimation = v28;

          if (self->_zoomAnimation) {
            objc_storeStrong((id *)&self->_zoomAnimationState, *(id *)(*((void *)&buf + 1) + 40));
          }
        }
        if ([(UIGestureRecognizer *)self->_pan state] >= UIGestureRecognizerStateBegan)
        {
          [(UIScrollView *)self contentOffset];
          self->_double startOffsetX = v30;
          [(UIScrollView *)self contentOffset];
          self->_double startOffsetY = v31;
          -[UIPanGestureRecognizer setTranslation:inView:](self->_pan, "setTranslation:inView:", self, 0.0, 0.0);
        }
        if ((*((unsigned char *)&self->_scrollViewFlags + 3) & 0x40) != 0)
        {
          zoomFeedbackGenerator = self->_zoomFeedbackGenerator;
          [(UIPinchGestureRecognizer *)self->_pinch velocity];
          -[_UIZoomEdgeFeedbackGenerator _zoomScaleUpdated:withVelocity:atLocation:](zoomFeedbackGenerator, "_zoomScaleUpdated:withVelocity:atLocation:", v20, v33, x, y);
        }
        if (v13 && v12 && (v20 < self->_minimumZoomScale || v20 > self->_maximumZoomScale)) {
          *(void *)&self->_scrollViewFlags |= 0x80uLL;
        }

        _Block_object_dispose(&buf, 8);
      }
    }
  }
  else
  {
    double v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force____s_category)+ 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "UIScrollView is ignoring an attempt to set zoomScale to a non-finite value: %g", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (CGFloat)zoomScale
{
  [(UIScrollView *)self _zoomScaleFromPresentationLayer:0];
  return result;
}

- (double)_zoomScaleFromPresentationLayer:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIScrollView *)self _getDelegateZoomView];
  double v5 = v4;
  if (!v4)
  {
    double v9 = 1.0;
    goto LABEL_9;
  }
  double v6 = [v4 layer];
  BOOL v7 = v6;
  BOOL v8 = v6;
  if (v3)
  {
    BOOL v8 = [v6 presentationLayer];
  }
  if (!v8)
  {
    double v9 = 0.0;
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [v8 affineTransform];
  double v9 = v11;
  if (v3) {
LABEL_6:
  }

LABEL_7:
LABEL_9:

  return v9;
}

- (UIOffset)_offsetForCenterOfPossibleZoomView:(id)a3 withIncomingBoundsSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [(UIScrollView *)self _getDelegateZoomView];

  double v9 = 0.0;
  if (v8 == v7)
  {
    if (v7)
    {
      [v7 transform];
      double v11 = v15;
      double v10 = 0.0;
      if (v15 == 1.0) {
        goto LABEL_8;
      }
    }
    else
    {
      double v11 = 0.0;
    }
    double v12 = v11 + -1.0;
    double v10 = width * 0.5 * v12;
    double v9 = height * 0.5 * v12;
  }
  else
  {
    double v10 = 0.0;
  }
LABEL_8:

  double v13 = v10;
  double v14 = v9;
  result.double vertical = v14;
  result.double horizontal = v13;
  return result;
}

- (id)_getDelegateZoomView
{
  zoomView = self->_zoomView;
  if (zoomView)
  {
    BOOL v3 = zoomView;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      BOOL v3 = [WeakRetained viewForZoomingInScrollView:self];
      if (v3 == self)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"The view returned from viewForZoomingInScrollView: must be a subview of the scroll view. It can not be the scroll view itself."];
        BOOL v3 = self;
      }
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return v3;
}

uint64_t __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_4(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _zoomAnimationDidStop];
  }
  return result;
}

void *__103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    [*(id *)(*(void *)(a1 + 32) + 1336) _animationStarted];
    ++*(void *)(*(void *)(a1 + 32) + 1208);
    uint64_t v2 = +[UIView _currentViewAnimationState];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  double v5 = *(void **)(a1 + 40);
  if (v5)
  {
    [v5 transform];
    double v6 = *(double *)&v57;
    double v5 = *(void **)(a1 + 40);
  }
  else
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v57 = 0u;
    double v6 = 0.0;
  }
  id v7 = [v5 layer];
  [v7 position];
  double v9 = v8;
  double v11 = v10;

  [*(id *)(a1 + 40) bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:fromView:", *(void *)(a1 + 40));
  double v54 = v21;
  double v55 = v20;
  double v22 = *(void **)(a1 + 40);
  CGAffineTransformMakeScale(&v56, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64));
  [v22 setTransform:&v56];
  double v23 = *(double *)(a1 + 64);
  double v24 = v9 - v6 * v17 * 0.5 + v17 * v23 * 0.5;
  double v25 = v11 - v6 * v19 * 0.5 + v19 * v23 * 0.5;
  id v26 = [*(id *)(a1 + 40) layer];
  objc_msgSend(v26, "setPosition:", v24, v25);

  objc_msgSend(*(id *)(a1 + 32), "convertPoint:fromView:", *(void *)(a1 + 40), v13, v15);
  double v28 = v27 - v55;
  double v30 = v29 - v54;
  if (v27 - v55 != 0.0 || v30 != 0.0)
  {
    double v31 = objc_msgSend(*(id *)(a1 + 40), "layer", *(void *)&v54, *(void *)&v55);
    objc_msgSend(v31, "setPosition:", v24 - v28, v25 - v30);
  }
  objc_msgSend(*(id *)(a1 + 32), "_adjustContentSizeForView:atScale:", *(void *)(a1 + 40), *(double *)(a1 + 64), *(void *)&v54, *(void *)&v55);
  [*(id *)(a1 + 32) _centerContentIfNecessaryAdjustingContentOffset:0];
  CGRect v32 = *(void **)(a1 + 32);
  [v32 _zoomAnchorPoint];
  objc_msgSend(v32, "convertPoint:fromView:", *(void *)(a1 + 40));
  double v34 = v33;
  double v36 = v35;
  double v37 = [*(id *)(a1 + 32) window];
  double v38 = *(void **)(a1 + 32);
  double v39 = [v38 window];
  if (v37)
  {
    objc_msgSend(v39, "_convertDoublePointFromSceneReferenceSpace:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    double v41 = v40;
    double v43 = v42;
    double v44 = [*(id *)(a1 + 32) window];
    objc_msgSend(v38, "convertPoint:fromView:", v44, v41, v43);
    double v46 = v45;
    double v48 = v47;
  }
  else
  {
    objc_msgSend(v38, "convertPoint:fromView:", v39, *(double *)(a1 + 72), *(double *)(a1 + 80));
    double v46 = v49;
    double v48 = v50;
  }

  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(a1 + 32), "_rubberBandContentOffsetForOffset:outsideX:outsideY:", 0, 0, v34 - (v46 - v51), v36 - (v48 - v52));
  objc_msgSend(*(id *)(a1 + 32), "setContentOffset:");
  UIOffset result = (void *)[*(id *)(a1 + 32) _adjustContentOffsetIfNecessary];
  if ((*(void *)(*(void *)(a1 + 32) + 1772) & 0x200000) != 0) {
    UIOffset result = objc_msgSend(*(id *)(a1 + 48), "scrollViewDidZoom:");
  }
  if (*(unsigned char *)(a1 + 88))
  {
    UIOffset result = *(void **)(a1 + 32);
    if (result[115]) {
      return (void *)[result _adjustBackgroundShadowsForContentSizeForcedVisible:1];
    }
  }
  return result;
}

- (void)setZoomScale:(CGFloat)scale animated:(BOOL)animated
{
  BOOL v4 = animated;
  id v7 = [(UIScrollView *)self _getDelegateZoomView];
  if (v7)
  {
    id v29 = v7;
    [(UIScrollView *)self _centerContentIfNecessary];
    uint64_t v8 = *(void *)&self->_scrollViewFlags & 0x40000040;
    if (v8 == 1073741888)
    {
      [(UIScrollView *)self _zoomScaleForRubberBandScale:scale];
      scale = v9;
    }
    [(UIScrollView *)self _centeredZoomAnchorPointInScene];
    double v11 = v10;
    double v13 = v12;
    double v14 = [v29 window];
    double v15 = [v29 window];
    double v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "_convertDoublePointFromSceneReferenceSpace:", v11, v13);
      double v18 = v17;
      double v20 = v19;
      double v21 = [v29 window];
      objc_msgSend(v29, "convertPoint:fromView:", v21, v18, v20);
      double v23 = v22;
      double v25 = v24;
    }
    else
    {
      objc_msgSend(v29, "convertPoint:fromView:", v15, v11, v13);
      double v23 = v26;
      double v25 = v27;
    }

    if (v4) {
      double v28 = -1.0;
    }
    else {
      double v28 = 0.0;
    }
    -[UIScrollView _zoomToCenterInternal:scale:duration:allowRubberbanding:force:](self, "_zoomToCenterInternal:scale:duration:allowRubberbanding:force:", v8 == 1073741888, 0, v23, v25, scale, v28);
    id v7 = v29;
  }
}

- (CGPoint)_centeredZoomAnchorPointInScene
{
  [(UIView *)self bounds];
  double v5 = v4 + v3 * 0.5;
  double v8 = v7 + v6 * 0.5;
  double v9 = [(UIView *)self window];
  if (v9)
  {
    double v10 = [(UIView *)self window];
    double v11 = [(UIView *)self window];
    if (v11)
    {
      double v12 = [(UIView *)self window];
      objc_msgSend(v12, "convertPoint:fromView:", self, v5, v8);
      objc_msgSend(v10, "_convertDoublePointToSceneReferenceSpace:");
      double v5 = v13;
      double v8 = v14;

LABEL_8:
      goto LABEL_9;
    }
    objc_msgSend(v10, "_convertDoublePointToSceneReferenceSpace:", v5, v8);
LABEL_7:
    double v5 = v15;
    double v8 = v16;
    goto LABEL_8;
  }
  double v10 = [(UIView *)self window];
  if (v10)
  {
    double v11 = [(UIView *)self window];
    objc_msgSend(v11, "convertPoint:fromView:", self, v5, v8);
    goto LABEL_7;
  }
LABEL_9:

  double v17 = v5;
  double v18 = v8;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)_rubberBandContentOffsetForOffset:(CGPoint)a3 outsideX:(BOOL *)a4 outsideY:(BOOL *)a5
{
  CGFloat y = a3.y;
  double x = a3.x;
  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  BOOL v18 = [(UIScrollView *)self alwaysBounceHorizontal];
  BOOL v19 = [(UIScrollView *)self alwaysBounceVertical];
  [(UIScrollView *)self _effectiveContentInset];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  accuracCGFloat y = self->_accuracy;
  p_contentSize = &self->_contentSize;
  double v30 = v26 + v22 + self->_contentSize.width;
  if (accuracy == 1.0)
  {
    double v32 = round(v30);
    double v34 = round(v15);
  }
  else
  {
    double v31 = floor(v30);
    double v32 = v31 + round(accuracy * (v30 - v31)) / accuracy;
    double v33 = floor(v15);
    double v34 = v33 + round((v15 - v33) * accuracy) / accuracy;
  }
  if (v32 <= v34)
  {
    double v35 = (~*(_DWORD *)&self->_scrollViewFlags & 0x40000040) != 0 ? v11 : x;
    if (!v18 || (*(void *)&self->_scrollViewFlags & 8) == 0) {
      double x = v35;
    }
  }
  double v36 = v25 + v21 + self->_contentSize.height;
  if (accuracy == 1.0)
  {
    double v38 = round(v36);
    double v40 = round(v17);
  }
  else
  {
    double v37 = floor(v36);
    double v38 = v37 + round(accuracy * (v36 - v37)) / accuracy;
    double v39 = floor(v17);
    double v40 = v39 + round((v17 - v39) * accuracy) / accuracy;
  }
  double v41 = y;
  if (v38 <= v40)
  {
    uint64_t scrollViewFlags = (uint64_t)self->_scrollViewFlags;
    if ((!v19 || (scrollViewFlags & 4) == 0) && (~scrollViewFlags & 0x40000040) != 0) {
      double v41 = v13;
    }
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  double v43 = 1.0;
  if (self->_currentScrollDeviceCategory == 6)
  {
    double v44 = v21;
    double v45 = v25;
    int v46 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_GamePadRubberBandingLimitPercentage, @"GamePadRubberBandingLimitPercentage", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v25 = v45;
    double v21 = v44;
    if (v46) {
      double v43 = 0.5;
    }
    else {
      double v43 = *(double *)&qword_1E8FD55C0;
    }
  }
  if ((*(unsigned char *)&self->_scrollViewFlags & 8) != 0)
  {
    double v57 = v21;
    double v58 = self->_accuracy;
    double v59 = v27 + p_contentSize->width;
    double v60 = v25;
    if (v58 == 1.0)
    {
      double v62 = round(v59);
      double v65 = round(self->_firstPageOffset.horizontal - v23);
      double v67 = round(v15);
    }
    else
    {
      double v61 = floor(v59);
      double v62 = v61 + round(v58 * (v59 - v61)) / v58;
      double v63 = self->_firstPageOffset.horizontal - v23;
      double v64 = floor(v63);
      double v65 = v64 + round(v58 * (v63 - v64)) / v58;
      double v66 = floor(v15);
      double v67 = v66 + round((v15 - v66) * v58) / v58;
    }
    [(UIScrollView *)self _rubberBandOffsetForOffset:a4 maxOffset:x minOffset:v62 - v15 range:v65 outside:v43 * v67];
    double v53 = v68;
    uint64_t v47 = *(void *)((char *)&self->_scrollViewFlags + 12);
    if ((v47 & 0x3000000000) != 0)
    {
      double v21 = v57;
      double v25 = v60;
    }
    else
    {
      double v69 = self->_accuracy;
      double v21 = v57;
      double v25 = v60;
      if (v69 == 1.0)
      {
        double v53 = round(v53);
      }
      else
      {
        double v70 = floor(v53);
        double v53 = v70 + round((v53 - v70) * v69) / v69;
      }
    }
    goto LABEL_47;
  }
  uint64_t v47 = *(void *)((char *)&self->_scrollViewFlags + 12);
  double v48 = self->_accuracy;
  if ((v47 & 0x3000000000) == 0)
  {
    if (v48 == 1.0)
    {
      double x = round(x);
      double width = p_contentSize->width;
      goto LABEL_39;
    }
    double v49 = floor(x);
    double x = v49 + round((x - v49) * v48) / v48;
  }
  double width = p_contentSize->width;
  if (v48 != 1.0)
  {
    double v51 = self->_firstPageOffset.horizontal - v23;
    double v52 = floor(v51);
    double v53 = v52 + round(v48 * (v51 - v52)) / v48;
    double v54 = v27 + width;
    double v55 = floor(v54);
    double v56 = v55 + round(v48 * (v54 - v55)) / v48;
    goto LABEL_40;
  }
LABEL_39:
  double v53 = round(self->_firstPageOffset.horizontal - v23);
  double v56 = round(v27 + width);
LABEL_40:
  if (x >= v53)
  {
    double v71 = v56 - v15;
    if (x <= v71)
    {
      double v53 = x;
    }
    else if (v71 > v53)
    {
      double v53 = v71;
    }
  }
LABEL_47:
  if ((*(unsigned char *)&self->_scrollViewFlags & 4) == 0)
  {
    double v72 = self->_accuracy;
    if ((v47 & 0x3000000000) == 0)
    {
      if (v72 == 1.0)
      {
        double v41 = round(v41);
        double height = self->_contentSize.height;
        goto LABEL_60;
      }
      double v73 = floor(v41);
      double v41 = v73 + round((v41 - v73) * v72) / v72;
    }
    double height = self->_contentSize.height;
    if (v72 != 1.0)
    {
      double v75 = self->_firstPageOffset.vertical - v21;
      double v76 = floor(v75);
      double v77 = v76 + round(v72 * (v75 - v76)) / v72;
      double v78 = v25 + height;
      double v79 = floor(v78);
      double v80 = v79 + round(v72 * (v78 - v79)) / v72;
      goto LABEL_61;
    }
LABEL_60:
    double v77 = round(self->_firstPageOffset.vertical - v21);
    double v80 = round(v25 + height);
LABEL_61:
    if (v41 >= v77)
    {
      double v93 = v80 - v17;
      if (v93 > v77) {
        double v77 = v93;
      }
      if (v41 <= v93) {
        double v77 = v41;
      }
    }
    goto LABEL_68;
  }
  double v81 = self->_accuracy;
  double v82 = v25 + self->_contentSize.height;
  if (v81 == 1.0)
  {
    double v84 = round(v82);
    double v87 = round(self->_firstPageOffset.vertical - v21);
    double v89 = round(v17);
  }
  else
  {
    double v83 = floor(v82);
    double v84 = v83 + round(v81 * (v82 - v83)) / v81;
    double v85 = self->_firstPageOffset.vertical - v21;
    double v86 = floor(v85);
    double v87 = v86 + round(v81 * (v85 - v86)) / v81;
    double v88 = floor(v17);
    double v89 = v88 + round((v17 - v88) * v81) / v81;
  }
  [(UIScrollView *)self _rubberBandOffsetForOffset:a5 maxOffset:v41 minOffset:v84 - v17 range:v87 outside:v43 * v89];
  double v77 = v90;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x3000000000) == 0)
  {
    double v91 = self->_accuracy;
    if (v91 == 1.0)
    {
      double v77 = round(v77);
    }
    else
    {
      double v92 = floor(v77);
      double v77 = v92 + round((v77 - v92) * v91) / v91;
    }
  }
LABEL_68:
  double v94 = v53;
  result.CGFloat y = v77;
  result.double x = v94;
  return result;
}

- (double)_rubberBandOffsetForOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6 outside:(BOOL *)a7
{
  double v13 = [(UIScrollView *)self _refreshControl];
  double v14 = v13;
  if (a3 >= a5 || v13 == 0)
  {
    [(UIScrollView *)self _rubberBandOffsetWithoutDecorationForOffset:a7 maxOffset:a3 minOffset:a4 range:a5 outside:a6];
    a3 = v16;
  }
  else if ([v13 _hostAdjustsContentOffset] {
         && ([v14 _areInsetsBeingApplied] & 1) != 0
  }
         || ([v14 _refreshControlHeight], a5 - v17 >= a3))
  {
    if (([v14 _areInsetsBeingApplied] & 1) == 0)
    {
      [v14 _refreshControlHeight];
      a3 = v18 + a3;
    }
    [(UIScrollView *)self _rubberBandOffsetWithoutDecorationForOffset:a7 maxOffset:a3 minOffset:a4 range:a5 outside:a6];
    a3 = v19;
    if (([v14 _areInsetsBeingApplied] & 1) == 0)
    {
      [v14 _refreshControlHeight];
      a3 = a3 - v20;
    }
  }

  return a3;
}

- (double)_rubberBandOffsetWithoutDecorationForOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6 outside:(BOOL *)a7
{
  [(UIScrollView *)self _currentRubberBandCoefficient];
  _UIScrollViewRubberBandOffsetWithoutDecorationForOffset(a7, a3, a4, a5, a6);
  return result;
}

- (double)_currentRubberBandCoefficient
{
  return _UIScrollViewRubberBandCoefficient(self->_currentScrollDeviceCategory);
}

- (double)_clampedZoomScale:(double)a3 allowRubberbanding:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 0.0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v10 = 136315138;
        double v11 = "-[UIScrollView _clampedZoomScale:allowRubberbanding:]";
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "%s: Must be called with non-zero scale", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      double v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A510) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315138;
        double v11 = "-[UIScrollView _clampedZoomScale:allowRubberbanding:]";
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "%s: Must be called with non-zero scale", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  if (v4)
  {
    [(UIScrollView *)self _zoomRubberBandScaleForScale:a3];
  }
  else
  {
    double result = self->_minimumZoomScale;
    if (result <= a3) {
      double result = a3;
    }
    if (result > self->_maximumZoomScale) {
      return self->_maximumZoomScale;
    }
  }
  return result;
}

- (void)_adjustContentSizeForView:(id)a3 atScale:(double)a4
{
  [a3 frame];
  double v7 = v6;
  double v9 = v8;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x400000) != 0)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "scrollView:contentSizeForZoomScale:withProposedSize:", self, a4, v7, v9);
    double v7 = v11;
    double v9 = v12;
  }
  -[UIScrollView setContentSize:](self, "setContentSize:", v7, v9);
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)UIScrollView;
  double v3 = [(UIView *)&v9 description];
  BOOL v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  [(UIScrollView *)self contentOffset];
  double v5 = NSStringFromCGPoint(v11);
  [(UIScrollView *)self contentSize];
  double v6 = NSStringFromCGSize(v12);
  [(UIScrollView *)self adjustedContentInset];
  double v7 = NSStringFromUIEdgeInsets(v13);
  objc_msgSend(v4, "appendFormat:", @"; contentOffset: %@; contentSize: %@; adjustedContentInset: %@>",
    v5,
    v6,
    v7);

  return (NSString *)v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIScrollView;
  [(UIView *)&v18 traitCollectionDidChange:v4];
  double v5 = [(UIView *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;
  uint64_t v10 = [v5 userInterfaceStyle];
  if (v10 != [v4 userInterfaceStyle])
  {
    -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](self, 3, 1);
    [(UIScrollView *)self _updateAccessories];
  }
  if (v7 != v9)
  {
    [(UIScrollView *)self contentOffset];
    double v12 = v11;
    double v14 = v13;
    -[UIScrollView _roundedProposedContentOffset:](self, "_roundedProposedContentOffset:");
    if (v12 != v16 || v14 != v15) {
      -[UIScrollView setContentOffset:](self, "setContentOffset:");
    }
  }
  uint64_t v17 = [v5 userInterfaceIdiom];
  if (v17 != [v4 userInterfaceIdiom]) {
    [(UIScrollView *)self _allowsKeyboardScrollingDidUpdate];
  }
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UIScrollView;
  [(UIView *)&v8 _didChangeFromIdiom:a3 onScreen:a4 traverseHierarchy:a5];
  double v6 = [(UIView *)self _screen];
  double v7 = [v6 _capabilityForKey:@"UIScreenCapabilityTouchLevelsKey"];
  self->_touchLevel = [v7 integerValue];

  [(UIScrollView *)self _updateUsesStaticScrollBar];
  [(UIScrollView *)self _enableOnlyGestureRecognizersForCurrentTouchLevel];
  -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](self, 3, 1);
  [(UIScrollView *)self _updateAccessories];
}

- (void)_updateAccessoriesInset
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v3 = [(NSMutableDictionary *)self->_accessoryViews objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        double v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        [v12 alpha];
        if (v13 > 0.0 && ([v12 overlay] & 1) == 0)
        {
          switch([v12 edge])
          {
            case 2:
              [v12 frame];
              double v10 = v10 + CGRectGetHeight(v28);
              break;
            case 3:
              [v12 frame];
              double v9 = v9 + CGRectGetWidth(v29);
              break;
            case 4:
              [v12 frame];
              double v8 = v8 + CGRectGetHeight(v30);
              break;
            case 5:
              [v12 frame];
              double v7 = v7 + CGRectGetWidth(v31);
              break;
            default:
              break;
          }
        }
        ++v11;
      }
      while (v5 != v11);
      uint64_t v14 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v5 = v14;
    }
    while (v14);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
  }

  [(UIScrollView *)self accessoryInsets];
  self->_accessoryInsets.double top = v10;
  self->_accessoryInsets.double left = v9;
  self->_accessoryInsets.double bottom = v8;
  self->_accessoryInsets.double right = v7;
  if (v18 != v9 || v15 != v10 || v17 != v7 || v16 != v8) {
    -[UIScrollView accessoryInsetsDidChange:](self, "accessoryInsetsDidChange:");
  }
}

- (void)_enableOnlyGestureRecognizersForCurrentTouchLevel
{
  [(UIScrollView *)self _createGestureRecognizersForCurrentTouchLevel];
  [(UIScrollView *)self _updateZoomGestureRecognizersEnabled];
  [(UIScrollView *)self _updateScrollGestureRecognizersEnabled];
}

- (void)_updateZoomGestureRecognizersEnabled
{
  pinch = self->_pinch;
  BOOL v4 = (*((unsigned char *)&self->_scrollViewFlags + 2) & 0x40) == 0 && self->_touchLevel == 0;
  [(UIGestureRecognizer *)pinch setEnabled:v4];
}

- (void)accessoryInsetsDidChange:(UIEdgeInsets)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _scrollViewAccessoryInsetsDidChange:self];
  }
}

- (void)_resetContentScrollableAxes
{
  *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x78u;
}

- (UIOffset)_firstPageOffset
{
  double horizontal = self->_firstPageOffset.horizontal;
  double vertical = self->_firstPageOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (BOOL)isZoomEnabled
{
  return (*((unsigned char *)&self->_scrollViewFlags + 2) & 0x40) == 0;
}

- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3
{
  -[UIScrollView _adjustedContentOffsetForContentOffset:contentSize:skipsAdjustmentIfScrolling:](self, "_adjustedContentOffsetForContentOffset:contentSize:skipsAdjustmentIfScrolling:", 0, a3.x, a3.y, self->_contentSize.width, self->_contentSize.height);
  result.CGFloat y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)isZooming
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 3) >> 6) & 1;
}

- (void)setMinimumZoomScale:(CGFloat)minimumZoomScale
{
  if (self->_minimumZoomScale != minimumZoomScale)
  {
    self->_minimumZoomScale = minimumZoomScale;
    [(UIScrollView *)self _updatePinchGesture];
  }
}

- (void)setMaximumZoomScale:(CGFloat)maximumZoomScale
{
  if (self->_maximumZoomScale != maximumZoomScale)
  {
    self->_maximumZoomScale = maximumZoomScale;
    [(UIScrollView *)self _updatePinchGesture];
  }
}

- (void)_setAdjustsContentInsetWhenScrollDisabled:(BOOL)a3
{
  if (((((*((unsigned char *)&self->_scrollViewFlags + 2) & 0x20) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(UIScrollView *)self _systemContentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    unint64_t v13 = [(UIScrollView *)self _edgesPropagatingSafeAreaInsetsToSubviews];
    uint64_t v14 = 0x200000;
    if (!v3) {
      uint64_t v14 = 0;
    }
    *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFDFFFFFLL | v14;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
  }
}

- (void)_setIndicatorInsetAdjustmentBehavior:(int64_t)a3
{
  unint64_t v3 = *((unsigned int *)&self->_scrollViewFlags + 5);
  if (((v3 >> 7) & 3) != a3)
  {
    *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12);
    *((_DWORD *)&self->_scrollViewFlags + 5) = v3 & 0xFFFFFE7F | ((a3 & 3) << 7);
    [(UIScrollView *)self _updateForChangedScrollIndicatorRelatedInsets];
  }
}

- (void)setBouncesVertically:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFFFBLL | v3;
  [(UIScrollView *)self _didSetBounces];
}

- (void)setBouncesHorizontally:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFFF7 | v3;
  [(UIScrollView *)self _didSetBounces];
}

- (BOOL)_isVerticalBouncing
{
  return (*(unsigned char *)&self->_scrollViewFlags >> 4) & 1;
}

- (UIEdgeInsets)_contentInsetForAccessories
{
  [(UIScrollView *)self _systemContentInsetIncludingAccessories:0];
  double v4 = v3 + self->_contentInset.top;
  double v6 = v5 + self->_contentInset.left;
  double v8 = v7 + self->_contentInset.bottom;
  double v10 = v9 + self->_contentInset.right;
  [(UIView *)self safeAreaInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  char v19 = [(UIScrollView *)self _edgesApplyingSafeAreaInsetsToScrollAccessoryInsets];
  double v20 = fmax(v4, v12);
  if (v19) {
    double v21 = v20;
  }
  else {
    double v21 = v4;
  }
  double v22 = fmax(v6, v14);
  if ((v19 & 2) != 0) {
    double v23 = v22;
  }
  else {
    double v23 = v6;
  }
  double v24 = fmax(v8, v16);
  if ((v19 & 4) != 0) {
    double v25 = v24;
  }
  else {
    double v25 = v8;
  }
  double v26 = fmax(v10, v18);
  if ((v19 & 8) != 0) {
    double v27 = v26;
  }
  else {
    double v27 = v10;
  }
  CGRect v28 = [(UIView *)self layer];
  int v29 = [v28 flipsHorizontalAxis];

  if (v29) {
    double v30 = v23;
  }
  else {
    double v30 = v27;
  }
  if (v29) {
    double v31 = v27;
  }
  else {
    double v31 = v23;
  }
  double v32 = v21;
  double v33 = v25;
  result.double right = v30;
  result.double bottom = v33;
  result.double left = v31;
  result.double top = v32;
  return result;
}

- (unint64_t)_edgesApplyingSafeAreaInsetsToScrollAccessoryInsets
{
  int64_t contentInsetAdjustmentBehavior = self->_contentInsetAdjustmentBehavior;
  if (contentInsetAdjustmentBehavior == 101 || contentInsetAdjustmentBehavior == 2) {
    return 0;
  }
  else {
    return 15;
  }
}

- (void)setScrollIndicatorInsets:(UIEdgeInsets)scrollIndicatorInsets
{
  if (scrollIndicatorInsets.left != self->_scrollIndicatorInset.left
    || scrollIndicatorInsets.top != self->_scrollIndicatorInset.top
    || scrollIndicatorInsets.right != self->_scrollIndicatorInset.right
    || scrollIndicatorInsets.bottom != self->_scrollIndicatorInset.bottom)
  {
    self->_scrollIndicatorInset = scrollIndicatorInsets;
    int64x2_t v6 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&self->_verticalScrollIndicatorInsets.double top = v6;
    *(int64x2_t *)&self->_verticalScrollIndicatorInsets.double bottom = v6;
    *(int64x2_t *)&self->_horizontalScrollIndicatorInsets.double top = v6;
    *(int64x2_t *)&self->_horizontalScrollIndicatorInsets.double bottom = v6;
    [(UIScrollView *)self _updateForChangedScrollIndicatorRelatedInsets];
  }
}

- (CGSize)visibleSize
{
  [(UIView *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (void)setDirectionalLockEnabled:(BOOL)directionalLockEnabled
{
}

- (void)setZoomScale:(CGFloat)zoomScale
{
}

- (id)_boundingPathForSubtree
{
  if ([(UIScrollView *)self _resetsBoundingPathForSubtree])
  {
    objc_getAssociatedObject(self, &_UIScrollViewBoundingPathForSubtreeKey);
    double v3 = (_UIRectangularBoundingPath *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      double v4 = [_UIRectangularBoundingPath alloc];
      [(UIView *)self bounds];
      double v3 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v4, "initWithCoordinateSpace:boundingRect:", self);
      objc_setAssociatedObject(self, &_UIScrollViewBoundingPathForSubtreeKey, v3, (void *)1);
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIScrollView;
    double v3 = [(UIView *)&v6 _boundingPathForSubtree];
  }
  return v3;
}

- (BOOL)_resetsBoundingPathForSubtree
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 10) & 1;
}

- (void)_setSupportsPointerDragScrolling:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFF7FFFFF | v3;
}

- (void)setZoomEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIScrollView *)self _updatePanGestureConfiguration];
  uint64_t v5 = 0x400000;
  if (v3) {
    uint64_t v5 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFBFFFFFLL | v5;
  [(UIScrollView *)self _updateZoomGestureRecognizersEnabled];
}

- (CGFloat)minimumZoomScale
{
  return self->_minimumZoomScale;
}

- (void)_setLayoutObserver:(id)a3
{
}

- (void)setTracksImmediatelyWhileDecelerating:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (void)_setAutoScrollEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0;
  }
  else {
    int v3 = 4;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFFFFFB | v3;
}

- (UIEdgeInsets)_contentScrollInset
{
  double top = self->_contentScrollInset.top;
  double left = self->_contentScrollInset.left;
  double bottom = self->_contentScrollInset.bottom;
  double right = self->_contentScrollInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setEdgesAllowingScrollAccessoriesExtendedToBoundingPath:(unint64_t)a3
{
  if (self->_edgesAllowingScrollAccessoriesExtendedToBoundingPath != a3)
  {
    self->_edgesAllowingScrollAccessoriesExtendedToBoundingPath = a3;
    [(UIScrollView *)self _updateForChangedScrollIndicatorRelatedInsets];
  }
}

- (void)setCanCancelContentTouches:(BOOL)canCancelContentTouches
{
  uint64_t v3 = 0x20000;
  if (!canCancelContentTouches) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (void)setBouncesZoom:(BOOL)bouncesZoom
{
  uint64_t v3 = 64;
  if (!bouncesZoom) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (void)setAllowsKeyboardScrolling:(BOOL)allowsKeyboardScrolling
{
  if (allowsKeyboardScrolling) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFFFFFC | v3;
  [(UIScrollView *)self _allowsKeyboardScrollingDidUpdate];
}

- (void)_setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFBFFFFFF | v3;
}

- (void)_setAvoidsJumpOnInterruptedBounce:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (void)_setAlwaysAppliesKeyboardBottomInsetAdjustment:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFF7FFF | v3;
}

- (id)nsli_contentXOffsetVariable
{
  contentXOffsetVariable = self->_contentXOffsetVariable;
  if (!contentXOffsetVariable)
  {
    double v4 = [MEMORY[0x1E4F5B260] variableWithDelegate:self valueRestriction:0 shouldBeMinimized:0];
    uint64_t v5 = self->_contentXOffsetVariable;
    self->_contentXOffsetVariable = v4;

    contentXOffsetVariable = self->_contentXOffsetVariable;
  }
  return contentXOffsetVariable;
}

- (id)nsli_contentYOffsetVariable
{
  contentYOffsetVariable = self->_contentYOffsetVariable;
  if (!contentYOffsetVariable)
  {
    double v4 = [MEMORY[0x1E4F5B260] variableWithDelegate:self valueRestriction:0 shouldBeMinimized:0];
    uint64_t v5 = self->_contentYOffsetVariable;
    self->_contentYOffsetVariable = v4;

    contentYOffsetVariable = self->_contentYOffsetVariable;
  }
  return contentYOffsetVariable;
}

- (void)_allowsKeyboardScrollingDidUpdate
{
  if (self->_keyboardScrollingAnimator && ![(UIScrollView *)self allowsKeyboardScrolling])
  {
    [(_UIScrollViewScrollingAnimator *)self->_keyboardScrollingAnimator invalidate];
    keyboardScrollingAnimator = self->_keyboardScrollingAnimator;
    self->_keyboardScrollingAnimator = 0;
  }
}

- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4
{
  id v11 = a3;
  if (!self->_accessoryViews)
  {
    objc_super v6 = [MEMORY[0x1E4F1CA60] dictionary];
    accessoryViews = self->_accessoryViews;
    self->_accessoryViews = v6;
  }
  double v8 = [(UIScrollView *)self accessoryViewAtEdge:a4];
  [v8 removeFromSuperview];
  if (v11)
  {
    [v11 setScrollView:self];
    [(UIScrollView *)self _addContentSubview:v11 atBack:0];
  }
  double v9 = self->_accessoryViews;
  double v10 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)v9 setObject:v11 forKeyedSubscript:v10];

  -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](self, 3, 0);
  [(UIScrollView *)self _updateAccessories];
}

- (id)accessoryViewAtEdge:(int64_t)a3
{
  accessoryViews = self->_accessoryViews;
  objc_super v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  double v7 = [(NSMutableDictionary *)accessoryViews objectForKeyedSubscript:v6];

  if (!v7)
  {
    if ((unint64_t)a3 > 1)
    {
      double v7 = 0;
    }
    else
    {
      uint64_t v8 = (a3 == 1) != [(UIScrollView *)self _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis]? 5: 3;
      double v9 = self->_accessoryViews;
      double v10 = [NSNumber numberWithInteger:v8];
      double v7 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v10];
    }
    uint64_t v11 = _UIScrollAccessorySemanticEdge(a3, self);
    if (v11 != a3)
    {
      double v12 = self->_accessoryViews;
      double v13 = [NSNumber numberWithInteger:v11];
      uint64_t v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];

      double v7 = (void *)v14;
    }
  }
  return v7;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x800000000000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIScrollView;
    [(UIResponder *)&v4 touchesMoved:a3 withEvent:a4];
  }
}

- (CGRect)_intelligenceVisibleBounds
{
  double v2 = self;
  [(UIScrollView *)v2 adjustedContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIView *)v2 safeAreaInsets];
  double v12 = UIEdgeInsetsMax(15, v4, v6, v8, v10, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(UIView *)v2 bounds];
  double v23 = UIRectInset(v19, v20, v21, v22, v12, v18, v16, v14);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.CGFloat y = v31;
  result.origin.double x = v30;
  return result;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (void)startScrollViewMonitoring
{
  if (objc_opt_class())
  {
    double v3 = [[UIScrollViewMonitor alloc] initWithScrollView:self];
    [(UIScrollView *)self set_scrollViewMonitor:v3];

    double v4 = [(UIScrollView *)self _scrollViewMonitor];

    if (v4)
    {
      kdebug_trace();
      double v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &qword_1EB2646B8) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v11 = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Did start scroll view monitoring", v11, 2u);
      }
      id v6 = objc_alloc(MEMORY[0x1E4F9A6B0]);
      double v7 = [(UIScrollView *)self _scrollViewMonitor];
      double v8 = (void *)[v6 initWithScrollView:self scrollMonitor:v7];

      double v9 = [(UIScrollView *)self _scrollViewMonitor];
      [v9 setDelegate:v8];
    }
  }
  else
  {
    double v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &_MergedGlobals_1259) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "Can not find SRHMediaEventsCollector. Stop monitoring", buf, 2u);
    }
  }
}

- (void)stopScrollViewMonitoring
{
  double v3 = [(UIScrollView *)self _scrollViewMonitor];
  [v3 stopMonitoring];

  [(UIScrollView *)self set_scrollViewMonitor:0];
  kdebug_trace();
  double v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &stopScrollViewMonitoring___s_category) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Did stop scroll view monitoring", v5, 2u);
  }
}

- (void)_adjustCrossingConstraintsIfNecessaryForOldContentInset:(UIEdgeInsets)a3
{
  double left = a3.left;
  double top = a3.top;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  [(UIScrollView *)self contentInset];
  BOOL v8 = left == v7 && top == v6;
  if (!v8 && (*(void *)&self->super._viewFlags & 0x400000000000000) != 0)
  {
    double v9 = v6;
    double v10 = v7;
    obuint64_t j = [(UIView *)self subviews];
    if ([obj count])
    {
      BOOL v11 = [(UIView *)self _hostsLayoutEngine];

      if (!v11)
      {
        double v12 = (void *)MEMORY[0x1E4F1CA48];
        double v13 = [(UIView *)self _constraintsExceptingSubviewAutoresizingConstraints];
        double v14 = [v12 arrayWithArray:v13];

        uint64_t v15 = [(UIView *)self superview];
        if (v15)
        {
          double v16 = (void *)v15;
          do
          {
            double v17 = [v16 _constraintsExceptingSubviewAutoresizingConstraints];
            [v14 addObjectsFromArray:v17];

            if ([v16 _hostsLayoutEngine]) {
              break;
            }
            uint64_t v18 = [v16 superview];

            double v16 = (void *)v18;
          }
          while (v18);
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id obja = v14;
        uint64_t v19 = [obja countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v44;
          double v22 = top - v9;
          double v23 = left - v10;
          double v24 = v9 - top;
          double v25 = v10 - left;
          do
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v44 != v21) {
                objc_enumerationMutation(obja);
              }
              double v27 = *(void **)(*((void *)&v43 + 1) + 8 * v26);
              double v28 = [v27 firstItem];
              double v29 = [v27 secondItem];
              double v30 = v29;
              if (v28 == self || v29 == self) {
                goto LABEL_39;
              }
              BOOL v32 = [(UIView *)v28 isDescendantOfView:self];
              int v33 = ![(UIView *)v30 isDescendantOfView:self];
              if ((v32 & v33) == 1
                && ![(UIView *)v28 translatesAutoresizingMaskIntoConstraints])
              {
                goto LABEL_27;
              }
              if (((v33 | v32) & 1) != 0
                || [(UIView *)v30 translatesAutoresizingMaskIntoConstraints])
              {
                goto LABEL_39;
              }
              if ((v32 & v33) != 0)
              {
LABEL_27:
                unsigned int v34 = [v27 firstAttribute];
                double v35 = 0.0;
                if (v34 > 0xA) {
                  goto LABEL_37;
                }
                int v36 = 1 << v34;
                double v37 = v25;
                if (((1 << v34) & 0x266) == 0)
                {
                  double v37 = v24;
                  goto LABEL_34;
                }
              }
              else
              {
                unsigned int v38 = [v27 secondAttribute];
                double v35 = 0.0;
                if (v38 > 0xA) {
                  goto LABEL_37;
                }
                int v36 = 1 << v38;
                if (((1 << v38) & 0x266) == 0)
                {
                  double v37 = v22;
LABEL_34:
                  if ((v36 & 0x418) == 0) {
                    goto LABEL_37;
                  }
                  goto LABEL_35;
                }
                double v37 = v23;
              }
LABEL_35:
              if (v37 == 0.0)
              {
                double v35 = v37;
LABEL_37:
                double v37 = v35;
                if (*MEMORY[0x1E4F5B220] > 0.0) {
                  goto LABEL_39;
                }
LABEL_38:
                [v27 constant];
                [v27 setConstant:v37 + v39];
                goto LABEL_39;
              }
              if (fabs(v37) >= *MEMORY[0x1E4F5B220]) {
                goto LABEL_38;
              }
LABEL_39:

              ++v26;
            }
            while (v20 != v26);
            uint64_t v40 = [obja countByEnumeratingWithState:&v43 objects:v47 count:16];
            uint64_t v20 = v40;
          }
          while (v40);
        }
      }
    }
    else
    {
    }
  }
}

- (BOOL)_constraintAffectsContentSize:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 firstItem];
  uint64_t v6 = [v4 secondItem];

  BOOL v7 = 0;
  if (v6 && v5 && v5 != v6)
  {
    BOOL v8 = [(UIView *)self subviews];
    double v9 = v8;
    BOOL v7 = (UIScrollView *)v5 == self
      && (*(void *)(v6 + 96) & 0x20000000000000) != 0
      && ([v8 containsObject:v6] & 1) != 0
      || (UIScrollView *)v6 == self
      && (*(void *)(v5 + 96) & 0x20000000000000) != 0
      && [v9 containsObject:v5];
  }
  return v7;
}

- (void)_didAddDependentConstraint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  id v4 = a3;
  [(UIView *)&v6 _didAddDependentConstraint:v4];
  BOOL v5 = -[UIScrollView _constraintAffectsContentSize:](self, "_constraintAffectsContentSize:", v4, v6.receiver, v6.super_class);

  if (v5 && ![(UIScrollView *)self _wantsConstrainedContentSize])
  {
    [(UIScrollView *)self _setAutomaticContentConstraints:0];
    [(UIScrollView *)self _setWantsConstrainedContentSize:1];
  }
}

- (void)_didRemoveDependentConstraint:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIScrollView;
  [(UIView *)&v15 _didRemoveDependentConstraint:v4];
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v5 = self;
  objc_super v6 = v5;
  if (v5)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    BOOL v8 = v5;
    while (1)
    {
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __82__UIScrollView__UIOldConstraintBasedLayoutSupport___didRemoveDependentConstraint___block_invoke;
      v10[3] = &unk_1E530E628;
      v10[4] = v6;
      v10[5] = &v11;
      _UIViewEnumerateConstraints(v8, (uint64_t)v10);
      if (*((unsigned char *)v12 + 24) || ([v8 _hostsLayoutEngine] & 1) != 0) {
        break;
      }
      uint64_t v9 = [v8 superview];

      BOOL v8 = (void *)v9;
      if (!v9) {
        goto LABEL_8;
      }
    }
  }
LABEL_8:
  [(UIScrollView *)v6 _setWantsConstrainedContentSize:*((unsigned __int8 *)v12 + 24)];
  _Block_object_dispose(&v11, 8);
}

uint64_t __82__UIScrollView__UIOldConstraintBasedLayoutSupport___didRemoveDependentConstraint___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) _constraintAffectsContentSize:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)_constraintsFromContentSize
{
  [(UIScrollView *)self contentSize];
  double v4 = v3;
  objc_super v6 = +[_UIScrollViewAutomaticContentSizeConstraint constraintWithItem:self attribute:101 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v5];
  uint64_t v7 = +[_UIScrollViewAutomaticContentSizeConstraint constraintWithItem:self attribute:102 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v4];
  BOOL v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v6, v7, 0);

  return v8;
}

- (UIScrollView)initWithCoder:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)UIScrollView;
  double v5 = [(UIView *)&v69 initWithCoder:v4];
  objc_super v6 = v5;
  if (!v5) {
    goto LABEL_77;
  }
  _UIScrollViewSharedInit(v5);
  [v4 decodeUIEdgeInsetsForKey:@"UIContentInset"];
  v6->_contentInset.double top = v7;
  v6->_contentInset.double left = v8;
  v6->_contentInset.double bottom = v9;
  v6->_contentInset.double right = v10;
  [v4 decodeUIEdgeInsetsForKey:@"UIScrollIndicatorInsets"];
  v6->_scrollIndicatorInset.double top = v11;
  v6->_scrollIndicatorInset.double left = v12;
  v6->_scrollIndicatorInset.double bottom = v13;
  v6->_scrollIndicatorInset.double right = v14;
  if ([v4 containsValueForKey:@"UIVerticalScrollIndicatorInsets"])
  {
    [v4 decodeUIEdgeInsetsForKey:@"UIVerticalScrollIndicatorInsets"];
    v6->_verticalScrollIndicatorInsets.double top = v15;
    v6->_verticalScrollIndicatorInsets.double left = v16;
    v6->_verticalScrollIndicatorInsets.double bottom = v17;
    v6->_verticalScrollIndicatorInsets.double right = v18;
  }
  if ([v4 containsValueForKey:@"UIHorizontalScrollIndicatorInsets"])
  {
    [v4 decodeUIEdgeInsetsForKey:@"UIHorizontalScrollIndicatorInsets"];
    v6->_horizontalScrollIndicatorInsets.double top = v19;
    v6->_horizontalScrollIndicatorInsets.double left = v20;
    v6->_horizontalScrollIndicatorInsets.double bottom = v21;
    v6->_horizontalScrollIndicatorInsets.double right = v22;
  }
  if ([v4 containsValueForKey:@"UIScrollViewIndicatorInsetAdjustmentBehavior"]) {
    *((_DWORD *)&v6->_scrollViewFlags + 5) = *((_DWORD *)&v6->_scrollViewFlags + 5) & 0xFFFFFE7F | (([v4 decodeIntegerForKey:@"UIScrollViewIndicatorInsetAdjustmentBehavior"] & 3) << 7);
  }
  int v23 = [v4 decodeBoolForKey:@"UIScrollDisabled"];
  p_uint64_t scrollViewFlags = (unint64_t *)&v6->_scrollViewFlags;
  uint64_t v25 = 0x100000;
  if (!v23) {
    uint64_t v25 = 0;
  }
  unint64_t *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFEFFFFFLL | v25;
  int v26 = [v4 decodeBoolForKey:@"UIPagingEnabled"];
  uint64_t v27 = 32;
  if (!v26) {
    uint64_t v27 = 0;
  }
  *(void *)((char *)&v6->_scrollViewFlags + 12) = *(void *)((char *)&v6->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFFDFLL | v27;
  int v28 = [v4 decodeBoolForKey:@"UIBouncesZoom"];
  uint64_t v29 = 64;
  if (!v28) {
    uint64_t v29 = 0;
  }
  unint64_t *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFFFFFBFLL | v29;
  int v30 = [v4 decodeBoolForKey:@"UIAlwaysBounceVertical"];
  uint64_t v31 = 512;
  if (!v30) {
    uint64_t v31 = 0;
  }
  unint64_t *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFFFFDFFLL | v31;
  int v32 = [v4 decodeBoolForKey:@"UIAlwaysBounceHorizontal"];
  uint64_t v33 = 256;
  if (!v32) {
    uint64_t v33 = 0;
  }
  unint64_t *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFFFFEFFLL | v33;
  if ([v4 containsValueForKey:@"UIScrollViewContentInsetAdjustmentBehavior"])
  {
    uint64_t v34 = [v4 decodeIntegerForKey:@"UIScrollViewContentInsetAdjustmentBehavior"];
LABEL_22:
    v6->_int64_t contentInsetAdjustmentBehavior = v34;
    goto LABEL_23;
  }
  if (![(id)objc_opt_class() _defaultEdgesScrollingContentIntoSafeArea])
  {
    uint64_t v34 = 101;
    goto LABEL_22;
  }
LABEL_23:
  [v4 decodeCGSizeForKey:@"UIContentSize"];
  v6->_contentSize.double width = v35;
  v6->_contentSize.double height = v36;
  *p_scrollViewFlags &= 0xFFFFFFFFCFFFFFFFLL;
  if ([v4 containsValueForKey:@"UIIndicatorStyle"]) {
    unint64_t v37 = *p_scrollViewFlags & 0xFFFFFFFFCFFFFFFFLL | (([v4 decodeIntegerForKey:@"UIIndicatorStyle"] & 3) << 28);
  }
  else {
    unint64_t v37 = *p_scrollViewFlags;
  }
  unint64_t *p_scrollViewFlags = v37 | 8;
  if ([v4 containsValueForKey:@"UIBounceEnabled"])
  {
    int v38 = [v4 decodeBoolForKey:@"UIBounceEnabled"];
    uint64_t v39 = 8;
    if (!v38) {
      uint64_t v39 = 0;
    }
    unint64_t v40 = *p_scrollViewFlags & 0xFFFFFFFFFFFFFFF7 | v39;
  }
  else
  {
    unint64_t v40 = *p_scrollViewFlags;
  }
  unint64_t *p_scrollViewFlags = v40 | 4;
  if ([v4 containsValueForKey:@"UIBounceEnabled"])
  {
    int v41 = [v4 decodeBoolForKey:@"UIBounceEnabled"];
    uint64_t v42 = 4;
    if (!v41) {
      uint64_t v42 = 0;
    }
    unint64_t *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFFFFFFBLL | v42;
  }
  long long v43 = +[UIDevice currentDevice];
  if ([v43 userInterfaceIdiom] == 2)
  {
    *p_scrollViewFlags &= ~0x1000000uLL;
  }
  else
  {
    long long v44 = +[UIDevice currentDevice];
    unint64_t *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)([v44 userInterfaceIdiom] != 8) << 24);
  }
  if ([v4 containsValueForKey:@"UIShowsHorizontalScrollIndicator"])
  {
    int v45 = [v4 decodeBoolForKey:@"UIShowsHorizontalScrollIndicator"];
    uint64_t v46 = 0x1000000;
    if (!v45) {
      uint64_t v46 = 0;
    }
    unint64_t *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFEFFFFFFLL | v46;
  }
  uint64_t v47 = +[UIDevice currentDevice];
  if ([v47 userInterfaceIdiom] == 2)
  {
    *p_scrollViewFlags &= ~0x2000000uLL;
  }
  else
  {
    uint64_t v48 = +[UIDevice currentDevice];
    unint64_t *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)([v48 userInterfaceIdiom] != 8) << 25);
  }
  if ([v4 containsValueForKey:@"UIShowsVerticalScrollIndicator"])
  {
    int v49 = [v4 decodeBoolForKey:@"UIShowsVerticalScrollIndicator"];
    uint64_t v50 = 0x2000000;
    if (!v49) {
      uint64_t v50 = 0;
    }
    unint64_t v51 = *p_scrollViewFlags & 0xFFFFFFFFFDFFFFFFLL | v50;
  }
  else
  {
    unint64_t v51 = *p_scrollViewFlags;
  }
  unint64_t *p_scrollViewFlags = v51 | 0x40000;
  if ([v4 containsValueForKey:@"UIDelaysContentTouches"])
  {
    int v52 = [v4 decodeBoolForKey:@"UIDelaysContentTouches"];
    uint64_t v53 = 0x40000;
    if (!v52) {
      uint64_t v53 = 0;
    }
    unint64_t v54 = *p_scrollViewFlags & 0xFFFFFFFFFFFBFFFFLL | v53;
  }
  else
  {
    unint64_t v54 = *p_scrollViewFlags;
  }
  unint64_t *p_scrollViewFlags = v54 | 0x20000;
  if ([v4 containsValueForKey:@"UICanCancelContentTouches"])
  {
    int v55 = [v4 decodeBoolForKey:@"UICanCancelContentTouches"];
    uint64_t v56 = 0x20000;
    if (!v55) {
      uint64_t v56 = 0;
    }
    unint64_t *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFFDFFFFLL | v56;
  }
  double v57 = [v4 decodeObjectForKey:@"UIDelegate"];
  objc_storeWeak(&v6->_delegate, v57);

  v6->_minimumZoomScale = 1.0;
  if ([v4 containsValueForKey:@"UIMinimumZoomScale"])
  {
    [v4 decodeFloatForKey:@"UIMinimumZoomScale"];
    v6->_minimumZoomScale = v58;
  }
  v6->_maximumZoomScale = 1.0;
  if ([v4 containsValueForKey:@"UIMaximumZoomScale"])
  {
    [v4 decodeFloatForKey:@"UIMaximumZoomScale"];
    v6->_maximumZoomScale = v59;
  }
  if ([v4 containsValueForKey:@"UIKeyboardDismissMode"]) {
    v6->_keyboardDismissMode = [v4 decodeIntegerForKey:@"UIKeyboardDismissMode"];
  }
  if ([v4 containsValueForKey:@"UIRefreshControl"])
  {
    double v60 = [v4 decodeObjectForKey:@"UIRefreshControl"];
    [(UIScrollView *)v6 _setRefreshControl:v60];
  }
  if ([v4 containsValueForKey:@"UIIndexDisplayMode"]) {
    unint64_t *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFF3FFFFFFLL | (([v4 decodeIntegerForKey:@"UIIndexDisplayMode"] & 3) << 26);
  }
  v6->_contentOffsetAnimationDuration = 0.3;
  v6->_decelerationFactor = (CGSize)vdupq_n_s64(0x3FEFEF9DB22D0E56uLL);
  v6->_double fastScrollMultiplier = 1.0;
  [(UIView *)v6 bounds];
  double v62 = v61 * -0.000000184659091 + 0.000359090909;
  if (v61 > 1024.0) {
    double v62 = 0.00017;
  }
  v6->_pagingSpringPull = v62;
  [(UIView *)v6 bounds];
  double v64 = v63 * 0.00000994318182 + 0.966818182;
  if (v63 > 1024.0) {
    double v64 = 0.977;
  }
  v6->_pagingFriction = v64;
  [(UIView *)v6 _currentScreenScale];
  v6->_accuracCGFloat y = v65;
  v6->_savedKeyboardAdjustmentDelta = 0.0;
  if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)v6)
    || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)v6))
  {
    [(UIScrollView *)v6 _adjustScrollerIndicators:1 alwaysShowingThem:0];
  }
  [(UIScrollView *)v6 _createGestureRecognizersForCurrentTouchLevel];
  -[UIScrollViewPanGestureRecognizer setDirectionalLockEnabled:](v6->_pan, "setDirectionalLockEnabled:", [v4 decodeBoolForKey:@"UIDirectionalLockEnabled"]);
  uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIScrollViewInteractionActivityTrackingBaseName"];
  interactionActivityTrackingBaseName = v6->_interactionActivityTrackingBaseName;
  v6->_interactionActivityTrackingBaseName = (NSString *)v66;

  [(UIScrollView *)v6 _updateContentFitDisableScrolling];
LABEL_77:

  return v6;
}

- (id)_layoutObserver
{
  return self->_layoutObserver;
}

- (void)_populateArchivedSubviews:(id)a3
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIScrollView;
  [(UIView *)&v15 _populateArchivedSubviews:v4];
  v16[0] = self->_zoomView;
  v16[1] = self->_horizontalScrollIndicator;
  v16[2] = self->_verticalScrollIndicator;
  uint64_t v5 = 0;
  v16[3] = self->_refreshControl;
  do
  {
    if (v16[v5]) {
      objc_msgSend(v4, "removeObject:");
    }
    ++v5;
  }
  while (v5 != 4);
  accessoryViews = self->_accessoryViews;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  CGFloat v12 = __42__UIScrollView__populateArchivedSubviews___block_invoke;
  CGFloat v13 = &unk_1E530F3E0;
  id v7 = v4;
  id v14 = v7;
  [(NSMutableDictionary *)accessoryViews enumerateKeysAndObjectsUsingBlock:&v10];
  if (self->_shadows)
  {
    for (uint64_t i = 0; i != 10; ++i)
    {
      if (self->_shadows[i]) {
        objc_msgSend(v7, "removeObject:", v10, v11, v12, v13);
      }
    }
  }

  for (uint64_t j = 3; j != -1; --j)
}

uint64_t __42__UIScrollView__populateArchivedSubviews___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UIScrollView;
  [(UIView *)&v24 encodeWithCoder:v4];
  if (self->_contentInset.top != 0.0
    || self->_contentInset.bottom != 0.0
    || self->_contentInset.left != 0.0
    || self->_contentInset.right != 0.0)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"UIContentInset");
  }
  if (self->_scrollIndicatorInset.top != 0.0
    || self->_scrollIndicatorInset.bottom != 0.0
    || self->_scrollIndicatorInset.left != 0.0
    || self->_scrollIndicatorInset.right != 0.0)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"UIScrollIndicatorInsets");
  }
  double top = self->_verticalScrollIndicatorInsets.top;
  if (self->_verticalScrollIndicatorInsets.left != 1.79769313e308
    || top != 1.79769313e308
    || self->_verticalScrollIndicatorInsets.right != 1.79769313e308
    || self->_verticalScrollIndicatorInsets.bottom != 1.79769313e308)
  {
    [v4 encodeUIEdgeInsets:@"UIVerticalScrollIndicatorInsets" forKey:top];
  }
  double v9 = self->_horizontalScrollIndicatorInsets.top;
  if (self->_horizontalScrollIndicatorInsets.left != 1.79769313e308
    || v9 != 1.79769313e308
    || self->_horizontalScrollIndicatorInsets.right != 1.79769313e308
    || self->_horizontalScrollIndicatorInsets.bottom != 1.79769313e308)
  {
    [v4 encodeUIEdgeInsets:@"UIHorizontalScrollIndicatorInsets" forKey:v9];
  }
  p_unint64_t scrollViewFlags = &self->_scrollViewFlags;
  [v4 encodeInteger:((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 7) & 3 forKey:@"UIScrollViewIndicatorInsetAdjustmentBehavior"];
  unint64_t scrollViewFlags = (unint64_t)self->_scrollViewFlags;
  uint64_t v15 = (scrollViewFlags >> 28) & 3;
  if (v15)
  {
    [v4 encodeInteger:v15 forKey:@"UIIndicatorStyle"];
    unint64_t scrollViewFlags = *(void *)p_scrollViewFlags;
  }
  if ((scrollViewFlags & 0xC) != 0)
  {
    if ((scrollViewFlags & 0x1000000) != 0) {
      goto LABEL_37;
    }
  }
  else
  {
    [v4 encodeBool:0 forKey:@"UIBounceEnabled"];
    unint64_t scrollViewFlags = *(void *)p_scrollViewFlags;
    if ((*(void *)p_scrollViewFlags & 0x1000000) != 0)
    {
LABEL_37:
      if ((scrollViewFlags & 0x2000000) != 0) {
        goto LABEL_38;
      }
      goto LABEL_73;
    }
  }
  [v4 encodeBool:0 forKey:@"UIShowsHorizontalScrollIndicator"];
  unint64_t scrollViewFlags = *(void *)p_scrollViewFlags;
  if ((*(void *)p_scrollViewFlags & 0x2000000) != 0)
  {
LABEL_38:
    if ((scrollViewFlags & 0x100000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v4 encodeBool:0 forKey:@"UIShowsVerticalScrollIndicator"];
  unint64_t scrollViewFlags = *(void *)p_scrollViewFlags;
  if ((*(void *)p_scrollViewFlags & 0x100000) == 0)
  {
LABEL_39:
    if ((scrollViewFlags & 0x40000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v4 encodeBool:1 forKey:@"UIScrollDisabled"];
  unint64_t scrollViewFlags = *(void *)p_scrollViewFlags;
  if ((*(void *)p_scrollViewFlags & 0x40000) != 0)
  {
LABEL_40:
    if ((scrollViewFlags & 0x20000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_75:
  [v4 encodeBool:0 forKey:@"UIDelaysContentTouches"];
  if ((*(void *)p_scrollViewFlags & 0x20000) == 0) {
LABEL_41:
  }
    [v4 encodeBool:0 forKey:@"UICanCancelContentTouches"];
LABEL_42:
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0) {
    [v4 encodeBool:1 forKey:@"UIPagingEnabled"];
  }
  unint64_t v16 = *(void *)p_scrollViewFlags;
  if ((*(void *)p_scrollViewFlags & 0x40) != 0)
  {
    [v4 encodeBool:1 forKey:@"UIBouncesZoom"];
    unint64_t v16 = *(void *)p_scrollViewFlags;
    if ((*(void *)p_scrollViewFlags & 0x200) == 0)
    {
LABEL_46:
      if ((v16 & 0x100) == 0) {
        goto LABEL_48;
      }
      goto LABEL_47;
    }
  }
  else if ((v16 & 0x200) == 0)
  {
    goto LABEL_46;
  }
  [v4 encodeBool:1 forKey:@"UIAlwaysBounceVertical"];
  if ((*(void *)p_scrollViewFlags & 0x100) != 0) {
LABEL_47:
  }
    [v4 encodeBool:1 forKey:@"UIAlwaysBounceHorizontal"];
LABEL_48:
  if ([(UIScrollViewPanGestureRecognizer *)self->_pan isDirectionalLockEnabled]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[UIScrollViewPanGestureRecognizer isDirectionalLockEnabled](self->_pan, "isDirectionalLockEnabled"), @"UIDirectionalLockEnabled");
  }
  double minimumZoomScale = self->_minimumZoomScale;
  if (minimumZoomScale != 1.0)
  {
    *(float *)&double minimumZoomScale = minimumZoomScale;
    [v4 encodeFloat:@"UIMinimumZoomScale" forKey:minimumZoomScale];
  }
  double maximumZoomScale = self->_maximumZoomScale;
  if (maximumZoomScale != 1.0)
  {
    *(float *)&double maximumZoomScale = maximumZoomScale;
    [v4 encodeFloat:@"UIMaximumZoomScale" forKey:maximumZoomScale];
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained) {
    [v4 encodeConditionalObject:WeakRetained forKey:@"UIDelegate"];
  }
  if (self->_contentSize.width != *MEMORY[0x1E4F1DB30]
    || self->_contentSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    objc_msgSend(v4, "encodeCGSize:forKey:", @"UIContentSize");
  }
  int64_t keyboardDismissMode = self->_keyboardDismissMode;
  if (keyboardDismissMode) {
    [v4 encodeInteger:keyboardDismissMode forKey:@"UIKeyboardDismissMode"];
  }
  refreshControl = self->_refreshControl;
  if (refreshControl) {
    [v4 encodeObject:refreshControl forKey:@"UIRefreshControl"];
  }
  uint64_t v22 = (*(void *)p_scrollViewFlags >> 26) & 3;
  if (v22) {
    [v4 encodeInteger:v22 forKey:@"UIIndexDisplayMode"];
  }
  [v4 encodeInteger:self->_contentInsetAdjustmentBehavior forKey:@"UIScrollViewContentInsetAdjustmentBehavior"];
  interactionActivityTrackingBaseName = self->_interactionActivityTrackingBaseName;
  if (interactionActivityTrackingBaseName) {
    [v4 encodeObject:interactionActivityTrackingBaseName forKey:@"UIScrollViewInteractionActivityTrackingBaseName"];
  }
}

void __28__UIScrollView_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_ScrollViewOffsetChangeLogging_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a delegate. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)_createStaticScrollBar
{
  double v2 = [_UIStaticScrollBar alloc];
  uint64_t v3 = -[_UIStaticScrollBar initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v3;
}

- (CGPoint)_maximumContentOffset
{
  -[UIScrollView _maximumContentOffsetForContentSize:](self, "_maximumContentOffsetForContentSize:", self->_contentSize.width, self->_contentSize.height);
  result.CGFloat y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)_maximumContentPoint
{
  [(UIScrollView *)self _effectiveContentInset];
  accuracCGFloat y = self->_accuracy;
  double v6 = v5 + self->_contentSize.width;
  if (accuracy == 1.0)
  {
    double v8 = round(v6);
    double v11 = round(v3 + self->_contentSize.height);
  }
  else
  {
    double v7 = floor(v6);
    double v8 = v7 + round(accuracy * (v6 - v7)) / accuracy;
    double v9 = v3 + self->_contentSize.height;
    double v10 = floor(v9);
    double v11 = v10 + round(accuracy * (v9 - v10)) / accuracy;
  }
  result.CGFloat y = v11;
  result.double x = v8;
  return result;
}

- (void)_setVelocityScaleFactor:(double)a3
{
  self->_velocityScaleFactor = a3;
}

- (double)_velocityScaleFactor
{
  return self->_velocityScaleFactor;
}

- (BOOL)_topScrollIndicatorFollowsContentOffset
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 61) & 1;
}

- (BOOL)_verticalScrollIndicatorUsesAlternativeTopSafeAreaInset
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 62) & 1;
}

- (void)_setUpdateRequestRecord:(const _UIUpdateRequestRecord *)a3
{
}

- (id)_panGestureRecognizer
{
  return self->_pan;
}

- (id)_swipeGestureRecognizer
{
  return self->_swipe;
}

- (id)_touchesDelayedGestureRecognizer
{
  return self->_touchDelayGestureRecognizer;
}

- (void)_setPanGestureRecognizer:(id)a3
{
}

- (void)_setPinchGestureRecognizer:(id)a3
{
}

- (BOOL)_startBeingDraggedByChild:(id)a3
{
  uint64_t v3 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if ((v3 & 0x100000000000) == 0)
  {
    int v4 = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(void *)((char *)&self->_scrollViewFlags + 12) = v3 | 0x100000000000;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v4;
    objc_storeWeak((id *)&self->_draggingChildScrollView, a3);
  }
  return (v3 & 0x100000000000) == 0;
}

- (BOOL)_stopBeingDraggedByChild:(id)a3
{
  id v4 = a3;
  p_unint64_t scrollViewFlags = &self->_scrollViewFlags;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x100000000000) != 0
    && (p_draggingChildScrollView = &self->_draggingChildScrollView,
        id WeakRetained = objc_loadWeakRetained((id *)p_draggingChildScrollView),
        WeakRetained,
        WeakRetained == v4))
  {
    *(void *)((char *)p_scrollViewFlags + 12) &= ~0x100000000000uLL;
    objc_storeWeak((id *)p_draggingChildScrollView, 0);
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_startDraggingParent:(id)a3
{
  id v4 = (id *)a3;
  if (([v4 _startBeingDraggedByChild:self] & 1) == 0) {
}
  }

- (void)_stopDraggingParent:(id)a3
{
  [a3 _stopBeingDraggedByChild:self];
  id v4 = [(UIView *)self layer];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v9[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v9[5] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v9[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v9[7] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v9[0] = *MEMORY[0x1E4F39B10];
  v9[1] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v9[3] = v8;
  [v4 setSublayerTransform:v9];

  self->_parentAdjustment.double x = 0.0;
  self->_parentAdjustment.CGFloat y = 0.0;
}

BOOL __34__UIScrollView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _isTapToClick]
    && ([v3 timestamp], v4 >= *(double *)(*(void *)(a1 + 32) + 1656)))
  {
    [v3 timestamp];
    double v7 = v6;
    double v8 = *(double *)(*(void *)(a1 + 32) + 1656);
    int v9 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_ScrollInterruptToAllowTapToClickDuration, @"ScrollInterruptToAllowTapToClickDuration", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v10 = *(double *)&qword_1E8FD5590;
    if (v9) {
      double v10 = 0.25;
    }
    BOOL v5 = v7 < v8 + v10;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (double)_adjustedHorizontalOffsetPinnedToScrollableBounds:(double)a3
{
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  [(UIScrollView *)self _effectiveContentInset];
  double v10 = v6 + a3;
  accuracCGFloat y = self->_accuracy;
  double v13 = self->_firstPageOffset.horizontal - v12;
  if (accuracy == 1.0)
  {
    double v22 = round(v13);
    double v23 = v6 + v22 - v6;
    if (v10 < v22)
    {
      double result = v22 - v6;
    }
    else
    {
      double v23 = v6 + a3;
      double result = a3;
    }
    double v21 = round(v9 + self->_contentSize.width) - v8;
    if (v23 > v21) {
      return v21 - v6;
    }
  }
  else
  {
    double v14 = floor(v13);
    double v15 = v14 + round(accuracy * (v13 - v14)) / accuracy;
    double v16 = v6 + v15 - v6;
    BOOL v17 = v10 < v15;
    if (v10 >= v15) {
      double result = a3;
    }
    else {
      double result = v15 - v6;
    }
    if (v17) {
      double v10 = v16;
    }
    double v19 = v9 + self->_contentSize.width;
    double v20 = floor(v19);
    double v21 = v20 + round(accuracy * (v19 - v20)) / accuracy - v8;
    if (v10 > v21) {
      return v21 - v6;
    }
  }
  return result;
}

- (double)_adjustedVerticalOffsetPinnedToScrollableBounds:(double)a3
{
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  [(UIScrollView *)self _effectiveContentInset];
  double v10 = v6 + a3;
  accuracCGFloat y = self->_accuracy;
  double v13 = self->_firstPageOffset.vertical - v12;
  if (accuracy == 1.0)
  {
    double v22 = round(v13);
    if (v10 >= v22)
    {
      double result = a3;
    }
    else
    {
      double v10 = v6 + v22 - v6;
      double result = v22 - v6;
    }
    double v21 = round(v9 + self->_contentSize.height);
  }
  else
  {
    double v14 = floor(v13);
    double v15 = v14 + round(accuracy * (v13 - v14)) / accuracy;
    double v16 = v6 + v15 - v6;
    BOOL v17 = v10 < v15;
    if (v10 >= v15) {
      double result = a3;
    }
    else {
      double result = v15 - v6;
    }
    if (v17) {
      double v10 = v16;
    }
    double v19 = v9 + self->_contentSize.height;
    double v20 = floor(v19);
    double v21 = v20 + round(accuracy * (v19 - v20)) / accuracy;
  }
  double v23 = v21 - v8;
  if (v10 > v23) {
    return v23 - v6;
  }
  return result;
}

- (void)_setEdgesScrollingContentIntoSafeArea:(unint64_t)a3
{
  if ((a3 & 0xF) != 0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 101;
  }
  [(UIScrollView *)self setContentInsetAdjustmentBehavior:v3];
}

- (unint64_t)_edgesScrollingContentIntoSafeArea
{
  int64_t contentInsetAdjustmentBehavior = self->_contentInsetAdjustmentBehavior;
  if (contentInsetAdjustmentBehavior == 101 || contentInsetAdjustmentBehavior == 2) {
    return 0;
  }
  else {
    return 15;
  }
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return 0;
}

- (void)_setAllowedNavigationOverlapAmount:(double)a3
{
  self->_allowedNavigationOverlapAmount = ceil(a3);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__UIScrollView__setAllowedNavigationOverlapAmount___block_invoke;
  v3[3] = &unk_1E530F458;
  v3[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v3);
}

uint64_t __51__UIScrollView__setAllowedNavigationOverlapAmount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 _observeScrollViewDidScroll:v5];
  }
  return result;
}

- (id)interactionActivityTrackingBaseName
{
  return self->_interactionActivityTrackingBaseName;
}

- (id)_effectiveInteractionActivityTrackingBaseName
{
  uint64_t v3 = [(UIScrollView *)self interactionActivityTrackingBaseName];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(UIScrollView *)self _enclosingViewController];
    id v5 = [v6 _effectiveInteractionActivityTrackingBaseName];
  }
  return v5;
}

- (BOOL)_isInSetContentOffset
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 54) & 1;
}

- (void)setContentAlignmentPoint:(CGPoint)a3
{
  if (self->_contentAlignmentPoint.x != a3.x || self->_contentAlignmentPoint.y != a3.y)
  {
    self->_contentAlignmentPoint = a3;
    [(UIScrollView *)self _updateForChangedScrollRelatedInsets];
  }
}

- (BOOL)_isRectFullyVisible:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(UIScrollView *)self _effectiveContentInset];
  double v17 = v11 + v16;
  double v20 = v13 - (v18 + v19);
  double v22 = v15 - (v16 + v21);
  double v23 = v9 + v18;
  double v24 = v17;
  double v25 = v20;
  CGFloat v26 = x;
  CGFloat v27 = y;
  CGFloat v28 = width;
  CGFloat v29 = height;
  return CGRectContainsRect(*(CGRect *)&v23, *(CGRect *)&v26);
}

- (CGPoint)indexBarAccessoryView:(id)a3 contentOffsetForEntry:(id)a4 atIndex:(int64_t)a5
{
  double v7 = [a3 displayEntries];
  int v8 = [v7 count];

  [(UIScrollView *)self _minimumContentOffset];
  double v10 = v9;
  double v12 = v11;
  [(UIScrollView *)self _maximumContentOffset];
  double v14 = v12 + (double)a5 / (double)(v8 - 1) * (v13 - v12);
  double v15 = v10;
  result.CGFloat y = v14;
  result.CGFloat x = v15;
  return result;
}

- (void)_setFlipsHorizontalAxis:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIView *)self _flipsHorizontalAxis];
  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  [(UIView *)&v6 _setFlipsHorizontalAxis:v3];
  if (v5 != v3) {
    [(UIScrollView *)self _updateAccessories];
  }
}

- (void)_webCustomViewWillBeRemovedFromSuperview
{
  [(UIScrollView *)self _stopScrollingNotify:0 pin:1];
  v3.receiver = self;
  v3.super_class = (Class)UIScrollView;
  [(UIView *)&v3 _webCustomViewWillBeRemovedFromSuperview];
}

- (void)_setResetsBoundingPathForSubtree:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFFFBFF | v3;
}

- (BOOL)_needsLayoutOnVisibleBoundsChange
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 24) & 1;
}

- (void)_setNeedsLayoutOnVisibleBoundsChange:(BOOL)a3
{
  int v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
  if (((((v3 & 0x1000000) == 0) ^ a3) & 1) == 0)
  {
    unsigned int v4 = v3 & 0xFEFFFFFF;
    if (a3) {
      int v5 = 0x1000000;
    }
    else {
      int v5 = 0;
    }
    *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12);
    *((_DWORD *)&self->_scrollViewFlags + 5) = v4 | v5;
    if (a3) {
      [(UIView *)self _registerForGeometryChanges];
    }
    else {
      [(UIView *)self _unregisterForGeometryChanges];
    }
  }
}

- (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated
{
  BOOL v4 = animated;
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  [(UIScrollView *)self _effectiveContentInset];
  double v13 = v12;
  double v15 = v14;
  double v16 = v10;
  double v17 = v11;
  accuracCGFloat y = self->_accuracy;
  double v19 = self->_firstPageOffset.horizontal - v14;
  if (accuracy == 1.0)
  {
    double v21 = round(v19);
    double v24 = round(self->_firstPageOffset.vertical - v13);
    double v27 = round(v11 + v15 + self->_contentSize.width);
    double v30 = round(v10 + v13 + self->_contentSize.height);
  }
  else
  {
    double v20 = floor(v19);
    double v21 = v20 + round(accuracy * (v19 - v20)) / accuracy;
    double v22 = self->_firstPageOffset.vertical - v13;
    double v23 = floor(v22);
    double v24 = v23 + round(accuracy * (v22 - v23)) / accuracy;
    double v25 = v11 + v15 + self->_contentSize.width;
    double v26 = floor(v25);
    double v27 = v26 + round(accuracy * (v25 - v26)) / accuracy;
    double v28 = v16 + v13 + self->_contentSize.height;
    double v29 = floor(v28);
    double v30 = v29 + round(accuracy * (v28 - v29)) / accuracy;
  }
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  CGRect v50 = CGRectIntersection(v49, *(CGRect *)&v21);
  double v31 = v50.origin.x;
  double v32 = v50.origin.y;
  double v33 = v50.size.width;
  double v34 = v50.size.height;
  if (!CGRectIsEmpty(v50))
  {
    double v35 = fmin(-v13, 0.0);
    double v36 = fmin(-v15, 0.0);
    double v37 = fmin(-v16, 0.0);
    double v38 = fmin(-v17, 0.0);
    double v39 = v36 + v31;
    double v40 = v35 + v32;
    double v41 = v33 - (v36 + v38);
    double v42 = v34 - (v35 + v37);
    id WeakRetained = (double *)objc_loadWeakRetained((id *)&self->_animation);
    if (WeakRetained && dyld_program_sdk_at_least())
    {
      CGFloat v43 = WeakRetained[13];
      CGFloat v44 = WeakRetained[14];
      [(UIView *)self bounds];
      v51.origin.CGFloat x = v43;
      v51.origin.CGFloat y = v44;
      v53.origin.CGFloat x = v39;
      v53.origin.CGFloat y = v40;
      v53.size.CGFloat width = v41;
      v53.size.CGFloat height = v42;
      if (!CGRectContainsRect(v51, v53))
      {
        -[UIScrollView _contentOffsetForScrollingToRect:](self, "_contentOffsetForScrollingToRect:", v39, v40, v41, v42);
        *((void *)WeakRetained + 13) = v45;
        *((void *)WeakRetained + 14) = v46;
      }
    }
    else
    {
      [(UIView *)self bounds];
      v54.origin.CGFloat x = v39;
      v54.origin.CGFloat y = v40;
      v54.size.CGFloat width = v41;
      v54.size.CGFloat height = v42;
      if (!CGRectContainsRect(v52, v54))
      {
        -[UIScrollView _contentOffsetForScrollingToRect:](self, "_contentOffsetForScrollingToRect:", v39, v40, v41, v42);
        -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", v4);
      }
    }
  }
}

- (CGPoint)_contentOffsetForScrollingToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(UIScrollView *)self contentOffset];
  double v18 = x + width;
  if (x < v9) {
    double v16 = x;
  }
  if (v18 >= v9 + v13) {
    double v16 = v18 - v13;
  }
  double v19 = y + height;
  if (y < v11) {
    double v17 = y;
  }
  if (v19 >= v11 + v15) {
    double v17 = v19 - v15;
  }
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (BOOL)isDirectionalLockEnabled
{
  return [(UIScrollViewPanGestureRecognizer *)self->_pan isDirectionalLockEnabled];
}

- (void)_setFirstResponderKeyboardAvoidanceEnabled:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)isProgrammaticScrollEnabled
{
  return (*((unsigned char *)&self->_scrollViewFlags + 2) & 8) == 0;
}

- (unint64_t)_abuttedPagingEdges
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) == 0) {
    return 0;
  }
  if ([(UIScrollView *)self isDecelerating])
  {
    double x = self->_pageDecelerationTarget.x;
    double y = self->_pageDecelerationTarget.y;
    return -[UIScrollView _abuttedEdgesForContentOffset:](self, "_abuttedEdgesForContentOffset:", x, y);
  }
  else
  {
    return [(UIScrollView *)self _currentlyAbuttedContentEdges];
  }
}

- (BOOL)bounces
{
  return (~*(_DWORD *)&self->_scrollViewFlags & 0xCLL) == 0;
}

- (BOOL)bouncesHorizontally
{
  return (*(unsigned char *)&self->_scrollViewFlags >> 3) & 1;
}

- (BOOL)bouncesVertically
{
  return (*(unsigned char *)&self->_scrollViewFlags >> 2) & 1;
}

- (BOOL)_applicationHasExplicitlySetBounces
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 59) & 1;
}

- (void)setUpdateInsetBottomDuringKeyboardDismiss:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)updateInsetBottomDuringKeyboardDismiss
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 43) & 1;
}

- (double)keyboardBottomInsetAdjustmentDelta
{
  return self->_savedKeyboardAdjustmentDelta;
}

- (BOOL)_alwaysAppliesKeyboardBottomInsetAdjustment
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 15) & 1;
}

- (BOOL)transfersHorizontalScrollingToParent
{
  return (*((unsigned char *)&self->_scrollViewFlags + 1) & 4) == 0;
}

- (void)setTransfersHorizontalScrollingToParent:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)transfersVerticalScrollingToParent
{
  return (*((unsigned char *)&self->_scrollViewFlags + 1) & 8) == 0;
}

- (void)setTransfersVerticalScrollingToParent:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (void)_setTransfersScrollToContainer:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)_isHorizontalBouncing
{
  return (*(unsigned char *)&self->_scrollViewFlags >> 5) & 1;
}

- (void)_setDefaultShowsHorizontalScrollIndicator:(BOOL)a3
{
  if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x40000000) == 0) {
    -[UIScrollView _setShowsHorizontalScrollIndicator:](self, a3);
  }
}

- (UIScrollViewIndexDisplayMode)indexDisplayMode
{
  return (*(void *)&self->_scrollViewFlags >> 26) & 3;
}

- (void)setIndexDisplayMode:(UIScrollViewIndexDisplayMode)indexDisplayMode
{
  unint64_t scrollViewFlags = (unint64_t)self->_scrollViewFlags;
  if (((scrollViewFlags >> 26) & 3) != indexDisplayMode) {
    *(void *)&self->_unint64_t scrollViewFlags = scrollViewFlags & 0xFFFFFFFFF3FFFFFFLL | ((unint64_t)(indexDisplayMode & 3) << 26);
  }
}

- (UIScrollViewDecelerationRate)decelerationRate
{
  return self->_decelerationFactor.width;
}

- (UIScrollViewIndicatorStyle)indicatorStyle
{
  return (*(void *)&self->_scrollViewFlags >> 28) & 3;
}

- (void)setHorizontalScrollDecelerationFactor:(double)a3
{
  self->_decelerationFactor.double width = a3;
}

- (double)verticalScrollDecelerationFactor
{
  return self->_decelerationFactor.height;
}

- (void)setVerticalScrollDecelerationFactor:(double)a3
{
  self->_decelerationFactor.double height = a3;
}

- (void)setAllowsMultipleFingers:(BOOL)a3
{
  uint64_t v4 = 0x8000;
  if (a3) {
    uint64_t v4 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFF7FFFLL | v4;
  [(UIPanGestureRecognizer *)self->_pan setFailsPastMaxTouches:!a3];
  [(UIScrollView *)self _updatePanGestureConfiguration];
}

- (BOOL)allowsMultipleFingers
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x8000) == 0;
}

- (BOOL)tracksImmediatelyWhileDecelerating
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x8000000) == 0;
}

- (BOOL)_avoidsJumpOnInterruptedBounce
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 28) & 1;
}

- (BOOL)_contentOffsetRoundingEnabled
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x2000000000) == 0;
}

- (void)_setContentOffsetRoundingEnabled:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFDFFFFFFFFFLL | v3;
  if (a3)
  {
    [(UIScrollView *)self contentOffset];
    -[UIScrollView setContentOffset:](self, "setContentOffset:");
  }
}

- (unint64_t)_allowedFocusBounceEdges
{
  return 0;
}

- (void)_setAllowedFocusBounceEdges:(unint64_t)a3
{
  uint64_t v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &_setAllowedFocusBounceEdges____s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "UIScrollView _allowedFocusBounceEdges is deprecated: please remove any references to this property.", v4, 2u);
  }
}

- (double)_scrollHysteresis
{
  [(UIScrollViewPanGestureRecognizer *)self->_pan _hysteresis];
  return result;
}

void __61__UIScrollView__createGestureRecognizersForCurrentTouchLevel__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [[UISwipeGestureRecognizer alloc] initWithTarget:*(void *)(a1 + 32) action:sel__handleLowFidelitySwipe_];
  [(UISwipeGestureRecognizer *)v4 setDirection:a2];
  [(UIGestureRecognizer *)v4 setDelegate:*(void *)(a1 + 32)];
  [(UIGestureRecognizer *)v4 setAllowedTouchTypes:*(void *)(*(void *)(a1 + 32) + 1928)];
  [*(id *)(a1 + 32) addGestureRecognizer:v4];
  uint64_t v5 = *(void *)(a1 + 32) + 1024;
  signed int v6 = __clz(__rbit32(a2));
  if (!a2) {
    signed int v6 = -1;
  }
  double v7 = *(void **)(v5 + 8 * v6);
  *(void *)(v5 + 8 * v6) = v4;
}

- (void)willRotateToInterfaceOrientation:(id)a3
{
  [(UIScrollView *)self contentOffset];
  double v5 = v4;
  double v7 = v6;
  [(UIView *)self bounds];
  self->_rotationCenterPoint.double x = v5 + v8 * 0.5;
  [(UIView *)self bounds];
  self->_rotationCenterPoint.double y = v7 + v9 * 0.5;
  *(void *)((char *)&self->_scrollViewFlags + 12) = ((unint64_t)(v5 == 0.0) << 30) | ((unint64_t)(v7 == 0.0) << 31) | *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFF3FFFFFFFLL;
  accuracdouble y = self->_accuracy;
  [(UIScrollView *)self contentSize];
  double v12 = v11;
  [(UIView *)self bounds];
  double v14 = v12 - v13;
  if (accuracy == 1.0)
  {
    double v19 = round(v14);
  }
  else
  {
    double v15 = floor(v14);
    [(UIScrollView *)self contentSize];
    double v17 = v16;
    [(UIView *)self bounds];
    double v19 = v15 + round(self->_accuracy * (v17 - v18 - v15)) / self->_accuracy;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFEFFFFFFFFLL | ((unint64_t)(v5 == v19) << 32);
  double v20 = self->_accuracy;
  [(UIScrollView *)self contentSize];
  double v22 = v21;
  [(UIView *)self bounds];
  double v24 = v22 - v23;
  if (v20 == 1.0)
  {
    double v29 = round(v24);
  }
  else
  {
    double v25 = floor(v24);
    [(UIScrollView *)self contentSize];
    double v27 = v26;
    [(UIView *)self bounds];
    double v29 = v25 + round(self->_accuracy * (v27 - v28 - v25)) / self->_accuracy;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFDFFFFFFFFLL | ((unint64_t)(v7 == v29) << 33);
  [(UIScrollView *)self zoomScale];
  double v31 = v30;
  [(UIScrollView *)self minimumZoomScale];
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)(vabdd_f64(v31, v32) < 0.00000011920929) << 29);
}

- (void)willAnimateRotationToInterfaceOrientation:(id)a3
{
  id v36 = a3;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20000000) != 0)
  {
    [(UIScrollView *)self contentOffset];
    double v9 = v13;
    double v11 = v14;
  }
  else
  {
    [(UIScrollView *)self zoomScale];
    double v5 = v4;
    [(UIScrollView *)self minimumZoomScale];
    double v7 = v6;
    [(UIScrollView *)self contentOffset];
    double v9 = v8;
    double v11 = v10;
    if (v5 >= v7)
    {
      char v12 = 1;
      goto LABEL_7;
    }
  }
  if (![(UIScrollView *)self _canScrollX])
  {
    double v18 = v9;
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_7:
  int v15 = *((_DWORD *)&self->_scrollViewFlags + 4) & 1;
  if (((*((_DWORD *)&self->_scrollViewFlags + 3) >> 30) & 1) == v15)
  {
    double x = self->_rotationCenterPoint.x;
    [(UIView *)self bounds];
    double v18 = x + v17 * -0.5;
    if (v12) {
      goto LABEL_16;
    }
LABEL_15:
    BOOL v22 = [(UIScrollView *)self _canScrollY];
    double v23 = v11;
    if (!v22) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  if (v15)
  {
    [(UIScrollView *)self contentSize];
    double v20 = v19;
    [(UIView *)self bounds];
    double v18 = v20 - v21;
    if (v12) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  double v18 = v9;
  if ((v12 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_16:
  unint64_t v24 = *(void *)((char *)&self->_scrollViewFlags + 12);
  uint64_t v25 = (v24 >> 33) & 1;
  if (v25 == v24 >> 31)
  {
    double y = self->_rotationCenterPoint.y;
    [(UIView *)self bounds];
    double v23 = y + v27 * -0.5;
  }
  else if (v25)
  {
    [(UIScrollView *)self contentSize];
    double v29 = v28;
    [(UIView *)self bounds];
    double v23 = v29 - v30;
  }
  else
  {
    double v23 = v11;
  }
LABEL_21:
  if (v9 != v18 || v11 != v23)
  {
    accuracdouble y = self->_accuracy;
    if (accuracy == 1.0)
    {
      double v33 = round(v18);
      double v35 = round(v23);
    }
    else
    {
      double v32 = floor(v18);
      double v33 = v32 + round((v18 - v32) * accuracy) / accuracy;
      double v34 = floor(v23);
      double v35 = v34 + round((v23 - v34) * accuracy) / accuracy;
    }
    -[UIScrollView setContentOffset:](self, "setContentOffset:", v33, v35);
    [(UIScrollView *)self _adjustContentOffsetIfNecessary];
  }
}

- (void)_registerForRotation:(BOOL)a3 ofWindow:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v9 = v6;
    double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v8 = v7;
    if (v4)
    {
      [v7 addObserver:self selector:sel_willRotateToInterfaceOrientation_ name:@"UIWindowWillRotateNotification" object:v9];
      [v8 addObserver:self selector:sel_willAnimateRotationToInterfaceOrientation_ name:@"UIWindowWillAnimateRotationNotification" object:v9];
    }
    else
    {
      [v7 removeObserver:self name:@"UIWindowWillRotateNotification" object:v9];
      [v8 removeObserver:self name:@"UIWindowWillAnimateRotationNotification" object:v9];
    }

    id v6 = v9;
  }
}

- (BOOL)preservesCenterDuringRotation
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 26) & 1;
}

- (void)setPreservesCenterDuringRotation:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if (((((v3 & 0x4000000) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    uint64_t v6 = 0x4000000;
    if (!a3) {
      uint64_t v6 = 0;
    }
    *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(void *)((char *)&self->_scrollViewFlags + 12) = v3 & 0xFFFFFFFFFBFFFFFFLL | v6;
    id v7 = [(UIView *)self window];
    [(UIScrollView *)self _registerForRotation:v4 ofWindow:v7];
  }
}

- (void)_flashScrollIndicatorsPersistingPreviousFlashes
{
}

- (void)withScrollIndicatorsShownForContentOffsetChanges:(id)a3
{
  p_unint64_t scrollViewFlags = &self->_scrollViewFlags;
  BOOL v4 = self->_scrollViewFlags.shouldRevealScrollIndicators != 0;
  self->_scrollViewFlags.shouldRevealScrollIndicators = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  p_scrollViewFlags->shouldRevealScrollIndicators = v4;
}

- (void)_setShowsBackgroundShadow:(BOOL)a3
{
  if ((((self->_shadows == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      self->_shadows = (id *)malloc_type_calloc(8uLL, 0xAuLL, 0x8E2609FBuLL);
      BOOL v4 = +[UIDevice currentDevice];
      uint64_t v5 = [v4 userInterfaceIdiom];

      unint64_t v6 = 0;
      if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        id v7 = @"UIScrollerShadowEdgeFill.png";
      }
      else {
        id v7 = @"UIScrollerShadowFill.png";
      }
      double v8 = @"UIScrollerContentShadowFill.png";
      if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
        double v8 = @"UIScrollerShadowFill.png";
      }
      double v19 = v8;
      if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        id v9 = @"UIScrollerContentShadowCorner.png";
      }
      else {
        id v9 = @"UIScrollerShadowCorner.png";
      }
      do
      {
        double v10 = v7;
        if (v6 >= 2)
        {
          double v11 = v19;
          if (v6 >= 6) {
            double v11 = v9;
          }
          double v10 = v11;
        }
        char v12 = [UIImageView alloc];
        double v13 = _UIImageWithName(v10);
        uint64_t v14 = [(UIImageView *)v12 initWithImage:v13];
        shadows = self->_shadows;
        id v16 = shadows[v6];
        shadows[v6] = (id)v14;

        id v17 = self->_shadows[v6];
        CGAffineTransformMakeRotation(&v20, __shadowRotations[v6]);
        [v17 setTransform:&v20];
        [(UIView *)self insertSubview:self->_shadows[v6] atIndex:0];

        ++v6;
      }
      while (v6 != 10);
      [(UIScrollView *)self _adjustBackgroundShadowsForContentSizeForcedVisible:0];
    }
    else
    {
      for (uint64_t i = 0; i != 10; ++i)
        [self->_shadows[i] removeFromSuperview];
      free(self->_shadows);
      self->_shadows = 0;
    }
  }
}

- (CGPoint)_clampScrollOffsetToBounds:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  [(UIScrollView *)self _effectiveContentInset];
  accuracdouble y = self->_accuracy;
  double v15 = self->_firstPageOffset.horizontal - v14;
  if (accuracy == 1.0)
  {
    double v19 = round(v15);
    double v25 = round(round(v12 + self->_contentSize.width) - v7);
    double v30 = round(self->_firstPageOffset.vertical - v10);
    double v34 = round(round(v11 + self->_contentSize.height) - v9);
  }
  else
  {
    double v16 = floor(v15);
    double v17 = v16 + round(accuracy * (v15 - v16)) / accuracy;
    double v18 = floor(v17);
    double v19 = v18 + round(accuracy * (v17 - v18)) / accuracy;
    double height = self->_contentSize.height;
    double v21 = v12 + self->_contentSize.width;
    double v22 = floor(v21);
    double v23 = v22 + round(accuracy * (v21 - v22)) / accuracy - v7;
    double v24 = floor(v23);
    double v25 = v24 + round(accuracy * (v23 - v24)) / accuracy;
    double v26 = self->_firstPageOffset.vertical - v10;
    double v27 = floor(v26);
    double v28 = v27 + round(accuracy * (v26 - v27)) / accuracy;
    double v29 = floor(v28);
    double v30 = v29 + round(accuracy * (v28 - v29)) / accuracy;
    double v31 = floor(v11 + height);
    double v32 = v31 + round(accuracy * (v11 + height - v31)) / accuracy - v9;
    double v33 = floor(v32);
    double v34 = v33 + round(accuracy * (v32 - v33)) / accuracy;
  }
  [(UIScrollView *)self _revealableContentPadding];
  double v36 = v35;
  double v38 = v19 - v37;
  double v40 = v30 - v39;
  [(UIScrollView *)self _maxTopOffsetAdjustedForRevealableContentPadding:v34 + v41];
  if (x >= v38)
  {
    if (x > v25 + v36)
    {
      if (v25 + v36 <= v38) {
        double x = v38;
      }
      else {
        double x = v25 + v36;
      }
    }
  }
  else
  {
    double x = v38;
  }
  if (y >= v40)
  {
    if (y > v42)
    {
      if (v42 <= v40) {
        double y = v40;
      }
      else {
        double y = v42;
      }
    }
  }
  else
  {
    double y = v40;
  }
  double v43 = x;
  double v44 = y;
  result.double y = v44;
  result.double x = v43;
  return result;
}

- (CGPoint)_newScrollOffsetForScrubReturningAnimated:(BOOL *)a3
{
  unint64_t v4 = *((unsigned int *)&self->_scrollViewFlags + 5);
  uint64_t v5 = (v4 >> 11) & 0xF;
  double startOffsetX = self->_startOffsetX;
  double startOffsetY = self->_startOffsetY;
  *a3 = 0;
  [(UIView *)self bounds];
  double v10 = v8;
  double left = self->_knobRelativeContentInsets.left;
  double right = self->_knobRelativeContentInsets.right;
  double v62 = self->_knobRelativeIndicatorInsets.left;
  double v13 = self->_knobRelativeIndicatorInsets.right;
  if (((v4 >> 11) & 0xD) == 1)
  {
    double v14 = v9;
    CGFloat v58 = self->_knobRelativeIndicatorInsets.right;
    CGFloat v59 = self->_knobRelativeContentInsets.right;
    CGFloat v60 = self->_knobRelativeContentInsets.left;
    double v61 = v8;
    double top = self->_knobRelativeContentInsets.top;
    double bottom = self->_knobRelativeContentInsets.bottom;
    double v17 = self->_knobRelativeIndicatorInsets.top;
    double v18 = self->_knobRelativeIndicatorInsets.bottom;
    accuracdouble y = self->_accuracy;
    if (accuracy == 1.0)
    {
      double v21 = round(v9);
    }
    else
    {
      double v20 = floor(v9);
      double v21 = v20 + round((v9 - v20) * accuracy) / accuracy;
    }
    [(UIScrollView *)self _scrollIndicatorAdditionalInset];
    double v23 = v21 - (v17 + v22);
    [(UIScrollView *)self _scrollIndicatorAdditionalInset];
    double v25 = v23 - (v18 + v24);
    [(UIScrollViewPanGestureRecognizer *)self->_pan translationInView:self];
    double height = self->_contentSize.height;
    double v28 = startOffsetY + v27 / v25 * (bottom + top + height);
    double v29 = self->_accuracy;
    double v30 = bottom + height;
    if (v29 == 1.0)
    {
      double v32 = round(v30);
      double v35 = round(self->_firstPageOffset.vertical - top);
    }
    else
    {
      double v31 = floor(v30);
      double v32 = v31 + round(v29 * (v30 - v31)) / v29;
      double v33 = self->_firstPageOffset.vertical - top;
      double v34 = floor(v33);
      double v35 = v34 + round(v29 * (v33 - v34)) / v29;
    }
    double left = v60;
    double v10 = v61;
    [(UIScrollView *)self _rubberBandOffsetForOffset:0 maxOffset:v28 minOffset:v32 - v14 range:v35 outside:v25 * 0.8];
    double startOffsetY = v36;
    double v13 = v58;
    double right = v59;
  }
  if (v5 == 4 || v5 == 2)
  {
    double v38 = self->_accuracy;
    if (v38 == 1.0)
    {
      double v40 = round(v10);
    }
    else
    {
      double v39 = floor(v10);
      double v40 = v39 + round((v10 - v39) * v38) / v38;
    }
    [(UIScrollView *)self _scrollIndicatorAdditionalInset];
    double v42 = v40 - (v62 + v41);
    [(UIScrollView *)self _scrollIndicatorAdditionalInset];
    double v44 = v42 - (v13 + v43);
    [(UIScrollViewPanGestureRecognizer *)self->_pan translationInView:self];
    double width = self->_contentSize.width;
    double v47 = startOffsetX + v46 / v44 * (right + left + width);
    double v48 = self->_accuracy;
    double v49 = right + width;
    if (v48 == 1.0)
    {
      double v51 = round(v49);
      double v54 = round(self->_firstPageOffset.horizontal - left);
    }
    else
    {
      double v50 = floor(v49);
      double v51 = v50 + round(v48 * (v49 - v50)) / v48;
      double v52 = self->_firstPageOffset.horizontal - left;
      double v53 = floor(v52);
      double v54 = v53 + round(v48 * (v52 - v53)) / v48;
    }
    [(UIScrollView *)self _rubberBandOffsetForOffset:0 maxOffset:v47 minOffset:v51 - v10 range:v54 outside:v44 * 0.8];
    double startOffsetX = v55;
  }
  double v56 = startOffsetX;
  double v57 = startOffsetY;
  result.double y = v57;
  result.double x = v56;
  return result;
}

- (void)_updatePanGesture
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  p_unint64_t scrollViewFlags = &self->_scrollViewFlags;
  if ((*((unsigned char *)&self->_scrollViewFlags + 2) & 0x10) == 0
    && (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x10) == 0)
  {
    unint64_t v4 = [(UIGestureRecognizer *)self->_pan _activeEventOfType:10];
    if ([(UIPanGestureRecognizer *)self->_pan numberOfTouches])
    {
      uint64_t v5 = -[UIPanGestureRecognizer _activeTouches]((id *)&self->_pan->super.super.super.isa);
      double v6 = [v5 firstObject];

      if ([v6 _isPointerTouch])
      {
        if ((*((_DWORD *)p_scrollViewFlags + 5) & 0x7800) == 0
          && [(UIGestureRecognizer *)self->_pan state] == UIGestureRecognizerStateBegan
          && [(UIGestureRecognizer *)self->_knobPointerLongPressGestureRecognizer state] == UIGestureRecognizerStateBegan)
        {
          [(UIScrollView *)self _beginDirectManipulationIfNecessaryWithGestureRecognizer:self->_knobPointerLongPressGestureRecognizer];
        }
        BOOL v7 = [(UIScrollView *)self _supportsPointerDragScrolling];
        if ((*((_DWORD *)p_scrollViewFlags + 5) & 0x7800) == 0 && !v7) {
          goto LABEL_171;
        }
      }
    }
    if ((*(void *)p_scrollViewFlags & 2) == 0)
    {
      uint64_t v9 = *(void *)((char *)p_scrollViewFlags + 12);
      *(void *)p_scrollViewFlags |= 2uLL;
      *(void *)((char *)p_scrollViewFlags + 12) = v9 & 0xFFF7FEFFFFFFFFFFLL | 0x10000000000;
      if (![(UIPanGestureRecognizer *)self->_pan numberOfTouches]) {
        *((_DWORD *)p_scrollViewFlags + 5) &= 0xFFFF87FF;
      }
    }
    [(UIView *)self bounds];
    double v11 = v10;
    double v13 = v12;
    *(void *)p_scrollViewFlags |= 0x800000uLL;
    if ([(UIGestureRecognizer *)self->_pan state] == UIGestureRecognizerStateBegan)
    {
      if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)self)
        || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self))
      {
        [(UIScrollView *)self _adjustScrollerIndicators:1 alwaysShowingThem:0];
      }
      [(UIScrollView *)self _updateAccessories];
      [(UIScrollView *)self _scrollViewWillBeginDragging];
      [(_UIScrollViewScrollingAnimator *)self->_keyboardScrollingAnimator cancelInteractiveScroll];
      [(UIScrollView *)self _setKnobInteractionGestureDelayed:1];
      if ((*(unsigned char *)p_scrollViewFlags & 2) == 0) {
        goto LABEL_172;
      }
    }
    if (!self->_scrollHeartbeat) {
      [(UIScrollView *)self _pushTrackingRunLoopModeIfNecessaryForReason:@"updatePanGesture starting to drag"];
    }
    [(UIScrollView *)self _bumpTrackingWatchdogTimer];
    if ([(UIScrollViewPanGestureRecognizer *)self->_pan _beganCaughtDeceleratingScrollViewAndMoved])
    {
      [(UIScrollView *)self _adjustStartOffsetForGrabbedBouncingScrollView];
    }
    [(UIScrollViewPanGestureRecognizer *)self->_pan translationInView:self];
    double v126 = v15;
    double v127 = v14;
    float v16 = v14;
    *(float *)&double v14 = v15;
    float v131 = *(float *)&v14;
    double v17 = *(float *)&v14;
    unsigned int v18 = *(unsigned char *)p_scrollViewFlags;
    BOOL v128 = [(UIScrollView *)self alwaysBounceHorizontal];
    BOOL v129 = [(UIScrollView *)self alwaysBounceVertical];
    __int16 v138 = 0;
    double startOffsetX = self->_startOffsetX;
    float v130 = v16;
    double v20 = v16;
    double startOffsetY = self->_startOffsetY;
    BOOL v137 = 0;
    p_horizontalVelocitdouble y = &self->_horizontalVelocity;
    self->_previousHorizontalVelocitdouble y = self->_horizontalVelocity;
    p_verticalVelocitdouble y = &self->_verticalVelocity;
    self->_previousVerticalVelocitdouble y = self->_verticalVelocity;
    [(UIScrollViewPanGestureRecognizer *)self->_pan velocityInView:self];
    double v25 = v24;
    double v27 = v26;
    self->_horizontalVelocitdouble y = -(v24 * self->_velocityScaleFactor);
    self->_verticalVelocitdouble y = -(v26 * self->_velocityScaleFactor);
    double v132 = v11;
    double v133 = v13;
    if (v4 && ![v4 _scrollType])
    {
      if (((_UIInternalPreferenceUsesDefault(&_MergedGlobals_115, @"DiscreteScrollAnimationEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1EB2579FC)&& !_AXSReduceMotionEnabled())
      {
        CGRect v125 = [(UIView *)self window];
        BOOL v137 = v125 != 0;
      }
      else
      {
        BOOL v137 = 0;
      }
      int v134 = 1;
    }
    else
    {
      int v134 = 0;
    }
    double v28 = startOffsetX - v20;
    double v29 = startOffsetY - v17;
    scrollableAncestor = self->_scrollableAncestor;
    if (scrollableAncestor)
    {
      double v31 = self->_startOffsetX;
      double v32 = self->_startOffsetY;
      id v136 = 0;
      -[_UIScrollViewScrollableAncestor _scrollView:adjustedUnconstrainedOffsetForUnconstrainedOffset:startOffset:horizontalVelocity:verticalVelocity:animator:](scrollableAncestor, "_scrollView:adjustedUnconstrainedOffsetForUnconstrainedOffset:startOffset:horizontalVelocity:verticalVelocity:animator:", self, &self->_horizontalVelocity, &self->_verticalVelocity, &v136, v28, v29, v31, v32);
      double v34 = v33;
      double v36 = v35;
      id v37 = v136;
      double v28 = v34 - (v31 - self->_startOffsetX);
      double v29 = v36 - (v32 - self->_startOffsetY);
    }
    else
    {
      id v37 = 0;
    }
    int v38 = (v18 >> 2) & 1;
    int v39 = (v18 >> 3) & 1;
    if (![(UIScrollViewPanGestureRecognizer *)self->_pan _caughtDeceleratingScrollView])
    {
      if ((*((_DWORD *)p_scrollViewFlags + 5) & 0x7800) != 0)
      {
        [(UIScrollView *)self _newScrollOffsetForScrubReturningAnimated:&v137];
        double v28 = v40;
        double v29 = v41;
      }
      else
      {
        if ([(UIScrollViewPanGestureRecognizer *)self->_pan _allowsBounce])
        {
          if (self->_currentScrollDeviceCategory == 6)
          {
            -[UIScrollView _rubberBandingReversalOffsetForOriginalOffset:velocity:currentPanTranslation:](self, "_rubberBandingReversalOffsetForOriginalOffset:velocity:currentPanTranslation:", v28, v29, v25, v27, v127, v126);
            double v28 = v28 - v42;
            double v29 = v29 - v43;
            float v44 = v42 + v20;
            float v45 = v43 + v17;
            -[UIPanGestureRecognizer setTranslation:inView:](self->_pan, "setTranslation:inView:", self, v44, v45);
          }
          else
          {
            float v44 = v130;
            float v45 = v131;
          }
          -[UIScrollView _rubberBandContentOffsetForOffset:outsideX:outsideY:](self, "_rubberBandContentOffsetForOffset:outsideX:outsideY:", (char *)&v138 + 1, &v138, v28, v29);
          double v28 = v123;
          double v29 = v124;
LABEL_46:
          [(UIScrollView *)self _effectiveContentInset];
          accuracdouble y = self->_accuracy;
          double v53 = v52 + v51 + self->_contentSize.width;
          if (accuracy == 1.0)
          {
            double v55 = round(v53);
            double v57 = round(v132);
          }
          else
          {
            double v54 = floor(v53);
            double v55 = v54 + round(accuracy * (v53 - v54)) / accuracy;
            double v56 = floor(v132);
            double v57 = v56 + round((v132 - v56) * accuracy) / accuracy;
          }
          if (v55 <= v57 && (v128 & v39 & 1) == 0)
          {
            *p_horizontalVelocitdouble y = 0.0;
            accuracdouble y = self->_accuracy;
          }
          double v58 = v49 + v48 + self->_contentSize.height;
          if (accuracy == 1.0)
          {
            double v60 = round(v58);
            double v62 = round(v133);
          }
          else
          {
            double v59 = floor(v58);
            double v60 = v59 + round(accuracy * (v58 - v59)) / accuracy;
            double v61 = floor(v133);
            double v62 = v61 + round((v133 - v61) * accuracy) / accuracy;
          }
          if (v60 <= v62 && (v129 & v38 & 1) == 0) {
            *p_verticalVelocitdouble y = 0.0;
          }
          int v63 = *((_DWORD *)p_scrollViewFlags + 5);
          unint64_t v64 = *(void *)((char *)p_scrollViewFlags + 12);
          if ((v64 & 0x20) == 0)
          {
            double v6 = v37;
            goto LABEL_70;
          }
          double v6 = v37;
          if (v44 >= 0.0)
          {
            if (v44 <= 0.0) {
              goto LABEL_65;
            }
            uint64_t v65 = -129;
          }
          else
          {
            uint64_t v65 = -65;
          }
          v64 &= v65;
          *(void *)((char *)p_scrollViewFlags + 12) = v64;
          *((_DWORD *)p_scrollViewFlags + 5) = v63;
LABEL_65:
          if (v45 >= 0.0)
          {
            if (v45 <= 0.0) {
              goto LABEL_70;
            }
            uint64_t v66 = -513;
          }
          else
          {
            uint64_t v66 = -257;
          }
          v64 &= v66;
          *(void *)((char *)p_scrollViewFlags + 12) = v64;
          *((_DWORD *)p_scrollViewFlags + 5) = v63;
LABEL_70:
          double v67 = *p_horizontalVelocity;
          if (*p_horizontalVelocity == 0.0)
          {
            double v69 = *p_verticalVelocity;
            if (*p_verticalVelocity == 0.0) {
              goto LABEL_86;
            }
          }
          else
          {
            if (HIBYTE(v138)) {
              goto LABEL_83;
            }
            double v68 = 1.0;
            if (v67 < 0.0) {
              double v68 = 0.0;
            }
            if (v68 != (double)((v64 >> 10) & 1)) {
              goto LABEL_83;
            }
            double v69 = *p_verticalVelocity;
            if (*p_verticalVelocity == 0.0) {
              goto LABEL_82;
            }
          }
          if (!(_BYTE)v138)
          {
            double v70 = 1.0;
            if (v69 < 0.0) {
              double v70 = 0.0;
            }
            if (v70 == (double)((v64 >> 11) & 1))
            {
LABEL_82:
              if (v67 * v67 + v69 * v69 >= 0.0169) {
                goto LABEL_86;
              }
            }
          }
LABEL_83:
          if (self->_fastScrollCount >= 1)
          {
            self->_int64_t fastScrollCount = 0;
            self->_double fastScrollMultiplier = 1.0;
            unint64_t v64 = *(void *)((char *)p_scrollViewFlags + 12);
            int v63 = *((_DWORD *)p_scrollViewFlags + 5);
          }
          v64 &= 0xFFFFFFFFFFFFFC3FLL;
          *(void *)((char *)p_scrollViewFlags + 12) = v64;
          *((_DWORD *)p_scrollViewFlags + 5) = v63;
          double v67 = *p_horizontalVelocity;
LABEL_86:
          BOOL v71 = v67 < 0.0;
          if (v67 != 0.0)
          {
            double v72 = 1.0;
            if (v71) {
              double v72 = 0.0;
            }
            unint64_t v64 = v64 & 0xFFFFFFFFFFFFFBFFLL | ((v72 & 1) << 10);
            *((_DWORD *)p_scrollViewFlags + 5) = v63;
            *(void *)((char *)p_scrollViewFlags + 12) = v64;
          }
          long double v73 = *p_verticalVelocity;
          if (*p_verticalVelocity != 0.0)
          {
            long double v73 = 1.0;
            if (*p_verticalVelocity < 0.0) {
              long double v73 = 0.0;
            }
            *((_DWORD *)p_scrollViewFlags + 5) = v63;
            *(void *)((char *)p_scrollViewFlags + 12) = v64 & 0xFFFFFFFFFFFFF7FFLL | ((v73 & 1) << 11);
          }
          if (!v134)
          {
            int64_t fastScrollCount = self->_fastScrollCount;
            if (fastScrollCount < 3) {
              goto LABEL_145;
            }
            goto LABEL_138;
          }
          -[UIScrollViewPanGestureRecognizer _velocityIncludingDiscreteScrollInView:](self->_pan, "_velocityIncludingDiscreteScrollInView:", self, (double)v73);
          double velocityScaleFactor = self->_velocityScaleFactor;
          double v76 = v75 * velocityScaleFactor;
          double v78 = v77 * velocityScaleFactor;
          *(float *)&double v75 = v75 * velocityScaleFactor;
          *(float *)&double v77 = v77 * velocityScaleFactor;
          float v79 = hypotf(*(float *)&v75, *(float *)&v77);
          if (v76 == 0.0) {
            double v80 = v44;
          }
          else {
            double v80 = v76;
          }
          if (v78 == 0.0) {
            double v78 = v45;
          }
          if (v78 >= 0.0) {
            double v81 = 1.0;
          }
          else {
            double v81 = 0.0;
          }
          if (v80 >= 0.0) {
            double v82 = 1.0;
          }
          else {
            double v82 = 0.0;
          }
          if (v80 == 0.0)
          {
            int v83 = 0;
          }
          else if (HIBYTE(v138))
          {
            int v83 = 1;
          }
          else
          {
            int v83 = (v82 != 0.0) ^ (*(void *)((char *)p_scrollViewFlags + 12) >> 10) & 1;
          }
          double v85 = v79;
          if (v78 == 0.0)
          {
            int v86 = 0;
          }
          else
          {
            if ((_BYTE)v138) {
              goto LABEL_121;
            }
            int v86 = (v81 != 0.0) ^ (*(void *)((char *)p_scrollViewFlags + 12) >> 11) & 1;
          }
          BOOL v87 = v79 > 0.0;
          if (v85 >= 0.13) {
            BOOL v87 = 0;
          }
          if (((v83 | v86) & 1) == 0 && !v87)
          {
LABEL_122:
            if (v80 != 0.0) {
              *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)(v82 != 0.0) << 10);
            }
            if (v78 != 0.0) {
              *(void *)((char *)p_scrollViewFlags + 12) = *(void *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)(v81 != 0.0) << 11);
            }
            if ((_UIInternalPreferenceUsesDefault(&dword_1EB257A00, @"DiscreteFastScrollEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1EB257A04)
            {
              int v88 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257A88, @"DiscreteFastScrollTriggerVelocity", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
              long double v73 = *(double *)&qword_1EB257A90;
              if (v88) {
                long double v73 = 0.6;
              }
              if (v73 <= v85)
              {
                [v4 timestamp];
                double v89 = v73;
                double discreteFastScrollLastHighVelocityEventTime = self->_discreteFastScrollLastHighVelocityEventTime;
                if (discreteFastScrollLastHighVelocityEventTime != 0.0)
                {
                  int v91 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257A78, @"DiscreteFastScrollIntervalBetweenEvents", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
                  double v92 = *(double *)&qword_1EB257A80;
                  if (v91) {
                    double v92 = 0.075;
                  }
                  long double v73 = discreteFastScrollLastHighVelocityEventTime + v92;
                  if (v89 >= v73)
                  {
                    ++self->_discreteFastScrollCount;
                    self->_double discreteFastScrollEndTime = v89;
                  }
                }
                self->_double discreteFastScrollLastHighVelocityEventTime = v89;
              }
            }
            int64_t fastScrollCount = self->_fastScrollCount;
            if (fastScrollCount <= 2)
            {
              int64_t discreteFastScrollCount = self->_discreteFastScrollCount;
              uint64_t v95 = discreteFastScrollCount - 3;
              if (discreteFastScrollCount >= 3)
              {
                long double v73 = hypot(v28 - self->_startOffsetX, v29 - self->_startOffsetY);
                if (v73 > 0.0)
                {
                  double v96 = v73;
                  int v97 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257A98, @"DiscreteFastScrollDistanceScale", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
                  double v98 = *(double *)&qword_1EB257AA0;
                  if (v97) {
                    double v98 = 240.0;
                  }
                  long double v73 = fmin(self->_discreteFastScrollStartMultiplier + ((double)v95 * 0.5 + 1.0) * fmin(v96 / v98, 0.9), 16.0);
                  if (self->_discreteFastScrollMultiplier != v73)
                  {
                    self->_discreteFastScrollMultiplier = v73;
                    [(UIScrollView *)self contentOffset];
                    self->_double startOffsetX = v99;
                    [(UIScrollView *)self contentOffset];
                    self->_double startOffsetY = v100;
                    -[UIPanGestureRecognizer setTranslation:inView:](self->_pan, "setTranslation:inView:", self, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
                    [(UIScrollViewPanGestureRecognizer *)self->_pan _setDiscreteFastScrollMultiplier:self->_discreteFastScrollMultiplier];
                  }
                }
              }
LABEL_145:
              pinch = self->_pinch;
              if (pinch
                && [(UIGestureRecognizer *)pinch state]
                && [(UIGestureRecognizer *)self->_pinch numberOfTouches] > 1)
              {
                goto LABEL_170;
              }
              double v102 = [(UIView *)self window];
              int v103 = [v102 _systemGestureRecognitionIsPossible];

              if (v103)
              {
                CGFloat v104 = *(id *)(__UILogGetCategoryCachedImpl("EventDispatch", &_updatePanGesture___s_category)+ 8);
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                {
                  CGFloat v105 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v105);
                  id v106 = (id)objc_claimAutoreleasedReturnValue();
                  UIGestureRecognizerState v107 = [(UIGestureRecognizer *)self->_pan state];
                  *(_DWORD *)long long buf = 138543874;
                  id v140 = v106;
                  __int16 v141 = 2048;
                  v142 = self;
                  __int16 v143 = 2048;
                  UIGestureRecognizerState v144 = v107;
                  _os_log_impl(&dword_1853B0000, v104, OS_LOG_TYPE_DEFAULT, "Scroll view <%{public}@ %p> ignoring pan gesture (state %ld) because system gestures are possible", buf, 0x20u);
                }
                goto LABEL_169;
              }
              uint64_t v108 = *(void *)((char *)p_scrollViewFlags + 12);
              *(void *)((char *)p_scrollViewFlags + 12) = v108 | 0x80000;
              if ((v108 & 0x10000000000000) != 0)
              {
                [(UIPanGestureRecognizer *)self->_pan locationInView:self];
                double v110 = v109;
                double v112 = v111;
                id WeakRetained = objc_loadWeakRetained(&self->_delegate);
                objc_msgSend(WeakRetained, "_scrollView:adjustedOffsetForOffset:translation:startPoint:locationInView:horizontalVelocity:verticalVelocity:", self, &self->_horizontalVelocity, &self->_verticalVelocity, v28, v29, v127, v126, self->_startOffsetX, self->_startOffsetY, v110, v112);
                double v28 = v114;
                double v29 = v115;
              }
              if (v6)
              {
                v135[0] = MEMORY[0x1E4F143A8];
                v135[1] = 3221225472;
                v135[2] = __33__UIScrollView__updatePanGesture__block_invoke;
                v135[3] = &unk_1E52DD178;
                v135[4] = self;
                *(double *)&v135[5] = v28;
                *(double *)&v135[6] = v29;
                [v6 addAnimations:v135];
                [v6 startAnimation];
              }
              else
              {
                char v116 = v134 ^ 1;
                if (!v137) {
                  char v116 = 1;
                }
                if ((v116 & 1) == 0)
                {
                  id v117 = objc_loadWeakRetained((id *)&self->_animation);

                  if (v117)
                  {
                    CGRect v118 = (double *)objc_loadWeakRetained((id *)&self->_animation);
                    double v120 = v118[13];
                    double v119 = v118[14];

                    if (v28 == v120 && v29 == v119) {
                      goto LABEL_167;
                    }
                    CGRect v121 = objc_loadWeakRetained((id *)&self->_animation);
                    v121[153] = 1;
                  }
                  if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB257A68, @"DiscreteScrollAnimationDuration", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v122 = 0.067; {
                  else
                  }
                    double v122 = *(double *)&qword_1EB257A70;
                  -[UIScrollView _setContentOffset:duration:animationCurve:animationConfigurator:](self, "_setContentOffset:duration:animationCurve:animationConfigurator:", 0, &__block_literal_global_647, v28, v29, v122);
                  goto LABEL_167;
                }
                -[UIScrollView setContentOffset:](self, "setContentOffset:", v28, v29);
              }
LABEL_167:
              if ((unint64_t)([(UIScrollView *)self keyboardDismissMode] - 1) > 3)
              {
LABEL_170:
                self->_lastUpdateTime = CACurrentMediaTime();
LABEL_171:

LABEL_172:
                return;
              }
              CGFloat v104 = +[UIPeripheralHost sharedInstance];
              [v104 scrollView:self didPanWithGesture:self->_pan];
LABEL_169:

              goto LABEL_170;
            }
LABEL_138:
            float v93 = (v28 - self->_startOffsetX) * (v28 - self->_startOffsetX)
                + (v29 - self->_startOffsetY) * (v29 - self->_startOffsetY);
            long double v73 = fmin(self->_fastScrollStartMultiplier+ ((double)(fastScrollCount - 3) * 0.5 + 1.0) * fmin(sqrtf(v93) / 240.0, 0.9), 16.0);
            self->_double fastScrollMultiplier = v73;
            goto LABEL_145;
          }
LABEL_121:
          [(UIScrollView *)self _resetDiscreteFastScroll];
          goto LABEL_122;
        }
        -[UIScrollView _clampScrollOffsetToBounds:](self, "_clampScrollOffsetToBounds:", v28, v29);
        double v28 = v46;
        double v29 = v47;
        -[UIPanGestureRecognizer setTranslation:inView:](self->_pan, "setTranslation:inView:", self, self->_startOffsetX - v46, self->_startOffsetY - v47);
      }
      int v38 = 0;
      int v39 = 0;
    }
    float v44 = v130;
    float v45 = v131;
    goto LABEL_46;
  }
}

uint64_t __33__UIScrollView__updatePanGesture__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __33__UIScrollView__updatePanGesture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 152) = 1;
}

- (CGPoint)_rubberBandingReversalOffsetForOriginalOffset:(CGPoint)a3 velocity:(CGPoint)a4 currentPanTranslation:(CGPoint)a5
{
  double y = a4.y;
  double v29 = a5.y;
  double x = a5.x;
  double v27 = a3.y;
  double v5 = a4.x;
  double v6 = a3.x;
  [(UIScrollView *)self contentOffset];
  double v9 = v8;
  double v25 = v10;
  [(UIScrollView *)self _minimumContentOffset];
  double v12 = v11;
  double v14 = v13;
  [(UIScrollView *)self _maximumContentOffset];
  double v16 = v15;
  double v18 = v17;
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_GamePadRubberBandingReversalAccelerationCoefficient, @"GamePadRubberBandingReversalAccelerationCoefficient", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v19 = 0.1; {
  else
  }
    double v19 = *(double *)&qword_1E8FD55B0;
  [(UIScrollView *)self _rubberBandingReversalOffsetForOriginalOffset:v6 contentMin:v12 contentMax:v16 contentOffset:v9 velocity:v5 currentDelta:x rubberBandingCoefficient:v19];
  double v21 = v20;
  [(UIScrollView *)self _rubberBandingReversalOffsetForOriginalOffset:v27 contentMin:v14 contentMax:v18 contentOffset:v25 velocity:y currentDelta:v29 rubberBandingCoefficient:v19];
  double v23 = v22;
  double v24 = v21;
  result.double y = v23;
  result.double x = v24;
  return result;
}

- (double)_rubberBandingReversalOffsetForOriginalOffset:(double)a3 contentMin:(double)a4 contentMax:(double)a5 contentOffset:(double)a6 velocity:(double)a7 currentDelta:(double)a8 rubberBandingCoefficient:(double)a9
{
  if (a6 >= a4 || a7 >= 0.0)
  {
    BOOL v10 = a7 <= 0.0 || a6 <= a5;
    double v9 = a3 - a5;
    if (v10) {
      double v9 = 0.0;
    }
  }
  else
  {
    double v9 = a3 - a4;
  }
  return v9 * a9;
}

- (BOOL)_hasScrollViewWillEndDraggingInvocationsToPerform
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    || ([(UIScrollView *)self _observerImplementingWillEndDraggingMethod],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    char v4 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)_performScrollViewWillEndDraggingInvocationsWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4 unclampedOriginalTarget:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v8 = a3.y;
  double v9 = a3.x;
  BOOL v11 = [(UIScrollView *)self _isAutomaticContentOffsetAdjustmentEnabled];
  [(UIScrollView *)self _setAutomaticContentOffsetAdjustmentEnabled:0];
  if (objc_opt_respondsToSelector()) {
    -[UIScrollView _scrollViewWillEndDraggingWithVelocity:targetContentOffset:](self, "_scrollViewWillEndDraggingWithVelocity:targetContentOffset:", a4, v9, v8);
  }
  id v15 = [(UIScrollView *)self _observerImplementingWillEndDraggingMethod];
  if (v15) {
    objc_msgSend(v15, "_observeScrollView:willEndDraggingWithVelocity:targetContentOffset:unclampedOriginalTarget:", self, a4, v9, v8, x, y);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v14, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", self, a4, v9, v8);
  }
  [(UIScrollView *)self _setAutomaticContentOffsetAdjustmentEnabled:v11];
}

- (UIEdgeInsets)_collapsableContentPadding
{
  uint64_t v11 = 0;
  double v12 = (double *)&v11;
  uint64_t v13 = 0x4010000000;
  id v14 = &unk_186D7DBA7;
  long long v15 = 0u;
  long long v16 = 0u;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__UIScrollView__collapsableContentPadding__block_invoke;
  v10[3] = &unk_1E530F568;
  v10[4] = self;
  v10[5] = &v11;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v10);
  double v2 = v12[4];
  double v3 = v12[5];
  double v4 = v12[6];
  double v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.double right = v9;
  result.double bottom = v8;
  result.double left = v7;
  result.double top = v6;
  return result;
}

double __42__UIScrollView__collapsableContentPadding__block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector())
  {
    double v5 = *(double **)(*(void *)(a1 + 40) + 8);
    [a2 _collapsableContentPaddingForObservedScrollView:*(void *)(a1 + 32)];
    double result = v5[4] + v6;
    double v8 = v7 + v5[5];
    double v10 = v9 + v5[6];
    double v12 = v11 + v5[7];
    uint64_t v13 = *(double **)(*(void *)(a1 + 40) + 8);
    v13[4] = result;
    v13[5] = v8;
    v13[6] = v10;
    v13[7] = v12;
  }
  return result;
}

- (double)_maxTopOffsetAdjustedForRevealableContentPadding:(double)a3
{
  [(UIScrollView *)self _revealableContentPaddingIncludingContentWithCollapsedAffinity:0];
  double v6 = v5;
  double v8 = v7;
  [(UIScrollView *)self _collapsableContentPadding];
  double v10 = v9;
  [(UIScrollView *)self _effectiveContentInset];
  double v12 = v11;
  double v14 = v13;
  [(UIView *)self bounds];
  accuracdouble y = self->_accuracy;
  double v17 = v14 + self->_contentSize.height;
  if (accuracy == 1.0)
  {
    double v27 = v12 + v8 + round(v17);
    if (v6 + v27 > v15 && v27 - v10 < v15) {
      double v21 = v10 - v12;
    }
    else {
      double v21 = a3;
    }
    double result = round(round(self->_firstPageOffset.vertical - v12) - v6);
  }
  else
  {
    double v18 = floor(v17);
    double v19 = v12 + v8 + v18 + round(accuracy * (v17 - v18)) / accuracy;
    BOOL v20 = v6 + v19 > v15 && v19 - v10 < v15;
    double v21 = v10 - v12;
    if (!v20) {
      double v21 = a3;
    }
    double v22 = self->_firstPageOffset.vertical - v12;
    double v23 = floor(v22);
    double v24 = v23 + round(accuracy * (v22 - v23)) / accuracy - v6;
    double v25 = floor(v24);
    double result = v25 + round(accuracy * (v24 - v25)) / accuracy;
  }
  if (v21 >= result) {
    return v21;
  }
  return result;
}

- (double)_maxTopOffset
{
  [(UIScrollView *)self _revealableContentPadding];
  double v4 = v3;
  [(UIScrollView *)self _effectiveContentInset];
  accuracdouble y = self->_accuracy;
  double v7 = self->_firstPageOffset.vertical - v6;
  if (accuracy == 1.0) {
    return round(round(v7) - v4);
  }
  double v8 = floor(v7);
  double v9 = v8 + round(accuracy * (v7 - v8)) / accuracy - v4;
  double v10 = floor(v9);
  return v10 + round(accuracy * (v9 - v10)) / accuracy;
}

- (BOOL)_scrollViewWillEndDraggingWithDeceleration:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (![(UIScrollView *)self _hasScrollViewWillEndDraggingInvocationsToPerform])goto LABEL_181; {
  [(UIView *)self bounds];
  }
  double v7 = v6;
  double v9 = v8;
  [(UIScrollView *)self contentOffset];
  double v11 = v10;
  double v180 = v12;
  if (self->_horizontalVelocity >= 0.0) {
    double v13 = 0.01;
  }
  else {
    double v13 = -0.01;
  }
  if (self->_verticalVelocity >= 0.0) {
    double v14 = 0.01;
  }
  else {
    double v14 = -0.01;
  }
  [(UIScrollView *)self _effectiveContentInset];
  accuracdouble y = self->_accuracy;
  p_firstPageOffset = &self->_firstPageOffset;
  double v21 = self->_firstPageOffset.horizontal - v20;
  double v182 = v9;
  double v183 = v7;
  if (accuracy == 1.0)
  {
    double v25 = round(v21);
    double v31 = round(round(v17 + self->_contentSize.width) - v7);
    double v36 = round(self->_firstPageOffset.vertical - v15);
    double v40 = round(round(v16 + self->_contentSize.height) - v9);
  }
  else
  {
    double v22 = floor(v21);
    double v23 = v22 + round(accuracy * (v21 - v22)) / accuracy;
    double v24 = floor(v23);
    double v25 = v24 + round(accuracy * (v23 - v24)) / accuracy;
    double height = self->_contentSize.height;
    double v27 = v17 + self->_contentSize.width;
    double v28 = floor(v27);
    double v29 = v28 + round(accuracy * (v27 - v28)) / accuracy - v7;
    double v30 = floor(v29);
    double v31 = v30 + round(accuracy * (v29 - v30)) / accuracy;
    double v32 = self->_firstPageOffset.vertical - v15;
    double v33 = floor(v32);
    double v34 = v33 + round(accuracy * (v32 - v33)) / accuracy;
    double v35 = floor(v34);
    double v36 = v35 + round(accuracy * (v34 - v35)) / accuracy;
    double v37 = floor(v16 + height);
    double v38 = v37 + round(accuracy * (v16 + height - v37)) / accuracy - v9;
    double v39 = floor(v38);
    double v40 = v39 + round(accuracy * (v38 - v39)) / accuracy;
  }
  [(UIScrollView *)self _revealableContentPadding];
  double v42 = v25 - v41;
  double v44 = v31 + v43;
  double v46 = v36 - v45;
  [(UIScrollView *)self _maxTopOffsetAdjustedForRevealableContentPadding:v40 + v47];
  double v49 = v48;
  p_unint64_t scrollViewFlags = &self->_scrollViewFlags;
  double v51 = &OBJC_IVAR____UITileLayer_pendingDeferredOffscreenSetNeedsDisplay;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    double y = self->_pageDecelerationTarget.y;
    double x = self->_pageDecelerationTarget.x;
  }
  else
  {
    self->_decelerationLnFactorH = log(self->_decelerationFactor.width);
    long double v52 = log(self->_decelerationFactor.height);
    self->_decelerationLnFactorV = v52;
    if (v3)
    {
      double v51 = &OBJC_IVAR____UITileLayer_pendingDeferredOffscreenSetNeedsDisplay;
      double fastScrollMultiplier = self->_fastScrollMultiplier;
      double v54 = v11 - (self->_horizontalVelocity - v13) / self->_decelerationLnFactorH * fastScrollMultiplier;
      double v55 = v180 - fastScrollMultiplier * ((self->_verticalVelocity - v14) / v52);
      double v56 = self->_accuracy;
      if (v56 == 1.0)
      {
        double v58 = round(v54);
        double v60 = round(v55);
      }
      else
      {
        double v57 = floor(v54);
        double v58 = v57 + round(v56 * (v54 - v57)) / v56;
        double v59 = floor(v55);
        double v60 = v59 + round(v56 * (v55 - v59)) / v56;
      }
      p_unint64_t scrollViewFlags = &self->_scrollViewFlags;
      if (v44 <= v42) {
        double v66 = v42;
      }
      else {
        double v66 = v44;
      }
      if (v58 <= v44) {
        double v66 = v58;
      }
      if (v58 >= v42) {
        double x = v66;
      }
      else {
        double x = v42;
      }
      if (v60 >= v46)
      {
        if (v60 <= v49)
        {
          double y = v60;
        }
        else if (v49 <= v46)
        {
          double y = v46;
        }
        else
        {
          double y = v49;
        }
      }
      else
      {
        double y = v46;
      }
    }
    else
    {
      [(UIScrollView *)self contentOffset];
      double v64 = v63;
      double y = v65;
      double x = v64;
      p_unint64_t scrollViewFlags = &self->_scrollViewFlags;
      double v51 = &OBJC_IVAR____UITileLayer_pendingDeferredOffscreenSetNeedsDisplay;
    }
  }
  v185.f64[0] = x;
  v185.f64[1] = y;
  double v181 = y;
  [(UIScrollView *)self _performScrollViewWillEndDraggingInvocationsWithVelocity:&v185 targetContentOffset:self->_horizontalVelocity unclampedOriginalTarget:self->_verticalVelocity];
  [(UIScrollView *)self _effectiveContentInset];
  double v70 = self->_accuracy;
  double v72 = p_firstPageOffset->horizontal - v71;
  double v172 = v14;
  double v173 = v13;
  double v177 = v46;
  double v179 = v11;
  double v175 = v49;
  double v176 = v44;
  if (v70 == 1.0)
  {
    double v76 = round(v72);
    double v82 = round(round(v69 + self->_contentSize.width) - v183);
    double v87 = round(self->_firstPageOffset.vertical - v67);
    double v91 = round(round(v68 + self->_contentSize.height) - v182);
  }
  else
  {
    double v73 = floor(v72);
    double v74 = v73 + round(v70 * (v72 - v73)) / v70;
    double v75 = floor(v74);
    double v76 = v75 + round(v70 * (v74 - v75)) / v70;
    double v77 = self->_contentSize.height;
    double v78 = v69 + self->_contentSize.width;
    double v79 = floor(v78);
    double v80 = v79 + round(v70 * (v78 - v79)) / v70 - v183;
    double v81 = floor(v80);
    double v82 = v81 + round(v70 * (v80 - v81)) / v70;
    double v83 = self->_firstPageOffset.vertical - v67;
    double v84 = floor(v83);
    double v85 = v84 + round(v70 * (v83 - v84)) / v70;
    double v86 = floor(v85);
    double v87 = v86 + round(v70 * (v85 - v86)) / v70;
    double v88 = floor(v68 + v77);
    double v89 = v88 + round(v70 * (v68 + v77 - v88)) / v70 - v182;
    double v90 = floor(v89);
    double v91 = v90 + round(v70 * (v89 - v90)) / v70;
  }
  [(UIScrollView *)self _revealableContentPadding];
  double v93 = v92;
  double v95 = v94;
  double v97 = v76 - v96;
  [(UIScrollView *)self _maxTopOffsetAdjustedForRevealableContentPadding:v91 + v98];
  v100.f64[0] = v185.f64[0];
  BOOL v101 = x != v185.f64[0];
  double v102 = v185.f64[1];
  if (v181 != v185.f64[1]) {
    BOOL v101 = 1;
  }
  if (v101)
  {
    uint64_t v103 = *(uint64_t *)&self->_accuracy;
    if (*(double *)&v103 == 1.0)
    {
      float64x2_t v100 = vrndaq_f64(v185);
    }
    else
    {
      float64x2_t v104 = vrndmq_f64(v185);
      float64x2_t v100 = vaddq_f64(v104, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v185, v104), *(double *)&v103)), (float64x2_t)vdupq_lane_s64(v103, 0)));
    }
    float64x2_t v185 = v100;
    double v102 = v100.f64[1];
  }
  double v105 = v82 + v95;
  double v106 = v87 - v93;
  if (v97 != v42) {
    LOBYTE(v101) = 1;
  }
  double v174 = v99;
  if (!v101 && (v105 == v176 ? (BOOL v107 = v106 == v177) : (BOOL v107 = 0), v107 ? (v108 = v99 == v175) : (v108 = 0), v108))
  {
    double v109 = v100.f64[0];
  }
  else
  {
    double v109 = v97;
    if (v100.f64[0] >= v97)
    {
      double v109 = v100.f64[0];
      if (v100.f64[0] > v105)
      {
        if (v105 <= v97) {
          double v109 = v97;
        }
        else {
          double v109 = v105;
        }
      }
    }
    v185.f64[0] = v109;
    double v110 = v87 - v93;
    if (v102 >= v106)
    {
      double v110 = v102;
      if (v102 > v99)
      {
        if (v99 <= v106) {
          double v110 = v87 - v93;
        }
        else {
          double v110 = v99;
        }
      }
    }
    v185.f64[1] = v110;
    double v102 = v110;
  }
  double v111 = *(double *)((char *)&self->super.super.super.isa + v51[946]);
  double v112 = (v109 - v179) / v111;
  BOOL v113 = vabdd_f64(v109, x) < 0.00000011920929;
  BOOL v114 = vabdd_f64(v102, v181) < 0.00000011920929 && v113;
  double v178 = (v102 - v180) / v111;
  [(UIScrollView *)self _interpageSpacing];
  double v116 = v183 + v115;
  double v184 = v182 + v117;
  [(UIScrollView *)self _pagingOrigin];
  double v120 = v119;
  if (fabs(v112) >= 0.00000011920929)
  {
    int v121 = 0;
    if (v114)
    {
      int v123 = 0;
      double v124 = v178;
      double v125 = fabs(v178);
      if (v125 >= 0.00000011920929) {
        goto LABEL_151;
      }
      goto LABEL_99;
    }
    if (v185.f64[0] < v97) {
      goto LABEL_72;
    }
    double v122 = v181;
    if (v185.f64[0] <= v105)
    {
      if ((*(void *)((char *)p_scrollViewFlags + 12) & 0x20) != 0)
      {
        double v144 = floor((v185.f64[0] - v118) / v116 + 0.5);
        double v145 = v118 + v116 * v144;
        if (v144 == 0.0) {
          double horizontal = p_firstPageOffset->horizontal;
        }
        else {
          double horizontal = 0.0;
        }
        double v150 = v145 + horizontal;
        self->_pageDecelerationTarget.double x = v150;
        double v151 = self->_accuracy;
        if (v151 == 1.0)
        {
          double v153 = round(v150);
        }
        else
        {
          double v152 = floor(v150);
          double v153 = v152 + round(v151 * (v150 - v152)) / v151;
        }
        if (v153 >= v97)
        {
          if (v153 > v105)
          {
            if (v105 <= v97) {
              double v153 = v97;
            }
            else {
              double v153 = v105;
            }
          }
        }
        else
        {
          double v153 = v97;
        }
        self->_pageDecelerationTarget.double x = v153;
        int v121 = 1;
      }
      else
      {
        horizontalVelocitdouble y = self->_horizontalVelocity;
        if ((horizontalVelocity > 0.0 || v185.f64[0] >= x) && (horizontalVelocity < 0.0 || v185.f64[0] <= x))
        {
          double v130 = v119;
          long double v171 = exp(-(horizontalVelocity - v173) / v112);
          self->_adjustedDecelerationFactor.CGFloat width = v171;
          if (v171 > 0.999) {
            self->_adjustedDecelerationFactor.CGFloat width = 0.999;
          }
        }
        else
        {
          double v130 = v119;
          double v131 = v112 * log(self->_decelerationFactor.width);
          self->_horizontalVelocitdouble y = v173 - v131;
          if (vabdd_f64(v173, v131) < 0.25)
          {
            self->_adjustedDecelerationFactor.CGFloat width = 0.985;
            self->_horizontalVelocitdouble y = v173 + v112 * 0.0151136378;
          }
        }
        int v121 = 1;
        double v122 = v181;
        double v120 = v130;
      }
    }
  }
  else
  {
    self->_horizontalVelocitdouble y = 0.0;
    if ((*(void *)((char *)p_scrollViewFlags + 12) & 0x20) == 0)
    {
      int v121 = 0;
LABEL_72:
      double v122 = v181;
      goto LABEL_98;
    }
    double v126 = floor((v179 - v118) / v116 + 0.5);
    double v127 = v118 + v116 * v126;
    double v122 = v181;
    if (v126 == 0.0) {
      double v128 = p_firstPageOffset->horizontal;
    }
    else {
      double v128 = 0.0;
    }
    double v132 = v127 + v128;
    self->_pageDecelerationTarget.double x = v132;
    double v133 = self->_accuracy;
    if (v133 == 1.0)
    {
      double v135 = round(v132);
    }
    else
    {
      double v134 = floor(v132);
      double v135 = v134 + round(v133 * (v132 - v134)) / v133;
    }
    if (v135 >= v97)
    {
      if (v135 > v105)
      {
        if (v105 <= v97) {
          double v135 = v97;
        }
        else {
          double v135 = v105;
        }
      }
    }
    else
    {
      double v135 = v97;
    }
    int v121 = 0;
    self->_pageDecelerationTarget.double x = v135;
  }
LABEL_98:
  double v124 = v178;
  double v125 = fabs(v178);
  if (v125 < 0.00000011920929)
  {
LABEL_99:
    self->_verticalVelocitdouble y = 0.0;
    if ((*(void *)((char *)p_scrollViewFlags + 12) & 0x20) != 0)
    {
      double v136 = floor((v180 - v120) / v184 + 0.5);
      double v137 = v120 + v184 * v136;
      if (v136 == 0.0) {
        double vertical = self->_firstPageOffset.vertical;
      }
      else {
        double vertical = 0.0;
      }
      double v141 = v137 + vertical;
      self->_pageDecelerationTarget.double y = v141;
      double v142 = self->_accuracy;
      if (v142 == 1.0)
      {
        double v125 = round(v141);
      }
      else
      {
        double v143 = floor(v141);
        double v125 = v143 + round(v142 * (v141 - v143)) / v142;
      }
      if (v125 >= v106)
      {
        if (v125 > v174)
        {
          if (v174 <= v106) {
            double v125 = v106;
          }
          else {
            double v125 = v174;
          }
        }
      }
      else
      {
        double v125 = v106;
      }
      int v123 = 0;
      self->_pageDecelerationTarget.double y = v125;
      goto LABEL_151;
    }
    goto LABEL_103;
  }
  if (!v114)
  {
    int v123 = 0;
    double v125 = v185.f64[1];
    if (v185.f64[1] >= v106 && v185.f64[1] <= v174)
    {
      if ((*(void *)((char *)p_scrollViewFlags + 12) & 0x20) != 0)
      {
        double v147 = floor((v185.f64[1] - v120) / v184 + 0.5);
        double v148 = v120 + v184 * v147;
        if (v147 == 0.0) {
          double v149 = self->_firstPageOffset.vertical;
        }
        else {
          double v149 = 0.0;
        }
        double v154 = v148 + v149;
        self->_pageDecelerationTarget.double y = v154;
        double v155 = self->_accuracy;
        if (v155 == 1.0)
        {
          double v125 = round(v154);
        }
        else
        {
          double v156 = floor(v154);
          double v125 = v156 + round(v155 * (v154 - v156)) / v155;
        }
        if (v125 >= v106)
        {
          if (v125 > v174)
          {
            if (v174 <= v106) {
              double v125 = v106;
            }
            else {
              double v125 = v174;
            }
          }
        }
        else
        {
          double v125 = v106;
        }
        self->_pageDecelerationTarget.double y = v125;
      }
      else
      {
        verticalVelocitdouble y = self->_verticalVelocity;
        if ((verticalVelocity > 0.0 || v185.f64[1] >= v122) && (verticalVelocity < 0.0 || v185.f64[1] <= v122))
        {
          double v125 = exp(-(verticalVelocity - v172) / v178);
          self->_adjustedDecelerationFactor.double height = v125;
          if (v125 > 0.999) {
            self->_adjustedDecelerationFactor.double height = 0.999;
          }
        }
        else
        {
          double v140 = v178 * log(self->_decelerationFactor.height);
          self->_verticalVelocitdouble y = v172 - v140;
          double v125 = vabdd_f64(v172, v140);
          if (v125 < 0.25)
          {
            self->_adjustedDecelerationFactor.double height = 0.985;
            double v125 = v172 + v178 * 0.0151136378;
            self->_verticalVelocitdouble y = v125;
          }
        }
      }
      int v123 = 1;
    }
    goto LABEL_151;
  }
LABEL_103:
  int v123 = 0;
LABEL_151:
  if ((*(void *)((char *)p_scrollViewFlags + 12) & 0x20) == 0)
  {
    uint64_t v157 = 0x4000000000;
    if (!v121) {
      uint64_t v157 = 0;
    }
    if ((v121 & v123) == 1)
    {
      p_adjustedDecelerationFactor = &self->_adjustedDecelerationFactor;
      CGFloat v159 = self->_adjustedDecelerationFactor.height;
      double v160 = v159;
      if (v159 == 0.0) {
        double v160 = self->_decelerationFactor.height;
      }
      CGFloat width = p_adjustedDecelerationFactor->width;
      if (p_adjustedDecelerationFactor->width == 0.0) {
        CGFloat width = self->_decelerationFactor.width;
      }
      if (v160 >= width)
      {
        if (v159 == 0.0) {
          CGFloat v159 = self->_decelerationFactor.height;
        }
        if (width < v159)
        {
          self->_horizontalVelocitdouble y = v173 - v112 * log(v159);
          double v163 = self->_adjustedDecelerationFactor.height;
          if (v163 == 0.0) {
            double v163 = self->_decelerationFactor.height;
          }
          p_adjustedDecelerationFactor->CGFloat width = v163;
        }
      }
      else
      {
        self->_verticalVelocitdouble y = v172 - v124 * log(width);
        CGFloat v162 = p_adjustedDecelerationFactor->width;
        if (p_adjustedDecelerationFactor->width == 0.0) {
          CGFloat v162 = self->_decelerationFactor.width;
        }
        self->_adjustedDecelerationFactor.double height = v162;
      }
      uint64_t v157 = 0x4000000000;
    }
    double v125 = v185.f64[0];
    self->_adjustedDecelerationTarget = (CGPoint)v185;
    uint64_t v164 = 0x8000000000;
    if (!v123) {
      uint64_t v164 = 0;
    }
    unint64_t v165 = v157 | v164 | *(void *)((char *)p_scrollViewFlags + 12) & 0xFFFFFF3FFFFFFFFFLL;
    *((_DWORD *)p_scrollViewFlags + 5) = *((_DWORD *)p_scrollViewFlags + 5);
    *(void *)((char *)p_scrollViewFlags + 12) = v165;
  }
  [(UIScrollView *)self contentOffset];
  LOBYTE(v3) = 1;
  if (v167 == v185.f64[0] && v166 == v185.f64[1])
  {
    if ([(UIScrollView *)self _canPerformAsyncScrollDecelerationReturningEvent:0])
    {
      [(UIScrollViewPanGestureRecognizer *)self->_pan velocityInView:self];
      LOBYTE(v3) = v169 != *(double *)(MEMORY[0x1E4F1DAD8] + 8) || v168 != *MEMORY[0x1E4F1DAD8];
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
LABEL_181:

  return v3;
}

- (BOOL)_staysCenteredDuringPinch
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 34) & 1;
}

- (void)_setStaysCenteredDuringPinch:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (void)_updatePinchGestureForState:(int64_t)a3
{
  if (![(UIScrollView *)self _staysCenteredDuringPinch])
  {
    [(UIPinchGestureRecognizer *)self->_pinch anchorPoint];
    double v7 = v18;
    [(UIPinchGestureRecognizer *)self->_pinch anchorPoint];
    double v10 = v19;
    goto LABEL_12;
  }
  [(UIView *)self bounds];
  double v7 = v6 + v5 * 0.5;
  double v10 = v9 + v8 * 0.5;
  double v11 = [(UIView *)self window];
  uint64_t v12 = [(UIView *)self window];
  double v13 = (void *)v12;
  if (v11)
  {
    double v14 = [(UIView *)self window];
    if (v14)
    {
      double v15 = [(UIView *)self window];
      objc_msgSend(v15, "convertPoint:fromView:", self, v7, v10);
      objc_msgSend(v13, "_convertDoublePointToSceneReferenceSpace:");
      double v7 = v16;
      double v10 = v17;

LABEL_10:
      goto LABEL_11;
    }
    objc_msgSend(v13, "_convertDoublePointToSceneReferenceSpace:", v7, v10);
LABEL_9:
    double v7 = v20;
    double v10 = v21;
    goto LABEL_10;
  }
  if (v12)
  {
    double v14 = [(UIView *)self window];
    objc_msgSend(v14, "convertPoint:fromView:", self, v7, v10);
    goto LABEL_9;
  }
LABEL_11:

LABEL_12:
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((unint64_t)(a3 - 3) < 2)
  {
    p_uint64_t scrollViewFlags = &self->_scrollViewFlags;
    uint64_t scrollViewFlags = (uint64_t)self->_scrollViewFlags;
    if ((scrollViewFlags & 0x40000000) != 0)
    {
      *(void *)p_uint64_t scrollViewFlags = scrollViewFlags & 0xFFFFFFFFBFFFFF7FLL;
      *(void *)((char *)&self->_scrollViewFlags + 12) &= ~0x1000000000uLL;
      self->_verticalVelocitdouble y = 0.0;
      self->_horizontalVelocitdouble y = 0.0;
      if ((*(unsigned char *)p_scrollViewFlags & 0x40) != 0)
      {
        [(UIScrollView *)self zoomScale];
        p_double minimumZoomScale = &self->_minimumZoomScale;
        if (v39 < self->_minimumZoomScale
          || ([(UIScrollView *)self zoomScale],
              p_double minimumZoomScale = &self->_maximumZoomScale,
              v40 > self->_maximumZoomScale))
        {
          *(void *)p_scrollViewFlags |= 0x80uLL;
          -[UIScrollView setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:](self, "setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:", 0, 1, 0, *p_minimumZoomScale, v7, v10, -1.0);
        }
      }
      uint64_t v41 = *(void *)p_scrollViewFlags;
      if ((*(void *)p_scrollViewFlags & 0x80) == 0)
      {
        [(UIScrollView *)self contentOffset];
        -[UIScrollView setContentOffset:](self, "setContentOffset:");
        [(UIScrollView *)self _scrollViewDidEndZooming];
        if (objc_opt_respondsToSelector())
        {
          double v42 = [(UIScrollView *)self _getDelegateZoomView];
          [(UIScrollView *)self zoomScale];
          objc_msgSend(WeakRetained, "scrollViewDidEndZooming:withView:atScale:", self, v42);
        }
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        void v65[2] = __44__UIScrollView__updatePinchGestureForState___block_invoke;
        v65[3] = &unk_1E52D9F70;
        v65[4] = self;
        +[UIView animateWithDuration:v65 animations:0.2];
        uint64_t v41 = *(void *)p_scrollViewFlags;
      }
      if ((v41 & 0x800000) == 0 && !self->_scrollHeartbeat) {
        [(UIScrollView *)self _popTrackingRunLoopModeIfNecessaryForReason:@"Pinch gesture ended"];
      }
    }
    zoomView = self->_zoomView;
    self->_zoomView = 0;

    [(UIScrollViewPanGestureRecognizer *)self->_pan _scrollViewDidEndZooming];
    [(_UIEdgeFeedbackGenerator *)self->_zoomFeedbackGenerator userInteractionEnded];
  }
  else
  {
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        double v23 = [(UIScrollView *)self _getDelegateZoomView];
        double v24 = self->_zoomView;
        self->_zoomView = v23;

        pinch = self->_pinch;
        [(UIScrollView *)self _zoomScaleFromPresentationLayer:1];
        -[UIPinchGestureRecognizer setScale:](pinch, "setScale:");
        if (self->_zoomAnimationCount)
        {
          [(UIScrollView *)self _scrollViewDidEndZooming];
          if (objc_opt_respondsToSelector())
          {
            double v26 = [(UIScrollView *)self _getDelegateZoomView];
            [(UIScrollView *)self zoomScale];
            objc_msgSend(WeakRetained, "scrollViewDidEndZooming:withView:atScale:", self, v26);
          }
        }
        *(void *)&self->_scrollViewFlags |= 0xC0000000uLL;
        *(void *)((char *)&self->_scrollViewFlags + 12) |= 0x1000000000uLL;
        double v27 = [(UIView *)self->_zoomView window];
        double v28 = self->_zoomView;
        double v29 = [(UIView *)v28 window];
        double v30 = v29;
        if (v27)
        {
          objc_msgSend(v29, "_convertDoublePointFromSceneReferenceSpace:", v7, v10);
          double v32 = v31;
          double v34 = v33;
          double v35 = [(UIView *)self->_zoomView window];
          -[UIView convertPoint:fromView:](v28, "convertPoint:fromView:", v35, v32, v34);
          -[UIScrollView _setZoomAnchorPoint:](self, "_setZoomAnchorPoint:");
        }
        else
        {
          -[UIView convertPoint:fromView:](v28, "convertPoint:fromView:", v29, v7, v10);
          -[UIScrollView _setZoomAnchorPoint:](self, "_setZoomAnchorPoint:");
        }

        if (self->_scrollHeartbeat) {
          [(UIScrollView *)self _stopScrollingNotify:1 pin:1];
        }
        [(UIScrollView *)self _scrollViewWillBeginZooming];
        if (objc_opt_respondsToSelector()) {
          [WeakRetained scrollViewWillBeginZooming:self withView:self->_zoomView];
        }
        if (!self->_scrollHeartbeat) {
          [(UIScrollView *)self _pushTrackingRunLoopModeIfNecessaryForReason:@"Pinch gesture began"];
        }
        [(UIScrollView *)self _activateZoomFeedback];
      }
      goto LABEL_56;
    }
    double v44 = -[UIGestureRecognizer _activeTouchesEvent](self->_pinch);

    if (v44)
    {
      double v45 = [(UIGestureRecognizer *)self->_pinch _allActiveTouches];
      BOOL v46 = [v45 count] == 2;
    }
    else
    {
      BOOL v46 = 1;
    }
    uint64_t v47 = (uint64_t)self->_scrollViewFlags;
    if ((v47 & 0x40000000) == 0 && v46)
    {
      double v48 = self;
      uint64_t v49 = 1;
LABEL_55:
      [(UIScrollView *)v48 _updatePinchGestureForState:v49];
      goto LABEL_56;
    }
    char v50 = (v47 & 0x40000000) == 0 || v46;
    if ((v50 & 1) == 0)
    {
      double v48 = self;
      uint64_t v49 = 3;
      goto LABEL_55;
    }
    if (self->_zoomView)
    {
      double v51 = [(UIView *)self window];
      int v52 = [v51 _systemGestureRecognitionIsPossible];

      uint64_t v53 = *(void *)((char *)&self->_scrollViewFlags + 12);
      int v54 = *((_DWORD *)&self->_scrollViewFlags + 5);
      if (v52)
      {
        *(void *)((char *)&self->_scrollViewFlags + 12) = v53 | 0x800000000;
        *((_DWORD *)&self->_scrollViewFlags + 5) = v54;
      }
      else
      {
        if ((v53 & 0x800000000) != 0)
        {
          *(void *)((char *)&self->_scrollViewFlags + 12) = v53 & 0xFFFFFFF7FFFFFFFFLL;
          *((_DWORD *)&self->_scrollViewFlags + 5) = v54;
          double v55 = self->_pinch;
          [(UIScrollView *)self _zoomScaleFromPresentationLayer:1];
          -[UIPinchGestureRecognizer setScale:](v55, "setScale:");
          double v56 = [(UIView *)self->_zoomView window];
          double v57 = self->_zoomView;
          double v58 = [(UIView *)v57 window];
          double v59 = v58;
          if (v56)
          {
            objc_msgSend(v58, "_convertDoublePointFromSceneReferenceSpace:", v7, v10);
            double v61 = v60;
            double v63 = v62;
            double v64 = [(UIView *)self->_zoomView window];
            -[UIView convertPoint:fromView:](v57, "convertPoint:fromView:", v64, v61, v63);
            -[UIScrollView _setZoomAnchorPoint:](self, "_setZoomAnchorPoint:");
          }
          else
          {
            -[UIView convertPoint:fromView:](v57, "convertPoint:fromView:", v58, v7, v10);
            -[UIScrollView _setZoomAnchorPoint:](self, "_setZoomAnchorPoint:");
          }
        }
        [(UIPinchGestureRecognizer *)self->_pinch scale];
        -[UIScrollView setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:force:](self, "setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:force:", (*(void *)&self->_scrollViewFlags >> 6) & 1, 0, 0, 1);
      }
    }
  }
LABEL_56:
}

uint64_t __44__UIScrollView__updatePinchGestureForState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _adjustContentOffsetIfNecessary];
  double v2 = *(void **)(a1 + 32);
  return [v2 _centerContentIfNecessary];
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  id v6 = a3;
  double v7 = (UIScrollViewPinchGestureRecognizer *)a4;
  id v8 = [(UIScrollView *)self _scrollViewTouchDelayGesture];
  if (v8 == v6)
  {
    if (self->_pinch == v7 || (UIScrollViewPinchGestureRecognizer *)self->_pan == v7)
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_3;
      }
    }
    BOOL v9 = 0;
    goto LABEL_10;
  }

LABEL_3:
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  return self->_keyboardScrollingGestureRecognizer != a3
      || [(UIScrollView *)self _allowsKeyboardEventsToScroll];
}

- (BOOL)pressGestureRecognizer:(id)a3 shouldAllowPress:(id)a4
{
  if (self->_keyboardScrollingGestureRecognizer != a3) {
    return 1;
  }
  id v6 = a4;
  double v7 = [(UIScrollView *)self _scrollingAnimator];
  char v8 = [v7 isInterestedInPress:v6];

  return v8;
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginHorizontallyWithEvent:(id)a4
{
  if (self->_pan == a3)
  {
    [(UIScrollView *)self _findScrollableAncestorIfNeededWithEvent:a4];
    int v5 = [(_UIScrollViewScrollableAncestor *)self->_scrollableAncestor _descendentScrollViewShouldScrollHorizontally:self];
    uint64_t v6 = 4096;
    if (!v5) {
      uint64_t v6 = 0;
    }
    *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFEFFFLL | v6;
    [(UIScrollView *)self _updateContentFitDisableScrolling];
  }
  return 1;
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginVerticallyWithEvent:(id)a4
{
  if (self->_pan == a3)
  {
    [(UIScrollView *)self _findScrollableAncestorIfNeededWithEvent:a4];
    int v5 = [(_UIScrollViewScrollableAncestor *)self->_scrollableAncestor _descendentScrollViewShouldScrollVertically:self];
    uint64_t v6 = 0x2000;
    if (!v5) {
      uint64_t v6 = 0;
    }
    *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFDFFFLL | v6;
    [(UIScrollView *)self _updateContentFitDisableScrolling];
  }
  return 1;
}

- (void)_findScrollableAncestorIfNeededWithEvent:(id)a3
{
  if ((*((unsigned char *)&self->_scrollViewFlags + 1) & 0x40) == 0)
  {
    [a3 timestamp];
    self->_intervalBetweenPanGestures = v4 - self->_lastPanGestureEndTime;
    if ([(UIScrollView *)self _shouldScrollAncestors])
    {
      int v5 = [(UIScrollView *)self _parentScrollView];

      if (!v5)
      {
        uint64_t v6 = [(UIView *)self _firstAncestorInteractionConformingToProtocol:&unk_1ED468D90];
        scrollableAncestor = self->_scrollableAncestor;
        self->_scrollableAncestor = v6;
      }
    }
    *(void *)&self->_scrollViewFlags |= 0x4000uLL;
  }
}

- (void)_setShouldScrollAncestors:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)_shouldScrollAncestors
{
  return (*((unsigned char *)&self->_scrollViewFlags + 1) & 0x80) == 0;
}

- (void)_handleSwipe:(id)a3
{
  double v4 = 1.0;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x80) == 0) {
    double v4 = -1.0;
  }
  -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:", a3, v4, 0.0);
  [(UIScrollView *)self _trackingDidEnd];
}

- (void)handlePinch:(id)a3
{
  uint64_t v4 = [a3 state];
  [(UIScrollView *)self _updatePinchGestureForState:v4];
}

- (void)handlePan:(id)a3
{
  id v21 = a3;
  uint64_t v4 = [v21 state];
  switch(v4)
  {
    case 1:
      double v14 = (void *)UIApp;
      double v15 = [(UIView *)self window];
      id v16 = (id)[v14 _touchesEventForWindow:v15];

      [(UIScrollView *)self _resetScrollingWithUIEvent:v16];
      self->_horizontalVelocitdouble y = 0.0;
      self->_verticalVelocitdouble y = 0.0;
      self->_previousHorizontalVelocitdouble y = 0.0;
      self->_previousVerticalVelocitdouble y = 0.0;
      break;
    case 3:
      goto LABEL_5;
    case 4:
      int v5 = +[UIPeripheralHost sharedInstance];
      [v5 scrollView:self didFinishPanGesture:self->_pan];

LABEL_5:
      [(UIScrollView *)self _prepareToPageWithHorizontalVelocity:self->_horizontalVelocity verticalVelocity:self->_verticalVelocity];
      [(UIScrollView *)self _endPanNormal:1];
      [(UIScrollView *)self _trackingDidEnd];
      uint64_t v6 = [v21 _activeEventOfType:0];
      double v7 = [v21 _activeEventOfType:10];
      char v8 = v7;
      if (v6)
      {
        BOOL v9 = [v6 allTouches];
        double v10 = [v9 anyObject];
        double v11 = +[UIEventSessionActionAnalytics sharedInstance];
        uint64_t v12 = [v9 allObjects];
        double v13 = [v12 firstObject];
        objc_msgSend(v11, "didScroll:withSource:", self, +[_UIEventSessionAction getUIEventSourceForUITouchType:](_UIEventSessionAction, "getUIEventSourceForUITouchType:", objc_msgSend(v13, "type")));
      }
      else
      {
        uint64_t v17 = [v7 _trackpadFingerDownCount];
        double v18 = +[UIEventSessionActionAnalytics sharedInstance];
        double v19 = v18;
        if (v17 < 1) {
          uint64_t v20 = 0;
        }
        else {
          uint64_t v20 = 4;
        }
        [v18 didScroll:self withSource:v20];
      }
      goto LABEL_13;
  }
  [(UIScrollView *)self _updatePanGesture];
LABEL_13:
}

- (double)_intervalBetweenPanGestures
{
  return self->_intervalBetweenPanGestures;
}

- (BOOL)_allowsAsyncScrollEvent
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 28) & 1;
}

- (void)_setAllowsAsyncScrollEvent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xEFFFFFFF | v3;
}

- (BOOL)_canHandleAsyncScrollEvent
{
  uint64_t v2 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if ((v2 & 0x20) != 0) {
    return 0;
  }
  if ((v2 & 0x20000000000000) != 0) {
    return 1;
  }
  return [(UIScrollView *)self _subclassHandlesAsyncScrollEvent];
}

- (BOOL)_canPerformAsyncScrollDecelerationReturningEvent:(id *)a3
{
  if ([(UIScrollView *)self _canHandleAsyncScrollEvent])
  {
    int v5 = [(UIGestureRecognizer *)self->_pan _activeEventOfType:10];
    uint64_t v6 = v5;
    if (a3 && v5)
    {
      id v7 = v5;
      *a3 = v7;

      return 1;
    }

    if (v6) {
      return 1;
    }
  }
  return 0;
}

- (id)_asyncDeliveryTargetForScrollEvent:(id)a3
{
  if ([(UIScrollView *)self _canHandleAsyncScrollEvent]) {
    uint64_t v4 = self;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)_asynchronouslyDeliverScrollEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_AsyncScrollEventHandlerTimeout, @"AsyncScrollEventHandlerTimeout", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))int64_t v9 = 2000000000; {
  else
  }
    int64_t v9 = (uint64_t)(*(double *)&qword_1E8FD5570 * 1000000000.0);
  dispatch_time_t v10 = dispatch_time(0, v9);
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_AsyncScrollEventHandlerTimeout, @"AsyncScrollEventHandlerTimeout", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))uint64_t v11 = 100000000; {
  else
  }
    uint64_t v11 = (unint64_t)(*(double *)&qword_1E8FD5570 * 0.05 * 1000000000.0);
  dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, v11);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __61__UIScrollView__asynchronouslyDeliverScrollEvent_completion___block_invoke;
  handler[3] = &unk_1E52E3298;
  uint64_t v12 = v8;
  double v23 = v12;
  id v13 = v6;
  id v24 = v13;
  id v14 = v7;
  id v25 = v14;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_activate(v12);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__UIScrollView__asynchronouslyDeliverScrollEvent_completion___block_invoke_2;
  v18[3] = &unk_1E52F0BC0;
  double v19 = v12;
  id v20 = v13;
  id v21 = v14;
  id v15 = v14;
  id v16 = v13;
  uint64_t v17 = v12;
  [(UIScrollView *)self _sendAsynchronouslyHandleScrollEvent:v16 completion:v18];
}

uint64_t __61__UIScrollView__asynchronouslyDeliverScrollEvent_completion___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

intptr_t __61__UIScrollView__asynchronouslyDeliverScrollEvent_completion___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v2 = *(NSObject **)(a1 + 32);
  intptr_t result = dispatch_source_testcancel(v2);
  if (!result)
  {
    dispatch_source_cancel(v2);
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
  return result;
}

- (void)_sendAsynchronouslyHandleScrollEvent:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(UIScrollView *)self _subclassHandlesAsyncScrollEvent])
  {
    [(UIScrollView *)self _asynchronouslyHandleScrollEvent:v8 completion:v6];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained _scrollView:self asynchronouslyHandleScrollEvent:v8 completion:v6];
  }
}

- (BOOL)_subclassHandlesAsyncScrollEvent
{
  return 0;
}

- (void)_handleKnobLongPressGesture:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 1) {
      [(UIScrollView *)self _beginDirectManipulationIfNecessaryWithGestureRecognizer:v5];
    }
  }
  else
  {
    [(UIScrollView *)self _didEndDirectManipulationWithScrubbingDirection:((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 11) & 0xF];
  }
}

- (void)_beginDirectManipulationIfNecessaryWithGestureRecognizer:(id)a3
{
  if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x7800) == 0)
  {
    id v4 = a3;
    [v4 locationInView:self];
    double v6 = v5;
    double v8 = v7;
    int64_t v9 = [v4 touches];

    id v11 = [v9 firstObject];

    int64_t v10 = -[UIScrollView _scrubbingForPoint:touch:](self, "_scrubbingForPoint:touch:", v11, v6, v8);
    if ((unint64_t)(v10 - 1) <= 3)
    {
      [(UIScrollView *)self _didBeginDirectManipulationWithScrubbingDirection:v10];
      -[UIFeedbackGeneratorUserInteractionDriven pressedDownAtLocation:](self->_knobFeedbackGenerator, "pressedDownAtLocation:", v6, v8);
    }
  }
}

- (void)_didBeginDirectManipulationWithScrubbingDirection:(int64_t)a3
{
  [(NSTimer *)self->_verticalScrollIndicatorHideDelayTimer invalidate];
  verticalScrollIndicatorHideDelayTimer = self->_verticalScrollIndicatorHideDelayTimer;
  self->_verticalScrollIndicatorHideDelayTimer = 0;

  [(NSTimer *)self->_horizontalScrollIndicatorHideDelayTimer invalidate];
  horizontalScrollIndicatorHideDelayTimer = self->_horizontalScrollIndicatorHideDelayTimer;
  self->_horizontalScrollIndicatorHideDelayTimer = 0;

  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFF87FF | ((a3 & 0xF) << 11);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_knobInteractionBeginTime = v7;
  [(UIScrollView *)self _effectiveContentInset];
  self->_knobRelativeContentInsets.double top = v8;
  self->_knobRelativeContentInsets.double left = v9;
  self->_knobRelativeContentInsets.double bottom = v10;
  self->_knobRelativeContentInsets.double right = v11;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    uint64_t v12 = &OBJC_IVAR___UIScrollView__verticalScrollIndicator;
    [(UIScrollView *)self _effectiveVerticalScrollIndicatorInsets];
LABEL_5:
    self->_knobRelativeIndicatorInsets.double top = v13;
    self->_knobRelativeIndicatorInsets.double left = v14;
    self->_knobRelativeIndicatorInsets.double bottom = v15;
    self->_knobRelativeIndicatorInsets.double right = v16;
LABEL_6:
    double v18 = *(Class *)((char *)&self->super.super.super.isa + *v12);
    [v18 setExpandedForDirectManipulation:1];
  }
  else
  {
    int64_t v17 = a3 - 1;
    uint64_t v12 = &OBJC_IVAR___UIScrollView__horizontalScrollIndicator;
    switch(v17)
    {
      case 0:
      case 2:
        goto LABEL_6;
      case 1:
      case 3:
        [(UIScrollView *)self _effectiveHorizontalScrollIndicatorInsets];
        goto LABEL_5;
      default:
        return;
    }
  }
}

- (void)_trackpadInterruptScroll:(id)a3
{
  id v4 = a3;
  [(UIScrollView *)self _stopScrollingNotify:1 pin:1];
  [v4 doubleValue];
  double v6 = v5;

  self->_lastScrollInterruptionByPointerEventTime = v6;
  trackpadScrollInterruptionDelayedAction = self->_trackpadScrollInterruptionDelayedAction;
  self->_trackpadScrollInterruptionDelayedAction = 0;
}

- (void)_handleKnobHoverGesture:(id)a3
{
  id v37 = a3;
  uint64_t v4 = [v37 state];
  uint64_t v5 = [v37 _trackpadFingerDownCount];
  if (v5 != [v37 _previousTrackpadFingerDownCount])
  {
    trackpadScrollInterruptionDelayedAction = self->_trackpadScrollInterruptionDelayedAction;
    if (trackpadScrollInterruptionDelayedAction) {
      [(UIDelayedAction *)trackpadScrollInterruptionDelayedAction cancel];
    }
  }
  unint64_t v7 = v4 - 1;
  if ([v37 _trackpadFingerDownCount] == 1 && v7 <= 1)
  {
    if (![v37 _previousTrackpadFingerDownCount]
      && self->_scrollHeartbeat
      && ![(UIScrollView *)self _isBouncing]
      && ![(UIScrollView *)self isPagingEnabled])
    {
      double v28 = [v37 _activeEventOfType:11];
      [v28 timestamp];
      double v30 = v29;
      double v31 = [UIDelayedAction alloc];
      double v32 = [NSNumber numberWithDouble:v30];
      int v33 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_TrackpadInterruptScrollDelay, @"TrackpadInterruptScrollDelay", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      double v34 = *(double *)&qword_1E8FD55A0;
      if (v33) {
        double v34 = 0.01;
      }
      double v35 = [(UIDelayedAction *)v31 initWithTarget:self action:sel__trackpadInterruptScroll_ userInfo:v32 delay:*MEMORY[0x1E4F1C4B0] mode:v34];
      double v36 = self->_trackpadScrollInterruptionDelayedAction;
      self->_trackpadScrollInterruptionDelayedAction = v35;
    }
    verticalScrollIndicatorHideDelayTimer = self->_verticalScrollIndicatorHideDelayTimer;
    if (verticalScrollIndicatorHideDelayTimer)
    {
      [(NSTimer *)verticalScrollIndicatorHideDelayTimer invalidate];
      CGFloat v9 = self->_verticalScrollIndicatorHideDelayTimer;
      self->_verticalScrollIndicatorHideDelayTimer = 0;

      [(UIScrollView *)self _hideScrollIndicator:self->_verticalScrollIndicator afterDelay:1 animated:1.0];
    }
    horizontalScrollIndicatorHideDelayTimer = self->_horizontalScrollIndicatorHideDelayTimer;
    if (horizontalScrollIndicatorHideDelayTimer)
    {
      [(NSTimer *)horizontalScrollIndicatorHideDelayTimer invalidate];
      CGFloat v11 = self->_horizontalScrollIndicatorHideDelayTimer;
      self->_horizontalScrollIndicatorHideDelayTimer = 0;

      [(UIScrollView *)self _hideScrollIndicator:self->_horizontalScrollIndicator afterDelay:1 animated:1.0];
    }
    if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x400000) != 0)
    {
      [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__hideScrollIndicators object:0];
      [(UIScrollView *)self performSelector:sel__hideScrollIndicators withObject:0 afterDelay:1.0];
    }
  }
  if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)self)
    || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self))
  {
    if (v7 > 1)
    {
      *((_DWORD *)&self->_scrollViewFlags + 5) &= 0xFFCFFFFF;
      [(UIScrollView *)self _adjustScrollerIndicators:0 alwaysShowingThem:0];
    }
    else
    {
      [v37 locationInView:self];
      double v13 = v12;
      double v15 = v14;
      [(UIScrollView *)self _scrollIndicatorContainerRect];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      if (-[UIScrollView _isPoint:inExpandedIndicatorForAxis:containerRect:](self, "_isPoint:inExpandedIndicatorForAxis:containerRect:", 2, v13, v15, v16, v18, v20, v22))
      {
        int v24 = 0x100000;
      }
      else
      {
        int v24 = 0;
      }
      *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFEFFFFF | v24;
      BOOL v25 = -[UIScrollView _isPoint:inExpandedIndicatorForAxis:containerRect:](self, "_isPoint:inExpandedIndicatorForAxis:containerRect:", 1, v13, v15, v17, v19, v21, v23);
      int v26 = *((_DWORD *)&self->_scrollViewFlags + 5);
      int v27 = 0x200000;
      if (!v25) {
        int v27 = 0;
      }
      *((_DWORD *)&self->_scrollViewFlags + 5) = v26 & 0xFFDFFFFF | v27;
      if ((v26 & 0x100000) != 0)
      {
        [(_UIScrollViewScrollIndicator *)self->_verticalScrollIndicator setExpandedForDirectManipulation:1];
        int v27 = *((_DWORD *)&self->_scrollViewFlags + 5) & 0x200000;
      }
      if (v27) {
        [(_UIScrollViewScrollIndicator *)self->_horizontalScrollIndicator setExpandedForDirectManipulation:1];
      }
    }
  }
}

- (BOOL)_isPoint:(CGPoint)a3 inExpandedIndicatorForAxis:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  [(UIScrollView *)self _scrollIndicatorContainerRect];
  return -[UIScrollView _isPoint:inExpandedIndicatorForAxis:containerRect:](self, "_isPoint:inExpandedIndicatorForAxis:containerRect:", a4, x, y, v8, v9, v10, v11);
}

- (BOOL)_isPoint:(CGPoint)a3 inExpandedIndicatorForAxis:(unint64_t)a4 containerRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  double v13 = [(UIView *)self traitCollection];
  double v14 = +[_UIScrollViewScrollIndicator visualStyleForTraitCollection:v13];

  if (a4 != 1)
  {
    if (a4 == 2 && -[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)self))
    {
      memset(&slice, 0, sizeof(slice));
      if ([(UIScrollView *)self _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis])
      {
        int v15 = 0;
      }
      else
      {
        int v15 = 2;
      }
      [v14 staticDimensionExpandedSize];
      CGFloat v17 = v16;
      CGFloat v18 = x;
      CGFloat v19 = y;
      CGFloat v20 = width;
      CGFloat v21 = height;
      CGRectEdge v22 = v15;
      goto LABEL_10;
    }
LABEL_11:
    BOOL v24 = 0;
    goto LABEL_12;
  }
  if (!-[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self)) {
    goto LABEL_11;
  }
  memset(&slice, 0, sizeof(slice));
  objc_msgSend(v14, "staticDimensionExpandedSize", 0, 0, 0, 0);
  CGFloat v17 = v23;
  CGFloat v18 = x;
  CGFloat v19 = y;
  CGFloat v20 = width;
  CGFloat v21 = height;
  CGRectEdge v22 = CGRectMaxYEdge;
LABEL_10:
  CGRectDivide(*(CGRect *)&v18, &slice, &v26, v17, v22);
  objc_msgSend(v14, "hitTestingRectForIndicatorRect:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  CGRect slice = v29;
  v28.CGFloat x = v11;
  v28.CGFloat y = v10;
  BOOL v24 = CGRectContainsPoint(v29, v28);
LABEL_12:

  return v24;
}

- (BOOL)_shouldAutoScroll
{
  if ([(UIScrollView *)self _isAutoScrollEnabled]) {
    BOOL v3 = [(UIScrollView *)self isScrollEnabled];
  }
  else {
    BOOL v3 = 0;
  }
  uint64_t v4 = [(UIScrollView *)self _panGestureRecognizer];
  uint64_t v5 = [v4 state];

  BOOL v6 = 0;
  int v7 = (unint64_t)(v5 - 4) < 0xFFFFFFFFFFFFFFFDLL || !v3;
  if (v3 && v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
    BOOL v6 = WeakRetained == 0;
  }
  return v6;
}

- (void)_stopAutoScrollAssistant
{
  autoScrollAssistant = self->_autoScrollAssistant;
  if (autoScrollAssistant) {
    [(_UIAutoScrollAssistant *)autoScrollAssistant stop];
  }
}

- (void)_handleAutoScroll:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 state];
  if ((unint64_t)(v4 - 3) < 2) {
    goto LABEL_5;
  }
  if ((unint64_t)(v4 - 1) > 1) {
    goto LABEL_6;
  }
  if ([(UIScrollView *)self _shouldAutoScroll])
  {
    [v10 locationInView:self];
    double v6 = v5;
    double v8 = v7;
    double v9 = [(UIScrollView *)self _autoScrollAssistant];
    objc_msgSend(v9, "autoScrollFromPoint:", v6, v8);
  }
  else
  {
LABEL_5:
    [(UIScrollView *)self _stopAutoScrollAssistant];
  }
LABEL_6:
}

- (BOOL)_isAutoScrollEnabled
{
  return (*((_DWORD *)&self->_scrollViewFlags + 5) & 4) == 0;
}

- (BOOL)_supportsPointerDragScrolling
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 23) & 1;
}

- (void)_handleDirectionalPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4
{
  [(UIScrollView *)self _prepareToPageWithHorizontalVelocity:1 verticalVelocity:a3 nudgingBoundsWithVelocity:a4];
  double x = self->_pageDecelerationTarget.x;
  double y = self->_pageDecelerationTarget.y;
  -[UIScrollView _handleDirectionalScrollToOffset:clampingToBounds:](self, "_handleDirectionalScrollToOffset:clampingToBounds:", 1, x, y);
}

- (void)_handleDirectionalPress:(id)a3
{
  id v12 = a3;
  if ([v12 state] == 1 || objc_msgSend(v12, "changeCount"))
  {
    BOOL v4 = [(UIGestureRecognizer *)self->_pan isEnabled];
    [(UIGestureRecognizer *)self->_pan setEnabled:0];
    [(UIGestureRecognizer *)self->_pan setEnabled:v4];
    uint64_t v5 = *(void *)((char *)&self->_scrollViewFlags + 12);
    uint64_t v6 = [v12 activePressType];
    if ((v5 & 0x20) != 0)
    {
      if (v6 == 3) {
        double v7 = 1.0;
      }
      else {
        double v7 = 0.0;
      }
      if (v6 == 2) {
        double v8 = -1.0;
      }
      else {
        double v8 = v7;
      }
      uint64_t v9 = objc_msgSend(v12, "activePressType", v6, v7);
      if (v9 == 1) {
        double v10 = 1.0;
      }
      else {
        double v10 = 0.0;
      }
      if (v9) {
        double v11 = v10;
      }
      else {
        double v11 = -1.0;
      }
      [(UIScrollView *)self _handleDirectionalPageWithHorizontalVelocity:v8 verticalVelocity:v11];
    }
    else
    {
      [(UIScrollView *)self _offsetToScrollToForArrowPressType:v6];
      -[UIScrollView _handleDirectionalScrollToOffset:clampingToBounds:](self, "_handleDirectionalScrollToOffset:clampingToBounds:", 1);
    }
  }
}

- (void)_handleDirectionalScrollToOffset:(CGPoint)a3 clampingToBounds:(BOOL)a4
{
}

- (void)_handleDirectionalScrollToOffset:(CGPoint)a3 clampingToBounds:(BOOL)a4 duration:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  CGPoint v29 = a3;
  [(UIScrollView *)self contentOffset];
  double v11 = v10;
  double v13 = v12;
  -[UIScrollView _velocityForAnimatedScrollFromOffset:toOffset:duration:](self, "_velocityForAnimatedScrollFromOffset:toOffset:duration:");
  double v15 = v14;
  double v17 = v16;
  [(UIScrollView *)self _scrollViewWillBeginDragging];
  -[UIScrollView _performScrollViewWillEndDraggingInvocationsWithVelocity:targetContentOffset:unclampedOriginalTarget:](self, "_performScrollViewWillEndDraggingInvocationsWithVelocity:targetContentOffset:unclampedOriginalTarget:", &v29, v15, v17, x, y);
  if (a4)
  {
    [(UIScrollView *)self _maximumContentOffset];
    double v19 = v18;
    [(UIScrollView *)self _minimumContentOffset];
    if (v20 < v29.x) {
      double v20 = v29.x;
    }
    if (v19 <= v20) {
      double v20 = v19;
    }
    [(UIScrollView *)self _maximumContentOffset];
    double v22 = v21;
    [(UIScrollView *)self _minimumContentOffset];
    double v24 = v29.y;
    if (v23 >= v29.y) {
      double v24 = v23;
    }
    if (v22 <= v24) {
      double v24 = v22;
    }
    v29.double y = v24;
  }
  else
  {
    double v24 = v29.y;
  }
  if (v11 == v29.x && v13 == v24)
  {
    [(UIScrollView *)self _scrollViewDidEndDraggingForDelegateWithDeceleration:0];
  }
  else
  {
    [(UIScrollView *)self _scrollViewDidEndDraggingForDelegateWithDeceleration:1];
    CGRect v26 = +[UIAnimator sharedAnimator];
    [v26 removeAnimationsForTarget:self ofKind:objc_opt_class()];

    -[UIScrollView _adjustedContentOffsetForContentOffset:](self, "_adjustedContentOffsetForContentOffset:", v29.x, v29.y);
    if (v29.x == v28 && v29.y == v27) {
      -[UIScrollView _performDirectionalScrollAnimationToTargetOffset:duration:](self, "_performDirectionalScrollAnimationToTargetOffset:duration:", v29.x, v29.y, a5);
    }
    else {
      -[UIScrollView _performDirectionalBounceFromOffset:toTargetOffset:](self, "_performDirectionalBounceFromOffset:toTargetOffset:", v11, v13, v29.x, v29.y);
    }
  }
}

- (void)_performDirectionalScrollAnimationToTargetOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DirectionalScrollAnimationDuration, @"DirectionalScrollAnimationDuration", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v6 = 0.3; {
  else
  }
    double v6 = *(double *)&qword_1E8FD55E0;
  -[UIScrollView _performDirectionalScrollAnimationToTargetOffset:duration:](self, "_performDirectionalScrollAnimationToTargetOffset:duration:", x, y, v6);
}

- (void)_performDirectionalScrollAnimationToTargetOffset:(CGPoint)a3 duration:(double)contentOffsetAnimationDuration
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scrollViewWillBeginDecelerating:self];
  }
  if (contentOffsetAnimationDuration < 0.0) {
    contentOffsetAnimationDuration = self->_contentOffsetAnimationDuration;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F39C90]);
  int v9 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DirectionalScrollAnimationBounce, @"DirectionalScrollAnimationBounce", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v10 = 0.0;
  if (!v9) {
    double v10 = *(double *)&qword_1E8FD55F0;
  }
  double v11 = (void *)[v8 initWithPerceptualDuration:contentOffsetAnimationDuration bounce:v10];
  *(void *)((char *)&self->_scrollViewFlags + 12) |= 0x4000uLL;
  -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 1, 3, 0, v11, x, y);
}

- (void)_performDirectionalBounceFromOffset:(CGPoint)a3 toTargetOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  [(UIScrollView *)self _pushTrackingRunLoopModeIfNecessaryForReason:@"Directional bounce for CarPlay"];
  -[UIScrollView _updateDecelerationLastOffset:](self, "_updateDecelerationLastOffset:", v7, v6);
  self->_previousHorizontalVelocitdouble y = 0.0;
  self->_previousVerticalVelocitdouble y = 0.0;
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DirectionalScrollBounceVelocityMagnitude, @"DirectionalScrollBounceVelocityMagnitude", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v9 = 0.8; {
  else
  }
    double v9 = *(double *)&qword_1E8FD5600;
  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  [(UIScrollView *)self _effectiveContentInset];
  self->_horizontalVelocitdouble y = 0.0;
  accuracdouble y = self->_accuracy;
  double v19 = self->_firstPageOffset.horizontal - v18;
  if (accuracy == 1.0)
  {
    if (x >= round(v19))
    {
      double v23 = round(v16 + self->_contentSize.width);
      double v25 = round(v11);
LABEL_10:
      BOOL v27 = x <= v23 - v25;
      double v26 = v9;
      if (v27) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    double v20 = floor(v19);
    if (x >= v20 + round(accuracy * (v19 - v20)) / accuracy)
    {
      double v21 = v16 + self->_contentSize.width;
      double v22 = floor(v21);
      double v23 = v22 + round(accuracy * (v21 - v22)) / accuracy;
      double v24 = floor(v11);
      double v25 = v24 + round((v11 - v24) * accuracy) / accuracy;
      goto LABEL_10;
    }
  }
  double v26 = -v9;
LABEL_11:
  self->_horizontalVelocitdouble y = v26;
LABEL_12:
  self->_verticalVelocitdouble y = 0.0;
  double v28 = self->_accuracy;
  double v29 = self->_firstPageOffset.vertical - v14;
  if (v28 == 1.0)
  {
    if (y >= round(v29))
    {
      double v33 = round(v15 + self->_contentSize.height);
      double v35 = round(v13);
LABEL_18:
      if (y <= v33 - v35) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else
  {
    double v30 = floor(v29);
    if (y >= v30 + round(v28 * (v29 - v30)) / v28)
    {
      double v31 = v15 + self->_contentSize.height;
      double v32 = floor(v31);
      double v33 = v32 + round(v28 * (v31 - v32)) / v28;
      double v34 = floor(v13);
      double v35 = v34 + round((v13 - v34) * v28) / v28;
      goto LABEL_18;
    }
  }
  double v9 = -v9;
LABEL_19:
  self->_verticalVelocitdouble y = v9;
LABEL_20:
  [(UIScrollView *)self _startTimer:1];
}

- (CGPoint)_offsetToScrollToForArrowPressType:(int64_t)a3
{
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  [(UIScrollView *)self contentOffset];
  double v10 = v9;
  double v12 = v11;
  double v13 = v6 * 0.5;
  double v14 = v8 * 0.5;
  switch(a3)
  {
    case 0:
      double v12 = v12 - v14;
      break;
    case 1:
      double v12 = v12 + v14;
      break;
    case 2:
      double v10 = v10 - v13;
      break;
    case 3:
      double v10 = v10 + v13;
      break;
    default:
      break;
  }
  [(UIScrollView *)self _maximumContentOffset];
  double v16 = v15;
  [(UIScrollView *)self _minimumContentOffset];
  if (v17 < v10) {
    double v17 = v10;
  }
  if (v16 <= v17) {
    double v18 = v16;
  }
  else {
    double v18 = v17;
  }
  [(UIScrollView *)self _maximumContentOffset];
  double v20 = v19;
  [(UIScrollView *)self _minimumContentOffset];
  if (v21 >= v12) {
    double v22 = v21;
  }
  else {
    double v22 = v12;
  }
  if (v20 <= v22) {
    double v23 = v20;
  }
  else {
    double v23 = v22;
  }
  double v24 = v18;
  result.double y = v23;
  result.double x = v24;
  return result;
}

- (CGPoint)_velocityForAnimatedScrollFromOffset:(CGPoint)a3 toOffset:(CGPoint)a4 duration:(double)a5
{
  double v5 = a5 * 1000.0;
  double v6 = (a4.x - a3.x) / v5;
  double v7 = (a4.y - a3.y) / v5;
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (BOOL)allowsKeyboardScrolling
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *((_DWORD *)&self->_scrollViewFlags + 5) & 3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  double v11 = __39__UIScrollView_allowsKeyboardScrolling__block_invoke;
  double v12 = &unk_1E52DA6B0;
  double v13 = self;
  BOOL v3 = v10;
  BOOL v4 = v3;
  if (v2 == 2)
  {
    BOOL v6 = 1;
  }
  else if (v2 == 1)
  {
    BOOL v6 = 0;
  }
  else
  {
    if (v2)
    {
      if (os_variant_has_internal_diagnostics())
      {
        double v9 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v15 = v2;
          _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Found an invalid tri state of %tu. This is an indication of corrupted memory.", buf, 0xCu);
        }
      }
      else
      {
        double v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UITriStateToBool___s_category_2) + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v15 = v2;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Found an invalid tri state of %tu. This is an indication of corrupted memory.", buf, 0xCu);
        }
      }
      char v5 = v11((uint64_t)v4);
    }
    else
    {
      char v5 = __39__UIScrollView_allowsKeyboardScrolling__block_invoke((uint64_t)v3);
    }
    BOOL v6 = v5;
  }

  return v6;
}

uint64_t __39__UIScrollView_allowsKeyboardScrolling__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v2 = [v1 userInterfaceIdiom];

  uint64_t result = dyld_program_sdk_at_least();
  if (result) {
    return v2 == 6 || (v2 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x800000000000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIScrollView;
    [(UIResponder *)&v4 touchesEnded:a3 withEvent:a4];
  }
}

- (_UIScrollViewScrollingAnimator)_scrollingAnimator
{
  keyboardScrollingAnimator = self->_keyboardScrollingAnimator;
  if (!keyboardScrollingAnimator)
  {
    objc_super v4 = [[_UIScrollViewScrollingAnimator alloc] initWithScrollView:self];
    char v5 = self->_keyboardScrollingAnimator;
    self->_keyboardScrollingAnimator = v4;

    keyboardScrollingAnimator = self->_keyboardScrollingAnimator;
  }
  return keyboardScrollingAnimator;
}

- (BOOL)_allowsKeyboardEventsToScroll
{
  BOOL v3 = [(UIScrollView *)self allowsKeyboardScrolling];
  if (v3)
  {
    if ([(UIScrollView *)self _canScrollX])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(UIScrollView *)self _canScrollY];
    }
  }
  return v3;
}

- (void)_handleKeyboardScrollingPressGesture:(id)a3
{
  id v6 = a3;
  objc_super v4 = -[UIGestureRecognizer _activePressesEvent](v6);
  if (!v4)
  {
    objc_super v4 = [v6 _activeEventOfType:4];
  }
  if ([v6 state] == 1)
  {
    char v5 = [(UIScrollView *)self _scrollingAnimator];
    [v5 handlePressEventIfInterested:v4];
  }
  else
  {
    if ([v6 state] < 3) {
      goto LABEL_8;
    }
    char v5 = [(UIScrollView *)self _scrollingAnimator];
    [v5 finishHandlingPressEvent:v4];
  }

LABEL_8:
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[UIScrollView _platformUsesGestureRecognizersForKeyboardScrolling](self, "_platformUsesGestureRecognizersForKeyboardScrolling")|| !-[UIScrollView _allowsKeyboardEventsToScroll](self, "_allowsKeyboardEventsToScroll")|| (-[UIScrollView _scrollingAnimator](self, "_scrollingAnimator"), double v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 handlePressEventIfInterested:v7], v8, (v9 & 1) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)UIScrollView;
    [(UIResponder *)&v10 pressesBegan:v6 withEvent:v7];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[UIScrollView _platformUsesGestureRecognizersForKeyboardScrolling](self, "_platformUsesGestureRecognizersForKeyboardScrolling")|| !-[UIScrollView _allowsKeyboardEventsToScroll](self, "_allowsKeyboardEventsToScroll")|| (-[UIScrollView _scrollingAnimator](self, "_scrollingAnimator"), double v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 isHandlingPressEvent:v7], v8, (v9 & 1) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)UIScrollView;
    [(UIResponder *)&v10 pressesChanged:v6 withEvent:v7];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[UIScrollView _platformUsesGestureRecognizersForKeyboardScrolling](self, "_platformUsesGestureRecognizersForKeyboardScrolling")|| !-[UIScrollView _allowsKeyboardEventsToScroll](self, "_allowsKeyboardEventsToScroll")|| (-[UIScrollView _scrollingAnimator](self, "_scrollingAnimator"), double v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 finishHandlingPressEvent:v7], v8, (v9 & 1) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)UIScrollView;
    [(UIResponder *)&v10 pressesEnded:v6 withEvent:v7];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[UIScrollView _platformUsesGestureRecognizersForKeyboardScrolling](self, "_platformUsesGestureRecognizersForKeyboardScrolling")|| !-[UIScrollView _allowsKeyboardEventsToScroll](self, "_allowsKeyboardEventsToScroll")|| (-[UIScrollView _scrollingAnimator](self, "_scrollingAnimator"), double v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 finishHandlingPressEvent:v7], v8, (v9 & 1) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)UIScrollView;
    [(UIResponder *)&v10 pressesCancelled:v6 withEvent:v7];
  }
}

- (BOOL)_forwardsTouchesUpResponderChain
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 47) & 1;
}

- (void)_setForwardsTouchesUpResponderChain:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (void)_forcePanGestureToEndImmediately
{
  p_uint64_t scrollViewFlags = &self->_scrollViewFlags;
  if ((*(void *)&self->_scrollViewFlags & 3) == 1
    && [(UIGestureRecognizer *)self->_pan state] == UIGestureRecognizerStateCancelled)
  {
    [(UIScrollView *)self _handlePanFailure];
  }
  *(void *)((char *)p_scrollViewFlags + 12) |= 0x400000000000000uLL;
  [(UIGestureRecognizer *)self->_pan setEnabled:0];
  [(UIGestureRecognizer *)self->_pan setEnabled:1];
  *(void *)((char *)p_scrollViewFlags + 12) &= ~0x400000000000000uLL;
}

- (BOOL)cancelTouchTracking
{
  p_uint64_t scrollViewFlags = &self->_scrollViewFlags;
  if ((*(unsigned char *)&self->_scrollViewFlags & 1) != 0
    && (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x400000000000000) == 0)
  {
    [(UIScrollView *)self _trackingDidEnd];
    *(void *)p_scrollViewFlags &= ~2uLL;
    [(UIScrollView *)self _didEndDirectManipulationWithScrubbingDirection:((unint64_t)*((unsigned int *)p_scrollViewFlags + 5) >> 11) & 0xF];
    *((_DWORD *)p_scrollViewFlags + 5) &= 0xFFFF87FF;
    unint64_t v4 = *(void *)p_scrollViewFlags;
    [(UIScrollView *)self _stopScrollingNotify:1 pin:(v4 >> 23) & 1];
    if (!self->_scrollHeartbeat) {
      [(UIScrollView *)self _popTrackingRunLoopModeIfNecessaryForReason:@"Cancel touch tracking"];
    }
    if ((v4 & 0x800000) != 0) {
      [(UIScrollView *)self _adjustContentOffsetIfNecessary];
    }
    if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)self)
      || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self))
    {
      [(UIScrollView *)self _adjustScrollerIndicators:0 alwaysShowingThem:0];
    }
    [(UIScrollView *)self _updateAccessories];
    if ((v4 & 0x800000) != 0)
    {
      [(UIScrollView *)self contentOffset];
      double v10 = v5;
      double v11 = v6;
      -[UIScrollView _performScrollViewWillEndDraggingInvocationsWithVelocity:targetContentOffset:unclampedOriginalTarget:](self, "_performScrollViewWillEndDraggingInvocationsWithVelocity:targetContentOffset:unclampedOriginalTarget:", &v10, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v5, v6);
      [(UIScrollView *)self contentOffset];
      if (v10 != v8 || v11 != v7) {
        -[UIScrollView setContentOffset:](self, "setContentOffset:", v10, v11, v7);
      }
      [(UIScrollView *)self _scrollViewDidEndDraggingForDelegateWithDeceleration:0];
    }
  }
  return 1;
}

- (BOOL)_touchMayChangeSelection
{
  return ![(UIScrollView *)self isDragging];
}

- (BOOL)_isInterruptingDeceleration
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 51) & 1;
}

- (BOOL)bouncesZoom
{
  return (*(unsigned char *)&self->_scrollViewFlags >> 6) & 1;
}

- (BOOL)canCancelContentTouches
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 2) >> 1) & 1;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
  uint64_t v3 = view;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(UIView *)v3 isEnabled])
  {
    char v4 = 0;
  }
  else
  {
    objc_opt_class();
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }

  return v4 & 1;
}

- (BOOL)scrollsToTop
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x1000) == 0;
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  id v7 = a4;
  BOOL v5 = [(UIScrollView *)self _scrollToTopIfPossible:1];
  double v6 = v7;
  if (v7)
  {
    (*((void (**)(id, BOOL))v7 + 2))(v7, v5);
    double v6 = v7;
  }
}

- (double)_pagingFriction
{
  return self->_pagingFriction;
}

- (void)_setPagingFriction:(double)a3
{
  if (self->_pagingFriction != a3) {
    self->_pagingFriction = a3;
  }
}

- (double)_defaultPagingFriction
{
  [(UIView *)self bounds];
  double result = v2 * 0.00000994318182 + 0.966818182;
  if (v2 > 1024.0) {
    return 0.977;
  }
  return result;
}

- (void)_setPageDecelerationTarget:(CGPoint)a3
{
  self->_pageDecelerationTarget = a3;
}

- (id)_assertionController
{
  assertionController = self->_assertionController;
  if (!assertionController)
  {
    char v4 = [[_UIAssertionController alloc] initWithAssertionSubject:self];
    BOOL v5 = self->_assertionController;
    self->_assertionController = v4;

    assertionController = self->_assertionController;
  }
  return assertionController;
}

- (id)_takeScrollAnimatingAssertionWithReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIScrollView *)self _assertionController];
  double v6 = [v5 vendAssertionOfType:1 initialState:1 reason:v4];

  return v6;
}

- (void)_setRelativePanView:(id)a3
{
}

- (void)_setWantsConstrainedContentSize:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)_wantsConstrainedContentSize
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 41) & 1;
}

- (void)_setAutomaticContentConstraints:(id)a3
{
  id v5 = a3;
  if (dyld_program_sdk_at_least())
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIScrollView.m" lineNumber:8702 description:@"automatic scroll view content size constraints not used on Okemo and later"];
  }
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __48__UIScrollView__setAutomaticContentConstraints___block_invoke;
  double v12 = &unk_1E52D9F98;
  double v13 = self;
  id v14 = v5;
  id v6 = v5;
  if (self)
  {
    id v7 = [(UIView *)self _layoutEngineCreateIfNecessary];
    if (v7) {
      [v7 withAutomaticOptimizationDisabled:&v9];
    }
    else {
      v11((uint64_t)&v9);
    }
  }
}

void __48__UIScrollView__setAutomaticContentConstraints___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 1888);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        -[UIView _layoutEngine_willRemoveLayoutConstraint:](*(void **)(a1 + 32), *(void **)(*((void *)&v19 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  uint64_t v7 = [*(id *)(a1 + 40) copy];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 1888);
  *(void *)(v8 + 1888) = v7;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *(id *)(*(void *)(a1 + 32) + 1888);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[UIView _layoutEngine_didAddLayoutConstraint:roundingAdjustment:mutuallyExclusiveConstraints:](*(void **)(a1 + 32), *(void **)(*((void *)&v15 + 1) + 8 * v14++), 0, 0.0);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

id __53__UIScrollView__layoutGuideOfType_createIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 leftAnchor];
  uint64_t v5 = [*(id *)(a1 + 32) leftAnchor];
  uint64_t v6 = [v4 constraintEqualToAnchor:v5];

  uint64_t v7 = [v3 topAnchor];

  uint64_t v8 = [*(id *)(a1 + 32) topAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];

  id v10 = [*(id *)(a1 + 40) stringByAppendingString:@"-minX"];
  [v6 setIdentifier:v10];

  uint64_t v11 = [*(id *)(a1 + 40) stringByAppendingString:@"-minY"];
  [v9 setIdentifier:v11];

  v14[0] = v6;
  v14[1] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  return v12;
}

- (UILayoutGuide)contentLayoutGuide
{
  return (UILayoutGuide *)[(UIScrollView *)self _layoutGuideOfType:0 createIfNecessary:1];
}

- (UILayoutGuide)frameLayoutGuide
{
  return (UILayoutGuide *)[(UIScrollView *)self _layoutGuideOfType:1 createIfNecessary:1];
}

- (void)_setContentMarginsGuide:(id)a3
{
}

- (id)nsli_layoutMarginsItem
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(UIScrollView *)self _contentMarginsGuideIfExists];
  if (!v3)
  {
    id v3 = objc_alloc_init(UILayoutGuide);
    [(UILayoutGuide *)v3 setIdentifier:@"UIScrollViewContentMarginsGuide"];
    [(UIView *)self addLayoutGuide:v3];
    [(UILayoutGuide *)v3 _setLockedToOwningView:1];
    [(UILayoutGuide *)v3 _setAllowsNegativeDimensions:1];
    [(UIView *)self layoutMargins];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [(UIScrollView *)self contentLayoutGuide];
    uint64_t v13 = [(UILayoutGuide *)v3 topAnchor];
    uint64_t v14 = [v12 topAnchor];
    long long v15 = [v13 constraintEqualToAnchor:v14 constant:v5];

    [v15 setIdentifier:@"UIScrollView-content-margins-top"];
    long long v16 = [(UILayoutGuide *)v3 leftAnchor];
    long long v17 = [v12 leftAnchor];
    long long v18 = [v16 constraintEqualToAnchor:v17 constant:v7];

    [v18 setIdentifier:@"UIScrollView-content-margins-left"];
    long long v19 = [v12 bottomAnchor];
    long long v20 = [(UILayoutGuide *)v3 bottomAnchor];
    long long v21 = [v19 constraintEqualToAnchor:v20 constant:v9];

    [v21 setIdentifier:@"UIScrollView-content-margins-bottom"];
    long long v22 = [v12 rightAnchor];
    double v23 = [(UILayoutGuide *)v3 rightAnchor];
    double v24 = [v22 constraintEqualToAnchor:v23 constant:v11];

    [v24 setIdentifier:@"UIScrollView-content-margins-right"];
    v29[0] = v15;
    v29[1] = v18;
    v29[2] = v21;
    v29[3] = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    [(UILayoutGuide *)v3 _setSystemConstraints:v25];

    double v26 = (void *)MEMORY[0x1E4F5B268];
    BOOL v27 = [(UILayoutGuide *)v3 _systemConstraints];
    [v26 activateConstraints:v27];

    [(UIScrollView *)self _setContentMarginsGuide:v3];
  }
  return v3;
}

- (CGSize)_nsis_contentSize
{
  [(UIView *)self nsli_engineToUserScalingCoefficients];
  double v4 = v3;
  double v6 = v5;
  [(UIView *)self _currentScreenScale];
  double v8 = v7;
  double v9 = [(UIView *)self _layoutEngineCreateIfNecessary];
  double v10 = [(UIScrollView *)self _contentWidthVariable];
  [v9 valueForVariable:v10];
  double v12 = v11;
  uint64_t v13 = [(UIScrollView *)self _contentHeightVariable];
  [v9 valueForVariable:v13];
  double v15 = v14;

  long long v16 = [(UIScrollView *)self _getDelegateZoomView];
  if (v16)
  {
    long long v17 = [v9 delegate];
    if ((dyld_program_sdk_at_least() & 1) != 0
      || (double v18 = 1.0, v17) && [v17 _forceLayoutEngineSolutionInRationalEdges])
    {
      [v16 transform];
      double v18 = v21;
    }
  }
  else
  {
    double v18 = 1.0;
  }

  double v19 = round(v8 * v4 * round(v12)) * v18 / v8;
  double v20 = round(v8 * v6 * round(v15)) * v18 / v8;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (id)_layoutVariablesWithAmbiguousValue
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)UIScrollView;
  double v3 = [(UIView *)&v19 _layoutVariablesWithAmbiguousValue];
  if ((*(void *)&self->super._viewFlags & 0x800000000000000) != 0
    && (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20000000000) != 0)
  {
    double v4 = [(UIView *)self _layoutEngine];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v5 = [(UIScrollView *)self nsli_contentWidthVariable];
    v20[0] = v5;
    double v6 = [(UIScrollView *)self nsli_contentHeightVariable];
    v20[1] = v6;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ([v4 valueOfVariableIsAmbiguous:v12])
          {
            uint64_t v13 = [v3 arrayByAddingObject:v12];

            double v3 = (void *)v13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v9);
    }
  }
  return v3;
}

- (BOOL)_evaluateWantsConstrainedContentSize
{
  if ((*(void *)&self->super._viewFlags & 0x800000000000000) != 0
    && (*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20000000000) == 0)
  {
    double v3 = [(UIScrollView *)self _contentWidthVariable];
    if (v3)
    {

      goto LABEL_6;
    }
    double v4 = [(UIScrollView *)self _contentHeightVariable];

    if (v4)
    {
LABEL_6:
      double v5 = [(UIView *)self _layoutEngine];
      double v6 = [(UIScrollView *)self nsli_contentWidthVariable];
      if ([v5 hasValue:0 forVariable:v6])
      {
      }
      else
      {
        double v7 = [(UIScrollView *)self nsli_contentHeightVariable];
        int v8 = [v5 hasValue:0 forVariable:v7];

        if (!v8)
        {
LABEL_10:

          return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 41) & 1;
        }
      }
      [(UIScrollView *)self _setWantsConstrainedContentSize:1];
      goto LABEL_10;
    }
  }
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 41) & 1;
}

- (id)_zoomFeedbackGenerator
{
  return self->_zoomFeedbackGenerator;
}

- (void)_activateZoomFeedback
{
  zoomFeedbackGenerator = self->_zoomFeedbackGenerator;
  if (zoomFeedbackGenerator)
  {
    [(_UIZoomEdgeFeedbackGenerator *)zoomFeedbackGenerator setMinimumZoomScale:self->_minimumZoomScale];
    [(_UIZoomEdgeFeedbackGenerator *)self->_zoomFeedbackGenerator setMaximumZoomScale:self->_maximumZoomScale];
    [(UIScrollView *)self _zoomRubberBandScaleForScale:0.0];
    -[_UIZoomEdgeFeedbackGenerator setMinimumTemporaryZoomScale:](self->_zoomFeedbackGenerator, "setMinimumTemporaryZoomScale:");
    [(UIScrollView *)self _zoomRubberBandScaleForScale:INFINITY];
    -[_UIZoomEdgeFeedbackGenerator setMaximumTemporaryZoomScale:](self->_zoomFeedbackGenerator, "setMaximumTemporaryZoomScale:");
    double v4 = self->_zoomFeedbackGenerator;
    [(_UIEdgeFeedbackGenerator *)v4 userInteractionStarted];
  }
}

- (void)_zoomToCenter:(CGPoint)a3 scale:(double)a4 duration:(double)a5
{
}

- (void)_zoomToCenter:(CGPoint)a3 scale:(double)a4 duration:(double)a5 force:(BOOL)a6
{
}

- (double)_zoomRubberBandScaleForScale:(double)result
{
  double maximumZoomScale = self->_maximumZoomScale;
  if (maximumZoomScale >= result)
  {
    double maximumZoomScale = self->_minimumZoomScale;
    if (maximumZoomScale <= result) {
      return result;
    }
    double v4 = 1.0 / (2.0 - result / maximumZoomScale);
  }
  else
  {
    double v4 = -1.0 / (result / maximumZoomScale) + 2.0;
  }
  return maximumZoomScale * v4;
}

- (double)_zoomScaleForRubberBandScale:(double)result
{
  double maximumZoomScale = self->_maximumZoomScale;
  if (maximumZoomScale >= result)
  {
    double maximumZoomScale = self->_minimumZoomScale;
    if (maximumZoomScale <= result) {
      return result;
    }
    double v4 = -1.0 / (result / maximumZoomScale);
    double v5 = 2.0;
  }
  else
  {
    double v4 = (result / maximumZoomScale + -1.0) / (2.0 - result / maximumZoomScale);
    double v5 = 1.0;
  }
  return maximumZoomScale * (v4 + v5);
}

- (void)_markScrollViewAnimationForKey:(id)a3 ofView:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  double v7 = [v6 layer];
  int v8 = [v7 animationForKey:v11];

  if (v8)
  {
    uint64_t v9 = [v6 layer];
    uint64_t v10 = [v9 animationForKey:v11];
    objc_setAssociatedObject(v10, &__animatingScrollViewKey, self, 0);
  }
}

- (BOOL)_ownsAnimationForKey:(id)a3 ofView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 layer];
  uint64_t v9 = [v8 animationForKey:v6];

  if (v9)
  {
    uint64_t v10 = [v7 layer];
    id v11 = [v10 animationForKey:v6];
    objc_getAssociatedObject(v11, &__animatingScrollViewKey);
    uint64_t v12 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = v12 == self;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (float)_zoomAnimationDurationForScale:(double)a3
{
  [(UIScrollView *)self zoomScale];
  double v5 = log(v4);
  return fmin(vabdd_f64(v5, log(a3)) * 0.3 + 0.1, 0.4);
}

- (void)_zoomAnimationDidStop
{
  unint64_t zoomAnimationCount = self->_zoomAnimationCount;
  if (zoomAnimationCount) {
    self->_unint64_t zoomAnimationCount = zoomAnimationCount - 1;
  }
  id zoomAnimation = self->_zoomAnimation;
  self->_id zoomAnimation = 0;

  zoomAnimationState = self->_zoomAnimationState;
  self->_zoomAnimationState = 0;

  [(UIScrollView *)self zoomScale];
  double v7 = v6;
  if (v6 >= self->_minimumZoomScale && v6 <= self->_maximumZoomScale)
  {
    if (!self->_zoomAnimationCount)
    {
      *(void *)&self->_scrollViewFlags &= 0xFFFFFFFF7FFFFF7FLL;
      [(UIScrollView *)self _scrollViewDidEndZooming];
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v10 = [(UIScrollView *)self _getDelegateZoomView];
        [WeakRetained scrollViewDidEndZooming:self withView:v10 atScale:v7];
      }
      if (self->_shadows) {
        [(UIScrollView *)self _adjustBackgroundShadowsForContentSizeForcedVisible:0];
      }
    }
  }
  else
  {
    -[UIScrollView setZoomScale:animated:](self, "setZoomScale:animated:", 1);
  }
  zoomFeedbackGenerator = self->_zoomFeedbackGenerator;
  [(_UIEdgeFeedbackGenerator *)zoomFeedbackGenerator _animationEnded];
}

- (void)setZoomScale:(double)a3 withAnchorPoint:(CGPoint)a4 allowRubberbanding:(BOOL)a5 animated:(BOOL)a6 duration:(double)a7 notifyDelegate:(BOOL)a8
{
}

void __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(double *)(a1 + 40);
  if (v7 == -1.0)
  {
    [*(id *)(a1 + 32) _zoomAnimationDurationForScale:*(double *)(a1 + 48)];
    double v7 = v8;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_2;
  v10[3] = &unk_1E52DA040;
  id v11 = v5;
  id v9 = v5;
  +[UIView animateWithDuration:4 delay:v10 options:v6 animations:v7 completion:0.0];
}

uint64_t __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048624, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

- (void)zoomToRect:(CGRect)rect animated:(BOOL)animated
{
  BOOL v4 = animated;
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  uint64_t v10 = [(UIScrollView *)self _getDelegateZoomView];
  if (v10)
  {
    id v61 = v10;
    [(UIView *)self bounds];
    double v13 = v11;
    double v14 = v12;
    if (height * (v11 / width) <= v12) {
      double v15 = v11 / width;
    }
    else {
      double v15 = v12 / height;
    }
    if (v15 != 0.0)
    {
      [(UIScrollView *)self _clampedZoomScale:0 allowRubberbanding:v15];
      double v15 = v16;
    }
    [(UIScrollView *)self zoomScale];
    double v18 = v17;
    double v19 = x + width * 0.5;
    double v20 = y + height * 0.5;
    if (v15 == v18)
    {
      double v60 = v13;
      objc_msgSend(v61, "convertPoint:toView:", self, v19, v20);
      double v22 = v21;
      double v24 = v23;
      [(UIScrollView *)self _effectiveContentInset];
      double v26 = v25;
      double v28 = v27;
      double v59 = v29;
      double v31 = v30;
      [(UIView *)self bounds];
      double v33 = v22 - v32 * 0.5;
      [(UIView *)self bounds];
      double v35 = v24 - v34 * 0.5;
      accuracdouble y = self->_accuracy;
      double v37 = self->_firstPageOffset.horizontal - v28;
      if (accuracy == 1.0)
      {
        double v51 = round(v37);
        if (v33 >= v51) {
          double v51 = v33;
        }
        double v52 = round(v31 + self->_contentSize.width) - v60;
        if (v51 >= v52) {
          double v44 = v52;
        }
        else {
          double v44 = v51;
        }
        double v53 = round(self->_firstPageOffset.vertical - v26);
        if (v35 < v53) {
          double v35 = v53;
        }
        double v49 = round(v59 + self->_contentSize.height);
      }
      else
      {
        double v38 = floor(v37);
        double v39 = v38 + round(accuracy * (v37 - v38)) / accuracy;
        if (v33 >= v39) {
          double v39 = v33;
        }
        double v40 = self->_contentSize.height;
        double v41 = v31 + self->_contentSize.width;
        double v42 = floor(v41);
        double v43 = v42 + round(accuracy * (v41 - v42)) / accuracy - v60;
        if (v39 >= v43) {
          double v44 = v43;
        }
        else {
          double v44 = v39;
        }
        double v45 = self->_firstPageOffset.vertical - v26;
        double v46 = floor(v45);
        double v47 = v46 + round(accuracy * (v45 - v46)) / accuracy;
        if (v35 < v47) {
          double v35 = v47;
        }
        double v48 = floor(v59 + v40);
        double v49 = v48 + round(accuracy * (v59 + v40 - v48)) / accuracy;
      }
      double v54 = v49 - v14;
      if (v35 >= v54) {
        double v55 = v54;
      }
      else {
        double v55 = v35;
      }
      if (v4 || (dyld_program_sdk_at_least() & 1) == 0)
      {
        [(UIScrollView *)self _contentOffsetAnimationDuration];
        double v57 = v56;
        [(UIScrollView *)self _zoomAnimationDurationForScale:v15];
        [(UIScrollView *)self _setContentOffsetAnimationDuration:v58];
        -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v44, v55);
        [(UIScrollView *)self _setContentOffsetAnimationDuration:v57];
      }
      else
      {
        -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v44, v55);
      }
    }
    else
    {
      double v50 = -1.0;
      if (!v4) {
        double v50 = 0.0;
      }
      -[UIScrollView _zoomToCenterInternal:scale:duration:allowRubberbanding:force:](self, "_zoomToCenterInternal:scale:duration:allowRubberbanding:force:", 0, 0, v19, v20, v15, v50);
    }
    uint64_t v10 = v61;
  }
}

- (BOOL)_getPagingDecelerationOffset:(CGPoint *)a3 forTimeInterval:(double)a4
{
  [(UIScrollView *)self contentOffset];
  double v9 = v7;
  double v10 = v8;
  if (a4 <= 0.0)
  {
    BOOL v13 = 0;
    a3->double x = v7;
    a3->double y = v8;
    goto LABEL_98;
  }
  p_uint64_t scrollViewFlags = &self->_scrollViewFlags;
  uint64_t v12 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if ((v12 & 0x40) != 0 && a3->x >= self->_pageDecelerationTarget.x)
  {
    BOOL v14 = 1;
LABEL_10:
    BOOL v70 = v14;
    if ((v12 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((v12 & 0x80) != 0)
  {
    BOOL v14 = a3->x <= self->_pageDecelerationTarget.x;
    goto LABEL_10;
  }
  BOOL v70 = 0;
  if ((v12 & 0x100) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  if (a3->y >= self->_pageDecelerationTarget.y)
  {
    BOOL v15 = 1;
    goto LABEL_16;
  }
LABEL_12:
  if ((v12 & 0x200) == 0)
  {
    BOOL v69 = 0;
    goto LABEL_17;
  }
  BOOL v15 = a3->y <= self->_pageDecelerationTarget.y;
LABEL_16:
  BOOL v69 = v15;
LABEL_17:
  uint64_t v16 = (uint64_t)a4;
  if ((uint64_t)a4 < 1)
  {
    double v21 = 0.0;
    double v18 = 0.0;
    double v17 = v7;
  }
  else
  {
    double v17 = v7;
    do
    {
      double v18 = self->_pageDecelerationTarget.x - v17;
      double v19 = self->_horizontalVelocity + v18 * self->_pagingSpringPull;
      self->_horizontalVelocitdouble y = v19;
      double v20 = v19 * self->_pagingFriction;
      self->_horizontalVelocitdouble y = v20;
      double v21 = self->_pageDecelerationTarget.y - v8;
      double v22 = self->_verticalVelocity + v21 * self->_pagingSpringPull;
      self->_verticalVelocitdouble y = v22;
      double v17 = v17 + v20;
      double v23 = self->_pagingFriction * v22;
      self->_verticalVelocitdouble y = v23;
      double v8 = v8 + v23;
      --v16;
    }
    while (v16);
  }
  accuracdouble y = self->_accuracy;
  if (accuracy == 1.0)
  {
    double v26 = round(v17);
    double v28 = round(v8);
  }
  else
  {
    double v25 = floor(v17);
    double v26 = v25 + round((v17 - v25) * accuracy) / accuracy;
    double v27 = floor(v8);
    double v28 = v27 + round((v8 - v27) * accuracy) / accuracy;
  }
  p_pageDecelerationTarget = &self->_pageDecelerationTarget;
  BOOL v30 = v26 != self->_pageDecelerationTarget.x && v9 == v26;
  if (v30 && self->_horizontalVelocity < 0.5)
  {
    double v31 = -1.0;
    if (v18 < 0.0) {
      double v31 = 1.0;
    }
    double v32 = v26 - v31 / accuracy;
    if (accuracy == 1.0)
    {
      double v9 = round(v32);
    }
    else
    {
      double v33 = floor(v32);
      double v9 = v33 + round(accuracy * (v32 - v33)) / accuracy;
    }
  }
  else
  {
    double v9 = v26;
  }
  BOOL v34 = v28 != self->_pageDecelerationTarget.y && v10 == v28;
  if (v34 && self->_verticalVelocity < 0.5)
  {
    double v35 = -1.0;
    if (v21 < 0.0) {
      double v35 = 1.0;
    }
    double v36 = v28 - v35 / accuracy;
    if (accuracy == 1.0)
    {
      double v10 = round(v36);
    }
    else
    {
      double v37 = floor(v36);
      double v10 = v37 + round(accuracy * (v36 - v37)) / accuracy;
    }
  }
  else
  {
    double v10 = v28;
  }
  a3->double x = v9;
  a3->double y = v10;
  uint64_t v77 = 0;
  double v78 = &v77;
  uint64_t v79 = 0x2020000000;
  char v80 = 0;
  uint64_t v73 = 0;
  double v74 = &v73;
  uint64_t v75 = 0x2020000000;
  char v76 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__UIScrollView__getPagingDecelerationOffset_forTimeInterval___block_invoke;
  aBlock[3] = &unk_1E52F0790;
  void aBlock[5] = &v77;
  aBlock[6] = a3;
  aBlock[4] = self;
  double v38 = (void (**)(void))_Block_copy(aBlock);
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __61__UIScrollView__getPagingDecelerationOffset_forTimeInterval___block_invoke_2;
  v71[3] = &unk_1E52F0790;
  v71[5] = &v73;
  v71[6] = a3;
  v71[4] = self;
  double v39 = (void (**)(void))_Block_copy(v71);
  if (fabs(self->_horizontalVelocity) < 0.01 && fabs(v18) <= 1.0 && vabdd_f64(v9, p_pageDecelerationTarget->x) < 5.0) {
    v38[2](v38);
  }
  if (fabs(self->_verticalVelocity) < 0.01 && fabs(v21) <= 1.0 && vabdd_f64(v10, self->_pageDecelerationTarget.y) < 5.0) {
    v39[2](v39);
  }
  [(UIScrollView *)self _effectiveContentInset];
  double v43 = v42;
  double v45 = v44;
  if (*((unsigned char *)v78 + 24) || (*(unsigned char *)p_scrollViewFlags & 8) != 0) {
    goto LABEL_66;
  }
  double v46 = self->_accuracy;
  double v47 = self->_firstPageOffset.horizontal - v40;
  if (v46 != 1.0)
  {
    double v48 = floor(v47);
    if (v9 >= v48 + round(v46 * (v47 - v48)) / v46)
    {
      double v49 = v41 + self->_contentSize.width;
      double v50 = floor(v49);
      double v51 = v50 + round(v46 * (v49 - v50)) / v46;
      goto LABEL_64;
    }
LABEL_65:
    v38[2](v38);
    goto LABEL_66;
  }
  if (v9 < round(v47)) {
    goto LABEL_65;
  }
  double v51 = round(v41 + self->_contentSize.width);
LABEL_64:
  [(UIView *)self bounds];
  if (v9 > v51 - v52) {
    goto LABEL_65;
  }
LABEL_66:
  if (*((unsigned char *)v74 + 24) || (*(unsigned char *)p_scrollViewFlags & 4) != 0) {
    goto LABEL_75;
  }
  double v53 = self->_accuracy;
  double v54 = self->_firstPageOffset.vertical - v43;
  if (v53 != 1.0)
  {
    double v55 = floor(v54);
    if (v10 >= v55 + round(v53 * (v54 - v55)) / v53)
    {
      double v56 = v45 + self->_contentSize.height;
      double v57 = floor(v56);
      double v58 = v57 + round(v53 * (v56 - v57)) / v53;
      goto LABEL_73;
    }
LABEL_74:
    v39[2](v39);
    goto LABEL_75;
  }
  if (v10 < round(v54)) {
    goto LABEL_74;
  }
  double v58 = round(v45 + self->_contentSize.height);
LABEL_73:
  [(UIView *)self bounds];
  if (v10 > v58 - v59) {
    goto LABEL_74;
  }
LABEL_75:
  uint64_t v60 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if ((v60 & 0x40) != 0 && a3->x >= p_pageDecelerationTarget->x)
  {
    BOOL v61 = 1;
    if ((v60 & 0x100) == 0) {
      goto LABEL_84;
    }
  }
  else if ((v60 & 0x80) != 0)
  {
    BOOL v61 = a3->x <= p_pageDecelerationTarget->x;
    if ((v60 & 0x100) == 0)
    {
LABEL_84:
      BOOL v62 = (v60 & 0x200) != 0 && a3->y <= self->_pageDecelerationTarget.y;
      goto LABEL_88;
    }
  }
  else
  {
    BOOL v61 = 0;
    if ((v60 & 0x100) == 0) {
      goto LABEL_84;
    }
  }
  if (a3->y < self->_pageDecelerationTarget.y) {
    goto LABEL_84;
  }
  BOOL v62 = 1;
LABEL_88:
  if (v70 && !v61 && fabs(self->_horizontalVelocity) < 0.1) {
    v38[2](v38);
  }
  if (v69 && !v62 && fabs(self->_verticalVelocity) < 0.1) {
    v39[2](v39);
  }
  if (*((unsigned char *)v78 + 24)) {
    BOOL v13 = *((unsigned char *)v74 + 24) != 0;
  }
  else {
    BOOL v13 = 0;
  }

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
LABEL_98:
  double v63 = &self->_scrollViewFlags;
  uint64_t v64 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if ((v64 & 0x100) != 0 && v10 < self->_pageDecelerationTarget.y)
  {
    uint64_t v65 = 16;
  }
  else if ((v64 & 0x200) != 0)
  {
    uint64_t v65 = 16 * (v10 > self->_pageDecelerationTarget.y);
  }
  else
  {
    uint64_t v65 = 0;
  }
  unint64_t v66 = *(void *)v63 & 0xFFFFFFFFFFFFFFEFLL | v65;
  *(void *)double v63 = v66;
  if ((v64 & 0x40) != 0 && v9 < self->_pageDecelerationTarget.x)
  {
    uint64_t v67 = 32;
  }
  else if ((v64 & 0x80) != 0)
  {
    uint64_t v67 = 32 * (v9 > self->_pageDecelerationTarget.x);
  }
  else
  {
    uint64_t v67 = 0;
  }
  *(void *)double v63 = v67 | v66 & 0xFFFFFFFFFFFFFFDFLL;
  return v13;
}

double __61__UIScrollView__getPagingDecelerationOffset_forTimeInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 840);
  **(double **)(a1 + 48) = result;
  *(void *)(*(void *)(a1 + 32) + 1772) &= ~0x40uLL;
  *(void *)(*(void *)(a1 + 32) + 1772) &= ~0x80uLL;
  *(void *)(*(void *)(a1 + 32) + 736) = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

double __61__UIScrollView__getPagingDecelerationOffset_forTimeInterval___block_invoke_2(void *a1)
{
  double result = *(double *)(a1[4] + 848);
  *(double *)(a1[6] + 8) = result;
  *(void *)(a1[4] + 1772) &= ~0x100uLL;
  *(void *)(a1[4] + 1772) &= ~0x200uLL;
  *(void *)(a1[4] + 744) = 0;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  return result;
}

- (CGPoint)_pageDecelerationTarget
{
  double x = self->_pageDecelerationTarget.x;
  double y = self->_pageDecelerationTarget.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)_getBouncingDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 lastUpdateOffset:(double)a5 min:(double)a6 max:(double)a7 decelerationFactor:(double)a8 decelerationLnFactor:(double)a9 velocity:(double *)a10
{
  if (a6 >= a7) {
    double v10 = a6;
  }
  else {
    double v10 = a7;
  }
  if (!a10) {
    return 0;
  }
  if (a5 < a6 || v10 < a5)
  {
    double v20 = a4;
  }
  else
  {
    double v21 = *a10;
    if (*a10 == 0.0) {
      goto LABEL_47;
    }
    double v22 = a4 * a9;
    if (a4 * a9 >= -0.5) {
      double v23 = v22 * (v22 * 0.5 + 1.0) + 1.0;
    }
    else {
      double v23 = exp(v22);
    }
    double v24 = (1.0 - v23) / (1.0 - a8) * a8;
    double v25 = *a3 + self->_fastScrollMultiplier * (v21 * v24);
    *a3 = v25;
    double v20 = 0.0;
    BOOL v26 = v25 < a6 || v25 > v10;
    double v27 = a4;
    if (v26)
    {
      if (v25 >= a6)
      {
        double v28 = (v10 - a5) * a4;
        double v29 = v25 - a5;
      }
      else
      {
        double v28 = (a5 - a6) * a4;
        double v29 = a5 - v25;
      }
      double v27 = v28 / v29;
      double v20 = a4 - v27;
    }
    if (v27 > 0.0)
    {
      if (v27 != a4)
      {
        double v30 = v27 * a9;
        if (v27 * a9 >= -0.5) {
          double v23 = v30 * (v30 * 0.5 + 1.0) + 1.0;
        }
        else {
          double v23 = exp(v30);
        }
        double v24 = (1.0 - v23) / (1.0 - a8) * a8;
      }
      *a3 = v24 * *a10 * self->_fastScrollMultiplier + a5;
      *a10 = v23 * *a10;
    }
  }
  if (v20 > 0.0)
  {
    double v31 = v20 * a9;
    if (v20 * a9 >= -0.5) {
      double v32 = v31 * (v31 * 0.5 + 1.0) + 1.0;
    }
    else {
      double v32 = exp(v31);
    }
    double v33 = v20 * -0.01005;
    if (v20 * -0.01005 >= -0.5) {
      double v34 = v33 * (v33 * 0.5 + 1.0) + 1.0;
    }
    else {
      double v34 = exp(v33);
    }
    if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x40000) != 0)
    {
      *a10 = fmax(fmin(*a10, 3.0), -3.0);
      *((_DWORD *)&self->_scrollViewFlags + 5) &= ~0x40000u;
    }
    if (*a3 >= a6) {
      double v35 = v34 * (*a3 - v10);
    }
    else {
      double v35 = a6;
    }
    if (*a3 >= a6) {
      double v36 = v10;
    }
    else {
      double v36 = v34 * (*a3 - a6);
    }
    double v37 = v36 + v35;
    *a3 = v37;
    *a3 = v37 + (1.0 - v32) * (v34 * a8 * *a10) / (1.0 - a8);
    *a10 = v32 * v34 * *a10;
    self->_int64_t fastScrollCount = 0;
    self->_double fastScrollMultiplier = 1.0;
    [(UIScrollView *)self _resetDiscreteFastScroll];
  }
LABEL_47:
  double v38 = *a3;
  double v39 = v10 + 0.5;
  BOOL v40 = v10 > 0.0 || v38 < v39;
  if (!v40
    && ((accuracdouble y = self->_accuracy, accuracy == 1.0)
      ? (double v43 = round(v38))
      : (v42 = floor(v38), double v43 = v42 + round((v38 - v42) * accuracy) / accuracy),
        v43 != 0.0)
    || (v38 > a6 + -0.5 ? (BOOL v44 = v38 < v39) : (BOOL v44 = 0), !v44))
  {
    self->_int64_t fastScrollCount = 0;
    self->_double fastScrollMultiplier = 1.0;
    [(UIScrollView *)self _resetDiscreteFastScroll];
    return 1;
  }
  return 0;
}

- (void)_getStandardDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 min:(double)a5 max:(double)a6 decelerationFactor:(double)a7 decelerationLnFactor:(double)a8 velocity:(double *)a9
{
  double v11 = a5;
  if (a5 >= a6) {
    double v14 = a5;
  }
  else {
    double v14 = a6;
  }
  double v15 = a4 * a8;
  if (v15 >= -0.5) {
    double v16 = v15 * (v15 * 0.5 + 1.0) + 1.0;
  }
  else {
    double v16 = exp(v15);
  }
  *a3 = *a3 + self->_fastScrollMultiplier * (*a9 * ((1.0 - v16) / (1.0 - a7) * a7));
  *a9 = v16 * *a9;
  if (*a3 < v11 || (double v11 = v14, *a3 > v14))
  {
    *a3 = v11;
    *a9 = 0.0;
  }
}

- (BOOL)_smoothScrollApplyPendingAsyncCompletionResultWithUpdateTime:(uint64_t)a1 outFinishedDecelerating:(unsigned char *)a2
{
  if (!a1) {
    return 0;
  }
  if (a2) {
    *a2 = 0;
  }
  BOOL v4 = (id *)*(id *)(a1 + 1816);
  CAFrameRateRange v5 = v4;
  BOOL v6 = v4 != 0;
  if (v4)
  {
    id v7 = v4[5];
    double v8 = [v7 firstObject];
    if (v8)
    {
      [v7 removeObjectAtIndex:0];
      int v9 = [v8 finishedDecelerating];
      if (v9)
      {
        double v10 = *(void **)(a1 + 1816);
        *(void *)(a1 + 1816) = 0;

        if (a2) {
          *a2 = 1;
        }
      }
      int v11 = [v8 handled];
      [v8 updateTime];
      if (v11)
      {
        *(void *)(a1 + 648) = v12;
        if (v9) {
          [(id)a1 _stopScrollingNotify:1 pin:1];
        }
      }
      else
      {
        objc_msgSend((id)a1, "_smoothScrollSyncWithUpdateTime:");
      }
    }
  }
  return v6;
}

- (void)_smoothScrollWithUpdateTime:(double)a3
{
  if ((*(unsigned char *)&self->_scrollViewFlags & 1) == 0)
  {
    CAFrameRateRange v5 = (void *)MEMORY[0x18C108260]();
    char v7 = 0;
    BOOL v6 = -[UIScrollView _smoothScrollApplyPendingAsyncCompletionResultWithUpdateTime:outFinishedDecelerating:]((uint64_t)self, &v7);
    if (!v7)
    {
      if (v6) {
        [(UIScrollView *)self _smoothScrollAsyncWithUpdateTime:self->_asyncScrollDecelerationState state:a3];
      }
      else {
        [(UIScrollView *)self _smoothScrollSyncWithUpdateTime:a3];
      }
    }
  }
}

- (void)_smoothScrollAsyncWithUpdateTime:(double)a3 state:(id)a4
{
  char v7 = (char *)a4;
  if (!v7)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"UIScrollView.m" lineNumber:10033 description:@"Must have async scroll event state"];
  }
  double v8 = *((double *)v7 + 1);
  *((double *)v7 + 1) = a3;
  if ((a3 - v8) * 1000.0 >= 1.0 && !v7[48])
  {
    long long v29 = *MEMORY[0x1E4F1DAD8];
    double width = self->_adjustedDecelerationFactor.width;
    if (width == 0.0) {
      double width = self->_decelerationFactor.width;
    }
    [(UIScrollView *)self _getStandardDecelerationOffset:&v29 forTimeInterval:v7 + 24 min:(a3 - v8) * 1000.0 max:-1.79769313e308 decelerationFactor:1.79769313e308 decelerationLnFactor:width velocity:self->_decelerationLnFactorH];
    double height = self->_adjustedDecelerationFactor.height;
    if (height == 0.0) {
      double height = self->_decelerationFactor.height;
    }
    [(UIScrollView *)self _getStandardDecelerationOffset:(char *)&v29 + 8 forTimeInterval:v7 + 32 min:(a3 - v8) * 1000.0 max:-1.79769313e308 decelerationFactor:1.79769313e308 decelerationLnFactor:height velocity:self->_decelerationLnFactorV];
    double v11 = hypot(*((long double *)v7 + 3), *((long double *)v7 + 4));
    uint64_t v12 = (void *)[*((id *)v7 + 2) _cloneEvent];
    objc_msgSend(v12, "_simulateMomentumWithDelta:inView:", self, -*(double *)&v29, -*((double *)&v29 + 1));
    if (v11 < 0.01) {
      v7[48] = 1;
    }
    BOOL v13 = (void *)*((void *)v7 + 5);
    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v15 = (void *)*((void *)v7 + 5);
      *((void *)v7 + 5) = v14;

      BOOL v13 = (void *)*((void *)v7 + 5);
    }
    id v16 = v13;
    uint64_t v25 = 0;
    BOOL v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __55__UIScrollView__smoothScrollAsyncWithUpdateTime_state___block_invoke;
    v19[3] = &unk_1E530F608;
    double v22 = v8;
    double v23 = a3;
    BOOL v24 = v11 < 0.01;
    id v17 = v16;
    id v20 = v17;
    double v21 = &v25;
    [(UIScrollView *)self _asynchronouslyDeliverScrollEvent:v12 completion:v19];
    if (*((unsigned char *)v26 + 24)) {
      -[UIScrollView _smoothScrollApplyPendingAsyncCompletionResultWithUpdateTime:outFinishedDecelerating:]((uint64_t)self, 0);
    }

    _Block_object_dispose(&v25, 8);
  }
}

void __55__UIScrollView__smoothScrollAsyncWithUpdateTime_state___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = objc_alloc_init(_UIScrollViewAsyncScrollEventCompletionResult);
  [(_UIScrollViewAsyncScrollEventCompletionResult *)v4 setHandled:a2];
  [(_UIScrollViewAsyncScrollEventCompletionResult *)v4 setLastUpdateTime:*(double *)(a1 + 48)];
  [(_UIScrollViewAsyncScrollEventCompletionResult *)v4 setUpdateTime:*(double *)(a1 + 56)];
  [(_UIScrollViewAsyncScrollEventCompletionResult *)v4 setFinishedDecelerating:*(unsigned __int8 *)(a1 + 64)];
  [*(id *)(a1 + 32) addObject:v4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (void)_smoothScrollSyncWithUpdateTime:(double)a3
{
  double v5 = (a3 - self->_lastUpdateTime) * 1000.0;
  CGPoint lastSetContentOffsetUnrounded = self->_lastSetContentOffsetUnrounded;
  if (v5 < 1.0) {
    goto LABEL_106;
  }
  CGPoint v103 = self->_lastSetContentOffsetUnrounded;
  [(UIScrollView *)self _revealableContentPadding];
  double v102 = v7;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(UIView *)self bounds];
  double lastUpdateOffsetX = self->_lastUpdateOffsetX;
  double lastUpdateOffsetY = self->_lastUpdateOffsetY;
  float64_t v105 = lastUpdateOffsetX;
  double v106 = lastUpdateOffsetY;
  p_uint64_t scrollViewFlags = &self->_scrollViewFlags;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    BOOL v34 = [(UIScrollView *)self _getPagingDecelerationOffset:&v105 forTimeInterval:v5];
    goto LABEL_97;
  }
  double v19 = v14;
  double v20 = v15;
  [(UIScrollView *)self _effectiveContentInset];
  double v101 = v23;
  double v25 = v24;
  unint64_t v26 = *(void *)p_scrollViewFlags;
  if ((*(void *)p_scrollViewFlags & 8) != 0)
  {
    accuracdouble y = self->_accuracy;
    double v36 = self->_firstPageOffset.horizontal - v21;
    if (accuracy == 1.0)
    {
      double v38 = round(v36);
      double v41 = round(v22 + self->_contentSize.width);
    }
    else
    {
      double v37 = floor(v36);
      double v38 = v37 + round(accuracy * (v36 - v37)) / accuracy;
      double v39 = v22 + self->_contentSize.width;
      double v40 = floor(v39);
      double v41 = v40 + round(accuracy * (v39 - v40)) / accuracy;
    }
    double v42 = v38 - v9;
    double v43 = v13 + v41 - v19;
    if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x4000000000) != 0)
    {
      double v44 = v25;
      if ((v26 & 0x30) != 0 || (lastUpdateOffsetX >= v42 ? (BOOL v45 = lastUpdateOffsetX <= v43) : (BOOL v45 = 0), !v45))
      {
        double x = self->_adjustedDecelerationTarget.x;
        if (x >= v42) {
          double v47 = self->_adjustedDecelerationTarget.x;
        }
        else {
          double v47 = v42;
        }
        if (lastUpdateOffsetX >= x) {
          double v47 = v42;
        }
        if (x >= v43) {
          double v48 = v43;
        }
        else {
          double v48 = self->_adjustedDecelerationTarget.x;
        }
        if (lastUpdateOffsetX <= x) {
          double v42 = v47;
        }
        else {
          double v43 = v48;
        }
      }
    }
    else
    {
      double v44 = v25;
    }
    double width = self->_adjustedDecelerationFactor.width;
    if (width == 0.0) {
      double width = self->_decelerationFactor.width;
    }
    BOOL v50 = [(UIScrollView *)self _getBouncingDecelerationOffset:&v105 forTimeInterval:&self->_horizontalVelocity lastUpdateOffset:v5 min:self->_lastUpdateOffsetX max:v42 decelerationFactor:v43 decelerationLnFactor:width velocity:self->_decelerationLnFactorH];
    uint64_t v51 = 32;
    if (!v50) {
      uint64_t v51 = 0;
    }
    unint64_t v26 = *(void *)p_scrollViewFlags & 0xFFFFFFFFFFFFFFDFLL | v51;
    *(void *)p_uint64_t scrollViewFlags = v26;
    double v25 = v44;
  }
  else if (self->_horizontalVelocity != 0.0)
  {
    *(void *)p_uint64_t scrollViewFlags = v26 & 0xFFFFFFFFFFFFFFDFLL;
    double v27 = self->_accuracy;
    double v28 = self->_firstPageOffset.horizontal - v21;
    if (v27 == 1.0)
    {
      double v30 = round(v28);
      double v33 = round(v22 + self->_contentSize.width);
    }
    else
    {
      double v29 = floor(v28);
      double v30 = v29 + round(v27 * (v28 - v29)) / v27;
      double v31 = v22 + self->_contentSize.width;
      double v32 = floor(v31);
      double v33 = v32 + round(v27 * (v31 - v32)) / v27;
    }
    double v60 = v25;
    double v61 = self->_adjustedDecelerationFactor.width;
    if (v61 == 0.0) {
      double v61 = self->_decelerationFactor.width;
    }
    -[UIScrollView _getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:](self, "_getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:", &v105, v5, v30, v33 - v19, v61, self->_decelerationLnFactorH);
    unint64_t v26 = *(void *)p_scrollViewFlags;
    double v25 = v60;
    if ((*(void *)p_scrollViewFlags & 4) != 0) {
      goto LABEL_42;
    }
LABEL_35:
    verticalVelocitdouble y = self->_verticalVelocity;
    if (verticalVelocity != 0.0)
    {
      *(void *)p_uint64_t scrollViewFlags = v26 & 0xFFFFFFFFFFFFFFEFLL;
      double v53 = self->_accuracy;
      double v54 = self->_firstPageOffset.vertical - v101;
      if (v53 == 1.0)
      {
        double v56 = round(v54);
        double v59 = round(v25 + self->_contentSize.height);
      }
      else
      {
        double v55 = floor(v54);
        double v56 = v55 + round(v53 * (v54 - v55)) / v53;
        double v57 = v25 + self->_contentSize.height;
        double v58 = floor(v57);
        double v59 = v58 + round(v53 * (v57 - v58)) / v53;
      }
      double height = self->_adjustedDecelerationFactor.height;
      if (height == 0.0) {
        double height = self->_decelerationFactor.height;
      }
      -[UIScrollView _getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:](self, "_getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:", &v106, v5, v56, v59 - v20, height, self->_decelerationLnFactorV);
      unint64_t v26 = *(void *)p_scrollViewFlags;
    }
    goto LABEL_74;
  }
  if ((v26 & 4) == 0) {
    goto LABEL_35;
  }
LABEL_42:
  double v62 = self->_accuracy;
  double v63 = v25 + self->_contentSize.height;
  if (v62 == 1.0)
  {
    double v65 = round(v63);
  }
  else
  {
    double v64 = floor(v63);
    double v65 = v64 + round(v62 * (v63 - v64)) / v62;
  }
  [(UIScrollView *)self _maxTopOffsetAdjustedForRevealableContentPadding:v11 + v65 - v20];
  double v67 = v66;
  double v68 = self->_accuracy;
  double v69 = self->_firstPageOffset.vertical - v101;
  if (v68 == 1.0)
  {
    double v71 = round(v69);
  }
  else
  {
    double v70 = floor(v69);
    double v71 = v70 + round(v68 * (v69 - v70)) / v68;
  }
  double v72 = v71 - v102;
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x8000000000) != 0)
  {
    if ((*(unsigned char *)p_scrollViewFlags & 0x30) != 0 || (v106 >= v72 ? (BOOL v73 = v106 <= v67) : (BOOL v73 = 0), !v73))
    {
      double y = self->_adjustedDecelerationTarget.y;
      if (y >= v72) {
        double v75 = self->_adjustedDecelerationTarget.y;
      }
      else {
        double v75 = v71 - v102;
      }
      if (v106 >= y) {
        double v75 = v71 - v102;
      }
      if (y >= v67) {
        double v76 = v67;
      }
      else {
        double v76 = self->_adjustedDecelerationTarget.y;
      }
      if (v106 <= y) {
        double v72 = v75;
      }
      else {
        double v67 = v76;
      }
    }
  }
  double v77 = self->_adjustedDecelerationFactor.height;
  if (v77 == 0.0) {
    double v77 = self->_decelerationFactor.height;
  }
  BOOL v78 = [(UIScrollView *)self _getBouncingDecelerationOffset:&v106 forTimeInterval:&self->_verticalVelocity lastUpdateOffset:v5 min:self->_lastUpdateOffsetY max:v72 decelerationFactor:v67 decelerationLnFactor:v77 velocity:self->_decelerationLnFactorV];
  uint64_t v79 = 16;
  if (!v78) {
    uint64_t v79 = 0;
  }
  unint64_t v26 = *(void *)p_scrollViewFlags & 0xFFFFFFFFFFFFFFEFLL | v79;
  *(void *)p_uint64_t scrollViewFlags = v26;
LABEL_74:
  if ((v26 & 0x30) != 0)
  {
    BOOL v34 = 0;
  }
  else
  {
    verticalVelocitdouble y = self->_horizontalVelocity;
    BOOL v34 = verticalVelocity * verticalVelocity + self->_verticalVelocity * self->_verticalVelocity < 0.0001;
    if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x4000000000) != 0)
    {
      if (verticalVelocity > 0.0 && (double v81 = self->_adjustedDecelerationTarget.x, v105 >= v81)
        || verticalVelocity < 0.0 && (double v81 = self->_adjustedDecelerationTarget.x, v105 <= v81))
      {
        float64_t v105 = v81;
        self->_horizontalVelocitdouble y = 0.0;
        verticalVelocitdouble y = fabs(self->_verticalVelocity);
        if (verticalVelocity < 0.01) {
          BOOL v34 = 1;
        }
      }
      else
      {
        verticalVelocitdouble y = fabs(verticalVelocity);
        if (verticalVelocity < 0.01)
        {
          verticalVelocitdouble y = v105;
          double v82 = self->_adjustedDecelerationTarget.x;
          if (v105 != v82)
          {
            BOOL v34 = 0;
            verticalVelocitdouble y = dbl_186B9E1D0[v105 < v82];
            self->_horizontalVelocitdouble y = verticalVelocity;
          }
        }
      }
    }
    if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x8000000000) != 0)
    {
      double v83 = self->_verticalVelocity;
      if (v83 > 0.0 && (double v84 = self->_adjustedDecelerationTarget.y, v106 >= v84)
        || v83 < 0.0 && (double v84 = self->_adjustedDecelerationTarget.y, v106 <= v84))
      {
        double v106 = v84;
        self->_verticalVelocitdouble y = 0.0;
        verticalVelocitdouble y = fabs(self->_horizontalVelocity);
        if (verticalVelocity < 0.01) {
          BOOL v34 = 1;
        }
      }
      else
      {
        verticalVelocitdouble y = fabs(v83);
        if (verticalVelocity < 0.01)
        {
          verticalVelocitdouble y = v106;
          double v85 = self->_adjustedDecelerationTarget.y;
          if (v106 != v85)
          {
            BOOL v34 = 0;
            verticalVelocitdouble y = dbl_186B9E1D0[v106 < v85];
            self->_verticalVelocitdouble y = verticalVelocity;
          }
        }
      }
    }
  }
  [(UIScrollView *)self _updateRubberbandingStatisticTrackingState];
LABEL_97:
  [(UIScrollView *)self contentOffset];
  double v88 = v87;
  uint64_t v89 = *(uint64_t *)&self->_accuracy;
  if (*(double *)&v89 == 1.0)
  {
    double v94 = v106;
    if (round(v105) == round(v86))
    {
      double v96 = round(v106);
      double v98 = round(v88);
LABEL_102:
      if (v96 == v98) {
        goto LABEL_104;
      }
    }
  }
  else
  {
    v90.f64[0] = v105;
    v90.f64[1] = v86;
    float64x2_t v91 = vrndmq_f64(v90);
    float64x2_t v92 = vaddq_f64(v91, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v90, v91), *(double *)&v89)), (float64x2_t)vdupq_lane_s64(v89, 0)));
    unsigned __int8 v93 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vceqq_f64(v92, (float64x2_t)vdupq_laneq_s64((int64x2_t)v92, 1)))).u8[0];
    double v94 = v106;
    if ((v93 & 1) == 0)
    {
      double v95 = floor(v106);
      double v96 = v95 + round(*(double *)&v89 * (v106 - v95)) / *(double *)&v89;
      double v97 = floor(v88);
      double v98 = v97 + round(*(double *)&v89 * (v88 - v97)) / *(double *)&v89;
      goto LABEL_102;
    }
  }
  ++dword_1EB25A50C;
LABEL_104:
  self->_double lastUpdateOffsetX = v105;
  self->_double lastUpdateOffsetY = v94;
  *(void *)((char *)&self->_scrollViewFlags + 12) |= 0x80000uLL;
  -[UIScrollView setContentOffset:](self, "setContentOffset:");
  CGPoint lastSetContentOffsetUnrounded = v103;
  if (v34)
  {
    [(UIScrollView *)self _stopScrollingNotify:1 pin:1];
    CGPoint lastSetContentOffsetUnrounded = v103;
  }
LABEL_106:
  if (qword_1EB25A578 != -1)
  {
    CGPoint v104 = lastSetContentOffsetUnrounded;
    dispatch_once(&qword_1EB25A578, &__block_literal_global_1972);
    CGPoint lastSetContentOffsetUnrounded = v104;
  }
  if (_MergedGlobals_116)
  {
    CGSize v99 = (CGSize)vsubq_f64((float64x2_t)lastSetContentOffsetUnrounded, (float64x2_t)self->_lastSetContentOffsetUnrounded);
    CGSize lastOffsetUpdateOffset = self->_lastOffsetUpdateOffset;
    self->_CGSize lastOffsetUpdateOffset = v99;
    *(int32x2_t *)&v99.double width = vmovn_s64(vcltzq_f64(vmulq_f64((float64x2_t)lastOffsetUpdateOffset, (float64x2_t)v99)));
    if ((LODWORD(v99.width) | HIDWORD(v99.width))) {
      self->_smoothScrollCallbackSkips = -1;
    }
    self->_lastOffsetUpdateTimeInterval = a3 - self->_lastUpdateTime;
  }
  self->_lastUpdateTime = a3;
}

- (void)_smoothScrollDisplayLink:(id)a3
{
  id v13 = a3;
  kdebug_trace();
  if (_UIUpdateCycleEnabled()) {
    double v4 = *(double *)&_currentModelMediaTime;
  }
  else {
    double v4 = 0.0;
  }
  if ((_UIUpdateCycleEnabled() & 1) == 0)
  {
    [v13 timestamp];
    double v4 = v5;
  }
  [v13 targetTimestamp];
  double v7 = v6;
  uint64_t v8 = _UIMachTimeForMediaTime(v4);
  uint64_t v9 = _UIMachTimeForMediaTime(v7);
  _UIQOSProcessingBegin("UIScrollViewSmoothScrollDisplayLink", 0, v8, v9);
  if (qword_1EB25A578 != -1) {
    dispatch_once(&qword_1EB25A578, &__block_literal_global_1972);
  }
  if (!_MergedGlobals_116) {
    goto LABEL_22;
  }
  if (self->_lastOffsetUpdateTimeInterval > 0.0)
  {
    int8x16_t v10 = vbslq_s8((int8x16_t)vcltzq_f64((float64x2_t)self->_lastOffsetUpdateOffset), (int8x16_t)vnegq_f64((float64x2_t)self->_lastOffsetUpdateOffset), (int8x16_t)self->_lastOffsetUpdateOffset);
    if (*(double *)v10.i64 < *(double *)&v10.i64[1]) {
      v10.i64[0] = v10.i64[1];
    }
    if (*(double *)v10.i64 > 0.0 && !self->_smoothScrollCallbackCurrentSkipCount)
    {
      if (*(double *)v10.i64 > 0.75 || self->_smoothScrollCallbackSkips)
      {
        if (*(double *)v10.i64 > 0.5 || self->_smoothScrollCallbackSkips != 1) {
          goto LABEL_19;
        }
        int64_t v11 = -1;
      }
      else
      {
        int64_t v11 = 1;
      }
      self->_smoothScrollCallbackSkips = v11;
    }
  }
LABEL_19:
  int64_t smoothScrollCallbackCurrentSkipCount = self->_smoothScrollCallbackCurrentSkipCount;
  if (self->_smoothScrollCallbackSkips > smoothScrollCallbackCurrentSkipCount)
  {
    self->_int64_t smoothScrollCallbackCurrentSkipCount = smoothScrollCallbackCurrentSkipCount + 1;
    kdebug_trace();
    goto LABEL_25;
  }
  self->_int64_t smoothScrollCallbackCurrentSkipCount = 0;
LABEL_22:
  if ((_UIUpdateCycleEnabled() & 1) == 0)
  {
    [MEMORY[0x1E4F39CF8] setCommitTime:v4 + (v7 - v4) * 0.5];
    [MEMORY[0x1E4F39CF8] setLowLatency:0];
  }
  [(UIScrollView *)self _smoothScrollWithUpdateTime:v4];
LABEL_25:
  _UIQOSProcessingEnd();
}

- (void)_pushTrackingRunLoopModeIfNecessaryForReason:(id)a3
{
  uint64_t scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x100000000) == 0)
  {
    *(void *)&self->_uint64_t scrollViewFlags = scrollViewFlags | 0x100000000;
    [(id)UIApp _pushRunLoopMode:@"UITrackingRunLoopMode" requester:self reason:a3];
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystemHoldingLock);

    if (has_internal_diagnostics)
    {
      if (WeakRetained)
      {
        id v17 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "Found a focus system already holding a lock for this scroll view when trying to set a lock.", buf, 2u);
        }
      }
    }
    else if (WeakRetained)
    {
      double v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_pushTrackingRunLoopModeIfNecessaryForReason____s_category)+ 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Found a focus system already holding a lock for this scroll view when trying to set a lock.", buf, 2u);
      }
    }
    double v7 = [(UIView *)self _focusSystem];
    objc_storeWeak((id *)&self->_focusSystemHoldingLock, v7);

    id v8 = objc_loadWeakRetained((id *)&self->_focusSystemHoldingLock);
    [v8 _lockEnvironment:self];

    if ([(id)UIApp _isSpringBoard])
    {
      trackingWatchdogTimer = self->_trackingWatchdogTimer;
      if (trackingWatchdogTimer) {
        [(NSTimer *)trackingWatchdogTimer invalidate];
      }
      int v10 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_SpringBoardTrackingModeWatchdogTimeout, @"SpringBoardTrackingModeWatchdogTimeout", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      double v11 = *(double *)&qword_1E8FD5580;
      if (v10) {
        double v11 = 60.0;
      }
      double v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v11];
      id v13 = objc_alloc(MEMORY[0x1E4F1CB00]);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __61__UIScrollView__pushTrackingRunLoopModeIfNecessaryForReason___block_invoke;
      v19[3] = &unk_1E52EC0A8;
      void v19[4] = self;
      double v14 = (NSTimer *)[v13 initWithFireDate:v12 interval:0 repeats:v19 block:0.0];
      double v15 = self->_trackingWatchdogTimer;
      self->_trackingWatchdogTimer = v14;

      if (self->_trackingWatchdogTimer)
      {
        id v16 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        [v16 addTimer:self->_trackingWatchdogTimer forMode:@"UITrackingRunLoopMode"];
      }
    }
    [(UIScrollView *)self _beginScrollingCursorOverrideIfNecessary];
  }
}

void __61__UIScrollView__pushTrackingRunLoopModeIfNecessaryForReason___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _popTrackingRunLoopModeIfNecessaryForReason:@"WATCHDOG TIMED OUT"];
  uint64_t v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("SpringBoardRunLoopMode", &_UIScrollViewContentYOffsetConstraintIdentifier_block_invoke_2___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    double v3 = v2;
    double v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2050;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_FAULT, "Tracking run loop mode watchdog triggered (42144269) <%{public}@ %{public}p>", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_bumpTrackingWatchdogTimer
{
  if ([(id)UIApp _isSpringBoard] && self->_trackingWatchdogTimer)
  {
    int v3 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_SpringBoardTrackingModeWatchdogTimeout, @"SpringBoardTrackingModeWatchdogTimeout", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v4 = *(double *)&qword_1E8FD5580;
    if (v3) {
      double v4 = 60.0;
    }
    id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v4];
    [(NSTimer *)self->_trackingWatchdogTimer setFireDate:v5];
  }
}

- (void)_runLoopModePopped:(id)a3
{
  id v4 = a3;
  if (self->_scrollHeartbeat)
  {
    if (!GScrollerPoppingRunLoopMode || GScrollerPoppingRunLoopMode == (void)self)
    {
      id v9 = v4;
      uint64_t v6 = [v4 userInfo];
      int v7 = [v6 objectForKey:@"_UIApplicationRunLoopMode"];
      int v8 = [v7 isEqualToString:@"UITrackingRunLoopMode"];

      id v4 = v9;
      if (v8)
      {
        [(UIScrollView *)self _stopScrollingNotify:1 pin:1];
        id v4 = v9;
      }
    }
  }
}

- (void)_beginScrollingCursorOverrideIfNecessary
{
  if (((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_OverrideCursorDuringScroll, @"OverrideCursorDuringScroll", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1EB2579EC)&& !self->_scrollingPointerRegion)
  {
    [(UIView *)self frame];
    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", @"UIScrollView.scrollingPointerRegion");
    int v3 = (UIPointerRegion *)objc_claimAutoreleasedReturnValue();
    scrollingPointerRegion = self->_scrollingPointerRegion;
    self->_scrollingPointerRegion = v3;

    id v5 = [(UIView *)self superview];
    [(UIPointerRegion *)self->_scrollingPointerRegion setReferenceView:v5];

    ++self->_scrollingPointerRegionGenerationID;
    -[UIPointerRegion setGenerationID:](self->_scrollingPointerRegion, "setGenerationID:");
    id v6 = +[_UIPointerArbiter sharedArbiter];
    [v6 beginScrollingWithRegion:self->_scrollingPointerRegion];
  }
}

- (void)_endScrollingCursorOverrideIfNecessary
{
  if (((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_OverrideCursorDuringScroll, @"OverrideCursorDuringScroll", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1EB2579EC)&& self->_scrollingPointerRegion)
  {
    int v3 = +[_UIPointerArbiter sharedArbiter];
    [v3 endScrollingWithRegion:self->_scrollingPointerRegion];

    scrollingPointerRegion = self->_scrollingPointerRegion;
    self->_scrollingPointerRegion = 0;
  }
}

- (void)_registerForSpringBoardBlankedScreenNotification
{
  if (_registerForSpringBoardBlankedScreenNotification_onceToken != -1) {
    dispatch_once(&_registerForSpringBoardBlankedScreenNotification_onceToken, &__block_literal_global_562_0);
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__springBoardBlankedScreenNotification_ name:@"_UIScrollViewSpringBoardBlankedScreenNotification" object:0];
}

void __64__UIScrollView__registerForSpringBoardBlankedScreenNotification__block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__SpringBoardBlankedScreen, @"com.apple.springboard.hasBlankedScreen", 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)_unregisterForSpringBoardBlankedScreenNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIScrollViewSpringBoardBlankedScreenNotification" object:0];
}

- (void)_springBoardBlankedScreenNotification:(id)a3
{
}

- (void)_startTimer:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB25A578 != -1) {
    dispatch_once(&qword_1EB25A578, &__block_literal_global_1972);
  }
  if (_MergedGlobals_116)
  {
    self->_smoothScrollCallbackSkips = 0;
    self->_lastOffsetUpdateTimeInterval = 0.0;
  }
  scrollHeartbeat = self->_scrollHeartbeat;
  if (scrollHeartbeat)
  {
    [(CADisplayLink *)scrollHeartbeat setPaused:0];
  }
  else
  {
    id v6 = [(UIView *)self window];

    if (v6)
    {
      int v7 = [(UIView *)self window];
      int v8 = [v7 screen];
      id v9 = [v8 displayLinkWithTarget:self selector:sel__smoothScrollDisplayLink_];
      uint64_t v10 = self->_scrollHeartbeat;
      self->_scrollHeartbeat = v9;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__smoothScrollDisplayLink_];
      int v7 = self->_scrollHeartbeat;
      self->_scrollHeartbeat = v11;
    }

    int v12 = _UIVariableFrameDurationEnabled();
    id v13 = self->_scrollHeartbeat;
    if (v12)
    {
      [(CADisplayLink *)self->_scrollHeartbeat setHighFrameRateReason:1048607];
      -[_UIScrollViewVFD updateDisplayLink:]((uint64_t)self->_vfd, self->_scrollHeartbeat);
    }
    else
    {
      [(CADisplayLink *)self->_scrollHeartbeat maximumRefreshRate];
      if (v14 != 0.0) {
        [(CADisplayLink *)v13 setPreferredFramesPerSecond:llround(1.0 / v14)];
      }
    }
    double v15 = self->_scrollHeartbeat;
    id v16 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v15 addToRunLoop:v16 forMode:*MEMORY[0x1E4F1C4B0]];

    [(UIScrollView *)self _registerForSpringBoardBlankedScreenNotification];
    self->_lastUpdateTime = CACurrentMediaTime();
    id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:self selector:sel__runLoopModePopped_ name:@"_UIApplicationRunLoopModePopNotification" object:UIApp];

    dword_1EB25A50C = 0;
  }
  CGFloat width = self->_adjustedDecelerationFactor.width;
  if (width == 0.0) {
    CGFloat width = self->_decelerationFactor.width;
  }
  self->_decelerationLnFactorH = log(width);
  CGFloat height = self->_adjustedDecelerationFactor.height;
  if (height == 0.0) {
    CGFloat height = self->_decelerationFactor.height;
  }
  self->_decelerationLnFactorV = log(height);
  id v33 = 0;
  BOOL v20 = [(UIScrollView *)self _canPerformAsyncScrollDecelerationReturningEvent:&v33];
  id v21 = v33;
  double v22 = 0;
  if (v20)
  {
    double v22 = objc_alloc_init(_UIScrollViewAsyncScrollDecelerationState);
    uint64_t v23 = [v21 _cloneEvent];
    scrollEvent = v22->_scrollEvent;
    v22->_scrollEvent = (UIScrollEvent *)v23;

    [(UIScrollViewPanGestureRecognizer *)self->_pan velocityInView:self];
    double velocityScaleFactor = self->_velocityScaleFactor;
    v22->_velocity.ddouble x = -(v26 * velocityScaleFactor);
    v22->_velocity.ddouble y = -(v27 * velocityScaleFactor);
    v22->_lastUpdateTime = self->_lastUpdateTime;
  }

  asyncScrollDecelerationState = self->_asyncScrollDecelerationState;
  self->_asyncScrollDecelerationState = v22;

  if (v3)
  {
    self->_telemetryOffsetChangeHighRateDuration = 0.0;
    self->_telemetryOffsetChangeCount = 0;
    self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E4F1DB30];
    _UIQOSManagedCommitsBegin(self, @"Deceleration");
    -[_UIScrollViewVFD activateSubreason:]((uint64_t)self->_vfd, 3);
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25A520);
    double v30 = *(id *)(CategoryCachedImpl + 8);
    if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
      && os_signpost_enabled(v30))
    {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    kdebug_trace();
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained scrollViewWillBeginDecelerating:self];
    }
    kdebug_trace();
    double v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 postNotificationName:@"WillStartSmoothScrolling" object:self];
  }
}

- (void)_setTopLayoutInsetForSidebar:(double)a3
{
  if (self->_topLayoutInsetForSidebar != a3)
  {
    self->_topLayoutInsetForSidebar = a3;
    [(UIScrollView *)self _layoutAdjustmentsDidChange];
  }
}

- (CGRect)_scrollIndicatorContainerRect
{
  [(UIScrollView *)self _scrollIndicatorAdditionalInset];
  double v4 = v3;
  [(UIScrollView *)self _effectiveVerticalScrollIndicatorInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIScrollView *)self _effectiveHorizontalScrollIndicatorInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  BOOL v19 = [(UIScrollView *)self _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis];
  double v20 = fmax(v6, 0.0);
  uint64_t v21 = *(void *)((char *)&self->_scrollViewFlags + 12);
  BOOL v22 = (v21 & 0x4000000000000000) != 0 && (*((unsigned char *)&self->_scrollViewFlags + 3) & 1) == 0;
  double v23 = v4 + v20;
  if ((v21 & 0x2000000000000000) != 0 && !v22)
  {
    [(UIScrollView *)self contentOffset];
    double v23 = fmax(v23, v4 - v24);
  }
  double v25 = fmax(v12, 0.0);
  if (v19) {
    double v25 = 0.0;
  }
  double v26 = fmax(v25, v18);
  double v27 = fmax(fmax(v10, 0.0), v16);
  double v28 = fmax(v8, 0.0);
  if (!v19) {
    double v28 = 0.0;
  }
  double v29 = v4 + v27;
  double v30 = v4 + v26;
  double v31 = v4 + fmax(v28, v14);
  double v32 = fmax(v23, 0.0);
  double v33 = fmax(v31, 0.0);
  double v34 = fmax(v29, 0.0);
  double v35 = fmax(v30, 0.0);
  [(UIView *)self bounds];
  double v37 = v33 + v36;
  double v39 = v32 + v38;
  double v41 = v40 - (v33 + v35);
  double v43 = v42 - (v34 + v32);
  result.size.CGFloat height = v43;
  result.size.CGFloat width = v41;
  result.origin.double y = v39;
  result.origin.double x = v37;
  return result;
}

- (void)_hideScrollIndicators
{
  p_uint64_t scrollViewFlags = &self->_scrollViewFlags;
  int v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
  *((_DWORD *)&self->_scrollViewFlags + 5) = v3 & 0xFFBFFFFF;
  if ((*(void *)&v3 & 0x300000) == 0)
  {
    [(UIScrollView *)self _setKnobInteractionGestureDelayed:0];
    *(void *)((char *)p_scrollViewFlags + 12) &= 0xFFFFFFFFFFFFFFFCLL;
    double v5 = [(UIView *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 3) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = 251658240;
    }
    v8[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__UIScrollView__hideScrollIndicators__block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__UIScrollView__hideScrollIndicators__block_invoke_2;
    v8[3] = &unk_1E52DC3A0;
    +[UIView animateWithDuration:v7 delay:v9 options:v8 animations:0.5 completion:0.0];
  }
}

uint64_t __37__UIScrollView__hideScrollIndicators__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1528) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1520);
  return [v2 setAlpha:0.0];
}

uint64_t __37__UIScrollView__hideScrollIndicators__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1528) setExpandedForDirectManipulation:0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1520);
  return [v2 setExpandedForDirectManipulation:0];
}

- (void)_hideScrollIndicator:(id)a3 afterDelay:(double)a4 animated:(BOOL)a5
{
  id v8 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke;
  aBlock[3] = &unk_1E52EA800;
  double v9 = (_UIScrollViewScrollIndicator *)v8;
  double v17 = v9;
  double v18 = self;
  BOOL v19 = a5;
  double v10 = _Block_copy(aBlock);
  double v11 = v10;
  if (a4 <= 0.0)
  {
    (*((void (**)(void *, void))v10 + 2))(v10, 0);
  }
  else
  {
    if (self->_verticalScrollIndicator == v9) {
      uint64_t v12 = 1504;
    }
    else {
      uint64_t v12 = 1512;
    }
    [*(id *)((char *)&self->super.super.super.isa + v12) invalidate];
    double v13 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v11 block:a4];
    double v14 = *(Class *)((char *)&self->super.super.super.isa + v12);
    *(Class *)((char *)&self->super.super.super.isa + v12) = v13;

    double v15 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v15 addTimer:*(Class *)((char *)&self->super.super.super.isa + v12) forMode:@"UITrackingRunLoopMode"];
  }
}

void __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = 99;
  if (*(void *)(a1 + 32) == *(void *)(v4 + 1520)) {
    uint64_t v5 = 98;
  }
  uint64_t v6 = OBJC_IVAR___UIScrollViewScrollAnimation__adjustsForContentOffsetDelta[v5];
  uint64_t v7 = *(void **)(v4 + v6);
  *(void *)(v4 + v6) = 0;

  if ((*(_DWORD *)(*(void *)(a1 + 40) + 1780) & 0x300000) == 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke_2;
    aBlock[3] = &unk_1E52D9F70;
    id v18 = *(id *)(a1 + 32);
    id v8 = _Block_copy(aBlock);
    double v9 = v8;
    if (*(unsigned char *)(a1 + 48))
    {
      objc_initWeak(&location, *(id *)(a1 + 40));
      double v10 = [*(id *)(a1 + 40) traitCollection];
      uint64_t v11 = [v10 userInterfaceIdiom];

      if (v11 == 3) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = 251658240;
      }
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke_3;
      v13[3] = &unk_1E52DF168;
      objc_copyWeak(&v15, &location);
      id v14 = *(id *)(a1 + 32);
      +[UIView animateWithDuration:v12 delay:v9 options:v13 animations:0.25 completion:0.0];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(void *))v8 + 2))(v8);
    }
  }
}

uint64_t __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    WeakRetained[192] = v2;
    [*(id *)(a1 + 32) setExpandedForDirectManipulation:0];
  }
}

- (CGPoint)_contentOffsetForLowFidelityScrollInDirection:(CGPoint)a3 duration:(double *)a4
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  [(UIScrollView *)self contentOffset];
  double v13 = v12;
  double v15 = v14;
  if ([(UIScrollView *)self isScrollAnimating])
  {
    [(UIScrollView *)self _animatedTargetOffset];
    double v13 = v16;
    double v15 = v17;
  }
  [(UIScrollView *)self _contentOffsetAnimationDuration];
  double v19 = v18;
  [(UIScrollView *)self _effectiveContentInset];
  accuracdouble y = self->_accuracy;
  if (fabs(y) >= 2.22044605e-16)
  {
    double v33 = self->_firstPageOffset.vertical - v20;
    if (accuracy != 1.0)
    {
      double v34 = floor(v33);
      double v27 = v34 + round(accuracy * (v33 - v34)) / accuracy;
      double v35 = v22 + self->_contentSize.height;
      double v36 = floor(v35);
      double v30 = v36 + round(accuracy * (v35 - v36)) / accuracy;
      double v31 = floor(v11);
      double v32 = v11 - v31;
      goto LABEL_8;
    }
    double v27 = round(v33);
    double v30 = round(v22 + self->_contentSize.height);
    double v37 = round(v11);
  }
  else
  {
    double v25 = self->_firstPageOffset.horizontal - v21;
    if (accuracy != 1.0)
    {
      double v26 = floor(v25);
      double v27 = v26 + round(accuracy * (v25 - v26)) / accuracy;
      double v28 = v23 + self->_contentSize.width;
      double v29 = floor(v28);
      double v30 = v29 + round(accuracy * (v28 - v29)) / accuracy;
      double v31 = floor(v9);
      double v32 = v9 - v31;
LABEL_8:
      double v37 = v31 + round(v32 * accuracy) / accuracy;
      goto LABEL_11;
    }
    double v27 = round(v25);
    double v30 = round(v23 + self->_contentSize.width);
    double v37 = round(v9);
  }
LABEL_11:
  double v38 = v30 - v37;
  if (v38 < v27) {
    double v38 = v27;
  }
  if (y >= 0.0)
  {
    if (y <= 0.0)
    {
      if (x >= 0.0)
      {
        if (x <= 0.0) {
          goto LABEL_59;
        }
        if (v13 >= v38) {
          double v19 = 0.12;
        }
        if (accuracy == 1.0)
        {
          double v48 = round(v9);
        }
        else
        {
          double v47 = floor(v9);
          double v48 = v47 + round((v9 - v47) * accuracy) / accuracy;
        }
        double v52 = v13 + v48;
        double v13 = v52 <= v38 ? v52 : v38;
        if (v13 != v38) {
          goto LABEL_59;
        }
        double v51 = 20.0;
      }
      else
      {
        if (v13 <= v27) {
          double v19 = 0.12;
        }
        if (accuracy == 1.0)
        {
          double v44 = round(v9);
        }
        else
        {
          double v43 = floor(v9);
          double v44 = v43 + round((v9 - v43) * accuracy) / accuracy;
        }
        double v50 = v13 - v44;
        if (v50 >= v27) {
          double v13 = v50;
        }
        else {
          double v13 = v27;
        }
        if (v13 != v27) {
          goto LABEL_59;
        }
        double v51 = -20.0;
      }
      double v13 = v13 + v51;
      goto LABEL_59;
    }
    if (v15 >= v38) {
      double v19 = 0.12;
    }
    if (accuracy == 1.0)
    {
      double v42 = round(v11);
    }
    else
    {
      double v41 = floor(v11);
      double v42 = v41 + round((v11 - v41) * accuracy) / accuracy;
    }
    double v49 = v15 + v42;
    if (v49 <= v38) {
      double v15 = v49;
    }
    else {
      double v15 = v38;
    }
    if (v15 == v38)
    {
      double v46 = 20.0;
      goto LABEL_45;
    }
  }
  else
  {
    if (v15 <= v27) {
      double v19 = 0.12;
    }
    if (accuracy == 1.0)
    {
      double v40 = round(v11);
    }
    else
    {
      double v39 = floor(v11);
      double v40 = v39 + round((v11 - v39) * accuracy) / accuracy;
    }
    double v45 = v15 - v40;
    if (v45 >= v27) {
      double v15 = v45;
    }
    else {
      double v15 = v27;
    }
    if (v15 == v27)
    {
      double v46 = -20.0;
LABEL_45:
      double v15 = v15 + v46;
    }
  }
LABEL_59:
  if (a4) {
    *a4 = v19;
  }
  double v53 = v13;
  double v54 = v15;
  result.double y = v54;
  result.double x = v53;
  return result;
}

- (void)_lowFidelityScrollInDirection:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIScrollView *)self _contentOffsetAnimationDuration];
  double v7 = v6;
  double v17 = 0.0;
  [(UIScrollView *)self contentOffset];
  double v9 = v8;
  double v11 = v10;
  -[UIScrollView _contentOffsetForLowFidelityScrollInDirection:duration:](self, "_contentOffsetForLowFidelityScrollInDirection:duration:", &v17, x, y);
  if (v12 != v9 || v13 != v11)
  {
    double v15 = v12;
    double v16 = v13;
    [(UIScrollView *)self _setContentOffsetAnimationDuration:v17];
    -[UIScrollView _handleDirectionalScrollToOffset:clampingToBounds:](self, "_handleDirectionalScrollToOffset:clampingToBounds:", 0, v15, v16);
    [(UIScrollView *)self _setContentOffsetAnimationDuration:v7];
  }
}

- (void)_handleLowFidelitySwipe:(id)a3
{
  uint64_t v4 = (UISwipeGestureRecognizer *)a3;
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  double v10 = v4;
  do
  {
    if (self->_lowFidelitySwipeGestureRecognizers[v6] == v4)
    {
      double v7 = v10;
      uint64_t v5 = [(UISwipeGestureRecognizer *)v7 direction];
      uint64_t v4 = v10;
    }
    else
    {
      double v7 = 0;
    }
    if (v6 > 2) {
      break;
    }
    ++v6;
  }
  while (!v7);
  if (v7 && [(UIGestureRecognizer *)v7 state] == UIGestureRecognizerStateEnded)
  {
    double v8 = 0.0;
    if (v5 == 1) {
      double v9 = -1.0;
    }
    else {
      double v9 = 0.0;
    }
    if (v5 == 2) {
      double v9 = 1.0;
    }
    if (v5 == 4) {
      double v8 = 1.0;
    }
    if (v5 == 8) {
      double v8 = -1.0;
    }
    -[UIScrollView _lowFidelityScrollInDirection:](self, "_lowFidelityScrollInDirection:", v9, v8);
  }
}

- (BOOL)_bounceForCarPlayIfNecessary
{
  [(UIView *)self bounds];
  double v28 = v3;
  double v5 = v4;
  [(UIScrollView *)self contentOffset];
  double v7 = v6;
  double v9 = v8;
  [(UIScrollView *)self _effectiveContentInset];
  uint64_t v13 = *(uint64_t *)&self->_accuracy;
  double v15 = self->_firstPageOffset.horizontal - v14;
  if (*(double *)&v13 == 1.0)
  {
    if (v7 < round(v15)
      || v7 > round(v12 + self->_contentSize.width) - round(v28)
      || v9 < round(self->_firstPageOffset.vertical - v10))
    {
      goto LABEL_11;
    }
    double v24 = round(v11 + self->_contentSize.height);
    double v26 = round(v5);
  }
  else
  {
    double v16 = floor(v15);
    if (v7 < v16 + round(*(double *)&v13 * (v15 - v16)) / *(double *)&v13) {
      goto LABEL_11;
    }
    v17.f64[0] = v12 + self->_contentSize.width;
    v17.f64[1] = v28;
    float64x2_t v18 = vrndmq_f64(v17);
    float64x2_t v19 = vaddq_f64(v18, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v17, v18), *(double *)&v13)), (float64x2_t)vdupq_lane_s64(v13, 0)));
    if (v7 > vsubq_f64(v19, (float64x2_t)vdupq_laneq_s64((int64x2_t)v19, 1)).f64[0]) {
      goto LABEL_11;
    }
    double v20 = self->_firstPageOffset.vertical - v10;
    double v21 = floor(v20);
    if (v9 < v21 + round(*(double *)&v13 * (v20 - v21)) / *(double *)&v13) {
      goto LABEL_11;
    }
    double v22 = v11 + self->_contentSize.height;
    double v23 = floor(v22);
    double v24 = v23 + round(*(double *)&v13 * (v22 - v23)) / *(double *)&v13;
    double v25 = floor(v5);
    double v26 = v25 + round((v5 - v25) * *(double *)&v13) / *(double *)&v13;
  }
  if (v9 > v24 - v26)
  {
LABEL_11:
    [(UIScrollView *)self _pushTrackingRunLoopModeIfNecessaryForReason:@"Bounce for CarPlay"];
    -[UIScrollView _updateDecelerationLastOffset:](self, "_updateDecelerationLastOffset:", v7, v9);
    [(UIScrollView *)self _startTimer:0];
    return 1;
  }
  return 0;
}

- (BOOL)_shouldUpdateFocusInContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIScrollView;
  return [(UIView *)&v4 _shouldUpdateFocusInContext:a3];
}

- (void)_didUpdateFocusInContext:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIScrollView;
  [(UIView *)&v3 _didUpdateFocusInContext:a3];
}

- (BOOL)_prefersFocusContainment
{
  return ![(UIScrollView *)self _forwardsToParentScroller];
}

- (BOOL)_focusCanScrollX
{
  if ([(UIScrollView *)self _canScrollWithoutBouncingX])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(UIScrollView *)self bouncesHorizontally];
    if (v3)
    {
      LOBYTE(v3) = [(UIScrollView *)self _applicationHasExplicitlySetBounces];
    }
  }
  return v3;
}

- (BOOL)_focusCanScrollY
{
  if ([(UIScrollView *)self _canScrollWithoutBouncingY])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(UIScrollView *)self bouncesVertically];
    if (v3)
    {
      LOBYTE(v3) = [(UIScrollView *)self _applicationHasExplicitlySetBounces];
    }
  }
  return v3;
}

- (BOOL)_focusIsScrollableContainer
{
  BOOL v3 = [(UIScrollView *)self _focusCanScrollX]
    || [(UIScrollView *)self _focusCanScrollY];
  return [(UIScrollView *)self isScrollEnabled] && v3;
}

- (CGRect)_focusScrollableContentBounds
{
  [(UIScrollView *)self _minimumContentOffset];
  double v4 = v3;
  double v6 = v5;
  [(UIScrollView *)self _maximumContentPoint];
  double v8 = v7 - v4;
  double v10 = v9 - v6;
  double v11 = v4;
  double v12 = v6;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v8;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (id)_focusScrollBoundaryMetricsForItem:(id)a3
{
  id v4 = a3;
  double v5 = [(UIScrollView *)self _focusTuple];
  double v6 = _UIFocusItemScrollableContainerDefaultScrollBoundaryMetricsForItem(v5, v4);

  return v6;
}

- (unint64_t)_focusScrollOffsetResolverForFocusMovement:(id)a3
{
  id v4 = a3;
  if ([(UIScrollView *)self isPagingEnabled])
  {
    unint64_t v5 = 1;
  }
  else
  {
    double v6 = [(UIScrollView *)self _focusTuple];
    unint64_t v5 = _UIFocusItemScrollableContainerDefaultScrollOffsetResolverTypeForFocusMovement(v6, v4);
  }
  return v5;
}

- (UIEdgeInsets)_focusScrollableAreaInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (id)_focusTuple
{
  return +[_UIFocusEnvironmentScrollableContainerTuple tupleWithOwningEnvironment:self scrollableContainer:self];
}

- (BOOL)_isFocusFastScrolling
{
  return 0;
}

- (BOOL)_focusFastScrollingDisabled
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 19) & 1;
}

- (void)_setFocusFastScrollingDisabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFF7FFFF | v3;
}

- (id)_focusFastScrollingIndexBarEntries
{
  double v2 = (objc_class *)MEMORY[0x1E4F1CA48];
  int v3 = self;
  id v4 = objc_alloc_init(v2);
  [(UIScrollView *)v3 _minimumContentOffset];
  [(UIScrollView *)v3 _maximumContentOffset];

  double v5 = (void *)[v4 copy];
  return v5;
}

- (void)_updateRubberbandingStatisticTrackingState
{
  uint64_t v2 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if ((v2 & 0x100000000000000) == 0 && (*(unsigned char *)&self->_scrollViewFlags & 0x30) != 0)
  {
    int v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(void *)((char *)&self->_scrollViewFlags + 12) = v2 | 0x100000000000000;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v3;
  }
}

- (void)_beginActivityTrackingIfNeededForReason:(int64_t)a3
{
  if (_UIViewControllerSupportsInteractionActivityTracking())
  {
    double v5 = [(UIScrollView *)self _effectiveInteractionActivityTrackingBaseName];
    double v6 = [&unk_1ED3F1828 objectAtIndexedSubscript:a3];
    id v12 = [v5 stringByAppendingString:v6];

    double v7 = v12;
    if (v12)
    {
      activityTrackingTokens = self->_activityTrackingTokens;
      if (!self->_activityTrackingTokens[a3])
      {
        double v9 = [MEMORY[0x1E4F28F80] processInfo];
        uint64_t v10 = [v9 beginActivityWithOptions:0x200000000000 reason:v12];
        double v11 = activityTrackingTokens[a3];
        activityTrackingTokens[a3] = v10;

        double v7 = v12;
      }
    }
  }
}

- (void)_endActivityTrackingIfNeededForReason:(int64_t)a3
{
  activityTrackingTokens = self->_activityTrackingTokens;
  if (self->_activityTrackingTokens[a3])
  {
    double v5 = [MEMORY[0x1E4F28F80] processInfo];
    [v5 endActivity:activityTrackingTokens[a3]];

    double v6 = activityTrackingTokens[a3];
    activityTrackingTokens[a3] = 0;
  }
}

void __35__UIScrollView__setRefreshControl___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", GScrollerPoppingRunLoopMode_block_invoke_3___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Attempting to change the refresh control while it is not idle is strongly discouraged and probably won't work properly.", v1, 2u);
  }
}

- (void)_beginRefreshing
{
  id v2 = [(UIScrollView *)self _refreshControl];
  [v2 beginRefreshing];
}

- (void)_endRefreshingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIScrollView *)self _refreshControl];
  [v4 _endRefreshingAnimated:v3];
}

- (id)_scrollDetentOffsets
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v2 = self;
  BOOL v3 = v2;
  if (v2)
  {
    p_isa = (id *)&v2->super.super.super.isa;
    while (1)
    {
      double v5 = (id *)p_isa[11];
      if (v5) {
        break;
      }
      double v6 = [p_isa superview];
      [v6 bounds];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [p_isa frame];
      v32.origin.double x = v15;
      v32.origin.double y = v16;
      v32.size.CGFloat width = v17;
      v32.size.CGFloat height = v18;
      v31.origin.double x = v8;
      v31.origin.double y = v10;
      v31.size.CGFloat width = v12;
      v31.size.CGFloat height = v14;
      BOOL v19 = CGRectEqualToRect(v31, v32);

      if (!v19) {
        goto LABEL_8;
      }
      double v20 = [p_isa superview];

      p_isa = v20;
      if (!v20) {
        goto LABEL_10;
      }
    }
    double v20 = v5;
  }
  else
  {
    p_isa = 0;
LABEL_8:
    double v20 = 0;
  }
LABEL_10:
  double v21 = [v20 navigationController];
  double v22 = [v21 _scrollDetentOffsetsForScrollView:v3];
  double v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    double v25 = NSNumber;
    [(UIScrollView *)v3 _minimumContentOffset];
    double v27 = [v25 numberWithDouble:v26];
    v29[0] = v27;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  }
  return v24;
}

- (UIEdgeInsets)_gradientMaskLengths
{
  double top = self->_gradientMaskLengths.top;
  double left = self->_gradientMaskLengths.left;
  double bottom = self->_gradientMaskLengths.bottom;
  double right = self->_gradientMaskLengths.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setUpGradientMaskViewIfNecessary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = -[UIView _safeMaskView](self);

  if (v3)
  {
    if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x2000000000000) == 0)
    {
      id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &_setUpGradientMaskViewIfNecessary___s_category) + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        CGFloat top = self->_gradientMaskLengths.top;
        CGFloat left = self->_gradientMaskLengths.left;
        CGFloat bottom = self->_gradientMaskLengths.bottom;
        CGFloat right = self->_gradientMaskLengths.right;
        double v9 = v4;
        CGFloat v10 = -[UIView _safeMaskView](self);
        double v11 = (objc_class *)objc_opt_class();
        CGFloat v12 = NSStringFromClass(v11);
        *(_DWORD *)long long buf = 134219010;
        CGFloat v16 = top;
        __int16 v17 = 2048;
        CGFloat v18 = left;
        __int16 v19 = 2048;
        CGFloat v20 = bottom;
        __int16 v21 = 2048;
        CGFloat v22 = right;
        __int16 v23 = 2112;
        id v24 = v12;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "WARNING: gradientMaskLengths set to {%g, %g, %g, %g}, but the current mask view type, %@, does not support them. Set the maskView property to nil before setting nonzero gradientMaskLengths.", buf, 0x34u);
      }
    }
  }
  else
  {
    double v13 = [_UIScrollViewGradientMaskView alloc];
    CGFloat v14 = -[_UIScrollViewGradientMaskView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    -[UIView _setSafeMaskView:](self, v14);
  }
}

- (void)_setConfigureForObservingByTVSearchController:(BOOL)a3
{
  uint64_t v3 = *(void *)((char *)&self->_scrollViewFlags + 12);
  if (((((v3 & 0x4000000000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v6 = 0x4000000000000;
    if (!a3) {
      uint64_t v6 = 0;
    }
    *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(void *)((char *)&self->_scrollViewFlags + 12) = v3 & 0xFFFBFFFFFFFFFFFFLL | v6;
    if ((v3 & 0x2000000000000) != 0 && a3) {
      -[UIView _setSafeMaskView:](self, 0);
    }
    if (!a3
      && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_gradientMaskLengths.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_gradientMaskLengths.bottom))))) & 1) != 0)
    {
      [(UIScrollView *)self _setUpGradientMaskViewIfNecessary];
    }
  }
}

- (BOOL)_configureForObservingByTVSearchController
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 50) & 1;
}

- (UIEdgeInsets)_effectiveGradientMaskLengths
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x4000000000000) != 0) {
    p_gradientMaskLengths = &UIEdgeInsetsZero;
  }
  else {
    p_gradientMaskLengths = &self->_gradientMaskLengths;
  }
  double bottom = p_gradientMaskLengths->bottom;
  double right = p_gradientMaskLengths->right;
  double top = p_gradientMaskLengths->top;
  double left = p_gradientMaskLengths->left;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setGradientMaskLengths:(UIEdgeInsets)a3
{
  self->_gradientMaskLengths = a3;
  if (a3.left == 0.0 && a3.top == 0.0 && a3.right == 0.0 && a3.bottom == 0.0)
  {
    if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x2000000000000) != 0) {
      -[UIView _setSafeMaskView:](self, 0);
    }
  }
  else
  {
    [(UIScrollView *)self _setUpGradientMaskViewIfNecessary];
  }
}

- (UIEdgeInsets)_gradientMaskEdgeInsets
{
  double top = self->_gradientMaskEdgeInsets.top;
  double left = self->_gradientMaskEdgeInsets.left;
  double bottom = self->_gradientMaskEdgeInsets.bottom;
  double right = self->_gradientMaskEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setGradientMaskEdgeInsets:(UIEdgeInsets)a3
{
  self->_gradientMaskEdgeInsets = a3;
}

- (void)_getGradientMaskBounds:(CGRect *)a3 startInsets:(UIEdgeInsets *)a4 endInsets:(UIEdgeInsets *)a5 intensities:(UIEdgeInsets *)a6
{
  [(UIScrollView *)self _effectiveGradientMaskLengths];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(UIView *)self bounds];
  double v20 = v19;
  double v22 = v21;
  double v70 = v24;
  double v71 = v23;
  [(UIScrollView *)self contentSize];
  double v66 = v26;
  double v67 = v25;
  [(UIScrollView *)self _effectiveContentInset];
  double v31 = 1.0;
  double v32 = 1.0;
  if (v12 > 0.0)
  {
    double v33 = fmin(v12, 15.0);
    accuracdouble y = self->_accuracy;
    double v35 = v22 + v27;
    if (accuracy == 1.0)
    {
      double v37 = round(v35);
    }
    else
    {
      double v36 = floor(v35);
      double v37 = v36 + round((v35 - v36) * accuracy) / accuracy;
    }
    if (v37 >= v33) {
      double v32 = 1.0;
    }
    else {
      double v32 = v37 / v33;
    }
  }
  if (v14 > 0.0)
  {
    double v38 = fmin(v14, 15.0);
    double v39 = self->_accuracy;
    double v40 = v20 + v28;
    if (v39 == 1.0)
    {
      double v42 = round(v40);
    }
    else
    {
      double v41 = floor(v40);
      double v42 = v41 + round((v40 - v41) * v39) / v39;
    }
    if (v42 >= v38) {
      double v31 = 1.0;
    }
    else {
      double v31 = v42 / v38;
    }
  }
  CGFloat v68 = v32;
  CGFloat v69 = v31;
  double v43 = 1.0;
  double v44 = 1.0;
  if (v16 > 0.0)
  {
    double v45 = self->_accuracy;
    double v46 = fmin(v16, 15.0);
    double v47 = v66 - (v22 + v70 - v29);
    if (v45 == 1.0)
    {
      double v49 = round(v47);
    }
    else
    {
      double v48 = floor(v47);
      double v49 = v48 + round((v47 - v48) * v45) / v45;
    }
    if (v49 >= v46) {
      double v44 = 1.0;
    }
    else {
      double v44 = v49 / v46;
    }
  }
  if (v18 > 0.0)
  {
    double v50 = self->_accuracy;
    double v51 = fmin(v18, 15.0);
    double v52 = v67 - (v20 + v71 - v30);
    if (v50 == 1.0)
    {
      double v54 = round(v52);
    }
    else
    {
      double v53 = floor(v52);
      double v54 = v53 + round((v52 - v53) * v50) / v50;
    }
    if (v54 >= v51) {
      double v43 = 1.0;
    }
    else {
      double v43 = v54 / v51;
    }
  }
  if ([(UIView *)self clipsToBounds])
  {
    double v55 = v70;
  }
  else
  {
    double v56 = v70 - fmin(v12, 0.0);
    double v57 = -0.0;
    if (v12 >= 0.0) {
      double v58 = -0.0;
    }
    else {
      double v58 = v12;
    }
    double v22 = v22 + v58;
    double v59 = v71 - fmin(v14, 0.0);
    if (v14 < 0.0) {
      double v57 = v14;
    }
    double v20 = v20 + v57;
    double v55 = v56 - fmin(v16, 0.0);
    double v60 = v59 - v18;
    if (v18 >= 0.0) {
      double v60 = v59;
    }
    double v71 = v60;
  }
  double top = self->_gradientMaskEdgeInsets.top;
  double left = self->_gradientMaskEdgeInsets.left;
  double bottom = self->_gradientMaskEdgeInsets.bottom;
  double right = self->_gradientMaskEdgeInsets.right;
  if (a3)
  {
    a3->origin.double x = v20;
    a3->origin.double y = v22;
    a3->size.CGFloat width = v71;
    a3->size.CGFloat height = v55;
  }
  if (a4)
  {
    long long v65 = *(_OWORD *)&self->_gradientMaskEdgeInsets.bottom;
    *(_OWORD *)&a4->double top = *(_OWORD *)&self->_gradientMaskEdgeInsets.top;
    *(_OWORD *)&a4->double bottom = v65;
  }
  if (a5)
  {
    a5->double top = v12 + top;
    a5->double left = v14 + left;
    a5->double bottom = v16 + bottom;
    a5->double right = v18 + right;
  }
  if (a6)
  {
    a6->double top = v68;
    a6->double left = v69;
    a6->double bottom = v44;
    a6->double right = v43;
  }
}

- (BOOL)_shouldTrackImmediatelyWhileDecelerating
{
  BOOL v3 = [(UIScrollView *)self tracksImmediatelyWhileDecelerating]
    || [(UIScrollView *)self _avoidsJumpOnInterruptedBounce];
  if ([(UIScrollView *)self _isBouncing]
    && (self->_parentAdjustment.x != 0.0 || self->_parentAdjustment.y != 0.0))
  {
    return 0;
  }
  return v3;
}

- (void)_clearParentAdjustment
{
  BOOL v3 = [(UIView *)self _containingScrollView];
  [(UIScrollView *)self _stopDraggingParent:v3];

  [(UIScrollView *)self _adjustContentOffsetIfNecessary];
}

- (double)_offsetWithoutDecorationForRubberBandOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6
{
  [(UIScrollView *)self _currentRubberBandCoefficient];
  if (a5 >= a4) {
    double v11 = a5;
  }
  else {
    double v11 = a4;
  }
  if (fabs(a6) >= 2.22044605e-16)
  {
    if (v11 >= a3)
    {
      if (a3 < a5)
      {
        double v13 = (a5 - a3) / a6 + -1.0;
        if (fabs(v13) >= 2.22044605e-16) {
          return a5 - (-1.0 / v13 + -1.0) / v10 * a6;
        }
      }
    }
    else
    {
      double v12 = (a3 - v11) / a6 + -1.0;
      if (fabs(v12) >= 2.22044605e-16) {
        return v11 + (-1.0 / v12 + -1.0) / v10 * a6;
      }
    }
  }
  return a3;
}

- (double)_offsetForRubberBandOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6
{
  double v11 = [(UIScrollView *)self _refreshControl];
  double v12 = v11;
  if (a3 >= a5 || v11 == 0)
  {
LABEL_7:
    [(UIScrollView *)self _offsetWithoutDecorationForRubberBandOffset:a3 maxOffset:a4 minOffset:a5 range:a6];
    a3 = v15;
    goto LABEL_8;
  }
  [v11 _refreshControlHeight];
  if (a5 - v14 >= a3)
  {
    if (![v12 _areInsetsBeingApplied])
    {
      [v12 _refreshControlHeight];
      [(UIScrollView *)self _offsetWithoutDecorationForRubberBandOffset:v17 + a3 maxOffset:a4 minOffset:a5 range:a6];
      double v19 = v18;
      [v12 _refreshControlHeight];
      a3 = v19 - v20;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:

  return a3;
}

- (double)_shadowHeightOffset
{
  return 0.0;
}

- (void)_addRefreshInset:(double)a3
{
  [(UIScrollView *)self contentOffset];
  double v6 = v5;
  double v8 = v7;
  if (dyld_program_sdk_at_least() && self->_contentInsetAdjustmentBehavior != 2)
  {
    self->_refreshControlContentInsetdouble Height = self->_refreshControlContentInsetHeight + a3;
    [(UIScrollView *)self _updateForChangedScrollRelatedInsets];
    [(UIScrollView *)self _updateForChangedScrollIndicatorRelatedInsets];
  }
  else
  {
    [(UIScrollView *)self contentInset];
    [(UIScrollView *)self setContentInset:v9 + a3];
  }
  -[UIScrollView setContentOffset:](self, "setContentOffset:", v6, v8);
}

- (void)_removeRefreshInset:(double)a3
{
  [(UIScrollView *)self contentOffset];
  double v6 = v5;
  double v8 = v7;
  if (dyld_program_sdk_at_least() && self->_contentInsetAdjustmentBehavior != 2)
  {
    self->_refreshControlContentInsetdouble Height = self->_refreshControlContentInsetHeight - a3;
    [(UIScrollView *)self _updateForChangedScrollRelatedInsets];
    [(UIScrollView *)self _updateForChangedScrollIndicatorRelatedInsets];
  }
  else
  {
    [(UIScrollView *)self contentInset];
    [(UIScrollView *)self setContentInset:v9 - a3];
  }
  -[UIScrollView setContentOffset:](self, "setContentOffset:", v6, v8);
}

- (void)_adjustStartOffsetForGrabbedBouncingScrollView
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIScrollView *)self contentOffset];
  double v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self _effectiveContentInset];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if (-[_UIScrollViewScrollableAncestor _descendentScrollView:shouldPreserveStartOffset:](self->_scrollableAncestor, "_descendentScrollView:shouldPreserveStartOffset:", self, self->_startOffsetX, self->_startOffsetY))return; {
  accuracdouble y = self->_accuracy;
  }
  p_firstPageOffset = &self->_firstPageOffset;
  double v21 = self->_firstPageOffset.horizontal - v14;
  if (accuracy == 1.0)
  {
    double v23 = round(v21);
    if (v8 < v23) {
      goto LABEL_29;
    }
    double v36 = round(self->_firstPageOffset.vertical - v12);
    if (v10 < v36) {
      goto LABEL_21;
    }
    double v37 = round(v18 + self->_contentSize.width) - v4;
    if (v23 >= v37) {
      double v37 = v23;
    }
    if (v8 > v37) {
      goto LABEL_21;
    }
    double v38 = round(v16 + self->_contentSize.height) - v6;
    if (v36 < v38) {
      double v36 = v38;
    }
    if (v10 > v36)
    {
LABEL_21:
      if (v8 < v23) {
        goto LABEL_29;
      }
      double v35 = round(v18 + self->_contentSize.width);
      goto LABEL_23;
    }
  }
  else
  {
    double v22 = floor(v21);
    double v23 = v22 + round(accuracy * (v21 - v22)) / accuracy;
    if (v8 < v23) {
      goto LABEL_29;
    }
    double v24 = self->_firstPageOffset.vertical - v12;
    double v25 = floor(v24);
    double v26 = v25 + round(accuracy * (v24 - v25)) / accuracy;
    if (v10 < v26) {
      goto LABEL_12;
    }
    double v27 = v18 + self->_contentSize.width;
    double v28 = floor(v27);
    double v29 = v28 + round(accuracy * (v27 - v28)) / accuracy - v4;
    if (v23 >= v29) {
      double v29 = v23;
    }
    if (v8 > v29) {
      goto LABEL_12;
    }
    double v30 = v16 + self->_contentSize.height;
    double v31 = floor(v30);
    double v32 = v31 + round(accuracy * (v30 - v31)) / accuracy - v6;
    if (v26 < v32) {
      double v26 = v32;
    }
    if (v10 > v26)
    {
LABEL_12:
      double v33 = v18 + self->_contentSize.width;
      double v34 = floor(v33);
      double v35 = v34 + round(accuracy * (v33 - v34)) / accuracy;
LABEL_23:
      double v39 = v35 - v4;
      if (v23 >= v39) {
        double v40 = v23;
      }
      else {
        double v40 = v39;
      }
      if (v8 <= v40)
      {
LABEL_30:
        double v41 = self->_firstPageOffset.vertical - v12;
        if (accuracy == 1.0)
        {
          double v43 = round(v41);
          if (v10 >= v43)
          {
            p_contentSize = &self->_contentSize;
            double v48 = round(v16 + self->_contentSize.height) - v6;
            if (v43 < v48) {
              double v43 = v48;
            }
            if (v10 <= v43)
            {
              double v49 = v18 + p_contentSize->width;
              goto LABEL_44;
            }
          }
        }
        else
        {
          double v42 = floor(v41);
          double v43 = v42 + round(accuracy * (v41 - v42)) / accuracy;
          if (v10 >= v43)
          {
            double v44 = v16 + self->_contentSize.height;
            double v45 = floor(v44);
            double v46 = v45 + round(accuracy * (v44 - v45)) / accuracy - v6;
            if (v43 < v46) {
              double v43 = v46;
            }
            if (v10 <= v43)
            {
LABEL_41:
              p_contentSize = &self->_contentSize;
              double v49 = v18 + self->_contentSize.width;
              if (accuracy != 1.0)
              {
                double v50 = floor(v49);
                double v51 = v50 + round(accuracy * (v49 - v50)) / accuracy;
                double v52 = p_firstPageOffset->horizontal - v14;
                double v53 = floor(v52);
                double v54 = v53 + round(accuracy * (v52 - v53)) / accuracy;
                double v55 = floor(v4);
                double v56 = v55 + round((v4 - v55) * accuracy) / accuracy;
LABEL_45:
                [(UIScrollView *)self _offsetForRubberBandOffset:v8 maxOffset:v51 - v4 minOffset:v54 range:v56];
                double v58 = v57;
                double v59 = self->_accuracy;
                double v60 = v16 + p_contentSize->height;
                if (v59 == 1.0)
                {
                  double v62 = round(v60);
                  double v65 = round(self->_firstPageOffset.vertical - v12);
                  double v67 = round(v6);
                }
                else
                {
                  double v61 = floor(v60);
                  double v62 = v61 + round(v59 * (v60 - v61)) / v59;
                  double v63 = self->_firstPageOffset.vertical - v12;
                  double v64 = floor(v63);
                  double v65 = v64 + round(v59 * (v63 - v64)) / v59;
                  double v66 = floor(v6);
                  double v67 = v66 + round((v6 - v66) * v59) / v59;
                }
                [(UIScrollView *)self _offsetForRubberBandOffset:v10 maxOffset:v62 - v6 minOffset:v65 range:v67];
                pan = self->_pan;
                double v70 = self->_startOffsetY - v69;
                double v71 = self->_startOffsetX - v58;
                -[UIPanGestureRecognizer setTranslation:inView:](pan, "setTranslation:inView:", self, v71, v70);
                return;
              }
LABEL_44:
              double v51 = round(v49);
              double v54 = round(p_firstPageOffset->horizontal - v14);
              double v56 = round(v4);
              goto LABEL_45;
            }
          }
        }
        self->_double startOffsetY = v43;
        accuracdouble y = self->_accuracy;
        goto LABEL_41;
      }
      if (v23 < v39) {
        double v23 = v39;
      }
LABEL_29:
      self->_double startOffsetX = v23;
      accuracdouble y = self->_accuracy;
      goto LABEL_30;
    }
  }
}

- (void)_adjustBackgroundShadowsForContentSizeForcedVisible:(BOOL)a3 withOffset:(double)a4
{
  BOOL v4 = a3;
  [(UIScrollView *)self contentSize];
  double v93 = v6;
  double v8 = v7;
  [(UIView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v94 = v13;
  double v15 = v14;
  [(UIScrollView *)self contentOffset];
  double v91 = v17;
  double v92 = v16;
  [(UIView *)self safeAreaInsets];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  char v26 = [(UIScrollView *)self _edgesApplyingSafeAreaInsetsToContentInset];
  double v27 = 0.0;
  double v28 = v21 + 0.0;
  if ((v26 & 2) == 0) {
    double v28 = 0.0;
  }
  double v29 = v23 + 0.0;
  if ((v26 & 4) == 0) {
    double v29 = 0.0;
  }
  if ((v26 & 8) != 0) {
    double v27 = v25 + 0.0;
  }
  BOOL v30 = 1;
  if (v4 || v8 <= 0.0)
  {
    BOOL v32 = v4;
    BOOL v33 = v4;
    int v34 = v4;
    double v35 = v10;
    double v31 = v94;
  }
  else
  {
    double v31 = v94;
    BOOL v32 = v4;
    BOOL v33 = v4;
    int v34 = v4;
    double v35 = v10;
    if (v93 > 0.0)
    {
      double v36 = v19 + 0.0;
      if ((v26 & 1) == 0) {
        double v36 = 0.0;
      }
      accuracdouble y = self->_accuracy;
      double v38 = -self->_contentInset.top - v36;
      if (accuracy == 1.0)
      {
        double v40 = round(v38);
        BOOL v33 = v12 + v15 > round(v29 + self->_contentSize.height + self->_contentInset.bottom) + a4;
        double v45 = round(-self->_contentInset.left - v28);
        double v48 = round(v27 + self->_contentSize.width + self->_contentInset.right);
      }
      else
      {
        double v39 = floor(v38);
        double v40 = v39 + round(accuracy * (v38 - v39)) / accuracy;
        double v41 = v29 + self->_contentSize.height + self->_contentInset.bottom;
        double v42 = floor(v41);
        BOOL v33 = v12 + v15 > v42 + round(accuracy * (v41 - v42)) / accuracy + a4;
        double v43 = -self->_contentInset.left - v28;
        double v44 = floor(v43);
        double v45 = v44 + round(accuracy * (v43 - v44)) / accuracy;
        double v46 = v27 + self->_contentSize.width + self->_contentInset.right;
        double v47 = floor(v46);
        double v48 = v47 + round(accuracy * (v46 - v47)) / accuracy;
      }
      BOOL v32 = v91 < v40;
      BOOL v4 = v92 < v45;
      BOOL v30 = v10 + v94 > v48;
      int v34 = v30;
    }
  }
  AdjustShadowWithOffset(*self->_shadows, 1, v32 || v4 || v30, v35, v12, v31, v15, 0.0);
  AdjustShadowWithOffset(self->_shadows[1], 4, v33 || v4 || v30, v35, v12, v31, v15, 0.0);
  double v49 = +[UIDevice currentDevice];
  uint64_t v50 = [v49 userInterfaceIdiom];

  double v51 = self->_accuracy;
  double width = self->_contentSize.width;
  if ((v50 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (v51 == 1.0)
    {
      double v54 = round(width);
      double v57 = round(self->_contentSize.height);
    }
    else
    {
      double v53 = floor(width);
      double v54 = v53 + round(v51 * (width - v53)) / v51;
      double height = self->_contentSize.height;
      double v56 = floor(height);
      double v57 = v56 + round(v51 * (height - v56)) / v51;
    }
    double v63 = v54 + 20.0 + -6.0;
    double v64 = -5.0;
    double v65 = v57 + 20.0 + -5.0;
    double v66 = -7.0;
  }
  else
  {
    if (v51 == 1.0)
    {
      double v59 = round(width);
      double v62 = round(self->_contentSize.height);
    }
    else
    {
      double v58 = floor(width);
      double v59 = v58 + round(v51 * (width - v58)) / v51;
      double v60 = self->_contentSize.height;
      double v61 = floor(v60);
      double v62 = v61 + round(v51 * (v60 - v61)) / v51;
    }
    double v63 = v59 + 60.0;
    double v65 = v62 + 60.0;
    double v66 = -30.0;
    double v64 = -30.0;
  }
  AdjustShadowWithOffset(self->_shadows[6], 3, v4 && v32, v66, v64, v63, v65, 0.0);
  AdjustShadowWithOffset(self->_shadows[8], 9, v32 & v34, v66, v64, v63, v65, 0.0);
  AdjustShadowWithOffset(self->_shadows[7], 6, v33 && v4, v66, v64, v63, v65, a4);
  double v95 = v63;
  AdjustShadowWithOffset(self->_shadows[9], 12, v34 & v33, v66, v64, v63, v65, a4);
  double v67 = +[UIDevice currentDevice];
  uint64_t v68 = [v67 userInterfaceIdiom];

  char v69 = 2;
  if (!v4) {
    char v69 = 0;
  }
  char v70 = 8;
  if (!v34) {
    char v70 = 0;
  }
  if ((v68 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v71 = 10.0;
  }
  else {
    double v71 = 54.0;
  }
  double v72 = UIRectInsetEdges(v70 | v69, v66, v64, v63, v65, v71);
  double v74 = v73;
  double v76 = v75;
  double v78 = v77;
  AdjustShadowWithOffset(self->_shadows[2], 1, v32, v72, v73, v75, v77, 0.0);
  AdjustShadowWithOffset(self->_shadows[3], 4, v33, v72, v74, v76, v78, a4);
  uint64_t v79 = +[UIDevice currentDevice];
  uint64_t v80 = [v79 userInterfaceIdiom];

  if ((v80 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v81 = 10.0;
  }
  else {
    double v81 = 54.0;
  }
  if (v33) {
    char v82 = 4;
  }
  else {
    char v82 = 0;
  }
  double v83 = UIRectInsetEdges(v82 | v32, v66, v64, v95, v65, v81);
  double v85 = v84;
  double v87 = v86;
  double v89 = v88;
  AdjustShadowWithOffset(self->_shadows[4], 2, v4, v83, v84, v86, v88, 0.0);
  float64x2_t v90 = (void *)*((void *)self->_shadows + 5);
  AdjustShadowWithOffset(v90, 8, v34, v83, v85, v87, v89, 0.0);
}

- (void)_adjustBackgroundShadowsForContentSizeForcedVisible:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIScrollView *)self _shadowHeightOffset];
  -[UIScrollView _adjustBackgroundShadowsForContentSizeForcedVisible:withOffset:](self, "_adjustBackgroundShadowsForContentSizeForcedVisible:withOffset:", v3);
}

- (void)_stopScrollDecelerationNotify:(BOOL)a3
{
  scrollHeartbeat = self->_scrollHeartbeat;
  if (scrollHeartbeat)
  {
    BOOL v4 = a3;
    double v6 = scrollHeartbeat;
    double v7 = self->_scrollHeartbeat;
    self->_scrollHeartbeat = 0;

    *(void *)((char *)&self->_scrollViewFlags + 12) &= ~0x8000000000000uLL;
    if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((BOOL)self)
      || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((BOOL)self))
    {
      [(UIScrollView *)self _adjustScrollerIndicators:0 alwaysShowingThem:0];
    }
    [(UIScrollView *)self _unregisterForSpringBoardBlankedScreenNotification];
    double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 removeObserver:self name:@"_UIApplicationRunLoopModePopNotification" object:UIApp];

    [(UIScrollView *)self _popTrackingRunLoopModeIfNecessaryForReason:@"Deceleration stopped"];
    [(CADisplayLink *)v6 invalidate];
    -[_UIScrollViewVFD deactivateSubreason:]((uint64_t)self->_vfd, 3);
    _UIQOSManagedCommitsEnd(self, @"Deceleration");
    [(UIScrollView *)self _endActivityTrackingIfNeededForReason:0];
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25A528);
    double v10 = *(id *)(CategoryCachedImpl + 8);
    if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
      && os_signpost_enabled(v10))
    {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    unint64_t v11 = __UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25A530);
    double v12 = *(id *)(v11 + 8);
    if (os_signpost_id_make_with_pointer(*(os_log_t *)(v11 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
      && os_signpost_enabled(v12))
    {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    self->_telemetryOffsetChangeHighRateDuration = 0.0;
    self->_telemetryOffsetChangeCount = 0;
    self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E4F1DB30];
    kdebug_trace();
    if (v4)
    {
      [(UIScrollView *)self _scrollViewDidEndDeceleratingForDelegate];
      double v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:@"DidEndSmoothScrolling" object:self];
    }
  }
}

- (BOOL)_canCancelContentTouches:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (!v5)
  {
    id v7 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = v5;
  id v7 = 0;
  uint64_t v8 = *(void *)v29;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v4);
      }
      double v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
      uint64_t v11 = [v10 view];
      if (v11)
      {
        double v12 = (void *)v11;
        double v13 = [v10 view];
        if (v13 != self)
        {
          double v14 = v13;
          if ([v10 isDelayed])
          {
            uint64_t v15 = [v10 phase];

            if (v15 != 3) {
              goto LABEL_14;
            }
            if (v7)
            {
LABEL_11:
              double v12 = [v10 view];
              [v7 addObject:v12];
LABEL_13:

              goto LABEL_14;
            }
          }
          else
          {

            if (v7) {
              goto LABEL_11;
            }
          }
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          goto LABEL_11;
        }

        goto LABEL_13;
      }
LABEL_14:
      ++v9;
    }
    while (v6 != v9);
    uint64_t v16 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    uint64_t v6 = v16;
  }
  while (v16);
LABEL_21:
  if ((*((unsigned char *)&self->_scrollViewFlags + 2) & 2) != 0 || ![v7 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          if (!-[UIScrollView touchesShouldCancelInContentView:](self, "touchesShouldCancelInContentView:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24))
          {
            BOOL v17 = 0;
            goto LABEL_34;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    BOOL v17 = 1;
LABEL_34:
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)_setContentOffsetAnimationDuration:(double)a3
{
  self->_contentOffsetAnimationDuration = a3;
}

- (double)_contentOffsetAnimationDuration
{
  return self->_contentOffsetAnimationDuration;
}

- (void)_clearContentOffsetAnimation:(id)a3
{
  p_animation = &self->_animation;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_animation);

  if (WeakRetained == v5) {
    objc_storeWeak((id *)p_animation, 0);
  }
  id v7 = objc_loadWeakRetained((id *)p_animation);

  if (!v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__UIScrollView__clearContentOffsetAnimation___block_invoke;
    v8[3] = &unk_1E530F458;
    v8[4] = self;
    -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v8);
  }
}

uint64_t __45__UIScrollView__clearContentOffsetAnimation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 _observeScrollViewHasClearedContentOffsetAnimation:v5];
  }
  return result;
}

- (void)_clearContentOffsetAnimation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  [(UIScrollView *)self _clearContentOffsetAnimation:WeakRetained];
}

- (void)_beginDeferredContentOffsetTransitionToOffset:(CGPoint)a3 contentSize:(CGSize)a4
{
  self->_BOOL deferredUpdateTargetIsValid = 1;
  self->_deferredUpdateTargetContentOffset = a3;
  self->_deferredUpdateTargetContentSize = a4;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__UIScrollView__beginDeferredContentOffsetTransitionToOffset_contentSize___block_invoke;
  v4[3] = &unk_1E530F630;
  v4[4] = self;
  CGPoint v5 = a3;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __74__UIScrollView__beginDeferredContentOffsetTransitionToOffset_contentSize___block_invoke(double *a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *((void *)a1 + 4);
    double v6 = a1[5];
    double v7 = a1[6];
    return objc_msgSend(a2, "_observeScrollView:didBeginTransitionToDeferredContentOffset:", v5, v6, v7);
  }
  return result;
}

- (void)_commitDeferredContentOffsetTransition
{
  if (self->_deferredUpdateTargetIsValid)
  {
    -[UIScrollView setContentOffset:](self, "setContentOffset:", self->_deferredUpdateTargetContentOffset.x, self->_deferredUpdateTargetContentOffset.y);
    -[UIScrollView setContentSize:](self, "setContentSize:", self->_deferredUpdateTargetContentSize.width, self->_deferredUpdateTargetContentSize.height);
    self->_BOOL deferredUpdateTargetIsValid = 0;
  }
}

- (void)_cancelDeferredContentOffsetTransition
{
  self->_BOOL deferredUpdateTargetIsValid = 0;
}

- (CGSize)_contentSizeOrDeferredContentSize
{
  if (self->_deferredUpdateTargetIsValid)
  {
    double width = self->_deferredUpdateTargetContentSize.width;
    double height = self->_deferredUpdateTargetContentSize.height;
  }
  else
  {
    [(UIScrollView *)self contentSize];
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setContentOffset:(CGPoint)a3 duration:(double)a4 animationCurve:(int)a5
{
}

- (void)_setContentOffset:(CGPoint)a3 duration:(double)a4 animationCurve:(int)a5 animationConfigurator:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  double y = a3.y;
  double x = a3.x;
  id v12 = a6;
  if (a4 <= 0.0)
  {
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, x, y);
  }
  else
  {
    double contentOffsetAnimationDuration = self->_contentOffsetAnimationDuration;
    [(UIScrollView *)self _setContentOffsetAnimationDuration:a4];
    -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:", 1, v6, 1, 0, v12, x, y);
    [(UIScrollView *)self _setContentOffsetAnimationDuration:contentOffsetAnimationDuration];
  }
}

- (void)_setContentOffsetWithDecelerationAnimation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  _smoothDecelerationAnimation();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIScrollView _setContentOffset:animation:](self, "_setContentOffset:animation:", v6, x, y);
}

- (void)_setContentOffset:(CGPoint)a3 animation:(id)a4
{
}

- (void)_setAbsoluteContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
}

- (void)_animateScrollToContentOffset:(CGPoint)a3 animationCurve:(int)a4 animationAdjustsForContentOffsetDelta:(BOOL)a5 animation:(id)a6
{
}

- (void)_animateScrollToContentOffset:(CGPoint)a3 animationCurve:(int)a4 animationAdjustsForContentOffsetDelta:(BOOL)a5 animation:(id)a6 animationConfigurator:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  id v25 = a6;
  double v14 = (void (**)(id, UIScrollViewScrollAnimation *))a7;
  uint64_t v15 = [(UIAnimation *)[UIScrollViewScrollAnimation alloc] initWithTarget:self];
  [(UIScrollView *)self _originalOffsetForAnimatedSetContentOffset];
  v15->_originalOffset.double x = v16;
  v15->_originalOffset.double y = v17;
  v15->_targetOffset.double x = x;
  v15->_targetOffset.double y = y;
  -[UIScrollView _adjustedContentOffsetForContentOffset:](self, "_adjustedContentOffsetForContentOffset:", x, y);
  BOOL v19 = x == v18;
  if (y != v20) {
    BOOL v19 = 0;
  }
  v15->_targetOffsetValidAtStart = v19;
  v15->_accuracdouble y = self->_accuracy;
  v15->_adjustsForContentOffsetDelta = a5;
  if (self->_scrollViewFlags.shouldRevealScrollIndicators)
  {
    [(UIScrollViewScrollAnimation *)v15 setRevealsHorizontalScrollIndicator:v15->_originalOffset.x != v15->_targetOffset.x];
    [(UIScrollViewScrollAnimation *)v15 setRevealsVerticalScrollIndicator:v15->_originalOffset.y != v15->_targetOffset.y];
  }
  [(UIAnimation *)v15 setDelegate:self];
  if (v25)
  {
    [v25 duration];
    double contentOffsetAnimationDuration = v21;
    objc_storeStrong((id *)&v15->_customAnimation, a6);
    if (!v14) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double contentOffsetAnimationDuration = self->_contentOffsetAnimationDuration;
  [(UIAnimation *)v15 setAnimationCurve:v10];
  if (v14) {
LABEL_7:
  }
    v14[2](v14, v15);
LABEL_8:
  double v23 = +[UIAnimator sharedAnimator];
  [v23 addAnimation:v15 withDuration:1 start:contentOffsetAnimationDuration];

  long long v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v24 postNotificationName:@"UITextSelectionWillScroll" object:self];

  objc_storeWeak((id *)&self->_animation, v15);
}

- (void)_updateScrollAnimationForChangedTargetOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id WeakRetained = (CGFloat *)objc_loadWeakRetained((id *)&self->_animation);
  if (WeakRetained)
  {
    WeakRetained[13] = x;
    WeakRetained[14] = y;
  }
}

- (CGPoint)_animationTargetContentOffset
{
  p_animation = &self->_animation;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animation);

  if (WeakRetained)
  {
    uint64_t v5 = (double *)objc_loadWeakRetained((id *)p_animation);
    double v6 = v5[13];
    double v7 = v5[14];
  }
  else
  {
    [(UIScrollView *)self contentOffset];
    double v6 = v8;
    double v7 = v9;
  }
  double v10 = v6;
  double v11 = v7;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)_forceDelegateScrollViewDidZoom:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)((char *)&self->_scrollViewFlags + 12) = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (void)_delegateScrollViewAnimationEnded
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained scrollViewDidEndScrollingAnimation:self];
  }
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIScrollViewAnimationEndedNotification" object:self];
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  uint64_t v5 = a3;
  uint64_t v6 = *(void *)((char *)&self->_scrollViewFlags + 12);
  id v12 = v5;
  if ((v6 & 3) == 0)
  {
    [(UIScrollView *)self _hideScrollIndicators];
    uint64_t v6 = *(void *)((char *)&self->_scrollViewFlags + 12);
  }
  int v7 = *((_DWORD *)&self->_scrollViewFlags + 5);
  if ((v6 & 0x2000) != 0)
  {
    *(void *)((char *)&self->_scrollViewFlags + 12) = v6 & 0xFFFFFFFFFFFFDFFFLL;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v7;
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
      [WeakRetained scrollViewDidScrollToTop:self];
    }
  }
  else
  {
    if ((v6 & 0x4000) != 0)
    {
      *(void *)((char *)&self->_scrollViewFlags + 12) = v6 & 0xFFFFFFFFFFFFBFFFLL;
      *((_DWORD *)&self->_scrollViewFlags + 5) = v7;
      double v9 = [(UIView *)self traitCollection];
      if ([v9 userInterfaceIdiom] == 3 && !-[UIScrollView isPagingEnabled](self, "isPagingEnabled"))
      {
        int64_t touchLevel = self->_touchLevel;

        if (touchLevel != 2 && [(UIScrollView *)self _bounceForCarPlayIfNecessary]) {
          goto LABEL_20;
        }
      }
      else
      {
      }
      [(UIScrollView *)self _scrollViewDidEndDeceleratingForDelegate];
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v12[152])
    {
      if (!v12[153] && (*((unsigned char *)&self->_scrollViewFlags + 4) & 1) == 0) {
        [(UIScrollView *)self _endScrollingCursorOverrideIfNecessary];
      }
    }
    else if (!self->_scrollAnimatingViaAssertion)
    {
      [(UIScrollView *)self _delegateScrollViewAnimationEnded];
    }
  }
LABEL_20:
  double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"UITextSelectionDidScroll" object:self];
}

- (void)animator:(id)a3 startAnimation:(id)a4
{
  self->_telemetryOffsetChangeHighRateDuration = 0.0;
  self->_telemetryOffsetChangeCount = 0;
  self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E4F1DB30];
  _UIQOSManagedCommitsBegin(self, @"Animation");
  -[_UIScrollViewVFD activateSubreason:]((uint64_t)self->_vfd, 4);
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &animator_startAnimation____s_category);
  uint64_t v6 = *(id *)(CategoryCachedImpl + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v6))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  [(UIScrollView *)self _beginActivityTrackingIfNeededForReason:1];
}

- (void)animator:(id)a3 stopAnimation:(id)a4 fraction:(float)a5
{
  [(UIScrollView *)self _scrollViewAnimationEnded:a4 finished:a5 >= 1.0];
  -[_UIScrollViewVFD deactivateSubreason:]((uint64_t)self->_vfd, 4);
  _UIQOSManagedCommitsEnd(self, @"Animation");
  [(UIScrollView *)self _endActivityTrackingIfNeededForReason:1];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &animator_stopAnimation_fraction____s_category);
  int v7 = *(id *)(CategoryCachedImpl + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v7))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  self->_telemetryOffsetChangeHighRateDuration = 0.0;
  self->_telemetryOffsetChangeCount = 0;
  self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E4F1DB30];
}

- (BOOL)_scrollsToMakeFirstResponderVisible
{
  return 1;
}

- (double)_touchDelayForScrollDetection
{
  return 0.15;
}

- (double)_horizontalVelocity
{
  return self->_horizontalVelocity;
}

- (void)_setContentOffsetPinned:(CGPoint)a3 animated:(BOOL)a4
{
  -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", a4, a3.x, a3.y);
  [(UIScrollView *)self _adjustContentOffsetIfNecessary];
}

- (void)_setContentScrollInset:(UIEdgeInsets)a3
{
  if (self->_contentScrollInset.left != a3.left
    || self->_contentScrollInset.top != a3.top
    || self->_contentScrollInset.right != a3.right
    || self->_contentScrollInset.bottom != a3.bottom)
  {
    self->_contentScrollInset = a3;
    [(UIScrollView *)self _updateForChangedScrollRelatedInsets];
  }
}

- (int64_t)_indicatorInsetAdjustmentBehavior
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 7) & 3;
}

- (BOOL)automaticallyAdjustsScrollIndicatorInsets
{
  return [(UIScrollView *)self _edgesApplyingBaseInsetsToScrollIndicatorInsets] != 0;
}

- (BOOL)_clipsGlyphPathFrame:(CGRect)a3 shouldContinueSuperviewTraversal:(BOOL *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)UIScrollView;
  unsigned int v10 = -[UIView _clipsGlyphPathFrame:shouldContinueSuperviewTraversal:](&v35, sel__clipsGlyphPathFrame_shouldContinueSuperviewTraversal_);
  if ([(UIScrollView *)self isScrollEnabled])
  {
    *a4 = 0;
    double v11 = [(UIView *)self _window];
    if (v11) {
      unsigned int v12 = v10;
    }
    else {
      unsigned int v12 = 0;
    }
    if (v12 == 1)
    {
      p_contentSize = &self->_contentSize;
      if (fabs(self->_contentSize.width) < 2.22044605e-16
        && ([(UIView *)self frame], fabs(v14) >= 2.22044605e-16)
        || fabs(self->_contentSize.height) < 2.22044605e-16
        && ([(UIView *)self frame], fabs(v15) >= 2.22044605e-16))
      {
        long long v31 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIScrollView", &_clipsGlyphPathFrame_shouldContinueSuperviewTraversal____s_category)+ 8);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          double v32 = p_contentSize->width;
          CGFloat v33 = p_contentSize->height;
          *(_DWORD *)long long buf = 134218240;
          double v37 = v32;
          __int16 v38 = 2048;
          CGFloat v39 = v33;
          _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "Clipping detection failed because _contentSize has a zero width/height. {%f, %f}", buf, 0x16u);
        }
        LOBYTE(v10) = 0;
      }
      else
      {
        [(UIScrollView *)self contentInset];
        double v17 = -v16;
        [(UIScrollView *)self contentInset];
        double v19 = -v18;
        [(UIScrollView *)self contentInset];
        double v21 = v20;
        [(UIScrollView *)self contentInset];
        CGFloat v23 = p_contentSize->width + v21 + v22;
        [(UIScrollView *)self contentInset];
        double v25 = v24;
        [(UIScrollView *)self contentInset];
        -[UIView convertRect:toView:](self, "convertRect:toView:", v11, v17, v19, v23, self->_contentSize.height + v25 + v26);
        v42.origin.CGFloat x = v27;
        v42.origin.CGFloat y = v28;
        v42.size.CGFloat width = v29;
        v42.size.CGFloat height = v30;
        v41.origin.CGFloat x = x;
        v41.origin.CGFloat y = y;
        v41.size.CGFloat width = width;
        v41.size.CGFloat height = height;
        unsigned int v10 = !CGRectIntersectsRect(v41, v42);
      }
    }
  }
  return v10;
}

- (CGPoint)_animatedOriginalOffset
{
  p_animation = &self->_animation;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  if (WeakRetained)
  {
    id v4 = (double *)objc_loadWeakRetained((id *)p_animation);
    double v6 = v4[11];
    double v5 = v4[12];
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v7 = v6;
  double v8 = v5;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (CGPoint)_animatedTargetOffset
{
  p_animation = &self->_animation;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  if (WeakRetained)
  {
    id v4 = (double *)objc_loadWeakRetained((id *)p_animation);
    double v6 = v4[13];
    double v5 = v4[14];
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v7 = v6;
  double v8 = v5;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (CGPoint)_focusTargetOffset
{
  uint64_t v3 = [(UIView *)self _focusSystem];

  if (v3)
  {
    if ([(UIScrollView *)self isDecelerating])
    {
      id v4 = +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:self];
      double v5 = [v4 scrollManager];
      [v5 targetContentOffsetForScrollableContainer:self];
      double v7 = v6;
      double v9 = v8;
    }
    else
    {
      [(UIScrollView *)self contentOffset];
      double v7 = v10;
      double v9 = v11;
    }
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v12 = v7;
  double v13 = v9;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (void)_setShowsVerticalScrollIndicatorFlag:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (void)_setShowsHorizontalScrollIndicatorFlag:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t scrollViewFlags = *(void *)&self->_scrollViewFlags & 0xFFFFFFFFFEFFFFFFLL | v3;
}

uint64_t __72__UIScrollView__adjustForAutomaticKeyboardInfo_animated_lastAdjustment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:0 delay:a2 options:a3 animations:0.25 completion:0.0];
}

uint64_t __72__UIScrollView__adjustForAutomaticKeyboardInfo_animated_lastAdjustment___block_invoke_2(uint64_t a1)
{
  if (dyld_program_sdk_at_least())
  {
    *(void *)(*(void *)(a1 + 32) + 1248) = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) _updateForChangedScrollRelatedInsets];
    id v2 = *(void **)(a1 + 32);
    return [v2 _updateForChangedScrollIndicatorRelatedInsets];
  }
  else
  {
    [*(id *)(a1 + 32) contentInset];
    objc_msgSend(*(id *)(a1 + 32), "setContentInset:");
    [*(id *)(a1 + 32) scrollIndicatorInsets];
    id v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "setScrollIndicatorInsets:");
  }
}

- (unint64_t)_contentScrollableAxes
{
  BOOL v3 = [(UIScrollView *)self _contentScrollsAlongXAxis];
  BOOL v4 = [(UIScrollView *)self _contentScrollsAlongYAxis];
  unint64_t v5 = 2;
  if (!v4) {
    unint64_t v5 = 0;
  }
  unint64_t v6 = 3;
  if (!v4) {
    unint64_t v6 = 1;
  }
  if (v3) {
    return v6;
  }
  else {
    return v5;
  }
}

- (BOOL)_canScrollWithoutBouncingIncludingRevealableContentPaddingTopY
{
  [(UIScrollView *)self _revealableContentPadding];
  return [(UIScrollView *)self __canScrollWithoutBouncingYIncludingAdditionalContentInsetAmount:"__canScrollWithoutBouncingYIncludingAdditionalContentInsetAmount:"];
}

- (BOOL)_canScrollFromEdge:(unint64_t)a3
{
  [(UIScrollView *)self _revealableContentPadding];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIScrollView *)self _minimumContentOffset];
  double v14 = v13;
  double v16 = v15;
  [(UIScrollView *)self _maximumContentOffset];
  LOBYTE(v19) = 0;
  switch(a3)
  {
    case 1uLL:
      BOOL v19 = [(UIScrollView *)self _canScrollY];
      if (v19)
      {
        [(UIScrollView *)self contentOffset];
        BOOL v21 = v20 <= v16 - v6;
        goto LABEL_6;
      }
      break;
    case 2uLL:
      BOOL v19 = [(UIScrollView *)self _canScrollX];
      if (v19)
      {
        [(UIScrollView *)self contentOffset];
        BOOL v21 = v22 <= v14 - v8;
LABEL_6:
        LOBYTE(v19) = !v21;
      }
      break;
    case 4uLL:
      double v23 = v18;
      BOOL v19 = [(UIScrollView *)self _canScrollY];
      if (v19)
      {
        [(UIScrollView *)self contentOffset];
        BOOL v25 = v24 < v10 + v23;
        goto LABEL_13;
      }
      break;
    case 8uLL:
      double v26 = v17;
      BOOL v19 = [(UIScrollView *)self _canScrollX];
      if (v19)
      {
        [(UIScrollView *)self contentOffset];
        BOOL v25 = v27 < v12 + v26;
LABEL_13:
        LOBYTE(v19) = v25;
      }
      break;
    default:
      return v19;
  }
  return v19;
}

- (BOOL)_delegateShouldPanGestureTryToBegin
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained _scrollViewShouldPanGestureTryToBegin:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)_setAutoscrolling:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = 0x10000;
  }
  else
  {
    double v5 = +[UIAnimator sharedAnimator];
    [v5 removeAnimationsForTarget:self ofKind:objc_opt_class()];

    uint64_t v4 = 0;
    self->_double contentOffsetAnimationDuration = 0.3;
  }
  unint64_t v6 = *(void *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5);
  *(void *)((char *)&self->_scrollViewFlags + 12) = v6;
}

- (BOOL)_isAutoscrolling
{
  return (*(void *)((char *)&self->_scrollViewFlags + 12) >> 16) & 1;
}

- (CGRect)contentFrameForView:(id)a3
{
  id v4 = a3;
  double v5 = [v4 superview];

  if (v5 == self)
  {
    [v4 frame];
    double v7 = v11;
    double v8 = v12;
    double v9 = v13;
    double v10 = v14;
  }
  else
  {
    unint64_t v6 = [v4 _scroller];
    if (v6 == self)
    {
      [v4 bounds];
      objc_msgSend(v4, "convertRect:toView:", self);
      double v7 = v15;
      double v8 = v16;
      double v9 = v17;
      double v10 = v18;
    }
    else
    {
      double v7 = *MEMORY[0x1E4F1DB28];
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  double v19 = v7;
  double v20 = v8;
  double v21 = v9;
  double v22 = v10;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)_adjustShadowsIfNecessaryForOffset:(double)a3
{
  if (self->_shadows) {
    [(UIScrollView *)self _adjustBackgroundShadowsForContentSizeForcedVisible:0 withOffset:a3];
  }
}

- (id)_backgroundShadowForSlideAnimation
{
  if (self->_shadows)
  {
    BOOL v3 = +[UIDevice currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v5 = @"UIScrollerShadowEdgeFill.png";
    }
    else {
      double v5 = @"UIScrollerShadowFill.png";
    }
    unint64_t v6 = [UIImageView alloc];
    double v7 = _UIImageWithName(v5);
    double v8 = [(UIImageView *)v6 initWithImage:v7];

    CGAffineTransformMakeRotation(&v10, 3.14159265);
    [(UIView *)v8 setTransform:&v10];
    [self->_shadows[3] frame];
    -[UIImageView setFrame:](v8, "setFrame:");
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (void)_scrollViewWillBeginDragging
{
  self->_telemetryOffsetChangeHighRateDuration = 0.0;
  self->_telemetryOffsetChangeCount = 0;
  self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E4F1DB30];
  _UIQOSManagedCommitsBegin(self, @"Dragging");
  -[_UIScrollViewVFD activateSubreason:]((uint64_t)self->_vfd, 1);
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25A548);
  uint64_t v4 = *(id *)(CategoryCachedImpl + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v4))
  {
    __int16 v10 = 0;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  unint64_t v5 = __UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25A550);
  unint64_t v6 = *(id *)(v5 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v5 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v6))
  {
    __int16 v10 = 0;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  [(UIScrollView *)self _beginActivityTrackingIfNeededForReason:0];
  double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"UITextSelectionWillScroll" object:self];
  [v7 postNotificationName:@"_UIScrollViewWillBeginDraggingNotification" object:self];
  kdebug_trace();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__UIScrollView__scrollViewWillBeginDragging__block_invoke;
  v9[3] = &unk_1E530F458;
  v9[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v9);
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scrollViewWillBeginDragging:self];
  }
  kdebug_trace();
}

uint64_t __44__UIScrollView__scrollViewWillBeginDragging__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 _observeScrollViewWillBeginDragging:v5];
  }
  return result;
}

- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  unint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  double v7 = [NSNumber numberWithBool:v3];
  double v8 = [v6 dictionaryWithObject:v7 forKey:@"_UIScrollViewDidEndDraggingWillDecelerateUserInfoKey"];
  [v5 postNotificationName:@"_UIScrollViewDidEndDraggingNotification" object:self userInfo:v8];

  kdebug_trace();
  -[_UIScrollViewVFD deactivateSubreason:]((uint64_t)self->_vfd, 1);
  _UIQOSManagedCommitsEnd(self, @"Dragging");
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25A558);
  __int16 v10 = *(id *)(CategoryCachedImpl + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v10))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  if (v3)
  {
    self->_telemetryOffsetChangeHighRateDuration = 0.0;
    self->_telemetryOffsetChangeCount = 0;
    self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  else
  {
    unint64_t v11 = __UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25A560);
    double v12 = *(id *)(v11 + 8);
    if (os_signpost_id_make_with_pointer(*(os_log_t *)(v11 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
      && os_signpost_enabled(v12))
    {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    [(UIScrollView *)self _endActivityTrackingIfNeededForReason:0];
    self->_telemetryOffsetChangeHighRateDuration = 0.0;
    self->_telemetryOffsetChangeCount = 0;
    self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E4F1DB30];
    [v5 postNotificationName:@"UITextSelectionDidScroll" object:self];
  }
}

- (void)_scrollViewDidEndDraggingForDelegateWithDeceleration:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIScrollView *)self _isAutomaticContentOffsetAdjustmentEnabled];
  if (v3) {
    [(UIScrollView *)self _setAutomaticContentOffsetAdjustmentEnabled:0];
  }
  [(UIScrollView *)self _scrollViewDidEndDraggingWithDeceleration:v3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__UIScrollView__scrollViewDidEndDraggingForDelegateWithDeceleration___block_invoke;
  v8[3] = &unk_1E530F680;
  v8[4] = self;
  BOOL v9 = v3;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v8);
  scrollableAncestor = self->_scrollableAncestor;
  if (scrollableAncestor) {
    [(_UIScrollViewScrollableAncestor *)scrollableAncestor _descendentScrollViewDidEndDragging:self];
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scrollViewDidEndDragging:self willDecelerate:v3];
  }
  if (v3) {
    [(UIScrollView *)self _setAutomaticContentOffsetAdjustmentEnabled:v5];
  }
}

uint64_t __69__UIScrollView__scrollViewDidEndDraggingForDelegateWithDeceleration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
    return [a2 _observeScrollViewDidEndDragging:v5 willDecelerate:v6];
  }
  return result;
}

- (void)_scrollViewDidEndDecelerating
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UITextSelectionDidScroll" object:self];
  [v3 postNotificationName:@"_UIScrollViewDidEndDeceleratingNotification" object:self];
}

- (void)_scrollViewDidEndDeceleratingForDelegate
{
  [(UIScrollView *)self _scrollViewDidEndDecelerating];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__UIScrollView__scrollViewDidEndDeceleratingForDelegate__block_invoke;
  v4[3] = &unk_1E530F458;
  v4[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v4);
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scrollViewDidEndDecelerating:self];
  }
  kdebug_trace();
}

uint64_t __56__UIScrollView__scrollViewDidEndDeceleratingForDelegate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 _observeScrollViewDidEndDecelerating:v5];
  }
  return result;
}

- (void)_scrollViewWillBeginZooming
{
  v8[1] = *MEMORY[0x1E4F143B8];
  _UIQOSManagedCommitsBegin(self, @"Zooming");
  -[_UIScrollViewVFD activateSubreason:]((uint64_t)self->_vfd, 2);
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &_scrollViewWillBeginZooming___s_category);
  uint64_t v4 = *(id *)(CategoryCachedImpl + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v4))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v7 = @"UITextSelectionZoomScaleDidChange";
  v8[0] = MEMORY[0x1E4F1CC38];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v5 postNotificationName:@"UITextSelectionWillZoom" object:self userInfo:v6];
}

- (void)_scrollViewDidEndZooming
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x80) == 0) {
    *(void *)&self->_uint64_t scrollViewFlags = scrollViewFlags & 0xFFFFFFFF7FFFFFFFLL;
  }
  -[_UIScrollViewVFD deactivateSubreason:]((uint64_t)self->_vfd, 2);
  _UIQOSManagedCommitsEnd(self, @"Zooming");
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollView", &_scrollViewDidEndZooming___s_category);
  uint64_t v5 = *(id *)(CategoryCachedImpl + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v5))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v8 = @"UITextSelectionZoomScaleDidChange";
  v9[0] = MEMORY[0x1E4F1CC38];
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v6 postNotificationName:@"UITextSelectionDidZoom" object:self userInfo:v7];
}

- (void)_pinContentOffsetToClosestPageBoundary
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    [(UIScrollView *)self _prepareToPageWithHorizontalVelocity:0.0 verticalVelocity:0.0];
    -[UIScrollView setContentOffset:](self, "setContentOffset:", self->_pageDecelerationTarget.x, self->_pageDecelerationTarget.y);
    self->_horizontalVelocitCGFloat y = 0.0;
    self->_verticalVelocitCGFloat y = 0.0;
  }
}

- (CGRect)_rectForPageContainingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    CGFloat width = a3.size.width;
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v24 = *MEMORY[0x1E4F1DB28];
    [(UIView *)self bounds];
    double v12 = v11;
    double v14 = v13;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    int v15 = vcvtmd_s64_f64(CGRectGetMinX(v25) / v12);
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    unsigned int v16 = vcvtmd_s64_f64((CGRectGetMaxX(v26) + -1.0) / v12);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v28);
    if (v15 == v16)
    {
      int v19 = vcvtmd_s64_f64(MinY / v14);
      unsigned int v20 = vcvtmd_s64_f64((MaxY + -1.0) / v14);
      double v7 = v23;
      double v6 = v24;
      double v8 = v22;
      if (v19 == v20)
      {
        double v6 = v12 * (double)v15;
        double v7 = v14 * (double)v19;
        double v8 = v14;
        double v9 = v12;
      }
    }
    else
    {
      double v7 = v23;
      double v6 = v24;
      double v8 = v22;
    }
  }
  double v21 = v9;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (CGRect)_rectForPageContainingView:(id)a3
{
  if ((*(void *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    id v8 = a3;
    [v8 bounds];
    objc_msgSend(v8, "convertRect:toView:", self);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    -[UIScrollView _rectForPageContainingRect:](self, "_rectForPageContainingRect:", v10, v12, v14, v16);
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (double)_systemInsetAdjustmentForAdjustmentTypeIdentifier:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_contentInsetAdjustments objectForKey:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)_setSystemInsetAdjustment:(double)a3 forAdjustmentTypeIdentifier:(id)a4
{
  id v6 = a4;
  contentInsetAdjustments = self->_contentInsetAdjustments;
  id v15 = v6;
  if (!contentInsetAdjustments)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    double v9 = self->_contentInsetAdjustments;
    self->_contentInsetAdjustments = v8;

    id v6 = v15;
    contentInsetAdjustments = self->_contentInsetAdjustments;
  }
  double v10 = [(NSMutableDictionary *)contentInsetAdjustments objectForKey:v6];
  [v10 doubleValue];
  double v12 = v11;

  if (v12 != a3)
  {
    double v13 = self->_contentInsetAdjustments;
    if (fabs(a3) >= 2.22044605e-16)
    {
      double v14 = [NSNumber numberWithDouble:a3];
      [(NSMutableDictionary *)v13 setObject:v14 forKey:v15];
    }
    else
    {
      [(NSMutableDictionary *)self->_contentInsetAdjustments removeObjectForKey:v15];
    }
    *(void *)((char *)&self->_scrollViewFlags + 12) &= ~0x8000000000000000;
    [(UIScrollView *)self _updateForChangedScrollRelatedInsets];
    [(UIScrollView *)self _updateForChangedScrollIndicatorRelatedInsets];
    [(UIScrollView *)self _adjustContentOffsetIfNecessary];
  }
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return a3 == 1 && self->_scrollAnimatingViaAssertion;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (a4 == 1)
  {
    BOOL v6 = [(UIScrollView *)self isScrollAnimating];
    self->_BOOL scrollAnimatingViaAssertion = a3;
    if (v6 && ![(UIScrollView *)self isScrollAnimating])
    {
      [(UIScrollView *)self _delegateScrollViewAnimationEnded];
    }
  }
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return &self->_pinch->super;
}

- (UIGestureRecognizer)directionalPressGestureRecognizer
{
  return &self->_directionalPressGestureRecognizer->super.super;
}

- (BOOL)_useContentDimensionVariablesForConstraintLowering
{
  return self->_useContentDimensionVariablesForConstraintLowering;
}

- (void)_setUseContentDimensionVariablesForConstraintLowering:(BOOL)a3
{
  self->_useContentDimensionVariablesForConstraintLowering = a3;
}

- (NSArray)_automaticContentConstraints
{
  return self->_automaticContentConstraints;
}

- (UIScrollViewMonitor)_scrollViewMonitor
{
  return self->__scrollViewMonitor;
}

- (void)set_scrollViewMonitor:(id)a3
{
}

- (NSMutableDictionary)accessoryViews
{
  return self->_accessoryViews;
}

- (void)setAccessoryViews:(id)a3
{
}

- (NSArray)_allowedTouchTypesForScrolling
{
  return self->__allowedTouchTypesForScrolling;
}

- (BOOL)_viewIsInsideNavigationController
{
  id v2 = self;
  if (v2)
  {
    while (1)
    {
      uint64_t v3 = +[UIViewController viewControllerForView:v2];
      if (v3) {
        break;
      }
      double v4 = [(UIView *)v2 superview];

      id v2 = v4;
      if (!v4) {
        goto LABEL_7;
      }
    }
    double v4 = (UIScrollView *)v3;
  }
  else
  {
    double v4 = 0;
  }
LABEL_7:
  double v5 = [(UIScrollView *)v4 parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)UIScrollView;
  id v4 = a3;
  [(UIResponder *)&v18 encodeRestorableStateWithCoder:v4];
  [(UIScrollView *)self zoomScale];
  *(float *)&double v5 = v5;
  [v4 encodeFloat:@"kScrollViewZoomScaleKey" forKey:v5];
  [(UIScrollView *)self contentOffset];
  double v7 = v6;
  double v9 = v8;
  [(UIScrollView *)self contentInset];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16 - self->_savedKeyboardAdjustmentDelta;
  [(UIScrollView *)self _effectiveContentInset];
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"kScrollViewEffectiveContentInsetKey");
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"kScrollViewContentInsetKey", v11, v13, v17, v15);
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"kScrollViewContentOffsetKey", v7, v9);
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UIScrollView;
  [(UIResponder *)&v24 decodeRestorableStateWithCoder:v4];
  if ([v4 containsValueForKey:@"kScrollViewZoomScaleKey"])
  {
    [v4 decodeFloatForKey:@"kScrollViewZoomScaleKey"];
    [(UIScrollView *)self setZoomScale:v5];
  }
  int v6 = [v4 containsValueForKey:@"kScrollViewContentOffsetKey"];
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if (v6)
  {
    [v4 decodeCGPointForKey:@"kScrollViewContentOffsetKey"];
    double v9 = v10;
    double v8 = v11;
  }
  int v12 = [v4 containsValueForKey:@"kScrollViewContentInsetKey"];
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  if (v12)
  {
    [v4 decodeUIEdgeInsetsForKey:@"kScrollViewContentInsetKey"];
    double v15 = v16;
    double v14 = v17;
    double v13 = v18;
    double v7 = v19;
  }
  if ([v4 containsValueForKey:@"kScrollViewEffectiveContentInsetKey"])
  {
    [v4 decodeUIEdgeInsetsForKey:@"kScrollViewEffectiveContentInsetKey"];
    double v21 = v20;
    if ((v6 & dyld_program_sdk_at_least()) == 1
      && [(UIScrollView *)self _viewIsInsideNavigationController])
    {
      double v22 = v8 + v21;
      [(UIScrollView *)self _effectiveContentInset];
LABEL_15:
      double v8 = v22 - v23;
      goto LABEL_18;
    }
  }
  else
  {
    dyld_program_sdk_at_least();
  }
  if ((v6 & v12) == 1 && [(UIScrollView *)self _viewIsInsideNavigationController])
  {
    double v22 = v8 + v15;
    [(UIScrollView *)self contentInset];
    goto LABEL_15;
  }
  if (v12) {
    -[UIScrollView setContentInset:](self, "setContentInset:", v15, v14, v13, v7);
  }
LABEL_18:
  if (v6) {
    -[UIScrollView setContentOffset:](self, "setContentOffset:", v9, v8);
  }
}

+ (id)_implicitAnimationCulprits
{
  if (qword_1EB264FA0 != -1) {
    dispatch_once(&qword_1EB264FA0, &__block_literal_global_649);
  }
  id v2 = (void *)qword_1EB264F98;
  return v2;
}

void __65__UIScrollView__UIApplicationTesting___implicitAnimationCulprits__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObject:@"_UIBackdropEffectView"];
  id v1 = (void *)qword_1EB264F98;
  qword_1EB264F98 = v0;
}

- (void)_reenableImplicitAnimationsAfterScrollTest
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend((id)objc_opt_class(), "_implicitAnimationCulprits", 0);
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
        [NSClassFromString(*(NSString **)(*((void *)&v7 + 1) + 8 * v6++)) _setAnimatedPropertiesEnabled:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_suppressImplicitAnimationsForScrollTest
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend((id)objc_opt_class(), "_implicitAnimationCulprits", 0);
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
        [NSClassFromString(*(NSString **)(*((void *)&v7 + 1) + 8 * v6++)) _setAnimatedPropertiesEnabled:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5
{
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 scrollAxis:(unint64_t)a6
{
  id v13 = a3;
  if (a6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIScrollView_UIApplicationTesting.m" lineNumber:469 description:@"UIAxis must be UIAxisVertical or UIAxisHorizontal"];
  }
  double v11 = objc_alloc_init(UIScrollTestParameters);
  [(UIScrollTestParameters *)v11 setTestName:v13];
  [(UIScrollTestParameters *)v11 setIterations:a4];
  [(UIScrollTestParameters *)v11 setDelta:(double)a5];
  [(UIScrollTestParameters *)v11 setAxis:a6];
  [(UIScrollView *)self _performScrollTestWithParameters:v11 completionBlock:0];
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6
{
}

- (void)_performFullScreenScrollTest:(id)a3 iterations:(int)a4 scrollAxis:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v11 = a3;
  if (a5 == 1)
  {
    [(UIView *)self bounds];
    uint64_t v9 = (int)v10;
  }
  else if (a5 == 2)
  {
    [(UIView *)self bounds];
    uint64_t v9 = (int)v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(UIScrollView *)self _performScrollTest:v11 iterations:v6 delta:v9 scrollAxis:a5];
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6 scrollAxis:(unint64_t)a7
{
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6 scrollAxis:(unint64_t)a7 extraResultsBlock:(id)a8
{
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6 scrollAxis:(unint64_t)a7 extraResultsBlock:(id)a8 completionBlock:(id)a9
{
  id v20 = a3;
  id v16 = a8;
  id v17 = a9;
  if (a7 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"UIScrollView_UIApplicationTesting.m" lineNumber:505 description:@"UIAxis must be UIAxisVertical or UIAxisHorizontal"];
  }
  double v18 = objc_alloc_init(UIScrollTestParameters);
  [(UIScrollTestParameters *)v18 setTestName:v20];
  [(UIScrollTestParameters *)v18 setIterations:a4];
  [(UIScrollTestParameters *)v18 setDelta:(double)a5];
  [(UIScrollTestParameters *)v18 setLength:(double)a6];
  [(UIScrollTestParameters *)v18 setAxis:a7];
  [(UIScrollTestParameters *)v18 setExtraResultsBlock:v16];
  [(UIScrollView *)self _performScrollTestWithParameters:v18 completionBlock:v17];
}

- (void)_performScrollTestWithParameters:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v27 = (id)[a3 copy];
  [(UIScrollView *)self setScrollTestParameters:v27];
  if ([v27 axis] == 2)
  {
    [(UIScrollView *)self contentOffset];
    double v8 = v7;
    [(UIScrollView *)self contentSize];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
    double v8 = 0.0;
    if ([v27 axis] == 1)
    {
      [(UIScrollView *)self contentOffset];
      double v8 = v11;
      [(UIScrollView *)self contentSize];
      double v10 = v12;
    }
  }
  [v27 length];
  if (v13 != 1.79769313e308)
  {
    [v27 length];
    if (v8 + v14 > v10)
    {
      [v27 length];
      double v8 = v8 - v15;
      if (v8 < 0.0) {
        double v8 = 0.0;
      }
    }
    [v27 length];
    if (v16 > v10 - v8) {
      double v16 = v10 - v8;
    }
    [v27 setLength:v16];
  }
  [v27 setStartOffset:v8];
  [v27 setCompletionBlock:v6];

  [(UIScrollView *)self _suppressImplicitAnimationsForScrollTest];
  _UIQOSManagedCommitsBegin(self, @"UIScrollViewScrollTest");
  id v17 = getenv("CA_BENCHMARK");
  if (v17 && !strcmp(v17, "1"))
  {
    [(UIScrollView *)self performSelector:sel__incrementForScrollTest_ withObject:0 afterDelay:0.0];
  }
  else
  {
    double v18 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__incrementForScrollTest_];
    [v27 setDisplayLink:v18];

    double v19 = [v27 displayLink];
    [v19 maximumRefreshRate];
    if (v20 != 0.0) {
      [v19 setPreferredFramesPerSecond:llround(1.0 / v20)];
    }

    double v21 = [v27 displayLink];
    [v21 setHighFrameRateReason:1048623];

    double v22 = [v27 displayLink];
    double v23 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v22 addToRunLoop:v23 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  objc_super v24 = [v27 testName];

  if (v24)
  {
    CGRect v25 = (void *)UIApp;
    CGRect v26 = [v27 testName];
    [v25 startedTest:v26];
  }
}

- (id)_scrollTestExtraResults
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"scrollLength";
  id v2 = NSNumber;
  uint64_t v3 = [(UIScrollView *)self scrollTestParameters];
  [v3 length];
  uint64_t v4 = objc_msgSend(v2, "numberWithDouble:");
  v7[1] = @"scrollLengthUnits";
  v8[0] = v4;
  v8[1] = @"pixels";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)_incrementForScrollTest:(id)a3
{
  id v51 = a3;
  _UIQOSProcessingBegin("ScrollTest", 0, 0, 0);
  if (v51)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F39CF8];
    [v51 targetTimestamp];
    double v6 = v5;
    [v51 targetTimestamp];
    double v8 = v7;
    [v51 timestamp];
    [v4 setEarliestAutomaticCommitTime:v6 + (v8 - v9) * -0.5];
  }
  double v10 = [(UIScrollView *)self scrollTestParameters];
  uint64_t v11 = [v10 axis];
  [(UIScrollView *)self contentOffset];
  double v13 = v12;
  double v15 = v14;
  [v10 delta];
  double v17 = v16;
  [v10 endOffset];
  double v19 = v18;
  if (v11 == 2)
  {
    [(UIView *)self bounds];
    double v21 = v20;
    [v10 length];
    if (v22 == 1.79769313e308)
    {
      [(UIScrollView *)self _maximumContentOffset];
      double v19 = v21 + v23;
    }
    double v24 = v15;
  }
  else
  {
    double v21 = 0.0;
    if (v11 == 1)
    {
      [(UIView *)self bounds];
      double v21 = v25;
      [v10 length];
      if (v26 == 1.79769313e308)
      {
        [(UIScrollView *)self _maximumContentOffset];
        double v19 = v21 + v27;
      }
      double v24 = v13;
    }
    else
    {
      double v24 = 0.0;
    }
  }
  if (v17 > 0.0)
  {
    [v10 delta];
    BOOL v28 = 0;
    BOOL v30 = v21 + v24 + v29 > v19;
    goto LABEL_15;
  }
  [v10 delta];
  double v32 = v31;
  [v10 startOffset];
  BOOL v30 = 0;
  BOOL v28 = v24 + v32 <= v33;
  if (v24 + v32 > v33)
  {
LABEL_15:
    if (!v30) {
      goto LABEL_17;
    }
  }
  [v10 delta];
  [v10 setDelta:-v34];
LABEL_17:
  if (v28) {
    objc_msgSend(v10, "setIterations:", objc_msgSend(v10, "iterations") - 1);
  }
  if (v11 == 2)
  {
    [v10 delta];
    double v15 = v15 + v35;
  }
  else if (v11 == 1)
  {
    [v10 delta];
    double v13 = v13 + v36;
  }
  -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v13, v15);
  if ([v10 iterations] < 1)
  {
    [v10 length];
    if (v38 == 1.79769313e308)
    {
      [v10 startOffset];
      [v10 setLength:v19 - v39];
    }
    uint64_t v40 = [(UIScrollView *)self _scrollTestExtraResults];
    CGRect v41 = [v10 extraResultsBlock];

    if (v41)
    {
      CGRect v42 = (void *)[v40 mutableCopy];
      double v43 = [v10 extraResultsBlock];
      double v44 = v43[2]();
      [v42 addEntriesFromDictionary:v44];
    }
    else
    {
      CGRect v42 = v40;
    }
    double v45 = [v10 testName];

    if (v45)
    {
      double v46 = (void *)UIApp;
      double v47 = [v10 testName];
      [v46 finishedTest:v47 extraResults:v42];
    }
    double v48 = [v10 displayLink];
    [v48 invalidate];

    [(UIScrollView *)self setScrollTestParameters:0];
    [(UIScrollView *)self _reenableImplicitAnimationsAfterScrollTest];
    double v49 = [v10 completionBlock];

    if (v49)
    {
      uint64_t v50 = [v10 completionBlock];
      ((void (**)(void, void *))v50)[2](v50, v42);
    }
    _UIQOSManagedCommitsEnd(self, @"UIScrollViewScrollTest");
  }
  else
  {
    double v37 = [v10 displayLink];

    if (!v37) {
      [(UIScrollView *)self performSelector:sel__incrementForScrollTest_ withObject:0 afterDelay:0.0];
    }
  }

  _UIQOSProcessingEnd();
}

- (void)_simulateScrollWithTranslation:(CGPoint)a3 duration:(double)a4 willBeginDragging:(id)a5 didEndDragging:(id)a6 willBeginDecelerating:(id)a7 didEndDecelerating:(id)a8
{
  double y = a3.y;
  double x = a3.x;
  id v15 = a5;
  unint64_t v16 = (unint64_t)a6;
  unint64_t v17 = (unint64_t)a7;
  id v56 = a8;
  double v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_initWeak(location, v18);

  uint64_t v111 = 0;
  double v112 = &v111;
  uint64_t v113 = 0x3032000000;
  BOOL v114 = __Block_byref_object_copy__238;
  double v115 = __Block_byref_object_dispose__238;
  id v116 = 0;
  uint64_t v105 = 0;
  double v106 = &v105;
  uint64_t v107 = 0x3032000000;
  BOOL v108 = __Block_byref_object_copy__238;
  double v109 = __Block_byref_object_dispose__238;
  id v110 = 0;
  uint64_t v99 = 0;
  float64x2_t v100 = &v99;
  uint64_t v101 = 0x3032000000;
  double v102 = __Block_byref_object_copy__238;
  CGPoint v103 = __Block_byref_object_dispose__238;
  id v104 = 0;
  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained(location);
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke;
    v95[3] = &unk_1E530F758;
    id v96 = v15;
    objc_copyWeak(&v98, location);
    double v97 = &v111;
    uint64_t v20 = [WeakRetained addObserverForName:@"_UIScrollViewWillBeginDraggingNotification" object:self queue:0 usingBlock:v95];
    double v21 = (void *)v112[5];
    v112[5] = v20;

    objc_destroyWeak(&v98);
  }
  if (v16 | v17)
  {
    id v22 = objc_loadWeakRetained(location);
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_2;
    v89[3] = &unk_1E530F780;
    id v90 = (id)v16;
    objc_copyWeak(&v94, location);
    double v92 = &v105;
    id v91 = (id)v17;
    double v93 = &v99;
    uint64_t v23 = [v22 addObserverForName:@"_UIScrollViewDidEndDraggingNotification" object:self queue:0 usingBlock:v89];
    double v24 = (void *)v106[5];
    v106[5] = v23;

    objc_destroyWeak(&v94);
  }
  if (v56)
  {
    id v25 = objc_loadWeakRetained(location);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_3;
    v85[3] = &unk_1E530F758;
    id v86 = v56;
    objc_copyWeak(&v88, location);
    double v87 = &v99;
    uint64_t v26 = [v25 addObserverForName:@"_UIScrollViewDidEndDeceleratingNotification" object:self queue:0 usingBlock:v85];
    double v27 = (void *)v100[5];
    v100[5] = v26;

    objc_destroyWeak(&v88);
  }
  if (qword_1EB264FA8 != -1) {
    dispatch_once(&qword_1EB264FA8, &__block_literal_global_188_2);
  }
  BOOL v28 = _MergedGlobals_1320 == 0;
  double v29 = [(UIScrollView *)self _panGestureRecognizer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v30 = [v29 gestureRecognizer];

    double v29 = (void *)v30;
  }
  double v31 = objc_alloc_init(_UIScrollViewMockPanGestureRecognizer);
  [(_UIScrollViewMockPanGestureRecognizer *)v31 setGestureRecognizer:v29];
  [(UIScrollView *)self _setPanGestureRecognizer:v31];
  double v54 = (void *)v17;
  CFTimeInterval v55 = CACurrentMediaTime();
  double v32 = dbl_186B9E260[v28];
  double v33 = fmax(a4, v32);
  double v34 = -x;
  double v35 = -y;
  double v36 = -y / v33;
  double v37 = v34 / v33;
  double v38 = v33 - v32;
  double v39 = fmin(v32 / (v33 - v32), 1.0);
  double v40 = v39 * v34;
  double v41 = v39 * v35;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_4;
  aBlock[3] = &unk_1E52D9F98;
  void aBlock[4] = self;
  CGRect v42 = v31;
  double v84 = v42;
  double v43 = _Block_copy(aBlock);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_5;
  v75[3] = &unk_1E530A070;
  double v44 = v42;
  double v79 = v40;
  double v80 = v41;
  double v81 = v37;
  double v82 = v36;
  double v76 = v44;
  double v77 = self;
  id v45 = v43;
  id v78 = v45;
  double v46 = _Block_copy(v75);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_6;
  v66[3] = &unk_1E530F7A8;
  CFTimeInterval v69 = v55;
  double v70 = v38;
  double v71 = v34;
  double v72 = v35;
  double v47 = v44;
  double v67 = v47;
  double v73 = v37;
  double v74 = v36;
  id v48 = v45;
  id v68 = v48;
  double v49 = _Block_copy(v66);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_7;
  v57[3] = &unk_1E530F7F8;
  uint64_t v50 = v47;
  double v58 = v50;
  id v51 = v48;
  id v61 = v51;
  double v59 = self;
  id v52 = v29;
  id v60 = v52;
  double v62 = &v111;
  double v63 = &v105;
  double v64 = &v99;
  objc_copyWeak(&v65, location);
  double v53 = _Block_copy(v57);
  [(UIScrollView *)self _simulateGestureWithDuration:v46 begin:v49 update:v53 end:v38];

  objc_destroyWeak(&v65);
  _Block_object_dispose(&v99, 8);

  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v111, 8);

  objc_destroyWeak(location);
}

void __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"_UIScrollViewDidEndDraggingWillDecelerateUserInfoKey"];
  uint64_t v5 = [v4 BOOLValue];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  double v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      uint64_t v11 = *(void (**)(void))(v10 + 16);
      v11();
    }
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v12 = objc_loadWeakRetained((id *)(a1 + 64));
    [v12 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    double v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
}

void __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

uint64_t __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [(id)objc_opt_class() _panGestureAction];
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 performSelector:v3 withObject:v4];
}

uint64_t __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "simulateTranslation:velocity:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 32) setState:1];
  id v2 = (void *)UIApp;
  uint64_t v3 = [*(id *)(a1 + 40) window];
  id v4 = (id)[v2 _touchesEventForWindow:v3];

  [*(id *)(a1 + 40) _beginTrackingWithEvent:v4];
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

uint64_t __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_6(uint64_t a1)
{
  double v2 = fmin((CACurrentMediaTime() - *(double *)(a1 + 48)) / *(double *)(a1 + 56), 1.0);
  objc_msgSend(*(id *)(a1 + 32), "simulateTranslation:velocity:", *(double *)(a1 + 64) * v2, *(double *)(a1 + 72) * v2, *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(a1 + 32) setState:2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:3];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) setGestureRecognizer:0];
  double v2 = [*(id *)(a1 + 40) _panGestureRecognizer];
  uint64_t v3 = *(void **)(a1 + 32);

  if (v2 == v3) {
    [*(id *)(a1 + 40) _setPanGestureRecognizer:*(void *)(a1 + 48)];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_8;
    v5[3] = &unk_1E530F7D0;
    v5[4] = *(void *)(a1 + 64);
    objc_copyWeak(&v7, (id *)(a1 + 88));
    long long v6 = *(_OWORD *)(a1 + 72);
    dispatch_after(v4, MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v7);
  }
}

void __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_8(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    dispatch_time_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 56));
    [v5 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    [v8 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

- (void)_simulateZoomByScaleFactor:(double)a3 duration:(double)a4 willBeginZooming:(id)a5 didEndZooming:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_initWeak(location, v12);

  uint64_t v81 = 0;
  double v82 = &v81;
  uint64_t v83 = 0x3032000000;
  double v84 = __Block_byref_object_copy__238;
  double v85 = __Block_byref_object_dispose__238;
  id v86 = 0;
  uint64_t v75 = 0;
  double v76 = &v75;
  uint64_t v77 = 0x3032000000;
  id v78 = __Block_byref_object_copy__238;
  double v79 = __Block_byref_object_dispose__238;
  id v80 = 0;
  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained(location);
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke;
    v71[3] = &unk_1E530F758;
    id v72 = v10;
    objc_copyWeak(&v74, location);
    double v73 = &v81;
    uint64_t v14 = [WeakRetained addObserverForName:@"UITextSelectionWillZoom" object:self queue:0 usingBlock:v71];
    id v15 = (void *)v82[5];
    v82[5] = v14;

    objc_destroyWeak(&v74);
  }
  if (v11)
  {
    id v16 = objc_loadWeakRetained(location);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    void v67[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_2;
    v67[3] = &unk_1E530F758;
    id v68 = v11;
    objc_copyWeak(&v70, location);
    CFTimeInterval v69 = &v75;
    uint64_t v17 = [v16 addObserverForName:@"UITextSelectionDidZoom" object:self queue:0 usingBlock:v67];
    double v18 = (void *)v76[5];
    v76[5] = v17;

    objc_destroyWeak(&v70);
  }
  if (qword_1EB264FA8 != -1) {
    dispatch_once(&qword_1EB264FA8, &__block_literal_global_188_2);
  }
  BOOL v19 = _MergedGlobals_1320 == 0;
  uint64_t v20 = [(UIScrollView *)self pinchGestureRecognizer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [v20 gestureRecognizer];

    uint64_t v20 = (void *)v21;
  }
  id v22 = objc_alloc_init(_UIScrollViewMockPinchGestureRecognizer);
  [(_UIScrollViewMockPinchGestureRecognizer *)v22 setGestureRecognizer:v20];
  [(UIScrollView *)self _setPinchGestureRecognizer:v22];
  CFTimeInterval v23 = CACurrentMediaTime();
  double v24 = dbl_186B9E260[v19];
  double v25 = fmax(a4, v24);
  double v26 = a3 / v25;
  double v27 = v25 - v24;
  double v28 = (a3 + -1.0) * fmin(v24 / (v25 - v24), 1.0) + 1.0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_3;
  aBlock[3] = &unk_1E52D9F98;
  void aBlock[4] = self;
  double v29 = v22;
  double v66 = v29;
  uint64_t v30 = _Block_copy(aBlock);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_4;
  v59[3] = &unk_1E52FCC40;
  double v31 = v29;
  double v63 = v28;
  double v64 = v26;
  id v60 = v31;
  id v61 = self;
  id v32 = v30;
  id v62 = v32;
  double v33 = _Block_copy(v59);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_5;
  v52[3] = &unk_1E530F820;
  CFTimeInterval v55 = v23;
  double v56 = v27;
  double v57 = a3;
  double v34 = v31;
  double v53 = v34;
  double v58 = v26;
  id v35 = v32;
  id v54 = v35;
  double v36 = _Block_copy(v52);
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  double v43 = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_6;
  double v44 = &unk_1E530F870;
  double v37 = v34;
  id v45 = v37;
  id v38 = v35;
  id v48 = v38;
  double v46 = self;
  id v39 = v20;
  id v47 = v39;
  double v49 = &v81;
  uint64_t v50 = &v75;
  objc_copyWeak(&v51, location);
  double v40 = _Block_copy(&v41);
  -[UIScrollView _simulateGestureWithDuration:begin:update:end:](self, "_simulateGestureWithDuration:begin:update:end:", v33, v36, v40, v27, v41, v42, v43, v44);

  objc_destroyWeak(&v51);
  _Block_object_dispose(&v75, 8);

  _Block_object_dispose(&v81, 8);
  objc_destroyWeak(location);
}

void __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

uint64_t __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_3(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = [(id)objc_opt_class() _pinchGestureAction];
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 performSelector:v3 withObject:v4];
}

uint64_t __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) simulateScale:*(double *)(a1 + 56) velocity:*(double *)(a1 + 64)];
  [*(id *)(a1 + 32) setState:1];
  double v2 = (void *)UIApp;
  uint64_t v3 = [*(id *)(a1 + 40) window];
  id v4 = (id)[v2 _touchesEventForWindow:v3];

  [*(id *)(a1 + 40) _beginTrackingWithEvent:v4];
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

uint64_t __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "simulateScale:velocity:", fmin((CACurrentMediaTime() - *(double *)(a1 + 48)) / *(double *)(a1 + 56), 1.0) * (*(double *)(a1 + 64) + -1.0)+ 1.0, *(double *)(a1 + 72));
  [*(id *)(a1 + 32) setState:2];
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:3];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) setGestureRecognizer:0];
  double v2 = [*(id *)(a1 + 40) pinchGestureRecognizer];
  uint64_t v3 = *(void **)(a1 + 32);

  if (v2 == v3) {
    [*(id *)(a1 + 40) _setPinchGestureRecognizer:*(void *)(a1 + 48)];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_7;
    block[3] = &unk_1E530F848;
    void block[4] = *(void *)(a1 + 64);
    objc_copyWeak(&v6, (id *)(a1 + 80));
    block[5] = *(void *)(a1 + 72);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v6);
  }
}

void __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_7(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    dispatch_time_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    [v5 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

- (void)_simulateGestureWithDuration:(double)a3 begin:(id)a4 update:(id)a5 end:(id)a6
{
  id v14 = a5;
  if (a3 <= 0.0)
  {
    id v12 = (void (*)(void))*((void *)a4 + 2);
    id v11 = (void (**)(void))a6;
    id v13 = a4;
    v12();

    v11[2](v11);
  }
  else
  {
    id v9 = a6;
    id v10 = a4;
    id v11 = +[_UIScrollViewGestureSimulator sharedInstance];
    [v11 simulateGestureWithDuration:v10 begin:v14 update:v9 end:a3];
  }
}

- (void)_performNaturalScrollTest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v8 = (void *)qword_1EB264FB0;
  uint64_t v16 = qword_1EB264FB0;
  if (!qword_1EB264FB0)
  {
    RecapPerformanceTestingLibraryCore();
    void v14[3] = (uint64_t)objc_getClass("RPTScrollViewTestParameters");
    qword_1EB264FB0 = v14[3];
    id v8 = (void *)v14[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);
  id v10 = (void *)[[v9 alloc] initWithTestName:v6 scrollView:self completionHandler:v7];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v11 = (void *)qword_1EB264FB8;
  uint64_t v16 = qword_1EB264FB8;
  if (!qword_1EB264FB8)
  {
    RecapPerformanceTestingLibraryCore();
    void v14[3] = (uint64_t)objc_getClass("RPTTestRunner");
    qword_1EB264FB8 = v14[3];
    id v11 = (void *)v14[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v13, 8);
  [v12 runTestWithParameters:v10];
}

- (void)_autoScrollAssistantUpdateContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(UIScrollView *)self isPagingEnabled];
  -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", v6, x, y);
}

@end