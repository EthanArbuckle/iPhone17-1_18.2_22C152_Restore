@interface SFCapsuleCollectionView
- (BOOL)_canAnimateUpdates;
- (BOOL)_contentIsDismissed;
- (BOOL)_hasReachedTrailingActionPullThreshold;
- (BOOL)_isSendingTrailingAction;
- (BOOL)_layoutStyleIsTop;
- (BOOL)_selectedItemShouldUsePlatterEffect;
- (BOOL)_shouldAnimateKeyboardHeightChanges;
- (BOOL)_shouldDismissToolbar;
- (BOOL)_shouldDodgeKeyboard;
- (BOOL)_shouldGroupToolbarBackdropWithCapsules;
- (BOOL)_shouldInteractivelySquish;
- (BOOL)_shouldShowAlternateToolbarContent;
- (BOOL)_shouldToggleMinimizedWithTranslation:(double)a3 velocity:(double)a4 gestureEnded:(BOOL)a5;
- (BOOL)_shouldUseNormalLayoutForMinimizedCapsule;
- (BOOL)_suppressingDataSourceCalls;
- (BOOL)_translationIsAlmostHorizontal:(CGPoint)a3;
- (BOOL)_updateTrailingAction;
- (BOOL)alwaysShowTopBackdrop;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasTrailingAction;
- (BOOL)ignoresKeyboardHideEvents;
- (BOOL)isForceHidden;
- (BOOL)isInteractivelySelectingItem;
- (BOOL)isShowingAlternateToolbarContent;
- (BOOL)isTransitioningToNormalStateForTapInBottomRegion;
- (BOOL)itemsAreHidden;
- (BOOL)keepsCapsulesAboveKeyboard;
- (BOOL)selectedItemIsMinimized;
- (BOOL)selectedItemUsesLiftedPreviewAppearance;
- (BOOL)shouldDismissContent;
- (BOOL)showingLockdownStatusBar;
- (BOOL)suppressesSelectedItemUnfocus;
- (BOOL)usesFastDeceleration;
- (CGAffineTransform)_lockdownIndicatorTransform;
- (CGAffineTransform)_selectedItemContentTransform;
- (CGPoint)_offsetForPanFromLinkedPageView;
- (CGPoint)_panGestureTranslationConstrainedToPanAxis;
- (CGPoint)selectedCapsuleOffset;
- (CGRect)_bottomBackdropFrame;
- (CGRect)_bottomBackdropFrameForAlternateContent;
- (CGRect)_detachedCapsuleSelectionRect;
- (CGRect)_inputAccessoryViewFrame;
- (CGRect)_minimizedCapsuleFrameIgnoringKeyboard:(BOOL)a3;
- (CGRect)_passthroughRect;
- (CGRect)_selectedCapsuleFrame;
- (CGRect)_tapToShowBarBottomRegion;
- (CGRect)capsuleFrame;
- (CGRect)minimizedCapsuleFrame;
- (CGRect)selectedCapsuleFrame;
- (NSArray)_items;
- (NSIndexSet)_indexesOfAnimatingItems;
- (NSIndexSet)_indexesOfLoadedViews;
- (NSIndexSet)indexesOfVisibleItems;
- (NSNumber)toolbarOffsetForPinchTransition;
- (SFCapsuleCollectionView)initWithFrame:(CGRect)a3;
- (SFCapsuleCollectionViewDataSource)dataSource;
- (SFCapsuleCollectionViewDelegate)delegate;
- (SFCapsuleCollectionViewLinkablePageView)linkedPageView;
- (SFCapsuleCollectionViewToolbarContentProviding)alternateToolbarContentProvider;
- (SFLockdownStatusBar)lockdownStatusBar;
- (SFNavigationBarItem)navigationBarItem;
- (UIEdgeInsets)_insetsByApplyingSelectedItemOffsetToInsetsForState:(int64_t)a3 includeKeyboard:(BOOL)a4;
- (UIEdgeInsets)_layoutMarginsForState:(int64_t)a3;
- (UIEdgeInsets)_obscuredInsetsIgnoringAnimation;
- (UIEdgeInsets)obscuredInsets;
- (UIEdgeInsets)obscuredInsetsForState:(int64_t)a3;
- (UIEdgeInsets)obscuredInsetsForState:(int64_t)a3 ignoringKeyboard:(BOOL)a4;
- (UIEdgeInsets)obscuredInsetsIgnoringKeyboard;
- (UIView)toolbar;
- (UIView)toolbarBackdropView;
- (_SFBarTheme)minimizedTheme;
- (_SFBarTheme)theme;
- (_SFFluidProgressView)minimizedProgressView;
- (double)_additionalHeightFromAuxiliaryBarAtMinimizationPercent:(double)a3;
- (double)_auxiliaryBarSquishedHeightDecrease;
- (double)_distanceToTopEdgeIncludingDeceleration:(BOOL)a3;
- (double)_insetForCapsuleEdgeWithInsets:(UIEdgeInsets)a3;
- (double)_interCapsuleSpacing;
- (double)_keyboardHeight;
- (double)_keyboardHeightBelowCapsule;
- (double)_lockdownIndicatorBottomVerticalSpacingAtMinimizationPercent:(double)a3;
- (double)_lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:(double)a3;
- (double)_minimizedContentScale;
- (double)_offsetForMinimization;
- (double)_overscrollDistanceForTopEdge;
- (double)_percentToActivatingTopActionWithTranslation:(CGPoint)a3;
- (double)_percentToSelectItemIndex:(int64_t)a3;
- (double)_scaleFromLinkedPageView;
- (double)_selectedCapsuleHeightForWidth:(double)a3 state:(int64_t)a4 ignoringKeyboard:(BOOL)a5;
- (double)_selectedItemBackgroundAlpha;
- (double)_selectedItemContentMinimizationPercent;
- (double)_selectedItemMinimizationPercent;
- (double)_swipeTranslationFactorWithPercentToTopAction:(double)a3;
- (double)_toolbarBackdropAlpha;
- (double)_verticalOffsetForBottomBackdropIncludingKeyboard:(BOOL)a3;
- (double)_verticalOffsetForSelectedItem;
- (double)_verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:(double)a3 includeKeyboard:(BOOL)a4;
- (double)_verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:(double)a3;
- (double)_verticalPanOffsetForToolbar;
- (double)_verticalPanOffsetForToolbarBackdrop;
- (double)capsuleBackgroundCornerRadius;
- (double)capsuleCollectionView:(id)a3 heightForToolbarContentView:(id)a4;
- (double)capsuleWidth;
- (double)defaultCapsuleHeight;
- (double)focusedCapsuleTopOffset;
- (double)inactiveCapsuleAlpha;
- (double)minimizedCapsuleHeightAboveKeyboard;
- (double)pageWidth;
- (double)selectionThreshold;
- (id)_buttonPointerStyleProviderForContentView:(id)a3;
- (id)_coordinatorForUpdatingSelectedItemFromState:(int64_t)a3 toState:(int64_t)a4;
- (id)_indexesOfVisibleItemsIncludingAction:(BOOL)a3;
- (id)_indexesOfVisibleItemsWithSelectedItemIndex:(int64_t)a3;
- (id)_setSelectedItemStateWithoutPerformingTransition:(int64_t)a3 options:(int64_t)a4;
- (id)_superviewForCapsules;
- (id)_trailingActionContentView;
- (id)_visualEffectGroupName;
- (id)contentViewForItemAtIndex:(int64_t)a3;
- (id)createOrDequeueContentViewWithIdentifier:(id)a3 atIndex:(int64_t)a4;
- (id)detachViewForItemAtIndex:(int64_t)a3;
- (id)detachViewForItemAtIndex:(int64_t)a3 forInternalBorrow:(BOOL)a4;
- (id)hitTest:(CGPoint)a3 forCapsuleFrameWithEvent:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)inputAccessoryView;
- (id)toolbarContentViewForCapsuleCollectionView:(id)a3;
- (id)viewForItemAtIndex:(int64_t)a3;
- (int64_t)_indexOfCentermostItemWithTranslation:(double)a3;
- (int64_t)_indexOfTargetItemWithTranslation:(double)a3 roundingThreshold:(double)a4;
- (int64_t)_indexOfTargetItemWithTranslation:(double)a3 roundingThreshold:(double)a4 allowActionIndex:(BOOL)a5 allowOutOfBounds:(BOOL)a6;
- (int64_t)_insertionIndexForShadowInView:(id)a3;
- (int64_t)_keyboardBackdropStyle;
- (int64_t)_nextItemIndexForSelectionGesture;
- (int64_t)layoutStyle;
- (int64_t)minimizationStyle;
- (int64_t)selectedItemIndex;
- (int64_t)selectedItemState;
- (int64_t)selectionGestureLimit;
- (int64_t)selectionGestureState;
- (unint64_t)_capsuleAlphaOptionsForSelectionGesture;
- (unint64_t)_maximumNumberOfVisibleViews;
- (unint64_t)_softMaximumNumberOfViews;
- (unint64_t)numberOfItems;
- (unint64_t)selectionGestureAxis;
- (void)_animateSwitchingLinkedPageViewToItemAtIndex:(int64_t)a3;
- (void)_applyEffectsForChangeType:(int64_t)a3 update:(id)a4;
- (void)_applyToolbarTheme;
- (void)_createToolbarBackdropIfNeeded;
- (void)_decrementAnimationCountForItems:(id)a3;
- (void)_dequeueOrCreateViewForItem:(id)a3 atIndex:(int64_t)a4;
- (void)_didEndBackdropHeightAnimation;
- (void)_didReceiveDismissPan:(id)a3;
- (void)_didReceivePan:(id)a3;
- (void)_didReceiveTap:(id)a3;
- (void)_didReceiveTapOnPeekCapsule:(id)a3;
- (void)_discardExcessViewsForReuse;
- (void)_fetchContentViewForItem:(id)a3 atIndex:(int64_t)a4;
- (void)_incrementAnimationCountForItems:(id)a3;
- (void)_keyboardDidHide:(id)a3;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_layOutItems:(id)a3 atIndexes:(id)a4 selectedItemIndex:(int64_t)a5;
- (void)_layOutKeyboardBackdrop;
- (void)_layOutLockdownStatusBar;
- (void)_layOutMinimizedProgressView;
- (void)_layOutToolbar;
- (void)_performVisualEffectTransitionWithCoordinator:(id)a3;
- (void)_performWithoutSettingNeedsLayout:(id)a3;
- (void)_preferredContentSizeCategoryDidChange;
- (void)_reclaimViewForItem:(id)a3;
- (void)_reloadDataWithoutLayout;
- (void)_scheduleTimerToDiscardViewsForReuseIfNeeded;
- (void)_sendMinimizationDidEndToObservers;
- (void)_sendMinimizationDidUpdateToObservers;
- (void)_setCapsuleSafeAreaInsetsFrozen:(BOOL)a3;
- (void)_setIndexesOfLoadedViews:(id)a3;
- (void)_setKeyboardHeight:(double)a3;
- (void)_setOffsetForMinimization:(double)a3;
- (void)_setSuppressingDataSourceCalls:(BOOL)a3;
- (void)_setUpdateRequestActive:(BOOL)a3;
- (void)_updateActions;
- (void)_updateBackdropHeight;
- (void)_updateCanBlurCapsules;
- (void)_updateCapsuleAlpha;
- (void)_updateContentBlurRadius;
- (void)_updateDragWithOffset:(double)a3 velocity:(double)a4 ended:(BOOL)a5;
- (void)_updateKeyboardBackdropViewStyle;
- (void)_updateLayoutMargins;
- (void)_updateMinimizedProgressViewFillColor;
- (void)_updateOffsetForPan;
- (void)_updateRangeOfLoadedViews;
- (void)_updateShowsMinimizedProgressView;
- (void)_updateStateFlagsForContentViewAtIndex:(int64_t)a3;
- (void)_updateSuperviewForCapsule:(id)a3;
- (void)_updateToolbar;
- (void)_updateToolbarAlpha;
- (void)_updateToolbarTheme;
- (void)_updateTopAction;
- (void)_updateTrailingCapsule;
- (void)_updateVisualEffectGroupName;
- (void)_willBeginBackdropHeightAnimation;
- (void)addGestureObserver:(id)a3;
- (void)beginDraggingWithOffset:(double)a3;
- (void)beginUpdates;
- (void)beginVisualEffectTransition;
- (void)capsuleCollectionView:(id)a3 relinquishToolbarContentView:(id)a4;
- (void)deleteItemsAtIndexes:(id)a3 animated:(BOOL)a4;
- (void)didMoveToWindow;
- (void)endDraggingWithTargetOffset:(double)a3 velocity:(double)a4;
- (void)endScrolling;
- (void)endUpdates;
- (void)endVisualEffectTransition;
- (void)insertItemsAtIndexes:(id)a3 animated:(BOOL)a4;
- (void)installAlternateToolbarContentIfNeeded;
- (void)invalidateHeightForCapsuleContentView:(id)a3;
- (void)invalidateHeightForCapsuleContentView:(id)a3 animated:(BOOL)a4 animations:(id)a5 completion:(id)a6;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)reattachControls;
- (void)reattachView:(id)a3;
- (void)registerContentViewIdentifier:(id)a3 block:(id)a4;
- (void)relinquishAlternateToolbarContentIfNeeded;
- (void)reloadData;
- (void)reloadItemsAtIndexes:(id)a3;
- (void)removeGestureObserver:(id)a3;
- (void)safeAreaInsetsDidChange;
- (void)setAlternateToolbarContentProvider:(id)a3;
- (void)setAlwaysShowTopBackdrop:(BOOL)a3;
- (void)setCapsuleWidth:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusedCapsuleTopOffset:(double)a3;
- (void)setForceHidden:(BOOL)a3;
- (void)setIgnoresKeyboardHideEvents:(BOOL)a3;
- (void)setInactiveCapsuleAlpha:(double)a3;
- (void)setItemsAreHidden:(BOOL)a3;
- (void)setKeepsCapsulesAboveKeyboard:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setLinkedPageView:(id)a3;
- (void)setMinimizationStyle:(int64_t)a3;
- (void)setMinimizedTheme:(id)a3;
- (void)setNavigationBarItem:(id)a3;
- (void)setNeedsLayout;
- (void)setSelectedItemAccessoryView:(id)a3 forState:(int64_t)a4;
- (void)setSelectedItemIndex:(int64_t)a3;
- (void)setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setSelectedItemState:(int64_t)a3 animated:(BOOL)a4;
- (void)setSelectedItemState:(int64_t)a3 options:(int64_t)a4 animated:(BOOL)a5;
- (void)setSelectedItemUsesLiftedPreviewAppearance:(BOOL)a3 animator:(id)a4;
- (void)setSelectionGestureLimit:(int64_t)a3;
- (void)setSelectionThreshold:(double)a3;
- (void)setShouldDismissContent:(BOOL)a3;
- (void)setShouldDismissContent:(BOOL)a3 withDelay:(double)a4;
- (void)setShowingAlternateToolbarContent:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowingLockdownStatusBar:(BOOL)a3;
- (void)setSuppressesSelectedItemUnfocus:(BOOL)a3;
- (void)setTheme:(id)a3;
- (void)setToolbarOffsetForPinchTransition:(id)a3;
- (void)setUsesFastDeceleration:(BOOL)a3;
- (void)startPageViewControllerDidScroll:(id)a3;
- (void)takeOwnershipOfDetachedViewForItemAtIndex:(int64_t)a3;
- (void)updateDraggingWithOffset:(double)a3;
- (void)updateTrailingActionAnimated:(BOOL)a3;
- (void)updateVerticalSwipeThreshold;
@end

@implementation SFCapsuleCollectionView

- (int64_t)minimizationStyle
{
  return self->_minimizationStyle;
}

- (unint64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (SFCapsuleCollectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFCapsuleCollectionViewDelegate *)WeakRetained;
}

- (BOOL)_suppressingDataSourceCalls
{
  return self->_suppressingDataSourceCalls;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SFCapsuleCollectionView;
  [(SFCapsuleCollectionView *)&v18 layoutSubviews];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__SFCapsuleCollectionView_layoutSubviews__block_invoke;
  v17[3] = &unk_1E54E9858;
  v17[4] = self;
  [(SFCapsuleCollectionView *)self _performWithoutSettingNeedsLayout:v17];
  if ([(NSIndexSet *)self->_indexesOfLoadedViews count])
  {
    if (!self->_numberOfUpdates)
    {
      [(SFCapsuleCollectionView *)self _layOutItems:self->_items atIndexes:self->_indexesOfLoadedViews selectedItemIndex:self->_selectedItemIndex];
      [(SFCapsuleCollectionView *)self bounds];
      double v4 = v3;
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      v11 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
      v12 = [v11 capsuleView];
      objc_msgSend(v12, "ss_untransformedFrame");
      CGRectGetMinY(v19);
      UIEdgeInsetsMakeWithEdges();
      -[_UIVisualEffectBackdropView setFrame:](self->_backgroundCaptureView, "setFrame:", v4 + v16, v6 + v13, v8 - (v16 + v14), v10 - (v13 + v15));

      [(SFCapsuleCollectionView *)self _updateCapsuleAlpha];
      [(SFCapsuleCollectionView *)self _layOutKeyboardBackdrop];
      [(SFCapsuleCollectionView *)self _updateToolbarAlpha];
      [(SFCapsuleCollectionView *)self _layOutToolbar];
      [(SFCapsuleCollectionView *)self _layOutMinimizedProgressView];
      [(SFCapsuleCollectionView *)self _layOutLockdownStatusBar];
      [(SFCapsuleCollectionView *)self _updateContentBlurRadius];
    }
  }
}

- (void)_updateToolbarAlpha
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(SFCapsuleCollectionView *)self _shouldShowAlternateToolbarContent];
  [(SFCapsuleCollectionView *)self _toolbarBackdropAlpha];
  double v5 = v4;
  if (self->_keyboardHeight <= 0.0 || (double v6 = 0.0, self->_layoutStyle == 2))
  {
    if (v3) {
      double v6 = 0.0;
    }
    else {
      double v6 = v4;
    }
  }
  double v7 = (double)v3;
  [(UIView *)self->_toolbar alpha];
  if (v8 != v6
    || ([(UIView *)self->_toolbarBackdropView alpha], v9 != v5)
    || (alternateToolbarContentView = self->_alternateToolbarContentView) != 0
    && ([(UIView *)alternateToolbarContentView alpha], v11 != v7))
  {
    if (SFEnhancedTabOverviewEnabled())
    {
      double v12 = dbl_18C70E8E0[v6 == 0.0];
      double toolbarCrossfadeDelay = self->_toolbarCrossfadeDelay;
    }
    else
    {
      double toolbarCrossfadeDelay = 0.0;
      double v12 = 0.15;
    }
    double v14 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      double v17 = v6;
      __int16 v18 = 2048;
      double v19 = v5;
      __int16 v20 = 2048;
      double v21 = v7;
      _os_log_impl(&dword_18C354000, v14, OS_LOG_TYPE_DEFAULT, "Set _toolbar.alpha = %f, _toolbarBackdropView.alpha = %f, _alternateToolbarContentView.alpha = %f", buf, 0x20u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__SFCapsuleCollectionView__updateToolbarAlpha__block_invoke;
    v15[3] = &unk_1E54EA258;
    v15[4] = self;
    *(double *)&v15[5] = v6;
    *(double *)&v15[6] = v5;
    *(double *)&v15[7] = v7;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:50331654 delay:v15 options:0 animations:v12 completion:toolbarCrossfadeDelay];
  }
}

- (void)_updateContentBlurRadius
{
  if (SFEnhancedTabOverviewEnabled())
  {
    blurSpringBehavior = self->_blurSpringBehavior;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__SFCapsuleCollectionView__updateContentBlurRadius__block_invoke;
    v4[3] = &unk_1E54E9858;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringBehavior:blurSpringBehavior tracking:0 animations:v4 completion:0];
  }
}

- (double)_toolbarBackdropAlpha
{
  double result = 0.0;
  if (self->_selectedItemState != 2)
  {
    BOOL v3 = [(SFCapsuleCollectionView *)self _contentIsDismissed];
    double result = 1.0;
    if (v3) {
      return 0.0;
    }
  }
  return result;
}

- (void)_performWithoutSettingNeedsLayout:(id)a3
{
  BOOL ignoreSetNeedsLayout = self->_ignoreSetNeedsLayout;
  self->_BOOL ignoreSetNeedsLayout = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL ignoreSetNeedsLayout = ignoreSetNeedsLayout;
}

uint64_t __41__SFCapsuleCollectionView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLayoutMargins];
}

- (void)_updateLayoutMargins
{
  [(SFCapsuleCollectionView *)self bounds];
  double v7 = SFCapsuleSideMarginForViewWithBoundsSafeAreaInsets(v3, v4, v5, v6);
  [(SFCapsuleCollectionView *)self safeAreaInsets];
  double v9 = v8;
  [(SFCapsuleCollectionView *)self layoutMargins];
  BOOL v15 = v7 == v13 && v9 == v10 && v7 == v12;
  if (!v15 || v11 != 0.0)
  {
    -[SFCapsuleCollectionView setLayoutMargins:](self, "setLayoutMargins:", v9, v7, 0.0, v7);
  }
}

- (void)_layOutLockdownStatusBar
{
  BOOL v3 = [(SFCapsuleCollectionView *)self _layoutStyleIsTop];
  int64_t selectedItemState = self->_selectedItemState;
  BOOL v5 = [(SFCapsuleCollectionView *)self _contentIsDismissed];
  double v6 = 0.0;
  if (!self->_itemsAreHidden)
  {
    BOOL v7 = v5;
    if (![(SFCapsuleCollectionView *)self _shouldShowAlternateToolbarContent])
    {
      BOOL v8 = selectedItemState != 2 || v3;
      if (self->_offsetForPan.y == 0.0 && v8) {
        double v6 = (double)!v7;
      }
    }
  }
  [(SFLockdownStatusBar *)self->_lockdownStatusBar setAlpha:v6];
  double v10 = [(SFLockdownStatusBar *)self->_lockdownStatusBar superview];
  contentView = self->_contentView;

  if (v10 == contentView)
  {
    [(SFCapsuleCollectionView *)self _selectedItemMinimizationPercent];
    double v13 = v12;
    [(SFLockdownStatusBar *)self->_lockdownStatusBar preferredSize];
    double v15 = v14;
    [(SFCapsuleCollectionView *)self bounds];
    double Width = CGRectGetWidth(v26);
    if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop])
    {
      [(SFCapsuleCollectionView *)self _selectedCapsuleFrame];
      double MaxY = CGRectGetMaxY(v27);
      [(SFCapsuleCollectionView *)self _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:v13];
      double v19 = MaxY + v18;
      [(SFCapsuleCollectionView *)self _verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:v13];
    }
    else
    {
      [(UIView *)self->_toolbarBackdropView frame];
      double MinY = CGRectGetMinY(v28);
      [(SFCapsuleCollectionView *)self _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:v13];
      double v19 = MinY + v22;
      [(SFCapsuleCollectionView *)self _auxiliaryBarSquishedHeightDecrease];
      double v20 = _SFInterpolate(0.0, v23 * 0.5, v13);
    }
    -[UIView ss_setUntransformedFrame:](self->_lockdownStatusBar, "ss_setUntransformedFrame:", 0.0, v19 - v20, Width, v15);
    [(SFCapsuleCollectionView *)self _lockdownIndicatorTransform];
    lockdownStatusBar = self->_lockdownStatusBar;
    v25[0] = v25[3];
    v25[1] = v25[4];
    v25[2] = v25[5];
    [(SFLockdownStatusBar *)lockdownStatusBar setTransform:v25];
  }
}

- (void)_layOutToolbar
{
  BOOL contentBorrowed = self->_contentBorrowed;
  toolbarBackdropView = self->_toolbarBackdropView;
  if (contentBorrowed)
  {
    [(UIView *)toolbarBackdropView setHidden:1];
  }
  else
  {
    [(UIView *)toolbarBackdropView setHidden:0];
    if (self->_toolbarBackdropView)
    {
      BOOL v5 = [(SFCapsuleCollectionView *)self _layoutStyleIsTop];
      BOOL v6 = [(SFCapsuleCollectionView *)self _shouldDismissToolbar];
      BOOL v7 = v6;
      BOOL v8 = 0;
      if (self->_toolbarDismissed != v6 && !v5) {
        BOOL v8 = self->_selectionGestureState == 1 || self->_toolbarOffsetForPinchTransition != 0;
      }
      self->_toolbarDismissed = v6;
      if (SFEnhancedTabOverviewEnabled())
      {
        BOOL v9 = [(SFCapsuleCollectionView *)self _contentIsDismissed];
        double toolbarCrossfadeDelay = self->_toolbarCrossfadeDelay;
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __41__SFCapsuleCollectionView__layOutToolbar__block_invoke;
        v95[3] = &unk_1E54EA208;
        BOOL v96 = v9;
        v95[4] = self;
        [MEMORY[0x1E4FB1EB0] _animateUsingDefaultDampedSpringWithDelay:98 initialSpringVelocity:v95 options:0 animations:toolbarCrossfadeDelay completion:0.0];
      }
      [(SFCapsuleCollectionView *)self bounds];
      CGFloat v92 = v12;
      CGFloat v93 = v11;
      CGFloat v90 = v13;
      CGFloat v91 = v14;
      [(SFCapsuleCollectionView *)self _bottomBackdropFrame];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      [(SFCapsuleCollectionView *)self _verticalPanOffsetForToolbarBackdrop];
      UIEdgeInsetsMakeWithEdges();
      double v24 = v16 + v23;
      double v26 = v18 + v25;
      double v28 = v20 - (v23 + v27);
      double v30 = v22 - (v25 + v29);
      [(SFCapsuleCollectionView *)self _bottomBackdropFrameForAlternateContent];
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      CGFloat v38 = v37;
      BOOL v39 = [(SFCapsuleCollectionView *)self _shouldShowAlternateToolbarContent];
      CGFloat v77 = v36;
      if (v39) {
        double v40 = v38;
      }
      else {
        double v40 = v30;
      }
      if (v39) {
        double v41 = v36;
      }
      else {
        double v41 = v28;
      }
      CGFloat v85 = v40;
      CGFloat rect = v41;
      CGFloat v78 = v34;
      CGFloat v80 = v32;
      if (v39) {
        double v42 = v34;
      }
      else {
        double v42 = v26;
      }
      if (v39) {
        double v43 = v32;
      }
      else {
        double v43 = v24;
      }
      CGFloat v82 = v42;
      double v84 = v43;
      double v88 = *MEMORY[0x1E4F1DB28];
      v98.size.width = v92;
      v98.origin.x = v93;
      v98.origin.y = v90;
      v98.size.height = v91;
      CGRectGetWidth(v98);
      v99.origin.x = v24;
      v99.origin.y = v26;
      v99.size.width = v28;
      v99.size.height = v30;
      double MinY = CGRectGetMinY(v99);
      if (v5)
      {
        SFCapsuleBottomBarPaddingForTopLayoutStyle();
      }
      else
      {
        [(SFCapsuleCollectionView *)self _selectedItemMinimizationPercent];
        -[SFCapsuleCollectionView _additionalHeightFromAuxiliaryBarAtMinimizationPercent:](self, "_additionalHeightFromAuxiliaryBarAtMinimizationPercent:");
        [(SFCapsuleCollectionView *)self capsuleFrame];
        CGRectGetHeight(v100);
        [(SFCapsuleCollectionView *)self _verticalPanOffsetForToolbar];
      }
      double v45 = _SFRoundRectToPixels(v88);
      CGFloat v47 = v46;
      double v49 = v48;
      CGFloat rect2 = v50;
      if (![(SFCapsuleCollectionView *)self _shouldShowAlternateToolbarContent]
        && (objc_opt_respondsToSelector() & 1) != 0
        && [(UIView *)self->_alternateToolbarContentView resizesFromOriginalToolbarFrame])
      {
        [(UIView *)self->_toolbar frame];
        double v88 = v51;
        CGFloat v53 = v52;
        CGFloat Width = v54;
        double alternateToolbarContentHeight = v56;
      }
      else
      {
        v101.size.width = v92;
        v101.origin.x = v93;
        v101.origin.y = v90;
        v101.size.height = v91;
        CGFloat Width = CGRectGetWidth(v101);
        double alternateToolbarContentHeight = self->_alternateToolbarContentHeight;
        v102.origin.y = v78;
        v102.origin.x = v80;
        v102.size.height = v38;
        v102.size.width = v77;
        CGFloat v53 = CGRectGetMinY(v102);
      }
      if (![(SFCapsuleCollectionView *)self _shouldShowAlternateToolbarContent])
      {
        v103.origin.x = v88;
        v103.origin.y = v53;
        v103.size.width = Width;
        v103.size.height = alternateToolbarContentHeight;
        CGRectGetMinY(v103);
        v104.origin.x = v84;
        v104.size.height = v85;
        v104.origin.y = v82;
        v104.size.width = rect;
        CGRectGetMinY(v104);
      }
      double v89 = _SFRoundRectToPixels(v88);
      CGFloat v81 = v59;
      CGFloat v83 = v58;
      CGFloat v79 = v60;
      if (self->_selectedItemState == 2)
      {
        CGFloat v61 = v49;
        if (self->_layoutStyle == 1)
        {
          v62 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
          v63 = [v62 capsuleView];

          objc_msgSend(v63, "ss_untransformedFrame");
          CGRectGetMinY(v105);
          v106.origin.x = v93;
          v106.origin.y = v90;
          v106.size.width = v92;
          v106.size.height = v91;
          CGRectGetWidth(v106);
          v107.origin.x = v93;
          v107.origin.y = v90;
          v107.size.width = v92;
          v107.size.height = v91;
          CGRectGetHeight(v107);

          double v84 = 0.0;
        }
      }
      else
      {
        CGFloat v61 = v49;
      }
      double v64 = _SFRoundRectToPixels(v84);
      CGFloat v66 = v65;
      CGFloat v68 = v67;
      CGFloat v70 = v69;
      [(UIView *)self->_toolbar frame];
      v111.origin.x = v45;
      v111.origin.y = v47;
      v111.size.width = v61;
      v111.size.height = rect2;
      if (!CGRectEqualToRect(v108, v111)) {
        goto LABEL_43;
      }
      [(UIView *)self->_toolbarBackdropView frame];
      v112.origin.x = v64;
      v112.origin.y = v66;
      v112.size.width = v68;
      v112.size.height = v70;
      if (!CGRectEqualToRect(v109, v112)
        || (alternateToolbarContentView = self->_alternateToolbarContentView) != 0
        && ([(UIView *)alternateToolbarContentView frame],
            v113.origin.x = v89,
            v113.size.width = v81,
            v113.origin.y = v83,
            v113.size.height = v79,
            !CGRectEqualToRect(v110, v113)))
      {
LABEL_43:
        CGFloat v72 = v47;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        double v74 = 0.0;
        if (objc_opt_respondsToSelector())
        {
          int v75 = [WeakRetained capsuleCollectionViewShouldDelayToolbarPresentation:self];
          if (!v7)
          {
            if (v75)
            {
              int64_t selectionGestureState = self->_selectionGestureState;
              if (selectionGestureState != 1)
              {
                if (selectionGestureState == 5) {
                  double v74 = 0.0;
                }
                else {
                  double v74 = 0.25;
                }
              }
            }
          }
        }

        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __41__SFCapsuleCollectionView__layOutToolbar__block_invoke_2;
        v94[3] = &unk_1E54EA230;
        v94[4] = self;
        *(double *)&v94[5] = v45;
        *(CGFloat *)&v94[6] = v72;
        *(CGFloat *)&v94[7] = v61;
        *(CGFloat *)&v94[8] = rect2;
        *(double *)&v94[9] = v89;
        *(CGFloat *)&v94[10] = v83;
        *(CGFloat *)&v94[11] = v81;
        *(CGFloat *)&v94[12] = v79;
        *(double *)&v94[13] = v64;
        *(CGFloat *)&v94[14] = v66;
        *(CGFloat *)&v94[15] = v68;
        *(CGFloat *)&v94[16] = v70;
        objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animate:usingDefaultMotionWithDelay:options:animations:completion:", v8, 98, v94, 0, v74);
      }
    }
  }
}

- (BOOL)_shouldShowAlternateToolbarContent
{
  return (!self->_selectionGestureState
       || ([(SFCapsuleCollectionView *)self _capsuleAlphaOptionsForSelectionGesture] & 1) != 0)&& self->_alternateToolbarContentView&& self->_showingAlternateToolbarContent;
}

- (BOOL)_contentIsDismissed
{
  int v3 = SFEnhancedTabOverviewEnabled();
  if (v3) {
    LOBYTE(v3) = self->_shouldDismissContent || self->_offsetForPan.y < -10.0;
  }
  return v3;
}

- (double)_selectedItemBackgroundAlpha
{
  [(SFCapsuleCollectionView *)self _selectedItemMinimizationPercent];
  double v3 = 0.5 - v2 + 0.5 - v2;

  return _SFClamp(v3, 0.0, 1.0);
}

- (double)_selectedItemMinimizationPercent
{
  double result = 0.0;
  if (self->_minimizationStyle != 1)
  {
    if ((self->_minimizationFlags & 0x11) != 0)
    {
      -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 0, 0.0);
      -[SFCapsuleCollectionView _insetForCapsuleEdgeWithInsets:](self, "_insetForCapsuleEdgeWithInsets:");
      double v5 = v4;
      [(SFCapsuleCollectionView *)self obscuredInsetsForState:1];
      -[SFCapsuleCollectionView _insetForCapsuleEdgeWithInsets:](self, "_insetForCapsuleEdgeWithInsets:");
      double v7 = v6;
      [(SFCapsuleCollectionView *)self _obscuredInsetsIgnoringAnimation];
      -[SFCapsuleCollectionView _insetForCapsuleEdgeWithInsets:](self, "_insetForCapsuleEdgeWithInsets:");
      double v9 = (v8 - v5) / (v7 - v5);
      return _SFClamp(v9, 0.0, 1.0);
    }
    else
    {
      return (double)[(SFCapsuleCollectionView *)self selectedItemIsMinimized];
    }
  }
  return result;
}

- (double)_verticalPanOffsetForToolbar
{
  double v2 = 0.0;
  if (self->_layoutStyle == 1
    && !self->_selectedItemState
    && !self->_alternateToolbarContentView
    && (SFEnhancedTabOverviewEnabled() & 1) == 0)
  {
    if ([(SFCapsuleCollectionView *)self _shouldDismissToolbar])
    {
      [(SFCapsuleCollectionView *)self safeAreaInsets];
      double v5 = v4 + 44.0 + 3.0;
      [(SFCapsuleCollectionView *)self capsuleFrame];
      double v6 = v5 + CGRectGetHeight(v10) + 8.0;
    }
    else
    {
      toolbarOffsetForPinchTransition = self->_toolbarOffsetForPinchTransition;
      if (!toolbarOffsetForPinchTransition)
      {
        double v6 = fmin(self->_offsetForPan.y, 0.0);
        double v8 = 0.3;
        return v6 * v8;
      }
      [(NSNumber *)toolbarOffsetForPinchTransition doubleValue];
    }
    double v8 = -0.3;
    return v6 * v8;
  }
  return v2;
}

- (double)_verticalPanOffsetForToolbarBackdrop
{
  if (self->_layoutStyle != 1
    || self->_selectedItemState
    || self->_alternateToolbarContentView
    || [(SFCapsuleCollectionView *)self _shouldDismissToolbar]
    || (SFEnhancedTabOverviewEnabled() & 1) != 0)
  {
    return 0.0;
  }
  toolbarOffsetForPinchTransition = self->_toolbarOffsetForPinchTransition;
  if (!toolbarOffsetForPinchTransition) {
    return fmax(-self->_offsetForPan.y, 0.0);
  }

  [(NSNumber *)toolbarOffsetForPinchTransition doubleValue];
  return result;
}

