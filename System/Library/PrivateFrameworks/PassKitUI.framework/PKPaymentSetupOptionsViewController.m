@interface PKPaymentSetupOptionsViewController
+ (BOOL)_respondToKeyboardPresentationEvents;
- (BOOL)allowsManualEntry;
- (BOOL)isShowingKeyboard;
- (BOOL)shouldCollapseHeaderOnKeyboardShow;
- (BOOL)showHeaderSpinner;
- (BOOL)showNavigationBarSpinner;
- (BOOL)showSearchBar;
- (NSString)subtitleText;
- (NSString)titleText;
- (OBPrivacyLinkController)privacyLink;
- (PKCollapsibleHeaderView)headerView;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentSetupDockView)dockView;
- (PKPaymentSetupOptionsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5;
- (PKPaymentSetupViewControllerDelegate)delegate;
- (UIColor)backgroundColor;
- (UIColor)headerBackgroundColor;
- (UIFont)titleFont;
- (double)footerViewContentHeight;
- (id)_init;
- (int64_t)context;
- (int64_t)paymentSetupMode;
- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4;
- (unint64_t)headerMode;
- (void)_addDockViewToCollectionViewIfNeeded;
- (void)_keyboardSizeDidChange:(id)a3;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)_updateNavigationItem;
- (void)removeSetupDockView;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchBarTextDidBeginEditing;
- (void)searchBarTextDidEndEditing;
- (void)searchTextDidChangeTo:(id)a3;
- (void)setAllowsManualEntry:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderBackgroundColor:(id)a3;
- (void)setHeaderMode:(unint64_t)a3;
- (void)setIsShowingKeyboard:(BOOL)a3;
- (void)setNoResultsActionButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setNoResultsIcon:(id)a3;
- (void)setNoResultsSubtitle:(id)a3;
- (void)setNoResultsTitle:(id)a3;
- (void)setPaymentSetupMode:(int64_t)a3;
- (void)setPrivacyLink:(id)a3;
- (void)setSearchBarDefaultText:(id)a3;
- (void)setSections:(id)a3 animated:(BOOL)a4;
- (void)setShouldCollapseHeaderOnKeyboardShow:(BOOL)a3;
- (void)setShowHeaderSpinner:(BOOL)a3;
- (void)setShowNavigationBarSpinner:(BOOL)a3;
- (void)setShowNoResultsView:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowSearchBar:(BOOL)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleText:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPaymentSetupOptionsViewController

