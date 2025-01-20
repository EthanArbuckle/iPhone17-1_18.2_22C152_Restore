@interface SSChromePlaceholderView
- (SSChromePlaceholderView)initWithFrame:(CGRect)a3;
- (double)contentAlpha;
- (double)topBarHeight;
- (int64_t)positionForBar:(id)a3;
- (void)_initializeBarButtonItems;
- (void)_layoutTopBar;
- (void)_updateBarButtonItemPositionsAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setContentAlpha:(double)a3;
@end

@implementation SSChromePlaceholderView

- (SSChromePlaceholderView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSChromePlaceholderView;
  v3 = -[SSChromePlaceholderView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SSChromePlaceholderView *)v3 _initializeBarButtonItems];
    v5 = [MEMORY[0x263F1C550] whiteColor];
    [(SSChromePlaceholderView *)v4 setTintColor:v5];
  }
  return v4;
}

- (double)topBarHeight
{
  [(UINavigationBar *)self->_topBar bounds];
  return v2;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SSChromePlaceholderView;
  [(SSChromePlaceholderView *)&v3 safeAreaInsetsDidChange];
  [(SSChromePlaceholderView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SSChromePlaceholderView;
  [(SSChromePlaceholderView *)&v3 layoutSubviews];
  [(SSChromePlaceholderView *)self _layoutTopBar];
  [(SSChromePlaceholderView *)self _updateBarButtonItemPositionsAnimated:0];
}

- (void)_initializeBarButtonItems
{
  v48[6] = *MEMORY[0x263EF8340];
  objc_super v3 = (UINavigationItem *)objc_alloc_init(MEMORY[0x263F1C800]);
  managedNavigationItem = self->_managedNavigationItem;
  self->_managedNavigationItem = v3;

  [(UINavigationBar *)self->_topBar pushNavigationItem:self->_managedNavigationItem animated:0];
  objc_msgSend(MEMORY[0x263F1C468], "_sss_shareItemWithTarget:action:", self, 0);
  v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  shareItem = self->_shareItem;
  self->_shareItem = v5;

  objc_super v7 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:0];
  doneItem = self->_doneItem;
  self->_doneItem = v7;

  objc_msgSend(MEMORY[0x263F1C468], "_sss_undoItemWithTarget:action:", self, 0);
  v9 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  undoItem = self->_undoItem;
  self->_undoItem = v9;

  objc_msgSend(MEMORY[0x263F1C468], "_sss_redoItemWithTarget:action:", self, 0);
  v11 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  redoItem = self->_redoItem;
  self->_redoItem = v11;

  objc_msgSend(MEMORY[0x263F1C468], "_sss_trashItemWithTarget:action:", self, 0);
  v13 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  deleteItem = self->_deleteItem;
  self->_deleteItem = v13;

  v15 = objc_alloc_init(SSVellumOpacityControl);
  opacityControl = self->_opacityControl;
  self->_opacityControl = v15;

  v17 = self->_opacityControl;
  +[SSVellumOpacityControl preferredWidth];
  double v19 = v18;
  [(SSVellumOpacityControl *)self->_opacityControl intrinsicContentSize];
  -[SSVellumOpacityControl setFrame:](v17, "setFrame:", 0.0, 0.0, v19, v20);
  v21 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:self->_opacityControl];
  opacityItem = self->_opacityItem;
  self->_opacityItem = v21;

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v23 = (void *)getVKSelectableBarButtonItemClass_softClass;
  uint64_t v47 = getVKSelectableBarButtonItemClass_softClass;
  if (!getVKSelectableBarButtonItemClass_softClass)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getVKSelectableBarButtonItemClass_block_invoke;
    v42 = &unk_2644ED6B8;
    v43 = &v44;
    __getVKSelectableBarButtonItemClass_block_invoke((uint64_t)&v39);
    v23 = (void *)v45[3];
  }
  v24 = v23;
  _Block_object_dispose(&v44, 8);
  v25 = (VKSelectableBarButtonItem *)objc_alloc_init(v24);
  annotationEnabledButton = self->_annotationEnabledButton;
  self->_annotationEnabledButton = v25;

  v27 = [MEMORY[0x263F1C6B0] systemImageNamed:@"pencil.tip.crop.circle"];
  [(VKSelectableBarButtonItem *)self->_annotationEnabledButton setImage:v27];

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v28 = (void *)getVKImageAnalysisBarButtonItemClass_softClass;
  uint64_t v47 = getVKImageAnalysisBarButtonItemClass_softClass;
  if (!getVKImageAnalysisBarButtonItemClass_softClass)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getVKImageAnalysisBarButtonItemClass_block_invoke;
    v42 = &unk_2644ED6B8;
    v43 = &v44;
    __getVKImageAnalysisBarButtonItemClass_block_invoke((uint64_t)&v39);
    v28 = (void *)v45[3];
  }
  id v29 = v28;
  _Block_object_dispose(&v44, 8);
  v30 = [v29 analysisButtonWithTarget:self action:0 mode:0];
  aaBarButtonItem = self->_aaBarButtonItem;
  self->_aaBarButtonItem = v30;

  [(VKImageAnalysisBarButtonItem *)self->_aaBarButtonItem setEnabled:0];
  v32 = self->_doneItem;
  v48[0] = self->_shareItem;
  v48[1] = v32;
  v33 = self->_redoItem;
  v48[2] = self->_undoItem;
  v48[3] = v33;
  v34 = self->_opacityItem;
  v48[4] = self->_deleteItem;
  v48[5] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:6];
  barItems = self->_barItems;
  self->_barItems = v35;

  if ([getVKCImageAnalyzerClass() supportedAnalysisTypes])
  {
    v37 = [(NSArray *)self->_barItems arrayByAddingObject:self->_aaBarButtonItem];
    v38 = self->_barItems;
    self->_barItems = v37;
  }
}