- (CGRect)_bottomBackdropFrame
{
  [(SFCapsuleCollectionView *)self bounds];
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  double v7 = CGRectGetWidth(v30);
  int64_t layoutStyle = self->_layoutStyle;
  if (layoutStyle == 2)
  {
    [(SFCapsuleCollectionView *)self safeAreaInsets];
    double v10 = v14 + 44.0;
    double v15 = SFCapsuleBottomBarPaddingForTopLayoutStyle();
LABEL_9:
    double v13 = v10 + v15;
    goto LABEL_11;
  }
  if (layoutStyle != 1)
  {
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_11;
  }
  [(SFCapsuleCollectionView *)self _selectedItemMinimizationPercent];
  -[SFCapsuleCollectionView _additionalHeightFromAuxiliaryBarAtMinimizationPercent:](self, "_additionalHeightFromAuxiliaryBarAtMinimizationPercent:");
  double v10 = v9;
  if ([(SFCapsuleCollectionView *)self selectedItemIsMinimized] && !self->_minimizationStyle)
  {
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double v29 = CGRectGetHeight(v33);
    [(SFCapsuleCollectionView *)self minimizedCapsuleFrame];
    double v15 = v29 - CGRectGetMinY(v34);
    goto LABEL_9;
  }
  if (v10 <= 0.0) {
    double v10 = 8.0;
  }
  [(SFCapsuleCollectionView *)self safeAreaInsets];
  double v12 = v10 + v11 + 44.0;
  [(SFCapsuleCollectionView *)self capsuleFrame];
  double v13 = v12 + CGRectGetHeight(v31) + 3.0;
LABEL_11:
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v32);
  if ([(SFCapsuleCollectionView *)self _shouldDismissToolbar]) {
    double v17 = 0.0;
  }
  else {
    double v17 = v13;
  }
  double v18 = v16 - v17;
  [(SFCapsuleCollectionView *)self _verticalOffsetForBottomBackdropIncludingKeyboard:1];
  UIEdgeInsetsMakeWithEdges();
  double v20 = v18 + v19;
  double v23 = v7 - (v21 + v22);
  double v25 = v13 - (v19 + v24);
  double v26 = v21 + 0.0;
  double v27 = v20;
  double v28 = v23;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (CGRect)_bottomBackdropFrameForAlternateContent
{
  [(SFCapsuleCollectionView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (self->_alternateToolbarContentHeight == 0.0)
  {
    double v12 = 0.0;
  }
  else
  {
    [(SFCapsuleCollectionView *)self safeAreaInsets];
    double v12 = v11 + self->_alternateToolbarContentHeight;
  }
  v18.origin.CGFloat x = v4;
  v18.origin.CGFloat y = v6;
  v18.size.CGFloat width = v8;
  v18.size.CGFloat height = v10;
  CGFloat v13 = CGRectGetHeight(v18) - v12;
  v19.origin.CGFloat x = v4;
  v19.origin.CGFloat y = v6;
  v19.size.CGFloat width = v8;
  v19.size.CGFloat height = v10;
  double Width = CGRectGetWidth(v19);
  double v15 = 0.0;
  double v16 = v13;
  double v17 = v12;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = Width;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)_layOutMinimizedProgressView
{
  double v3 = [(_SFFluidProgressView *)self->_minimizedProgressView superview];
  contentView = self->_contentView;

  if (v3 == contentView)
  {
    BOOL v5 = [(SFCapsuleCollectionView *)self _layoutStyleIsTop];
    double MinY = 0.0;
    if (!v5)
    {
      [(UIView *)self->_toolbarBackdropView frame];
      double MinY = CGRectGetMinY(v15);
    }
    [(SFCapsuleCollectionView *)self obscuredInsetsIgnoringKeyboard];
    double v8 = v7;
    double v10 = v9;
    [(SFCapsuleCollectionView *)self bounds];
    double Width = CGRectGetWidth(v16);
    minimizedProgressView = self->_minimizedProgressView;
    if (v5) {
      double v13 = v8;
    }
    else {
      double v13 = v10;
    }
    -[_SFFluidProgressView setFrame:](minimizedProgressView, "setFrame:", 0.0, MinY, Width, v13);
  }
}

- (UIEdgeInsets)obscuredInsets
{
  if (self->_backdropHeightAnimationCount)
  {
    double topBackdropHeightPresentationValue = self->_topBackdropHeightPresentationValue;
    [(UIView *)self->_toolbarBackdropView bounds];
    double Height = CGRectGetHeight(v8);
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = topBackdropHeightPresentationValue;
  }
  else
  {
    [(SFCapsuleCollectionView *)self _obscuredInsetsIgnoringAnimation];
  }
  result.right = v5;
  result.bottom = Height;
  result.left = v4;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)_obscuredInsetsIgnoringAnimation
{
  [(SFCapsuleCollectionView *)self _insetsByApplyingSelectedItemOffsetToInsetsForState:self->_selectedItemState includeKeyboard:1];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  if (self->_alwaysShowTopBackdrop) {
    [(SFCapsuleCollectionView *)self obscuredInsetsForState:0];
  }
  double v10 = v5;
  double v11 = v7;
  double v12 = v9;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)_insetsByApplyingSelectedItemOffsetToInsetsForState:(int64_t)a3 includeKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(SFCapsuleCollectionView *)self obscuredInsetsForState:a3 != 1];
  BOOL v16 = a3 == 1 && self->_minimizationStyle == 1;
  int v17 = v8 != 0.0 || v16;
  if (v17 == 1 && v8 != v15)
  {
    BOOL v19 = [(SFCapsuleCollectionView *)self _layoutStyleIsTop];
    double v20 = -1.0;
    if (v19) {
      double v20 = 1.0;
    }
    [(SFCapsuleCollectionView *)self _verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:0 includeKeyboard:v20];
    double v8 = v8 + v21;
  }
  int v22 = v12 != 0.0 || v16;
  if (v22 == 1)
  {
    [(SFCapsuleCollectionView *)self _verticalOffsetForBottomBackdropIncludingKeyboard:v4];
    double v12 = v12 - v23;
  }
  double v24 = v8;
  double v25 = v10;
  double v26 = v12;
  double v27 = v14;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (UIEdgeInsets)obscuredInsetsForState:(int64_t)a3
{
  [(SFCapsuleCollectionView *)self obscuredInsetsForState:a3 ignoringKeyboard:0];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)_verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:(double)a3 includeKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = 0.0;
  if ((self->_minimizationFlags & 2) == 0)
  {
    a3 = _SFRoundFloatToPixels(self->_offsetForMinimization * a3);
    double v6 = a3 + 0.0;
  }
  if (v4 && [(SFCapsuleCollectionView *)self _shouldDodgeKeyboard])
  {
    double v7 = 0.0;
    double v8 = 0.0;
    if (!self->_selectedItemState)
    {
      [(SFCapsuleCollectionView *)self layoutMargins];
      double v8 = v9;
      if (self->_layoutStyle == 1)
      {
        [(SFCapsuleCollectionView *)self safeAreaInsets];
        double v8 = v8 + v10 + 44.0 + 3.0 - 8.0;
      }
    }
    [(SFCapsuleCollectionView *)self _keyboardHeightBelowCapsule];
    double v12 = v11 - v8;
    [(SFCapsuleInputAccessorySpacerView *)self->_inputAccessoryView bounds];
    if (v12 - CGRectGetHeight(v16) >= 0.0)
    {
      [(SFCapsuleCollectionView *)self _keyboardHeightBelowCapsule];
      double v14 = v13 - v8;
      [(SFCapsuleInputAccessorySpacerView *)self->_inputAccessoryView bounds];
      double v7 = v14 - CGRectGetHeight(v17);
    }
    return v6 - v7;
  }
  return v6;
}

- (CGRect)_minimizedCapsuleFrameIgnoringKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  [(SFCapsuleCollectionView *)self capsuleFrame];
  double v8 = v7;
  double v10 = v9;
  int64_t minimizationStyle = self->_minimizationStyle;
  if (minimizationStyle)
  {
    double v12 = v5;
    double v13 = v6;
    if (minimizationStyle == 1)
    {
      if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop])
      {
        if (!self->_alwaysShowTopBackdrop)
        {
          [(SFCapsuleCollectionView *)self obscuredInsetsForState:0];
          double v12 = v12 - v14;
        }
      }
      else
      {
        [(SFCapsuleCollectionView *)self obscuredInsetsForState:0];
        double v12 = v12 + v28;
      }
    }
  }
  else
  {
    [(SFCapsuleCollectionView *)self bounds];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    [(SFCapsuleCollectionView *)self _selectedCapsuleHeightForWidth:1 state:v3 ignoringKeyboard:v10];
    double v13 = v23;
    if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop])
    {
      [(SFCapsuleCollectionView *)self safeAreaInsets];
      double v25 = v24 + -13.0;
      int HasHomeButton = _SFDeviceHasHomeButton();
      double v27 = 5.0;
      if (!HasHomeButton) {
        double v27 = 0.0;
      }
      double v12 = fmax(v25 + v27, 0.0);
    }
    else
    {
      v33.origin.CGFloat x = v16;
      v33.origin.CGFloat y = v18;
      v33.size.CGFloat width = v20;
      v33.size.CGFloat height = v22;
      double v12 = CGRectGetHeight(v33) - v13;
    }
  }
  double v29 = v8;
  double v30 = v12;
  double v31 = v10;
  double v32 = v13;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (UIEdgeInsets)obscuredInsetsForState:(int64_t)a3 ignoringKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1 && self->_minimizationStyle == 1 && !self->_alwaysShowTopBackdrop)
  {
    double v18 = *MEMORY[0x1E4FB2848];
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v24 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4FB2848];
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v10 = 0.0;
    if (a3 == 1) {
      double v10 = 1.0;
    }
    [(SFCapsuleCollectionView *)self _additionalHeightFromAuxiliaryBarAtMinimizationPercent:v10];
    double v12 = v11;
    if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop])
    {
      if (a3 == 1) {
        [(SFCapsuleCollectionView *)self minimizedCapsuleFrame];
      }
      else {
        [(SFCapsuleCollectionView *)self capsuleFrame];
      }
      double v18 = v12 + CGRectGetMaxY(*(CGRect *)&v13);
      if (a3 == 1)
      {
        double v24 = *(double *)(v7 + 16);
      }
      else
      {
        double v25 = 0.0;
        if (v12 <= 0.0)
        {
          [(SFCapsuleCollectionView *)self safeAreaInsets];
          SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar();
        }
        double v18 = v18 + v25;
        [(SFCapsuleCollectionView *)self safeAreaInsets];
        double v24 = v26 + 44.0 + SFCapsuleBottomBarPaddingForTopLayoutStyle();
      }
    }
    else
    {
      [(SFCapsuleCollectionView *)self safeAreaInsets];
      double v18 = v17;
      [(SFCapsuleCollectionView *)self bounds];
      double Height = CGRectGetHeight(v30);
      if (a3 == 1) {
        [(SFCapsuleCollectionView *)self _minimizedCapsuleFrameIgnoringKeyboard:v4];
      }
      else {
        [(SFCapsuleCollectionView *)self capsuleFrame];
      }
      double v24 = v12 + Height - CGRectGetMinY(*(CGRect *)&v20);
      if (a3 != 1 && v12 == 0.0) {
        double v24 = v24 + 8.0;
      }
    }
  }
  double v27 = v18;
  double v28 = v8;
  double v29 = v9;
  result.right = v29;
  result.bottom = v24;
  result.left = v28;
  result.top = v27;
  return result;
}

- (BOOL)_layoutStyleIsTop
{
  return self->_layoutStyle != 1;
}

- (CGRect)capsuleFrame
{
  [(SFCapsuleCollectionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SFCapsuleCollectionView *)self _layoutMarginsForState:self->_selectedItemState];
  double v14 = v13;
  double v16 = v15;
  if (self->_capsuleWidth == -1.0)
  {
    v32.origin.CGFloat x = v4 + v11;
    v32.size.CGFloat width = v8 - (v11 + v12);
    v32.size.CGFloat height = v10 - (v14 + v16);
    v32.origin.CGFloat y = v6 + v14;
    double Width = CGRectGetWidth(v32);
  }
  else
  {
    v31.origin.CGFloat x = v4;
    v31.origin.CGFloat y = v6;
    v31.size.CGFloat width = v8;
    v31.size.CGFloat height = v10;
    CGFloat v17 = CGRectGetWidth(v31);
    double Width = _SFRoundFloatToPixels(v17 * fmax(fmin(self->_capsuleWidth, 1.0), 0.0));
  }
  double v19 = Width;
  -[SFCapsuleCollectionView _selectedCapsuleHeightForWidth:state:ignoringKeyboard:](self, "_selectedCapsuleHeightForWidth:state:ignoringKeyboard:", 0, 0);
  double v21 = v20;
  int64_t layoutStyle = self->_layoutStyle;
  if (layoutStyle == 2)
  {
    [(SFCapsuleCollectionView *)self safeAreaInsets];
    double v25 = v14 + v26;
  }
  else if (layoutStyle == 1)
  {
    v33.origin.CGFloat x = v4;
    v33.origin.CGFloat y = v6;
    v33.size.CGFloat width = v8;
    v33.size.CGFloat height = v10;
    double Height = CGRectGetHeight(v33);
    [(SFCapsuleCollectionView *)self safeAreaInsets];
    double v25 = Height - v24 - 44.0 - v16 - v21;
  }
  else
  {
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  }
  v34.origin.CGFloat x = v4;
  v34.origin.CGFloat y = v6;
  v34.size.CGFloat width = v8;
  v34.size.CGFloat height = v10;
  double v27 = (CGRectGetWidth(v34) - v19) * 0.5;
  double v28 = v25;
  double v29 = v19;
  double v30 = v21;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (double)_selectedCapsuleHeightForWidth:(double)a3 state:(int64_t)a4 ignoringKeyboard:(BOOL)a5
{
  if (self->_selectedItemIndex >= (int64_t)self->_numberOfItems || self->_suppressingDataSourceCalls)
  {
    if (a4 == 1) {
      return 39.0;
    }
    [(SFCapsuleCollectionView *)self defaultCapsuleHeight];
  }
  else
  {
    double v11 = -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:");
    [(SFCapsuleCollectionView *)self defaultCapsuleHeight];
    [v11 capsuleHeightForWidth:a4 defaultHeight:self->_selectedItemIndex state:a3 index:v12];
    double v7 = v13;

    if (a4 != 1 || [(SFCapsuleCollectionView *)self _layoutStyleIsTop]) {
      return v7;
    }
    [(SFCapsuleCollectionView *)self safeAreaInsets];
    keyboarddouble Height = 0.0;
    if (self->_showingKeyboard && !a5) {
      keyboarddouble Height = self->_keyboardHeight;
    }
    double v16 = fmax(v14 - keyboardHeight, 0.0);
    return fmax(v7 + fmin(v16, 13.0), v16 + 18.0);
  }
  return result;
}

- (double)defaultCapsuleHeight
{
  int64_t layoutStyle = self->_layoutStyle;
  if (layoutStyle == 2)
  {
    double v3 = &SFTopCapsuleHeight;
  }
  else
  {
    if (layoutStyle != 1) {
      return result;
    }
    double v3 = &SFCapsuleWithToolbarHeight;
  }
  return *(double *)v3;
}

- (UIEdgeInsets)_layoutMarginsForState:(int64_t)a3
{
  int64_t layoutStyle = self->_layoutStyle;
  if (layoutStyle == 1)
  {
    if ((unint64_t)a3 >= 2)
    {
      if (a3 == 2)
      {
        double v4 = 12.0;
        double v5 = 16.0;
        double v6 = 3.0;
        double v7 = 16.0;
      }
    }
    else
    {
      [(SFCapsuleCollectionView *)self layoutMargins];
      UIEdgeInsetsReplace();
    }
  }
  else if (layoutStyle == 2)
  {
    [(SFCapsuleCollectionView *)self safeAreaInsets];
    SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar();
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)_additionalHeightFromAuxiliaryBarAtMinimizationPercent:(double)a3
{
  if (!self->_showingLockdownStatusBar) {
    return 0.0;
  }
  -[SFCapsuleCollectionView _lockdownIndicatorBottomVerticalSpacingAtMinimizationPercent:](self, "_lockdownIndicatorBottomVerticalSpacingAtMinimizationPercent:");
  double v6 = v5;
  [(SFCapsuleCollectionView *)self _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:a3];
  double v8 = v6 + v7;
  [(SFLockdownStatusBar *)self->_lockdownStatusBar preferredSize];
  double v10 = v8 + v9;
  [(SFCapsuleCollectionView *)self _verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:a3];
  double v12 = v10 - v11;
  [(SFCapsuleCollectionView *)self _auxiliaryBarSquishedHeightDecrease];
  return v12 - _SFInterpolate(0.0, v13 * 0.5, a3);
}

- (double)_keyboardHeightBelowCapsule
{
  BOOL v3 = [(SFCapsuleCollectionView *)self _shouldDodgeKeyboard];
  keyboarddouble Height = self->_keyboardHeight;
  if (!v3) {
    return self->_keyboardHeight;
  }
  [(SFCapsuleCollectionView *)self selectedCapsuleFrame];
  return fmax(keyboardHeight - CGRectGetHeight(v6), 0.0);
}

- (BOOL)_shouldDodgeKeyboard
{
  return self->_layoutStyle == 1 && self->_keepsCapsulesAboveKeyboard;
}

- (CGRect)selectedCapsuleFrame
{
  if ([(SFCapsuleCollectionView *)self selectedItemIsMinimized]) {
    [(SFCapsuleCollectionView *)self minimizedCapsuleFrame];
  }
  else {
    [(SFCapsuleCollectionView *)self capsuleFrame];
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)selectedItemIsMinimized
{
  return self->_selectedItemState == 1;
}

- (double)_verticalOffsetForBottomBackdropIncludingKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFCapsuleCollectionView *)self _shouldDismissToolbar]
    && ![(SFCapsuleCollectionView *)self _shouldUseNormalLayoutForMinimizedCapsule]&& !self->_minimizationStyle)
  {
    return 0.0;
  }
  BOOL v5 = [(SFCapsuleCollectionView *)self _layoutStyleIsTop];
  double v6 = 1.0;
  if (v5)
  {
    -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 0, 1.0);
    double v8 = v7;
    double v10 = v9;
    [(SFCapsuleCollectionView *)self obscuredInsetsForState:1];
    double v6 = (v10 - v11) / (v12 - v8);
  }
  BOOL v13 = self->_selectedItemState != 2 && v3;

  [(SFCapsuleCollectionView *)self _verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:v13 includeKeyboard:v6];
  return result;
}

- (BOOL)_shouldDismissToolbar
{
  char itemsAreHidden = -104;
  int64_t layoutStyle = self->_layoutStyle;
  if (layoutStyle == 2)
  {
    if (![(SFCapsuleCollectionView *)self selectedItemIsMinimized])
    {
      char itemsAreHidden = self->_itemsAreHidden;
      if (!itemsAreHidden) {
        return itemsAreHidden & 1;
      }
      goto LABEL_15;
    }
LABEL_13:
    char itemsAreHidden = 1;
    return itemsAreHidden & 1;
  }
  if (layoutStyle == 1)
  {
    if (self->_minimizationStyle != 1
      || ![(SFCapsuleCollectionView *)self selectedItemIsMinimized])
    {
      BOOL v5 = self->_offsetForPan.y < -50.0;
      unsigned int v6 = v5 & ~SFEnhancedTabOverviewEnabled();
      BOOL v7 = !self->_itemsAreHidden && v6 == 0;
      if (v7
        || (toolbarOffsetForPinchTransition = self->_toolbarOffsetForPinchTransition) != 0
        && ([(NSNumber *)toolbarOffsetForPinchTransition doubleValue], v9 <= 50.0))
      {
        char itemsAreHidden = 0;
        return itemsAreHidden & 1;
      }
LABEL_15:
      char itemsAreHidden = self->_alternateToolbarContentView == 0;
      return itemsAreHidden & 1;
    }
    goto LABEL_13;
  }
  return itemsAreHidden & 1;
}

- (UIEdgeInsets)obscuredInsetsIgnoringKeyboard
{
  if (self->_showingKeyboard)
  {
    self->_showingKeyboard = 0;
    [(SFCapsuleCollectionView *)self _insetsByApplyingSelectedItemOffsetToInsetsForState:self->_selectedItemStateBeforeShowingKeyboard includeKeyboard:0];
    self->_showingKeyboard = 1;
  }
  else
  {
    [(SFCapsuleCollectionView *)self obscuredInsets];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_layOutKeyboardBackdrop
{
  if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop])
  {
    [(UIKBVisualEffectView *)self->_keyboardBackdropView removeFromSuperview];
    keyboardBackdropView = self->_keyboardBackdropView;
    self->_keyboardBackdropView = 0;
  }
  else
  {
    double v4 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
    [(SFCapsuleCollectionView *)self bounds];
    CGFloat x = v41.origin.x;
    CGFloat y = v41.origin.y;
    CGFloat width = v41.size.width;
    CGFloat height = v41.size.height;
    int64_t selectedItemState = self->_selectedItemState;
    CGFloat v10 = CGRectGetWidth(v41) - 16.0 - 16.0;
    [(SFCapsuleCollectionView *)self defaultCapsuleHeight];
    [v4 capsuleHeightForWidth:2 defaultHeight:self->_selectedItemIndex state:v10 index:v11];
    double v13 = 12.0;
    double v14 = self->_keyboardBackdropView;
    double v36 = v12 + 12.0 + 3.0;
    CGFloat v38 = height;
    if (selectedItemState == 2)
    {
      if (!v14)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __50__SFCapsuleCollectionView__layOutKeyboardBackdrop__block_invoke;
        v39[3] = &unk_1E54E9D00;
        *(CGFloat *)&v39[5] = x;
        *(CGFloat *)&v39[6] = y;
        *(CGFloat *)&v39[7] = width;
        *(CGFloat *)&v39[8] = height;
        *(double *)&v39[9] = v12 + 12.0 + 3.0;
        v39[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v39];
        double v14 = self->_keyboardBackdropView;
      }
      CGFloat v15 = width;
      CGFloat v16 = y;
      CGFloat v17 = x;
      double v18 = 1.0;
    }
    else
    {
      CGFloat v15 = width;
      CGFloat v16 = y;
      CGFloat v17 = x;
      double v18 = 0.0;
    }
    -[UIKBVisualEffectView setAlpha:](v14, "setAlpha:", v18, *(void *)&v36);
    double v19 = [v4 capsuleView];
    [v19 frame];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    v42.origin.CGFloat x = v21;
    v42.origin.CGFloat y = v23;
    v42.size.CGFloat width = v25;
    v42.size.CGFloat height = v27;
    double MinY = CGRectGetMinY(v42);
    if (selectedItemState != 2) {
      double v13 = 8.0;
    }
    if (self->_inputAccessoryView)
    {
      [(SFCapsuleCollectionView *)self _inputAccessoryViewFrame];
      double MaxY = CGRectGetMaxY(v43);
      CGFloat v30 = v17;
      CGFloat v31 = v16;
      CGFloat v32 = v15;
      CGFloat v33 = v38;
    }
    else
    {
      CGFloat v30 = v17;
      v44.origin.CGFloat x = v17;
      CGFloat v31 = v16;
      v44.origin.CGFloat y = v16;
      CGFloat v32 = v15;
      v44.size.CGFloat width = v15;
      CGFloat v33 = v38;
      v44.size.CGFloat height = v38;
      double MaxY = v37 + CGRectGetHeight(v44);
    }
    double v34 = MinY - v13;
    double v35 = v34;
    if (self->_itemsAreHidden)
    {
      v45.origin.CGFloat x = v30;
      v45.origin.CGFloat y = v31;
      v45.size.CGFloat width = v32;
      v45.size.CGFloat height = v33;
      double v35 = CGRectGetHeight(v45);
    }
    v46.origin.CGFloat x = v30;
    v46.origin.CGFloat y = v31;
    v46.size.CGFloat width = v32;
    v46.size.CGFloat height = v33;
    -[UIKBVisualEffectView setFrame:](self->_keyboardBackdropView, "setFrame:", 0.0, v35, CGRectGetWidth(v46), MaxY - v34);
  }
}

void __41__SFCapsuleCollectionView__layOutToolbar__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "ss_setUntransformedFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 760), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  [*(id *)(*(void *)(a1 + 32) + 760) layoutIfNeeded];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 800))
  {
    double v3 = [*(id *)(v2 + 528) superview];
    double v4 = *(void **)(*(void *)(a1 + 32) + 408);

    if (v3 == v4)
    {
      double v5 = *(double *)(a1 + 104);
      double v6 = *(double *)(a1 + 112);
      BOOL v7 = *(void **)(*(void *)(a1 + 32) + 528);
      double v8 = *(double *)(a1 + 120);
      double v9 = *(double *)(a1 + 128);
      objc_msgSend(v7, "ss_setUntransformedFrame:", v5, v6, v8, v9);
    }
  }
}

- (int64_t)selectedItemIndex
{
  return self->_selectedItemIndex;
}

uint64_t __52__SFCapsuleCollectionView__updateRangeOfLoadedViews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 capsuleIsDetached];
}

BOOL __51__SFCapsuleCollectionView__indexesOfAnimatingItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 animationCount] != 0;
}

- (void)_layOutItems:(id)a3 atIndexes:(id)a4 selectedItemIndex:(int64_t)a5
{
  void (**v99)(void *__return_ptr);
  double v100;
  CGFloat v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  CGFloat v106;
  CGFloat Width;
  double v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  void (**v112)(void *__return_ptr);
  double rect;
  void v114[4];
  id v115;
  SFCapsuleCollectionView *v116;
  id v117;
  id v118;
  int64_t v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  double v124;
  double v125;
  double v126;
  double v127;
  CGFloat v128;
  uint64_t v129;
  double v130;
  double v131;
  CGFloat v132;
  BOOL v133;
  BOOL v134;
  char v135;
  _OWORD v136[3];
  _OWORD v137[3];
  _OWORD v138[6];
  void v139[4];
  id v140;
  void aBlock[5];
  BOOL v142;
  void v143[4];
  id v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;

  id v8 = a3;
  id v9 = a4;
  CGFloat v10 = v9;
  if (self->_contentBorrowed)
  {
    double v11 = v9;
  }
  else
  {
    v143[0] = MEMORY[0x1E4F143A8];
    v143[1] = 3221225472;
    v143[2] = __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke;
    v143[3] = &unk_1E54E9920;
    id v12 = v8;
    v144 = v12;
    double v11 = [v10 indexesPassingTest:v143];

    if ([v11 count])
    {
      int64_t selectedItemState = self->_selectedItemState;
      LODWORD(v14) = !self->_selectionGestureState
                  && self->_layoutStyle == 1
                  && [(SFCapsuleCollectionView *)self _shouldShowAlternateToolbarContent];
      [(SFCapsuleCollectionView *)self bounds];
      CGRect v110 = v16;
      CGRect v111 = v15;
      CGFloat v18 = v17;
      CGRect v109 = v19;
      [(SFCapsuleCollectionView *)self capsuleFrame];
      double Width = CGRectGetWidth(v145);
      [(SFCapsuleCollectionView *)self defaultCapsuleHeight];
      CGRect v108 = v20;
      [(SFCapsuleCollectionView *)self _selectedCapsuleFrame];
      double v25 = v21;
      double v26 = v22;
      CGFloat rect = v23;
      double v27 = v24;
      double v28 = 0.0;
      if (v14)
      {
        double Height = CGRectGetHeight(*(CGRect *)&v21);
        [(SFCapsuleCollectionView *)self _bottomBackdropFrame];
        double v30 = CGRectGetHeight(v146);
        [(SFCapsuleCollectionView *)self _bottomBackdropFrameForAlternateContent];
        double v28 = fmin(Height, fmax(v30 - CGRectGetHeight(v147), 0.0));
      }
      BOOL v31 = [(SFCapsuleCollectionView *)self _contentIsDismissed];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_2;
      aBlock[3] = &unk_1E54E9C38;
      v142 = v31;
      aBlock[4] = self;
      CGRect v112 = (void (**)(void *__return_ptr))_Block_copy(aBlock);
      if ([v11 containsIndex:a5])
      {
        CGRect v105 = [v12 objectAtIndexedSubscript:a5];
        CGFloat v32 = [v105 capsuleView];
        objc_msgSend(v32, "setUsesPlatterEffect:", -[SFCapsuleCollectionView _selectedItemShouldUsePlatterEffect](self, "_selectedItemShouldUsePlatterEffect"));
        [(SFCapsuleCollectionView *)self _updateSuperviewForCapsule:v32];
        CGRect v106 = v25;
        if (selectedItemState == 2 && ![(SFCapsuleCollectionView *)self _layoutStyleIsTop])
        {
          [(SFCapsuleCollectionView *)self _layoutMarginsForState:self->_selectedItemState];
          CGRect v102 = v50;
          double v52 = v51;
          double v54 = v53;
          double v56 = v55;
          v154.origin.CGFloat y = v110;
          v154.origin.CGFloat x = v111;
          v154.size.CGFloat width = v18;
          v154.size.CGFloat height = v109;
          double v57 = CGRectGetWidth(v154) - v52 - v56;
          [v105 capsuleHeightForWidth:2 defaultHeight:a5 state:v57 index:v108];
          double v59 = v58;
          CGRect v104 = v18;
          if (self->_inputAccessoryView)
          {
            [(SFCapsuleCollectionView *)self _inputAccessoryViewFrame];
            double v60 = v102 + CGRectGetMinY(v155);
          }
          else
          {
            v156.origin.CGFloat y = v110;
            v156.origin.CGFloat x = v111;
            v156.size.CGFloat width = v18;
            v156.size.CGFloat height = v109;
            double v61 = CGRectGetHeight(v156);
            [(SFCapsuleCollectionView *)self _keyboardHeightBelowCapsule];
            double v60 = v61 - v62 - v59 - v54;
          }
          [(SFCapsuleCollectionView *)self capsuleFrame];
          CGFloat v63 = fmin(v60, CGRectGetMinY(v157));
          objc_msgSend(v32, "ss_setUntransformedFrame:", v52, v63, v57, v59);
          v158.origin.CGFloat x = v52;
          v158.origin.CGFloat y = v63;
          v158.size.CGFloat width = v57;
          v158.size.CGFloat height = v59;
          [(SFCapsuleInputAccessorySpacerView *)self->_inputAccessoryView setCapsuleHeight:CGRectGetHeight(v158)];
          CGFloat v18 = v104;
        }
        else
        {
          if ([(SFCapsuleCollectionView *)self _shouldUseNormalLayoutForMinimizedCapsule])
          {
            [(SFCapsuleCollectionView *)self capsuleFrame];
            CGFloat v34 = v33;
            CGFloat v36 = v35;
            CGFloat v38 = v37;
            CGRect v103 = v18;
            CGFloat v40 = v39;
            v148.origin.CGFloat x = v25;
            v148.origin.CGFloat y = v26;
            v148.size.CGFloat width = rect;
            v148.size.CGFloat height = v27;
            CGRect v101 = v27;
            double MidX = CGRectGetMidX(v148);
            v149.origin.CGFloat x = v34;
            v149.origin.CGFloat y = v36;
            v149.size.CGFloat width = v38;
            v149.size.CGFloat height = v40;
            CGRect v100 = MidX - CGRectGetWidth(v149) * 0.5;
            v150.origin.CGFloat x = v25;
            v150.origin.CGFloat y = v26;
            v150.size.CGFloat width = rect;
            v150.size.CGFloat height = v101;
            double MidY = CGRectGetMidY(v150);
            v151.origin.CGFloat x = v34;
            v151.origin.CGFloat y = v36;
            v151.size.CGFloat width = v38;
            v151.size.CGFloat height = v40;
            double v43 = MidY - CGRectGetHeight(v151) * 0.5;
            v152.origin.CGFloat x = v34;
            v152.origin.CGFloat y = v36;
            v152.size.CGFloat width = v38;
            v152.size.CGFloat height = v40;
            CGFloat v44 = CGRectGetWidth(v152);
            v153.origin.CGFloat x = v34;
            v153.origin.CGFloat y = v36;
            v153.size.CGFloat width = v38;
            v153.size.CGFloat height = v40;
            CGFloat v18 = v103;
            double v45 = CGRectGetHeight(v153);
            CGRect v46 = v32;
            double v47 = v100;
            double v48 = v43;
            double v27 = v101;
            double v49 = v44;
          }
          else
          {
            double v48 = v26 + v28;
            double v45 = v27 - v28;
            CGRect v46 = v32;
            double v47 = v25;
            double v49 = rect;
          }
          objc_msgSend(v46, "ss_setUntransformedFrame:", v47, v48, v49, v45);
        }
        int v64 = (int)v14;
        if (self->_selectedItemUsesLiftedPreviewAppearance)
        {
          double v65 = (void *)MEMORY[0x1E4FB1EB0];
          v139[0] = MEMORY[0x1E4F143A8];
          v139[1] = 3221225472;
          v139[2] = __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_3;
          v139[3] = &unk_1E54E9858;
          v140 = v32;
          [v65 performWithoutAnimation:v139];
          double v14 = v140;
        }
        else
        {
          [v32 frameForShadowView];
          double v67 = v66;
          double v69 = v68;
          double v71 = v70;
          double v72 = v27;
          double v73 = v26;
          double v74 = v28;
          double v75 = v18;
          double v77 = v76;
          double v14 = [v32 shadowView];
          double v78 = v77;
          CGFloat v18 = v75;
          double v28 = v74;
          double v26 = v73;
          double v27 = v72;
          objc_msgSend(v14, "ss_setUntransformedFrame:", v67, v69, v71, v78);
        }

        [(SFCapsuleCollectionView *)self _selectedItemContentTransform];
        v138[0] = v138[3];
        v138[1] = v138[4];
        v138[2] = v138[5];
        [v32 setContentTransform:v138];
        [(SFCapsuleCollectionView *)self _selectedItemContentMinimizationPercent];
        objc_msgSend(v32, "setMinimizationPercent:");
        double v79 = 0.0;
        LOBYTE(v14) = v64;
        if (v64)
        {
          v159.origin.CGFloat x = v106;
          v159.origin.CGFloat y = v26;
          v159.size.CGFloat width = rect;
          v159.size.CGFloat height = v27;
          double v79 = CGRectGetHeight(v159);
        }
        [v32 setContentHeight:v79];
        [(SFCapsuleCollectionView *)self _layoutMarginsForState:self->_selectedItemState];
        double v81 = v80;
        double v83 = v82;
        if ([(UIView *)self _sf_usesLeftToRightLayout]) {
          double v84 = v83;
        }
        else {
          double v84 = v81;
        }
        objc_msgSend(v32, "setAccessoryViewInsets:", 0.0, 14.0, 0.0, fmax(14.0 - v84, 0.0));
        objc_msgSend(v32, "ss_untransformedFrame");
        ((void (**)(_OWORD *__return_ptr))v112)[2](v137);
        v136[0] = v137[0];
        v136[1] = v137[1];
        v136[2] = v137[2];
        [v32 setTransform:v136];

        double v25 = v106;
      }
      char v85 = (char)v14;
      BOOL v86 = [(UIView *)self _sf_usesLeftToRightLayout];
      int v87 = selectedItemState == 2 || v31;
      if (v87)
      {
        BOOL itemsAreHidden = !v31;
      }
      else if (a5 == 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL itemsAreHidden = 0;
      }
      else
      {
        double v89 = [v12 objectAtIndexedSubscript:a5];
        if ([v89 capsuleIsDetached]) {
          BOOL itemsAreHidden = self->_itemsAreHidden;
        }
        else {
          BOOL itemsAreHidden = 0;
        }
      }
      double v90 = v27;
      double v91 = rect;
      double v92 = v26;
      double v93 = v25;
      if (v87) {
        [(SFCapsuleCollectionView *)self selectedCapsuleFrame];
      }
      CGFloat MaxY = CGRectGetMaxY(*(CGRect *)&v93);
      [(SFCapsuleCollectionView *)self _interCapsuleSpacing];
      uint64_t v96 = v95;
      v97 = [(SFCapsuleCollectionView *)self _indexesOfVisibleItemsIncludingAction:1];
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_4;
      v114[3] = &unk_1E54E9C88;
      v119 = a5;
      v133 = v86;
      v134 = itemsAreHidden;
      v115 = v12;
      v116 = self;
      v120 = v111;
      v121 = v110;
      v122 = v18;
      v123 = v109;
      v124 = v25;
      v125 = v26;
      v126 = rect;
      v127 = v27;
      v128 = Width;
      v129 = v96;
      v130 = v108;
      v131 = v28;
      v132 = MaxY;
      v135 = v85;
      v117 = v97;
      v118 = v112;
      id v98 = v97;
      CGRect v99 = v112;
      [v115 enumerateObjectsAtIndexes:v11 options:0 usingBlock:v114];
    }
  }
}

