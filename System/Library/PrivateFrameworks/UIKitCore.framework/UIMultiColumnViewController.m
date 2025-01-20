@interface UIMultiColumnViewController
- (BOOL)_allowMultipleColumnsForPossibleStates:(id)a3 containerSize:(CGSize)a4;
- (BOOL)_canShowColumnIndex:(unint64_t)a3;
- (BOOL)sizeMightAllowMultipleColumns:(CGSize)a3;
- (NSArray)columnWidths;
- (NSArray)navControllers;
- (NSArray)viewControllers;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIImage)_columnToggleButtonImage;
- (UIMultiColumnViewController)initWithNavController:(id)a3 viewControllers:(id)a4;
- (UIMultiColumnViewControllerDelegate)delegate;
- (double)_unsafeAreaPaddingForFirstVisibleColumn;
- (double)keyboardInset;
- (id)_addSecondColumnBarButton:(int64_t)a3 toNavItem:(id)a4;
- (id)_contentSizesForColumnWidths:(id)a3;
- (id)_effectiveColumnWidths;
- (id)_liveVCs;
- (id)_navigationBarForDragAffordance;
- (id)_possibleContentSizes;
- (id)_preferredContentSizes;
- (id)_removeSecondColumnBarButton:(int64_t)a3 fromNavItem:(id)a4;
- (id)_secondColumnBarButtonItem:(int64_t)a3 createIfNecessary:(BOOL)a4;
- (id)_sideBarImage;
- (id)_splitViewControllerImageForDisplayModeButtonToShowPrimary:(id)a3;
- (id)childViewControllerForStatusBarStyle;
- (id)description;
- (id)separateSecondaryViewControllerForSplitViewController:(id)a3;
- (id)title;
- (unint64_t)_columnCountForPossibleStates:(id)a3 containerSize:(CGSize)a4;
- (unint64_t)columnCount;
- (void)_adjustNonOverlayScrollViewsForKeyboardInfo:(id)a3;
- (void)_collapseSecondaryViewController:(id)a3 forSplitViewController:(id)a4 withTransitionCoordinator:(id)a5;
- (void)_hideSecondColumn:(id)a3;
- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5;
- (void)_moveViewControllersForColumnCount:(unint64_t)a3;
- (void)_navigationControllerChangedViewControllers:(id)a3;
- (void)_setAllowNestedNavigationControllers:(BOOL)a3;
- (void)_setColumnToggleButtonImage:(id)a3;
- (void)_showSecondColumn:(id)a3;
- (void)_splitViewControllerDidUpdate:(id)a3 withSize:(CGSize)a4;
- (void)_splitViewControllerWillCollapseOntoPrimaryViewController:(id)a3;
- (void)_updateButtonsForColumnCount:(unint64_t)a3 animatingChange:(BOOL)a4;
- (void)_updateLayoutForStatusBarAndInterfaceOrientation;
- (void)_willShowColumnCount:(unint64_t)a3;
- (void)dealloc;
- (void)requestColumnCount:(unint64_t)a3 animated:(BOOL)a4;
- (void)setColumnWidths:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyboardInset:(double)a3;
- (void)setNavControllers:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)showViewController:(id)a3 sender:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation UIMultiColumnViewController

- (UIMultiColumnViewController)initWithNavController:(id)a3 viewControllers:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)UIMultiColumnViewController;
  v8 = [(UIViewController *)&v32 initWithNibName:0 bundle:0];
  if (v8)
  {
    id v26 = v7;
    uint64_t v9 = [v7 copy];
    viewControllers = v8->_viewControllers;
    v8->_viewControllers = (NSArray *)v9;

    v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
    unint64_t v12 = [(NSArray *)v8->_viewControllers count];
    if (v12 >= 2)
    {
      unint64_t v13 = v12 - 1;
      do
      {
        v14 = [UINavigationController alloc];
        v15 = [v6 navigationBar];
        uint64_t v16 = objc_opt_class();
        v17 = [v6 toolbar];
        v18 = [(UINavigationController *)v14 initWithNavigationBarClass:v16 toolbarClass:objc_opt_class()];

        [v11 addObject:v18];
        --v13;
      }
      while (v13);
    }
    objc_storeStrong((id *)&v8->_navControllers, v11);
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v11;
    uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [(UIViewController *)v8 addChildViewController:v24];
          [v24 didMoveToParentViewController:v8];
          [v19 addObserver:v8 selector:sel__navigationControllerChangedViewControllers_ name:0x1ED10DD40 object:v24];
          [v19 addObserver:v8 selector:sel__navigationControllerChangedViewControllers_ name:0x1ED10DD60 object:v24];
          [v19 addObserver:v8 selector:sel__navigationControllerChangedViewControllers_ name:0x1ED10DD80 object:v24];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v21);
    }

    id v7 = v26;
  }

  return v8;
}

- (void)dealloc
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = 0x1ED10DD40;
  v6[1] = 0x1ED10DD60;
  v6[2] = 0x1ED10DD80;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIMultiColumnViewController;
  [(UIViewController *)&v5 dealloc];
}

