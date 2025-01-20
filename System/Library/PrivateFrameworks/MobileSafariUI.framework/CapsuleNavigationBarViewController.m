@interface CapsuleNavigationBarViewController
- (BOOL)_activeWebViewIsFirstResponder;
- (BOOL)_capsuleShouldShowAlternateToolbarDuringTabViewTransition;
- (BOOL)_shouldAttachCapsuleForTabViewTransition;
- (BOOL)_showsOnlyActiveTab;
- (BOOL)capsuleCollectionView:(id)a3 shouldHideShadowForItemAtIndex:(int64_t)a4;
- (BOOL)capsuleCollectionViewAllowsMinimizationGesture:(id)a3;
- (BOOL)capsuleCollectionViewContentScaleCompletesMinimization:(id)a3;
- (BOOL)capsuleCollectionViewShouldDelayToolbarPresentation:(id)a3;
- (BOOL)capsuleCollectionViewShouldFocusSelectedItem:(id)a3;
- (BOOL)capsuleIsFocused;
- (BOOL)capsuleIsMinimized;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)focusingForScribble;
- (BOOL)performingWebViewTapTransition;
- (BOOL)transitionToState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)transitionToState:(int64_t)a3 options:(int64_t)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (BOOL)transitioningToNormalStateForKeyboardDismissal;
- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4;
- (CapsuleNavigationBarLinkablePageView)linkedPageView;
- (CapsuleNavigationBarViewControllerDelegate)delegate;
- (SFCapsuleCollectionView)capsuleCollectionView;
- (SFCapsuleNavigationBar)selectedItemNavigationBar;
- (TabController)tabController;
- (UIFocusEnvironment)customParentFocusEnvironment;
- (UIResponder)customNextResponder;
- (UnifiedField)unifiedField;
- (double)capsuleCollectionView:(id)a3 distanceToTopEdgeIncludingDeceleration:(BOOL)a4;
- (double)capsuleCollectionView:(id)a3 heightForItemAtIndex:(int64_t)a4 width:(double)a5 state:(int64_t)a6;
- (double)capsuleCollectionViewMinimizedContentScale:(id)a3;
- (id)_contextMenuActionProvider;
- (id)_dragPreviewForNavigationBar:(id)a3;
- (id)capsuleCollectionView:(id)a3 contentViewForItemAtIndex:(int64_t)a4;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)createToolbarForCapsuleCollectionView:(id)a3;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)nextResponder;
- (id)parentFocusEnvironment;
- (id)tabAtCollectionViewIndex:(int64_t)a3;
- (id)topActionForCapsuleCollectionView:(id)a3;
- (id)trailingActionForCapsuleCollectionView:(id)a3;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)collectionViewIndexOfTab:(id)a3;
- (unint64_t)_boundaryEdgesForScrollView:(id)a3;
- (unint64_t)capsuleCollectionViewBoundaryEdgesForScrollableContent:(id)a3;
- (unint64_t)numberOfItemsInCapsuleCollectionView:(id)a3;
- (void)_attachSelectedCapsuleToTabOverview;
- (void)_installDetachedCapsuleInCollectionView;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_reattachCapsuleToCollectionView;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)_switchObservingFromTabDocument:(id)a3 toTabDocument:(id)a4;
- (void)_updateHidingCapsuleAnimated:(BOOL)a3;
- (void)_updateSelectedItemAccessoryViews;
- (void)_updateTabDocumentsAnimated:(BOOL)a3;
- (void)_updateTabDocumentsWithoutUpdatingCollectionView;
- (void)beginHidingCapsuleAnimated:(BOOL)a3;
- (void)capsuleCollectionView:(id)a3 didBeginSelectionGestureOnAxis:(unint64_t)a4;
- (void)capsuleCollectionView:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)capsuleCollectionView:(id)a3 didUpdateProgress:(double)a4 toSelectItemAtIndex:(int64_t)a5 progressToTopAction:(double)a6 snapToAxis:(unint64_t)a7;
- (void)capsuleCollectionView:(id)a3 selectedItemWillChangeToState:(int64_t)a4 options:(int64_t)a5 coordinator:(id)a6;
- (void)capsuleCollectionView:(id)a3 willChangeToLayoutStyle:(int64_t)a4;
- (void)capsuleCollectionView:(id)a3 willEndSelectionGestureWithCoordinator:(id)a4;
- (void)capsuleCollectionViewDidEndSelectionGesture:(id)a3;
- (void)capsuleCollectionViewLayoutStyleDidChange:(id)a3;
- (void)capsuleCollectionViewWillHideKeyboard:(id)a3;
- (void)capsuleCollectionViewWillReloadData:(id)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)endHidingCapsuleAnimated:(BOOL)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setLinkedPageView:(id)a3;
- (void)setNextResponder:(id)a3 parentFocusEnvironment:(id)a4;
- (void)setTabController:(id)a3;
- (void)tabCollectionViewDidCancelDismissal:(id)a3;
- (void)tabCollectionViewDidDismiss:(id)a3;
- (void)tabCollectionViewDidPresent:(id)a3;
- (void)tabCollectionViewWillDismiss:(id)a3;
- (void)tabCollectionViewWillPresent:(id)a3;
- (void)tabController:(id)a3 didCloseTabDocuments:(id)a4;
- (void)tabController:(id)a3 didInsertTabDocument:(id)a4;
- (void)tabController:(id)a3 didMoveTabDocument:(id)a4 overTabDocument:(id)a5;
- (void)tabController:(id)a3 didReplaceTabDocument:(id)a4 withTabDocument:(id)a5;
- (void)tabController:(id)a3 didSwitchFromTabDocument:(id)a4 toTabDocument:(id)a5;
- (void)tabControllerDidChangeCurrentTabDocuments:(id)a3;
- (void)tabControllerDidEndUpdates:(id)a3;
- (void)tabControllerDocumentCountDidChange:(id)a3;
- (void)tabControllerWillBeginUpdates:(id)a3;
- (void)tabDocumentDidStartLoading:(id)a3;
- (void)tabDocumentWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4;
- (void)tabOverviewDidUpdateInteractivePresentation:(id)a3;
- (void)tabOverviewWillBeginInteractivePresentation:(id)a3;
- (void)tabOverviewWillEndInteractivePresentation:(id)a3;
- (void)updateAdditionalBottomObscuredInset;
- (void)updateVisibleContextMenu;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionFromTabView:(id)a3 toTabView:(id)a4;
@end

@implementation CapsuleNavigationBarViewController

- (SFCapsuleCollectionView)capsuleCollectionView
{
  [(CapsuleNavigationBarViewController *)self loadViewIfNeeded];
  capsuleCollectionView = self->_capsuleCollectionView;
  return capsuleCollectionView;
}

- (SFCapsuleNavigationBar)selectedItemNavigationBar
{
  if ([(SFCapsuleCollectionView *)self->_capsuleCollectionView numberOfItems])
  {
    v3 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView contentViewForItemAtIndex:[(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIndex]];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    cachedSelectedItemNavigationBar = v3;
    if ((isKindOfClass & 1) == 0) {
      cachedSelectedItemNavigationBar = self->_cachedSelectedItemNavigationBar;
    }
    v6 = cachedSelectedItemNavigationBar;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)capsuleCollectionView:(id)a3 contentViewForItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  if ([v6 selectedItemIndex] == a4 && objc_msgSend(v6, "selectedItemState") == 2)
  {
    id v7 = [v6 createOrDequeueContentViewWithIdentifier:@"urlField" atIndex:a4];
    v8 = [(CapsuleNavigationBarViewController *)self tabAtCollectionViewIndex:a4];
    cachedSelectedItemNavigationBar = [v8 navigationBarItem];

    LODWORD(v8) = self->_focusingForScribble;
    v10 = [v7 textField];
    v11 = v10;
    if (v8)
    {
      [v10 setText:0];

      uint64_t v12 = 0;
    }
    else
    {
      int v17 = [v10 isFirstResponder];

      if (v17) {
        goto LABEL_9;
      }
      v18 = [cachedSelectedItemNavigationBar textWhenExpanded];
      v19 = [v7 textField];
      [v19 setText:v18];

      uint64_t v12 = [cachedSelectedItemNavigationBar startIndexOfTextInExpandedText];
      v20 = [cachedSelectedItemNavigationBar text];
      uint64_t v21 = [v20 length];

      if (v21)
      {
        v22 = [cachedSelectedItemNavigationBar text];
        int v23 = [v22 characterAtIndex:0];

        if (v23 == 8206) {
          ++v12;
        }
        uint64_t v13 = v21 - (v23 == 8206);
        goto LABEL_6;
      }
    }
    uint64_t v13 = 0;
LABEL_6:
    objc_msgSend(v7, "setRangeOfKeyText:", v12, v13);
    goto LABEL_9;
  }
  id v7 = [v6 createOrDequeueContentViewWithIdentifier:@"navigationBar" atIndex:a4];
  v14 = [(CapsuleNavigationBarViewController *)self tabAtCollectionViewIndex:a4];
  v15 = [v14 navigationBarItem];
  [v7 setItem:v15];

  if ([v6 selectedItemIndex] != a4) {
    goto LABEL_10;
  }
  id v7 = v7;
  cachedSelectedItemNavigationBar = self->_cachedSelectedItemNavigationBar;
  self->_cachedSelectedItemNavigationBar = (SFCapsuleNavigationBar *)v7;
LABEL_9:

LABEL_10:
  return v7;
}

