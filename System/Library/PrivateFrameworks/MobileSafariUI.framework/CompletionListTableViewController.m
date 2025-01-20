@interface CompletionListTableViewController
+ (id)tableViewCellForSizeEstimation;
+ (void)configureCell:(id)a3 backgroundMode:(int64_t)a4 separatorStyle:(int)a5 shouldHaveTopPadding:(BOOL)a6 configurationStateDidChangeCallback:(id)a7;
- (BOOL)_showingWebSearchTip;
- (BOOL)showsWebSearchTipIfExists;
- (CompletionListTableViewController)init;
- (UITableViewHeaderFooterView)defaultHeaderFooterView;
- (UIView)webSearchTipView;
- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3;
- (int64_t)maximumNumberOfRows;
- (int64_t)minimumNumberOfRows;
- (void)_updateTableViewContentInset;
- (void)_updateWebSearchTipProposedHeightForTableViewWidth:(double)a3;
- (void)keyboardDidChangeFrame:(id)a3;
- (void)setNeedsScrollOffsetReset;
- (void)setShowsWebSearchTipIfExists:(BOOL)a3;
- (void)setWebSearchTipView:(id)a3;
- (void)updateContentInsets;
- (void)updateKeyboardBottomInsetFromKeyboardFrame:(CGRect)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CompletionListTableViewController

+ (void)configureCell:(id)a3 backgroundMode:(int64_t)a4 separatorStyle:(int)a5 shouldHaveTopPadding:(BOOL)a6 configurationStateDidChangeCallback:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __138__CompletionListTableViewController_configureCell_backgroundMode_separatorStyle_shouldHaveTopPadding_configurationStateDidChangeCallback___block_invoke;
  v27[3] = &unk_1E6D7DEB8;
  int v29 = a5;
  id v13 = v12;
  id v28 = v13;
  v14 = (void *)MEMORY[0x1E4E42950](v27);
  if (a4 == 1 && a6) {
    double v15 = 8.0;
  }
  else {
    double v15 = 0.0;
  }
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __138__CompletionListTableViewController_configureCell_backgroundMode_separatorStyle_shouldHaveTopPadding_configurationStateDidChangeCallback___block_invoke_2;
  v24 = &unk_1E6D7DEE0;
  double v26 = v15;
  id v16 = v13;
  id v25 = v16;
  uint64_t v17 = MEMORY[0x1E4E42950](&v21);
  v18 = (void *)v17;
  v19 = &__block_literal_global_54;
  if (a4 == 1) {
    v19 = (void *)v17;
  }
  if (a4) {
    v20 = v19;
  }
  else {
    v20 = v14;
  }
  objc_msgSend(v11, "setConfigurationUpdateHandler:", v20, v21, v22, v23, v24);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v11, "setCustomEdgeInsets:", v15, 0.0, 0.0, 0.0);
  }
}

void __138__CompletionListTableViewController_configureCell_backgroundMode_separatorStyle_shouldHaveTopPadding_configurationStateDidChangeCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  v6 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  [v6 setCornerRadius:20.0];
  if (([v5 isHighlighted] & 1) != 0 || objc_msgSend(v5, "isSelected"))
  {
    v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
    v8 = (void *)MEMORY[0x1E4FB1EA0];
    v9 = [v18 traitCollection];
    if (objc_msgSend(v9, "sf_usesVibrantAppearance")) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = 6;
    }
    id v11 = [v8 effectForBlurEffect:v7 style:v10];
    [v6 setVisualEffect:v11];
  }
  else
  {
    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [v6 setBackgroundColor:v7];
  }

  [v18 setBackgroundConfiguration:v6];
  int v12 = *(_DWORD *)(a1 + 40);
  if (v12 == 1)
  {
    [v18 setSeparatorStyle:0];
    [v18 bounds];
    CGRectGetWidth(v20);
    UIEdgeInsetsMakeWithEdges();
  }
  else
  {
    if (v12 != 2) {
      goto LABEL_13;
    }
    [v18 setSeparatorStyle:1];
    +[CompletionListTableViewCell imageWidthSpace];
    double v14 = v13;
    double v15 = 0.0;
    double v16 = 16.0;
    double v17 = 0.0;
  }
  objc_msgSend(v18, "setSeparatorInset:", v15, v14, v17, v16);