- (void)viewWillLayoutSubviews
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  v113.receiver = self;
  v113.super_class = (Class)UIMultiColumnViewController;
  [(UIViewController *)&v113 viewWillLayoutSubviews];
  v4 = [(UIViewController *)self view];
  objc_super v5 = [v4 window];

  if (!v5) {
    return;
  }
  BOOL v6 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
  unint64_t v7 = -[UIMultiColumnViewController _columnCountForPossibleStates:containerSize:](self, "_columnCountForPossibleStates:containerSize:", self->_possibleStatesAtLastUpdate, self->_containerSizeAtLastUpdate.width, self->_containerSizeAtLastUpdate.height);
  v8 = [(UIMultiColumnViewController *)self navControllers];
  unint64_t v9 = [v8 count];

  if (v9 < v7)
  {
    v91 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIMultiColumnViewController.m", 142, @"Not enough VCs for %lu columns", v7);
  }
  unint64_t lastColumnCount = self->_lastColumnCount;
  if (v6)
  {
    if (v7 > lastColumnCount) {
      goto LABEL_9;
    }
  }
  else if (v7 != lastColumnCount)
  {
LABEL_9:
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke;
    v112[3] = &unk_1E52D9CD0;
    v112[4] = self;
    v112[5] = v7;
    +[UIView performWithoutAnimation:v112];
    goto LABEL_10;
  }
  if ((*(unsigned char *)&self->_mcvcFlags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_10:
  BOOL v92 = v6;
  v11 = [(UIViewController *)self view];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  uint64_t v20 = [(UIViewController *)self view];
  uint64_t v21 = [v20 subviews];
  v93 = (void *)[v21 copy];

  uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke_2;
  aBlock[3] = &unk_1E52E9578;
  id v23 = v22;
  id v111 = v23;
  v24 = _Block_copy(aBlock);
  [(UIMultiColumnViewController *)self _effectiveColumnWidths];
  v96 = v95 = v24;
  if (v96)
  {
    v25 = [(UIViewController *)self view];
    int v26 = [v25 _shouldReverseLayoutDirection];

    if (v7)
    {
      unint64_t v27 = 0;
      if (v26) {
        double v28 = 0.0;
      }
      else {
        double v28 = v17;
      }
      int v94 = v26;
      do
      {
        long long v29 = [v96 objectAtIndexedSubscript:v27];
        [v29 doubleValue];
        double v31 = v30;

        if (!v27)
        {
          [(UIMultiColumnViewController *)self _unsafeAreaPaddingForFirstVisibleColumn];
          double v31 = v31 + v32;
        }
        if (v26) {
          double v33 = 0.0;
        }
        else {
          double v33 = v31;
        }
        double v34 = v28 - v33;
        double v35 = v13 + v34;
        double v36 = -0.0;
        if (v26) {
          double v36 = v31;
        }
        double v28 = v36 + v34;
        v37 = [(UIMultiColumnViewController *)self navControllers];
        v38 = [v37 objectAtIndexedSubscript:v27];

        (*((void (**)(void *, void *, double, double, double, double))v24 + 2))(v24, v38, v35, v15, v31, v19);
        unint64_t v39 = v27 + 1;
        if (v27 + 1 < v7)
        {
          v40 = [(UIViewController *)self traitCollection];
          [v40 displayScale];
          double v42 = 1.0 / v41;

          if (v26) {
            double v43 = 0.0;
          }
          else {
            double v43 = v42;
          }
          if (v26) {
            double v44 = v42;
          }
          else {
            double v44 = -0.0;
          }
          borderViews = self->_borderViews;
          if (!borderViews)
          {
            v46 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v47 = self->_borderViews;
            self->_borderViews = v46;

            borderViews = self->_borderViews;
          }
          double v48 = v28 - v43;
          if (v27 >= [(NSMutableArray *)borderViews count])
          {
            v49 = -[UIPanelBorderView initWithFrame:]([UIPanelBorderView alloc], "initWithFrame:", v13 + v48, v15, v42, v19);
            [(UIView *)v49 setTranslatesAutoresizingMaskIntoConstraints:0];
            [(NSMutableArray *)self->_borderViews addObject:v49];
          }
          else
          {
            v49 = [(NSMutableArray *)self->_borderViews objectAtIndexedSubscript:v27];
            -[UIView setFrame:](v49, "setFrame:", v13 + v48, v15, v42, v19);
          }
          v50 = [(UIViewController *)self splitViewController];
          v51 = v50;
          if (v50)
          {
            if (![v50 _usesPanelImpl]
              || ([v51 configuration],
                  v52 = objc_claimAutoreleasedReturnValue(),
                  [v52 borderColor],
                  v53 = objc_claimAutoreleasedReturnValue(),
                  v52,
                  !v53))
            {
              v54 = [v51 view];
              v53 = [v54 backgroundColor];
            }
            [(UIView *)v49 setBackgroundColor:v53];

            v24 = v95;
            int v26 = v94;
          }
          double v28 = v44 + v48;
          [v23 insertObject:v49 atIndex:0];
        }
        unint64_t v27 = v39;
      }
      while (v7 != v39);
    }
  }
  else
  {
    v55 = [(UIMultiColumnViewController *)self navControllers];
    uint64_t v56 = [v55 count];

    if (v56)
    {
      v57 = [(UIMultiColumnViewController *)self navControllers];
      v58 = [v57 objectAtIndexedSubscript:0];

      v59 = [(UIViewController *)self view];
      [v59 bounds];
      (*((void (**)(void *, void *))v24 + 2))(v24, v58);
    }
  }
  if (v92)
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v60 = v93;
    id v61 = v93;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v106 objects:v116 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v63; ++i)
        {
          if (*(void *)v107 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          if ([v23 indexOfObjectIdenticalTo:v66] == 0x7FFFFFFFFFFFFFFFLL)
          {
            [v66 frame];
            objc_msgSend(v66, "setFrame:", v13, v15);
          }
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v106 objects:v116 count:16];
      }
      while (v63);
    }

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v67 = v23;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v102 objects:v115 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v103;
      do
      {
        for (uint64_t j = 0; j != v69; ++j)
        {
          if (*(void *)v103 != v70) {
            objc_enumerationMutation(v67);
          }
          uint64_t v72 = *(void *)(*((void *)&v102 + 1) + 8 * j);
          v73 = [(UIViewController *)self view];
          [v73 addSubview:v72];
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v102 objects:v115 count:16];
      }
      while (v69);
    }
  }
  else
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v60 = v93;
    id v74 = v93;
    uint64_t v75 = [v74 countByEnumeratingWithState:&v98 objects:v114 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v99;
      do
      {
        for (uint64_t k = 0; k != v76; ++k)
        {
          if (*(void *)v99 != v77) {
            objc_enumerationMutation(v74);
          }
          v79 = *(void **)(*((void *)&v98 + 1) + 8 * k);
          if ([v23 indexOfObjectIdenticalTo:v79] == 0x7FFFFFFFFFFFFFFFLL) {
            [v79 removeFromSuperview];
          }
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v98 objects:v114 count:16];
      }
      while (v76);
    }

    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke_3;
    v97[3] = &unk_1E52DA8E8;
    v97[4] = self;
    [v23 enumerateObjectsUsingBlock:v97];
  }
  v80 = [(UIViewController *)self view];
  v81 = [(UIViewController *)self view];
  [v81 bounds];
  objc_msgSend(v80, "convertRect:toView:", 0);
  CGFloat v83 = v82;
  CGFloat v85 = v84;
  CGFloat v87 = v86;
  CGFloat v89 = v88;

  v118.origin.x = v83;
  v118.origin.y = v85;
  v118.size.width = v87;
  v118.size.height = v89;
  if (!CGRectEqualToRect(v118, self->_lastFrameInWindow))
  {
    self->_lastFrameInWindow.origin.x = v83;
    self->_lastFrameInWindow.origin.y = v85;
    self->_lastFrameInWindow.size.width = v87;
    self->_lastFrameInWindow.size.height = v89;
    [(UIMultiColumnViewController *)self keyboardInset];
    if (v90 > 0.0) {
      [(UIMultiColumnViewController *)self _adjustNonOverlayScrollViewsForKeyboardInfo:0];
    }
  }
}