- (BOOL)_selectedItemShouldUsePlatterEffect
{
  BOOL v3 = [(SFCapsuleCollectionView *)self _layoutStyleIsTop];
  if (v3) {
    LOBYTE(v3) = !self->_selectedItemUsesLiftedPreviewAppearance;
  }
  return v3;
}

- (id)_indexesOfVisibleItemsIncludingAction:(BOOL)a3
{
  if (self->_numberOfItems)
  {
    double x = self->_offsetForPan.x;
    uint64_t v6 = [(SFCapsuleCollectionView *)self _indexOfCentermostItemWithTranslation:x];
    BOOL v7 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v6];
    [(SFCapsuleCollectionView *)self pageWidth];
    double v9 = v8;
    double v32 = v8;
    [(SFCapsuleCollectionView *)self bounds];
    double Width = CGRectGetWidth(v34);
    [(SFCapsuleCollectionView *)self capsuleFrame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = x + v17 + (double)(v6 - self->_selectedItemIndex) * v9;
    [(SFCapsuleCollectionView *)self _interCapsuleSpacing];
    double v20 = v19;
    v35.origin.double x = v18;
    v35.origin.CGFloat y = v12;
    v35.size.CGFloat width = v14;
    v35.size.CGFloat height = v16;
    double v21 = fmax(fmin(Width, CGRectGetMinX(v35) - v20), 0.0);
    v36.origin.double x = v18;
    v36.origin.CGFloat y = v12;
    v36.size.CGFloat width = v14;
    v36.size.CGFloat height = v16;
    double v22 = fmax(fmin(Width, Width - CGRectGetMaxX(v36) - v20), 0.0);
    BOOL v23 = [(UIView *)self _sf_usesLeftToRightLayout];
    if (v23) {
      double v24 = v21;
    }
    else {
      double v24 = v22;
    }
    if (v23) {
      double v21 = v22;
    }
    double v25 = (double)v6 - ceil(v24 / v32);
    if (v25 <= 0.0) {
      double v25 = 0.0;
    }
    objc_msgSend(v7, "addIndexesInRange:", (uint64_t)v25, v6 - (uint64_t)v25);
    NSUInteger v26 = [(NSArray *)self->_items count];
    if (self->_trailingAction != 0 && a3) {
      uint64_t v27 = -1;
    }
    else {
      uint64_t v27 = -2;
    }
    double v28 = ceil(v21 / v32) + (double)v6;
    if (v28 > (double)(v27 + v26))
    {
      NSUInteger v29 = [(NSArray *)self->_items count];
      if (self->_trailingAction != 0 && a3) {
        uint64_t v30 = -1;
      }
      else {
        uint64_t v30 = -2;
      }
      double v28 = (double)(v30 + v29);
    }
    objc_msgSend(v7, "addIndexesInRange:", v6 + 1, (uint64_t)v28 - v6);
  }
  else
  {
    BOOL v7 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSet", a3);
  }

  return v7;
}

- (double)pageWidth
{
  [(SFCapsuleCollectionView *)self capsuleFrame];
  double Width = CGRectGetWidth(v6);
  [(SFCapsuleCollectionView *)self _interCapsuleSpacing];
  return Width + v4;
}

- (double)_interCapsuleSpacing
{
  return 8.0;
}

- (int64_t)_indexOfTargetItemWithTranslation:(double)a3 roundingThreshold:(double)a4 allowActionIndex:(BOOL)a5 allowOutOfBounds:(BOOL)a6
{
  BOOL v7 = a5;
  [(SFCapsuleCollectionView *)self pageWidth];
  double v12 = a3 / v11;
  BOOL v13 = [(UIView *)self _sf_usesLeftToRightLayout];
  double v14 = -v12;
  if (!v13) {
    double v14 = v12;
  }
  if (v14 < 0.0)
  {
    if (v14 <= -a4)
    {
      int64_t v15 = vcvtpd_s64_f64(v14 + -1.0);
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v14 < a4)
  {
LABEL_7:
    int64_t v15 = 0;
    goto LABEL_9;
  }
  int64_t v15 = vcvtmd_s64_f64(v14 + 1.0);
LABEL_9:
  int64_t selectionGestureLimit = self->_selectionGestureLimit;
  if (v15 <= -selectionGestureLimit) {
    int64_t v17 = -selectionGestureLimit;
  }
  else {
    int64_t v17 = v15;
  }
  if (selectionGestureLimit < v17) {
    int64_t v17 = self->_selectionGestureLimit;
  }
  if (selectionGestureLimit) {
    int64_t v15 = v17;
  }
  int64_t result = self->_selectedItemIndex + v15;
  if (!a6)
  {
    LODWORD(v19) = !v7;
    if (self->_trailingAction) {
      uint64_t v19 = v19;
    }
    else {
      uint64_t v19 = 1;
    }
    int64_t v20 = self->_numberOfItems - v19;
    if (v20 >= result) {
      int64_t v20 = result;
    }
    return v20 & ~(v20 >> 63);
  }
  return result;
}

- (int64_t)_indexOfTargetItemWithTranslation:(double)a3 roundingThreshold:(double)a4
{
  return [(SFCapsuleCollectionView *)self _indexOfTargetItemWithTranslation:0 roundingThreshold:0 allowActionIndex:a3 allowOutOfBounds:a4];
}

- (int64_t)_indexOfCentermostItemWithTranslation:(double)a3
{
  return [(SFCapsuleCollectionView *)self _indexOfTargetItemWithTranslation:a3 roundingThreshold:0.5];
}

- (void)_updateSuperviewForCapsule:(id)a3
{
  id v8 = a3;
  double v4 = [(SFCapsuleCollectionView *)self _superviewForCapsules];
  double v5 = [v8 superview];

  if (v5 != v4) {
    [v4 addSubview:v8];
  }
  CGRect v6 = [v8 shadowView];
  BOOL v7 = [v6 superview];

  if (v7 != v4) {
    objc_msgSend(v4, "insertSubview:atIndex:", v6, -[SFCapsuleCollectionView _insertionIndexForShadowInView:](self, "_insertionIndexForShadowInView:", v4));
  }
}

- (id)_superviewForCapsules
{
  if (self->_canBlurCapsules && self->_layoutStyle != 2) {
    self = (SFCapsuleCollectionView *)self->_contentView;
  }
  uint64_t v2 = self;

  return v2;
}

CGAffineTransform *__68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_2@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  if (!LOBYTE(result->ty))
  {
    uint64_t v17 = MEMORY[0x1E4F1DAB8];
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(a3 + 16) = v18;
    long long v15 = *(_OWORD *)(v17 + 32);
    goto LABEL_8;
  }
  tdouble x = result->tx;
  if (!a2 || !*(void *)(*(void *)&tx + 992))
  {
    [*(id *)&tx bounds];
    UIRectGetCenter();
    double v7 = v6;
    double v9 = v8;
    UIRectGetCenter();
    CGFloat v11 = (v10 - v7) * 0.05;
    CGFloat v13 = (v12 - v9) * 0.05;
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v21.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v21.c = v14;
    *(_OWORD *)&v21.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v20.a = *(_OWORD *)&v21.a;
    *(_OWORD *)&v20.c = v14;
    *(_OWORD *)&v20.tdouble x = *(_OWORD *)&v21.tx;
    CGAffineTransformScale(&v21, &v20, 1.05, 1.05);
    CGAffineTransform v19 = v21;
    int64_t result = CGAffineTransformTranslate(&v20, &v19, v11, v13);
    long long v16 = *(_OWORD *)&v20.c;
    long long v15 = *(_OWORD *)&v20.tx;
    CGAffineTransform v21 = v20;
    *(_OWORD *)a3 = *(_OWORD *)&v20.a;
    *(_OWORD *)(a3 + 16) = v16;
LABEL_8:
    *(_OWORD *)(a3 + 32) = v15;
    return result;
  }
  if (*(void *)(*(void *)&tx + 1048)) {
    [*(id *)&tx _scaleFromLinkedPageView];
  }
  else {
    CGFloat v5 = 1.0;
  }

  return CGAffineTransformMakeScale((CGAffineTransform *)a3, v5, v5);
}

- (BOOL)_shouldUseNormalLayoutForMinimizedCapsule
{
  BOOL v3 = [(SFCapsuleCollectionView *)self _shouldInteractivelySquish];
  if (v3)
  {
    if ((self->_minimizationFlags & 1) == 0)
    {
LABEL_5:
      LOBYTE(v3) = 0;
      return v3;
    }
    BOOL v3 = [(SFCapsuleCollectionView *)self selectedItemIsMinimized];
    if (v3)
    {
      if ((self->_minimizationFlags & 4) == 0) {
        goto LABEL_5;
      }
      [(SFCapsuleCollectionView *)self _selectedItemMinimizationPercent];
      LOBYTE(v3) = v4 < 1.0;
    }
  }
  return v3;
}

- (CGAffineTransform)_selectedItemContentTransform
{
  int64_t result = (CGAffineTransform *)[(SFCapsuleCollectionView *)self _shouldInteractivelySquish];
  if ((result & 1) != 0
    && ((int64_t result = (CGAffineTransform *)[(SFCapsuleCollectionView *)self selectedItemIsMinimized], !result)|| (int64_t result = (CGAffineTransform *)[(SFCapsuleCollectionView *)self _shouldUseNormalLayoutForMinimizedCapsule], (result & 1) != 0))&& (self->_minimizationFlags & 1) != 0)
  {
    [(SFCapsuleCollectionView *)self _selectedItemMinimizationPercent];
    double v16 = v8;
    [(SFCapsuleCollectionView *)self capsuleFrame];
    [(SFCapsuleCollectionView *)self minimizedCapsuleFrame];
    UIRectGetCenter();
    double v10 = v9;
    UIRectGetCenter();
    double v12 = _SFInterpolate(v10, v11, v16);
    [(SFCapsuleCollectionView *)self _selectedCapsuleFrame];
    UIRectGetCenter();
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeTranslation(&v18, 0.0, v12 - v13);
    [(SFCapsuleCollectionView *)self _minimizedContentScale];
    double v15 = _SFInterpolate(1.0, v14, v16);
    CGAffineTransform v17 = v18;
    return CGAffineTransformScale(retstr, &v17, v15, v15);
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v6 + 32);
  }
  return result;
}

- (BOOL)_shouldInteractivelySquish
{
  BOOL v3 = [(SFCapsuleCollectionView *)self _layoutStyleIsTop];
  if (v3) {
    LOBYTE(v3) = self->_minimizationStyle == 0;
  }
  return v3;
}

- (double)_selectedItemContentMinimizationPercent
{
  [(SFCapsuleCollectionView *)self _selectedItemMinimizationPercent];

  return _SFClampPercent(v2, 0.0, 0.3);
}

- (int64_t)_insertionIndexForShadowInView:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  double v4 = [v3 subviews];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SFCapsuleCollectionView__insertionIndexForShadowInView___block_invoke;
  v7[3] = &unk_1E54EA030;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (_SFFluidProgressView)minimizedProgressView
{
  return self->_minimizedProgressView;
}

- (SFLockdownStatusBar)lockdownStatusBar
{
  return self->_lockdownStatusBar;
}

- (void)setSelectedItemIndex:(int64_t)a3
{
}

- (void)updateDraggingWithOffset:(double)a3
{
}

- (int64_t)selectedItemState
{
  return self->_selectedItemState;
}

- (void)setMinimizationStyle:(int64_t)a3
{
  self->_int64_t minimizationStyle = a3;
}

- (void)setLinkedPageView:(id)a3
{
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleCollectionView;
  [(SFCapsuleCollectionView *)&v3 safeAreaInsetsDidChange];
  [(SFCapsuleCollectionView *)self setNeedsLayout];
}

- (id)createOrDequeueContentViewWithIdentifier:(id)a3 atIndex:(int64_t)a4
{
  contentViewRegistrations = self->_contentViewRegistrations;
  id v7 = a3;
  uint64_t v8 = [(NSMutableDictionary *)contentViewRegistrations objectForKeyedSubscript:v7];
  double v9 = [(NSArray *)self->_items objectAtIndexedSubscript:a4];
  uint64_t v10 = [v9 capsuleView];
  uint64_t v11 = [v10 contentView];
  double v12 = [v8 createOrDequeueViewWithExistingView:v11];
  reuseableContentView = self->_reuseableContentView;
  self->_reuseableContentView = v12;

  double v14 = (NSString *)[v7 copy];
  reusableContentViewIdentifier = self->_reusableContentViewIdentifier;
  self->_reusableContentViewIdentifier = v14;

  double v16 = self->_reuseableContentView;

  return v16;
}

void __55__SFCapsuleCollectionView__updateVisualEffectGroupName__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int64_t v5 = [a2 capsuleView];
  uint64_t v6 = *(void **)(a1 + 32);
  id v10 = v5;
  if (v6[123] != a3
    || (int v7 = [v6 _itemsShouldUsePlatterEffect],
        int v8 = [*(id *)(a1 + 32) _selectedItemShouldUsePlatterEffect],
        int64_t v5 = v10,
        v7 == v8))
  {
    uint64_t v9 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v9 = 0;
  }
  [v5 setVisualEffectGroupName:v9];
}

uint64_t __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  objc_super v3 = [v2 capsuleView];
  if (v3) {
    uint64_t v4 = [v2 capsuleIsDetached] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_updateCapsuleAlpha
{
  if ([(NSArray *)self->_items count])
  {
    objc_super v3 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
    char v4 = [v3 capsuleIsDetached];

    [(SFCapsuleCollectionView *)self _selectedItemBackgroundAlpha];
    double v6 = v5;
    char v7 = [(SFCapsuleCollectionView *)self _capsuleAlphaOptionsForSelectionGesture];
    double v8 = 0.0;
    if ((v7 & 2) != 0) {
      double v6 = 0.0;
    }
    if (v7) {
      double v9 = 0.0;
    }
    else {
      double v9 = 1.0;
    }
    double v10 = 0.0;
    if ((v7 & 4) != 0)
    {
      int64_t v11 = [(SFCapsuleCollectionView *)self _nextItemIndexForSelectionGesture];
      [(SFCapsuleCollectionView *)self _percentToSelectItemIndex:v11];
      double v10 = 1.0;
      if (v12 + v12 < 1.0)
      {
        [(SFCapsuleCollectionView *)self _percentToSelectItemIndex:v11];
        double v10 = v13 + v13;
      }
    }
    if (!self->_selectedItemState) {
      double v8 = v6;
    }
    BOOL v14 = [(SFCapsuleCollectionView *)self selectedItemIsMinimized];
    items = self->_items;
    indexesOfLoadedViews = self->_indexesOfLoadedViews;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__SFCapsuleCollectionView__updateCapsuleAlpha__block_invoke;
    v17[3] = &unk_1E54EA0F8;
    v17[4] = self;
    char v18 = v4;
    *(double *)&void v17[5] = v9;
    *(double *)&v17[6] = v10;
    *(double *)&v17[7] = v8;
    *(double *)&v17[8] = v6;
    BOOL v19 = v14;
    [(NSArray *)items enumerateObjectsAtIndexes:indexesOfLoadedViews options:0 usingBlock:v17];
  }
}

void __46__SFCapsuleCollectionView__updateCapsuleAlpha__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v35 = [v5 capsuleView];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 984);
  char v7 = [v5 capsuleIsDetached];

  if ((v7 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 896));
    if (objc_opt_respondsToSelector()) {
      char v9 = [WeakRetained capsuleCollectionView:*(void *)(a1 + 32) shouldHideShadowForItemAtIndex:a3];
    }
    else {
      char v9 = 0;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v10 + 866))
    {
      if (!*(unsigned char *)(v10 + 867))
      {
        if (!*(unsigned char *)(a1 + 72)) {
          goto LABEL_15;
        }
        goto LABEL_17;
      }
    }
    else if (!*(unsigned char *)(v10 + 867))
    {
      goto LABEL_17;
    }
    if (v6 != a3 || *(void *)(v10 + 992) == 0)
    {
LABEL_15:
      double v12 = [v35 shadowView];
      [v12 setAlpha:0.0];

      [v35 setAlpha:0.0];
      if (v6 == a3) {
        goto LABEL_43;
      }
LABEL_35:
      uint64_t v25 = *(void *)(a1 + 32);
      double v26 = fmax(fmin(*(double *)(v25 + 944) * *(double *)(a1 + 64), 1.0), 0.0);
      if (*(void *)(v25 + 992)) {
        double v27 = 1.0;
      }
      else {
        double v27 = v26;
      }
      double v28 = [v35 contentView];
      [v28 setAlpha:v27];

      NSUInteger v29 = [v35 backgroundView];
      [v29 setAlpha:1.0];

      if (*(unsigned char *)(a1 + 73))
      {
        BOOL v30 = *(void *)(*(void *)(a1 + 32) + 960) == 0;
LABEL_45:
        [v35 setForceMinimizedTheme:v30];

        goto LABEL_46;
      }
LABEL_44:
      BOOL v30 = 0;
      goto LABEL_45;
    }
LABEL_17:
    if (v6 != a3)
    {
      double v13 = 0.0;
      if (*(void *)(v10 + 880) == a3)
      {
        if ((v9 & 1) == 0) {
          double v13 = *(double *)(a1 + 48);
        }
        BOOL v14 = [v35 shadowView];
        [v14 setAlpha:v13];

        double v15 = (double *)(a1 + 48);
      }
      else
      {
        if ((v9 & 1) == 0) {
          double v13 = *(double *)(a1 + 56);
        }
        double v24 = [v35 shadowView];
        [v24 setAlpha:v13];

        double v15 = (double *)(a1 + 64);
      }
      [v35 setAlpha:*v15];
      goto LABEL_35;
    }
    uint64_t v16 = *(void *)(v10 + 968);
    if (v16 == 2 || v16 == 1)
    {
      CGAffineTransform v21 = [v35 shadowView];
      double v22 = v21;
      double v23 = 0.0;
    }
    else
    {
      if (v16)
      {
LABEL_42:
        [v35 setAlpha:*(double *)(a1 + 40)];
LABEL_43:
        BOOL v31 = [v35 contentView];
        [v31 setAlpha:1.0];

        [*(id *)(a1 + 32) _selectedItemBackgroundAlpha];
        double v33 = v32;
        CGRect v34 = [v35 backgroundView];
        [v34 setAlpha:v33];

        goto LABEL_44;
      }
      if (*(unsigned char *)(v10 + 868)) {
        char v17 = 1;
      }
      else {
        char v17 = v9;
      }
      double v18 = 0.0;
      if ((v17 & 1) == 0)
      {
        double v19 = *(double *)(a1 + 40);
        [*(id *)(a1 + 32) _selectedItemBackgroundAlpha];
        double v18 = v19 * v20;
      }
      CGAffineTransform v21 = [v35 shadowView];
      double v22 = v21;
      double v23 = v18;
    }
    [v21 setAlpha:v23];

    goto LABEL_42;
  }
LABEL_46:
}

- (unint64_t)_capsuleAlphaOptionsForSelectionGesture
{
  if (!self->_selectionGestureState) {
    return 0;
  }
  [(SFCapsuleCollectionView *)self _panGestureTranslationConstrainedToPanAxis];
  unint64_t panAxis = self->_panAxis;
  if (v3 < 0.0 && panAxis == 2) {
    unint64_t v6 = 2;
  }
  else {
    unint64_t v6 = 0;
  }
  if (panAxis == 2 && v3 < -50.0) {
    v6 |= self->_linkedPageView == 0;
  }
  if ([(SFCapsuleCollectionView *)self _nextItemIndexForSelectionGesture] == self->_numberOfItems
    && self->_selectionGestureState != 2
    && panAxis != 2)
  {
    v6 |= 4uLL;
  }
  return v6;
}

void __63__SFCapsuleCollectionView__dequeueOrCreateViewForItem_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) capsuleView];
  if (!v2)
  {
    if ([*(id *)(*(void *)(a1 + 40) + 424) count])
    {
      double v13 = [*(id *)(*(void *)(a1 + 40) + 424) anyObject];
      [*(id *)(*(void *)(a1 + 40) + 424) removeObject:v13];
      [(SFCapsuleView *)v13 setHidden:0];
      double v3 = [(SFCapsuleView *)v13 shadowView];
      [v3 setHidden:0];
    }
    else
    {
      char v4 = [SFCapsuleView alloc];
      [*(id *)(a1 + 40) capsuleFrame];
      double v13 = -[SFCapsuleView initWithFrame:](v4, "initWithFrame:");
      objc_msgSend(*(id *)(a1 + 40), "_updateSuperviewForCapsule:");
    }
    [*(id *)(a1 + 40) capsuleBackgroundCornerRadius];
    -[SFCapsuleView setBackgroundCornerRadius:](v13, "setBackgroundCornerRadius:");
    id v5 = [*(id *)(a1 + 40) _visualEffectGroupName];
    [(SFCapsuleView *)v13 setVisualEffectGroupName:v5];

    [(SFCapsuleView *)v13 setTheme:*(void *)(*(void *)(a1 + 40) + 464)];
    [(SFCapsuleView *)v13 setMinimizedTheme:*(void *)(*(void *)(a1 + 40) + 472)];
    [(SFCapsuleView *)v13 setLayoutStyle:*(void *)(*(void *)(a1 + 40) + 920)];
    unint64_t v6 = [(SFCapsuleView *)v13 backgroundView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 456);
      char v9 = [(SFCapsuleView *)v13 backgroundView];
      [v9 _setCaptureView:v8];
    }
    [*(id *)(a1 + 32) setCapsuleView:v13];
    uint64_t v2 = (uint64_t)v13;
  }
  id v14 = (id)v2;
  uint64_t v10 = *(unsigned char **)(a1 + 40);
  if (v10[875])
  {
    int64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = 0;
  }
  else
  {
    [v10 _fetchContentViewForItem:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _updateStateFlagsForContentViewAtIndex:*(void *)(a1 + 48)];
    int64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = 1;
  }
  [v11 setCapsuleContentIsValid:v12];
}

- (void)_fetchContentViewForItem:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  char v7 = [v6 capsuleView];
  uint64_t v8 = [v7 contentView];
  if (v8)
  {
    char v9 = [v7 reusableContentViewIdentifier];

    if (v9)
    {
      contentViewRegistrations = self->_contentViewRegistrations;
      int64_t v11 = [v7 reusableContentViewIdentifier];
      uint64_t v12 = [(NSMutableDictionary *)contentViewRegistrations objectForKeyedSubscript:v11];
      double v13 = [v7 contentView];
      [v12 enqueueView:v13];
    }
  }
  if ((int64_t)self->_numberOfItems <= a4)
  {
    double v15 = [(SFCapsuleCollectionView *)self _trailingActionContentView];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    double v15 = [WeakRetained capsuleCollectionView:self contentViewForItemAtIndex:a4];
  }
  if (objc_opt_respondsToSelector()) {
    [(UIView *)v15 setSizeUpdater:self];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = [(SFCapsuleCollectionView *)self _buttonPointerStyleProviderForContentView:v15];
    [(UIView *)v15 setButtonPointerStyleProvider:v16];
  }
  id v17 = objc_loadWeakRetained((id *)&self->_currentTransitionCoordinator);
  if (v17
    && ([v7 contentViewUpdateHandler],
        double v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        !v18))
  {
    double v20 = [v17 publicCoordinator];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __60__SFCapsuleCollectionView__fetchContentViewForItem_atIndex___block_invoke;
    v25[3] = &unk_1E54E9E40;
    objc_copyWeak(&v27, &location);
    id v21 = v20;
    id v26 = v21;
    [v7 setContentViewUpdateHandler:v25];

    objc_destroyWeak(&v27);
    int v19 = 1;
  }
  else
  {
    int v19 = 0;
  }
  [v7 setContentView:v15];
  if (v15 == self->_reuseableContentView) {
    reusableContentViewIdentifier = self->_reusableContentViewIdentifier;
  }
  else {
    reusableContentViewIdentifier = 0;
  }
  [v7 setReusableContentViewIdentifier:reusableContentViewIdentifier];
  if (v19) {
    [v7 setContentViewUpdateHandler:0];
  }
  reuseableContentView = self->_reuseableContentView;
  self->_reuseableContentView = 0;

  double v24 = self->_reusableContentViewIdentifier;
  self->_reusableContentViewIdentifier = 0;

  [(SFCapsuleCollectionView *)self _updateStateFlagsForContentViewAtIndex:a4];
  objc_destroyWeak(&location);
}

- (id)_buttonPointerStyleProviderForContentView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SFCapsuleCollectionView__buttonPointerStyleProviderForContentView___block_invoke;
  v7[3] = &unk_1E54EA2F0;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  id v5 = _Block_copy(v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v5;
}

- (double)capsuleBackgroundCornerRadius
{
  int64_t layoutStyle = self->_layoutStyle;
  if (layoutStyle == 2)
  {
    double v3 = &SFTopCapsuleBackgroundCornerRadius;
  }
  else
  {
    if (layoutStyle != 1) {
      return result;
    }
    double v3 = &SFCapsuleWithToolbarBackgroundCornerRadius;
  }
  return *(double *)v3;
}

void __52__SFCapsuleCollectionView__setIndexesOfLoadedViews___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsIndex:a3])
  {
    [*(id *)(a1 + 40) _dequeueOrCreateViewForItem:v5 atIndex:a3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)_updateStateFlagsForContentViewAtIndex:(int64_t)a3
{
  if ((int64_t)[(NSArray *)self->_items count] > a3)
  {
    selectedItemIndedouble x = self->_selectedItemIndex;
    int64_t selectedItemState = self->_selectedItemState;
    if ([(SFCapsuleCollectionView *)self selectedItemIsMinimized]
      && [(SFCapsuleCollectionView *)self _shouldUseNormalLayoutForMinimizedCapsule])
    {
      int64_t v7 = 0;
    }
    else
    {
      int64_t v7 = self->_selectedItemState;
    }
    self->_int64_t selectedItemState = v7;
    id v8 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
    id v16 = [v8 capsuleView];

    [v16 setSelected:selectedItemIndex == a3];
    if (self->_minimizationStyle) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = selectedItemIndex == a3;
    }
    if (v9) {
      int64_t v10 = self->_selectedItemState;
    }
    else {
      int64_t v10 = 0;
    }
    [v16 setState:v10];
    if (selectedItemIndex == a3)
    {
      selectedItemAccessoryViews = self->_selectedItemAccessoryViews;
      uint64_t v12 = [NSNumber numberWithInteger:self->_selectedItemState];
      double v13 = [(NSMutableDictionary *)selectedItemAccessoryViews objectForKeyedSubscript:v12];
      [v16 setAccessoryView:v13];
    }
    else
    {
      [v16 setAccessoryView:0];
    }
    uint64_t v14 = [v16 state];
    double Height = 0.0;
    if (v14 == 1 && self->_layoutStyle == 1)
    {
      [(SFCapsuleCollectionView *)self capsuleFrame];
      double Height = CGRectGetHeight(v18);
    }
    [v16 setBackgroundHeight:Height];
    self->_int64_t selectedItemState = selectedItemState;
  }
}

void __52__SFCapsuleCollectionView__setIndexesOfLoadedViews___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  char v5 = [*(id *)(a1 + 32) containsIndex:a3];
  id v6 = [v8 capsuleView];

  if ((v5 & 1) == 0 && v6)
  {
    int64_t v7 = *(void **)(a1 + 40);
    if (v7[123] == a3)
    {
      [v7 _updateOffsetForPan];
      int64_t v7 = *(void **)(a1 + 40);
    }
    [v7 _reclaimViewForItem:v8];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)contentViewForItemAtIndex:(int64_t)a3
{
  double v3 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
  id v4 = [v3 capsuleView];
  char v5 = [v4 contentView];

  return v5;
}

- (void)_dequeueOrCreateViewForItem:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__SFCapsuleCollectionView__dequeueOrCreateViewForItem_atIndex___block_invoke;
  v9[3] = &unk_1E54E9CB0;
  id v10 = v6;
  int64_t v11 = self;
  int64_t v12 = a4;
  id v8 = v6;
  objc_msgSend(v7, "safari_performWithoutRetargetingAnimations:", v9);
}

- (void)setTheme:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(_SFBarTheme *)self->_theme isEqual:v5])
  {
    objc_storeStrong((id *)&self->_theme, a3);
    id v6 = +[_SFBarTheme themeWithTheme:v5];
    effectiveTheme = self->_effectiveTheme;
    self->_effectiveTheme = v6;

    [(SFCapsuleCollectionView *)self _updateToolbarTheme];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = self->_items;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = self->_effectiveTheme;
          uint64_t v14 = [*(id *)(*((void *)&v24 + 1) + 8 * v12) capsuleView];
          [v14 setTheme:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v15 = self->_viewsForReuse;
    uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "setTheme:", self->_effectiveTheme, (void)v20);
        }
        while (v17 != v19);
        uint64_t v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }
  }
}

- (void)_updateToolbarTheme
{
  theme = self->_theme;
  if (theme)
  {
    if (self->_toolbarBackdropView)
    {
      id v4 = +[_SFBarTheme themeWithBarTintStyle:[(_SFBarTheme *)theme tintStyle]];
      toolbarTheme = self->_toolbarTheme;
      self->_toolbarTheme = v4;
    }
    else
    {
      toolbarTheme = self->_toolbarTheme;
      self->_toolbarTheme = 0;
    }

    [(SFCapsuleNavigationBarTheme *)self->_effectiveTheme setBackgroundTheme:self->_toolbarTheme];
    [(SFCapsuleCollectionView *)self _applyToolbarTheme];
  }
}

- (CGRect)_selectedCapsuleFrame
{
  if ([(SFCapsuleCollectionView *)self selectedItemIsMinimized]) {
    [(SFCapsuleCollectionView *)self minimizedCapsuleFrame];
  }
  else {
    [(SFCapsuleCollectionView *)self capsuleFrame];
  }
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  [(SFCapsuleCollectionView *)self _verticalOffsetForSelectedItem];
  double v12 = v11 + v8 + self->_offsetForPan.y;
  double v13 = v7 + self->_offsetForPan.x;
  double v14 = v9;
  double v15 = v10;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v12;
  result.origin.double x = v13;
  return result;
}

- (double)_verticalOffsetForSelectedItem
{
  [(SFCapsuleCollectionView *)self _verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:1 includeKeyboard:1.0];
  return result;
}

- (double)minimizedCapsuleHeightAboveKeyboard
{
  keyboarddouble Height = self->_keyboardHeight;
  BOOL showingKeyboard = self->_showingKeyboard;
  self->_BOOL showingKeyboard = 1;
  self->_keyboarddouble Height = 999.0;
  [(SFCapsuleCollectionView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SFCapsuleCollectionView *)self layoutMargins];
  CGFloat v14 = v8 + v13;
  CGFloat v17 = v10 - (v15 + v16);
  v20.size.CGFloat height = v12 - (v13 + v18);
  v20.origin.double x = v6 + v15;
  v20.origin.CGFloat y = v14;
  v20.size.CGFloat width = v17;
  [(SFCapsuleCollectionView *)self _selectedCapsuleHeightForWidth:1 state:0 ignoringKeyboard:CGRectGetWidth(v20)];
  self->_BOOL showingKeyboard = showingKeyboard;
  self->_keyboarddouble Height = keyboardHeight;
  return result;
}

- (unint64_t)selectionGestureAxis
{
  if (self->_selectionGestureState) {
    return self->_panAxis;
  }
  else {
    return 0;
  }
}

- (void)startPageViewControllerDidScroll:(id)a3
{
  if (self->_inputAccessoryView) {
    [(SFCapsuleCollectionView *)self setNeedsLayout];
  }
}

uint64_t __41__SFCapsuleCollectionView__updateToolbar__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layOutToolbar];
}

- (void)setShouldDismissContent:(BOOL)a3
{
}

void __51__SFCapsuleCollectionView__updateContentBlurRadius__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _contentIsDismissed]) {
    double v2 = 6.0;
  }
  else {
    double v2 = 0.0;
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  double v3 = [NSNumber numberWithDouble:v2];
  [v4 setValue:v3 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void __58__SFCapsuleCollectionView__insertionIndexForShadowInView___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)updateTrailingActionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v5 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = @"NO";
    if (v3) {
      double v6 = @"YES";
    }
    id v7 = v6;
    *(_DWORD *)buf = 138412290;
    double v10 = v7;
    _os_log_impl(&dword_18C354000, v5, OS_LOG_TYPE_DEFAULT, "Update trailing action animated = %@", buf, 0xCu);
  }
  if ([(SFCapsuleCollectionView *)self _updateTrailingAction] && v3)
  {
    if ([(SFCapsuleCollectionView *)self _canAnimateUpdates])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __56__SFCapsuleCollectionView_updateTrailingActionAnimated___block_invoke;
      v8[3] = &unk_1E54E9858;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 2, v8, 0);
    }
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(SFCapsuleCollectionView *)self _reloadDataWithoutLayout];
    double v5 = obj;
  }
}

- (void)reloadData
{
  int64_t numberOfUpdates = self->_numberOfUpdates;
  id v4 = [(SFCapsuleCollectionViewUpdate *)self->_update deletedItems];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__SFCapsuleCollectionView_reloadData__block_invoke;
  v10[3] = &unk_1E54E9DA0;
  v10[4] = self;
  [v4 enumerateObjectsUsingBlock:v10];

  update = self->_update;
  self->_update = 0;

  self->_int64_t numberOfUpdates = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__SFCapsuleCollectionView_reloadData__block_invoke_2;
  v9[3] = &unk_1E54E9DC8;
  void v9[4] = self;
  v9[5] = numberOfUpdates;
  [v6 setHandler:v9];
  [(SFCapsuleCollectionView *)self _reloadDataWithoutLayout];
  id v7 = [(SFCapsuleCollectionView *)self window];

  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__SFCapsuleCollectionView_reloadData__block_invoke_3;
    v8[3] = &unk_1E54E9858;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
  }
}

- (void)setMinimizedTheme:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_minimizedTheme = &self->_minimizedTheme;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_minimizedTheme, a3);
    id v7 = +[_SFBarTheme themeWithTheme:*p_minimizedTheme];
    effectiveMinimizedTheme = self->_effectiveMinimizedTheme;
    self->_effectiveMinimizedTheme = v7;

    [(SFCapsuleNavigationBarTheme *)self->_effectiveMinimizedTheme setBackgroundTheme:*p_minimizedTheme];
    [(SFCapsuleNavigationBarTheme *)self->_effectiveMinimizedTheme setHidesOverlayEffects:1];
    [(SFCapsuleCollectionView *)self _applyToolbarTheme];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v9 = self->_items;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          CGFloat v14 = self->_effectiveMinimizedTheme;
          double v15 = [*(id *)(*((void *)&v25 + 1) + 8 * v13) capsuleView];
          [v15 setMinimizedTheme:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v11);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v16 = self->_viewsForReuse;
    uint64_t v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "setMinimizedTheme:", self->_effectiveMinimizedTheme, (void)v21);
        }
        while (v18 != v20);
        uint64_t v18 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v18);
    }

    [(SFCapsuleCollectionView *)self _updateMinimizedProgressViewFillColor];
  }
}

- (void)_applyToolbarTheme
{
  BOOL v3 = [(_SFBarTheme *)self->_toolbarTheme controlsTintColor];
  [(UIView *)self->_toolbar setTintColor:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop]
      || ![(SFCapsuleCollectionView *)self selectedItemIsMinimized]
      || (toolbarTheme = self->_minimizedTheme) == 0
      || self->_minimizationStyle)
    {
      toolbarTheme = self->_toolbarTheme;
    }
    [(_SFBarTheme *)toolbarTheme applyBackdropEffectsToView:self->_toolbarBackdropView];
  }

  [(SFCapsuleCollectionView *)self _updateVisualEffectGroupName];
}