- (void)_updateBarButtonItemPositionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [MEMORY[0x263EFF980] array];
  +[SSChromeHelper defaultBarButtonSpacing];
  objc_super v7 = +[SSChromeHelper createFixedSpaceBarButtonItemWithWidth:](SSChromeHelper, "createFixedSpaceBarButtonItemWithWidth:");
  +[SSChromeHelper defaultBarButtonSpacing];
  double v9 = v8;
  v10 = [(SSChromePlaceholderView *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 1)
  {
    [(UIBarButtonItem *)self->_opacityItem _setFlexible:0];
    +[SSChromeHelper widthForOpacityControlInView:self withContentSwitcher:0];
    double v13 = v12;
    opacityControl = self->_opacityControl;
    [(SSVellumOpacityControl *)opacityControl intrinsicContentSize];
    -[SSVellumOpacityControl setFrame:](opacityControl, "setFrame:", 0.0, 0.0, v13, v15);
    [v5 addObject:self->_doneItem];
    v16 = [MEMORY[0x263F1C468] fixedSpaceItemOfWidth:v9];
    [v5 addObject:v16];

    [v5 addObject:self->_opacityItem];
    if ([getVKCImageAnalyzerClass() supportedAnalysisTypes])
    {
      deleteItem = self->_deleteItem;
      annotationEnabledButton = self->_annotationEnabledButton;
      aaBarButtonItem = self->_aaBarButtonItem;
      shareItem = self->_shareItem;
      v34 = deleteItem;
      v35 = annotationEnabledButton;
      v36 = aaBarButtonItem;
      v37 = v7;
      double v18 = (void *)MEMORY[0x263EFF8C0];
      p_shareItem = &shareItem;
      uint64_t v20 = 5;
    }
    else
    {
      v17 = self->_deleteItem;
      id v29 = self->_shareItem;
      v30 = v17;
      v31 = self->_annotationEnabledButton;
      v32 = v7;
      double v18 = (void *)MEMORY[0x263EFF8C0];
      p_shareItem = &v29;
      uint64_t v20 = 4;
    }
    v24 = objc_msgSend(v18, "arrayWithObjects:count:", p_shareItem, v20, v29, v30, v31, v32, shareItem, v34, v35, v36, v37);
    [v6 addObjectsFromArray:v24];
  }
  v25 = self->_topBar;
  [(UINavigationItem *)self->_managedNavigationItem setLeftBarButtonItems:v5 animated:v3];
  [(UINavigationItem *)self->_managedNavigationItem setRightBarButtonItems:v6 animated:v3];
  [(UINavigationItem *)self->_managedNavigationItem setTitleView:0];
  v26 = [(UINavigationBar *)v25 topItem];
  managedNavigationItem = self->_managedNavigationItem;

  if (v26 != managedNavigationItem)
  {
    id v28 = [(UINavigationBar *)v25 popNavigationItemAnimated:0];
    [(UINavigationBar *)v25 pushNavigationItem:self->_managedNavigationItem animated:0];
  }
}

