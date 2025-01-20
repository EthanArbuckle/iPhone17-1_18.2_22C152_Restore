@interface WGMajorListViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isFooterVisible;
- (BOOL)hasWidget;
- (BOOL)isHeaderVisible;
- (BOOL)shouldAnimateFirstTwoViewsAsOne;
- (BOOL)shouldAnimateLastTwoViewsAsOne;
- (NSArray)extraViews;
- (NSArray)extraViewsContainers;
- (UIView)containerView;
- (UIViewController)headerContentViewController;
- (WGWidgetListFooterView)footerView;
- (WGWidgetListHeaderView)headerView;
- (id)_group;
- (id)editingMaterialViewForWidgetListFooterView:(id)a3;
- (id)extraViewsContainer;
- (unint64_t)_insertionIndexofListItem:(id)a3 intoWidgetViews:(id)a4 withOrderedIdentifiers:(id)a5;
- (void)_configureStackView;
- (void)_insertHeaderView;
- (void)_repopulateStackViewWithWidgetIdentifiers:(id)a3;
- (void)_setFooterVisible:(BOOL)a3;
- (void)_updateEditButtonVisibilityAnimated:(BOOL)a3;
- (void)_updateFooterViewShouldBlurContent;
- (void)_updateFooterVisibility;
- (void)_updateHeaderVisibility;
- (void)editButtonTapped:(id)a3;
- (void)enumerateWidgetWrapperViewsUsingBlock:(id)a3;
- (void)invalidateVisibleWidgets;
- (void)presentEditView:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setEditingIcons:(BOOL)a3;
- (void)setHeaderContentViewController:(id)a3;
- (void)setHeaderVisible:(BOOL)a3;
- (void)setShouldBlurContent:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)widgetDiscoveryController:(id)a3 widgetWithIdentifier:(id)a4 shouldBecomeHiddenInGroup:(id)a5;
- (void)widgetDiscoveryController:(id)a3 widgetWithIdentifier:(id)a4 shouldBecomeVisibleInGroup:(id)a5;
- (void)widgetListFooterViewAvailableNewWidgetsUpdated:(id)a3;
@end

@implementation WGMajorListViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(WGMajorListViewController *)self _updateHeaderVisibility];
  [(WGMajorListViewController *)self _updateFooterVisibility];
  [(WGMajorListViewController *)self _updateEditButtonVisibilityAnimated:0];
  [(UIViewController *)self->_headerContentViewController wg_beginAppearanceTransitionIfNecessary:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGMajorListViewController;
  [(WGWidgetListViewController *)&v4 viewDidAppear:a3];
  [(UIViewController *)self->_headerContentViewController wg_endAppearanceTransitionIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(UIViewController *)self->_headerContentViewController wg_beginAppearanceTransitionIfNecessary:0 animated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGMajorListViewController;
  [(WGWidgetListViewController *)&v4 viewDidDisappear:a3];
  [(UIViewController *)self->_headerContentViewController wg_endAppearanceTransitionIfNecessary];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setHeaderContentViewController:(id)a3
{
  objc_super v5 = (UIViewController *)a3;
  p_headerContentViewController = &self->_headerContentViewController;
  headerContentViewController = self->_headerContentViewController;
  if (headerContentViewController != v5)
  {
    if (headerContentViewController && self->_headerView)
    {
      -[WGMajorListViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
      [(WGWidgetListHeaderView *)self->_headerView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_headerContentViewController, a3);
    v8 = *p_headerContentViewController;
    if (*p_headerContentViewController)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __60__WGMajorListViewController_setHeaderContentViewController___block_invoke;
      v9[3] = &unk_264677430;
      v9[4] = self;
      [(WGMajorListViewController *)self bs_addChildViewController:v8 withSuperview:0 animated:0 transitionBlock:v9];
    }
  }
}

void __60__WGMajorListViewController_setHeaderContentViewController___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1120) view];
  v2 = [[WGWidgetListHeaderView alloc] initWithContentView:v5];
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 1128);
  *(void *)(v3 + 1128) = v2;

  [*(id *)(a1 + 32) _insertHeaderView];
  [*(id *)(a1 + 32) _didUpdateStackViewArrangedSubviews];
}