- (double)capsuleCollectionView:(id)a3 heightForItemAtIndex:(int64_t)a4 width:(double)a5 state:(int64_t)a6
{
  v10 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView contentViewForItemAtIndex:a4];
  v11 = &OBJC_IVAR___CapsuleNavigationBarViewController__sizingNavigationBar;
  if (a6 == 1) {
    v11 = &OBJC_IVAR___CapsuleNavigationBarViewController__minimizedSizingNavigationBar;
  }
  id v12 = *(id *)((char *)&self->super.super.super.isa + *v11);
  uint64_t v13 = [(CapsuleNavigationBarViewController *)self tabAtCollectionViewIndex:a4];
  v14 = [v13 navigationBarItem];
  [v12 setItem:v14];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v12 prepareForSizingNavigationBar:v10];
  }
  [v12 updateTraitsIfNeeded];
  [v12 layoutIfNeeded];
  LODWORD(v15) = 1148846080;
  LODWORD(v16) = 1112014848;
  objc_msgSend(v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a5, 0.0, v15, v16);
  double v18 = fmax(v17, 20.0);

  return v18;
}

- (id)tabAtCollectionViewIndex:(int64_t)a3
{
  return [(NSArray *)self->_tabs objectAtIndexedSubscript:a3];
}

- (BOOL)transitioningToNormalStateForKeyboardDismissal
{
  return self->_transitioningToNormalStateForKeyboardDismissal;
}

- (BOOL)performingWebViewTapTransition
{
  return self->_webViewTapTransitionCount != 0;
}

- (BOOL)capsuleIsFocused
{
  return self->_capsuleIsFocused;
}

- (unint64_t)numberOfItemsInCapsuleCollectionView:(id)a3
{
  return [(NSArray *)self->_tabs count];
}

- (BOOL)capsuleCollectionView:(id)a3 shouldHideShadowForItemAtIndex:(int64_t)a4
{
  return [a3 layoutStyle] == 2;
}

- (void)_updateTabDocumentsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  tabs = self->_tabs;
  if (!tabs) {
    tabs = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v13 = tabs;
  [(CapsuleNavigationBarViewController *)self _updateTabDocumentsWithoutUpdatingCollectionView];
  id v6 = [(TabController *)self->_tabController activeTabDocument];
  id v7 = [(NSArray *)self->_tabs differenceFromArray:v13 withOptions:0 usingEquivalenceTest:&__block_literal_global_76];
  if ([v7 hasChanges])
  {
    capsuleCollectionView = self->_capsuleCollectionView;
    if (v3)
    {
      [(SFCapsuleCollectionView *)capsuleCollectionView beginUpdates];
      v9 = self->_capsuleCollectionView;
      v10 = objc_msgSend(v7, "safari_removalIndexes");
      [(SFCapsuleCollectionView *)v9 deleteItemsAtIndexes:v10 animated:1];

      v11 = self->_capsuleCollectionView;
      id v12 = objc_msgSend(v7, "safari_insertionIndexes");
      [(SFCapsuleCollectionView *)v11 insertItemsAtIndexes:v12 animated:1];

      if ([(NSArray *)self->_tabs containsObject:v6]) {
        [(SFCapsuleCollectionView *)self->_capsuleCollectionView setSelectedItemIndex:[(NSArray *)self->_tabs indexOfObject:v6] animated:1];
      }
      [(SFCapsuleCollectionView *)self->_capsuleCollectionView endUpdates];
    }
    else
    {
      [(SFCapsuleCollectionView *)capsuleCollectionView reloadData];
    }
  }
  else if ([(NSArray *)self->_tabs containsObject:v6])
  {
    [(SFCapsuleCollectionView *)self->_capsuleCollectionView setSelectedItemIndex:[(NSArray *)self->_tabs indexOfObject:v6] animated:v3];
  }
}

- (void)tabControllerDocumentCountDidChange:(id)a3
{
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v12 = a3;
  v4 = [(TabController *)self->_tabController activeTabDocument];
  v5 = [v4 activeWebView];
  id v6 = [v5 scrollView];

  id v7 = v12;
  if (v6 == v12)
  {
    char v8 = [v12 isTracking];
    id v7 = v12;
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView layoutStyle];
      id v7 = v12;
      if (v9 == 2 || !self->_keyboardIsVisible)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || [WeakRetained capsuleNavigationBarViewController:self shouldUnminimizeOnScrollForScrollView:v12])
        {
          if ([(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIsMinimized])
          {
            [(CapsuleNavigationBarViewController *)self capsuleCollectionView:self->_capsuleCollectionView distanceToTopEdgeIncludingDeceleration:1];
            if (v11 <= 0.0) {
              -[CapsuleNavigationBarViewController transitionToState:animated:completionHandler:](self, "transitionToState:animated:completionHandler:", 0, [v12 _isAnimatingScroll], 0);
            }
          }
        }

        id v7 = v12;
      }
    }
  }
}

- (BOOL)capsuleCollectionViewShouldDelayToolbarPresentation:(id)a3
{
  BOOL v3 = [(TabController *)self->_tabController tabCollectionViewProvider];
  v4 = [v3 tabOverview];
  [v4 scalePercentageForActiveItem];
  BOOL v6 = v5 > 0.5;

  return v6;
}

- (void)setLinkedPageView:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPageView, a3);
  id v5 = a3;
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setLinkedPageView:v5];
  [v5 setCapsuleIndexProvider:self];
}

- (void)setTabController:(id)a3
{
  id v5 = (TabController *)a3;
  p_tabController = &self->_tabController;
  tabController = self->_tabController;
  v10 = v5;
  if (tabController != v5)
  {
    char v8 = [(TabController *)tabController activeTabDocument];
    uint64_t v9 = [(TabController *)v10 activeTabDocument];
    [(CapsuleNavigationBarViewController *)self _switchObservingFromTabDocument:v8 toTabDocument:v9];

    [(TabController *)*p_tabController removeDocumentObserver:self];
    objc_storeStrong((id *)&self->_tabController, a3);
    [(TabController *)*p_tabController addDocumentObserver:self];
    [(CapsuleNavigationBarViewController *)self _updateTabDocumentsAnimated:0];
  }
}

- (void)tabController:(id)a3 didSwitchFromTabDocument:(id)a4 toTabDocument:(id)a5
{
  id v7 = (TabDocument *)a5;
  id v8 = a4;
  [(CapsuleNavigationBarViewController *)self _switchObservingFromTabDocument:v8 toTabDocument:v7];
  int64_t v9 = [(CapsuleNavigationBarViewController *)self collectionViewIndexOfTab:v8];

  if ([(SFCapsuleCollectionView *)self->_capsuleCollectionView selectionGestureState]) {
    BOOL v10 = v9 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    double v11 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView viewForItemAtIndex:v9];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v26[0] = *MEMORY[0x1E4F1DAB8];
    v26[1] = v12;
    v26[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v11 setTransform:v26];
  }
  if (self->_interactivelyInsertedTabDocument == v7)
  {
    double v18 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView linkedPageView];
    char v19 = [v18 drivesCapsuleSelection];

    if (v19)
    {
      [self->_interactivelyInsertedTabDocument setInteractivelyInserted:0];
      v20 = [(TabController *)self->_tabController tabCollectionViewProvider];
      uint64_t v21 = [v20 tabSwitcherViewController];
      [v21 setNeedsApplyContentAnimated:1];
    }
    v22 = [(TabController *)self->_tabController tabCollectionViewProvider];
    int v23 = [v22 tabOverview];
    v24 = [self->_interactivelyInsertedTabDocument tabOverviewItem];
    [v23 setInteractiveInsertionProgress:v24 forItem:1.0];

    interactivelyInsertedTabDocument = self->_interactivelyInsertedTabDocument;
    self->_interactivelyInsertedTabDocument = 0;

    [(CapsuleNavigationBarViewController *)self _updateTabDocumentsAnimated:1];
  }
  else
  {
    if ([(CapsuleNavigationBarViewController *)self _showsOnlyActiveTab])
    {
      attachedTab = self->_attachedTab;
      if (attachedTab) {
        [(CapsuleNavigationBarViewController *)self _reattachCapsuleToCollectionView];
      }
      [(CapsuleNavigationBarViewController *)self _updateTabDocumentsWithoutUpdatingCollectionView];
      capsuleCollectionView = self->_capsuleCollectionView;
      double v15 = (void *)MEMORY[0x1E4F28D60];
      double v16 = [(TabController *)self->_tabController activeTabDocument];
      double v17 = objc_msgSend(v15, "indexSetWithIndex:", -[CapsuleNavigationBarViewController collectionViewIndexOfTab:](self, "collectionViewIndexOfTab:", v16));
      [(SFCapsuleCollectionView *)capsuleCollectionView reloadItemsAtIndexes:v17];

      if (attachedTab) {
        [(CapsuleNavigationBarViewController *)self _attachSelectedCapsuleToTabOverview];
      }
    }
    else
    {
      [(CapsuleNavigationBarViewController *)self _updateTabDocumentsAnimated:1];
    }
    [(SFCapsuleCollectionView *)self->_capsuleCollectionView updateTrailingActionAnimated:1];
  }
}

