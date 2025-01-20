@interface PKPaymentSetupTableViewController
- (BOOL)clearsSelectionOnViewWillAppear;
- (BOOL)extendedLayoutIncludesOpaqueBars;
- (BOOL)moveFooterWithKeyboard;
- (BOOL)paymentSetupMarkerRemovalIsInclusive;
- (NSAttributedString)footerAttributedText;
- (NSIndexPath)selectedIndexPath;
- (PKHyperlinkTextView)footerTextView;
- (PKPaymentSetupDockView)dockView;
- (PKPaymentSetupTableViewController)initWithContext:(int64_t)a3;
- (PKPaymentSetupTableViewController)initWithStyle:(int64_t)a3 context:(int64_t)a4;
- (UITableView)tableView;
- (id)addFooterStyleAttributes:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (int64_t)context;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4;
- (unint64_t)edgesForExtendedLayout;
- (unint64_t)paymentSetupMarker;
- (void)_keyboardWillChange:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)setClearsSelectionOnViewWillAppear:(BOOL)a3;
- (void)setContext:(int64_t)a3;
- (void)setFooterAttributedText:(id)a3;
- (void)setFooterTextView:(id)a3;
- (void)setMoveFooterWithKeyboard:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableViewDidFinishReload:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPaymentSetupTableViewController

- (PKPaymentSetupTableViewController)initWithContext:(int64_t)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1);

  return [(PKPaymentSetupTableViewController *)self initWithStyle:v5 context:a3];
}

- (PKPaymentSetupTableViewController)initWithStyle:(int64_t)a3 context:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupTableViewController;
  v6 = [(PKPaymentSetupTableViewController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_context = a4;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB1D18]) initWithStyle:a3];
    tableViewController = v7->_tableViewController;
    v7->_tableViewController = (UITableViewController *)v8;

    v10 = [(PKPaymentSetupTableViewController *)v7 navigationItem];
    objc_msgSend(v10, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v10, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v11 addObserver:v7 selector:sel__keyboardWillChange_ name:*MEMORY[0x1E4FB2C48] object:0];
    [v11 addObserver:v7 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  }
  return v7;
}

- (void)dealloc
{
  [(UITableView *)self->_tableView setDelegate:0];
  [(UITableView *)self->_tableView setDataSource:0];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupTableViewController;
  [(PKPaymentSetupTableViewController *)&v3 dealloc];
}

- (void)loadView
{
  [(PKPaymentSetupTableViewController *)self addChildViewController:self->_tableViewController];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  containerView = self->_containerView;
  self->_containerView = v4;

  [(PKPaymentSetupTableViewController *)self setView:self->_containerView];
  v6 = [(UITableViewController *)self->_tableViewController tableView];
  tableView = self->_tableView;
  self->_tableView = v6;

  uint64_t v8 = self->_tableView;
  v9 = PKProvisioningBackgroundColor();
  [(UITableView *)v8 setBackgroundColor:v9];

  [(UITableView *)self->_tableView setAutoresizingMask:0];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  uint64_t v10 = *MEMORY[0x1E4F857E8];
  [(UITableView *)self->_tableView setAccessibilityIdentifier:*MEMORY[0x1E4F857E8]];
  id v14 = [(UITableView *)self->_tableView backgroundColor];
  [(UIView *)self->_containerView setBackgroundColor:v14];
  [(UIView *)self->_containerView addSubview:self->_tableView];
  [(UITableViewController *)self->_tableViewController didMoveToParentViewController:self];
  v11 = self->_containerView;
  v12 = [(PKPaymentSetupTableViewController *)self footerTextView];
  [(UIView *)v11 addSubview:v12];

  objc_super v13 = [(PKPaymentSetupTableViewController *)self view];
  [v13 setAccessibilityIdentifier:v10];
}

- (BOOL)extendedLayoutIncludesOpaqueBars
{
  return 1;
}