- (void)_insertHeaderView
{
  v74 = [(WGWidgetListHeaderView *)self->_headerView contentView];
  [(UIStackView *)self->super._stackView insertArrangedSubview:self->_headerView atIndex:0];
  [(WGWidgetListViewController *)self _didUpdateStackViewArrangedSubviews];
  v73 = [MEMORY[0x263F29CA0] sharedInstance];
  int v72 = [v73 deviceClass];
  if (v72 != 2)
  {
    int v5 = 0;
    goto LABEL_7;
  }
  v68 = [MEMORY[0x263F1C920] mainScreen];
  [v68 _referenceBounds];
  if (CGRectGetHeight(v76) <= 1194.0)
  {
    int v5 = 0;
    goto LABEL_7;
  }
  uint64_t v3 = [MEMORY[0x263F29CA0] sharedInstance];
  if ([v3 homeButtonType] != 2)
  {
    v63 = v3;
    int v5 = 1;
LABEL_7:
    v6 = [MEMORY[0x263F29CA0] sharedInstance];
    int v71 = [v6 deviceClass];
    if (v71 == 2)
    {
      v7 = [MEMORY[0x263F1C920] mainScreen];
      [v7 _referenceBounds];
      if (CGRectGetHeight(v77) <= 1024.0)
      {
        v69 = v7;
        int v9 = 0;
      }
      else
      {
        v8 = [MEMORY[0x263F29CA0] sharedInstance];
        if ([v8 homeButtonType] == 2)
        {

          double v4 = 44.0;
          if ((v5 & 1) == 0) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }
        v62 = v8;
        v69 = v7;
        int v9 = 1;
      }
    }
    else
    {
      int v9 = 0;
    }
    v10 = [MEMORY[0x263F29CA0] sharedInstance];
    int v11 = [v10 deviceClass];
    if (v11 == 2)
    {
      v12 = [MEMORY[0x263F1C920] mainScreen];
      [v12 _referenceBounds];
      if (CGRectGetHeight(v78) > 1194.0)
      {

        uint64_t v13 = 0x4040000000000000;
LABEL_23:
        double v4 = *(double *)&v13;
        goto LABEL_32;
      }
      v64 = v12;
      int v11 = 2;
    }
    v70 = [MEMORY[0x263F29CA0] sharedInstance];
    int v67 = [v70 deviceClass];
    if (v67 == 2)
    {
      v14 = [MEMORY[0x263F1C920] mainScreen];
      [v14 _referenceBounds];
      if (CGRectGetHeight(v79) > 1080.0)
      {

        if (v11 == 2) {
        uint64_t v13 = 0x4046000000000000;
        }
        goto LABEL_23;
      }
      v58 = v14;
    }
    v66 = [MEMORY[0x263F29CA0] sharedInstance];
    int v65 = [v66 deviceClass];
    if (v65 == 2)
    {
      v15 = [MEMORY[0x263F1C920] mainScreen];
      [v15 _referenceBounds];
      if (CGRectGetHeight(v80) > 1024.0)
      {

        if (v67 == 2) {
        if (v11 == 2)
        }

        double v4 = 37.0;
        goto LABEL_32;
      }
      v52 = v15;
    }
    v19 = [MEMORY[0x263F29CA0] sharedInstance];
    double v4 = 29.0;
    if ([v19 deviceClass] == 2)
    {
LABEL_77:

      if (v65 == 2) {
      if (v67 == 2)
      }

      if (v11 == 2) {
      v16 = v69;
      }
      int v17 = v71;
      if (!v9)
      {
LABEL_34:
        if (v17 == 2) {

        }
        if (!v5)
        {
LABEL_38:
          if (v72 != 2) {
            goto LABEL_40;
          }
          goto LABEL_39;
        }
LABEL_37:

        goto LABEL_38;
      }
LABEL_33:

      goto LABEL_34;
    }
    v61 = v19;
    int v59 = v9;
    int v60 = v5;
    v57 = [MEMORY[0x263F29CA0] sharedInstance];
    int v56 = [v57 deviceClass];
    if (!v56
      || ([MEMORY[0x263F29CA0] sharedInstance],
          v51 = objc_claimAutoreleasedReturnValue(),
          [v51 deviceClass] == 1))
    {
      v43 = [MEMORY[0x263F1C920] mainScreen];
      [v43 _referenceBounds];
      if (CGRectGetHeight(v81) <= 812.0)
      {
        uint64_t v53 = 0x100000000;
      }
      else
      {
        v39 = [MEMORY[0x263F29CA0] sharedInstance];
        if ([v39 homeButtonType] == 2 && _BSUI_Private_IsN84())
        {

          if (v56) {
          if (v65 == 2)
          }

          if (v67 == 2) {
          if (v11 == 2)
          }

          double v4 = 0.0;
LABEL_32:
          v16 = v69;
          int v17 = v71;
          if ((v9 & 1) == 0) {
            goto LABEL_34;
          }
          goto LABEL_33;
        }
        uint64_t v53 = 0x100000001;
      }
    }
    else
    {
      uint64_t v53 = 0;
    }
    v54 = [MEMORY[0x263F29CA0] sharedInstance];
    int v55 = [v54 deviceClass];
    if (!v55
      || ([MEMORY[0x263F29CA0] sharedInstance],
          v47 = objc_claimAutoreleasedReturnValue(),
          [v47 deviceClass] == 1))
    {
      v41 = [MEMORY[0x263F1C920] mainScreen];
      [v41 _referenceBounds];
      if (CGRectGetHeight(v82) <= 812.0)
      {
        int v20 = 0;
        int v50 = 1;
      }
      else
      {
        v21 = [MEMORY[0x263F29CA0] sharedInstance];
        if ([v21 homeButtonType] == 2)
        {

          if (v55) {
          v22 = v57;
          }
          int v23 = v56;
          if (v53)
          {
LABEL_100:

            if ((v53 & 0x100000000) == 0) {
              goto LABEL_74;
            }
            goto LABEL_73;
          }
LABEL_72:
          if (!HIDWORD(v53))
          {
LABEL_74:
            if (v23) {

            }
            double v4 = 0.0;
            v19 = v61;
            goto LABEL_77;
          }
LABEL_73:

          goto LABEL_74;
        }
        v34 = v21;
        int v50 = 1;
        int v20 = 1;
      }
    }
    else
    {
      int v50 = 0;
      int v20 = 0;
    }
    v24 = [MEMORY[0x263F29CA0] sharedInstance];
    int v48 = [v24 deviceClass];
    v49 = v24;
    if (!v48
      || ([MEMORY[0x263F29CA0] sharedInstance],
          v42 = objc_claimAutoreleasedReturnValue(),
          [v42 deviceClass] == 1))
    {
      v40 = [MEMORY[0x263F1C920] mainScreen];
      [v40 _referenceBounds];
      if (CGRectGetHeight(v83) <= 736.0)
      {
        uint64_t v46 = 0x100000000;
      }
      else
      {
        int v25 = v20;
        v26 = [MEMORY[0x263F29CA0] sharedInstance];
        if ([v26 homeButtonType] == 2)
        {

          if (v48) {
          v22 = v57;
          }
          int v23 = v56;
          if (v25)
          {
LABEL_127:

            if ((v50 & 1) == 0)
            {
LABEL_97:
              if (v55) {

              }
              if (v53) {
                goto LABEL_100;
              }
              goto LABEL_72;
            }
LABEL_96:

            goto LABEL_97;
          }
LABEL_95:
          if (!v50) {
            goto LABEL_97;
          }
          goto LABEL_96;
        }
        v33 = v26;
        uint64_t v46 = 0x100000001;
        int v20 = v25;
      }
    }
    else
    {
      uint64_t v46 = 0;
    }
    v45 = [MEMORY[0x263F29CA0] sharedInstance];
    int v44 = [v45 deviceClass];
    if (!v44
      || ([MEMORY[0x263F29CA0] sharedInstance],
          v36 = objc_claimAutoreleasedReturnValue(),
          [v36 deviceClass] == 1))
    {
      v38 = [MEMORY[0x263F1C920] mainScreen];
      [v38 _referenceBounds];
      if (CGRectGetHeight(v84) > 667.0)
      {
        int v29 = v20;
LABEL_115:
        v22 = v57;
        int v23 = v56;

        goto LABEL_118;
      }
      int v27 = v20;
      int v37 = v11;
      int v28 = 1;
    }
    else
    {
      int v27 = v20;
      int v37 = v11;
      int v28 = 0;
    }
    v30 = [MEMORY[0x263F29CA0] sharedInstance];
    int v31 = [v30 deviceClass];
    if (v31
      && ([MEMORY[0x263F29CA0] sharedInstance],
          v35 = objc_claimAutoreleasedReturnValue(),
          [v35 deviceClass] != 1)
      || ([MEMORY[0x263F1C920] mainScreen],
          v32 = objc_claimAutoreleasedReturnValue(),
          [v32 _referenceBounds],
          CGRectGetHeight(v85),
          v32,
          v31))
    {
      int v29 = v27;

      if (v28)
      {
LABEL_114:
        int v9 = v59;
        int v5 = v60;
        int v11 = v37;
        goto LABEL_115;
      }
    }
    else
    {
      int v29 = v27;

      if (v28) {
        goto LABEL_114;
      }
    }
    int v9 = v59;
    int v5 = v60;
    int v11 = v37;
    v22 = v57;
    int v23 = v56;
LABEL_118:
    if (v44) {

    }
    if (v46)
    {
    }
    else if (!HIDWORD(v46))
    {
      goto LABEL_124;
    }

LABEL_124:
    if (v48) {

    }
    if (v29) {
      goto LABEL_127;
    }
    goto LABEL_95;
  }

  double v4 = 32.0;
LABEL_39:

LABEL_40:
  [v74 layoutMargins];
  [(UIStackView *)self->super._stackView setCustomSpacing:self->_headerView afterView:v4 - v18];
}