- (void)_updateMinimizedProgressViewFillColor
{
  BOOL v3 = [(SFCapsuleCollectionView *)self selectedItemIsMinimized];
  effectiveMinimizedTheme = self->_effectiveMinimizedTheme;
  if (v3) {
    [(_SFBarTheme *)effectiveMinimizedTheme controlsTintColor];
  }
  else {
  id v5 = [(_SFBarTheme *)effectiveMinimizedTheme platterProgressBarTintColor];
  }
  [(_SFFluidProgressView *)self->_minimizedProgressView setProgressBarFillColor:v5];
}

- (void)_updateVisualEffectGroupName
{
  BOOL v3 = [(SFCapsuleCollectionView *)self _visualEffectGroupName];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(SFCapsuleCollectionView *)self _shouldGroupToolbarBackdropWithCapsules])
    {
      id v4 = v3;
    }
    else
    {
      id v4 = 0;
    }
    [(UIView *)self->_toolbarBackdropView _setGroupName:v4];
  }
  items = self->_items;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SFCapsuleCollectionView__updateVisualEffectGroupName__block_invoke;
  v7[3] = &unk_1E54E9E18;
  void v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [(NSArray *)items enumerateObjectsUsingBlock:v7];
}

- (id)_visualEffectGroupName
{
  if ([(SFCapsuleCollectionView *)self selectedItemIsMinimized]
    && !self->_visualEffectTransitionCount
    && (objc_opt_respondsToSelector() & 1) != 0
    && !self->_minimizationStyle)
  {
    BOOL v3 = [(_SFBarTheme *)self->_minimizedTheme backdropGroupName];
  }
  else
  {
    BOOL v3 = objc_msgSend(NSString, "stringWithFormat:", @"SFCapsuleCollectionView.%p", self);
  }

  return v3;
}

- (BOOL)_shouldGroupToolbarBackdropWithCapsules
{
  return ![(SFCapsuleCollectionView *)self _layoutStyleIsTop]
      && !UIAccessibilityIsReduceMotionEnabled();
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleCollectionView;
  [(SFCapsuleCollectionView *)&v3 layoutMarginsDidChange];
  [(SFCapsuleCollectionView *)self _updateRangeOfLoadedViews];
}

- (void)_reloadDataWithoutLayout
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_super v3 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C354000, v3, OS_LOG_TYPE_DEFAULT, "Reload data", buf, 2u);
  }
  id v4 = [MEMORY[0x1E4F28D60] indexSet];
  [(SFCapsuleCollectionView *)self _setIndexesOfLoadedViews:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_numberOfItems = [WeakRetained numberOfItemsInCapsuleCollectionView:self];

  self->_selectedItemIndedouble x = 0;
  id v6 = (void *)[(NSArray *)self->_items mutableCopy];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_numberOfItems];
  }
  double v9 = v8;

  unint64_t v10 = self->_numberOfItems + 1;
  while ([v9 count] > v10)
    [v9 removeLastObject];
  while ([v9 count] < v10)
  {
    uint64_t v11 = [[SFCapsuleCollectionViewItem alloc] initWithCollectionView:self];
    [v9 addObject:v11];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "invalidateCapsuleHeight", (void)v20);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v14);
  }

  uint64_t v17 = (NSArray *)[v12 copy];
  items = self->_items;
  self->_items = v17;

  [(SFCapsuleCollectionView *)self _updateActions];
  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [v19 capsuleCollectionViewWillReloadData:self];
  }
  [(SFCapsuleCollectionView *)self _updateRangeOfLoadedViews];
  [(SFCapsuleCollectionView *)self setNeedsLayout];
}

- (void)_updateRangeOfLoadedViews
{
  if (self->_numberOfItems)
  {
    id v9 = [MEMORY[0x1E4F28E60] indexSetWithIndex:self->_selectedItemIndex];
    objc_super v3 = [(SFCapsuleCollectionView *)self _indexesOfVisibleItemsIncludingAction:1];
    [v9 addIndexes:v3];

    id v4 = [(SFCapsuleCollectionView *)self _indexesOfAnimatingItems];
    [v9 addIndexes:v4];
    id v5 = [(NSArray *)self->_items indexesOfObjectsPassingTest:&__block_literal_global_116];
    [v9 addIndexes:v5];

    id v6 = self->_indexesOfLoadedViews;
    [(SFCapsuleCollectionView *)self _setIndexesOfLoadedViews:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_timerToDiscardViewsForReuse);
    if ([v4 count] && WeakRetained)
    {
      id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
      [WeakRetained setFireDate:v8];
    }
    else if (![(NSIndexSet *)self->_indexesOfLoadedViews isEqualToIndexSet:v6])
    {
      [(SFCapsuleCollectionView *)self _scheduleTimerToDiscardViewsForReuseIfNeeded];
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28D60] indexSet];
    [(SFCapsuleCollectionView *)self _setIndexesOfLoadedViews:v9];
  }
}

- (void)_setIndexesOfLoadedViews:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_indexesOfLoadedViews, a3);
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  items = self->_items;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__SFCapsuleCollectionView__setIndexesOfLoadedViews___block_invoke;
  v17[3] = &unk_1E54EA008;
  id v7 = v5;
  id v18 = v7;
  id v19 = self;
  long long v20 = &v21;
  [(NSArray *)items enumerateObjectsUsingBlock:v17];
  id v8 = self->_items;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __52__SFCapsuleCollectionView__setIndexesOfLoadedViews___block_invoke_2;
  uint64_t v13 = &unk_1E54EA008;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = self;
  double v16 = &v21;
  [(NSArray *)v8 enumerateObjectsUsingBlock:&v10];
  if (*((unsigned char *)v22 + 24)) {
    [(SFCapsuleCollectionView *)self setNeedsLayout];
  }

  _Block_object_dispose(&v21, 8);
}

- (void)setNeedsLayout
{
  if (!self->_ignoreSetNeedsLayout)
  {
    v2.receiver = self;
    v2.super_class = (Class)SFCapsuleCollectionView;
    [(SFCapsuleCollectionView *)&v2 setNeedsLayout];
  }
}

- (void)_updateTopAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    topAction = self->_topAction;
    self->_topAction = 0;
  }
  else
  {
    objc_super v3 = [WeakRetained topActionForCapsuleCollectionView:self];
    topAction = self->_topAction;
    self->_topAction = v3;
  }
}

- (void)_updateActions
{
  [(SFCapsuleCollectionView *)self _updateTrailingAction];

  [(SFCapsuleCollectionView *)self _updateTopAction];
}

- (BOOL)_updateTrailingAction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = self->_trailingAction;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [WeakRetained trailingActionForCapsuleCollectionView:self];
  }
  else
  {
    id v5 = 0;
  }
  trailingAction = self->_trailingAction;
  self->_trailingAction = v5;

  id v7 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_trailingAction) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    id v9 = v8;
    int v13 = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_18C354000, v7, OS_LOG_TYPE_DEFAULT, "Update trailing action = %@", (uint8_t *)&v13, 0xCu);
  }
  char v10 = WBSIsEqual();
  if ((v10 & 1) == 0)
  {
    [(SFCapsuleCollectionView *)self setNeedsLayout];
    if ([(NSArray *)self->_items count] == self->_numberOfItems + 1)
    {
      if (-[NSIndexSet containsIndex:](self->_indexesOfLoadedViews, "containsIndex:"))
      {
        uint64_t v11 = [(NSArray *)self->_items lastObject];
        [(SFCapsuleCollectionView *)self _fetchContentViewForItem:v11 atIndex:self->_numberOfItems];
      }
    }
  }

  return v10 ^ 1;
}

- (NSIndexSet)_indexesOfAnimatingItems
{
  return [(NSArray *)self->_items indexesOfObjectsPassingTest:&__block_literal_global_122];
}

- (void)_scheduleTimerToDiscardViewsForReuseIfNeeded
{
  NSUInteger v3 = [(NSIndexSet *)self->_indexesOfLoadedViews count];
  unint64_t v4 = [(NSMutableSet *)self->_viewsForReuse count] + v3;
  if (v4 > [(SFCapsuleCollectionView *)self _softMaximumNumberOfViews])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_timerToDiscardViewsForReuse);

    if (!WeakRetained)
    {
      id v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__discardExcessViewsForReuse selector:0 userInfo:0 repeats:1.0];
      objc_storeWeak((id *)&self->_timerToDiscardViewsForReuse, v6);
    }
  }
}

- (unint64_t)_softMaximumNumberOfViews
{
  return [(SFCapsuleCollectionView *)self _maximumNumberOfVisibleViews] + 1;
}

- (unint64_t)_maximumNumberOfVisibleViews
{
  [(SFCapsuleCollectionView *)self capsuleFrame];
  double Width = CGRectGetWidth(v11);
  [(SFCapsuleCollectionView *)self bounds];
  double v4 = CGRectGetWidth(v12);
  if (v4 <= Width) {
    return 1;
  }
  double v5 = v4;
  [(SFCapsuleCollectionView *)self pageWidth];
  int64_t v7 = (uint64_t)(floor((v5 - Width) / v6) + 1.0);
  double v8 = v5 - (double)v7 * v6;
  [(SFCapsuleCollectionView *)self _interCapsuleSpacing];
  if (v8 <= v9)
  {
    if (v8 > 0.0) {
      ++v7;
    }
  }
  else
  {
    v7 += 2;
  }
  return v7;
}

- (int64_t)selectionGestureState
{
  return self->_selectionGestureState;
}

- (BOOL)alwaysShowTopBackdrop
{
  return self->_alwaysShowTopBackdrop;
}

uint64_t __41__SFCapsuleCollectionView__layOutToolbar__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "ss_untransformedFrame");
    double MidY = CGRectGetMidY(v17);
    [*(id *)(a1 + 32) bounds];
    double v3 = (MidY - CGRectGetMidY(v18)) * 0.05;
    CGFloat v4 = 1.05;
  }
  else
  {
    double v3 = 0.0;
    CGFloat v4 = 1.0;
  }
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v15.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v15.c = v5;
  *(_OWORD *)&v15.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v14.a = *(_OWORD *)&v15.a;
  *(_OWORD *)&v14.c = v5;
  *(_OWORD *)&v14.tdouble x = *(_OWORD *)&v15.tx;
  CGAffineTransformScale(&v15, &v14, v4, v4);
  CGAffineTransform v13 = v15;
  CGAffineTransformTranslate(&v14, &v13, 0.0, v3);
  *(_OWORD *)&v15.tdouble x = *(_OWORD *)&v14.tx;
  CGAffineTransform v16 = v14;
  double v6 = *(void **)(*(void *)(a1 + 32) + 1000);
  CGAffineTransform v12 = v14;
  [v6 setTransform:&v12];
  if (*(unsigned char *)(a1 + 40)) {
    double v7 = v3;
  }
  else {
    double v7 = 0.0;
  }
  CGAffineTransformMakeTranslation(&v11, 0.0, v7);
  double v8 = *(void **)(*(void *)(a1 + 32) + 528);
  CGAffineTransform v10 = v11;
  return [v8 setTransform:&v10];
}

- (void)setShowingLockdownStatusBar:(BOOL)a3
{
  if (self->_showingLockdownStatusBar != a3)
  {
    self->_showingLockdownStatusBar = a3;
    if (a3)
    {
      CGFloat v4 = objc_alloc_init(SFLockdownStatusBar);
      lockdownStatusBar = self->_lockdownStatusBar;
      self->_lockdownStatusBar = v4;

      [(SFLockdownStatusBar *)self->_lockdownStatusBar setNavigationBarItem:self->_navigationBarItem];
      [(SFLockdownStatusBar *)self->_lockdownStatusBar setShouldAnimateNavigationBarItemChanges:self->_layoutStyle == 1];
      [(UIView *)self->_contentView addSubview:self->_lockdownStatusBar];
    }
    else
    {
      [(SFLockdownStatusBar *)self->_lockdownStatusBar removeFromSuperview];
      double v6 = self->_lockdownStatusBar;
      self->_lockdownStatusBar = 0;
    }
    [(SFCapsuleCollectionView *)self setNeedsLayout];
  }
}

- (SFCapsuleCollectionView)initWithFrame:(CGRect)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)SFCapsuleCollectionView;
  double v3 = -[SFCapsuleCollectionView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28D60] indexSet];
    indexesOfLoadedViews = v3->_indexesOfLoadedViews;
    v3->_indexesOfLoadedViews = (NSIndexSet *)v4;

    v3->_int64_t layoutStyle = 1;
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    gestureObservers = v3->_gestureObservers;
    v3->_gestureObservers = (NSHashTable *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v3 action:sel__didReceiveTap_];
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = (UITapGestureRecognizer *)v8;

    [(UITapGestureRecognizer *)v3->_tapGestureRecognizer setDelegate:v3];
    [(SFCapsuleCollectionView *)v3 addGestureRecognizer:v3->_tapGestureRecognizer];
    CGAffineTransform v10 = (_UIVisualEffectBackdropView *)objc_alloc_init(MEMORY[0x1E4FB23F0]);
    backgroundCaptureView = v3->_backgroundCaptureView;
    v3->_backgroundCaptureView = v10;

    [(_UIVisualEffectBackdropView *)v3->_backgroundCaptureView setUserInteractionEnabled:0];
    [(SFCapsuleCollectionView *)v3 addSubview:v3->_backgroundCaptureView];
    id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(SFCapsuleCollectionView *)v3 bounds];
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:");
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v13;

    [(UIView *)v3->_contentView setAutoresizingMask:18];
    [(SFCapsuleCollectionView *)v3 addSubview:v3->_contentView];
    CGAffineTransform v15 = objc_alloc_init(_SFFluidProgressView);
    minimizedProgressView = v3->_minimizedProgressView;
    v3->_minimizedProgressView = v15;

    [(_SFFluidProgressView *)v3->_minimizedProgressView setDelegate:v3];
    [(_SFFluidProgressView *)v3->_minimizedProgressView setAlignsToTop:1];
    [(SFCapsuleCollectionView *)v3 _updateShowsMinimizedProgressView];
    [(UIView *)v3->_contentView addSubview:v3->_minimizedProgressView];
    items = v3->_items;
    v3->_items = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
    viewsForReuse = v3->_viewsForReuse;
    v3->_viewsForReuse = (NSMutableSet *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    contentViewRegistrations = v3->_contentViewRegistrations;
    v3->_contentViewRegistrations = (NSMutableDictionary *)v20;

    v3->_capsuledouble Width = -1.0;
    v3->_keepsCapsulesAboveKeyboard = 1;
    v3->_int64_t selectionGestureLimit = 1;
    [(SFCapsuleCollectionView *)v3 setInsetsLayoutMarginsFromSafeArea:0];
    v3->_usesFastDeceleration = 0;
    long long v22 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1C18]);
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v3 action:sel__didReceivePan_];
    panGesture = v3->_panGesture;
    v3->_panGesture = (UIPanGestureRecognizer *)v24;

    [(UIPanGestureRecognizer *)v3->_panGesture setDelegate:v3];
    [(UIPanGestureRecognizer *)v3->_panGesture _setHysteresis:5.0];
    [(SFCapsuleCollectionView *)v3 addGestureRecognizer:v3->_panGesture];
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v3 action:sel__didReceiveDismissPan_];
    dismissPanGestureRecognizer = v3->_dismissPanGestureRecognizer;
    v3->_dismissPanGestureRecognizer = (UIPanGestureRecognizer *)v26;

    [(UIPanGestureRecognizer *)v3->_dismissPanGestureRecognizer setDelegate:v3];
    [(SFCapsuleCollectionView *)v3 addGestureRecognizer:v3->_dismissPanGestureRecognizer];
    [(SFCapsuleCollectionView *)v3 _updateCanBlurCapsules];
    uint64_t v28 = [MEMORY[0x1E4FB1EE0] behaviorWithDampingRatio:1.0 response:0.45];
    blurSpringBehavior = v3->_blurSpringBehavior;
    v3->_blurSpringBehavior = (UIViewSpringAnimationBehaviorDescribing *)v28;

    if (SFEnhancedTabOverviewEnabled())
    {
      uint64_t v30 = objc_msgSend(MEMORY[0x1E4F39BC0], "safari_gaussianBlurWithRadius:", 0.0);
      v44[0] = v30;
      uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
      double v32 = [(UIView *)v3->_contentView layer];
      [v32 setFilters:v31];
    }
    double v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v3 selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x1E4FB2C48] object:0];
    [v33 addObserver:v3 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v33 addObserver:v3 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
    [v33 addObserver:v3 selector:sel__keyboardDidHide_ name:*MEMORY[0x1E4FB2BC0] object:0];
    [(SFCapsuleCollectionView *)v3 registerContentViewIdentifier:@"SFCapsuleCollectionViewActionContentView" block:&__block_literal_global_2];
    uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
    selectedItemAccessoryViews = v3->_selectedItemAccessoryViews;
    v3->_selectedItemAccessoryViews = (NSMutableDictionary *)v34;

    uint64_t v43 = objc_opt_class();
    CGRect v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    id v37 = (id)[(SFCapsuleCollectionView *)v3 registerForTraitChanges:v36 withTarget:v3 action:sel__preferredContentSizeCategoryDidChange];

    CGFloat v38 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    id v39 = (id)[(SFCapsuleCollectionView *)v3 registerForTraitChanges:v38 withTarget:v3 action:sel__updateKeyboardBackdropViewStyle];

    CGFloat v40 = v3;
  }

  return v3;
}

- (void)registerContentViewIdentifier:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[SFCapsuleContentViewRegistration alloc] initWithCreateViewBlock:v6];

  [(NSMutableDictionary *)self->_contentViewRegistrations setObject:v8 forKeyedSubscript:v7];
}

- (void)_updateCanBlurCapsules
{
  BOOL v2 = self->_selectionGestureState == 0;
  if (self->_canBlurCapsules != v2)
  {
    self->_canBlurCapsules = v2;
    [(SFCapsuleCollectionView *)self setNeedsLayout];
  }
}

- (void)setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_selectedItemIndex != a3)
  {
    BOOL v4 = a4;
    if ([(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView drivesCapsuleSelection]&& self->_selectionGestureState == 1)
    {
      id v7 = [NSNumber numberWithInteger:a3];
      nextSelectedItemIndexAfterPan = self->_nextSelectedItemIndexAfterPan;
      self->_nextSelectedItemIndexAfterPan = v7;
    }
    else
    {
      [(SFCapsuleCollectionView *)self beginUpdates];
      double v9 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        CGAffineTransform v10 = @"NO";
        if (v4) {
          CGAffineTransform v10 = @"YES";
        }
        CGAffineTransform v11 = v10;
        v12[0] = 67109378;
        v12[1] = a3;
        __int16 v13 = 2112;
        CGAffineTransform v14 = v11;
        _os_log_impl(&dword_18C354000, v9, OS_LOG_TYPE_DEFAULT, "Select indedouble x = %d; animated = %@",
          (uint8_t *)v12,
          0x12u);
      }
      [(SFCapsuleCollectionViewUpdate *)self->_update setSelectedItemIndex:a3 animated:v4];
      self->_selectedItemIndedouble x = [(SFCapsuleCollectionViewUpdate *)self->_update selectedItemIndexAfterUpdate];
      [(SFCapsuleCollectionView *)self setNeedsLayout];
      [(SFCapsuleCollectionView *)self endUpdates];
    }
  }
}

- (void)setNavigationBarItem:(id)a3
{
  long long v5 = (SFNavigationBarItem *)a3;
  p_navigationBarItem = &self->_navigationBarItem;
  navigationBarItem = self->_navigationBarItem;
  __int16 v13 = v5;
  if (navigationBarItem != v5)
  {
    uint64_t v8 = [(SFNavigationBarItem *)navigationBarItem fluidProgressController];
    [v8 unregisterObserver:self->_minimizedProgressView];

    objc_storeStrong((id *)&self->_navigationBarItem, a3);
    double v9 = [(SFNavigationBarItem *)*p_navigationBarItem fluidProgressController];
    [v9 registerObserver:self->_minimizedProgressView];

    minimizedProgressView = self->_minimizedProgressView;
    CGAffineTransform v11 = [(SFNavigationBarItem *)*p_navigationBarItem fluidProgressStateSource];
    id v12 = [v11 progressState];
    [(_SFFluidProgressView *)minimizedProgressView setProgressToCurrentPositionForState:v12];

    [(SFLockdownStatusBar *)self->_lockdownStatusBar setNavigationBarItem:v13];
    [(SFCapsuleCollectionView *)self _updateShowsMinimizedProgressView];
  }
}

- (void)_updateShowsMinimizedProgressView
{
  BOOL v3 = ![(_SFFluidProgressView *)self->_minimizedProgressView isShowingProgress]
    || self->_selectedItemState != 1
    || self->_showingAlternateToolbarContent
    || self->_minimizationStyle == 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransitionCoordinator);
  long long v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__SFCapsuleCollectionView__updateShowsMinimizedProgressView__block_invoke;
    v6[3] = &unk_1E54E9A38;
    v6[4] = self;
    BOOL v7 = v3;
    [WeakRetained addAnimations:v6];
  }
  else
  {
    [(_SFFluidProgressView *)self->_minimizedProgressView setAlpha:(double)!v3];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  long long v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(SFCapsuleCollectionView *)self _updateToolbar];
    [(SFCapsuleCollectionView *)self _reloadDataWithoutLayout];
    long long v5 = obj;
  }
}

- (void)_updateToolbar
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!self->_contentBorrowed)
  {
    p_toolbar = &self->_toolbar;
    BOOL v4 = self->_toolbar;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      id v6 = [WeakRetained createToolbarForCapsuleCollectionView:self];
    }
    else
    {
      id v6 = 0;
    }
    if (v4 != v6
      || ([(UIView *)v4 superview],
          BOOL v7 = (UIView *)objc_claimAutoreleasedReturnValue(),
          contentView = self->_contentView,
          v7,
          v7 != contentView))
    {
      [(UIView *)v4 removeFromSuperview];
      objc_storeStrong((id *)p_toolbar, v6);
      if (v6)
      {
        if (SFEnhancedTabOverviewEnabled())
        {
          double v9 = objc_msgSend(MEMORY[0x1E4F39BC0], "safari_gaussianBlurWithRadius:", 0.0);
          v13[0] = v9;
          CGAffineTransform v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
          CGAffineTransform v11 = [(UIView *)*p_toolbar layer];
          [v11 setFilters:v10];
        }
        [(SFCapsuleCollectionView *)self _createToolbarBackdropIfNeeded];
        [(UIView *)self->_contentView insertSubview:*p_toolbar aboveSubview:self->_toolbarBackdropView];
        [(SFCapsuleCollectionView *)self _updateToolbarTheme];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        _DWORD v12[2] = __41__SFCapsuleCollectionView__updateToolbar__block_invoke;
        v12[3] = &unk_1E54E9858;
        v12[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v12];
      }
    }
  }
}

- (void)_createToolbarBackdropIfNeeded
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (!self->_toolbarBackdropView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
    BOOL v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    long long v5 = (UIView *)[v3 initWithEffect:v4];

    [(UIView *)v5 _setCaptureView:self->_backgroundCaptureView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    BOOL v7 = [(UIView *)v5 contentView];
    [v7 bounds];
    double Width = CGRectGetWidth(v18);
    double v9 = (UIView *)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, Width, _SFOnePixel());
    bottomSeparator = self->_bottomSeparator;
    self->_bottomSeparator = v9;

    [(UIView *)self->_bottomSeparator setAutoresizingMask:34];
    CGAffineTransform v11 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)self->_bottomSeparator setBackgroundColor:v11];

    id v12 = [(UIView *)v5 contentView];
    [v12 addSubview:self->_bottomSeparator];

    toolbarBackdropView = self->_toolbarBackdropView;
    self->_toolbarBackdropView = v5;

    if (SFEnhancedTabOverviewEnabled())
    {
      CGAffineTransform v14 = objc_msgSend(MEMORY[0x1E4F39BC0], "safari_gaussianBlurWithRadius:", 0.0);
      v17[0] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      CGAffineTransform v16 = [(UIView *)self->_toolbarBackdropView layer];
      [v16 setFilters:v15];
    }
    [(UIView *)self->_contentView insertSubview:self->_toolbarBackdropView atIndex:0];
  }
}

- (void)updateVerticalSwipeThreshold
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v3, "safari_doubleForKey:defaultValue:", @"DebugLoweredBarVerticalMinimizingSwipeThreshold", 40.0);
  double v5 = v4;

  self->_verticalSwipeThreshold = tan(v5 / 180.0 * 3.14159265);
}

- (void)addGestureObserver:(id)a3
{
  id v5 = a3;
  -[NSHashTable addObject:](self->_gestureObservers, "addObject:");
  if (self->_sendProgressMessageToObservers) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector();
  }
  self->_sendProgressMessageToObservers = v4 & 1;
}

void __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6 == a3) {
    goto LABEL_34;
  }
  int v7 = *(unsigned __int8 *)(a1 + 176);
  BOOL v10 = v6 > a3 && v7 != 0 || v6 < a3 && v7 == 0;
  uint64_t v11 = a3 + 1;
  uint64_t v12 = [*(id *)(a1 + 32) count];
  uint64_t v13 = v12;
  if (*(unsigned char *)(a1 + 177) || v11 == v12 && !*(void *)(*(void *)(a1 + 40) + 496))
  {
    CGAffineTransform v14 = (uint64_t *)(a1 + 72);
    uint64_t v15 = (uint64_t *)(a1 + 80);
    CGAffineTransform v16 = (uint64_t *)(a1 + 88);
    CGRect v17 = (uint64_t *)(a1 + 96);
  }
  else
  {
    CGAffineTransform v14 = (uint64_t *)(a1 + 104);
    uint64_t v15 = (uint64_t *)(a1 + 112);
    CGAffineTransform v16 = (uint64_t *)(a1 + 120);
    CGRect v17 = (uint64_t *)(a1 + 128);
  }
  uint64_t v18 = *v14;
  uint64_t v19 = *v15;
  uint64_t v20 = *v16;
  uint64_t v21 = *v17;
  double v22 = *(double *)(a1 + 144)
      + (fabs((double)(a3 - *(void *)(a1 + 64))) + -1.0) * (*(double *)(a1 + 136) + *(double *)(a1 + 144));
  if (v10)
  {
    double v23 = CGRectGetMinX(*(CGRect *)&v18) - v22;
    if (v11 == v13)
    {
      [*(id *)(a1 + 40) layoutMargins];
      double v25 = v24;
LABEL_23:
      uint64_t v27 = [*(id *)(a1 + 40) _nextItemIndexForSelectionGesture];
      uint64_t v28 = *(void **)(a1 + 40);
      double v29 = 0.0;
      if (v27 >= v28[110])
      {
        objc_msgSend(v28, "_percentToSelectItemIndex:");
        double v29 = v30;
      }
      double v31 = _SFInterpolate(-v25, v25, v29);
      double v32 = v23;
      if (!v10) {
        double v32 = CGRectGetWidth(*(CGRect *)(a1 + 72)) - v23;
      }
      double v33 = fmax(*(double *)(a1 + 152), fmin(*(double *)(a1 + 136), v32 - v31));
      goto LABEL_29;
    }
  }
  else
  {
    double v23 = v22 + CGRectGetMaxX(*(CGRect *)&v18);
    if (v11 == v13)
    {
      [*(id *)(a1 + 40) layoutMargins];
      double v25 = v26;
      goto LABEL_23;
    }
  }
  double v33 = *(double *)(a1 + 136);
LABEL_29:
  uint64_t v34 = *(void **)(a1 + 40);
  id v35 = [v5 capsuleView];
  [v34 _updateSuperviewForCapsule:v35];

  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  uint64_t v43 = __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_5;
  CGFloat v44 = &unk_1E54E9C60;
  id v36 = v5;
  uint64_t v37 = *(void *)(a1 + 152);
  uint64_t v38 = *(void *)(a1 + 160);
  double v48 = v33;
  uint64_t v49 = v37;
  uint64_t v39 = *(void *)(a1 + 40);
  id v45 = v36;
  uint64_t v46 = v39;
  uint64_t v50 = a3;
  uint64_t v51 = v38;
  double v52 = v23;
  BOOL v56 = v10;
  uint64_t v53 = *(void *)(a1 + 168);
  char v57 = *(unsigned char *)(a1 + 178);
  long long v54 = *(_OWORD *)(a1 + 104);
  long long v55 = *(_OWORD *)(a1 + 120);
  id v47 = *(id *)(a1 + 56);
  CGFloat v40 = (void (**)(void))_Block_copy(&v41);
  if (objc_msgSend(v36, "animationCount", v41, v42, v43, v44)
    || [*(id *)(a1 + 48) containsIndex:a3])
  {
    v40[2](v40);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "safari_performWithoutRetargetingAnimations:", v40);
  }

LABEL_34:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleCollectionView;
  [(SFCapsuleCollectionView *)&v3 didMoveToWindow];
  if (!self->_numberOfItems) {
    [(SFCapsuleCollectionView *)self _reloadDataWithoutLayout];
  }
}

void __37__SFCapsuleCollectionView_reloadData__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 744) = *(void *)(a1 + 40);
  if (*(void *)(a1 + 40))
  {
    BOOL v2 = [[SFCapsuleCollectionViewUpdate alloc] initWithCollectionView:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(a1 + 32);
    char v4 = *(void **)(v3 + 736);
    *(void *)(v3 + 736) = v2;
  }
}

- (void)setSelectedItemAccessoryView:(id)a3 forState:(int64_t)a4
{
  selectedItemAccessoryViews = self->_selectedItemAccessoryViews;
  int v7 = NSNumber;
  id v8 = a3;
  double v9 = [v7 numberWithInteger:a4];
  [(NSMutableDictionary *)selectedItemAccessoryViews setObject:v8 forKeyedSubscript:v9];

  if (self->_numberOfItems && self->_selectedItemState == a4)
  {
    selectedItemIndedouble x = self->_selectedItemIndex;
    [(SFCapsuleCollectionView *)self _updateStateFlagsForContentViewAtIndex:selectedItemIndex];
  }
}

- (void)setShouldDismissContent:(BOOL)a3 withDelay:(double)a4
{
  if (self->_shouldDismissContent != a3)
  {
    [(SFCapsuleCollectionView *)self layoutIfNeeded];
    self->_shouldDismissContent = a3;
    [(SFCapsuleCollectionView *)self setNeedsLayout];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SFCapsuleCollectionView_setShouldDismissContent_withDelay___block_invoke;
    v9[3] = &unk_1E54E9DC8;
    void v9[4] = self;
    *(double *)&v9[5] = a4;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__SFCapsuleCollectionView_setShouldDismissContent_withDelay___block_invoke_2;
    v7[3] = &unk_1E54EA1E0;
    BOOL v8 = a3;
    void v7[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultDampedSpringWithDelay:2 initialSpringVelocity:v9 options:v7 animations:a4 completion:0.0];
  }
}