LABEL_13:
  [v18 setSelectedBackgroundView:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __138__CompletionListTableViewController_configureCell_backgroundMode_separatorStyle_shouldHaveTopPadding_configurationStateDidChangeCallback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  v6 = [v19 backgroundConfiguration];
  id v7 = [v6 customView];

  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v7 setClipsToBounds:0];
    v8 = [v7 layer];
    [v8 setBorderWidth:1.0];
  }
  v9 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  uint64_t v10 = [v9 updatedConfigurationForState:v5];
  id v11 = [v10 backgroundColor];

  int v12 = [v19 traitCollection];
  LODWORD(v10) = objc_msgSend(v12, "sf_usesVibrantAppearance");

  if (v10)
  {
    uint64_t v13 = [v11 colorWithAlphaComponent:0.8];

    id v11 = (void *)v13;
  }
  if (([v5 isHighlighted] & 1) == 0 && (objc_msgSend(v5, "isSelected") & 1) == 0)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"CompletionListPlainPlatterBackgroundColor");

    id v11 = (void *)v14;
  }
  [v7 setBackgroundColor:v11];
  objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"CompletionListPlainPlatterBorderColor");
  id v15 = objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 CGColor];
  double v17 = [v7 layer];
  [v17 setBorderColor:v16];

  [v7 _setContinuousCornerRadius:20.0];
  id v18 = [MEMORY[0x1E4FB1498] clearConfiguration];
  [v18 setCustomView:v7];
  objc_msgSend(v18, "setBackgroundInsets:", *(double *)(a1 + 40), 0.0, 0.0, 0.0);
  [v19 setBackgroundConfiguration:v18];
  [v19 setSeparatorStyle:0];
  [v19 bounds];
  CGRectGetWidth(v21);
  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v19, "setSeparatorInset:");
  [v19 setSelectedBackgroundView:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __138__CompletionListTableViewController_configureCell_backgroundMode_separatorStyle_shouldHaveTopPadding_configurationStateDidChangeCallback___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  v2 = [v6 backgroundView];
  [v2 _setContinuousCornerRadius:20.0];

  [v6 setBackgroundColor:0];
  v3 = [v6 selectedBackgroundView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v5 = objc_alloc_init(HaloSelectedBackgroundView);
    [v6 setSelectedBackgroundView:v5];
  }
}