- (void)setHeaderVisible:(BOOL)a3
{
  if (self->_headerVisible != a3)
  {
    self->_headerVisible = a3;
    id v4 = [(WGWidgetListViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 majorListViewControllerDidChangeHeaderVisibility:self];
    }
  }
}

- (void)_setFooterVisible:(BOOL)a3
{
  if (self->_footerVisible != a3)
  {
    self->_footerVisible = a3;
    BOOL v4 = [(WGMajorListViewController *)self _appearState] != 0;
    [(WGMajorListViewController *)self _updateEditButtonVisibilityAnimated:v4];
  }
}

- (void)enumerateWidgetWrapperViewsUsingBlock:(id)a3
{
  id v4 = a3;
  int v5 = [(UIStackView *)self->super._stackView arrangedSubviews];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__WGMajorListViewController_enumerateWidgetWrapperViewsUsingBlock___block_invoke;
  v7[3] = &unk_264677458;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __67__WGMajorListViewController_enumerateWidgetWrapperViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)hasWidget
{
  id v3 = [(WGWidgetDiscoveryController *)self->super._discoveryController enabledWidgetIdentifiersForAllGroups];
  uint64_t v4 = [v3 count];
  int v5 = [(WGWidgetDiscoveryController *)self->super._discoveryController disabledWidgetIdentifiers];
  LOBYTE(v4) = v4 + [v5 count] != 0;

  return v4;
}