- (id)_init
{
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentSetupOptionsViewController;
  v2 = [(PKDynamicCollectionViewController *)&v17 init];
  p_isa = (id *)&v2->super.super.super.super.isa;
  if (v2)
  {
    v2->_shouldCollapseHeaderOnKeyboardShow = 1;
    v2->_headerMode = 0;
    v4 = [PKCollapsibleHeaderView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[PKCollapsibleHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    id v10 = p_isa[150];
    p_isa[150] = (id)v9;

    [p_isa[150] setDelegate:p_isa];
    v11 = -[PKPaymentSetupNoResultsView initWithFrame:]([PKPaymentSetupNoResultsView alloc], "initWithFrame:", v5, v6, v7, v8);
    id v12 = p_isa[133];
    p_isa[133] = v11;

    v13 = [p_isa[133] layer];
    [v13 setOpacity:0.0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:p_isa selector:sel__keyboardSizeDidChange_ name:*MEMORY[0x1E4FB2C58] object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:p_isa selector:sel__addDockViewToCollectionViewIfNeeded name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return p_isa;
}

- (PKPaymentSetupOptionsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(PKPaymentSetupOptionsViewController *)self _init];
  id v12 = (PKPaymentSetupOptionsViewController *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 156, a3);
    v12->_context = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
    v12->_allowsManualEntry = 1;
    v12->_paymentSetupMode = 0;
  }

  return v12;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupOptionsViewController;
  [(PKDynamicCollectionViewController *)&v7 viewDidLoad];
  v3 = [(PKPaymentSetupOptionsViewController *)self view];
  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
  {
    double v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PKPaymentSetupOptionsViewController *)self setBackgroundColor:v5];

    backgroundColor = self->_backgroundColor;
  }
  [(PKPaymentSetupOptionsViewController *)self setHeaderBackgroundColor:backgroundColor];
  [v3 addSubview:self->_headerView];
  if (self->_blurringView) {
    objc_msgSend(v3, "bringSubviewToFront:");
  }
  [v3 addSubview:self->_noResultsView];
  double v6 = [(PKPaymentSetupOptionsViewController *)self navigationItem];
  objc_msgSend(v6, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v6, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  [(PKPaymentSetupOptionsViewController *)self _updateNavigationItem];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupOptionsViewController;
  [(PKDynamicCollectionViewController *)&v7 viewDidAppear:a3];
  self->_viewDidAppear = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 viewControllerDidBeginSetupFlow:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupOptionsViewController;
  [(PKDynamicCollectionViewController *)&v4 viewWillAppear:a3];
  [(PKPaymentSetupOptionsViewController *)self _addDockViewToCollectionViewIfNeeded];
  [(PKPaymentSetupOptionsViewController *)self _updateNavigationItem];
}

- (void)viewWillLayoutSubviews
{
  v96.receiver = self;
  v96.super_class = (Class)PKPaymentSetupOptionsViewController;
  [(PKDynamicCollectionViewController *)&v96 viewWillLayoutSubviews];
  v3 = [(PKPaymentSetupOptionsViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  id v12 = [v3 readableContentGuide];
  [v12 layoutFrame];
  CGFloat v83 = v14;
  CGFloat v84 = v13;
  CGFloat v81 = v16;
  CGFloat v82 = v15;

  [v3 safeAreaInsets];
  double v18 = v17;
  double v20 = v19;
  v21 = [(PKDynamicCollectionViewController *)self collectionView];
  [v21 frame];
  double v90 = v22;
  double v91 = v23;
  double v87 = v25;
  double v88 = v24;
  [v21 contentOffset];
  double v85 = v27;
  double v86 = v26;
  [v21 contentInset];
  double v89 = v28;
  uint64_t v29 = MEMORY[0x1E4FB2848];
  dockView = self->_dockView;
  if (dockView)
  {
    double v75 = v18;
    -[PKPaymentSetupDockView sizeThatFits:](dockView, "sizeThatFits:", v9, 1.79769313e308);
    double v32 = v31;
    v97.size.CGFloat height = v11;
    double v34 = v33;
    double v35 = v20 + v33;
    double v77 = v7;
    double v79 = v5;
    v97.origin.x = v5;
    v97.origin.y = v7;
    v97.size.width = v9;
    CGFloat height = v97.size.height;
    -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", 0.0, CGRectGetMaxY(v97) - v35, v9, v35);
    [(_PKVisibilityBackdropView *)self->_blurringView layoutIfNeeded];
    double v37 = v34;
    -[PKPaymentSetupDockView setFrame:](self->_dockView, "setFrame:", (v9 - v32) * 0.5, 0.0, v32, v34);
    [(PKPaymentSetupDockView *)self->_dockView layoutIfNeeded];
    [v21 bounds];
    CGFloat v39 = v38;
    double v41 = v40;
    CGFloat v43 = v42;
    double v45 = v44;
    [v21 contentSize];
    CGFloat v47 = fmin(v45, v46 - v41);
    [(_PKVisibilityBackdropView *)self->_blurringView bounds];
    objc_msgSend(v21, "convertRect:fromView:", self->_blurringView);
    double v49 = v48;
    v98.origin.x = v39;
    v98.origin.y = v41;
    v98.size.width = v43;
    v98.size.CGFloat height = v47;
    double v50 = fmin(fmax(CGRectGetMaxY(v98) - v49, 0.0), 30.0) / 30.0;
    if (self->_backdropWeight != v50)
    {
      self->_backdropWeight = v50;
      -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0);
    }
    double v51 = v37;
    CGFloat v7 = v77;
    double v5 = v79;
    CGFloat v11 = height;
    double v18 = v75;
  }
  else
  {
    double v51 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  }
  if (self->_headerMode)
  {
    -[PKCollapsibleHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v52 = 0.0;
    double v53 = 0.0;
  }
  else
  {
    CGFloat v76 = v11;
    CGFloat v54 = v18 + self->_headerHeight;
    v99.origin.x = v5;
    v99.origin.y = v91;
    v99.size.width = v9;
    v99.size.CGFloat height = v54;
    CGFloat MaxY = CGRectGetMaxY(v99);
    -[PKCollapsibleHeaderView setFrame:](self->_headerView, "setFrame:", v5, v91, v9, v54);
    headerView = self->_headerView;
    v100.origin.x = v84;
    v100.origin.y = v83;
    v100.size.width = v82;
    v100.size.CGFloat height = v81;
    double MinX = CGRectGetMinX(v100);
    v101.origin.x = v5;
    v101.origin.y = v7;
    v101.size.width = v9;
    v101.size.CGFloat height = v76;
    double v93 = MinX - CGRectGetMinX(v101);
    v102.origin.x = v5;
    v102.origin.y = v7;
    v102.size.width = v9;
    v102.size.CGFloat height = v76;
    double MaxX = CGRectGetMaxX(v102);
    v103.origin.x = v84;
    v103.origin.y = v83;
    v103.size.width = v82;
    v103.size.CGFloat height = v81;
    double v57 = MaxX - CGRectGetMaxX(v103);
    double v53 = 0.0;
    -[PKCollapsibleHeaderView setReadableContentInsets:](headerView, "setReadableContentInsets:", 0.0, v93, 0.0, v57);
    v58 = self->_headerView;
    double v52 = 0.0;
    if (v58)
    {
      [(PKCollapsibleHeaderView *)v58 heightBoundsForWidth:v9];
      double v52 = v94;
      double v53 = v95;
    }
    double v91 = MaxY;
  }
  double v59 = *(double *)(v29 + 8);
  double v60 = *(double *)(v29 + 24);
  if (self->_isShowingKeyboard
    && +[PKPaymentSetupOptionsViewController _respondToKeyboardPresentationEvents])
  {
    if (self->_shouldCollapseHeaderOnKeyboardShow) {
      double v53 = v52;
    }
    v61 = [(PKPaymentSetupOptionsViewController *)self view];
    objc_msgSend(v61, "convertRect:fromView:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
    CGFloat v63 = v62;
    CGFloat v65 = v64;
    double v80 = v51;
    CGFloat v67 = v66;
    CGFloat v69 = v68;

    [v21 frame];
    double v70 = CGRectGetMaxY(v104);
    v105.origin.x = v63;
    v105.origin.y = v65;
    v105.size.width = v67;
    v105.size.CGFloat height = v69;
    double v51 = fmax(v80, v70 - CGRectGetMinY(v105) + 10.0);
  }
  [(PKPaymentSetupOptionsViewController *)self footerViewContentHeight];
  double v72 = v51 + v71;
  objc_msgSend(v21, "setContentInset:", v53, v59, v51 + v71, v60);
  double v73 = v89 - v53;
  if (v89 - v53 != 0.0) {
    objc_msgSend(v21, "setContentOffset:", v86, v85 + v73);
  }
  objc_msgSend(v21, "adjustedContentInset", v73);
  -[PKPaymentSetupNoResultsView setFrame:](self->_noResultsView, "setFrame:", v90, v91, v88, v87 - v74 - v72);
}

- (void)setHeaderMode:(unint64_t)a3
{
  if (self->_headerMode != a3)
  {
    self->_headerMode = a3;
    [(PKPaymentSetupOptionsViewController *)self _updateNavigationItem];
  }
}

- (double)footerViewContentHeight
{
  return 0.0;
}

- (void)setTitleFont:(id)a3
{
  id v6 = a3;
  double v4 = [(PKCollapsibleHeaderView *)self->_headerView titleFont];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0) {
    [(PKCollapsibleHeaderView *)self->_headerView setTitleFont:v6];
  }
}

- (UIFont)titleFont
{
  return [(PKCollapsibleHeaderView *)self->_headerView titleFont];
}

- (void)setTitleText:(id)a3
{
  p_titleText = &self->_titleText;
  id v7 = a3;
  if (!-[NSString isEqualToString:](*p_titleText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    [(PKCollapsibleHeaderView *)self->_headerView setTitle:*p_titleText subtitle:self->_subtitleText];
    id v6 = [(PKPaymentSetupOptionsViewController *)self view];
    [v6 setNeedsLayout];
  }
}

- (void)setSubtitleText:(id)a3
{
  p_subtitleText = &self->_subtitleText;
  id v7 = a3;
  if (!-[NSString isEqualToString:](*p_subtitleText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_subtitleText, a3);
    [(PKCollapsibleHeaderView *)self->_headerView setTitle:self->_titleText subtitle:*p_subtitleText];
    id v6 = [(PKPaymentSetupOptionsViewController *)self view];
    [v6 setNeedsLayout];
  }
}

- (void)setShowSearchBar:(BOOL)a3
{
  if (((!self->_showSearchBar ^ a3) & 1) == 0)
  {
    self->_showSearchBar = a3;
    -[PKCollapsibleHeaderView setShowSearchBar:](self->_headerView, "setShowSearchBar:");
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v7 = (UIColor *)a3;
  if (self->_backgroundColor != v7)
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    char v5 = [(PKDynamicCollectionViewController *)self collectionView];
    [v5 setBackgroundColor:v7];

    id v6 = [(PKPaymentSetupOptionsViewController *)self view];
    [v6 setBackgroundColor:v7];
  }
}

- (void)setHeaderBackgroundColor:(id)a3
{
  char v5 = (UIColor *)a3;
  if (self->_headerBackgroundColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_headerBackgroundColor, a3);
    [(PKCollapsibleHeaderView *)self->_headerView setBackgroundColor:self->_headerBackgroundColor];
    char v5 = v6;
  }
}

- (void)setShowNoResultsView:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_showNoResultsView ^ a3) & 1) == 0)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_showNoResultsView = a3;
    [(UIView *)self->_noResultsView pkui_setAlpha:a4 animated:(double)a3];
    id v7 = [(PKDynamicCollectionViewController *)self collectionView];
    objc_msgSend(v7, "pkui_setAlpha:animated:", v4, (double)!v5);
  }
}