- (void)_layoutTopBar
{
  if (!self->_topBarBackground)
  {
    BOOL v3 = (UINavigationBar *)objc_alloc_init(MEMORY[0x263F1C7E0]);
    topBarBackground = self->_topBarBackground;
    self->_topBarBackground = v3;

    [(UINavigationBar *)self->_topBarBackground setDelegate:self];
    +[SSChromeHelper configureNavigationBarAppearance:self->_topBarBackground];
    [(SSChromePlaceholderView *)self addSubview:self->_topBarBackground];
  }
  if (!self->_topBar)
  {
    v5 = (UINavigationBar *)objc_alloc_init(MEMORY[0x263F1C7E0]);
    topBar = self->_topBar;
    self->_topBar = v5;

    objc_super v7 = [(UINavigationBar *)self->_topBar layer];
    [v7 setAllowsGroupOpacity:1];

    [(UINavigationBar *)self->_topBar setAlpha:self->_contentAlpha];
    [(UINavigationBar *)self->_topBar setDelegate:self];
    double v8 = [MEMORY[0x263F1C688] defaultFormat];
    [v8 setOpaque:0];
    double v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v8, 1.0, 1.0);
    v10 = [v9 imageWithActions:&__block_literal_global];
    [(UINavigationBar *)self->_topBar setBackgroundImage:v10 forBarMetrics:1];
    [(UINavigationBar *)self->_topBar setBackgroundImage:v10 forBarMetrics:0];
    [(UINavigationBar *)self->_topBar setShadowImage:v10];
    [(SSChromePlaceholderView *)self addSubview:self->_topBar];
    uint64_t v11 = +[SSChromeHelper separatorView];
    topBarSeparatorLine = self->_topBarSeparatorLine;
    self->_topBarSeparatorLine = v11;

    [(UINavigationBar *)self->_topBar addSubview:self->_topBarSeparatorLine];
  }
  [(SSChromePlaceholderView *)self bounds];
  -[UINavigationBar sizeThatFits:](self->_topBar, "sizeThatFits:", v13, v14);
  CGFloat v16 = v15;
  double v18 = v17;
  [(SSChromePlaceholderView *)self safeAreaInsets];
  CGFloat v20 = v19;
  +[SSChromeHelper barSeparatorSize];
  CGFloat v22 = v21;
  double v23 = v18 - v21;
  [(SSChromePlaceholderView *)self bounds];
  CGFloat v25 = v24;
  [(UINavigationBar *)self->_topBar bringSubviewToFront:self->_topBarSeparatorLine];
  [(UINavigationBar *)self->_topBar frame];
  v30.origin.x = 0.0;
  v30.origin.y = v20;
  v30.size.width = v16;
  v30.size.height = v18;
  if (!CGRectEqualToRect(v27, v30)) {
    goto LABEL_8;
  }
  [(UINavigationBar *)self->_topBarBackground frame];
  v31.origin.x = 0.0;
  v31.origin.y = v20;
  v31.size.width = v16;
  v31.size.height = v18;
  if (!CGRectEqualToRect(v28, v31)
    || ([(UIView *)self->_topBarSeparatorLine frame],
        v32.origin.x = 0.0,
        v32.origin.y = v23,
        v32.size.width = v25,
        v32.size.height = v22,
        !CGRectEqualToRect(v29, v32)))
  {
LABEL_8:
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __40__SSChromePlaceholderView__layoutTopBar__block_invoke_2;
    v26[3] = &unk_2644ED690;
    v26[4] = self;
    v26[5] = 0;
    *(CGFloat *)&v26[6] = v20;
    *(CGFloat *)&v26[7] = v16;
    *(double *)&v26[8] = v18;
    v26[9] = 0;
    *(double *)&v26[10] = v23;
    *(CGFloat *)&v26[11] = v25;
    *(CGFloat *)&v26[12] = v22;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v26];
  }
}

uint64_t __40__SSChromePlaceholderView__layoutTopBar__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 488), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 496), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 504), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
  -[UINavigationBar setAlpha:](self->_topBar, "setAlpha:");
}

- (int64_t)positionForBar:(id)a3
{
  if (self->_topBar == a3) {
    return 3;
  }
  if (self->_topBarBackground == a3) {
    return 3;
  }
  return 0;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaBarButtonItem, 0);
  objc_storeStrong((id *)&self->_annotationEnabledButton, 0);
  objc_storeStrong((id *)&self->_barItems, 0);
  objc_storeStrong((id *)&self->_topBarSeparatorLine, 0);
  objc_storeStrong((id *)&self->_topBarBackground, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_opacityView, 0);
  objc_storeStrong((id *)&self->_opacityControl, 0);
  objc_storeStrong((id *)&self->_opacityItem, 0);
  objc_storeStrong((id *)&self->_undoRedoSpacerItem, 0);
  objc_storeStrong((id *)&self->_redoItem, 0);
  objc_storeStrong((id *)&self->_undoItem, 0);
  objc_storeStrong((id *)&self->_deleteItem, 0);
  objc_storeStrong((id *)&self->_doneItem, 0);
  objc_storeStrong((id *)&self->_shareItem, 0);
  objc_storeStrong((id *)&self->_managedNavigationItem, 0);
}

@end