- (void)capsuleCollectionViewWillReloadData:(id)a3
{
  id v6 = a3;
  v4 = [(TabController *)self->_tabController activeTabDocument];
  int64_t v5 = [(CapsuleNavigationBarViewController *)self collectionViewIndexOfTab:v4];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [v6 setSelectedItemIndex:v5];
  }
}

- (int64_t)collectionViewIndexOfTab:(id)a3
{
  return [(NSArray *)self->_tabs indexOfObject:a3];
}

- (id)trailingActionForCapsuleCollectionView:(id)a3
{
  id v4 = a3;
  if ([(CapsuleNavigationBarViewController *)self _showsOnlyActiveTab])
  {
    int64_t v5 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_tabs lastObject];
    if ([(TabController *)self->_tabController canAddNewTabForCurrentBrowsingMode]
      && (![v6 isBlank] || objc_msgSend(v6, "isLoading")))
    {
      objc_initWeak(&location, self);
      id v7 = (void *)MEMORY[0x1E4FB13F0];
      id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __77__CapsuleNavigationBarViewController_trailingActionForCapsuleCollectionView___block_invoke;
      v10[3] = &unk_1E6D78C18;
      objc_copyWeak(&v11, &location);
      int64_t v5 = [v7 actionWithTitle:&stru_1F3C268E8 image:v8 identifier:@"CapsuleNavigationBarAddTab" handler:v10];
      objc_destroyWeak(&v11);

      objc_destroyWeak(&location);
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  return v5;
}

- (void)_updateTabDocumentsWithoutUpdatingCollectionView
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(CapsuleNavigationBarViewController *)self _showsOnlyActiveTab])
  {
    uint64_t v3 = [(TabController *)self->_tabController activeTabDocument];
    id v4 = (void *)v3;
    if (v3)
    {
      v14[0] = v3;
      int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
    else
    {
      int64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&self->_tabs, v5);
    if (v4) {
  }
    }
  else
  {
    interactivelyInsertedTabDocument = self->_interactivelyInsertedTabDocument;
    id v7 = [(TabController *)self->_tabController currentTabs];
    id v12 = v7;
    if (interactivelyInsertedTabDocument)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __86__CapsuleNavigationBarViewController__updateTabDocumentsWithoutUpdatingCollectionView__block_invoke;
      v13[3] = &unk_1E6D78C60;
      v13[4] = self;
      objc_msgSend(v7, "safari_filterObjectsUsingBlock:", v13);
      id v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      tabs = self->_tabs;
      self->_tabs = v8;
    }
    else
    {
      BOOL v10 = (NSArray *)[v7 copy];
      id v11 = self->_tabs;
      self->_tabs = v10;
    }
  }
}

- (BOOL)_showsOnlyActiveTab
{
  return [(SFCapsuleCollectionView *)self->_capsuleCollectionView layoutStyle] == 2;
}

- (void)setNextResponder:(id)a3 parentFocusEnvironment:(id)a4
{
  p_customNextResponder = &self->_customNextResponder;
  id obj = a4;
  objc_storeWeak((id *)p_customNextResponder, a3);
  objc_storeWeak((id *)&self->_customParentFocusEnvironment, obj);
}

- (void)setDelegate:(id)a3
{
}

- (void)viewIsAppearing:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CapsuleNavigationBarViewController;
  [(CapsuleNavigationBarViewController *)&v6 viewIsAppearing:a3];
  id v4 = [(CapsuleNavigationBarViewController *)self view];
  int64_t v5 = [v4 window];

  [v5 addSubview:self->_sizingNavigationBar];
  [v5 addSubview:self->_minimizedSizingNavigationBar];
}

- (void)viewDidLoad
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)CapsuleNavigationBarViewController;
  [(CapsuleNavigationBarViewController *)&v28 viewDidLoad];
  [(CapsuleNavigationBarViewController *)self updateAdditionalBottomObscuredInset];
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView updateVerticalSwipeThreshold];
  objc_initWeak(&location, self);
  capsuleCollectionView = self->_capsuleCollectionView;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke;
  v25[3] = &unk_1E6D78BC8;
  objc_copyWeak(&v26, &location);
  [(SFCapsuleCollectionView *)capsuleCollectionView registerContentViewIdentifier:@"urlField" block:v25];
  id v4 = self->_capsuleCollectionView;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_3;
  int v23 = &unk_1E6D78BC8;
  objc_copyWeak(&v24, &location);
  [(SFCapsuleCollectionView *)v4 registerContentViewIdentifier:@"navigationBar" block:&v20];
  int64_t v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v20, v21, v22, v23);
  [v5 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v5 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  id v6 = objc_alloc(MEMORY[0x1E4F78220]);
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView bounds];
  id v7 = (SFCapsuleNavigationBar *)objc_msgSend(v6, "initForSizingWithFrame:");
  sizingNavigationBar = self->_sizingNavigationBar;
  self->_sizingNavigationBar = v7;

  [(SFCapsuleNavigationBar *)self->_sizingNavigationBar setIsSelected:1];
  [(SFCapsuleNavigationBar *)self->_sizingNavigationBar setHidden:1];
  int64_t v9 = [MEMORY[0x1E4F78238] maximumContentSizeCategory];
  [(SFCapsuleNavigationBar *)self->_sizingNavigationBar setMaximumContentSizeCategory:v9];

  [(SFCapsuleNavigationBar *)self->_sizingNavigationBar _setHostsLayoutEngine:1];
  id v10 = objc_alloc(MEMORY[0x1E4F78220]);
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView bounds];
  id v11 = (SFCapsuleNavigationBar *)objc_msgSend(v10, "initForSizingWithFrame:");
  minimizedSizingNavigationBar = self->_minimizedSizingNavigationBar;
  self->_minimizedSizingNavigationBar = v11;

  [(SFCapsuleNavigationBar *)self->_minimizedSizingNavigationBar setIsMinimized:1];
  [(SFCapsuleNavigationBar *)self->_minimizedSizingNavigationBar setIsSelected:1];
  [(SFCapsuleNavigationBar *)self->_minimizedSizingNavigationBar setHidden:1];
  uint64_t v13 = [MEMORY[0x1E4F78238] maximumContentSizeCategory];
  [(SFCapsuleNavigationBar *)self->_minimizedSizingNavigationBar setMaximumContentSizeCategory:v13];

  [(SFCapsuleNavigationBar *)self->_minimizedSizingNavigationBar _setHostsLayoutEngine:1];
  v14 = __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_4();
  v30[0] = v14;
  double v15 = __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_4();
  v30[1] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  [(SFCapsuleNavigationBar *)self->_sizingNavigationBar setLeadingButtons:v16];

  double v17 = __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_4();
  v29[0] = v17;
  double v18 = __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_4();
  v29[1] = v18;
  char v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [(SFCapsuleNavigationBar *)self->_sizingNavigationBar setTrailingButtons:v19];

  [(CapsuleNavigationBarViewController *)self _updateSelectedItemAccessoryViews];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

id __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_4()
{
  v0 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v1 = [MEMORY[0x1E4FB1618] clearColor];
  v2 = [v0 background];
  [v2 setBackgroundColor:v1];

  objc_msgSend(v0, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  uint64_t v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = SFSystemImageNameForBarItem();
  int64_t v5 = [v3 systemImageNamed:v4];
  [v0 setImage:v5];

  id v6 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
  [v0 setPreferredSymbolConfigurationForImage:v6];

  id v7 = [MEMORY[0x1E4F78570] buttonWithConfiguration:v0 primaryAction:0];
  objc_msgSend(v7, "sf_applyContentSizeCategoryLimitsForToolbarButton");

  return v7;
}

- (void)updateAdditionalBottomObscuredInset
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v4, "safari_doubleForKey:defaultValue:", *MEMORY[0x1E4F78708], 10.0);
  self->_additionalBottomObscuredInset = v3;
}

- (void)_updateSelectedItemAccessoryViews
{
  if ([(SFCapsuleCollectionView *)self->_capsuleCollectionView layoutStyle] == 2)
  {
    double v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    id v4 = [MEMORY[0x1E4FB1618] clearColor];
    int64_t v5 = [v3 background];
    [v5 setBackgroundColor:v4];

    objc_msgSend(v3, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4FB14D0];
    id v7 = (void *)MEMORY[0x1E4FB13F0];
    id v8 = _WBSLocalizedString();
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    double v15 = __71__CapsuleNavigationBarViewController__updateSelectedItemAccessoryViews__block_invoke;
    double v16 = &unk_1E6D78C18;
    objc_copyWeak(&v17, &location);
    int64_t v9 = [v7 actionWithTitle:v8 image:0 identifier:0 handler:&v13];
    id v10 = objc_msgSend(v6, "buttonWithConfiguration:primaryAction:", v3, v9, v13, v14, v15, v16);

    [v10 setConfigurationUpdateHandler:&__block_literal_global_72];
    [v10 setPointerInteractionEnabled:1];
    id v11 = _SFAccessibilityIdentifierForBarItem();
    [v10 setAccessibilityIdentifier:v11];

    objc_msgSend(v10, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    [v10 setNeedsLayout];
    [v10 layoutIfNeeded];
    [(SFCapsuleCollectionView *)self->_capsuleCollectionView setSelectedItemAccessoryView:v10 forState:2];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    capsuleCollectionView = self->_capsuleCollectionView;
    [(SFCapsuleCollectionView *)capsuleCollectionView setSelectedItemAccessoryView:0 forState:2];
  }
}

- (void)_switchObservingFromTabDocument:(id)a3 toTabDocument:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 webView];
  int64_t v9 = [v8 scrollView];
  [v9 _removeScrollViewScrollObserver:self];

  id v10 = [v7 readerWebView];
  id v11 = [v10 scrollView];
  [v11 _removeScrollViewScrollObserver:self];

  [v7 removeNavigationObserver:self];
  id v12 = [v6 webView];
  uint64_t v13 = [v12 scrollView];
  [v13 _addScrollViewScrollObserver:self];

  uint64_t v14 = [v6 readerWebView];
  double v15 = [v14 scrollView];
  [v15 _addScrollViewScrollObserver:self];

  [v6 addNavigationObserver:self];
  id v16 = [v6 navigationBarItem];

  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setNavigationBarItem:v16];
}