- (void)_updateDragWithOffset:(double)a3 velocity:(double)a4 ended:(BOOL)a5
{
  unint64_t minimizationFlags = self->_minimizationFlags;
  if ((minimizationFlags & 1) != 0 && !self->_forceHidden)
  {
    BOOL v7 = a5;
    if (a5) {
      self->_unint64_t minimizationFlags = minimizationFlags & 0xFFFFFFFFFFFFFFEELL | 0x10;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v56 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      char v11 = [WeakRetained capsuleCollectionViewBoundaryEdgesForScrollableContent:self];
    }
    else {
      char v11 = 0;
    }
    BOOL v12 = [(SFCapsuleCollectionView *)self selectedItemIsMinimized];
    double minimizationStartingDragOffset = self->_minimizationStartingDragOffset;
    self->_minimizationLastDragOffset = a3;
    double v14 = minimizationStartingDragOffset - a3;
    if (v12) {
      double v15 = v14;
    }
    else {
      double v15 = -v14;
    }
    if (v14 < 0.0) {
      double v14 = -v14;
    }
    if ((self->_minimizationFlags & 2) == 0) {
      double v14 = v15;
    }
    double v16 = fmax(v14, 0.0);
    int64_t selectedItemState = self->_selectedItemState;
    double offsetForMinimization = self->_offsetForMinimization;
    if ([(SFCapsuleCollectionView *)self _shouldToggleMinimizedWithTranslation:v7 velocity:v16 gestureEnded:a4])
    {
      int64_t selectedItemState = !v12;
      self->_previousMinimizationVelocitCGFloat y = (CGPoint)*MEMORY[0x1E4F1DAD8];
      [(SFCapsuleCollectionView *)self _setCapsuleSafeAreaInsetsFrozen:0];
      uint64_t v19 = [(SFCapsuleCollectionView *)self _coordinatorForUpdatingSelectedItemFromState:self->_selectedItemState toState:selectedItemState];
      [(SFCapsuleCollectionView *)self _setOffsetForMinimization:0.0];
      self->_double minimizationStartingDragOffset = a3;
      if ((self->_minimizationFlags & 2) != 0) {
        self->_unint64_t minimizationFlags = 0;
      }
      int v20 = 1;
    }
    else if (v7)
    {
      self->_previousMinimizationVelocitCGFloat y = (CGPoint)*MEMORY[0x1E4F1DAD8];
      [(SFCapsuleCollectionView *)self _setCapsuleSafeAreaInsetsFrozen:0];
      BOOL v21 = _SFEqualWithEpsilon(0.0, self->_offsetForMinimization, 0.1);
      int v20 = !v21;
      if (v21)
      {
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v19 = objc_alloc_init(SFTransitionCoordinator);
        [(SFCapsuleCollectionView *)self _willBeginBackdropHeightAnimation];
        double v30 = [(SFTransitionCoordinator *)v19 publicCoordinator];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke;
        v63[3] = &unk_1E54EA080;
        v63[4] = self;
        [v30 addRetargetableAnimations:v63];

        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_2;
        v62[3] = &unk_1E54E9858;
        v62[4] = self;
        [(SFTransitionCoordinator *)v19 addCompletion:v62];
      }
      [(SFCapsuleCollectionView *)self _setOffsetForMinimization:0.0];
    }
    else if ((v11 & 4) != 0)
    {
      int v20 = 0;
      uint64_t v19 = 0;
    }
    else
    {
      [(SFCapsuleCollectionView *)self obscuredInsetsForState:0];
      double v23 = v22;
      [(SFCapsuleCollectionView *)self obscuredInsetsForState:1];
      double v25 = v24;
      if (v12 != [(SFCapsuleCollectionView *)self _layoutStyleIsTop]) {
        double v26 = -1.0;
      }
      else {
        double v26 = 1.0;
      }
      if (v23 == v25)
      {
        [(SFCapsuleCollectionView *)self minimizedCapsuleFrame];
        double MinY = CGRectGetMinY(v64);
        [(SFCapsuleCollectionView *)self capsuleFrame];
        double v32 = MinY - CGRectGetMinY(v65);
        double v33 = 62.0;
        if (!v12) {
          double v33 = 31.0;
        }
        double v34 = v32 / 3.0;
        double v35 = _SFClampPercent(v16, 0.0, v33);
        double v29 = _SFRoundFloatToPixels(v26 * (v35 * v34));
      }
      else
      {
        double v27 = v23 - v25;
        if (v12 && !self->_minimizationStyle)
        {
          [(SFCapsuleCollectionView *)self _overscrollDistanceForTopEdge];
          double v27 = fmin(v27, v28);
        }
        double v29 = v26 * fmax(fmin(v27, v16), 0.0);
      }
      [(SFCapsuleCollectionView *)self _setOffsetForMinimization:v29];
      [(SFCapsuleCollectionView *)self _setCapsuleSafeAreaInsetsFrozen:1];
      int v20 = 0;
      uint64_t v19 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_3;
    aBlock[3] = &unk_1E54E9858;
    aBlock[4] = self;
    id v36 = (void (**)(void))_Block_copy(aBlock);
    int64_t v37 = self->_selectedItemState;
    BOOL v38 = selectedItemState != v37 && v7;
    if (selectedItemState == v37)
    {
      if (v20)
      {
        id location = &self->_currentTransitionCoordinator;
        objc_storeWeak((id *)&self->_currentTransitionCoordinator, v19);
LABEL_48:
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_5;
        v57[3] = &unk_1E54EA140;
        v57[4] = self;
        long long v55 = v36;
        double v58 = v36;
        BOOL v59 = !v38;
        [(SFTransitionCoordinator *)v19 addAnimations:v57];
        uint64_t v42 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
        uint64_t v43 = [v42 capsuleView];

        if (!self->_minimizationStyle && (selectedItemState == 1) == (self->_selectedItemState != 1))
        {
          CGFloat v44 = [(SFTransitionCoordinator *)v19 publicCoordinator];
          [v43 willChangeToMinimized:selectedItemState == 1 coordinator:v44];
        }
        selectedItemAccessoryViews = self->_selectedItemAccessoryViews;
        uint64_t v46 = objc_msgSend(NSNumber, "numberWithInteger:", selectedItemState, location);
        id v47 = [(NSMutableDictionary *)selectedItemAccessoryViews objectForKeyedSubscript:v46];
        double v48 = [(SFTransitionCoordinator *)v19 publicCoordinator];
        [v43 setAccessoryView:v47 coordinator:v48];

        objc_storeWeak(locationa, 0);
        self->_int64_t selectedItemState = selectedItemState;
        if (v7) {
          self->_unint64_t minimizationFlags = 0;
        }
        [(SFCapsuleCollectionView *)self _updateShowsMinimizedProgressView];
        BOOL v49 = [(SFCapsuleCollectionView *)self _shouldInteractivelySquish];
        uint64_t v50 = 1;
        id v36 = v55;
        if (selectedItemState == v37 || !v49)
        {
          uint64_t v51 = v56;
        }
        else
        {
          uint64_t v51 = v56;
          if (!v7 && offsetForMinimization != 0.0)
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v50 = [v56 capsuleCollectionViewContentScaleCompletesMinimization:self] ^ 1;
            }
            else {
              uint64_t v50 = 0;
            }
          }
        }
        double v52 = [(SFCapsuleCollectionView *)self window];
        [(SFTransitionCoordinator *)v19 performTransitionWithAnimation:v50 inContextOfContainerView:v52];

        if (v7) {
          [(SFCapsuleCollectionView *)self _sendMinimizationDidEndToObservers];
        }

LABEL_72:
        return;
      }
    }
    else
    {
      self->_unint64_t minimizationFlags = self->_minimizationFlags & 0xFFFFFFFFFFFFFFFBLL | (4 * (selectedItemState == 1));
      if (v20)
      {
        id location = &self->_currentTransitionCoordinator;
        objc_storeWeak((id *)&self->_currentTransitionCoordinator, v19);
        [(SFCapsuleCollectionView *)self _performVisualEffectTransitionWithCoordinator:v19];
        id v39 = objc_loadWeakRetained((id *)&self->_delegate);
        if (objc_opt_respondsToSelector())
        {
          [(SFTransitionCoordinator *)v19 publicCoordinator];
          v41 = CGFloat v40 = v36;
          [v39 capsuleCollectionView:self selectedItemWillChangeToState:selectedItemState options:0 coordinator:v41];

          id v36 = v40;
        }

        goto LABEL_48;
      }
    }
    if (v7) {
      self->_unint64_t minimizationFlags = 0;
    }
    uint64_t v51 = v56;
    if (self->_backdropHeightAnimationCount)
    {
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_4;
      v60[3] = &unk_1E54E9858;
      v60[4] = self;
      [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v60];
    }
    v36[2](v36);
    if (!v38) {
      [(SFCapsuleCollectionView *)self _sendMinimizationDidUpdateToObservers];
    }
    if (v7) {
      [(SFCapsuleCollectionView *)self _sendMinimizationDidEndToObservers];
    }
    goto LABEL_72;
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_layoutStyle != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained capsuleCollectionView:self willChangeToLayoutStyle:a3];
    }
    self->_int64_t layoutStyle = a3;
    [(SFCapsuleCollectionView *)self _reloadDataWithoutLayout];
    [(SFCapsuleCollectionView *)self _updateVisualEffectGroupName];
    if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop]) {
      [(SFCapsuleCollectionView *)self _layOutKeyboardBackdrop];
    }
    [(SFCapsuleCollectionView *)self capsuleBackgroundCornerRadius];
    double v7 = v6;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v8 = self->_items;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "capsuleView", (void)v15);
          [v13 setBackgroundCornerRadius:v7];
          [v13 setLayoutStyle:a3];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    BOOL v14 = a3 == 1;
    [(_SFFluidProgressView *)self->_minimizedProgressView setAlignsToTop:v14];
    [(SFLockdownStatusBar *)self->_lockdownStatusBar setShouldAnimateNavigationBarItemChanges:v14];
    if (objc_opt_respondsToSelector()) {
      [WeakRetained capsuleCollectionViewLayoutStyleDidChange:self];
    }
  }
}

SFCapsuleCollectionActionView *__41__SFCapsuleCollectionView_initWithFrame___block_invoke()
{
  v0 = objc_alloc_init(SFCapsuleCollectionActionView);

  return v0;
}

- (void)_preferredContentSizeCategoryDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_items;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "invalidateCapsuleHeight", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(SFCapsuleCollectionView *)self setNeedsLayout];
}

- (void)_setOffsetForMinimization:(double)a3
{
  if (self->_offsetForMinimization != a3)
  {
    self->_double offsetForMinimization = a3;
    if (self->_numberOfItems) {
      [(SFCapsuleCollectionView *)self setNeedsLayout];
    }
  }
}

- (CGAffineTransform)_lockdownIndicatorTransform
{
  [(SFCapsuleCollectionView *)self _selectedItemMinimizationPercent];
  double v6 = v5;
  [(SFCapsuleCollectionView *)self _minimizedContentScale];
  double v8 = _SFInterpolate(1.0, v7, v6);
  BOOL v9 = [(SFCapsuleCollectionView *)self _contentIsDismissed];
  double v10 = 1.05;
  if (!v9) {
    double v10 = 1.0;
  }
  double v11 = v8 * v10;
  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeScale(&v28, v11, v11);
  double result = (CGAffineTransform *)[(SFCapsuleCollectionView *)self _shouldInteractivelySquish];
  if ((result & 1) != 0
    && ((double result = (CGAffineTransform *)[(SFCapsuleCollectionView *)self selectedItemIsMinimized], !result)|| (double result = (CGAffineTransform *)[(SFCapsuleCollectionView *)self _shouldUseNormalLayoutForMinimizedCapsule], (result & 1) != 0))&& (self->_minimizationFlags & 1) != 0)
  {
    [(SFCapsuleCollectionView *)self capsuleFrame];
    double MaxY = CGRectGetMaxY(v29);
    [(SFCapsuleCollectionView *)self _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:0.0];
    double v16 = MaxY + v15;
    [(SFCapsuleCollectionView *)self minimizedCapsuleFrame];
    double v17 = CGRectGetMaxY(v30);
    [(SFCapsuleCollectionView *)self _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:1.0];
    double v19 = v17 + v18;
    [(SFCapsuleCollectionView *)self _verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:1.0];
    double v21 = _SFInterpolate(v16, v19 - v20, v6);
    [(SFCapsuleCollectionView *)self _selectedCapsuleFrame];
    double v22 = CGRectGetMaxY(v31);
    [(SFCapsuleCollectionView *)self _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:v6];
    double v24 = v22 + v23;
    [(SFCapsuleCollectionView *)self _verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:v6];
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeTranslation(&v27, 0.0, v21 - (v24 - v25));
    CGAffineTransform v26 = v27;
    return CGAffineTransformScale(retstr, &v26, v11, v11);
  }
  else
  {
    long long v13 = *(_OWORD *)&v28.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v28.a;
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v28.tx;
  }
  return result;
}

- (double)_lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:(double)a3
{
  [(SFCapsuleCollectionView *)self _minimizedContentScale];
  double v6 = _SFInterpolate(1.0, v5, a3);
  [(SFLockdownStatusBar *)self->_lockdownStatusBar titleCapHeightInsetFromTop];
  double v8 = _SFRoundFloatToPixels(v6 * v7);
  double v9 = _SFInterpolate(10.0, 8.0, a3) - v8;

  return _SFRoundFloatToPixels(v9);
}

- (double)_lockdownIndicatorBottomVerticalSpacingAtMinimizationPercent:(double)a3
{
  [(SFCapsuleCollectionView *)self _minimizedContentScale];
  double v6 = _SFInterpolate(1.0, v5, a3);
  [(SFLockdownStatusBar *)self->_lockdownStatusBar titleBaselineInsetFromBottom];
  double v8 = _SFRoundFloatToPixels(v6 * v7);
  double v9 = _SFInterpolate(10.0, 8.0, a3) - v8;

  return _SFRoundFloatToPixels(v9);
}

- (double)_verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:(double)a3
{
  if (!self->_lockdownStatusBar) {
    return 0.0;
  }
  if (a3 == 0.0 || self->_selectedItemIndex >= (int64_t)self->_numberOfItems) {
    return 0.0;
  }
  double v7 = -[SFCapsuleCollectionView contentViewForItemAtIndex:](self, "contentViewForItemAtIndex:");
  if (objc_opt_respondsToSelector()) {
    [v7 keyContentRect];
  }
  else {
    [v7 bounds];
  }
  CGFloat rect = v8;
  CGFloat v12 = v9;
  CGFloat v13 = v10;
  CGFloat v14 = v11;
  [(SFCapsuleCollectionView *)self bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [(SFCapsuleCollectionView *)self layoutMargins];
  CGFloat v24 = v18 + v23;
  CGFloat v27 = v20 - (v25 + v26);
  v38.size.CGFloat height = v22 - (v23 + v28);
  v38.origin.double x = v16 + v25;
  v38.origin.CGFloat y = v24;
  v38.size.CGFloat width = v27;
  [(SFCapsuleCollectionView *)self _selectedCapsuleHeightForWidth:1 state:0 ignoringKeyboard:CGRectGetWidth(v38)];
  double v30 = v29;
  if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop])
  {
    double v31 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [v7 keyContentBaselineBottomInset];
      double v31 = v32;
    }
  }
  else
  {
    double v31 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [v7 keyContentCapHeightTopInset];
      double v31 = v33;
    }
    double v30 = v30 - 13.0;
  }
  v39.origin.double x = rect;
  v39.origin.CGFloat y = v12;
  v39.size.CGFloat width = v13;
  v39.size.CGFloat height = v14;
  double v34 = v31 + (v30 - CGRectGetHeight(v39)) * 0.5;
  [(SFCapsuleCollectionView *)self _auxiliaryBarSquishedHeightDecrease];
  double v36 = _SFRoundFloatToPixels((v35 * 0.5 + v34) * a3);

  return v36;
}

- (double)_auxiliaryBarSquishedHeightDecrease
{
  [(SFLockdownStatusBar *)self->_lockdownStatusBar preferredSize];
  double v4 = v3;
  [(SFLockdownStatusBar *)self->_lockdownStatusBar preferredSize];
  double v6 = v5;
  [(SFCapsuleCollectionView *)self _minimizedContentScale];
  double v8 = v4 - v6 * v7;

  return _SFRoundFloatToPixels(v8);
}

uint64_t __60__SFCapsuleCollectionView__updateShowsMinimizedProgressView__block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:v1];
}

void __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) frameForShadowView];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) shadowView];
  objc_msgSend(v10, "ss_setUntransformedFrame:", v3, v5, v7, v9);
}

void __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_5(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) capsuleView];
  objc_msgSend(v2, "setUsesPlatterEffect:", objc_msgSend(*(id *)(a1 + 40), "_itemsShouldUsePlatterEffect"));
  objc_msgSend(*(id *)(a1 + 32), "capsuleHeightForWidth:defaultHeight:state:index:", objc_msgSend(v2, "state"), *(void *)(a1 + 72), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double Height = 0.0;
  double v5 = fmax(v3 - *(double *)(a1 + 80), 0.0);
  if (*(unsigned char *)(a1 + 136)) {
    double v6 = *(double *)(a1 + 56);
  }
  else {
    double v6 = 0.0;
  }
  objc_msgSend(v2, "ss_setUntransformedFrame:", *(double *)(a1 + 88) - v6, *(double *)(a1 + 96) - v5);
  [v2 frameForShadowView];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [v2 shadowView];
  objc_msgSend(v15, "ss_setUntransformedFrame:", v8, v10, v12, v14);

  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v20[0] = *MEMORY[0x1E4F1DAB8];
  v20[1] = v16;
  v20[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setContentTransform:v20];
  [v2 setMinimizationPercent:0.0];
  if (*(unsigned char *)(a1 + 137)) {
    double Height = CGRectGetHeight(*(CGRect *)(a1 + 104));
  }
  [v2 setContentHeight:Height];
  uint64_t v17 = *(void *)(a1 + 48);
  objc_msgSend(v2, "ss_untransformedFrame");
  (*(void (**)(_OWORD *__return_ptr, uint64_t, void))(v17 + 16))(v19, v17, 0);
  v18[0] = v19[0];
  v18[1] = v19[1];
  v18[2] = v19[2];
  [v2 setTransform:v18];
}

- (void)setFocusedCapsuleTopOffset:(double)a3
{
  if (self->_focusedCapsuleTopOffset != a3)
  {
    self->_focusedCapsuleTopOffset = a3;
    if (self->_selectedItemState == 2) {
      [(SFCapsuleCollectionView *)self setNeedsLayout];
    }
  }
}

- (CGRect)minimizedCapsuleFrame
{
  [(SFCapsuleCollectionView *)self _minimizedCapsuleFrameIgnoringKeyboard:0];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

- (id)viewForItemAtIndex:(int64_t)a3
{
  double v3 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
  double v4 = [v3 capsuleView];

  return v4;
}

- (id)detachViewForItemAtIndex:(int64_t)a3
{
  return [(SFCapsuleCollectionView *)self detachViewForItemAtIndex:a3 forInternalBorrow:0];
}

- (id)detachViewForItemAtIndex:(int64_t)a3 forInternalBorrow:(BOOL)a4
{
  if (a3 < 0 || (int64_t)self->_numberOfItems <= a3)
  {
    double v9 = 0;
  }
  else
  {
    BOOL v6 = a4;
    double v7 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
    [v7 setCapsuleIsDetached:1];
    [(SFCapsuleCollectionView *)self _updateRangeOfLoadedViews];
    double v8 = [v7 capsuleView];
    double v9 = v8;
    if (v6)
    {
      id v10 = v8;
    }
    else
    {
      double v11 = (void *)MEMORY[0x1E4FB1EB0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __70__SFCapsuleCollectionView_detachViewForItemAtIndex_forInternalBorrow___block_invoke;
      v16[3] = &unk_1E54E9CB0;
      id v12 = v8;
      id v17 = v12;
      double v18 = self;
      int64_t v19 = a3;
      objc_msgSend(v11, "safari_performWithoutRetargetingAnimations:", v16);
      if (self->_itemsAreHidden)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __70__SFCapsuleCollectionView_detachViewForItemAtIndex_forInternalBorrow___block_invoke_2;
        v15[3] = &unk_1E54E9858;
        v15[4] = self;
        objc_msgSend(MEMORY[0x1E4FB1EB0], "safari_performWithoutRetargetingAnimations:", v15);
      }
      id v13 = v12;
    }
  }

  return v9;
}

void __70__SFCapsuleCollectionView_detachViewForItemAtIndex_forInternalBorrow___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) shadowView];
  [*(id *)(a1 + 32) insertSubview:v2 atIndex:0];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v10[0] = *MEMORY[0x1E4F1DAB8];
  v10[1] = v3;
  v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v10];
  [*(id *)(a1 + 32) frameForShadowView];
  objc_msgSend(v2, "setFrame:");
  double v4 = [*(id *)(a1 + 32) layer];
  [v4 removeAllAnimations];

  [*(id *)(a1 + 32) _setSafeAreaInsetsFrozen:1];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 896));
  double v6 = 1.0;
  if (objc_opt_respondsToSelector()) {
    double v6 = (double)([WeakRetained capsuleCollectionView:*(void *)(a1 + 40) shouldHideShadowForItemAtIndex:*(void *)(a1 + 48)] ^ 1);
  }

  double v7 = [*(id *)(a1 + 32) shadowView];
  [v7 setAlpha:v6];

  double v8 = [*(id *)(a1 + 32) layer];
  [v8 setAllowsGroupOpacity:0];

  [*(id *)(a1 + 32) setHidden:1];
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v9 = [*(id *)(a1 + 32) contentView];
  [v9 setAlpha:1.0];
}

void __70__SFCapsuleCollectionView_detachViewForItemAtIndex_forInternalBorrow___block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[133];
  id v4 = [v2 _indexesOfVisibleItemsIncludingAction:1];
  [v2 _layOutItems:v3 atIndexes:v4 selectedItemIndex:*(void *)(*(void *)(a1 + 32) + 984)];
}

- (void)reattachView:(id)a3
{
  id v4 = a3;
  items = self->_items;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __40__SFCapsuleCollectionView_reattachView___block_invoke;
  _OWORD v19[3] = &unk_1E54E9CD8;
  id v6 = v4;
  id v20 = v6;
  uint64_t v7 = [(NSArray *)items indexOfObjectPassingTest:v19];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v6 removeFromSuperview];
  }
  else
  {
    uint64_t v8 = v7;
    double v9 = [(NSArray *)self->_items objectAtIndexedSubscript:v7];
    id v10 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __40__SFCapsuleCollectionView_reattachView___block_invoke_2;
    double v15 = &unk_1E54E9CB0;
    id v11 = v9;
    id v16 = v11;
    id v17 = self;
    uint64_t v18 = v8;
    [v10 performWithoutAnimation:&v12];
    [(SFCapsuleCollectionView *)self _updateRangeOfLoadedViews];
    if ([(NSIndexSet *)self->_indexesOfLoadedViews containsIndex:v8])
    {
      [(SFCapsuleCollectionView *)self _updateCapsuleAlpha];
      [(SFCapsuleCollectionView *)self setNeedsLayout];
    }
  }
}

BOOL __40__SFCapsuleCollectionView_reattachView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 capsuleView];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __40__SFCapsuleCollectionView_reattachView___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) capsuleView];
  [v2 _setSafeAreaInsetsFrozen:0];
  uint64_t v3 = [v2 layer];
  [v3 setAllowsGroupOpacity:1];

  [v2 setHidden:0];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:1];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v4;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v8];
  [*(id *)(a1 + 40) _updateSuperviewForCapsule:v2];
  [*(id *)(a1 + 32) setCapsuleIsDetached:0];
  double v5 = *(void **)(a1 + 40);
  uint64_t v6 = v5[133];
  uint64_t v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:*(void *)(a1 + 48)];
  [v5 _layOutItems:v6 atIndexes:v7 selectedItemIndex:*(void *)(*(void *)(a1 + 40) + 984)];
}

- (void)reattachControls
{
  lockdownStatusBar = self->_lockdownStatusBar;
  if (lockdownStatusBar)
  {
    long long v4 = [(SFLockdownStatusBar *)lockdownStatusBar superview];
    contentView = self->_contentView;

    if (v4 != contentView) {
      [(UIView *)self->_contentView addSubview:self->_lockdownStatusBar];
    }
  }
  uint64_t v6 = [(_SFFluidProgressView *)self->_minimizedProgressView superview];
  uint64_t v7 = self->_contentView;

  if (v6 != v7)
  {
    uint64_t v8 = self->_contentView;
    minimizedProgressView = self->_minimizedProgressView;
    [(UIView *)v8 addSubview:minimizedProgressView];
  }
}

- (void)takeOwnershipOfDetachedViewForItemAtIndex:(int64_t)a3
{
  long long v4 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
  id v6 = [v4 capsuleView];

  [v6 setHidden:0];
  double v5 = [(SFCapsuleCollectionView *)self _superviewForCapsules];
  [v5 addSubview:v6];
}

- (void)removeGestureObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSHashTable *)self->_gestureObservers removeObject:v4];
  if (self->_sendProgressMessageToObservers)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = self->_gestureObservers;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        uint64_t v9 = 0;
        id v10 = v4;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v4 = *(id *)(*((void *)&v12 + 1) + 8 * v9);

          if (objc_opt_respondsToSelector())
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
          ++v9;
          id v10 = v4;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v4 = 0;
    BOOL v11 = 0;
LABEL_12:
  }
  else
  {
    BOOL v11 = 0;
  }
  self->_sendProgressMessageToObservers = v11;
}

- (void)setKeepsCapsulesAboveKeyboard:(BOOL)a3
{
  if (self->_keepsCapsulesAboveKeyboard != a3)
  {
    self->_keepsCapsulesAboveKeyboard = a3;
    if (!a3)
    {
      self->_selectedItemStateBeforeShowingKeyboard = 0;
      self->_BOOL showingKeyboard = 0;
      self->_keyboarddouble Height = 0.0;
      [(SFCapsuleCollectionView *)self setNeedsLayout];
    }
  }
}

- (void)setIgnoresKeyboardHideEvents:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_ignoresKeyboardHideEvents != a3)
  {
    self->_ignoresKeyboardHideEvents = a3;
    if (a3)
    {
      id v4 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_18C354000, v4, OS_LOG_TYPE_INFO, "Begin ignoring keyboard hide events.", (uint8_t *)&v8, 2u);
      }
    }
    else
    {
      BOOL v5 = !self->_showingKeyboard && self->_keyboardHeight != 0.0;
      uint64_t v6 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = &stru_1EDA07C28;
        if (v5) {
          uint64_t v7 = @" and clear keyboard height";
        }
        int v8 = 138412290;
        uint64_t v9 = v7;
        _os_log_impl(&dword_18C354000, v6, OS_LOG_TYPE_INFO, "End ignoring keyboard hide events%@.", (uint8_t *)&v8, 0xCu);
      }
      if (v5)
      {
        self->_keyboarddouble Height = 0.0;
        [(SFCapsuleCollectionView *)self setNeedsLayout];
      }
    }
  }
}

- (void)_setKeyboardHeight:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3 != 0.0 || !self->_ignoresKeyboardHideEvents;
  if (v3 && self->_keepsCapsulesAboveKeyboard && self->_keyboardHeight != a3)
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v9 = a3;
      _os_log_impl(&dword_18C354000, v6, OS_LOG_TYPE_DEFAULT, "Set _keyboarddouble Height = %f", buf, 0xCu);
    }
    self->_keyboarddouble Height = a3;
    if (self->_numberOfItems && [(SFCapsuleCollectionView *)self _shouldDodgeKeyboard])
    {
      if (self->_backdropHeightAnimationCount)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __46__SFCapsuleCollectionView__setKeyboardHeight___block_invoke;
        v7[3] = &unk_1E54E9858;
        void v7[4] = self;
        [MEMORY[0x1E4FB1EB0] _animateByRetargetingAnimations:v7 completion:0];
      }
      [(SFCapsuleCollectionView *)self setNeedsLayout];
    }
  }
}

uint64_t __46__SFCapsuleCollectionView__setKeyboardHeight___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackdropHeight];
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_keepsCapsulesAboveKeyboard)
  {
    BOOL v5 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      uint64_t v7 = [v4 name];
      if (self->_showingKeyboard) {
        int v8 = @"YES";
      }
      else {
        int v8 = @"NO";
      }
      double v9 = v8;
      *(_DWORD *)buf = 138543618;
      CGFloat v40 = v7;
      __int16 v41 = 2114;
      uint64_t v42 = v9;
      _os_log_impl(&dword_18C354000, v6, OS_LOG_TYPE_DEFAULT, "Recieved %{public}@, with _BOOL showingKeyboard = %{public}@", buf, 0x16u);
    }
    uint64_t v10 = [v4 userInfo];
    BOOL v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
    [v11 CGRectValue];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    -[SFCapsuleCollectionView convertRect:fromView:](self, "convertRect:fromView:", 0, v13, v15, v17, v19);
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    keyboarddouble Height = self->_keyboardHeight;
    [(SFCapsuleCollectionView *)self bounds];
    v46.origin.double x = v29;
    v46.origin.CGFloat y = v30;
    v46.size.CGFloat width = v31;
    v46.size.CGFloat height = v32;
    v44.origin.double x = v21;
    v44.origin.CGFloat y = v23;
    v44.size.CGFloat width = v25;
    v44.size.CGFloat height = v27;
    CGRect v45 = CGRectIntersection(v44, v46);
    [(SFCapsuleCollectionView *)self _setKeyboardHeight:CGRectGetHeight(v45)];
    double v33 = [v10 objectForKey:*MEMORY[0x1E4FB2BA8]];
    [v33 doubleValue];
    double v35 = v34;

    if (self->_showingKeyboard
      && keyboardHeight != self->_keyboardHeight
      && [(SFCapsuleCollectionView *)self _shouldAnimateKeyboardHeightChanges]
      && v35 != 0.0)
    {
      double v36 = [v10 objectForKey:*MEMORY[0x1E4FB2BA0]];
      uint64_t v37 = [v36 integerValue] << 16;

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __52__SFCapsuleCollectionView__keyboardWillChangeFrame___block_invoke;
      v38[3] = &unk_1E54E9858;
      v38[4] = self;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animate:withDuration:delay:options:animations:completion:", 1, v37, v38, 0, v35, 0.0);
    }
  }
}

uint64_t __52__SFCapsuleCollectionView__keyboardWillChangeFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_keyboardWillShow:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_keepsCapsulesAboveKeyboard)
  {
    BOOL v5 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      uint64_t v7 = [v4 name];
      if (self->_showingKeyboard) {
        int v8 = @"YES";
      }
      else {
        int v8 = @"NO";
      }
      double v9 = v8;
      *(_DWORD *)buf = 138543618;
      double v18 = v7;
      __int16 v19 = 2114;
      double v20 = v9;
      _os_log_impl(&dword_18C354000, v6, OS_LOG_TYPE_DEFAULT, "Recieved %{public}@, with _BOOL showingKeyboard = %{public}@", buf, 0x16u);
    }
    if (!self->_showingKeyboard)
    {
      self->_selectedItemStateBeforeShowingKeyboard = self->_selectedItemState;
      self->_BOOL showingKeyboard = 1;
      [(SFCapsuleCollectionView *)self _updateToolbarAlpha];
      [(SFCapsuleCollectionView *)self setNeedsLayout];
      uint64_t v10 = [v4 userInfo];
      BOOL v11 = [v10 objectForKey:*MEMORY[0x1E4FB2BA8]];
      [v11 doubleValue];
      double v13 = v12;

      if (self->_keyboardHeight != 0.0
        && [(SFCapsuleCollectionView *)self _shouldAnimateKeyboardHeightChanges]
        && v13 != 0.0)
      {
        [(SFCapsuleCollectionView *)self _removeAllRetargetableAnimations:1];
        double v14 = [v10 objectForKey:*MEMORY[0x1E4FB2BA0]];
        uint64_t v15 = [v14 integerValue] << 16;

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __45__SFCapsuleCollectionView__keyboardWillShow___block_invoke;
        v16[3] = &unk_1E54E9858;
        void v16[4] = self;
        objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animate:withDuration:delay:options:animations:completion:", 1, v15, v16, 0, v13, 0.0);
      }
    }
  }
}

uint64_t __45__SFCapsuleCollectionView__keyboardWillShow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)_shouldAnimateKeyboardHeightChanges
{
  BOOL v3 = [(SFCapsuleCollectionView *)self _shouldDodgeKeyboard];
  if (v3)
  {
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      LOBYTE(v3) = [(SFCapsuleCollectionView *)self _layoutStyleIsTop];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_keyboardWillHide:(id)a3
{
  -[SFCapsuleCollectionView _setKeyboardHeight:](self, "_setKeyboardHeight:", a3, 0.0);
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
  if (!self->_suppressesSelectedItemUnfocus && self->_selectedItemState == 2)
  {
    BOOL v5 = (void *)WeakRetained;
    uint64_t WeakRetained = objc_opt_respondsToSelector();
    if (WeakRetained) {
      uint64_t WeakRetained = [v5 capsuleCollectionViewWillHideKeyboard:self];
    }
  }
  self->_suppressesSelectedItemUnfocus = 0;

  MEMORY[0x1F4181820](WeakRetained);
}

- (void)_keyboardDidHide:(id)a3
{
  self->_BOOL showingKeyboard = 0;
  [(SFCapsuleCollectionView *)self _updateToolbarAlpha];
}

uint64_t __50__SFCapsuleCollectionView__layOutKeyboardBackdrop__block_invoke(uint64_t a1)
{
  double Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  id v4 = *(void **)(*(void *)(a1 + 32) + 528);
  if (v4)
  {
    objc_msgSend(v4, "frame", Width);
    double v6 = v5;
    double Height = v7;
    double v9 = v8;
    double v11 = *(double *)(a1 + 72) + v10;
  }
  else
  {
    double v9 = Width;
    double v11 = *(double *)(a1 + 72);
    double v6 = 0.0;
  }
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB18C8]), "initWithFrame:style:", objc_msgSend(*(id *)(a1 + 32), "_keyboardBackdropStyle"), v6, Height, v9, v11);
  uint64_t v13 = *(void *)(a1 + 32);
  double v14 = *(void **)(v13 + 512);
  *(void *)(v13 + 512) = v12;

  uint64_t v15 = *(void **)(a1 + 32);
  double v16 = (void *)v15[51];
  uint64_t v17 = v15[64];
  if (v15[66]) {
    objc_msgSend(v16, "insertSubview:aboveSubview:", v17);
  }
  else {
    objc_msgSend(v16, "insertSubview:atIndex:", v17);
  }
  double v18 = *(void **)(*(void *)(a1 + 32) + 512);

  return [v18 setAlpha:0.0];
}

- (int64_t)_keyboardBackdropStyle
{
  if ([(_SFBarTheme *)self->_effectiveTheme overrideUserInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1898] darkConfig];
  }
  else {
  double v2 = [MEMORY[0x1E4FB1898] defaultConfig];
  }
  int64_t v3 = [v2 backdropStyle];

  return v3;
}

- (void)_updateKeyboardBackdropViewStyle
{
  keyboardBackdropView = self->_keyboardBackdropView;
  int64_t v3 = [(SFCapsuleCollectionView *)self _keyboardBackdropStyle];

  [(UIKBVisualEffectView *)keyboardBackdropView transitionToStyle:v3];
}

- (id)inputAccessoryView
{
  if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop] || self->_selectedItemState != 2)
  {
    double v9 = 0;
  }
  else
  {
    inputAccessoryView = self->_inputAccessoryView;
    if (!inputAccessoryView)
    {
      id v4 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
      double v5 = [v4 capsuleView];

      double v6 = [SFCapsuleInputAccessorySpacerView alloc];
      [(SFCapsuleCollectionView *)self bounds];
      double v7 = [(SFCapsuleInputAccessorySpacerView *)v6 initWithCapsuleView:v5 initialWidth:CGRectGetWidth(v12)];
      double v8 = self->_inputAccessoryView;
      self->_inputAccessoryView = v7;

      [(SFCapsuleInputAccessorySpacerView *)self->_inputAccessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
      inputAccessoryView = self->_inputAccessoryView;
    }
    double v9 = inputAccessoryView;
  }

  return v9;
}

- (CGRect)_inputAccessoryViewFrame
{
  int64_t v3 = [(SFCapsuleInputAccessorySpacerView *)self->_inputAccessoryView window];
  inputAccessoryView = self->_inputAccessoryView;
  if (v3)
  {
    [(SFCapsuleInputAccessorySpacerView *)inputAccessoryView bounds];
    -[SFCapsuleCollectionView convertRect:fromView:](self, "convertRect:fromView:", self->_inputAccessoryView);
  }
  else
  {
    [(SFCapsuleInputAccessorySpacerView *)inputAccessoryView frame];
  }
  CGFloat x = v5;
  double y = v6;
  CGFloat width = v7;
  CGFloat v12 = v8;

  if (y == 0.0)
  {
    [(SFCapsuleCollectionView *)self bounds];
    CGFloat Height = CGRectGetHeight(v18);
    v19.origin.CGFloat x = x;
    v19.origin.double y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = v12;
    CGRect v20 = CGRectOffset(v19, 0.0, Height);
    CGFloat x = v20.origin.x;
    double y = v20.origin.y;
    CGFloat width = v20.size.width;
    CGFloat v12 = v20.size.height;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = v12;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  double v5 = v4;
  if (self->_itemsAreHidden) {
    goto LABEL_2;
  }
  if (self->_tapGestureRecognizer == v4)
  {
    [(UITapGestureRecognizer *)v4 locationInView:self];
    double v8 = -[SFCapsuleCollectionView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass() ^ 1;

    goto LABEL_3;
  }
  if ((UITapGestureRecognizer *)self->_panGesture != v4)
  {
    if ((UITapGestureRecognizer *)self->_dismissPanGestureRecognizer == v4)
    {
      if (![(SFCapsuleCollectionView *)self _layoutStyleIsTop] && self->_selectedItemState == 2)
      {
        [(SFCapsuleCollectionView *)self _inputAccessoryViewFrame];
        CGFloat v10 = v9;
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        [(SFCapsuleCollectionView *)self bounds];
        v22.origin.CGFloat x = v17;
        v22.origin.double y = v18;
        v22.size.CGFloat width = v19;
        v22.size.CGFloat height = v20;
        v21.origin.CGFloat x = v10;
        v21.origin.double y = v12;
        v21.size.CGFloat width = v14;
        v21.size.CGFloat height = v16;
        char v6 = CGRectIntersectsRect(v21, v22);
        goto LABEL_3;
      }
      goto LABEL_2;
    }
LABEL_7:
    char v6 = 1;
    goto LABEL_3;
  }
  if (!self->_selectedItemState)
  {
    if (!self->_topAction && !self->_trailingAction)
    {
      char v6 = self->_numberOfItems > 1;
      goto LABEL_3;
    }
    goto LABEL_7;
  }
LABEL_2:
  char v6 = 0;
LABEL_3:

  return v6 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  char v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if (self->_tapGestureRecognizer == v6)
  {
    if (![(SFCapsuleCollectionView *)self selectedItemIsMinimized])
    {
      [v7 locationInView:self];
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      [(SFCapsuleCollectionView *)self _detachedCapsuleSelectionRect];
      v24.CGFloat x = v20;
      v24.double y = v22;
      if (!CGRectContainsPoint(v28, v24))
      {
        [(SFCapsuleCollectionView *)self _passthroughRect];
        v25.CGFloat x = v20;
        v25.double y = v22;
        LODWORD(self) = !CGRectContainsPoint(v29, v25);
        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
  if ((UITapGestureRecognizer *)self->_panGesture != v6)
  {
LABEL_6:
    LOBYTE(self) = 1;
    goto LABEL_7;
  }
  [(SFCapsuleCollectionView *)self capsuleFrame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v7 locationInView:self];
  double v17 = v16;
  v26.origin.CGFloat x = v9;
  v26.origin.double y = v11;
  v26.size.CGFloat width = v13;
  v26.size.CGFloat height = v15;
  double v18 = vabdd_f64(v17, CGRectGetMidY(v26));
  v27.origin.CGFloat x = v9;
  v27.origin.double y = v11;
  v27.size.CGFloat width = v13;
  v27.size.CGFloat height = v15;
  LOBYTE(self) = v18 <= fmax(CGRectGetHeight(v27), 84.0) * 0.5;
LABEL_7:

  return (char)self;
}

- (void)invalidateHeightForCapsuleContentView:(id)a3
{
}

- (void)invalidateHeightForCapsuleContentView:(id)a3 animated:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  double v12 = (void (**)(void))a6;
  items = self->_items;
  indexesOfLoadedViews = self->_indexesOfLoadedViews;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke;
  v27[3] = &unk_1E54E9CD8;
  id v15 = v10;
  id v28 = v15;
  double v16 = [(NSArray *)items indexesOfObjectsAtIndexes:indexesOfLoadedViews options:0 passingTest:v27];
  uint64_t v17 = [v16 firstIndex];

  if (v17 == 0x7FFFFFFFFFFFFFFFLL
    || ([(NSArray *)self->_items objectAtIndexedSubscript:v17],
        double v18 = objc_claimAutoreleasedReturnValue(),
        [v18 invalidateCapsuleHeight],
        v18,
        [(SFCapsuleCollectionView *)self setNeedsLayout],
        !a4))
  {
    if (v12) {
      v12[2](v12);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransitionCoordinator);
    if (WeakRetained)
    {
      if (v11)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_2;
        v25[3] = &unk_1E54E9D28;
        id v26 = v11;
        [WeakRetained addAnimations:v25];
      }
      if (v12) {
        [WeakRetained addCompletion:v12];
      }
    }
    else
    {
      CGFloat v20 = (void *)MEMORY[0x1E4FB1EB0];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_3;
      v23[3] = &unk_1E54E9D50;
      v23[4] = self;
      id v24 = v11;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_4;
      v21[3] = &unk_1E54E9D78;
      CGFloat v22 = v12;
      [v20 _animateUsingDefaultDampedSpringWithDelay:2 initialSpringVelocity:v23 options:v21 animations:0.0 completion:0.0];
    }
  }
}

BOOL __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  char v6 = [a2 capsuleView];
  id v7 = [v6 contentView];
  double v8 = *(void **)(a1 + 32);

  if (v7 == v8) {
    *a4 = 1;
  }
  return v7 == v8;
}

uint64_t __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __37__SFCapsuleCollectionView_reloadData__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reclaimViewForItem:a2];
}