- (NSArray)extraViewsContainers
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->super._stackView;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (NSArray)extraViews
{
  id v3 = objc_opt_new();
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __39__WGMajorListViewController_extraViews__block_invoke;
  int v11 = &unk_264677480;
  v12 = self;
  id v4 = v3;
  id v13 = v4;
  [(WGWidgetListViewController *)self _invokeBlockWithPlatterViewsVisibleInBounds:&v8];
  if ([(WGMajorListViewController *)self isHeaderVisible]) {
    [v4 insertObject:self->_headerView atIndex:0];
  }
  if ([(WGMajorListViewController *)self _isFooterVisible]) {
    [v4 addObject:self->_footerView];
  }
  int v5 = v13;
  id v6 = (NSArray *)v4;

  return v6;
}

void __39__WGMajorListViewController_extraViews__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _wrapperViewForWidgetPlatterView:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (BOOL)shouldAnimateLastTwoViewsAsOne
{
  v2 = [(WGMajorListViewController *)self extraViews];
  if ((unint64_t)[v2 count] < 2)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v3 = [v2 lastObject];
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

    if (!v8) {
      goto LABEL_11;
    }
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    id v13 = [v8 platterView];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;

    int v18 = 1;
    if (v10 == v15 && v12 == v17)
    {
LABEL_11:
      v19 = [v2 lastObject];
      uint64_t v20 = objc_opt_class();
      id v21 = v19;
      if (v20)
      {
        if (objc_opt_isKindOfClass()) {
          v22 = v21;
        }
        else {
          v22 = 0;
        }
      }
      else
      {
        v22 = 0;
      }
      id v23 = v22;

      if (v23)
      {
        v24 = [v23 contentView];
        int v25 = v24;
        if (v24) {
          [v24 transform];
        }
        int v18 = BSFloatLessThanFloat();
      }
      else
      {
        int v18 = 0;
      }
    }
    BOOL v7 = v18 != 0;
  }

  return v7;
}