- (unint64_t)edgesForExtendedLayout
{
  return 15;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupTableViewController;
  -[PKPaymentSetupTableViewController viewWillAppear:](&v10, sel_viewWillAppear_);
  int64_t context = self->_context;
  v6 = [(PKPaymentSetupTableViewController *)self view];
  PKPaymentSetupApplyContextAppearance(context, v6);

  v7 = [(PKPaymentSetupTableViewController *)self tableView];
  if (([v7 allowsMultipleSelection] & 1) == 0)
  {
    selectedIndexPath = self->_selectedIndexPath;
    v9 = [v7 indexPathForSelectedRow];
    LODWORD(selectedIndexPath) = [(NSIndexPath *)selectedIndexPath isEqual:v9];

    if (selectedIndexPath) {
      [v7 deselectRowAtIndexPath:self->_selectedIndexPath animated:v3];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupTableViewController;
  [(PKPaymentSetupTableViewController *)&v5 viewDidAppear:a3];
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(UITableView *)self->_tableView endEditing:1];
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupTableViewController;
  [(PKPaymentSetupTableViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewWillLayoutSubviews
{
  v84.receiver = self;
  v84.super_class = (Class)PKPaymentSetupTableViewController;
  [(PKPaymentSetupTableViewController *)&v84 viewWillLayoutSubviews];
  BOOL v3 = [(PKPaymentSetupTableViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  [v3 safeAreaInsets];
  double v77 = v12;
  [v3 layoutMargins];
  double v14 = v13;
  double v16 = v15;
  double v75 = v9;
  CGFloat v76 = v7;
  if (PKPaymentSetupContextIsSetupAssistant()
    && [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    double v17 = v7;
    double v18 = v5 + v14;
    double v19 = v17 + 0.0;
    double v9 = v9 - (v14 + v16);
    v20 = [v3 readableContentGuide];
    [v20 layoutFrame];
    double v22 = fmin(v21, 536.0);

    if (v22 >= v9)
    {
      double rect = v19;
      int v28 = 1;
      double v27 = v11;
    }
    else
    {
      PKSizeAlignedInRect();
      double v18 = v23;
      double rect = v24;
      double v9 = v25;
      double v27 = v26;
      int v28 = 1;
    }
  }
  else
  {
    int v28 = 0;
    double v27 = v11;
    double rect = v7;
    double v18 = v5;
  }
  v29 = [(PKHyperlinkTextView *)self->_footerTextView attributedText];
  uint64_t v30 = [v29 length];

  double v31 = v5;
  if (v30)
  {
    double v32 = v14 + v16;
    if (v28) {
      double v32 = 0.0;
    }
    double v33 = v9 - v32;
    double v34 = -0.0;
    if (!v28) {
      double v34 = v14;
    }
    double v35 = v18 + v34;
    -[PKHyperlinkTextView sizeThatFits:](self->_footerTextView, "sizeThatFits:", v33, 1.79769313e308);
    PKSizeCeilToPixel(v36, v37, v38);
    double v78 = v39;
    double v79 = 6.0;
    double v27 = v27 - (v77 + 10.0 + v39 + 6.0);
  }
  else
  {
    double v35 = *MEMORY[0x1E4F1DB28];
    double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v78 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v79 = 0.0;
  }
  -[UITableView setFrame:](self->_tableView, "setFrame:", v18, rect, v9, v27);
  [(UITableView *)self->_tableView contentInset];
  double v80 = v41;
  double v81 = v40;
  double v82 = v42;
  dockView = self->_dockView;
  if (!dockView)
  {
    v85.origin.x = v18;
    v85.origin.y = rect;
    v85.size.width = v9;
    v85.size.double height = v27;
    double v49 = CGRectGetMaxY(v85) - v79;
    double v45 = 0.0;
    goto LABEL_24;
  }
  -[PKPaymentSetupDockView sizeThatFits:](dockView, "sizeThatFits:");
  double v74 = v33;
  double v45 = v44;
  double v73 = v35;
  if (self->_moveFooterWithKeyboard)
  {
    double height = self->_keyboardFrame.size.height;
    double v47 = rect;
    if (height > 0.0 || v30) {
      goto LABEL_17;
    }
LABEL_20:
    double v48 = v77;
    goto LABEL_21;
  }
  double height = 0.0;
  double v47 = rect;
  if (!v30) {
    goto LABEL_20;
  }
LABEL_17:
  double v48 = 0.0;
LABEL_21:
  double v50 = v45 + v48;
  double v51 = v18;
  double v52 = v9;
  double v53 = v27;
  CGFloat v54 = CGRectGetMaxY(*(CGRect *)(&v47 - 1)) - v50 - height;
  v86.origin.x = v31;
  v86.origin.y = v76;
  v86.size.width = v75;
  v86.size.double height = v11;
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", v31, v54, v75, CGRectGetMaxY(v86) - v54);
  [(_PKVisibilityBackdropView *)self->_blurringView layoutIfNeeded];
  v55 = [(_UIBackdropView *)self->_blurringView contentView];
  [v55 bounds];

  PKSizeAlignedInRect();
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  CGFloat v61 = v60;
  CGFloat v63 = v62;
  -[PKPaymentSetupDockView setFrame:](self->_dockView, "setFrame:");
  [(PKPaymentSetupDockView *)self->_dockView setNeedsLayout];
  v87.origin.x = v57;
  v87.origin.y = v59;
  v87.size.width = v61;
  v87.size.double height = v63;
  double v49 = v79 + CGRectGetMaxY(v87);
  tableView = self->_tableView;
  [(_PKVisibilityBackdropView *)self->_blurringView bounds];
  -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", self->_blurringView);
  double v66 = v65;
  [(UITableView *)self->_tableView contentSize];
  double v68 = v67;
  [(UITableView *)self->_tableView bounds];
  v88.size.double height = fmin(v69, v68 - v88.origin.y);
  double v70 = fmin(fmax(CGRectGetMaxY(v88) - v66, 0.0), 30.0) / 30.0;
  if (self->_backdropWeight != v70)
  {
    self->_backdropWeight = v70;
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0);
  }
  double v35 = v73;
  double v33 = v74;
LABEL_24:
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", v81, v80, v45, v82);
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v81, v80, v45, v82);
  -[PKHyperlinkTextView setFrame:](self->_footerTextView, "setFrame:", v35, v49, v33, v78);
  v71 = self->_tableView;
  v72 = [(PKPaymentSetupTableViewController *)self navigationItem];
  [(UITableView *)v71 pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:v72];
}

- (void)_keyboardWillShow:(id)a3
{
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PKPaymentSetupTableViewController__keyboardWillShow___block_invoke;
  v7[3] = &unk_1E59CADB8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKPaymentSetupTableViewController *)self _updateLayoutForKeyboardAction:v7];
}

BOOL __55__PKPaymentSetupTableViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGFloat v3 = *(double *)(v2 + 1040);
  CGFloat v4 = *(double *)(v2 + 1048);
  CGFloat v5 = *(double *)(v2 + 1056);
  CGFloat v6 = *(double *)(v2 + 1064);
  *(unsigned char *)(v2 + 1072) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  double v7 = *(void **)(a1 + 40);
  double v9 = (void *)(v8 + 1040);
  if (v7)
  {
    [v7 CGRectValue];
    void *v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)double v9 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v8 + 1056) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.double height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1040), v16);
}