uint64_t __37__SFCapsuleCollectionView_reloadData__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)_canAnimateUpdates
{
  return !self->_selectedItemState && !self->_shouldDismissContent && !self->_itemsAreHidden;
}

uint64_t __56__SFCapsuleCollectionView_updateTrailingActionAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)hasTrailingAction
{
  return self->_trailingAction != 0;
}

- (void)reloadItemsAtIndexes:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_18C354000, v5, OS_LOG_TYPE_DEFAULT, "Reload indexes = %@", buf, 0xCu);
  }
  if ([v4 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransitionCoordinator);
    items = self->_items;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__SFCapsuleCollectionView_reloadItemsAtIndexes___block_invoke;
    v9[3] = &unk_1E54E9E18;
    void v9[4] = self;
    id v10 = WeakRetained;
    id v8 = WeakRetained;
    [(NSArray *)items enumerateObjectsAtIndexes:v4 options:0 usingBlock:v9];
  }
}

void __48__SFCapsuleCollectionView_reloadItemsAtIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 invalidateCapsuleHeight];
  if ([*(id *)(*(void *)(a1 + 32) + 1056) containsIndex:a3])
  {
    [*(id *)(a1 + 32) setNeedsLayout];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__SFCapsuleCollectionView_reloadItemsAtIndexes___block_invoke_2;
    aBlock[3] = &unk_1E54E9DF0;
    aBlock[4] = *(void *)(a1 + 32);
    id v6 = v5;
    id v13 = v6;
    uint64_t v14 = a3;
    id v7 = (void (**)(void *, void))_Block_copy(aBlock);
    id v8 = *(void **)(a1 + 40);
    if (v8)
    {
      [v8 addAnimations:v7];
      CGFloat v9 = [v6 capsuleView];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 728));
      id v11 = [WeakRetained publicCoordinator];
      [v9 willReloadWithCoordinator:v11];
    }
    else
    {
      v7[2](v7, 0);
    }
  }
}

uint64_t __48__SFCapsuleCollectionView_reloadItemsAtIndexes___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 875)) {
    return [*(id *)(a1 + 40) setCapsuleContentIsValid:0];
  }
  else {
    return [*(id *)(a1 + 32) _fetchContentViewForItem:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 48)];
  }
}

void __60__SFCapsuleCollectionView__fetchContentViewForItem_atIndex___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained layoutIfNeeded];

  id v11 = [v7 contentContainer];
  [v11 addSubview:v9];

  id v12 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__SFCapsuleCollectionView__fetchContentViewForItem_atIndex___block_invoke_2;
  v15[3] = &unk_1E54E9A60;
  id v16 = v8;
  id v17 = v7;
  id v13 = v7;
  id v14 = v8;
  [v12 addCompletion:v15];
}

void __60__SFCapsuleCollectionView__fetchContentViewForItem_atIndex___block_invoke_2(uint64_t a1)
{
  id v5 = *(id *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) contentView];
  if (v5 == v2)
  {
  }
  else
  {
    char v3 = [*(id *)(a1 + 32) isDescendantOfView:*(void *)(a1 + 40)];

    if (v3)
    {
      id v4 = *(void **)(a1 + 32);
      [v4 removeFromSuperview];
    }
  }
}

- (id)_trailingActionContentView
{
  char v3 = [(SFCapsuleCollectionView *)self createOrDequeueContentViewWithIdentifier:@"SFCapsuleCollectionViewActionContentView" atIndex:self->_numberOfItems];
  id v4 = v3;
  if (self->_trailingAction) {
    objc_msgSend(v3, "setAction:");
  }

  return v4;
}

- (void)beginUpdates
{
  int64_t numberOfUpdates = self->_numberOfUpdates;
  self->_int64_t numberOfUpdates = numberOfUpdates + 1;
  if (numberOfUpdates <= 0)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18C354000, v4, OS_LOG_TYPE_DEFAULT, "Begin updates", v7, 2u);
    }
    [(SFCapsuleCollectionView *)self _setSuppressingDataSourceCalls:1];
    id v5 = [[SFCapsuleCollectionViewUpdate alloc] initWithCollectionView:self];
    update = self->_update;
    self->_update = v5;
  }
}

- (void)endUpdates
{
  int64_t v2 = self->_numberOfUpdates - 1;
  self->_int64_t numberOfUpdates = v2;
  if (!v2)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C354000, v4, OS_LOG_TYPE_DEFAULT, "End updates", buf, 2u);
    }
    id v5 = self->_update;
    update = self->_update;
    self->_update = 0;

    if ([(SFCapsuleCollectionViewUpdate *)v5 isAnimated]) {
      BOOL v7 = [(SFCapsuleCollectionView *)self _canAnimateUpdates];
    }
    else {
      BOOL v7 = 0;
    }
    id v8 = [(SFCapsuleCollectionViewUpdate *)v5 indexesOfInsertedItems];
    id v9 = [(SFCapsuleCollectionViewUpdate *)v5 indexesOfDeletedItems];
    uint64_t v10 = [(SFCapsuleCollectionViewUpdate *)v5 selectedItemIndexBeforeUpdate];
    uint64_t v11 = [(SFCapsuleCollectionViewUpdate *)v5 selectedItemIndexAfterUpdate];
    if (![v9 count] && (!objc_msgSend(v8, "count") ? (BOOL v12 = v11 == v10) : (BOOL v12 = 0), v12))
    {
      [(SFCapsuleCollectionView *)self _updateTrailingCapsule];
      [(SFCapsuleCollectionView *)self _setSuppressingDataSourceCalls:0];
    }
    else
    {
      id v13 = [(SFCapsuleCollectionViewUpdate *)v5 itemsBeforeUpdate];
      id v14 = [(SFCapsuleCollectionViewUpdate *)v5 itemsAfterUpdate];
      id v15 = [(SFCapsuleCollectionViewUpdate *)v5 indexesOfVisibleItemsBeforeUpdate];
      id v16 = [(SFCapsuleCollectionView *)self _indexesOfVisibleItemsIncludingAction:1];
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke;
      v96[3] = &unk_1E54E9920;
      id v50 = v16;
      id v97 = v50;
      long long v55 = [v8 indexesPassingTest:v96];
      BOOL v49 = [v13 objectAtIndexedSubscript:v10];
      BOOL v56 = v14;
      long long v54 = [v14 objectAtIndexedSubscript:v11];
      if (([v9 containsIndex:v10] & 1) != 0 || (unint64_t)objc_msgSend(v13, "count") <= 1)
      {
        BOOL v17 = ([v8 containsIndex:v11] & 1) != 0 || (unint64_t)objc_msgSend(v14, "count") < 2;
        BOOL v45 = v17;
      }
      else
      {
        BOOL v45 = 0;
      }
      BOOL v18 = [v8 count] != 1
         || [v8 firstIndex] != self->_numberOfItems - 1
         || [v9 count] != 0;
      BOOL v48 = v7;
      uint64_t v44 = v11;
      if (v7)
      {
        CGRect v46 = v15;
        if (![(SFCapsuleCollectionView *)self _isSendingTrailingAction] || v18)
        {
          double v19 = [MEMORY[0x1E4F1CA70] orderedSet];
          CGFloat v20 = [v13 objectsAtIndexes:v15];
          [v19 addObjectsFromArray:v20];

          double v21 = [v56 objectsAtIndexes:v50];
          [v19 addObjectsFromArray:v21];

          CGFloat v22 = [v19 array];
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_10;
          v92[3] = &unk_1E54E9EB8;
          v92[4] = self;
          [v56 enumerateObjectsAtIndexes:v55 options:0 usingBlock:v92];
          double v52 = (void *)MEMORY[0x1E4FB1EB0];
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_11;
          v82[3] = &unk_1E54E9EE0;
          v82[4] = self;
          id v51 = v22;
          id v83 = v51;
          id v84 = v13;
          uint64_t v89 = v10;
          BOOL v91 = v45;
          uint64_t v90 = v11;
          char v85 = v5;
          id v86 = v56;
          id v87 = v49;
          id v88 = v55;
          [v52 performWithoutAnimation:v82];

          uint64_t v53 = 0;
        }
        else
        {
          double v19 = [v56 lastObject];
          CGFloat v23 = objc_msgSend(v56, "objectAtIndexedSubscript:", objc_msgSend(v8, "firstIndex"));
          id v24 = [v19 capsuleView];
          [v19 setCapsuleView:0];
          [v23 setCapsuleView:v24];
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_2;
          v95[3] = &unk_1E54E9E90;
          v95[4] = self;
          uint64_t v53 = v24;
          [v24 setContentViewUpdateHandler:v95];
          -[SFCapsuleCollectionView _dequeueOrCreateViewForItem:atIndex:](self, "_dequeueOrCreateViewForItem:atIndex:", v19, [v56 count] - 1);
          CGPoint v25 = [v19 capsuleView];
          [v19 setCapsuleContentIsValid:0];
          id v26 = (void *)MEMORY[0x1E4FB1EB0];
          v93[0] = MEMORY[0x1E4F143A8];
          v93[1] = 3221225472;
          v93[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_9;
          v93[3] = &unk_1E54E9A60;
          v93[4] = self;
          id v94 = v25;
          id v27 = v25;
          id v28 = v26;
          id v15 = v46;
          objc_msgSend(v28, "safari_performWithoutRetargetingAnimations:", v93);

          id v51 = 0;
        }
      }
      else
      {
        id v51 = 0;
        uint64_t v53 = 0;
      }
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_12;
      v80[3] = &unk_1E54E9920;
      id v47 = v15;
      id v81 = v47;
      CGRect v29 = [v9 indexesPassingTest:v80];
      CGFloat v30 = (void *)MEMORY[0x1E4FB1EB0];
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_13;
      v74[3] = &unk_1E54E9F30;
      id v31 = v13;
      id v75 = v31;
      id v32 = v29;
      id v76 = v32;
      double v33 = v5;
      BOOL v79 = v48;
      double v77 = v33;
      double v78 = self;
      [v30 performWithoutAnimation:v74];
      [(SFCapsuleCollectionView *)self _updateRangeOfLoadedViews];
      [(SFCapsuleCollectionView *)self _setSuppressingDataSourceCalls:0];
      if (([v9 containsIndex:v10] & 1) == 0) {
        [(SFCapsuleCollectionView *)self _updateStateFlagsForContentViewAtIndex:[(SFCapsuleCollectionViewUpdate *)v33 indexAfterUpdateOfSelectedItemBeforeUpdate]];
      }
      [(SFCapsuleCollectionView *)self _updateStateFlagsForContentViewAtIndex:self->_selectedItemIndex];
      if (v48)
      {
        if ([v8 containsIndex:v44])
        {
          double v34 = (void *)MEMORY[0x1E4FB1EB0];
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_15;
          v72[3] = &unk_1E54E9858;
          id v73 = v54;
          [v34 performWithoutAnimation:v72];
        }
        [(SFCapsuleCollectionView *)self setNeedsLayout];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransitionCoordinator);
        double v36 = WeakRetained;
        if (WeakRetained) {
          uint64_t v37 = (SFTransitionCoordinator *)WeakRetained;
        }
        else {
          uint64_t v37 = objc_alloc_init(SFTransitionCoordinator);
        }
        CGRect v38 = v37;

        if ([(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView drivesCapsuleSelection]&& [(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView isSendingTrailingAction])
        {
          CGRect v39 = [(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView animationSettingsForCapsuleSelectionGesture];
          [(SFTransitionCoordinator *)v38 setSpringAnimationBehavior:v39];
        }
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_16;
        v62[3] = &unk_1E54E9F78;
        id v63 = v56;
        id v64 = v55;
        CGRect v65 = self;
        BOOL v71 = v45;
        double v66 = v33;
        uint64_t v70 = v10;
        id v40 = v31;
        id v67 = v40;
        id v68 = v54;
        id v41 = v32;
        id v69 = v41;
        [(SFTransitionCoordinator *)v38 addAnimations:v62];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_18;
        v57[3] = &unk_1E54E9FA0;
        id v58 = v40;
        id v59 = v41;
        double v60 = self;
        id v61 = v51;
        [(SFTransitionCoordinator *)v38 addCompletion:v57];
        id v42 = objc_loadWeakRetained((id *)&self->_delegate);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v43 = [(SFTransitionCoordinator *)v38 publicCoordinator];
          [v42 capsuleCollectionView:self willPerformUpdateWithCoordinator:v43];
        }
        [(SFTransitionCoordinator *)v38 performTransitionWithAnimation:1 inContextOfContainerView:self];
        [v53 setContentViewUpdateHandler:0];
      }
    }
  }
}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:a2];
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x1E4FB1EB0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_3;
  v29[3] = &unk_1E54E9B00;
  v29[4] = *(void *)(a1 + 32);
  id v11 = v9;
  id v30 = v11;
  id v12 = v7;
  id v31 = v12;
  objc_msgSend(v10, "safari_performWithoutRetargetingAnimations:", v29);
  [v8 setAutoresizingMask:2];
  id v13 = (void *)MEMORY[0x1E4FB1EB0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_4;
  v26[3] = &unk_1E54E9A60;
  id v27 = v8;
  id v14 = v11;
  id v28 = v14;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_7;
  v23[3] = &unk_1E54E9E68;
  id v15 = v12;
  id v24 = v15;
  id v25 = v27;
  id v16 = v27;
  [v13 animateKeyframesWithDuration:3072 delay:v26 options:v23 animations:0.3 completion:0.0];
  BOOL v17 = (void *)MEMORY[0x1E4FB1EB0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_8;
  _OWORD v20[3] = &unk_1E54E9A60;
  id v21 = v14;
  id v22 = v15;
  id v18 = v15;
  id v19 = v14;
  objc_msgSend(v17, "safari_performWithoutRetargetingAnimations:", v20);
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_3(id *a1)
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [a1[4] capsuleFrame];
  objc_msgSend(a1[5], "setFrame:", v2, v3);
  [a1[5] layoutIfNeeded];
  [a1[5] setAlpha:0.0];
  id v4 = [a1[6] contentContainer];
  [v4 addSubview:a1[5]];
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_4(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_5;
  v6[3] = &unk_1E54E9858;
  id v7 = *(id *)(a1 + 32);
  [v2 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:0.67];
  double v3 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_6;
  v4[3] = &unk_1E54E9858;
  id v5 = *(id *)(a1 + 40);
  [v3 addKeyframeWithRelativeStartTime:v4 relativeDuration:0.33 animations:0.67];
}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_7(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) contentView];
  double v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 removeFromSuperview];
  }
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) contentContainer];
  [v2 bounds];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) _selectedCapsuleFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [*(id *)(a1 + 32) bounds];
  double Width = CGRectGetWidth(v16);
  v17.origin.CGFloat x = v3;
  v17.origin.double y = v5;
  v17.size.CGFloat width = v7;
  v17.size.CGFloat height = v9;
  double MinY = CGRectGetMinY(v17);
  v18.origin.CGFloat x = v3;
  v18.origin.double y = v5;
  v18.size.CGFloat width = v7;
  v18.size.CGFloat height = v9;
  double Height = CGRectGetHeight(v18);
  id v13 = *(void **)(a1 + 40);

  return objc_msgSend(v13, "setFrame:", Width, MinY, 106.0, Height);
}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _dequeueOrCreateViewForItem:a2 atIndex:a3];
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) _incrementAnimationCountForItems:*(void *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);
  CGFloat v3 = *(void **)(a1 + 48);
  double v4 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  [v2 _layOutItems:v3 atIndexes:v4 selectedItemIndex:*(void *)(a1 + 88)];

  if (*(unsigned char *)(a1 + 104)) {
    uint64_t v5 = *(void *)(a1 + 96);
  }
  else {
    uint64_t v5 = [*(id *)(a1 + 56) indexAfterUpdateOfSelectedItemBeforeUpdate];
  }
  id v6 = *(id *)(a1 + 64);
  id v13 = v6;
  if (*(unsigned char *)(a1 + 104))
  {
    CGFloat v7 = (void *)[v6 mutableCopy];
    [v7 insertObject:*(void *)(a1 + 72) atIndex:v5];
    uint64_t v8 = [v7 copy];

    id v13 = (id)v8;
  }
  id v9 = *(id *)(a1 + 80);
  uint64_t v10 = v9;
  if (*(unsigned char *)(a1 + 104))
  {
    id v11 = (void *)[v9 mutableCopy];
    [v11 shiftIndexesStartingAtIndex:v5 by:1];
    uint64_t v12 = [v11 copy];

    uint64_t v10 = (void *)v12;
  }
  [*(id *)(a1 + 32) _layOutItems:v13 atIndexes:v10 selectedItemIndex:v5];
  [*(id *)(a1 + 32) _applyEffectsForChangeType:0 update:*(void *)(a1 + 56)];
}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_12(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:a2];
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_13(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F1CAD0];
  CGFloat v3 = [*(id *)(a1 + 32) objectsAtIndexes:*(void *)(a1 + 40)];
  double v4 = [v2 setWithArray:v3];

  uint64_t v5 = [*(id *)(a1 + 48) deletedItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_14;
  _OWORD v8[3] = &unk_1E54E9F08;
  char v11 = *(unsigned char *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v4;
  uint64_t v10 = v6;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (!*(unsigned char *)(a1 + 48) || (char v4 = [*(id *)(a1 + 32) containsObject:v3], v5 = v6, (v4 & 1) == 0))
  {
    [*(id *)(a1 + 40) _reclaimViewForItem:v6];
    uint64_t v5 = v6;
  }
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_15(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) capsuleView];
  double v1 = [v2 contentView];
  [v1 layoutIfNeeded];
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_16(uint64_t a1)
{
  [*(id *)(a1 + 32) enumerateObjectsAtIndexes:*(void *)(a1 + 40) options:0 usingBlock:&__block_literal_global_106];
  [*(id *)(a1 + 48) layoutIfNeeded];
  uint64_t v2 = [*(id *)(a1 + 56) indexBeforeUpdateOfSelectedItemAfterUpdate];
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v3 = *(void *)(a1 + 88) + 1;
  }
  else
  {
    uint64_t v3 = v2;
    if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v3 = [*(id *)(a1 + 56) selectedItemIndexBeforeUpdate];
    }
  }
  id v4 = *(id *)(a1 + 64);
  id v11 = v4;
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v5 = (void *)[v4 mutableCopy];
    [v5 insertObject:*(void *)(a1 + 72) atIndex:v3];
    uint64_t v6 = [v5 copy];

    id v11 = (id)v6;
  }
  id v7 = *(id *)(a1 + 80);
  uint64_t v8 = v7;
  if (*(unsigned char *)(a1 + 96))
  {
    id v9 = (void *)[v7 mutableCopy];
    [v9 shiftIndexesStartingAtIndex:v3 by:1];
    uint64_t v10 = [v9 copy];

    uint64_t v8 = (void *)v10;
  }
  [*(id *)(a1 + 48) _layOutItems:v11 atIndexes:v8 selectedItemIndex:v3];
  [*(id *)(a1 + 48) _applyEffectsForChangeType:1 update:*(void *)(a1 + 56)];
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = [a2 capsuleView];
  [v2 setDirectionalCollapsedContentEdge:0];
  [v2 setAlpha:1.0];
}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_18(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_19;
  v5[3] = &unk_1E54E9EB8;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 48);
  [v2 enumerateObjectsAtIndexes:v3 options:0 usingBlock:v5];
  return [*(id *)(a1 + 48) _decrementAnimationCountForItems:*(void *)(a1 + 56)];
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 capsuleView];
  [v4 setAlpha:1.0];
  [v4 setDirectionalCollapsedContentEdge:0];
  [*(id *)(a1 + 32) _reclaimViewForItem:v3];
}

- (void)_applyEffectsForChangeType:(int64_t)a3 update:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3 == 1)
  {
    id v7 = [v5 itemsBeforeUpdate];
    uint64_t v8 = [v6 indexesOfDeletedItems];
    uint64_t v9 = [v6 selectedItemIndexBeforeUpdate];
    uint64_t v10 = [v6 indexBeforeUpdateOfSelectedItemAfterUpdate];
    id v11 = [v6 indexesOfDeletedItems];
    if (objc_msgSend(v11, "containsIndex:", objc_msgSend(v6, "selectedItemIndexBeforeUpdate")))
    {
      uint64_t v12 = [v6 indexesOfInsertedItems];
      char v13 = objc_msgSend(v12, "containsIndex:", objc_msgSend(v6, "selectedItemIndexAfterUpdate")) ^ 1;
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
    if (a3)
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
      uint64_t v8 = 0;
      id v7 = 0;
    }
    else
    {
      id v7 = [v5 itemsAfterUpdate];
      uint64_t v8 = [v6 indexesOfInsertedItems];
      uint64_t v9 = [v6 selectedItemIndexAfterUpdate];
      uint64_t v10 = [v6 indexAfterUpdateOfSelectedItemBeforeUpdate];
    }
    char v13 = 1;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__SFCapsuleCollectionView__applyEffectsForChangeType_update___block_invoke;
  v14[3] = &__block_descriptor_49_e44_v32__0__SFCapsuleCollectionViewItem_8Q16_B24l;
  char v15 = v13;
  v14[4] = v9;
  v14[5] = v10;
  [v7 enumerateObjectsAtIndexes:v8 options:0 usingBlock:v14];
}

void __61__SFCapsuleCollectionView__applyEffectsForChangeType_update___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 capsuleView];
  id v20 = v5;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6 == a3)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = 8;
      if (v7 <= a3) {
        uint64_t v8 = 2;
      }
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = v8;
      }
    }
    else if (v6 <= a3)
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 8;
    }
    [v5 setDirectionalCollapsedContentEdge:v9];
    id v5 = v20;
  }
  [v5 layoutIfNeeded];
  [v20 frameForShadowView];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  CGRect v18 = [v20 shadowView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  [v20 setAlpha:0.0];
  id v19 = [v20 shadowView];
  [v19 setAlpha:0.0];
}

- (void)deleteItemsAtIndexes:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SFCapsuleCollectionView *)self beginUpdates];
  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (v4) {
      uint64_t v8 = @"YES";
    }
    uint64_t v9 = v8;
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_18C354000, v7, OS_LOG_TYPE_DEFAULT, "Delete indexes = %@; animated = %@",
      (uint8_t *)&v16,
      0x16u);
  }
  [(SFCapsuleCollectionViewUpdate *)self->_update deleteItemsAtIndexes:v6 animated:v4];
  double v10 = [(SFCapsuleCollectionViewUpdate *)self->_update itemsAfterUpdate];
  double v11 = (NSArray *)[v10 copy];
  items = self->_items;
  self->_items = v11;

  self->_selectedItemIndeCGFloat x = [(SFCapsuleCollectionViewUpdate *)self->_update selectedItemIndexAfterUpdate];
  double v13 = [(NSArray *)self->_items indexesOfObjectsPassingTest:&__block_literal_global_110];
  indexesOfLoadedViews = self->_indexesOfLoadedViews;
  self->_indexesOfLoadedViews = v13;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_numberOfItems = [WeakRetained numberOfItemsInCapsuleCollectionView:self];

  [(SFCapsuleCollectionView *)self _updateActions];
  [(SFCapsuleCollectionView *)self setNeedsLayout];
  [(SFCapsuleCollectionView *)self endUpdates];
}

BOOL __57__SFCapsuleCollectionView_deleteItemsAtIndexes_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 capsuleView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)insertItemsAtIndexes:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SFCapsuleCollectionView *)self beginUpdates];
  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (v4) {
      uint64_t v8 = @"YES";
    }
    uint64_t v9 = v8;
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_18C354000, v7, OS_LOG_TYPE_DEFAULT, "Insert indexes = %@; animated = %@",
      (uint8_t *)&v16,
      0x16u);
  }
  [(SFCapsuleCollectionViewUpdate *)self->_update insertItemsAtIndexes:v6 animated:v4];
  double v10 = [(SFCapsuleCollectionViewUpdate *)self->_update itemsAfterUpdate];
  double v11 = (NSArray *)[v10 copy];
  items = self->_items;
  self->_items = v11;

  self->_selectedItemIndeCGFloat x = [(SFCapsuleCollectionViewUpdate *)self->_update selectedItemIndexAfterUpdate];
  double v13 = [(NSArray *)self->_items indexesOfObjectsPassingTest:&__block_literal_global_112];
  indexesOfLoadedViews = self->_indexesOfLoadedViews;
  self->_indexesOfLoadedViews = v13;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_numberOfItems = [WeakRetained numberOfItemsInCapsuleCollectionView:self];

  [(SFCapsuleCollectionView *)self _updateActions];
  [(SFCapsuleCollectionView *)self endUpdates];
}

BOOL __57__SFCapsuleCollectionView_insertItemsAtIndexes_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 capsuleView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setSuppressingDataSourceCalls:(BOOL)a3
{
  if (self->_suppressingDataSourceCalls != a3)
  {
    self->_suppressingDataSourceCalls = a3;
    if (!a3)
    {
      items = self->_items;
      indexesOfLoadedViews = self->_indexesOfLoadedViews;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __58__SFCapsuleCollectionView__setSuppressingDataSourceCalls___block_invoke;
      v5[3] = &unk_1E54E9EB8;
      v5[4] = self;
      [(NSArray *)items enumerateObjectsAtIndexes:indexesOfLoadedViews options:0 usingBlock:v5];
    }
  }
}

void __58__SFCapsuleCollectionView__setSuppressingDataSourceCalls___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([v5 capsuleContentIsValid] & 1) == 0)
  {
    [*(id *)(a1 + 32) _fetchContentViewForItem:v5 atIndex:a3];
    [v5 setCapsuleContentIsValid:1];
  }
}

- (void)_updateTrailingCapsule
{
  if (!self->_numberOfItems) {
    return;
  }
  id v10 = [(NSArray *)self->_items lastObject];
  NSUInteger v3 = [(NSArray *)self->_items count] - 1;
  BOOL v4 = [(SFCapsuleCollectionView *)self _indexesOfVisibleItemsIncludingAction:1];
  int v5 = [v4 containsIndex:v3];

  id v6 = (NSIndexSet *)[(NSIndexSet *)self->_indexesOfLoadedViews mutableCopy];
  uint64_t v7 = v6;
  if (v5)
  {
    [(NSIndexSet *)v6 addIndex:v3];
    [(SFCapsuleCollectionView *)self _dequeueOrCreateViewForItem:v10 atIndex:v3];
LABEL_7:
    [(SFCapsuleCollectionView *)self setNeedsLayout];
    goto LABEL_8;
  }
  [(NSIndexSet *)v6 removeIndex:v3];
  uint64_t v8 = [v10 capsuleView];

  if (v8)
  {
    [(SFCapsuleCollectionView *)self _reclaimViewForItem:v10];
    [(SFCapsuleCollectionView *)self _scheduleTimerToDiscardViewsForReuseIfNeeded];
    goto LABEL_7;
  }
LABEL_8:
  indexesOfLoadedViews = self->_indexesOfLoadedViews;
  self->_indexesOfLoadedViews = v7;
}

- (void)_discardExcessViewsForReuse
{
  p_timerToDiscardViewsForReuse = &self->_timerToDiscardViewsForReuse;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timerToDiscardViewsForReuse);
  [WeakRetained invalidate];

  objc_storeWeak((id *)p_timerToDiscardViewsForReuse, 0);
  id v18 = [(SFCapsuleCollectionView *)self _indexesOfAnimatingItems];
  if ([v18 count])
  {
  }
  else
  {
    NSUInteger v5 = [(NSIndexSet *)self->_indexesOfLoadedViews count];
    unint64_t v6 = [(SFCapsuleCollectionView *)self _maximumNumberOfVisibleViews];

    if (v5 <= v6)
    {
      unint64_t v7 = [(SFCapsuleCollectionView *)self _softMaximumNumberOfViews];
      NSUInteger v8 = [(NSIndexSet *)self->_indexesOfLoadedViews count];
      if ([(NSMutableSet *)self->_viewsForReuse count] + v8 > v7)
      {
        do
        {
          uint64_t v9 = [(NSMutableSet *)self->_viewsForReuse anyObject];
          [(NSMutableSet *)self->_viewsForReuse removeObject:v9];
          [v9 removeFromSuperview];
          uint64_t v10 = [v9 contentView];
          if (v10)
          {
            double v11 = (void *)v10;
            double v12 = [v9 reusableContentViewIdentifier];

            if (v12)
            {
              contentViewRegistrations = self->_contentViewRegistrations;
              double v14 = [v9 reusableContentViewIdentifier];
              double v15 = [(NSMutableDictionary *)contentViewRegistrations objectForKeyedSubscript:v14];
              int v16 = [v9 contentView];
              [v15 discardView:v16];
            }
          }

          NSUInteger v17 = [(NSIndexSet *)self->_indexesOfLoadedViews count];
        }
        while ([(NSMutableSet *)self->_viewsForReuse count] + v17 > v7);
      }
    }
  }
}

- (NSIndexSet)indexesOfVisibleItems
{
  return (NSIndexSet *)[(SFCapsuleCollectionView *)self _indexesOfVisibleItemsIncludingAction:0];
}

- (id)_indexesOfVisibleItemsWithSelectedItemIndex:(int64_t)a3
{
  p_items = (void **)&self->_items;
  if ((int64_t)[(NSArray *)self->_items count] <= a3)
  {
    double v11 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SFCapsuleCollectionView _indexesOfVisibleItemsWithSelectedItemIndex:](p_items, v11);
    }
    unint64_t v7 = [MEMORY[0x1E4F28D60] indexSet];
  }
  else
  {
    unint64_t v6 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
    unint64_t v7 = v6;
    int64_t v8 = a3 - 1;
    if (a3 >= 1) {
      [v6 addIndex:v8];
    }
    uint64_t v9 = objc_msgSend(*p_items, "count", v8);
    uint64_t v10 = -2;
    if (self->_trailingAction) {
      uint64_t v10 = -1;
    }
    if (v10 + v9 > a3) {
      [v7 addIndex:a3 + 1];
    }
  }

  return v7;
}

- (void)_incrementAnimationCountForItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v7 |= [v10 animationCount] == 0;
        objc_msgSend(v10, "setAnimationCount:", objc_msgSend(v10, "animationCount") + 1);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
    if (v7) {
      [(SFCapsuleCollectionView *)self _updateRangeOfLoadedViews];
    }
  }
}

- (void)_decrementAnimationCountForItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "setAnimationCount:", objc_msgSend(v10, "animationCount") - 1);
        v7 |= [v10 animationCount] == 0;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
    if (v7) {
      [(SFCapsuleCollectionView *)self _updateRangeOfLoadedViews];
    }
  }
}

- (void)_reclaimViewForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 capsuleView];
  if (v5)
  {
    if (([v4 capsuleIsDetached] & 1) == 0)
    {
      [v4 setCapsuleView:0];
      [v4 setCapsuleContentIsValid:0];
      [v5 setHidden:1];
      uint64_t v6 = [v5 shadowView];
      [v6 setHidden:1];

      long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v15[0] = *MEMORY[0x1E4F1DAB8];
      v15[1] = v7;
      v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v5 setTransform:v15];
      [(NSMutableSet *)self->_viewsForReuse addObject:v5];
      uint64_t v8 = [v5 contentView];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = [v5 reusableContentViewIdentifier];

        if (v10)
        {
          contentViewRegistrations = self->_contentViewRegistrations;
          long long v12 = [v5 reusableContentViewIdentifier];
          long long v13 = [(NSMutableDictionary *)contentViewRegistrations objectForKeyedSubscript:v12];
          long long v14 = [v5 contentView];
          [v13 enqueueView:v14];
        }
      }
    }
  }
}

- (void)_didReceiveTap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  int64_t selectedItemState = self->_selectedItemState;
  if (selectedItemState == 1)
  {
    [v4 locationInView:self];
    if (self->_layoutStyle == 2
      && (CGFloat v22 = v20,
          CGFloat v23 = v21,
          [(SFCapsuleCollectionView *)self _tapToShowBarBottomRegion],
          v30.CGFloat x = v22,
          v30.CGFloat y = v23,
          CGRectContainsPoint(v33, v30)))
    {
      self->_minimizationFlags |= 8uLL;
      id v24 = [(SFCapsuleCollectionView *)self _setSelectedItemStateWithoutPerformingTransition:0 options:0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __42__SFCapsuleCollectionView__didReceiveTap___block_invoke;
      v28[3] = &unk_1E54E9858;
      v28[4] = self;
      [v24 addCompletion:v28];
    }
    else
    {
      id v24 = [(SFCapsuleCollectionView *)self _setSelectedItemStateWithoutPerformingTransition:0 options:0];
    }
    id v25 = [(SFCapsuleCollectionView *)self window];
    [v24 performTransitionWithAnimation:1 inContextOfContainerView:v25];
  }
  else if (!selectedItemState)
  {
    [v4 locationInView:self];
    CGFloat v8 = v7;
    double v10 = v9;
    [(SFCapsuleCollectionView *)self _detachedCapsuleSelectionRect];
    CGFloat x = v31.origin.x;
    CGFloat y = v31.origin.y;
    CGFloat width = v31.size.width;
    CGFloat height = v31.size.height;
    if (CGRectIsNull(v31))
    {
      [(SFCapsuleCollectionView *)self _selectedCapsuleFrame];
      CGFloat x = v15;
      CGFloat y = v16;
      CGFloat width = v17;
      CGFloat height = v18;
    }
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    v29.CGFloat x = v8;
    v29.CGFloat y = v10;
    if (CGRectContainsPoint(v32, v29))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) == 0
        || [WeakRetained capsuleCollectionViewShouldFocusSelectedItem:self])
      {
        [(SFCapsuleCollectionView *)self setSelectedItemState:2 animated:1];
      }
    }
    else
    {
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.CGFloat width = width;
      v34.size.CGFloat height = height;
      if (v10 <= CGRectGetMaxY(v34)) {
        [(SFCapsuleCollectionView *)self _didReceiveTapOnPeekCapsule:v5];
      }
    }
    id v26 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
    id v27 = [v26 capsuleView];
    [v27 setAllowsHighlight:1];
  }
}

uint64_t __42__SFCapsuleCollectionView__didReceiveTap___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 680) &= ~8uLL;
  return result;
}