- (CompletionListTableViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CompletionListTableViewController;
  return [(CompletionListTableViewController *)&v3 initWithStyle:0];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CompletionListTableViewController;
  [(SFPopoverSizingTableViewController *)&v11 viewDidLoad];
  objc_super v3 = [(CompletionListTableViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];
  v4 = [(CompletionListTableViewController *)self tableView];
  id v5 = [MEMORY[0x1E4FB1E20] _traitCollectionWithVibrancy:0];
  [v4 _setLocalOverrideTraitCollection:v5];

  [v4 setAccessibilityIdentifier:@"CompletionListTableView"];
  [v4 _setFirstResponderKeyboardAvoidanceEnabled:0];
  [v4 setKeyboardDismissMode:2];
  [v4 setSectionFooterHeight:0.0];
  [v4 _setSectionContentInsetFollowsLayoutMargins:0];
  objc_msgSend(v4, "_setSectionContentInset:", 0.0, 16.0, 0.0, 16.0);
  [v4 _setSectionCornerRadius:0.0];
  [v4 _setHeaderAndFooterViewsFloat:0];
  [v4 setSectionHeaderTopPadding:0.0];
  [v4 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"CatalogViewControllerTableHeader"];
  id v6 = objc_alloc(MEMORY[0x1E4FB23F0]);
  [v4 bounds];
  id v7 = (_UIVisualEffectBackdropView *)objc_msgSend(v6, "initWithFrame:");
  headerBackdropCaptureView = self->_headerBackdropCaptureView;
  self->_headerBackdropCaptureView = v7;

  v9 = [(_UIVisualEffectBackdropView *)self->_headerBackdropCaptureView captureGroup];
  [v9 setGroupName:@"completion-list-header"];

  [(_UIVisualEffectBackdropView *)self->_headerBackdropCaptureView setRenderMode:1];
  [v4 setBackgroundView:self->_headerBackdropCaptureView];
  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel_keyboardDidChangeFrame_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v10 addObserver:self selector:sel_keyboardDidChangeFrame_ name:*MEMORY[0x1E4FB2BB8] object:0];
  [v10 addObserver:self selector:sel_keyboardDidChangeFrame_ name:*MEMORY[0x1E4FB2C50] object:0];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompletionListTableViewController;
  [(CompletionListTableViewController *)&v4 viewIsAppearing:a3];
  [MEMORY[0x1E4FB1A90] visiblePeripheralFrame];
  -[CompletionListTableViewController updateKeyboardBottomInsetFromKeyboardFrame:](self, "updateKeyboardBottomInsetFromKeyboardFrame:");
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CompletionListTableViewController;
  [(SFPopoverSizingTableViewController *)&v7 viewDidLayoutSubviews];
  if (self->_shouldResetScrollOffsetOnNextLayout)
  {
    self->_shouldResetScrollOffsetOnNextLayout = 0;
    objc_super v3 = [(CompletionListTableViewController *)self tableView];
    if ([(CompletionListTableViewController *)self _isInPopoverPresentation])
    {
      double v4 = *MEMORY[0x1E4F1DAD8];
      double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    else
    {
      [v3 adjustedContentInset];
      double v5 = -v6;
      double v4 = 0.0;
    }
    objc_msgSend(v3, "setContentOffset:", v4, v5);
  }
}

- (UITableViewHeaderFooterView)defaultHeaderFooterView
{
  v2 = [(CompletionListTableViewController *)self tableView];
  objc_super v3 = [v2 dequeueReusableHeaderFooterViewWithIdentifier:@"CatalogViewControllerTableHeader"];

  return (UITableViewHeaderFooterView *)v3;
}

- (void)updateContentInsets
{
  [MEMORY[0x1E4FB1A90] visiblePeripheralFrame];
  -[CompletionListTableViewController updateKeyboardBottomInsetFromKeyboardFrame:](self, "updateKeyboardBottomInsetFromKeyboardFrame:");
}

- (void)setNeedsScrollOffsetReset
{
  self->_shouldResetScrollOffsetOnNextLayout = 1;
}

- (void)setWebSearchTipView:(id)a3
{
  id v5 = a3;
  if (![(CompletionListTableViewController *)self _showingWebSearchTip]) {
    objc_storeStrong((id *)&self->_webSearchTipView, a3);
  }
}

- (void)setShowsWebSearchTipIfExists:(BOOL)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  if (self->_showsWebSearchTipIfExists != a3)
  {
    self->_showsWebSearchTipIfExists = a3;
    if (self->_webSearchTipView)
    {
      double v4 = [(CompletionListTableViewController *)self tableView];
      if (self->_showsWebSearchTipIfExists)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        [v4 setTableHeaderView:v5];
        [(UIView *)self->_webSearchTipView setTranslatesAutoresizingMaskIntoConstraints:0];
        [v5 addSubview:self->_webSearchTipView];
        [MEMORY[0x1E4FB1948] groupedHeaderConfiguration];
        double v6 = v23 = v4;
        [v6 directionalLayoutMargins];
        double v8 = v7;

        double v17 = (void *)MEMORY[0x1E4F28DC8];
        uint64_t v22 = [(UIView *)self->_webSearchTipView leftAnchor];
        CGRect v21 = [v5 leftAnchor];
        CGRect v20 = [v22 constraintEqualToAnchor:v21 constant:16.0];
        v24[0] = v20;
        id v19 = [(UIView *)self->_webSearchTipView rightAnchor];
        id v18 = [v5 rightAnchor];
        v9 = [v19 constraintEqualToAnchor:v18 constant:-16.0];
        v24[1] = v9;
        uint64_t v10 = [(UIView *)self->_webSearchTipView topAnchor];
        objc_super v11 = [v5 topAnchor];
        int v12 = [v10 constraintEqualToAnchor:v11 constant:v8];
        v24[2] = v12;
        uint64_t v13 = [(UIView *)self->_webSearchTipView bottomAnchor];
        uint64_t v14 = [v5 bottomAnchor];
        id v15 = [v13 constraintEqualToAnchor:v14];
        v24[3] = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
        [v17 activateConstraints:v16];

        double v4 = v23;
        [v23 bounds];
        [(CompletionListTableViewController *)self _updateWebSearchTipProposedHeightForTableViewWidth:CGRectGetWidth(v25)];
        objc_msgSend(v5, "setBounds:", 0.0, 0.0, 0.0, v8 + self->_webSearchTipProposedHeight);
      }
      else
      {
        [(UIView *)self->_webSearchTipView removeFromSuperview];
        [v4 setTableHeaderView:0];
      }
    }
  }
}