- (BOOL)shouldAnimateFirstTwoViewsAsOne
{
  v2 = [(WGMajorListViewController *)self extraViews];
  if ((unint64_t)[v2 count] < 2)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v3 = [v2 firstObject];
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

    if (v8)
    {
      [v8 bounds];
      double v10 = v9;
      double v12 = v11;
      id v13 = [v8 platterView];
      [v13 bounds];
      BOOL v7 = v12 != v15 || v10 != v14;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (id)extraViewsContainer
{
  return self->super._stackView;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if ([(UIViewController *)self wg_isAppearingOrAppeared])
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__4;
    v14[4] = __Block_byref_object_dispose__4;
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v13[3] = &unk_264677048;
    v13[4] = v14;
    [(WGWidgetListViewController *)self _invokeBlockWithPlatterViewsVisibleInBounds:v13];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v12[3] = &unk_2646774A8;
    v12[4] = self;
    v12[5] = v14;
    id v8 = (void (**)(void))MEMORY[0x223CAA850](v12);
    double v9 = v8;
    if (v7)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
      v10[3] = &unk_2646768A0;
      double v11 = v8;
      [v7 animateAlongsideTransition:0 completion:v10];
    }
    else
    {
      v8[2](v8);
    }

    _Block_object_dispose(v14, 8);
  }
}

uint64_t __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 listItem];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

void __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v13[3] = &unk_264677048;
  v13[4] = *(void *)(a1 + 40);
  [v2 _invokeBlockWithPlatterViewsVisibleInBounds:v13];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, 0, (void)v9);
        objc_msgSend(v8, "wg_endAppearanceTransitionIfNecessary");
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

uint64_t __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 listItem];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = (void *)v3;
    if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) containsObject:v3])
    {
      uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeObject:v6];
    }
    else
    {
      objc_msgSend(v6, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, 0);
      uint64_t v3 = objc_msgSend(v6, "wg_endAppearanceTransitionIfNecessary");
    }
    uint64_t v4 = (uint64_t)v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_group
{
  return @"TodayGroup";
}