uint64_t __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _willShowColumnCount:*(void *)(a1 + 40)];
  *(void *)(*(void *)(a1 + 32) + 976) = *(void *)(a1 + 40);
  *(unsigned char *)(*(void *)(a1 + 32) + 1008) |= 4u;
  return result;
}

void __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v22 = a2;
  v11 = [v22 view];
  double v12 = +[UIPanelWrapperView wrapperViewForView:v11];
  double v13 = [v22 _presentationController];
  double v14 = v13;
  if (v13)
  {
    if ([v13 shouldRemovePresentersView])
    {
      uint64_t v15 = 0;
    }
    else
    {
      [*(id *)(a1 + 32) insertObject:v12 atIndex:0];
      uint64_t v15 = 1;
    }
    double v16 = [v14 containerView];
    if (v16) {
      [*(id *)(a1 + 32) insertObject:v16 atIndex:v15];
    }

    objc_msgSend(v12, "setFrame:", a3, a4, a5, a6);
    uint64_t v17 = [v22 childModalViewController];
    if (v17)
    {
      double v18 = (void *)v17;
      do
      {
        double v19 = [v18 presentationController];
        int v20 = [v19 shouldPresentInFullscreen];

        if (v20) {
          break;
        }
        objc_msgSend(v18, "_updateControlledViewsToFrame:", a3, a4, a5, a6);
        uint64_t v21 = [v18 presentedViewController];

        double v18 = (void *)v21;
      }
      while (v21);
    }
  }
  else
  {
    [*(id *)(a1 + 32) insertObject:v12 atIndex:0];
    objc_msgSend(v12, "setFrame:", a3, a4, a5, a6);
  }
}

void __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  objc_super v5 = [*(id *)(a1 + 32) view];
  BOOL v6 = [v5 subviews];
  uint64_t v7 = [v6 indexOfObjectIdenticalTo:v9];

  if (v7 != a3)
  {
    v8 = [*(id *)(a1 + 32) view];
    [v8 insertSubview:v9 atIndex:a3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIMultiColumnViewController;
  [(UIViewController *)&v9 viewWillAppear:a3];
  v4 = [(UIViewController *)self view];
  [v4 setNeedsLayout];

  objc_super v5 = [(UIViewController *)self splitViewController];
  BOOL v6 = v5;
  if (v5)
  {
    if (([v5 isCollapsed] & 1) == 0)
    {
      uint64_t v7 = [v6 currentState];
      char v8 = [v7 leadingOverlapsMain];

      if ((v8 & 1) == 0) {
        [(UIMultiColumnViewController *)self _adjustNonOverlayScrollViewsForKeyboardInfo:0];
      }
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIMultiColumnViewController;
  [(UIViewController *)&v5 viewDidDisappear:a3];
  [(UIMultiColumnViewController *)self setKeyboardInset:0.0];
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_lastFrameInWindow.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_lastFrameInWindow.size = v4;
}

- (id)childViewControllerForStatusBarStyle
{
  v2 = [(UIMultiColumnViewController *)self navControllers];
  v3 = [v2 firstObject];

  return v3;
}

- (id)title
{
  v2 = [(UIMultiColumnViewController *)self navControllers];
  v3 = [v2 firstObject];
  CGSize v4 = [v3 title];

  return v4;
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v17)
  {
    uint64_t v7 = [(UIMultiColumnViewController *)self viewControllers];
    id v8 = [v7 lastObject];

    objc_super v9 = [(UIMultiColumnViewController *)self navControllers];
    v10 = [v9 firstObject];

    if (v8 == v17)
    {
      double v14 = [v17 navigationController];

      if (v14 == v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v10 _allowNestedNavigationControllers])
      {
        v11 = [(UIMultiColumnViewController *)self viewControllers];
        double v12 = (void *)[v11 mutableCopy];

        [v12 removeLastObject];
        [v12 addObject:v17];
        [(UIMultiColumnViewController *)self setViewControllers:v12];
        double v13 = [v8 navigationController];

        if (v13 == v10)
        {
          uint64_t v15 = [v10 viewControllers];
          double v16 = (void *)[v15 mutableCopy];

          objc_msgSend(v16, "replaceObjectAtIndex:withObject:", objc_msgSend(v16, "indexOfObjectIdenticalTo:", v8), v17);
          [v10 setViewControllers:v16 animated:0];
        }
        else
        {
          [v10 showViewController:v17 sender:v6];
        }

        goto LABEL_11;
      }
    }
    [v10 showViewController:v17 sender:v6];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_splitViewControllerWillCollapseOntoPrimaryViewController:(id)a3
{
  [(UIMultiColumnViewController *)self _moveViewControllersForColumnCount:1];
  *(unsigned char *)&self->_mcvcFlags &= ~4u;
  id v4 = [(UIViewController *)self _existingView];
  [v4 setNeedsLayout];
}

- (void)_collapseSecondaryViewController:(id)a3 forSplitViewController:(id)a4 withTransitionCoordinator:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  objc_super v9 = [(UIMultiColumnViewController *)self navControllers];
  id v14 = [v9 objectAtIndexedSubscript:0];

  v10 = [v14 overrideTraitCollectionForChildViewController:v8];
  v11 = objc_opt_class();
  double v12 = [v14 traitCollection];
  double v13 = [v11 _traitCollectionWithParentTraitCollection:v12 overrideTraitCollection:v10];

  [v8 _unsafeParentWillTransitionToTraitCollection:v13 withTransitionCoordinator:v7];
  [v14 pushViewController:v8 animated:0];
}

- (id)separateSecondaryViewControllerForSplitViewController:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIMultiColumnViewController *)self navControllers];
  id v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v6 separateSecondaryViewControllerForSplitViewController:v4];

  return v7;
}