- (void)setNoResultsIcon:(id)a3
{
  [(PKPaymentSetupNoResultsView *)self->_noResultsView setIcon:a3];
  id v4 = [(PKPaymentSetupOptionsViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)setNoResultsTitle:(id)a3
{
  [(PKPaymentSetupNoResultsView *)self->_noResultsView setTitle:a3];
  id v4 = [(PKPaymentSetupOptionsViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)setNoResultsSubtitle:(id)a3
{
  [(PKPaymentSetupNoResultsView *)self->_noResultsView setSubtitle:a3];
  id v4 = [(PKPaymentSetupOptionsViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)setNoResultsActionButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  [(PKPaymentSetupNoResultsView *)self->_noResultsView setActionButtonTitle:a3 addTarget:a4 action:a5];
  id v6 = [(PKPaymentSetupOptionsViewController *)self view];
  [v6 setNeedsLayout];
}

- (void)setSearchBarDefaultText:(id)a3
{
}

- (PKPaymentSetupDockView)dockView
{
  dockView = self->_dockView;
  if (!dockView)
  {
    [(PKPaymentSetupOptionsViewController *)self loadViewIfNeeded];
    id v4 = [PKPaymentSetupDockView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v9 = -[PKPaymentSetupDockView initWithFrame:context:](v4, "initWithFrame:context:", self->_context, *MEMORY[0x1E4F1DB28], v6, v7, v8);
    double v10 = self->_dockView;
    self->_dockView = v9;

    CGFloat v11 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:]([_PKVisibilityBackdropView alloc], "initWithFrame:privateStyle:", -2, v5, v6, v7, v8);
    blurringView = self->_blurringView;
    self->_blurringView = v11;

    [(_PKVisibilityBackdropView *)self->_blurringView setDelegate:self];
    [(_PKVisibilityBackdropView *)self->_blurringView pkui_setVisibility:0 animated:self->_backdropWeight];
    [(_PKVisibilityBackdropView *)self->_blurringView setUserInteractionEnabled:1];
    double v13 = [(_UIBackdropView *)self->_blurringView contentView];
    [v13 addSubview:self->_dockView];

    double v14 = [(PKPaymentSetupOptionsViewController *)self view];
    [v14 addSubview:self->_blurringView];
    [v14 setNeedsLayout];

    dockView = self->_dockView;
  }

  return dockView;
}

- (void)removeSetupDockView
{
  [(PKPaymentSetupDockView *)self->_dockView removeFromSuperview];
  [(_PKVisibilityBackdropView *)self->_blurringView removeFromSuperview];
  blurringView = self->_blurringView;
  self->_blurringView = 0;

  dockView = self->_dockView;
  self->_dockView = 0;

  id v5 = [(PKPaymentSetupOptionsViewController *)self view];
  [v5 setNeedsLayout];
}

- (void)setShowHeaderSpinner:(BOOL)a3
{
  if (((!self->_showHeaderSpinner ^ a3) & 1) == 0)
  {
    self->_showHeaderSpinner = a3;
    -[PKCollapsibleHeaderView setShowSpinner:](self->_headerView, "setShowSpinner:");
  }
}

- (void)setShowNavigationBarSpinner:(BOOL)a3
{
  if (self->_showNavigationBarSpinner != a3)
  {
    self->_showNavigationBarSpinner = a3;
    BOOL v4 = !a3;
    id v5 = [(PKPaymentSetupOptionsViewController *)self navigationController];
    double v6 = [v5 view];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(PKPaymentSetupOptionsViewController *)self view];
    }
    id v18 = v8;

    [v18 setUserInteractionEnabled:v4];
    [(PKPaymentSetupDockView *)self->_dockView setButtonsEnabled:v4];
    double v9 = [(PKPaymentSetupOptionsViewController *)self navigationItem];
    double v10 = v9;
    if (self->_showNavigationBarSpinner)
    {
      self->_BOOL wasBackHidden = [v9 hidesBackButton];
      CGFloat v11 = [v10 rightBarButtonItem];
      hiddenRightBarButtonItem = self->_hiddenRightBarButtonItem;
      self->_hiddenRightBarButtonItem = v11;

      if (!self->_spinningNavBarItem)
      {
        double v14 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        activityIndicatorView = self->_activityIndicatorView;
        self->_activityIndicatorView = v14;

        double v16 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_activityIndicatorView];
        spinningNavBarItem = self->_spinningNavBarItem;
        self->_spinningNavBarItem = v16;
      }
      [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
      [v10 setRightBarButtonItem:self->_spinningNavBarItem];
      BOOL wasBackHidden = 1;
    }
    else
    {
      [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
      [v10 setRightBarButtonItem:self->_hiddenRightBarButtonItem];
      BOOL wasBackHidden = self->_wasBackHidden;
    }
    [v10 setHidesBackButton:wasBackHidden];
    [(PKPaymentSetupOptionsViewController *)self _setNavigationBarEnabled:v4];
    [v18 setNeedsLayout];
  }
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PKPaymentSetupOptionsViewController *)self navigationController];
  id v5 = [v10 navigationBar];
  [v5 setUserInteractionEnabled:v3];

  double v6 = [v10 interactivePopGestureRecognizer];
  [v6 setEnabled:v3];

  double v7 = [(PKPaymentSetupOptionsViewController *)self navigationItem];
  id v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v3];

  double v9 = [v7 rightBarButtonItem];
  [v9 setEnabled:v3];
}

- (void)setPrivacyLink:(id)a3
{
  id v9 = a3;
  p_privacyLink = &self->_privacyLink;
  char v6 = PKEqualObjects();
  double v7 = v9;
  if ((v6 & 1) == 0)
  {
    if (*p_privacyLink)
    {
      [(OBPrivacyLinkController *)*p_privacyLink willMoveToParentViewController:0];
      id v8 = [(OBPrivacyLinkController *)*p_privacyLink view];
      [v8 removeFromSuperview];

      [(OBPrivacyLinkController *)*p_privacyLink removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_privacyLink, a3);
    if (*p_privacyLink) {
      -[PKPaymentSetupOptionsViewController addChildViewController:](self, "addChildViewController:");
    }
    [(PKPaymentSetupOptionsViewController *)self _addDockViewToCollectionViewIfNeeded];
    [(OBPrivacyLinkController *)*p_privacyLink didMoveToParentViewController:self];
    double v7 = v9;
  }
}

- (void)setSections:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  privacyLinkSectionController = self->_privacyLinkSectionController;
  if (privacyLinkSectionController)
  {
    double v7 = [a3 arrayByAddingObject:privacyLinkSectionController];
    v9.receiver = self;
    v9.super_class = (Class)PKPaymentSetupOptionsViewController;
    [(PKDynamicCollectionViewController *)&v9 setSections:v7 animated:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKPaymentSetupOptionsViewController;
    [(PKDynamicCollectionViewController *)&v8 setSections:a3 animated:a4];
  }
}

- (void)setIsShowingKeyboard:(BOOL)a3
{
  if (self->_isShowingKeyboard != a3)
  {
    self->_isShowingKeyboard = a3;
    if (+[PKPaymentSetupOptionsViewController _respondToKeyboardPresentationEvents])
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __60__PKPaymentSetupOptionsViewController_setIsShowingKeyboard___block_invoke;
      v4[3] = &unk_1E59CA7D0;
      v4[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.25];
    }
  }
}

void __60__PKPaymentSetupOptionsViewController_setIsShowingKeyboard___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

+ (BOOL)_respondToKeyboardPresentationEvents
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_headerMode)
  {
    BOOL v4 = [(PKPaymentSetupOptionsViewController *)self navigationItem];
    objc_msgSend(v4, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 1.0);
  }
  else
  {
    [a3 contentOffset];
    double v7 = v6;
    objc_super v8 = [(PKPaymentSetupOptionsViewController *)self view];
    [v8 safeAreaInsets];
    double v10 = v9;

    double v11 = v7 + v10;
    double v31 = 0.0;
    long long v29 = 0u;
    long long v30 = 0u;
    headerView = self->_headerView;
    [(PKCollapsibleHeaderView *)headerView bounds];
    if (headerView)
    {
      [(PKCollapsibleHeaderView *)headerView heightBoundsForWidth:v13];
      double v14 = *(double *)&v29;
      double v15 = v31;
    }
    else
    {
      double v31 = 0.0;
      double v15 = 0.0;
      double v14 = 0.0;
      long long v29 = 0u;
      long long v30 = 0u;
    }
    double headerHeight = self->_headerHeight;
    if (v14 == 0.0) {
      double v14 = -v10;
    }
    double v17 = fmin(v15, fmax(-v11, v14));
    if (v17 != headerHeight)
    {
      self->_double headerHeight = v17;
      double v18 = v15 - v17;
      double v19 = headerHeight == 0.0 ? 0.0 : v18;
      double v20 = fmin(fmax((v19 - *((double *)&v29 + 1)) / 20.0, 0.0), 1.0);
      v21 = [(PKPaymentSetupOptionsViewController *)self navigationItem];
      [v21 _setManualScrollEdgeAppearanceProgress:v20];

      double v22 = *(double *)&v30;
      int v23 = *(double *)&v30 <= v19;
      v28.receiver = self;
      v28.super_class = (Class)PKPaymentSetupOptionsViewController;
      double v24 = [(PKPaymentSetupOptionsViewController *)&v28 title];
      int v25 = v24 != 0;

      if (v23 != v25)
      {
        if (v22 > v19) {
          titleText = 0;
        }
        else {
          titleText = self->_titleText;
        }
        v27.receiver = self;
        v27.super_class = (Class)PKPaymentSetupOptionsViewController;
        [(PKPaymentSetupOptionsViewController *)&v27 setTitle:titleText];
      }
    }
  }
  id v5 = [(PKPaymentSetupOptionsViewController *)self view];
  [v5 setNeedsLayout];
}