- (void)_configureStackView
{
  v8.receiver = self;
  v8.super_class = (Class)WGMajorListViewController;
  [(WGWidgetListViewController *)&v8 _configureStackView];
  uint64_t v3 = objc_alloc_init(WGWidgetListFooterView);
  footerView = self->_footerView;
  self->_footerView = v3;

  [(WGWidgetListFooterView *)self->_footerView setDelegate:self];
  uint64_t v5 = [(WGWidgetListFooterView *)self->_footerView editButton];
  [v5 addTarget:self action:sel_editButtonTapped_ forControlEvents:64];

  uint64_t v6 = [(WGWidgetListFooterView *)self->_footerView widgetAvailableButton];
  [v6 addTarget:self action:sel_editButtonTapped_ forControlEvents:64];

  id v7 = [(WGWidgetListFooterView *)self->_footerView customizeButton];
  [v7 addTarget:self action:sel_presentEditView_ forControlEvents:64];

  [(WGMajorListViewController *)self _updateFooterViewShouldBlurContent];
  [(WGMajorListViewController *)self invalidateVisibleWidgets];
}

- (void)_repopulateStackViewWithWidgetIdentifiers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGMajorListViewController;
  [(WGWidgetListViewController *)&v4 _repopulateStackViewWithWidgetIdentifiers:a3];
  if (self->_headerView) {
    [(WGMajorListViewController *)self _insertHeaderView];
  }
  if (self->_footerView) {
    -[UIStackView addArrangedSubview:](self->super._stackView, "addArrangedSubview:");
  }
  [(WGWidgetListViewController *)self _didUpdateStackViewArrangedSubviews];
}

- (unint64_t)_insertionIndexofListItem:(id)a3 intoWidgetViews:(id)a4 withOrderedIdentifiers:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)WGMajorListViewController;
  id v6 = [(WGWidgetListViewController *)&v11 _insertionIndexofListItem:a3 intoWidgetViews:a4 withOrderedIdentifiers:a5];
  if (self->_headerContentViewController && self->_headerView)
  {
    id v7 = [(UIStackView *)self->super._stackView arrangedSubviews];
    char v8 = [v7 containsObject:self->_headerView];
    if (v6) {
      char v9 = 0;
    }
    else {
      char v9 = v8;
    }

    if (v9) {
      return 1;
    }
  }
  return (unint64_t)v6;
}

- (void)setShouldBlurContent:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGMajorListViewController;
  [(WGWidgetListViewController *)&v4 setShouldBlurContent:a3];
  [(WGMajorListViewController *)self _updateFooterViewShouldBlurContent];
}

- (void)setEditingIcons:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(WGWidgetListViewController *)self isEditingIcons];
  v6.receiver = self;
  v6.super_class = (Class)WGMajorListViewController;
  [(WGWidgetListViewController *)&v6 setEditingIcons:v3];
  if (v5 != v3)
  {
    [(WGMajorListViewController *)self _updateFooterVisibility];
    [(WGMajorListViewController *)self _updateEditButtonVisibilityAnimated:1];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGMajorListViewController;
  [(WGWidgetListViewController *)&v4 scrollViewDidScroll:a3];
  [(WGMajorListViewController *)self _updateHeaderVisibility];
  [(WGMajorListViewController *)self _updateFooterVisibility];
}

- (void)widgetListFooterViewAvailableNewWidgetsUpdated:(id)a3
{
  objc_super v4 = [(WGWidgetListFooterView *)self->_footerView editButton];
  [v4 addTarget:self action:sel_editButtonTapped_ forControlEvents:64];

  id v5 = [(WGWidgetListFooterView *)self->_footerView widgetAvailableButton];
  [v5 addTarget:self action:sel_editButtonTapped_ forControlEvents:64];
}