uint64_t __66__CapsuleNavigationBarViewController__updateTabDocumentsAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int64_t v5 = [a2 uuid];
  id v6 = [v4 uuid];

  uint64_t v7 = [v5 isEqual:v6];
  return v7;
}

id __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F78220]);
    double v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:WeakRetained];
    [v2 addInteraction:v3];

    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:WeakRetained];
    [v2 addInteraction:v4];

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:WeakRetained];
    id v6 = (void *)*((void *)WeakRetained + 129);
    *((void *)WeakRetained + 129) = v5;

    [v2 addInteraction:*((void *)WeakRetained + 129)];
    uint64_t v7 = [v2 scribbleInteraction];
    [v7 setElementSource:WeakRetained];

    id v8 = objc_loadWeakRetained((id *)WeakRetained + 140);
    if (objc_opt_respondsToSelector()) {
      [v8 capsuleNavigationBarViewController:WeakRetained didCreateNavigationBar:v2];
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)topActionForCapsuleCollectionView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x1E4FB13F0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__CapsuleNavigationBarViewController_topActionForCapsuleCollectionView___block_invoke;
  v8[3] = &unk_1E6D78C18;
  objc_copyWeak(&v9, &location);
  id v6 = [v5 actionWithHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

- (void)willTransitionFromTabView:(id)a3 toTabView:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [v8 removePresentationObserver:self];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 addPresentationObserver:self];
  }
  if ((SFTabGroupSwitcherEnabled() & 1) == 0)
  {
    uint64_t v7 = [v6 toolbar];
    [(SFCapsuleCollectionView *)self->_capsuleCollectionView setAlternateToolbarContentProvider:v7];
  }
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F78218]);
  id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  uint64_t v5 = (SFCapsuleCollectionView *)objc_msgSend(v3, "initWithFrame:");
  capsuleCollectionView = self->_capsuleCollectionView;
  self->_capsuleCollectionView = v5;

  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setDataSource:self];
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setDelegate:self];
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView addGestureObserver:self];
  uint64_t v7 = self->_capsuleCollectionView;
  [(CapsuleNavigationBarViewController *)self setView:v7];
}

- (UnifiedField)unifiedField
{
  if ([(SFCapsuleCollectionView *)self->_capsuleCollectionView numberOfItems])
  {
    id v3 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView contentViewForItemAtIndex:[(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIndex]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 textField];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return (UnifiedField *)v4;
}

- (BOOL)transitionToState:(int64_t)a3 options:(int64_t)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = (void (**)(void))a6;
  uint64_t v11 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemState];
  if (v11 != a3)
  {
    uint64_t v12 = v11;
    if (v11 != 1 || a3 != 0 || !self->_keyboardIsVisible)
    {
      int v15 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView isForceHidden];
      if (v12 != 1 || a3 == 1 || v15 == 0)
      {
        double v18 = (void *)MEMORY[0x1E4E42950](v10);
        id nextStateChangeCompletionHandler = self->_nextStateChangeCompletionHandler;
        self->_id nextStateChangeCompletionHandler = v18;

        [(SFCapsuleCollectionView *)self->_capsuleCollectionView setSelectedItemState:a3 options:a4 animated:v6];
        BOOL v20 = 1;
        goto LABEL_22;
      }
    }
    else
    {
      self->_unminimizeOnHideKeyboard = 1;
    }
  }
  if (v10) {
    v10[2](v10);
  }
  BOOL v20 = 0;
LABEL_22:

  return v20;
}

- (BOOL)transitionToState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  return [(CapsuleNavigationBarViewController *)self transitionToState:a3 options:0 animated:a4 completionHandler:a5];
}

- (id)createToolbarForCapsuleCollectionView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [WeakRetained createToolbarForCapsuleNavigationBarViewController:self];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CapsuleNavigationBarViewController;
  [(CapsuleNavigationBarViewController *)&v9 viewWillAppear:a3];
  if ((SFEnhancedTabOverviewEnabled() & 1) == 0)
  {
    id v4 = [(TabController *)self->_tabController tabCollectionViewProvider];
    uint64_t v5 = [v4 tabThumbnailCollectionView];

    if (objc_opt_respondsToSelector()) {
      [v5 addPresentationObserver:self];
    }
    BOOL v6 = [v5 toolbar];
    [(SFCapsuleCollectionView *)self->_capsuleCollectionView setAlternateToolbarContentProvider:v6];

    id v7 = v5;
    if ([v7 presentationState] == 1)
    {
    }
    else
    {
      uint64_t v8 = [v7 presentationState];

      if (v8 != 2)
      {
LABEL_9:

        return;
      }
    }
    [(CapsuleNavigationBarViewController *)self beginHidingCapsuleAnimated:0];
    [(SFCapsuleCollectionView *)self->_capsuleCollectionView setShowingAlternateToolbarContent:[(CapsuleNavigationBarViewController *)self _capsuleShouldShowAlternateToolbarDuringTabViewTransition] animated:0];
    if ([v7 presentationState] == 1) {
      [(SFCapsuleCollectionView *)self->_capsuleCollectionView installAlternateToolbarContentIfNeeded];
    }
    goto LABEL_9;
  }
}

id __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F78230]);
    id v4 = objc_alloc_init(UnifiedField);
    uint64_t v5 = (void *)[v3 initWithTextField:v4];

    BOOL v6 = WBSMakeAccessibilityIdentifier();
    [v5 setAccessibilityIdentifier:v6];

    id v7 = objc_loadWeakRetained(WeakRetained + 140);
    if (objc_opt_respondsToSelector())
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_2;
      v9[3] = &unk_1E6D77F98;
      objc_copyWeak(&v11, v1);
      id v10 = v7;
      [v5 setVoiceSearchTappedAction:v9];

      objc_destroyWeak(&v11);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) capsuleNavigationBarViewControllerDidTapVoiceSearch:WeakRetained];
    id WeakRetained = v3;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CapsuleNavigationBarViewController;
  [(CapsuleNavigationBarViewController *)&v6 viewDidDisappear:a3];
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView relinquishAlternateToolbarContentIfNeeded];
  id v4 = [(TabController *)self->_tabController tabCollectionViewProvider];
  uint64_t v5 = [v4 tabThumbnailCollectionView];

  if (objc_opt_respondsToSelector()) {
    [v5 removePresentationObserver:self];
  }
  [(SFCapsuleNavigationBar *)self->_sizingNavigationBar removeFromSuperview];
  [(SFCapsuleNavigationBar *)self->_minimizedSizingNavigationBar removeFromSuperview];
}

- (id)nextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customNextResponder);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CapsuleNavigationBarViewController;
    id v5 = [(CapsuleNavigationBarViewController *)&v8 nextResponder];
  }
  objc_super v6 = v5;

  return v6;
}

- (id)parentFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customParentFocusEnvironment);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CapsuleNavigationBarViewController;
    id v5 = [(CapsuleNavigationBarViewController *)&v8 parentFocusEnvironment];
  }
  objc_super v6 = v5;

  return v6;
}

- (void)beginHidingCapsuleAnimated:(BOOL)a3
{
}

- (void)endHidingCapsuleAnimated:(BOOL)a3
{
}

- (void)_updateHidingCapsuleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t hideCapsuleCount = self->_hideCapsuleCount;
  capsuleCollectionView = self->_capsuleCollectionView;
  if (hideCapsuleCount)
  {
    uint64_t v7 = [(SFCapsuleCollectionView *)capsuleCollectionView isInteractivelySelectingItem] ^ 1;
    if ([(SFCapsuleCollectionView *)self->_capsuleCollectionView itemsAreHidden] == v7) {
      return;
    }
  }
  else
  {
    if (([(SFCapsuleCollectionView *)capsuleCollectionView itemsAreHidden] & 1) == 0) {
      return;
    }
    uint64_t v7 = 0;
  }
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setItemsAreHidden:v7];
  if (v3)
  {
    if ([(CapsuleNavigationBarViewController *)self _shouldAttachCapsuleForTabViewTransition])
    {
      objc_super v8 = [(TabController *)self->_tabController tabCollectionViewProvider];
      objc_super v9 = [v8 tabOverview];
      double v10 = 0.0;
      if ([v9 presentationState] == 3)
      {
        if ([(CapsuleNavigationBarViewController *)self capsuleCollectionViewShouldDelayToolbarPresentation:self->_capsuleCollectionView])
        {
          double v10 = 0.38;
        }
        else
        {
          double v10 = 0.0;
        }
      }

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __67__CapsuleNavigationBarViewController__updateHidingCapsuleAnimated___block_invoke;
      v12[3] = &unk_1E6D77E20;
      v12[4] = self;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animated:usingFastSpringWithDelay:options:animations:completion:", 1, 2, v12, 0, v10);
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __67__CapsuleNavigationBarViewController__updateHidingCapsuleAnimated___block_invoke_2;
      v11[3] = &unk_1E6D77E20;
      v11[4] = self;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 2, v11, 0);
    }
  }
}