- (BOOL)_showingWebSearchTip
{
  return self->_showsWebSearchTipIfExists && self->_webSearchTipView != 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)CompletionListTableViewController;
  -[SFPopoverSizingTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  double v6 = [(CompletionListTableViewController *)self tableView];
  [v6 bounds];
  double v7 = CGRectGetWidth(v9);

  if (v7 != width) {
    [(CompletionListTableViewController *)self _updateWebSearchTipProposedHeightForTableViewWidth:width];
  }
}

- (void)_updateWebSearchTipProposedHeightForTableViewWidth:(double)a3
{
  BOOL v5 = [(CompletionListTableViewController *)self _showingWebSearchTip];
  double v8 = 0.0;
  if (v5)
  {
    LODWORD(v6) = 1148846080;
    LODWORD(v7) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_webSearchTipView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3 + -32.0, *(double *)(MEMORY[0x1E4FB2C68] + 8), v6, v7);
  }
  self->_webSearchTipProposedHeight = v8;
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CompletionListTableViewController;
  [(CompletionListTableViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(CompletionListTableViewController *)self _updateTableViewContentInset];
}

+ (id)tableViewCellForSizeEstimation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:0];
  objc_super v3 = [v2 textLabel];
  [v3 setText:@"A"];

  double v4 = [v2 detailTextLabel];
  [v4 setText:@"A"];

  return v2;
}

- (int64_t)minimumNumberOfRows
{
  return 1;
}

- (int64_t)maximumNumberOfRows
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3
{
  double v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  BOOL v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];

  if (a3)
  {
    id v6 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    id v6 = v5;
  }
  double v7 = v6;

  return v7;
}

- (void)keyboardDidChangeFrame:(id)a3
{
  double v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  BOOL v5 = v6;
  if (v6)
  {
    [v6 CGRectValue];
    -[CompletionListTableViewController updateKeyboardBottomInsetFromKeyboardFrame:](self, "updateKeyboardBottomInsetFromKeyboardFrame:");
    BOOL v5 = v6;
  }
}

- (void)updateKeyboardBottomInsetFromKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = 0.0;
  if (!CGRectIsEmpty(a3))
  {
    CGRect v9 = [(CompletionListTableViewController *)self tableView];
    objc_msgSend(v9, "convertRect:fromView:", 0, x, y, width, height);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    id v18 = [(CompletionListTableViewController *)self tableView];
    [v18 bounds];
    double MaxY = CGRectGetMaxY(v24);
    v25.origin.double x = v11;
    v25.origin.double y = v13;
    v25.size.double width = v15;
    v25.size.double height = v17;
    double v20 = MaxY - CGRectGetMinY(v25);
    double v8 = 0.0;
    if (v20 >= 0.0)
    {
      CGRect v21 = [(CompletionListTableViewController *)self tableView];
      [v21 bounds];
      double v22 = CGRectGetMaxY(v26);
      v27.origin.double x = v11;
      v27.origin.double y = v13;
      v27.size.double width = v15;
      v27.size.double height = v17;
      double v8 = v22 - CGRectGetMinY(v27);
    }
  }
  if (v8 != self->_keyboardBottomInset)
  {
    self->_keyboardBottomInset = v8;
    [(CompletionListTableViewController *)self _updateTableViewContentInset];
  }
}

- (void)_updateTableViewContentInset
{
  id v8 = [(CompletionListTableViewController *)self tableView];
  if ([(CompletionListTableViewController *)self _isInPopoverPresentation])
  {
    double v3 = *MEMORY[0x1E4F78730];
    double keyboardBottomInset = self->_keyboardBottomInset;
    double v5 = fmax(*MEMORY[0x1E4F78730], keyboardBottomInset);
  }
  else
  {
    [v8 safeAreaInsets];
    double v3 = 0.0;
    double keyboardBottomInset = fmax(self->_keyboardBottomInset - v6, 0.0);
    double v5 = keyboardBottomInset;
  }
  [(id)objc_opt_class() bottomContentPadding];
  objc_msgSend(v8, "setContentInset:", 0.0, 0.0, keyboardBottomInset + v7, 0.0);
  objc_msgSend(v8, "setVerticalScrollIndicatorInsets:", v3, 0.0, v5, 0.0);
}

- (UIView)webSearchTipView
{
  return self->_webSearchTipView;
}

- (BOOL)showsWebSearchTipIfExists
{
  return self->_showsWebSearchTipIfExists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webSearchTipView, 0);
  objc_storeStrong((id *)&self->_headerBackdropCaptureView, 0);
}

@end