- (NSArray)columnWidths
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 != 1)
  {
    if (v5)
    {
      objc_super v9 = [NSNumber numberWithDouble:320.0];
      v35[0] = v9;
      v10 = [NSNumber numberWithDouble:320.0];
      v35[1] = v10;
      v11 = (void *)MEMORY[0x1E4F1C978];
      double v12 = v35;
    }
    else
    {
      id v6 = [(UIViewController *)self splitViewController];
      int v7 = [v6 _iPhoneShouldUseOverlayInCurrentEnvironment];

      if (v7) {
        double v8 = 375.0;
      }
      else {
        double v8 = 320.0;
      }
      objc_super v9 = [NSNumber numberWithDouble:v8];
      v39[0] = v9;
      v10 = [NSNumber numberWithDouble:v8];
      v39[1] = v10;
      v11 = (void *)MEMORY[0x1E4F1C978];
      double v12 = v39;
    }
    goto LABEL_13;
  }
  double v13 = [(UIViewController *)self _existingView];
  id v14 = [v13 _screen];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[UIScreen mainScreen];
  }
  objc_super v9 = v16;

  [v9 _referenceBounds];
  if (v17 > 1210.0)
  {
    v10 = [NSNumber numberWithDouble:320.0];
    v38[0] = v10;
    v38[1] = &unk_1ED3F1BA8;
    v11 = (void *)MEMORY[0x1E4F1C978];
    double v12 = v38;
LABEL_13:
    double v18 = [v11 arrayWithObjects:v12 count:2];
LABEL_14:

    goto LABEL_15;
  }
  double v25 = v17;
  if (v17 <= 1112.0)
  {
    v10 = [NSNumber numberWithDouble:320.0];
    v36[0] = v10;
    double v30 = [NSNumber numberWithDouble:320.0];
    v36[1] = v30;
    double v31 = (void *)MEMORY[0x1E4F1C978];
    double v32 = v36;
LABEL_30:
    double v18 = [v31 arrayWithObjects:v32 count:2];

    goto LABEL_14;
  }
  if ((unint64_t)([(UIViewController *)self interfaceOrientation] - 3) > 1) {
    goto LABEL_29;
  }
  int v26 = [(UIViewController *)self splitViewController];
  unint64_t v27 = [v26 viewIfLoaded];
  [v27 frame];
  double v29 = v28;

  if (v29 != v25)
  {
LABEL_29:
    v10 = [NSNumber numberWithDouble:320.0];
    v37[0] = v10;
    double v30 = [NSNumber numberWithDouble:320.0];
    v37[1] = v30;
    double v31 = (void *)MEMORY[0x1E4F1C978];
    double v32 = v37;
    goto LABEL_30;
  }
  double v18 = &unk_1ED3EF770;
LABEL_15:

  double v19 = [(UIMultiColumnViewController *)self viewControllers];
  uint64_t v20 = [v19 count];

  if ((unint64_t)(v20 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"UIMultiColumnViewController.m" lineNumber:500 description:@"Unsupported number of columns"];
  }
  uint64_t v21 = [(UIMultiColumnViewController *)self viewControllers];
  uint64_t v22 = [v21 count];

  if (v22 == 1)
  {
    if ([v18 count] != 2)
    {
      double v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a2 object:self file:@"UIMultiColumnViewController.m" lineNumber:502 description:@"Computed incorrect column widths"];
    }
    uint64_t v23 = objc_msgSend(v18, "subarrayWithRange:", 1, 1);

    double v18 = (void *)v23;
  }
  return (NSArray *)v18;
}

- (void)requestColumnCount:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"UIMultiColumnViewController.m", 512, @"%@ currently only supports 1 or 2 columns.", v22 object file lineNumber description];
  }
  if ([(UIMultiColumnViewController *)self columnCount] != a3)
  {
    if ([(UIMultiColumnViewController *)self _canShowColumnIndex:a3 - 1])
    {
      int v7 = [(UIMultiColumnViewController *)self _preferredContentSizes];
      if (a3 - 1 >= [v7 count])
      {
        double v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("MultiColumnViewController", &qword_1EB25D500) + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          double v18 = v17;
          *(_DWORD *)buf = 134218240;
          unint64_t v24 = a3;
          __int16 v25 = 2048;
          uint64_t v26 = [v7 count];
          _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Cannot show %li columns as there are only %li preferredContentSizes", buf, 0x16u);
        }
      }
      else
      {
        double v8 = [v7 objectAtIndex:a3 - 1];
        [v8 CGSizeValue];
        double v10 = v9;

        v11 = objc_alloc_init(UISlidingBarStateRequest);
        [(UISlidingBarStateRequest *)v11 setLeadingWidth:v10];
        *(unsigned char *)&self->_mcvcFlags |= 8u;
        double v12 = [(UIViewController *)self splitViewController];
        double v13 = v12;
        if (v4) {
          [v12 _animateToRequest:v11];
        }
        else {
          [v12 setStateRequest:v11];
        }

        *(unsigned char *)&self->_mcvcFlags &= ~8u;
        [(UIMultiColumnViewController *)self _updateButtonsForColumnCount:a3 animatingChange:v4];
      }
    }
    else
    {
      id v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("MultiColumnViewController", &_MergedGlobals_7_2) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = v14;
        id v16 = [(UIMultiColumnViewController *)self _liveVCs];
        *(_DWORD *)buf = 134218240;
        unint64_t v24 = a3;
        __int16 v25 = 2048;
        uint64_t v26 = [v16 count];
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Cannot show %li columns as there are only %li view controllers currently being displayed.", buf, 0x16u);
      }
    }
  }
}

- (unint64_t)columnCount
{
  if (self->_animatingTargetColumnCount) {
    return self->_animatingTargetColumnCount;
  }
  if (self->_lastColumnCount <= 1) {
    return 1;
  }
  return self->_lastColumnCount;
}