- (id)editingMaterialViewForWidgetListFooterView:(id)a3
{
  objc_super v4 = [(WGWidgetListViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 editingMaterialViewForWidgetListViewController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)presentEditView:(id)a3
{
}

- (void)editButtonTapped:(id)a3
{
  id v4 = [(WGWidgetListViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 editButtonTappedFromWidgetListViewController:self];
  }
}

- (void)_updateFooterViewShouldBlurContent
{
  [(WGWidgetListFooterView *)self->_footerView setShouldBlurContent:[(WGWidgetListViewController *)self shouldBlurContent]];
  footerView = self->_footerView;
  [(WGWidgetListFooterView *)footerView setMaterialGroupNameBase:@"WGWidgetListViewControllerGroupName"];
}

- (void)invalidateVisibleWidgets
{
  BOOL v3 = [(WGWidgetDiscoveryController *)self->super._discoveryController visibleWidgetIdentifiersForGroup:@"TodayGroup"];
  id v4 = [(WGWidgetDiscoveryController *)self->super._discoveryController visibleWidgetIdentifiersForGroup:@"WidgetGroup"];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  [(WGWidgetListFooterView *)self->_footerView setVisibleWidgetsIDs:v5];
}

- (void)widgetDiscoveryController:(id)a3 widgetWithIdentifier:(id)a4 shouldBecomeVisibleInGroup:(id)a5
{
  id v19 = a4;
  id v7 = a5;
  char v8 = [(WGMajorListViewController *)self _group];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    long long v10 = [(WGWidgetListViewController *)self _platterViewForWidgetWithIdentifier:v19 creatingIfNecessary:0];
    if (!v10) {
      goto LABEL_5;
    }
    uint64_t v11 = [(WGWidgetListViewController *)self _wrapperViewForWidgetPlatterView:v10];
    if (!v11
      || (long long v12 = (void *)v11,
          [(UIStackView *)self->super._stackView arrangedSubviews],
          id v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 containsObject:v12],
          v13,
          v12,
          (v14 & 1) == 0))
    {
LABEL_5:
      int v15 = [(WGMajorListViewController *)self _appearState];
      objc_super v16 = [(WGWidgetListViewController *)self _listItemViewControllerForWidgetWithIdentifier:v19 creatingIfNecessary:1];
      double v17 = [(WGWidgetListViewController *)self visibleWidgetIdentifiers];
      [(WGWidgetListViewController *)self _insert:1 listItem:v16 withOrderedIdentifiers:v17 animated:v15 == 2];
      int v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();

      if (v15 == 2) {
        objc_msgSend(v16, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, 1);
      }
      if (v18) {
        v18[2](v18);
      }
      if (v15 == 2) {
        objc_msgSend(v16, "wg_endAppearanceTransitionIfNecessary");
      }
      [(WGMajorListViewController *)self invalidateVisibleWidgets];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)widgetDiscoveryController:(id)a3 widgetWithIdentifier:(id)a4 shouldBecomeHiddenInGroup:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  char v8 = [(WGMajorListViewController *)self _group];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    int v10 = [(WGMajorListViewController *)self _appearState];
    uint64_t v11 = [(WGWidgetListViewController *)self _listItemViewControllerForWidgetWithIdentifier:v14 creatingIfNecessary:1];
    long long v12 = [(WGWidgetListViewController *)self visibleWidgetIdentifiers];
    [(WGWidgetListViewController *)self _insert:0 listItem:v11 withOrderedIdentifiers:v12 animated:v10 == 2];
    id v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();

    if (v10 == 2) {
      objc_msgSend(v11, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, 1);
    }
    if (v13) {
      v13[2](v13);
    }
    if (v10 == 2) {
      objc_msgSend(v11, "wg_endAppearanceTransitionIfNecessary");
    }
    [(WGWidgetListViewController *)self _pruneAlternateCaptureOnlyMaterialViews];
    [(WGMajorListViewController *)self invalidateVisibleWidgets];
  }
}

- (void)_updateHeaderVisibility
{
  if (self->_headerContentViewController)
  {
    BOOL v3 = [(WGMajorListViewController *)self headerContentViewController];
    id v10 = [v3 view];

    [(WGWidgetListHeaderView *)self->_headerView frame];
    double MaxY = CGRectGetMaxY(v12);
    [v10 origin];
    double v6 = MaxY + v5;
    [(UIScrollView *)self->super._scrollView contentOffset];
    double v8 = v7;
    [(UIScrollView *)self->super._scrollView contentInset];
    [(WGMajorListViewController *)self setHeaderVisible:v6 > v8 + v9];
  }
  else
  {
    [(WGMajorListViewController *)self setHeaderVisible:0];
  }
}