- (void)searchTextDidChangeTo:(id)a3
{
  id v8 = [(PKDynamicCollectionViewController *)self collectionView];
  [v8 contentInset];
  double v5 = -v4;
  double v6 = [(PKPaymentSetupOptionsViewController *)self view];
  [v6 safeAreaInsets];
  objc_msgSend(v8, "setContentOffset:animated:", 1, 0.0, v5 - v7);
}

- (void)searchBarTextDidBeginEditing
{
  [(PKPaymentSetupOptionsViewController *)self setIsShowingKeyboard:1];
  id v7 = [(PKDynamicCollectionViewController *)self collectionView];
  [v7 contentInset];
  double v4 = -v3;
  double v5 = [(PKPaymentSetupOptionsViewController *)self view];
  [v5 safeAreaInsets];
  objc_msgSend(v7, "setContentOffset:animated:", 1, 0.0, v4 - v6);
}

- (void)searchBarTextDidEndEditing
{
  double v3 = [(PKPaymentSetupOptionsViewController *)self view];
  int v4 = [v3 isUserInteractionEnabled];

  if (v4)
  {
    [(PKPaymentSetupOptionsViewController *)self setIsShowingKeyboard:0];
    id v9 = [(PKDynamicCollectionViewController *)self collectionView];
    [v9 contentInset];
    double v6 = -v5;
    id v7 = [(PKPaymentSetupOptionsViewController *)self view];
    [v7 safeAreaInsets];
    objc_msgSend(v9, "setContentOffset:animated:", 1, 0.0, v6 - v8);
  }
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

- (void)_keyboardSizeDidChange:(id)a3
{
  id v10 = [a3 userInfo];
  id v4 = [v10 valueForKey:*MEMORY[0x1E4FB2BD8]];
  [v4 CGRectValue];
  self->_keyboardFrame.origin.x = v5;
  self->_keyboardFrame.origin.y = v6;
  self->_keyboardFrame.size.width = v7;
  self->_keyboardFrame.size.CGFloat height = v8;
  id v9 = [(PKPaymentSetupOptionsViewController *)self view];
  [v9 layoutIfNeeded];
}

- (void)_addDockViewToCollectionViewIfNeeded
{
  privacyLink = self->_privacyLink;
  if (privacyLink)
  {
    id v4 = privacyLink;
  }
  else
  {
    uint64_t v5 = [(PKPaymentSetupDockView *)self->_dockView privacyLink];
    if (!v5) {
      return;
    }
    id v4 = (OBPrivacyLinkController *)v5;
  }
  [(PKPaymentSetupDockView *)self->_dockView setPrivacyLink:v4];
  CGFloat v6 = [(PKPaymentSetupOptionsViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  -[PKPaymentSetupDockView sizeThatFits:](self->_dockView, "sizeThatFits:", v8, 1.79769313e308);
  privacyLinkSectionController = self->_privacyLinkSectionController;
  if (v12 <= v10 * 0.5)
  {
    self->_privacyLinkSectionController = 0;

    if (privacyLinkSectionController)
    {
      double v15 = [(PKDynamicCollectionViewController *)self sections];
      double v16 = objc_msgSend(v15, "pk_objectsPassingTest:", &__block_literal_global_33);

      [(PKPaymentSetupOptionsViewController *)self setSections:v16 animated:1];
    }
  }
  else
  {
    if (privacyLinkSectionController)
    {
      [(PKPaymentSetupDockView *)self->_dockView setPrivacyLink:0];
      [(PKPaymentSetupPrivacyLinkSectionController *)self->_privacyLinkSectionController setPrivacyLink:v4];
      double v13 = [(PKPaymentSetupListSectionController *)self->_privacyLinkSectionController identifiers];
      double v14 = [v13 firstObject];
      [(PKDynamicCollectionViewController *)self reloadDataForSectionIdentifier:v14 animated:1];
    }
    else
    {
      double v17 = objc_alloc_init(PKPaymentSetupPrivacyLinkSectionController);
      double v18 = self->_privacyLinkSectionController;
      self->_privacyLinkSectionController = v17;

      [(PKPaymentSetupDockView *)self->_dockView setPrivacyLink:0];
      [(PKPaymentSetupPrivacyLinkSectionController *)self->_privacyLinkSectionController setPrivacyLink:v4];
      double v13 = [(PKDynamicCollectionViewController *)self sections];
      double v14 = [v13 arrayByAddingObject:self->_privacyLinkSectionController];
      v22.receiver = self;
      v22.super_class = (Class)PKPaymentSetupOptionsViewController;
      [(PKDynamicCollectionViewController *)&v22 setSections:v14 animated:1];
    }
  }
  double v19 = self->_privacyLink;
  self->_privacyLink = v4;
  double v20 = v4;

  v21 = [(PKDynamicCollectionViewController *)self collectionView];
  [(PKPaymentSetupOptionsViewController *)self scrollViewDidScroll:v21];
}

BOOL __75__PKPaymentSetupOptionsViewController__addDockViewToCollectionViewIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)_updateNavigationItem
{
  double v3 = [(PKPaymentSetupOptionsViewController *)self viewIfLoaded];

  if (v3)
  {
    id v4 = [(PKPaymentSetupOptionsViewController *)self navigationController];
    if (v4)
    {
      unint64_t headerMode = self->_headerMode;
      id v10 = v4;
      CGFloat v6 = [v4 navigationBar];
      double v7 = v6;
      if (headerMode == 2)
      {
        uint64_t v8 = 1;
        if (([v6 prefersLargeTitles] & 1) == 0) {
          [v7 setPrefersLargeTitles:1];
        }
      }
      else
      {
        uint64_t v8 = 2;
      }
      double v9 = [(PKPaymentSetupOptionsViewController *)self navigationItem];
      if ([v9 largeTitleDisplayMode] != v8) {
        [v9 setLargeTitleDisplayMode:v8];
      }

      id v4 = v10;
    }
  }
}

- (unint64_t)headerMode
{
  return self->_headerMode;
}

- (PKCollapsibleHeaderView)headerView
{
  return self->_headerView;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (UIColor)headerBackgroundColor
{
  return self->_headerBackgroundColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (OBPrivacyLinkController)privacyLink
{
  return self->_privacyLink;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  self->_allowsManualEntry = a3;
}

- (int64_t)paymentSetupMode
{
  return self->_paymentSetupMode;
}

- (void)setPaymentSetupMode:(int64_t)a3
{
  self->_paymentSetupMode = a3;
}

- (BOOL)isShowingKeyboard
{
  return self->_isShowingKeyboard;
}

- (BOOL)shouldCollapseHeaderOnKeyboardShow
{
  return self->_shouldCollapseHeaderOnKeyboardShow;
}

- (void)setShouldCollapseHeaderOnKeyboardShow:(BOOL)a3
{
  self->_shouldCollapseHeaderOnKeyboardShow = a3;
}

- (BOOL)showSearchBar
{
  return self->_showSearchBar;
}

- (BOOL)showHeaderSpinner
{
  return self->_showHeaderSpinner;
}

- (BOOL)showNavigationBarSpinner
{
  return self->_showNavigationBarSpinner;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_headerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_privacyLinkSectionController, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinningNavBarItem, 0);

  objc_storeStrong((id *)&self->_noResultsView, 0);
}

@end