- (void)_keyboardWillChange:(id)a3
{
  if (self->_keyboardVisible)
  {
    CGFloat v4 = [a3 userInfo];
    CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __57__PKPaymentSetupTableViewController__keyboardWillChange___block_invoke;
      v6[3] = &unk_1E59CADB8;
      v6[4] = self;
      id v7 = v5;
      [(PKPaymentSetupTableViewController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

BOOL __57__PKPaymentSetupTableViewController__keyboardWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CGFloat v3 = v2 + 130;
  CGFloat v4 = *((double *)v2 + 130);
  CGFloat v5 = *((double *)v2 + 131);
  CGFloat v6 = *((double *)v2 + 132);
  CGFloat v7 = *((double *)v2 + 133);
  [*(id *)(a1 + 40) CGRectValue];
  *CGFloat v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.double height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1040), v13);
}

- (void)_keyboardWillHide:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PKPaymentSetupTableViewController__keyboardWillHide___block_invoke;
  v3[3] = &unk_1E59CADE0;
  v3[4] = self;
  [(PKPaymentSetupTableViewController *)self _updateLayoutForKeyboardAction:v3];
}

BOOL __55__PKPaymentSetupTableViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 1040);
  *(unsigned char *)(v1 + 1072) = 0;
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 1040);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *uint64_t v2 = *MEMORY[0x1E4F1DB20];
  v2[1] = v3;
  *(void *)&long long v3 = *(void *)(*(void *)(a1 + 32) + 1040);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1048);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1056);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1064);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t v4 = (unsigned int (**)(void))a3;
  if (v4 && self->_moveFooterWithKeyboard)
  {
    uint64_t v5 = [(PKPaymentSetupTableViewController *)self viewIfLoaded];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 layoutIfNeeded];
      if (v4[2](v4))
      {
        [v6 setNeedsLayout];
        CGFloat v7 = (void *)MEMORY[0x1E4FB1EB0];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __68__PKPaymentSetupTableViewController__updateLayoutForKeyboardAction___block_invoke;
        v8[3] = &unk_1E59CA7D0;
        id v9 = v6;
        [v7 _animateUsingDefaultTimingWithOptions:134 animations:v8 completion:0];
      }
    }
    else
    {
      v4[2](v4);
    }
  }
}