- (void)_didReceiveTapOnPeekCapsule:(id)a3
{
  if (self->_selectedItemState) {
    return;
  }
  [a3 locationInView:self];
  double v5 = v4;
  [(SFCapsuleCollectionView *)self _selectedCapsuleFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  selectedItemIndeCGFloat x = self->_selectedItemIndex;
  BOOL v15 = [(UIView *)self _sf_usesLeftToRightLayout];
  v37.origin.CGFloat x = v7;
  v37.origin.CGFloat y = v9;
  v37.size.CGFloat width = v11;
  v37.size.CGFloat height = v13;
  double MinX = CGRectGetMinX(v37);
  if (!v15)
  {
    if (v5 < MinX)
    {
      int64_t v20 = self->_selectedItemIndex + 1;
      if (v20 < (int64_t)[(NSArray *)self->_items count])
      {
        int64_t v21 = self->_selectedItemIndex;
        goto LABEL_17;
      }
    }
    v38.origin.CGFloat x = v7;
    v38.origin.CGFloat y = v9;
    v38.size.CGFloat width = v11;
    v38.size.CGFloat height = v13;
    double MaxX = CGRectGetMaxX(v38);
    int64_t v21 = self->_selectedItemIndex;
    int64_t v23 = v21 - 1;
    if (v21 <= 0) {
      int64_t v23 = selectedItemIndex;
    }
    if (MaxX < v5) {
      selectedItemIndeCGFloat x = v23;
    }
LABEL_18:
    if (selectedItemIndex == v21) {
      return;
    }
    goto LABEL_19;
  }
  if (v5 < MinX)
  {
    int64_t v17 = self->_selectedItemIndex;
    BOOL v18 = v17 < 1;
    int64_t v19 = v17 - 1;
    if (!v18)
    {
      selectedItemIndeCGFloat x = v19;
      goto LABEL_19;
    }
  }
  v39.origin.CGFloat x = v7;
  v39.origin.CGFloat y = v9;
  v39.size.CGFloat width = v11;
  v39.size.CGFloat height = v13;
  CGFloat v24 = CGRectGetMaxX(v39);
  int64_t v21 = self->_selectedItemIndex;
  if (v24 >= v5) {
    goto LABEL_18;
  }
  int64_t v25 = v21 + 1;
  int64_t v26 = [(NSArray *)self->_items count];
  int64_t v21 = self->_selectedItemIndex;
  if (v25 >= v26) {
    goto LABEL_18;
  }
LABEL_17:
  selectedItemIndeCGFloat x = v21 + 1;
LABEL_19:
  if (selectedItemIndex != self->_numberOfItems)
  {
    if ([(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView drivesCapsuleSelection])
    {
      [(SFCapsuleCollectionView *)self _animateSwitchingLinkedPageViewToItemAtIndex:selectedItemIndex];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        id v28 = objc_alloc_init(SFTransitionCoordinator);
        objc_storeWeak((id *)&self->_currentTransitionCoordinator, v28);
        CGPoint v29 = [(SFTransitionCoordinator *)v28 publicCoordinator];
        [WeakRetained capsuleCollectionView:self willSelectItemAtIndex:selectedItemIndex coordinator:v29];

        [(SFCapsuleCollectionView *)self setSelectedItemIndex:selectedItemIndex animated:1];
        if (v28)
        {
          objc_storeWeak((id *)&self->_currentTransitionCoordinator, 0);
        }
      }
      else
      {
        [(SFCapsuleCollectionView *)self setSelectedItemIndex:selectedItemIndex animated:1];
      }
      CGPoint v30 = [MEMORY[0x1E4FB1438] sharedApplication];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __55__SFCapsuleCollectionView__didReceiveTapOnPeekCapsule___block_invoke;
      v32[3] = &unk_1E54E9CB0;
      id v33 = WeakRetained;
      CGRect v34 = self;
      int64_t v35 = selectedItemIndex;
      id v31 = WeakRetained;
      [v30 _performBlockAfterCATransactionCommits:v32];
    }
  }
}

uint64_t __55__SFCapsuleCollectionView__didReceiveTapOnPeekCapsule___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    NSUInteger v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 capsuleCollectionView:v4 didSelectItemAtIndex:v5];
  }
  return result;
}

- (BOOL)isTransitioningToNormalStateForTapInBottomRegion
{
  return (LOBYTE(self->_minimizationFlags) >> 3) & 1;
}

- (CGRect)_tapToShowBarBottomRegion
{
  if (self->_selectedItemState == 1 && (self->_layoutStyle != 1 || self->_minimizationStyle))
  {
    [(SFCapsuleCollectionView *)self obscuredInsetsForState:0];
    double v4 = v3;
    [(SFCapsuleCollectionView *)self bounds];
    CGFloat x = v14.origin.x;
    CGFloat y = v14.origin.y;
    CGFloat width = v14.size.width;
    CGFloat height = v14.size.height;
    double v9 = CGRectGetHeight(v14) - v4;
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    double v10 = CGRectGetWidth(v15);
    double v11 = 0.0;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v12 = v9;
  double v13 = v4;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)_updateOffsetForPan
{
  if (self->_numberOfItems)
  {
    if ((unint64_t)([(UIPanGestureRecognizer *)self->_panGesture state] - 1) > 1)
    {
      double v3 = *MEMORY[0x1E4F1DAD8];
      double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    else if (self->_linkedPageView)
    {
      [(SFCapsuleCollectionView *)self _offsetForPanFromLinkedPageView];
    }
    else
    {
      [(SFCapsuleCollectionView *)self _panGestureTranslationConstrainedToPanAxis];
    }
    if (v3 != self->_offsetForPan.x || v4 != self->_offsetForPan.y)
    {
      self->_offsetForPan.CGFloat x = v3;
      self->_offsetForPan.CGFloat y = v4;
      [(SFCapsuleCollectionView *)self setNeedsLayout];
    }
  }
}

- (CGPoint)_panGestureTranslationConstrainedToPanAxis
{
  [(UIPanGestureRecognizer *)self->_panGesture translationInView:self];
  double v4 = v3;
  double v6 = v5;
  [(SFCapsuleCollectionView *)self capsuleFrame];
  double Height = CGRectGetHeight(v29);
  double v8 = Height;
  if (self->_panAxis == 1)
  {
    [(SFCapsuleCollectionView *)self pageWidth];
    double v10 = v9;
    BOOL v11 = [(UIView *)self _sf_usesLeftToRightLayout];
    unint64_t numberOfItems = self->_numberOfItems;
    selectedItemIndeCGFloat x = self->_selectedItemIndex;
    int64_t v14 = numberOfItems + ~selectedItemIndex;
    int64_t v15 = numberOfItems - selectedItemIndex;
    if (!self->_trailingAction) {
      int64_t v15 = v14;
    }
    if (v11) {
      int64_t v16 = v15;
    }
    else {
      int64_t v16 = self->_selectedItemIndex;
    }
    double v17 = -(v10 * (double)v16);
    if (v11) {
      int64_t v15 = self->_selectedItemIndex;
    }
    double v18 = v10 * (double)v15;
    [(SFCapsuleCollectionView *)self bounds];
    double Width = CGRectGetWidth(v30);
    double v20 = v4;
    double v21 = v17;
    double v22 = v18;
  }
  else
  {
    double Width = Height * 0.5;
    double v21 = 0.0;
    double v22 = 0.0;
    double v20 = v4;
  }
  double v23 = SFRubberBandOffsetForOffset(v20, v21, v22, Width);
  if (self->_panAxis == 2)
  {
    [(SFCapsuleCollectionView *)self bounds];
    double v24 = CGRectGetHeight(v31) / -3.0;
    [(SFCapsuleCollectionView *)self layoutMargins];
    double v26 = fmin(SFRubberBandOffsetForOffset(v6, v24, v25, v8), 0.0);
  }
  else
  {
    double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v27 = v23;
  result.CGFloat y = v26;
  result.CGFloat x = v27;
  return result;
}

- (int64_t)_nextItemIndexForSelectionGesture
{
  [(SFCapsuleCollectionView *)self _panGestureTranslationConstrainedToPanAxis];

  return -[SFCapsuleCollectionView _indexOfTargetItemWithTranslation:roundingThreshold:allowActionIndex:allowOutOfBounds:](self, "_indexOfTargetItemWithTranslation:roundingThreshold:allowActionIndex:allowOutOfBounds:", 1, 0);
}

- (double)_percentToSelectItemIndex:(int64_t)a3
{
  [(SFCapsuleCollectionView *)self _panGestureTranslationConstrainedToPanAxis];
  double v6 = v5;
  [(SFCapsuleCollectionView *)self capsuleFrame];
  double Width = CGRectGetWidth(v11);
  [(SFCapsuleCollectionView *)self _interCapsuleSpacing];
  double v9 = 0.0;
  if (self->_selectedItemIndex != a3) {
    return fabs(v6) / (Width + v8);
  }
  return v9;
}

- (BOOL)_hasReachedTrailingActionPullThreshold
{
  BOOL v3 = [(UIView *)self _sf_usesLeftToRightLayout];
  double x = self->_offsetForPan.x;
  if (v3) {
    return x < -106.0;
  }
  else {
    return x > 106.0;
  }
}

- (void)_didReceivePan:(id)a3
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v125 = a3;
  v124 = [(SFCapsuleCollectionView *)self _indexesOfVisibleItemsIncludingAction:1];
  double v4 = [v125 view];
  [v125 velocityInView:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = self->_previousVelocity.x + (v6 - self->_previousVelocity.x) * 0.5;
  double v10 = self->_previousVelocity.y + (v8 - self->_previousVelocity.y) * 0.5;
  self->_previousVelocity.double x = v9;
  self->_previousVelocity.double y = v10;
  selectedItemIndedouble x = self->_selectedItemIndex;
  uint64_t v12 = [v125 state];
  if ((unint64_t)(v12 - 3) >= 2)
  {
    if ((unint64_t)(v12 - 1) > 1) {
      goto LABEL_126;
    }
    id v13 = v125;
    double v14 = fabs(v9);
    double v15 = fabs(v10);
    if ([v125 state] == 1)
    {
      int64_t v16 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18C354000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PanGesture", " isAnimation=YES ", buf, 2u);
      }
      double v17 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
      double v18 = [v17 capsuleView];

      [(SFCapsuleCollectionView *)self _setUpdateRequestActive:1];
      [v18 _setSafeAreaInsetsFrozen:1];
      self->_int64_t selectionGestureState = 1;
      if (self->_topAction && v14 <= v15) {
        unint64_t v19 = 2;
      }
      else {
        unint64_t v19 = 1;
      }
      self->_unint64_t panAxis = v19;
      [(SFCapsuleCollectionView *)self _updateCanBlurCapsules];
      if (self->_panAxis == 1) {
        [v18 setAllowsHighlight:0];
      }
      self->_axisSwitchTime = CACurrentMediaTime();
      [(UISelectionFeedbackGenerator *)self->_feedbackGenerator prepare];
      long long v166 = 0u;
      long long v167 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      double v77 = self->_gestureObservers;
      uint64_t v78 = [(NSHashTable *)v77 countByEnumeratingWithState:&v164 objects:v172 count:16];
      if (v78)
      {
        uint64_t v79 = *(void *)v165;
        do
        {
          for (uint64_t i = 0; i != v78; ++i)
          {
            if (*(void *)v165 != v79) {
              objc_enumerationMutation(v77);
            }
            id v81 = *(void **)(*((void *)&v164 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v81 capsuleCollectionView:self didBeginSelectionGestureOnAxis:self->_panAxis];
            }
          }
          uint64_t v78 = [(NSHashTable *)v77 countByEnumeratingWithState:&v164 objects:v172 count:16];
        }
        while (v78);
      }

      id v13 = v125;
    }
    [(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView didReceiveLinkedPanGesture:v13];
    [v125 translationInView:self];
    double v83 = v82;
    double v85 = v84;
    unint64_t panAxis = self->_panAxis;
    CFTimeInterval v87 = CACurrentMediaTime();
    double v88 = _SFClampPercent(v87 - self->_axisSwitchTime, 0.0, 0.5);
    double v89 = _SFInterpolate(1.49253731, 0.67, v88);
    if (v14 <= 50.0 || v14 <= v15 + v15 || fabs(v83) <= fabs(v85) * v89)
    {
      if (v15 <= 50.0 || v15 <= v14 + v14 || fabs(v85) <= fabs(v83) * v89 || v85 > 0.0 || !self->_topAction) {
        goto LABEL_97;
      }
      unint64_t v90 = 2;
    }
    else
    {
      unint64_t v90 = 1;
    }
    self->_unint64_t panAxis = v90;
LABEL_97:
    BOOL v120 = [(SFCapsuleCollectionView *)self _hasReachedTrailingActionPullThreshold];
    [(SFCapsuleCollectionView *)self _updateOffsetForPan];
    [(SFCapsuleCollectionView *)self _updateRangeOfLoadedViews];
    unint64_t v91 = 0x1E4FB1000;
    double v92 = &off_18C70E000;
    if (panAxis != self->_panAxis)
    {
      self->_axisSwitchTime = CACurrentMediaTime();
      [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
      v163[0] = MEMORY[0x1E4F143A8];
      v163[1] = 3221225472;
      v163[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke;
      v163[3] = &unk_1E54E9858;
      v163[4] = self;
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v163 completion:0];
      long long v161 = 0u;
      long long v162 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      double v93 = self->_gestureObservers;
      uint64_t v94 = [(NSHashTable *)v93 countByEnumeratingWithState:&v159 objects:v171 count:16];
      if (v94)
      {
        uint64_t v95 = *(void *)v160;
        do
        {
          for (uint64_t j = 0; j != v94; ++j)
          {
            if (*(void *)v160 != v95) {
              objc_enumerationMutation(v93);
            }
            id v97 = *(void **)(*((void *)&v159 + 1) + 8 * j);
            if (objc_opt_respondsToSelector()) {
              [v97 capsuleCollectionView:self selectionGestureDidChangeFromAxis:panAxis];
            }
          }
          uint64_t v94 = [(NSHashTable *)v93 countByEnumeratingWithState:&v159 objects:v171 count:16];
        }
        while (v94);
      }

      double v92 = &off_18C70E000;
      unint64_t v91 = 0x1E4FB1000uLL;
    }
    id v98 = *(void **)(v91 + 3760);
    v158[0] = MEMORY[0x1E4F143A8];
    uint64_t v99 = *((void *)v92 + 218);
    v158[1] = v99;
    v158[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2;
    v158[3] = &unk_1E54E9858;
    v158[4] = self;
    [v98 animateWithDuration:v158 animations:0.15];
    if (self->_trailingAction
      && self->_panAxis == 1
      && self->_selectedItemIndex + 1 == self->_numberOfItems
      && v120 != [(SFCapsuleCollectionView *)self _hasReachedTrailingActionPullThreshold])
    {
      [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
    }
    if (self->_sendProgressMessageToObservers)
    {
      [(SFCapsuleCollectionView *)self _panGestureTranslationConstrainedToPanAxis];
      int64_t v100 = -[SFCapsuleCollectionView _indexOfTargetItemWithTranslation:roundingThreshold:allowActionIndex:allowOutOfBounds:](self, "_indexOfTargetItemWithTranslation:roundingThreshold:allowActionIndex:allowOutOfBounds:", 1, 1);
      -[SFCapsuleCollectionView _percentToActivatingTopActionWithTranslation:](self, "_percentToActivatingTopActionWithTranslation:", self->_offsetForPan.x, self->_offsetForPan.y);
      double v102 = v101;
      [(SFCapsuleCollectionView *)self _percentToSelectItemIndex:v100];
      double v104 = v103;
      [(SFCapsuleCollectionView *)self _swipeTranslationFactorWithPercentToTopAction:v102];
      double v106 = v105;
      long long v156 = 0u;
      long long v157 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      CGRect v107 = self->_gestureObservers;
      uint64_t v108 = [(NSHashTable *)v107 countByEnumeratingWithState:&v154 objects:v170 count:16];
      if (v108)
      {
        double v109 = v104 * v106;
        uint64_t v110 = *(void *)v155;
        do
        {
          for (uint64_t k = 0; k != v108; ++k)
          {
            if (*(void *)v155 != v110) {
              objc_enumerationMutation(v107);
            }
            CGRect v112 = *(void **)(*((void *)&v154 + 1) + 8 * k);
            if (objc_opt_respondsToSelector()) {
              [v112 capsuleCollectionView:self didUpdateProgress:v100 toSelectItemAtIndex:self->_panAxis progressToTopAction:v109 snapToAxis:v102];
            }
          }
          uint64_t v108 = [(NSHashTable *)v107 countByEnumeratingWithState:&v154 objects:v170 count:16];
        }
        while (v108);
      }
    }
    linkedPageView = self->_linkedPageView;
    if (linkedPageView)
    {
      v114 = [(SFCapsuleCollectionViewLinkablePageView *)linkedPageView animationSettingsForCapsuleSelectionGesture];
      v153[0] = MEMORY[0x1E4F143A8];
      v153[1] = v99;
      v153[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3;
      v153[3] = &unk_1E54E9858;
      v153[4] = self;
      [v114 performInteractive:1 animations:v153 completion:0];
    }
    goto LABEL_126;
  }
  uint64_t v118 = selectedItemIndex;
  [(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView didReceiveLinkedPanGesture:v125];
  p_items = (void **)&self->_items;
  double v20 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
  v119 = [v20 capsuleView];

  [v119 _setSafeAreaInsetsFrozen:0];
  [v119 setAllowsHighlight:1];
  double x = self->_offsetForPan.x;
  double y = self->_offsetForPan.y;
  int64_t v121 = self->_selectedItemIndex;
  if ([(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView drivesCapsuleSelection])
  {
    nextSelectedItemIndexAfterPauint64_t n = self->_nextSelectedItemIndexAfterPan;
    if (nextSelectedItemIndexAfterPan)
    {
      uint64_t v24 = [(NSNumber *)nextSelectedItemIndexAfterPan integerValue];
      if (v24 >= [*p_items count])
      {
        int64_t v35 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[SFCapsuleCollectionView _didReceivePan:](p_items, v35);
        }
      }
      else
      {
        int64_t v121 = v24;
      }
    }
    double v36 = self->_nextSelectedItemIndexAfterPan;
    self->_nextSelectedItemIndexAfterPauint64_t n = 0;
  }
  else if ([v125 state] == 3)
  {
    if (self->_usesFastDeceleration) {
      long double v25 = *MEMORY[0x1E4FB2EE8];
    }
    else {
      long double v25 = *MEMORY[0x1E4FB2EF0];
    }
    double v26 = SFProjectedOffsetForOffsetWithVelocity(x, y, v9, v10, v25, *MEMORY[0x1E4FB2EF0]);
    -[SFCapsuleCollectionView _percentToActivatingTopActionWithTranslation:](self, "_percentToActivatingTopActionWithTranslation:");
    double v28 = v27;
    -[SFCapsuleCollectionView _swipeTranslationFactorWithPercentToTopAction:](self, "_swipeTranslationFactorWithPercentToTopAction:");
    if (fabs(x) <= fabs(y) && self->_topAction)
    {
      if (v28 >= 0.5)
      {
        int64_t v30 = self->_selectedItemIndex;
        BOOL v31 = [(SFCapsuleCollectionView *)self _hasReachedTrailingActionPullThreshold];
        if (v30 == v121)
        {
          if (self->_trailingAction)
          {
            BOOL v32 = self->_selectedItemIndex + 1 == self->_numberOfItems && v31;
            int v116 = v32;
          }
          else
          {
            int v116 = 0;
          }
          int64_t v40 = 4;
          uint64_t v117 = 0x100000001;
        }
        else
        {
          int v116 = 0;
          uint64_t v117 = 1;
          int64_t v40 = 4;
        }
        goto LABEL_41;
      }
    }
    else
    {
      double v33 = v26 * v29;
      double selectionThreshold = self->_selectionThreshold;
      if (selectionThreshold == 0.0) {
        double selectionThreshold = 0.5;
      }
      int64_t v121 = [(SFCapsuleCollectionView *)self _indexOfTargetItemWithTranslation:v33 roundingThreshold:selectionThreshold];
    }
  }
  BOOL v37 = self->_selectedItemIndex == v121;
  BOOL v38 = [(SFCapsuleCollectionView *)self _hasReachedTrailingActionPullThreshold];
  if (v37)
  {
    if (self->_trailingAction && (self->_selectedItemIndex + 1 == self->_numberOfItems ? (BOOL v39 = v38) : (BOOL v39 = 0), v39))
    {
      uint64_t v117 = 0x100000000;
      int64_t v40 = 3;
      int v116 = 1;
    }
    else
    {
      int v116 = 0;
      uint64_t v117 = 0x100000000;
      int64_t v40 = 5;
    }
  }
  else
  {
    uint64_t v117 = 0;
    int v116 = 0;
    int64_t v40 = 2;
  }
LABEL_41:
  self->_int64_t selectionGestureState = v40;
  [(SFCapsuleCollectionView *)self _layOutToolbar];
  *(void *)buf = 0;
  v148 = buf;
  uint64_t v149 = 0x3032000000;
  v150 = __Block_byref_object_copy_;
  v151 = __Block_byref_object_dispose_;
  id v152 = 0;
  id v41 = (void *)MEMORY[0x1E4FB1EB0];
  v143[0] = MEMORY[0x1E4F143A8];
  v143[1] = 3221225472;
  v143[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_137;
  v143[3] = &unk_1E54EA058;
  v143[4] = self;
  int64_t v146 = v121;
  id v144 = v124;
  v145 = buf;
  objc_msgSend(v41, "safari_performWithoutRetargetingAnimations:", v143);
  id v42 = objc_alloc_init(SFTransitionCoordinator);
  objc_storeWeak((id *)&self->_currentTransitionCoordinator, v42);
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2_138;
  v142[3] = &unk_1E54EA080;
  v142[4] = self;
  [(SFTransitionCoordinator *)v42 addAnimations:v142];
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3_139;
  v141[3] = &unk_1E54EA0A8;
  v141[4] = self;
  v141[5] = buf;
  [(SFTransitionCoordinator *)v42 addCompletion:v141];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  uint64_t v43 = self->_gestureObservers;
  uint64_t v44 = [(NSHashTable *)v43 countByEnumeratingWithState:&v137 objects:v169 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v138;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v138 != v45) {
          objc_enumerationMutation(v43);
        }
        id v47 = *(void **)(*((void *)&v137 + 1) + 8 * m);
        if (objc_opt_respondsToSelector())
        {
          BOOL v48 = [(SFTransitionCoordinator *)v42 publicCoordinator];
          [v47 capsuleCollectionView:self willEndSelectionGestureWithCoordinator:v48];
        }
      }
      uint64_t v44 = [(NSHashTable *)v43 countByEnumeratingWithState:&v137 objects:v169 count:16];
    }
    while (v44);
  }

  [(SFCapsuleCollectionView *)self setSelectedItemIndex:v121];
  self->_previousVelocitdouble y = (CGPoint)*MEMORY[0x1E4F1DAD8];
  [(SFCapsuleCollectionView *)self _updateOffsetForPan];
  [(SFCapsuleCollectionView *)self pageWidth];
  double v50 = (double)v118 * v49 - v49 * (double)self->_selectedItemIndex;
  double v51 = 0.0;
  if (!_SFEqualWithEpsilon(v50, x, 0.1)) {
    double v51 = v9 / (v50 - x);
  }
  [(SFCapsuleCollectionView *)self setNeedsLayout];
  objc_storeWeak((id *)&self->_currentTransitionCoordinator, 0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_142;
  aBlock[3] = &unk_1E54E9858;
  double v52 = v42;
  v136 = v52;
  uint64_t v53 = _Block_copy(aBlock);
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2_143;
  v133[3] = &unk_1E54E9858;
  long long v54 = v52;
  v134 = v54;
  long long v55 = _Block_copy(v133);
  BOOL v56 = self->_linkedPageView;
  if (v56)
  {
    char v57 = [(SFCapsuleCollectionViewLinkablePageView *)v56 animationSettingsForCapsuleSelectionGesture];
    id v58 = v132;
    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3_144;
    v132[3] = &unk_1E54EA0D0;
    v132[4] = v55;
    [v57 performInteractive:0 animations:v53 completion:v132];
  }
  else
  {
    id v59 = (void *)MEMORY[0x1E4FB1EB0];
    CAFrameRateRange v174 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    minimuuint64_t m = v174.minimum;
    maximuuint64_t m = v174.maximum;
    float preferred = v174.preferred;
    id v58 = v131;
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_4;
    v131[3] = &unk_1E54E9D78;
    v131[4] = v55;
    *(float *)&double v63 = minimum;
    *(float *)&double v64 = maximum;
    *(float *)&double v65 = preferred;
    objc_msgSend(v59, "sf_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:preferredFrameRateRange:animations:completion:", 2, v53, v131, 0.0, v51, v63, v64, v65);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((v117 & 0x100000000) == 0
    && ([(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView drivesCapsuleSelection] & 1) == 0&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained capsuleCollectionView:self didSelectItemAtIndex:v121];
  }
  if (v117)
  {
    double v66 = self->_topAction;
    id v67 = objc_alloc_init(MEMORY[0x1E4FB1690]);
    [v67 sendAction:v66];
  }
  if (v116)
  {
    id v68 = [*p_items lastObject];
    id v69 = [v68 capsuleView];
    uint64_t v70 = [v69 contentView];

    BOOL v71 = self->_trailingAction;
    [v70 sendAction:v71];
  }
  v122 = v55;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  double v72 = self->_gestureObservers;
  uint64_t v73 = [(NSHashTable *)v72 countByEnumeratingWithState:&v127 objects:v168 count:16];
  if (v73)
  {
    uint64_t v74 = *(void *)v128;
    do
    {
      for (uint64_t n = 0; n != v73; ++n)
      {
        if (*(void *)v128 != v74) {
          objc_enumerationMutation(v72);
        }
        id v76 = *(void **)(*((void *)&v127 + 1) + 8 * n);
        if (objc_opt_respondsToSelector()) {
          [v76 capsuleCollectionViewDidEndSelectionGesture:self];
        }
      }
      uint64_t v73 = [(NSHashTable *)v72 countByEnumeratingWithState:&v127 objects:v168 count:16];
    }
    while (v73);
  }

  self->_int64_t selectionGestureState = 0;
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_5;
  v126[3] = &unk_1E54E9858;
  v126[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v126 animations:0.15];
  [(SFCapsuleCollectionView *)self _setUpdateRequestActive:0];

  _Block_object_dispose(buf, 8);
LABEL_126:
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layOutItems:*(void *)(*(void *)(a1 + 32) + 1064) atIndexes:*(void *)(*(void *)(a1 + 32) + 1056) selectedItemIndex:*(void *)(*(void *)(a1 + 32) + 984)];
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCapsuleAlpha];
  id v2 = *(void **)(a1 + 32);

  return [v2 _layOutToolbar];
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __42__SFCapsuleCollectionView__didReceivePan___block_invoke_137(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(*(void *)(a1 + 32) + 1056);
  id v9 = (id)[v2 mutableCopy];
  double v4 = [*(id *)(a1 + 32) _indexesOfVisibleItemsWithSelectedItemIndex:*(void *)(a1 + 56)];
  [v9 addIndexes:v4];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 1064) objectsAtIndexes:v9];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 32) _incrementAnimationCountForItems:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  double v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 1056) mutableCopy];
  [v8 removeIndexes:v3];
  [*(id *)(a1 + 32) _layOutItems:*(void *)(*(void *)(a1 + 32) + 1064) atIndexes:v8 selectedItemIndex:*(void *)(*(void *)(a1 + 32) + 984)];
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2_138(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3_139(uint64_t a1)
{
  [*(id *)(a1 + 32) _decrementAnimationCountForItems:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(a1 + 32) _updateCanBlurCapsules];
  id v2 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_18C354000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PanGesture", "", v3, 2u);
  }
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_142(uint64_t a1)
{
  [*(id *)(a1 + 32) disableKeyframeAnimations];
  id v2 = *(void **)(a1 + 32);

  return [v2 invokeAnimations];
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2_143(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeCompletion];
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCapsuleAlpha];
}

- (void)_setUpdateRequestActive:(BOOL)a3
{
  if (a3) {
    MEMORY[0x1F41670E8](&panningUpdateRequest, 1638401);
  }
  else {
    MEMORY[0x1F41670F0](&panningUpdateRequest, 1638401);
  }
}

- (BOOL)isInteractivelySelectingItem
{
  return self->_selectionGestureState == 1;
}

- (BOOL)_isSendingTrailingAction
{
  return [(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView drivesCapsuleSelection]&& ([(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView isSendingTrailingAction] & 1) != 0|| self->_selectionGestureState == 3;
}

- (double)_percentToActivatingTopActionWithTranslation:(CGPoint)a3
{
  if (!self->_topAction) {
    return 0.0;
  }
  double y = a3.y;
  [(SFCapsuleCollectionView *)self bounds];
  CGFloat Height = CGRectGetHeight(v6);
  return fmax(SFRubberBandOffsetForOffset(y / (Height / -3.0), 0.0, 1.0, 1.0), 0.0);
}

- (double)_swipeTranslationFactorWithPercentToTopAction:(double)a3
{
  if (!self->_topAction) {
    return 1.0;
  }
  double v3 = _SFClamp(a3, 0.0, 1.0);
  return 1.0 - v3 * v3;
}

- (CGPoint)selectedCapsuleOffset
{
  double x = self->_offsetForPan.x;
  double y = self->_offsetForPan.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setItemsAreHidden:(BOOL)a3
{
  if (self->_itemsAreHidden != a3)
  {
    self->_BOOL itemsAreHidden = a3;
    [(SFCapsuleCollectionView *)self setNeedsLayout];
  }
}

- (void)setShowingAlternateToolbarContent:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(SFCapsuleCollectionView *)self _shouldShowAlternateToolbarContent];
  self->_showingAlternateToolbarContent = a3;
  if (v7 != [(SFCapsuleCollectionView *)self _shouldShowAlternateToolbarContent])
  {
    [(SFCapsuleCollectionView *)self setNeedsLayout];
    [(SFCapsuleCollectionView *)self _updateShowsMinimizedProgressView];
    if (v4)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __70__SFCapsuleCollectionView_setShowingAlternateToolbarContent_animated___block_invoke;
      _OWORD v8[3] = &unk_1E54E9858;
      void v8[4] = self;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 2, v8, 0);
    }
  }
}

uint64_t __70__SFCapsuleCollectionView_setShowingAlternateToolbarContent_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setSelectedItemUsesLiftedPreviewAppearance:(BOOL)a3 animator:(id)a4
{
  if (self->_selectedItemUsesLiftedPreviewAppearance != a3)
  {
    self->_selectedItemUsesLiftedPreviewAppearance = a3;
    items = self->_items;
    selectedItemIndedouble x = self->_selectedItemIndex;
    id v8 = a4;
    id v9 = [(NSArray *)items objectAtIndexedSubscript:selectedItemIndex];
    double v10 = [v9 capsuleView];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _DWORD v12[2] = __79__SFCapsuleCollectionView_setSelectedItemUsesLiftedPreviewAppearance_animator___block_invoke;
    v12[3] = &unk_1E54E9AB0;
    id v13 = v10;
    double v14 = self;
    BOOL v15 = a3;
    id v11 = v10;
    [v8 addAnimations:v12];
  }
}

uint64_t __79__SFCapsuleCollectionView_setSelectedItemUsesLiftedPreviewAppearance_animator___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 40) selectedItemIsMinimized] && *(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4FB1618] clearColor];
  }
  double v3 = (void *)v2;
  [*(id *)(a1 + 32) setBackgroundColor:v2];

  objc_msgSend(*(id *)(a1 + 32), "setUsesPlatterEffect:", objc_msgSend(*(id *)(a1 + 40), "_selectedItemShouldUsePlatterEffect"));
  [*(id *)(a1 + 40) _updateVisualEffectGroupName];
  BOOL v4 = *(void **)(a1 + 40);

  return [v4 _updateCapsuleAlpha];
}

- (double)_overscrollDistanceForTopEdge
{
  return fmax(self->_minimizationStartingDragOffset- self->_minimizationLastDragOffset- self->_distanceToTopEdgeAtMinimizationBegan, 0.0);
}

- (double)_distanceToTopEdgeIncludingDeceleration:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained capsuleCollectionView:self distanceToTopEdgeIncludingDeceleration:v3];
    double v7 = v6;
  }
  else
  {
    double v7 = 1.79769313e308;
  }

  return v7;
}

- (double)_minimizedContentScale
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained capsuleCollectionViewMinimizedContentScale:self];
    double v5 = v4;
  }
  else
  {
    [(SFCapsuleCollectionView *)self capsuleFrame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [(SFCapsuleCollectionView *)self minimizedCapsuleFrame];
    double Height = CGRectGetHeight(v16);
    v17.origin.double x = v7;
    v17.origin.double y = v9;
    v17.size.CGFloat width = v11;
    v17.size.CGFloat height = v13;
    double v5 = Height / CGRectGetHeight(v17);
  }

  return v5;
}

- (double)_insetForCapsuleEdgeWithInsets:(UIEdgeInsets)a3
{
  bottouint64_t m = a3.bottom;
  double top = a3.top;
  if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop]) {
    return top;
  }
  else {
    return bottom;
  }
}

- (void)_sendMinimizationDidUpdateToObservers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->_gestureObservers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "capsuleCollectionViewDidUpdateMinimizationGesture:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_sendMinimizationDidEndToObservers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->_gestureObservers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "capsuleCollectionViewDidEndMinimizationGesture:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)_shouldToggleMinimizedWithTranslation:(double)a3 velocity:(double)a4 gestureEnded:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(SFCapsuleCollectionView *)self selectedItemIsMinimized])
  {
    double v9 = fabs(a4);
    if ((self->_minimizationFlags & 2) == 0) {
      double v9 = a4;
    }
    if (v5 && v9 >= 250.0) {
      return 1;
    }
    if (v5
      && [(SFCapsuleCollectionView *)self _layoutStyleIsTop]
      && ([(SFCapsuleCollectionView *)self _overscrollDistanceForTopEdge], v9 != 0.0))
    {
      return 1;
    }
    else
    {
      BOOL v15 = ![(SFCapsuleCollectionView *)self _layoutStyleIsTop];
      return a3 >= 62.0 && v15;
    }
  }
  else
  {
    [(SFCapsuleCollectionView *)self obscuredInsetsForState:0];
    double v12 = v11;
    [(SFCapsuleCollectionView *)self obscuredInsetsForState:1];
    double v14 = v12 - v13;
    if (![(SFCapsuleCollectionView *)self _layoutStyleIsTop] || v5)
    {
      [(SFCapsuleCollectionView *)self _distanceToTopEdgeIncludingDeceleration:1];
      return v16 >= v14 && a3 >= 31.0;
    }
    else
    {
      return v14 <= a3;
    }
  }
}

- (BOOL)_translationIsAlmostHorizontal:(CGPoint)a3
{
  if (a3.y < 0.0) {
    a3.double y = -a3.y;
  }
  if (a3.x < 0.0) {
    a3.double x = -a3.x;
  }
  return a3.y <= a3.x * self->_verticalSwipeThreshold;
}

- (void)_setCapsuleSafeAreaInsetsFrozen:(BOOL)a3
{
  items = self->_items;
  indexesOfLoadedViews = self->_indexesOfLoadedViews;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SFCapsuleCollectionView__setCapsuleSafeAreaInsetsFrozen___block_invoke;
  v5[3] = &__block_descriptor_33_e44_v32__0__SFCapsuleCollectionViewItem_8Q16_B24l;
  BOOL v6 = a3;
  [(NSArray *)items enumerateObjectsAtIndexes:indexesOfLoadedViews options:0 usingBlock:v5];
}

void __59__SFCapsuleCollectionView__setCapsuleSafeAreaInsetsFrozen___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 32);
  id v3 = [a2 capsuleView];
  [v3 _setSafeAreaInsetsFrozen:v2];
}