- (id)_preferredContentSizes
{
  v3 = [(UIMultiColumnViewController *)self _effectiveColumnWidths];
  uint64_t v4 = [v3 count];
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  while ([(UIMultiColumnViewController *)self _canShowColumnIndex:v6])
  {
    if (v5 == ++v6)
    {
      uint64_t v6 = v5;
      break;
    }
  }
  if (v6)
  {
    int v7 = objc_msgSend(v3, "subarrayWithRange:", 0, v6);
    double v8 = [(UIMultiColumnViewController *)self _contentSizesForColumnWidths:v7];
  }
  else
  {
LABEL_8:
    v10.receiver = self;
    v10.super_class = (Class)UIMultiColumnViewController;
    double v8 = [(UIViewController *)&v10 _preferredContentSizes];
  }

  return v8;
}

- (void)_setAllowNestedNavigationControllers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)UIMultiColumnViewController;
  -[UIViewController _setAllowNestedNavigationControllers:](&v14, sel__setAllowNestedNavigationControllers_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(UIMultiColumnViewController *)self navControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _setAllowNestedNavigationControllers:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_navigationBarForDragAffordance
{
  v2 = [(UIMultiColumnViewController *)self navControllers];
  BOOL v3 = [v2 firstObject];
  uint64_t v4 = [v3 _navigationBarForDragAffordance];

  return v4;
}

- (void)_navigationControllerChangedViewControllers:(id)a3
{
  if ((*(unsigned char *)&self->_mcvcFlags & 1) == 0)
  {
    id v4 = [(UIViewController *)self parentViewController];
    [v4 preferredContentSizeDidChangeForChildContentContainer:self];
  }
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  [(UIViewController *)self _contentOverlayInsets];
  if (a4) {
    *a4 = 1;
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  double v8 = [(UIViewController *)self _existingView];
  int v9 = [v8 _shouldReverseLayoutDirection];

  [(UIViewController *)self systemMinimumLayoutMargins];
  if (v9) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  *a4 = v12;
  if (v9) {
    double v13 = v10;
  }
  else {
    double v13 = v11;
  }
  *a5 = v13;
}

- (void)_splitViewControllerDidUpdate:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__UIMultiColumnViewController__splitViewControllerDidUpdate_withSize___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  void aBlock[4] = self;
  double v8 = (void (**)(void))_Block_copy(aBlock);
  int v9 = [(UIViewController *)self splitViewController];
  double v10 = [v9 possibleStates];

  unint64_t v11 = -[UIMultiColumnViewController _columnCountForPossibleStates:containerSize:](self, "_columnCountForPossibleStates:containerSize:", v10, width, height);
  if (self->_possibleStatesAtLastUpdate) {
    BOOL v12 = v11 != self->_lastColumnCount;
  }
  else {
    BOOL v12 = 1;
  }
  self->_containerSizeAtLastUpdate.double width = width;
  self->_containerSizeAtLastUpdate.double height = height;
  objc_storeStrong((id *)&self->_possibleStatesAtLastUpdate, v10);
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__UIMultiColumnViewController__splitViewControllerDidUpdate_withSize___block_invoke_2;
    v16[3] = &unk_1E52DB330;
    v16[4] = self;
    double v17 = v8;
    +[UIView performWithoutAnimation:v16];
  }
  else
  {
    v8[2](v8);
  }
  if (([v7 isCollapsed] & 1) != 0
    || ([v7 currentState],
        double v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 leadingOverlapsMain],
        v13,
        v14))
  {
    [(UIMultiColumnViewController *)self setKeyboardInset:0.0];
  }
  if (v12)
  {
    uint64_t v15 = [(UIViewController *)self view];
    [v15 setNeedsLayout];
  }
}

uint64_t __70__UIMultiColumnViewController__splitViewControllerDidUpdate_withSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateButtonsForColumnCount:*(void *)(*(void *)(a1 + 32) + 976) animatingChange:0];
}

void __70__UIMultiColumnViewController__splitViewControllerDidUpdate_withSize___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "navControllers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) navigationBar];
        [v7 layoutIfNeeded];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_sideBarImage
{
  return +[UIImage systemImageNamed:@"sidebar.leading"];
}

- (id)_splitViewControllerImageForDisplayModeButtonToShowPrimary:(id)a3
{
  uint64_t v4 = [(UIViewController *)self splitViewController];
  uint64_t v5 = [v4 view];
  [v5 size];
  BOOL v6 = -[UIMultiColumnViewController sizeMightAllowMultipleColumns:](self, "sizeMightAllowMultipleColumns:");

  if (v6)
  {
    id v7 = [(UIMultiColumnViewController *)self _columnToggleButtonImage];

    if (!v7)
    {
      long long v8 = [(UIMultiColumnViewController *)self _sideBarImage];
      [(UIMultiColumnViewController *)self _setColumnToggleButtonImage:v8];
    }
    long long v9 = [(UIMultiColumnViewController *)self _columnToggleButtonImage];
  }
  else
  {
    long long v9 = 0;
  }
  return v9;
}

- (void)_updateLayoutForStatusBarAndInterfaceOrientation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(UIViewController *)self childViewControllers];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _updateLayoutForStatusBarAndInterfaceOrientation];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_adjustNonOverlayScrollViewsForKeyboardInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIViewController *)self parentViewController];
  uint64_t v6 = [v5 viewIfLoaded];

  if (v6)
  {
    long long v7 = -[UIViewController _keyboardSceneDelegate](self);
    [v7 verticalOverlapForView:v6 usingKeyboardInfo:v4];
    double v9 = v8;

    [(UIMultiColumnViewController *)self keyboardInset];
    if (v9 != v10)
    {
      [(UIMultiColumnViewController *)self setKeyboardInset:v9];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v11 = [(UIMultiColumnViewController *)self navControllers];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(_DWORD **)(*((void *)&v19 + 1) + 8 * v15);
            if (v16)
            {
              if (((v16[94] >> 1) & 3u) - 1 <= 1)
              {
                double v17 = [*(id *)(*((void *)&v19 + 1) + 8 * v15) topViewController];

                if (v17)
                {
                  double v18 = [v16 topViewController];
                  [v16 _computeAndApplyScrollContentInsetDeltaForViewController:v18];
                }
              }
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }
    }
  }
}

- (id)_effectiveColumnWidths
{
  uint64_t v3 = [(UIViewController *)self splitViewController];
  char v4 = [v3 _isCollapsed];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [(UIMultiColumnViewController *)self columnWidths];
    long long v7 = [v6 reverseObjectEnumerator];
    uint64_t v5 = [v7 allObjects];
  }
  return v5;
}