uint64_t __67__CapsuleNavigationBarViewController__updateHidingCapsuleAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) layoutIfNeeded];
}

uint64_t __67__CapsuleNavigationBarViewController__updateHidingCapsuleAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) layoutIfNeeded];
}

- (BOOL)_shouldAttachCapsuleForTabViewTransition
{
  if ([(TabController *)self->_tabController isPrivateBrowsingAndLocked]) {
    return 0;
  }
  if ([(SFCapsuleCollectionView *)self->_capsuleCollectionView layoutStyle] == 1) {
    return [(SFCapsuleCollectionView *)self->_capsuleCollectionView selectionGestureState] != 0;
  }
  return 1;
}

- (BOOL)_capsuleShouldShowAlternateToolbarDuringTabViewTransition
{
  return !UIAccessibilityIsReduceMotionEnabled();
}

- (BOOL)capsuleIsMinimized
{
  return [(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIsMinimized];
}

- (id)_dragPreviewForNavigationBar:(id)a3
{
  id v4 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView viewForItemAtIndex:[(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIndex]];
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView capsuleBackgroundCornerRadius];
  objc_msgSend(v4, "_setContinuousCornerRadius:");
  id v5 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView contentViewForItemAtIndex:[(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIndex]];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  uint64_t v7 = (void *)MEMORY[0x1E4FB14C0];
  [v5 bounds];
  objc_msgSend(v5, "convertRect:toView:", v4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView capsuleBackgroundCornerRadius];
  id v17 = objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v16);
  [v6 setVisiblePath:v17];

  double v18 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v18];

  char v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v4 parameters:v6];
  return v19;
}

- (void)updateVisibleContextMenu
{
  if (self->_showingContextMenu)
  {
    contextMenuInteraction = self->_contextMenuInteraction;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __62__CapsuleNavigationBarViewController_updateVisibleContextMenu__block_invoke;
    v3[3] = &unk_1E6D78BF0;
    v3[4] = self;
    [(UIContextMenuInteraction *)contextMenuInteraction updateVisibleMenuWithBlock:v3];
  }
}

id __62__CapsuleNavigationBarViewController_updateVisibleContextMenu__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _contextMenuActionProvider];
  id v2 = v1[2](v1, MEMORY[0x1E4F1CBF0]);

  return v2;
}

void __71__CapsuleNavigationBarViewController__updateSelectedItemAccessoryViews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained unifiedField];
    if ([v2 isFirstResponder]
      && ([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode] & 1) == 0)
    {
      [v2 resignFirstResponder];
    }
    else
    {
      [v3 transitionToState:0 animated:1 completionHandler:0];
    }

    id WeakRetained = v3;
  }
}

void __71__CapsuleNavigationBarViewController__updateSelectedItemAccessoryViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v2 = [v7 configuration];
  char v3 = [v7 isHighlighted];
  id v4 = [v7 tintColor];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v4 colorWithAlphaComponent:0.25];
    [v2 setBaseForegroundColor:v6];
  }
  else
  {
    [v2 setBaseForegroundColor:v4];
  }

  [v7 setConfiguration:v2];
}

BOOL __86__CapsuleNavigationBarViewController__updateTabDocumentsWithoutUpdatingCollectionView__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 32) + 1080) != a2;
}

- (BOOL)_activeWebViewIsFirstResponder
{
  char v3 = [(CapsuleNavigationBarViewController *)self view];
  id v4 = [v3 firstResponder];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(TabController *)self->_tabController activeTabDocument];
    id v6 = [v5 activeWebView];
    char v7 = [v4 isDescendantOfView:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_keyboardWillShow:(id)a3
{
  self->_keyboardIsVisible = 1;
  if (!self->_unminimizeOnHideKeyboard)
  {
    id v4 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView contentViewForItemAtIndex:[(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIndex]];
    [v4 setNeedsUpdateConstraints];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([WeakRetained capsuleNavigationBarViewControllerIsTrackingDropSession:self] & 1) == 0)
    {
      int v5 = [WeakRetained capsuleNavigationBarViewControllerIsShowingFindOnPage:self];
      if (([(CapsuleNavigationBarViewController *)self _activeWebViewIsFirstResponder]
         || v5)
        && [(SFCapsuleCollectionView *)self->_capsuleCollectionView layoutStyle] != 2)
      {
        self->_unminimizeOnHideKeyboard = ([(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIsMinimized] | v5) ^ 1;
        [(SFCapsuleCollectionView *)self->_capsuleCollectionView setSelectedItemState:1 animated:1];
      }
    }
  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = a3;
  self->_keyboardIsVisible = 0;
  if (self->_unminimizeOnHideKeyboard && !self->_showingContextMenu)
  {
    self->_unminimizeOnHideKeyboard = 0;
    self->_transitioningToNormalStateForKeyboardDismissal = 1;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__CapsuleNavigationBarViewController__keyboardWillHide___block_invoke;
    v5[3] = &unk_1E6D77E20;
    v5[4] = self;
    [(CapsuleNavigationBarViewController *)self transitionToState:0 animated:1 completionHandler:v5];
  }
}

uint64_t __56__CapsuleNavigationBarViewController__keyboardWillHide___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1098) = 0;
  return result;
}

- (void)tabController:(id)a3 didReplaceTabDocument:(id)a4 withTabDocument:(id)a5
{
  id v6 = a5;
  [(CapsuleNavigationBarViewController *)self _updateTabDocumentsWithoutUpdatingCollectionView];
  int64_t v7 = [(CapsuleNavigationBarViewController *)self collectionViewIndexOfTab:v6];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [(CapsuleNavigationBarViewController *)self capsuleCollectionView];
    double v8 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
    [v9 reloadItemsAtIndexes:v8];
  }
}

- (void)tabController:(id)a3 didInsertTabDocument:(id)a4
{
}

- (void)tabController:(id)a3 didCloseTabDocuments:(id)a4
{
}

- (void)tabController:(id)a3 didMoveTabDocument:(id)a4 overTabDocument:(id)a5
{
}

- (void)tabControllerDidChangeCurrentTabDocuments:(id)a3
{
}

- (void)tabControllerWillBeginUpdates:(id)a3
{
}

- (void)tabControllerDidEndUpdates:(id)a3
{
}

- (void)tabDocumentWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  if ([(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIsMinimized])
  {
    [(CapsuleNavigationBarViewController *)self transitionToState:0 animated:1 completionHandler:0];
  }
}

- (void)tabDocumentDidStartLoading:(id)a3
{
}

- (void)_attachSelectedCapsuleToTabOverview
{
  char v3 = [(TabController *)self->_tabController activeTabDocument];
  if (self->_attachedTab != v3)
  {
    [(CapsuleNavigationBarViewController *)self _reattachCapsuleToCollectionView];
    id v4 = [(TabController *)self->_tabController tabCollectionViewProvider];
    int v5 = [v4 tabOverview];

    if (v5)
    {
      id v6 = [(TabDocument *)v3 tabOverviewItem];
      uint64_t v7 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIndex];
      double v8 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView viewForItemAtIndex:v7];
      id v9 = [v8 layer];

      if ([(SFCapsuleCollectionView *)self->_capsuleCollectionView selectionGestureState] != 4) {
        goto LABEL_7;
      }
      double v10 = [v9 presentationLayer];
      double v11 = v10;
      if (!v10) {
        double v10 = v9;
      }
      [v10 opacity];
      float v13 = v12;

      if (v13 != 0.0)
      {
LABEL_7:
        objc_storeStrong((id *)&self->_attachedTab, v3);
        double v14 = [(SFCapsuleCollectionView *)self->_capsuleCollectionView detachViewForItemAtIndex:v7];
        double v15 = (void *)MEMORY[0x1E4FB1EB0];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __73__CapsuleNavigationBarViewController__attachSelectedCapsuleToTabOverview__block_invoke;
        v17[3] = &unk_1E6D78AE8;
        id v18 = v14;
        id v19 = v5;
        BOOL v20 = self;
        id v21 = v6;
        id v16 = v14;
        [v15 performWithoutAnimation:v17];
      }
    }
  }
}

uint64_t __73__CapsuleNavigationBarViewController__attachSelectedCapsuleToTabOverview__block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v7[0] = *MEMORY[0x1E4F1DAB8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v7];
  uint64_t v5 = a1[4];
  id v4 = (void *)a1[5];
  [*(id *)(a1[6] + 1016) capsuleFrame];
  return objc_msgSend(v4, "attachView:withReferenceRect:toItem:", v5, a1[7]);
}

- (void)_reattachCapsuleToCollectionView
{
  if (self->_attachedTab)
  {
    long long v3 = [(TabController *)self->_tabController tabCollectionViewProvider];
    id v7 = [v3 tabOverview];

    id v4 = [(TabDocument *)self->_attachedTab tabOverviewItem];
    uint64_t v5 = [v7 attachedViewForItem:v4];
    objc_msgSend(v7, "attachView:withReferenceRect:toItem:", 0, v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(SFCapsuleCollectionView *)self->_capsuleCollectionView reattachView:v5];
    attachedTab = self->_attachedTab;
    self->_attachedTab = 0;
  }
}