- (void)beginDraggingWithOffset:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_items count])
  {
    if (self->_selectedItemState != 2 && !self->_forceHidden)
    {
      BOOL v5 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
      char v6 = [v5 capsuleIsDetached];

      if ((v6 & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ![WeakRetained capsuleCollectionViewAllowsMinimizationGesture:self])
        {
LABEL_29:

          return;
        }
        if (objc_opt_respondsToSelector()) {
          char v8 = [WeakRetained capsuleCollectionViewBoundaryEdgesForScrollableContent:self];
        }
        else {
          char v8 = 0;
        }
        BOOL v9 = [(SFCapsuleCollectionView *)self selectedItemIsMinimized];
        self->_unint64_t minimizationFlags = 1;
        if (v9 && (v8 & 4) != 0 && (v8 & 1) == 0)
        {
          unint64_t v10 = 7;
          unint64_t v11 = 3;
        }
        else
        {
          unint64_t v10 = 5;
          if ((v8 & 5) != 4)
          {
LABEL_17:
            if (v9) {
              self->_unint64_t minimizationFlags = v10;
            }
            self->_double minimizationStartingDragOffset = a3;
            [(SFCapsuleCollectionView *)self _distanceToTopEdgeIncludingDeceleration:0];
            self->_distanceToTopEdgeAtMinimizationBegauint64_t n = v12;
            long long v19 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            double v13 = self->_gestureObservers;
            uint64_t v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v20;
              do
              {
                uint64_t v17 = 0;
                do
                {
                  if (*(void *)v20 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  double v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
                  if (objc_opt_respondsToSelector()) {
                    objc_msgSend(v18, "capsuleCollectionViewDidBeginMinimizationGesture:", self, (void)v19);
                  }
                  ++v17;
                }
                while (v15 != v17);
                uint64_t v15 = [(NSHashTable *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
              }
              while (v15);
            }

            goto LABEL_29;
          }
          unint64_t v11 = 0;
          unint64_t v10 = 4;
        }
        self->_unint64_t minimizationFlags = v11;
        goto LABEL_17;
      }
    }
  }
}

- (void)endDraggingWithTargetOffset:(double)a3 velocity:(double)a4
{
}

- (void)endScrolling
{
}

uint64_t __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackdropHeight];
}

uint64_t __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEndBackdropHeightAnimation];
}

void __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_3(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _shouldUseNormalLayoutForMinimizedCapsule];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void *)(v3 + 968);
  }
  BOOL v5 = [*(id *)(v3 + 1064) objectAtIndexedSubscript:*(void *)(v3 + 984)];
  char v6 = [v5 capsuleView];
  uint64_t v7 = [v6 state];

  if (v7 != v4)
  {
    char v8 = *(void **)(a1 + 32);
    uint64_t v9 = v8[123];
    [v8 _updateStateFlagsForContentViewAtIndex:v9];
  }
}

uint64_t __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackdropHeight];
}

uint64_t __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _sendMinimizationDidUpdateToObservers];
  }
  return result;
}

- (void)_didReceiveDismissPan:(id)a3
{
  id v10 = a3;
  if ([v10 state] == 2)
  {
    [v10 translationInView:self];
    double v5 = v4;
    char v6 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
    uint64_t v7 = [v6 capsuleView];
    [v7 frame];
    double Height = CGRectGetHeight(v12);

    if (v5 >= Height * 0.5)
    {
      [v10 setEnabled:0];
      [v10 setEnabled:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained capsuleCollectionViewWillHideKeyboard:self];
    }
  }
}

- (void)setSelectedItemState:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)setSelectedItemState:(int64_t)a3 options:(int64_t)a4 animated:(BOOL)a5
{
  if (self->_selectedItemState != a3)
  {
    BOOL v5 = a5;
    -[SFCapsuleCollectionView _setSelectedItemStateWithoutPerformingTransition:options:](self, "_setSelectedItemStateWithoutPerformingTransition:options:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    p_currentTransitionCoordinator = &self->_currentTransitionCoordinator;
    objc_storeWeak((id *)&self->_currentTransitionCoordinator, v9);
    char v8 = [(SFCapsuleCollectionView *)self window];
    [v9 performTransitionWithAnimation:v5 inContextOfContainerView:v8];

    objc_storeWeak((id *)p_currentTransitionCoordinator, 0);
  }
}

- (id)_setSelectedItemStateWithoutPerformingTransition:(int64_t)a3 options:(int64_t)a4
{
  uint64_t v7 = [(SFCapsuleCollectionView *)self _coordinatorForUpdatingSelectedItemFromState:self->_selectedItemState toState:a3];
  char v8 = (a3 == 1) ^ (self->_selectedItemState != 1);
  objc_storeWeak((id *)&self->_currentTransitionCoordinator, v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v10 = [v7 publicCoordinator];
    [WeakRetained capsuleCollectionView:self selectedItemWillChangeToState:a3 options:a4 coordinator:v10];
  }
  objc_storeWeak((id *)&self->_currentTransitionCoordinator, 0);
  unint64_t v11 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
  CGRect v12 = [v11 capsuleView];

  if (self->_minimizationStyle) {
    char v13 = 1;
  }
  else {
    char v13 = v8;
  }
  if ((v13 & 1) == 0)
  {
    uint64_t v14 = [v7 publicCoordinator];
    [v12 willChangeToMinimized:a3 == 1 coordinator:v14];
  }
  selectedItemAccessoryViews = self->_selectedItemAccessoryViews;
  uint64_t v16 = [NSNumber numberWithInteger:a3];
  uint64_t v17 = [(NSMutableDictionary *)selectedItemAccessoryViews objectForKeyedSubscript:v16];
  double v18 = [v7 publicCoordinator];
  [v12 setAccessoryView:v17 coordinator:v18];

  self->_int64_t selectedItemState = a3;
  [(SFCapsuleCollectionView *)self _updateShowsMinimizedProgressView];
  if (self->_keyboardHeight != 0.0 && self->_backdropHeightAnimationCount)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __84__SFCapsuleCollectionView__setSelectedItemStateWithoutPerformingTransition_options___block_invoke;
    _OWORD v20[3] = &unk_1E54E9858;
    void v20[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateByRetargetingAnimations:v20 completion:0];
  }
  if ((v8 & 1) == 0 && self->_numberOfItems) {
    [(SFCapsuleCollectionView *)self _performVisualEffectTransitionWithCoordinator:v7];
  }

  return v7;
}

uint64_t __84__SFCapsuleCollectionView__setSelectedItemStateWithoutPerformingTransition_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackdropHeight];
}

- (void)_performVisualEffectTransitionWithCoordinator:(id)a3
{
  if (self->_minimizationStyle != 1)
  {
    id v4 = a3;
    [(SFCapsuleCollectionView *)self beginVisualEffectTransition];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__SFCapsuleCollectionView__performVisualEffectTransitionWithCoordinator___block_invoke;
    v5[3] = &unk_1E54E9858;
    void v5[4] = self;
    [v4 addCompletion:v5];
  }
}

uint64_t __73__SFCapsuleCollectionView__performVisualEffectTransitionWithCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endVisualEffectTransition];
}

- (id)_coordinatorForUpdatingSelectedItemFromState:(int64_t)a3 toState:(int64_t)a4
{
  int v6 = a4 == 1;
  int v7 = a3 == 1;
  char v8 = v7 ^ v6;
  if (v7 != v6) {
    [(SFCapsuleCollectionView *)self _willBeginBackdropHeightAnimation];
  }
  id v9 = [SFTransitionCoordinator alloc];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke;
  v16[3] = &unk_1E54EA080;
  void v16[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke_2;
  v14[3] = &unk_1E54EA168;
  char v15 = v8;
  v14[4] = self;
  v14[5] = a3;
  id v10 = [(SFTransitionCoordinator *)v9 initWithAnimations:v16 completion:v14];
  unint64_t v11 = [(SFTransitionCoordinator *)v10 publicCoordinator];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke_3;
  v13[3] = &unk_1E54EA080;
  v13[4] = self;
  [v11 addRetargetableAnimations:v13];

  return v10;
}

void *__80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateStateFlagsForContentViewAtIndex:*(void *)(*(void *)(a1 + 32) + 984)];
  [*(id *)(a1 + 32) _applyToolbarTheme];
  [*(id *)(a1 + 32) setNeedsLayout];
  uint64_t result = *(void **)(a1 + 32);
  if (result[121] == 2)
  {
    return (void *)[result reloadInputViews];
  }
  return result;
}

void __80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _didEndBackdropHeightAnimation];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 968) != 2)
  {
    uint64_t v3 = *(void **)(v2 + 520);
    if (v3)
    {
      *(void *)(v2 + 520) = 0;

      [*(id *)(a1 + 32) reloadInputViews];
    }
  }
  if (*(void *)(a1 + 40) == 2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 968) != 2)
    {
      [*(id *)(v4 + 512) removeFromSuperview];
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(void **)(v5 + 512);
      *(void *)(v5 + 512) = 0;
    }
  }
}

uint64_t __80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackdropHeight];
}

- (void)_updateBackdropHeight
{
  [(SFCapsuleCollectionView *)self _obscuredInsetsIgnoringAnimation];
  double v4 = v3;
  double v6 = v5;
  [(UIViewFloatAnimatableProperty *)self->_bottomBackdropHeight value];
  if (!_SFEqualWithEpsilon(v6, v7, 0.1)) {
    [(UIViewFloatAnimatableProperty *)self->_bottomBackdropHeight setValue:v6];
  }
  [(UIViewFloatAnimatableProperty *)self->_topBackdropHeight value];
  if (!_SFEqualWithEpsilon(v4, v8, 0.1))
  {
    topBackdropdouble Height = self->_topBackdropHeight;
    [(UIViewFloatAnimatableProperty *)topBackdropHeight setValue:v4];
  }
}

- (void)_willBeginBackdropHeightAnimation
{
  v23[2] = *MEMORY[0x1E4F143B8];
  int64_t backdropHeightAnimationCount = self->_backdropHeightAnimationCount;
  self->_int64_t backdropHeightAnimationCount = backdropHeightAnimationCount + 1;
  if (backdropHeightAnimationCount <= 0)
  {
    double v4 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    p_bottomBackdropdouble Height = &self->_bottomBackdropHeight;
    bottomBackdropdouble Height = self->_bottomBackdropHeight;
    self->_bottomBackdropdouble Height = v4;

    double v7 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    p_topBackdropdouble Height = &self->_topBackdropHeight;
    topBackdropdouble Height = self->_topBackdropHeight;
    self->_topBackdropdouble Height = v7;

    [(SFCapsuleCollectionView *)self _obscuredInsetsIgnoringAnimation];
    double v11 = v10;
    double v13 = v12;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__SFCapsuleCollectionView__willBeginBackdropHeightAnimation__block_invoke;
    v22[3] = &unk_1E54EA190;
    v22[4] = self;
    *(double *)&v22[5] = v10;
    v22[6] = v14;
    *(double *)&v22[7] = v12;
    v22[8] = v15;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v22];
    self->_double topBackdropHeightPresentationValue = v11;
    [(UIViewFloatAnimatableProperty *)self->_bottomBackdropHeight setValue:v13];
    [(UIViewFloatAnimatableProperty *)self->_topBackdropHeight setValue:self->_topBackdropHeightPresentationValue];
    objc_initWeak(&location, self);
    uint64_t v16 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v17 = *p_topBackdropHeight;
    v23[0] = *p_bottomBackdropHeight;
    v23[1] = v17;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__SFCapsuleCollectionView__willBeginBackdropHeightAnimation__block_invoke_2;
    _OWORD v19[3] = &unk_1E54EA1B8;
    objc_copyWeak(&v20, &location);
    [v16 _createTransformerWithInputAnimatableProperties:v18 presentationValueChangedCallback:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

uint64_t __60__SFCapsuleCollectionView__willBeginBackdropHeightAnimation__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 528) frame];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 32) bounds];
  CGFloat Height = CGRectGetHeight(v11);
  double v7 = *(void **)(*(void *)(a1 + 32) + 528);
  double v8 = Height - *(double *)(a1 + 56);

  return objc_msgSend(v7, "setFrame:", v3, v8, v5);
}

void __60__SFCapsuleCollectionView__willBeginBackdropHeightAnimation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[100];
    if (v3)
    {
      double v12 = v2;
      [v3 presentationValue];
      double v5 = _SFRoundFloatToPixels(v4);
      [v12 bounds];
      CGFloat x = v14.origin.x;
      CGFloat y = v14.origin.y;
      CGFloat width = v14.size.width;
      CGFloat height = v14.size.height;
      CGFloat v10 = CGRectGetHeight(v14) - v5;
      v15.origin.CGFloat x = x;
      v15.origin.CGFloat y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      objc_msgSend(v12[66], "setFrame:", 0.0, v10, CGRectGetWidth(v15), v5);
      [v12[101] presentationValue];
      *((double *)v12 + 102) = _SFRoundFloatToPixels(v11);
      [v12 setNeedsLayout];
      [v12 _sendMinimizationDidUpdateToObservers];
      double v2 = v12;
    }
  }
}

- (void)_didEndBackdropHeightAnimation
{
  [(SFCapsuleCollectionView *)self obscuredInsets];
  int64_t v7 = self->_backdropHeightAnimationCount - 1;
  self->_int64_t backdropHeightAnimationCount = v7;
  if (!v7)
  {
    double v8 = v3;
    double v9 = v4;
    double v10 = v5;
    double v11 = v6;
    [(UIViewFloatAnimatableProperty *)self->_bottomBackdropHeight invalidate];
    bottomBackdropCGFloat Height = self->_bottomBackdropHeight;
    self->_bottomBackdropCGFloat Height = 0;

    [(UIViewFloatAnimatableProperty *)self->_topBackdropHeight invalidate];
    topBackdropCGFloat Height = self->_topBackdropHeight;
    self->_topBackdropCGFloat Height = 0;

    [(SFCapsuleCollectionView *)self obscuredInsets];
    if (v9 != v17 || v8 != v14 || v11 != v16 || v10 != v15) {
      [(SFCapsuleCollectionView *)self _sendMinimizationDidUpdateToObservers];
    }
    [(SFCapsuleCollectionView *)self setNeedsLayout];
  }
}

uint64_t __61__SFCapsuleCollectionView_setShouldDismissContent_withDelay___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 856) = *(void *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) layoutIfNeeded];
  *(void *)(*(void *)(a1 + 32) + 856) = 0;
  return result;
}

uint64_t __61__SFCapsuleCollectionView_setShouldDismissContent_withDelay___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t result = *(void *)(result + 32);
    if (*(unsigned char *)(result + 867))
    {
      if (*(void *)(result + 968) == 1) {
        return [(id)result setSelectedItemState:0 animated:0];
      }
    }
  }
  return result;
}

void *__46__SFCapsuleCollectionView__updateToolbarAlpha__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1000) setAlpha:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 528) setAlpha:*(double *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 760) setAlpha:*(double *)(a1 + 56)];
  uint64_t result = *(void **)(a1 + 32);
  if (result[95])
  {
    return (void *)[result _applyToolbarTheme];
  }
  return result;
}

- (void)setToolbarOffsetForPinchTransition:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_toolbarOffsetForPinchTransition, a3);
    [(SFCapsuleCollectionView *)self setNeedsLayout];
  }
}

- (void)setAlternateToolbarContentProvider:(id)a3
{
}

- (void)installAlternateToolbarContentIfNeeded
{
  if (!self->_alternateToolbarContentView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_alternateToolbarContentProvider);
    double v4 = WeakRetained;
    if (WeakRetained)
    {
      id v5 = [WeakRetained toolbarContentViewForCapsuleCollectionView:self];
      alternateToolbarContentView = self->_alternateToolbarContentView;
      self->_alternateToolbarContentView = v5;

      [v4 capsuleCollectionView:self heightForToolbarContentView:self->_alternateToolbarContentView];
      self->_double alternateToolbarContentHeight = v7;
      [(UIView *)self->_contentView insertSubview:self->_alternateToolbarContentView above:self->_toolbarBackdropView];
      [(SFCapsuleCollectionView *)self setNeedsLayout];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __65__SFCapsuleCollectionView_installAlternateToolbarContentIfNeeded__block_invoke;
      _OWORD v8[3] = &unk_1E54E9858;
      void v8[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
    }
  }
}

uint64_t __65__SFCapsuleCollectionView_installAlternateToolbarContentIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)relinquishAlternateToolbarContentIfNeeded
{
  if (self->_alternateToolbarContentView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_alternateToolbarContentProvider);
    [(UIView *)self->_alternateToolbarContentView setAlpha:1.0];
    [(UIView *)self->_alternateToolbarContentView removeFromSuperview];
    [WeakRetained capsuleCollectionView:self relinquishToolbarContentView:self->_alternateToolbarContentView];
    alternateToolbarContentView = self->_alternateToolbarContentView;
    self->_alternateToolbarContentView = 0;

    self->_double alternateToolbarContentHeight = 0.0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__SFCapsuleCollectionView_relinquishAlternateToolbarContentIfNeeded__block_invoke;
    v5[3] = &unk_1E54E9858;
    void v5[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  }
}

uint64_t __68__SFCapsuleCollectionView_relinquishAlternateToolbarContentIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layOutToolbar];
  double v2 = *(void **)(a1 + 32);

  return [v2 _updateToolbarAlpha];
}

- (id)toolbarContentViewForCapsuleCollectionView:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SFCapsuleCollectionView *)self _bottomBackdropFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SFCapsuleCollectionView *)self safeAreaInsets];
  double v14 = -[SFCapsuleCollectionViewBorrowedContentView initWithFrame:]([SFCapsuleCollectionViewBorrowedContentView alloc], "initWithFrame:", v6, v8, v10, v12 - v13);
  -[SFCapsuleCollectionViewBorrowedContentView setResizesFromOriginalToolbarFrame:](v14, "setResizesFromOriginalToolbarFrame:", [v4 layoutStyle] != self->_layoutStyle);
  [v4 addSubview:v14];
  double v15 = [MEMORY[0x1E4F1CA48] arrayWithObject:self->_toolbar];
  double v16 = [(SFCapsuleCollectionView *)self indexesOfVisibleItems];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __70__SFCapsuleCollectionView_toolbarContentViewForCapsuleCollectionView___block_invoke;
  v35[3] = &unk_1E54EA280;
  v35[4] = self;
  [v16 enumerateIndexesUsingBlock:v35];
  [(SFCapsuleCollectionView *)self layoutIfNeeded];
  [(SFCapsuleCollectionView *)self _layOutItems:self->_items atIndexes:v16 selectedItemIndex:self->_selectedItemIndex];
  double v17 = [MEMORY[0x1E4F1CA48] array];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __70__SFCapsuleCollectionView_toolbarContentViewForCapsuleCollectionView___block_invoke_2;
  v33[3] = &unk_1E54EA2A8;
  v33[4] = self;
  id v18 = v17;
  id v34 = v18;
  [v16 enumerateIndexesUsingBlock:v33];
  long long v19 = objc_msgSend(v18, "safari_mapObjectsUsingBlock:", &__block_literal_global_185);
  [v15 addObjectsFromArray:v19];

  [v15 addObjectsFromArray:v18];
  self->_BOOL contentBorrowed = 1;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v20 = v15;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        long double v25 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        double v26 = objc_msgSend(v25, "superview", (void)v29);
        [v25 frame];
        objc_msgSend(v26, "convertRect:toView:", v14);
        objc_msgSend(v25, "setFrame:");

        double v27 = [(SFCapsuleCollectionViewBorrowedContentView *)v14 contentView];
        [v27 addSubview:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v22);
  }

  return v14;
}

void __70__SFCapsuleCollectionView_toolbarContentViewForCapsuleCollectionView___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = *(id **)(a1 + 32);
  id v4 = [v3[133] objectAtIndexedSubscript:a2];
  [v3 _dequeueOrCreateViewForItem:v4 atIndex:a2];
}

void __70__SFCapsuleCollectionView_toolbarContentViewForCapsuleCollectionView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) detachViewForItemAtIndex:a2 forInternalBorrow:1];
  [v3 setHidden:0];
  [*(id *)(a1 + 40) addObject:v3];
}

uint64_t __70__SFCapsuleCollectionView_toolbarContentViewForCapsuleCollectionView___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 shadowView];
}

- (double)capsuleCollectionView:(id)a3 heightForToolbarContentView:(id)a4
{
  [(UIView *)self->_toolbarBackdropView frame];
  double Height = CGRectGetHeight(v7);
  [(UIView *)self _sf_bottomUnsafeAreaFrameForToolbar];
  return Height - CGRectGetHeight(v8);
}

- (void)capsuleCollectionView:(id)a3 relinquishToolbarContentView:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  self->_BOOL contentBorrowed = 0;
  [(SFCapsuleCollectionView *)self _updateToolbar];
  double v6 = [v5 contentView];
  CGRect v7 = [v6 subviews];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v13, "removeFromSuperview", (void)v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SFCapsuleCollectionView *)self reattachView:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(SFCapsuleCollectionView *)self _layOutItems:self->_items atIndexes:self->_indexesOfLoadedViews selectedItemIndex:self->_selectedItemIndex];
}

- (void)beginVisualEffectTransition
{
}

- (void)endVisualEffectTransition
{
}

- (CGRect)_detachedCapsuleSelectionRect
{
  id v3 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
  if ([v3 capsuleIsDetached])
  {
    id v4 = [v3 capsuleView];
    id v5 = [v4 superview];
    double v6 = [v4 layer];
    CGRect v7 = objc_msgSend(v6, "safari_presentationOrSelf");
    [v7 frame];
    objc_msgSend(v5, "convertRect:toView:", self);
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    [(SFCapsuleCollectionView *)self _selectedCapsuleFrame];
    v27.origin.CGFloat x = v9;
    v27.origin.CGFloat y = v11;
    v27.size.CGFloat width = v13;
    v27.size.CGFloat height = v15;
    CGRect v25 = CGRectUnion(v24, v27);
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGRect)_passthroughRect
{
  [(SFCapsuleCollectionView *)self _obscuredInsetsIgnoringAnimation];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(SFCapsuleCollectionView *)self _layoutStyleIsTop])
  {
    [(SFCapsuleCollectionView *)self _selectedCapsuleFrame];
    double v4 = fmax(v4, CGRectGetMaxY(v20));
    if ([(SFCapsuleCollectionView *)self selectedItemIsMinimized]) {
      double v4 = v4 + 5.0;
    }
  }
  else
  {
    [(SFCapsuleCollectionView *)self bounds];
    double Height = CGRectGetHeight(v21);
    [(SFCapsuleCollectionView *)self _selectedCapsuleFrame];
    double v8 = fmax(v8, Height - CGRectGetMinY(v22));
    if ([(SFCapsuleCollectionView *)self selectedItemIsMinimized]) {
      double v8 = v8 + 5.0;
    }
  }
  [(SFCapsuleCollectionView *)self bounds];
  double v13 = v6 + v12;
  double v15 = v4 + v14;
  double v17 = v16 - (v6 + v10);
  double v19 = v18 - (v8 + v4);
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  if (!self->_itemsAreHidden
    && ([(SFCapsuleCollectionView *)self isHidden] & 1) == 0
    && [(SFCapsuleCollectionView *)self isUserInteractionEnabled])
  {
    int64_t selectedItemState = self->_selectedItemState;
    if (!selectedItemState)
    {
      toolbar = self->_toolbar;
      -[UIView convertPoint:fromView:](toolbar, "convertPoint:fromView:", self, x, y);
      double v12 = -[UIView hitTest:withEvent:](toolbar, "hitTest:withEvent:", v8);
      double v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        -[SFCapsuleCollectionView hitTest:forCapsuleFrameWithEvent:](self, "hitTest:forCapsuleFrameWithEvent:", v8, x, y);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      double v4 = v14;

      goto LABEL_14;
    }
    if (selectedItemState != 2)
    {
      if (selectedItemState != 1) {
        goto LABEL_14;
      }
      uint64_t v10 = -[SFCapsuleCollectionView hitTest:forCapsuleFrameWithEvent:](self, "hitTest:forCapsuleFrameWithEvent:", v8, x, y);
      goto LABEL_12;
    }
    double v15 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
    double v16 = [v15 capsuleView];
    [v16 frame];
    v21.double x = x;
    v21.double y = y;
    BOOL v17 = CGRectContainsPoint(v22, v21);

    if (v17)
    {
      v19.receiver = self;
      v19.super_class = (Class)SFCapsuleCollectionView;
      uint64_t v10 = -[SFCapsuleCollectionView hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v8, x, y);
LABEL_12:
      double v4 = (void *)v10;
      goto LABEL_14;
    }
  }
  double v4 = 0;
LABEL_14:

  return v4;
}

- (id)hitTest:(CGPoint)a3 forCapsuleFrameWithEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(SFCapsuleCollectionView *)self _detachedCapsuleSelectionRect];
  v20.double x = x;
  v20.double y = y;
  if (!CGRectContainsPoint(v22, v20))
  {
    [(SFCapsuleCollectionView *)self _passthroughRect];
    v21.double x = x;
    v21.double y = y;
    if (CGRectContainsPoint(v23, v21))
    {
      uint64_t v10 = 0;
      goto LABEL_15;
    }
    v18.receiver = self;
    v18.super_class = (Class)SFCapsuleCollectionView;
    -[SFCapsuleCollectionView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
    CGFloat v11 = (SFCapsuleCollectionView *)objc_claimAutoreleasedReturnValue();
    id v8 = v11;
    if (v11)
    {
      double v12 = v11;
      if (v11 == self)
      {
LABEL_13:
        double v9 = v12;
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v13 = [(SFCapsuleCollectionView *)self selectedItemIsMinimized];
      double v12 = 0;
      if (!self) {
        goto LABEL_13;
      }
      double v12 = 0;
      if (!v13) {
        goto LABEL_13;
      }
    }
    id v14 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
    double v15 = [v14 capsuleView];
    int v16 = [(SFCapsuleCollectionView *)v8 isDescendantOfView:v15];

    if (v16) {
      double v12 = v8;
    }
    else {
      double v12 = self;
    }
    goto LABEL_13;
  }
  id v8 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedItemIndex];
  double v9 = [(SFCapsuleCollectionView *)v8 capsuleView];
LABEL_14:
  uint64_t v10 = v9;

LABEL_15:

  return v10;
}

id __69__SFCapsuleCollectionView__buttonPointerStyleProviderForContentView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    double v9 = [v5 superview];
    [v5 bounds];
    objc_msgSend(v9, "convertRect:fromView:", v5);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    if (objc_opt_respondsToSelector())
    {
      [v8 horizontalPointerPaddingForButton:v5];
      double v19 = v18;
    }
    else
    {
      double v19 = *MEMORY[0x1E4F1DAD8];
    }
    [v8 bounds];
    double Height = CGRectGetHeight(v32);
    v33.origin.double x = v11;
    v33.origin.double y = v13;
    v33.size.double width = v15;
    v33.size.CGFloat height = v17;
    CGFloat v22 = 2.0 - fmax((Height - CGRectGetHeight(v33)) * 0.5, 0.0);
    v34.origin.double x = v11;
    v34.origin.double y = v13;
    v34.size.double width = v15;
    v34.size.CGFloat height = v17;
    CGRect v35 = CGRectInset(v34, 2.0 - v19, v22);
    double x = v35.origin.x;
    double y = v35.origin.y;
    double width = v35.size.width;
    double v26 = v35.size.height;
    CGRect v27 = (void *)MEMORY[0x1E4FB1AE0];
    [WeakRetained capsuleBackgroundCornerRadius];
    long long v29 = objc_msgSend(v27, "shapeWithRoundedRect:cornerRadius:", x, y, width, v26, v28 + -2.0);
    CGPoint v20 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v29];
  }
  else
  {
    CGPoint v20 = 0;
  }

  return v20;
}

- (void)_animateSwitchingLinkedPageViewToItemAtIndex:(int64_t)a3
{
  id obj = objc_alloc_init(SFTransitionCoordinator);
  id v5 = [(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView animationSettingsForCapsuleSelectionUpdate];
  [(SFTransitionCoordinator *)obj setSpringAnimationBehavior:v5];

  objc_storeWeak((id *)&self->_currentTransitionCoordinator, obj);
  [(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView animateSwitchingToItemAtIndex:a3];
  objc_storeWeak((id *)&self->_currentTransitionCoordinator, 0);
}

- (double)_scaleFromLinkedPageView
{
  [(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView frameForItemLinkedToCapsuleAtIndex:self->_selectedItemIndex];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  BOOL IsNull = CGRectIsNull(v10);
  double result = 1.0;
  if (!IsNull)
  {
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    double v9 = CGRectGetWidth(v11);
    [(SFCapsuleCollectionView *)self bounds];
    return v9 / CGRectGetWidth(v12);
  }
  return result;
}

- (CGPoint)_offsetForPanFromLinkedPageView
{
  [(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView frameForItemLinkedToCapsuleAtIndex:self->_selectedItemIndex];
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  if (CGRectIsNull(v30))
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [(SFCapsuleCollectionView *)self capsuleFrame];
    UIRectGetCenter();
    double v28 = v9;
    double v26 = v10;
    [(SFCapsuleCollectionView *)self bounds];
    CGFloat v11 = v31.origin.x;
    CGFloat v12 = v31.origin.y;
    CGFloat v13 = v31.size.width;
    CGFloat v14 = v31.size.height;
    double v27 = v28 / CGRectGetWidth(v31);
    v32.origin.CGFloat x = v11;
    v32.origin.CGFloat y = v12;
    v32.size.CGFloat width = v13;
    v32.size.CGFloat height = v14;
    double v15 = v26 / CGRectGetHeight(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v33);
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double v17 = MinX + CGRectGetWidth(v34) * v27;
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v35);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double v19 = MinY + CGRectGetHeight(v36) * v15;
    [(SFCapsuleCollectionView *)self pageWidth];
    double v21 = v20;
    [(SFCapsuleCollectionViewLinkablePageView *)self->_linkedPageView pageWidth];
    double v8 = v19 - v26;
    double v23 = v21 / v22;
    [(SFCapsuleCollectionView *)self bounds];
    CGFloat v24 = CGRectGetHeight(v37);
    double v7 = (v17 - v28) * _SFInterpolate(v23, 1.0, fmax(fmin(fabs(v8 / (v24 * 0.25)), 1.0), 0.0));
  }
  double v25 = v8;
  result.CGFloat y = v25;
  result.CGFloat x = v7;
  return result;
}

- (SFCapsuleCollectionViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SFCapsuleCollectionViewDataSource *)WeakRetained;
}

- (_SFBarTheme)theme
{
  return self->_theme;
}

- (_SFBarTheme)minimizedTheme
{
  return self->_minimizedTheme;
}

- (double)focusedCapsuleTopOffset
{
  return self->_focusedCapsuleTopOffset;
}

- (BOOL)keepsCapsulesAboveKeyboard
{
  return self->_keepsCapsulesAboveKeyboard;
}

- (BOOL)ignoresKeyboardHideEvents
{
  return self->_ignoresKeyboardHideEvents;
}

- (double)capsuleWidth
{
  return self->_capsuleWidth;
}

- (void)setCapsuleWidth:(double)a3
{
  self->_capsuledouble Width = a3;
}

- (double)inactiveCapsuleAlpha
{
  return self->_inactiveCapsuleAlpha;
}

- (void)setInactiveCapsuleAlpha:(double)a3
{
  self->_inactiveCapsuleAlpha = a3;
}

- (int64_t)selectionGestureLimit
{
  return self->_selectionGestureLimit;
}

- (void)setSelectionGestureLimit:(int64_t)a3
{
  self->_int64_t selectionGestureLimit = a3;
}

- (BOOL)itemsAreHidden
{
  return self->_itemsAreHidden;
}

- (BOOL)shouldDismissContent
{
  return self->_shouldDismissContent;
}

- (BOOL)selectedItemUsesLiftedPreviewAppearance
{
  return self->_selectedItemUsesLiftedPreviewAppearance;
}

- (BOOL)isForceHidden
{
  return self->_forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_forceHiddeuint64_t n = a3;
}

- (void)setAlwaysShowTopBackdrop:(BOOL)a3
{
  self->_alwaysShowTopBackdrop = a3;
}

- (double)selectionThreshold
{
  return self->_selectionThreshold;
}

- (void)setSelectionThreshold:(double)a3
{
  self->_double selectionThreshold = a3;
}

- (BOOL)usesFastDeceleration
{
  return self->_usesFastDeceleration;
}

- (void)setUsesFastDeceleration:(BOOL)a3
{
  self->_usesFastDeceleratiouint64_t n = a3;
}

- (BOOL)suppressesSelectedItemUnfocus
{
  return self->_suppressesSelectedItemUnfocus;
}

- (void)setSuppressesSelectedItemUnfocus:(BOOL)a3
{
  self->_suppressesSelectedItemUnfocus = a3;
}

- (UIView)toolbar
{
  return self->_toolbar;
}

- (UIView)toolbarBackdropView
{
  return self->_toolbarBackdropView;
}

- (NSNumber)toolbarOffsetForPinchTransition
{
  return self->_toolbarOffsetForPinchTransition;
}

- (SFCapsuleCollectionViewToolbarContentProviding)alternateToolbarContentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alternateToolbarContentProvider);

  return (SFCapsuleCollectionViewToolbarContentProviding *)WeakRetained;
}

- (BOOL)isShowingAlternateToolbarContent
{
  return self->_showingAlternateToolbarContent;
}

- (SFNavigationBarItem)navigationBarItem
{
  return self->_navigationBarItem;
}

- (BOOL)showingLockdownStatusBar
{
  return self->_showingLockdownStatusBar;
}

- (SFCapsuleCollectionViewLinkablePageView)linkedPageView
{
  return self->_linkedPageView;
}

- (NSIndexSet)_indexesOfLoadedViews
{
  return self->_indexesOfLoadedViews;
}

- (double)_keyboardHeight
{
  return self->_keyboardHeight;
}

- (double)_offsetForMinimization
{
  return self->_offsetForMinimization;
}

- (NSArray)_items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_indexesOfLoadedViews, 0);
  objc_storeStrong((id *)&self->_linkedPageView, 0);
  objc_storeStrong((id *)&self->_lockdownStatusBar, 0);
  objc_storeStrong((id *)&self->_minimizedProgressView, 0);
  objc_storeStrong((id *)&self->_navigationBarItem, 0);
  objc_destroyWeak((id *)&self->_alternateToolbarContentProvider);
  objc_storeStrong((id *)&self->_toolbarOffsetForPinchTransition, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_minimizedTheme, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_nextSelectedItemIndexAfterPan, 0);
  objc_storeStrong((id *)&self->_blurSpringBehavior, 0);
  objc_storeStrong((id *)&self->_topBackdropHeight, 0);
  objc_storeStrong((id *)&self->_bottomBackdropHeight, 0);
  objc_storeStrong((id *)&self->_alternateToolbarContentView, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_destroyWeak((id *)&self->_currentTransitionCoordinator);
  objc_storeStrong((id *)&self->_gestureObservers, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_selectedItemAccessoryViews, 0);
  objc_storeStrong((id *)&self->_toolbarBackdropView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_keyboardBackdropView, 0);
  objc_storeStrong((id *)&self->_topAction, 0);
  objc_storeStrong((id *)&self->_trailingAction, 0);
  objc_storeStrong((id *)&self->_toolbarTheme, 0);
  objc_storeStrong((id *)&self->_effectiveMinimizedTheme, 0);
  objc_storeStrong((id *)&self->_effectiveTheme, 0);
  objc_storeStrong((id *)&self->_backgroundCaptureView, 0);
  objc_storeStrong((id *)&self->_reusableContentViewIdentifier, 0);
  objc_storeStrong((id *)&self->_reuseableContentView, 0);
  objc_storeStrong((id *)&self->_contentViewRegistrations, 0);
  objc_storeStrong((id *)&self->_viewsForReuse, 0);
  objc_destroyWeak((id *)&self->_timerToDiscardViewsForReuse);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)_indexesOfVisibleItemsWithSelectedItemIndex:(void *)a1 .cold.1(void **a1, void *a2)
{
  double v2 = *a1;
  id v3 = a2;
  [v2 count];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18C354000, v4, v5, "Selecting item at index %zd in array of %lu items", v6, v7, v8, v9, v10);
}

- (void)_didReceivePan:(void *)a1 .cold.1(void **a1, void *a2)
{
  double v2 = *a1;
  id v3 = a2;
  [v2 count];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18C354000, v4, v5, "Next selected item index after pan %zd is beyond bounds of array of %lu items", v6, v7, v8, v9, v10);
}

@end