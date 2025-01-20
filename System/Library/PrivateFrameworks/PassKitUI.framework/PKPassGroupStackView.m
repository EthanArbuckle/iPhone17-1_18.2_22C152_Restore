@interface PKPassGroupStackView
+ (id)backdropStartBackgroundColor;
+ (id)backgroundColor;
- (BOOL)_acquireGroupView:(id)a3 resetExternalVC:(BOOL)a4;
- (BOOL)_isGroupAtIndexInModalPile:(unint64_t)a3;
- (BOOL)_isIngestingPass;
- (BOOL)_isModalPresentationAllowed;
- (BOOL)_isModalPresentationAllowedForSingleGroup;
- (BOOL)_loadModalGroupViewIfNecessaryInInitialState:(int64_t)a3;
- (BOOL)_pauseStateForGroupView:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)_recomputeLayoutState;
- (BOOL)_shouldRampForFrontmostPassView:(id)a3;
- (BOOL)_shouldRampForPass:(id)a3;
- (BOOL)_shouldSwitchToTableStateFromExternalDismissal;
- (BOOL)_shouldTablePresentationScroll;
- (BOOL)_updateContentSize;
- (BOOL)_updateContentSizeWithPriorBounds:(CGRect *)a3 bounds:(CGRect *)a4;
- (BOOL)_updateHeaderContext:(id *)a3 toContext:(id)a4 animated:(BOOL)a5;
- (BOOL)_updateHeaderFooterStateAnimated:(BOOL)a3 layout:(BOOL)a4;
- (BOOL)canPerformPaymentForGroupAtIndex:(unint64_t)a3;
- (BOOL)discoveryGalleryHasWelcomeCards;
- (BOOL)externalFooterSuppressed;
- (BOOL)footerSuppressed;
- (BOOL)groupView:(id)a3 deleteButtonEnabledForPass:(id)a4;
- (BOOL)groupViewShouldAllowPanning:(id)a3;
- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4;
- (BOOL)isInvalidated;
- (BOOL)isModallyPresentedPassAuthorized;
- (BOOL)isPassFooterViewInGroup:(id)a3;
- (BOOL)isPaused;
- (BOOL)isPresentingPassViewFront;
- (BOOL)isReordering;
- (BOOL)isTableModalPresentation;
- (BOOL)isViewCurrentlyPresentedFooterView:(id)a3;
- (BOOL)presentedPassCanPerformPayment;
- (BOOL)presentedPassIsPerformingPayment;
- (BOOL)staggerPileAnimations;
- (CATransform3D)_transformForGroupView:(SEL)a3 atIndex:(id)a4 forState:(unint64_t)a5;
- (CGPoint)_nativePositionForPositionInTable:(CGPoint)a3;
- (CGPoint)_positionForGroupView:(id)a3 atIndex:(unint64_t)a4 forState:(int64_t)a5;
- (CGRect)_frameForFooterViewForPassView:(id)a3;
- (CGRect)_xFrameForGroupViewInState:(int64_t)a3;
- (CGSize)_contentSize;
- (PKDiscoveryDataSource)discoveryDatasource;
- (PKGroupsController)groupsController;
- (PKPass)modalGroupFrontmostPass;
- (PKPassGroupStackView)initWithFrame:(CGRect)a3;
- (PKPassGroupStackViewDatasource)datasource;
- (UIColor)currentPageIndicatorTintColor;
- (UIColor)pageIndicatorTintColor;
- (_NSRange)_rangeOfEagerLoadedIndexes;
- (_NSRange)_rangeOfVisibleIndexes;
- (_NSRange)_rangeOfVisibleIndexesIgnoringBottomInset:(BOOL)a3;
- (double)_groupCellHeight;
- (double)_lastBarcodePassGroupCellHeight;
- (double)_layoutContentFromOffset:(CGPoint)a3 toOffset:(CGPoint)a4 animated:(BOOL)a5;
- (double)_maxYOfPassFrontFaceAtIndex:(unint64_t)a3;
- (double)_nativeYForGroupInTableAtIndex:(unint64_t)a3;
- (double)_opacityForGroupAtIndex:(unint64_t)a3 withGroupView:(id)a4 forState:(int64_t)a5;
- (double)_pileAscenderHeight;
- (double)_pileAscenderHeightForGroupViewInPile:(id)a3;
- (double)_pileBaseHeight;
- (double)_pileSeparationHeight;
- (double)_scaleForGroupView:(id)a3 atIndex:(unint64_t)a4 forState:(int64_t)a5;
- (double)_scaleForModalPileGroup;
- (double)_scaleForModallyPresentedGroupInExternalPresentation;
- (double)_scaleForStackGroupInExternalPresentation;
- (double)_setupSpringFactory:(id)a3 forPileAnimationFromPresentationState:(int64_t)a4 toPresentationState:(int64_t)a5 reverse:(BOOL)a6;
- (double)_setupSpringFactory:(id)a3 forPileAnimationToPresentationState:(int64_t)a4 reverse:(BOOL)a5;
- (double)_setupSpringFactoryForExternalToTableAnimations:(id)a3;
- (double)_setupSpringFactoryForPileAnimations:(id)a3 withMaximumAcceleration:(double)a4 reverse:(BOOL)a5;
- (double)_transformedYForNativeYInTable:(double)a3 withBounds:(CGRect)a4 index:(unint64_t)a5;
- (double)_xPositionForGroupView:(id)a3 forState:(int64_t)a4;
- (double)_yForExternalModallyPresentedGroup;
- (double)_yForGroupInExternalModalPileWithModalGroupY:(double)result;
- (double)_yForGroupInModalPileAtIndex:(unint64_t)a3;
- (double)_yForGroupInModalPileWithModalGroupY:(double)result;
- (double)_yForGroupInOffscreenPileAtIndex:(unint64_t)a3;
- (double)_yForGroupInPileAtIndex:(unint64_t)a3;
- (double)_yForGroupInTableAtIndex:(unint64_t)a3;
- (double)_yForModallyPresentedGroup;
- (double)_yForModallyPresentedGroupForExternalPresentation:(BOOL)a3 ignoringCompactState:(BOOL)a4;
- (double)_yForSingleGroupView:(id)a3;
- (double)_yPositionForGroupAtIndex:(unint64_t)a3 forState:(int64_t)a4;
- (double)pileHeight;
- (double)topContentSeparatorHeight;
- (id)_animatorForGestureRecognizer:(id)a3;
- (id)_createFactoryForExternalPresentation;
- (id)_createPassFooterConfigurationForPassView:(id)a3 withContext:(id)a4;
- (id)_createSortedGroupViewIndexesWithMap:(id *)a3;
- (id)_createStackedIndices;
- (id)_dismissModalGroupViewFromExternalToState:(int64_t)a3;
- (id)_firstHeaderContext;
- (id)_frontmostPastViewForGroupIndex:(unint64_t)a3;
- (id)_groupViewAtIndex:(unint64_t)a3;
- (id)_groupViewAtIndexWhileEnsuringVisible:(unint64_t)a3 withContentMode:(int64_t)a4;
- (id)_groupViewWithGroup:(id)a3;
- (id)_groupViewWithGroupID:(id)a3;
- (id)_headerContextForPassType:(unint64_t)a3;
- (id)_layoutStateForHeaderContext:(id)a3 inTableWithBounds:(CGRect)a4;
- (id)_layoutStateForHeaderContext:(id)a3 offscreenWithBounds:(CGRect)a4 offset:(double)a5;
- (id)_loadGroupViewAtIndex:(unint64_t)a3 forState:(int64_t)a4 presentationState:(int64_t)a5 cached:(BOOL *)a6;
- (id)_separatorGroup;
- (id)groupViewReusablePassViewQueue:(id)a3;
- (id)headerForPassType:(unint64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)coachingState;
- (int64_t)groupViewContentModeForFrontmostPassWhenPiled:(id)a3 withDefaultContentMode:(int64_t)a4;
- (int64_t)groupViewContentModeForFrontmostPassWhenStacked:(id)a3;
- (int64_t)pilingMode;
- (int64_t)presentationState;
- (unint64_t)_edgeStylesObscuredByTopCornersOfPassStyle:(int64_t)a3;
- (unint64_t)_edgeStylesObscuredByTopMiddleOfPassStyle:(int64_t)a3;
- (unint64_t)_indexForNativePositionInTable:(CGPoint)a3;
- (unint64_t)_indexForNativePositionInTable:(CGPoint)a3 roundToClosestIndex:(BOOL)a4;
- (unint64_t)_indexOfGroupView:(id)a3;
- (unint64_t)_indexOfReorderedGroupView;
- (unint64_t)_lastIndex;
- (unint64_t)_maximumNumberOfVisiblePilePasses;
- (unint64_t)_startVisibleIndex;
- (unint64_t)_tablePresentationNumberOfCellsBeforeHeaderHidden;
- (unint64_t)_tablePresentationNumberOfCellsBeforeStacking;
- (unint64_t)groupViewPassesSuppressedContent:(id)a3;
- (unint64_t)modalGroupIndex;
- (unint64_t)suppressedContentForPassFooter:(id)a3;
- (void)_addGroupViewAsSubview:(id)a3 forIndex:(unint64_t)a4;
- (void)_addPanGestureRecognizerToGroupView:(id)a3;
- (void)_adjustGroupViewsForReordering;
- (void)_animateGroupViewAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4 withAnchorView:(id)a5 insertAbove:(BOOL)a6;
- (void)_animateGroupViewForUndo:(id)a3 toIndex:(unint64_t)a4;
- (void)_arrangeGroups;
- (void)_autoscrollForReordering:(id)a3;
- (void)_autoscrollIfNecessary;
- (void)_beginGroupPanWithAnimator:(id)a3;
- (void)_cancelSuspendedTransition;
- (void)_cancelTransition;
- (void)_disableScrollingAndNormalizeContentOffset;
- (void)_endGroupPanWithAnimator:(id)a3;
- (void)_enumerateLoadedGroupViews:(id)a3;
- (void)_executeCompletionHandlers:(id)a3 cancelled:(BOOL)a4;
- (void)_generateModalGroupPileWithVisibleIndexes:(_NSRange)a3 reservePlaceForModalGroup:(BOOL)a4;
- (void)_handleModalGroupGesture:(id)a3;
- (void)_handleScrollViewPanGesture:(id)a3;
- (void)_hideBackdropViewAnimated:(BOOL)a3 delay:(double)a4;
- (void)_layoutFooterAnimated:(BOOL)a3 withAnimationDelay:(double)a4;
- (void)_moveBackdropViewToFront;
- (void)_notifyDelegateOfStateChange:(BOOL)a3;
- (void)_paymentDidReceiveSuccessfulTransactionNotification:(id)a3;
- (void)_presentBackdropViewAnimated:(BOOL)a3 delay:(double)a4;
- (void)_presentGroupStackViewWithAnimation:(BOOL)a3 priorBounds:(CGRect)a4 completionHandler:(id)a5;
- (void)_presentModalGroupView:(id)a3 withState:(int64_t)a4 animated:(BOOL)a5 context:(id)a6 completion:(id)a7;
- (void)_presentModalGroupViewPostAnimationActions;
- (void)_presentOffscreenAnimated:(BOOL)a3 split:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)_presentPassIngestionWithAnimation:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)_rampBacklightIfNecessary:(BOOL)a3;
- (void)_refreshBacklightForFrontmostPassGroup;
- (void)_removeGroupViewAsSubviewWithGroupID:(id)a3;
- (void)_removePanGestureRecognizerFromGroupView:(id)a3;
- (void)_reorderPositionChangedForReorderedGroupViewWithVelocity:(CGPoint)a3;
- (void)_resetBackdropViewToStart:(BOOL)a3;
- (void)_resetBrightness;
- (void)_resumeSuspendedTransition;
- (void)_reverseEnumerateLoadedGroupViews:(id)a3;
- (void)_setDefaultPaymentPassFromGroupView:(id)a3 reorderedGroupView:(id)a4;
- (void)_setModalGroupView:(id)a3;
- (void)_setScrollEnabled:(BOOL)a3;
- (void)_setupSpringFactoryForTableToExternalAnimations:(id)a3;
- (void)_stopAutoscrollTimer;
- (void)_suspendTransition;
- (void)_tileGroupsForState:(int64_t)a3 eager:(BOOL)a4 withContext:(id)a5;
- (void)_transitionSuccessful:(BOOL)a3;
- (void)_undoUserReorderWithReorderedGroupView:(id)a3;
- (void)_unpressGroupView;
- (void)_updateBackdropViewFilters;
- (void)_updateBottomContentSeparatorVisibilityAnimated:(BOOL)a3;
- (void)_updateCoachingState;
- (void)_updateContentSizeAndLayout:(BOOL)a3;
- (void)_updateContentSizeAndLayout:(BOOL)a3 forceUpdate:(BOOL)a4;
- (void)_updateGroupStateForGroupViewInModalPresentation:(id)a3 withState:(int64_t)a4 animated:(BOOL)a5 withContext:(id)a6;
- (void)_updateGroupStateForGroupViewInStackPresentation:(id)a3 animated:(BOOL)a4;
- (void)_updateGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5;
- (void)_updateGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5 atIndex:(unint64_t)a6;
- (void)_updateModalGroupViewFromTableToExternalPresentationWithFactory:(id)a3;
- (void)_updatePanGestureRecognizerForGroupView:(id)a3;
- (void)_updatePassFooterViewIfNecessaryWithContext:(id)a3 becomeVisibleDelay:(double)a4;
- (void)_updatePassFooterViewWithConfiguration:(id)a3 context:(id)a4 animated:(BOOL)a5 reload:(BOOL)a6 delay:(double)a7;
- (void)_updatePassFooterViewWithContext:(id)a3;
- (void)_updatePausedState;
- (void)_updatePositionForGroupView:(id)a3 toPosition:(CGPoint)a4 withSpringFactory:(id)a5;
- (void)_updatePositionForGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5;
- (void)_updatePositionForGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5 atIndex:(unint64_t)a6;
- (void)_updateTopContentSeparatorVisibilityAnimated:(BOOL)a3;
- (void)_updateTransformForGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5;
- (void)beginScrollCardListTest;
- (void)beginSelectCardTest;
- (void)dashboardPassViewController:(id)a3 didRequestPaymentForPass:(id)a4 fromButton:(BOOL)a5;
- (void)dealloc;
- (void)deleteAnimationController:(id)a3 didComplete:(BOOL)a4;
- (void)deleteAnimationControllerWillBeginDeleteAnimation:(id)a3;
- (void)deleteGroup:(id)a3 atIndex:(unint64_t)a4;
- (void)didDeletePass:(id)a3;
- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3;
- (void)evaluateBrightness;
- (void)gotoBaseTestState;
- (void)groupView:(id)a3 deleteButtonPressedForPass:(id)a4;
- (void)groupView:(id)a3 didUpdatePassView:(id)a4;
- (void)groupView:(id)a3 frontmostPassViewDidChange:(id)a4 withContext:(id)a5;
- (void)groupView:(id)a3 panned:(CGPoint)a4 withVelocity:(CGPoint)a5;
- (void)groupViewDidMoveToReceiver:(id)a3;
- (void)groupViewDidUpdatePageControlVisibility:(id)a3;
- (void)groupViewExpandButtonTapped:(id)a3;
- (void)groupViewIsAvailable:(id)a3;
- (void)groupViewNeedsAnimating:(id)a3 withVelocity:(double)a4 dragging:(BOOL)a5;
- (void)groupViewPanDidBegin:(id)a3;
- (void)groupViewPanDidEnd:(id)a3;
- (void)groupViewPressed:(id)a3;
- (void)groupViewTapped:(id)a3;
- (void)groupViewWillBeAvailable:(id)a3;
- (void)interstitialControllerAvailable:(id)a3;
- (void)invalidate;
- (void)layoutContentForCurrentPresentationState:(BOOL)a3;
- (void)layoutHeaderFootersAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)modalPresentationIsPending;
- (void)moveGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (void)passFooterViewDidChangeCoachingState:(id)a3;
- (void)passFooterViewDidChangePhysicalButtonRequirement:(id)a3;
- (void)passFooterViewDidChangePhysicalButtonRequirement:(id)a3 withContext:(id)a4;
- (void)passFooterViewDidChangePileSuppressionRequirement:(id)a3;
- (void)passFooterViewDidEndAuthorization:(id)a3;
- (void)passFooterViewDidSucceedAtAuthorization:(id)a3;
- (void)paymentDeviceDidBecomeAvailable;
- (void)paymentDeviceDidBecomeUnavailable;
- (void)presentDiff:(id)a3 completion:(id)a4;
- (void)presentPassWithUniqueID:(id)a3;
- (void)presentPassWithUniqueID:(id)a3 withContext:(id)a4 animated:(BOOL)a5;
- (void)reloadData;
- (void)reloadSuppressedContentForGroupView:(id)a3;
- (void)resetBrightness;
- (void)safeAreaInsetsDidChange;
- (void)scrollDownTest;
- (void)scrollNext;
- (void)scrollUpTest;
- (void)setCurrentPageIndicatorTintColor:(id)a3;
- (void)setDatasource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryDatasource:(id)a3;
- (void)setExternalFooterSuppressed:(BOOL)a3;
- (void)setFooterSuppressed:(BOOL)a3;
- (void)setFooterSuppressed:(BOOL)a3 withContext:(id)a4;
- (void)setGroupsController:(id)a3;
- (void)setModalGroupIndex:(unint64_t)a3;
- (void)setPageIndicatorTintColor:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPilingMode:(int64_t)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setPresentationState:(int64_t)a3 animated:(BOOL)a4;
- (void)setPresentationState:(int64_t)a3 withContext:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setStaggerPileAnimations:(BOOL)a3;
- (void)setTableModalPresentationEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setTopContentSeparatorHeight:(double)a3;
- (void)stageGroupInPresentationState:(int64_t)a3 atIndex:(unint64_t)a4;
- (void)testGoModal;
- (void)testGroupSelection;
- (void)tilePassesEagerly:(BOOL)a3;
- (void)updateFooterViewIfNecessary;
- (void)updateHeaderAndSubheaderViewsIfNecessary;
- (void)updatePeerPaymentFooterViewIfNecessary;
- (void)willDeletePass:(id)a3;
@end

@implementation PKPassGroupStackView

uint64_t __61__PKPassGroupStackView__createSortedGroupViewIndexesWithMap___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setTopContentSeparatorHeight:(double)a3
{
  if (self->_topContentSeparatorHeight != a3)
  {
    self->_topContentSeparatorHeight = a3;
    [(PKPassGroupStackView *)self setNeedsLayout];
    [(PKPassGroupStackView *)self layoutIfNeeded];
    [(PKPassGroupStackView *)self layoutContentForCurrentPresentationState:0];
  }
}

- (void)updatePeerPaymentFooterViewIfNecessary
{
  v3 = [(PKPassGroupView *)self->_modallyPresentedGroupView frontmostPassView];
  id v4 = [v3 pass];

  if ([v4 passType] == 1 && objc_msgSend(v4, "hasAssociatedPeerPaymentAccount")) {
    [(PKPassGroupStackView *)self _updatePassFooterViewWithContext:0];
  }
}

- (void)setGroupsController:(id)a3
{
}

- (void)setDiscoveryDatasource:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassGroupStackView;
  id v4 = a3;
  [(PKPassGroupStackView *)&v6 setDelegate:v4];
  self->_delegateWantsTopContentSeparation = objc_opt_respondsToSelector() & 1;
  char v5 = objc_opt_respondsToSelector();

  self->_delegateWantsBottomContentSeparation = v5 & 1;
}

- (void)setDatasource:(id)a3
{
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassGroupStackView;
  [(PKPassGroupStackView *)&v3 safeAreaInsetsDidChange];
  [(PKPassGroupStackView *)self setNeedsLayout];
  [(PKPassGroupStackView *)self layoutIfNeeded];
  [(PKPassGroupStackView *)self layoutContentForCurrentPresentationState:0];
}

- (void)layoutContentForCurrentPresentationState:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKPassGroupStackView *)self contentOffset];

  -[PKPassGroupStackView _layoutContentFromOffset:toOffset:animated:](self, "_layoutContentFromOffset:toOffset:animated:", v3, v5, v6, v5, v6);
}

- (PKPassGroupStackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v58.receiver = self;
  v58.super_class = (Class)PKPassGroupStackView;
  double v5 = -[PKPassGroupStackView initWithFrame:](&v58, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  double v6 = v5;
  if (v5)
  {
    [(PKPassGroupStackView *)v5 setClipsToBounds:0];
    [(PKPassGroupStackView *)v6 setAlwaysBounceVertical:1];
    [(PKPassGroupStackView *)v6 setShowsVerticalScrollIndicator:0];
    [(PKPassGroupStackView *)v6 _setContentInsetAdjustmentBehavior:2];
    v6->_staggerPileAnimations = 1;
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:(unint64_t)(height / 55.0)];
    groupViewsByGroupID = v6->_groupViewsByGroupID;
    v6->_groupViewsByGroupID = (NSMutableDictionary *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    animatorsByGroupID = v6->_animatorsByGroupID;
    v6->_animatorsByGroupID = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groupViewsInFlightByGroupID = v6->_groupViewsInFlightByGroupID;
    v6->_groupViewsInFlightByGroupID = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    transitionCompletionHandlers = v6->_transitionCompletionHandlers;
    v6->_transitionCompletionHandlers = (NSMutableArray *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    suspendedTransitionCompletionHandlers = v6->_suspendedTransitionCompletionHandlers;
    v6->_suspendedTransitionCompletionHandlers = (NSMutableArray *)v15;

    v17 = [[PKReusablePassViewQueue alloc] initWithCount:0];
    reusableCardViewQueue = v6->_reusableCardViewQueue;
    v6->_reusableCardViewQueue = v17;

    v6->_presentationState = 1;
    v6->_modalGroupIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6->_layoutState.groups.separatorIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (PKSecureElementIsAvailable())
    {
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v6];
      paymentService = v6->_paymentService;
      v6->_paymentService = (PKPaymentService *)v19;
    }
    v21 = [PKPassthroughView alloc];
    double v22 = *MEMORY[0x1E4F1DAD8];
    double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    uint64_t v24 = -[PKPassthroughView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E4F1DAD8], v23, width, height);
    headerContainerView = v6->_headerContainerView;
    v6->_headerContainerView = (PKPassthroughView *)v24;

    [(PKPassGroupStackView *)v6 addSubview:v6->_headerContainerView];
    v26 = -[PKPassthroughView initWithFrame:]([PKPassthroughView alloc], "initWithFrame:", v22, v23, width, height);
    subheaderContainerView = v6->_subheaderContainerView;
    v6->_subheaderContainerView = v26;

    [(PKPassGroupStackView *)v6 addSubview:v6->_subheaderContainerView];
    v28 = -[PKPassthroughView initWithFrame:]([PKPassthroughView alloc], "initWithFrame:", v22, v23, width, height);
    passContainerView = v6->_passContainerView;
    v6->_passContainerView = v28;

    [(PKPassGroupStackView *)v6 addSubview:v6->_passContainerView];
    v30 = -[PKBackdropView initWithFrame:]([PKBackdropView alloc], "initWithFrame:", v22, v23, width, height);
    backdropView = v6->_backdropView;
    v6->_backdropView = v30;

    [(PKPassGroupStackView *)v6 _updateBackdropViewFilters];
    [(PKBackdropView *)v6->_backdropView setAlpha:0.0];
    v32 = v6->_backdropView;
    v33 = [(id)objc_opt_class() backdropStartBackgroundColor];
    [(PKBackdropView *)v32 setBackgroundColor:v33];

    v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v6 selector:sel__updateBackdropViewFilters name:*MEMORY[0x1E4FB24A8] object:0];

    v6->_pressedGroupViewIndex = 0x7FFFFFFFFFFFFFFFLL;
    v35 = (void *)MEMORY[0x1E4FB1818];
    v36 = PKPassKitUIBundle();
    v37 = [v35 imageNamed:@"StackPocketBackgroundShadow" inBundle:v36];
    v38 = objc_msgSend(v37, "pkui_resizableImageByTilingHorizontally");

    uint64_t v39 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v38];
    footerPocketBackgroundShadow = v6->_footerPocketBackgroundShadow;
    v6->_footerPocketBackgroundShadow = (UIImageView *)v39;

    v41 = [(UIImageView *)v6->_footerPocketBackgroundShadow layer];
    objc_msgSend(v41, "setAnchorPoint:", 0.5, 1.0);

    [(UIImageView *)v6->_footerPocketBackgroundShadow setAlpha:0.0];
    v42 = (void *)MEMORY[0x1E4FB1818];
    v43 = PKPassKitUIBundle();
    v44 = [v42 imageNamed:@"StackPocketForegroundShadow" inBundle:v43];
    v45 = objc_msgSend(v44, "pkui_resizableImageByTilingHorizontally");

    uint64_t v46 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v45];
    footerPocketForegroundShadow = v6->_footerPocketForegroundShadow;
    v6->_footerPocketForegroundShadow = (UIImageView *)v46;

    v48 = [(UIImageView *)v6->_footerPocketForegroundShadow layer];
    objc_msgSend(v48, "setAnchorPoint:", 0.5, 1.0);

    [(UIImageView *)v6->_footerPocketForegroundShadow setAlpha:0.0];
    v49 = (PKSecureElement *)objc_alloc_init(MEMORY[0x1E4F84FC0]);
    secureElement = v6->_secureElement;
    v6->_secureElement = v49;

    uint64_t v51 = [MEMORY[0x1E4FB1618] labelColor];
    currentPageIndicatorTintColor = v6->_currentPageIndicatorTintColor;
    v6->_currentPageIndicatorTintColor = (UIColor *)v51;

    uint64_t v53 = [(UIColor *)v6->_currentPageIndicatorTintColor colorWithAlphaComponent:0.3];
    pageIndicatorTintColor = v6->_pageIndicatorTintColor;
    v6->_pageIndicatorTintColor = (UIColor *)v53;

    v55 = [(PKPassGroupStackView *)v6 panGestureRecognizer];
    [v55 addTarget:v6 action:sel__handleScrollViewPanGesture_];

    if ((PKRunningInRemoteContext() & 1) == 0)
    {
      v56 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v56 addObserver:v6 selector:sel__paymentDidReceiveSuccessfulTransactionNotification_ name:*MEMORY[0x1E4F879B8] object:0];
    }
  }
  return v6;
}

- (id)groupViewReusablePassViewQueue:(id)a3
{
  return self->_reusableCardViewQueue;
}

- (void)_updateBackdropViewFilters
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PKBackdropView *)self->_backdropView backdropLayer];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    [v2 setFilters:0];
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v3 setName:@"gaussianBlur"];
    [v3 setValue:&unk_1EF2B88F0 forKey:@"inputRadius"];
    v5[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [v2 setFilters:v4];

    [v2 setScale:0.2];
  }
}

+ (id)backdropStartBackgroundColor
{
  v2 = [a1 backgroundColor];
  BOOL v3 = [v2 colorWithAlphaComponent:0.2];

  return v3;
}

+ (id)backgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
}

- (void)layoutHeaderFootersAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  [(PKPassGroupStackView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double rect_24 = v11;
  uint64_t v12 = 31;
  if (!self->_transitionCanceller) {
    uint64_t v12 = 7;
  }
  uint64_t v13 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR___PKPassGroupStackView__staggerPileAnimations[v12]);
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x2020000000;
  uint64_t v117 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke;
  aBlock[3] = &unk_1E59D5E70;
  char v113 = v3;
  aBlock[4] = self;
  aBlock[5] = &v114;
  v14 = _Block_copy(aBlock);
  interstitialController = self->_interstitialController;
  if (interstitialController
    && [(PKPGSVTransitionInterstitialController *)interstitialController isInvalidated])
  {
    v16 = self->_interstitialController;
    self->_interstitialController = 0;
  }
  BOOL v17 = v13 != 7 || (*((_WORD *)&self->_layoutState + 32) & 0xC000) != 0;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2020000000;
  BOOL v111 = self->_interstitialController == 0;
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_2;
  v105[3] = &unk_1E59D5E98;
  BOOL v106 = v17;
  v105[4] = self;
  v105[5] = &v108;
  char v107 = v3;
  v18 = _Block_copy(v105);
  uint64_t v19 = v18;
  if (v17 && v13 != 4) {
    (*((void (**)(void *, void, double))v18 + 2))(v18, 0, 0.0);
  }
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_3;
  v96[3] = &unk_1E59D5EC0;
  BOOL v104 = v13 == 4;
  v96[4] = self;
  CGFloat v100 = v6;
  CGFloat v101 = v8;
  CGFloat v102 = v10;
  double v103 = rect_24;
  id v20 = v14;
  id v97 = v20;
  v99 = &v108;
  id rect_8 = v19;
  id v98 = rect_8;
  v93 = _Block_copy(v96);
  v118.origin.double x = v6;
  v118.origin.double y = v8;
  v118.size.double width = v10;
  v118.size.CGFloat height = rect_24;
  double v21 = CGRectGetMaxY(v118) + 40.0;
  paymentHeaderContext = self->_paymentHeaderContext;
  if (paymentHeaderContext)
  {
    double top = paymentHeaderContext->_headerMargins.top;
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)self->_paymentHeaderContext);
    double bottom = paymentHeaderContext->_headerMargins.bottom;
    double v26 = -[PKPGSVSectionHeaderContext _subheadersHeight]((uint64_t)paymentHeaderContext) + top + v25 + bottom;
    if (v13 != 2
      && __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_4((uint64_t)self->_paymentHeaderContext))
    {
      v119.origin.double x = v6;
      v119.origin.double y = v8;
      v119.size.double width = v10;
      v119.size.CGFloat height = rect_24;
      double v21 = CGRectGetMinY(v119) + -40.0 - v26;
    }
    (*((void (**)(void *, PKPGSVSectionHeaderContext *, void, void, uint64_t, double))v93 + 2))(v93, self->_paymentHeaderContext, 0, 0, 1, v21);
    double v21 = v26 + v21;
  }
  passHeaderContext = self->_passHeaderContext;
  if (passHeaderContext)
  {
    CGFloat v28 = v8;
    unsigned int rect = v3;
    double v29 = passHeaderContext->_headerMargins.top;
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)passHeaderContext);
    double v31 = v30;
    double v32 = passHeaderContext->_headerMargins.bottom;
    double v33 = -[PKPGSVSectionHeaderContext _subheadersHeight]((uint64_t)passHeaderContext);
    if (v13 != 2)
    {
      v34 = self->_paymentHeaderContext;
      if (v34)
      {
        v35 = self->_passHeaderContext;
LABEL_23:
        v34 = (PKPGSVSectionHeaderContext *)v34->_headerView;
LABEL_24:
        v36 = v34;
        v37 = self->_paymentHeaderContext;
        if (v37) {
          v37 = (PKPGSVSectionHeaderContext *)v37->_subheaderContexts;
        }
        v38 = v37;
        uint64_t v39 = [(PKPGSVSectionHeaderContext *)v38 lastObject];
        v40 = (void *)v39;
        if (v39) {
          v41 = *(void **)(v39 + 8);
        }
        else {
          v41 = 0;
        }
        id v42 = v41;
        (*((void (**)(void *, PKPGSVSectionHeaderContext *, PKPGSVSectionHeaderContext *, id, BOOL, double))v93
         + 2))(v93, v35, v36, v42, self->_paymentHeaderContext == 0, v21);

        uint64_t v3 = rect;
        CGFloat v8 = v28;
        goto LABEL_29;
      }
      double v84 = v33;
      if (__52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_4((uint64_t)self->_passHeaderContext))
      {
        v124.origin.double x = v6;
        v124.origin.double y = v28;
        v124.size.double width = v10;
        v124.size.CGFloat height = rect_24;
        double v21 = CGRectGetMinY(v124) + -40.0 - (v84 + v29 + v31 + v32);
      }
    }
    v34 = self->_paymentHeaderContext;
    v35 = self->_passHeaderContext;
    if (!v34) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_29:
  if (!*((unsigned char *)v109 + 24)) {
    (*((void (**)(id, void, double))rect_8 + 2))(rect_8, 0, 0.0);
  }
  v115[3] = *(void *)&self->_footerAnimationDelay;
  if (self->_footerView)
  {
    if (v13 == 4) {
      char v43 = ![(PKPassGroupStackView *)self isTableModalPresentation];
    }
    else {
      char v43 = 0;
    }
    [(PKPassGroupStackView *)self contentSize];
    double v45 = v44;
    uint64_t v46 = [(UIImageView *)self->_footerPocketBackgroundShadow image];
    [v46 size];
    double v48 = v47;
    CGFloat recta = v6;

    v49 = [(UIImageView *)self->_footerPocketForegroundShadow image];
    [v49 size];
    double v87 = v50;
    double v51 = *MEMORY[0x1E4F1DAD8];
    double v52 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

    memset(&slice, 0, sizeof(slice));
    remainder.origin.double x = v51;
    remainder.origin.double y = v52;
    remainder.size.double width = v10;
    remainder.size.CGFloat height = fmax(v45, rect_24);
    v120.origin.double x = v51;
    v120.origin.double y = v52;
    v120.size.double width = v10;
    CGFloat height = remainder.size.height;
    v120.size.CGFloat height = remainder.size.height;
    CGRectDivide(v120, &slice, &remainder, self->_lastBoundsInsets.bottom, CGRectMaxYEdge);
    CGRectDivide(remainder, &slice, &remainder, self->_footerViewMinimumHeight, CGRectMaxYEdge);
    double y = slice.origin.y;
    double rect_16 = v10;
    if ((v43 & 1) == 0)
    {
      v121.origin.double x = recta;
      v121.origin.double y = v8;
      v121.size.double width = v10;
      v121.size.CGFloat height = rect_24;
      double y = fmax(v48, v87)
        + 40.0
        + fmax(slice.origin.y + self->_footerViewMinimumHeight + self->_lastBoundsInsets.bottom, CGRectGetMaxY(v121));
      slice.origin.double y = y;
    }
    double x = slice.origin.x;
    double width = slice.size.width;
    v56 = [(UIImageView *)self->_footerPocketBackgroundShadow layer];
    [v56 anchorPoint];
    double v58 = v57;
    double v60 = v59;

    (*((void (**)(id, UIImageView *, PKPassGroupStackView *, void, void, void, double, double, double, double, double, double, double))v20
     + 2))(v20, self->_footerPocketBackgroundShadow, self, 0, 0, 0, x + v58 * width, y - v48 + v60 * v48, v51, v52, width, v48, 1.0);
    [(PKPassGroupStackView *)self _xFrameForGroupViewInState:4];
    double v62 = v61;
    double v64 = v63;
    double v65 = slice.origin.y;
    v66 = [(UIImageView *)self->_footerPocketForegroundShadow layer];
    [v66 anchorPoint];
    double v68 = v67;
    double v70 = v69;

    (*((void (**)(id, UIImageView *, PKPassGroupStackView *, PKPassthroughView *, void, void, double, double, double, double, double, double, double))v20
     + 2))(v20, self->_footerPocketForegroundShadow, self, self->_passContainerView, 0, 0, v62 + v68 * v64, v65 - v87 + v70 * v87, v51, v52, v64, v87, self->_footerPocketForegroundShadowAlpha);
    double footerViewMinimumHeight = self->_footerViewMinimumHeight;
    double v72 = self->_lastBoundsInsets.bottom;
    v122.origin.double x = recta;
    v122.origin.double y = v85;
    v122.size.double width = rect_16;
    v122.size.CGFloat height = rect_24;
    CGRectGetMaxY(v122);
    v123.origin.double x = v51;
    v123.origin.double y = v52;
    v123.size.double width = rect_16;
    v123.size.CGFloat height = height;
    CGRectGetMaxY(v123);
    PKFloatCeilToPixel();
    double v74 = v73;
    v75 = [(UIView *)self->_footerView layer];
    [v75 anchorPoint];
    double v77 = v76;
    double v79 = v78;

    double v80 = slice.origin.x;
    v81.n128_u64[0] = 0.5;
    v82.n128_f64[0] = (slice.size.width - rect_16) * 0.5;
    PKFloatFloorToPixel(v82, v81);
    (*((void (**)(id, UIView *, PKPassGroupStackView *, PKPassthroughView *, void, void, double, CGFloat, double, double, double, double, double))v20
     + 2))(v20, self->_footerView, self, self->_passContainerView, 0, 0, v80 + v83 + v77 * rect_16, slice.origin.y + v79 * (footerViewMinimumHeight + v72 + v74), v51, v52, rect_16, footerViewMinimumHeight + v72 + v74, 1.0);
  }
  [(PKPassGroupStackView *)self _updateTopContentSeparatorVisibilityAnimated:v3];
  [(PKPassGroupStackView *)self _updateBottomContentSeparatorVisibilityAnimated:v3];

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);
}

void __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, int a5, int a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  id v59 = a2;
  id v25 = a3;
  id v26 = a4;
  if (v59)
  {
    v27 = [v59 layer];
    objc_msgSend(v25, "convertPoint:fromView:", *(void *)(a1 + 32), a7, a8);
    double v29 = v28;
    double v31 = v30;
    double v32 = [v59 superview];

    if (v32)
    {
      if (!*(unsigned char *)(a1 + 48)) {
        goto LABEL_20;
      }
      double v57 = a9;
      double v58 = a12;
      double v33 = a10;
      double v34 = a11;
      [v27 position];
      double v36 = v35;
      double v38 = v37;
      [v27 opacity];
      double v40 = v39;
      if (v36 != v29 || v38 != v31)
      {
        v41 = [MEMORY[0x1E4F85060] highFrameRateSpringAnimationWithKeyPath:@"position" reason:1];
        objc_msgSend(v41, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v36, v38, v29, v31);
        [v41 setBeginTime:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
        id v42 = (id)objc_msgSend(v27, "pkui_addAdditiveAnimation:", v41);
      }
      a11 = v34;
      a10 = v33;
      a9 = v57;
      a12 = v58;
      if (v40 == a13) {
        goto LABEL_20;
      }
      char v43 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v43, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v40, a13);
    }
    else
    {
      if (v26
        && ([v26 superview], id v44 = (id)objc_claimAutoreleasedReturnValue(), v44, v44 == v25))
      {
        [v25 insertSubview:v59 aboveSubview:v26];
      }
      else
      {
        [v25 insertSubview:v59 atIndex:0];
      }
      if (!*(unsigned char *)(a1 + 48)) {
        goto LABEL_20;
      }
      [v27 setOpacity:0.0];
      objc_msgSend(v27, "pkui_animateToOpacity:withCompletion:", 0, a13);
      if (!a5) {
        goto LABEL_20;
      }
      double v45 = a9;
      [v25 bounds];
      if (a6)
      {
        double MinY = CGRectGetMinY(*(CGRect *)&v46);
        [v27 anchorPoint];
        double v52 = MinY - v51 * a12;
      }
      else
      {
        double MaxY = CGRectGetMaxY(*(CGRect *)&v46);
        [v27 anchorPoint];
        double v52 = MaxY + v54 * a12;
      }
      char v43 = [MEMORY[0x1E4F85060] highFrameRateSpringAnimationWithKeyPath:@"position" reason:1];
      objc_msgSend(v43, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v29, v52, v29, v31);
      [v43 setBeginTime:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      a9 = v45;
    }
    id v55 = (id)objc_msgSend(v27, "pkui_addAdditiveAnimation:", v43);

LABEL_20:
    objc_msgSend(v27, "setPosition:", v29, v31);
    objc_msgSend(v27, "setBounds:", a9, a10, a11, a12);
    *(float *)&double v56 = a13;
    [v27 setOpacity:v56];
  }
}

- (CGPoint)_positionForGroupView:(id)a3 atIndex:(unint64_t)a4 forState:(int64_t)a5
{
  id v8 = a3;
  [(PKPassGroupStackView *)self _yPositionForGroupAtIndex:a4 forState:a5];
  double v10 = v9;
  [(PKPassGroupStackView *)self _xPositionForGroupView:v8 forState:a5];
  double v12 = v11;
  uint64_t v13 = [v8 superview];
  passContainerView = self->_passContainerView;

  if (v13 != passContainerView)
  {
    uint64_t v15 = self->_passContainerView;
    v16 = [v8 superview];
    -[PKPassthroughView convertPoint:toView:](v15, "convertPoint:toView:", v16, v12, v10);
    double v12 = v17;
    double v10 = v18;
  }
  double v19 = v12;
  double v20 = v10;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (double)_yPositionForGroupAtIndex:(unint64_t)a3 forState:(int64_t)a4
{
  switch(a4)
  {
    case 1:
    case 2:
      goto LABEL_2;
    case 3:
      if (self->_modalGroupIndex != a3
        && self->_layoutState.groups.count != 1
        && ![(PKPassGroupStackView *)self _isGroupAtIndexInModalPile:a3])
      {
        goto LABEL_2;
      }
      [(PKPassGroupStackView *)self bounds];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      -[PKPassGroupStackView convertRect:toView:](self, "convertRect:toView:", 0);
      double v17 = v16;
      modallyPresentedGroupView = self->_modallyPresentedGroupView;
      if (!modallyPresentedGroupView) {
        goto LABEL_36;
      }
      double v19 = [(PKPassGroupView *)modallyPresentedGroupView frontmostPassView];
      double v20 = [v19 pass];
      [v20 style];

      double v21 = self->_modallyPresentedGroupView;
      if (v21)
      {
        [(PKPassGroupView *)v21 bounds];
        double v23 = v22;
      }
      else
      {
LABEL_36:
        PKPassFrontFaceContentSize();
        double v23 = v31;
      }
      v47.origin.double x = v9;
      v47.origin.double y = v11;
      v47.size.double width = v13;
      v47.size.CGFloat height = v15;
      CGFloat v32 = CGRectGetMinY(v47) - v17 - v23;
      PKPassFaceShadowInsets();
      CGFloat v34 = v32 - v33;
      PKPassFaceShadowInsets();
      return v34 - v35;
    case 4:
      -[PKPassGroupStackView _yForGroupInTableAtIndex:](self, "_yForGroupInTableAtIndex:");
      return result;
    case 5:
      uint64_t v24 = [(PKPassGroupStackView *)self _groupViewAtIndex:a3];
      id v25 = self->_modallyPresentedGroupView;

      if (v24 == v25)
      {
        [(PKPassGroupStackView *)self _yForModallyPresentedGroup];
        return result;
      }
      if ([(PKPassGroupStackView *)self _isGroupAtIndexInModalPile:a3])
      {
        [(PKPassGroupStackView *)self _yForGroupInModalPileAtIndex:a3];
        return result;
      }
      unint64_t v37 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexesIgnoringBottomInset:1];
      unint64_t v38 = v36;
      if (a3 >= v37 && a3 - v37 < v36)
      {
        [(PKPassGroupStackView *)self _yForGroupInPileAtIndex:a3];
        return result;
      }
      id v39 = [(PKPassGroupStackView *)self _groupViewAtIndex:a3];
      [(PKPassGroupStackView *)self bounds];
      double MaxY = CGRectGetMaxY(v48);
      v41 = [v39 frontmostPassView];
      id v42 = [v41 pass];
      [v42 style];
      PKPassFaceShadowInsets();
      double v6 = MaxY + v43;

      if (v37 + v38 <= a3)
      {
        [(PKPassGroupStackView *)self _pileAscenderHeight];
        double v6 = v6 + v44;
      }

      return v6;
    case 6:
      id v26 = [(PKPassGroupStackView *)self _groupViewAtIndex:a3];
      v27 = self->_modallyPresentedGroupView;

      if (v26 == v27)
      {
        double v30 = self->_modallyPresentedGroupView;
        [(PKPassGroupStackView *)self _yForSingleGroupView:v30];
      }
      else
      {
        [(PKPassGroupStackView *)self _yPositionForGroupAtIndex:a3 forState:2];
      }
      return result;
    case 7:
      double v28 = [(PKPassGroupStackView *)self _groupViewAtIndex:a3];
      double v29 = self->_modallyPresentedGroupView;

      if (v28 == v29)
      {
        [(PKPassGroupStackView *)self _yForExternalModallyPresentedGroup];
      }
      else if ([(PKPassGroupStackView *)self _isGroupAtIndexInModalPile:a3])
      {
        [(PKPassGroupStackView *)self _yForExternalModallyPresentedGroup];
        -[PKPassGroupStackView _yForGroupInExternalModalPileWithModalGroupY:](self, "_yForGroupInExternalModalPileWithModalGroupY:");
      }
      else
      {
LABEL_2:
        [(PKPassGroupStackView *)self bounds];
        return CGRectGetMaxY(v46) + 40.0;
      }
      return result;
    default:
      return (double)a3 * self->_layoutState.groupCellHeight + -3.0;
  }
}

- (double)_xPositionForGroupView:(id)a3 forState:(int64_t)a4
{
  [(PKPassGroupStackView *)self _xFrameForGroupViewInState:a4];
  return v4 + v5 * 0.5;
}

- (CGRect)_xFrameForGroupViewInState:(int64_t)a3
{
  PKPassFrontFaceContentSize();
  [(PKPassGroupStackView *)self bounds];

  PKSizeAlignedInRect();
  result.size.CGFloat height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

void __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, int a5, double a6)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  CGFloat v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (v11) {
    double v14 = (void *)v11[5];
  }
  else {
    double v14 = 0;
  }
  id v15 = v14;
  double v16 = *(void **)(a1 + 32);
  double v17 = *(double *)(a1 + 64);
  double v18 = *(double *)(a1 + 72);
  double v19 = *(double *)(a1 + 80);
  double v20 = *(double *)(a1 + 88);
  if (*(unsigned char *)(a1 + 96)) {
    double v21 = (double *)objc_msgSend(v16, "_layoutStateForHeaderContext:inTableWithBounds:", v11, v17, v18, v19, v20);
  }
  else {
    double v21 = (double *)objc_msgSend(v16, "_layoutStateForHeaderContext:offscreenWithBounds:offset:", v11, v17, v18, v19, v20, a6);
  }
  double v22 = v21;
  if (v15)
  {
    if (a5 && !*(unsigned char *)(a1 + 96))
    {
      v66 = (double *)objc_msgSend(*(id *)(a1 + 32), "_layoutStateForHeaderContext:inTableWithBounds:", v11, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      if (v66)
      {
        double v24 = v66[4];
        double v23 = v66[5];
        double v25 = v66[6];
      }
      else
      {
        double v23 = 0.0;
        double v25 = 0.0;
        double v24 = 0.0;
      }
    }
    else if (v21)
    {
      double v24 = v21[4];
      double v23 = v21[5];
      double v25 = v21[6];
    }
    else
    {
      double v24 = 0.0;
      double v23 = 0.0;
      double v25 = 0.0;
    }
    uint64_t v26 = *(void *)(a1 + 40);
    double v27 = -[PKPGSVSectionHeaderContext positionForHeaderViewInContainerFrame:]((uint64_t)v11, v24, v23, v25);
    double v29 = v28;
    -[PKPGSVSectionHeaderContext boundsForHeaderViewInContainerFrame:]((uint64_t)v11, v24, v23, v25);
    if (v22) {
      v34.n128_f64[0] = v22[2];
    }
    else {
      v34.n128_u64[0] = 0;
    }
    (*(void (**)(uint64_t, id, void, id, void, void, double, double, double, double, double, double, __n128))(v26 + 16))(v26, v15, *(void *)(*(void *)(a1 + 32) + 2560), v12, 0, 0, v27, v29, v30, v31, v32, v33, v34);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      double v35 = [v15 interstitialProvider];
      if (v35)
      {
        [v15 layoutIfNeeded];
        uint64_t v36 = *(void *)(a1 + 48);
        [v15 alpha];
        (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v35);
      }
    }
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  double v69 = v12;
  double v70 = v11;
  double v68 = v15;
  if (v22) {
    unint64_t v37 = (void *)*((void *)v22 + 3);
  }
  else {
    unint64_t v37 = 0;
  }
  double v67 = v22;
  id v38 = v37;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v71 objects:v75 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v72;
    do
    {
      uint64_t v42 = 0;
      double v43 = v13;
      do
      {
        if (*(void *)v72 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v44 = *(void *)(*((void *)&v71 + 1) + 8 * v42);
        if (v44)
        {
          double v45 = (id *)*(id *)(v44 + 8);
          CGRect v46 = v45;
          BOOL v47 = v45 == 0;
          if (v45) {
            id v48 = v45[1];
          }
          else {
            id v48 = 0;
          }
          id v13 = v48;
          double v49 = *(double *)(v44 + 16);
          double v50 = *(double *)(v44 + 24);
          double v51 = *(double *)(v44 + 32);
          double v52 = *(double *)(v44 + 40);
        }
        else
        {
          id v13 = 0;
          CGRect v46 = 0;
          double v50 = 0.0;
          BOOL v47 = 1;
          double v51 = 0.0;
          double v52 = 0.0;
          double v49 = 0.0;
        }
        uint64_t v53 = *(void *)(a1 + 40);
        double v56 = -[PKPGSVSectionSubheaderContext positionForViewInContainerFrame:]((uint64_t)v46, v49, v50, v51, v52);
        double v58 = v57;
        if (v47)
        {
          v55.n128_u64[0] = 0;
          v54.n128_u64[0] = 0;
          double v62 = 0.0;
          double v60 = 0.0;
        }
        else
        {
          objc_msgSend(v46[1], "bounds", v67, v68, v69, v70, (void)v71);
          double v60 = v59;
          double v62 = v61;
          v54.n128_u64[0] = v63;
          v55.n128_u64[0] = v64;
        }
        (*(void (**)(uint64_t, id, void, void *, uint64_t, BOOL, double, double, double, double, __n128, __n128, double))(v53 + 16))(v53, v13, *(void *)(*(void *)(a1 + 32) + 2568), v43, 1, a6 < 0.0, v56, v58, v60, v62, v54, v55, 1.0);

        ++v42;
        double v43 = v13;
      }
      while (v40 != v42);
      uint64_t v65 = [v38 countByEnumeratingWithState:&v71 objects:v75 count:16];
      uint64_t v40 = v65;
    }
    while (v65);
  }
}

- (id)_layoutStateForHeaderContext:(id)a3 offscreenWithBounds:(CGRect)a4 offset:(double)a5
{
  CGFloat width = a4.size.width;
  CGFloat x = a4.origin.x;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  double v8 = (double *)a3;
  CGFloat v9 = -[PKPGSVSectionHeaderLayoutState initWithContext:]([PKPGSVSectionHeaderLayoutState alloc], v8);
  double v10 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)v8);
  if (v8)
  {
    double v11 = v8[7];
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)v8);
    double v13 = v8[9] + v11 + v12;
  }
  else
  {
    double v13 = 0.0;
  }
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v38.origin.CGFloat x = x;
  v38.origin.double y = a5;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = v10;
  CGRectDivide(v38, &slice, &remainder, v13, CGRectMinYEdge);
  if (v9)
  {
    CGSize size = slice.size;
    *((_OWORD *)v9 + 2) = slice.origin;
    *((CGSize *)v9 + 3) = size;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v15 = (void *)v9[3];
  }
  else
  {
    id v15 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
  }
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * v20);
        if (v21)
        {
          id v22 = *(id *)(v21 + 8);
          double v23 = (double *)v22;
          if (v22)
          {
            double v24 = *((double *)v22 + 2);
            objc_msgSend(*((id *)v22 + 1), "bounds", (void)v30);
            double v26 = v23[4] + v24 + v25;
            goto LABEL_13;
          }
        }
        else
        {
          double v23 = 0;
        }
        double v26 = 0.0;
LABEL_13:
        CGRectDivide(remainder, &slice, &remainder, v26, CGRectMinYEdge);
        if (v21)
        {
          CGSize v27 = slice.size;
          *(CGPoint *)(v21 + 16) = slice.origin;
          *(CGSize *)(v21 + 32) = v27;
        }

        ++v20;
      }
      while (v18 != v20);
      uint64_t v28 = [v16 countByEnumeratingWithState:&v30 objects:v36 count:16];
      uint64_t v18 = v28;
    }
    while (v28);
  }

  return v9;
}

- (_NSRange)_rangeOfVisibleIndexesIgnoringBottomInset:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PKPassGroupStackView *)self _startVisibleIndex];
  [(PKPassGroupStackView *)self bounds];
  double MaxY = CGRectGetMaxY(v18);
  if (v3) {
    double MaxY = MaxY - self->_lastBoundsInsets.bottom;
  }
  uint64_t v7 = 1;
  do
  {
    uint64_t v8 = v7;
    unint64_t v9 = v5 + v7;
    if (!v9) {
      break;
    }
    if (v9 - 1 >= self->_layoutState.groups.count) {
      break;
    }
    -[PKPassGroupStackView _yForGroupInTableAtIndex:](self, "_yForGroupInTableAtIndex:");
    uint64_t v7 = v8 + 1;
  }
  while (v10 < MaxY);
  NSUInteger v11 = v8 - 1;
  if (*(unsigned char *)&self->_reorderingFlags)
  {
    reorderedGroupView = self->_reorderedGroupView;
    if (reorderedGroupView)
    {
      double v13 = [(PKPassGroupView *)reorderedGroupView layer];
      [v13 position];
      unint64_t v14 = -[PKPassGroupStackView _indexForNativePositionInTable:roundToClosestIndex:](self, "_indexForNativePositionInTable:roundToClosestIndex:", 1);

      if (v14 >= 2)
      {
        if (v14 - 1 >= v5)
        {
          if (v14 - 1 >= v11 + v5) {
            NSUInteger v11 = v14 - v5;
          }
        }
        else
        {
          NSUInteger v11 = v5 - v14 + v8;
          unint64_t v5 = v14 - 1;
        }
      }
    }
  }
  NSUInteger v15 = v5;
  NSUInteger v16 = v11;
  result.length = v16;
  result.location = v15;
  return result;
}

- (double)_yForGroupInTableAtIndex:(unint64_t)a3
{
  [(PKPassGroupStackView *)self bounds];
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  if (self->_layoutState.groups.count <= a3)
  {
    double MaxY = CGRectGetMaxY(*(CGRect *)&v5);
    PKPassFaceShadowInsets();
    return MaxY + v15;
  }
  else if ([(PKPassGroupStackView *)self isTableModalPresentation])
  {
    [(PKPassGroupStackView *)self _yForModallyPresentedGroup];
  }
  else
  {
    [(PKPassGroupStackView *)self _nativeYForGroupInTableAtIndex:a3];
    double v17 = v16;
    paymentHeaderContext = self->_paymentHeaderContext;
    if (paymentHeaderContext)
    {
      uint64_t v19 = paymentHeaderContext->_subheaderContexts;
      BOOL v20 = v19 != 0;
    }
    else
    {
      BOOL v20 = 0;
    }
    passHeaderContext = self->_passHeaderContext;
    if (passHeaderContext)
    {
      id v22 = passHeaderContext->_subheaderContexts;
      uint64_t v23 = v22 != 0;
    }
    else
    {
      uint64_t v23 = 0;
    }
    unint64_t v24 = v20 + a3;
    separatorIndeCGFloat x = self->_layoutState.groups.separatorIndex;
    BOOL v26 = separatorIndex == 0x7FFFFFFFFFFFFFFFLL || separatorIndex >= a3;
    if (!v26 || (*((unsigned char *)&self->_layoutState.groups + 16) & 2) == 0) {
      v24 += v23;
    }
    -[PKPassGroupStackView _transformedYForNativeYInTable:withBounds:index:](self, "_transformedYForNativeYInTable:withBounds:index:", v24, v17, v9, v10, v11, v12);
    if (self->_pressedGroupViewIndex == a3) {
      return result + -15.0;
    }
  }
  return result;
}

- (BOOL)isTableModalPresentation
{
  if (self->_layoutState.groups.count == 1) {
    return ![(PKPassGroupStackView *)self _isModalPresentationAllowedForSingleGroup];
  }
  else {
    return 0;
  }
}

- (double)_transformedYForNativeYInTable:(double)a3 withBounds:(CGRect)a4 index:(unint64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (a5 || a4.origin.y < 0.0)
  {
    PKPassStackScrollingAdjustedPosition();
    double v10 = v11;
  }
  else
  {
    double v10 = fmax(a3, a4.origin.y);
  }
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v16);
  PKPassFaceShadowInsets();
  double v14 = fmin(v10, MaxY + v13 + self->_layoutState.groupCellHeight);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  return fmax(v14, CGRectGetMinY(v17));
}

- (double)_nativeYForGroupInTableAtIndex:(unint64_t)a3
{
  double v5 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_paymentHeaderContext)
     + (double)a3 * self->_layoutState.groupCellHeight;
  separatorIndeCGFloat x = self->_layoutState.groups.separatorIndex;
  if (separatorIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((*((unsigned char *)&self->_layoutState.groups + 16) & 6) == 4)
    {
      double v7 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_passHeaderContext);
      return v5 + v7;
    }
  }
  else if (separatorIndex < a3)
  {
    double separationPadding = self->_layoutState.separationPadding;
    double v7 = separationPadding + -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_passHeaderContext);
    return v5 + v7;
  }
  return v5;
}

- (unint64_t)_startVisibleIndex
{
  [(PKPassGroupStackView *)self contentOffset];
  -[PKPassGroupStackView _nativePositionForPositionInTable:](self, "_nativePositionForPositionInTable:");

  return -[PKPassGroupStackView _indexForNativePositionInTable:roundToClosestIndex:](self, "_indexForNativePositionInTable:roundToClosestIndex:", 0);
}

- (CGPoint)_nativePositionForPositionInTable:(CGPoint)a3
{
  CGFloat x = a3.x;
  PKPassStackScrollingStretchRegionLowerBoundary();
  double v5 = fmax(v4, 0.0);
  double v6 = x;
  result.CGFloat y = v5;
  result.CGFloat x = v6;
  return result;
}

- (unint64_t)_indexForNativePositionInTable:(CGPoint)a3 roundToClosestIndex:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  p_layoutState = &self->_layoutState;
  if (self->_layoutState.groups.separatorIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PKPassGroupStackView *)self _nativeYForGroupInTableAtIndex:a3.x];
    if (y >= v8)
    {
      double v9 = v8;
      double v10 = v8 + p_layoutState->groupCellHeight;
      [(PKPassGroupStackView *)self _nativeYForGroupInTableAtIndex:p_layoutState->groups.separatorIndex + 1];
      double v12 = fmax(v10, v11);
      if (y >= v12)
      {
        double y = y - (v12 - v10);
      }
      else
      {
        [(PKPassGroupStackView *)self contentOffset];
        -[PKPassGroupStackView _nativePositionForPositionInTable:](self, "_nativePositionForPositionInTable:");
        if (v13 > v12 || v13 <= v9) {
          double v15 = v9;
        }
        else {
          double v15 = v13;
        }
        double y = v10 * ((y - v15) / (v12 - v15)) + (1.0 - (y - v15) / (v12 - v15)) * v9;
      }
    }
  }
  __int16 v16 = *((_WORD *)p_layoutState + 32);
  if ((v16 & 2) == 0)
  {
    double v17 = 0.0;
    if ((v16 & 4) == 0) {
      goto LABEL_18;
    }
LABEL_17:
    double v17 = v17 + -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_passHeaderContext);
    goto LABEL_18;
  }
  double v17 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_paymentHeaderContext) + 0.0;
  if ((*((unsigned char *)&p_layoutState->groups + 16) & 2) == 0 && (*((_WORD *)p_layoutState + 32) & 4) != 0) {
    goto LABEL_17;
  }
LABEL_18:
  double v18 = fmax(y - v17, 0.0) / p_layoutState->groupCellHeight;
  double v19 = round(v18);
  if (v4) {
    double v18 = v19;
  }
  double v20 = fmax(v18, 0.0);
  unint64_t v21 = p_layoutState->groups.count - 1;
  if (!p_layoutState->groups.count) {
    unint64_t v21 = 0;
  }
  if (v21 >= (unint64_t)v20) {
    return (unint64_t)v20;
  }
  else {
    return v21;
  }
}

- (void)_updateTopContentSeparatorVisibilityAnimated:(BOOL)a3
{
  if (self->_delegateWantsTopContentSeparation)
  {
    BOOL v3 = a3;
    [(PKPassGroupStackView *)self bounds];
    memset(&slice, 0, sizeof(slice));
    CGRect remainder = v34;
    BOOL v5 = 1;
    CGRectDivide(v34, &slice, &remainder, self->_lastBoundsInsets.top, CGRectMinYEdge);
    double lastTopContentSeparatorHeight = self->_lastTopContentSeparatorHeight;
    double v7 = lastTopContentSeparatorHeight + slice.size.height;
    slice.origin.double y = slice.origin.y - lastTopContentSeparatorHeight;
    slice.size.CGFloat height = lastTopContentSeparatorHeight + slice.size.height;
    int64_t presentationState = self->_presentationState;
    if (presentationState != 7 && presentationState != 5)
    {
      if (presentationState == 4)
      {
        BOOL v5 = [(PKPassGroupStackView *)self isTableModalPresentation];
        int64_t presentationState = self->_presentationState;
      }
      else
      {
        BOOL v5 = 0;
      }
    }
    char v10 = presentationState != 4 || v5;
    uint64_t v28 = 0;
    double v29 = (double *)&v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    if (v7 > 0.0)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__PKPassGroupStackView__updateTopContentSeparatorVisibilityAnimated___block_invoke;
      aBlock[3] = &__block_descriptor_64_e17_d16__0__CALayer_8l;
      CGRect v27 = slice;
      double v11 = (double (**)(void *, void *))_Block_copy(aBlock);
      if (v5)
      {
        modallyPresentedGroupView = self->_modallyPresentedGroupView;
        if (modallyPresentedGroupView)
        {
          double v13 = [(PKPassGroupView *)modallyPresentedGroupView layer];
          double v14 = v11[2](v11, v13);
          v29[3] = fmax(v14, v29[3]);
        }
      }
      if ((v10 & 1) == 0)
      {
        reorderedGroupView = self->_reorderedGroupView;
        if (reorderedGroupView)
        {
          __int16 v16 = [(PKPassGroupView *)reorderedGroupView layer];
          double v17 = v11[2](v11, v16);
          v29[3] = fmax(v17, v29[3]);
        }
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        id v22 = __69__PKPassGroupStackView__updateTopContentSeparatorVisibilityAnimated___block_invoke_2;
        uint64_t v23 = &unk_1E59D5F08;
        double v25 = &v28;
        unint64_t v24 = v11;
        double v18 = (void (**)(void *, PKPGSVSectionHeaderContext *))_Block_copy(&v20);
        v18[2](v18, self->_paymentHeaderContext);
        v18[2](v18, self->_passHeaderContext);
      }
    }
    double v19 = [(PKPassGroupStackView *)self delegate];
    PKSpringAnimationSolveForInput();
    objc_msgSend(v19, "groupStackView:wantsTopContentSeparatorWithVisibility:animated:", self, v3);

    _Block_object_dispose(&v28, 8);
  }
}

- (void)_updateBottomContentSeparatorVisibilityAnimated:(BOOL)a3
{
  if (!self->_delegateWantsBottomContentSeparation) {
    return;
  }
  BOOL v3 = a3;
  [(PKPassGroupStackView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(PKPassGroupStackView *)self contentSize];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  int64_t presentationState = self->_presentationState;
  if (presentationState == 7 || presentationState == 5) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = presentationState == 4 && [(PKPassGroupStackView *)self isTableModalPresentation];
  }
  memset(&slice, 0, sizeof(slice));
  remainder.origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
  remainder.size.CGFloat width = v14;
  remainder.size.CGFloat height = v16;
  v43.origin.CGFloat x = remainder.origin.x;
  v43.origin.double y = remainder.origin.y;
  v43.size.CGFloat width = v14;
  v43.size.CGFloat height = v16;
  CGRectDivide(v43, &slice, &remainder, self->_lastBoundsInsets.bottom, CGRectMaxYEdge);
  CGRect v40 = slice;
  remainder.origin.CGFloat x = v6;
  remainder.origin.double y = v8;
  remainder.size.CGFloat width = v10;
  remainder.size.CGFloat height = v12;
  v44.origin.CGFloat x = v6;
  v44.origin.double y = v8;
  v44.size.CGFloat width = v10;
  v44.size.CGFloat height = v12;
  CGRectDivide(v44, &slice, &remainder, self->_lastBoundsInsets.bottom, CGRectMaxYEdge);
  CGRect v39 = slice;
  int64_t v20 = self->_presentationState;
  if (v20 == 4)
  {
    double v21 = 0.0;
    if (!v19)
    {
      CGRect slice = v40;
      if (self->_footerView && slice.size.height > 0.0)
      {
        double v24 = self->_footerViewMinimumHeight * 0.25;
        slice.origin.double y = slice.origin.y - v24;
        slice.size.CGFloat height = slice.size.height + v24;
        v45.origin.CGFloat x = v6;
        v45.origin.double y = v8;
        v45.size.CGFloat width = v10;
        v45.size.CGFloat height = v12;
        CGRectGetMaxY(v45);
      }
      CGRect slice = v39;
      goto LABEL_31;
    }
  }
  else
  {
    if (v20 == 7 || (double v21 = 0.0, v20 == 5))
    {
      if ([(NSMutableArray *)self->_passPileViews count]) {
        double v21 = 1.0;
      }
      else {
        double v21 = 0.0;
      }
    }
    CGRect slice = v39;
    if (!v19) {
      goto LABEL_31;
    }
  }
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView && slice.size.height > 0.0 && v21 < 1.0)
  {
    uint64_t v23 = [(PKPassGroupView *)modallyPresentedGroupView layer];
    [v23 anchorPoint];
    [v23 position];
    [v23 bounds];
    memset(&v38, 0, sizeof(v38));
    if (v23) {
      [v23 transform];
    }
    else {
      memset(&v37, 0, sizeof(v37));
    }
    CATransform3DGetAffineTransform(&v38, &v37);
    slice.origin.double y = slice.origin.y - slice.size.height * 0.25;
    slice.size.CGFloat height = slice.size.height + slice.size.height * 0.25;
  }
LABEL_31:
  PKSpringAnimationSolveForInput();
  if (self->_bottomContentSeparatorVisibility != v25)
  {
    self->_bottomContentSeparatorVisibilitdouble y = v25;
    bottomContentSeparatorVisibilityTimer = self->_bottomContentSeparatorVisibilityTimer;
    if (bottomContentSeparatorVisibilityTimer)
    {
      dispatch_source_cancel(bottomContentSeparatorVisibilityTimer);
      CGRect v27 = self->_bottomContentSeparatorVisibilityTimer;
      self->_bottomContentSeparatorVisibilityTimer = 0;
    }
    if (self->_footerAnimationDelay <= 0.0)
    {
      long long v33 = [(PKPassGroupStackView *)self delegate];
      [v33 groupStackView:self wantsBottomContentSeparatorWithVisibility:v3 animated:self->_bottomContentSeparatorVisibility];
    }
    else
    {
      uint64_t v28 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      double v29 = self->_bottomContentSeparatorVisibilityTimer;
      self->_bottomContentSeparatorVisibilityTimer = v28;

      uint64_t v30 = self->_bottomContentSeparatorVisibilityTimer;
      dispatch_time_t v31 = dispatch_time(0, (uint64_t)(self->_footerAnimationDelay * 1000000000.0));
      dispatch_source_set_timer(v30, v31, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      objc_initWeak((id *)&v38, self);
      long long v32 = self->_bottomContentSeparatorVisibilityTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __72__PKPassGroupStackView__updateBottomContentSeparatorVisibilityAnimated___block_invoke;
      handler[3] = &unk_1E59CFB30;
      objc_copyWeak(&v35, (id *)&v38);
      handler[4] = self;
      BOOL v36 = v3;
      dispatch_source_set_event_handler(v32, handler);
      dispatch_resume((dispatch_object_t)self->_bottomContentSeparatorVisibilityTimer);
      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)&v38);
    }
  }
}

- (id)_layoutStateForHeaderContext:(id)a3 inTableWithBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  double v9 = (PKPGSVSectionHeaderContext *)a3;
  CGFloat v10 = (CGFloat *)-[PKPGSVSectionHeaderLayoutState initWithContext:]([PKPGSVSectionHeaderLayoutState alloc], v9);
  paymentHeaderContext = self->_paymentHeaderContext;
  if (paymentHeaderContext == v9)
  {
    double v12 = 0.0;
    uint64_t v13 = 0;
    if ((*((unsigned char *)&self->_layoutState.groups + 16) & 2) != 0) {
      int v14 = 1;
    }
    else {
      int v14 = (*((unsigned __int16 *)&self->_layoutState + 32) >> 2) & 1;
    }
    int v68 = v14;
    goto LABEL_10;
  }
  double v12 = 0.0;
  if (self->_passHeaderContext != v9)
  {
    int v68 = 0;
LABEL_7:
    uint64_t v13 = 0;
LABEL_10:
    double v16 = 0.0;
    goto LABEL_11;
  }
  p_layoutState = &self->_layoutState;
  int v68 = (*((unsigned __int8 *)&self->_layoutState.groups + 16) >> 2) & 1;
  if ((*((_WORD *)&self->_layoutState + 32) & 2) == 0) {
    goto LABEL_7;
  }
  if (paymentHeaderContext) {
    paymentHeaderContext = (PKPGSVSectionHeaderContext *)paymentHeaderContext->_subheaderContexts;
  }
  uint64_t v53 = paymentHeaderContext;

  uint64_t v13 = v53 != 0;
  if ((*((unsigned char *)&self->_layoutState.groups + 16) & 2) != 0)
  {
    separatorIndedouble x = self->_layoutState.groups.separatorIndex;
    if (separatorIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t count = p_layoutState->groups.count;
      separatorIndedouble x = p_layoutState->groups.count - 1;
    }
    else
    {
      unint64_t count = separatorIndex + 1;
    }
    [(PKPassGroupStackView *)self _nativeYForGroupInTableAtIndex:separatorIndex];
    double v16 = v64;
    v13 += count;
    double separationPadding = self->_layoutState.separationPadding;
    if (separationPadding > 0.0) {
      double v12 = separationPadding + self->_layoutState.groupCellHeight;
    }
  }
  else
  {
    double v54 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_paymentHeaderContext);
    __n128 v55 = self->_paymentHeaderContext;
    if (v55)
    {
      double top = v55->_headerMargins.top;
      -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)self->_paymentHeaderContext);
      double v16 = v55->_headerMargins.bottom + top + v57;
    }
    else
    {
      double v16 = 0.0;
    }
    double v12 = v54 - v16;
  }
LABEL_11:
  __int16 v17 = *((_WORD *)&self->_layoutState + 32);
  double rect = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)v9);
  double v66 = v12;
  double v67 = v16;
  double v18 = v12 + v16;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  double v19 = 0.0;
  if (v9)
  {
    double v20 = v9->_headerMargins.top;
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)v9);
    double v19 = v9->_headerMargins.bottom + v20 + v21;
  }
  int v22 = v17 & 6;
  v83.origin.double x = x;
  v83.origin.double y = v18;
  v83.size.double width = width;
  v83.size.double height = rect;
  CGRectDivide(v83, &slice, &remainder, v19, CGRectMinYEdge);
  double v23 = 0.0;
  if (v9) {
    double v23 = v9->_headerMargins.top;
  }
  double v24 = slice.size.height;
  CGFloat v72 = slice.origin.x;
  CGFloat v73 = slice.size.width;
  if (v22 == 6) {
    -[PKPassGroupStackView _transformedYForNativeYInTable:withBounds:index:](self, "_transformedYForNativeYInTable:withBounds:index:", v13, slice.origin.y, x, y, width, height, *(void *)&v12);
  }
  else {
    double v25 = y;
  }
  double v70 = v10;
  if (v10)
  {
    double v26 = v25 - fmin(fmax(y, 0.0), v23);
    v10[4] = v72;
    v10[5] = v26;
    double v69 = v26;
    v10[6] = v73;
    v10[7] = v24;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    CGRect v27 = (void *)*((void *)v10 + 3);
  }
  else
  {
    CGRect v27 = 0;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    double v24 = 0.0;
    CGFloat v72 = 0.0;
    CGFloat v73 = 0.0;
    double v69 = 0.0;
  }
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v76;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v76 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v75 + 1) + 8 * v32);
        if (v33)
        {
          id v34 = *(id *)(v33 + 8);
          id v35 = v34;
          if (v34)
          {
            double v36 = *((double *)v34 + 2);
            [*((id *)v34 + 1) bounds];
            int v37 = 0;
            double v39 = *((double *)v35 + 4) + v36 + v38;
            goto LABEL_28;
          }
        }
        else
        {
          id v35 = 0;
        }
        double v39 = 0.0;
        int v37 = 1;
LABEL_28:
        CGRectDivide(remainder, &slice, &remainder, v39, CGRectMinYEdge);
        CGFloat v40 = slice.origin.x;
        double v41 = slice.origin.y;
        CGSize size = slice.size;
        if (v37)
        {
          CGRect v43 = 0;
LABEL_33:
          -[PKPassGroupStackView _transformedYForNativeYInTable:withBounds:index:](self, "_transformedYForNativeYInTable:withBounds:index:", v13, v41, x, y, width, height, *(void *)&v66);
          double v41 = v45;
          goto LABEL_34;
        }
        id v42 = *((id *)v35 + 1);
        CGRect v43 = v42;
        if (!v42) {
          goto LABEL_33;
        }
        uint64_t v44 = [v42 scrollType];
        if (!v44 || v44 == 1 && y < 0.0) {
          goto LABEL_33;
        }
LABEL_34:
        if (v33)
        {
          *(CGFloat *)(v33 + 16) = v40;
          *(double *)(v33 + 24) = v41;
          *(CGSize *)(v33 + 32) = size;
        }

        ++v32;
      }
      while (v30 != v32);
      uint64_t v46 = [v28 countByEnumeratingWithState:&v75 objects:v81 count:16];
      uint64_t v30 = v46;
    }
    while (v46);
  }

  if (v70) {
    BOOL v47 = (void *)*((void *)v70 + 3);
  }
  else {
    BOOL v47 = 0;
  }
  id v48 = v47;
  double v49 = [v48 firstObject];

  double v50 = 1.0;
  if (y >= 0.0)
  {
    int v51 = v49 ? 1 : v68;
    if (v51 == 1)
    {
      double v52 = v49 ? v49[3] : v18 + rect;
      -[PKPassGroupStackView _transformedYForNativeYInTable:withBounds:index:](self, "_transformedYForNativeYInTable:withBounds:index:", 0, v52, x, y, width, height, *(void *)&v66);
      v84.origin.double x = v72;
      v84.size.double width = v73;
      v84.origin.double y = v69;
      v84.size.double height = v24;
      CGRectGetMaxY(v84);
      double v58 = v9 ? v9->_headerMargins.top : 0.0;
      if (v24 - v58 + -8.0 != 0.0)
      {
        PKSpringAnimationSolveForInput();
        double v50 = fmin(v59, 1.0);
      }
    }
  }
  if (v18 > 0.0)
  {
    -[PKPassGroupStackView _transformedYForNativeYInTable:withBounds:index:](self, "_transformedYForNativeYInTable:withBounds:index:", 0, v67, x, y, width, height);
    if (v24 != 0.0) {
      double v50 = fmin(1.0 - fmin(fmax(v66 + v60 - v69, 0.0), v24) / v24, v50);
    }
  }
  if (v70) {
    v70[2] = v50;
  }

  return v70;
}

void __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  CGFloat v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    id v14 = v5;
    *(unsigned char *)(v7 + 24) = 1;
    int v8 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 2136) context];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v8)
    {
      if (v9 != v10)
      {
        objc_msgSend(*(id *)(v10 + 2136), "pushProvider:withContainerAlpha:context:", v14, a3);
LABEL_15:
        CGFloat v6 = v14;
        goto LABEL_16;
      }
      if (!*(unsigned char *)(a1 + 49))
      {
        char v13 = [*(id *)(v9 + 2136) isCurrentProvider:v14];
        uint64_t v9 = *(void *)(a1 + 32);
        if (v13)
        {
LABEL_12:
          [*(id *)(v9 + 2136) updateExistingViewsForCurrentProviderAnimated:*(unsigned __int8 *)(a1 + 49) withContainerAlpha:a3];
          goto LABEL_15;
        }
      }
      double v12 = *(void **)(v9 + 2136);
      CGFloat v6 = v14;
    }
    else
    {
      CGFloat v6 = v14;
      if (v9 != v10) {
        goto LABEL_16;
      }
      if (!*(unsigned char *)(a1 + 49))
      {
        char v11 = [*(id *)(v9 + 2136) isCurrentProvider:v14];
        uint64_t v9 = *(void *)(a1 + 32);
        if (v11) {
          goto LABEL_12;
        }
        CGFloat v6 = v14;
      }
      double v12 = *(void **)(v9 + 2136);
    }
    [v12 updateCurrentProvider:v6 withContainerAlpha:a3];
    goto LABEL_15;
  }
LABEL_16:
}

void __69__PKPassGroupStackView__updateTopContentSeparatorVisibilityAnimated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  if (a2) {
    BOOL v3 = *(void **)(a2 + 48);
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;
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
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        if (v9) {
          uint64_t v9 = (void *)v9[1];
        }
        uint64_t v10 = v9;
        if (objc_msgSend(v10, "scrollType", (void)v13) == 1)
        {
          uint64_t v11 = *(void *)(a1 + 32);
          double v12 = [v10 layer];
          *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = fmax((*(double (**)(uint64_t, void *))(v11 + 16))(v11, v12), *(double *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 24));
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

uint64_t __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (a1) {
    v1 = *(void **)(a1 + 48);
  }
  else {
    v1 = 0;
  }
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (v6) {
          uint64_t v6 = (void *)v6[1];
        }
        uint64_t v7 = v6;
        uint64_t v8 = objc_msgSend(v7, "scrollType", (void)v10);

        if (v8 == 1)
        {
          uint64_t v3 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v3;
}

- (int64_t)groupViewContentModeForFrontmostPassWhenStacked:(id)a3
{
  uint64_t v4 = (PKPassGroupView *)a3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPassGroupStackView_groupViewContentModeForFrontmostPassWhenStacked___block_invoke;
  aBlock[3] = &unk_1E59D63B8;
  void aBlock[4] = &v34;
  uint64_t v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  [(PKPassGroupStackView *)self bounds];
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  unint64_t v14 = [(PKPassGroupStackView *)self _lastIndex];
  unint64_t v15 = [(PKPassGroupStackView *)self _indexOfGroupView:v4];
  unint64_t count = self->_layoutState.groups.count;
  if (count <= [(PKPassGroupStackView *)self _tablePresentationNumberOfCellsBeforeStacking])v5[2](v5, 5); {
  if (v9 < 0.0 && v15 != 0x7FFFFFFFFFFFFFFFLL)
  }
  {
    [(PKPassGroupStackView *)self _yForGroupInTableAtIndex:v15];
    double v18 = v17;
    v38.origin.double x = v7;
    v38.origin.double y = v9;
    v38.size.double width = v11;
    v38.size.double height = v13;
    if (v18 + 69.0 < CGRectGetMaxY(v38))
    {
      [(PKPassGroupStackView *)self _yForGroupInTableAtIndex:v15 + 1];
      if (v19 - v18 > 69.0)
      {
        double v20 = [(PKPassGroupView *)v4 frontmostPassView];
        if ([v20 frontFaceBodyContentCreated]) {
          uint64_t v21 = 4;
        }
        else {
          uint64_t v21 = 3;
        }
        v5[2](v5, v21);
      }
    }
  }
  int v22 = [(PKPassGroupView *)v4 frontmostPassView];
  double v23 = [v22 pass];

  if ([v23 passType] == 1)
  {
    double v24 = [v23 dynamicLayerConfiguration];

    if (v24) {
      v5[2](v5, 4);
    }
  }
  separatorIndedouble x = self->_layoutState.groups.separatorIndex;
  if (self->_modallyPresentedGroupView == v4)
  {
    BOOL v27 = v15 == 0x7FFFFFFFFFFFFFFFLL || v15 != v14;
    if (self->_layoutState.groups.count == 1 || !v27) {
      goto LABEL_29;
    }
  }
  else if (v15 != 0x7FFFFFFFFFFFFFFFLL && v15 == v14)
  {
LABEL_29:
    v5[2](v5, 5);
    goto LABEL_30;
  }
  if (separatorIndex != 0x7FFFFFFFFFFFFFFFLL && v15 == separatorIndex || self->_reorderedGroupView == v4) {
    goto LABEL_29;
  }
LABEL_30:
  if ((*(unsigned char *)&self->_reorderingFlags & 1) != 0 && v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (separatorIndex != 0x7FFFFFFFFFFFFFFFLL
      && separatorIndex
      && self->_previousIndexOfReorderedGroup == separatorIndex
      && v15 == separatorIndex - 1)
    {
      v5[2](v5, 5);
    }
    unint64_t previousIndexOfReorderedGroup = self->_previousIndexOfReorderedGroup;
    if (v14 && previousIndexOfReorderedGroup == v14 && v15 == v14 - 1)
    {
      v5[2](v5, 5);
      unint64_t previousIndexOfReorderedGroup = self->_previousIndexOfReorderedGroup;
    }
    BOOL v29 = previousIndexOfReorderedGroup != 0;
    unint64_t v30 = previousIndexOfReorderedGroup - 1;
    if (v29 && v15 == v30) {
      v5[2](v5, 3);
    }
  }
  int64_t v31 = v35[3];

  _Block_object_dispose(&v34, 8);
  return v31;
}

void __61__PKPassGroupStackView__createSortedGroupViewIndexesWithMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v4 = [*(id *)(a1 + 32) _indexOfGroupView:v8];
  uint64_t v5 = v8;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [*(id *)(a1 + 40) addObject:v6];
    CGFloat v7 = *(void **)(a1 + 48);
    if (v7) {
      [v7 setObject:v8 forKeyedSubscript:v6];
    }

    uint64_t v5 = v8;
  }
}

- (unint64_t)_indexOfGroupView:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  p_datasource = &self->_datasource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_datasource);
  double v6 = [v4 group];

  unint64_t v7 = [WeakRetained indexOfGroup:v6];
  return v7;
}

uint64_t __72__PKPassGroupStackView_groupViewContentModeForFrontmostPassWhenStacked___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v2 + 24) < a2) {
    *(void *)(v2 + 24) = a2;
  }
  return result;
}

- (unint64_t)_lastIndex
{
  unint64_t count = self->_layoutState.groups.count;
  BOOL v3 = count != 0;
  unint64_t v4 = count - 1;
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

- (unint64_t)_tablePresentationNumberOfCellsBeforeStacking
{
  [(PKPassGroupStackView *)self bounds];
  if (self->_layoutState.groups.separatorIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    double separationPadding = self->_layoutState.separationPadding;
    if (separationPadding > 0.0) {
      double v3 = v3 - separationPadding;
    }
  }
  return vcvtpd_u64_f64(v3 / 55.0);
}

- (void)_enumerateLoadedGroupViews:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void (**)(id, uint64_t, uint64_t, id))a3;
  id v19 = 0;
  id v5 = [(PKPassGroupStackView *)self _createSortedGroupViewIndexesWithMap:&v19];
  double v6 = (void *)MEMORY[0x1A6224460]();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
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
        double v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v19, "objectForKeyedSubscript:", v12, (void)v15);
        if (!v13) {
          __break(1u);
        }
        unint64_t v14 = (void *)v13;
        v4[2](v4, v13, [v12 unsignedIntegerValue], v7);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }
}

void __38__PKPassGroupStackView__arrangeGroups__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (![v6 isLoaned])
  {
LABEL_2:
    unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 2576);
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      objc_msgSend(v4, "insertSubview:aboveSubview:", v6);
    }
    else {
      objc_msgSend(v4, "insertSubview:atIndex:", v6);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    goto LABEL_6;
  }
  id v5 = [v6 superview];
  if (!v5 || v5 == *(void **)(*(void *)(a1 + 32) + 2576))
  {

    goto LABEL_2;
  }

LABEL_6:
}

- (id)_createSortedGroupViewIndexesWithMap:(id *)a3
{
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableDictionary count](self->_groupViewsByGroupID, "count"));
  id v6 = (void *)MEMORY[0x1A6224460]();
  if (a3) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  else {
    id v7 = 0;
  }
  groupViewsByGroupID = self->_groupViewsByGroupID;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__PKPassGroupStackView__createSortedGroupViewIndexesWithMap___block_invoke;
  v15[3] = &unk_1E59D6390;
  v15[4] = self;
  id v9 = v5;
  id v16 = v9;
  id v10 = v7;
  id v17 = v10;
  [(NSMutableDictionary *)groupViewsByGroupID enumerateKeysAndObjectsUsingBlock:v15];
  [v9 sortUsingComparator:&__block_literal_global_158];
  if (a3)
  {
    CGFloat v11 = (void *)[v10 copy];
    id v12 = *a3;
    *a3 = v11;
  }
  uint64_t v13 = (void *)[v9 copy];

  return v13;
}

void __62__PKPassGroupStackView__tileGroupsForState_eager_withContext___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (([*(id *)(a1 + 32) containsIndex:a3] & 1) == 0)
  {
    id v6 = *(void **)(a1 + 40);
    if ((id)v6[301] != v5 && (id)v6[327] != v5)
    {
      [v6 _positionForGroupView:v5 atIndex:a3 forState:*(void *)(a1 + 72)];
      double v8 = v7;
      double v10 = v9;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      CGFloat v11 = *(void **)(a1 + 40);
      if (v11) {
        [v11 _transformForGroupView:v5 atIndex:a3 forState:*(void *)(a1 + 72)];
      }
      id v12 = [v5 layer];
      objc_msgSend(v12, "setPosition:", v8, v10);
      v20[4] = v25;
      v20[5] = v26;
      v20[6] = v27;
      v20[7] = v28;
      v20[0] = v21;
      v20[1] = v22;
      v20[2] = v23;
      v20[3] = v24;
      [v12 setTransform:v20];
    }
    if ([*(id *)(a1 + 48) containsIndex:a3])
    {
      uint64_t v13 = *(void **)(a1 + 56);
      unint64_t v14 = [v5 group];
      long long v15 = [v14 groupID];
      [v13 addObject:v15];

      BOOL v19 = ([*(id *)(a1 + 64) containsIndex:a3] & 1) == 0
         && ((v16 = *(void *)(a1 + 80), BOOL v17 = a3 >= v16, v18 = a3 - v16, !v17) || v18 >= *(void *)(a1 + 88))
         && *(void *)(*(void *)(a1 + 40) + 2408) != (void)v5;
      [v5 setHidden:v19];
    }
  }
}

void __62__PKPassGroupStackView__tileGroupsForState_eager_withContext___block_invoke(uint64_t a1, unint64_t a2)
{
  char v18 = 0;
  unint64_t v4 = [*(id *)(a1 + 32) _loadGroupViewAtIndex:a2 forState:*(void *)(a1 + 64) presentationState:1 cached:&v18];
  id v5 = *(void **)(a1 + 40);
  id v6 = [v4 group];
  double v7 = [v6 groupID];
  [v5 addObject:v7];

  unint64_t v8 = *(void *)(a1 + 72);
  BOOL v10 = a2 >= v8;
  unint64_t v9 = a2 - v8;
  BOOL v10 = !v10 || v9 >= *(void *)(a1 + 80);
  if (!v10 && (!v18 || *(unsigned char *)(a1 + 112)))
  {
    unint64_t v11 = *(void *)(a1 + 88);
    BOOL v10 = a2 >= v11;
    unint64_t v12 = a2 - v11;
    if (v10 && v12 < *(void *)(a1 + 96)) {
      [v4 setPresentationState:*(void *)(a1 + 104) withContext:*(void *)(a1 + 48) animated:0];
    }
  }
  unint64_t v14 = *(void *)(a1 + 88);
  unint64_t v13 = *(void *)(a1 + 96);
  [*(id *)(a1 + 32) _opacityForGroupAtIndex:a2 withGroupView:v4 forState:*(void *)(a1 + 64)];
  BOOL v15 = a2 >= v14 && a2 - v14 < v13 || *(void *)(a1 + 96) + *(void *)(a1 + 88) == a2;
  objc_msgSend(v4, "setAlpha:");
  char v16 = [*(id *)(a1 + 56) containsIndex:a2];
  BOOL v17 = 0;
  if ((v16 & 1) == 0 && !v15) {
    BOOL v17 = v4 != *(void **)(*(void *)(a1 + 32) + 2408);
  }
  [v4 setHidden:v17];
  if (*(void *)(*(void *)(a1 + 32) + 2208) - 1 == a2) {
    [v4 applyContentModesAnimated:0];
  }
}

- (id)_loadGroupViewAtIndex:(unint64_t)a3 forState:(int64_t)a4 presentationState:(int64_t)a5 cached:(BOOL *)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  unint64_t v12 = [WeakRetained groupAtIndex:a3];

  if (v12 && ([v12 groupID], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v14 = (void *)v13;
    BOOL v15 = [(PKPassGroupStackView *)self _groupViewWithGroupID:v13];
    char v16 = v15;
    BOOL v17 = v15 != 0;
    if (v15)
    {
      *a6 = v17;
      char v18 = v15;
    }
    else
    {
      char v18 = [[PKPassGroupView alloc] initWithGroup:v12 delegate:self presentationState:a5];
      [(PKPassGroupView *)v18 addPassGroupViewObserver:self];
      [(NSMutableDictionary *)self->_groupViewsByGroupID setObject:v18 forKeyedSubscript:v14];
      [(PKPassGroupView *)v18 sizeToFit];
      BOOL v19 = [(PKPassGroupView *)v18 pageControl];
      [v19 setCurrentPageIndicatorTintColor:self->_currentPageIndicatorTintColor];
      [v19 setPageIndicatorTintColor:self->_pageIndicatorTintColor];
      [(PKPassGroupView *)v18 setPresentationState:1];

      char v16 = 0;
      *a6 = v17;
      if (!v18)
      {
        __break(1u);
        return result;
      }
    }
    long long v21 = [(PKPassGroupView *)v18 superview];
    passContainerView = self->_passContainerView;

    if (v21 != passContainerView) {
      [(PKPassGroupStackView *)self _addGroupViewAsSubview:v18 forIndex:a3];
    }
    if (self->_modalGroupIndex != a3
      || (p_modallyPresentedGroupView = &self->_modallyPresentedGroupView,
          modallyPresentedGroupView = self->_modallyPresentedGroupView,
          modallyPresentedGroupView == v18))
    {
      int v25 = 0;
    }
    else
    {
      if (modallyPresentedGroupView)
      {
        [(PKPassGroupView *)modallyPresentedGroupView setModallyPresented:0];
        [(PKPassGroupStackView *)self _removePanGestureRecognizerFromGroupView:*p_modallyPresentedGroupView];
      }
      objc_storeStrong((id *)&self->_modallyPresentedGroupView, v18);
      [(PKPassGroupStackView *)self _updatePanGestureRecognizerForGroupView:*p_modallyPresentedGroupView];
      int v25 = 1;
    }
    [(PKPassGroupStackView *)self _positionForGroupView:v18 atIndex:a3 forState:a4];
    double v27 = v26;
    double v29 = v28;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    [(PKPassGroupStackView *)self _transformForGroupView:v18 atIndex:a3 forState:a4];
    if (self->_loanedGroupView != v18)
    {
      -[PKPassGroupView setCenter:](v18, "setCenter:", v27, v29);
      v35[4] = v40;
      v35[5] = v41;
      v35[6] = v42;
      v35[7] = v43;
      v35[0] = v36;
      v35[1] = v37;
      v35[2] = v38;
      v35[3] = v39;
      [(PKPassGroupView *)v18 setTransform3D:v35];
    }
    if (v25)
    {
      [(PKPassGroupView *)self->_modallyPresentedGroupView setModallyPresented:1];
      unint64_t v30 = [(PKPassGroupView *)self->_modallyPresentedGroupView frontmostPassView];
      [v30 setContentMode:5];
    }
    [(PKPassGroupStackView *)self bounds];
    if (self->_loanedGroupView != v18)
    {
      if (v32 < 0.0)
      {
        v45.double x = v27;
        v45.double y = v29;
        if (CGRectContainsPoint(*(CGRect *)&v31, v45)) {
          [(PKPassGroupView *)v18 applyContentModesAnimated:0];
        }
      }
      [(PKPassGroupView *)v18 updatePageControlFrameAnimated:v16 != 0];
    }
    [(PKPassGroupView *)v18 setHidden:0];
  }
  else
  {
    char v18 = 0;
    *a6 = 0;
  }

  return v18;
}

- (id)_groupViewWithGroupID:(id)a3
{
  if (!a3) {
    return 0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_groupViewsByGroupID, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __67__PKPassGroupStackView__layoutContentFromOffset_toOffset_animated___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(id *)(v6 + 2616) != v5 || *(unsigned __int16 *)(v6 + 2272) >= 0x4000u)
  {
    if (*(unsigned char *)(a1 + 96) && *(unsigned char *)(a1 + 97) && *(void *)(a1 + 56) > a3) {
      double v7 = (id *)(a1 + 40);
    }
    else {
      double v7 = (id *)(a1 + 48);
    }
    id v8 = *v7;
    unint64_t v9 = [v5 layer];
    [v9 position];
    double v11 = v10 + *(double *)(a1 + 64) - *(double *)(a1 + 80);
    double v13 = v12 + *(double *)(a1 + 72) - *(double *)(a1 + 88);
    [*(id *)(a1 + 32) _positionForGroupView:v5 atIndex:a3 forState:*(void *)(*(void *)(a1 + 32) + 2080)];
    double v16 = v15;
    double v17 = v14;
    if (v15 != v11 || v14 != v13)
    {
      BOOL v19 = [v8 highFrameRateSpringAnimationForView:v5 withKeyPath:@"position" reason:1];
      double v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v11, v13, v16, v17);
        id v21 = (id)objc_msgSend(v9, "pkui_addAdditiveAnimation:", v20);
      }
    }
    objc_msgSend(v9, "setPosition:", v16, v17);
    long long v22 = 0uLL;
    memset(&v38, 0, sizeof(v38));
    if (v9)
    {
      [v9 transform];
      long long v22 = 0uLL;
    }
    *(_OWORD *)&v37.m41 = v22;
    *(_OWORD *)&v37.m43 = v22;
    *(_OWORD *)&v37.m31 = v22;
    *(_OWORD *)&v37.m33 = v22;
    *(_OWORD *)&v37.m21 = v22;
    *(_OWORD *)&v37.m23 = v22;
    *(_OWORD *)&v37.m11 = v22;
    *(_OWORD *)&v37.m13 = v22;
    long long v23 = *(void **)(a1 + 32);
    if (v23) {
      [v23 _transformForGroupView:v5 atIndex:a3 forState:v23[260]];
    }
    CATransform3D a = v38;
    CATransform3D v35 = v37;
    if (!CATransform3DEqualToTransform(&a, &v35))
    {
      long long v24 = [v8 highFrameRateSpringAnimationForView:v5 withKeyPath:@"transform" reason:1];
      int v25 = v24;
      if (v24)
      {
        CATransform3D a = v38;
        CATransform3D v35 = v37;
        objc_msgSend(v24, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v35);
        id v26 = (id)objc_msgSend(v9, "pkui_addAdditiveAnimation:", v25);
      }
      CATransform3D a = v37;
      [v9 setTransform:&a];
    }
    [v9 opacity];
    double v28 = v27;
    [*(id *)(a1 + 32) _opacityForGroupAtIndex:a3 withGroupView:v5 forState:*(void *)(*(void *)(a1 + 32) + 2080)];
    if (v29 != v28)
    {
      double v30 = v29;
      uint64_t v31 = [*(id *)(a1 + 48) springAnimationForView:v5 withKeyPath:@"opacity"];
      uint64_t v33 = v31;
      if (v31)
      {
        objc_msgSend(v31, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v28, v30);
        id v34 = (id)objc_msgSend(v9, "pkui_addAdditiveAnimation:", v33);
      }
      *(float *)&double v32 = v30;
      [v9 setOpacity:v32];
    }
  }
}

- (CATransform3D)_transformForGroupView:(SEL)a3 atIndex:(id)a4 forState:(unint64_t)a5
{
  [(PKPassGroupStackView *)self _scaleForGroupView:a4 atIndex:a5 forState:a6];
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;

  return CATransform3DMakeScale(retstr, v7, v7, 1.0);
}

- (double)_scaleForGroupView:(id)a3 atIndex:(unint64_t)a4 forState:(int64_t)a5
{
  id v8 = (PKPassGroupView *)a3;
  unint64_t v9 = v8;
  if (a5 == 7)
  {
    if (self->_modallyPresentedGroupView == v8)
    {
      [(PKPassGroupStackView *)self _scaleForModallyPresentedGroupInExternalPresentation];
      goto LABEL_17;
    }
    if (![(PKPassGroupStackView *)self _isGroupAtIndexInModalPile:a4])
    {
      [(PKPassGroupStackView *)self _scaleForStackGroupInExternalPresentation];
      goto LABEL_17;
    }
LABEL_14:
    [(PKPassGroupStackView *)self _scaleForModalPileGroup];
LABEL_17:
    double v12 = v13;
    goto LABEL_18;
  }
  if (a5 != 5 || self->_modallyPresentedGroupView == v8) {
    goto LABEL_10;
  }
  if ([(PKPassGroupStackView *)self _isGroupAtIndexInModalPile:a4]) {
    goto LABEL_14;
  }
  unint64_t v10 = [(NSMutableArray *)self->_passPileViews indexOfObject:v9];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    double v12 = (float)((float)v10 * -0.01) + 1.0;
    goto LABEL_18;
  }
  [(PKPassGroupStackView *)self bounds];
  double v11 = 0.0;
  if (-[PKPassGroupStackView _indexForNativePositionInTable:roundToClosestIndex:](self, "_indexForNativePositionInTable:roundToClosestIndex:", 0, 0.0, CGRectGetMaxY(v15)) <= a4)
  {
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  if ((unint64_t)[(NSMutableArray *)self->_passPileViews count] >= 2) {
    double v11 = (float)((float)(unint64_t)([(NSMutableArray *)self->_passPileViews count] - 1) * 0.01);
  }
  double v12 = 1.0 - v11;
LABEL_18:

  return v12;
}

- (double)_opacityForGroupAtIndex:(unint64_t)a3 withGroupView:(id)a4 forState:(int64_t)a5
{
  id v8 = (PKPassGroupView *)a4;
  unint64_t v9 = v8;
  double v10 = 1.0;
  if (a5 == 5)
  {
    if (self->_modalGroupIndex != a3 && (!v8 || self->_modallyPresentedGroupView != v8))
    {
      unint64_t v15 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexes];
      double v10 = 0.0;
      if (a3 >= v15 && a3 - v15 < v16)
      {
        double v10 = 1.0;
        if ([(PKPassGroupStackView *)self _isGroupAtIndexInModalPile:a3])
        {
          double v17 = [(PKPassGroupView *)v9 group];
          if (v17 && (v18 = v17, unint64_t v19 = [v17 passCount], v18, v19 > 1))
          {
            BOOL v20 = 1;
          }
          else
          {
            id v21 = [(PKPassGroupView *)self->_modallyPresentedGroupView frontmostPassView];
            long long v22 = [v21 pass];

            long long v23 = [(PKPassGroupView *)v9 frontmostPassView];
            long long v24 = [v23 pass];

            if (v22)
            {
              if (v24)
              {
                [v22 style];
                [v24 style];
                PKPassFrontFaceContentSize();
                double v26 = v25;
                PKPassHeightAdjustmentForStyle();
                double v28 = v26 - v27;
                PKPassFrontFaceContentSize();
                BOOL v20 = v29 > v28;
              }
              else
              {
                BOOL v20 = 0;
              }
            }
            else
            {
              BOOL v20 = 1;
            }
          }
          double v10 = (double)!v20;
        }
      }
    }
  }
  else if (a5 == 4)
  {
    uint64_t v11 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexes];
    double v13 = 0.0;
    if (v11 + v12 == a3) {
      double v13 = 1.0;
    }
    if (v11 + v12 > a3) {
      double v13 = 1.0;
    }
    if (v12) {
      double v10 = v13;
    }
    else {
      double v10 = 1.0;
    }
  }

  return v10;
}

- (_NSRange)_rangeOfVisibleIndexes
{
  NSUInteger v2 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexesIgnoringBottomInset:0];
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_4(uint64_t result, void *a2)
{
  if (*(void **)(*(void *)(result + 32) + 2616) != a2) {
    return [a2 updatePageControlFrameAnimated:1];
  }
  return result;
}

uint64_t __90__PKPassGroupStackView__presentGroupStackViewWithAnimation_priorBounds_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateGroupStateForGroupViewInStackPresentation:a2 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updateGroupStateForGroupViewInStackPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(PKPassGroupStackView *)self isTableModalPresentation])
  {
    [v6 setPresentationState:3 animated:v4];
    if (!v4)
    {
      [v6 sizeToFit];
      goto LABEL_6;
    }
  }
  else
  {
    [v6 setPresentationState:1 animated:v4];
    if (!v4) {
      goto LABEL_6;
    }
  }
  [v6 setHidden:0];
LABEL_6:
}

uint64_t __78__PKPassGroupStackView__presentOffscreenAnimated_split_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateGroupView:a2 toPresentationState:*(void *)(*(void *)(a1 + 32) + 2080) withSpringFactory:*(void *)(a1 + 40)];
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)PKPassGroupStackView;
  [(PKPassGroupStackView *)&v22 layoutSubviews];
  [(PKPassGroupStackView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PKPassGroupStackView *)self safeAreaInsets];
  BOOL v15 = v8 == self->_lastBoundsSize.width && v10 == self->_lastBoundsSize.height;
  if (v15
    && (v12 == self->_lastBoundsInsets.left ? (BOOL v16 = v11 == self->_lastBoundsInsets.top) : (BOOL v16 = 0),
        v16 ? (BOOL v17 = v14 == self->_lastBoundsInsets.right) : (BOOL v17 = 0),
        v17 ? (BOOL v18 = v13 == self->_lastBoundsInsets.bottom) : (BOOL v18 = 0),
        v18 && self->_lastTopContentSeparatorHeight == self->_topContentSeparatorHeight))
  {
    int v19 = 0;
  }
  else
  {
    self->_lastBoundsSize.double width = v8;
    self->_lastBoundsSize.double height = v10;
    self->_lastBoundsInsets.double top = v11;
    self->_lastBoundsInsets.left = v12;
    self->_lastBoundsInsets.double bottom = v13;
    self->_lastBoundsInsets.right = v14;
    self->_double lastTopContentSeparatorHeight = self->_topContentSeparatorHeight;
    [(PKPassGroupStackView *)self updateHeaderAndSubheaderViewsIfNecessary];
    int v19 = 1;
  }
  -[PKPassthroughView setFrame:](self->_headerContainerView, "setFrame:", v4, v6, v8, v10);
  -[PKPassthroughView setFrame:](self->_subheaderContainerView, "setFrame:", v4, v6, v8, v10);
  -[PKBackdropView setFrame:](self->_backdropView, "setFrame:", v4, v6 - self->_lastTopContentSeparatorHeight, v8, v10 + self->_lastTopContentSeparatorHeight);
  [(PKPassGroupStackView *)self contentSize];
  -[PKPassthroughView setFrame:](self->_passContainerView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), fmax(v8, v20), fmax(v10, v21));
  [(PKPassGroupStackView *)self layoutHeaderFootersAnimated:0];
  if (v19) {
    [(PKPassGroupStackView *)self _updateContentSizeAndLayout:0];
  }
}

- (void)_updateContentSizeAndLayout:(BOOL)a3 forceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  memset(v8, 0, sizeof(v8));
  memset(v7, 0, sizeof(v7));
  if ([(PKPassGroupStackView *)self _updateContentSizeWithPriorBounds:v8 bounds:v7]|| v4)
  {
    [(PKPassGroupStackView *)self layoutHeaderFootersAnimated:v5];
    [(PKPassGroupStackView *)self _layoutContentFromOffset:v5 toOffset:v8[0] animated:v7[0]];
    [(PKPassGroupStackView *)self tilePassesEagerly:0];
    if (!v5) {
      [(PKPassGroupStackView *)self layoutIfNeeded];
    }
  }
}

- (BOOL)_updateContentSizeWithPriorBounds:(CGRect *)a3 bounds:(CGRect *)a4
{
  [(PKPassGroupStackView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  self->_lastBoundsSize.double width = v11;
  self->_lastBoundsSize.double height = v13;
  [(PKPassGroupStackView *)self contentSize];
  double v16 = v15;
  double v18 = v17;
  [(PKPassGroupStackView *)self _contentSize];
  BOOL v21 = v18 != v20 || v16 != v19;
  if (v21) {
    -[PKPassGroupStackView setContentSize:](self, "setContentSize:");
  }
  if (a3)
  {
    a3->origin.double x = v8;
    a3->origin.double y = v10;
    a3->size.double width = v12;
    a3->size.double height = v14;
  }
  if (a4)
  {
    if (v21)
    {
      [(PKPassGroupStackView *)self bounds];
      CGFloat v8 = v22;
      CGFloat v10 = v23;
      CGFloat v12 = v24;
      CGFloat v14 = v25;
    }
    a4->origin.double x = v8;
    a4->origin.double y = v10;
    a4->size.double width = v12;
    a4->size.double height = v14;
  }
  return v21;
}

- (BOOL)_recomputeLayoutState
{
  p_datasource = &self->_datasource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  BOOL v5 = [(PKPassGroupStackView *)self isTableModalPresentation];
  p_layoutState = &self->_layoutState;
  unint64_t count = self->_layoutState.groups.count;
  separatorIndedouble x = self->_layoutState.groups.separatorIndex;
  unsigned __int8 v8 = *((unsigned char *)&self->_layoutState.groups + 16);
  BOOL v55 = v5;
  int v56 = *((unsigned __int8 *)&self->_layoutState + 24);
  double groupCellHeight = self->_layoutState.groupCellHeight;
  double separationPadding = self->_layoutState.separationPadding;
  __int16 v57 = *((_WORD *)&self->_layoutState + 32);
  unint64_t v11 = [WeakRetained numberOfGroups];
  uint64_t v12 = [WeakRetained indexOfSeparationGroup];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL || v11 == 0) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = v12 + 1;
  }
  BOOL v15 = v14 != 0;
  BOOL v16 = v11 > v14;
  if (v15 && v16) {
    unint64_t v17 = v12;
  }
  else {
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  char v18 = [WeakRetained areGroupsSeparated];
  p_layoutState->groups.unint64_t count = v11;
  self->_layoutState.groups.separatorIndedouble x = v17;
  *((unsigned char *)&self->_layoutState.groups + 16) = v18 | (2 * v15) | (4 * v16);
  if (objc_opt_respondsToSelector())
  {
    id v19 = objc_loadWeakRetained((id *)p_datasource);
    int v20 = [v19 groupStackViewShouldShowHeaderViews:self];

    if (v20)
    {
      int v21 = objc_opt_respondsToSelector();
      unsigned int v22 = *((unsigned __int8 *)&self->_layoutState.groups + 16);
      int v23 = (v22 >> 1) & 1;
      int v24 = v21 ^ 1;
      if ((v22 & 2) == 0 && (v24 & 1) == 0)
      {
        long long v60 = *(_OWORD *)&p_layoutState->groups.count;
        uint64_t v61 = *((void *)&self->_layoutState.groups + 2);
        int v23 = [WeakRetained groupStackView:self requiresHeaderForPassType:1 withState:&v60];
        unsigned int v22 = *((unsigned __int8 *)&self->_layoutState.groups + 16);
      }
      if (v23) {
        int v25 = 2;
      }
      else {
        int v25 = 0;
      }
      unsigned int v26 = *((_WORD *)&self->_layoutState + 32) & 0xFFFD | v25;
      *((_WORD *)&self->_layoutState + 32) = v26;
      if ((v24 | ((v22 & 4) >> 2)))
      {
        int v27 = (v22 >> 2) & 1;
      }
      else
      {
        long long v60 = *(_OWORD *)&p_layoutState->groups.count;
        uint64_t v61 = *((void *)&self->_layoutState.groups + 2);
        int v27 = [WeakRetained groupStackView:self requiresHeaderForPassType:0 withState:&v60];
        unsigned int v26 = *((unsigned __int16 *)&self->_layoutState + 32);
      }
      if (v27) {
        __int16 v29 = 4;
      }
      else {
        __int16 v29 = 0;
      }
      *((_WORD *)&self->_layoutState + 32) = v29 | v26 & 0xFFFB;
      long long v64 = *(_OWORD *)&p_layoutState->groups.count;
      uint64_t v65 = *((void *)&self->_layoutState.groups + 2);
      if (v27) {
        int v30 = 2;
      }
      else {
        int v30 = 0;
      }
      unsigned int v31 = v30 & 0xFFFFFFFE | (v26 >> 1) & 1;
      char v32 = objc_opt_respondsToSelector();
      int v33 = *((unsigned __int16 *)&self->_layoutState + 32);
      if (v32)
      {
        if ((v33 & 2) != 0)
        {
          long long v60 = v64;
          uint64_t v61 = v65;
          char v62 = v31;
          memset(v63, 0, sizeof(v63));
          if ([WeakRetained groupStackView:self willHaveHeaderViewForPassType:1 withState:&v60])int v34 = 8; {
          else
          }
            int v34 = 0;
          int v33 = *((unsigned __int16 *)&self->_layoutState + 32);
        }
        else
        {
          int v34 = 0;
        }
        unsigned int v36 = v33 & 0xFFFFFFF7 | v34;
        *((_WORD *)&self->_layoutState + 32) = v36;
        if ((v33 & 4) != 0)
        {
          long long v60 = v64;
          uint64_t v61 = v65;
          char v62 = v31;
          memset(v63, 0, sizeof(v63));
          if ([WeakRetained groupStackView:self willHaveHeaderViewForPassType:0 withState:&v60])int v37 = 16; {
          else
          }
            int v37 = 0;
          unsigned int v36 = *((unsigned __int16 *)&self->_layoutState + 32);
        }
        else
        {
          int v37 = 0;
        }
        unsigned int v35 = v36 & 0xFFFFFFEF | v37;
      }
      else
      {
        unsigned int v35 = v33 & 0xFFE7;
      }
      *((_WORD *)&self->_layoutState + 32) = v35;
      if (((v35 >> 1) & 1) != (__int16)((_WORD)v35 << 13) >> 15)
      {
        if (objc_opt_respondsToSelector())
        {
          long long v60 = v64;
          uint64_t v61 = v65;
          char v62 = v31;
          memset(v63, 0, sizeof(v63));
          int v38 = [WeakRetained groupStackView:self willHaveSubheaderViewsWithState:&v60];
          LOWORD(v35) = *((_WORD *)&self->_layoutState + 32);
          if ((v35 & 2) != 0)
          {
            BOOL v39 = v38 == 0;
            __int16 v40 = 32;
            goto LABEL_75;
          }
          if ((v35 & 4) != 0)
          {
            BOOL v39 = v38 == 0;
            __int16 v40 = 64;
LABEL_75:
            if (v39) {
              __int16 v40 = 0;
            }
            __int16 v41 = v35 & 0xFF9F | v40;
            goto LABEL_50;
          }
        }
        else
        {
          LOWORD(v35) = *((_WORD *)&self->_layoutState + 32);
        }
      }
      __int16 v41 = v35 & 0xFF9F;
LABEL_50:
      *((_WORD *)&self->_layoutState + 32) = v41;
      char v28 = 1;
      goto LABEL_51;
    }
  }
  char v28 = 0;
  *((_WORD *)&self->_layoutState + 32) &= 0xFF81u;
LABEL_51:
  if (PKExpiredPassesRefreshEnabled())
  {
    uint64_t v43 = [(PKGroupsController *)self->_groupsController expiredSectionPassesCount];
    __int16 v44 = (v28 & (v43 > 0)) != 0 ? 128 : 0;
    *((_WORD *)&self->_layoutState + 32) = v44 | *((_WORD *)&self->_layoutState + 32) & 0xFF7F;
    if ((v28 & (v43 > 0)) == 1)
    {
      uint64_t v42 = v43;
      footerView = self->_footerView;
      if (footerView) {
        [(UIView *)footerView setExpiredSectionCount:v42];
      }
    }
  }
  *((unsigned char *)&self->_layoutState + 24) = *((unsigned char *)&self->_layoutState + 24) & 0xFE | objc_msgSend(WeakRetained, "supportsExternalPresentation", v42);
  [(PKPassGroupStackView *)self _groupCellHeight];
  self->_layoutState.double groupCellHeight = v46;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PKPassGroupStackView__recomputeLayoutState__block_invoke;
  aBlock[3] = &unk_1E59D6250;
  void aBlock[4] = self;
  BOOL v47 = _Block_copy(aBlock);
  double v49 = v47;
  unint64_t v50 = self->_layoutState.groups.separatorIndex;
  if (v50 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_62;
  }
  unint64_t v51 = p_layoutState->groups.count;
  v48.n128_u64[0] = 0;
  if ((*((_WORD *)&self->_layoutState + 32) & 6) == 2 && v51)
  {
    unint64_t v50 = v51 - 1;
LABEL_62:
    (*((void (**)(void *, unint64_t, __n128))v47 + 2))(v47, v50, v48);
    unint64_t v51 = p_layoutState->groups.count;
  }
  *(void *)&self->_layoutState.double separationPadding = v48.n128_u64[0];
  if (count != v51
    || ((*((unsigned char *)&self->_layoutState.groups + 16) ^ v8) & 6) != 0
    || separatorIndex != self->_layoutState.groups.separatorIndex
    || (__int16 v52 = *((_WORD *)&self->_layoutState + 32), ((v52 ^ v57) & 0x7E) != 0)
    || ((*((unsigned __int8 *)&self->_layoutState + 24) ^ v56) & 1) != 0)
  {
    LOBYTE(v53) = 1;
  }
  else
  {
    LOBYTE(v53) = 1;
    if (groupCellHeight == self->_layoutState.groupCellHeight && separationPadding == v48.n128_f64[0])
    {
      if ((v52 & 6) == 4) {
        int v53 = v55 ^ [(PKPassGroupStackView *)self isTableModalPresentation];
      }
      else {
        LOBYTE(v53) = 0;
      }
    }
  }

  return v53;
}

- (CGSize)_contentSize
{
  BOOL v3 = [(PKPassGroupStackView *)self isTableModalPresentation];
  [(PKPassGroupStackView *)self _groupCellHeight];
  double v5 = self->_layoutState.separationPadding + v4 * (double)self->_layoutState.groups.count;
  if (v3)
  {
    p_lastBoundsSize = &self->_lastBoundsSize;
    double v7 = fmax(self->_lastBoundsSize.height, v5);
  }
  else
  {
    double v8 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_paymentHeaderContext);
    double v9 = v5 + v8 + -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_passHeaderContext);
    if ((*((unsigned char *)&self->_layoutState.groups + 16) & 4) != 0)
    {
      [(PKPassGroupStackView *)self _lastBarcodePassGroupCellHeight];
      PKFloatRoundToPixel();
      double v9 = v9 + v12;
    }
    else if ((*((_WORD *)&self->_layoutState + 32) & 6) == 2)
    {
      PKGetMaxPassWidth();
      PKFloatRoundToPixel();
      double v11 = fmax(v10, 0.0);
      if (v11 <= 0.0) {
        double v11 = 8.0;
      }
      double v9 = v9 + v11;
    }
    p_lastBoundsSize = &self->_lastBoundsSize;
    double v7 = fmax(self->_lastBoundsSize.height, v9 + self->_lastBoundsInsets.bottom);
    if (self->_footerView) {
      double v7 = v7 + self->_footerViewMinimumHeight;
    }
  }
  double width = p_lastBoundsSize->width;
  result.double height = v7;
  result.double width = width;
  return result;
}

- (double)_groupCellHeight
{
  p_layoutState = &self->_layoutState;
  int v3 = *((unsigned __int8 *)&self->_layoutState.groups + 16);
  if ((~v3 & 3) == 0
    || self->_layoutState.groups.separatorIndex != 0x7FFFFFFFFFFFFFFFLL
    || ((*((unsigned __int16 *)&self->_layoutState + 32) >> 1) & 1)
     + ((*((unsigned __int16 *)&self->_layoutState + 32) >> 2) & 1u) > 1)
  {
    return 55.0;
  }
  if (v3)
  {
    double v5 = 0.0;
    if ((v3 & 2) != 0)
    {
      PKPassFrontFaceContentSize();
      double v5 = v10;
    }
  }
  else
  {
    double v5 = 0.0;
    if (p_layoutState->groups.count)
    {
      uint64_t v6 = 0;
      while (1)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
        double v8 = [WeakRetained groupAtIndex:v6];

        if ([v8 passCount]) {
          break;
        }

        if (++v6 >= p_layoutState->groups.count) {
          goto LABEL_16;
        }
      }
      double v11 = [v8 passAtIndex:0];
      double v5 = 0.0;
      if ([v11 style] == 6)
      {
        PKPassFrontFaceContentSize();
        double v5 = v12;
      }
    }
  }
LABEL_16:
  [(PKPassGroupStackView *)self bounds];
  double v14 = v13;
  paymentHeaderContext = self->_paymentHeaderContext;
  double v16 = 0.0;
  double v17 = 0.0;
  if (paymentHeaderContext)
  {
    double top = paymentHeaderContext->_headerMargins.top;
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)self->_paymentHeaderContext);
    double v17 = paymentHeaderContext->_headerMargins.bottom + top + v19;
  }
  passHeaderContext = self->_passHeaderContext;
  if (passHeaderContext)
  {
    double v21 = passHeaderContext->_headerMargins.top;
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)passHeaderContext);
    double v16 = passHeaderContext->_headerMargins.bottom + v21 + v22;
  }
  if (p_layoutState->groups.count) {
    double v23 = floor((v14 - (v17 + v16)) / (double)p_layoutState->groups.count);
  }
  else {
    double v23 = 0.0;
  }
  if (v5 <= 0.0) {
    double v24 = 1.79769313e308;
  }
  else {
    PKFloatRoundToPixel();
  }
  return fmax(fmin(v23, v24), 55.0);
}

- (double)_lastBarcodePassGroupCellHeight
{
  PKRunningInRemoteContext();

  PKFloatRoundToPixel();
  return result;
}

double __45__PKPassGroupStackView__recomputeLayoutState__block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) _groupViewAtIndexWhileEnsuringVisible:a2 withContentMode:4];
  double v4 = [v3 frontmostPassView];
  [v4 sizeOfFrontFace];
  double v6 = v5;
  [v3 offsetForFrontmostPassWhileStacked];
  double v8 = v6 + v7 - *(double *)(*(void *)(a1 + 32) + 2240);

  return v8;
}

- (id)_groupViewAtIndexWhileEnsuringVisible:(unint64_t)a3 withContentMode:(int64_t)a4
{
  id v7 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:");
  double v8 = v7;
  if (!v7 || [v7 isHidden])
  {
    char v13 = 0;
    uint64_t v9 = [(PKPassGroupStackView *)self _loadGroupViewAtIndex:a3 forState:self->_presentationState presentationState:1 cached:&v13];

    double v8 = (void *)v9;
  }
  double v10 = [v8 frontmostPassView];
  double v11 = v10;
  if (v10 && [v10 contentMode] < a4) {
    [v11 setContentMode:a4];
  }

  return v8;
}

- (id)_groupViewAtIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  double v6 = [WeakRetained groupAtIndex:a3];
  id v7 = [(PKPassGroupStackView *)self _groupViewWithGroup:v6];

  return v7;
}

- (id)_groupViewWithGroup:(id)a3
{
  double v4 = [a3 groupID];
  id v5 = [(PKPassGroupStackView *)self _groupViewWithGroupID:v4];

  return v5;
}

- (void)tilePassesEagerly:(BOOL)a3
{
  if (self->_presentationState == 4)
  {
    [(PKPassGroupStackView *)self _tileGroupsForState:4 eager:a3 withContext:0];
    [(PKPassGroupStackView *)self setNeedsLayout];
  }
}

- (unint64_t)groupViewPassesSuppressedContent:(id)a3
{
  double v4 = (PKPassGroupView *)a3;
  id v5 = [(PKPassGroupStackView *)self delegate];
  unint64_t v6 = [v5 suppressedContent];

  if (self->_loanedGroupView == v4 && [(PKPassGroupView *)v4 isLoaned])
  {
    id v7 = [(PKPassGroupView *)self->_loanedGroupView frontmostPassView];
    double v8 = [v7 pass];
    uint64_t v9 = [v8 secureElementPass];

    if ([v9 hasAssociatedPeerPaymentAccount]) {
      v6 ^= 0x400uLL;
    }
  }
  return v6;
}

- (void)updateHeaderAndSubheaderViewsIfNecessary
{
  [(PKPassGroupStackView *)self _recomputeLayoutState];
  if ([(PKPassGroupStackView *)self _updateHeaderFooterStateAnimated:1 layout:0])
  {
    int64_t presentationState = self->_presentationState;
    [(PKPassGroupStackView *)self setPresentationState:presentationState animated:1];
  }
  else
  {
    [(PKPassGroupStackView *)self _updateContentSizeAndLayout:1 forceUpdate:1];
  }
}

- (BOOL)_updateHeaderFooterStateAnimated:(BOOL)a3 layout:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_layoutState = &self->_layoutState;
  long long v42 = *(_OWORD *)&self->_layoutState.groups.count;
  uint64_t v43 = *((void *)&self->_layoutState.groups + 2);
  int v8 = (*((unsigned __int8 *)&self->_layoutState + 64) >> 1) & 3;
  [(PKPassGroupStackView *)self frame];
  double v10 = v9;
  unsigned int v11 = *((unsigned __int16 *)p_layoutState + 32);
  if ((v11 & 2) != 0)
  {
    paymentHeaderContext = self->_paymentHeaderContext;
    long long v38 = v42;
    uint64_t v39 = v43;
    char v40 = v8;
    memset(v41, 0, sizeof(v41));
    double v12 = +[PKPGSVSectionHeaderContext createUpdatedHeaderContextForGroupStackView:passType:withState:currentContext:allowHeader:allowSubheaders:containerWidth:](v9, (uint64_t)PKPGSVSectionHeaderContext, self, 1, (uint64_t)&v38, paymentHeaderContext, (v11 >> 3) & 1, (v11 >> 5) & 1);
  }
  else
  {
    double v12 = 0;
  }
  BOOL v14 = [(PKPassGroupStackView *)self _updateHeaderContext:&self->_paymentHeaderContext toContext:v12 animated:v5];

  unsigned int v15 = *((unsigned __int16 *)p_layoutState + 32);
  if ((v15 & 4) != 0)
  {
    passHeaderContext = self->_passHeaderContext;
    long long v38 = v42;
    uint64_t v39 = v43;
    char v40 = v8;
    memset(v41, 0, sizeof(v41));
    double v16 = +[PKPGSVSectionHeaderContext createUpdatedHeaderContextForGroupStackView:passType:withState:currentContext:allowHeader:allowSubheaders:containerWidth:](v10, (uint64_t)PKPGSVSectionHeaderContext, self, 0, (uint64_t)&v38, passHeaderContext, (v15 >> 4) & 1, (v15 >> 6) & 1);
  }
  else
  {
    double v16 = 0;
  }
  BOOL v18 = [(PKPassGroupStackView *)self _updateHeaderContext:&self->_passHeaderContext toContext:v16 animated:v5];
  p_footerView = (id *)&self->_footerView;
  int v20 = self->_footerView;
  id v21 = v20;
  if ((*((_WORD *)p_layoutState + 32) & 0x80) == 0)
  {
    if (!v20) {
      goto LABEL_16;
    }
    id v22 = *p_footerView;
    id *p_footerView = 0;

    double v23 = [v21 layer];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __64__PKPassGroupStackView__updateHeaderFooterStateAnimated_layout___block_invoke;
    v36[3] = &unk_1E59CB6D8;
    id v21 = v21;
    id v37 = v21;
    objc_msgSend(v23, "pkui_animateToOpacity:withCompletion:", v36, 0.0);

    double v24 = [(UIImageView *)self->_footerPocketBackgroundShadow layer];
    objc_msgSend(v24, "pkui_animateToOpacity:withCompletion:", 0, 0.0);

    int v25 = [(UIImageView *)self->_footerPocketForegroundShadow layer];
    objc_msgSend(v25, "pkui_animateToOpacity:withCompletion:", 0, 0.0);

    unsigned int v26 = v37;
    goto LABEL_15;
  }
  if (v20)
  {
LABEL_11:
    double v27 = 0.0;
    if ((*((unsigned char *)&p_layoutState->groups + 16) & 4) != 0 && p_layoutState->groups.count > 1) {
      double v27 = 1.0;
    }
    self->_footerPocketForegroundShadowAlphCATransform3D a = v27;
    char v28 = [(UIImageView *)self->_footerPocketBackgroundShadow layer];
    objc_msgSend(v28, "pkui_animateToOpacity:withCompletion:", 0, 1.0);

    unsigned int v26 = [(UIImageView *)self->_footerPocketForegroundShadow layer];
    objc_msgSend(v26, "pkui_animateToOpacity:withCompletion:", 0, self->_footerPocketForegroundShadowAlpha);
LABEL_15:

    goto LABEL_16;
  }
  BOOL v35 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  char v31 = objc_opt_respondsToSelector();

  if (v31)
  {
    id v32 = objc_loadWeakRetained((id *)&self->_datasource);
    id v21 = [v32 footerForGroupStackView:self];
    objc_storeStrong((id *)&self->_footerView, v21);

    [v21 frame];
    self->_double footerViewMinimumHeight = v33;
    int v34 = [*p_footerView layer];
    objc_msgSend(v34, "setAnchorPoint:", 0.5, 0.0);

    BOOL v4 = v35;
    if (v21) {
      goto LABEL_11;
    }
  }
  else
  {
    id v21 = 0;
    BOOL v4 = v35;
  }
LABEL_16:
  if (v4) {
    [(PKPassGroupStackView *)self layoutHeaderFootersAnimated:v5];
  }

  return v18 || v14;
}

- (BOOL)_updateHeaderContext:(id *)a3 toContext:(id)a4 animated:(BOOL)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  int v8 = a4;
  if (a3)
  {
    double v9 = *a3;
    if (PKEqualObjects())
    {
      BOOL v10 = 0;
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__PKPassGroupStackView__updateHeaderContext_toContext_animated___block_invoke;
      aBlock[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
      BOOL v50 = a5;
      unsigned int v11 = (void (**)(void *, id))_Block_copy(aBlock);
      if (v9) {
        double v12 = (void *)v9[5];
      }
      else {
        double v12 = 0;
      }
      id v13 = v12;
      if (v8) {
        BOOL v14 = (void *)v8[5];
      }
      else {
        BOOL v14 = 0;
      }
      id v15 = v14;
      BOOL v16 = v13 != v15;

      if (v13 && v13 != v15) {
        v11[2](v11, v13);
      }
      if (v9) {
        double v17 = (void *)v9[6];
      }
      else {
        double v17 = 0;
      }
      id v18 = v17;
      unsigned int v36 = objc_msgSend(v18, "pk_createArrayByApplyingBlock:", &__block_literal_global_125_0);

      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      char v40 = v8;
      id v38 = a4;
      id v37 = v13;
      if (v8) {
        int v20 = (void *)v8[6];
      }
      else {
        int v20 = 0;
      }
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v46 != v24) {
              objc_enumerationMutation(v21);
            }
            unsigned int v26 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            if (v26) {
              unsigned int v26 = (void *)v26[1];
            }
            double v27 = v26;
            objc_msgSend(v19, "addObject:", v27, v36, v37);
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v52 count:16];
        }
        while (v23);
      }
      uint64_t v39 = v9;

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v28 = v36;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v42 != v31) {
              objc_enumerationMutation(v28);
            }
            double v33 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            uint64_t v34 = objc_msgSend(v19, "indexOfObjectIdenticalTo:", v33, v36);
            if (v34 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v11[2](v11, v33);
              BOOL v16 = 1;
            }
            else
            {
              [v19 removeObjectAtIndex:v34];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v51 count:16];
        }
        while (v30);
      }

      BOOL v10 = [v19 count] != 0 || v16;
      objc_storeStrong(a3, v38);

      double v9 = v39;
      int v8 = v40;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (PKPassGroupStackViewDatasource)datasource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);

  return (PKPassGroupStackViewDatasource *)WeakRetained;
}

- (void)setPresentationState:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    [(PKPassGroupStackView *)self _updatePausedState];
  }
}

- (void)setFooterSuppressed:(BOOL)a3 withContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (((!self->_footerSuppressed ^ v4) & 1) == 0)
  {
    self->_footerSuppressed = v4;
    id v9 = v6;
    if (v4)
    {
      int v8 = [MEMORY[0x1E4FB1438] sharedApplication];
      objc_msgSend(v8, "pkui_resetSharedRootAuthenticationContext");
    }
    [(PKPassGroupStackView *)self _updatePassFooterViewIfNecessaryWithContext:v9 becomeVisibleDelay:0.0];
    id v7 = v9;
  }
}

- (void)setExternalFooterSuppressed:(BOOL)a3
{
  self->_externalFooterSuppressed = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalVC);
  [WeakRetained setFooterSuppressed:self->_externalFooterSuppressed];
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (unint64_t)modalGroupIndex
{
  return self->_modalGroupIndex;
}

- (void)_presentGroupStackViewWithAnimation:(BOOL)a3 priorBounds:(CGRect)a4 completionHandler:(id)a5
{
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v7 = a3;
  id v9 = (void (**)(void))a5;
  [(PKPassGroupView *)self->_modallyPresentedGroupView presentDiff:0 completion:0];
  if (v7)
  {
    if ((*((_WORD *)&self->_layoutState + 32) & 0x4000) != 0) {
      id v10 = [(PKPassGroupStackView *)self _dismissModalGroupViewFromExternalToState:4];
    }
    passPileViews = self->_passPileViews;
    self->_passPileViews = 0;

    [MEMORY[0x1E4F39CF8] begin];
    double v12 = (void *)MEMORY[0x1E4F39CF8];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __90__PKPassGroupStackView__presentGroupStackViewWithAnimation_priorBounds_completionHandler___block_invoke;
    v26[3] = &unk_1E59CAA98;
    double v27 = v9;
    [v12 setCompletionBlock:v26];
  }
  else
  {
    id v13 = self->_passPileViews;
    self->_passPileViews = 0;
  }
  self->_int64_t presentationState = 4;
  [(PKPassGroupStackView *)self _arrangeGroups];
  if ([(PKPassGroupStackView *)self isTableModalPresentation])
  {
    id v14 = [(PKPassGroupStackView *)self _groupViewAtIndex:0];
    if ([v14 presentationState] != 3)
    {
      [v14 setPresentationState:3 animated:v7];
      [v14 sizeToFit];
    }
  }
  else
  {
    id v14 = 0;
  }
  [(PKPassGroupStackView *)self _setModalGroupView:v14];
  if ([(PKPassGroupStackView *)self isTableModalPresentation])
  {
    id v15 = [v14 frontmostPassView];
    BOOL v16 = [v15 pass];
    BOOL v17 = [(PKPassGroupStackView *)self _shouldRampForPass:v16];
  }
  else
  {
    BOOL v17 = 0;
  }
  uint64_t v18 = [(PKPassGroupStackView *)self _rampBacklightIfNecessary:v17];
  if (v7)
  {
    id v19 = (void *)MEMORY[0x1A6224460](v18);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __90__PKPassGroupStackView__presentGroupStackViewWithAnimation_priorBounds_completionHandler___block_invoke_2;
    v24[3] = &unk_1E59D6128;
    v24[4] = self;
    BOOL v25 = v7;
    [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v24];
    [(PKPassGroupStackView *)self bounds];
    -[PKPassGroupStackView _layoutContentFromOffset:toOffset:animated:](self, "_layoutContentFromOffset:toOffset:animated:", 1, x, y, v20, v21);
    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    [(PKPassGroupStackView *)self bounds];
    -[PKPassGroupStackView _layoutContentFromOffset:toOffset:animated:](self, "_layoutContentFromOffset:toOffset:animated:", 0, x, y, v22, v23);
  }
  [(PKPassGroupStackView *)self _setScrollEnabled:[(PKPassGroupStackView *)self _shouldTablePresentationScroll]];
  if (v9 && !v7) {
    v9[2](v9);
  }
}

- (void)setModalGroupIndex:(unint64_t)a3
{
  if (self->_modalGroupIndex != a3)
  {
    self->_modalGroupIndedouble x = a3;
    if (self->_layoutState.pilingMode == 1) {
      self->_layoutState.pilingMode = 0;
    }
  }
  id v9 = self->_modallyPresentedGroupView;
  BOOL v5 = [(PKPassGroupStackView *)self _groupViewAtIndex:a3];
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  self->_modallyPresentedGroupView = v5;

  BOOL v7 = v9;
  int v8 = self->_modallyPresentedGroupView;
  if (v9 != v8)
  {
    if (v9)
    {
      [(PKPassGroupView *)v9 setModallyPresented:0];
      [(PKPassGroupStackView *)self _removePanGestureRecognizerFromGroupView:v9];
      BOOL v7 = v9;
      int v8 = self->_modallyPresentedGroupView;
    }
    if (v8)
    {
      [(PKPassGroupView *)v8 setModallyPresented:1];
      [(PKPassGroupStackView *)self _updatePanGestureRecognizerForGroupView:self->_modallyPresentedGroupView];
      BOOL v7 = v9;
    }
  }
}

- (void)_setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPassGroupStackView *)self isScrollEnabled] != a3)
  {
    if (v3)
    {
      [(PKPassGroupStackView *)self setScrollEnabled:1];
    }
    else
    {
      [(PKPassGroupStackView *)self _disableScrollingAndNormalizeContentOffset];
    }
  }
}

- (void)_tileGroupsForState:(int64_t)a3 eager:(BOOL)a4 withContext:(id)a5
{
  BOOL v5 = a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v35 = a5;
  context = (void *)MEMORY[0x1A6224460]();
  uint64_t v7 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexes];
  uint64_t v9 = v8;
  uint64_t v10 = [(PKPassGroupStackView *)self _rangeOfEagerLoadedIndexes];
  uint64_t v36 = v11;
  uint64_t v37 = v10;
  if (v5) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v9;
  }
  if (v5) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = v7;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  objc_msgSend(v14, "addIndexesInRange:", v13, v12);
  uint64_t v39 = v7;
  if (v7 + v9 < self->_layoutState.groups.count) {
    objc_msgSend(v14, "addIndex:");
  }
  id v15 = [(PKPassGroupStackView *)self _createStackedIndices];
  [v14 addIndexes:v15];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  BOOL v17 = [(PKPassGroupStackView *)self isTableModalPresentation];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __62__PKPassGroupStackView__tileGroupsForState_eager_withContext___block_invoke;
  v54[3] = &unk_1E59D6010;
  if (v17) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 1;
  }
  v54[4] = self;
  int64_t v58 = a3;
  id v19 = v16;
  id v55 = v19;
  uint64_t v59 = v13;
  uint64_t v60 = v12;
  BOOL v64 = v5;
  uint64_t v61 = v39;
  uint64_t v62 = v9;
  uint64_t v63 = v18;
  id v20 = v35;
  id v56 = v20;
  id v21 = v15;
  id v57 = v21;
  [v14 enumerateIndexesUsingBlock:v54];
  id v22 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  objc_msgSend(v22, "addIndex:", -[PKPassGroupStackView _lastIndex](self, "_lastIndex"));
  if (self->_layoutState.groups.separatorIndex != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v22, "addIndex:");
  }
  objc_msgSend(v22, "addIndexesInRange:", v37, v36);
  if (self->_modalGroupIndex != 0x7FFFFFFFFFFFFFFFLL && ((unint64_t)(a3 - 1) < 3 || (a3 | 2) == 7)) {
    objc_msgSend(v22, "addIndex:");
  }
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __62__PKPassGroupStackView__tileGroupsForState_eager_withContext___block_invoke_2;
  v45[3] = &unk_1E59D6038;
  id v23 = v14;
  id v46 = v23;
  long long v47 = self;
  int64_t v51 = a3;
  id v24 = v22;
  id v48 = v24;
  id v25 = v19;
  id v49 = v25;
  id v26 = v21;
  id v50 = v26;
  uint64_t v52 = v39;
  uint64_t v53 = v9;
  [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v45];
  double v27 = [(NSMutableDictionary *)self->_groupViewsByGroupID allKeys];
  id v28 = (void *)[v27 mutableCopy];

  uint64_t v29 = [v25 allObjects];
  [v28 removeObjectsInArray:v29];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v30 = v28;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v41 objects:v65 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(v30);
        }
        [(PKPassGroupStackView *)self _removeGroupViewAsSubviewWithGroupID:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v41 objects:v65 count:16];
    }
    while (v32);
  }

  [(PKPassGroupStackView *)self _layoutFooterAnimated:0 withAnimationDelay:0.0];
}

- (_NSRange)_rangeOfEagerLoadedIndexes
{
  unint64_t v3 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexes];
  NSUInteger v5 = v4 + 12;
  if (v3 >= 7) {
    NSUInteger v6 = v3 - 6;
  }
  else {
    NSUInteger v6 = 0;
  }
  unint64_t count = self->_layoutState.groups.count;
  NSUInteger v8 = v6 + v5 - count;
  if (v6 + v5 >= count)
  {
    NSUInteger v9 = count - v5;
    if (v6 < v8) {
      NSUInteger v9 = 0;
    }
    BOOL v10 = v8 >= v6;
    NSUInteger v11 = v8 - v6;
    if (!v10) {
      NSUInteger v11 = 0;
    }
    v5 -= v11;
    NSUInteger v6 = v9;
  }
  result.length = v5;
  result.location = v6;
  return result;
}

- (id)_createStackedIndices
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  unint64_t v4 = [(PKPassGroupStackView *)self _startVisibleIndex];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  NSUInteger v6 = [WeakRetained groupAtIndex:v4];

  if (!v6
    || ([(PKPassGroupStackView *)self _separatorGroup],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6 == v7))
  {
    unint64_t v11 = 0;
    unint64_t v10 = 0;
    if (!v4) {
      goto LABEL_16;
    }
  }
  else
  {
    NSUInteger v8 = objc_msgSend(v6, "passAtIndex:", objc_msgSend(v6, "frontmostPassIndex"));
    uint64_t v9 = [v8 style];

    unint64_t v10 = [(PKPassGroupStackView *)self _edgeStylesObscuredByTopMiddleOfPassStyle:v9];
    unint64_t v11 = [(PKPassGroupStackView *)self _edgeStylesObscuredByTopCornersOfPassStyle:v9];
    if (!v4) {
      goto LABEL_16;
    }
  }
  while (1)
  {
    --v4;
    id v12 = objc_loadWeakRetained((id *)&self->_datasource);
    uint64_t v13 = [v12 groupAtIndex:v4];

    id v14 = objc_msgSend(v13, "passAtIndex:", objc_msgSend(v13, "frontmostPassIndex"));
    uint64_t v15 = [v14 style];

    unint64_t v16 = [(PKPassGroupStackView *)self _edgeStylesObscuredByTopMiddleOfPassStyle:v15] | v10;
    unint64_t v17 = [(PKPassGroupStackView *)self _edgeStylesObscuredByTopCornersOfPassStyle:v15] | v11;
    if (v10 != v16 || v11 != v17)
    {
      [v3 addIndex:v4];
      unint64_t v11 = v17;
      unint64_t v10 = v16;
    }
    if (!v4 || v11 == 94 && v10 == 94) {
      break;
    }
  }
LABEL_16:
  id v19 = (void *)[v3 copy];

  return v19;
}

- (id)_separatorGroup
{
  p_layoutState = &self->_layoutState;
  separatorIndedouble x = self->_layoutState.groups.separatorIndex;
  if (separatorIndex == 0x7FFFFFFFFFFFFFFFLL
    || (p_layoutState->groups.count ? (BOOL v4 = separatorIndex >= p_layoutState->groups.count - 1) : (BOOL v4 = 1), v4))
  {
    NSUInteger v6 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
    NSUInteger v6 = [WeakRetained groupAtIndex:p_layoutState->groups.separatorIndex];
  }

  return v6;
}

- (unint64_t)_edgeStylesObscuredByTopMiddleOfPassStyle:(int64_t)a3
{
  uint64_t v3 = PKPassFrontFaceEdgeStyle();
  if ((unint64_t)(v3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1A0444398[v3 - 1];
  }
}

- (unint64_t)_edgeStylesObscuredByTopCornersOfPassStyle:(int64_t)a3
{
  uint64_t v3 = PKPassFrontFaceEdgeStyle();
  if ((unint64_t)(v3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1A04443C8[v3 - 1];
  }
}

- (void)setPresentationState:(int64_t)a3 withContext:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v65 = a4;
  id v66 = a6;
  context = (void *)MEMORY[0x1A6224460]();
  if (a3 == 7)
  {
    modalGroupIndedouble x = self->_modalGroupIndex;
    if (modalGroupIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      char v64 = 0;
      __int16 v10 = *((_WORD *)&self->_layoutState + 32) & 0xFFFE;
      *((_WORD *)&self->_layoutState + 32) = v10;
      a3 = 4;
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  if (a3 == 5)
  {
    modalGroupIndedouble x = self->_modalGroupIndex;
LABEL_8:
    if (modalGroupIndex || ![(PKPassGroupStackView *)self isTableModalPresentation])
    {
      __int16 v10 = *((_WORD *)&self->_layoutState + 32) & 0xFFFE;
      *((_WORD *)&self->_layoutState + 32) = v10;
    }
    else
    {
      __int16 v10 = *((_WORD *)&self->_layoutState + 32);
      if ((v10 & 1) == 0)
      {
        [(PKPassGroupStackView *)self setModalGroupIndex:0x7FFFFFFFFFFFFFFFLL];
        char v64 = 0;
        __int16 v10 = *((_WORD *)&self->_layoutState + 32);
        a3 = 4;
        goto LABEL_16;
      }
    }
LABEL_15:
    v10 &= ~0x4000u;
    *((_WORD *)&self->_layoutState + 32) = v10;
    char v64 = 1;
    if ((a3 | 2) == 7) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (a3 != 3)
  {
    __int16 v10 = *((_WORD *)&self->_layoutState + 32) & 0xFFFE;
    *((_WORD *)&self->_layoutState + 32) = v10;
    if (a3 == 4)
    {
      char v64 = 0;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  __int16 v10 = *((_WORD *)&self->_layoutState + 32) & 0xBFFF;
  *((_WORD *)&self->_layoutState + 32) = v10;
  char v64 = 1;
LABEL_16:
  *((_WORD *)&self->_layoutState + 32) = v10 & 0x7FFF;
LABEL_17:
  BOOL v12 = [(PKPassGroupStackView *)self isPresentingPassViewFront];
  __int16 v13 = *((_WORD *)&self->_layoutState + 32);
  if (!v12)
  {
    v13 &= ~0x200u;
    *((_WORD *)&self->_layoutState + 32) = v13;
  }
  *((_WORD *)&self->_layoutState + 32) = v13 | 0x1000;
  self->_footerAnimationDeladouble y = 0.0;
  char v14 = v64 ^ 1;
  if ((*(unsigned char *)&self->_reorderingFlags & 1) == 0) {
    char v14 = 1;
  }
  if ((v14 & 1) == 0) {
    [(PKPassGroupStackView *)self groupViewPanDidEnd:self->_reorderedGroupView];
  }
  transitionCanceller = (void (**)(void))self->_transitionCanceller;
  if (transitionCanceller)
  {
    if (self->_nextState == a3)
    {
      transitionCanceller[2]();
      id v16 = self->_transitionCanceller;
      self->_transitionCanceller = 0;

      goto LABEL_31;
    }
    [(PKPassGroupStackView *)self _cancelTransition];
  }
  if (self->_hasSuspendedTransition)
  {
    if (self->_suspendedNextState == a3) {
      [(PKPassGroupStackView *)self _resumeSuspendedTransition];
    }
    else {
      [(PKPassGroupStackView *)self _cancelSuspendedTransition];
    }
  }
LABEL_31:
  ++self->_externalPresentationTag;
  int64_t presentationState = self->_presentationState;
  self->_nextState = a3;
  self->_priorState = self->_presentationState;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x2020000000;
  char v81 = 0;
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke;
  v79[3] = &unk_1E59CB4B0;
  v79[4] = v80;
  uint64_t v18 = (void *)[v79 copy];
  id v19 = self->_transitionCanceller;
  self->_transitionCanceller = v18;

  if (a3 == 7 || (*((_WORD *)&self->_layoutState + 32) & 0xC000) != 0)
  {
    int v20 = 1;
    BOOL v21 = 1;
  }
  else
  {
    int v20 = 0;
    BOOL v21 = a3 == 5 && presentationState != 5;
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v24 = v23;
  if (v21)
  {
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_2;
    v77[3] = &unk_1E59D5F30;
    id v78 = v23;
    [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v77];
    id v25 = v78;
LABEL_42:

    goto LABEL_47;
  }
  if (self->_modallyPresentedGroupView) {
    objc_msgSend(v23, "addObject:");
  }
  unint64_t v26 = self->_modalGroupIndex;
  if (v26 && v26 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v50 = [(PKPassGroupStackView *)self _groupViewAtIndex:v26 - 1];
    id v25 = v50;
    if (v50)
    {
      int64_t v51 = [v50 frontmostPassView];
      BOOL v52 = [v51 contentMode] > 3;

      if (v52) {
        [v24 addObject:v25];
      }
    }
    goto LABEL_42;
  }
LABEL_47:
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v27 = v24;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v74 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v31 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        [v31 beginPinningFrontFaceContentMode];
        if (v20)
        {
          uint64_t v32 = [v31 frontmostPassView];
          if ([v32 contentMode] <= 2) {
            [v32 setContentMode:3];
          }
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v28);
  }

  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_3;
  v68[3] = &unk_1E59D5F58;
  double v70 = self;
  long long v71 = v80;
  id v62 = v27;
  id v69 = v62;
  BOOL v72 = v7;
  uint64_t v33 = (void (**)(void))[v68 copy];
  if (v66)
  {
    transitionCompletionHandlers = self->_transitionCompletionHandlers;
    id v35 = (void *)[v66 copy];
    [(NSMutableArray *)transitionCompletionHandlers addObject:v35];
  }
  if (self->_layoutState.pilingMode == 1 && self->_nextState == 4) {
    self->_layoutState.pilingMode = 0;
  }
  [(PKPassGroupStackView *)self bounds];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  [(PKPassGroupStackView *)self _recomputeLayoutState];
  [(PKPassGroupStackView *)self _updateHeaderFooterStateAnimated:v7 layout:0];
  [(PKPassGroupStackView *)self _updateContentSizeAndLayout:1];
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView)
  {
    [(PKPassGroupView *)modallyPresentedGroupView presentDiff:0 completion:0];
    if (a3 == 5) {
      goto LABEL_71;
    }
    if ((v64 & 1) != 0 || ![(PKPassGroupStackView *)self isTableModalPresentation])
    {
      long long v45 = [(PKPassGroupView *)self->_modallyPresentedGroupView frontmostPassView];
      if ([v45 isFrontFaceExpanded]) {
        [v45 setFrontFaceExpanded:0 animated:1];
      }
    }
  }
  if (a3 == 7)
  {
LABEL_86:
    int64_t v54 = self->_presentationState;
    unint64_t v55 = v54 - 1;
    if (v54 == 1)
    {
      self->_int64_t presentationState = a3;
      [(PKPassGroupStackView *)self reloadData];
    }
    else if (v55 <= 2)
    {
      -[PKPassGroupStackView _tileGroupsForState:eager:withContext:](self, "_tileGroupsForState:eager:withContext:");
    }
    [(PKPassGroupStackView *)self _setScrollEnabled:0];
    if (v7) {
      int64_t v56 = 2;
    }
    else {
      int64_t v56 = a3;
    }
    if (v55 <= 2 && v7) {
      int64_t v56 = self->_presentationState;
    }
    [(PKPassGroupStackView *)self _loadModalGroupViewIfNecessaryInInitialState:v56];
    id v57 = self->_modallyPresentedGroupView;
    if (v57)
    {
      [(PKPassGroupView *)v57 setHidden:0];
      int64_t v58 = self->_modallyPresentedGroupView;
    }
    else
    {
      int64_t v58 = 0;
    }
    [(PKPassGroupStackView *)self _presentModalGroupView:v58 withState:a3 animated:v7 context:v65 completion:v33];
    goto LABEL_100;
  }
LABEL_71:
  if ((*((_WORD *)&self->_layoutState + 32) & 0xC000) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_externalVC);
    long long v47 = WeakRetained;
    if (WeakRetained)
    {
      id v48 = ViewControllerPresentingViewController(WeakRetained);
      if (v48)
      {
        loanedGroupView = self->_loanedGroupView;
        if (loanedGroupView)
        {
          [(PKPassGroupStackView *)self _acquireGroupView:loanedGroupView resetExternalVC:1];
        }
        else
        {
          objc_storeWeak((id *)&self->_externalVC, 0);
          [v47 setReceiver:0];
          [v47 setPassDashboardDelegate:0];
          [v47 invalidate];
          [v48 dismissViewControllerAnimated:0 completion:0];
        }
      }
    }
    else
    {
      uint64_t v53 = self->_loanedGroupView;
      if (v53) {
        [(PKPassGroupStackView *)self _acquireGroupView:v53 resetExternalVC:1];
      }
    }
  }
  switch(a3)
  {
    case 2:
    case 3:
      [(PKPassGroupStackView *)self _setScrollEnabled:0];
      [(PKPassGroupStackView *)self _presentOffscreenAnimated:v7 split:a3 == 3 withCompletionHandler:v33];
      break;
    case 4:
      if ((unint64_t)(self->_presentationState - 1) <= 2) {
        -[PKPassGroupStackView _tileGroupsForState:eager:withContext:](self, "_tileGroupsForState:eager:withContext:");
      }
      -[PKPassGroupStackView _presentGroupStackViewWithAnimation:priorBounds:completionHandler:](self, "_presentGroupStackViewWithAnimation:priorBounds:completionHandler:", v7, v33, v37, v39, v41, v43);
      break;
    case 5:
      goto LABEL_86;
    case 6:
      [(PKPassGroupStackView *)self _presentPassIngestionWithAnimation:v7 withCompletionHandler:v33];
      [(PKPassGroupStackView *)self _refreshBacklightForFrontmostPassGroup];
      break;
    default:
      [(PKPassGroupStackView *)self _cancelTransition];
      if (v33) {
        v33[2](v33);
      }
      break;
  }
LABEL_100:
  [(PKPassGroupStackView *)self _updatePanGestureRecognizerForGroupView:self->_modallyPresentedGroupView];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_4;
  v67[3] = &unk_1E59D5F30;
  v67[4] = self;
  [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v67];
  [(PKPassGroupStackView *)self layoutHeaderFootersAnimated:v7];
  [(PKPassGroupStackView *)self _updateTopContentSeparatorVisibilityAnimated:v7];
  [(PKPassGroupStackView *)self _updateBottomContentSeparatorVisibilityAnimated:v7];
  __int16 v59 = *((_WORD *)&self->_layoutState + 32);
  *((_WORD *)&self->_layoutState + 32) = v59 & 0xEFFF;
  if ((v59 & 0x800) != 0)
  {
    *((_WORD *)&self->_layoutState + 32) = v59 & 0xE7FF;
    [(PKPassGroupStackView *)self _updatePassFooterViewWithContext:v65];
  }
  else
  {
    [(PKPassGroupStackView *)self _updatePassFooterViewIfNecessaryWithContext:v65 becomeVisibleDelay:0.05];
  }
  __int16 v60 = *((_WORD *)&self->_layoutState + 32);
  if ((v60 & 0x4000) != 0)
  {
    *((_WORD *)&self->_layoutState + 32) = v60 & 0xBFFF;
    self->_footerAnimationDeladouble y = 0.0;
    __int16 v60 = *((_WORD *)&self->_layoutState + 32);
  }
  if (v60 < 0 && self->_presentationState != 7) {
    *((_WORD *)&self->_layoutState + 32) = v60 & 0x7FFF;
  }
  [(PKPassGroupStackView *)self _updateCoachingState];
  [(PKPassGroupStackView *)self _updatePausedState];
  uint64_t v61 = [(PKPassGroupStackView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v61 groupStackView:self transitioningToState:self->_presentationState animated:v7];
  }

  _Block_object_dispose(v80, 8);
}

- (void)_addGroupViewAsSubview:(id)a3 forIndex:(unint64_t)a4
{
  NSUInteger v6 = (PKPassGroupView *)a3;
  if (self->_loanedGroupView != v6)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__30;
    id v19 = __Block_byref_object_dispose__30;
    id v20 = 0;
    uint64_t v9 = 0;
    __int16 v10 = &v9;
    uint64_t v11 = 0x3032000000;
    BOOL v12 = __Block_byref_object_copy__30;
    __int16 v13 = __Block_byref_object_dispose__30;
    id v14 = 0;
    if (*(unsigned char *)&self->_reorderingFlags)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      _OWORD v8[2] = __56__PKPassGroupStackView__addGroupViewAsSubview_forIndex___block_invoke;
      v8[3] = &unk_1E59D6088;
      v8[4] = self;
      v8[5] = &v15;
      v8[6] = &v9;
      v8[7] = a4;
      [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v8];
      if (v10[5])
      {
        -[PKPassthroughView insertSubview:belowSubview:](self->_passContainerView, "insertSubview:belowSubview:", v6);
        goto LABEL_9;
      }
      passContainerView = self->_passContainerView;
      if (v16[5])
      {
        -[PKPassthroughView insertSubview:aboveSubview:](passContainerView, "insertSubview:aboveSubview:", v6);
        goto LABEL_9;
      }
    }
    else
    {
      passContainerView = self->_passContainerView;
    }
    [(PKPassthroughView *)passContainerView addSubview:v6];
    [(PKPassGroupStackView *)self _arrangeGroups];
LABEL_9:
    [(PKPassGroupView *)v6 setPaused:[(PKPassGroupStackView *)self _pauseStateForGroupView:v6 atIndex:a4]];
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
  }
}

void __42__PKPassGroupStackView__updatePausedState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if ((void *)v3[327] != a2)
  {
    id v5 = a2;
    objc_msgSend(v5, "setPaused:", objc_msgSend(v3, "_pauseStateForGroupView:atIndex:", v5, a3));
  }
}

- (BOOL)_pauseStateForGroupView:(id)a3 atIndex:(unint64_t)a4
{
  NSUInteger v6 = (PKPassGroupView *)a3;
  BOOL v7 = v6;
  if (self->_loanedGroupView == v6 && !self->_invalidated)
  {
    BOOL v8 = 0;
  }
  else if (self->_effectivePaused)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [(PKPassGroupView *)v6 frontmostPassView];
    __int16 v10 = [v9 pass];

    if ([v10 passType] == 1
      && ([v10 dynamicLayerConfiguration],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11)
      && (int64_t presentationState = self->_presentationState, presentationState != 5))
    {
      separatorIndedouble x = self->_layoutState.groups.separatorIndex;
      if (separatorIndex == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (presentationState == 4) {
          modalGroupIndedouble x = self->_layoutState.groups.count - 1;
        }
        else {
          modalGroupIndedouble x = self->_modalGroupIndex;
        }
        BOOL v16 = modalGroupIndex == a4;
      }
      else
      {
        BOOL v16 = separatorIndex == a4;
      }
      BOOL v8 = !v16;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (double)_layoutContentFromOffset:(CGPoint)a3 toOffset:(CGPoint)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v8 = a3.y;
  CGFloat v9 = a3.x;
  uint64_t v11 = (void *)MEMORY[0x1A6224460](self, a2);
  if (!v5)
  {
    BOOL v12 = 0;
    goto LABEL_7;
  }
  BOOL v12 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
  if ((*((_WORD *)&self->_layoutState + 32) & 0x4000) == 0)
  {
LABEL_7:
    __int16 v13 = 0;
    LOBYTE(v15) = 0;
    int64_t presentationState = self->_presentationState;
    goto LABEL_8;
  }
  __int16 v13 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
  int64_t presentationState = self->_presentationState;
  if (v13)
  {
    if (presentationState == 7) {
      LOBYTE(v15) = 1;
    }
    else {
      int v15 = (*((unsigned __int16 *)&self->_layoutState + 32) >> 14) & 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }
LABEL_8:
  if ((*((_WORD *)&self->_layoutState + 32) & 0x4000) == 0)
  {
    modalGroupIndeCGFloat x = self->_modalGroupIndex;
    double v17 = 0.0;
    uint64_t v18 = v12;
    if (presentationState == 4) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  modalGroupIndeCGFloat x = self->_layoutState.externalToTableTransitionModalGroupIndex;
  if (presentationState != 4)
  {
LABEL_14:
    double v17 = 0.0;
    if ((*((_WORD *)&self->_layoutState + 32) & 0x2000) != 0)
    {
      int64_t pilingMode = self->_layoutState.pilingMode;
      [(PKPassGroupStackView *)self _setupSpringFactoryForPileAnimations:v12 withMaximumAcceleration:pilingMode != 0 reverse:0.0];
      if (pilingMode) {
        double v17 = v21;
      }
    }
    goto LABEL_17;
  }
  double v17 = 0.0;
  if (!v12)
  {
    uint64_t v18 = 0;
    goto LABEL_18;
  }
  [(PKPassGroupStackView *)self _setupSpringFactoryForExternalToTableAnimations:v12];
  self->_footerAnimationDelaCGFloat y = fmax(v19, self->_footerAnimationDelay);
LABEL_17:
  uint64_t v18 = v12;
LABEL_18:
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __67__PKPassGroupStackView__layoutContentFromOffset_toOffset_animated___block_invoke;
  v28[3] = &unk_1E59D6278;
  char v36 = v15;
  BOOL v37 = modalGroupIndex != 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v31 = modalGroupIndex;
  v28[4] = self;
  id v29 = v13;
  id v22 = v18;
  id v30 = v12;
  CGFloat v32 = x;
  CGFloat v33 = y;
  CGFloat v34 = v9;
  CGFloat v35 = v8;
  [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v28];
  [v12 duration];
  double v24 = v23;
  [v12 maximumVendedDelay];
  double v26 = v24 + v25;

  [(PKPassGroupStackView *)self _layoutFooterAnimated:v5 withAnimationDelay:v17];
  [(PKPassGroupView *)self->_modallyPresentedGroupView updatePageControlFrameAnimated:v5];

  return v26;
}

- (void)_layoutFooterAnimated:(BOOL)a3 withAnimationDelay:(double)a4
{
  if ((*((_WORD *)&self->_layoutState + 32) & 0x1000) == 0)
  {
    passFooterView = self->_passFooterView;
    if (passFooterView)
    {
      BOOL v6 = a3;
      [(PKPassFooterView *)passFooterView alpha];
      if (v7 <= 0.0 || !v6) {
        CGFloat v9 = 0;
      }
      else {
        CGFloat v9 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
      }
      __int16 v10 = [(PKPassFooterView *)self->_passFooterView layer];
      uint64_t v11 = [(PKPassFooterView *)self->_passFooterView configuration];
      BOOL v12 = [v11 passView];
      [(PKPassGroupStackView *)self _frameForFooterViewForPassView:v12];
      double v47 = v13;
      double v48 = v14;
      double v16 = v15;
      double v18 = v17;

      double v19 = *MEMORY[0x1E4F1DAD8];
      double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      [v10 bounds];
      double v22 = v21;
      double v24 = v23;
      [v10 position];
      double v26 = v25;
      double v28 = v27;
      BOOL v29 = v18 == v24 && v16 == v22;
      if (!v29)
      {
        [(PKPassFooterView *)self->_passFooterView layoutIfNeeded];
        id v30 = [v9 springAnimationWithKeyPath:@"bounds.size.width"];
        unint64_t v31 = v30;
        CGFloat v32 = (void *)MEMORY[0x1E4F39D98];
        if (v30)
        {
          [v30 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
          [v31 setBeginTime:a4];
          objc_msgSend(v31, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v22, v16);
          id v33 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v31);
        }
        CGFloat v34 = [v9 springAnimationWithKeyPath:@"bounds.size.height"];

        if (v34)
        {
          [v34 setBeginTimeMode:*v32];
          [v34 setBeginTime:a4];
          objc_msgSend(v34, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v24, v18);
          id v35 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v34);
        }
        char v36 = (void *)MEMORY[0x1E4FB1EB0];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __65__PKPassGroupStackView__layoutFooterAnimated_withAnimationDelay___block_invoke;
        v50[3] = &unk_1E59CBC90;
        id v51 = v10;
        double v52 = v19;
        double v53 = v20;
        double v54 = v16;
        double v55 = v18;
        [v36 performWithoutAnimation:v50];
      }
      [v10 anchorPoint];
      double v38 = v47 + v19 + v37 * v16;
      double v40 = v48 + v20 + v39 * v18;
      if (v38 != v26 || v40 != v28)
      {
        double v42 = [v9 springAnimationWithKeyPath:@"position"];
        double v43 = v42;
        if (v42)
        {
          objc_msgSend(v42, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v26, v28, v38, v40);
          id v44 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v43);
        }
        objc_msgSend(v10, "setPosition:", v38, v40);
      }
      if (!v29)
      {
        if (v6)
        {
          long long v45 = (void *)MEMORY[0x1E4FB1EB0];
          [v9 duration];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __65__PKPassGroupStackView__layoutFooterAnimated_withAnimationDelay___block_invoke_2;
          v49[3] = &unk_1E59CA7D0;
          v49[4] = self;
          objc_msgSend(v45, "_animateWithDuration:delay:options:factory:animations:completion:", 6, v9, v49, 0);
        }
        else
        {
          [(PKPassFooterView *)self->_passFooterView layoutIfNeeded];
        }
      }
    }
  }
}

- (void)_arrangeGroups
{
  ++self->_reorderActionTag;
  [(NSMutableArray *)self->_reorderActions removeAllObjects];
  uint64_t v10 = 0;
  uint64_t v11 = (id *)&v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__30;
  double v14 = __Block_byref_object_dispose__30;
  id v15 = 0;
  uint64_t v3 = [(PKBackdropView *)self->_backdropView superview];
  passContainerView = self->_passContainerView;

  if (v3 == passContainerView) {
    [(PKPassthroughView *)self->_passContainerView bringSubviewToFront:self->_backdropView];
  }
  BOOL v5 = [(PKPassGroupView *)self->_modallyPresentedGroupView pageControl];
  BOOL v6 = v5;
  if (v5)
  {
    double v7 = [v5 superview];
    CGFloat v8 = self->_passContainerView;

    if (v7 == v8)
    {
      [(PKPassthroughView *)self->_passContainerView sendSubviewToBack:v6];
      objc_storeStrong(v11 + 5, v6);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__PKPassGroupStackView__arrangeGroups__block_invoke;
  v9[3] = &unk_1E59D6060;
  v9[4] = self;
  v9[5] = &v10;
  [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v9];

  _Block_object_dispose(&v10, 8);
}

- (void)_updateContentSizeAndLayout:(BOOL)a3
{
}

- (void)_updatePausedState
{
  if (self->_invalidated || self->_paused)
  {
    BOOL v2 = 1;
  }
  else
  {
    int64_t presentationState = self->_presentationState;
    BOOL v2 = presentationState == 2 || presentationState == 7;
  }
  self->_effectivePaused = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __42__PKPassGroupStackView__updatePausedState__block_invoke;
  v5[3] = &unk_1E59D5F30;
  v5[4] = self;
  [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v5];
}

- (void)_updatePassFooterViewIfNecessaryWithContext:(id)a3 becomeVisibleDelay:(double)a4
{
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  id v7 = a3;
  id v9 = [(PKPassGroupView *)modallyPresentedGroupView frontmostPassView];
  id v8 = [(PKPassGroupStackView *)self _createPassFooterConfigurationForPassView:v9 withContext:v7];
  [(PKPassGroupStackView *)self _updatePassFooterViewWithConfiguration:v8 context:v7 animated:1 reload:0 delay:a4];
}

- (void)_updatePanGestureRecognizerForGroupView:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    id v9 = v4;
    if (self->_invalidated) {
      goto LABEL_10;
    }
    uint64_t v6 = 31;
    if (!self->_transitionCanceller) {
      uint64_t v6 = 7;
    }
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR___PKPassGroupStackView__staggerPileAnimations[v6]);
    if (v7 == 4 || v7 == 7) {
LABEL_10:
    }
      [(PKPassGroupStackView *)self _removePanGestureRecognizerFromGroupView:v4];
    else {
      [(PKPassGroupStackView *)self _addPanGestureRecognizerToGroupView:v4];
    }
    BOOL v5 = v9;
  }
}

- (void)_updateCoachingState
{
  if ([(PKPassGroupStackView *)self isPresentingPassViewFront]
    && self->_passFooterViewVisible)
  {
    int64_t v3 = [(PKPassFooterView *)self->_passFooterView coachingState];
  }
  else
  {
    int64_t v3 = 0;
  }
  if (self->_coachingState != v3)
  {
    self->_coachingState = v3;
    id v4 = [(PKPassGroupStackView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 groupStackViewDidChangeCoachingState:self];
    }
  }
}

- (void)_updatePassFooterViewWithConfiguration:(id)a3 context:(id)a4 animated:(BOOL)a5 reload:(BOOL)a6 delay:(double)a7
{
  int v8 = a6;
  BOOL v9 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  double v14 = 0.0;
  if (self->_invalidated
    || ![(PKPassGroupStackView *)self isPresentingPassViewFront]
    || (*((_WORD *)&self->_layoutState + 32) & 0x100) != 0
    || !self->_modallyPresentedGroupView
    || self->_footerSuppressed
    || ((presentationState = self->_presentationState, presentationState == 7) ? (double v14 = 0.0) : (double v14 = 1.0),
        presentationState == 7))
  {

    int v16 = 0;
    int v8 = 0;
    double v37 = 0;
    id v12 = 0;
  }
  else
  {
    int v16 = 1;
    double v37 = v13;
    if (v13 && (v8 & 1) == 0) {
      int v8 = [v13 wantsPersistentCardEmulation];
    }
  }
  int passFooterViewVisible = self->_passFooterViewVisible;
  [(PKPassFooterView *)self->_passFooterView alpha];
  double v18 = v17;
  double v19 = [(PKPassFooterView *)self->_passFooterView configuration];
  int v20 = PKEqualObjects();

  int v21 = v20 ^ 1;
  if ((v16 & v8 & 1) != 0 || passFooterViewVisible != v16 || (v21 & 1) != 0 || v18 != v14)
  {
    self->_int passFooterViewVisible = v16;
    self->_passFooterViewAlphCATransform3D a = v14;
    unsigned int passFooterViewVisibilityToken = self->_passFooterViewVisibilityToken;
    if (passFooterViewVisible != v16) {
      self->_unsigned int passFooterViewVisibilityToken = ++passFooterViewVisibilityToken;
    }
    if (v16)
    {
      if (!self->_passFooterView)
      {
        double v23 = objc_alloc_init(PKPassFooterView);
        passFooterView = self->_passFooterView;
        self->_passFooterView = v23;

        [(PKPassFooterView *)self->_passFooterView setDelegate:self];
        [(PKPassFooterView *)self->_passFooterView setAlpha:0.0];
        [(PKPassGroupStackView *)self insertSubview:self->_passFooterView atIndex:0];
      }
      if ((v21 | v8) == 1)
      {
        double v25 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          double v26 = self->_passFooterView;
          *(_DWORD *)buf = 134349312;
          double v53 = self;
          __int16 v54 = 2050;
          double v55 = v26;
          _os_log_impl(&dword_19F450000, v25, OS_LOG_TYPE_DEFAULT, "PKPassGroupStackView (%{public}p): configuring PKPassFooterView %{public}p.", buf, 0x16u);
        }

        if (v9) {
          BOOL v27 = passFooterViewVisible && v18 > 0.0 || self->_passFooterViewOutstandingAnimations != 0;
        }
        else {
          BOOL v27 = 0;
        }
        uint64_t v28 = 2;
        if (!v8) {
          uint64_t v28 = 0;
        }
        [(PKPassFooterView *)self->_passFooterView configureWithConfiguration:v12 context:v37 options:v27 | v28];
      }
    }
    char v36 = [(PKPassFooterView *)self->_passFooterView configuration];

    if (v16)
    {
      if ([(PKPassFooterView *)self->_passFooterView requestPileSuppression]) {
        [(PKPassGroupStackView *)self setPilingMode:1];
      }
      BOOL v29 = self->_passFooterView;
      id v30 = [v36 passView];
      [(PKPassGroupStackView *)self _frameForFooterViewForPassView:v30];
      -[PKPassFooterView setFrame:](v29, "setFrame:");

      [(PKPassFooterView *)self->_passFooterView layoutIfNeeded];
      if (passFooterViewVisible != v16) {
        [(PKPassFooterView *)self->_passFooterView willBecomeVisibleAnimated:v9];
      }
    }
    else if (passFooterViewVisible)
    {
      [(PKPassFooterView *)self->_passFooterView willBecomeHiddenAnimated:v9];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke;
    aBlock[3] = &__block_descriptor_39_e33_v20__0__PKPassGroupStackView_8B16l;
    BOOL v49 = passFooterViewVisible != v16;
    unsigned int v48 = passFooterViewVisibilityToken;
    char v50 = v16;
    BOOL v51 = v9;
    unint64_t v31 = _Block_copy(aBlock);
    objc_initWeak((id *)buf, self);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_2;
    v43[3] = &unk_1E59D6170;
    unsigned int v46 = passFooterViewVisibilityToken;
    v45[1] = *(id *)&v14;
    objc_copyWeak(v45, (id *)buf);
    id v32 = v31;
    id v44 = v32;
    id v33 = (void (**)(void *, PKPassGroupStackView *, void *))_Block_copy(v43);
    if (v9 && v18 != v14) {
      CGFloat v34 = (void *)[objc_alloc(MEMORY[0x1E4F85060]) initWithMass:0.35 stiffness:dbl_1A0444350[self->_presentationState == 3] damping:dbl_1A0444340[self->_presentationState == 3]];
    }
    else {
      CGFloat v34 = 0;
    }
    ++self->_passFooterViewOutstandingAnimations;
    if (a7 <= 0.0)
    {
      v33[2](v33, self, v34);
    }
    else
    {
      dispatch_time_t v35 = dispatch_time(0, (uint64_t)(a7 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_4;
      block[3] = &unk_1E59CA960;
      objc_copyWeak(&v42, (id *)buf);
      double v41 = v33;
      id v40 = v34;
      dispatch_after(v35, MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v42);
    }
    if (PKUserIntentIsAvailable()) {
      [(PKPassGroupStackView *)self passFooterViewDidChangePhysicalButtonRequirement:self->_passFooterView withContext:v37];
    }
    if (passFooterViewVisible != v16) {
      [(PKPassGroupStackView *)self _updateCoachingState];
    }

    objc_destroyWeak(v45);
    objc_destroyWeak((id *)buf);

    id v12 = v36;
  }
  else
  {
    [(PKPassGroupStackView *)self _layoutFooterAnimated:v9 withAnimationDelay:0.0];
  }
}

- (BOOL)isPresentingPassViewFront
{
  int64_t presentationState = self->_presentationState;
  if (presentationState == 4) {
    return [(PKPassGroupStackView *)self isTableModalPresentation];
  }
  BOOL v3 = presentationState == 7 || presentationState == 5;
  return v3 && self->_layoutState.groups.count && self->_modalGroupIndex != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_createPassFooterConfigurationForPassView:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = 0;
  if (a3 && !self->_invalidated)
  {
    id v8 = a3;
    BOOL v9 = [v8 pass];
    if ([v9 passType] != 1)
    {
      if (PKValueAddedServicesEnabledForPass())
      {
        if ([(PKSecureElement *)self->_secureElement isInRestrictedMode]) {
          uint64_t v11 = 3;
        }
        else {
          uint64_t v11 = 2;
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      goto LABEL_42;
    }
    id v10 = v9;
    if ([(PKSecureElement *)self->_secureElement isInRestrictedMode])
    {
      uint64_t v11 = 3;
LABEL_41:

LABEL_42:
      uint64_t v7 = [[PKPassFooterViewConfiguration alloc] initWithPassView:v8 state:v11];

      goto LABEL_43;
    }
    if ([v6 isPostPayment])
    {
      uint64_t v11 = 4;
      goto LABEL_41;
    }
    if (![v10 hasAssociatedPeerPaymentAccount]
      || [v10 effectiveContactlessPaymentApplicationState] == 7)
    {
      uint64_t v11 = 1;
      goto LABEL_41;
    }
    id v12 = [MEMORY[0x1E4F84E00] sharedInstance];
    id v13 = [v12 account];

    uint64_t v14 = [v13 state];
    id v15 = [v13 associatedPassUniqueID];
    int v16 = [v10 uniqueID];
    id v17 = v15;
    id v18 = v16;
    if (v17 == v18)
    {
    }
    else
    {
      double v19 = v18;
      if (!v17 || !v18)
      {

LABEL_34:
        uint64_t v11 = 1;
LABEL_40:

        goto LABEL_41;
      }
      char v20 = [v17 isEqualToString:v18];

      if ((v20 & 1) == 0) {
        goto LABEL_34;
      }
    }
    uint64_t v21 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
    uint64_t v22 = [v10 activationState];
    if ((unint64_t)(v14 - 1) >= 2 || v22 == 4)
    {
      if (v21)
      {
        if (v21 != 5)
        {
          double v24 = [v10 paymentPass];
          uint64_t v25 = [v24 activationState];

          if (v25 != 3)
          {
            uint64_t v11 = 5;
            goto LABEL_40;
          }
        }
      }
    }
    if (v14 == 1)
    {
      double v26 = [v13 currentBalance];
      BOOL v27 = [v26 amount];
      uint64_t v28 = [MEMORY[0x1E4F28C28] zero];
      if ([v27 compare:v28])
      {
      }
      else
      {
        char v29 = PKRunningInViewService();

        if (v29)
        {
          uint64_t v11 = 6;
          goto LABEL_40;
        }
      }
    }
    if ([v13 isParticipantAccountLockedByOwner]) {
      uint64_t v11 = 7;
    }
    else {
      uint64_t v11 = 1;
    }
    goto LABEL_40;
  }
LABEL_43:

  return v7;
}

- (void)_transitionSuccessful:(BOOL)a3
{
  BOOL v3 = a3;
  if ((self->_presentationState | 2) == 7) {
    [(PKPassGroupStackView *)self _presentModalGroupViewPostAnimationActions];
  }
  transitionCanceller = (void (**)(void))self->_transitionCanceller;
  if (transitionCanceller)
  {
    transitionCanceller[2]();
    id v6 = self->_transitionCanceller;
    self->_transitionCanceller = 0;
  }
  [(PKPassGroupStackView *)self _executeCompletionHandlers:self->_transitionCompletionHandlers cancelled:0];

  [(PKPassGroupStackView *)self _notifyDelegateOfStateChange:v3];
}

uint64_t __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_executeCompletionHandlers:(id)a3 cancelled:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)[v4 copy];
  [v4 removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)_shouldTablePresentationScroll
{
  if (![(PKPassGroupStackView *)self isTableModalPresentation]
    || !self->_layoutState.groups.count && (*((_WORD *)&self->_layoutState + 32) & 6) != 0)
  {
    return 1;
  }
  if (![(PKPassGroupStackView *)self isTableModalPresentation]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  BOOL v5 = [WeakRetained groupAtIndex:0];
  BOOL v3 = [v5 passCount] == 1;

  return v3;
}

- (void)_setModalGroupView:(id)a3
{
  unint64_t v4 = [(PKPassGroupStackView *)self _indexOfGroupView:a3];

  [(PKPassGroupStackView *)self setModalGroupIndex:v4];
}

- (void)_rampBacklightIfNecessary:(BOOL)a3
{
  if (self->_wantsBacklightRamping != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = +[PKBacklightController sharedInstance];
    id v6 = v5;
    if (v3) {
      [v5 beginRequestingBacklightRamping:self];
    }
    else {
      [v5 endRequestingBacklightRamping:self];
    }

    self->_wantsBacklightRamping = v3;
  }
}

- (void)_presentOffscreenAnimated:(BOOL)a3 split:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v8 = (void (**)(void))a5;
  if (!v5) {
    [(PKPassGroupStackView *)self setModalGroupIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  if (v6)
  {
    [MEMORY[0x1E4F39CF8] begin];
    uint64_t v9 = (void *)MEMORY[0x1E4F39CF8];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__PKPassGroupStackView__presentOffscreenAnimated_split_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E59CAA98;
    double v19 = v8;
    [v9 setCompletionBlock:v18];

    int64_t v10 = 2;
    if (v5) {
      int64_t v10 = 3;
    }
    p_int64_t presentationState = &self->_presentationState;
    self->_int64_t presentationState = v10;
    long long v12 = (void *)MEMORY[0x1A6224460]();
    long long v13 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
  }
  else
  {
    int64_t v14 = 2;
    if (v5) {
      int64_t v14 = 3;
    }
    p_int64_t presentationState = &self->_presentationState;
    self->_int64_t presentationState = v14;
    long long v12 = (void *)MEMORY[0x1A6224460]();
    long long v13 = 0;
  }
  [(PKPassGroupStackView *)self _setupSpringFactory:v13 forPileAnimationToPresentationState:*p_presentationState reverse:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__PKPassGroupStackView__presentOffscreenAnimated_split_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E59D60B0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v16];

  if (v6)
  {
    [MEMORY[0x1E4F39CF8] commit];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

void __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "endPinningFrontFaceContentMode", (void)v7);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 40) _transitionSuccessful:*(unsigned __int8 *)(a1 + 56)];
  }
}

- (double)_setupSpringFactory:(id)a3 forPileAnimationToPresentationState:(int64_t)a4 reverse:(BOOL)a5
{
  [(PKPassGroupStackView *)self _setupSpringFactory:a3 forPileAnimationFromPresentationState:self->_priorState toPresentationState:a4 reverse:a5];
  return result;
}

- (double)_setupSpringFactory:(id)a3 forPileAnimationFromPresentationState:(int64_t)a4 toPresentationState:(int64_t)a5 reverse:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  double v10 = 0.0;
  if (self->_staggerPileAnimations)
  {
    int64_t priorState = self->_priorState;
    if (a5 == 3)
    {
      if (priorState != 5) {
        goto LABEL_8;
      }
    }
    else if (a5 != 5 || priorState != 3)
    {
      goto LABEL_8;
    }
    [(PKPassGroupStackView *)self _setupSpringFactoryForPileAnimations:v9 withMaximumAcceleration:v6 reverse:0.005];
    double v10 = v12;
  }
LABEL_8:

  return v10;
}

- (void)_cancelTransition
{
  transitionCanceller = (void (**)(id, SEL))self->_transitionCanceller;
  if (transitionCanceller)
  {
    transitionCanceller[2](transitionCanceller, a2);
    id v4 = self->_transitionCanceller;
    self->_transitionCanceller = 0;

    transitionCompletionHandlers = self->_transitionCompletionHandlers;
    [(PKPassGroupStackView *)self _executeCompletionHandlers:transitionCompletionHandlers cancelled:1];
  }
}

- (void)_notifyDelegateOfStateChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPassGroupStackView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 groupStackView:self didTransitionToState:self->_presentationState animated:v3];
  }
}

- (void)_updateGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(PKPassGroupStackView *)self _updateGroupView:v9 toPresentationState:a4 withSpringFactory:v8 atIndex:[(PKPassGroupStackView *)self _indexOfGroupView:v9]];
}

- (void)_updateGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5 atIndex:(unint64_t)a6
{
  double v10 = (PKPassGroupView *)a3;
  id v11 = a5;
  if (self->_loanedGroupView != v10 || *((unsigned __int16 *)&self->_layoutState + 32) >= 0x4000u)
  {
    [(PKPassGroupStackView *)self _positionForGroupView:v10 atIndex:a6 forState:a4];
    double v13 = v12;
    double v15 = v14;
    memset(&v35[1], 0, sizeof(CATransform3D));
    [(PKPassGroupStackView *)self _transformForGroupView:v10 atIndex:a6 forState:a4];
    [(PKPassGroupStackView *)self _opacityForGroupAtIndex:a6 withGroupView:v10 forState:a4];
    double v17 = v16;
    id v18 = [(PKPassGroupView *)v10 layer];
    double v19 = v18;
    if (v11)
    {
      [v18 position];
      double v22 = v21;
      double v23 = v20;
      if (v21 != v13 || v20 != v15)
      {
        double v24 = [v11 highFrameRateSpringAnimationForView:v10 withKeyPath:@"position" reason:1];
        objc_msgSend(v24, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v22, v23, v13, v15);
        id v25 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v24);
      }
      memset(v35, 0, 128);
      if (v19) {
        [v19 transform];
      }
      CATransform3D a = v35[0];
      CATransform3D v33 = v35[1];
      if (!CATransform3DEqualToTransform(&a, &v33))
      {
        double v26 = [v11 highFrameRateSpringAnimationForView:v10 withKeyPath:@"transform" reason:1];
        CATransform3D a = v35[0];
        CATransform3D v33 = v35[1];
        objc_msgSend(v26, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v33);
        id v27 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v26);
      }
      [v19 opacity];
      double v29 = v28;
      if (v17 != v28)
      {
        id v30 = [v11 springAnimationForView:v10 withKeyPath:@"opacity"];
        objc_msgSend(v30, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v29, v17);
        id v31 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v30);
      }
    }
    objc_msgSend(v19, "setPosition:", v13, v15);
    v35[0] = v35[1];
    [v19 setTransform:v35];
    *(float *)&double v32 = v17;
    [v19 setOpacity:v32];
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if (self->_wantsBacklightRamping)
  {
    id v4 = +[PKBacklightController sharedInstance];
    [v4 endRequestingBacklightRamping:self];
  }
  if (self->_transitionCanceller) {
    [(PKPassGroupStackView *)self _cancelTransition];
  }
  if (self->_hasSuspendedTransition) {
    [(PKPassGroupStackView *)self _cancelSuspendedTransition];
  }
  [(NSMutableArray *)self->_reorderActions removeAllObjects];
  [(PKPaymentService *)self->_paymentService setDelegate:0];
  [(PKPassGroupStackView *)self _executeCompletionHandlers:self->_transitionCompletionHandlers cancelled:1];
  bottomContentSeparatorVisibilityTimer = self->_bottomContentSeparatorVisibilityTimer;
  if (bottomContentSeparatorVisibilityTimer)
  {
    dispatch_source_cancel(bottomContentSeparatorVisibilityTimer);
    BOOL v6 = self->_bottomContentSeparatorVisibilityTimer;
    self->_bottomContentSeparatorVisibilityTimer = 0;
  }
  if (!self->_invalidated) {
    [(PKPassGroupStackView *)self invalidate];
  }
  v7.receiver = self;
  v7.super_class = (Class)PKPassGroupStackView;
  [(PKPassGroupStackView *)&v7 dealloc];
}

double __69__PKPassGroupStackView__updateTopContentSeparatorVisibilityAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 anchorPoint];
  double v5 = v4;
  [v3 position];
  double v7 = v6;
  [v3 bounds];
  double v9 = v8;
  double v11 = v10;
  memset(&v15, 0, sizeof(v15));
  if (v3) {
    [v3 transform];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  CATransform3DGetAffineTransform(&v15, &v14);
  double v12 = 1.0
      - fmin((fmax(v7 - v5 * (v11 * v15.d + v15.b * v9), *(double *)(a1 + 40)) - *(double *)(a1 + 40))/ *(double *)(a1 + 56), 1.0);

  return v12;
}

void __72__PKPassGroupStackView__updateBottomContentSeparatorVisibilityAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    double v4 = WeakRetained[275];
    double v7 = v3;
    if (v4)
    {
      dispatch_source_cancel(v4);
      double v5 = v7[275];
      v7[275] = 0;

      id v3 = v7;
    }
    double v6 = [v3 delegate];
    [v6 groupStackView:*(void *)(a1 + 32) wantsBottomContentSeparatorWithVisibility:*(unsigned __int8 *)(a1 + 48) animated:*((double *)v7 + 274)];

    id v3 = v7;
  }
}

- (void)setPresentationState:(int64_t)a3
{
}

uint64_t __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)stageGroupInPresentationState:(int64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v7 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexes];
  if (a4 >= v7 && a4 - v7 < v8)
  {
    char v10 = 0;
    id v9 = [(PKPassGroupStackView *)self _loadGroupViewAtIndex:a4 forState:a3 presentationState:1 cached:&v10];
    [(PKPassGroupStackView *)self _arrangeGroups];
  }
}

- (PKPass)modalGroupFrontmostPass
{
  if ([(PKPassGroupStackView *)self isPresentingPassViewFront])
  {
    id v3 = [(PKPassGroupStackView *)self _groupViewAtIndex:self->_modalGroupIndex];
    double v4 = [v3 frontmostPassView];
    double v5 = [v4 pass];
  }
  else
  {
    double v5 = 0;
  }

  return (PKPass *)v5;
}

- (void)reloadData
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(PKPassGroupStackView *)self updateHeaderAndSubheaderViewsIfNecessary];
  id v3 = [(NSMutableDictionary *)self->_groupViewsByGroupID allKeys];
  double v4 = (void *)[v3 mutableCopy];

  if (self->_layoutState.groups.count)
  {
    unint64_t v5 = [(PKPassGroupStackView *)self _lastIndex];
    double v6 = (void *)MEMORY[0x1E4F28E60];
    uint64_t v7 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexes];
    id v9 = objc_msgSend(v6, "indexSetWithIndexesInRange:", v7, v8);
    [v9 addIndex:v5];
    if (self->_modallyPresentedGroupView)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
      double v11 = [(PKPassGroupView *)self->_modallyPresentedGroupView group];
      uint64_t v12 = [WeakRetained indexOfGroup:v11];

      if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
        [v9 addIndex:v12];
      }
    }
    id v13 = objc_loadWeakRetained((id *)&self->_datasource);
    CATransform3D v14 = [v13 groupAtIndex:v5];

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_datasource);
      uint64_t v16 = [v15 indexOfGroup:v14];

      if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
        [v9 addIndex:v16];
      }
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __34__PKPassGroupStackView_reloadData__block_invoke;
    v27[3] = &unk_1E59D5F80;
    v27[4] = self;
    id v28 = v14;
    id v29 = v4;
    id v17 = v14;
    [v9 enumerateIndexesUsingBlock:v27];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v4;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[PKPassGroupStackView _removeGroupViewAsSubviewWithGroupID:](self, "_removeGroupViewAsSubviewWithGroupID:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v20);
  }

  if (self->_modalGroupIndex == 0x7FFFFFFFFFFFFFFFLL && (self->_presentationState | 2) == 7)
  {
    [(PKPassGroupStackView *)self setPresentationState:4];
  }
  else
  {
    [(PKPassGroupStackView *)self _arrangeGroups];
    [(PKPassGroupStackView *)self _updateContentSize];
  }
}

void __34__PKPassGroupStackView_reloadData__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 2696));
  unint64_t v5 = [WeakRetained groupAtIndex:a2];

  char v11 = 0;
  double v6 = objc_msgSend(v5, "passAtIndex:", objc_msgSend(v5, "frontmostPassIndex"));
  uint64_t v7 = v6;
  if (v5 == *(void **)(a1 + 40))
  {
    [v6 loadImageSetSync:0 preheat:1];
  }
  else
  {
    [v6 loadImageSetSync:2 preheat:0];
    [v7 loadContentSync];
  }
  id v8 = (id)[*(id *)(a1 + 32) _loadGroupViewAtIndex:a2 forState:*(void *)(*(void *)(a1 + 32) + 2080) presentationState:1 cached:&v11];
  id v9 = *(void **)(a1 + 48);
  char v10 = [v5 groupID];
  [v9 removeObject:v10];
}

- (void)deleteGroup:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  groupViewsByGroupID = self->_groupViewsByGroupID;
  id v7 = a3;
  id v8 = [v7 groupID];
  id v9 = [(NSMutableDictionary *)groupViewsByGroupID objectForKey:v8];

  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView) {
    BOOL v11 = modallyPresentedGroupView == v9;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      passFooterView = self->_passFooterView;
      int v19 = 134349312;
      uint64_t v20 = self;
      __int16 v21 = 2050;
      double v22 = passFooterView;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "PKPassGroupStackView (%{public}p): suppressing PKPassFooterView %{public}p - group deleted.", (uint8_t *)&v19, 0x16u);
    }

    [(PKPassGroupStackView *)self _updatePassFooterViewWithConfiguration:0 context:0 animated:1 reload:0 delay:0.0];
  }
  [(PKPassGroupView *)v9 markGroupDeleted];
  [(PKPassGroupView *)v9 setUserInteractionEnabled:0];
  if (a4)
  {
    id v14 = [(PKPassGroupStackView *)self _groupViewAtIndex:a4 - 1];
    id v15 = [v14 frontmostPassView];
    if ([v15 frontFaceBodyContentCreated]) {
      uint64_t v16 = [v15 contentMode];
    }
    else {
      uint64_t v16 = 3;
    }
    [v15 setContentMode:v16];
  }
  [(UIView *)v9 addDefaultTransformSpringWithStartTime:CACurrentMediaTime()];
  id v17 = [(PKPassGroupView *)v9 layer];
  [(PKPassGroupStackView *)self _positionForGroupView:v9 atIndex:a4 forState:1];
  objc_msgSend(v17, "setPosition:");

  id v18 = [v7 groupID];

  [(PKPassGroupStackView *)self performSelector:sel__removeGroupViewAsSubviewWithGroupID_ withObject:v18 afterDelay:1.0];
  [(PKPassGroupStackView *)self setPresentationState:self->_presentationState animated:1];
}

- (void)moveGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v8 = a3;
  if (self->_presentationState == 4)
  {
    [(PKPassGroupStackView *)self setUserInteractionEnabled:0];
    [(PKPassGroupStackView *)self contentOffset];
    -[PKPassGroupStackView setContentOffset:animated:](self, "setContentOffset:animated:", 0);
    ++self->_userInteractionCounter;
    id v9 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
    char v10 = (void *)MEMORY[0x1A6224460]();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __52__PKPassGroupStackView_moveGroup_fromIndex_toIndex___block_invoke;
    v31[3] = &unk_1E59D5FA8;
    v31[4] = self;
    id v32 = v8;
    id v11 = v9;
    id v33 = v11;
    [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v31];

    id v12 = [(PKPassGroupStackView *)self _createStackedIndices];
    unint64_t v14 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexes];
    unint64_t v15 = v13;
    if (a4 >= v14 && a4 - v14 < v13 || [v12 containsIndex:a4])
    {
      id v16 = [(PKPassGroupStackView *)self _groupViewAtIndex:a5];
      if (v16)
      {
        if ((*((unsigned char *)&self->_layoutState.groups + 16) & 2) != 0 && self->_layoutState.groups.separatorIndex >= a5)
        {
          -[PKPassGroupStackView _maxYOfPassFrontFaceAtIndex:](self, "_maxYOfPassFrontFaceAtIndex:");
          double v18 = v17;
          [(PKPassGroupStackView *)self bounds];
          fmin(v18, CGRectGetMaxY(v34));
        }
        else
        {
          [(PKPassGroupStackView *)self _yPositionForGroupAtIndex:a5 forState:1];
        }
        [(PKPassGroupStackView *)self _updateTransformForGroupView:v16 toPresentationState:1 withSpringFactory:v11];
        [(PKPassGroupStackView *)self _xPositionForGroupView:v16 forState:1];
        -[PKPassGroupStackView _updatePositionForGroupView:toPosition:withSpringFactory:](self, "_updatePositionForGroupView:toPosition:withSpringFactory:", v16, v11);
        int v19 = [v16 group];
        uint64_t v20 = [v19 groupID];

        if (v20) {
          [(NSMutableDictionary *)self->_groupViewsInFlightByGroupID setObject:v16 forKey:v20];
        }
        if (a5)
        {
          id v21 = [(PKPassGroupStackView *)self _groupViewAtIndex:a5 - 1];
          double v22 = [v21 frontmostPassView];
          [v22 setContentMode:3];
        }
      }
    }
    else if (a5 >= v14 && a5 - v14 < v15)
    {
      [(PKPassGroupStackView *)self stageGroupInPresentationState:1 atIndex:a5];
    }
    id v23 = [(PKPassGroupStackView *)self _groupViewAtIndex:a5];
    dispatch_time_t v24 = dispatch_time(0, 250000000);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52__PKPassGroupStackView_moveGroup_fromIndex_toIndex___block_invoke_2;
    v27[3] = &unk_1E59CA8E8;
    id v28 = v23;
    id v29 = self;
    id v30 = v11;
    id v25 = v11;
    id v26 = v23;
    dispatch_after(v24, MEMORY[0x1E4F14428], v27);
  }
}

void __52__PKPassGroupStackView_moveGroup_fromIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 group];
  double v4 = *(void **)(*(void *)(a1 + 32) + 2496);
  unint64_t v5 = [v3 groupID];
  double v6 = [v4 objectForKeyedSubscript:v5];
  if (v6)
  {
  }
  else
  {
    id v7 = *(void **)(a1 + 40);

    if (v3 != v7) {
      [*(id *)(a1 + 32) _updateGroupView:v8 toPresentationState:4 withSpringFactory:*(void *)(a1 + 48)];
    }
  }
}

void __52__PKPassGroupStackView_moveGroup_fromIndex_toIndex___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) group];
  id v13 = [v2 groupID];

  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 2080) == 4)
  {
    unint64_t v4 = [(id)v3 _indexOfGroupView:*(void *)(a1 + 32)];
    unint64_t v5 = [*(id *)(a1 + 40) _rangeOfVisibleIndexes];
    unint64_t v7 = v6;
    id v8 = (void *)[*(id *)(a1 + 40) _createStackedIndices];
    id v9 = v8;
    BOOL v10 = v4 < v5 || v4 - v5 >= v7;
    if (v10 && ![v8 containsIndex:v4])
    {
      [*(id *)(a1 + 40) _removeGroupViewAsSubviewWithGroupID:v13];
    }
    else
    {
      [*(id *)(a1 + 40) _arrangeGroups];
      id v11 = *(void **)(a1 + 32);
      if (v11)
      {
        [v11 applyContentModesAnimated:0];
        [*(id *)(a1 + 40) _updateGroupStateForGroupViewInStackPresentation:*(void *)(a1 + 32) animated:1];
        [*(id *)(a1 + 40) _updateGroupView:*(void *)(a1 + 32) toPresentationState:4 withSpringFactory:*(void *)(a1 + 48)];
      }
    }

    uint64_t v3 = *(void *)(a1 + 40);
  }
  if (v13)
  {
    [*(id *)(v3 + 2496) removeObjectForKey:v13];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  BOOL v12 = (*(_DWORD *)(v3 + 2504))-- == 1;
  [(id)v3 setUserInteractionEnabled:v12];
}

- (void)presentPassWithUniqueID:(id)a3
{
}

- (void)presentPassWithUniqueID:(id)a3 withContext:(id)a4 animated:(BOOL)a5
{
}

- (void)presentDiff:(id)a3 completion:(id)a4
{
}

- (void)setTableModalPresentationEnabled:(BOOL)a3 animated:(BOOL)a4
{
  p_layoutState = &self->_layoutState;
  if (!self->_layoutState.groups.count
    || (BOOL v5 = a4, v6 = a3, ![(PKPassGroupStackView *)self isTableModalPresentation]))
  {
    *((_WORD *)p_layoutState + 32) &= ~1u;
    return;
  }
  __int16 v8 = *((_WORD *)p_layoutState + 32);
  if (v6)
  {
    *((_WORD *)p_layoutState + 32) = v8 & 0xFFFE;
    if ((self->_presentationState | 2) != 7) {
      return;
    }
    [(PKPassGroupStackView *)self setModalGroupIndex:0x7FFFFFFFFFFFFFFFLL];
    id v9 = self;
    uint64_t v10 = 4;
  }
  else
  {
    *((_WORD *)p_layoutState + 32) = v8 | 1;
    if (self->_presentationState != 4) {
      return;
    }
    [(PKPassGroupStackView *)self setModalGroupIndex:0];
    id v9 = self;
    uint64_t v10 = 5;
  }

  [(PKPassGroupStackView *)v9 setPresentationState:v10 animated:v5];
}

- (id)headerForPassType:(unint64_t)a3
{
  uint64_t v3 = [(PKPassGroupStackView *)self _headerContextForPassType:a3];
  unint64_t v4 = v3;
  if (v3) {
    uint64_t v3 = (void *)v3[5];
  }
  BOOL v5 = v3;

  return v5;
}

- (void)setFooterSuppressed:(BOOL)a3
{
}

- (int64_t)pilingMode
{
  return self->_layoutState.pilingMode;
}

- (void)setPilingMode:(int64_t)a3
{
  p_layoutState = &self->_layoutState;
  if (self->_layoutState.pilingMode != a3)
  {
    self->_layoutState.int64_t pilingMode = a3;
    *((_WORD *)&self->_layoutState + 32) |= 0x2000u;
    [(PKPassGroupStackView *)self layoutContentForCurrentPresentationState:1];
    *((_WORD *)p_layoutState + 32) &= ~0x2000u;
  }
}

- (double)pileHeight
{
  [(PKPassGroupStackView *)self _pileAscenderHeight];
  double v4 = v3;
  [(PKPassGroupStackView *)self _pileBaseHeight];
  double v6 = v4 + v5;
  featuredGroupID = self->_featuredGroupID;
  if (featuredGroupID)
  {
    modallyPresentedGroupView = self->_modallyPresentedGroupView;
    if (modallyPresentedGroupView)
    {
      id v9 = [(PKPassGroupView *)modallyPresentedGroupView group];
      uint64_t v10 = [v9 groupID];
      char v11 = [(NSNumber *)featuredGroupID isEqual:v10];

      if ((v11 & 1) == 0)
      {
        BOOL v12 = [(PKPassGroupView *)self->_modallyPresentedGroupView frontmostPassView];
        id v13 = [v12 pass];
        uint64_t v14 = [v13 style];

        if (v14 == 6)
        {
          [(PKPassGroupStackView *)self _pileSeparationHeight];
          return v6 - v15 + 44.0;
        }
      }
    }
  }
  return v6;
}

- (BOOL)isModallyPresentedPassAuthorized
{
  return [(PKPassFooterView *)self->_passFooterView isPassAuthorized];
}

- (BOOL)isReordering
{
  return *(unsigned char *)&self->_reorderingFlags & 1;
}

- (BOOL)isViewCurrentlyPresentedFooterView:(id)a3
{
  return [(PKPassFooterView *)self->_passFooterView isViewCurrentContentView:a3];
}

- (void)updateFooterViewIfNecessary
{
  footerView = self->_footerView;
  if (footerView)
  {
    groupsController = self->_groupsController;
    double v5 = footerView;
    uint64_t v6 = [(PKGroupsController *)groupsController expiredSectionPassesCount];
    [(UIView *)v5 setExpiredSectionCount:v6];

    if (!v6)
    {
      int64_t presentationState = self->_presentationState;
      [(PKPassGroupStackView *)self setPresentationState:presentationState animated:1];
    }
  }
}

- (void)invalidate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    double v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      passFooterView = self->_passFooterView;
      int v7 = 134349312;
      __int16 v8 = self;
      __int16 v9 = 2050;
      uint64_t v10 = passFooterView;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPassGroupStackView (%{public}p:%{public}p): invalidated.", (uint8_t *)&v7, 0x16u);
    }

    self->_invalidated = 1;
    double v5 = self->_passFooterView;
    if (v5)
    {
      [(PKPassFooterView *)v5 setDelegate:0];
      [(PKPassFooterView *)self->_passFooterView invalidate];
      [(PKPassFooterView *)self->_passFooterView removeFromSuperview];
      uint64_t v6 = self->_passFooterView;
      self->_passFooterView = 0;
    }
    if ([(NSMutableDictionary *)self->_groupViewsByGroupID count]) {
      [(NSMutableDictionary *)self->_groupViewsByGroupID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_86];
    }
    if ([(NSMutableDictionary *)self->_animatorsByGroupID count]) {
      [(NSMutableDictionary *)self->_animatorsByGroupID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_89];
    }
  }
}

uint64_t __34__PKPassGroupStackView_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

void __34__PKPassGroupStackView_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(PKPassGroupStackView *)self isUserInteractionEnabled])
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPassGroupStackView;
    __int16 v8 = -[PKPassGroupStackView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
    __int16 v8 = 0;
  }

  return v8;
}

- (BOOL)_loadModalGroupViewIfNecessaryInInitialState:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  uint64_t v6 = [WeakRetained groupAtIndex:self->_modalGroupIndex];

  if (v6)
  {
    id v7 = [(PKPassGroupStackView *)self _groupViewWithGroup:v6];
    if (v7)
    {
      __int16 v8 = v7;
      BOOL v9 = 1;
    }
    else
    {
      char v11 = 0;
      __int16 v8 = [(PKPassGroupStackView *)self _loadGroupViewAtIndex:self->_modalGroupIndex forState:a3 presentationState:1 cached:&v11];
      [v8 applyContentModesAnimated:0];
      BOOL v9 = v11 != 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __56__PKPassGroupStackView__addGroupViewAsSubview_forIndex___block_invoke(void *a1, void *a2, unint64_t a3)
{
  id v12 = a2;
  uint64_t v6 = [v12 superview];
  id v7 = *(void **)(a1[4] + 2576);

  if (v6 == v7)
  {
    unint64_t v8 = a1[7];
    if (v8 > a3)
    {
      BOOL v9 = (id *)(*(void *)(a1[5] + 8) + 40);
LABEL_4:
      objc_storeStrong(v9, a2);
      goto LABEL_7;
    }
    if (v8 < a3)
    {
      uint64_t v10 = *(void *)(a1[6] + 8);
      uint64_t v11 = *(void *)(v10 + 40);
      BOOL v9 = (id *)(v10 + 40);
      if (!v11) {
        goto LABEL_4;
      }
    }
  }
LABEL_7:
}

- (void)_removeGroupViewAsSubviewWithGroupID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    double v5 = [(NSMutableDictionary *)self->_groupViewsByGroupID objectForKeyedSubscript:v4];
    if (v5)
    {
      modallyPresentedGroupView = self->_modallyPresentedGroupView;
      [(PKPassGroupStackView *)self _removePanGestureRecognizerFromGroupView:v5];
      [(PKPassGroupView *)v5 removeFromSuperview];
      [(NSMutableDictionary *)self->_groupViewsByGroupID removeObjectForKey:v8];
      if (modallyPresentedGroupView && v5 == modallyPresentedGroupView) {
        [(PKPassGroupStackView *)self setModalGroupIndex:0x7FFFFFFFFFFFFFFFLL];
      }
    }

    id v4 = v8;
  }
}

- (void)_generateModalGroupPileWithVisibleIndexes:(_NSRange)a3 reservePlaceForModalGroup:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  passPileViews = self->_passPileViews;
  self->_passPileViews = v8;

  uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  if (location < location + length)
  {
    while ([(PKPassGroupStackView *)self _isGroupAtIndexInModalPile:location])
    {
LABEL_10:
      ++location;
      if (!--length) {
        goto LABEL_11;
      }
    }
    uint64_t v10 = [(PKPassGroupStackView *)self _groupViewAtIndex:location];
    uint64_t v11 = v10;
    if (!v10 || v10 == self->_modallyPresentedGroupView)
    {
      if (!v4)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v12 = self->_passPileViews;
      id v13 = v20;
    }
    else
    {
      id v12 = self->_passPileViews;
      id v13 = v11;
    }
    [(NSMutableArray *)v12 insertObject:v13 atIndex:0];
    goto LABEL_9;
  }
LABEL_11:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_datasource);
    double v17 = [v16 featuredGroup];
    double v18 = [v17 groupID];
    featuredGroupID = self->_featuredGroupID;
    self->_featuredGroupID = v18;
  }
  else
  {
    id v16 = self->_featuredGroupID;
    self->_featuredGroupID = 0;
  }
}

uint64_t __78__PKPassGroupStackView__presentOffscreenAnimated_split_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_presentModalGroupView:(id)a3 withState:(int64_t)a4 animated:(BOOL)a5 context:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  id v73 = a7;
  [(PKPassGroupStackView *)self _refreshBacklightForFrontmostPassGroup];
  [(PKPassGroupStackView *)self _arrangeGroups];
  self->_int64_t presentationState = a4;
  long long v74 = v12;
  [(PKPassGroupStackView *)self _setModalGroupView:v12];
  if (a4 == 7)
  {
    passPileViews = self->_passPileViews;
    self->_passPileViews = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
    [WeakRetained beginPinningExternalPresentationNavigationHeight];
  }
  else
  {
    uint64_t v16 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexesIgnoringBottomInset:1];
    -[PKPassGroupStackView _generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:](self, "_generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:", v16, v17, 0);
  }
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView
    && [(PKPassGroupView *)modallyPresentedGroupView presentationState] != 3
    && (*((_WORD *)&self->_layoutState + 32) & 0x400) == 0)
  {
    [(PKPassGroupView *)self->_modallyPresentedGroupView setPresentationState:3 withContext:v13 animated:v9];
    [(PKPassGroupView *)self->_modallyPresentedGroupView sizeToFit];
  }
  id v19 = 0;
  p_loanedGroupView = &self->_loanedGroupView;
  BOOL v21 = self->_loanedGroupView != self->_modallyPresentedGroupView;
  if (a4 == 7 && v9) {
    id v19 = [(PKPassGroupStackView *)self _createFactoryForExternalPresentation];
  }
  if (v9) {
    double v22 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
  }
  else {
    double v22 = 0;
  }
  id v23 = (void *)MEMORY[0x1A6224460]();
  if (a4 == 7)
  {
    [(PKPassGroupStackView *)self _setupSpringFactoryForTableToExternalAnimations:v22];
  }
  else if ((*((__int16 *)&self->_layoutState + 32) & 0x80000000) == 0)
  {
    [(PKPassGroupStackView *)self _setupSpringFactory:v22 forPileAnimationToPresentationState:5 reverse:0];
    double v25 = v24;
    goto LABEL_19;
  }
  double v25 = 0.0;
LABEL_19:
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke;
  v99[3] = &unk_1E59D60D8;
  v99[4] = self;
  int64_t v103 = a4;
  BOOL v104 = v9;
  id v26 = (PKPassPresentationContext *)v13;
  CGFloat v100 = v26;
  BOOL v105 = a4 == 7;
  BOOL v106 = v21;
  id v27 = v19;
  id v101 = v27;
  id v28 = v22;
  id v102 = v28;
  [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v99];

  [v27 setAnimationDelayHandler:0];
  [v27 duration];
  double v30 = v29;
  [v28 duration];
  double v32 = v25 + fmax(v30, v31);
  long long v75 = [(PKPassGroupView *)self->_modallyPresentedGroupView frontmostPassView];
  [v75 updateValidityDisplay];
  id v33 = [(PKPassGroupView *)self->_modallyPresentedGroupView layer];
  objc_msgSend(v33, "pkui_remainingDurationForAnimationWithKey:", @"modalPanGestureRecovery");
  double v35 = v34;

  if (v32 > v35) {
    double v35 = v32;
  }
  char v36 = (PKNavigationDashboardPassViewController *)objc_loadWeakRetained((id *)&self->_externalVC);
  double v37 = v36;
  if (a4 != 7 || v36)
  {
    if (a4 != 7) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
  double v38 = [(UIView *)self pkui_viewControllerFromResponderChain];
  if (!v26) {
    id v26 = objc_alloc_init(PKPassPresentationContext);
  }
  double v37 = [[PKNavigationDashboardPassViewController alloc] initWithPassGroupView:self->_modallyPresentedGroupView groupsController:self->_groupsController groupViewReceiver:self context:v26];
  [(PKNavigationDashboardPassViewController *)v37 setPassDashboardDelegate:self];
  objc_storeWeak((id *)&self->_externalVC, v37);
  [(PKPassGroupView *)*p_loanedGroupView setLoaned:0];
  if (v38 && v37)
  {
    unsigned int externalPresentationTag = self->_externalPresentationTag;
    objc_storeStrong((id *)&self->_loanedGroupView, self->_modallyPresentedGroupView);
    [(PKPassGroupView *)*p_loanedGroupView setLoaned:1];
    [(PKPassGroupStackView *)self reloadSuppressedContentForGroupView:*p_loanedGroupView];
    if (v9)
    {
      objc_initWeak(&location, self);
      uint64_t v92 = 0;
      v93 = &v92;
      uint64_t v94 = 0x3032000000;
      v95 = __Block_byref_object_copy__30;
      v96 = __Block_byref_object_dispose__30;
      id v97 = 0;
      uint64_t v86 = 0;
      double v87 = &v86;
      uint64_t v88 = 0x3032000000;
      v89 = __Block_byref_object_copy__30;
      v90 = __Block_byref_object_dispose__30;
      id v91 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_2;
      aBlock[3] = &unk_1E59D6100;
      void aBlock[4] = &v86;
      void aBlock[5] = &v92;
      double v39 = (void (**)(void *, void *))_Block_copy(aBlock);
      id v40 = [(PKPassGroupStackView *)self headerForPassType:1];
      v39[2](v39, v40);

      if (!v87[5])
      {
        double v41 = [(PKPassGroupStackView *)self headerForPassType:0];
        v39[2](v39, v41);
      }
      id v42 = [(id)v93[5] superview];
      interstitialController = self->_interstitialController;
      if (!interstitialController) {
        goto LABEL_40;
      }
      if ([(PKPGSVTransitionInterstitialController *)interstitialController isInvalidated])
      {
        id v44 = self->_interstitialController;
        self->_interstitialController = 0;
      }
      long long v45 = self->_interstitialController;
      if (v45)
      {
        unsigned int v46 = v45;
        if (v42)
        {
          v83[0] = MEMORY[0x1E4F143A8];
          v83[1] = 3221225472;
          v83[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_3;
          v83[3] = &unk_1E59D0F90;
          objc_copyWeak(&v84, &location);
          [(PKPGSVTransitionInterstitialController *)v46 transferToView:v42 withDeactivationHandler:v83];
          objc_destroyWeak(&v84);
        }
      }
      else
      {
LABEL_40:
        unsigned int v46 = 0;
        if (!v87[5] || !v42) {
          goto LABEL_62;
        }
        unsigned int v48 = [v42 layer];
        long long v71 = v42;
        uint64_t v49 = [v48 presentationLayer];
        char v50 = (void *)v49;
        BOOL v51 = v49 ? (void *)v49 : v48;
        id v52 = v51;

        double v70 = v52;
        [v52 opacity];
        float v54 = v53;
        double v55 = [(id)v93[5] layer];

        uint64_t v56 = [v55 presentationLayer];
        id v57 = (void *)v56;
        id v69 = v39;
        int64_t v58 = v56 ? (void *)v56 : v55;
        id v59 = v58;

        [v59 opacity];
        double v61 = v54 * v60;

        unsigned int v46 = 0;
        BOOL v62 = *(uint64_t *)&v61 <= -1 || ((*(void *)&v61 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF;
        BOOL v63 = v62 && (unint64_t)(*(void *)&v61 - 1) >= 0xFFFFFFFFFFFFFLL;
        BOOL v64 = !v63 || (*(void *)&v61 & 0x7FFFFFFFFFFFFFFFLL) == 0;
        id v42 = v71;
        if (!v64) {
          goto LABEL_62;
        }
        if (v61 > 1.0) {
          goto LABEL_62;
        }
        uint64_t v65 = v87[5];
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_4;
        v81[3] = &unk_1E59D0F90;
        objc_copyWeak(&v82, &location);
        unsigned int v46 = +[PKPGSVTransitionInterstitialController createInView:v71 withProvider:v65 containerAlpha:v81 deactivationHandler:v61];
        objc_destroyWeak(&v82);
        id v42 = v71;
        if (!v46)
        {
LABEL_62:
          if (objc_opt_respondsToSelector()) {
            [(PKNavigationDashboardPassViewController *)v37 setTransitionDuration:v35];
          }
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_5;
          v78[3] = &unk_1E59D1888;
          objc_copyWeak(&v79, &location);
          unsigned int v80 = externalPresentationTag;
          [v38 presentViewController:v37 animated:1 completion:v78];
          objc_destroyWeak(&v79);

          _Block_object_dispose(&v86, 8);
          _Block_object_dispose(&v92, 8);

          objc_destroyWeak(&location);
          goto LABEL_65;
        }
      }
      -[PKNavigationDashboardPassViewController interstitialControllerAvailable:](v37, "interstitialControllerAvailable:", v46, v69);
      goto LABEL_62;
    }
    [(PKNavigationDashboardPassViewController *)v37 groupViewIsAvailable:self->_modallyPresentedGroupView];
    [v38 presentViewController:v37 animated:0 completion:0];
  }
  else
  {
    double v47 = *p_loanedGroupView;
    *p_loanedGroupView = 0;
  }
LABEL_65:

LABEL_66:
  id v66 = objc_loadWeakRetained((id *)&self->_datasource);
  [v66 endPinningExternalPresentationNavigationHeight];

LABEL_67:
  dispatch_time_t v67 = dispatch_time(0, (uint64_t)(v35 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_6;
  block[3] = &unk_1E59CAA98;
  id v77 = v73;
  id v68 = v73;
  dispatch_after(v67, MEMORY[0x1E4F14428], block);
}

void __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  [*(id *)(a1 + 32) _updateGroupStateForGroupViewInModalPresentation:v14 withState:*(void *)(a1 + 64) animated:*(unsigned __int8 *)(a1 + 72) withContext:*(void *)(a1 + 40)];
  double v3 = v14;
  BOOL v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 73) && (id)v4[262] == v14)
  {
    if (!*(unsigned char *)(a1 + 74)) {
      goto LABEL_15;
    }
    [v4 _updateModalGroupViewFromTableToExternalPresentationWithFactory:*(void *)(a1 + 48)];
    goto LABEL_14;
  }
  unint64_t v5 = [v4 _indexOfGroupView:v14];
  unint64_t v6 = v5;
  id v7 = *(void **)(a1 + 48);
  id v8 = *(void **)(a1 + 32);
  if (!v7 || ((unint64_t v9 = v8[264], v9 != 0x7FFFFFFFFFFFFFFFLL) ? (v10 = v5 >= v9) : (v10 = 1), v10)) {
    id v7 = *(void **)(a1 + 56);
  }
  uint64_t v11 = *(void *)(a1 + 64);
  id v12 = v7;
  [v8 _updateGroupView:v14 toPresentationState:v11 withSpringFactory:v12 atIndex:v6];
  id v13 = *(id *)(*(void *)(a1 + 32) + 2096);

  double v3 = v14;
  if (v13 == v14)
  {
    [v14 updatePageControlFrameAnimated:v12 != 0];
LABEL_14:
    double v3 = v14;
  }
LABEL_15:
}

void __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = [v4 interstitialProvider];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v4 = v8;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      id v4 = v8;
    }
  }
}

void __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 267) == v5)
  {
    *((void *)WeakRetained + 267) = 0;
  }
}

void __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 267) == v5)
  {
    *((void *)WeakRetained + 267) = 0;
  }
}

void __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[594] == *(_DWORD *)(a1 + 40))
  {
    double v3 = WeakRetained;
    [WeakRetained _hideBackdropViewAnimated:0 delay:0.0];
    id WeakRetained = v3;
  }
}

uint64_t __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_presentModalGroupViewPostAnimationActions
{
  if ((*((_WORD *)&self->_layoutState + 32) & 0x200) == 0) {
    [(PKPassthroughView *)self->_passContainerView bringSubviewToFront:self->_modallyPresentedGroupView];
  }

  [(PKPassGroupStackView *)self tilePassesEagerly:0];
}

uint64_t __90__PKPassGroupStackView__presentGroupStackViewWithAnimation_priorBounds_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_createFactoryForExternalPresentation
{
  [(PKPassGroupStackView *)self _positionForGroupView:self->_modallyPresentedGroupView atIndex:[(PKPassGroupStackView *)self _indexOfGroupView:self->_modallyPresentedGroupView] forState:7];
  double v4 = v3;
  id v5 = [(PKPassGroupView *)self->_modallyPresentedGroupView layer];
  [v5 position];
  double v7 = vabdd_f64(v4, v6);
  double v8 = fmin(fmax((v7 + -100.0) / 500.0, 0.0), 1.0);
  double v9 = fmin(fmax((v7 + -50.0) / 550.0, 0.0), 1.0);
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F88168]) initWithMass:1.0 stiffness:(v8 * 0.85 + (1.0 - v8) * 1.05) * 178.85569 damping:(1.0 - v9 + v9 * 1.15) * 18.18598];

  return v10;
}

- (void)_updateModalGroupViewFromTableToExternalPresentationWithFactory:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKPassGroupStackView *)self _indexOfGroupView:self->_modallyPresentedGroupView];
  [(PKPassGroupStackView *)self _positionForGroupView:self->_modallyPresentedGroupView atIndex:v5 forState:7];
  double v7 = v6;
  double v9 = v8;
  [(PKPassGroupStackView *)self _transformForGroupView:self->_modallyPresentedGroupView atIndex:v5 forState:7];
  BOOL v10 = [(PKPassGroupView *)self->_modallyPresentedGroupView layer];
  [v10 position];
  double v12 = v11;
  double v14 = v13;
  char v15 = [v4 highFrameRateSpringAnimationWithKeyPath:@"position" reason:1];
  objc_msgSend(v15, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v12, v14, v7, v9);
  id v16 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v15);
  memset(v29, 0, sizeof(v29));
  if (v10) {
    [v10 transform];
  }
  CATransform3D a = v29[0];
  CATransform3D v27 = v29[1];
  if (!CATransform3DEqualToTransform(&a, &v27))
  {
    uint64_t v17 = [v4 highFrameRateSpringAnimationWithKeyPath:@"transform" reason:1];
    CATransform3D a = v29[0];
    CATransform3D v27 = v29[1];
    objc_msgSend(v17, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v27);
    [v17 setBeginTime:0.13];
    id v18 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v17);
  }
  [v10 opacity];
  double v20 = v19;
  [(PKPassGroupStackView *)self _opacityForGroupAtIndex:v5 withGroupView:self->_modallyPresentedGroupView forState:self->_presentationState];
  if (v21 != v20)
  {
    double v22 = v21;
    id v23 = [v4 springAnimationForView:self->_modallyPresentedGroupView withKeyPath:@"opacity"];
    double v25 = v23;
    if (v23)
    {
      objc_msgSend(v23, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v20, v22);
      id v26 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v25);
    }
    *(float *)&double v24 = v22;
    [v10 setOpacity:v24];
  }
  objc_msgSend(v10, "setPosition:", v7, v9);
  CATransform3D a = v29[1];
  [v10 setTransform:&a];
  [(PKPassGroupView *)self->_modallyPresentedGroupView updatePageControlFrameAnimated:v4 != 0];
}

- (id)_dismissModalGroupViewFromExternalToState:(int64_t)a3
{
  unint64_t v5 = [(PKPassGroupStackView *)self _indexOfGroupView:self->_modallyPresentedGroupView];
  [(PKPassGroupStackView *)self _positionForGroupView:self->_modallyPresentedGroupView atIndex:v5 forState:a3];
  double v7 = v6;
  double v9 = v8;
  memset(&v25[1], 0, sizeof(CATransform3D));
  [(PKPassGroupStackView *)self _transformForGroupView:self->_modallyPresentedGroupView atIndex:v5 forState:a3];
  BOOL v10 = [(PKPassGroupView *)self->_modallyPresentedGroupView layer];
  [v10 position];
  double v13 = v12;
  double v14 = v11;
  if (self->_modalGroupViewDragging)
  {
    double v15 = 0.0;
    if (vabdd_f64(v9, v11) > 1.0) {
      double v15 = self->_modalGroupViewVelocity * 0.65 / (v9 - v11);
    }
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F88168]) initWithMass:1.0 stiffness:178.85569 damping:20.004578];
    [v16 setVelocity:v15];
  }
  else
  {
    id v16 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
  }
  if (v7 != v13 || v9 != v14)
  {
    id v18 = [v16 highFrameRateSpringAnimationWithKeyPath:@"position" reason:1];
    objc_msgSend(v18, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v13, v14, v7, v9);
    id v19 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v18);
  }
  memset(v25, 0, 128);
  if (v10) {
    [v10 transform];
  }
  CATransform3D a = v25[0];
  CATransform3D v23 = v25[1];
  if (!CATransform3DEqualToTransform(&a, &v23))
  {
    double v20 = [MEMORY[0x1E4F85060] highFrameRateSpringAnimationWithKeyPath:@"transform" reason:1];
    CATransform3D a = v25[0];
    CATransform3D v23 = v25[1];
    objc_msgSend(v20, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v23);
    id v21 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v20);
  }
  objc_msgSend(v10, "setPosition:", v7, v9);
  CATransform3D a = v25[1];
  [v10 setTransform:&a];
  [(PKPassGroupView *)self->_modallyPresentedGroupView updatePageControlFrameAnimated:v16 != 0];

  return v16;
}

- (void)_presentPassIngestionWithAnimation:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(PKPassGroupStackView *)self setScrollEnabled:0];
  if ([(PKPassGroupStackView *)self _loadModalGroupViewIfNecessaryInInitialState:1])
  {
    [(PKPassGroupView *)self->_modallyPresentedGroupView sizeToFit];
    double v7 = [(PKPassGroupView *)self->_modallyPresentedGroupView layer];
    [v7 removeAllAnimations];

    [(PKPassGroupStackView *)self _updateGroupView:self->_modallyPresentedGroupView toPresentationState:1 withSpringFactory:0];
    [(PKPassGroupView *)self->_modallyPresentedGroupView updatePageControlFrameAnimated:0];
  }
  [MEMORY[0x1E4F39CF8] begin];
  if (v4) {
    double v8 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
  }
  else {
    double v8 = 0;
  }
  [(PKPassGroupStackView *)self _updateGroupView:self->_modallyPresentedGroupView toPresentationState:6 withSpringFactory:v8];
  double v9 = (void *)MEMORY[0x1E4F39CF8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__PKPassGroupStackView__presentPassIngestionWithAnimation_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E59CAA98;
  id v12 = v6;
  id v10 = v6;
  [v9 setCompletionBlock:v11];
  [MEMORY[0x1E4F39CF8] commit];
  [(PKPassGroupView *)self->_modallyPresentedGroupView setPresentationState:3 animated:0];
  [(PKPassGroupView *)self->_modallyPresentedGroupView updatePageControlFrameAnimated:v4];
  self->_int64_t presentationState = 6;
}

uint64_t __81__PKPassGroupStackView__presentPassIngestionWithAnimation_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_acquireGroupView:(id)a3 resetExternalVC:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (PKPassGroupView *)a3;
  double v7 = v6;
  if (v6 && self->_loanedGroupView == v6)
  {
    self->_loanedGroupView = 0;

    ++self->_externalPresentationTag;
    double v9 = [(PKPassGroupView *)v7 group];
    id v10 = [(PKPassGroupStackView *)self _groupViewWithGroup:v9];

    double v11 = [(PKPassGroupView *)v7 superview];
    passContainerView = self->_passContainerView;

    if (v10 == v7 || v11 == passContainerView)
    {
      [(PKPassGroupView *)v7 setLoaned:0];
      [(PKPassGroupView *)v7 setDelegate:self];
      [(PKPassGroupView *)v7 addPassGroupViewObserver:self];
      if (v11 != passContainerView)
      {
        [(PKPassthroughView *)self->_passContainerView addSubview:v7];
        [(PKPassGroupStackView *)self _arrangeGroups];
      }
      [(PKPassGroupStackView *)self _positionForGroupView:v7 atIndex:[(PKPassGroupStackView *)self _indexOfGroupView:v7] forState:self->_presentationState];
      double v14 = v13;
      double v16 = v15;
      uint64_t v17 = [(PKPassGroupView *)v7 layer];
      objc_msgSend(v17, "setPosition:", v14, v16);

      [(PKPassGroupStackView *)self reloadSuppressedContentForGroupView:v7];
    }
    [(PKPassGroupStackView *)self _hideBackdropViewAnimated:0 delay:0.0];
    if (v4)
    {
      p_externalVC = &self->_externalVC;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_externalVC);
      objc_storeWeak((id *)p_externalVC, 0);
      if (WeakRetained)
      {
        [WeakRetained setReceiver:0];
        [WeakRetained setPassDashboardDelegate:0];
        [WeakRetained invalidate];
        double v20 = ViewControllerPresentingViewController(WeakRetained);
        [v20 dismissViewControllerAnimated:0 completion:0];
      }
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_updatePassFooterViewWithContext:(id)a3
{
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  id v5 = a3;
  id v7 = [(PKPassGroupView *)modallyPresentedGroupView frontmostPassView];
  id v6 = [(PKPassGroupStackView *)self _createPassFooterConfigurationForPassView:v7 withContext:v5];
  [(PKPassGroupStackView *)self _updatePassFooterViewWithConfiguration:v6 context:v5 animated:1 reload:1 delay:0.0];
}

void __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = *((_DWORD *)v3 + 638) - 1;
    *((_DWORD *)v3 + 638) = v4;
    if (*(unsigned char *)(a1 + 36))
    {
      if (*((_DWORD *)v3 + 639) == *(_DWORD *)(a1 + 32))
      {
        id v7 = v3;
        id v5 = (void *)*((void *)v3 + 316);
        BOOL v6 = *(unsigned char *)(a1 + 38) != 0;
        if (*(unsigned char *)(a1 + 37)) {
          [v5 didBecomeVisibleAnimated:v6];
        }
        else {
          [v5 didBecomeHiddenAnimated:v6];
        }
        id v3 = v7;
      }
      int v4 = *((_DWORD *)v3 + 638);
    }
    if (!v4 && !*((unsigned char *)v3 + 2536))
    {
      id v8 = v3;
      [*((id *)v3 + 316) configureWithConfiguration:0 context:0 options:0];
      id v3 = v8;
    }
  }
}

void __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && *((_DWORD *)v5 + 639) == *(_DWORD *)(a1 + 56))
  {
    id v7 = (void *)v5[316];
    double v8 = *(double *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_3;
    v9[3] = &unk_1E59CB0D8;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    id v10 = *(id *)(a1 + 32);
    objc_msgSend(v7, "pkui_setAlpha:withAnimationFactory:completion:", v6, v9, v8);

    objc_destroyWeak(&v11);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_animatorForGestureRecognizer:(id)a3
{
  int v4 = [a3 view];
  id v5 = [v4 group];
  id v6 = [v5 groupID];

  id v7 = [(NSMutableDictionary *)self->_animatorsByGroupID objectForKey:v6];

  return v7;
}

- (void)_addPanGestureRecognizerToGroupView:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && !self->_invalidated)
  {
    id v6 = [v4 group];
    id v7 = [v6 groupID];

    double v8 = [(NSMutableDictionary *)self->_animatorsByGroupID objectForKeyedSubscript:v7];
    if (!v8)
    {
      double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__handleModalGroupGesture_];
      double v8 = -[PKPassGroupViewVerticalPanAnimator initWithGroupView:gestureRecognizer:]((id *)[PKPassGroupViewVerticalPanAnimator alloc], v5, v9);
      objc_initWeak(&location, self);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      double v13 = __60__PKPassGroupStackView__addPanGestureRecognizerToGroupView___block_invoke;
      double v14 = &unk_1E59D61C0;
      objc_copyWeak(&v15, &location);
      if (v8) {
        objc_setProperty_nonatomic_copy(v8, v10, &v11, 80);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_animatorsByGroupID, "setObject:forKeyedSubscript:", v8, v7, v11, v12, v13, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __60__PKPassGroupStackView__addPanGestureRecognizerToGroupView___block_invoke(uint64_t a1, void *a2, long long *a3, double a4, double a5)
{
  double v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    double v11 = 0.0;
    if (v8) {
      double v11 = v8[13];
    }
    objc_msgSend(*((id *)WeakRetained + 316), "setAlpha:", *((double *)WeakRetained + 318) * (1.0 - fmax(fmin((a5 - v11) / 80.0, 1.0), 0.0)));
    [v10 _yForGroupInModalPileWithModalGroupY:a5];
    uint64_t v12 = v10[260];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__PKPassGroupStackView__addPanGestureRecognizerToGroupView___block_invoke_2;
    v18[3] = &unk_1E59D6198;
    void v18[4] = v10;
    v18[5] = v12;
    v18[6] = v13;
    long long v14 = a3[3];
    long long v21 = a3[2];
    long long v22 = v14;
    long long v15 = a3[1];
    long long v19 = *a3;
    long long v20 = v15;
    long long v16 = a3[6];
    long long v26 = a3[7];
    long long v25 = v16;
    long long v17 = a3[4];
    long long v24 = a3[5];
    long long v23 = v17;
    [v10 _enumerateLoadedGroupViews:v18];
    [v10 _updateTopContentSeparatorVisibilityAnimated:0];
    [v10 _updateBottomContentSeparatorVisibilityAnimated:0];
  }
}

void __60__PKPassGroupStackView__addPanGestureRecognizerToGroupView___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) _isGroupAtIndexInModalPile:a3])
  {
    memset(&v15, 0, sizeof(v15));
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      [v6 _transformForGroupView:v5 atIndex:a3 forState:*(void *)(a1 + 40)];
    }
    id v7 = [v5 layer];
    [v7 position];
    objc_msgSend(v7, "setPosition:");
    long long v8 = *(_OWORD *)(a1 + 136);
    *(_OWORD *)&a.m31 = *(_OWORD *)(a1 + 120);
    *(_OWORD *)&a.m33 = v8;
    long long v9 = *(_OWORD *)(a1 + 168);
    *(_OWORD *)&a.m41 = *(_OWORD *)(a1 + 152);
    *(_OWORD *)&a.m43 = v9;
    long long v10 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)&a.m11 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)&a.m13 = v10;
    long long v11 = *(_OWORD *)(a1 + 104);
    *(_OWORD *)&a.m21 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)&a.m23 = v11;
    CATransform3D v12 = v15;
    CATransform3DConcat(&v14, &a, &v12);
    [v7 setTransform:&v14];
  }
}

- (void)_removePanGestureRecognizerFromGroupView:(id)a3
{
  if (a3)
  {
    id v4 = [a3 group];
    id v6 = [v4 groupID];

    id v5 = [(NSMutableDictionary *)self->_animatorsByGroupID objectForKeyedSubscript:v6];
    if (v5)
    {
      [(NSMutableDictionary *)self->_animatorsByGroupID setObject:0 forKeyedSubscript:v6];
      -[PKPassGroupViewVerticalPanAnimator invalidate]((uint64_t)v5);
    }
  }
}

- (void)_handleModalGroupGesture:(id)a3
{
  id v10 = a3;
  id v4 = (void *)MEMORY[0x1A6224460]();
  id v5 = [(PKPassGroupStackView *)self _animatorForGestureRecognizer:v10];
  if (v5)
  {
    int64_t presentationState = self->_presentationState;
    if (presentationState == 5)
    {
      uint64_t v7 = [v10 state];
      if ((unint64_t)(v7 - 3) < 2)
      {
        [(PKPassGroupStackView *)self _endGroupPanWithAnimator:v5];
        goto LABEL_9;
      }
      if (v7 == 2) {
        goto LABEL_7;
      }
      if (v7 == 1)
      {
        [(PKPassGroupStackView *)self _beginGroupPanWithAnimator:v5];
LABEL_7:
        long long v8 = [v10 view];
        [v10 translationInView:v8];
        -[PKPassGroupViewVerticalPanAnimator layoutViewsWithY:]((uint64_t)v5, v9 + v5[13]);
      }
    }
LABEL_9:
    -[PKPassGroupViewVerticalPanAnimator updateRecognizingWithAllowed:]((uint64_t)v5, presentationState == 5);
  }
}

- (void)_handleScrollViewPanGesture:(id)a3
{
  if (self->_presentationState == 4
    && [a3 state] == 1
    && self->_pressedGroupViewIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:");
    id v4 = [v6 pressGestureRecognizer];
    id v5 = v4;
    if (v4)
    {
      [v4 setEnabled:0];
      [v5 setEnabled:1];
    }
  }
}

- (void)_beginGroupPanWithAnimator:(id)a3
{
  long long v23 = (double *)a3;
  if (self->_transitionCanceller) {
    [(PKPassGroupStackView *)self _suspendTransition];
  }
  [(PKPassGroupStackView *)self _arrangeGroups];
  if (v23) {
    id v4 = (void *)*((void *)v23 + 8);
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  unint64_t v6 = [(PKPassGroupStackView *)self _indexOfGroupView:v5];
  if (v23)
  {
    -[PKPassGroupViewVerticalPanAnimator setDismissAnimation:]((uint64_t)v23, 0);
    [(PKPassGroupStackView *)self _positionForGroupView:v5 atIndex:v6 forState:5];
    *((void *)v23 + 12) = v7;
    *((void *)v23 + 13) = v8;
  }
  else
  {
    [(PKPassGroupStackView *)self _positionForGroupView:v5 atIndex:v6 forState:5];
  }
  double v9 = [v5 layer];
  [v9 position];
  uint64_t v11 = v10;

  [(PKPassGroupStackView *)self bounds];
  if (v23)
  {
    *((void *)v23 + 14) = v11;
    v23[15] = v12 + v13;
  }
  CATransform3D v14 = self->_modallyPresentedGroupView;
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  self->_modallyPresentedGroupView = 0;

  uint64_t v16 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexes];
  -[PKPassGroupStackView _generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:](self, "_generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:", v16, v17, 0);
  [(PKPassGroupStackView *)self _scaleForGroupView:v14 atIndex:[(PKPassGroupStackView *)self _indexOfGroupView:v14] forState:5];
  if (v23) {
    *((void *)v23 + 11) = v18;
  }
  long long v19 = self->_modallyPresentedGroupView;
  self->_modallyPresentedGroupView = v14;
  long long v20 = v14;

  uint64_t v21 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexes];
  -[PKPassGroupStackView _generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:](self, "_generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:", v21, v22, 0);
}

- (void)_endGroupPanWithAnimator:(id)a3
{
  id v4 = (double *)a3;
  id v5 = v4;
  if (v4) {
    unint64_t v6 = (void *)*((void *)v4 + 9);
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = v6;
  [v7 velocityInView:self];
  double v9 = v8;
  [v7 translationInView:self];
  if (v10 < 80.0 || v9 < 0.0)
  {
    uint64_t v11 = [v7 view];
    [v7 translationInView:v11];
    double v13 = v12;

    double v14 = 0.0;
    uint64_t v15 = 0;
    if (v5)
    {
      uint64_t v15 = *((void *)v5 + 12);
      double v14 = v5[13];
    }
    double v16 = v14 - (v13 + v14);
    if (v16 == 0.0) {
      double v17 = 0.0;
    }
    else {
      double v17 = v9 / v16;
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F88168], "createDefaultFactory", 0.0);
    [v18 setVelocity:v17];
    [(PKPassGroupStackView *)self _yForGroupInModalPileWithModalGroupY:v14];
    uint64_t v20 = v19;
    uint64_t v21 = [v18 highFrameRateSpringAnimationWithKeyPath:@"position" reason:1];
    uint64_t v22 = [v18 highFrameRateSpringAnimationWithKeyPath:@"transform" reason:1];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __49__PKPassGroupStackView__endGroupPanWithAnimator___block_invoke;
    v30[3] = &unk_1E59D61E8;
    uint64_t v33 = v15;
    double v34 = v14;
    uint64_t v35 = v15;
    uint64_t v36 = v20;
    v30[4] = self;
    id v31 = v21;
    id v32 = v22;
    id v23 = v22;
    id v24 = v21;
    [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v30];
    if (v5) {
      long long v25 = (void *)*((void *)v5 + 8);
    }
    else {
      long long v25 = 0;
    }
    id v26 = v25;
    [v26 updatePageControlFrameAnimated:1];
    [v26 clearPageControlAlphaOverride];
    [(PKPassGroupView *)self->_modallyPresentedGroupView setPresentationState:3 animated:1];
    *((_WORD *)&self->_layoutState + 32) |= 0x400u;
    [(PKPassGroupStackView *)self setPresentationState:5 animated:1];
    *((_WORD *)&self->_layoutState + 32) &= ~0x400u;
  }
  else
  {
    [(PKPassGroupStackView *)self _cancelSuspendedTransition];
    objc_initWeak(&location, self);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __49__PKPassGroupStackView__endGroupPanWithAnimator___block_invoke_2;
    v27[3] = &unk_1E59CB100;
    objc_copyWeak(&v28, &location);
    -[PKPassGroupViewVerticalPanAnimator dismissWithStartVelocity:completion:](v5, v27, v9);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

void __49__PKPassGroupStackView__endGroupPanWithAnimator___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  double v9 = (void *)a1[4];
  id v10 = v7;
  if ((id)v9[262] != v7)
  {
    if (![v9 _isGroupAtIndexInModalPile:a3]) {
      goto LABEL_14;
    }
    id v10 = *(id *)(a1[4] + 2096);
  }
  BOOL v11 = v10 == v7;
  uint64_t v12 = 10;
  if (v11) {
    uint64_t v12 = 8;
  }
  uint64_t v13 = 9;
  if (v11) {
    uint64_t v13 = 7;
  }
  double v14 = *(double *)&a1[v13];
  double v15 = *(double *)&a1[v12];
  double v16 = [v7 layer];
  double v17 = (void *)a1[5];
  [v16 position];
  objc_msgSend(v17, "pkui_updateForAdditiveAnimationFromPoint:toPoint:");
  [v16 addAnimation:a1[5] forKey:@"modalPanGestureRecovery"];
  objc_msgSend(v16, "setPosition:", v14, v15);
  uint64_t v18 = (void *)a1[4];
  if ((id)v18[262] != v7)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    [v18 _transformForGroupView:v7 atIndex:a3 forState:v18[260]];
    uint64_t v19 = (void *)a1[6];
    if (v16) {
      [v16 transform];
    }
    else {
      memset(v29, 0, sizeof(v29));
    }
    long long v25 = v34;
    long long v26 = v35;
    long long v27 = v36;
    long long v28 = v37;
    long long v21 = v30;
    long long v22 = v31;
    long long v23 = v32;
    long long v24 = v33;
    objc_msgSend(v19, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", v29, &v21);
    id v20 = (id)objc_msgSend(v16, "pkui_addAdditiveAnimation:", a1[6]);
    long long v25 = v34;
    long long v26 = v35;
    long long v27 = v36;
    long long v28 = v37;
    long long v21 = v30;
    long long v22 = v31;
    long long v23 = v32;
    long long v24 = v33;
    [v16 setTransform:&v21];
  }

LABEL_14:
}

void __49__PKPassGroupStackView__endGroupPanWithAnimator___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setPresentationState:4 animated:1];
  }
}

void __64__PKPassGroupStackView__updateHeaderContext_toContext_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 superview];

  if (v4)
  {
    if (*(unsigned char *)(a1 + 32))
    {
      id v5 = [v3 layer];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __64__PKPassGroupStackView__updateHeaderContext_toContext_animated___block_invoke_2;
      v6[3] = &unk_1E59CB6D8;
      id v7 = v3;
      objc_msgSend(v5, "pkui_animateToOpacity:withCompletion:", v6, 0.0);
    }
    else
    {
      [v3 removeFromSuperview];
    }
  }
}

uint64_t __64__PKPassGroupStackView__updateHeaderContext_toContext_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __64__PKPassGroupStackView__updateHeaderContext_toContext_animated___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(void *)(a2 + 8);
  }
  else {
    return 0;
  }
}

uint64_t __64__PKPassGroupStackView__updateHeaderFooterStateAnimated_layout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (BOOL)discoveryGalleryHasWelcomeCards
{
  long long v3 = *(_OWORD *)&self->_layoutState.groups.count;
  uint64_t v4 = *((void *)&self->_layoutState.groups + 2);
  char v5 = (*((unsigned char *)&self->_layoutState + 64) >> 1) & 3;
  return +[PKDiscoveryGalleryView isWelcomeCardVisibleForSectionsState:&v3];
}

- (BOOL)_updateContentSize
{
  return [(PKPassGroupStackView *)self _updateContentSizeWithPriorBounds:0 bounds:0];
}

- (unint64_t)_tablePresentationNumberOfCellsBeforeHeaderHidden
{
  return 4;
}

- (unint64_t)_indexForNativePositionInTable:(CGPoint)a3
{
  return -[PKPassGroupStackView _indexForNativePositionInTable:roundToClosestIndex:](self, "_indexForNativePositionInTable:roundToClosestIndex:", 1, a3.x, a3.y);
}

- (double)_yForModallyPresentedGroup
{
  [(PKPassGroupStackView *)self _yForModallyPresentedGroupForExternalPresentation:0 ignoringCompactState:0];
  return result;
}

- (double)_yForExternalModallyPresentedGroup
{
  [(PKPassGroupStackView *)self _yForModallyPresentedGroupForExternalPresentation:1 ignoringCompactState:0];
  return result;
}

- (double)_yForModallyPresentedGroupForExternalPresentation:(BOOL)a3 ignoringCompactState:(BOOL)a4
{
  BOOL v5 = a3;
  id v7 = [(PKPassGroupView *)self->_modallyPresentedGroupView frontmostPassView];
  id v8 = [v7 pass];

  if ([v8 passType] == 1
    || PKValueAddedServicesEnabledForPass()
    || self->_layoutState.groups.count > 1
    || [(PKPassGroupStackView *)self _isModalPresentationAllowedForSingleGroup])
  {
    [(PKPassGroupStackView *)self bounds];
    if (self->_presentationState == 4) {
      double v10 = 0.0;
    }
    else {
      double v10 = v9;
    }
    if (!v5 || *((__int16 *)&self->_layoutState + 32) < 0)
    {
      if (PKUIGetMinScreenType()) {
        double v15 = 15.0;
      }
      else {
        double v15 = 5.0;
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
      [WeakRetained externalPresentationNavigationHeight];
      double v13 = v12;
      +[PKDashboardPassFlowLayout topMarginInFirstSection];
      double v15 = v13 + v14;
    }
    if ([(PKPassGroupStackView *)self isTableModalPresentation]
      && (*((_WORD *)&self->_layoutState + 32) & 1) == 0)
    {
      uint64_t v16 = [(PKPassGroupStackView *)self _firstHeaderContext];
      double v17 = (double *)v16;
      if (v16)
      {
        double v18 = *(double *)(v16 + 56);
        -[PKPGSVSectionHeaderContext _headerViewSize](v16);
        double v20 = v17[9] + v18 + v19;
      }
      else
      {
        double v20 = 0.0;
      }
      double v15 = fmax(v15, v20);
    }
    if (!a4 && (*((_WORD *)&self->_layoutState + 32) & 0x200) != 0)
    {
      LAUIPhysicalButtonNormalizedFrame();
      CGRectGetMaxY(v26);
      long long v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v21 bounds];
      PKFloatRoundToPixel();
      double v15 = fmax(v15, v22 - self->_lastTopContentSeparatorHeight + 26.0);
    }
    double v23 = v10 + v15;
  }
  else
  {
    [(PKPassGroupStackView *)self _yForSingleGroupView:self->_modallyPresentedGroupView];
    double v23 = v25;
  }

  return v23;
}

- (double)_yForSingleGroupView:(id)a3
{
  objc_msgSend(a3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v5 = v4;
  [(PKPassGroupStackView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if (self->_presentationState == 4) {
    double v13 = 0.0;
  }
  else {
    double v13 = v6;
  }
  double v14 = v13;
  if ([(PKPassGroupStackView *)self isTableModalPresentation])
  {
    double v14 = v13;
    if ((*((_WORD *)&self->_layoutState + 32) & 1) == 0)
    {
      uint64_t v15 = [(PKPassGroupStackView *)self _firstHeaderContext];
      uint64_t v16 = (double *)v15;
      if (v15)
      {
        double v17 = *(double *)(v15 + 56);
        -[PKPGSVSectionHeaderContext _headerViewSize](v15);
        double v19 = v16[9] + v17 + v18;
      }
      else
      {
        double v19 = 0.0;
      }
      double v14 = v13 + v19;
    }
  }
  UIRectCenteredYInRect();
  double v21 = v20;
  v23.origin.double x = v8;
  v23.origin.double y = v13;
  v23.size.double width = v10;
  v23.size.double height = v12;
  return fmax(fmin(v21, CGRectGetMaxY(v23) - v5), v14);
}

- (double)_maxYOfPassFrontFaceAtIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  double v6 = [WeakRetained groupAtIndex:a3];

  double v7 = objc_msgSend(v6, "passAtIndex:", objc_msgSend(v6, "frontmostPassIndex"));
  CGFloat v8 = v7;
  if (v7) {
    [v7 style];
  }
  [(PKPassGroupStackView *)self _yPositionForGroupAtIndex:a3 forState:4];
  double v10 = v9;
  PKPassFrontFaceContentSize();
  double v12 = v10 + v11;

  return v12;
}

- (unint64_t)_maximumNumberOfVisiblePilePasses
{
  return 9;
}

- (double)_pileSeparationHeight
{
  unint64_t v2 = [(NSMutableArray *)self->_passPileViews count];
  if (v2) {
    return fmax(floor(44.0 / (double)v2), 5.0);
  }
  else {
    return 5.0;
  }
}

- (double)_pileAscenderHeight
{
  unint64_t v3 = [(NSMutableArray *)self->_passPileViews count];
  if (v3 >= [(PKPassGroupStackView *)self _maximumNumberOfVisiblePilePasses]) {
    unint64_t v4 = [(PKPassGroupStackView *)self _maximumNumberOfVisiblePilePasses];
  }
  else {
    unint64_t v4 = [(NSMutableArray *)self->_passPileViews count];
  }
  if (v4 < 2)
  {
    uint64_t v6 = 1;
  }
  else
  {
    unint64_t v5 = [(NSMutableArray *)self->_passPileViews count];
    if (v5 >= [(PKPassGroupStackView *)self _maximumNumberOfVisiblePilePasses]) {
      uint64_t v6 = [(PKPassGroupStackView *)self _maximumNumberOfVisiblePilePasses];
    }
    else {
      uint64_t v6 = [(NSMutableArray *)self->_passPileViews count];
    }
  }
  double v7 = (double)(unint64_t)(v6 - 1);
  [(PKPassGroupStackView *)self _pileSeparationHeight];
  return v8 * v7;
}

- (double)_pileAscenderHeightForGroupViewInPile:(id)a3
{
  unint64_t v4 = [(NSMutableArray *)self->_passPileViews indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    passPileViews = self->_passPileViews;
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    unint64_t v4 = [(NSMutableArray *)passPileViews indexOfObject:v6];
  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = 1;
  }
  if (v4 >= [(PKPassGroupStackView *)self _maximumNumberOfVisiblePilePasses] - 1) {
    unint64_t v4 = [(PKPassGroupStackView *)self _maximumNumberOfVisiblePilePasses] - 1;
  }
  [(PKPassGroupStackView *)self _pileSeparationHeight];
  return v7 * (double)v4;
}

- (double)_pileBaseHeight
{
  if (![(NSMutableArray *)self->_passPileViews count]) {
    return 0.0;
  }
  [(PKPassGroupStackView *)self bounds];
  double v4 = v3;
  unint64_t v5 = [(PKPassGroupView *)self->_modallyPresentedGroupView group];
  if ((unint64_t)[v5 passCount] <= 1) {
    double v6 = 7.0;
  }
  else {
    double v6 = 4.0;
  }

  [(PKPassGroupStackView *)self _pileAscenderHeight];
  double v8 = v7;
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView)
  {
    [(PKPassGroupView *)modallyPresentedGroupView bounds];
    double v11 = v10;
  }
  else
  {
    PKPassMaxFrontSize();
    double v11 = v13;
  }
  double v14 = 0.0;
  if ((PKHomeButtonIsAvailable() & 1) == 0) {
    double v14 = self->_lastBoundsInsets.bottom + 30.0;
  }
  return v14 + fmin(v4 - v11 - v6 - v14, 44.0) - v8;
}

- (double)_yForGroupInModalPileAtIndex:(unint64_t)a3
{
  if (self->_modallyPresentedGroupView)
  {
    [(PKPassGroupStackView *)self _yForModallyPresentedGroup];
    -[PKPassGroupStackView _yForGroupInModalPileWithModalGroupY:](self, "_yForGroupInModalPileWithModalGroupY:");
  }
  else
  {
    [(PKPassGroupStackView *)self _yForGroupInPileAtIndex:a3];
  }
  return result;
}

- (double)_yForGroupInModalPileWithModalGroupY:(double)result
{
  double v3 = result;
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView)
  {
    double v6 = [(PKPassGroupView *)modallyPresentedGroupView frontmostPassView];
    double v7 = [v6 pass];
    [v7 style];

    [(PKPassGroupStackView *)self _scaleForModalPileGroup];
    double v9 = 1.0 - v8;
    PKPassFrontFaceContentSize();
    return v3 + v9 * v10 * 0.5;
  }
  return result;
}

- (double)_yForGroupInExternalModalPileWithModalGroupY:(double)result
{
  double v3 = result;
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView)
  {
    double v6 = [(PKPassGroupView *)modallyPresentedGroupView frontmostPassView];
    double v7 = [v6 pass];
    [v7 style];

    [(PKPassGroupStackView *)self _scaleForModalPileGroup];
    double v9 = 1.0 - v8;
    [(PKPassGroupStackView *)self _scaleForModallyPresentedGroupInExternalPresentation];
    double v11 = v10;
    PKPassFrontFaceContentSize();
    return v3 + v9 * (v11 * v12) * 0.5;
  }
  return result;
}

- (double)_yForGroupInPileAtIndex:(unint64_t)a3
{
  if (self->_layoutState.pilingMode)
  {
    [(PKPassGroupStackView *)self _yForGroupInOffscreenPileAtIndex:a3];
  }
  else
  {
    id v5 = [(PKPassGroupStackView *)self _groupViewAtIndex:a3];
    [(PKPassGroupStackView *)self _pileBaseHeight];
    double v7 = v6;
    [(PKPassGroupStackView *)self _pileAscenderHeightForGroupViewInPile:v5];
    double v9 = v7 + v8;
    featuredGroupID = self->_featuredGroupID;
    if (featuredGroupID)
    {
      double v11 = [v5 group];
      double v12 = [v11 groupID];
      int v13 = [(NSNumber *)featuredGroupID isEqual:v12];

      if (v13)
      {
        double v14 = [(PKPassGroupView *)self->_modallyPresentedGroupView frontmostPassView];
        uint64_t v15 = [v14 pass];
        uint64_t v16 = [v15 style];

        if (v16 == 6)
        {
          [(PKPassGroupStackView *)self _pileSeparationHeight];
          double v9 = v9 - v17 + 44.0;
        }
      }
    }
    [(PKPassGroupStackView *)self bounds];
    double v18 = CGRectGetMaxY(v20) - v9;

    return v18;
  }
  return result;
}

- (double)_yForGroupInOffscreenPileAtIndex:(unint64_t)a3
{
  id v4 = [(PKPassGroupStackView *)self _groupViewAtIndex:a3];
  [(PKPassGroupStackView *)self _pileAscenderHeight];
  double v6 = v5;
  [(PKPassGroupStackView *)self _pileAscenderHeightForGroupViewInPile:v4];
  double v8 = v7;
  [(PKPassGroupStackView *)self bounds];
  double MaxY = CGRectGetMaxY(v15);
  double v10 = [v4 frontmostPassView];
  double v11 = [v10 pass];
  [v11 style];
  PKPassFaceShadowInsets();
  double v13 = MaxY + v12;

  return v6 - v8 + v13;
}

- (double)_scaleForModalPileGroup
{
  return dbl_1A0444360[PKUIGetMinScreenWidthType() == 0];
}

- (double)_scaleForModallyPresentedGroupInExternalPresentation
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 0.9;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (double)_scaleForStackGroupInExternalPresentation
{
  return dbl_1A0444370[PKUIGetMinScreenWidthType() == 0];
}

- (BOOL)_isGroupAtIndexInModalPile:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  modalGroupIndedouble x = self->_modalGroupIndex;
  if (modalGroupIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  if (*((unsigned char *)&self->_layoutState + 24)) {
    return modalGroupIndex > a3;
  }
  if ((*((unsigned char *)&self->_layoutState.groups + 16) & 1) == 0) {
    return 0;
  }
  separatorIndedouble x = self->_layoutState.groups.separatorIndex;
  if (separatorIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((*((unsigned char *)&self->_layoutState.groups + 16) & 2) != 0) {
      BOOL v6 = (*((unsigned __int16 *)&self->_layoutState + 32) >> 2) & 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = modalGroupIndex <= separatorIndex;
  }
  return modalGroupIndex > a3 && v6;
}

- (CGRect)_frameForFooterViewForPassView:(id)a3
{
  id v4 = a3;
  [(PKPassGroupStackView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = [v4 pass];

  if (v13) {
    uint64_t v14 = [v13 style];
  }
  else {
    uint64_t v14 = 6;
  }
  [(PKPassGroupStackView *)self _yForModallyPresentedGroupForExternalPresentation:0 ignoringCompactState:1];
  double v16 = v15;
  PKPassFrontFaceContentSize();
  double v18 = 0.0;
  if (self->_presentationState != 4) {
    double v18 = v8;
  }
  double v19 = v17 + v16 - v18;
  if ((unint64_t)(v14 - 8) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    PKPassHeightAdjustmentForStyle();
    double v19 = v19 - v20;
  }
  memset(&v36, 0, sizeof(v36));
  remainder.origin.double x = v6;
  remainder.origin.double y = v8;
  remainder.size.double width = v10;
  remainder.size.double height = v12;
  if (self->_layoutState.pilingMode)
  {
    memset(&v35, 0, sizeof(v35));
    double bottom = self->_lastBoundsInsets.bottom;
  }
  else
  {
    [(PKPassGroupStackView *)self pileHeight];
    double bottom = fmax(v22, self->_lastBoundsInsets.bottom);
  }
  v38.origin.double x = v6;
  v38.origin.double y = v8;
  v38.size.double width = v10;
  v38.size.double height = v12;
  CGRectDivide(v38, &v35, &remainder, bottom, CGRectMaxYEdge);
  CGRectDivide(remainder, &remainder, &v36, v19, CGRectMinYEdge);
  PKPassFrontFaceContentSize();
  PKSizeAlignedInRect();
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (void)_updateGroupStateForGroupViewInModalPresentation:(id)a3 withState:(int64_t)a4 animated:(BOOL)a5 withContext:(id)a6
{
  BOOL v7 = a5;
  CGFloat v12 = (PKPassGroupView *)a3;
  id v10 = a6;
  if (self->_modallyPresentedGroupView == v12)
  {
    if (!v7)
    {
      [(PKPassGroupView *)v12 setPresentationState:3 withContext:v10 animated:0];
      [(PKPassGroupView *)v12 sizeToFit];
    }
  }
  else
  {
    if (a4 == 7) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    [(PKPassGroupView *)v12 setPresentationState:v11 animated:v7];
  }
}

- (void)_updateTransformForGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  [(PKPassGroupStackView *)self _transformForGroupView:v8 atIndex:[(PKPassGroupStackView *)self _indexOfGroupView:v8] forState:a4];
  id v10 = [v8 layer];
  if (v9)
  {
    uint64_t v11 = [v9 highFrameRateSpringAnimationForView:v8 withKeyPath:@"transform" reason:1];
    if (v10) {
      [v10 transform];
    }
    else {
      memset(v21, 0, sizeof(v21));
    }
    long long v17 = v26;
    long long v18 = v27;
    long long v19 = v28;
    long long v20 = v29;
    long long v13 = v22;
    long long v14 = v23;
    long long v15 = v24;
    long long v16 = v25;
    objc_msgSend(v11, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", v21, &v13);
    id v12 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v11);
  }
  long long v17 = v26;
  long long v18 = v27;
  long long v19 = v28;
  long long v20 = v29;
  long long v13 = v22;
  long long v14 = v23;
  long long v15 = v24;
  long long v16 = v25;
  [v10 setTransform:&v13];
}

- (void)_updatePositionForGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(PKPassGroupStackView *)self _updatePositionForGroupView:v9 toPresentationState:a4 withSpringFactory:v8 atIndex:[(PKPassGroupStackView *)self _indexOfGroupView:v9]];
}

- (void)_updatePositionForGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5 atIndex:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  [(PKPassGroupStackView *)self _positionForGroupView:v11 atIndex:a6 forState:a4];
  -[PKPassGroupStackView _updatePositionForGroupView:toPosition:withSpringFactory:](self, "_updatePositionForGroupView:toPosition:withSpringFactory:", v11, v10);
}

- (void)_updatePositionForGroupView:(id)a3 toPosition:(CGPoint)a4 withSpringFactory:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  long long v13 = (PKPassGroupView *)a3;
  id v9 = a5;
  if (self->_loanedGroupView != v13 || *((unsigned __int16 *)&self->_layoutState + 32) >= 0x4000u)
  {
    id v10 = [(PKPassGroupView *)v13 layer];
    if (v9)
    {
      id v11 = [v9 highFrameRateSpringAnimationForView:v13 withKeyPath:@"position" reason:1];
      [v10 position];
      objc_msgSend(v11, "pkui_updateForAdditiveAnimationFromPoint:toPoint:");
      id v12 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v11);
    }
    objc_msgSend(v10, "setPosition:", x, y);
  }
}

uint64_t __65__PKPassGroupStackView__layoutFooterAnimated_withAnimationDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __65__PKPassGroupStackView__layoutFooterAnimated_withAnimationDelay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 2528) layoutIfNeeded];
}

- (void)_animateGroupViewAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4 withAnchorView:(id)a5 insertAbove:(BOOL)a6
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = [(PKPassGroupStackView *)self _groupViewAtIndex:a3];
  id v12 = v11;
  if (v11 != self->_loanedGroupView || *((unsigned __int16 *)&self->_layoutState + 32) >= 0x4000u)
  {
    BOOL v49 = a6;
    long long v13 = [(PKPassGroupView *)v11 layer];
    [v13 position];
    double v15 = v14;
    double v17 = v16;
    [(PKPassGroupStackView *)self _yPositionForGroupAtIndex:a4 forState:4];
    if (v18 != v17)
    {
      double v19 = v18;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke;
      aBlock[3] = &unk_1E59D62A0;
      void aBlock[4] = self;
      long long v20 = v12;
      id v59 = v20;
      double v21 = (double (**)(void *, unint64_t))_Block_copy(aBlock);
      double v22 = v21[2](v21, a3);
      [(PKPassGroupStackView *)self _yPositionForGroupAtIndex:a3 forState:4];
      double v24 = v23;
      double v25 = v21[2](v21, a4);
      [(PKPassGroupStackView *)self _yPositionForGroupAtIndex:a4 forState:4];
      double v27 = v26;
      long long v28 = [(PKPassGroupView *)v20 frontmostPassView];
      BOOL v29 = [v28 contentMode] < 3;

      if (v29)
      {
        double v30 = [(PKPassGroupView *)v20 frontmostPassView];
        [v30 setContentMode:3];
      }
      double v31 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
      [v31 setAdditive:1];
      uint64_t v32 = *MEMORY[0x1E4F39D98];
      [v31 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
      [v31 setMass:1.0];
      [v31 setStiffness:300.0];
      [v31 setDamping:400.0];
      double v33 = fmax(v17, v19) + fmax(v22 - v24, v25 - v27) + 15.0;
      objc_msgSend(v31, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", v15, v17, v15, v33, v15, v19);
      uint64_t v34 = *MEMORY[0x1E4F39FA8];
      [v31 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v31 durationForEpsilon:0.001];
      double v36 = v35;
      objc_msgSend(v31, "setDuration:");
      long long v37 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
      [v37 setAdditive:1];
      [v37 setBeginTimeMode:v32];
      [v37 setMass:2.0];
      [v37 setStiffness:300.0];
      [v37 setDamping:400.0];
      objc_msgSend(v37, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", v15, v33, v15, v19, v15, v33);
      [v37 setFillMode:v34];
      [v37 durationForEpsilon:0.001];
      double v39 = v38;
      [v37 setBeginTime:0.17];
      [v37 setDuration:v39];
      id v40 = PKMagicCurve();
      [v37 setTimingFunction:v40];

      reorderActionTag = (void *)self->_reorderActionTag;
      if (!self->_reorderActions)
      {
        id v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        reorderActions = self->_reorderActions;
        self->_reorderActions = v42;
      }
      objc_initWeak(&location, self);
      id v44 = self->_reorderActions;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_2;
      v52[3] = &unk_1E59CB9F0;
      objc_copyWeak(&v55, &location);
      BOOL v56 = v49;
      float v53 = v20;
      id v54 = v10;
      long long v45 = _Block_copy(v52);
      [(NSMutableArray *)v44 addObject:v45];

      unsigned int v46 = [MEMORY[0x1E4F39B38] animation];
      objc_msgSend(v46, "setDuration:", fmax(v36, v39 + 0.17));
      v60[0] = v31;
      v60[1] = v37;
      double v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
      [v46 setAnimations:v47];

      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_3;
      v50[3] = &unk_1E59CF720;
      objc_copyWeak(v51, &location);
      v51[1] = reorderActionTag;
      objc_msgSend(v46, "pkui_setDidStartHandler:", v50);
      id v48 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v46);
      objc_msgSend(v13, "setPosition:", v15, v19);
      objc_destroyWeak(v51);

      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);
    }
  }
}

double __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 1;
  id v4 = *(void **)(a1 + 32);
  unint64_t v5 = v4[276];
  if (a2 + 1 >= v5)
  {
    [v4 _maxYOfPassFrontFaceAtIndex:v5 - 1];
    double v9 = v8;
    [*(id *)(a1 + 32) bounds];
    double v7 = fmin(v9, CGRectGetMaxY(v16));
  }
  else
  {
    [v4 _yPositionForGroupAtIndex:a2 + 1 forState:4];
    double v7 = v6;
  }
  id v10 = (void *)[*(id *)(a1 + 32) _groupViewAtIndex:v3];
  id v11 = v10;
  if (*(void *)(a1 + 40))
  {
    id v12 = [v10 layer];
    long long v13 = [v12 presentationLayer];
    [v13 position];
    double v7 = fmax(v7, v14);
  }
  return v7;
}

void __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v6 = WeakRetained;
    uint64_t v3 = (void *)WeakRetained[322];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 56)) {
      [v3 insertSubview:v4 aboveSubview:v5];
    }
    else {
      [v3 insertSubview:v4 belowSubview:v5];
    }
    id WeakRetained = v6;
  }
}

void __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 170000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_4;
  v3[3] = &unk_1E59CF720;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[311] == *(id *)(a1 + 40))
  {
    uint64_t v4 = WeakRetained;
    uint64_t v3 = [WeakRetained[310] firstObject];
    if (v3)
    {
      [v4[310] removeObjectAtIndex:0];
      v3[2](v3);
      if (((_BYTE)v4[309] & 1) == 0 && ![v4[310] count]) {
        [v4 _arrangeGroups];
      }
    }

    id WeakRetained = v4;
  }
}

- (void)_autoscrollIfNecessary
{
  uint64_t v3 = [(PKPassGroupView *)self->_reorderedGroupView layer];
  [v3 position];
  double v5 = v4;

  [(PKPassGroupStackView *)self bounds];
  double Height = CGRectGetHeight(v11);
  [(PKPassGroupStackView *)self contentSize];
  if (Height >= v7
    || ([(PKPassGroupStackView *)self bounds], CGRectGetMinY(v12) + 50.0 <= v5)
    && ([(PKPassGroupStackView *)self bounds], CGRectGetMaxY(v13) + -150.0 >= v5))
  {
    if (self->_autoscrollTimer)
    {
      [(PKPassGroupStackView *)self _stopAutoscrollTimer];
    }
  }
  else if (!self->_autoscrollTimer)
  {
    double v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__autoscrollForReordering_ selector:0 userInfo:1 repeats:0.0166666675];
    autoscrollTimer = self->_autoscrollTimer;
    self->_autoscrollTimer = v8;
  }
}

- (void)_autoscrollForReordering:(id)a3
{
  [(PKPassGroupStackView *)self _contentSize];
  double v5 = v4;
  [(PKPassGroupStackView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v14 = [(PKPassGroupView *)self->_reorderedGroupView layer];
  [v14 position];
  double v16 = v15;

  v48.origin.double x = v7;
  v48.origin.double y = v9;
  v48.size.double width = v11;
  v48.size.double height = v13;
  double v17 = CGRectGetMinY(v48) + 50.0;
  BOOL v18 = v16 <= 0.0 || v17 <= v16;
  if (!v18 && (*(unsigned char *)&self->_reorderingFlags & 4) != 0)
  {
    v51.origin.double x = v7;
    v51.origin.double y = v9;
    v51.size.double width = v11;
    v51.size.double height = v13;
    float v22 = CGRectGetMinY(v51) + 50.0 - v16;
    float v21 = -2.0;
    if (v22 <= 0.0) {
      goto LABEL_20;
    }
    float v21 = -floorf((float)((float)((float)(v22 / 25.0) * 5.0) * (float)(v22 / 25.0)) + 2.0);
    goto LABEL_16;
  }
  v49.origin.double x = v7;
  v49.origin.double y = v9;
  v49.size.double width = v11;
  v49.size.double height = v13;
  BOOL v19 = CGRectGetMaxY(v49) + -150.0 < v16 && v16 < v5;
  if (!v19 || (*(unsigned char *)&self->_reorderingFlags & 8) == 0) {
    goto LABEL_17;
  }
  v50.origin.double x = v7;
  v50.origin.double y = v9;
  v50.size.double width = v11;
  v50.size.double height = v13;
  float v20 = v16 + 150.0 - CGRectGetMaxY(v50);
  float v21 = 2.0;
  if (v20 > 0.0)
  {
    float v21 = floorf((float)((float)((float)(v20 / 75.0) * 5.0) * (float)(v20 / 75.0)) + 2.0);
LABEL_16:
    if (v21 == 0.0)
    {
LABEL_17:
      [(PKPassGroupStackView *)self _stopAutoscrollTimer];
      return;
    }
  }
LABEL_20:
  double v23 = [(PKPassGroupView *)self->_reorderedGroupView layer];
  [v23 position];
  double v25 = v24;
  double v27 = v26;
  long long v28 = [(PKPassGroupStackView *)self superview];
  -[PKPassGroupStackView convertPoint:toView:](self, "convertPoint:toView:", v28, v25, v27);
  double v30 = v29;
  double v32 = v31;

  [(PKPassGroupStackView *)self contentOffset];
  double v34 = v33;
  double v35 = v21;
  double v37 = fmax(v36 + v21, 0.0);
  [(PKPassGroupStackView *)self bounds];
  if (v37 >= v5 - v38)
  {
    [(PKPassGroupStackView *)self bounds];
    double v37 = v5 - v39;
  }
  -[PKPassGroupStackView setContentOffset:](self, "setContentOffset:", v34, v37);
  id v40 = [(PKPassGroupStackView *)self superview];
  -[PKPassGroupStackView convertPoint:fromView:](self, "convertPoint:fromView:", v40, v30, v32);
  double v42 = v41;
  double v44 = v43;

  if (v44 >= v5 + -5.0) {
    double v45 = v5 + -5.0;
  }
  else {
    double v45 = v44;
  }
  unsigned int v46 = [(PKPassGroupView *)self->_reorderedGroupView layer];
  objc_msgSend(v46, "setPosition:", v42, v45);

  -[PKPassGroupStackView _reorderPositionChangedForReorderedGroupViewWithVelocity:](self, "_reorderPositionChangedForReorderedGroupViewWithVelocity:", 0.0, v35);
}

- (void)_stopAutoscrollTimer
{
  [(NSTimer *)self->_autoscrollTimer invalidate];
  autoscrollTimer = self->_autoscrollTimer;
  self->_autoscrollTimer = 0;
}

- (void)_adjustGroupViewsForReordering
{
  unint64_t previousIndexOfReorderedGroup = self->_previousIndexOfReorderedGroup;
  if (previousIndexOfReorderedGroup)
  {
    id v4 = [(PKPassGroupStackView *)self _groupViewAtIndex:previousIndexOfReorderedGroup - 1];
    int64_t v5 = [(PKPassGroupStackView *)self groupViewContentModeForFrontmostPassWhenStacked:v4];

    id v6 = [(PKPassGroupStackView *)self _groupViewAtIndexWhileEnsuringVisible:self->_previousIndexOfReorderedGroup - 1 withContentMode:v5];
  }
}

- (unint64_t)_indexOfReorderedGroupView
{
  uint64_t v3 = [(PKPassGroupView *)self->_reorderedGroupView layer];
  [v3 position];
  double v5 = v4;
  double v7 = v6;

  unint64_t result = -[PKPassGroupStackView _indexForNativePositionInTable:](self, "_indexForNativePositionInTable:", v5, v7);
  separatorIndedouble x = self->_layoutState.groups.separatorIndex;
  if (separatorIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_previousIndexOfReorderedGroup <= separatorIndex)
    {
      if (result >= separatorIndex) {
        return self->_layoutState.groups.separatorIndex;
      }
    }
    else if (result <= separatorIndex + 1)
    {
      return separatorIndex + 1;
    }
  }
  return result;
}

- (void)_reorderPositionChangedForReorderedGroupViewWithVelocity:(CGPoint)a3
{
  unint64_t v4 = [(PKPassGroupStackView *)self _indexOfReorderedGroupView];
  double v5 = [(PKPassGroupStackView *)self _groupViewAtIndex:v4];
  if (v4)
  {
    id v6 = [(PKPassGroupStackView *)self _groupViewAtIndex:v4 - 1];
    double v7 = [v6 frontmostPassView];
    if ([v7 contentMode] <= 2) {
      [v7 setContentMode:3];
    }
  }
  if (v5 != self->_reorderedGroupView)
  {
    unint64_t previousIndexOfReorderedGroup = self->_previousIndexOfReorderedGroup;
    self->_unint64_t previousIndexOfReorderedGroup = v4;
    [(PKPassGroupStackView *)self _adjustGroupViewsForReordering];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PKPassGroupStackView__reorderPositionChangedForReorderedGroupViewWithVelocity___block_invoke;
    aBlock[3] = &unk_1E59D62C8;
    void aBlock[4] = self;
    void aBlock[5] = previousIndexOfReorderedGroup;
    void aBlock[6] = v4;
    CGFloat v9 = _Block_copy(aBlock);
    double v10 = (void *)MEMORY[0x1A6224460]();
    if (previousIndexOfReorderedGroup <= v4) {
      [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v9];
    }
    else {
      [(PKPassGroupStackView *)self _reverseEnumerateLoadedGroupViews:v9];
    }
    if (v4 < self->_layoutState.groups.count)
    {
      CGFloat v11 = [(PKPassGroupStackView *)self delegate];
      [v11 groupStackView:self groupDidMoveFromIndex:previousIndexOfReorderedGroup toIndex:v4];
    }
  }
  [(PKPassGroupStackView *)self _autoscrollIfNecessary];
}

void __81__PKPassGroupStackView__reorderPositionChangedForReorderedGroupViewWithVelocity___block_invoke(void *a1, void *a2, unint64_t a3, void *a4)
{
  id v11 = a2;
  id v7 = a4;
  double v8 = (void *)a1[4];
  if ((id)v8[301] != v11)
  {
    unint64_t v9 = a1[5];
    if (v9 < a3 && a1[6] >= a3)
    {
      uint64_t v10 = -1;
      goto LABEL_8;
    }
    if (v9 > a3 && a1[6] <= a3)
    {
      uint64_t v10 = 1;
LABEL_8:
      objc_msgSend(v8, "_animateGroupViewAtIndex:toIndex:withAnchorView:insertAbove:", a3, v10 + a3);
    }
  }
}

- (void)_animateGroupViewForUndo:(id)a3 toIndex:(unint64_t)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 frontmostPassView];
    double v8 = [v7 pass];
    unint64_t v9 = [v8 localizedDescription];
    *(_DWORD *)buf = 138412546;
    id v55 = v9;
    __int16 v56 = 2048;
    unint64_t v57 = a4;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Animate pass: %@ to index %lu", buf, 0x16u);
  }
  uint64_t v10 = [(PKPassGroupView *)self->_reorderedGroupView layer];
  [v10 position];
  double v12 = v11;
  double v14 = v13;
  [(PKPassGroupStackView *)self _positionForGroupView:self->_reorderedGroupView atIndex:self->_initialIndexOfReorderedGroup forState:4];
  double v16 = v15;
  double v18 = v17;
  [v10 size];
  double v20 = v19;
  float v21 = (PKPassGroupView *)v5;
  float v22 = [(PKPassGroupStackView *)self _groupViewAtIndex:self->_initialIndexOfReorderedGroup];
  double v23 = v22;
  loanedGroupView = self->_loanedGroupView;
  BOOL v25 = loanedGroupView == v21 || v22 == loanedGroupView;
  if (!v25 || *((unsigned __int16 *)&self->_layoutState + 32) >= 0x4000u)
  {
    unint64_t v26 = [(PKPassGroupStackView *)self _indexOfGroupView:v22];
    BOOL v27 = v26 > [(PKPassGroupStackView *)self _indexOfGroupView:v21];
    reorderActionTag = (void *)self->_reorderActionTag;
    if (!self->_reorderActions)
    {
      long long v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      reorderActions = self->_reorderActions;
      self->_reorderActions = v28;
    }
    objc_initWeak((id *)buf, self);
    double v30 = self->_reorderActions;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke;
    aBlock[3] = &unk_1E59CB9F0;
    objc_copyWeak(&v51, (id *)buf);
    BOOL v52 = v27;
    double v31 = v21;
    CGRect v49 = v31;
    CGRect v50 = v23;
    double v32 = _Block_copy(aBlock);
    [(NSMutableArray *)v30 addObject:v32];

    double v33 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    [v33 setAdditive:1];
    [v33 setMass:1.0];
    [v33 setStiffness:100.0];
    [v33 setDamping:200.0];
    double v34 = v18 - v20 + -50.0;
    objc_msgSend(v33, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", v12, v14, v16, v34, v16, v18);
    uint64_t v35 = *MEMORY[0x1E4F39FA8];
    [v33 setFillMode:*MEMORY[0x1E4F39FA8]];
    [v33 durationForEpsilon:0.001];
    objc_msgSend(v33, "setDuration:");
    double v36 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    [v36 setAdditive:1];
    [v36 setMass:2.0];
    [v36 setStiffness:100.0];
    [v36 setDamping:200.0];
    objc_msgSend(v36, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", v16, v34, v16, v18, v16, v34);
    [v36 setFillMode:v35];
    [v36 durationForEpsilon:0.001];
    double v38 = v37;
    [v36 setBeginTime:0.17];
    [v36 setDuration:v38];
    double v39 = PKMagicCurve();
    [v36 setTimingFunction:v39];

    id v40 = [MEMORY[0x1E4F39B38] animation];
    [v40 setDuration:v38 + 0.17];
    v53[0] = v33;
    v53[1] = v36;
    double v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    [v40 setAnimations:v41];

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke_2;
    v46[3] = &unk_1E59CF720;
    objc_copyWeak(v47, (id *)buf);
    v47[1] = reorderActionTag;
    objc_msgSend(v40, "pkui_setDidStartHandler:", v46);
    id v42 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v40);
    objc_msgSend(v10, "setPosition:", v16, v18);
    double v43 = [(PKPassGroupStackView *)self delegate];
    objc_msgSend(v43, "groupStackView:groupDidMoveFromIndex:toIndex:", self, -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v31), a4);

    [(PKPassGroupStackView *)self layoutContentForCurrentPresentationState:1];
    objc_destroyWeak(v47);

    objc_destroyWeak(&v51);
    objc_destroyWeak((id *)buf);
  }
}

void __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = (void *)WeakRetained[322];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 56)) {
      [v3 insertSubview:v4 aboveSubview:v5];
    }
    else {
      [v3 insertSubview:v4 belowSubview:v5];
    }
    id WeakRetained = v6;
  }
}

void __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 170000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke_3;
  v3[3] = &unk_1E59CF720;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[311] == *(id *)(a1 + 40))
  {
    uint64_t v4 = WeakRetained;
    uint64_t v3 = [WeakRetained[310] firstObject];
    if (v3)
    {
      [v4[310] removeObjectAtIndex:0];
      v3[2](v3);
      if (((_BYTE)v4[309] & 1) == 0 && ![v4[310] count]) {
        [v4 _arrangeGroups];
      }
    }

    id WeakRetained = v4;
  }
}

- (double)_setupSpringFactoryForPileAnimations:(id)a3 withMaximumAcceleration:(double)a4 reverse:(BOOL)a5
{
  id v8 = a3;
  double v9 = 0.0;
  if (v8 && [(NSMutableArray *)self->_passPileViews count])
  {
    unint64_t v10 = [(PKPassGroupStackView *)self _maximumNumberOfVisiblePilePasses];
    unint64_t v11 = [(NSMutableArray *)self->_passPileViews count];
    if (v10 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
    double v13 = -[NSMutableArray subarrayWithRange:](self->_passPileViews, "subarrayWithRange:", 0, v12);
    double v14 = 0;
    if (v11 > v10)
    {
      double v14 = -[NSMutableArray subarrayWithRange:](self->_passPileViews, "subarrayWithRange:", v10 - 1, v11 - v10);
    }
    if (!a5)
    {
      double v15 = [v13 reverseObjectEnumerator];
      uint64_t v16 = [v15 allObjects];

      double v13 = (void *)v16;
    }
    uint64_t v17 = [v13 count];
    if (!v17) {
      goto LABEL_29;
    }
    if (a4 == 0.0)
    {
      unint64_t v18 = v17 - 1;
      if (v17 != 1)
      {
        double v19 = 0.18 / (double)v18;
        if (v19 > 0.03) {
          double v19 = 0.03;
        }
        goto LABEL_22;
      }
      double v19 = 0.03;
    }
    else
    {
      unint64_t v18 = v17 - 1;
      if (v17 != 1)
      {
        if (0.6 / (double)(v18 * v17) >= a4) {
          double v19 = a4;
        }
        else {
          double v19 = 0.6 / (double)(v18 * v17);
        }
LABEL_22:
        double v20 = dbl_1A0444380[a4 != 0.0] / (double)(v18 * v17);
        goto LABEL_23;
      }
      double v19 = a4;
    }
    double v20 = a4;
LABEL_23:
    if (v20 < a4) {
      a4 = v20;
    }
    double v21 = v19 * (double)v18;
    unint64_t v22 = (v18 * v17) >> 1;
    if (a4 == 0.0) {
      double v9 = v21;
    }
    else {
      double v9 = v19 + (double)v22 * a4;
    }
    double v23 = self->_modallyPresentedGroupView;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __93__PKPassGroupStackView__setupSpringFactoryForPileAnimations_withMaximumAcceleration_reverse___block_invoke;
    v26[3] = &unk_1E59D62F0;
    double v30 = v19;
    double v31 = a4;
    id v27 = v13;
    long long v28 = v23;
    BOOL v33 = a5;
    id v29 = v14;
    double v32 = v9;
    double v24 = v23;
    [v8 setAnimationDelayHandler:v26];

LABEL_29:
  }

  return v9;
}

double __93__PKPassGroupStackView__setupSpringFactoryForPileAnimations_withMaximumAcceleration_reverse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = 0.0;
  if ([a3 isEqualToString:@"position"])
  {
    unint64_t v7 = [*(id *)(a1 + 32) indexOfObjectIdenticalTo:v5];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*(id *)(a1 + 40) == v5
        || *(unsigned char *)(a1 + 80)
        && [*(id *)(a1 + 48) indexOfObjectIdenticalTo:v5] != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v6 = *(double *)(a1 + 72);
      }
    }
    else
    {
      double v8 = *(double *)(a1 + 56);
      double v9 = *(double *)(a1 + 64);
      if (v9 == 0.0) {
        double v6 = v8 * (double)v7;
      }
      else {
        double v6 = v8 + (double)((v7 + v7 * v7) >> 1) * v9;
      }
    }
  }

  return v6;
}

- (double)_setupSpringFactoryForExternalToTableAnimations:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    externalToTableTransitionModalGroupIndedouble x = self->_layoutState.externalToTableTransitionModalGroupIndex;
    id v6 = [(PKPassGroupStackView *)self _groupViewAtIndex:externalToTableTransitionModalGroupIndex];
    unint64_t v7 = [v6 frontmostPassView];
    double v8 = [v7 pass];
    uint64_t v9 = [v8 style];

    separatorIndedouble x = self->_layoutState.groups.separatorIndex;
    if (separatorIndex != 0x7FFFFFFFFFFFFFFFLL && separatorIndex == externalToTableTransitionModalGroupIndex)
    {
      double v18 = 800.0;
    }
    else
    {
      id v12 = [(PKPassGroupStackView *)self _groupViewAtIndex:externalToTableTransitionModalGroupIndex + 1];
      double v13 = v12;
      if (v12)
      {
        double v14 = [v12 layer];
        [v14 position];
        double v16 = v15;

        [(PKPassGroupStackView *)self _yPositionForGroupAtIndex:externalToTableTransitionModalGroupIndex + 1 forState:4];
        double v18 = v16 - v17;
      }
      else
      {
        double v18 = 800.0;
      }
    }
    double v20 = fmin(fmax((v18 + -50.0) / 750.0, 0.0), 1.0);
    if (v9) {
      double v21 = v20 * 0.08 + (1.0 - v20) * 0.28 + 0.1;
    }
    else {
      double v21 = v20 * 0.08 + (1.0 - v20) * 0.28;
    }
    double v22 = v20 * 0.8 + (1.0 - v20) * 0.6;
    [v4 stiffness];
    [v4 setStiffness:v23 * v22];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    CATransform3D v35[2] = __72__PKPassGroupStackView__setupSpringFactoryForExternalToTableAnimations___block_invoke;
    v35[3] = &unk_1E59D6318;
    unint64_t v37 = externalToTableTransitionModalGroupIndex;
    id v25 = v24;
    id v36 = v25;
    [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:v35];
    uint64_t v26 = [v25 count];
    if (v26)
    {
      double v27 = (double)(unint64_t)(v26 - 1);
      if (v26 == 1)
      {
        double v28 = 0.03;
      }
      else if (0.18 / v27 <= 0.03)
      {
        double v28 = 0.18 / v27;
      }
      else
      {
        double v28 = 0.03;
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __72__PKPassGroupStackView__setupSpringFactoryForExternalToTableAnimations___block_invoke_2;
      v30[3] = &unk_1E59D6340;
      double v32 = v21;
      id v31 = v25;
      double v33 = v28;
      uint64_t v34 = 0;
      [v4 setAnimationDelayHandler:v30];
      double v21 = v21 + v28 * v27;
    }
    double v19 = v21 + 0.1;
  }
  else
  {
    double v19 = 0.0;
  }

  return v19;
}

uint64_t __72__PKPassGroupStackView__setupSpringFactoryForExternalToTableAnimations___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (*(void *)(result + 40) < a3) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

double __72__PKPassGroupStackView__setupSpringFactoryForExternalToTableAnimations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = 0.0;
  if ([a3 isEqualToString:@"position"])
  {
    double v6 = *(double *)(a1 + 40);
    unint64_t v7 = [*(id *)(a1 + 32) indexOfObjectIdenticalTo:v5];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v8 = *(double *)(a1 + 48);
      double v9 = *(double *)(a1 + 56);
      if (v9 == 0.0) {
        double v10 = v8 * (double)v7;
      }
      else {
        double v10 = v8 + (double)((v7 + v7 * v7) >> 1) * v9;
      }
      double v6 = v6 + v10;
    }
  }

  return v6;
}

- (void)_setupSpringFactoryForTableToExternalAnimations:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_27;
  }
  [(PKPassGroupStackView *)self _yPositionForGroupAtIndex:self->_modalGroupIndex forState:4];
  double v6 = v5;
  [(PKPassGroupStackView *)self _yPositionForGroupAtIndex:self->_modalGroupIndex forState:7];
  double v8 = v7 - v6;
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView) {
    BOOL v10 = self->_modalGroupIndex != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v10 = 0;
  }
  BOOL v11 = v8 <= -75.0 && v10;
  id v12 = [(PKPassGroupView *)modallyPresentedGroupView frontmostPassView];
  double v13 = [v12 pass];
  uint64_t v14 = [v13 style];

  modalGroupIndedouble x = self->_modalGroupIndex;
  if (modalGroupIndex == 0x7FFFFFFFFFFFFFFFLL || v14 == 6)
  {
    if (v11)
    {
LABEL_19:
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      CATransform3D v25[2] = __72__PKPassGroupStackView__setupSpringFactoryForTableToExternalAnimations___block_invoke;
      v25[3] = &unk_1E59D60B0;
      v25[4] = self;
      id v17 = v19;
      id v26 = v17;
      [(PKPassGroupStackView *)self _reverseEnumerateLoadedGroupViews:v25];

      goto LABEL_20;
    }
  }
  else if (self->_layoutState.groups.count + ~modalGroupIndex < 6 && v11)
  {
    goto LABEL_19;
  }
  id v17 = 0;
LABEL_20:
  uint64_t v20 = [v17 count];
  if (v20)
  {
    if (v20 == 1)
    {
      double v21 = 0.016;
    }
    else
    {
      double v21 = 0.016;
      if (0.12 / (double)(unint64_t)(v20 - 1) <= 0.016) {
        double v21 = 0.12 / (double)(unint64_t)(v20 - 1);
      }
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__PKPassGroupStackView__setupSpringFactoryForTableToExternalAnimations___block_invoke_2;
    v22[3] = &unk_1E59D6368;
    id v23 = v17;
    double v24 = v21;
    [v4 setAnimationDelayHandler:v22];
  }
LABEL_27:
}

uint64_t __72__PKPassGroupStackView__setupSpringFactoryForTableToExternalAnimations___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (*(void *)(*(void *)(result + 32) + 2112) < a3) {
    return [*(id *)(result + 40) addObject:a2];
  }
  return result;
}

double __72__PKPassGroupStackView__setupSpringFactoryForTableToExternalAnimations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 isEqualToString:@"position"])
  {
    double v7 = *(void **)(a1 + 32);
    double v8 = 0.0;
    if (v7)
    {
      unint64_t v9 = [v7 indexOfObjectIdenticalTo:v5];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
        double v8 = *(double *)(a1 + 40) * (double)v9;
      }
    }
  }
  else if ([v6 isEqualToString:@"transform"])
  {
    double v8 = 0.13;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (id)_frontmostPastViewForGroupIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:");
    uint64_t v3 = [v4 frontmostPassView];
  }

  return v3;
}

- (BOOL)_isModalPresentationAllowed
{
  return ![(PKPassGroupStackView *)self isTableModalPresentation];
}

- (BOOL)_isModalPresentationAllowedForSingleGroup
{
  if (*((unsigned char *)&self->_layoutState + 24)) {
    return 1;
  }
  if (*((unsigned char *)&self->_layoutState.groups + 16)) {
    return ((*((unsigned __int16 *)&self->_layoutState + 32) >> 1) & 1)
  }
         + ((*((unsigned __int16 *)&self->_layoutState + 32) >> 2) & 1u) > 1;
  return 0;
}

- (id)_firstHeaderContext
{
  passHeaderContext = self->_passHeaderContext;
  if (self->_paymentHeaderContext) {
    passHeaderContext = self->_paymentHeaderContext;
  }
  uint64_t v3 = passHeaderContext;

  return v3;
}

- (void)_reverseEnumerateLoadedGroupViews:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, uint64_t, id))a3;
  id v19 = 0;
  id v5 = [(PKPassGroupStackView *)self _createSortedGroupViewIndexesWithMap:&v19];
  id v6 = (void *)MEMORY[0x1A6224460]();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v7 = objc_msgSend(v5, "reverseObjectEnumerator", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
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
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = [v19 objectForKeyedSubscript:v12];
        if (!v13) {
          __break(1u);
        }
        uint64_t v14 = (void *)v13;
        v4[2](v4, v13, [v12 unsignedIntegerValue], v5);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }
}

- (BOOL)_isIngestingPass
{
  return self->_presentationState == 6;
}

- (void)_disableScrollingAndNormalizeContentOffset
{
  [(PKPassGroupStackView *)self setScrollEnabled:0];
  [(PKPassGroupStackView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PKPassGroupStackView *)self contentInset];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(PKPassGroupStackView *)self contentSize];
  double v20 = fmin(fmax(v4, -v14), v18 + v19 - v8);
  double v22 = fmin(fmax(v6, -v12), v16 + v21 - v10);
  BOOL v23 = v6 != v22 || v4 != v20;
  int v24 = [(PKPassGroupStackView *)self isDecelerating];
  if (v23 || v24)
  {
    -[PKPassGroupStackView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v20, v22);
    if (v23)
    {
      -[PKPassGroupStackView _layoutContentFromOffset:toOffset:animated:](self, "_layoutContentFromOffset:toOffset:animated:", 1, v4, v6, v20, v22);
    }
  }
}

- (void)_setDefaultPaymentPassFromGroupView:(id)a3 reorderedGroupView:(id)a4
{
  id v6 = a4;
  double v7 = [a3 frontmostPassView];
  double v8 = [v7 pass];
  double v9 = [v8 paymentPass];

  char v10 = [v9 supportsBarcodePayment];
  if ([v9 supportsDefaultCardSelection] && !objc_msgSend(v9, "contactlessActivationState"))
  {
    double v19 = [(PKPaymentService *)self->_paymentService defaultPaymentPassUniqueIdentifier];
    paymentService = self->_paymentService;
    double v21 = [v9 uniqueID];
    [(PKPaymentService *)paymentService setDefaultPaymentPassUniqueIdentifier:v21];

    [(PKPassGroupStackView *)self setUserInteractionEnabled:0];
    dispatch_time_t v22 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_2;
    block[3] = &unk_1E59D4C90;
    void block[4] = self;
    char v28 = v10;
    id v25 = v9;
    id v26 = v19;
    id v27 = v6;
    id v11 = v19;
    dispatch_after(v22, MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v11 = [(UIView *)self pkui_viewControllerFromResponderChain];
    if (v11)
    {
      if (v10) {
        PKLocalizedAquamanString(&cfstr_DefaultAccount.isa);
      }
      else {
      double v12 = PKLocalizedPaymentString(&cfstr_DefaultCardCha.isa);
      }
      BOOL v23 = [v9 localizedDescription];
      double v13 = PKStringWithValidatedFormat();

      double v14 = PKLocalizedPaymentString(&cfstr_DefaultCardCha_0.isa);
      double v15 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1, v23);
      double v16 = (void *)MEMORY[0x1E4FB1410];
      double v17 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      CATransform3D v29[2] = __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke;
      v29[3] = &unk_1E59CB218;
      v29[4] = self;
      id v30 = v6;
      double v18 = [v16 actionWithTitle:v17 style:0 handler:v29];

      [v15 addAction:v18];
      [v11 presentViewController:v15 animated:1 completion:0];
    }
  }
}

uint64_t __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _undoUserReorderWithReorderedGroupView:*(void *)(a1 + 40)];
}

void __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = *(unsigned char **)(a1 + 32);
  if ((v2[2472] & 1) == 0)
  {
    double v3 = objc_msgSend(v2, "pkui_viewControllerFromResponderChain");
    if (!v3)
    {
      [*(id *)(a1 + 32) setUserInteractionEnabled:1];
LABEL_19:

      return;
    }
    if (*(unsigned char *)(a1 + 64)) {
      PKLocalizedAquamanString(&cfstr_DefaultAccount_0.isa);
    }
    else {
    double v4 = PKLocalizedPaymentString(&cfstr_DefaultCardCha_1.isa);
    }
    double v16 = [*(id *)(a1 + 40) localizedDescription];
    double v5 = PKStringWithValidatedFormat();

    if (objc_msgSend(*(id *)(a1 + 40), "isPrivateLabel", v16))
    {
      id v6 = @"DEFAULT_CARD_CHANGED_FROM_WALLET_MESSAGE_PRIVATE_LABEL";
    }
    else
    {
      if (*(unsigned char *)(a1 + 64))
      {
        uint64_t v7 = PKLocalizedAquamanString(&cfstr_DefaultAccount_1.isa);
LABEL_16:
        double v8 = (void *)v7;
        double v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v7 preferredStyle:1];
        char v10 = (void *)MEMORY[0x1E4FB1410];
        id v11 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
        double v12 = [v10 actionWithTitle:v11 style:1 handler:0];

        [v9 addAction:v12];
        if ([*(id *)(a1 + 40) isPrivateLabel])
        {
          double v13 = (void *)MEMORY[0x1E4FB1410];
          double v14 = PKLocalizedString(&cfstr_Cancel.isa);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_3;
          v18[3] = &unk_1E59CAC80;
          void v18[4] = *(void *)(a1 + 32);
          id v19 = *(id *)(a1 + 48);
          id v20 = *(id *)(a1 + 56);
          double v15 = [v13 actionWithTitle:v14 style:0 handler:v18];

          [v9 addAction:v15];
        }
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_4;
        v17[3] = &unk_1E59CA7D0;
        v17[4] = *(void *)(a1 + 32);
        [v3 presentViewController:v9 animated:1 completion:v17];

        goto LABEL_19;
      }
      id v6 = @"DEFAULT_CARD_CHANGED_FROM_WALLET_MESSAGE";
    }
    uint64_t v7 = PKLocalizedPaymentString(&v6->isa);
    goto LABEL_16;
  }

  [v2 setUserInteractionEnabled:1];
}

uint64_t __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_3(void *a1)
{
  [*(id *)(a1[4] + 2520) setDefaultPaymentPassUniqueIdentifier:a1[5]];
  dispatch_time_t v2 = (void *)a1[4];
  uint64_t v3 = a1[6];

  return [v2 _undoUserReorderWithReorderedGroupView:v3];
}

uint64_t __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserInteractionEnabled:1];
}

- (void)_undoUserReorderWithReorderedGroupView:(id)a3
{
  double v4 = (PKPassGroupView *)a3;
  double v5 = [(PKPassGroupStackView *)self delegate];
  [v5 groupStackViewDidBeginReordering:self];

  reorderedGroupView = self->_reorderedGroupView;
  self->_reorderedGroupView = v4;
  uint64_t v7 = v4;

  [(PKPassGroupStackView *)self _animateGroupViewForUndo:v7 toIndex:self->_initialIndexOfReorderedGroup];
  double v8 = self->_reorderedGroupView;
  self->_reorderedGroupView = 0;

  id v9 = [(PKPassGroupStackView *)self delegate];
  [v9 groupStackViewDidEndReordering:self];
}

- (id)_headerContextForPassType:(unint64_t)a3
{
  if (a3 == 1)
  {
    double v4 = &OBJC_IVAR___PKPassGroupStackView__paymentHeaderContext;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
    return v5;
  }
  if (!a3)
  {
    double v4 = &OBJC_IVAR___PKPassGroupStackView__passHeaderContext;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (void)_suspendTransition
{
  if (self->_transitionCanceller)
  {
    if (self->_hasSuspendedTransition) {
      [(PKPassGroupStackView *)self _cancelSuspendedTransition];
    }
    self->_hasSuspendedTransition = 1;
    (*((void (**)(void))self->_transitionCanceller + 2))();
    id transitionCanceller = self->_transitionCanceller;
    self->_id transitionCanceller = 0;

    double v4 = self->_transitionCompletionHandlers;
    objc_storeStrong((id *)&self->_transitionCompletionHandlers, self->_suspendedTransitionCompletionHandlers);
    suspendedTransitionCompletionHandlers = self->_suspendedTransitionCompletionHandlers;
    self->_suspendedTransitionCompletionHandlers = v4;
    id v6 = v4;

    self->_suspendedNextState = self->_nextState;
  }
}

- (void)_resumeSuspendedTransition
{
  if (self->_hasSuspendedTransition)
  {
    if (self->_transitionCanceller) {
      [(PKPassGroupStackView *)self _cancelTransition];
    }
    uint64_t v3 = self->_transitionCompletionHandlers;
    objc_storeStrong((id *)&self->_transitionCompletionHandlers, self->_suspendedTransitionCompletionHandlers);
    suspendedTransitionCompletionHandlers = self->_suspendedTransitionCompletionHandlers;
    self->_suspendedTransitionCompletionHandlers = v3;
    id v5 = v3;

    self->_nextState = self->_suspendedNextState;
  }
}

- (void)_cancelSuspendedTransition
{
  if (self->_hasSuspendedTransition)
  {
    self->_hasSuspendedTransition = 0;
    [(PKPassGroupStackView *)self _executeCompletionHandlers:self->_suspendedTransitionCompletionHandlers cancelled:1];
  }
}

- (void)paymentDeviceDidBecomeAvailable
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PKPassGroupStackView_paymentDeviceDidBecomeAvailable__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__PKPassGroupStackView_paymentDeviceDidBecomeAvailable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePassFooterViewIfNecessaryWithContext:0 becomeVisibleDelay:0.0];
}

- (void)paymentDeviceDidBecomeUnavailable
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKPassGroupStackView_paymentDeviceDidBecomeUnavailable__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__PKPassGroupStackView_paymentDeviceDidBecomeUnavailable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePassFooterViewIfNecessaryWithContext:0 becomeVisibleDelay:0.0];
}

- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKPassGroupStackView_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__PKPassGroupStackView_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 reloadGroupsForGroupStackView:*(void *)(a1 + 32)];
}

- (void)groupViewTapped:(id)a3
{
  double v4 = (PKPassGroupView *)a3;
  id v5 = v4;
  if ((*((_WORD *)&self->_layoutState + 32) & 0x100) == 0 && (*(unsigned char *)&self->_reorderingFlags & 1) == 0)
  {
    int64_t presentationState = self->_presentationState;
    if (presentationState != 6)
    {
      if (presentationState != 7
        || ((loanedGroupView = self->_loanedGroupView) != 0 ? (BOOL v8 = loanedGroupView == v4) : (BOOL v8 = 1), v8))
      {
        double v17 = v4;
        [(NSMutableDictionary *)self->_animatorsByGroupID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_198_0];
        id v5 = v17;
        if (v17)
        {
          if ((*((_WORD *)&self->_layoutState + 32) & 1) != 0 && (self->_presentationState | 2) == 7)
          {
            id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
            objc_msgSend(v9, "pkui_resetSharedRootAuthenticationContext");

            *((_WORD *)&self->_layoutState + 32) = *((_WORD *)&self->_layoutState + 32) & 0xF7FE | 0x800;
LABEL_20:
            [(PKPassGroupStackView *)self setPresentationState:4 animated:1];
LABEL_21:
            id v5 = v17;
            goto LABEL_22;
          }
          BOOL v10 = [(PKPassGroupStackView *)self _isModalPresentationAllowed];
          id v5 = v17;
          if (!v10) {
            goto LABEL_22;
          }
          int64_t v11 = self->_presentationState;
          if (v11 == 7 || v11 == 5) {
            goto LABEL_20;
          }
          if (v11 == 4)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
            int v14 = [WeakRetained isInField];
            int v15 = [WeakRetained supportsExternalPresentation];
            if (v15) {
              uint64_t v16 = 7;
            }
            else {
              uint64_t v16 = 5;
            }
            if (v15 && v14)
            {
              if ([(PKPassGroupStackView *)self canPerformPaymentForGroupAtIndex:[(PKPassGroupStackView *)self _indexOfGroupView:v17]])
              {
                uint64_t v16 = 5;
              }
              else
              {
                uint64_t v16 = 7;
              }
            }
            [(PKPassGroupStackView *)self _setModalGroupView:v17];
            [(PKPassGroupStackView *)self setPresentationState:v16 withContext:0 animated:1 completion:0];

            goto LABEL_21;
          }
        }
      }
    }
  }
LABEL_22:
}

void __40__PKPassGroupStackView_groupViewTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    -[PKPassGroupViewVerticalPanAnimator setDismissAnimation:](a3, 0);
  }
}

- (void)groupView:(id)a3 didUpdatePassView:(id)a4
{
  if (self->_passFooterViewVisible)
  {
    id v5 = objc_msgSend(a4, "pass", a3);
    id v9 = [v5 uniqueID];

    id v6 = [(PKPassFooterView *)self->_passFooterView configuration];
    uint64_t v7 = [v6 pass];
    BOOL v8 = [v7 uniqueID];

    if ([v9 isEqualToString:v8]) {
      [(PKPassGroupStackView *)self _updatePassFooterViewWithContext:0];
    }
  }
}

- (void)groupViewPressed:(id)a3
{
  if (self->_presentationState == 4)
  {
    id v4 = a3;
    [(PKPassGroupStackView *)self _unpressGroupView];
    int64_t v5 = [(PKPassGroupStackView *)self _indexOfGroupView:v4];

    self->_pressedGroupViewIndedouble x = v5;
    [(PKPassGroupStackView *)self layoutContentForCurrentPresentationState:1];
  }
}

- (void)_unpressGroupView
{
  if (self->_pressedGroupViewIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_pressedGroupViewIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    if (self->_presentationState == 4) {
      [(PKPassGroupStackView *)self layoutContentForCurrentPresentationState:1];
    }
  }
}

- (void)groupViewPanDidBegin:(id)a3
{
  id v5 = a3;
  if (self->_presentationState == 4 && (*(unsigned char *)&self->_reorderingFlags & 1) == 0)
  {
    id v20 = v5;
    objc_storeStrong((id *)&self->_reorderedGroupView, a3);
    *(unsigned char *)&self->_reorderingFlags = *(unsigned char *)&self->_reorderingFlags & 0xF0 | 1;
    self->_panningVelocitdouble y = (CGPoint)*MEMORY[0x1E4F1DAD8];
    unint64_t v6 = [(PKPassGroupStackView *)self _indexOfGroupView:v20];
    self->_unint64_t previousIndexOfReorderedGroup = v6;
    self->_initialIndexOfReorderedGroup = v6;
    [(PKPassGroupStackView *)self _unpressGroupView];
    [(PKPassGroupStackView *)self _adjustGroupViewsForReordering];
    uint64_t v7 = [(PKPassGroupStackView *)self delegate];
    [v7 groupStackViewDidBeginReordering:self];

    [(PKPassGroupStackView *)self _positionForGroupView:v20 atIndex:self->_previousIndexOfReorderedGroup forState:4];
    double v9 = v8;
    double v11 = v10 + -15.0;
    double v12 = [v20 frontmostPassView];
    double v13 = [v12 pass];
    [v13 loadContentSync];

    [v12 setContentMode:5];
    int v14 = [v20 layer];
    int v15 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"position"];
    [v14 position];
    objc_msgSend(v15, "pkui_updateForAdditiveAnimationFromPoint:toPoint:");
    id v16 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v15);
    objc_msgSend(v14, "setPosition:", v9, v11);
    double v17 = [(PKPassGroupStackView *)self superview];
    -[PKPassGroupStackView convertPoint:toView:](self, "convertPoint:toView:", v17, v9, v11);
    self->_reorderedGroupViewPositionInFrame.double x = v18;
    self->_reorderedGroupViewPositionInFrame.double y = v19;

    [(PKPassGroupStackView *)self _updateTopContentSeparatorVisibilityAnimated:1];
    id v5 = v20;
  }
}

- (void)groupViewPanDidEnd:(id)a3
{
  id v4 = (PKPassGroupView *)a3;
  if (self->_reorderedGroupView == v4)
  {
    double v39 = v4;
    unint64_t v5 = [(PKPassGroupStackView *)self _indexOfReorderedGroupView];
    *(unsigned char *)&self->_reorderingFlags &= ~1u;
    reorderedGroupView = self->_reorderedGroupView;
    self->_reorderedGroupView = 0;

    uint64_t v7 = [(PKPassGroupView *)v39 layer];
    if ([(PKPassGroupStackView *)self _recomputeLayoutState])
    {
      [(PKPassGroupStackView *)self _updateContentSizeAndLayout:1 forceUpdate:1];
      [(PKPassGroupStackView *)self _positionForGroupView:v39 atIndex:v5 forState:4];
      double v9 = v8;
      double v11 = v10;
    }
    else
    {
      [(PKPassGroupStackView *)self _positionForGroupView:v39 atIndex:v5 forState:4];
      double v9 = v12;
      double v11 = v13;
      [v7 position];
      double v16 = *(double *)v14.i64;
      double v17 = *(double *)v15.i64;
      if (v11 == *(double *)v15.i64)
      {
        double v19 = 0.0;
      }
      else
      {
        *(double *)v14.i64 = v11 - *(double *)v15.i64;
        *(double *)v15.i64 = fmax(vabdd_f64(v11, *(double *)v15.i64), 20.0);
        v18.f64[0] = NAN;
        v18.f64[1] = NAN;
        double v19 = self->_panningVelocity.y / *(double *)vbslq_s8((int8x16_t)vnegq_f64(v18), v15, v14).i64;
      }
      id v20 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
      [v20 setVelocity:v19];
      double v21 = [v20 springAnimationWithKeyPath:@"position"];
      objc_msgSend(v21, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v16, v17, v9, v11);
      id v22 = (id)objc_msgSend(v7, "pkui_addAdditiveAnimation:", v21);
    }
    objc_msgSend(v7, "setPosition:", v9, v11);
    [(PKPassGroupStackView *)self _stopAutoscrollTimer];
    BOOL v23 = [(PKPassGroupView *)v39 frontmostPassView];
    int v24 = [v23 pass];

    if ([v24 passType] == 1)
    {
      if (self->_layoutState.groups.count)
      {
        uint64_t v25 = 0;
        while (1)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
          id v27 = [WeakRetained groupAtIndex:v25];

          char v28 = [v27 passAtIndex:0];
          if ([v28 passType] == 1
            && [v28 style] == 6
            && ![v28 contactlessActivationState])
          {
            break;
          }

          if (self->_layoutState.groups.count <= ++v25) {
            goto LABEL_15;
          }
        }

        int v29 = 1;
      }
      else
      {
LABEL_15:
        int v29 = 0;
      }
      id v30 = objc_loadWeakRetained((id *)&self->_datasource);
      uint64_t v31 = [v30 indexOfSeparationGroup];

      if (v29)
      {
        unint64_t initialIndexOfReorderedGroup = self->_initialIndexOfReorderedGroup;
        BOOL v33 = v5 == v31 || initialIndexOfReorderedGroup == v31;
        if (v33 && initialIndexOfReorderedGroup != v5)
        {
          id v35 = objc_loadWeakRetained((id *)&self->_datasource);
          id v36 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", [v35 indexOfSeparationGroup]);

          unint64_t v37 = [v36 frontmostPassView];
          [v37 setContentMode:5];

          [(PKPassGroupStackView *)self _setDefaultPaymentPassFromGroupView:v36 reorderedGroupView:v39];
        }
      }
    }
    if (![(NSMutableArray *)self->_reorderActions count]) {
      [(PKPassGroupStackView *)self _arrangeGroups];
    }
    double v38 = [(PKPassGroupStackView *)self delegate];
    [v38 groupStackViewDidEndReordering:self];

    [(PKPassGroupStackView *)self _updateTopContentSeparatorVisibilityAnimated:1];
    [(PKPassGroupStackView *)self _updatePausedState];

    id v4 = v39;
  }
}

- (BOOL)groupViewShouldAllowPanning:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKPassGroupStackView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v5 groupStackViewShouldAllowReordering:self])
  {
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  unint64_t count = self->_layoutState.groups.count;
  if (self->_layoutState.groups.separatorIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = [(PKPassGroupStackView *)self _indexOfGroupView:v4];
    separatorIndedouble x = self->_layoutState.groups.separatorIndex;
    if (v7 <= separatorIndex) {
      unint64_t count = separatorIndex + 1;
    }
    else {
      count += ~separatorIndex;
    }
  }
  BOOL v9 = 0;
  if ((*(unsigned char *)&self->_reorderingFlags & 1) == 0 && count >= 2)
  {
    if (!self->_reorderedGroupView)
    {
      BOOL v9 = self->_presentationState == 4;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_12:

  return v9;
}

- (void)groupView:(id)a3 panned:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  BOOL v9 = (PKPassGroupView *)a3;
  char reorderingFlags = (char)self->_reorderingFlags;
  if ((reorderingFlags & 1) != 0 && self->_reorderedGroupView == v9)
  {
    double v12 = self->_reorderedGroupViewPositionInFrame.x;
    double v11 = self->_reorderedGroupViewPositionInFrame.y;
    BOOL v13 = (reorderingFlags & 4) == 0 && y < 0.0;
    if (v13) {
      reorderingFlags |= 4u;
    }
    BOOL v14 = (reorderingFlags & 8) == 0 && y > 0.0;
    if (v14) {
      reorderingFlags |= 8u;
    }
    if (v13 || v14) {
      *(unsigned char *)&self->_char reorderingFlags = reorderingFlags;
    }
    double v15 = v7 + v11;
    int v16 = reorderingFlags & 0xA;
    uint64_t v25 = v9;
    if (v16 == 8)
    {
      *(unsigned char *)&self->_char reorderingFlags = reorderingFlags | 2;
      double v15 = v15 + 15.0;
      self->_reorderedGroupViewPositionInFrame.double y = self->_reorderedGroupViewPositionInFrame.y + 15.0;
    }
    [(PKPassGroupStackView *)self frame];
    if (v15 >= CGRectGetMaxY(v27) + -55.0)
    {
      [(PKPassGroupStackView *)self frame];
      double v15 = CGRectGetMaxY(v28) + -55.0;
    }
    double v17 = [(PKPassGroupStackView *)self superview];
    -[PKPassGroupStackView convertPoint:fromView:](self, "convertPoint:fromView:", v17, v12, v15);
    double v19 = v18;
    double v21 = v20;

    id v22 = [(PKPassGroupView *)self->_reorderedGroupView layer];
    if (v16 == 8)
    {
      BOOL v23 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"position"];
      [v22 position];
      objc_msgSend(v23, "pkui_updateForAdditiveAnimationFromPoint:toPoint:");
      id v24 = (id)objc_msgSend(v22, "pkui_addAdditiveAnimation:", v23);
    }
    objc_msgSend(v22, "setPosition:", v19, v21);
    self->_panningVelocity.double x = x;
    self->_panningVelocity.double y = y;
    [(PKPassGroupStackView *)self _updateTopContentSeparatorVisibilityAnimated:0];
    if (self->_autoscrollTimer) {
      [(PKPassGroupStackView *)self _autoscrollIfNecessary];
    }
    else {
      -[PKPassGroupStackView _reorderPositionChangedForReorderedGroupViewWithVelocity:](self, "_reorderPositionChangedForReorderedGroupViewWithVelocity:", x, y);
    }

    BOOL v9 = v25;
  }
}

- (void)reloadSuppressedContentForGroupView:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 frontmostPassView];
  uint64_t v6 = [v5 suppressedContent];

  unint64_t v7 = [(PKPassGroupStackView *)self groupViewPassesSuppressedContent:v4];
  if (v7 != v6)
  {
    unint64_t v8 = v7;
    BOOL v9 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PKPassGroupStackView_reloadSuppressedContentForGroupView___block_invoke;
    v10[3] = &unk_1E59CB460;
    id v11 = v4;
    unint64_t v12 = v8;
    objc_msgSend(v9, "pkui_animateUsingOptions:animations:completion:", 0, v10, 0);
  }
}

void __60__PKPassGroupStackView_reloadSuppressedContentForGroupView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) frontmostPassView];
  [v2 setSuppressedContent:*(void *)(a1 + 40)];
}

- (int64_t)groupViewContentModeForFrontmostPassWhenPiled:(id)a3 withDefaultContentMode:(int64_t)a4
{
  uint64_t v6 = [a3 group];
  unint64_t v7 = [(PKPassGroupStackView *)self _separatorGroup];
  if (v6 == v7)
  {
    a4 = 4;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
    BOOL v9 = objc_msgSend(WeakRetained, "groupAtIndex:", -[PKPassGroupStackView _lastIndex](self, "_lastIndex"));
    if (v6 == v9) {
      a4 = 4;
    }
  }
  return a4;
}

- (void)groupView:(id)a3 frontmostPassViewDidChange:(id)a4 withContext:(id)a5
{
  -[PKPassGroupStackView _updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:](self, "_updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:", a5, a4, 0.0);

  [(PKPassGroupStackView *)self _refreshBacklightForFrontmostPassGroup];
}

- (void)groupView:(id)a3 deleteButtonPressedForPass:(id)a4
{
  if ((*((_WORD *)&self->_layoutState + 32) & 0x100) == 0)
  {
    *((_WORD *)&self->_layoutState + 32) |= 0x100u;
    id v5 = a3;
    [(PKPassGroupStackView *)self _updatePassFooterViewWithContext:0];
    uint64_t v6 = [PKPassDeleteAnimationController alloc];
    unint64_t v7 = [v5 frontmostPassView];
    unint64_t v8 = [(PKPassDeleteAnimationController *)v6 initWithPassView:v7 groupView:v5];

    deleteAnimationController = self->_deleteAnimationController;
    self->_deleteAnimationController = v8;

    [(PKPassDeleteAnimationController *)self->_deleteAnimationController setDelegate:self];
    id v10 = [(UIView *)self pkui_viewControllerFromResponderChain];
    [(PKPassDeleteAnimationController *)self->_deleteAnimationController showInViewController:v10];
    [(PKPassGroupStackView *)self setUserInteractionEnabled:0];
  }
}

- (BOOL)groupView:(id)a3 deleteButtonEnabledForPass:(id)a4
{
  return 1;
}

- (void)groupViewDidUpdatePageControlVisibility:(id)a3
{
  id v4 = (PKPassGroupView *)a3;
  if (self->_modallyPresentedGroupView == v4 && (self->_presentationState | 2) == 7)
  {
    id v5 = v4;
    [(PKPassGroupStackView *)self layoutContentForCurrentPresentationState:1];
    id v4 = v5;
  }
}

- (void)groupViewExpandButtonTapped:(id)a3
{
  id v4 = (PKPassGroupView *)a3;
  int64_t presentationState = self->_presentationState;
  if (presentationState == 7 || presentationState == 5)
  {
    char v7 = 0;
  }
  else
  {
    if (presentationState != 4) {
      goto LABEL_12;
    }
    unint64_t v8 = v4;
    char v7 = ![(PKPassGroupStackView *)self isTableModalPresentation];
    id v4 = v8;
  }
  if (self->_modallyPresentedGroupView == v4 && (v7 & 1) == 0)
  {
    BOOL v9 = v4;
    [(PKPassFooterView *)self->_passFooterView showFullScreenBarcode];
    id v4 = v9;
  }
LABEL_12:
}

- (void)passFooterViewDidChangePhysicalButtonRequirement:(id)a3
{
}

- (void)passFooterViewDidChangePhysicalButtonRequirement:(id)a3 withContext:(id)a4
{
  id v10 = (PKPassFooterView *)a3;
  id v6 = a4;
  if ([(PKPassGroupStackView *)self isPresentingPassViewFront]
    && self->_passFooterView == v10)
  {
    if ([(PKPassFooterView *)v10 isPhysicalButtonRequired])
    {
      unint64_t v8 = (_WORD *)((char *)&self->_layoutState + 64);
      __int16 v7 = *((_WORD *)&self->_layoutState + 32);
      if (self->_passFooterViewVisible != ((v7 & 0x200) == 0)) {
        goto LABEL_11;
      }
      if (self->_passFooterViewVisible) {
        __int16 v9 = 1536;
      }
      else {
        __int16 v9 = 1024;
      }
    }
    else
    {
      unint64_t v8 = (_WORD *)((char *)&self->_layoutState + 64);
      __int16 v7 = *((_WORD *)&self->_layoutState + 32);
      if ((v7 & 0x200) == 0) {
        goto LABEL_11;
      }
      __int16 v9 = 1024;
    }
    *unint64_t v8 = v9 | v7 & 0xF9FF;
    [(PKPassGroupStackView *)self setPresentationState:5 withContext:v6 animated:1 completion:0];
    *v8 &= ~0x400u;
  }
LABEL_11:
}

- (void)passFooterViewDidChangeCoachingState:(id)a3
{
  if (self->_passFooterView == a3) {
    [(PKPassGroupStackView *)self _updateCoachingState];
  }
}

- (BOOL)isPassFooterViewInGroup:(id)a3
{
  uint64_t v3 = [(PKPassGroupView *)self->_modallyPresentedGroupView group];
  BOOL v4 = (unint64_t)[v3 passCount] > 1;

  return v4;
}

- (unint64_t)suppressedContentForPassFooter:(id)a3
{
  uint64_t v3 = [(PKPassGroupStackView *)self delegate];
  unint64_t v4 = [v3 suppressedContent];

  return v4;
}

- (void)passFooterViewDidChangePileSuppressionRequirement:(id)a3
{
  uint64_t v4 = [a3 requestPileSuppression];

  [(PKPassGroupStackView *)self setPilingMode:v4];
}

- (void)passFooterViewDidSucceedAtAuthorization:(id)a3
{
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  id v5 = [a3 configuration];
  id v6 = [v5 pass];
  [(PKPassGroupView *)modallyPresentedGroupView setPassViewExpanded:1 forPass:v6 animated:1];

  [(PKPassGroupStackView *)self _refreshBacklightForFrontmostPassGroup];
}

- (void)passFooterViewDidEndAuthorization:(id)a3
{
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  id v5 = [a3 configuration];
  id v6 = [v5 pass];
  [(PKPassGroupView *)modallyPresentedGroupView setPassViewExpanded:0 forPass:v6 animated:1];

  [(PKPassGroupStackView *)self _refreshBacklightForFrontmostPassGroup];
}

- (void)deleteAnimationControllerWillBeginDeleteAnimation:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 passView];
  id v5 = [v4 pass];
  uint64_t v6 = [v5 style];

  if (v6 == 6)
  {
    __int16 v7 = [v13 groupView];
    unint64_t v8 = [(PKPassGroupStackView *)self _indexOfGroupView:v7];

    if (v8)
    {
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v9 = [(PKPassGroupStackView *)self _groupViewAtIndex:v8 - 1];
        id v10 = [v9 frontmostPassView];
        uint64_t v11 = [v10 contentMode];
        if (v11 <= 4) {
          uint64_t v12 = 4;
        }
        else {
          uint64_t v12 = v11;
        }
        [v10 setContentMode:v12];
      }
    }
  }
}

- (void)deleteAnimationController:(id)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  uint64_t v6 = self->_deleteAnimationController;
  deleteAnimationController = self->_deleteAnimationController;
  self->_deleteAnimationController = 0;

  *((_WORD *)&self->_layoutState + 32) &= ~0x100u;
  [(PKPassGroupStackView *)self setUserInteractionEnabled:1];
  if (v4)
  {
    if (self->_presentationState == 4
      && [(PKPassGroupStackView *)self _shouldTablePresentationScroll])
    {
      [(PKPassGroupStackView *)self setScrollEnabled:1];
    }
    unint64_t v8 = [(PKPassGroupStackView *)self delegate];
    id v9 = [v11 passView];
    id v10 = [v9 pass];
    [v8 groupStackView:self deleteConfirmedForPass:v10];
  }
  [(PKPassGroupStackView *)self _refreshBacklightForFrontmostPassGroup];
}

- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4
{
  id v6 = a3;
  __int16 v7 = [a4 presentingViewController];
  unint64_t v8 = [(PKPassGroupView *)self->_modallyPresentedGroupView group];
  if (!v8
    || (([v6 uniqueID],
         id v9 = objc_claimAutoreleasedReturnValue(),
         uint64_t v10 = [v8 indexForPassUniqueID:v9],
         v9,
         v10 != 0x7FFFFFFFFFFFFFFFLL)
      ? (BOOL v11 = v7 == 0)
      : (BOOL v11 = 1),
        v11 || (*((_WORD *)&self->_layoutState + 32) & 0x100) != 0))
  {
    BOOL v15 = 0;
  }
  else
  {
    *((_WORD *)&self->_layoutState + 32) |= 0x100u;
    [(PKPassGroupStackView *)self _updatePassFooterViewIfNecessaryWithContext:0 becomeVisibleDelay:0.0];
    modalGroupIndedouble x = self->_modalGroupIndex;
    if (modalGroupIndex
      && [(PKPassGroupStackView *)self _isGroupAtIndexInModalPile:modalGroupIndex - 1])
    {
      id v13 = [(PKPassGroupStackView *)self _groupViewAtIndex:self->_modalGroupIndex - 1];
      BOOL v14 = [v13 frontmostPassView];

      if ([v14 contentMode] <= 3) {
        [v14 setContentMode:4];
      }
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__PKPassGroupStackView_handleDeletePassRequestWithPass_forViewController___block_invoke;
    v17[3] = &unk_1E59CA7D0;
    v17[4] = self;
    BOOL v15 = 1;
    [v7 dismissViewControllerAnimated:1 completion:v17];
  }

  return v15;
}

uint64_t __74__PKPassGroupStackView_handleDeletePassRequestWithPass_forViewController___block_invoke(uint64_t a1)
{
  id v2 = [PKPassDeleteAnimationController alloc];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 2096) frontmostPassView];
  uint64_t v4 = [(PKPassDeleteAnimationController *)v2 initWithPassView:v3 groupView:*(void *)(*(void *)(a1 + 32) + 2096)];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 2336);
  *(void *)(v5 + 2336) = v4;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 2336), "setDelegate:");
  [*(id *)(a1 + 32) setUserInteractionEnabled:0];
  __int16 v7 = *(void **)(*(void *)(a1 + 32) + 2336);

  return [v7 forceDeleteAnimation];
}

- (void)_paymentDidReceiveSuccessfulTransactionNotification:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [v16 object];
  if ([(PKPassFooterView *)self->_passFooterView isViewCurrentContentView:v4])
  {
    uint64_t v5 = [v16 userInfo];
    char v6 = [v5 PKBoolForKey:*MEMORY[0x1E4F879C0]];

    if ((v6 & 1) == 0)
    {
      __int16 v7 = v4;
      unint64_t v8 = v7;
      for (BOOL i = v7 != self; v8 && v8 != self; BOOL i = v8 != self)
      {
        uint64_t v10 = v8;
        unint64_t v8 = [(PKPassGroupStackView *)v8 superview];
      }
      if (!i)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
        int v12 = [WeakRetained supportsExternalPresentation];

        if (v12)
        {
          [(PKPassGroupStackView *)self setPresentationState:7 animated:1];
        }
        else
        {
          passFooterView = self->_passFooterView;
          if (passFooterView)
          {
            BOOL v14 = [(PKPassFooterView *)passFooterView configuration];
            uint64_t v15 = [v14 state];

            if (v15 == 4) {
              [(PKPassGroupStackView *)self _updatePassFooterViewWithContext:0];
            }
          }
        }
      }
    }
  }
}

- (void)evaluateBrightness
{
  if (PKRunningInViewService())
  {
    [(PKPassGroupStackView *)self _refreshBacklightForFrontmostPassGroup];
  }
}

- (void)resetBrightness
{
  if (PKRunningInViewService())
  {
    [(PKPassGroupStackView *)self _resetBrightness];
  }
}

- (void)_resetBrightness
{
  if (self->_wantsBacklightRamping)
  {
    uint64_t v3 = +[PKBacklightController sharedInstance];
    [v3 endRequestingBacklightRamping:self];

    self->_wantsBacklightRamping = 0;
  }
}

- (BOOL)_shouldRampForFrontmostPassView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pass];
  if ([(PKPassGroupStackView *)self _shouldRampForPass:v5])
  {
    char v6 = 1;
  }
  else
  {
    __int16 v7 = [v5 secureElementPass];
    if ([v7 supportsBarcodePayment]) {
      char v6 = [v4 isFrontFaceExpanded];
    }
    else {
      char v6 = 0;
    }
  }
  return v6;
}

- (BOOL)_shouldRampForPass:(id)a3
{
  id v3 = a3;
  id v4 = [v3 barcode];
  if (v4)
  {
    int v5 = PKValueAddedServicesEnabledForPass();

    if (v5)
    {
      LOBYTE(v4) = 0;
    }
    else if ([v3 passType] == 1)
    {
      char v6 = [v3 secureElementPass];
      LODWORD(v4) = [v6 isAccessPass] ^ 1;
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }

  return (char)v4;
}

- (void)_refreshBacklightForFrontmostPassGroup
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPassGroupView *)self->_modallyPresentedGroupView frontmostPassView];
  id v4 = [v3 pass];
  if ([(PKPassGroupStackView *)self _shouldRampForFrontmostPassView:v3])
  {
LABEL_13:
    int v12 = [v4 uniqueID];
    id v13 = [(PKPass *)self->_passToBeDeletedExternally uniqueID];
    id v6 = v12;
    id v14 = v13;
    uint64_t v15 = v14;
    if (v6 == v14)
    {
    }
    else
    {
      if (v6) {
        BOOL v16 = v14 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (v16)
      {

        BOOL v11 = 1;
        double v17 = v6;
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      int v18 = [v6 isEqualToString:v14];

      if (!v18)
      {
        BOOL v11 = 1;
        goto LABEL_24;
      }
    }
    double v17 = [(PKPassGroupView *)self->_modallyPresentedGroupView group];
    BOOL v11 = (unint64_t)[v17 passCount] > 1;
    goto LABEL_23;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v5 = [(PKPassGroupView *)self->_modallyPresentedGroupView group];
  id v6 = [v5 passes];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        if (*(void **)(*((void *)&v19 + 1) + 8 * i) != v4
          && -[PKPassGroupStackView _shouldRampForPass:](self, "_shouldRampForPass:"))
        {

          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_25:

  [(PKPassGroupStackView *)self _rampBacklightIfNecessary:v11];
}

- (BOOL)presentedPassCanPerformPayment
{
  return [(PKPassGroupStackView *)self canPerformPaymentForGroupAtIndex:self->_modalGroupIndex];
}

- (BOOL)canPerformPaymentForGroupAtIndex:(unint64_t)a3
{
  id v4 = [(PKPassGroupStackView *)self _groupViewAtIndex:a3];
  int v5 = [v4 frontmostPassView];

  if (v5)
  {
    id v6 = [(PKPassGroupStackView *)self _createPassFooterConfigurationForPassView:v5 withContext:0];
    uint64_t v7 = v6;
    if (v6)
    {
      BOOL v8 = 1;
      switch([v6 state])
      {
        case 1:
          uint64_t v10 = [v5 pass];
          BOOL v11 = [v10 paymentPass];

          int v12 = [v11 devicePrimaryContactlessPaymentApplication];
          if (!v12
            || ([v11 effectiveContactlessPaymentApplicationState],
                !PKPaymentApplicationStateIsPersonalized())
            || [v11 supportedRadioTechnologies] == 2)
          {
            id v13 = [v11 devicePrimaryBarcodePaymentApplication];
            id v14 = v13;
            if (!v13 || ([v13 state], !PKPaymentApplicationStateIsPersonalized())) {
              BOOL v8 = 0;
            }
          }
          break;
        case 2:
          break;
        default:
          goto LABEL_4;
      }
    }
    else
    {
LABEL_4:
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)presentedPassIsPerformingPayment
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPassFooterView *)self->_passFooterView configuration];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 state];
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      passFooterView = self->_passFooterView;
      int v10 = 134349568;
      BOOL v11 = self;
      __int16 v12 = 2050;
      id v13 = passFooterView;
      __int16 v14 = 2048;
      unint64_t v15 = v5;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPassGroupStackView (%{public}p:%{public}p): in state: %lu", (uint8_t *)&v10, 0x20u);
    }

    if (v5 <= 4) {
      unsigned int v8 = (0x16u >> v5) & 1;
    }
    else {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)interstitialControllerAvailable:(id)a3
{
  id v5 = a3;
  p_interstitialController = &self->_interstitialController;
  id v11 = v5;
  if (*p_interstitialController)
  {
    BOOL v7 = [(PKPGSVTransitionInterstitialController *)*p_interstitialController isInvalidated];
    id v5 = v11;
    if (v7)
    {
      unsigned int v8 = *p_interstitialController;
      *p_interstitialController = 0;

      id v5 = v11;
    }
  }
  char v9 = [v5 isInvalidated];
  int v10 = v11;
  if ((v9 & 1) == 0 && v11 && !*p_interstitialController)
  {
    objc_storeStrong((id *)p_interstitialController, a3);
    int v10 = v11;
  }
}

- (void)groupViewDidMoveToReceiver:(id)a3
{
}

- (void)groupViewNeedsAnimating:(id)a3 withVelocity:(double)a4 dragging:(BOOL)a5
{
  self->_modalGroupViewVelocitdouble y = a4;
  self->_modalGroupViewDragging = a5;
  BOOL v6 = [(PKPassGroupStackView *)self _shouldSwitchToTableStateFromExternalDismissal];
  int v7 = *((__int16 *)&self->_layoutState + 32);
  if (v6)
  {
    *((_WORD *)&self->_layoutState + 32) = v7 | 0x4000;
    uint64_t v8 = 4;
  }
  else
  {
    if ((v7 & 0x80000000) == 0) {
      return;
    }
    uint64_t v8 = 5;
  }
  id v9 = [(PKPassGroupStackView *)self _dismissModalGroupViewFromExternalToState:v8];
}

- (void)groupViewWillBeAvailable:(id)a3
{
  [(PKPassGroupStackView *)self _hideBackdropViewAnimated:1 delay:0.0];
  __int16 v4 = *((_WORD *)&self->_layoutState + 32);
  if ((v4 & 0x4000) != 0
    || (v5 = [(PKPassGroupStackView *)self _shouldSwitchToTableStateFromExternalDismissal], __int16 v4 = *((_WORD *)&self->_layoutState + 32), v5))
  {
    *((_WORD *)&self->_layoutState + 32) = v4 | 0x4000;
    self->_layoutState.externalToTableTransitionModalGroupIndedouble x = self->_modalGroupIndex;
    [(PKPassGroupStackView *)self setPresentationState:4 animated:1];
  }
  else
  {
    if ((*((_WORD *)&self->_layoutState + 32) & 0x8000) != 0)
    {
      BOOL v6 = [(PKPassGroupStackView *)self _dismissModalGroupViewFromExternalToState:5];
      uint64_t v7 = [(PKPassGroupStackView *)self _rangeOfVisibleIndexesIgnoringBottomInset:1];
      -[PKPassGroupStackView _generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:](self, "_generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:", v7, v8, 0);
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      __int16 v12 = __49__PKPassGroupStackView_groupViewWillBeAvailable___block_invoke;
      id v13 = &unk_1E59D60B0;
      __int16 v14 = self;
      id v15 = v6;
      id v9 = v6;
      [(PKPassGroupStackView *)self _enumerateLoadedGroupViews:&v10];
    }
    -[PKPassGroupStackView layoutHeaderFootersAnimated:](self, "layoutHeaderFootersAnimated:", 1, v10, v11, v12, v13, v14);
  }
}

void __49__PKPassGroupStackView_groupViewWillBeAvailable___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a2;
  id v7 = a4;
  if (*(id *)(*(void *)(a1 + 32) + 2096) != v11)
  {
    uint64_t v8 = (void *)MEMORY[0x1A6224460]();
    id v9 = *(void **)(a1 + 32);
    if ([v9 _isGroupAtIndexInModalPile:a3]) {
      uint64_t v10 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v10 = 0;
    }
    [v9 _updateGroupView:v11 toPresentationState:5 withSpringFactory:v10 atIndex:a3];
  }
}

- (void)groupViewIsAvailable:(id)a3
{
  id v4 = a3;
  if ([(PKPassGroupStackView *)self _acquireGroupView:v4 resetExternalVC:1])
  {
    interstitialController = self->_interstitialController;
    if (interstitialController)
    {
      if ([(PKPGSVTransitionInterstitialController *)interstitialController isInvalidated])
      {
        BOOL v6 = self->_interstitialController;
        self->_interstitialController = 0;
      }
      if (self->_interstitialController)
      {
        if (self->_presentationState != 7
          || (id WeakRetained = objc_loadWeakRetained((id *)&self->_externalVC), WeakRetained, !WeakRetained))
        {
          objc_initWeak(&location, self);
          uint64_t v8 = self->_interstitialController;
          headerContainerView = self->_headerContainerView;
          uint64_t v10 = MEMORY[0x1E4F143A8];
          uint64_t v11 = 3221225472;
          __int16 v12 = __45__PKPassGroupStackView_groupViewIsAvailable___block_invoke;
          id v13 = &unk_1E59D0F90;
          objc_copyWeak(&v14, &location);
          [(PKPGSVTransitionInterstitialController *)v8 transferToView:headerContainerView withDeactivationHandler:&v10];
          objc_destroyWeak(&v14);
          objc_destroyWeak(&location);
        }
      }
    }
    self->_modalGroupViewDragging = 0;
    self->_modalGroupViewVelocitdouble y = 0.0;
    if ([(PKPassGroupStackView *)self _shouldSwitchToTableStateFromExternalDismissal])
    {
      [(PKPassGroupStackView *)self setPresentationState:4 animated:1];
    }
    [(PKPassGroupStackView *)self _updatePausedState];
  }
}

void __45__PKPassGroupStackView_groupViewIsAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 267) == v5)
  {
    *((void *)WeakRetained + 267) = 0;
  }
}

- (BOOL)_shouldSwitchToTableStateFromExternalDismissal
{
  return self->_presentationState != 4 && *((unsigned __int16 *)&self->_layoutState + 32) < 0x4000u;
}

- (void)modalPresentationIsPending
{
  *((_WORD *)&self->_layoutState + 32) |= 0x8000u;
}

- (void)willDeletePass:(id)a3
{
  objc_storeStrong((id *)&self->_passToBeDeletedExternally, a3);

  [(PKPassGroupStackView *)self _refreshBacklightForFrontmostPassGroup];
}

- (void)didDeletePass:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassGroupStackView *)self delegate];
  [v5 groupStackView:self deleteConfirmedForPass:v4];

  passToBeDeletedExternalldouble y = self->_passToBeDeletedExternally;
  self->_passToBeDeletedExternalldouble y = 0;
}

- (void)dashboardPassViewController:(id)a3 didRequestPaymentForPass:(id)a4 fromButton:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(PKPassGroupStackView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 groupStackViewWantsPaymentPresentation:self fromButton:v5];
  }
}

- (void)_moveBackdropViewToFront
{
  [(PKPassthroughView *)self->_passContainerView addSubview:self->_backdropView];
  passContainerView = self->_passContainerView;
  backdropView = self->_backdropView;

  [(PKPassthroughView *)passContainerView bringSubviewToFront:backdropView];
}

- (void)_presentBackdropViewAnimated:(BOOL)a3 delay:(double)a4
{
  if (!self->_isPresentingBackdropView)
  {
    BOOL v5 = a3;
    [(PKPassGroupStackView *)self _moveBackdropViewToFront];
    if (v5)
    {
      self->_isPresentingBackdropView = 1;
      if (!self->_isHidingBackdropView) {
        [(PKPassGroupStackView *)self _resetBackdropViewToStart:1];
      }
      self->_timeBackdropViewLastPresented = CACurrentMediaTime();
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke;
      v9[3] = &unk_1E59CA7D0;
      void v9[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v9 options:0 animations:0.03 completion:a4];
      v7[4] = self;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      _OWORD v8[2] = __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke_2;
      v8[3] = &unk_1E59CA7D0;
      v8[4] = self;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      _OWORD v7[2] = __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke_3;
      v7[3] = &unk_1E59CB6D8;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v8 options:v7 animations:0.3 completion:a4];
    }
    else
    {
      [(PKPassGroupStackView *)self _resetBackdropViewToStart:0];
    }
  }
}

uint64_t __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 2664) setAlpha:1.0];
}

void __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 2664);
  id v2 = [(id)objc_opt_class() backdropEndBackgroundColor];
  [v1 setBackgroundColor:v2];
}

uint64_t __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 2673) = 0;
  return result;
}

- (void)_hideBackdropViewAnimated:(BOOL)a3 delay:(double)a4
{
  if (!self->_isHidingBackdropView)
  {
    if (a3)
    {
      double v5 = a4;
      double v6 = CACurrentMediaTime();
      double timeBackdropViewLastPresented = self->_timeBackdropViewLastPresented;
      double v8 = v6 - timeBackdropViewLastPresented;
      double v9 = 0.25;
      if (v6 - timeBackdropViewLastPresented >= 0.25)
      {
        double v10 = 0.15;
        double v8 = 0.1;
      }
      else
      {
        double v5 = 0.0;
        double v10 = 0.0;
        double v9 = v6 - timeBackdropViewLastPresented;
      }
      self->_isHidingBackdropView = 1;
      [(PKPassGroupStackView *)self _moveBackdropViewToFront];
      if (!self->_isPresentingBackdropView) {
        [(PKPassGroupStackView *)self _resetBackdropViewToStart:0];
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke;
      v14[3] = &unk_1E59CA7D0;
      v14[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v14 options:0 animations:v8 completion:v10];
      v12[4] = self;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke_2;
      v13[3] = &unk_1E59CA7D0;
      v13[4] = self;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke_3;
      v12[3] = &unk_1E59CB6D8;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v13 options:v12 animations:v9 completion:v5];
    }
    else
    {
      backdropView = self->_backdropView;
      [(PKBackdropView *)backdropView removeFromSuperview];
    }
  }
}

uint64_t __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 2664) setAlpha:0.0];
}

void __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 2664);
  id v2 = [(id)objc_opt_class() backdropStartBackgroundColor];
  [v1 setBackgroundColor:v2];
}

uint64_t __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 2673))
  {
    uint64_t v2 = result;
    unint64_t result = [*(id *)(v1 + 2664) removeFromSuperview];
    uint64_t v1 = *(void *)(v2 + 32);
  }
  *(unsigned char *)(v1 + 2672) = 0;
  return result;
}

- (void)_resetBackdropViewToStart:(BOOL)a3
{
  BOOL v3 = a3;
  backdropView = self->_backdropView;
  double v6 = objc_opt_class();
  if (v3)
  {
    id v7 = [v6 backdropStartBackgroundColor];
    double v8 = 0.0;
  }
  else
  {
    id v7 = [v6 backdropEndBackgroundColor];
    double v8 = 1.0;
  }
  [(PKBackdropView *)backdropView setBackgroundColor:v7];

  double v9 = self->_backdropView;

  [(PKBackdropView *)v9 setAlpha:v8];
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (PKDiscoveryDataSource)discoveryDatasource
{
  return self->_discoveryDatasource;
}

- (PKGroupsController)groupsController
{
  return self->_groupsController;
}

- (BOOL)footerSuppressed
{
  return self->_footerSuppressed;
}

- (BOOL)externalFooterSuppressed
{
  return self->_externalFooterSuppressed;
}

- (int64_t)coachingState
{
  return self->_coachingState;
}

- (UIColor)pageIndicatorTintColor
{
  return self->_pageIndicatorTintColor;
}

- (void)setPageIndicatorTintColor:(id)a3
{
}

- (UIColor)currentPageIndicatorTintColor
{
  return self->_currentPageIndicatorTintColor;
}

- (void)setCurrentPageIndicatorTintColor:(id)a3
{
}

- (double)topContentSeparatorHeight
{
  return self->_topContentSeparatorHeight;
}

- (BOOL)staggerPileAnimations
{
  return self->_staggerPileAnimations;
}

- (void)setStaggerPileAnimations:(BOOL)a3
{
  self->_staggerPileAnimations = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPageIndicatorTintColor, 0);
  objc_storeStrong((id *)&self->_pageIndicatorTintColor, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_discoveryDatasource, 0);
  objc_destroyWeak((id *)&self->_datasource);
  objc_storeStrong((id *)&self->_panningAnimation, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_passToBeDeletedExternally, 0);
  objc_storeStrong((id *)&self->_loanedGroupView, 0);
  objc_destroyWeak((id *)&self->_externalVC);
  objc_storeStrong((id *)&self->_featuredGroupID, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_passContainerView, 0);
  objc_storeStrong((id *)&self->_subheaderContainerView, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
  objc_storeStrong((id *)&self->_passFooterView, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_animatorsByGroupID, 0);
  objc_storeStrong((id *)&self->_groupViewsInFlightByGroupID, 0);
  objc_storeStrong((id *)&self->_reorderActions, 0);
  objc_storeStrong((id *)&self->_autoscrollTimer, 0);
  objc_storeStrong((id *)&self->_reorderedGroupView, 0);
  objc_storeStrong((id *)&self->_reusableCardViewQueue, 0);
  objc_storeStrong((id *)&self->_suspendedTransitionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_transitionCompletionHandlers, 0);
  objc_storeStrong(&self->_transitionCanceller, 0);
  objc_storeStrong((id *)&self->_deleteAnimationController, 0);
  objc_storeStrong((id *)&self->_bottomContentSeparatorVisibilityTimer, 0);
  objc_storeStrong((id *)&self->_footerPocketForegroundShadow, 0);
  objc_storeStrong((id *)&self->_footerPocketBackgroundShadow, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_interstitialController, 0);
  objc_storeStrong((id *)&self->_passHeaderContext, 0);
  objc_storeStrong((id *)&self->_paymentHeaderContext, 0);
  objc_storeStrong((id *)&self->_passPileViews, 0);
  objc_storeStrong((id *)&self->_modallyPresentedGroupView, 0);

  objc_storeStrong((id *)&self->_groupViewsByGroupID, 0);
}

- (void)scrollNext
{
  [(PKPassGroupStackView *)self contentOffset];
  double v4 = v3;
  double v6 = v5;
  [(PKPassGroupStackView *)self contentSize];
  int64_t scrollingTestState = self->_scrollingTestState;
  if (scrollingTestState == 1)
  {
    double v9 = v7;
    double v10 = v6 + 1.0;
    [(PKPassGroupStackView *)self bounds];
    if (v10 > v9 - v11)
    {
      int64_t scrollingTestState = self->_scrollingTestState;
      goto LABEL_5;
    }
  }
  else
  {
    double v10 = v6 + -1.0;
    if (v10 < 0.0)
    {
LABEL_5:
      if (scrollingTestState == 2)
      {
        [(PKPassGroupStackView *)self scrollDownTest];
      }
      else if (scrollingTestState == 1)
      {
        if (self->_currentTestReps > 2)
        {
          id v12 = [MEMORY[0x1E4FB1438] sharedApplication];
          [v12 finishedTest:@"ScrollCardList"];
        }
        else
        {
          [(PKPassGroupStackView *)self scrollUpTest];
        }
      }
      return;
    }
  }
  -[PKPassGroupStackView setContentOffset:](self, "setContentOffset:", v4, v10);

  [(PKPassGroupStackView *)self performSelector:sel_scrollNext withObject:0 afterDelay:0.0];
}

- (void)scrollDownTest
{
  self->_int64_t scrollingTestState = 1;
  [(PKPassGroupStackView *)self scrollNext];
}

- (void)scrollUpTest
{
  self->_int64_t scrollingTestState = 2;
  [(PKPassGroupStackView *)self scrollNext];
}

- (void)beginScrollCardListTest
{
  self->_currentTestReps = 0;
  [(PKPassGroupStackView *)self scrollDownTest];
}

- (void)testGoModal
{
  [(PKPassGroupStackView *)self setPresentationState:4 animated:1];
  if (self->_currentTestReps > 9)
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 finishedTest:@"SelectCard"];
  }
  else
  {
    [(PKPassGroupStackView *)self performSelector:sel_testGroupSelection withObject:0 afterDelay:0.5];
  }
}

- (void)testGroupSelection
{
  ++self->_currentTestReps;
  [(PKPassGroupStackView *)self setModalGroupIndex:2];
  [(PKPassGroupStackView *)self setPresentationState:5 animated:1];

  [(PKPassGroupStackView *)self performSelector:sel_testGoModal withObject:0 afterDelay:0.5];
}

- (void)beginSelectCardTest
{
  self->_currentTestReps = 0;
  [(PKPassGroupStackView *)self testGoModal];
}

- (void)gotoBaseTestState
{
  [(PKPassGroupStackView *)self setPresentationState:4 animated:0];
  [(PKPassGroupStackView *)self contentSize];

  -[PKPassGroupStackView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 0, 0.0, 0.0, v3, 10.0);
}

@end