- (void)_installDetachedCapsuleInCollectionView
{
  if (self->_attachedTab)
  {
    int64_t v3 = -[CapsuleNavigationBarViewController collectionViewIndexOfTab:](self, "collectionViewIndexOfTab:");
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v4 = v3;
      capsuleCollectionView = self->_capsuleCollectionView;
      [(SFCapsuleCollectionView *)capsuleCollectionView takeOwnershipOfDetachedViewForItemAtIndex:v4];
    }
  }
}

- (void)tabCollectionViewWillPresent:(id)a3
{
  id v7 = [(TabController *)self->_tabController tabCollectionViewProvider];
  if (SFTabGroupSwitcherEnabled())
  {
    int64_t v4 = [v7 tabViewContainerView];
    uint64_t v5 = [v4 alternateToolbarContentProvider];
    [(SFCapsuleCollectionView *)self->_capsuleCollectionView setAlternateToolbarContentProvider:v5];
  }
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView installAlternateToolbarContentIfNeeded];
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setShowingAlternateToolbarContent:[(CapsuleNavigationBarViewController *)self _capsuleShouldShowAlternateToolbarDuringTabViewTransition] animated:1];
  if (![(SFCapsuleCollectionView *)self->_capsuleCollectionView selectionGestureState]
    && ([(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIsMinimized] & 1) == 0)
  {
    id v6 = [v7 tabOverview];
    [v6 setPresentedTabLayout:0];

    if ([(CapsuleNavigationBarViewController *)self _shouldAttachCapsuleForTabViewTransition])
    {
      [(CapsuleNavigationBarViewController *)self _attachSelectedCapsuleToTabOverview];
      [(CapsuleNavigationBarViewController *)self _installDetachedCapsuleInCollectionView];
    }
  }
  [(CapsuleNavigationBarViewController *)self beginHidingCapsuleAnimated:1];
}

- (void)tabCollectionViewDidPresent:(id)a3
{
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setShowingAlternateToolbarContent:[(CapsuleNavigationBarViewController *)self _capsuleShouldShowAlternateToolbarDuringTabViewTransition] animated:0];
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView relinquishAlternateToolbarContentIfNeeded];
  if (![(SFCapsuleCollectionView *)self->_capsuleCollectionView selectionGestureState]) {
    [(CapsuleNavigationBarViewController *)self transitionToState:0 animated:0 completionHandler:0];
  }
  int64_t v4 = [(TabController *)self->_tabController tabCollectionViewProvider];
  uint64_t v5 = [v4 tabOverview];
  char v6 = [v5 presentingInteractively];

  if ((v6 & 1) == 0)
  {
    [(CapsuleNavigationBarViewController *)self _reattachCapsuleToCollectionView];
  }
}

- (void)tabCollectionViewWillDismiss:(id)a3
{
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView installAlternateToolbarContentIfNeeded];
  if ([(SFCapsuleCollectionView *)self->_capsuleCollectionView selectionGestureState]
    || ([(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIsMinimized] & 1) != 0
    || ![(CapsuleNavigationBarViewController *)self _shouldAttachCapsuleForTabViewTransition])
  {
    [(CapsuleNavigationBarViewController *)self _reattachCapsuleToCollectionView];
  }
  else
  {
    [(CapsuleNavigationBarViewController *)self _attachSelectedCapsuleToTabOverview];
    [(CapsuleNavigationBarViewController *)self _installDetachedCapsuleInCollectionView];
  }
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setShowingAlternateToolbarContent:0 animated:1];
  [(CapsuleNavigationBarViewController *)self endHidingCapsuleAnimated:1];
}

- (void)tabCollectionViewDidCancelDismissal:(id)a3
{
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setShowingAlternateToolbarContent:[(CapsuleNavigationBarViewController *)self _capsuleShouldShowAlternateToolbarDuringTabViewTransition] animated:0];
  if (![(SFCapsuleCollectionView *)self->_capsuleCollectionView selectionGestureState])
  {
    int64_t v4 = [(TabController *)self->_tabController tabCollectionViewProvider];
    uint64_t v5 = [v4 tabOverview];
    [v5 setPresentedTabLayout:0];
  }
  [(CapsuleNavigationBarViewController *)self beginHidingCapsuleAnimated:1];
}

- (void)tabCollectionViewDidDismiss:(id)a3
{
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setShowingAlternateToolbarContent:0 animated:0];
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView relinquishAlternateToolbarContentIfNeeded];
  int64_t v4 = [(TabController *)self->_tabController tabCollectionViewProvider];
  uint64_t v5 = [v4 tabOverview];
  [v5 setPresentedTabLayout:0];

  [(CapsuleNavigationBarViewController *)self _reattachCapsuleToCollectionView];
}

- (void)tabOverviewWillBeginInteractivePresentation:(id)a3
{
  id v4 = a3;
  if (![(SFCapsuleCollectionView *)self->_capsuleCollectionView selectionGestureState]
    && ([(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemIsMinimized] & 1) == 0
    && [(CapsuleNavigationBarViewController *)self _shouldAttachCapsuleForTabViewTransition])
  {
    [(CapsuleNavigationBarViewController *)self _attachSelectedCapsuleToTabOverview];
    [(CapsuleNavigationBarViewController *)self _installDetachedCapsuleInCollectionView];
  }
  [(CapsuleNavigationBarViewController *)self tabOverviewDidUpdateInteractivePresentation:v4];
}

- (void)tabOverviewDidUpdateInteractivePresentation:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = a3;
  [v5 bounds];
  double Height = CGRectGetHeight(v11);
  [v5 scalePercentageForActiveItem];
  double v8 = v7;

  objc_msgSend(v4, "numberWithDouble:", fmax(Height * v8 * 0.5, 0.0));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setToolbarOffsetForPinchTransition:v9];
}

- (void)tabOverviewWillEndInteractivePresentation:(id)a3
{
  capsuleCollectionView = self->_capsuleCollectionView;
  id v5 = a3;
  [(SFCapsuleCollectionView *)capsuleCollectionView setToolbarOffsetForPinchTransition:0];
  uint64_t v6 = [v5 presentationState];

  if (v6 == 2)
  {
    [(CapsuleNavigationBarViewController *)self _reattachCapsuleToCollectionView];
  }
}

- (BOOL)capsuleCollectionViewShouldFocusSelectedItem:(id)a3
{
  int64_t v3 = [(TabController *)self->_tabController activeTabDocument];
  id v4 = [v3 sfScribbleControllerIfLoaded];
  char v5 = [v4 isScribbling] ^ 1;

  return v5;
}

- (void)capsuleCollectionView:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  tabController = self->_tabController;
  id v5 = [(CapsuleNavigationBarViewController *)self tabAtCollectionViewIndex:a4];
  [(TabController *)tabController setActiveTab:v5];
}

- (void)capsuleCollectionView:(id)a3 selectedItemWillChangeToState:(int64_t)a4 options:(int64_t)a5 coordinator:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  float v12 = v11;
  if (self->_nextStateChangeCompletionHandler)
  {
    objc_msgSend(v11, "addCompletion:");
    id nextStateChangeCompletionHandler = self->_nextStateChangeCompletionHandler;
    self->_id nextStateChangeCompletionHandler = 0;
  }
  if (a4 != 1
    && [(CapsuleNavigationBarViewController *)self _activeWebViewIsFirstResponder]
    && self->_keyboardIsVisible)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke;
    v22[3] = &unk_1E6D78CA8;
    v22[4] = self;
    [v12 addAnimations:v22];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((a4 == 1) == [v10 selectedItemIsMinimized]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    if (a4 == 2)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke_2;
      v21[3] = &unk_1E6D78CA8;
      v21[4] = self;
      [v12 addAnimations:v21];
    }
  }
  else
  {
    [WeakRetained capsuleNavigationController:self obscuredInsetsDidChangeWithCoordinator:v12];
  }
  uint64_t v15 = [v10 selectedItemState];
  if (objc_opt_respondsToSelector()) {
    [WeakRetained capsuleNavigationBarViewController:self selectedItemWillChangeToState:a4 options:a5 coordinator:v12];
  }
  if (a4 == 2 || v15 == 2)
  {
    self->_capsuleIsFocused = a4 == 2;
    if ([v10 numberOfItems])
    {
      id v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v10, "selectedItemIndex"));
      [v10 reloadItemsAtIndexes:v16];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke_3;
    v17[3] = &unk_1E6D78CD0;
    id v19 = self;
    int64_t v20 = a5;
    id v18 = WeakRetained;
    [v12 addAnimations:v17];
  }
}

void __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1112) activeTabDocument];
  v1 = [v2 activeWebView];
  [v1 resignFirstResponder];
}

void __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if ([v5 isTransition]) {
      uint64_t v4 = v3 | 2;
    }
    else {
      uint64_t v4 = v3;
    }
    [*(id *)(a1 + 32) capsuleNavigationBarViewControllerDidChangeCapsuleFocus:*(void *)(a1 + 40) options:v4];
  }
}

- (unint64_t)capsuleCollectionViewBoundaryEdgesForScrollableContent:(id)a3
{
  uint64_t v4 = [(TabController *)self->_tabController activeTabDocument];
  id v5 = [v4 activeWebView];
  uint64_t v6 = [v5 scrollView];

  unint64_t v7 = [(CapsuleNavigationBarViewController *)self _boundaryEdgesForScrollView:v6];
  return v7;
}