- (id)_possibleContentSizes
{
  uint64_t v3 = [(UIMultiColumnViewController *)self _effectiveColumnWidths];
  if ([v3 count])
  {
    char v4 = [(UIMultiColumnViewController *)self _contentSizesForColumnWidths:v3];
  }
  else
  {
    char v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (double)_unsafeAreaPaddingForFirstVisibleColumn
{
  v2 = [(UIViewController *)self splitViewController];
  uint64_t v3 = [v2 viewIfLoaded];
  char v4 = v3;
  if (v3)
  {
    [v3 safeAreaInsets];
    double v6 = v5;
    double v8 = v7;
    if ([v2 _layoutPrimaryOnRight]) {
      double v6 = v8;
    }
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (id)_contentSizesForColumnWidths:(id)a3
{
  id v4 = a3;
  [(UIViewController *)self preferredContentSize];
  double v6 = v5;
  unint64_t v7 = [v4 count];
  double v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  if (v7)
  {
    uint64_t v9 = 0;
    double v10 = 0.0;
    do
    {
      long long v11 = [v4 objectAtIndexedSubscript:v9];
      [v11 doubleValue];
      double v10 = v10 + v12;
      if (!v9)
      {
        [(UIMultiColumnViewController *)self _unsafeAreaPaddingForFirstVisibleColumn];
        double v10 = v10 + v13;
      }
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v10, v6);
      [v8 addObject:v14];

      if (++v9 < v7)
      {
        uint64_t v15 = [(UIViewController *)self traitCollection];
        [v15 displayScale];
        double v10 = v10 + 1.0 / v16;
      }
    }
    while (v7 != v9);
  }

  return v8;
}

- (id)_liveVCs
{
  uint64_t v3 = [(UIMultiColumnViewController *)self viewControllers];
  uint64_t v4 = [v3 count];

  uint64_t v5 = v4 + 1;
  double v6 = (void *)MEMORY[0x1E4F1CBF0];
  while (1)
  {
    uint64_t v7 = v5 - 1;
    if (v5 == 1) {
      break;
    }
    uint64_t v8 = v5 - 2;
    uint64_t v9 = [(UIMultiColumnViewController *)self viewControllers];
    double v10 = [v9 objectAtIndexedSubscript:v8];
    long long v11 = [v10 navigationController];

    uint64_t v5 = v7;
    if (v11)
    {
      double v12 = [(UIMultiColumnViewController *)self viewControllers];
      double v6 = objc_msgSend(v12, "subarrayWithRange:", 0, v7);

      break;
    }
  }
  return v6;
}

- (BOOL)_canShowColumnIndex:(unint64_t)a3
{
  uint64_t v4 = [(UIMultiColumnViewController *)self _liveVCs];
  LOBYTE(a3) = [v4 count] > a3;

  return a3;
}

- (void)_willShowColumnCount:(unint64_t)a3
{
  [(UIMultiColumnViewController *)self _updateButtonsForColumnCount:a3 animatingChange:0];
  [(UIMultiColumnViewController *)self _moveViewControllersForColumnCount:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    if (a3 <= 1) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = a3;
    }
    [WeakRetained multiColumnViewController:self willShowColumns:v5];
  }
}

- (void)_moveViewControllersForColumnCount:(unint64_t)a3
{
  *(unsigned char *)&self->_mcvcFlags |= 1u;
  if (a3 == 2)
  {
    double v6 = [(UIMultiColumnViewController *)self _liveVCs];
    uint64_t v7 = objc_msgSend(v6, "subarrayWithRange:", 0, 1);
    uint64_t v8 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
    uint64_t v9 = [(UIMultiColumnViewController *)self navControllers];
    double v10 = [v9 objectAtIndexedSubscript:0];
    [v10 setViewControllers:v8 animated:0];

    long long v11 = [(UIMultiColumnViewController *)self navControllers];
    double v12 = [v11 objectAtIndexedSubscript:1];
    [v12 setViewControllers:v7 animated:0];
  }
  else if (a3 == 1)
  {
    uint64_t v4 = [(UIMultiColumnViewController *)self _liveVCs];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__UIMultiColumnViewController__moveViewControllersForColumnCount___block_invoke;
    v13[3] = &unk_1E52D9F98;
    v13[4] = self;
    id v14 = v4;
    id v5 = v4;
    +[UIViewController _performWithoutDeferringTransitions:v13];
  }
  *(unsigned char *)&self->_mcvcFlags &= ~1u;
}

void __66__UIMultiColumnViewController__moveViewControllersForColumnCount___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navControllers];
  uint64_t v3 = [v2 objectAtIndexedSubscript:1];
  [v3 setViewControllers:MEMORY[0x1E4F1CBF0] animated:0];

  id v5 = [*(id *)(a1 + 32) navControllers];
  uint64_t v4 = [v5 objectAtIndexedSubscript:0];
  [v4 setViewControllers:*(void *)(a1 + 40) animated:0];
}

- (id)_addSecondColumnBarButton:(int64_t)a3 toNavItem:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(UIMultiColumnViewController *)self _secondColumnBarButtonItem:a3 createIfNecessary:1];
  uint64_t v8 = [v6 leftBarButtonItems];
  uint64_t v9 = (void *)v8;
  double v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    double v10 = (void *)v8;
  }
  id v11 = v10;

  uint64_t v12 = [v11 indexOfObjectIdenticalTo:v7];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = (void *)[v11 mutableCopy];
    uint64_t v15 = v14;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      [v14 removeObjectAtIndex:v13];
    }
    [v15 insertObject:v7 atIndex:0];
    [v6 setLeftBarButtonItems:v15];
  }
  return v7;
}

- (id)_removeSecondColumnBarButton:(int64_t)a3 fromNavItem:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(UIMultiColumnViewController *)self _secondColumnBarButtonItem:a3 createIfNecessary:0];
  if (v7)
  {
    uint64_t v8 = [v6 leftBarButtonItems];
    uint64_t v9 = (void *)v8;
    double v10 = (void *)MEMORY[0x1E4F1CBF0];
    if (v8) {
      double v10 = (void *)v8;
    }
    id v11 = v10;

    uint64_t v12 = [v11 indexOfObjectIdenticalTo:v7];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = v12;
      id v14 = (void *)[v11 mutableCopy];
      [v14 removeObjectAtIndex:v13];
      [v6 setLeftBarButtonItems:v14];
    }
  }

  return v7;
}