uint64_t __68__PKPaymentSetupTableViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (PKPaymentSetupDockView)dockView
{
  dockView = self->_dockView;
  if (!dockView)
  {
    [(PKPaymentSetupTableViewController *)self loadViewIfNeeded];
    uint64_t v4 = [PKPaymentSetupDockView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    id v9 = -[PKPaymentSetupDockView initWithFrame:context:](v4, "initWithFrame:context:", self->_context, *MEMORY[0x1E4F1DB28], v6, v7, v8);
    uint64_t v10 = self->_dockView;
    self->_dockView = v9;

    uint64_t v11 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:]([_PKVisibilityBackdropView alloc], "initWithFrame:privateStyle:", -2, v5, v6, v7, v8);
    blurringView = self->_blurringView;
    self->_blurringView = v11;

    [(_PKVisibilityBackdropView *)self->_blurringView setDelegate:self];
    [(_PKVisibilityBackdropView *)self->_blurringView pkui_setVisibility:0 animated:self->_backdropWeight];
    [(_PKVisibilityBackdropView *)self->_blurringView setUserInteractionEnabled:1];
    CGRect v13 = [(_UIBackdropView *)self->_blurringView contentView];
    [v13 addSubview:self->_dockView];
    [v13 addSubview:self->_footerTextView];
    footerTextView = self->_footerTextView;
    double v15 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKHyperlinkTextView *)footerTextView setBackgroundColor:v15];

    CGRect v16 = [(PKPaymentSetupTableViewController *)self view];
    [v16 addSubview:self->_blurringView];
    [v16 setNeedsLayout];

    dockView = self->_dockView;
  }

  return dockView;
}

- (PKHyperlinkTextView)footerTextView
{
  [(PKPaymentSetupTableViewController *)self loadViewIfNeeded];
  footerTextView = self->_footerTextView;
  if (!footerTextView)
  {
    uint64_t v4 = objc_alloc_init(PKHyperlinkTextView);
    double v5 = self->_footerTextView;
    self->_footerTextView = v4;

    double v6 = PKGenericOnboardingPresenter(self, 0);
    double v7 = [(PKPaymentSetupTableViewController *)self context];
    double v8 = [(PKPaymentSetupTableViewController *)self navigationController];
    id v9 = PKOpenURLModallyHyperlinkAction(v7, v8);
    uint64_t v10 = PKGenericHyperlinkAction(v6, v9);
    [(PKHyperlinkTextView *)self->_footerTextView setAction:v10];

    footerTextView = self->_footerTextView;
  }

  return footerTextView;
}

- (NSAttributedString)footerAttributedText
{
  uint64_t v2 = [(PKPaymentSetupTableViewController *)self footerTextView];
  long long v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)setFooterAttributedText:(id)a3
{
  id v6 = (id)[a3 copy];
  uint64_t v4 = [(PKPaymentSetupTableViewController *)self addFooterStyleAttributes:v6];
  double v5 = [(PKPaymentSetupTableViewController *)self footerTextView];
  [v5 setAttributedText:v4];
}

- (id)addFooterStyleAttributes:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = (id)[v3 mutableCopy];
    id v5 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v5 setLineBreakMode:0];
    [v5 setAlignment:1];
    v12[0] = *MEMORY[0x1E4FB06F8];
    id v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
    uint64_t v7 = *MEMORY[0x1E4FB0738];
    v13[0] = v6;
    v13[1] = v5;
    uint64_t v8 = *MEMORY[0x1E4FB0700];
    v12[1] = v7;
    v12[2] = v8;
    id v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v13[2] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

    objc_msgSend(v4, "addAttributes:range:", v10, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (void)setClearsSelectionOnViewWillAppear:(BOOL)a3
{
  self->_clearsSelectionOnViewWillAppear = a3;
  -[UITableViewController setClearsSelectionOnViewWillAppear:](self->_tableViewController, "setClearsSelectionOnViewWillAppear:");
}

- (void)tableViewDidFinishReload:(id)a3
{
  if (self->_dockView)
  {
    id v3 = [(PKPaymentSetupTableViewController *)self view];
    [v3 setNeedsLayout];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if (self->_tableView == a3)
  {
    uint64_t v10 = v6;
    char v7 = [a3 allowsMultipleSelection];
    id v6 = v10;
    if ((v7 & 1) == 0)
    {
      uint64_t v8 = (NSIndexPath *)[v10 copy];
      selectedIndexPath = self->_selectedIndexPath;
      self->_selectedIndexPath = v8;

      id v6 = v10;
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKPaymentSetupTableViewController *)self view];
  [v3 setNeedsLayout];
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  id v4 = a4;
  if (PKPaymentSetupForceBridgeAppearance() & 1) != 0 || (PKPaymentSetupContextIsBridge())
  {
    int64_t v5 = 2030;
  }
  else if ([v4 userInterfaceStyle] == 2)
  {
    int64_t v5 = 2030;
  }
  else
  {
    int64_t v5 = 2010;
  }

  return v5;
}

- (unint64_t)paymentSetupMarker
{
  return 2;
}

- (BOOL)paymentSetupMarkerRemovalIsInclusive
{
  return 1;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_int64_t context = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (BOOL)clearsSelectionOnViewWillAppear
{
  return self->_clearsSelectionOnViewWillAppear;
}

- (BOOL)moveFooterWithKeyboard
{
  return self->_moveFooterWithKeyboard;
}

- (void)setMoveFooterWithKeyboard:(BOOL)a3
{
  self->_moveFooterWithKeyboard = a3;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setFooterTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_footerTextView, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end