- (unint64_t)_boundaryEdgesForScrollView:(id)a3
{
  id v3 = a3;
  [v3 contentOffset];
  double v5 = v4;
  [v3 contentInset];
  double v7 = v6;
  unint64_t v9 = v5 <= -v8;
  [v3 bounds];
  double v10 = v5 + CGRectGetHeight(v14);
  [v3 contentSize];
  double v12 = v11;

  if (v10 >= v12 - v7) {
    return v9 | 4;
  }
  else {
    return v9;
  }
}

- (double)capsuleCollectionView:(id)a3 distanceToTopEdgeIncludingDeceleration:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [(TabController *)self->_tabController activeTabDocument];
  double v7 = [v6 activeWebView];
  double v8 = [v7 scrollView];

  [v8 contentOffset];
  double v10 = v9;
  [v8 _verticalVelocity];
  if (v4)
  {
    double v12 = v11;
    if (v11 != 0.0)
    {
      [v8 decelerationRate];
      long double v14 = v13;
      double v15 = dbl_1E123DDF0[v12 < 0.0];
      [v8 _verticalVelocity];
      double v10 = v10 - (v16 - v15) / log(v14);
    }
  }
  [v8 contentInset];
  double v18 = v10 + v17;
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView obscuredInsetsForState:0];
  double v20 = v18 - v19;
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView obscuredInsetsForState:[(SFCapsuleCollectionView *)self->_capsuleCollectionView selectedItemState]];
  double v22 = v20 + v21;

  return v22;
}

void __77__CapsuleNavigationBarViewController_trailingActionForCapsuleCollectionView___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[135] setInteractivelyInserted:0];
    [v2[139] setActiveTabDocument:v2[135]];
    id WeakRetained = v2;
  }
}

void __72__CapsuleNavigationBarViewController_topActionForCapsuleCollectionView___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v2 = [WeakRetained[139] tabCollectionViewProvider];
    id v3 = [v2 tabThumbnailCollectionView];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      [v4 endInteractivePresentationAllowingDismissalToTargetItem:0];
      [v4 setPresentedTabLayout:0];
    }
    else
    {
      [v3 presentAnimated:1];
    }
    [v5 _updateHidingCapsuleAnimated:1];

    id WeakRetained = v5;
  }
}

- (BOOL)capsuleCollectionViewAllowsMinimizationGesture:(id)a3
{
  id v4 = a3;
  if (self->_keyboardIsVisible
    && [(SFCapsuleCollectionView *)self->_capsuleCollectionView layoutStyle] != 2)
  {
    char v6 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v6 = [WeakRetained capsuleNavigationBarViewControllerAllowsMinimizationGesture:self];
    }
    else {
      char v6 = 1;
    }
  }
  return v6;
}

- (double)capsuleCollectionViewMinimizedContentScale:(id)a3
{
  [(SFCapsuleNavigationBar *)self->_minimizedSizingNavigationBar urlSize];
  double v5 = v4;
  [(SFCapsuleNavigationBar *)self->_sizingNavigationBar urlSize];
  return v5 / v6;
}

- (BOOL)capsuleCollectionViewContentScaleCompletesMinimization:(id)a3
{
  [(CapsuleNavigationBarViewController *)self capsuleCollectionViewMinimizedContentScale:a3];
  [(SFCapsuleNavigationBar *)self->_sizingNavigationBar keyContentRect];
  CGRectGetWidth(v6);
  [(SFCapsuleNavigationBar *)self->_minimizedSizingNavigationBar keyContentRect];
  CGRectGetWidth(v7);
  return _SFEqualWithEpsilon();
}

- (void)capsuleCollectionViewWillHideKeyboard:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained capsuleNavigationBarViewControllerWillHideKeyboard:self];
  }
}

- (void)capsuleCollectionView:(id)a3 willChangeToLayoutStyle:(int64_t)a4
{
  [(SFCapsuleNavigationBar *)self->_sizingNavigationBar setLayoutStyle:a4];
  minimizedSizingNavigationBar = self->_minimizedSizingNavigationBar;
  [(SFCapsuleNavigationBar *)minimizedSizingNavigationBar setLayoutStyle:a4];
}

- (void)capsuleCollectionViewLayoutStyleDidChange:(id)a3
{
  [(CapsuleNavigationBarViewController *)self _updateSelectedItemAccessoryViews];
  [(CapsuleNavigationBarViewController *)self _updateTabDocumentsAnimated:0];
}

- (void)capsuleCollectionView:(id)a3 didBeginSelectionGestureOnAxis:(unint64_t)a4
{
  id v21 = a3;
  self->_lastSwipeAxis = a4;
  [(CapsuleNavigationBarViewController *)self _reattachCapsuleToCollectionView];
  [(CapsuleNavigationBarViewController *)self _updateHidingCapsuleAnimated:1];
  CGRect v6 = [(TabController *)self->_tabController tabCollectionViewProvider];
  CGRect v7 = [v6 tabOverview];

  [v7 setPresentedTabLayout:1];
  objc_msgSend(v7, "beginInteractivePresentationWithOffset:scale:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
  uint64_t v8 = [v21 selectedItemIndex];
  if (v8 == [v21 numberOfItems] - 1
    && !self->_interactivelyInsertedTabDocument
    && [v21 hasTrailingAction])
  {
    double v9 = [TabDocument alloc];
    double v10 = [(TabController *)self->_tabController activeTabDocument];
    double v11 = [v10 browserController];
    double v12 = [(TabDocument *)v9 initWithBrowserController:v11];
    interactivelyInsertedTabDocument = self->_interactivelyInsertedTabDocument;
    self->_interactivelyInsertedTabDocument = v12;

    [self->_interactivelyInsertedTabDocument setIsBlank:1];
    [self->_interactivelyInsertedTabDocument setInteractivelyInserted:1];
    [self->_interactivelyInsertedTabDocument displayNewTabOverridePageIfNecessary];
    tabController = self->_tabController;
    double v15 = self->_interactivelyInsertedTabDocument;
    double v16 = [(TabController *)tabController currentTabs];
    double v17 = [v16 lastObject];
    [(TabController *)tabController insertTab:v15 afterTab:v17 inBackground:1 animated:1];

    double v18 = [(TabController *)self->_tabController tabCollectionViewProvider];
    [v18 updateSnapshotIdentifiers];

    double v19 = [(TabController *)self->_tabController tabCollectionViewProvider];
    double v20 = [v19 tabSwitcherViewController];
    [v20 applyContentIfNeeded];
  }
}

- (void)capsuleCollectionView:(id)a3 didUpdateProgress:(double)a4 toSelectItemAtIndex:(int64_t)a5 progressToTopAction:(double)a6 snapToAxis:(unint64_t)a7
{
  id v12 = a3;
  unint64_t lastSwipeAxis = self->_lastSwipeAxis;
  self->_unint64_t lastSwipeAxis = a7;
  long double v14 = [v12 linkedPageView];

  if (!v14)
  {
    double v15 = [(TabController *)self->_tabController tabCollectionViewProvider];
    double v16 = [v15 tabOverview];

    [v16 targetScaleWithTabLayout:0];
    double v18 = (v17 + -1.0) * a6 + 1.0;
    LODWORD(v15) = objc_msgSend(v12, "_sf_usesLeftToRightLayout");
    int64_t v19 = [v12 selectedItemIndex];
    if (v15) {
      BOOL v20 = v19 < a5;
    }
    else {
      BOOL v20 = v19 > a5;
    }
    [v16 frame];
    double v21 = CGRectGetWidth(v37) * a4 * 1.2;
    if (v20) {
      double v22 = -v21;
    }
    else {
      double v22 = v21;
    }
    [v16 frame];
    double v23 = (1.0 - v18) * CGRectGetWidth(v38) * 0.5;
    [v12 selectedCapsuleOffset];
    double v25 = v23 + v24;
    if (a7 != 1 || a4 == 0.0) {
      double v27 = v25;
    }
    else {
      double v27 = v22;
    }
    objc_msgSend(v16, "frame", v25);
    double v28 = (1.0 - v18) * CGRectGetHeight(v39) * 0.5;
    [v12 selectedCapsuleOffset];
    double v30 = v28 + v18 * v29 * 0.5;
    if (self->_interactivelyInsertedTabDocument)
    {
      v31 = [(TabController *)self->_tabController tabCollectionViewProvider];
      v32 = [v31 tabOverview];
      if ([v12 numberOfItems] != a5) {
        a4 = 0.0;
      }
      v33 = [self->_interactivelyInsertedTabDocument tabOverviewItem];
      [v32 setInteractiveInsertionProgress:v33 forItem:a4];
    }
    objc_msgSend(v16, "updateInteractivePresentationWithOffset:scale:animated:", lastSwipeAxis != a7, v27, v30, v18);
    CGAffineTransformMakeScale(&v36, v18, v18);
    v34 = objc_msgSend(v12, "viewForItemAtIndex:", objc_msgSend(v12, "selectedItemIndex"));
    CGAffineTransform v35 = v36;
    [v34 setTransform:&v35];
  }
}

- (void)capsuleCollectionView:(id)a3 willEndSelectionGestureWithCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 linkedPageView];

  if (!v8)
  {
    double v9 = objc_msgSend(v6, "viewForItemAtIndex:", objc_msgSend(v6, "selectedItemIndex"));
    if ([v6 selectionGestureState] == 4)
    {
      [(CapsuleNavigationBarViewController *)self _attachSelectedCapsuleToTabOverview];
      double v10 = (void *)MEMORY[0x1E4FB1EB0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __99__CapsuleNavigationBarViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke;
      v16[3] = &unk_1E6D77E20;
      double v11 = &v17;
      double v17 = v9;
      id v12 = v9;
      [v10 performWithoutAnimation:v16];
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __99__CapsuleNavigationBarViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke_2;
      v14[3] = &unk_1E6D78CA8;
      double v11 = &v15;
      double v15 = v9;
      id v13 = v9;
      [v7 addAnimations:v14];
    }
  }
}