- (void)_updateButtonsForColumnCount:(unint64_t)a3 animatingChange:(BOOL)a4
{
  if ((*(unsigned char *)&self->_mcvcFlags & 8) != 0) {
    return;
  }
  BOOL v4 = a4;
  if (a4)
  {
    self->_unint64_t animatingTargetColumnCount = a3;
    *(unsigned char *)&self->_mcvcFlags |= 2u;
  }
  else
  {
    unint64_t animatingTargetColumnCount = self->_animatingTargetColumnCount;
    if (animatingTargetColumnCount)
    {
      if (animatingTargetColumnCount != a3) {
        goto LABEL_8;
      }
      self->_unint64_t animatingTargetColumnCount = 0;
    }
  }
  unint64_t animatingTargetColumnCount = a3;
LABEL_8:
  uint64_t v7 = [(UIMultiColumnViewController *)self viewControllers];
  if ([v7 count])
  {
    uint64_t v8 = [(UIMultiColumnViewController *)self viewControllers];
    uint64_t v9 = [v8 objectAtIndexedSubscript:0];
    double v10 = [v9 navigationItem];
  }
  else
  {
    double v10 = 0;
  }

  id v11 = [(UIMultiColumnViewController *)self viewControllers];
  if ((unint64_t)[v11 count] < 2)
  {
    id v14 = 0;
  }
  else
  {
    uint64_t v12 = [(UIMultiColumnViewController *)self viewControllers];
    uint64_t v13 = [v12 objectAtIndexedSubscript:1];
    id v14 = [v13 navigationItem];
  }
  if (animatingTargetColumnCount <= 1)
  {
    id v15 = [(UIMultiColumnViewController *)self _removeSecondColumnBarButton:1 fromNavItem:v10];
    if (!-[UIMultiColumnViewController _allowMultipleColumnsForPossibleStates:containerSize:](self, "_allowMultipleColumnsForPossibleStates:containerSize:", self->_possibleStatesAtLastUpdate, self->_containerSizeAtLastUpdate.width, self->_containerSizeAtLastUpdate.height))
    {
      if ((*(unsigned char *)&self->_mcvcFlags & 2) == 0) {
        id v22 = [(UIMultiColumnViewController *)self _removeSecondColumnBarButton:0 fromNavItem:v14];
      }
      goto LABEL_29;
    }
    [v10 _removeBackButtonView];
    double v16 = [(UIMultiColumnViewController *)self _addSecondColumnBarButton:0 toNavItem:v14];
    if ([v14 hidesBackButton]) {
      double v17 = 0.0;
    }
    else {
      double v17 = 1.0;
    }
    double v18 = [v16 view];
    [v18 setAlpha:v17];

    goto LABEL_26;
  }
  if (animatingTargetColumnCount == 2)
  {
    double v16 = [(UIMultiColumnViewController *)self _addSecondColumnBarButton:1 toNavItem:v10];
    if ([v10 hidesBackButton]) {
      double v19 = 0.0;
    }
    else {
      double v19 = 1.0;
    }
    long long v20 = [v16 view];
    [v20 setAlpha:v19];

    if ((*(unsigned char *)&self->_mcvcFlags & 2) == 0) {
      id v21 = [(UIMultiColumnViewController *)self _removeSecondColumnBarButton:0 fromNavItem:v14];
    }
LABEL_26:
  }
LABEL_29:
  if (v4)
  {
    uint64_t v23 = [v14 leftBarButtonItem];
    uint64_t v24 = [v23 view];

    if (v24)
    {
      double v25 = 0.0;
      if (animatingTargetColumnCount != 1) {
        double v25 = 1.0;
      }
      [v24 setAlpha:v25];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __76__UIMultiColumnViewController__updateButtonsForColumnCount_animatingChange___block_invoke;
      v27[3] = &unk_1E52D9FC0;
      id v28 = v24;
      BOOL v29 = animatingTargetColumnCount == 1;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __76__UIMultiColumnViewController__updateButtonsForColumnCount_animatingChange___block_invoke_2;
      v26[3] = &unk_1E52DC3A0;
      v26[4] = self;
      +[UIView animateWithDuration:v27 animations:v26 completion:0.35];
    }
  }
}

uint64_t __76__UIMultiColumnViewController__updateButtonsForColumnCount_animatingChange___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
}

uint64_t __76__UIMultiColumnViewController__updateButtonsForColumnCount_animatingChange___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1008) &= ~2u;
  return result;
}

- (BOOL)sizeMightAllowMultipleColumns:(CGSize)a3
{
  double width = a3.width;
  id v5 = [(UIViewController *)self splitViewController];
  if ([v5 _usesPanelImpl])
  {
    id v6 = [(UIViewController *)self traitCollection];
    BOOL v7 = [v6 userInterfaceIdiom] == 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return width > 1210.0 && v7;
}

- (BOOL)_allowMultipleColumnsForPossibleStates:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (-[UIMultiColumnViewController sizeMightAllowMultipleColumns:](self, "sizeMightAllowMultipleColumns:", width, height))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          double v13 = v11;
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "leadingWidth", (void)v16);
          if (v14 > 0.0)
          {
            double v11 = v14;
            if (v13 != 0.0)
            {
              double v11 = v13;
              if (v14 != v13)
              {
                LOBYTE(v9) = 1;
                goto LABEL_15;
              }
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
LABEL_15:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)_columnCountForPossibleStates:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(UIViewController *)self view];
  [v8 bounds];
  double v10 = v9;

  BOOL v11 = -[UIMultiColumnViewController _allowMultipleColumnsForPossibleStates:containerSize:](self, "_allowMultipleColumnsForPossibleStates:containerSize:", v7, width, height);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [(UIMultiColumnViewController *)self _possibleContentSizes];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (![(UIMultiColumnViewController *)self _canShowColumnIndex:v15 + i])
        {
          v15 += i;
          goto LABEL_17;
        }
        [v18 CGSizeValue];
        if (v19 >= v10 || !v11)
        {
          v15 += i + 1;
          goto LABEL_17;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      v15 += i;
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
LABEL_17:

  return v15;
}