- (void)_updateFooterVisibility
{
  footerView = self->_footerView;
  if (footerView)
  {
    [(WGWidgetListFooterView *)footerView frame];
    double MinY = CGRectGetMinY(v19);
    double v5 = [(WGWidgetListFooterView *)self->_footerView contentView];
    [v5 origin];
    double v7 = MinY + v6;

    [(UIScrollView *)self->super._scrollView contentOffset];
    if (v8 >= 0.0) {
      double v9 = v8;
    }
    else {
      double v9 = 0.0;
    }
    [(UIScrollView *)self->super._scrollView contentInset];
    double v11 = v9 + v10;
    [(UIScrollView *)self->super._scrollView bounds];
    BOOL v13 = v7 <= v11 + v12;
    id v14 = [(WGWidgetListFooterView *)self->_footerView contentView];
    [v14 alpha];
    double v16 = v15;

    BOOL v17 = v16 > 0.1 && v13;
  }
  else
  {
    BOOL v17 = 0;
  }
  [(WGMajorListViewController *)self _setFooterVisible:v17];
}

- (void)_updateEditButtonVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(WGWidgetListViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v5 isWidgetListViewControllerEditable:self])
  {
    double v12 = [(WGWidgetListViewController *)self editButton];
    [v12 setAlpha:0.0];

    BOOL v13 = [(WGMajorListViewController *)self footerView];
    id v14 = [v13 editButton];
    [v14 setAlpha:0.0];

    double v11 = [(WGMajorListViewController *)self footerView];
    double v15 = [v11 customizeButton];
    [v15 setAlpha:0.0];
  }
  else
  {
    if ([(WGWidgetListViewController *)self isEditingIcons])
    {
      BOOL v6 = [(WGMajorListViewController *)self _isFooterVisible];
      if (v6) {
        double v7 = 0.0;
      }
      else {
        double v7 = 1.0;
      }
      if (v6) {
        double v8 = 0.01;
      }
      else {
        double v8 = 1.0;
      }
    }
    else
    {
      double v7 = 0.0;
      double v8 = 0.01;
    }
    BOOL v9 = [(WGWidgetListViewController *)self isEditingIcons];
    if (v9) {
      LOBYTE(v9) = [(WGMajorListViewController *)self hasWidget];
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __65__WGMajorListViewController__updateEditButtonVisibilityAnimated___block_invoke;
    v16[3] = &unk_2646774D0;
    v16[4] = self;
    *(double *)&v16[5] = v7;
    *(double *)&v16[6] = v8;
    BOOL v17 = v9;
    uint64_t v10 = MEMORY[0x223CAA850](v16);
    double v11 = (void *)v10;
    if (v3) {
      [MEMORY[0x263F1CB60] animateWithDuration:v10 animations:0.2];
    }
    else {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
  }
}

void __65__WGMajorListViewController__updateEditButtonVisibilityAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) editButton];
  [v2 setAlpha:*(double *)(a1 + 40)];

  BOOL v3 = [*(id *)(a1 + 32) editButton];
  CGAffineTransformMakeScale(&v11, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
  [v3 setTransform:&v11];

  id v4 = [*(id *)(a1 + 32) footerView];
  double v5 = [v4 editButton];
  if ([*(id *)(a1 + 32) isEditingIcons]) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  [v5 setAlpha:v6];

  double v7 = [*(id *)(a1 + 32) footerView];
  double v8 = [v7 customizeButton];
  BOOL v9 = v8;
  if (*(unsigned char *)(a1 + 56)) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.0;
  }
  [v8 setAlpha:v10];
}

- (BOOL)_isFooterVisible
{
  return self->_footerVisible;
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void)setContainerView:(id)a3
{
}

- (WGWidgetListFooterView)footerView
{
  return self->_footerView;
}

- (UIViewController)headerContentViewController
{
  return self->_headerContentViewController;
}

- (WGWidgetListHeaderView)headerView
{
  return self->_headerView;
}

- (BOOL)isHeaderVisible
{
  return self->_headerVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_headerContentViewController, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_containerView);
}

@end