uint64_t __99__CapsuleNavigationBarViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __99__CapsuleNavigationBarViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)capsuleCollectionViewDidEndSelectionGesture:(id)a3
{
  id v10 = a3;
  if (self->_interactivelyInsertedTabDocument)
  {
    double v4 = [(TabController *)self->_tabController tabCollectionViewProvider];
    double v5 = [v4 tabOverview];
    id v6 = [self->_interactivelyInsertedTabDocument tabOverviewItem];
    [v5 setInteractiveInsertionProgress:v6 forItem:1.0];

    [(TabController *)self->_tabController closeTab:self->_interactivelyInsertedTabDocument animated:0];
    interactivelyInsertedTabDocument = self->_interactivelyInsertedTabDocument;
    self->_interactivelyInsertedTabDocument = 0;
  }
  uint64_t v8 = [(TabController *)self->_tabController tabCollectionViewProvider];
  double v9 = [v8 tabOverview];

  if ([v9 presentingInteractively])
  {
    [v9 endInteractivePresentationAllowingDismissalToTargetItem:0];
    [v9 dismissAnimated:1];
    [(CapsuleNavigationBarViewController *)self _updateHidingCapsuleAnimated:1];
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  capsuleCollectionView = self->_capsuleCollectionView;
  id v8 = a3;
  double v9 = [(SFCapsuleCollectionView *)capsuleCollectionView contentViewForItemAtIndex:[(SFCapsuleCollectionView *)capsuleCollectionView selectedItemIndex]];
  id v10 = [v8 view];

  if (v10 != v9)
  {
    double v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_12;
  }
  [v6 locationInView:v9];
  id v12 = objc_msgSend(v9, "hitTest:withEvent:", 0);
  id v13 = [v9 leadingButtons];
  if ([v13 containsObject:v12])
  {
  }
  else
  {
    long double v14 = [v9 trailingButtons];
    char v15 = [v14 containsObject:v12];

    if ((v15 & 1) == 0)
    {
      double v16 = [(TabController *)self->_tabController activeTabDocument];
      double v17 = [v16 urlForSharing];
      if (v17)
      {
        double v18 = objc_msgSend(MEMORY[0x1E4F28D78], "safari_itemProviderForTabDocument:", v16);
        int64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v18];
        [v19 setLocalObject:v17];
        v21[0] = v19;
        double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      }
      else
      {
        double v11 = (void *)MEMORY[0x1E4F1CBF0];
      }

      goto LABEL_11;
    }
  }
  double v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_11:

LABEL_12:
  return v11;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F97E48];
  id v6 = a4;
  id v7 = [v5 sharedLogger];
  [v7 didStartDragWithDragContentType:2];

  id v8 = [(TabController *)self->_tabController activeTabDocument];
  double v9 = [v8 uuid];
  [v6 setLocalContext:v9];

  id v10 = [v6 items];

  double v11 = [v10 firstObject];

  id v12 = [v11 localObject];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __71__CapsuleNavigationBarViewController_dragInteraction_sessionWillBegin___block_invoke;
  v14[3] = &unk_1E6D78CF8;
  id v15 = v12;
  id v13 = v12;
  [v11 setPreviewProvider:v14];
}

id __71__CapsuleNavigationBarViewController_dragInteraction_sessionWillBegin___block_invoke(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x1E4FB1718];
  long long v2 = *(void **)(a1 + 32);
  id v3 = [v2 _title];
  double v4 = [v1 previewForURL:v2 title:v3];

  return v4;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6 = [a3 view];
  id v7 = [(CapsuleNavigationBarViewController *)self _dragPreviewForNavigationBar:v6];

  return v7;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  double v4 = [(TabController *)self->_tabController activeTabDocument];
  if ([v4 hasQuickLookContent])
  {
    double v5 = [v4 quickLookDocument];
    id v6 = [MEMORY[0x1E4F74230] sharedConnection];
    id v7 = [v5 sourceURL];
    if ([v6 isURLManaged:v7]) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = 3;
    }
  }
  else
  {
    int64_t v8 = 3;
  }

  return v8;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return [MEMORY[0x1E4F78598] canCreateNavigationIntentForDropSession:a4];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  double v5 = objc_msgSend(a4, "localDragSession", a3);
  id v6 = [v5 localContext];

  if (v6)
  {
    id v7 = [(TabController *)self->_tabController activeTabDocument];
    int64_t v8 = [v7 uuid];

    if ([v8 isEqual:v6])
    {
      double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:0];

      goto LABEL_6;
    }
  }
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:2];
LABEL_6:

  return v9;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F78598];
  id v6 = a4;
  id v7 = [v5 builder];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__CapsuleNavigationBarViewController_dropInteraction_performDrop___block_invoke;
  v8[3] = &unk_1E6D78D20;
  void v8[4] = self;
  [v7 buildNavigationIntentForDropSession:v6 completionHandler:v8];
}

void __66__CapsuleNavigationBarViewController_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    long long v2 = *(void **)(*(void *)(a1 + 32) + 1112);
    id v3 = a2;
    id v4 = [v2 activeTabDocument];
    [v4 dispatchNavigationIntent:v3];
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double v5 = [(CapsuleNavigationBarViewController *)self _contextMenuActionProvider];
  if (v5)
  {
    self->_showingContextMenu = 1;
    id v6 = (void *)MEMORY[0x1E4FB1678];
    id v7 = [(TabController *)self->_tabController activeTabDocument];
    int64_t v8 = [v7 uuid];
    double v9 = [v6 configurationWithIdentifier:v8 previewProvider:0 actionProvider:v5];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)_contextMenuActionProvider
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  id v4 = [(TabController *)self->_tabController tabMenuProviderDataSource];
  double v5 = +[TabMenuProvider actionProviderForTab:v3 dataSource:v4 options:2065];

  return v5;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = [a3 view];
  id v7 = [(CapsuleNavigationBarViewController *)self _dragPreviewForNavigationBar:v6];

  return v7;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v6 = [a3 view];
  id v7 = [(CapsuleNavigationBarViewController *)self _dragPreviewForNavigationBar:v6];

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  capsuleCollectionView = self->_capsuleCollectionView;
  id v7 = a5;
  [(SFCapsuleCollectionView *)capsuleCollectionView setIgnoresKeyboardHideEvents:1];
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setSelectedItemUsesLiftedPreviewAppearance:1 animator:v7];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  self->_showingContextMenu = 0;
  capsuleCollectionView = self->_capsuleCollectionView;
  id v7 = a5;
  [(SFCapsuleCollectionView *)capsuleCollectionView setIgnoresKeyboardHideEvents:0];
  [(SFCapsuleCollectionView *)self->_capsuleCollectionView setSelectedItemUsesLiftedPreviewAppearance:0 animator:v7];
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v4 = [(CapsuleNavigationBarViewController *)self selectedItemNavigationBar];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v7 = a6;
  self->_focusingForScribble = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __119__CapsuleNavigationBarViewController__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
  v9[3] = &unk_1E6D78D48;
  void v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [(CapsuleNavigationBarViewController *)self transitionToState:2 animated:1 completionHandler:v9];
}

void __119__CapsuleNavigationBarViewController__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) unifiedField];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  *(unsigned char *)(*(void *)(a1 + 32) + 1097) = 0;
}

- (TabController)tabController
{
  return self->_tabController;
}

- (CapsuleNavigationBarViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CapsuleNavigationBarViewControllerDelegate *)WeakRetained;
}

- (UIResponder)customNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customNextResponder);
  return (UIResponder *)WeakRetained;
}

- (UIFocusEnvironment)customParentFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customParentFocusEnvironment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (BOOL)focusingForScribble
{
  return self->_focusingForScribble;
}

- (CapsuleNavigationBarLinkablePageView)linkedPageView
{
  return self->_linkedPageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedPageView, 0);
  objc_destroyWeak((id *)&self->_customParentFocusEnvironment);
  objc_destroyWeak((id *)&self->_customNextResponder);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tabController, 0);
  objc_storeStrong((id *)&self->_cachedSelectedItemNavigationBar, 0);
  objc_storeStrong((id *)&self->_tabs, 0);
  objc_storeStrong((id *)&self->_interactivelyInsertedTabDocument, 0);
  objc_storeStrong((id *)&self->_minimizedSizingNavigationBar, 0);
  objc_storeStrong((id *)&self->_sizingNavigationBar, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_capsuleCollectionView, 0);
  objc_storeStrong((id *)&self->_attachedTab, 0);
  objc_storeStrong(&self->_nextStateChangeCompletionHandler, 0);
}

@end