- (id)_secondColumnBarButtonItem:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  if (a3 == 1)
  {
    p_hideSecondColumnBarButtonItem = &self->_hideSecondColumnBarButtonItem;
    hideSecondColumnBarButtonItem = self->_hideSecondColumnBarButtonItem;
    if (hideSecondColumnBarButtonItem) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = !a4;
    }
    if (v11) {
      goto LABEL_14;
    }
    uint64_t v12 = [UIBarButtonItem alloc];
    uint64_t v13 = [(UIMultiColumnViewController *)self _sideBarImage];
    double v10 = [(UIBarButtonItem *)v12 initWithImage:v13 style:0 target:self action:sel__hideSecondColumn_];

    goto LABEL_13;
  }
  if (!a3)
  {
    p_hideSecondColumnBarButtonItem = &self->_showSecondColumnBarButtonItem;
    hideSecondColumnBarButtonItem = self->_showSecondColumnBarButtonItem;
    if (hideSecondColumnBarButtonItem) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = !a4;
    }
    if (v7) {
      goto LABEL_14;
    }
    id v8 = [UIBarButtonItem alloc];
    double v9 = [(UIMultiColumnViewController *)self _sideBarImage];
    double v10 = [(UIBarButtonItem *)v8 initWithImage:v9 style:0 target:self action:sel__showSecondColumn_];

    [(UIBarButtonItem *)v10 _setActsAsFakeBackButton:1];
LABEL_13:
    [(UIBarButtonItem *)v10 setSpringLoaded:1];
    uint64_t v14 = *p_hideSecondColumnBarButtonItem;
    *p_hideSecondColumnBarButtonItem = v10;

    hideSecondColumnBarButtonItem = *p_hideSecondColumnBarButtonItem;
LABEL_14:
    unint64_t v15 = hideSecondColumnBarButtonItem;
    goto LABEL_16;
  }
  unint64_t v15 = 0;
LABEL_16:
  return v15;
}

- (void)_showSecondColumn:(id)a3
{
  BOOL v4 = [(UIMultiColumnViewController *)self navControllers];
  id v5 = [v4 objectAtIndexedSubscript:0];
  char v6 = [v5 _isTransitioning];

  if ((v6 & 1) == 0)
  {
    [(UIMultiColumnViewController *)self requestColumnCount:2 animated:1];
  }
}

- (void)_hideSecondColumn:(id)a3
{
}

- (id)description
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)UIMultiColumnViewController;
  uint64_t v3 = [(UIMultiColumnViewController *)&v52 description];
  BOOL v4 = (void *)[v3 mutableCopy];

  if (os_variant_has_internal_diagnostics())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "appendFormat:", @" delegate=%p vcs=[", WeakRetained);

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    BOOL v7 = self->_viewControllers;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v49;
      char v11 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(v7);
          }
          if (v11) {
            uint64_t v13 = @"%p";
          }
          else {
            uint64_t v13 = @" %p";
          }
          objc_msgSend(v4, "appendFormat:", v13, *(void *)(*((void *)&v48 + 1) + 8 * i));
          char v11 = 0;
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
        char v11 = 0;
      }
      while (v9);
    }

    [v4 appendFormat:@"] navs=["];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v14 = self->_navControllers;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v45;
      char v18 = 1;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(v14);
          }
          if (v18) {
            long long v20 = @"%p";
          }
          else {
            long long v20 = @" %p";
          }
          objc_msgSend(v4, "appendFormat:", v20, *(void *)(*((void *)&v44 + 1) + 8 * j));
          char v18 = 0;
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v44 objects:v55 count:16];
        char v18 = 0;
      }
      while (v16);
    }

    objc_msgSend(v4, "appendFormat:", @"] colCount=%lu", self->_lastColumnCount);
    if ([(NSArray *)self->_columnWidths count])
    {
      [v4 appendFormat:@" colWidths=["];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v21 = self->_columnWidths;
      uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v40 objects:v54 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v41;
        char v25 = 1;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v41 != v24) {
              objc_enumerationMutation(v21);
            }
            [*(id *)(*((void *)&v40 + 1) + 8 * k) doubleValue];
            if (v25) {
              id v28 = @"%g";
            }
            else {
              id v28 = @" %g";
            }
            objc_msgSend(v4, "appendFormat:", v28, v27);
            char v25 = 0;
          }
          uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v40 objects:v54 count:16];
          char v25 = 0;
        }
        while (v23);
      }

      [v4 appendFormat:@"]"];
    }
    if ([(NSArray *)self->_possibleStatesAtLastUpdate count])
    {
      [v4 appendFormat:@" possibleStates=["];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      BOOL v29 = self->_possibleStatesAtLastUpdate;
      uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v36 objects:v53 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v37;
        char v33 = 1;
        do
        {
          for (uint64_t m = 0; m != v31; ++m)
          {
            if (*(void *)v37 != v32) {
              objc_enumerationMutation(v29);
            }
            if (v33) {
              double v35 = @"%p";
            }
            else {
              double v35 = @" %p";
            }
            objc_msgSend(v4, "appendFormat:", v35, *(void *)(*((void *)&v36 + 1) + 8 * m));
            char v33 = 0;
          }
          uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v36 objects:v53 count:16];
          char v33 = 0;
        }
        while (v31);
      }

      [v4 appendFormat:@"]"];
    }
  }
  return v4;
}

- (UIMultiColumnViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIMultiColumnViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
}

- (NSArray)navControllers
{
  return self->_navControllers;
}

- (void)setNavControllers:(id)a3
{
}

- (void)setColumnWidths:(id)a3
{
}

- (double)keyboardInset
{
  return self->_keyboardInset;
}

- (void)setKeyboardInset:(double)a3
{
  self->_keyboardInset = a3;
}

- (UIImage)_columnToggleButtonImage
{
  return self->__columnToggleButtonImage;
}

- (void)_setColumnToggleButtonImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__columnToggleButtonImage, 0);
  objc_storeStrong((id *)&self->_columnWidths, 0);
  objc_storeStrong((id *)&self->_navControllers, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_possibleStatesAtLastUpdate, 0);
  objc_storeStrong((id *)&self->_borderViews, 0);
  objc_storeStrong((id *)&self->_hideSecondColumnBarButtonItem, 0);
  objc_storeStrong((id *)&self->_showSecondColumnBarButtonItem, 0);
}

@end